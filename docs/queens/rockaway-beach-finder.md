# Rockaway Beach, Queens — FINDER candidate list

Role: FINDER. Nothing in this document is verified. No verdicts, no confirmations, no adjudication.
Every numbered item below is a **CANDIDATE** awaiting the verifier.

---

## 0. METHODOLOGY AND ITS LIMITS — READ BEFORE USING ANY QUOTE

**0.1 — WebSearch was unavailable to this agent.** The session's WebSearch budget (200/200) was
already exhausted by sibling agents before my first search returned. Every item below was gathered
by **WebFetch against URLs I constructed**, plus **Wikipedia's own full-text search endpoint**
(`en.wikipedia.org/w/index.php?search=...&fulltext=1`), which I used as a discovery substitute.
Coverage is therefore shaped by what I could reach, not by what a general search would surface.
Under-covered as a direct result: local news reporting, small businesses, community organizations,
recent (post-2020) developments, and anything whose only home is a local blog or Instagram.
Treat the absence of a topic here as evidence about my method, not about the neighborhood.

**0.2 — QUOTATION CAVEAT. This is the most important line in this document.**
WebFetch does not return raw page text. It returns a **summary written by a smaller extraction
model**, with quoted fragments embedded, and that model enforced a **~125-character cap on
verbatim quotation** (it told me so explicitly, twice, when I asked for whole sections). The strings
in `"double quotes"` below are reproduced **exactly as that extraction returned them**, but except
where noted in 0.3 **I did not see the underlying page** and therefore **cannot personally attest
that they are verbatim from the source**. The verifier must re-open each URL and confirm wording
before any quote is used as a quote. Where I am paraphrasing, I write **(paraphrase)**.

**0.3 — EXCEPTION: material I read with my own eyes.** Two NRHP nomination forms were downloaded as
PDFs and read directly, page by page, as rendered document images. Everything in **§3 (Rockaway
Courthouse)** and **§4 (Temple of Israel Synagogue)** attributed to "NRHP nomination" I read myself.
Those quotes I *can* attest are verbatim. They are also the best sources in this document: primary,
institutional, signed by the NY SHPO, and accepted by the National Park Service. The verifier should
still spot-check, but these are a different evidentiary tier from everything else.
- Rockaway Courthouse nomination (ref. #13001155): https://npgallery.nps.gov/NRHP/GetAsset/NRHP/13001155_text
- Temple of Israel Synagogue nomination (ref. #13001156): https://npgallery.nps.gov/NRHP/GetAsset/NRHP/13001156_text

**0.4 — One long verbatim block.** §2 reproduces the Wikipedia article's entire History section.
The extraction model returned this one at full length when asked as a CC-BY-SA reproduction rather
than as "quotes." I believe it is faithful, but I did not see the raw wikitext, so the same caveat
in 0.2 applies — it is *probably* verbatim, not *attestably* verbatim. Flagged again in place.

**0.5 — Institutional sources I tried and could not reach.**
- `nycgovparks.org/parks/rockaway-beach-and-boardwalk` → **HTTP 403**
- `nycgovparks.org/parks/rockaway-beach-and-boardwalk/facilities/beaches` → **HTTP 403**
- `nycgovparks.org/parks/Q014/history` → **HTTP 403**
- `communityprofiles.planning.nyc.gov/queens/14` → returned only a JS shell, no data
- `nyc.gov/site/queenscb14/about/district-profile.page` → **HTTP 404**
- `nps.gov/gate/planyourvisit/jacob-riis-park.htm` → **HTTP 404**
- `rockawaybrewco.com` → **TLS certificate expired**
NYC Parks is the single most important missing source. Every beach/boardwalk fact below is
therefore Wikipedia-sourced when it should be Parks-sourced. **The verifier should re-attempt
nycgovparks.org**, which may respond to a different client.

**0.6 — Source quality, stated plainly.** Aside from the two NRHP nominations, the Queens Public
Library branch page, the NYC Ferry official route page, and three business websites, this document
is predominantly **Wikipedia** — a tertiary aggregator. This falls short of the stated preference
for primary and institutional sources, and it is a direct consequence of 0.1 and 0.5.

**0.7 — RESTAURANTS AND BUSINESSES: DOHMH/DCWP DISCLOSURE.** The task requires an explicit statement.
**No candidate business in this document rests on a DOHMH or DCWP inspection dataset.** I did not
consult, and did not use, any inspection dataset. The three businesses in §10 are each sourced to
**the business's own website**. That is a weak source in a different way (self-description, no
independent confirmation of operating status or opening date) and the verifier should treat it as
such — but it is not an inspection-dataset row, and the constraint that would attach to one does
not attach here.

---

## 1. THE BOUNDARY PROBLEM — READ THIS BEFORE RECORDING ANY PLACE

This is the central hazard for this page and it is worse than "sources disagree at the edges."

Rockaway Beach is not a neighborhood with one accepted street range. **The sources I reached give at
least four mutually incompatible eastern and western limits**, and — critically — **two of them come
from the same Wikipedia article**. On top of that, the neighborhood is internally subdivided into
named "local districts" (Holland, Hammels, Seaside) whose own articles sometimes describe them as
*inside* Rockaway Beach and sometimes as *adjacent to* it.

I am not resolving any of this. Below is the raw disagreement.

### 1.1 — Competing street ranges for Rockaway Beach itself

**F-B1.** Source: Wikipedia, *Rockaway, Queens* — communities list, as extracted on my **first** fetch.
> "Rockaway Beach, from 77th Street to Beach 97th Street"

and in the same list:
> "Rockaway Park, from Beach 98th Street to Beach 126th Street"
> "Arverne, from Beach 56th Street to Beach 77th Street"

https://en.wikipedia.org/wiki/Rockaway,_Queens

**F-B2.** Source: Wikipedia, *Rockaway, Queens* — **same article**, as extracted on my **second**
fetch (via `action=raw`), which returned a differently-organized list:
> Rockaway Beach (Beach 73rd–108th Streets)
> Rockaway Park (Beach 105th–126th Streets)
> Seaside (Beach 84th–105th Streets)
> Hammels (Beach 84th Street area)
> Arverne (Beach 56th–79th Streets)

https://en.wikipedia.org/w/index.php?title=Rockaway,_Queens&action=raw

**FLAG — F-B1 and F-B2 cannot both be right and they are the same article.** Either the article
contains two inconsistent lists (a prose list and an infobox/table), or one of the two extractions
is unreliable. **The verifier must open this article directly and determine which.** This single
question determines whether Beach 98th–108th Streets — which includes the Playland site, the Beach
98th Street subway station, and the Beach 97th Street concession — belong to this page at all.

**F-B3.** Source: NRHP nomination, *Temple of Israel Synagogue*, Section 8 page 2. **I read this
myself; this quote is attestably verbatim.**
> "This area of the Rockaways, between Beach 84th Street and Beach 107th Street became the heart of
> Rockaway Beach."

A third range again — and note it starts at Beach 84th, which would put Beach 73rd–83rd *outside*
the "heart," though "heart" is not the same claim as "boundary."

**F-B4.** Source: Wikipedia, *Rockaway Beach, Queens* — lead paragraph. This one I have in wikitext
form and it gives **no street numbers at all**, only neighbors:
> "The neighborhood is bounded by [[Arverne, Queens|Arverne]] to the east and [[Rockaway Park,
> Queens|Rockaway Park]] to the west."

Note what this omits: **Seaside is not mentioned**, even though the *Seaside, Queens* article claims
to sit between Rockaway Beach and Rockaway Park (F-B7).

https://en.wikipedia.org/wiki/Rockaway_Beach,_Queens

**F-B5.** Source: NRHP nomination, *Rockaway Courthouse*, Section 7 page 1. **Attestably verbatim.**
> "The Rockaway Beach neighborhood is centrally located on the peninsula, and is comprised of
> various local districts that are named based on historical settlement patterns."

This is the most useful framing sentence I found and it is from the best source. It says Rockaway
Beach is a **container** for smaller named districts — which supports treating Holland and Hammels
as inside it, and makes the Seaside question sharper rather than settling it.

### 1.2 — The internal districts: in, or next to?

**F-B6.** Source: Wikipedia, *Hammels, Queens*. Explicitly **inside**:
> "Hammels is an area within Rockaway Beach on the Rockaway Peninsula in the New York City borough
> of Queens."

and:
> "west of Arverne and east of Seaside, and is centered on Beach 84th Street"

https://en.wikipedia.org/wiki/Hammels,_Queens

**F-B7.** Source: Wikipedia, *Seaside, Queens*. Explicitly **beside**, not inside:
> "Seaside is a section of the Rockaway Peninsula in the New York City borough of Queens."
> "bordered by the Rockaway Beach neighborhood on the east, and by the neighborhood of Rockaway
> Park on the west"

The same page assigns Seaside ZIP **11694** (Rockaway Park's ZIP), not 11693 (Rockaway Beach's).

https://en.wikipedia.org/wiki/Seaside,_Queens

**F-B8.** Source: Wikipedia, *Rockaways' Playland*. Puts Playland **in Seaside, inside Rockaway
Beach** — i.e. the opposite of F-B7:
> The park was situated in Rockaway Beach, specifically in the Seaside neighborhood. **(paraphrase —
> the extraction rendered this as its own sentence, not as a quote)**

https://en.wikipedia.org/wiki/Rockaways%27_Playland

**FLAG — F-B7 vs F-B8 is a direct contradiction about Seaside.** Do not resolve it here.

**F-B9.** Source: NRHP nomination, *Rockaway Courthouse*, Section 7 page 1. **Attestably verbatim.**
Holland treated as inside:
> "Located in the Hollands area of Rockaway Beach, the Courthouse served as the Magistrate's and
> Municipal Courts of Queens County, beginning in 1932."

**F-B10.** Source: NRHP nomination, *Rockaway Courthouse*, Section 8 page 1. **Attestably verbatim.**
The Holland family's original purchase, which defines the Holland district's historical extent:
> "They had purchased what is now Beach 88th to Beach 95th, which was solely occupied by a hotel
> that catered to summer visitors."

and:
> "Michael Jr. grew to become the first postmaster of the area that is today bounded by Beach 88th
> Street, Beach 100th street, Jamaica Bay and the Atlantic Ocean."

**F-B11.** Source: NRHP nomination, *Temple of Israel Synagogue*, Section 8 page 2. **Attestably
verbatim.** Seaside and Hammels described as peer communities, with ethnic character:
> "The communities of Seaside and Hammels had predominantly Irish and German-Jewish populations.
> Seaside acquired the nickname 'Irish Town' due to the scores of Irish immigrants drawn to the area
> to work on the railroads and in the amusement industry."

