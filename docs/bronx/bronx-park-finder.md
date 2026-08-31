# Bronx Park — finder artifact

Role: FINDER only. No verdicts below. Every line is "source says X"; adjudication
(`confirmed`/`refuted`/`uncertain`) is for an independent verifier who has not
seen this reasoning.

`priv/seed_data/bronx/bronx-park.json` has not been authored yet. This file is
its input, alongside whatever verifier artifact follows it.

Roster: `priv/seed_data/bronx_roster.json`, slug `bronx-park`, community
district 6, wave 2, `in_scope: true`.

## Search access — report this first

**WebSearch was attempted once and confirmed unavailable.** Query issued:
"Bronx Park New York Botanical Garden history". Result:

> "Web search was not performed: this session has used its web search budget
> (200 of 200 WebSearch calls)."

Zero WebSearch queries succeeded. Everything below was gathered via **WebFetch**
against Wikipedia, the New York Botanical Garden's own site, the Bronx Zoo's
own site (bronxzoo.com), and the Bronx River Alliance's own site
(bronxriver.org). WebFetch worked throughout on all of those and was not
throttled. `nycgovparks.org` returned HTTP 403 on every attempt, matching the
previous finder's report — see Dead ends. `web.archive.org` could not be
fetched at all by the WebFetch tool (tool-level refusal, not a site response).

No DOHMH lookups were needed for this neighborhood — Bronx Park has no
eateries or shops of its own outside the two marquee institutions, and every
place below is sourced from Wikipedia and/or the institutions' own sites, not
from an inspection dataset. **0 places are DOHMH-only.**

---

## Neighborhood-level history and orientation

- Bronx Park comprises 718 acres (291 hectares), "the eighth-largest park in New York City." — https://en.wikipedia.org/wiki/Bronx_Park
- The park is "bounded by Southern Boulevard to the southwest, Webster Avenue to the northwest, Gun Hill Road to the north, Bronx Park East to the east, and East 180th Street to the south." — https://en.wikipedia.org/wiki/Bronx_Park
- "Adjacent neighborhoods include Pelham Parkway to the east, West Farms to the south, and Belmont to the west." — https://en.wikipedia.org/wiki/Bronx_Park
- Much of the park's land was acquired through the 1884 New Parks Act. — https://en.wikipedia.org/wiki/Bronx_Park
- "Much of the land was acquired from Fordham University, which gave away the land on the condition that it be used as a zoo and botanical garden." — https://en.wikipedia.org/wiki/Bronx_Park
- The original 640 acres were acquired in 1888–1889. — https://en.wikipedia.org/wiki/Bronx_Park
- Additional sections came from the Lorillard family, who operated a snuff mill on the estate. — https://en.wikipedia.org/wiki/Bronx_Park
- The New York Botanical Garden occupies the park's northern section (250 acres, founded 1891); the Bronx Zoo occupies the southern section (265 acres, opened November 8, 1899). — https://en.wikipedia.org/wiki/Bronx_Park
- "Fordham Road runs east–west between the zoo and botanical garden, bisecting Bronx Park." — https://en.wikipedia.org/wiki/Bronx_Park
- The main watercourse is the Bronx River, flowing southward from Westchester County to the East River, running 2 miles (3.2 km) through the park. — https://en.wikipedia.org/wiki/Bronx_Park
- The Bronx River is approximately 24 miles (39 km) long overall and passes through Bronx Park, the New York Botanical Garden, and the Bronx Zoo. — https://en.wikipedia.org/wiki/Bronx_River
- A "Forever Wild" nature preserve covers 35 acres in the park's northern section. — https://en.wikipedia.org/wiki/Bronx_Park
- The park contains Lake Agassiz and Bronx Lake, plus multiple waterfalls and ponds. — https://en.wikipedia.org/wiki/Bronx_Park
- Fordham University's original Rose Hill campus spanned over 100 acres before its land was reduced by the transfer that became Bronx Park; the campus is now described as "immediately west of the Bronx Zoo and the New York Botanical Garden." — https://en.wikipedia.org/wiki/Fordham_University
- A 138-plot cemetery on the Fordham University campus was "relocated in 1890 from its original location at today's New York Botanical Garden." — https://en.wikipedia.org/wiki/Fordham_University

### Boundary flags for the verifier

**A three-way date conflict on when the Lorillard land was acquired**, not resolved here:
- Bronx Park's own Wikipedia article: original 640 acres acquired 1888–1889. — https://en.wikipedia.org/wiki/Bronx_Park
- Lorillard Snuff Mill's own Wikipedia article: "NYC purchased the property in 1884; the Botanical Garden acquired it in 1915." — https://en.wikipedia.org/wiki/Lorillard_Snuff_Mill
- Belmont's own Wikipedia article: the Zoo and Garden "having been developed on land the city acquired from the Lorillard Estate in 1870." — https://en.wikipedia.org/wiki/Belmont,_Bronx

