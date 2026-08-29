# Structured Data Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the site's schema.org output correct and complete for the data already in the repository — fixing the `streetAddress` bug, giving the home page metadata it currently lacks entirely, and absorbing six duplicated breadcrumb builders into one module.

**Architecture:** A shared `EthosWeb.StructuredData` module replaces per-controller JSON-LD construction. A pure `Ethos.Places.Address` module decomposes the single `address` string into `PostalAddress` fields. Everything else is properties added to existing maps from data already loaded in the controllers.

**Tech Stack:** Phoenix 1.7.14 (dead controller views, `~p` sigil, `current_user` — **not** 1.8 scopes, not LiveView), Ecto/Postgres, ExUnit.

**Spec:** `docs/superpowers/specs/2026-08-29-structured-data-design.md`

## Global Constraints

- **Zero AI calls and zero external API calls in shipped code.** Nothing in this plan needs the network; if a step seems to, stop and report.
- **`cryptcom@gmail.com` is the only admin user.** No auth code is touched here.
- **Phoenix 1.7.14 conventions.** Dead views, `~p` sigil, `current_user`. Not 1.8 scopes.
- **No seed content, photo, manifest or intro text is edited by this plan.** Content is closed.
- **The Task 1 refactor must produce byte-identical JSON-LD.** It is a pure refactor. Any output change is a defect, not an improvement.
- `mix format` on every file touched; `mix format --check-formatted` must pass repo-wide.
- Work happens in the worktree `/Users/charmalloc/dev/ethos/.claude/worktrees/connecticut-expansion`. Never `cd` to `~/dev/ethos`. **Never use bare `git stash`** — the stack is shared with other live sessions; use `git show <ref>:<path>`.
- Baseline: **379 tests, 0 failures.** Never go down.

---

### Task 1: `EthosWeb.StructuredData` and the breadcrumb refactor

**Files:**
- Create: `lib/ethos_web/components/structured_data.ex`
- Modify: `lib/ethos_web/controllers/place_controller.ex:102-137`
- Modify: `lib/ethos_web/controllers/guide_controller.ex:86-111`, `:172-208`
- Modify: `lib/ethos_web/controllers/destination_controller.ex:163-248`
- Modify: `lib/ethos_web/controllers/collection_controller.ex:24-61`
- Modify: `test/support/conn_case.ex:39-50`
- Test: `test/ethos_web/components/structured_data_test.exs`
- Test: `test/ethos_web/controllers/json_ld_parity_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces:
  - `EthosWeb.StructuredData.breadcrumb(crumbs)` where `crumbs :: [%{name: String.t(), url: String.t()}]` → a `BreadcrumbList` map with `position` derived by `Enum.with_index(trail, 1)`.
  - `EthosWeb.StructuredData.collection_page(name, url, opts)` where `opts` may carry `:description` and `:has_part`.
  - `EthosWeb.StructuredData.absolute_url(src)` → `url(~p"/") <> String.trim_leading(src, "/")`.
  - `EthosWeb.StructuredData.maybe_put(map, key, value)` → unchanged map when `value` is nil.
  - `EthosWeb.ConnCase.json_ld_blocks(html)` → all decoded blocks; `json_ld_of_type(html, type)` → first block whose `"@type"` matches.

**The point of this task:** `guide_controller.ex:86-111` already builds its breadcrumb the right way — it derives a trail from a shared source and uses `Enum.with_index(trail, 1)`. The other five builders hardcode literal `position` integers. **Generalise the one that is already right; do not invent a new shape.**

- [ ] **Step 1: Write the parity test first — it is the whole safety net**

This test must be written and passing *against the current unrefactored code* before anything is refactored. It captures today's JSON-LD as the reference.

```elixir
defmodule EthosWeb.JsonLdParityTest do
  use EthosWeb.ConnCase, async: true

  # Every page type that emits a BreadcrumbList. The refactor in Task 1 is a
  # pure refactor: these blocks must be byte-identical before and after.
  test "breadcrumb JSON-LD is stable across every page type", %{conn: conn} do
    for path <- parity_paths() do
      html = conn |> get(path) |> html_response(200)
      crumb = json_ld_of_type(html, "BreadcrumbList")

      assert crumb, "no BreadcrumbList on #{path}"

      positions = Enum.map(crumb["itemListElement"], & &1["position"])
      assert positions == Enum.to_list(1..length(positions)),
             "positions on #{path} are not 1..n: #{inspect(positions)}"

      for item <- crumb["itemListElement"] do
        assert item["@type"] == "ListItem"
        assert is_binary(item["name"]) and item["name"] != ""
        assert is_binary(item["item"]) and String.starts_with?(item["item"], "http")
      end
    end
  end
