defmodule EthosWeb.HouseAdTest do
  use ExUnit.Case, async: true

  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  alias EthosWeb.Affiliate

  # The two registry entries this component has to tell apart, in the shape
  # `locale_from_assigns/1` actually reads: a guide carrying :state_slug and
  # :county. Italy is `placement: :top` in config/config.exs; New York carries
  # no :placement key at all and so takes the :bottom default.
  @rome %{state_slug: "italy", county: "Rome"}
  @manhattan %{state_slug: "new-york", county: "Manhattan"}
  # Nothing in the registry matches Washington — the common case.
  @puget %{state_slug: "washington", county: "Puget Sound"}

  test "renders the ad, its link and its photo credit" do
    assigns = %{}
    html = rendered_to_string(~H"<EthosWeb.HouseAd.house_ad page={%{}} />")

    assert html =~ "Connecticut Foliage Forecast"
    assert html =~ "169 towns, seven state driving routes"
    assert html =~ ~s(href="/foliage")
    assert html =~ "chester-main-street_thumb.jpg"

    # The credit is not decoration. The photo is CC BY-SA 4.0, which requires
    # attribution, and it is the same photo Chester's own guide publishes with
    # the same fields — so the licence is satisfied here for the same reason it
    # is satisfied there, rather than by a line retyped by hand.
    assert html =~ "Main Street, Chester"
    assert html =~ "John Phelan"
    assert html =~ "CC BY-SA 4.0"
    assert html =~ "commons.wikimedia.org"
  end

  test "renders nothing when the page opts out" do
    # The foliage pages set this: a card inviting a reader to the page they are
    # already on is dead weight.
    assigns = %{}
    assert rendered_to_string(~H"<EthosWeb.HouseAd.house_ad page={%{house_ad: false}} />") == ""
  end

  test "renders when the assign is absent or true, so opting out has to be deliberate" do
    assigns = %{}
    refute rendered_to_string(~H"<EthosWeb.HouseAd.house_ad page={%{}} />") == ""
    refute rendered_to_string(~H"<EthosWeb.HouseAd.house_ad page={%{house_ad: true}} />") == ""
  end

  test "yields the slot to a top-placed affiliate unit" do
    # Rome carries a paid GetYourGuide unit in this same slot, reserving 400px.
    # Two stacked ad blocks above the h1 is a lot of page before any content,
    # and the paid one wins.
    assert Affiliate.top_unit_renders?(%{guide: @rome}),
           "vacuous unless Italy really is placement: :top in the registry"

    assigns = %{rome: @rome}
    assert rendered_to_string(~H"<EthosWeb.HouseAd.house_ad page={%{guide: @rome}} />") == ""
  end

  test "renders where an affiliate unit exists but sits at the bottom" do
    # The yield is to the TOP slot specifically. New York's unit renders below
    # the content, which leaves this slot free — suppressing the house ad there
    # would cost a placement for no reason.
    assert Affiliate.unit_renders?(%{guide: @manhattan}),
           "vacuous unless New York really does render a unit"

    refute Affiliate.top_unit_renders?(%{guide: @manhattan}),
           "vacuous unless New York's unit really is placed :bottom"

    assigns = %{manhattan: @manhattan}
    refute rendered_to_string(~H"<EthosWeb.HouseAd.house_ad page={%{guide: @manhattan}} />") == ""
  end

  test "renders on a page with no affiliate locale at all" do
    refute Affiliate.top_unit_renders?(%{guide: @puget})

    assigns = %{puget: @puget}
    refute rendered_to_string(~H"<EthosWeb.HouseAd.house_ad page={%{guide: @puget}} />") == ""
  end
end
