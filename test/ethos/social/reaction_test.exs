defmodule Ethos.Social.ReactionTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures

  alias Ethos.Repo
  alias Ethos.Social.Reaction

  defp valid_attrs(user) do
    %{user_id: user.id, subject_type: "place", subject_id: 1, value: "up"}
  end

  test "accepts a well-formed reaction" do
    user = user_fixture()
    assert {:ok, _} = %Reaction{} |> Reaction.changeset(valid_attrs(user)) |> Repo.insert()
  end

  test "rejects an unknown subject type" do
    user = user_fixture()
    attrs = %{valid_attrs(user) | subject_type: "entry"}
    changeset = Reaction.changeset(%Reaction{}, attrs)

    assert %{subject_type: ["is invalid"]} = errors_on(changeset)
  end

  test "rejects an unknown value" do
    user = user_fixture()
    attrs = %{valid_attrs(user) | value: "sideways"}
    changeset = Reaction.changeset(%Reaction{}, attrs)

    assert %{value: ["is invalid"]} = errors_on(changeset)
  end

  test "requires every field" do
    changeset = Reaction.changeset(%Reaction{}, %{})
    errors = errors_on(changeset)

    for field <- [:user_id, :subject_type, :subject_id, :value] do
      assert Map.has_key?(errors, field), "expected #{field} to be required"
    end
  end

  test "the database rejects a second reaction on the same subject" do
    user = user_fixture()
    {:ok, _} = %Reaction{} |> Reaction.changeset(valid_attrs(user)) |> Repo.insert()

    assert {:error, changeset} =
             %Reaction{}
             |> Reaction.changeset(%{valid_attrs(user) | value: "down"})
             |> Repo.insert()

    assert %{user_id: ["has already reacted to this"]} = errors_on(changeset)
  end

  test "the check constraint holds even when the changeset is bypassed" do
    user = user_fixture()

    assert_raise Postgrex.Error, fn ->
      Repo.insert_all("reactions", [
        %{
          user_id: user.id,
          subject_type: "place",
          subject_id: 1,
          value: "sideways",
          inserted_at: DateTime.utc_now() |> DateTime.truncate(:second),
          updated_at: DateTime.utc_now() |> DateTime.truncate(:second)
        }
      ])
    end
  end
end