end
```

`parity_paths/0` must build real fixtures and return the path for **every** page type: a place, a guide, a town-page-tier guide, a guide photos page, the destinations index, a state destination, a county destination, a town destination, and a collection. Read each controller's tests for how to build the fixture it needs.

- [ ] **Step 2: Run it against unrefactored code**

Run: `mix test test/ethos_web/controllers/json_ld_parity_test.exs`
Expected: PASS. If it fails, you have found a pre-existing bug — report it before refactoring.

- [ ] **Step 3: Generalise the ConnCase helper**

Replace `breadcrumb_json_ld/1` at `test/support/conn_case.ex:39-50`. Keep `breadcrumb_json_ld/1` delegating to the new function so existing tests keep passing unchanged.

```elixir
def json_ld_blocks(html) do
  ~r{<script type="application/ld\+json">(.*?)</script>}s
  |> Regex.scan(html, capture: :all_but_first)
  |> Enum.map(fn [json] -> Jason.decode!(json) end)
end

def json_ld_of_type(html, type) do
  html |> json_ld_blocks() |> Enum.find(&(&1["@type"] == type))
end

def breadcrumb_json_ld(html), do: json_ld_of_type(html, "BreadcrumbList")
```

- [ ] **Step 4: Write the StructuredData module test**

```elixir
defmodule EthosWeb.StructuredDataTest do
  use ExUnit.Case, async: true
  alias EthosWeb.StructuredData

  test "breadcrumb/1 derives positions from list order" do
    ld =
      StructuredData.breadcrumb([
        %{name: "Ethos", url: "https://example.com/"},
        %{name: "Destinations", url: "https://example.com/destinations"}
      ])

    assert ld["@type"] == "BreadcrumbList"
    assert Enum.map(ld["itemListElement"], & &1["position"]) == [1, 2]
    assert Enum.map(ld["itemListElement"], & &1["name"]) == ["Ethos", "Destinations"]
  end

  test "breadcrumb/1 on an empty trail produces an empty list, not a crash" do
    assert StructuredData.breadcrumb([])["itemListElement"] == []
  end

  test "maybe_put/3 drops nil and keeps false" do
    assert StructuredData.maybe_put(%{}, "k", nil) == %{}
    assert StructuredData.maybe_put(%{}, "k", false) == %{"k" => false}
  end

  test "collection_page/3 omits description when absent" do
    refute Map.has_key?(StructuredData.collection_page("N", "u", []), "description")
    assert StructuredData.collection_page("N", "u", description: "d")["description"] == "d"
  end
end
```

- [ ] **Step 5: Run it, watch it fail**

Run: `mix test test/ethos_web/components/structured_data_test.exs`
Expected: FAIL — `EthosWeb.StructuredData` is not defined.

- [ ] **Step 6: Write the module**

```elixir
defmodule EthosWeb.StructuredData do
  @moduledoc """
  Builders for the schema.org JSON-LD the site emits.

  Before this module every controller hand-built its own maps, and five of the
  six breadcrumb builders wrote literal `position` integers — which is how a
  hardcoded `position => 5` survived in the photos breadcrumb until the
  destination-pages work found it. Positions are derived here and nowhere else.
  """

  use Phoenix.VerifiedRoutes, endpoint: EthosWeb.Endpoint, router: EthosWeb.Router

  @context "https://schema.org"

  @doc "A BreadcrumbList from an ordered trail of `%{name:, url:}`."
  def breadcrumb(crumbs) when is_list(crumbs) do
    %{
      "@context" => @context,
      "@type" => "BreadcrumbList",
      "itemListElement" =>
        crumbs
        |> Enum.with_index(1)
        |> Enum.map(fn {crumb, position} ->
          %{
            "@type" => "ListItem",
            "position" => position,
            "name" => crumb.name,
            "item" => crumb.url
          }
        end)
    }
  end

  @doc "The two crumbs every trail on the site starts with."
  def root_crumbs do
    [
      %{name: "Ethos", url: url(~p"/")},
      %{name: "Destinations", url: url(~p"/destinations")}
    ]
  end

  def collection_page(name, page_url, opts \\ []) do
    %{"@context" => @context, "@type" => "CollectionPage", "name" => name, "url" => page_url}
    |> maybe_put("description", opts[:description])
    |> maybe_put("hasPart", opts[:has_part])
  end

  @doc "Absolutises a stored photo `src` such as `/photos/foo/bar.jpg`."
  def absolute_url(nil), do: nil
  def absolute_url(src), do: url(~p"/") <> String.trim_leading(src, "/")

  def maybe_put(map, _key, nil), do: map
  def maybe_put(map, key, value), do: Map.put(map, key, value)
