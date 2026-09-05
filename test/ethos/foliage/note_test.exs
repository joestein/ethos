defmodule Ethos.Foliage.NoteTest do
  use Ethos.DataCase, async: true

  alias Ethos.Foliage.Note

  describe "changeset/2" do
    test "requires scope, published_on and body" do
      changeset = Note.changeset(%Note{}, %{})
      assert %{scope: _, published_on: _, body: _} = errors_on(changeset)
    end

    test "rejects an unknown scope" do
      changeset =
        Note.changeset(%Note{}, %{scope: "galaxy", published_on: ~D[2026-10-09], body: "x"})

      assert "is invalid" in errors_on(changeset).scope
    end

    test "requires a ref for route scope" do
      changeset =
        Note.changeset(%Note{}, %{scope: "route", published_on: ~D[2026-10-09], body: "x"})

      assert errors_on(changeset).ref
    end

    test "forbids a ref for statewide scope" do
      changeset =
        Note.changeset(%Note{}, %{
          scope: "statewide",
          ref: "hartford-west",
          published_on: ~D[2026-10-09],
          body: "x"
        })

      assert errors_on(changeset).ref
    end

    test "rejects a ref that is not a known route" do
      changeset =
        Note.changeset(%Note{}, %{
          scope: "route",
          ref: "not-a-route",
          published_on: ~D[2026-10-09],
          body: "x"
        })

      assert errors_on(changeset).ref
    end
  end

  describe "latest/2" do
    test "returns nil when nothing is published" do
      assert Note.latest("statewide") == nil
    end

    test "returns the most recent note for the scope" do
      {:ok, _} =
        Note.create(%{
          scope: "statewide",
          published_on: ~D[2026-10-02],
          body: "The older note, published a week earlier."
        })

      {:ok, _} =
        Note.create(%{
          scope: "statewide",
          published_on: ~D[2026-10-09],
          body: "The newer note, published most recently."
        })

      assert %{body: "The newer note, published most recently."} = Note.latest("statewide")
    end

    test "scopes by ref" do
      {:ok, _} =
        Note.create(%{
          scope: "route",
          ref: "hartford-west",
          published_on: ~D[2026-10-09],
          body: "The Hartford West stretch, a route-scoped note."
        })

      assert %{body: "The Hartford West stretch, a route-scoped note."} =
               Note.latest("route", "hartford-west")

      assert Note.latest("route", "yankee-roots") == nil
    end
  end
end
