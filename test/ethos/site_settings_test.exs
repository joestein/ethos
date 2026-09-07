defmodule Ethos.SiteSettingsTest do
  use Ethos.DataCase, async: true

  alias Ethos.SiteSettings

  test "with no override, the season follows the date" do
    assert SiteSettings.season_override() == nil
    assert SiteSettings.active_season(~D[2026-09-06]) == :summer
    assert SiteSettings.active_season(~D[2026-09-22]) == :autumn
  end

  test "an override wins over the date" do
    {:ok, _} = SiteSettings.put_season_override(:winter)

    assert SiteSettings.season_override() == :winter
    assert SiteSettings.active_season(~D[2026-09-06]) == :winter
    assert SiteSettings.active_season(~D[2026-06-15]) == :winter
  end

  test "clearing the override returns to the date" do
    {:ok, _} = SiteSettings.put_season_override(:winter)
    {:ok, _} = SiteSettings.put_season_override(nil)

    assert SiteSettings.season_override() == nil
    assert SiteSettings.active_season(~D[2026-09-06]) == :summer
  end

  test "setting the override twice updates rather than duplicating" do
    {:ok, _} = SiteSettings.put_season_override(:winter)
    {:ok, _} = SiteSettings.put_season_override(:spring)

    assert SiteSettings.season_override() == :spring
    assert Ethos.Repo.aggregate(Ethos.SiteSettings.SiteSetting, :count) == 1
  end

  test "a value that is not a season is refused" do
    assert {:error, _} = SiteSettings.put_season_override(:monsoon)
    assert SiteSettings.season_override() == nil
  end

  test "a junk value already in the table degrades to the date" do
    # Defence in depth: the column is text, and a bad row must not take the
    # whole site down with a match error on every request.
    Ethos.Repo.insert!(%Ethos.SiteSettings.SiteSetting{
      key: "season_override",
      value: "not-a-season"
    })

    assert SiteSettings.season_override() == nil
    assert SiteSettings.active_season(~D[2026-09-06]) == :summer
  end
end