end
```

- [ ] **Step 7: Run it, watch it pass**

Run: `mix test test/ethos_web/components/structured_data_test.exs`
Expected: PASS.

- [ ] **Step 8: Rewrite all six breadcrumb builders to call it**

Each controller's `breadcrumb_ld` becomes a trail plus one call. `place_controller.ex:105-137` collapses to:

```elixir
defp breadcrumb_ld(place) do
  StructuredData.breadcrumb(
    StructuredData.root_crumbs() ++
      [
        %{name: place.state, url: url(~p"/destinations/#{place.state_slug}")},
        %{
          name: place.county,
          url: url(~p"/destinations/#{place.state_slug}/#{place.county_slug}")
        },
        %{name: place.name, url: url(~p"/p/#{place.slug}")}
      ]
  )
end
```

Do the same for the four in `destination_controller.ex`, the one in `collection_controller.ex`, and both in `guide_controller.ex` — the guide one already has the trail shape, so it only loses its inline `with_index` block. Replace `place_controller.ex`'s private `maybe_put/2` and every copy of the photo-absolutisation expression with the module's versions. Replace both `collection_ld` copies with `collection_page/3`.

- [ ] **Step 9: Run the parity test and the full suite**

Run: `mix test`
Expected: PASS, no fewer than 379 + the new tests. **If the parity test fails, the refactor changed output — that is the defect this task exists to prevent. Fix the refactor, not the test.**

- [ ] **Step 10: Assert no literal positions remain**

Run: `grep -rn '"position" =>' lib/ethos_web/controllers/`
Expected: no output. The only `"position"` in the codebase is in `structured_data.ex`.

- [ ] **Step 11: Commit**

```bash
git add lib/ethos_web/components/structured_data.ex lib/ethos_web/controllers test/support/conn_case.ex test/ethos_web
git commit -m "refactor: one JSON-LD builder module, positions derived not written"
```

---

### Task 2: `Ethos.Places.Address`

**Files:**
- Create: `lib/ethos/places/address.ex`
- Test: `test/ethos/places/address_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: `Ethos.Places.Address.parse/1` taking `String.t() | nil`, returning
  `%{street: String.t() | nil, locality: String.t() | nil, region: String.t() | nil, postal_code: String.t() | nil, parsed?: boolean()}`.

**The binding rule:** `street` is non-nil **only** when the street segment begins with a house number. 394 places carry descriptive locations — `"Bounded by Lafayette Avenue, Tompkins Avenue, Greene Avenue and Marcy Avenue"`, `"Along Shore Road"`, `"Cropsey Avenue between 21st Avenue and Bay Parkway"` — each a true statement of where the place is and a false `streetAddress`.

- [ ] **Step 1: Write the failing test**