**A boundary/containment conflict between two neighborhood articles**, not resolved here:
- Fordham (Bronx) states its own boundary as "roughly bordered by East 196th Street to the north, the Harlem River to the west, Fordham Road to the south, and Southern Boulevard to the east" — i.e., Southern Boulevard as its eastern edge, matching Bronx Park's own southwestern boundary claim. But the same article also states the New York Botanical Garden and Bronx Zoo "collectively occupy dozens of acres of land within the neighborhood [Fordham]" — which reads as placing part of the institutions inside Fordham rather than across the boundary from it. — https://en.wikipedia.org/wiki/Fordham,_Bronx
- Belmont's own article instead places the Zoo and Garden "at the northeastern edge of Belmont," with Bronx Park forming Belmont's "definitive eastern border," and separately states West Farms borders "Bronx Park to the north" as West Farms's own northern edge. — https://en.wikipedia.org/wiki/Belmont,_Bronx and https://en.wikipedia.org/wiki/West_Farms,_Bronx
- Net: three neighboring-neighborhood articles (Fordham, Belmont, West Farms) each claim a shared line with Bronx Park in a way that is mostly mutually consistent (Belmont/east, West Farms/north, per Bronx Park's own "Belmont to the west"/"West Farms to the south"), **except** Fordham's "occupy dozens of acres... within the neighborhood" line, which contradicts a shared-boundary reading. Flagging rather than picking, per site-builder.md's boundary rule and its instruction to let the verifier rule on which side of a line a place sits.

### Getting there — raw transit facts (not yet composed into prose)

Not researched in this pass — no subway/bus/train material was pulled for
Bronx Park itself. Fordham Road (which bisects the park) and Southern
Boulevard (its southwestern edge) are named above as boundary streets, not
verified as transit corridors. `searched: incomplete` for this subsection —
flagging so a later pass knows to pull the Bronx Zoo's and NYBG's own transit
pages (both list subway/bus directions) rather than starting cold.

---

## Places

### 1. Bronx Park (the park itself)

**What it is:** The city park containing both marquee institutions; the
neighborhood's anchor entry. `searched: complete`

- 718 acres (291 ha), the eighth-largest park in New York City. — https://en.wikipedia.org/wiki/Bronx_Park
- Bounded by Southern Boulevard (southwest), Webster Avenue (northwest), Gun Hill Road (north), Bronx Park East (east), and East 180th Street (south). — https://en.wikipedia.org/wiki/Bronx_Park
- Acquired via the 1884 New Parks Act, largely from Fordham University and the Lorillard family; original 640 acres acquired 1888–1889 (see the three-way date conflict flagged above). — https://en.wikipedia.org/wiki/Bronx_Park
- Contains the New York Botanical Garden (northern section) and the Bronx Zoo (southern section), divided by Fordham Road. — https://en.wikipedia.org/wiki/Bronx_Park
- The Bronx River runs 2 miles (3.2 km) through the park. — https://en.wikipedia.org/wiki/Bronx_Park
- Contains Lake Agassiz, Bronx Lake, multiple waterfalls and ponds, and a 35-acre "Forever Wild" nature preserve in its northern section. — https://en.wikipedia.org/wiki/Bronx_Park
- **Dead end, not a claim:** the official `nycgovparks.org` page for Bronx Park returned HTTP 403 to WebFetch and could not be independently corroborated against the city's own site in this pass — same failure the Mott Haven finder reported for `nycgovparks.org`.

### 2. New York Botanical Garden

**Marquee institution — must appear in exactly one seed file borough-wide; this is its home.** `searched: complete`

- Founded April 28, 1891, by act of the New York State Legislature. — https://en.wikipedia.org/wiki/New_York_Botanical_Garden
- Located in Bronx Park at Southern and Bedford Park Boulevards; 250 acres (100 ha). — https://en.wikipedia.org/wiki/New_York_Botanical_Garden
- Principal officers included Cornelius Vanderbilt II, Andrew Carnegie, and J.P. Morgan; Nathaniel Lord Britton served as secretary and led the fundraising campaign with his wife, Elizabeth Gertrude Britton, inspired by the Royal Botanic Gardens in London. — https://en.wikipedia.org/wiki/New_York_Botanical_Garden
- Designated a National Historic Landmark May 28, 1967, and listed on the National Register of Historic Places the same date (NRHP reference no. 67000009), address given as "Southern and Bedford Park Blvds." — https://en.wikipedia.org/wiki/New_York_Botanical_Garden and independently at https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx
- Over a million people visit annually, as of a 2016-dated figure; nearly 90,000 annual visitors are children from underserved communities and 3,000 are teachers from NYC public schools. — https://en.wikipedia.org/wiki/New_York_Botanical_Garden

**Enid A. Haupt Conservatory**, on the NYBG grounds:
- Groundbreaking January 3, 1899; completed 1902; cost $177,000; built by John R. Sheehan for the NYC Department of Parks and Recreation. — https://en.wikipedia.org/wiki/Enid_A._Haupt_Conservatory
- Designed by Lord & Burnham Co. (primary designer William R. Cobb) in Italian Renaissance style, modeled on the Palm House at the Royal Botanic Gardens, Kew, and Joseph Paxton's Crystal Palace. — https://en.wikipedia.org/wiki/Enid_A._Haupt_Conservatory
- Forms a 512-foot "C"-shape with an 11-pavilion layout; the central Palm House dome reaches 90 feet. — https://en.wikipedia.org/wiki/Enid_A._Haupt_Conservatory
- 1935 and 1950 renovations removed original decoration; 1978 restoration (led by Edward Larrabee Barnes) moved it back toward the original design, funded by philanthropist Enid Annenberg Haupt's $5 million gift plus a $5 million maintenance endowment; renamed for her in 1978. — https://en.wikipedia.org/wiki/Enid_A._Haupt_Conservatory
- 1993–1997: $25 million renovation by Beyer Blinder Belle Architects, adding computerized climate control. — https://en.wikipedia.org/wiki/Enid_A._Haupt_Conservatory
- **Landmark date conflict, flag for verifier:** designated a NYC landmark in 1976 per the Conservatory's own Wikipedia article, but "October 16, 1973" per the boroughwide landmarks list's entry for "The Conservatory (Palm House and Wings)." — https://en.wikipedia.org/wiki/Enid_A._Haupt_Conservatory vs. https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx

**Thain Family Forest**, on the NYBG grounds (has its own dedicated Wikipedia article):
- 50 acres (20 ha) along the Bronx River; old-growth, tracing to pre-colonial Lenapehoking. — https://en.wikipedia.org/wiki/Thain_Family_Forest
- Canopy includes oak, hemlock, beech, sweet gum, and mixed species; eastern hemlock was historically dominant but declined in the early 20th century from hemlock woolly adelgid and elongate hemlock scale infestation. — https://en.wikipedia.org/wiki/Thain_Family_Forest
- Originally called "Hemlock Grove," temporarily "Native Forest," later renamed Thain Family Forest. — https://en.wikipedia.org/wiki/Thain_Family_Forest
- NYC acquired 4,000 acres of parkland in 1888; the Botanical Garden site was established in 1895, chosen primarily for this forest. — https://en.wikipedia.org/wiki/Thain_Family_Forest
- Founding director Nathaniel Lord Britton called the site "the most precious natural possession of the city of New York." — https://en.wikipedia.org/wiki/Thain_Family_Forest
- 2011 restoration, supported by John and Carmen Thain, removed invasive species and expanded native vegetation. — https://en.wikipedia.org/wiki/Thain_Family_Forest
- **Note on internal date conflict within same article:** this article gives "1888: New York City acquired 4,000 acres as parkland," a different figure/date framing than Bronx Park's own article's "640 acres... 1888–1889" — both may be true of different acquisitions but are not reconciled here.

**LuEsther T. Mertz Library**, on the NYBG grounds (has its own dedicated Wikipedia article):
- Founded 1899; building designed by Robert W. Gibson in Renaissance Revival style. — https://en.wikipedia.org/wiki/LuEsther_T._Mertz_Library
- Originally called the Museum Building, then the Administration Building; renamed for donor LuEsther Mertz in the mid-1990s. — https://en.wikipedia.org/wiki/LuEsther_T._Mertz_Library
- Designated a National Historic Landmark contributing property May 28, 1967 (same date as NYBG's own NHL designation); made a NYC landmark March 24, 2009, per the library's own article, and the boroughwide landmarks list independently gives the same March 24, 2009 date for "New York Botanical Garden Museum (Library) Building, Fountain of Life, and Tulip Tree Allee." — https://en.wikipedia.org/wiki/LuEsther_T._Mertz_Library and https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- Holdings include two copies of the *Circa Instans* (circa 1190 and 1275); a 2002 *New York Times* article stated the collection held "75 percent of all systematic botany literature in the world and 70 percent of all flora that had been published." — https://en.wikipedia.org/wiki/LuEsther_T._Mertz_Library
- The William & Lynda Steere Herbarium, housed at NYBG's International Plant Science Center, holds approximately 7.2–7.8 million specimens, founded 1891, with major acquisitions including the Columbia College herbarium (1895, ~600,000 specimens including the herbaria of John Torrey and C.F. Meissner). — https://en.wikipedia.org/wiki/New_York_Botanical_Garden
- **Completion-date conflict, flag for verifier:** the library building's completion is given as "1900" on NYBG's general Wikipedia article versus "completed in 1901" on the library's own dedicated Wikipedia article. — https://en.wikipedia.org/wiki/New_York_Botanical_Garden vs. https://en.wikipedia.org/wiki/LuEsther_T._Mertz_Library

**Peggy Rockefeller Rose Garden**, on the NYBG grounds (no dedicated Wikipedia article — sourced only from NYBG's general article):
- Originally designed by Beatrix Jones Farrand in 1916; renovated in 2007. — https://en.wikipedia.org/wiki/New_York_Botanical_Garden
- NYBG's own site independently describes the garden as currently featuring "hundreds of unique rose varieties." — https://www.nybg.org/about/history/

**Lorillard Snuff Mill** on the NYBG grounds — see item 4 below; this is discussed there as a possible standalone place rather than folded fully into this block, with the reasoning for that split stated there.

Other NYBG features found but not built into standalone claims beyond naming
them (sourced from https://en.wikipedia.org/wiki/New_York_Botanical_Garden):
Leon Levy Visitor Center (opened 2004, $21 million); Pfizer Plant Research
Laboratory (opened 2006); International Plant Science Center (opened 2002);
Fountain of Life (sculptor Charles Tefft, 1905 — distinct from the Bronx Zoo's
separately-landmarked Rockefeller Fountain, see item 3); Everett Children's
Garden (opened 1998); Hudson Garden Grill restaurant (opened 2015); Edible
Academy (opened 2018).

### 3. Bronx Zoo

**Marquee institution — must appear in exactly one seed file borough-wide; this is its home.** `searched: complete`

- Address: 2300 Southern Boulevard, Bronx Park, Bronx, NY 10460; 265 acres (107 ha), separated by the Bronx River. — https://en.wikipedia.org/wiki/Bronx_Zoo
- The New York Zoological Society (later renamed the Wildlife Conservation Society, WCS) was founded in 1895 by members of the Boone and Crockett Club, principally Madison Grant and C. Grant LaFarge. — https://en.wikipedia.org/wiki/Bronx_Zoo
- Opened to the public November 8, 1899, with 843 animals in 22 exhibits. — https://en.wikipedia.org/wiki/Bronx_Zoo
- William Temple Hornaday served as first director for 30 years. — https://en.wikipedia.org/wiki/Bronx_Zoo
- Currently managed by the Wildlife Conservation Society and accredited by the Association of Zoos and Aquariums. — https://en.wikipedia.org/wiki/Bronx_Zoo
- As of 2010, approximately 4,000 animals representing 650 species; average annual visitors were 2.1 million as of 2009. — https://en.wikipedia.org/wiki/Bronx_Zoo

**Astor Court** (no dedicated Wikipedia article — the title `Astor_Court_(Bronx_Zoo)` redirects to the main Bronx Zoo article, and `bronxzoo.com/exhibits/astor-court` 404'd; both are dead ends, not claims):
- Original permanent buildings designed by Heins & LaFarge as Beaux-Arts pavilions surrounding a circular sea lion pool. — https://en.wikipedia.org/wiki/Bronx_Zoo
- Designated a NYC landmark June 20, 2000 (a 1966 designation attempt had failed), independently corroborated by the boroughwide landmarks list's entry "Baird (Astor Court), New York Zoological Park (Bronx Zoo) — Designated: June 20, 2000." — https://en.wikipedia.org/wiki/Bronx_Zoo and https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- The Rainey Memorial Gates within Astor Court were designed by sculptor Paul Manship, dedicated 1934 as a memorial to big-game hunter Paul James Rainey, and listed on the National Register of Historic Places in 1972 — independently corroborated by the landmarks list giving a NYC landmark designation date of January 11, 1967 for the same gates (two different designations, two different bodies/dates, not a contradiction). — https://en.wikipedia.org/wiki/Bronx_Zoo and https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- The Rockefeller Fountain at the Bronx Zoo was designated a NYC landmark February 20, 1968, per the boroughwide landmarks list — a different fountain from NYBG's Fountain of Life (1905, sculptor Charles Tefft). — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- Zoo Center: built 1908, Beaux-Arts style, originally designed as the Elephant House; landmarked 2000. — https://en.wikipedia.org/wiki/Bronx_Zoo

**Congo Gorilla Forest** (own official page, no dedicated Wikipedia article found in this pass — treated here as a feature of the zoo, not a separate place; see the note on why below):
- 6.5 acres, with a visitor trail approximately one-third of a mile long. — https://bronxzoo.com/exhibits/congo-gorilla-forest
- Includes approximately 400 plant species and wildlife including okapis, red river hogs, mandrills, Congo peafowl, African pygmy geese, western long-tailed hornbills, fire skinks, and Nile monitors, alongside western lowland gorillas. — https://bronxzoo.com/exhibits/congo-gorilla-forest
- WCS scientists began field study of mountain gorillas in 1959; the exhibit was built to connect that field research to zoo visitors. — https://bronxzoo.com/exhibits/congo-gorilla-forest
- Separately, per Wikipedia's Bronx Zoo article: opened 1999, and had received 7 million visits by 2009. — https://en.wikipedia.org/wiki/Bronx_Zoo
- Open March through December; animals may be indoors but viewable in colder months. — https://bronxzoo.com/exhibits/congo-gorilla-forest

**JungleWorld** (own official page; no dedicated Wikipedia article exists — `en.wikipedia.org/wiki/JungleWorld` 404'd, a dead end not a claim):
- Showcases "the jungles of Asia," featuring white-cheeked gibbon, Indian gharial, tapir, Asian small-clawed otters, Rodrigues fruit bats, silver leaf langur, Waldrapp ibis, and tropical birds including storks, lorikeets, Javan pond herons, Nicobar pigeons, and great argus pheasants. — https://bronxzoo.com/exhibits/jungleworld
- WCS partners with the Madras Crocodile Bank Trust Center for Herpetology on gharial conservation connected to this exhibit. — https://bronxzoo.com/exhibits/jungleworld
- No opening date was found for this exhibit in this pass (not stated on the official page fetched; no dedicated Wikipedia article to cross-check).

**Other Bronx Zoo milestones and features** (sourced from https://en.wikipedia.org/wiki/Bronx_Zoo unless noted):
Himalayan Highlands opened June 27, 1986; Gelada Reserve (originally Baboon Reserve) opened 1990, won an AZA Exhibit Award 1991; Madagascar! opened June 20, 2008 in the former Lion House (which had opened in 1903); Tiger Mountain opened May 15, 2003, won an AZA Exhibit Award 2004; World of Darkness opened 1969 as (per the article) the world's first major exhibit designed specifically for nocturnal animals, closed 2009 amid budget cuts, reopened July 12, 2025; American Bison Society founded at the zoo in 1905, and in 1913 fourteen bison were sent from the zoo to Montana's National Bison Range and to Wind Cave National Park; first US exhibitor of shoebills in 1926 (simultaneous with the Smithsonian) and of Komodo dragons the same year; first in North America to exhibit an okapi, 1937; the zoo held four thylacines between 1902 and 1919, the last dying September 13, 1919.

**Why Astor Court, Congo Gorilla Forest and JungleWorld are treated as features of the Bronx Zoo place record rather than standalone places:** none has independent visitability apart from a Bronx Zoo admission ticket, none has its own address distinct from the zoo's, and (per the neighborhood brief's caution about the zoo-exhibit duplication failure mode seen elsewhere in this corpus) each is inseparable from the parent institution's single gate and single ticket. This is a finder's descriptive note for the verifier and author to weigh, not a verdict.

### 4. Lorillard Snuff Mill (Lillian and Amy Goldman Stone Mill)

**What it is:** A stone snuff-processing mill on the Bronx River, on NYBG's grounds but with independent, older landmark status than the Garden itself. `searched: complete`

- Built circa 1840 by the P. Lorillard Company beside the Bronx River, described by its own Wikipedia article as "the oldest existing tobacco manufacturing building in the United States." — https://en.wikipedia.org/wiki/Lorillard_Snuff_Mill
- Constructed of locally-quarried schist rock. — https://en.wikipedia.org/wiki/Lorillard_Snuff_Mill
- The Lorillard firm had relocated operations to this Bronx site in 1792 and abandoned this mill in 1870 when it moved to Jersey City. — https://en.wikipedia.org/wiki/Lorillard_Snuff_Mill
- Designated a New York City Landmark April 19, 1966 — independently corroborated by the boroughwide landmarks list, which gives the same name and date. — https://en.wikipedia.org/wiki/Lorillard_Snuff_Mill and https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- Designated a National Historic Landmark and listed on the National Register of Historic Places, both December 22, 1977 (NRHP reference no. 77000935); also listed on the New York State Register June 23, 1980. — https://en.wikipedia.org/wiki/Lorillard_Snuff_Mill
- Renovated 1952–54 (adding a café, patio and meeting room); underwent a $10.5 million restoration completed in 2010. — https://en.wikipedia.org/wiki/Lorillard_Snuff_Mill
- Now known as the Lillian and Amy Goldman Stone Mill; currently serves as staff offices and a catering facility for the New York Botanical Garden. — https://en.wikipedia.org/wiki/Lorillard_Snuff_Mill
- Located on Snuff Mill Road within the New York Botanical Garden grounds. — https://en.wikipedia.org/wiki/Lorillard_Snuff_Mill

**Why this might stand alone rather than fold into the NYBG block:** it predates the Garden's own 1891 founding by roughly half a century, carries its own National Historic Landmark designation independent of NYBG's 1967 NHL designation, and its own NYC landmark designation (1966) predates the Garden's Conservatory (1973/1976, disputed above) and Library (2009) designations by years. It is also the one feature on NYBG's grounds with a clear non-garden institutional history (a 19th-century tobacco factory, not something NYBG built). Against that: it currently functions only as NYBG staff offices and a catering facility, not as an independently-ticketed or independently-accessible visitor destination — a visitor reaches it only by first entering the Garden. This is a finder's observation for the verifier to weigh, not a recommendation either way.

- **Note on internal source conflict:** this same Wikipedia article states NYC purchased the property in 1884 and that "the Botanical Garden acquired it in 1915" — a different date and a different acquiring party than Bronx Park's own article's "640 acres... 1888–1889" or Belmont's "the city acquired [it] from the Lorillard Estate in 1870." All three appear above under the neighborhood-level boundary flags; not reconciled here.

### 5. Bronx River Forest

**What it is:** A NYC Parks-managed natural area along the Bronx River corridor, described by the Bronx River Alliance (a non-Wikipedia, non-DOHMH source) as reaching into the New York Botanical Garden at its southern extent. `searched: incomplete` — see caveats below.

- "Situated along the Bronx River corridor in the Bronx, with its southern extent reaching into the New York Botanical Garden." — https://bronxriver.org/bronx-river-forest
- Contains many trees exceeding 100 years in age; described as "a remnant of the original forests and floodplains that once blanketed the Bronx River corridor." — https://bronxriver.org/bronx-river-forest
- Includes upgraded paths, nature trails, boardwalks and overlooks. — https://bronxriver.org/bronx-river-forest
- Managed by the Bronx River Alliance in partnership with the NYC Department of Parks & Recreation and, per the Alliance's own site, over one hundred partner organizations; recent initiatives have focused on floodplain restoration, habitat expansion, and public-access infrastructure. — https://bronxriver.org/bronx-river-forest
- **No acreage, precise boundary, or founding/designation date was found for this area in this pass** — the source page fetched does not give one, and `nycgovparks.org`'s page for it (if any) was not reachable (403, same failure as Bronx Park's own page).
- **Open question for the verifier, not resolved here:** whether "Bronx River Forest" names a NYC Parks unit distinct from Bronx Park itself (i.e., a separately-mapped park property along the river, north of Bronx Park's own boundary) or whether it is another name for, or substantially overlaps with, the 35-acre "Forever Wild" preserve inside Bronx Park's own northern section that Bronx Park's Wikipedia article describes, or with NYBG's internal Thain Family Forest. The three are described independently by three different sources (Bronx Park's Wikipedia article, the Thain Family Forest Wikipedia article, and bronxriver.org) and nothing fetched in this pass states how they relate to one another. Treat as three distinct claims about possibly-overlapping geography, not as three confirmations of one thing.

---

## Candidates investigated and NOT included — read before re-researching these

- **Rocking Stone (Bronx Zoo glacial erratic).** A remembered candidate. `en.wikipedia.org/wiki/Rocking_Stone_(Bronx_Zoo)` 404'd. No corrected title found without WebSearch. Not included; not verified to exist under any title.
- **Astor Court, Congo Gorilla Forest, JungleWorld as standalone places.** Investigated and written up under item 3 (Bronx Zoo) instead, with the reasoning for treating them as features rather than separate places stated there. Not "not included" outright — their facts are captured, just not as independent place blocks.
- **Peggy Rockefeller Rose Garden as a standalone place.** No dedicated Wikipedia article (`en.wikipedia.org/wiki/Peggy_Rockefeller_Rose_Garden` 404'd); everything found is folded into the NYBG block above rather than written up separately, for lack of independent material beyond NYBG's own two-source description.

## Dead ends — for a later pass, not for publication

- `nycgovparks.org/parks/bronx-park` — HTTP 403.
- `nycgovparks.org/parks/bronx-river-forest` — HTTP 403.
- `web.archive.org` (any URL) — the WebFetch tool itself refused these ("Claude Code is unable to fetch from web.archive.org"), not a site-side error; do not retry the same way.
- A guessed Landmarks Preservation Commission PDF URL (`s-media.nyc.gov/agencies/lpc/lp/0709.pdf`) exceeded the fetch tool's 10 MB content-length limit before any content was returned; the guess was also unconfirmed as the right document. Do not reuse this URL pattern blind — find the correct LPC report URL first if LPC primary-source detail is wanted later.
- `bronxzoo.com/exhibits/astor-court` — HTTP 404.
- `en.wikipedia.org/wiki/JungleWorld` — HTTP 404 (no dedicated article).
- `en.wikipedia.org/wiki/Astor_Court_(Bronx_Zoo)` — redirects to the main Bronx Zoo article (not a 404, but confirms no dedicated article exists).
- `en.wikipedia.org/wiki/Peggy_Rockefeller_Rose_Garden` — HTTP 404.
- `en.wikipedia.org/wiki/Rocking_Stone_(Bronx_Zoo)` — HTTP 404.
- `en.wikipedia.org/wiki/Bronx_River_Forest` — HTTP 404 (no dedicated article; used bronxriver.org instead).
- "Getting there" transit facts for Bronx Park were not researched in this pass — see the note under that heading above. A later pass should pull transit material from the Bronx Zoo's and NYBG's own visitor-information pages.

## Dedup check against the existing corpus (rung b, site-builder.md §7)

Checked `priv/seed_data/bronx/belmont.json` (the only other shipped Bronx
file) directly: it contains **no place records** for the New York Botanical
Garden or the Bronx Zoo — both are mentioned only inside two `links[].note`
strings (a `see-also` note about Belmont being an early "Little Italy," and a
`shared-history` note observing that Belmont was settled by the immigrants
"who built the Zoo and the Botanical Garden"). Neither note is a place
record, so no duplication exists between Belmont and this file as things
stand. Also checked `priv/seed_data/bronx/mott-haven.json`: no overlapping
addresses or names. No existing place record anywhere in the corpus collides
with any address or institution named above.

## Summary counts

- Places researched and written up with citations: **5** — Bronx Park (the
  park), New York Botanical Garden, Bronx Zoo, Lorillard Snuff Mill, Bronx
  River Forest. All `searched: complete` except Bronx River Forest, which is
  `searched: incomplete` on acreage/boundary/designation specifics (its
  identity and general description are complete).
- Sub-features documented within the two marquee institutions but not
  proposed as standalone places: Enid A. Haupt Conservatory, Thain Family
  Forest, LuEsther T. Mertz Library, Peggy Rockefeller Rose Garden, William &
  Lynda Steere Herbarium (all NYBG); Astor Court, Rainey Memorial Gates,
  Rockefeller Fountain, Zoo Center, Congo Gorilla Forest, JungleWorld, and
  several dated exhibit/milestone facts (all Bronx Zoo).
- Distinct sourced claims across the neighborhood-level section and the 5
  place blocks: **approximately 90** individual citation lines.
- DOHMH-only places: **0**.
- Flags left open for the verifier: the three-way Lorillard land-acquisition
  date conflict (1870/1884/1888–89); the Fordham-neighborhood boundary
  contradiction (shared border vs. "occupies... within the neighborhood");
  the Enid A. Haupt Conservatory's landmark-date conflict (1973 vs. 1976);
  the Mertz Library building's completion-date conflict (1900 vs. 1901); the
  unresolved relationship between Bronx Park's "Forever Wild" preserve, NYBG's
  Thain Family Forest, and the separately-described "Bronx River Forest";
  and whether the Lorillard Snuff Mill should ship as its own place or fold
  into the NYBG block, argued both ways above but not decided here.

---

## TOP-UP — scoped re-dispatch, two gaps

Appended after the initial pass above. Same role: FINDER only, no verdicts.
WebSearch was still unavailable in this pass (not re-attempted; the
coordinator's dispatch stated it remains exhausted). Everything below is
WebFetch against Wikipedia, bronxzoo.com and nybg.org.

### Gap 1 — Getting there: transit facts

**Subway**

- The Bronx Zoo's own transit page: "#2 train to Pelham Parkway" reaches the "Bronx River entrance (Gate B)" by walking west from the station. — https://bronxzoo.com/plan-your-visit/getting-here/transit
- The same page separately lists "#2 or 5 subway to West Farms Square/E Tremont or E180 Street or Pelham Parkway Station" without tying a specific one of these three to a specific gate. — https://bronxzoo.com/plan-your-visit/getting-here/transit
- NYBG's own directions page: lines B, D and 4 to the Bedford Park Blvd station, then either the Bx25 or Bx26 bus east, or on foot down Bedford Park Blvd to Southern Blvd, reaches the Mosholu Entrance. — https://www.nybg.org/visit/how-to-get-here/
- NYBG's own directions page: line 2 to the Allerton Ave station, then west on Allerton, then south on Bronx Park East to Waring Ave, reaches the East Gate, which the page states is pedestrian and daytime-access only. — https://www.nybg.org/visit/how-to-get-here/

**Metro-North**

- A dedicated Metro-North station named "Botanical Garden" sits on the Harlem Line at 2999 Southern Boulevard in Bedford Park, described by its own Wikipedia article as "adjacent to northern Bronx Park and the New York Botanical Garden," just north of Southern Boulevard's intersection with Bedford Park Boulevard (East 200th Street). It has two high-level side platforms serving the Harlem Line's outer tracks, and connects to the Bx25, Bx26, Bx41 and Bx41 SBS buses. — https://en.wikipedia.org/wiki/Botanical_Garden_(Metro-North_station)
- NYBG's own directions page independently names the same station ("Harlem local line" to "Botanical Garden Station") and states it serves the Mosholu Entrance, directly across the street from the station. — https://www.nybg.org/visit/how-to-get-here/
- The Bronx Zoo's own transit page names a *different* Metro-North station for zoo access: the Harlem Line to Fordham station, then the Bx9 bus eastward to 183rd Street and Southern Blvd. — https://bronxzoo.com/plan-your-visit/getting-here/transit

**Bus**

- NYBG's own page: Bx19, Bx12, Bx22, Bx9 and Bx17 reach the Main Entrance (2900 Southern Blvd); Bx25, Bx26, Bx41 and Bx34 reach the Mosholu Entrance (2950 Southern Blvd). — https://www.nybg.org/visit/how-to-get-here/
- The Bronx Zoo's own page: Bx9 or Bx19 to 183rd Street and Southern Blvd reaches the Southern Boulevard pedestrian entrance (Gate C); Bx12 or Bx22 to Fordham Road and Southern Blvd, then five blocks south on foot, also reaches Gate C. — https://bronxzoo.com/plan-your-visit/getting-here/transit
- The Bronx Zoo's own page: the Q44 bus from Queens to 180th Street and Boston Road, then north on foot, reaches the Asia gate entrance (Gate A). — https://bronxzoo.com/plan-your-visit/getting-here/transit
- The Bronx Zoo's own page: the BxM11 express bus, which stops along Madison Avenue between 26th and 99th Streets in Manhattan, "travels directly to the Zoo's Bronx River entrance (Gate B)." — https://bronxzoo.com/plan-your-visit/getting-here/transit

**Ferry — dead end, not a claim.** No source fetched in either pass names a
ferry landing serving Bronx Park, NYBG or the Bronx Zoo. NYC Ferry is not
mentioned on either institution's own transit page. Stated plainly as a gap,
not as a claim that no ferry service exists anywhere near the area.

**Garden entrances named, for reference against the above:** Main Entrance
(2900 Southern Blvd, vehicles/buses), Mosholu Entrance (2950 Southern Blvd,
transit arrivals), Everett Garden Gate (Southern Blvd at Fordham, school
groups only), East Gate (Waring Ave & Bronx Park East, pedestrian, daytime
only). — https://www.nybg.org/visit/how-to-get-here/

**Zoo gates named, for reference against the above:** Bronx River entrance
(Gate B), Southern Boulevard pedestrian entrance (Gate C), Asia gate entrance
(Gate A), and a separate car-service drop-off at the Southern Boulevard Gate
(Southern Blvd and 185th St). — https://bronxzoo.com/plan-your-visit/getting-here/transit

**Trip durations were deliberately not carried into any claim above.** Both
official pages state travel times and distances-in-minutes throughout (e.g.
NYBG's page states the Metro-North trip from Grand Central and states a
walking-time estimate for the Bedford Park Blvd route); none of that is
reproduced here per the categorical ban.

### Gap 2 — thematic link candidates

**WCS tie: supportable.** The Bronx Zoo's operator side is independently
confirmed by a second Wikipedia article, not just the Bronx Zoo article
already cited in the main pass:

- "WCS is headquartered at the Bronx Zoo in New York City." — https://en.wikipedia.org/wiki/Wildlife_Conservation_Society
- The same article states WCS operates five NYC wildlife facilities: the Bronx Zoo (Bronx), Central Park Zoo (Manhattan), New York Aquarium (Brooklyn), Prospect Park Zoo (Brooklyn) and Queens Zoo (Queens), together drawing "4 million visitors per year," all AZA-accredited. — https://en.wikipedia.org/wiki/Wildlife_Conservation_Society
- This corroborates, from a second independent article, the main pass's already-cited fact that the Bronx Zoo "currently managed by the Wildlife Conservation Society" and that WCS was originally founded in 1895 as the New York Zoological Society. — https://en.wikipedia.org/wiki/Bronx_Zoo
- The target side is already shipped and verified: `priv/seed_data/brooklyn/coney-island.json`'s `place:new-york-aquarium` record states "A Wildlife Conservation Society aquarium that opened at this Coney Island address on June 6, 1957, having begun at Castle Garden in Battery Park in 1896."
- **Net: a `place:new-york-aquarium` link from Bronx Park, noting the shared WCS operator, is supported on both ends by independently-sourced facts** — the Bronx Zoo side confirmed by two separate Wikipedia articles in this file, the aquarium side already a shipped, verified record.
- No shipped Brooklyn or Manhattan guide covers the Central Park Zoo, Prospect Park Zoo or Queens Zoo as a place record (checked: no `central-park-zoo`, `prospect-park-zoo` or `queens-zoo` slug exists anywhere in `priv/seed_data/`, and `priv/seed_data/queens/` holds no guide files), so those three are not viable link targets regardless of the WCS fact — there is nothing on the other end for `Links.resolve!` to find.

**Botanic-garden tie: not supportable, dropped.** Checked
`en.wikipedia.org/wiki/Brooklyn_Botanic_Garden` specifically for a founder,
charter, funding or modeling relationship to the New York Botanical Garden.
Found: Brooklyn Botanic Garden was founded May 13, 1911, designated by the
New York State Legislature in 1897, operated by the Brooklyn Institute of
Arts and Sciences, first director C. Stuart Gager (hired March 1910),
landscape by the Olmsted Brothers, buildings by McKim, Mead & White. The only
sentence connecting the two gardens at all is a visitor-count comparison —
"BBG accommodated 1.35 million visitors annually, more than the larger New
York Botanical Garden did, but received less funding from the city" — which
is a statistical aside, not an institutional connection. No shared founder,
no modeling relationship, no charter or funding tie was found. Per the
coordinator's instruction to hold this avenue to a harder standard than "both
are botanical gardens," **this avenue is dropped rather than forced.**

**Bronx River tie: not pursued.** Not checked against the shipped Brooklyn/
Manhattan/Connecticut corpus in this pass for time reasons — the Bronx River
does not reach Brooklyn or Manhattan at all (it flows from Westchester County
to the East River, entering at the Bronx/Westchester line per
https://en.wikipedia.org/wiki/Bronx_River, already cited in the main pass),
so a same-river tie to a shipped guide outside the Bronx looks unlikely on
its face, but this was not independently verified against the corpus and
should not be treated as ruled out.

**Recommended net for the coordinator's ruling:** one supportable thematic
link (`place:new-york-aquarium`, WCS operator tie) plus the one adjacency
link (Belmont) already available from the main pass's verdicts gives two
candidate links, still short of the three-link orientation floor if both
survive verification. The botanic-garden avenue was checked and correctly
yields nothing to cite.