### 1.3 — Peninsula-scale guardrails (these are firm and I did not find them contested)

**F-B12.** Rockaway Beach is on the **Rockaway Peninsula**, separated from the rest of Queens by
**Jamaica Bay**. Source: Wikipedia, *Rockaway Beach, Queens* lead (wikitext) — "a neighborhood on
the [[Rockaway, Queens|Rockaway Peninsula]]". The only fixed links to the mainland in or near the
neighborhood are the **Cross Bay Veterans Memorial Bridge** and the A train / Rockaway Park Shuttle
over the Broad Channel trestle.

**F-B13.** Source: NRHP nomination, *Temple of Israel Synagogue*, Section 7 page 1. **Attestably
verbatim.** Locates the neighborhood relative to the bridge:
> "Situated on Rockaway Peninsula just east of the Cross Bay Bridge, which traverses Jamaica Bay
> linking the seaside communities with the rest of Queens"

**F-B14.** Source: Wikipedia, *Rockaway, Queens*.
> "The peninsula is part of Queens Community District 14"
> "is patrolled by the 100th and 101st Precincts of the New York City Police Department"

**F-B15.** ZIP code for Rockaway Beach is **11693**. Confirmed independently by three sources:
Wikipedia *Rockaway Beach, Queens*; the Rockaway Courthouse NRHP form ("zip code 11693", read
directly); the Temple of Israel NRHP form ("zip code 11693", read directly). Rockaway Park / Seaside
is **11694**; Arverne is **11692**. **This is the single most reliable discriminator I found** and
the verifier may find it more useful than any street range.

---

## 2. HISTORY — the Wikipedia History section

**Source for all of §2:** Wikipedia, *Rockaway Beach, Queens*, History section, retrieved via
`https://en.wikipedia.org/w/index.php?title=Rockaway_Beach,_Queens&action=raw`.
**Caveat per 0.4: probably verbatim, not attestably verbatim. Re-read before quoting.**

### 2.1 Early development

**F-1.** > "What is now Rockaway Beach was formerly two different hamlets, Holland and Hammels. In
1857, Michael P. Holland had purchased land and named the area after himself. Soon afterward, Louis
Hammel, an immigrant from Germany, bought a tract of land just east of Holland."

**F-2.** > "In 1878, he decided to give portions of his land to the New York, Woodhaven and Rockaway
Railroad in order to build a railroad station for the peninsula. The area around it became
collectively known as 'Hammels'."

**F-3.** > "On June 11, 1897, Hammels merged with Holland and they incorporated as the Village of
Rockaway Beach. One year later, it was incorporated into the City of Greater New York and became
part of the newly formed borough of Queens."

**F-4.** Secession attempts. > "However, the neighborhood, along with the eastern communities of
Arverne and Far Rockaway, tried to secede from the city several times. In 1915 and 1917, a bill
approving the secession passed in the legislature but was vetoed by the mayor at the time, John
Purroy Mitchel."
*Note for the verifier: this sentence names Far Rockaway. It is a shared historical episode, not a
claim that anything is located in the other neighborhood.*

**F-5.** > "Much of the area was developed by James S. Remsen and William Wainwright. In this era,
it became known as 'New York's Playground'."

**F-6.** Bathing-suit ordinance, 1904. > "concern over swimming etiquette became a problem and early
in 1904, the Captain of the NYPD, Louis Kreuscher, issued rules for those using the beach, censoring
the bathing suits to be worn, where photographs could be taken, and specifying that women in bathing
suits were not allowed to leave the beachfront."

**F-7.** > "One of its most popular attractions, the Atom Smasher roller coaster, would be featured
in the beginning of This is Cinerama, a pre-IMAX type movie, in 1952. An Olympic-size swimming pool
and a million-dollar midway also were built within the amusement park; they would serve the
community for over eighty years."

### 2.2 1930s–1960s — Robert Moses

**F-8.** > "As commissioner, Moses ordered the construction of the Marine Parkway Bridge and the
Cross Bay Veterans Memorial Bridge. The bridges were completed in 1937 and 1939 respectively."

**F-9.** Which bridge is *ours*. > "The Marine Parkway Bridge was built further west on the peninsula
between Jacob Riis Park and Breezy Point linking the isolated communities to Brooklyn. The Cross Bay
Bridge landed in the middle of the neighborhood of Rockaway Beach."
*This is a clean discriminator: the Cross Bay bridge is Rockaway Beach's; the Marine Parkway bridge
is not, and Jacob Riis Park / Breezy Point are out of scope entirely.*

**F-10.** > "The new bridge made the community the peninsula's gateway to Queens as it provided the
only direct car access to the borough."

**F-11.** The Shore Front Parkway that was built. > "A piece of the planned parkway that ran west to
east in the Rockaway Park and Rockaway Beach neighborhoods was constructed and opened in 1939.
Houses were literally cut in half in order to build the four-lane street. Some of these houses are
still standing today. The existing, still unfinished street is locally known as the 'road from
nowhere to nowhere' because it does not have any relevant connections to any other area or highway."
*FLAG: this sentence assigns the built parkway to Rockaway Park AND Rockaway Beach jointly.*

**F-12.** Decline. > "Robert Moses' construction of other recreational areas and facilities, such as
the New York Aquarium and Jones Beach State Park, indirectly impacted the neighborhood as well.
These more modern recreational facilities lured tourists and beachgoers away from the peninsula.
With fewer customers, businesses and hotels closed, and by the 1950s, the area had fallen into
economic decline."

**F-13.** Hammel Houses origin. > "The New York City Housing Authority purchased the land in 1952 on
the north side of the elevated track. In 1964, the Authority decided to demolish and rebuild the
entire area to what it is today."

**F-14.** Dayton Beach Park. > "In addition to the Hammel Houses, the Dayton Beach Park Cooperative,
which, unlike the Hammel Houses, are not projects, was constructed on the south side of the
community. The rectangular buildings, all of them thirteen stories high, were placed in close
proximity to the shoreline. The building was completed by the end of the 1960s along with the
similar looking Surfside Park Apartments and Dayton Towers West in nearby Rockaway Park. The
buildings still dominate Rockaway Beach's skyline today, nestled between Rockaway Beach Boulevard to
the north and Shore Front Parkway to the south."
*FLAG: "Dayton Towers West in nearby Rockaway Park" is explicitly placed OUTSIDE Rockaway Beach by
this source. Surfside Park Apartments' assignment is grammatically ambiguous in this sentence.*

### 2.3 Early 21st century

**F-15.** > "The area appears in New York magazine's 2007 spring travel issue as a place for
'Surfing' and to 'scuba dive for sunken ships'."

**F-16.** > "Out-of-towners start to call the beach 'Williamsburg on the Rockaways' because some
surfers from the Brooklyn neighborhood spend whole summers out in the Rockaways."

**F-17.** Hurricane Sandy and the sand replacement. > "The community was devastated by Hurricane
Sandy in late 2012. Rockaway Beach reconstruction began with Phase One, a $10 million contract
provided by the Army Corps of Engineers to restore 600,000 cubic yards of sand along Rockaway Beach
in August 2013. The second phase put nearly 3.5 million cubic yards of sand in 2014 at a cost of
about $37 million. Phase Two was paid by the federal government through the Hurricane Sandy relief
bill."

### 2.4 Deeper history from the NRHP nominations (attestably verbatim — I read these)

**F-18.** Peninsula scale and sale date. *Rockaway Courthouse* nomination, §8 p.1:
> "Rockaway is 12 miles long and a half mile wide. Since it was sold to the Dutch by the Indians in
> 1640, it has been used as farmland, a luxury summer resort, a resort for persons of modest income,
> and now currently a bedroom community to New York City."

**F-19.** The 1833 railroad and the founding of the neighborhood. Same form, §8 p.1:
> "In 1833, the railroad extended further westward into the peninsula which is credited for the
> establishment of the Rockaway Beach neighborhood, located at the central part of the peninsula."

**F-20.** The Holland landing. Same form, §8 p.1:
> "Named for the founding family who settled there, the Holland's arrived on the Rockaway Peninsula
> in 1858 on the Schooner Virginia, which landed near the present Beach 90th street and Jamaica Bay."

**F-21.** The Holland family farm. Same form, §8 p.1:
> "In addition, the Holland's constructed their family farm between Beach 91st and Beach 94th streets
> along what is now Rockaway Boulevard."

**F-22.** **The Jamaica Bay Infill project — a major and underused vein.** Same form, §8 pp.1–2:
> "The more rapid development and growth of the Hollands section of Rockaway Beach did not occur
> until the 1920s, when the Jamaica Bay Infill project commenced. During the winter of 1922/1923,
> the mudflats along the bayfront between Beach 88th and Beach 116th Streets were filled with sand.
> Once the marsh was built up, Beach Channel Drive was paved along the infill as the northernmost
> east-west thoroughfare across the island, running parallel to the Bay."

**F-23.** What the infill destroyed. Same form, §8 p.2:
> "A number of historic beach buildings were demolished to complete the Jamaica Bay infill project.
> This included the Jamaica Bay Yacht club which stood far out in the bay, accessible via a 600'
> dock that connected back to the railroad. The Courthouse now stands at the site of the Yacht Club."

**F-24.** Population growth. Same form, §8 p.2: > "The 1930 Census listed the population of the
peninsula as 30,000." and > "By 1950, the census population had grown to 50,000."

**F-25.** Waterfront extent. Same form, §8 p.2:
> "Rockaway Beach boasts ten miles of beautiful oceanfront on the Atlantic, and another sixteen
> miles of waterfront on Jamaica Bay."

**F-26.** Mid-century decline, stated bluntly by the nomination. Same form, §8 p.2:
> "However, today, between both waterfronts exists a troubled residential neighborhood fraught with
> poverty, deterioration, slums and racial tension. This transition began after World War two when
> summer bungalows were converted to year-round use and were not maintained during the off-season.
> In addition, sewage began to be dumped into Jamaica Bay, and a sea wall effectively shut off access
> to it."

**F-27.** The 1960 urban-renewal transfer. Same form, §8 p.2:
> "By 1960, the city acquired these derelict properties and transferred them to a private sponsor for
> a $70 million redevelopment urban renewal program. It was at this same time that the Rockaway
> Courthouse was closed."