```elixir
defmodule Ethos.Places.AddressTest do
  use ExUnit.Case, async: true
  alias Ethos.Places.Address

  test "decomposes a standard address" do
    assert Address.parse("9 Main Street North, Bethlehem, CT 06751") ==
             %{
               street: "9 Main Street North",
               locality: "Bethlehem",
               region: "CT",
               postal_code: "06751",
               parsed?: true
             }
  end

  test "parses without a postal code" do
    assert %{street: "1 Elm Street", locality: "Hartford", region: "CT", postal_code: nil} =
             Address.parse("1 Elm Street, Hartford, CT")
  end

  test "a descriptive location yields no street but keeps the rest" do
    parsed = Address.parse("Cropsey Avenue between 21st Avenue and Bay Parkway, Brooklyn, NY 11214")
    assert parsed.street == nil
    assert parsed.locality == "Brooklyn"
    assert parsed.region == "NY"
    assert parsed.postal_code == "11214"
    assert parsed.parsed?
  end

  test "an unparseable address reports parsed? false and invents nothing" do
    parsed = Address.parse("Irving Ave. and Knickerbocker Ave., between Starr St. and Suydam St., Brooklyn")
    refute parsed.parsed?
    assert parsed.street == nil
    assert parsed.locality == nil
  end

  test "finds a postal code even when the whole address does not parse" do
    parsed = Address.parse("2 Wyckoff Avenue, Brooklyn, NY 11237, entrance at 408 Jefferson Street")
    assert parsed.postal_code == "11237"
  end

  test "nil in, empty out" do
    assert %{parsed?: false, street: nil, postal_code: nil} = Address.parse(nil)
  end

  test "a ZIP+4 keeps only the five-digit code" do
    assert Address.parse("1 Elm Street, Hartford, CT 06103-1234").postal_code == "06103"
  end
end
```

- [ ] **Step 2: Run it, watch it fail**

Run: `mix test test/ethos/places/address_test.exs`
Expected: FAIL — `Ethos.Places.Address` is not defined.

- [ ] **Step 3: Write the module**

```elixir
defmodule Ethos.Places.Address do
  @moduledoc """
  Decomposes `Place.address` — one free-text string — into PostalAddress parts.

  `street` is returned only when the street segment begins with a house number.
  Roughly 394 places (overwhelmingly parks) store a descriptive location rather
  than a postal address: "Bounded by Lafayette Avenue, Tompkins Avenue, Greene
  Avenue and Marcy Avenue". Each is a true statement of where the place is and
  a false `streetAddress`, so those emit locality, region and postal code and
  omit the street line.
  """

  @full ~r/^(?<street>.+),\s*(?<locality>[^,]+),\s*(?<region>[A-Z]{2})(?:\s+(?<postal>\d{5})(?:-\d{4})?)?\s*$/
  @postal ~r/\b(\d{5})(?:-\d{4})?\b/
  @house_number ~r/^\d/

  @empty %{street: nil, locality: nil, region: nil, postal_code: nil, parsed?: false}

  def parse(nil), do: @empty
  def parse(""), do: @empty

  def parse(address) when is_binary(address) do
    trimmed = String.trim(address)

    case Regex.named_captures(@full, trimmed) do
      nil ->
        %{@empty | postal_code: scan_postal(trimmed)}

      caps ->
        %{
          street: street_or_nil(caps["street"]),
          locality: presence(caps["locality"]),
          region: presence(caps["region"]),
          postal_code: presence(caps["postal"]) || scan_postal(trimmed),
          parsed?: true
        }
    end
  end

  defp street_or_nil(street) do
    street = String.trim(street)
    if Regex.match?(@house_number, street), do: presence(street), else: nil
  end

  defp scan_postal(text) do
    case Regex.run(@postal, text, capture: :all_but_first) do
      [postal] -> postal
      _ -> nil
    end
  end

  defp presence(nil), do: nil
  defp presence(""), do: nil
  defp presence(s), do: String.trim(s)
end
```

- [ ] **Step 4: Run it, watch it pass**

Run: `mix test test/ethos/places/address_test.exs`
Expected: PASS.

- [ ] **Step 5: Add the corpus-wide test**

This is the assertion that matters most — it runs the parser over every address in the repository and reports what it produces, so a regression shows up as a count change rather than a silent behaviour shift.

