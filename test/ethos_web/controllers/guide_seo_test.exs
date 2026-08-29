defmodule EthosWeb.GuideSeoTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  @gyg "https://www.getyourguide.com/rome-l33/rome-colosseum-gladiator-floor-access-roman-forum-tour-t633431/?partner_id=ZA4AIMF&currency=USD&travel_agent=1&cmp=share_to_earn"

  defp seo_guide do
    guide = published_guide_fixture(%{title: "Three Days", destination: "Rome, Italy"})

    {:ok, guide} =
      Guides.update_guide_seo(guide, %{
        intro: "Three **real** days in Rome, from the arena floor to Monti.",
        sections: [%{"heading" => "Getting around", "body" => "Walk everywhere."}],
        faq: [%{"question" => "Worth it?", "answer" => "Yes."}]
      })

    {:ok, _} =
      Guides.create_entry(guide, %{
        kind: "tour",
        name: "Colosseum arena floor",
        verdict: "loved",
        booking_url: @gyg,
        booking_label: "Book the arena-floor tour"
      })

    guide
  end

  test "renders intro, sections, faq, CTA with sponsored rel, and disclosure", %{conn: conn} do
    guide = seo_guide()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ "<strong>real</strong>"
    assert html =~ "Getting around"
    assert html =~ "Worth it?"
    assert html =~ "Book the arena-floor tour"
    assert html =~ ~s(rel="sponsored nofollow noopener")
    assert html =~ "partner_id=ZA4AIMF"
    assert html =~ "earn Ethos a commission"
  end

  test "GetYourGuide house ad and disclosure render on every guide page", %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ "Planning your own trip?"
    assert html =~ "https://www.getyourguide.com/?partner_id=ZA4AIMF&amp;cmp=share_to_earn"
    assert html =~ "Explore tours"
    # the house ad is an earning link, so the disclosure now always shows
    assert html =~ "earn Ethos a commission"
  end

  test "emits Article, FAQPage, BreadcrumbList JSON-LD, canonical, meta description", %{
    conn: conn
  } do
    guide = seo_guide()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ ~s("@type":"Article")
    assert html =~ ~s("@type":"FAQPage")
    assert html =~ ~s("@type":"BreadcrumbList")
    assert html =~ ~s(<link rel="canonical" href="#{url(~p"/g/#{guide.slug}")}")
    assert html =~ ~s(name="description")
  end

  test "no FAQPage block when faq empty", %{conn: conn} do
    guide = published_guide_fixture()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)
    refute html =~ ~s("@type":"FAQPage")
  end

  # `guide_fixture/1` cannot set `og_image_path` — it is cast in
  # `seo_changeset/2`, not the create changeset — and the controller pipes every
  # guide through `ensure_og_image/1`, which regenerates the card when the file
  # named in the DB is missing. So the only honest way to give a guide an image
  # is to generate one and let the file exist.
  defp guide_with_og_card do
    guide = published_guide_fixture(%{title: "Three Days", destination: "Rome, Italy"})
    {:ok, guide} = Ethos.OGCard.generate(guide)

    on_exit(fn ->
      File.rm(Path.join(:code.priv_dir(:ethos) |> to_string(), guide.og_image_path))
    end)

    guide
  end

  describe "the Article node's image and publisher" do
    test "Article carries an absolute image URL when the guide has a card", %{conn: conn} do
      guide = guide_with_og_card()

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)
      article = json_ld_of_type(html, "Article")

      assert article["image"] == url(~p"/") <> "uploads/og/#{guide.slug}.png"
      assert article["image"] =~ ~r{^https?://}
    end

    test "Article omits image entirely when the guide has no card", %{conn: conn} do
      guide = published_guide_fixture()
      assert is_nil(guide.og_image_path)

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      refute Map.has_key?(json_ld_of_type(html, "Article"), "image")
    end

    # `ensure_og_image/1` does not leave a stale path alone: it regenerates the
    # card and returns the guide with the *new* path. The Article must publish
    # the file that now exists, not the one the DB used to name.
    test "a guide whose card went missing publishes the regenerated one", %{conn: conn} do
      guide = published_guide_fixture()
      {:ok, guide} = Guides.update_guide_og_path(guide, "og/gone.png")

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      regenerated =
        Path.join(:code.priv_dir(:ethos) |> to_string(), "uploads/og/#{guide.slug}.png")

      on_exit(fn -> File.rm(regenerated) end)
      assert File.exists?(regenerated)

      article = json_ld_of_type(html, "Article")
      assert article["image"] == url(~p"/") <> "uploads/og/#{guide.slug}.png"
      refute article["image"] =~ "gone.png"
    end

    test "publisher is the shared Organization node, nested without its own @context", %{
      conn: conn
    } do
      guide = published_guide_fixture()
      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      publisher = json_ld_of_type(html, "Article")["publisher"]

      assert publisher["@type"] == "Organization"
      assert publisher["name"] == "Ethos"
      assert publisher["url"] == url(~p"/")
      assert publisher["logo"] =~ "/images/logo.svg"
      # nested nodes inherit the document's context; a second one is noise
      refute Map.has_key?(publisher, "@context")
      assert publisher == EthosWeb.StructuredData.publisher()
    end

    # `~p` percent-encodes an interpolated segment, so the og:image tag once
    # published `/uploads%2Fog%2F<slug>.png` — a path `Plug.Static` at
    # `/uploads` does not match — while the Article named the same file
    # correctly beside it. Both properties must name one fetchable file.
    test "og:image names the same un-encoded, fetchable file the Article does", %{conn: conn} do
      guide = guide_with_og_card()

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert [og_image] =
               Regex.run(~r{<meta property="og:image" content="([^"]+)"}, html,
                 capture: :all_but_first
               )

      assert og_image == url(~p"/") <> "uploads/og/#{guide.slug}.png"
      refute og_image =~ "%2F"
      assert og_image == json_ld_of_type(html, "Article")["image"]

      # the tag is only worth emitting if it resolves
      assert conn |> get(URI.parse(og_image).path) |> response(200)
    end

    test "a guide with a card advertises a large-image Twitter card", %{conn: conn} do
      guide = guide_with_og_card()

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ ~s(<meta name="twitter:card" content="summary_large_image")
    end

    test "a guide with no card advertises a summary Twitter card", %{conn: conn} do
      guide = published_guide_fixture()

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ ~s(<meta name="twitter:card" content="summary")
      refute html =~ "summary_large_image"
      refute html =~ ~s(property="og:image")
    end
  end

  test "escapes </script> in JSON-LD so it cannot break out of the script tag", %{conn: conn} do
    guide =
      published_guide_fixture(%{
        title: "Rome</script><script>window.xss=1</script>",
        destination: "Rome, Italy"
      })

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "</script><script>window.xss=1</script>"
    assert html =~ ~s("@type":"Article")
  end
end