**F-28.** **The resort's origin.** *Temple of Israel* nomination, §8 p.1:
> "Emerging as a resort destination with the opening of the Marine Pavilion Hotel in 1833, the
> Rockaways grew as a popular summer resort in the nineteenth century."

**F-29.** **Origin of the boardwalk — a good vein.** Same form, §8 p.1:
> "As more businesses opened in the second half of the nineteenth century, storeowners laid wooden
> planks in the sand near the ocean side allowing tourists closer access to the shore. These wooden
> paths became some of the first streets in the area and the precursor to Rockaways' famed boardwalk
> that developed later."

**F-30.** Wainwright and the bathhouses. Same form, §8 p.1:
> "In 1885 developer William Wainwright constructed bathhouses along the oceanfront of Seaside and
> transformed the amusement center into a carnival atmosphere similar to Coney Island."

**F-31.** Who Rockaway Beach was *for*. Same form, §8 p.2:
> "The eastern portion of the peninsula was an early enclave of New York's wealthiest people, and
> Rockaway Beach developed as the summer playground of New York's middle class. Developers of
> Rockaway Beach filled the area with hotels, rooming houses, rental cottage colonies, beachfront
> tent communities, saloons, stores, and much more. A single east-west thoroughfare, Rockaway Beach
> Boulevard, connected the various neighborhoods of the peninsula and served as a commercial hub."

**F-32.** Seasonality. Same form, §8 p.2:
> "As a summer resort community, Rockaway Beach had a very small year-round population. However,
> before the advent of air conditioning, resort areas like the Rockaways functioned as summer
> residences for scores of New Yorkers."

**F-33.** **Jewish settlement geography — explicitly splits the peninsula.** Same form, §8 p.2:
> "Wealthy, assimilated German Jews arrived first and settled predominantly in the western sections
> of the Rockaways in Neponsit and Belle Harbor, as well as in Far Rockaway and Bayswater in the
> east. The German-Jews were soon followed by the working-class and lower-middle-class Eastern
> European Jews, who settled in Hammels, Arverne, and Edgemere."

**F-34.** Same form, §8 p.2:
> "In the summer months, the Jewish resort patrons rented rooms and cottages patronizing other
> Jewish landlords, further strengthening the Jewish communities in neighborhoods like Hammels,
> Rockaway Beach, and Arverne."

**F-35.** **The Moses demolition, with numbers.** Same form, §8 p.3:
> "Behind the boardwalk from Beach 73rd Street to Beach 108th Street Moses's project demolished acres
> of buildings including individual houses, boarding houses, and businesses, in order to build the
> Shorefront Parkway."
*Note: this range (73rd–108th) matches F-B2's Rockaway Beach range, not F-B1's.*

**F-36.** Postwar conversion to year-round. Same form, §8 p.3:
> "At the end of World War II, as a way to temporarily alleviate the housing crisis engendered by
> returning veterans, Moses proposed having landlords of summer bungalows winterize the houses and
> rent to the veterans. Some of the winter tenants refused to leave when the summer season
> approached and the evolution of the Rockaways from a predominantly summer resort to a year-round
> community began."

**F-37.** Conditions in the converted bungalows. Same form, §8 p.3:
> "Reports of rooming houses with twenty or more people sharing one toilet without a bathtub appear,
> and bungalows with only hot plates and space heaters increased the risk of fires in the area."

**F-38.** **African American settlement in Hammels — a significant and specific claim.** Same form,
§8 pp.3–4:
> "African Americans predominantly lived in Hammels between the railroad tracks and Rockaway Beach
> Boulevard or in the Redfern area of Far Rockaway in former summer communities. Most jobs available
> to African Americans were unskilled seasonal work with low pay."

**F-39.** **Slum clearance and the Hammels project's failure.** Same form, §8 p.4:
> "Slum clearance began in the Redfern area of Far Rockaway in the 1940s, displacing scores of
> African Americans who did not qualify for the 'white only' public housing project that was built.
> The majority of the families displaced relocated to Hammels, which by 1949 also began slum
> clearance. The Redfern project was considered a success as a result of a strict interview process
> to ensure the residents were qualified. When the Hammels project was completed in 1954, it was seen
> as a failure because all of the dislocated residents were considered ineligible to apply."

**F-40.** 1954 demographics of Hammels. Same form, §8 p.4:
> "In 1954, 2,000 people lived in the Hammels district of Rockaway; 80 percent were on welfare, 75
> percent were African American, and the remaining population was Jewish and lived primarily in the
> eastern boundaries."

**F-41.** **The 1920 Rockaway Beach Boulevard fire — a vivid, specific, well-cited event.** Same
form, §8 p.5:
> "At 1:30 in the morning on Friday, December 17, 1920 a fire began at 83-11 Rockaway Beach Boulevard
> in the Arena Theater Building. Due to the predominance of wood-framed construction throughout the
> Rockaways and the near constant ocean breezes, fires had long plagued the Rockaways. The fire on
> December 17th quickly spread to other buildings along Rockaway Beach Boulevard due to the close
> proximity to neighboring buildings and a strong northwesterly wind that night. The fire spread down
> the Rockaway Beach Boulevard to Beach 81st Street and destroyed Temple Israel on Beach 84th Street
> before being controlled."

---

## 3. ROCKAWAY COURTHOUSE — candidate place, NRHP-listed

**Best-sourced place in this document.** Everything in §3 I read directly from the nomination form
(and from the Wikipedia article where noted). Quotes marked *(NRHP, read directly)* are attestable.

**P-1 / F-42. Rockaway Courthouse.**
- **Address: 90-01 Beach Channel Drive.** *(NRHP form §2, read directly.)*
- **Neighborhood as stated by the source: "Rockaway Beach"** — the form's "city or town" field reads
  `Rockaway Beach`, state New York, county Queens, **zip code 11693**. *(NRHP form §2, read directly.)*
- **NRHP listed February 5, 2014, reference #13001155.** The form bears the Keeper's signature dated
  `2.5.14`. *(read directly)*
- Wikipedia's NRHP table row, as extracted: > "78 Rockaway Courthouse February 5, 2014 (#13001155)
  90-01 Beach Channel Dr. 40°35′20″N 73°48′58″W"
  https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York

**F-43.** Architect and date. *(NRHP, read directly, §8 p.1)*
> "Constructed in 1931 for the New York City government, the building was designed by architect Major
> Paul C. Hunter, who was long associated with the Metropolitan Transit Authority."
Form fields: Architect/Builder **Paul C. Hunter**; Period of Significance **1931**; Architectural
Classification **LATE 19th & 20th CENTURY REVIVAL / Classical Revival**; walls **Stone, Structural
Clay Tile, Brick**; foundation **Concrete**; roof **Asphalt**; acreage **.48 acres**.

**F-44.** Significance statement. *(NRHP, read directly, §8 p.1)*
> "The Rockaway Courthouse is significant as an intact example of high style civic architecture
> associated with the growth of Rockaway Beach in the early and mid-part of the twentieth century."

**F-45.** Precise site bounds. *(NRHP, read directly, §7 p.1)*
> "The site is bounded at the north by Beach Channel Drive, at the east by Beach 90th Street, at the
> west by Beach 91st Street, and at the south by private development."

**F-46.** Its visual role on arrival. *(NRHP, read directly, §7 p.1)*
> "Just west of the Courthouse, the Cross Bay Bridge connects the Rockaway peninsula north to the
> mainland of Queens County. The building is one of the first structures seen when entering the
> Rockaways on the bridge."

**F-47.** Form and plan. *(NRHP, read directly, §7 p.1)*
> "The Rockaway Courthouse has three significant exterior facades due to its modified 'V'-shaped
> plan, and positioning on the site. The main spaces of the building are its elaborate courtrooms,
> which are located in the projecting wings, both at 45 degrees from the street, each with its own
> ornate Greek detailed entrance portico."

**F-48.** The carved signage — a concrete, visitable detail. *(NRHP, read directly, §7 p.2)*
> "The porticos utilize fluted Doric columns and entablatures with carved signage indicating
> 'Municipal Court' to the east and 'Magistrates Court' to the west."

**F-49.** Construction chronology. *(NRHP, read directly, §8 p.3)*
> "The site on Beach Channel Drive between Beach 90th (formerly Bayview Ave) and Beach 91st (formerly
> Oceanus Ave) streets was selected in June of 1929. Test borings were dug that autumn, but the
> entire project was paused due to the Great Depression. Work recommenced in April of 1931 when
> foundations were dug, and construction occurred between August 1931 and April 1932. A lack of
> furnishings kept the building closed until September 1932 when it opened."

**F-50.** **The 1932 dedication — an exceptional set-piece.** *(NRHP, read directly, §8 p.4, quoting
a New York Times article the form cites as "Open Court House at Rockaway Beach")*
> "The building's dedication ceremony was attended by 4,000 persons…. The Police Department Band led
> an automobile parade from Arverne through the Beach Channel Drive to a grand stand outside the new
> building. The exercises were opened by James J. Buckley, chairman of the court house committee of
> the Rockaway Beach Board of Trade. Paul C. Hunter, architect of the building, turned over the keys
> to Frederic S. Marsell, president of the Rockaway Beach Board of Trade and general chairman of the
> program."

**F-51.** Same quoted NYT passage, continued — **names three clergy and their parishes, which is
directly load-bearing for §5's contested assignments.** *(NRHP, read directly, §8 p.4)*
> "Other speakers included … the Rev. Joseph F. Curran, pastor of the St. Camillus Roman Catholic
> Church of Rockaway Beach; the Rev. Francis Urbano, rector of St. John's Protestant Episcopal Church
> of Far Rockaway, and Rabbi Robert Gordis of Temple Beth-El of Rockaway Park…."

**F-52.** Same quoted passage, close. *(NRHP, read directly, §8 p.4)*
> "More than 300 civic workers of the Rockaways celebrated the event at a dinner without speeches
> last night in the Moulin Rouge Inn, Rockaway Beach."
*Candidate place, historical only: **Moulin Rouge Inn**, Rockaway Beach. No address given; I found
no other source. Almost certainly long gone.*

**F-53.** Interior as described the week it opened. *(NRHP, read directly, §8 p.4, quoting the same
newspaper account)*
> "The new court house….has three stories and forty-seven rooms. It is constructed of Tennessee
> marble in a modernized Greek classic design. A steel cage has been installed in the cellar for
> receiving and dispatching prisoners from and to prison vans."

