defmodule Ethos.GuidesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.AccountsFixtures

  describe "create_guide/2" do
    test "creates a draft guide with a unique slug from the title" do
      user = user_fixture()

      {:ok, guide} =
        Guides.create_guide(user, %{title: "Lisbon in 5 days", destination: "Lisbon, Portugal"})

      assert guide.status == "draft"
      assert guide.user_id == user.id
      assert guide.slug =~ ~r/^lisbon-in-5-days-[a-z0-9]{6}$/
      assert guide.view_count == 0
    end

    test "requires title and destination" do
      user = user_fixture()
      {:error, changeset} = Guides.create_guide(user, %{})
      assert %{title: _, destination: _} = errors_on(changeset)
    end
  end

  describe "publish_guide/1" do
    test "marks the guide published" do
      user = user_fixture()
      {:ok, guide} = Guides.create_guide(user, %{title: "Tokyo", destination: "Tokyo, Japan"})
      {:ok, published} = Guides.publish_guide(guide)
      assert published.status == "published"
      assert Guides.get_published_guide_by_slug!(guide.slug).id == guide.id
    end
  end

  describe "increment_view_count/1" do
    test "bumps view_count" do
      user = user_fixture()
      {:ok, guide} = Guides.create_guide(user, %{title: "Rome", destination: "Rome, Italy"})
      Guides.increment_view_count(guide)
      assert Guides.get_guide!(guide.id).view_count == 1
    end
  end
end
