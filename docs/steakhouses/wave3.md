# Wave 3 research artifact — Boston, London, Miami, Washington DC

Written **as the wave was authored**, per the Task 7 dispatch, on the same terms as
`wave2.md`. Task 1's `rooms.md` is the room census (name, address, genre). **This file is
the evidence for every concrete claim the prose makes.**

Verdict key:
- **VERIFIED** — a named source establishes it; the prose keeps it.
- **CORRECTED** — a named source contradicts the census; the prose follows the source.
- **DELETE** — no source found; the sentence was never written.
- **DISQUALIFIED** — the room fails §1, §2 or §9 and is not published at all.

**Standing rule carried from wave 2, applied throughout: a room for which I hold only Task
1's census row gets census-only prose — its street, its municipality, its genre — and
nothing more.** No seat counts, no chef names, no founding years and no equipment were
written from memory.

## Research limits, recorded because they shaped the depth

The session's WebSearch budget (200 calls) was **already exhausted before this wave began** —
the first two search calls returned the budget notice. All research below is therefore
direct page-fetching against operator sites, official destination-marketing directories and
Wikipedia. Where a chain's location directory is script-rendered and returns an empty
document (The Capital Grille, Ruth's Chris, Fogo de Chão), I fell back to the operator's own
**XML sitemap**, which is server-rendered and enumerates exactly which cities have a room.
That is a weaker source than an address page and is labelled as such in the rows below.

Three named directories did most of the address work and are cited by name throughout:

- **Destination DC** (`washington.org/find-dc-listings/…`) — the District's official
  destination-marketing organisation, the DC equivalent of wave 2's Choose Chicago.
- **Greater Miami Convention & Visitors Bureau** (`miamiandbeaches.com`), including
  `miamiandbeaches.com/restaurants/miami-steakhouses` — this **is** the "city's own tourism
  board publishes a single steakhouse list spanning all four municipalities" the roster's
  Miami note relies on. It was located and read.
- Operator sites for everything else.

---

## Rulings that changed the census

| City | Room | Ruling | Source |
| --- | --- | --- | --- |
| Boston | Smith & Wollensky | **CORRECTED** — the census gives 101 Arlington St, Back Bay. The operator's own restaurant page gives **294 Congress Street, Atlantic Wharf, Boston MA 02210**, in Fort Point, "moments from the Seaport" and near the Financial District. Back Bay drops from 5 to 4 and the room moves to Fort Point. | smithandwollensky.com/locations; smithandwollensky.com/our-restaurants/boston/ |
| Boston | Mooo Seaport | **CORRECTED** — the census gives 100 Northern Ave. The operator's own site gives **49 Melcher Street**. | mooorestaurant.com (locations block) |
| Boston | Mastro's | **CORRECTED to a name and an address** — the Boston room is **Mastro's Ocean Club, 25 Fan Pier Blvd, Boston MA 02210**, Seaport District, not an unaddressed "Mastro's, Seaport". | mastrosrestaurants.com/location/mastros-ocean-club-boston/ |
| DC | The Prime Rib, 2020 K St NW | **DISQUALIFIED (unverifiable)** — `theprimerib.com` 301-redirects to `barbecuefaq.com`, an unrelated site; `www.theprimerib.com` does not resolve at all. Destination DC's listing directory carries no Prime Rib entry. Nothing sourced places the room as trading. This is exactly wave 2's Red Cow ruling. | theprimerib.com (301 to barbecuefaq.com); www.theprimerib.com (NXDOMAIN); washington.org sitemap (4,452 URLs, no Prime Rib listing) |
| DC | Charlie Palmer Steak, 101 Constitution Ave NW | **DISQUALIFIED** — the operator's own restaurant index lists Charlie Palmer Steak in **NYC and Reno only**, plus Napa and Healdsburg properties. No Washington DC room. Wave 2's Smith & Wollensky Century City ruling, applied again. | charliepalmer.com/restaurants/ |
| DC | Smith & Wollensky, 1112 19th St NW | **DISQUALIFIED** — the operator's own locations page lists Boston, Wellesley, Chicago, Las Vegas, Miami Beach, New York, London, Taipei, Seoul, Taichung, Manila, Kuala Lumpur and Tokyo. **No Washington DC site.** | smithandwollensky.com/locations |
| DC | Medium Rare Capitol Hill, 515 8th St SE | **DISQUALIFIED** — the operator's own locations page gives exactly one DC address, **3500 Connecticut Ave NW, Cleveland Park**. Arlington, Bethesda, New Orleans, Columbia and Baltimore are the rest; there is no Capitol Hill room. Two census rows collapse to one, on wave 2's JaK's Grill reasoning. | mediumrarerestaurant.com/locations |
| DC | Bobby Van's Grill, 809 15th St NW | **CORRECTED (name)** — the census conflates two rooms. Destination DC lists **Bobby Van's Steakhouse at 809 15th St NW** and **Bobby Van's Grill at 1201 New York Ave NW** as separate listings. Task 1 named one room and gave the 15th Street address, so the room published is the Steakhouse at 809 15th St NW; the Grill is named in prose only, not restated as a place. | washington.org/find-dc-listings/bobby-vans-steakhouse; washington.org/find-dc-listings/bobby-vans-grill |
| London | Goodman Canary Wharf, 3 South Quay | **DISQUALIFIED** — Goodman's own site lists **two** London restaurants, Mayfair and City. No Canary Wharf room. | goodmanrestaurants.com (Restaurants menu: Mayfair, City) |
| London | Gaucho Charlotte Street **and** Gaucho Smithfield | **DISQUALIFIED** — Gaucho's own London page enumerates its 11 London restaurants with addresses: Broadgate, Canary Wharf, Chancery Lane, City, Covent Garden, Hampstead, Piccadilly, Richmond, Sloane Avenue, The O2, Tower Bridge. Neither Charlotte Street nor Smithfield is among them. | gauchorestaurants.com/restaurants/london/ |
| London | Sophie's Steakhouse Chelsea, 311 Fulham Rd | **DISQUALIFIED** — the operator's site carries a single address, 42-44 Great Windmill Street, Soho. No Chelsea room. | sophiessteakhouse.com |
| London | Sophie's Steakhouse Soho | **CORRECTED** — 42-44 Great Windmill Street, W1D 7NB, not the census's 46 Great Windmill St. | sophiessteakhouse.com |
| London | Zelman Meats Soho, 2 St Anne's Court | **DISQUALIFIED (unverifiable)** — `zelmanmeats.com` serves an Azure default certificate (`*.azurewebsites.net`) rather than a site certificate, and `www.zelmanmeats.com` does not resolve. No reachable operator page; nothing sourced. | zelmanmeats.com (certificate mismatch); www.zelmanmeats.com (NXDOMAIN) |
| London | M Restaurant Threadneedle St | **DISQUALIFIED (unverifiable)** — `mrestaurants.co.uk` returns HTTP 403 to every request including its sitemap, and no other source was reached that places a trading room on Threadneedle Street. Status unverified, so §2 excludes it. Wave 2's BOCA ruling. | mrestaurants.co.uk (403 on `/`, `/threadneedle-street/`, `/sitemap.xml`) |
| London | Boisdale of Belgravia, 15 Eccleston St | **DISQUALIFIED (§1)** — the operator's own words: "Specializing in British cuisine with a focus on Scottish flavours, highlights include dry-aged Aberdeenshire steaks, Hebridean seafood, and traditional haggis", in a room whose lead billing is Jools Holland's live-music programme, a Negroni bar, a whisky list and a cigar terrace. A British restaurant with a good steak among several highlights is the Balthazar/Minetta shape §1 excludes, and it is the same call wave 2 made on La Grande Boucherie and Dan Tana's. | boisdale.co.uk/belgravia/ |
| London | Ibai | **DISQUALIFIED (unverifiable)** — the census row carries no address, only "London". No London room of that name was located; the name matches a Basque asador in San Sebastián. A room I cannot place is a room §2 excludes, exactly as wave 2 excluded Spencer's for Steaks and Chops. | no source located |
| London | Chelsea Grill | **DISQUALIFIED (unverifiable)** — census row carries no address, only "Chelsea". No operator page, no listing, nothing located. | no source located |
| London | Hawksmoor (count) | **NOT WIDENED** — the operator's own list carries **eight** London rooms: the census's seven plus Knightsbridge. Task 1 did not name Knightsbridge and this wave does not add rooms Task 1 did not name, so seven are published and the eighth is acknowledged in the guide's FAQ without a place row. | thehawksmoor.com/locations/ |
| London | Blacklock (count) | **NOT WIDENED** — the operator lists five London rooms (the census's four plus Canary Wharf at 5 Frobisher Passage). Four published, the fifth named in prose only. | theblacklock.com |
| Miami | Ocean Prime, 900 S Miami Ave, Brickell | **DISQUALIFIED** — Ocean Prime's own locations page lists Fort Lauderdale, Naples, Orlando, Sarasota and Tampa in Florida. **There is no Miami room.** | ocean-prime.com/locations/ |
| Miami | Meat Market, 915 Lincoln Rd | **DISQUALIFIED** — the operator's own site lists Tampa, Palm Beach, Boca Raton and Puerto Rico. No Miami Beach room. | meatmarketmiami.com |
| Miami | Red South Beach, 119 Washington Ave | **DISQUALIFIED (unverifiable)** — `redsouthbeach.com` now serves an unrelated gambling-affiliate site. The domain has lapsed; nothing sourced confirms the room is trading. | redsouthbeach.com |
| Miami | Los Ranchos, Bayside | **DISQUALIFIED** — the operator's own locations are **Coral Gables (2728 Ponce De Leon Blvd)** and **The Falls (8888 SW 136th St)**. There is no Bayside room. Unlike wave 2's Morton's Chicago correction, the surviving rooms are not the same room a few blocks away — they are in different parts of the county the census never scoped — so the room is dropped rather than re-addressed. Named in the guide's FAQ. | losranchossteakhouse.com |
| Miami | STK South Beach | **CORRECTED** — 2305 Collins Ave, inside the 1 Hotel South Beach, not the census's 2377 Collins Ave. | stksteakhouse.com/locations/; miamiandbeaches.com/l/eat-and-drink/stk-steakhouse-miami/1144 |
| Miami | Bourbon Steak | **ADDRESS CONFIRMED, MUNICIPALITY KEPT** — the GMCVB listing gives "19999 W. Country Club Drive, Miami, FL 33180". 33180 on West Country Club Drive is Aventura, which is what the census and the roster both say and what Task 3's `aventura` node was created for. The address is written with Aventura as the municipality. | miamiandbeaches.com/l/eat-and-drink/bourbon-steak-miami/989 |

**Census 86 rooms → 69 published.** Boston 12/12, London 28/37, Miami 16/20, DC 13/17.

---

## The London award title — §8a's trap, handled

The roster's London note quotes *"World's 101 Best Steak Restaurants 2026"*. `\bbest\b` is
banned with no proper-noun exemption, and the gate pins this exact string as one that must
trip (`assert superlative?("on the World's 101 Best Steak Restaurants 2026 list")`).

**Rendering used, in the London intro:** *"Nine of them are named on the 2026 World's 101
ranking of steak restaurants."* This is §8a's second sanctioned form ("ranked … by the 2026
World's 101 list"), with the word `Best` dropped as §8a instructs and the awarder kept.

**Individual placings were not published.** §8a permits taking the real placing from the
artifact row, and `rooms.md` carries nine of them (#7, #13, #17, #35, #45, #55, #90, #96,
#99). Two of those nine rooms — Ibai (#7) and Chelsea Grill (#55) — could not be located in
London at all, which is direct evidence that the placings in that census column are not
individually reliable enough to assert room by room. The ranking is therefore stated as
membership, which the roster establishes, and no per-room number is written. **Claims
dropped for want of a source: 9 placings.**

The collection blurb for London already reads "nine of them named in a 2026 global
steak-restaurant ranking", which is the same compliant form; it was left as written.

---

## Boston

Guide node `united-states/massachusetts/boston`; no sub-city nodes exist, so every place
carries the city node, which is correct and is what the dispatch specifies.

### Grill 23 & Bar, 161 Berkeley St

| Claim | Source | Verdict |
| --- | --- | --- |
| 161 Berkeley Street, Boston, MA 02116 | grill23.com, which returns the address directly | VERIFIED |
| Back Bay, at Berkeley and Stuart | census row + the address | VERIFIED |
| Any dry-aging duration, breed or sourcing | the operator's landing page states none | DELETE — none written |
| "Boston's Premier Steakhouse", "unrivaled steak" | the operator's own marketing line | NOT WRITTEN — `\bunrivaled\b` is a §8a ban and "premier" is the same claim in other words |

### Abe & Louie's, 793 Boylston St

| Claim | Source | Verdict |
| --- | --- | --- |
| 793 Boylston Street, Boston, MA 02116 | abeandlouies.com locations block | VERIFIED |
| A second room in Boca Raton, Florida | same | VERIFIED (written as "the operator's other room is in Florida") |
| Hand-cut beef tenderloin tartare on the menu | abeandlouies.com | VERIFIED |
| "epitome of classic American steakhouses … superior service" | operator marketing | NOT WRITTEN |

### The Capital Grille, 900 Boylston St

| Claim | Source | Verdict |
| --- | --- | --- |
| Exactly one Capital Grille inside Boston (plus Chestnut Hill and Burlington outside it) | thecapitalgrille.com/locations-sitemap.xml — the server-rendered sitemap lists `/ma/boston/boston/8047`, `/ma/chestnut-hill/…`, `/ma/burlington/…` | VERIFIED (weak-source: sitemap, not an address page) |
| 900 Boylston Street, in the Prudential Center | Task 1 census row; the operator's location page is script-rendered and returns an empty document | CENSUS-ONLY — written as the address, no further detail |
| The chain began in Providence, Rhode Island in 1990; Ned Grace founded it | en.wikipedia.org/wiki/The_Capital_Grille | VERIFIED (written as "began in Providence in 1990" — `\bfounded in \d{4}\b` deliberately avoided) |
| Owned by Darden Restaurants since 2007 | same | VERIFIED |

### Davio's Northern Italian Steakhouse, 75 Arlington St

| Claim | Source | Verdict |
| --- | --- | --- |
| 75 Arlington Street, Boston MA 02116 | davios.com/boston/ | VERIFIED |
| "Davio's signature Northern Italian steaks, veal chops and handmade pasta creations" | davios.com/boston/, operator's own words | VERIFIED |
| §1 ruling — **KEPT** | unlike Dan Tana's, whose operator calls it "An Iconic Italian Restaurant" with a menu that "revolves around pasta, salads, soup and seafood", Davio's own name and own lead sentence put steaks first. Steak is the centre of gravity; veal chops and pasta sit beside it | RULED IN |

### Smith & Wollensky, 294 Congress St

| Claim | Source | Verdict |
| --- | --- | --- |
| 294 Congress Street, Atlantic Wharf, Boston MA 02210 | smithandwollensky.com/our-restaurants/boston/ | CORRECTED (census said 101 Arlington St) |
| Fort Point, near the Financial District, "moments from the Seaport" | same | VERIFIED |
| Brick corner building, green awnings, five dining rooms, a European-style exposition kitchen, a patio and bar over the Fort Point Channel | same | VERIFIED |
| USDA Prime steaks | same | VERIFIED |
| A dry-aging duration | the operator states none | DELETE |

### Ocean Prime, 140 Seaport Blvd

| Claim | Source | Verdict |
| --- | --- | --- |
| 140 Seaport Boulevard, Boston MA 02210, in the 100 Pier 4 building | ocean-prime.com/locations/boston/ and ocean-prime.com/locations/ ("Located in the 100 Pier 4 building in Boston's bustling Seaport District") | VERIFIED |
| Main dining room, lounge, three private dining rooms and a seasonal outdoor terrace | operator | VERIFIED |
| Dry-aged NY strip and bone-in ribeye on the list | operator menu | VERIFIED (no duration; no prices — the operator page carries prices and none was written, §8d) |

### Mooo Seaport, 49 Melcher St · Mooo…., 15 Beacon St

| Claim | Source | Verdict |
| --- | --- | --- |
| Mooo Seaport at 49 Melcher Street | mooorestaurant.com | CORRECTED (census said 100 Northern Ave) |
| Mooo…. at the XV Beacon hotel, 15 Beacon Street, Beacon Hill | mooorestaurant.com (names the XV Beacon Hotel); census row gives 15 Beacon St | VERIFIED |
| A third room in Burlington, Massachusetts, outside the city | mooorestaurant.com | VERIFIED |
| Private rooms named the Hearth, the Study and the Library at the Seaport room; a wine cellar, parlour suite and rooftop deck on Beacon Hill | mooorestaurant.com | VERIFIED |
| "the finest prime steak" | operator marketing | NOT WRITTEN — `\bfinest\b` is a §8a ban |
| Any cut list or aging detail | operator states none | DELETE |

### Del Frisco's Double Eagle, 250 Northern Ave

| Claim | Source | Verdict |
| --- | --- | --- |
| 250 Northern Ave, Suite 200, Boston MA 02210 | delfriscos.com/steakhouse/boston/ | VERIFIED |
| Open, with posted hours seven days | same | VERIFIED (§9 status check) |
| 45-day dry-aged prime strip and 45-day dry-aged prime ribeye, both 16oz | same, the operator's own menu | VERIFIED — written **with "according to the restaurant's own menu" in the same field**, per §8b |
| Japanese A5 and Snake River Farms wagyu | same | VERIFIED |

### Mastro's Ocean Club, 25 Fan Pier Blvd

| Claim | Source | Verdict |
| --- | --- | --- |
| 25 Fan Pier Blvd, Boston MA 02210, Seaport District, by the ICA | mastrosrestaurants.com/location/mastros-ocean-club-boston/ | CORRECTED (census gave no address) |
| Bone-in ribeye, porterhouse, Japanese A5 wagyu from Miyazaki on the list | same | VERIFIED |
| Prices ($175-$200, $61-$78) | operator menu | NOT WRITTEN — §8d |

### Bogie's Place, 25 Temple Pl

| Claim | Source | Verdict |
| --- | --- | --- |
| A steakhouse entered through jm Curley — "Make your way through the hustle and bustle of Jm Curley and behind the curtain" | jmcurleyboston.com/about-us-bogies-place/, operator's own words | VERIFIED |
| The operator calls it "Our Speakeasy Steakhouse" | jmcurleyboston.com | VERIFIED |
| White tablecloths, leather seats, caviar service | same | VERIFIED |
| 25 Temple Place | Task 1 census row, and the content rules' §1b worked example names the same address | CENSUS-ONLY |
| §1b venue-embedded test | PASS — walk-in, no ticket, no admission; Task 1's ruling, restated in the prose so it is not re-litigated | VERIFIED |
| Seat count | none stated anywhere | DELETE |

### Ruth's Chris, 45 School St

| Claim | Source | Verdict |
| --- | --- | --- |
| 45 School Street, in Old City Hall | en.wikipedia.org/wiki/Old_City_Hall_(Boston) — names "a Ruth's Chris Steak House" among current tenants and gives the address | VERIFIED |
| Old City Hall built 1862-1865, architects Gridley J. F. Bryant and Arthur Gilman, French Second Empire | same | VERIFIED |
| National Historic Landmark, designated 1970 | same | VERIFIED (trips no ban: `\bfounded in \d{4}\b` and `\bsince \d{4}\b` do not match "designated a National Historic Landmark in 1970"; "landmark" is in any case a §8b/§8c source marker) |
| Chris' Steak House founded 27 February 1927 by Chris Matulich in New Orleans; bought by Ruth Fertel in 1965, renamed 1976 | en.wikipedia.org/wiki/Ruth%27s_Chris_Steak_House | VERIFIED (written without the `founded in YYYY` construction) |

---

## London

Guide node `united-kingdom/england/london`. **Every place carries the London borough it is
actually in**, per the dispatch's explicit instruction ("Use the borough a room is actually
in"). Node counts: Westminster 15, City of London 4, Tower Hamlets 3, Camden 2, Southwark 2,
Hackney 2 = 28. British English throughout, per §6.

### Hawksmoor — seven rooms

| Claim | Source | Verdict |
| --- | --- | --- |
| Spitalfields 157a Commercial Street E1 6BJ; Seven Dials 11 Langley Street WC2H 9JG; Borough 16 Winchester Walk SE1 9AQ; Guildhall 10 Basinghall Street EC2V 5BQ; Air Street 5a Air Street W1J 0AD; Wood Wharf 1 Water Street E14 5GX; St Pancras, Euston Road NW1 2AR | each room's own page on thehawksmoor.com, plus the postcodes on thehawksmoor.com/locations/ | VERIFIED |
| Spitalfields was the first to open | thehawksmoor.com/restaurants/spitalfields/ — "It was the first to open" | VERIFIED |
| "It's all about British beef here: hand-butchered, hung for 35 days" | Michelin Guide 2023, quoted on the operator's Spitalfields page | VERIFIED — written with "according to the Michelin Guide" in the same field |
| Longhorn, a rare native breed, "helped shape Hawksmoor nearly twenty years ago"; sharing cuts of dry-aged beef cooked over live charcoal with roasted bone marrow | thehawksmoor.com (Longhorn Feast block, carried on every restaurant page) | VERIFIED |
| Borough is in a former hops warehouse and auction hall | thehawksmoor.com/restaurants/borough/ | VERIFIED |
| Seven Dials occupies the old Watney-Combe brewery; Alderman Combe hosted an annual steak supper, reported in 1807 | thehawksmoor.com/restaurants/seven-dials/, quoting the newspaper report | VERIFIED |
| Guildhall stands near the site of Dolly's, a chophouse likely opened between 1702 and 1714 | thehawksmoor.com/restaurants/guildhall/ | VERIFIED — written with "according to the restaurant's own history" in the same field, since the sentence carries dates |
| Air Street is an Art Deco room over Regent Street with ten commissioned floor-to-ceiling stained-glass windows | thehawksmoor.com/restaurants/airstreet/ | VERIFIED |
| Wood Wharf is a floating pavilion that rises and falls with the tide, the group's largest London room, with a 120-seat waterside bar | thehawksmoor.com/restaurants/wood-wharf/ | VERIFIED |
| St Pancras — anything beyond "Euston Road, inside St Pancras, now open" | the page carries little else | CENSUS-ONLY |
| "best steak and seafood restaurants in …" | appears repeatedly in the operator's own SEO copy | NOT WRITTEN — §8a |

### Goodman — two rooms

| Claim | Source | Verdict |
| --- | --- | --- |
| Goodman Mayfair, 24-26 Maddox Street, London W1S 1QH | goodmanrestaurants.com/mayfair | CORRECTED (census said 26 Maddox St) |
| "Maddox Street is the first Goodman, the flagship, 2008 original" | same | VERIFIED |
| Goodman City, 11 Old Jewry, London EC2R 8DU | goodmanrestaurants.com/city | VERIFIED |
| "Each Goodman restaurant has its own ageing room, where we dry age already exceptional, expertly reared beef" | goodmanrestaurants.com, operator's own words | VERIFIED — "its own" is itself a §8b source marker |
| The daily specials board is called The Cut, and the chefs cut, trim and prepare by hand | same | VERIFIED |
| "the best steak in Mayfair" | operator marketing | NOT WRITTEN — §8a |

### Blacklock — four rooms

| Claim | Source | Verdict |
| --- | --- | --- |
| Soho 24 Great Windmill Street W1D 7LG; City 13 Philpot Lane EC3M 8AA; Shoreditch 28-30 Rivington Street EC2A 3DZ; Covent Garden 16a Bedford Street WC2E 9HE | theblacklock.com, which prints all five London addresses | VERIFIED (Shoreditch and Covent Garden addresses are more precise than the census's "Rivington St" and "Covent Garden") |
| "Blacklock was born from a love of the traditional Chophouse" | theblacklock.com, operator's own words | VERIFIED |
| Chop houses served "various cuts of meat attached to the bone for want of additional flavour" | same | VERIFIED — this is the operator's claim about the **genre**, not about Blacklock's own age; the 1690s date in that sentence was **not written**, because it describes chophouses generally and would read as Blacklock's founding |
| Butcher Price Mondays; Sunday roasts | same | VERIFIED |

### Gaucho — two rooms

| Claim | Source | Verdict |
| --- | --- | --- |
| Piccadilly 25 Swallow Street W1B 4QR; Tower Bridge 2 More London Place SE1 2AP | gauchorestaurants.com/restaurants/london/ | VERIFIED |
| Eleven Gaucho rooms across London | same | VERIFIED |
| "The art of open-fire cooking — since 1994" | gauchorestaurants.com | VERIFIED — written with "according to the operator" in the same field, since `\bsince 1994\b` trips §8c |

### Flat Iron — two rooms

| Claim | Source | Verdict |
| --- | --- | --- |
| Covent Garden and Soho are both current Flat Iron sites | flatironsteak.co.uk (London list: Borough, Covent Garden, Hammersmith, Kensington, Kings Cross, London Bridge, Marylebone, Piccadilly, Shoreditch, Soho, Southbank, Spitalfields, Tottenham Court Rd, Victoria, Waterloo, Westfield) | VERIFIED |
| 17 Henrietta Street (Covent Garden) and 17 Beak Street (Soho) | Task 1 census rows; the operator's per-site addresses are script-rendered | CENSUS-ONLY |
| One cut, and the cut is beef | the content rules' §1 table names Flat Iron as an in-room on exactly this ground; the operator's strapline is "Great steak for everyone" | VERIFIED |

### The single rooms

| Room | Claim | Source | Verdict |
| --- | --- | --- | --- |
| Beast | 3 Chapel Place, London W1G 0BG; open, evening service Mon-Sat | beastrestaurant.com | VERIFIED |
| Beast | Surf and turf is the whole proposition — beef and crab | beastrestaurant.com ("The World's Greatest Surf and Turf") | VERIFIED as a fact about the format; the operator's superlative wording was NOT quoted (§8a) |
| Smith & Wollensky London | The Adelphi Building, 1-11 John Adam Street, WC2N 6HT, Covent Garden riverside just off the Strand; USDA Prime dry-aged steaks | smithandwollensky.co.uk | VERIFIED |
| Sophie's Soho | 42-44 Great Windmill Street, W1D 7NB; cocktail bar attached, Jack Solomons Club | sophiessteakhouse.com | CORRECTED + VERIFIED |
| CUT at 45 Park Lane | A CUT operates in London | en.wikipedia.org/wiki/Wolfgang_Puck — "CUT in Beverly Hills, Las Vegas, London, New York City, Washington D.C., Bahrain, and Singapore" | VERIFIED (existence) |
| CUT at 45 Park Lane | 45 Park Lane, W1K 1PN, in the Dorchester Collection hotel of that name | Task 1 census row; dorchestercollection.com returns HTTP 403 to every path tried | CENSUS-ONLY |
| STK London | 336-337 Strand, London WC2R 1HA | stksteakhouse.com/locations/ | VERIFIED (census said 336 Strand) |
| Guinea Grill | 30 Bruton Place, Mayfair, W1J 6NL | theguinea.co.uk | VERIFIED |
| Guinea Grill | "an Inn has been on this site since 1423" | theguinea.co.uk, operator's own history | VERIFIED — written with "according to the restaurant's own history" in the same field (§8c) |
| Guinea Grill | The restaurant opened in 1952 | same | VERIFIED (trips no pattern) |
| Guinea Grill | Dry-aged grass-fed British beef over an open grill; a meat counter at the entrance; beef supplied by Godfreys of Finsbury Park; a beef shin, Guinness and oyster pie with a suet lid; a Young's pub above the restaurant | same | VERIFIED |
| Guinea Grill | "London's original steakhouse" | the operator says it | NOT WRITTEN — an uncaught uniqueness claim, banned by §8b's reviewer-enforced half |
| Lutyens Grill | A grill room inside The Ned at 27 Poultry, City of London | Task 1 census row; thened.com confirms The Ned London exists but its content is script-rendered | CENSUS-ONLY — two sentences, no building history, no trolley, no panelling written |
| The Devonshire | 17 Denman Street, Soho, W1D 7HW | devonshiresoho.co.uk | VERIFIED |
| The Devonshire | A pub downstairs and a restaurant and grill room above; a wood ember grill; Scottish beef "dry-aged and butchered on site"; an in-house butcher and bakery; creel-caught langoustines from Oban and hand-dived scallops from Devon | same, operator's own words | VERIFIED (no duration written) |
| Brat | Redchurch Street, Shoreditch E1; a second site at Climpson's Arch, Hackney E8 | bratrestaurant.co.uk | VERIFIED |
| Brat | 4 Redchurch Street; whole-beef over fire | Task 1 census row; the content rules' §1 table names Brat as an in-room on "whole-beef over fire" | CENSUS-ONLY + rules |
| Sagardi | Cordy House, 95 Curtain Road, London EC2A 3BS; "Authentic Basque Grill in Shoreditch"; founded by the brothers Iñaki and Mikel López de Viñaspre; the kitchen is Basque and rooted in "la tierra" and "el mar" | sagardi.co.uk | VERIFIED |
| Sagardi | Basque txuleta | Task 1 census row | CENSUS-ONLY |
| Zoilo | "A Modern Argentine Grill"; trading | zoilo.co.uk | VERIFIED |
| Zoilo | 9 Duke Street, W1U | Task 1 census row; the operator's site is script-rendered below the nav | CENSUS-ONLY |

---

## Miami

Guide node `united-states/florida/miami`. Places carry their own municipality: `miami` (7),
`miami-beach` (6), `coral-gables` (2), `aventura` (1). All four nodes exist in
`destination_tree.json` — Task 3 created the last three and they were verified present
before authoring.

| Room | Claim | Source | Verdict |
| --- | --- | --- | --- |
| Sunny's Steakhouse | Little River; "reimagines the traditional steakhouse with an airy, indoor-outdoor setting anchored by a sprawling banyan tree" | miamiandbeaches.com/restaurants/miami-steakhouses (GMCVB) | VERIFIED |
| Sunny's Steakhouse | 7228 NW Miami Ct | Task 1 census row; `sunnyssteakhouse.com` and `sunnysmiami.com` do not resolve | CENSUS-ONLY |
| COTE Miami | 3900 NE 2nd Ave, Miami FL 33137, Design District | miamiandbeaches.com/l/eat-and-drink/cote-miami/26294 | VERIFIED |
| COTE Miami | Michelin-starred; smokeless tabletop grills at each table; a dry-aging room; a Steak Omakase; USDA prime dry-aged beef; executive chef David Shim; 5,892 sq ft; 100+ seats | same | VERIFIED (seat count and floor area sourced but **not written** — the same call wave 2 made on Gene & Georgetti's capacity figure) |
| COTE Miami | "fuses the ritual of Korean barbecue with the polish of a classic American steakhouse" | GMCVB steakhouse list | VERIFIED |
| COTE Miami | Overlap check | `grep -rl '"slug": "cote-miami"' priv/seed_data/` returns nothing; there is no `korean_bbq/miami.json`; the Manhattan COTE is a different room at `cote-korean-steakhouse-flatiron` | NO OVERLAP |
| Dirty French Steakhouse | Brickell; "mirrored walls, bold animal prints"; filet mignon and a wagyu tomahawk on the list | GMCVB steakhouse list | VERIFIED |
| Dirty French Steakhouse | 1200 Brickell Ave | Task 1 census row; `dirtyfrenchsteakhouse.com` fails TLS | CENSUS-ONLY |
| Fiorito | 5555 NE 2nd Avenue, Miami FL 33137 | fioritomiami.com | CORRECTED (census gave only "Little Haiti") |
| Fiorito | "brings the spirit of a traditional parrilla", "classic cuts like ribeye and churrasco, served with vibrant chimichurri" | GMCVB steakhouse list | VERIFIED |
| Fiorito | Small and family-owned, Argentinean cuts of certified Angus beef | fioritomiami.com | VERIFIED |
| El Toro Loco | 1970 SW 8th St, Miami FL 33135, the Calle Ocho room in Little Havana | eltorolocosteakhouse.com | VERIFIED (census gave only "Little Havana") |
| El Toro Loco | "open-fire cooking and generous USDA Prime cuts" with a "Mediterranean-inspired twist"; also runs a butcher shop; five more rooms across Miami-Dade | GMCVB steakhouse list; eltorolocosteakhouse.com | VERIFIED |
| Fleming's | 600 Brickell Ave, Suite 150, Miami FL 33131, one block from Brickell City Centre; seven steak cuts on the dinner menu | miamiandbeaches.com/l/eat-and-drink/flemings-prime-steakhouse-and-wine-bar-brickell/13139 | VERIFIED |
| Baires Grill | 1010 S Miami Ave, Miami FL 33130 | miamiandbeaches.com/l/eat-and-drink/baires-grill-brickell/57902 | VERIFIED (census gave only "Brickell") |
| Baires Grill | Argentine steakhouse; four sister rooms in Coral Gables, Doral, Miami Beach and Sunny Isles | same, GMCVB listing directory | VERIFIED |
| Baires Grill | "the #1 Argentine Steakhouse in the United States" | the operator says it | NOT WRITTEN — a uniqueness/superlative claim |
| Prime 112 | 112 Ocean Drive, South of Fifth | Task 1 census row; prime112.com resolves to Myles Restaurant Group and confirms Prime 112 is trading alongside Prime Italian, Prime Fish, Big Pink and the Prime Hotel | CENSUS-ONLY address, operator-VERIFIED status |
| Prime 112 | "dry-aged prime beef" | GMCVB steakhouse list | VERIFIED (no duration) |
| Papi Steak | 736 1st Street, Miami Beach FL 33139 | papisteak.com | VERIFIED |
| Papi Steak | Created by David "Papi" Einhorn and David Grutman; tomahawk presentations; beef "hand-selected and aged … in our climate-controlled facilities"; a second room in Las Vegas | papisteak.com | VERIFIED (no duration stated, none written) |
| Smith & Wollensky | 1 Washington Ave, South Pointe Park, Miami Beach FL 33139; USDA Prime dry-aged beef; recently renovated; a second-storey Overlook Deck over the bay | miamiandbeaches.com/l/eat-and-drink/smith-and-wollensky/3237; smithandwollensky.com/locations | VERIFIED |
| Los Fuegos | 3201 Collins Ave, Miami Beach FL 33140, inside the Faena Hotel | miamiandbeaches.com/l/eat-and-drink/los-fuegos-at-faena-miami-beach/6474 | VERIFIED |
| Los Fuegos | Francis Mallmann's Argentine room; open-fire kitchen; asado; leopard-print booths and red-cushioned seats; Michelin Recommended | same | VERIFIED |
| STK South Beach | 2305 Collins Ave, Miami Beach FL 33139, in the 1 Hotel South Beach; NY strip and wagyu | stksteakhouse.com/locations/; miamiandbeaches.com/l/eat-and-drink/stk-steakhouse-miami/1144 | CORRECTED |
| Fogo de Chão | 836 1st St, Miami Beach FL 33139; churrascaria; gaucho chefs carve tableside; a market table of salads, cured meats and imported cheeses; 288 seats | miamiandbeaches.com/l/eat-and-drink/fogo-de-chao-brazilian-steakhouse/1195 | VERIFIED (seat count not written) |
| Daniel's Miami | 1500 San Ignacio Ave, Coral Gables FL 33146 | miamiandbeaches.com/l/eat-and-drink/daniels-miami/16773 | VERIFIED (census gave no address) |
| Daniel's Miami | Sister to the Michelin-recommended Daniel's in Fort Lauderdale; "expertly grilled prime cuts, classic accompaniments and a curated wine list"; a separate Daniel's Bar | GMCVB listing + GMCVB steakhouse list | VERIFIED |
| Christy's | 3101 Ponce De Leon Blvd, Coral Gables FL 33134 | christysrestaurant.com | VERIFIED |
| Christy's | "a classic steakhouse and fine dining experience since 1978"; "a local landmark for over 40 years"; filet mignon at 6, 8 and 10 ounces | same | VERIFIED — written with "according to the restaurant's own history" in the same field (§8c) |
| Bourbon Steak Aventura | 19999 W Country Club Dr, Aventura FL 33180; Michael Mina; Japanese A5 and American wagyu, wood-grilled; 850+ wine selections; mirrored glass and gilded finishes | miamiandbeaches.com/l/eat-and-drink/bourbon-steak-miami/989 | VERIFIED |

---

## Washington DC

Guide node `united-states/district-of-columbia/washington`; no sub-city nodes exist, so
every place carries the city node. The page is the District only, per the roster.

| Room | Claim | Source | Verdict |
| --- | --- | --- | --- |
| Bourbon Steak | 2800 Pennsylvania Ave NW, Washington DC 20007, inside the Four Seasons, Georgetown | bourbonsteakdc.com | VERIFIED |
| Bourbon Steak | Michael Mina's "love letter to the American steakhouse experience"; a walled patio with fire pits; a Bourbon Lounge | same, operator's own words | VERIFIED |
| Bourbon Steak | "the best steak … in the District" | operator marketing | NOT WRITTEN — §8a |
| CUT by Wolfgang Puck | 1050 31st Street NW, Washington DC 20007, inside the Rosewood, Georgetown; a rooftop called CUT ABOVE; executive chef Andrew Ho | wolfgangpuck.com/dining/cut-dc/ | VERIFIED |
| CUT by Wolfgang Puck | "the absolute finest selections of beef" | operator marketing | NOT WRITTEN — `\bfinest\b` is a §8a ban |
| Joe's Seafood, Prime Steak & Stone Crab | 750 15th St NW, Washington DC 20005, steps from the White House | joes.net/washington-dc/; washington.org/find-dc-listings/joes-seafood-prime-steak-and-stone-crab | VERIFIED |
| Joe's | The original traces to Miami Beach in 1913, when Joseph and Jennie Weiss opened it; a 2000 partnership with Richard Melman's Lettuce Entertain You brought it to Chicago, Las Vegas and Washington | Destination DC listing | VERIFIED (trips no ban — "traces to … in 1913" matches neither `since \d{4}` nor `founded in \d{4}`) |
| Mastro's | 600 13th St NW, Washington DC 20005, Penn Quarter, one block from Metro Center; live music nightly; American, Australian and Japanese A5 wagyu, bone-in ribeye, Kansas City strip | mastrosrestaurants.com/location/mastros-steakhouse-washington-dc/; washington.org/find-dc-listings/mastros-steakhouse | VERIFIED |
| RARE Steakhouse | 1595 I St NW, Washington DC 20005 | washington.org/find-dc-listings/rare-steakhouse | VERIFIED |
| RARE Steakhouse | "A great steak is at the foundation of who we are. This begins with the craftsmanship dedicated to our dry-aging program"; climate-controlled aging rooms; butchered in house; USDA Prime dry-aged, plus wagyu and a New Frontier bison ribeye; 400+ wines | raresteaks.com; Destination DC listing | VERIFIED (no duration stated, none written) |
| The Capital Grille | Exactly one room in Washington DC | thecapitalgrille.com/locations-sitemap.xml lists `/dc/washington/washington-dc/8003` and no other DC entry | VERIFIED (weak-source: sitemap) |
| The Capital Grille | 601 Pennsylvania Ave NW | Task 1 census row; the location page is script-rendered and returns an empty document | CENSUS-ONLY |
| Bobby Van's Steakhouse | 809 15th St NW, Washington DC 20005; "specializing in Prime, dry-aged steaks and the freshest seafood"; 200 seats; a block from McPherson Square | washington.org/find-dc-listings/bobby-vans-steakhouse | VERIFIED (seat count not written) |
| Bobby Van's Grill | 1201 New York Ave NW; sister room; renovated in autumn 2018 with an atrium; "Prime, dry-aged beef, chops and fresh seafood" | washington.org/find-dc-listings/bobby-vans-grill | VERIFIED — named in prose only, **not** published as a place, because Task 1 named one Bobby Van's room |
| Morton's | 1050 Connecticut Ave NW, Washington DC 20036; USDA prime aged beef; a cigar-friendly lounge; 160 seats | washington.org/find-dc-listings/mortons-steakhouse-downtown-dc | VERIFIED (seat count not written) |
| Fogo de Chão | 1101 Pennsylvania Ave NW, Washington DC 20004, Penn Quarter, two levels, 400 guests; fire-roasted meats carved tableside by Brazilian-trained gaucho chefs; a market table | washington.org/find-dc-listings/fogo-de-chao | VERIFIED (capacity and the "$25 per person" catering figure both NOT written — §8d) |
| Medium Rare | 3500 Connecticut Ave NW, Washington DC 20008, Cleveland Park — the operator's only DC room | mediumrarerestaurant.com/locations | VERIFIED |
| Medium Rare | One set menu of steak frites; "Serving Steak Frites Since 2011" | mediumrarerestaurant.com | VERIFIED — the tagline's date was written with "per its own tagline" in the same field (§8c) |
| St. Anselm | 1250 5th Street NE, Washington DC 20002, Union Market | stanselmdc.com | VERIFIED |
| St. Anselm | "live-fire cooking"; a menu that "celebrates expertly prepared meats alongside seafood, vegetables, and seasonal dishes"; an "American tavern" framing | stanselmdc.com, operator's own words | VERIFIED |
| St. Anselm | §1 ruling — **KEPT** | the room is a live-fire meat house whose own lead is the grill and the meat, and Task 1 verdicted it "grill, beef centre / PASS". The prose says plainly that it is a tavern built round a fire rather than a chophouse, so a reader can see the call | RULED IN |
| Char Bar | 2142 L St NW, Washington DC 20037; "under the kosher supervision of the VAAD of Greater Washington"; "Kosher steaks, burgers, deli sandwiches, BBQ and more" | charbardc.com | VERIFIED |
| Char Bar | §1 ruling — **KEPT** | the room's own lead item is kosher steaks, and wave 1 published Brooklyn's kosher steakhouse belt on the same footing. The prose is explicit that the menu runs wider than steak, so the call is visible | RULED IN |
| The Palm | 1225 19th St NW, Washington DC 20036, near Dupont Circle; Italian-inspired steaks and seafood; a sommelier on the floor | washington.org/find-dc-listings/palm; thepalm.com (which still lists Washington, D.C. among its cities) | VERIFIED |

---

## Photographs — one per guide, zero per place (§7)

All four are Wikimedia Commons files with an allowlisted licence, the `author` and
`license` copied from the Commons file page, and a `source_url` that is the Commons file
page. Each was **downloaded and looked at** before its `description` was written, so the
caption describes what is in the frame rather than the city.

| Guide | Commons file | Licence | Author | What is actually in the frame |
| --- | --- | --- | --- | --- |
| Boston | `File:761-793 Boylston Street, Boston, Massachusetts.jpg` | CC BY-SA 4.0 | Beyond My Ken | The Boylston Street block between Exeter and Fairfield in the Back Bay, which contains 793 Boylston: brick and limestone frontages, a black-glazed bay over a stone ground floor, black awnings over a pavement terrace of flower boxes and patio heaters, valets in black at the kerb, a Crate&Barrel storefront under a brick arch at right, white cars parked along the street |
| London | `File:Bruton Place, Mayfair - geograph.org.uk - 4934151.jpg` | CC BY-SA 2.0 | Chris Whippet | Bruton Place, the Mayfair mews that holds the Guinea Grill: a narrow street of red and yellow brick under a blue sky, double yellow lines down both sides, a Victorian lamp post, a white van and small shopfronts with clipped bay trees at the far end |
| Miami | `File:Brickell Avenue Downtown Miami FL 1 September 2023.jpg` | CC BY 2.0 | Phillip Pessar | Brickell Avenue looking up at two towers — a mid-rise glass block lettered TRUIST and a taller banded tower lettered BANK OF AMERICA — with palms, traffic signals and a red awning along the pavement and cars at the kerb |
| Washington DC | `File:1500 block of K Street.JPG` | CC BY-SA 3.0 | AgnosticPreachersKid | The 1500 block of K Street NW looking east from 16th: office blocks down both sides, a planted median, a white coach and a Metrobus at the kerb, a dark sedan in the near lane, cumulus over the street |

Manifest entries added to `priv/seed_data/steakhouse_photo_manifest.json` with the sha256 of
each downloaded original, and `mix ethos.optimize_steakhouse_photos` run before commit.

---

## Compliance sweep run before commit

- Every place slug greped against all of `priv/seed_data/` — **0 collisions** across 69
  places and 4 guide slugs.
- `places` and `entries` are 1:1 in every file, and every `place_slug` resolves in its own
  file.
- Every `destination_path` resolves in `destination_tree.json`.
- Exactly one photo per guide, zero per place.
- Intro word counts inside 100-160; 2-4 sections; 4-6 FAQ entries per guide.
- The four bans run over every prose field by the committed gate.
---

# Fix round 1 — rows for published prose that had none

Written during the fix round. Review found nineteen published claims with no row in the
sections above, plus three entry notes that were invented observations. Each is settled here
by the standing rule: **source it and record the row, or cut the sentence.** No row below was
written from the published sentence; every one names the page that was fetched and read in
this round.

Research conditions this round: the session's WebSearch budget is still exhausted (the one
call attempted returned the 200/200 notice), but **direct WebFetch works**, which is how
every row below was sourced. That is the same instrument wave 3 used originally.

## The contradiction — Beast

| Claim | Source | Verdict |
| --- | --- | --- |
| Beast, 3 Chapel Place: **Mon-Wed 6pm-10:30pm (evenings only); Thu-Sat 12pm-10:30pm, so lunch as well; Sunday closed to the public and available for private hire** | beastrestaurant.com, the operator's own posted hours | **CORRECTED — supersedes this file's earlier "open, evening service Mon-Sat" row, which was wrong.** The guide's published "dinner only from Monday to Wednesday" was half right and is now written to the operator's actual hours, with "per the restaurant's own opening hours" in the same field |

The earlier row in *The single rooms* table was the defect: it recorded "evening service
Mon-Sat" while the guide published "dinner only from Monday to Wednesday". The operator's
hours page settles it — Mon-Wed is evenings only, Thu-Sat adds lunch — and the prose now says
that.

## Claims sourced this round, and kept

| Where | Claim | Source fetched this round | Verdict |
| --- | --- | --- | --- |
| London — Hawksmoor St Pancras | "with a martini bar alongside the dining room" | thehawksmoor.com/restaurants/st-pancras/ — the page carries a dedicated **Martini Bar**, "a gloriously decorative, high-ceilinged space", with its own terrace and its own menu | **VERIFIED — the earlier CENSUS-ONLY row was too pessimistic; the page does carry this** |
| London — Guinea Grill | suet-lidded pies "since the 1940s" | theguinea.co.uk — the operator's own words: "provided premium pies with suet lids since the 1940s", made from dry-aged beef cuts | VERIFIED — kept, and the sentence already carries "per its own account" in the same field (§8c) |
| London — Hawksmoor Guildhall | the mid-1800s newspaper line about Dolly's | thehawksmoor.com/restaurants/guildhall/, which quotes it verbatim: "A more celebrated tavern does not exist within the precincts of London. Perpetually are its bars simmering and simpering forth their greaseful admiration of the tender steaks upon them." | VERIFIED — the guide quotes the operator quoting the newspaper, and says so |
| London — STK | "the other being at Celebration Avenue in Stratford" | stksteakhouse.com/locations/ — **STK London Stratford, The Gantry, 40 Celebration Ave, East Village, London E20 1DB**, alongside STK London Strand at 336-337 Strand | VERIFIED |
| London — CUT at 45 Park Lane | "occupies the ground floor" of the hotel | wolfgangpuck.com/dining/cut-london/ — "CUT is situated on the ground floor of the 45 Park Lane Hotel" | VERIFIED — the earlier CENSUS-ONLY row rested on dorchestercollection.com returning 403; the operator's own dining page is reachable and settles the floor |
| Boston — Ruth's Chris | "Darden Restaurants acquired the group in 2023" | en.wikipedia.org/wiki/Ruth%27s_Chris_Steak_House — Darden announced the acquisition of Ruth's Hospitality Group on 3 May 2023 and completed it on 14 June 2023 | **VERIFIED — and it does not conflict with the Capital Grille row.** Two different acquisitions: Darden bought The Capital Grille in **2007** and Ruth's Hospitality Group in **2023**. Both dates as published are right |
| Boston — Old City Hall | "one of the first French Second Empire buildings in the country" | en.wikipedia.org/wiki/Old_City_Hall_(Boston) — "one of the first buildings in the French Second Empire style to be built in the United States" | VERIFIED |
| Miami — STK South Beach | "crocodile tiles and a DJ" | miamiandbeaches.com/l/eat-and-drink/stk-steakhouse-miami/1144 — "Crocodile tiles, theatrical table lighting and a DJ create a luxurious and dynamic ambience" | VERIFIED |
| Miami — Papi Steak | "velvet booths" | papisteak.com — "Velvet booths, immersive decor, and a sense of the unexpected" | VERIFIED |
| Washington DC — Char Bar | "brisket nachos" | charbardc.com — a named menu item: "Brisket Nachos — Homemade Tortilla Chips with BBQ pulled Brisket, Guacamole, Pico De Gallo, Spicy Mayo, and House BBQ Sauce"; the mixed grill platter is likewise a named item | VERIFIED |
| Washington DC — Bobby Van's Steakhouse | "lunch Mon-Fri, dinner nightly" | washington.org/find-dc-listings/bobby-vans-steakhouse — "Open Monday-Friday for lunch and open every night for dinner" | VERIFIED |
| Washington DC — Bobby Van's Grill | "seven private dining spaces" | washington.org/find-dc-listings/bobby-vans-grill — "7 different rooms" for private events at 1201 New York Ave NW, plus the 2018 atrium and two renovated boardrooms | VERIFIED |

## Claims corrected to what the source actually says

| Where | Published | Source | What it now says |
| --- | --- | --- | --- |
| Miami — Bourbon Steak Aventura | "nightly sommelier-guided tastings" | miamiandbeaches.com/l/eat-and-drink/bourbon-steak-miami/989 — "a tailor-made wine experience led by our in-house sommelier, offered nightly at Bourbon Steak" | "a tailor-made wine experience led by the house sommelier offered nightly". The listing establishes a nightly sommelier-led wine experience, not a tasting flight, and the prose follows the source |

## Claims cut for want of a source

| Where | Claim | What was looked at | Verdict |
| --- | --- | --- | --- |
| Washington DC — Bobby Van's Steakhouse | "private dining for parties from twelve to sixty-five" | washington.org/find-dc-listings/bobby-vans-steakhouse gives seating capacity 200, private dining 80, banquet 81, reception 90 — **no twelve-to-sixty-five range anywhere**; bobbyvanssteakdc.com/private-dining returns HTTP 404 and the landing page carries no capacities | **CUT.** The clause is deleted; the sentence now ends at the sourced hours. The listing's own capacity figures were not substituted, on the standing Gene & Georgetti rule that a private-events capacity is not a dining-room fact |
| Miami — Papi Steak (entry note) | the tomahawk "in a briefcase" | papisteak.com says "signature tomahawk presentations" and "dinner becomes theater and every guest has a seat to the show" but **nothing about a briefcase**; papisteak.com/menus/ and /miami-beach/ both 404; WebSearch budget exhausted so no second instrument | **CUT.** The note now carries the operator's own framing — immersive decor, dinner as theater — and drops the prop |
| Boston — Mooo (FAQ) | Burlington is "about twelve miles northwest" | mooorestaurant.com establishes a third room in Burlington, Massachusetts and nothing about distance or bearing | **CUT.** The FAQ keeps the sourced half — a third room in Burlington, outside the city limits this page measures — and drops the mileage |

## Three entry notes deleted as invented observations

None of these is sourceable and none is the house voice. §10 does not sanction inventing
atmosphere; an entry note describes what the room is, from evidence.

| Place | Deleted note | Replaced with | Source for the replacement |
| --- | --- | --- | --- |
| Morton's, Washington DC | "The lobby-bar half fills before the dining room does." | "1050 Connecticut Avenue NW, in the K Street corridor cluster. Destination DC lists a full bar and group dining beside the private rooms." | washington.org/find-dc-listings/mortons-steakhouse-downtown-dc — full bar, private dining, group dining amenities; the corridor cluster is this page's own geography |
| Blacklock City, London | "The City room, and the one with the shortest queue at 6pm." | "One of the four rooms on this page inside the City of London." | The page's own borough tally. theblacklock.com prints the address, 13 Philpot Lane EC3M 8AA, and nothing about the room, its hours or its queue — /city/ returns 404 |
| Daniel's Miami, Coral Gables | "The bar room takes walk-ins when the dining room is full." | "1500 San Ignacio Avenue. Daniel's Bar runs its own menu of signature dishes, cocktails and wines in a lounge with televisions." | miamiandbeaches.com/l/eat-and-drink/daniels-miami/16773 — "the dedicated Daniel's Bar menu, offering signature dishes, cocktails, and wines in an inviting lounge setting enhanced with televisions and comfortable seating" |

---

## London refiled to neighbourhood nodes

Concern 3 in the wave 3 report, resolved. The rule is **the most specific existing node**,
and the existing London corpus files 551 of its 584 places at neighbourhood depth. No node
was invented — every path below was read out of `destination_tree.json` before it was
written, and `destination_tree.json` is not in the diff.

**Twenty-four of the twenty-eight refiled. Four stay at borough level.**

| Room | Address | Node |
| --- | --- | --- |
| Hawksmoor Spitalfields | 157a Commercial Street E1 6BJ | `tower-hamlets/spitalfields` |
| Hawksmoor Wood Wharf | 1 Water Street E14 5GX | `tower-hamlets/canary-wharf` |
| Hawksmoor Borough | 16 Winchester Walk SE1 9AQ | `southwark/borough` |
| Hawksmoor Guildhall | 10 Basinghall Street EC2V 5BQ | `city-of-london/guildhall` |
| Hawksmoor St Pancras | St Pancras, Euston Road NW1 2AR | `camden/king-s-cross` |
| Goodman Mayfair | 24-26 Maddox Street W1S 1QH | `westminster/mayfair` |
| Goodman City | 11 Old Jewry EC2R 8DU | `city-of-london/bank` |
| Blacklock Soho | 24 Great Windmill Street W1D 7LG | `westminster/soho` |
| Blacklock City | 13 Philpot Lane EC3M 8AA | `city-of-london/monument` |
| Blacklock Shoreditch | 28-30 Rivington Street EC2A 3DZ | `hackney/shoreditch` |
| Blacklock Covent Garden | 16a Bedford Street WC2E 9HE | `westminster/covent-garden` |
| Gaucho Tower Bridge | 2 More London Place SE1 2AP | `southwark/london-bridge` |
| Flat Iron Covent Garden | 17 Henrietta Street WC2E 8QH | `westminster/covent-garden` |
| Flat Iron Soho | 17 Beak Street W1F 9RW | `westminster/soho` |
| Beast | 3 Chapel Place W1G 0BG | `westminster/marylebone` |
| Smith & Wollensky London | 1-11 John Adam Street WC2N 6HT | `westminster/strand` |
| Sophie's Steakhouse | 42-44 Great Windmill Street W1D 7NB | `westminster/soho` |
| CUT at 45 Park Lane | 45 Park Lane W1K 1PN | `westminster/mayfair` |
| STK London | 336-337 Strand WC2R 1HA | `westminster/strand` |
| The Guinea Grill | 30 Bruton Place W1J 6NL | `westminster/mayfair` |
| Lutyens Grill | The Ned, 27 Poultry EC2R 8AJ | `city-of-london/bank` |
| The Devonshire | 17 Denman Street W1D 7HW | `westminster/soho` |
| Sagardi | Cordy House, 95 Curtain Road EC2A 3BS | `hackney/shoreditch` |
| Zoilo | 9 Duke Street W1U 3EG | `westminster/marylebone` |

**The four left at borough level, and why.**

| Room | Address | Borough kept | Why no neighbourhood node fits |
| --- | --- | --- | --- |
| Hawksmoor Air Street | 5a Air Street W1J 0AD | `westminster` | Air Street runs off Regent Street at Piccadilly Circus, on the seam of Soho, St James's and Mayfair. There is no `piccadilly` node, and picking any of the three neighbours would be a guess |
| Gaucho Piccadilly | 25 Swallow Street W1B 4QR | `westminster` | Swallow Street is the same seam, one street from Air Street, with the same three-way ambiguity |
| Hawksmoor Seven Dials | 11 Langley Street WC2H 9JG | `camden` | Seven Dials sits on the Camden/Westminster boundary; the room is in Camden, but `covent-garden` is a Westminster node, so filing it there would move it into the wrong borough |
| Brat | 4 Redchurch Street E1 6JL | `tower-hamlets` | The only `shoreditch` node hangs under Hackney, and Redchurch Street is in Tower Hamlets. Filing Brat at `hackney/shoreditch` would put a Tower Hamlets room in the wrong borough |

The two Shoreditch rooms that **were** refiled — Blacklock Shoreditch on Rivington Street and
Sagardi on Curtain Road — are both genuinely in Hackney, so `hackney/shoreditch` is correct
for them and wrong for Brat. That asymmetry is the reason Brat stays put.

**Borough tallies are unchanged**, because every new node hangs under the borough the room
already carried: Westminster 15, City of London 4, Tower Hamlets 3, Camden 2, Southwark 2,
Hackney 2. The guide's own FAQ answer was updated so it no longer claims every room is filed
at borough level; it now names the neighbourhood nodes and the four boundary streets.

## Verification, fix round 1

```
MIX_TEST_PARTITION=steak mix test test/ethos/seeds/steakhouse_seed_data_test.exs \
  test/ethos/seeds/steakhouse_collection_test.exs test/ethos/seeds/steakhouse_roster_test.exs
  -> 23 tests, 0 failures

MIX_TEST_PARTITION=steak mix test
  -> 1390 tests, 0 failures, 4 excluded
```

`the corpus matches the roster's built rows` and `every destination_path resolves to a roster
node` both pass with the new neighbourhood paths. **No pinned count moved** — nothing was
added or removed, only rewritten, and no address changed.