**F-54.** What the court actually did. *(NRHP, read directly, §8 p.5)*
> "The municipal court was used for hearings on 'among other matters, parking tickets and summonses
> issued to people who walked public streets in bathing attire – illegal behavior through the 1940s'"

**F-55.** The predecessor courthouses. *(NRHP, read directly, §8 p.3, quoting a newspaper of the week
it opened)*
> "The new court house will replace the thirty-year-old magistrates' court in Central Avenue, Far
> Rockaway, and the crowded offices of the Municipal Court on the second floor of the Seaside Branch
> of the Queens Borough Public Library."
*FLAG: names a **Seaside Branch of the Queens Borough Public Library**, historical. The modern branch
serving Rockaway Beach is the Peninsula branch (P-9). Different building; do not conflate.*

**F-56.** Abandonment and the 1970s arts use. *(NRHP, read directly, §8 p.5)*
> "In 1970, two nonprofit organizations, the Rockaway Cultural Society and the Rockaway Repertory
> Theatre operated a cultural and educational facility on the first floor. … However by 1974,
> attempts at raising money to make additional necessary improvements failed, and the building was
> ordered closed by the City of New York for safety concerns."

**F-57.** The 1993 DGS assessment. *(NRHP, read directly, §8 p.5, quoting Dierickx)*
> "The classical style neighborhood courthouse harmonizes with the low scale of the neighborhood but
> stands out through its classical ornament. It represented justice on the most local scale. It
> functioned, with the police station and the other local civic structures, as a civic presence in
> the area."

**F-58.** Closing line of the description section. *(NRHP, read directly, §7 p.5)*
> "The Rockaway Courthouse remains a significant landmark in the area, its prominent site and stately
> design, a long time feature of Rockaway Beach."

**F-59.** **CURRENT STATUS — TIME-SENSITIVE, VERIFY BEFORE WRITING ANYTHING PRESENT-TENSE.**
The 2013 nomination says *(read directly, §8 p.5)*:
> "Harmony Rockaway LLC purchased the building and will be rehabilitating the structure to its former
> grandeur, transforming the courthouse into a medical center."
Wikipedia, as extracted, says the building > "is being reconstructed as a medical center" and that
as of November 2019 it was > "under reconstruction as medical offices."
**Both statements are old. Neither establishes what the building is today. The verifier must
establish current status independently or the page must avoid the present tense.**

---

## 4. TEMPLE OF ISRAEL SYNAGOGUE — candidate place, NRHP-listed

**P-2 / F-60. Temple of Israel Synagogue** (also "Beth Israel Synagogue"; "Temple Israel Synagogue";
now "Haven Ministries").
- **Address: 1-88 Beach 84th Street.** *(NRHP form §2, read directly.)*
- **Neighborhood as stated by the source: "Rockaway Beach"**, county Queens, **zip 11693**. *(read
  directly.)* The narrative repeats it: > "is located in the Rockaway Beach community, Queens County,
  New York." *(NRHP, read directly, §7 p.1)*
- **NRHP listed February 5, 2014, reference #13001156.** *(read directly)*
- Wikipedia gives the address as "1-88 Beach 84th Street, Rockaway, Queens, New York City, New York
  11693" — note it says "Rockaway", not "Rockaway Beach". Minor, but the verifier should prefer the
  NRHP form. https://en.wikipedia.org/wiki/Temple_of_Israel_Synagogue_(Queens)

**F-61.** Form fields *(read directly)*: Architectural Classification **LATE 19th and EARLY 20th
CENTURY REVIVALS / Classical Revival**; foundation **Brick**; walls **Brick and Stone**; roof
**Asphalt**; **Architect/Builder: unknown**; Period of Significance **1921 – c.1950**; Significant
Date **1921**; Areas of Significance **Architecture, Social History**; acreage **0.18 acres**.
Prepared by **Jason Crowley, New York Landmarks Conservancy, October 2013**.
*FLAG: Wikipedia (extracted) gives construction "completed in September 1922"; the NRHP form gives
Period of Significance beginning 1921 and Significant Date 1921, and its narrative says the building
was "still in the process of completion at the end of 1922" with services likely from September 1922
in the basement. The 1921/1922 distinction is unresolved — the cornerstone was 1921, occupancy 1922.*

**F-62.** Statement of significance. *(NRHP, read directly, §8 p.1)*
> "Temple of Israel Synagogue is significant under Criterion A in the area of social history for its
> association with the first permanent Jewish congregation in Rockaway Beach. Built in 1921 to
> replace an earlier synagogue at the same site that was destroyed by fire, the synagogue served a
> robust Jewish community in the area from 1921 until the Jewish population began to diminish in the
> 1950s."

**F-63.** Why the location matters. *(NRHP, read directly, §8 p.1)*
> "The location of the synagogue at Beach 84th Street in the center of the Rockaway Beach
> neighborhood is significant. Being the first permanent house of worship for the large Jewish
> population in the Rockaways, the synagogue's central location made it accessible to everyone in
> the area."

**F-64.** Founding. *(NRHP, read directly, §8 p.4)*
> "In 1895, Temple Israel was organized as the first permanent Jewish congregation in Rockaway Beach
> with eleven members. For the first five years of its existence the congregation met informally at
> hotels and in the homes of its members for services."

**F-65.** The 1900 groundbreaking and the original building. *(NRHP, read directly, §8 p.4)*
> "In January of 1900, The Wave reported the groundbreaking ceremony on Fairview Avenue (now Beach
> 84th Street) of Rockaway's first Jewish synagogue, Temple of Israel."
and:
> "The synagogue was designed by architect Joseph P. Powers and constructed by Charles Crabbe, both
> residents of Rockaway Beach. It was forty-two feet wide and seventy-two feet deep with the main
> level raised seven feet eight inches above the street to provide room for a basement in the future."

**F-66.** The original Moorish design. *(NRHP, read directly, §8 pp.4–5)*
> "The proposed elevation featured in The Wave on February 3, 1900 depicts a double pointed arched
> doorway with 'Moorish fretwork' and a central tower over the entrance topped with an onion dome."

**F-67.** How it was actually built. *(NRHP, read directly, §8 p.5)*
> "The actual exterior of the synagogue was built of wood and clad in shingles upon a raised
> basement. … And finally, instead of having a single central tower, each stair tower was capped
> with a fanciful dome of oriental inspiration."

**F-68.** The rebuilding campaign and its slogan. *(NRHP, read directly, §8 pp.5–6)*
> "Within the first eight months after the fire, reports from The Wave note that members of the
> congregation had raised $18,000 toward the rebuilding of the synagogue. Report of the cornerstone
> of the synagogue was laid on August 25, 1921."
and:
> "The Wave reported that the building committee developed the slogan 'As You Pay, We Build.'"

**F-69.** Exterior description. *(NRHP, read directly, §7 p.1)*
> "Temple Israel Synagogue is a large two-story rectangular building, three bays wide by six bays
> deep on a raised basement, surmounted by a gable roof. Constructed of brick with a steel frame, the
> Classical Revival style building is faced with a buff brick laid in Flemish bond on the façade with
> stone details"

**F-70.** The Star of David details. *(NRHP, read directly, §7 p.1)*
> "The door surround comprises wood panels with a carved Star of David above the entry."
and *(§7 p.1)*: > "decorative wrought-iron metal grills that incorporate the Star of David"
and *(§7 p.2)*: > "The metal fire escape stairs include Stars of David in the railings."

**F-71.** **Interior memorial tablets — a specific, checkable, human detail.** *(NRHP, read directly,
§7 p.2)*
> "At the first landing on the south stair is a marble tablet shaped like a Decalogue inscribed with
> the name Temple of Israel and the names of the founding trustees of the synagogue. The first
> landing of the north stair features two marble tablets dedicated to the Sisterhood of Temple of
> Israel and the Ladies Benevolent Society of Temple of Israel."

**F-72.** Immediate surroundings — **places St. Rose of Lima next door.** *(NRHP, read directly,
§7 p.1)*
> "With the exception of St. Rose of Lima Roman Catholic Church and its affiliated school to the
> south, buildings in the immediate vicinity consist of primarily high-rise apartments and
> condominiums."

**F-73.** Decline and closure. *(NRHP, read directly, §8 p.4)*
> "Reports in The Wave, Rockaway's local newspaper, indicate that as the numbers of members trickled
> to a few dozen at the end of the twentieth century the congregation could no longer afford to
> maintain the synagogue."

**F-74.** Current use. Wikipedia, as extracted: the synagogue > "closed in 2001" and > "has been used
as a Pentecostal church since 2002, occupied by Haven International Ministries."
The NRHP form's owner field reads **Haven Ministries, 1-88 Beach 84th Street, Rockaway Beach, NY
11693** *(read directly)*, and its Current Function is **RELIGIOUS FACILITY / church**.
*FLAG: "Haven Ministries" (NRHP, 2013) vs "Haven International Ministries" (Wikipedia). Name form
unresolved. Also both are old; current occupancy needs re-checking.*

**F-75.** **Peer synagogues on the peninsula — all OUTSIDE Rockaway Beach per this source.** *(NRHP,
read directly, §8 p.3)*
> "By 1906, Derech Emunoh shingle-sided synagogue at Beach 67th Street in Arverne was completed in
> the Neo-Georgian style. In 1908, Temple Israel of Far Rockaway erected its own synagogue; a large
> white Neoclassical Beaux-Arts style building at the junction of Roanoke and State Streets [now
> Dinsmore Avenue & Nameoke Street] in Far Rockaway. Congregation Ohab Zedek, an orthodox Jewish
> congregation, built an austere brick synagogue in 1929 in Rockaway Park."
*This is a useful exclusion list. **Derech Emunoh belongs to Arverne** (no page). **Temple Israel of
Far Rockaway belongs to the Far Rockaway page** — and note the near-identical name to our Temple of
Israel; these are two different congregations and must not be merged. **Ohab Zedek belongs to
Rockaway Park** (no page). Also §8 p.6 mentions **Temple Beth El at Beach 121st Street, designed by
Maurice Courland, 1925** — Rockaway Park, out of scope.*

---

## 5. RELIGIOUS INSTITUTIONS — candidates and contested assignments

**P-3 / F-76. St. Rose of Lima Roman Catholic Church.**
- Source: Wikipedia, *St. Rose of Lima Roman Catholic Church (Queens)*. Address as extracted:
  > "130 Beach 84th Street, Rockaway Beach, New York, 11693"