```elixir
test "every address in the corpus either decomposes or falls back cleanly" do
  addresses =
    Ethos.SeedDataHelpers.all_seed_files()
    |> Enum.flat_map(fn file -> file |> File.read!() |> Jason.decode!() |> Map.get("places", []) end)
    |> Enum.map(& &1["address"])
    |> Enum.reject(&is_nil/1)

  parsed = Enum.map(addresses, &Address.parse/1)

  # No emitted street line may contain the locality that is emitted beside it —
  # this is the bug the whole task exists to fix.
  for {p, original} <- Enum.zip(parsed, addresses), p.street && p.locality do
    refute String.contains?(p.street, p.locality),
           "streetAddress still contains its own locality: #{inspect(original)}"
  end

  # A street line is never returned without a house number.
  for p <- parsed, p.street do
    assert Regex.match?(~r/^\d/, p.street)
  end

  parsed_count = Enum.count(parsed, & &1.parsed?)
  street_count = Enum.count(parsed, & &1.street)

  # Recorded so a regression is visible as a number, not a vibe. Update these
  # deliberately when the corpus grows; never to make a failing test pass.
  assert parsed_count > 1900, "only #{parsed_count} of #{length(addresses)} addresses decomposed"
  assert street_count > 1500, "only #{street_count} addresses yielded a street line"
end
```

- [ ] **Step 6: Run it and record the real numbers**

Run: `mix test test/ethos/places/address_test.exs`
If a bound fails, **report the actual counts rather than lowering the bound to fit.** The spec predicts ~1,935 parsed and ~1,541 with a street line; a large miss means the regex is wrong, not the bound.

- [ ] **Step 7: Commit**

```bash
git add lib/ethos/places/address.ex test/ethos/places/address_test.exs
git commit -m "feat: decompose place addresses into PostalAddress parts"
```

---

### Task 3: Wire the address into place JSON-LD, add `sameAs`

**Files:**
- Modify: `lib/ethos_web/controllers/place_controller.ex:72-100`
- Test: `test/ethos_web/controllers/place_controller_test.exs`

**Interfaces:**
- Consumes: `Ethos.Places.Address.parse/1` (Task 2), `EthosWeb.StructuredData.maybe_put/3` (Task 1).
- Produces: nothing downstream.

- [ ] **Step 1: Write the failing tests**

```elixir
test "PostalAddress is decomposed, not stuffed", %{conn: conn} do
  place = place_fixture(%{address: "9 Main Street North, Bethlehem, CT 06751", town: "Bethlehem", state: "CT"})
  html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

  ld = json_ld_of_type(html, EthosWeb.PlaceHTML.schema_type(place.kind))
  address = ld["address"]

  assert address["streetAddress"] == "9 Main Street North"
  assert address["addressLocality"] == "Bethlehem"
  assert address["addressRegion"] == "CT"
  assert address["postalCode"] == "06751"
  refute String.contains?(address["streetAddress"], "Bethlehem")
end

test "a descriptive location omits streetAddress rather than publishing a false one", %{conn: conn} do
  place = place_fixture(%{address: "Along Shore Road, Greenwich, CT 06830", town: "Greenwich", state: "CT"})
  html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

  address = json_ld_of_type(html, EthosWeb.PlaceHTML.schema_type(place.kind))["address"]

  refute Map.has_key?(address, "streetAddress")
  assert address["addressLocality"] == "Greenwich"
  assert address["postalCode"] == "06830"
end

test "an unparseable address still publishes the whole string", %{conn: conn} do
  raw = "Irving Ave. and Knickerbocker Ave., between Starr St. and Suydam St., Brooklyn"
  place = place_fixture(%{address: raw, town: "Brooklyn", state: "NY"})
  html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

  address = json_ld_of_type(html, EthosWeb.PlaceHTML.schema_type(place.kind))["address"]
  assert address["streetAddress"] == raw
end

test "official_url is published as sameAs", %{conn: conn} do
  place = place_fixture(%{official_url: "https://example.com/"})
  html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

  ld = json_ld_of_type(html, EthosWeb.PlaceHTML.schema_type(place.kind))
  assert ld["sameAs"] == ["https://example.com/"]
  assert ld["url"] =~ "/p/#{place.slug}"
end
```

- [ ] **Step 2: Run them, watch them fail**

Run: `mix test test/ethos_web/controllers/place_controller_test.exs`
Expected: FAIL on all four.

- [ ] **Step 3: Rewrite `place_ld/2`'s address branch**

