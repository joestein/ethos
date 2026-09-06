defmodule EthosWeb.PostHogMetaTest do
  use EthosWeb.ConnCase, async: false

  @key "phc_test_key_not_a_real_project"

  setup do
    original = Application.get_env(:ethos, :posthog_public_key)
    on_exit(fn -> Application.put_env(:ethos, :posthog_public_key, original) end)
    :ok
  end

  test "renders nothing when no key is configured", %{conn: conn} do
    # THE DEFAULT, and the assertion that matters most: dev and test set no
    # key, and this is what stops the suite firing events into a real project.
    Application.put_env(:ethos, :posthog_public_key, nil)

    html = conn |> get(~p"/") |> html_response(200)

    refute html =~ "posthog-key"
  end

  test "renders the key when configured", %{conn: conn} do
    Application.put_env(:ethos, :posthog_public_key, @key)

    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ ~s(name="posthog-key")
    assert html =~ @key
  end

  test "is absent from the embeddable iframe", %{conn: conn} do
    # /foliage/embed calls put_root_layout(false) and runs inside other
    # people's sites. Tracking visitors there is a different act from tracking
    # them here, and it reaches this outcome by a different mechanism from
    # every other page: no layout at all, rather than no key.
    Application.put_env(:ethos, :posthog_public_key, @key)

    html = conn |> get(~p"/foliage/embed") |> html_response(200)

    refute html =~ "posthog-key"
  end
end