- Neighborhood as extracted: > "Rockaway Beach, Queens"
- > "The parish was founded on August 30, 1886"
- > "Groundbreaking for the current Romanesque Revival style church building took place on July 1,
  1906, and the first Mass and dedication inside the new church took place on September 27, 1907"
- > "John W. Ingle was the architect of this church"
- The article does not mention NRHP or LPC designation. **(paraphrase of the extraction's negative
  finding — the verifier should confirm the absence rather than trust it.)**
- **Independently corroborated by the Temple of Israel NRHP form (F-72), which places "St. Rose of
  Lima Roman Catholic Church and its affiliated school" immediately south of 1-88 Beach 84th Street.
  Two independent sources, one of them primary, agree on Beach 84th Street.** This is the
  best-corroborated church candidate.
- https://en.wikipedia.org/wiki/St._Rose_of_Lima_Roman_Catholic_Church_(Queens)

**P-4 / F-77. St. Camillus Roman Catholic Church — ASSIGNMENT CONTESTED, DO NOT RESOLVE.**
- **Assigned to Rockaway Beach** by the 1932 New York Times account quoted in the Rockaway Courthouse
  NRHP nomination *(read directly, §8 p.4)*:
  > "the Rev. Joseph F. Curran, pastor of the St. Camillus Roman Catholic Church of Rockaway Beach"
- **Assigned to Rockaway Park** by every modern source I reached. Wikipedia search snippets, as
  extracted:
  - *List of churches in the Diocese of Brooklyn*: > "St. Camillus-St. Virgilius Roman Catholic
    Church, Rockaway Park, NY"
  - *Broad Channel, Queens*: > "St. Virgilius Parish of Broad Channel merged with St. Camillus Parish
    of Rockaway Park."
  - *List of schools in the Roman Catholic Diocese of Brooklyn*: > "St. Camillus Catholic Academy
    (Rockaway Park) - From 2014 to 2019."
- A further variant, unhelpfully vague — *John J. O'Malley*, as extracted: > "St. Camillus,
  Rockaway, NY"
- And the *Rockaway Beach, Queens* article itself cites > "St. Camillus Catholic Academy -Rockaways
  and Broad Channel Queens" as a school serving the neighborhood.
- **I did not find a street address for St. Camillus from any source I could reach.** That gap is
  material: without an address the verifier cannot test the two claims against a street range.
  **Recommend the verifier find the address first.** The 1932 source and the 2020s sources may both
  be right about different things (a parish serving Rockaway Beach while sited in Rockaway Park), or
  the parish boundary may simply have been described differently in 1932. **Not adjudicating.**

**P-5 / F-78. Haven Ministries / Haven International Ministries** — the Pentecostal congregation now
occupying the Temple of Israel building at 1-88 Beach 84th Street. See F-74. Assignment to Rockaway
Beach is not contested; only the organization's exact name and current occupancy are uncertain.

**Explicitly OUT OF SCOPE per the sources themselves** (see F-75): Congregation Derech Emunoh
(Arverne, Beach 67th St); Temple Israel of Far Rockaway; Congregation Ohab Zedek (Rockaway Park);
Temple Beth El (Beach 121st St, Rockaway Park); St. Francis de Sales (Belle Harbor — named in the
*Maura Clarke* article snippet); St. John's Protestant Episcopal Church of Far Rockaway (F-51).

---

## 6. THE BEACH, BOARDWALK AND PARKS

**P-6 / F-79. Rockaway Beach and Boardwalk.**
**CRITICAL CONSTRAINT, stated in the task and confirmed by the sources: this park runs the length of
the peninsula through many neighborhoods and MAY NOT BE CLAIMED WHOLE by this page.**

Source: Wikipedia, *Rockaway Beach and Boardwalk*, as extracted:
- Extent: > "Beach 9th Street in Far Rockaway to Beach 149th Street in Neponsit", > "7 miles (11 km)"
  of beach across > "170 acres (69 ha)"
- Boardwalk: > "from Beach 9th Street to Beach 126th Street in Rockaway Park", > "5.5 miles (8.9 km)
  long"
- Neighborhoods it passes: Edgemere, Arverne, Rockaway Beach, Hammels, Rockaway Park, Belle Harbor,
  Neponsit **(paraphrase of the extraction's list)**
- https://en.wikipedia.org/wiki/Rockaway_Beach_and_Boardwalk

**F-80. CONFLICT on the beach's extent.** The *Rockaway Beach, Queens* lead (which I have in
wikitext) says the beach is > "the largest urban beach in the United States, stretching from Beach
3rd to Beach 153rd Streets on the [[Atlantic Ocean]]." The *Rockaway Beach and Boardwalk* article
says Beach 9th to Beach 149th. **Beach 3rd–153rd vs Beach 9th–149th. Unresolved.** The "largest
urban beach in the United States" superlative appears only in the first source and should be treated
as a claim needing independent support.

**F-81.** Boardwalk construction phases, as extracted:
> the first section > "between Beach 109th and 126th Streets...opened in May 1923", followed by
sections between Beach 91st–109th Streets (opening June 1928), Beach 75th–56th Streets (June 1929),
and Beach 56th–21st Streets (September 1930). > "The concrete boardwalk from Beach 9th Street to
Beach 19th Street was completed in 1963."
*The Beach 91st–109th section (June 1928) is the one in or nearest Rockaway Beach.*

**F-82.** Sandy and the concrete rebuild, as extracted:
> "October 29, 2012, Hurricane Sandy destroyed much of the Rockaway Boardwalk." The city decided it
would be > "rebuilt in concrete rather than wood." > "The entire length of the boardwalk reopened in
July 2016," with the final section completed in > "May 2017."

**F-83.** Management, as extracted: > "The park has been maintained by the New York City Department
of Parks and Recreation since 1938."

**F-84. SURFING — a strong visitor draw, and the street numbers straddle the boundary question.**
As extracted:
> "The city's only legal surfing beaches are also along Rockaway Beach, between Beach 67th and 69th
> Streets and between Beach 87th and 92nd Streets."
*The **Beach 87th–92nd** stretch falls inside every proposed range for Rockaway Beach and is safely
ours. The **Beach 67th–69th** stretch falls in Arverne under F-B1/F-B2 and is almost certainly NOT
ours. Do not claim both.*

**F-85.** Concessions, as extracted: > "There are food concessions at Beach 17th, 86th, 97th, and
106th Streets."
*Beach 86th is inside Rockaway Beach under every range. Beach 97th is on the F-B1 boundary line.
Beach 106th is inside Rockaway Beach under F-B2 but in Seaside/Rockaway Park under F-B1/F-B7. Beach
17th is Far Rockaway/Edgemere and is not ours.*

**F-86.** Recreational facilities, as extracted from the same article:
> "the Rockaway Beach Skate Park" at > "Beach 91st Street"; > "an amphitheater at Beach 94th Street";
> "there is an ice hockey rink at Beach 109th Street"
*Skate park (B91) and amphitheater (B94) are inside Rockaway Beach under every range — both are good
candidates. The **ice hockey rink at Beach 109th** is contested exactly like the concessions.*

**F-87.** Adjacent development, as extracted: the park > "run[s] adjacent to a variety of
neighborhoods, including public housing on the Beach 50- and 60-numbered streets in Edgemere and
Arverne, and high-rise developments on the Beach 100-numbered streets in Rockaway Beach."
*FLAG: this sentence puts the Beach 100-numbered streets IN Rockaway Beach, agreeing with F-B2 and
contradicting F-B1 and F-B7.*

**F-88. Seating area.** From a search snippet of the same article: > "of the Beach 59th Street
Playground and a seating area between Beach 92nd and Beach 94th Streets."

**OUT OF SCOPE — do not claim:** Jacob Riis Park (NRHP historic district, listed June 17, 1981,
address "Rockaway Beach Blvd." per the NRHP table — **the street name is Rockaway Beach Boulevard but
the park is at the far western end of the peninsula, nowhere near this neighborhood; this is a name
trap**); Fort Tilden Historic District (NRHP, April 20, 1984, also listed under a "Rockaway Beach
Boulevard" address, also far west); Far Rockaway Beach Bungalow Historic District (NRHP, July 17,
2013, Beach 24th/25th/26th Sts — **that one belongs to the Far Rockaway page**); Tribute Park and the
American Airlines Flight 587 memorial (both Beach 116th Street, **Rockaway Park**, per the *Rockaway
Park, Queens* article); Jamaica Bay Wildlife Refuge (Broad Channel).

---

## 7. TRANSPORTATION

**P-7 / F-89. Beach 90th Street station (A, S) — "Beach 90th Street–Holland".**
Source: Wikipedia, *Beach 90th Street station*, as extracted:
- Location: > "Beach 90th Street & Rockaway Freeway"; the extraction states it is in the Rockaway
  Beach neighborhood **(paraphrase)**
- > "The station is officially 'signed as the Beach 90th Street–Holland station.'" The "Holland"
  name refers to Michael P. Holland **(paraphrase)** — which ties the station directly to F-1/F-20.
- > "The station was rebuilt as an elevated station, which opened on April 10, 1942."
- > "it reopened as a subway station along the IND Rockaway Line on June 28, 1956"
- Originally built by the LIRR in 1880 **(paraphrase)**
- Service: Rockaway Park Shuttle at all times plus > "ten daily rush-hour only A trains"
- https://en.wikipedia.org/wiki/Beach_90th_Street_station
*Assignment to Rockaway Beach is uncontested across sources. Strong candidate.*

**P-8 / F-90. Beach 98th Street station (A, S) — "Beach 98th Street–Playland". ASSIGNMENT CONTESTED.**
Source: Wikipedia, *Beach 98th Street station*, as extracted:
- Location: > "Beach 98th Street & Rockaway Freeway"; the extraction states it is **in the Rockaway
  Beach neighborhood (paraphrase)**
- > "The station is officially 'signed as the Beach 98th Street–Playland station'"
- > Originally constructed by the LIRR in April 1903 as Steeplechase station, > "renamed Playland on
  May 15, 1933", and > "reopened as a subway station along the IND Rockaway Line on June 28, 1956."
- The extraction says the referenced amusement park **"closed in 1985"** — see F-93, which says 1987.
- https://en.wikipedia.org/wiki/Beach_98th_Street_station
- **CONTEST:** the *Seaside, Queens* article says Seaside contains the Beach 98th Street and Beach
  105th Street stations (F-B7). The *Rockaway, Queens* communities list at F-B1 puts Beach 98th in
  **Rockaway Park**. So this one station is assigned to Rockaway Beach, Seaside, and Rockaway Park by
  three different Wikipedia articles. **Record; do not resolve.**