```elixir
defp address_ld(%{address: nil}), do: nil

defp address_ld(place) do
  parsed = Ethos.Places.Address.parse(place.address)

  # An address we could not decompose keeps today's whole-string behaviour.
  # Degrading is acceptable; disappearing is not.
  street = if parsed.parsed?, do: parsed.street, else: place.address

  %{"@type" => "PostalAddress", "addressCountry" => "US"}
  |> StructuredData.maybe_put("streetAddress", street)
  |> StructuredData.maybe_put("addressLocality", place.town)
  |> StructuredData.maybe_put("addressRegion", place.state)
  |> StructuredData.maybe_put("postalCode", parsed.postal_code)
end
```

`addressLocality` and `addressRegion` continue to come from the `town` and `state` **columns**, not from the parsed string — those are authoritative and the parse is not.

Add `sameAs` in `place_ld/2`:

```elixir
|> StructuredData.maybe_put("sameAs", place.official_url && [place.official_url])
```

- [ ] **Step 4: Run them, watch them pass**

Run: `mix test test/ethos_web/controllers/place_controller_test.exs`
Expected: PASS.

- [ ] **Step 5: Run the full suite and commit**

```bash
git add lib/ethos_web/controllers/place_controller.ex test/ethos_web/controllers/place_controller_test.exs
git commit -m "fix: streetAddress no longer contains the locality emitted beside it"
```

---

### Task 4: The home page

**Files:**
- Modify: `lib/ethos_web/controllers/page_controller.ex:8-26`
- Test: `test/ethos_web/controllers/page_controller_test.exs`

**Interfaces:**
- Consumes: `EthosWeb.StructuredData` (Task 1).
- Produces: an `Organization` node other pages may reference as `publisher` (Task 5).

The home page assigns no `page_title`, `page_meta_description`, `page_canonical`, `page_og` or `json_ld`. It renders with the title `Ethos · Ethos`.

- [ ] **Step 1: Write the failing test**

```elixir
test "the home page carries metadata and site-level structured data", %{conn: conn} do
  html = conn |> get(~p"/") |> html_response(200)

  assert html =~ ~s(<link rel="canonical")
  assert html =~ ~s(<meta name="description")
  assert html =~ ~s(<meta property="og:title")
  refute html =~ "Ethos · Ethos"

  org = json_ld_of_type(html, "Organization")
  assert org["name"] == "Ethos"
  assert org["url"] =~ "http"
  assert org["logo"] =~ "logo.svg"

  site = json_ld_of_type(html, "WebSite")
  assert site["name"] == "Ethos"
  assert site["potentialAction"]["@type"] == "SearchAction"
  assert site["potentialAction"]["target"] =~ "/search?q="
end
```

- [ ] **Step 2: Run it, watch it fail**

Run: `mix test test/ethos_web/controllers/page_controller_test.exs`

- [ ] **Step 3: Add the assigns and the two nodes**

```elixir
@description "Travel guides written from real trips — Connecticut, New York and Rome, place by place."

defp organization_ld do
  %{
    "@context" => "https://schema.org",
    "@type" => "Organization",
    "name" => "Ethos",
    "url" => url(~p"/"),
    "logo" => url(~p"/images/logo.svg")
  }
end

defp website_ld do
  %{
    "@context" => "https://schema.org",
    "@type" => "WebSite",
    "name" => "Ethos",
    "url" => url(~p"/"),
    "potentialAction" => %{
      "@type" => "SearchAction",
      "target" => %{
        "@type" => "EntryPoint",
        "urlTemplate" => url(~p"/search") <> "?q={search_term_string}"
      },
      "query-input" => "required name=search_term_string"
    }
  }
end
```

Verify `priv/static/images/logo.svg` is the correct path for the `~p"/images/logo.svg"` route before writing it. **Note in your report:** Google's logo rich result wants a raster (JPG/PNG/WebP); an SVG is valid schema.org but may not earn that treatment. Producing a raster is out of scope — record it as a follow-up.

- [ ] **Step 4: Run it, watch it pass, then the full suite**

- [ ] **Step 5: Commit**

```bash
git add lib/ethos_web/controllers/page_controller.ex test/ethos_web/controllers/page_controller_test.exs
git commit -m "feat: home page metadata, Organization and WebSite schema"
```

