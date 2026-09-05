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

  describe "list_published_guides_for_node/1" do
    setup do
      Ethos.SeedDataHelpers.seed_destination_paths!([
        "united-states/connecticut/litchfield-county",
        "united-states/connecticut/new-haven-county"
      ])

      %{
        litchfield: Ethos.Destinations.get_by_path("united-states/connecticut/litchfield-county"),
        new_haven: Ethos.Destinations.get_by_path("united-states/connecticut/new-haven-county")
      }
    end

    defp guide_on(node, title, attrs \\ %{}) do
      user = user_fixture()

      {:ok, guide} =
        Guides.create_guide(
          user,
          Map.merge(%{title: title, destination: title, destination_id: node.id}, attrs)
        )

      guide
    end

    test "returns only that node's published guides", %{litchfield: lf, new_haven: nh} do
      {:ok, mine} = guide_on(lf, "Woodbury") |> Guides.publish_guide()
      draft = guide_on(lf, "Bethlehem")
      {:ok, sibling} = guide_on(nh, "Waterbury") |> Guides.publish_guide()

      ids = Guides.list_published_guides_for_node(lf.id) |> Enum.map(& &1.id)

      assert ids == [mine.id]
      refute draft.id in ids
      refute sibling.id in ids
    end

    # A node's descendants each get their own hub, so a county hub does not roll
    # up the towns beneath it. Recorded here because "list guides for a node"
    # reads like it might.
    test "does not roll up a child node's guides", %{litchfield: lf} do
      Ethos.SeedDataHelpers.seed_destination_paths!([
        "united-states/connecticut/litchfield-county/kent"
      ])

      kent = Ethos.Destinations.get_by_path("united-states/connecticut/litchfield-county/kent")
      {:ok, _} = guide_on(kent, "Kent") |> Guides.publish_guide()

      assert Guides.list_published_guides_for_node(lf.id) == []
    end

    test "orders by view count, then by id descending", %{litchfield: lf} do
      {:ok, quiet} = guide_on(lf, "Quiet") |> Guides.publish_guide()
      {:ok, popular} = guide_on(lf, "Popular") |> Guides.publish_guide()

      Guides.increment_view_count(popular)

      assert Guides.list_published_guides_for_node(lf.id) |> Enum.map(& &1.id) ==
               [popular.id, quiet.id]
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