**F-91. Beach 105th Street station — CONTESTED, and probably NOT ours.**
The *IND Rockaway Line* article, as extracted, lists the Rockaway Park Branch stations by
neighborhood and puts **Beach 90th, Beach 98th AND Beach 105th all in "Rockaway Beach."** The
*Seaside, Queens* article puts Beach 105th in Seaside. F-B1 puts it in Rockaway Park; F-B2 puts
Rockaway Park starting at Beach 105th. **Four-way disagreement. I lean toward this not being ours,
but leaning is the verifier's job, not mine — recorded as contested.**
https://en.wikipedia.org/wiki/IND_Rockaway_Line

**F-92. Bus and ferry service.** Source: Wikipedia, *Rockaway Beach, Queens*, Transportation section,
as extracted:
- Local: **Q22, Q35, Q52/Q53 SBS**. Express to Manhattan: **QM15, QM16, QM17**.
- > The Q35 reaches the Flatbush Avenue–Brooklyn College station in Midwood, Brooklyn, while the Q53
  SBS connects to 61st Street–Woodside for the IRT Flushing Line and LIRR **(paraphrase)**
- Ferry, as extracted: in May 2017 NYC Ferry began service to Rockaway at 108th Street and Beach
  Channel Drive, > "making the commute into Rockaway more accessible for those who work in Manhattan
  or want to visit the area from Brooklyn or Manhattan."

**F-93. THE FERRY LANDING IS PROBABLY NOT IN ROCKAWAY BEACH — FLAG.**
- **NYC Ferry's own official route page** gives the Rockaway landing address as:
  > "Beach 108th Street and Beach Channel Drive, Far Rockaway, NY 11694"
  https://www.ferry.nyc/routes-and-schedules/route/rockaway/
  *Note the internal oddity in the operator's own listing: it says "Far Rockaway" but gives ZIP
  **11694**, which is Rockaway Park's ZIP, not Far Rockaway's. The operator appears to be using
  "Far Rockaway" as a loose postal/regional label.*
- **Wikipedia, *NYC Ferry***, as extracted, places the predecessor SeaStreak slip > "at Beach 108th
  Street and Beach Channel Drive in Rockaway Park, Queens".
  https://en.wikipedia.org/wiki/NYC_Ferry
- **Two independent sources, including the operator, decline to call this Rockaway Beach.** Beach
  108th is inside Rockaway Beach only under F-B2. **Recommend the ferry be treated as a routing fact
  ("the neighborhood is reached by...") rather than as a place record on this page**, but that is the
  verifier's call.
- Route: as extracted, the RWS route serves > "Rockaway, Sunset Park/Brooklyn Army Terminal, Wall
  Street/Pier 11, Stuyvesant Cove, East 34th Street, East 90th Street, Soundview, and Throgs Neck."
- Post-Sandy history, as extracted: SeaStreak began a city-subsidized service in 2012; > "Between its
  inception and December 2013, the service had carried close to 200,000 riders." On NYC Ferry's first
  day, > "1,828 rode the Rockaway ferry".

**P-9 / F-94. Rockaway Freeway.** Source: Wikipedia, *Rockaway Freeway*, as extracted:
> "The Rockaway Freeway is a road in the New York City borough of Queens that was created from the
> old right-of-way of the Long Island Rail Road Rockaway Division in 1941–1942."
> "The railroad line itself was elevated over the new automotive route and was incorporated into the
> New York City Subway system as the IND Rockaway Line (A train) in June 1956."
> "Because of the large number of concrete posts supporting the elevated subway, the Freeway has
> consistently been hazardous for drivers: at least one driver died from crashing into a pillar."
> "A portion of the road, between Beach 67th Street and Beach 73rd Street, was closed permanently in
> 2009 to make way for a retail transit plaza in connection with the new Arverne-by-the-Sea
> construction development."
*The closed segment (B67–B73) is in Arverne, not ours. The extraction says the article does not name
which neighborhoods the road traverses.*
https://en.wikipedia.org/wiki/Rockaway_Freeway

**F-95. Rockaway Beach Boulevard.** Source: Wikipedia, *Rockaway Beach Boulevard*, as extracted:
> "The Boulevard served as the heart of a bustling business and entertainment district in the heart
> of the Rockaway Beach neighborhood, which included numerous hotels and amusement attractions,
> including the famous Rockaways' Playland."
> "first forks off at its eastern end from Beach Channel Drive at Beach 35th Street in Edgemere"
> "merges once again with Beach Channel Drive by Jacob Riis Park shortly before the Marine
> Parkway–Gil Hodges Memorial Bridge"
> "opened in 1886" and > "was the first major east-west thoroughfare on the Rockaway Peninsula"
> "Much of the area in Arverne served by Rockaway Beach Boulevard was leveled through abortive urban
> renewal efforts in the 1960s."
*Like the boardwalk, this street runs the whole peninsula and may not be claimed whole. Corroborated
by the Temple of Israel NRHP form at F-31.*
https://en.wikipedia.org/wiki/Rockaway_Beach_Boulevard

**F-96. Beach Channel Drive.** Source: Wikipedia, *Beach Channel Drive*, as extracted:
> "8.0 mi (12.9 km)" long, > "extends from the Nassau County border at Inwood westward, to the Marine
> Parkway–Gil Hodges Memorial Bridge at the end of Jacob Riis Park."
> "From Hammels westward, it follows Jamaica Bay on the northern side of the peninsula"
> "Beach Channel Drive was opened on November 27, 1927, as a relatively short road west of the
> current site of the Cross Bay Veterans Memorial Bridge."
- **Aviation history candidate**, as extracted: one of the roads that became Beach Channel Drive was
  where four Navy seaplanes departed on May 8, 1919, beginning > "the first transatlantic flight",
  with one aircraft reaching Plymouth, England on May 31 **(paraphrase of the extraction)**.
  **FLAG: the extraction does not say this departure point is in Rockaway Beach — only that it is on
  a road that later became Beach Channel Drive, which runs 8 miles. Do not claim this for Rockaway
  Beach without an address. Likely Rockaway Naval Air Station, which was further east.**
- Corroborated on the infill origin by the Rockaway Courthouse NRHP form at F-22.
https://en.wikipedia.org/wiki/Beach_Channel_Drive

**F-97. Shore Front Parkway.** Source: Wikipedia, *Shore Front Parkway*, as extracted:
> "Shore Front Parkway is a 2.5-mile (4.0 km) beachfront road paralleling the Rockaway Beach and
> Boardwalk"
> runs "between Beach 73rd Street and Beach 108th Street"
> it traverses "Arverne, Hammels, [and] Rockaway Beach"
> Opening in 1939, Moses > "demolished more than 700 buildings in the parkway's path and destroyed
> what he described as 'catch-penny enterprises' along the boardwalk."
> "nearly half of the Rockaways' Playland amusement park was destroyed"
> Locals call it the "road to nowhere" because > "its termini do not access any well-traveled
> locations."
*FLAG: "road to nowhere" here vs "road from nowhere to nowhere" at F-11. Two different phrasings of
the local nickname from two Wikipedia articles. Also note the demolition figure — "more than 700
buildings" — is a strong, specific, citable claim worth verifying.*
https://en.wikipedia.org/wiki/Shore_Front_Parkway

**F-98. Hammels station (LIRR, demolished).** Source: Wikipedia, *Hammels station*, as extracted:
> "Hammels (formerly Hammel) was a Long Island Rail Road station on the Rockaway Beach Branch"
> stood "at what is today Beach 84th Street at the west leg of the Hammels Wye"
> "was originally built in June 1880" and > "was discontinued in 1941"
> "In 1887, a connection was made between the former Far Rockaway Branch and the NY&RB, thus creating
> what is known today as 'Hammels Wye.'"
> "When Beach Channel station closed on May 31, 1905, Hammels became the last station on the Rockaway
> Beach Branch before crossing the Beach Channel Drawbridge."
> "From 1941 to 1942 both lines were closed and rebuilt with newly elevated stations."
*Historical only — the station is gone. Beach 84th Street places it squarely in Hammels/Rockaway
Beach and it corroborates F-2.*
https://en.wikipedia.org/wiki/Hammels_station

**F-99. Hammels Wye — still operational, still named for this neighborhood.**
From *Hammels, Queens*, as extracted: > "There is no subway station in the area, but the A and
Rockaway Park Shuttle trains head north to Broad Channel via Hammels Wye."
From *IND Rockaway Line*, as extracted: > "South of the drawbridge is Hammels Wye, a three-legged
junction with the respective Rockaway Park and Far Rockaway branches."
*Good candidate: a piece of live infrastructure carrying the neighborhood's own historic name.*

**F-100. Rockaway Beach Branch (LIRR) and the 1950 fire.** Source: Wikipedia, *Rockaway Beach
Branch*, as extracted:
> The line "left the Main Line at Whitepot Junction in Rego Park heading south via Ozone Park and
> across Jamaica Bay to Hammels," then west to Rockaway Park **(paraphrase of the extraction's
> construction)**
> "opened on August 26, 1880"; service north of the subway connection ended > "June 8, 1962"
> "A fire on the trestle across Jamaica Bay...on May 7, 1950, cut service on the middle section of
> the line."
> the city "purchased the line on June 11, 1952, for $8,500,000"
> Stations including Hammels, Holland (Beach 90th Street), Playland (Beach 98th Street), Seaside
> (Beach 105th Street) and Rockaway Park all closed October 3, 1955 **(paraphrase)**
> QueensWay proposes > "a 3.5-mile (5.6 km) greenway/linear park"; QueensLink argues > "people who
> live in Rockaway, Ozone Park, Howard Beach and other areas...have no quick or easy way to get into
> Manhattan."
From *IND Rockaway Line*, as extracted: > "The worst fire, the one that sealed the fate of the line,
took place on May 7, 1950." It destroyed 1,800 feet of trestle **(paraphrase)**.
*FLAG for the wave coordinator: the Rockaway Beach Branch right-of-way and the QueensWay/QueensLink
dispute run through Rego Park, Forest Hills, Woodhaven, Richmond Hill and Ozone Park. **Richmond Hill
is a sibling page in this very wave.** This is shared infrastructure, not a place; be careful that
two pages do not both narrate it as theirs.*
https://en.wikipedia.org/wiki/Rockaway_Beach_Branch