---

### Task 5: Guide `Article` image and publisher; destination hub `CollectionPage`

**Files:**
- Modify: `lib/ethos_web/controllers/guide_controller.ex:52-63`
- Modify: `lib/ethos_web/controllers/destination_controller.ex` (index and town branches; state and county `collection_ld`)
- Test: `test/ethos_web/controllers/guide_seo_test.exs`
- Test: `test/ethos_web/controllers/destination_controller_test.exs`

**Interfaces:**
- Consumes: `EthosWeb.StructuredData.collection_page/3` and `absolute_url/1` (Task 1); the `Organization` shape (Task 4).
- Produces: nothing downstream.

- [ ] **Step 1: Write the failing tests**

```elixir
test "Article carries an image when the guide has one, and omits it otherwise", %{conn: conn} do
  with_image = guide_fixture(%{og_image_path: "og/example.png"})
  html = conn |> get(~p"/g/#{with_image.slug}") |> html_response(200)
  article = json_ld_of_type(html, "Article")

  assert article["image"] =~ "og/example.png"
  assert article["publisher"]["@type"] == "Organization"
  assert article["publisher"]["name"] == "Ethos"

  without = guide_fixture(%{og_image_path: nil})
  html = conn |> get(~p"/g/#{without.slug}") |> html_response(200)
  refute Map.has_key?(json_ld_of_type(html, "Article"), "image")
end

test "the destinations index and town pages emit a CollectionPage", %{conn: conn} do
  html = conn |> get(~p"/destinations") |> html_response(200)
  assert json_ld_of_type(html, "CollectionPage")["name"]
end

test "state and county CollectionPage carry the destination's intro as description", %{conn: conn} do
  # A destination record supplies the intro; without one, description is omitted.
  html = conn |> get(~p"/destinations/connecticut") |> html_response(200)
  ld = json_ld_of_type(html, "CollectionPage")
  assert is_binary(ld["description"]) and ld["description"] != ""
end
```

- [ ] **Step 2: Run them, watch them fail**

- [ ] **Step 3: Implement**

`article_ld/2` gains, using the already-resolved `guide.og_image_path` from `guide_controller.ex:18`:

```elixir
|> StructuredData.maybe_put("image", guide.og_image_path && StructuredData.absolute_url(guide.og_image_path))
|> Map.put("publisher", %{"@type" => "Organization", "name" => "Ethos", "url" => url(~p"/")})
```

The destination index and town branches gain a `collection_page/3` call alongside their existing breadcrumb. The state and county branches pass `description: destination && destination.intro` — `maybe_put` drops it when there is no record, so a recordless page is unchanged.

- [ ] **Step 4: Run them, watch them pass, then the full suite**

- [ ] **Step 5: Commit**

```bash
git add lib/ethos_web/controllers test/ethos_web/controllers
git commit -m "feat: Article image and publisher, CollectionPage on every destination hub"
```

---

## Self-Review

**Spec coverage.** Every numbered item in the spec's Design section maps to a task: §1 → T1, §2 → T2, §3 → T4, §4 and §6 → T5, §5 → T3, Testing → T1 step 3 plus the property assertions in T2/T3/T4/T5. The spec's Out of Scope items appear in no task, which is correct.

**Placeholder scan.** No TBDs. Every code step carries real code. The two places an implementer must determine a value rather than copy one — the corpus counts in T2 step 6 and the logo route in T4 step 3 — say so explicitly and say what to do if the value surprises them.

**Type consistency.** `StructuredData.maybe_put/3` is arity 3 throughout (the private `place_controller` version it replaces was arity 2 — T1 step 8 replaces the call sites). `Address.parse/1` returns the same five-key map in every branch including `nil`. `collection_page/3` has a default third argument, so both `collection_page(n, u)` and `collection_page(n, u, description: d)` are valid. `absolute_url/1` is nil-safe, which T5 relies on.

**Ordering.** T1 before everything (every later task edits controllers it refactors). T2 before T3 (T3 consumes the parser). T4 before T5 only by convention — T5 inlines the publisher Organization rather than calling T4's private function, so they are genuinely independent.