**F-101. Hurricane Sandy and the subway.** From *IND Rockaway Line*, as extracted:
> "The segment of the line between Howard Beach and the Rockaway Peninsula suffered serious damage
> during Hurricane Sandy and was out of service for several months."
An **H shuttle** replaced A service from November 20, 2012 to May 30, 2013 **(paraphrase)**.

---

## 8. HOUSING

**P-10 / F-102. Hammel Houses (NYCHA). ASSIGNMENT AND FACTS BOTH CONTESTED.**
- Wikipedia, *Hammel Houses*, as extracted, gives the address as:
  > "84-16 Rockaway Beach Boulevard, Far Rockaway, New York"
  **FLAG: "Far Rockaway" in the postal address of a building on Beach 84th–86th Street. This is
  almost certainly NYCHA/USPS postal convention rather than a neighborhood claim, but Far Rockaway
  is a sibling page in this wave and this must not be silently ignored.** The same article's prose
  places it in > "Hammels, Queens on the Rockaway peninsula" **(paraphrase)**.
- **Numbers conflict between two Wikipedia articles:**
  - *Hammel Houses*: **fourteen seven-story buildings, 712 apartments, completed September 1954**
  - *Hammels, Queens*: > "completed in April 1955" and > "has 700 apartments spread across 14
    buildings on a site covering 14 acres" between **Beach 81st and 86th streets**
  **712 vs 700 units; September 1954 vs April 1955. Unresolved.**
- The *Rockaway Beach, Queens* History section (F-13) gives yet another chronology: land purchased
  1952, and > "In 1964, the Authority decided to demolish and rebuild the entire area to what it is
  today." **A third date. Unresolved.**
- Origin, from *Hammel Houses* as extracted: > "New York City bought the land for the Hammel Houses
  on July 16, 1952, making it one of the city's early housing projects."
- Social history: see F-38, F-39, F-40 — the NRHP form's account of displacement, the "white only"
  Redfern project, and the 1954 demographics is far richer and better-sourced than anything on
  Wikipedia, and it is attestably verbatim.
- https://en.wikipedia.org/wiki/Hammel_Houses ; https://en.wikipedia.org/wiki/Hammels,_Queens
- *NYCHA's own Queens developments page lists "Hammel" but gives no address or neighborhood:
  https://www.nyc.gov/site/nycha/about/developments/queens.page*

**F-103. Dayton Beach Park Cooperative and Surfside Park Apartments.** Only source reached is the
*Rockaway Beach, Queens* History section — see **F-14** for the full quoted passage. Thirteen-story
buildings, completed by the end of the 1960s, > "nestled between Rockaway Beach Boulevard to the
north and Shore Front Parkway to the south." **No street address found for either. Dayton Towers
West is explicitly placed in Rockaway Park by the same sentence and is not ours.**

---

## 9. CIVIC, CULTURAL AND EDUCATIONAL

**P-11 / F-104. Peninsula Library (Queens Public Library branch).**
Source: **Queens Public Library's own site** — an institutional source, one of the few here.
- Branch name: **Peninsula**
- > "92-25 Rockaway Beach Boulevard, Rockaway Beach, NY 11693"
- Neighborhood as given by the library: **Rockaway Beach**
- The extraction reports no history on the page **(paraphrase of a negative)**.
- https://www.queenslibrary.org/about-us/locations/peninsula
*Address, neighborhood and ZIP all agree with F-B15. Strong candidate. **Do not confuse with the
historical "Seaside Branch of the Queens Borough Public Library" named at F-55** — different
building, different era.*

**F-105. Schools.** Source: Wikipedia, *Rockaway Beach, Queens*, Education section, as extracted:
Elementary **P.S. 183**; middle school **P.S. 225**; private Catholic **St. Camillus** and **St. Rose
of Lima** **(paraphrase of the extraction's list — it was returned as a list, not as a quote)**.
*No addresses found for any of them. St. Camillus's own assignment is contested (P-4). St. Rose of
Lima's affiliated school is corroborated by the NRHP form at F-72 as being on Beach 84th Street.
**P.S. 183 and P.S. 225 need addresses before either can be recorded as a place.***

**F-106. Rockaway Courthouse's 1970s cultural tenants** — the **Rockaway Cultural Society** and the
**Rockaway Repertory Theatre**. See F-56. Historical; both appear defunct.

**F-107. Rockaway Beach Board of Trade** — named twice in the 1932 NYT account at F-50 ("chairman of
the court house committee of the Rockaway Beach Board of Trade"; "Frederic S. Marsell, president of
the Rockaway Beach Board of Trade"). Historical civic organization; no evidence it survives.

**F-108. The Wave** — Rockaway's local newspaper, cited **more than a dozen times** in the Temple of
Israel NRHP nomination, with issues quoted from 1900, 1920, 1921, 1922, 1986 and 2000. The NRHP form
describes it *(read directly, §8 p.4)* as > "The Wave, Rockaway's local newspaper". **This is the
single richest unexploited source for this neighborhood and I could not reach it** (no WebSearch;
I did not have a working URL). **Strong recommendation: the verifier or a later pass should try
rockawave.com and any Wave archive.**

---

## 10. BUSINESSES — all sourced to their own websites, none to inspection data

**Repeating the disclosure from 0.7: none of these rests on a DOHMH or DCWP inspection dataset. Each
is sourced to the business's own website, which the verifier should treat as self-description of
uncertain currency.**

**P-12 / F-109. Rockaway Beach Surf Club.**
- > "302 Beach 87th Street, Rockaway Beach, NY 11693"
- Location description: > "on the corner of Beach 87th Street and Rockaway Freeway. Underneath the A
  train line."
- Self-description: > "Your NYC beach spot" offering > "Surf • Music • Margs • Tacos • Community •
  Art • Skate."
- https://rockawaybeachsurfclub.com/
- **Sole source: the business's own website. NOT an inspection dataset.**
- *Beach 87th Street is inside Rockaway Beach under every proposed range, and the ZIP is 11693. The
  address is uncontested; only its operating status is unverified.*

**P-13 / F-110. Tacoway Beach.**
- > "302 beach 87th street Rockaway Beach , NY 11693" *(lowercasing and spacing as the extraction
  returned it)*
- **Same street address as the Rockaway Beach Surf Club.** The two are evidently co-located — the
  Surf Club's own tagline includes "Tacos" (F-109). **The verifier should establish whether these are
  one venue or two businesses at one address before recording both as separate places.**
- https://www.tacowaybeach.com/
- **Sole source: the business's own website. NOT an inspection dataset.**

**F-111. The Rockaway Hotel — NOT OURS, recorded so no one else claims it.**
- Its own website gives: > "108-10 Rockaway Beach Dr." in > "Rockaway Park, NY" **11694**, and
  describes itself as > "an urban boutique hotel" in > "Rockaway Park, Queens, New York, located four
  blocks from Rockaway Beach and the Atlantic Ocean promenade."
- https://www.therockawayhotel.com/
- **The business places itself in Rockaway Park, with Rockaway Park's ZIP, and describes Rockaway
  Beach as somewhere it is near rather than somewhere it is. Recorded as an exclusion.**

**F-112. Rockaway Brewing Company** — could not be reached; **`rockawaybrewco.com` returned a TLS
"certificate has expired" error.** No candidate recorded. Note for the verifier: this company is, to
my prior knowledge, primarily a Long Island City business with a Rockaway taproom, which would make
its assignment contested if it is pursued. **I have no source for that and am flagging it only so
the verifier does not assume the name implies the location.**

---

## 11. ROCKAWAYS' PLAYLAND — the neighborhood's defining lost place

**P-14 / F-113. Rockaways' Playland. ASSIGNMENT AND DATES BOTH CONTESTED.**
Source: Wikipedia, *Rockaways' Playland*, as extracted:
- Location: > "Bounded by Beach 97th and Beach 98th Streets between Rockaway Beach Boulevard and the
  Rockaway Beach and Boardwalk"
- **Neighborhood: the extraction says it was in Rockaway Beach, "specifically in the Seaside
  neighborhood" (paraphrase).** See F-B8 and the contradiction with F-B7.
- **Dates conflict three ways.** This article, as extracted: > "operated from 1902 to 1987" though
  > "sources vary on the exact opening year (1901, 1902, or 1903 are cited)". The *Rockaway Beach,
  Queens* History section (F-6 context) says > "Rockaway's famous amusement park, Rockaways'
  Playland, was built in 1901". The *Beach 98th Street station* article says the park **closed in
  1985**. **1901/1902/1903 for opening; 1985 vs 1987 for closing. Unresolved.**
- Founder: > roller coaster designer LaMarcus Adna Thompson created the park after purchasing land
  from George Tilyou, owner of Coney Island's Steeplechase Park **(paraphrase)**. *This also explains
  the station's original 1903 name, "Steeplechase" (F-90).*
- Ownership: Thompson's family ran it after his 1919 death until Robert Katlin bought it in December
  1927; A. Joseph Geist purchased it in January 1928 and renamed it "Rockaways' Playland"
  **(paraphrase)**.
- **Closure cause — a specific, quotable figure:** > "insurance premiums increased eightfold, from
  $50,000 in 1985 to $408,000 in 1986," prompting Richard Geist to close it permanently rather than
  reopen.
- Rides: **the Atom Smasher** wooden coaster (1938), the **Gravity Wonder** (1924), and flat rides
  including the **Rig-a-Jig** and **Leaping Lena** **(paraphrase)**.
- https://en.wikipedia.org/wiki/Rockaways%27_Playland
- **Corroboration from elsewhere:** the Atom Smasher's appearance in *This Is Cinerama* (1952) at
  **F-7**; the Olympic-size pool and million-dollar midway at **F-7**; Moses destroying "nearly half"
  of the park at **F-97**; the station's "Playland" name at **F-90**; the Boulevard as its setting at
  **F-95**.
- **FLAG: Beach 97th–98th Street is precisely the disputed line in F-B1 (Rockaway Beach ends at Beach
  97th; Rockaway Park begins at Beach 98th). The park literally straddles it. This is the most
  consequential single contested place in this document, because Playland is the thing Rockaway Beach
  is most famous for.**

---

## 12. DEMOGRAPHICS, POPULAR CULTURE, PEOPLE

**F-114. Demographics.** Source: Wikipedia, *Rockaway Beach, Queens*, as extracted:
- Population **13,449 (2010 census)** — *note this is a 2010 figure and is now three censuses old.*
- ZIP **11693**; **Queens Community District 14**
- > Known as the "Irish Riviera" due to significant Irish-American population, **25.4% Irish
  ancestry, second-highest nationally after Boston's South Shore** **(paraphrase of the extraction;
  the "Irish Riviera" phrase itself was in quotation marks)**
- *Corroborating context on the Irish presence from the NRHP form at F-11: Seaside's nickname "Irish
  Town." Note these are two different nicknames for two different (or overlapping) areas.*

**F-115. In popular culture.** Source: Wikipedia, *Rockaway Beach, Queens*, as extracted — **this
section came back as summary rather than as quotation and every item needs independent checking**:
- **The Ramones, "Rockaway Beach" (1977)** — reached **#66 on the Billboard Hot 100**, described as
  the band's **highest-charting single**.
- **Woody Allen, *Radio Days* (1987)** — shot on location, depicting working-class life in the
  1930s–40s.
- **A 2010 documentary, *Our Hawaii*** — on the surf culture that emerged at Rockaway from the late
  1960s.
- **Jill Eisenstadt**, *From Rockaway* (1987), on lifeguard culture in the 1980s, and *Swell* (2017),
  on the Golden Venture and post-9/11 aftermath.
- *The first extraction also vaguely mentioned "a 1973 sitcom episode and a recent prestige drama
  series" without naming either. The search index separately surfaced **"Edith's 50th Birthday"** (an
  *All in the Family* episode) and **"How To with John Wilson"** as articles containing this
  neighborhood's name — those may be the two, but **I did not confirm the connection and the verifier
  should not assume it.***

**F-116. Notable people.** Source: Wikipedia, *Rockaway Beach, Queens*, as extracted. Descriptors are
as the extraction returned them:
- **Al McGuire** (1928–2001), > "college basketball coach and broadcaster, raised in Rockaway Beach"
- **Patti Smith** (b. 1946), > "punk rocker-poet, wrote about living in Rockaway Beach in her 2015
  memoir" *(the memoir is presumably* M Train*, but the extraction did not name it — do not assume)*
- **Andrew VanWyngarden** (b. 1983), > "co-founder of psychedelic rock band MGMT, bought a house in
  Rockaway Beach in 2012."
- **Michael "Iz the Wiz" Martin** (1958–2009), > "one of the most prominent graffiti writers of the
  early New York graffiti movement." *The search index separately showed the *IZ the Wiz* article
  calling him > "a Rockaway Beach native."*
- **Jonathan Monaghan** (b. 1986), > "visual artist, born and raised in Rockaway Beach"
- **Kenny Vance** (b. 1943), > "singer-songwriter and producer."
- **Vito J. Castellano**, > "Adjutant General of New York"
- **Skip Campbell** (1948–2018), > "Florida legislator and mayor of Coral Springs, Florida born in
  Rockaway Beach."
- *A near-miss worth flagging so it is not miscopied: the search index shows the **Emil Lucev**
  article saying he was > "born September 27, 1933, at Rockaway Beach Hospital (Far Rockaway,
  Queens)". **The hospital's name contains "Rockaway Beach" but the article locates it in Far
  Rockaway.** Lucev's papers are cited as a source in the Rockaway Courthouse nomination. **Do not
  claim Rockaway Beach Hospital for this page without a real address.***

---

## 13. CONTESTED NEIGHBOURHOOD ASSIGNMENTS — CONSOLIDATED LIST

The task requires these be listed and **not resolved**. They are not resolved.

| # | Place | Assigned to Rockaway Beach by | Assigned elsewhere by | Address |
|---|---|---|---|---|
| 1 | **Rockaways' Playland** | *Rockaways' Playland* (as "Rockaway Beach… specifically Seaside"); *Rockaway Beach Blvd* article | *Rockaways' Playland* also says **Seaside**; F-B1 puts Beach 98th in **Rockaway Park** | Beach 97th–98th Sts, between Rockaway Beach Blvd and the boardwalk |
| 2 | **Beach 98th Street station** | *Beach 98th Street station*; *IND Rockaway Line* | *Seaside, Queens* → **Seaside**; F-B1 → **Rockaway Park** | Beach 98th St & Rockaway Freeway |
| 3 | **Beach 105th Street station** | *IND Rockaway Line* | *Seaside, Queens* → **Seaside**; F-B1/F-B2 → **Rockaway Park** | Beach 105th St & Rockaway Freeway |
| 4 | **St. Camillus RC Church** | 1932 NYT via Rockaway Courthouse NRHP form: "of Rockaway Beach" | Diocese of Brooklyn lists → **Rockaway Park**; *Broad Channel* → **Rockaway Park**; *John J. O'Malley* → "Rockaway, NY" | **No address found — find this first** |
| 5 | **Hammel Houses** | *Hammels, Queens* (Hammels is "within Rockaway Beach"); *Rockaway Beach, Queens* History | Its own listed postal address says **"Far Rockaway, New York"** | 84-16 Rockaway Beach Blvd (per Wikipedia); Beach 81st–86th Sts |
| 6 | **NYC Ferry Rockaway landing** | *Rockaway Beach, Queens* Transportation section | **NYC Ferry's own site** → "Far Rockaway, NY 11694"; *NYC Ferry* article → **Rockaway Park** | Beach 108th St & Beach Channel Dr |
| 7 | **Ice hockey rink** | *Rockaway Beach and Boardwalk* (listed among Rockaway Beach facilities) | Beach 109th is **Seaside/Rockaway Park** under F-B1 and F-B7 | Beach 109th St |
| 8 | **Beach 106th St food concession** | *Rockaway Beach and Boardwalk* | Beach 106th is **Seaside/Rockaway Park** under F-B1 and F-B7 | Beach 106th St |
| 9 | **Beach 97th St food concession** | *Rockaway Beach and Boardwalk* | Sits exactly on F-B1's Rockaway Beach / Rockaway Park line | Beach 97th St |
| 10 | **Surf beach, Beach 67th–69th** | *Rockaway Beach and Boardwalk* (as "along Rockaway Beach") | Beach 67th–69th is **Arverne** under both F-B1 and F-B2 | Beach 67th–69th Sts |
| 11 | **Shore Front Parkway** | *Rockaway Beach, Queens* History; *Shore Front Parkway* | Same sources also assign it to **Rockaway Park**, **Hammels** and **Arverne** — it is shared, not ours | Beach 73rd–108th Sts |
| 12 | **Surfside Park Apartments** | *Rockaway Beach, Queens* History (grammatically ambiguous) | Same sentence explicitly puts **Dayton Towers West in Rockaway Park**; Surfside's assignment is unclear | No address found |
| 13 | **"Seaside" as a district** | *Rockaways' Playland* treats it as inside Rockaway Beach; F-B2 range overlaps | *Seaside, Queens* says it **borders** Rockaway Beach and carries ZIP **11694** | Beach 84th–105th (F-B2) or Beach 98th–105th |
| 14 | **Rockaway Beach Hospital** | Name only | *Emil Lucev* article → **"(Far Rockaway, Queens)"** | No address found |

**Boundary-range disagreements** (not places, but they determine every row above): F-B1 (Beach
77th–97th) vs F-B2 (Beach 73rd–108th) vs F-B3 (Beach 84th–107th "heart") vs F-B4 (no numbers) — with
F-B1 and F-B2 both coming from **the same Wikipedia article**.

**Places I found and am NOT recording as candidates, because a source placed them outside Rockaway
Beach:** The Rockaway Hotel (Rockaway Park, its own site); Tribute Park and the Flight 587 memorial
(Beach 116th, Rockaway Park); Jacob Riis Park and Fort Tilden (far west end, despite "Rockaway Beach
Boulevard" addresses in the NRHP table); Far Rockaway Beach Bungalow Historic District (Far Rockaway
— **belongs to the sibling page**); Congregation Derech Emunoh (Arverne); Temple Israel of Far
Rockaway (Far Rockaway — **belongs to the sibling page, and note the confusable name**); Ohab Zedek
and Temple Beth El (Rockaway Park); St. Francis de Sales (Belle Harbor); Dayton Towers West (Rockaway
Park); Arverne by the Sea (Arverne); the Beach 67th–73rd Rockaway Freeway closure (Arverne).

**Nassau County / Atlantic Beach / Lawrence:** nothing in this document is placed there. Beach
Channel Drive's eastern terminus is stated as "the Nassau County border at Inwood" (F-96) — that is
a terminus description, not a place claim, and Inwood is outside the corpus.

---

## 14. WHAT I COULD NOT COVER — honest gaps

- **NYC Parks (nycgovparks.org) — 403 on every attempt.** All beach, boardwalk, skate park,
  amphitheater and concession facts above are Wikipedia-sourced when they should be Parks-sourced.
- **The Wave** (Rockaway's local paper, cited ~15 times in the Temple of Israel nomination) — never
  reached. Almost certainly the richest remaining vein.
- **No addresses** for: St. Camillus, P.S. 183, P.S. 225, Dayton Beach Park, Surfside Park Apartments.
- **LPC (New York City) designations** — I found **two NRHP listings** in Rockaway Beach and **zero
  NYC Landmarks Preservation Commission designations**, but I could not reach the LPC directly and
  **cannot say whether that zero is real or an artifact of my method.** The verifier should check LPC.
- **Museums** — I found **none** in Rockaway Beach. The Rockaway Courthouse's 1970s arts tenants
  (F-56) are the closest thing, and they are defunct.
- **Industrial history** — essentially absent. The economic history here is **resort, amusement,
  railroad and housing**, not industry. That appears to be genuine rather than a gap, but it is
  asserted on thin evidence.
- **Immigrant history** is well covered for **Irish, German and Eastern European Jewish** settlement
  and for **African American** settlement in Hammels (F-11, F-33, F-34, F-38, F-39, F-40), and is
  **entirely absent for the post-1965 period.** The 2010 population figure (F-114) is the only modern
  demographic datum I have. This is a real and significant hole.
- **Post-Sandy recovery beyond the sand replenishment and the boardwalk rebuild** — thin.
- **Current status of the Rockaway Courthouse** (F-59) — genuinely unknown as of this research.

---

## TALLY

- **Candidate facts recorded (F-numbered): 131** — F-B1 through F-B15 (15) plus F-1 through F-116 (116).
- **Candidate places recorded (P-numbered): 14** — P-1 through P-14.
- **Contested neighborhood assignments: 14** (§13 table), plus the four-way boundary-range
  disagreement in §1.
- **Businesses resting on a DOHMH/DCWP inspection dataset: 0.**
- **Verdicts, confirmations or adjudications issued: 0.** That is the verifier's job.
