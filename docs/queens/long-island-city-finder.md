# Long Island City, Queens — FINDER candidate file

**Role:** Finder only. Nothing below is verified, confirmed, or adjudicated. Every entry is a
CANDIDATE awaiting the verifier. No verdicts are recorded here by design.

**Date of research:** 2026-09-01
**Neighborhood:** Long Island City (LIC), Queens, NYC
**Wave note:** Astoria, Ditmars-Steinway and Long Island City are adjacent. Section J below is the
register of every place whose neighborhood assignment differs between sources. It is recorded, not
resolved.

---

## 0. Method, and honest caveats about how these were gathered

- **WebSearch was unavailable.** The session's search budget (200/200) was already exhausted by
  sibling agents before this agent issued its first query. All material below was therefore obtained
  by fetching URLs **directly** — no search-result discovery step. This biases the collection toward
  sources whose URLs are guessable or are linked from other fetched pages. **Gaps almost certainly
  exist** (see Section L).
- Pages were fetched with `urllib` + a browser User-Agent and stripped to text; PDFs via `pdftotext`.
  Raw text is retained at
  `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/lic_pages/`
  and `.../lic_pdf/`.
- **One fetch returned the wrong page and was caught.** A request for
  `nycgovparks.org/parks/rainey-park-q048/history` initially returned the text of **Cunningham Park**
  (a different park, in eastern Queens). It was re-fetched with `<title>` verification and returned
  Rainey Park correctly. **Any Parks fact below was title-verified on re-fetch.** Treat this as a
  live reliability warning for the verifier: this environment does return wrong-page content.
- **Quotation convention:** text inside `"…"` is copied verbatim from the source text as fetched.
  Text marked **[PARAPHRASE]** is my own wording and is NOT a quote. LPC designation reports are
  1968–2016 scans; their OCR contains character corruption, which I mark **[OCR artifacts]** where it
  affects the quoted span.
- **Wikipedia is used as an INDEX, not as authority.** Where Wikipedia pointed to a landmark, I then
  fetched the actual LPC designation report PDF or the NPS reference number. Facts sourced only to
  Wikipedia are labeled `SOURCE TIER: aggregator` and should be re-sourced before use.

---

## A. Boundaries, administrative geography, ZIP codes

**F1.** Boundaries. "Long Island City ( LIC ) is a neighborhood within the New York City borough of
Queens . It is bordered by Astoria to the north; the East River to the west; Sunnyside to the east;
and Newtown Creek , which separates Queens from Greenpoint, Brooklyn , to the south."
Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER: aggregator.

**F2. ⚑ DIRECTLY CONTRADICTS THIS WAVE'S BRIEF.** The task brief states that Astoria,
Ditmars-Steinway and Long Island City "all sit in Queens Community District 1." Multiple sources say
LIC is split across **two** community districts:
- "Long Island City is part of Queens Community District 1 to the north and Queens Community
  District 2 to the south." — https://en.wikipedia.org/wiki/Long_Island_City
- "Long Island City is split between Queens Community Board 1 to the north of Queens Plaza and
  Queens Community Board 2 south of Queens Plaza." — same source.
- NYC Parks corroborates independently by park: Hunter's Point South Park lists "Community Board: 2";
  Notorious LIC Park lists "Community Board: 2"; Murray Playground lists "Community Board: 2";
  Andrews Grove lists "Community Board: 2"; while Dutch Kills Playground and Ravenswood Playground
  list "Community Board: 1"; **Queensbridge Park lists "Community Board: 1, 2"** (both).
  Sources: https://www.nycgovparks.org/parks/hunters-point-south-park ,
  https://www.nycgovparks.org/parks/bridge-and-tunnel-park/history ,
  https://www.nycgovparks.org/parks/murray-playground/history ,
  https://www.nycgovparks.org/parks/andrews-grove/history ,
  https://www.nycgovparks.org/parks/dutch-kills-playground/history ,
  https://www.nycgovparks.org/parks/ravenswood-playground/history ,
  https://www.nycgovparks.org/parks/queensbridgepark/history
  **NOT RESOLVED. Flagged for the verifier and for the arbitration note.**

**F3.** ZIP codes. Infobox value: "11101–11106, 11109, 11120".
Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER: aggregator.

**F4.** "Long Island City is covered by ZIP Code 11101." and "The United States Post Office operates
the Long Island City Station at 46-02 21st Street."
Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER: aggregator.

**F5.** ZIP 11106 is shared with Astoria in practice — Socrates Sculpture Park (LIC address) and
Ravenswood Playground both carry "Zip Code: 11106", while Van Alst Playground and Hallets Cove
Playground (both described by NYC Parks as Astoria) carry "Zip Code: 11102".
Sources: https://www.nycgovparks.org/parks/socrates-sculpture-park/history ,
https://www.nycgovparks.org/parks/ravenswood-playground/history ,
https://www.nycgovparks.org/parks/van-alst-playground/history ,
https://www.nycgovparks.org/parks/hallets-cove-playground/history

**F6.** Police. "Woodside, Sunnyside, and Long Island City are patrolled by the 108th Precinct of the
NYPD , located at 5-47 50th Avenue." Source: https://en.wikipedia.org/wiki/Long_Island_City —
SOURCE TIER: aggregator. Partially corroborated by NYC Parks: "The 108th Precinct police station
resides at the rear of the playground." (Andrews Grove) —
https://www.nycgovparks.org/parks/andrews-grove/history

**F7.** Population figure given as 63,000 in the article infobox; separately, "the population of the
combined Queensbridge-Ravenswood-Long Island City neighborhood was 20,030" per 2010 census, "Covering
an area of 540.94 acres". Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER:
aggregator. **Note the two figures measure different things; do not conflate.**

**F8.** Constituent sub-areas. "In 1870, the villages of Astoria , Ravenswood , Hunters Point, Dutch
Kills, Middletown, Sunnyside , Blissville, and Bowery Bay were incorporated into Long Island City."
Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER: aggregator.

---

## B. History

### B1. Incorporation as an independent city

**F9.** "Long Island City was incorporated as a city on May 4, 1870, from the merging of the village
of Astoria and the hamlets of Ravenswood , Hunters Point , Blissville , Sunnyside , Dutch Kills ,
Steinway, Bowery Bay and Middleton in the Town of Newtown."
Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER: aggregator.

**F10. ⚑ DATE CONFLICT with F9.** The LPC designation report for the courthouse gives a different
date: "These conditions inspired local residents to action in 1870, and on **May 6** of that year
incorporation of the area as a township was approved by the state legislature."
Source (primary): LPC Designation Report LP-0925, New York State Supreme Court, Queens County, Long
Island City Branch, May 11, 1976 — http://s-media.nyc.gov/agencies/lpc/lp/0925.pdf
**May 4 (aggregator) vs May 6 (LPC). NOT RESOLVED.**

**F11.** Also note LP-0925 calls it a "township," not a "city." Verbatim: "incorporation of the area
as a township was approved by the state legislature." Same source as F10.

**F12.** "At the time of its incorporation, Long Island City had between 12,000 and 15,000
residents." Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER: aggregator.

**F13.** First mayor. "Residents elected A.D. Ditmars the first mayor; Ditmars ran as both a Democrat
and a Republican ." Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER: aggregator.
Corroborated with a different spelling by LPC: "Abram D. Ditmars was elected the first mayor of the
new township and he appointed a charter committee to review and suggest better ways to manage the new
city." — LP-0925, http://s-media.nyc.gov/agencies/lpc/lp/0925.pdf
**⚑ Name-form conflict: "A.D. Ditmars" vs "Abram D. Ditmars". Also note the surname Ditmars is the
same name as the adjacent neighborhood Ditmars-Steinway — relevant to this wave.**

**F14.** LP-0925 lists the reforms of the first administration: "The result of their efforts was the
implementation of a public school system, the surveying and paving of streets, the establishment of a
regular police force, equitable tax assessments and, most important of all, a pure water supply."
Source: http://s-media.nyc.gov/agencies/lpc/lp/0925.pdf

**F15.** Origin of the name. "The name Long Island City was probably first suggested by Levi Hayden
who prophe- sied in 1853 that this area would eventually be united as 'Long Island City.'"
Source (primary): LP-0925, http://s-media.nyc.gov/agencies/lpc/lp/0925.pdf [OCR artifacts: line-break
hyphenation in "prophe- sied"].

**F16. ⚑ COMPETING ORIGIN STORY for the name.** NYC Parks says the name came from a newspaper:
"Officials debated a name for the new union, and finally agreed on Long Island City, after the
newspaper that had started operation there in 1865, the Long Island City Star."
Source: https://www.nycgovparks.org/parks/van-alst-playground/history
LP-0925 gives the newspaper's name differently: "In 1865 The Star newspaper began publishing as the
Long Island Star, its new name suggesting the growth of community spirit and identity."
Source: http://s-media.nyc.gov/agencies/lpc/lp/0925.pdf
**Three variants in play — Levi Hayden's 1853 coinage, "Long Island City Star", "Long Island Star".
NOT RESOLVED.**

**F17.** Coat of arms. "The Common Council of Long Island City in 1873 adopted the coat of arms as
'emblematical of the varied interest represented by Long Island City.' It was designed by George H.
Williams, of Ravenswood ."
Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER: aggregator.

**F18. Astoria tried to secede from Long Island City — directly relevant to this wave.** "In the
1880s, Mayor De Bevoise nearly bankrupted the Long Island City government by embezzlement , of which
he was convicted. Many dissatisfied residents of Astoria circulated a petition to ask the New York
State Legislature to allow it to secede from Long Island City and reincorporate as the Village of
Astoria, as it existed prior to the incorporation of Long Island City, in 1884. The petition was
ultimately dropped by the citizens."
Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER: aggregator.

**F19.** Last mayor. "The last mayor of Long Island City was an Irish-American named Patrick Jerome
'Battle-Axe' Gleason ." Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.
Primary corroboration and the origin of the nickname, from LPC: "The last Long Island City mayor
'Battle-Axe' Gleason was the most colorful of these public-spirited individuals. Gleason earned his
name in July of 1888 when he and his supporters, armed with axes, chopped to pieces a fence erected
by the Long Island railroad on a local street as a barrier intended to force the general public to
purchase r…" [quote truncated in the fetched text].
Source: http://s-media.nyc.gov/agencies/lpc/lp/0925.pdf

**F20.** Consolidation. "The city surrendered its independence in 1898 to become part of the City of
Greater New York." Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

**F21.** "Long Island City was originally the seat of government of the Town of Newtown , before
becoming part of the City of Greater New York in 1898."
Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

**F22.** Immigration/demographic turnover in the 19th century, from LPC: "As the town grew, the older
English and Dutch families were replaced by the Irish and other immigrants from Europe."
Source (primary): http://s-media.nyc.gov/agencies/lpc/lp/0925.pdf

### B2. Colonial and pre-incorporation history (Hunters Point)

All of B2 is from the **primary** LPC designation report LP-0450, Hunters Point Historic District,
May 15, 1968 — http://s-media.nyc.gov/agencies/lpc/lp/0450.pdf . **[OCR artifacts throughout this
1968 scan; quoted spans below were chosen for legibility but still contain some corruption.]**

**F23.** "Hunters Point, the name given to this section of Queens, once an actual ledge of rocks in
tho East River, was first settled early in the Seventeenth Century, when the Rev. Everardus Bogardus
purchased it and nearby Ravenswood from the Netherlands' goverrnnent." [OCR: "tho", "goverrnnent"]

**F24.** "The fiery Bogardus was the first minister of the Dutch Church in New iunsterdam. Becaus e of
Bogardus' calling, the land became known as Dominic's Hook." [OCR: "New iunsterdam" = New Amsterdam]

**F25.** "Bogardus having been lost at sea, on November 26, 1652, tho estate was decreed to his widow,
Anneke Jans by Governor Peter Stuyvesant, Dnd in 1669 the British governor, Sir Richard Nicolls,
confirmed the decree."

**F26.** "In 1697, Dominie's Hook was purchased by Captain Peter Praa, a French Huguenot, whose family
had fled first to the NethorlDnds and later to the New World to escap0 religious persecution."

**F27.** "In 1800 her son, Jacob Bennett, chDnged the name from Dominic's Hook to Bennett's Point."

**F28.** "Jacob Bennett died in 1817, willing tho land to his only child, .l\nnetia, and her husband,
Captain George Hunter. Nineteen other heirs contested the will because they doubted Jacob's mental
soundness at the time the will was drawn. However, it was declared valid and in 1825 the name of the
estate was changed to Hunters Point."

**F29. ⚑ CONFLICTING ACCOUNT of who George Hunter was.** LP-0450 (above) describes Captain George
Hunter as the husband of Jacob Bennett's daughter. Wikipedia says: "The area took the name Hunters
Point in 1825, named after British sea captain George Hunter whose family operated the site as a
210-acre farm." Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.
**The 210-acre figure appears only in the aggregator. NOT RESOLVED.**

**F30.** Union College's speculative purchase. "This was done on June 17, 1835 when Jeremiah Johnson,
a representative of Eliphalct Nott, President of Union College , Schenectady, bought the land far
$100,000." [OCR: "Eliphalct" = Eliphalet; "far" = for]

**F31.** "In 1853, tho hill which formed the nucleus of the estate was levelled nnd the soil used to
extend the shore line at Borden ~venue into the East River." — i.e. **[PARAPHRASE]** the Hunters
Point shoreline is partly made land from a levelled hill.

**F32.** Railroad arrival. "In 1861, the Long IslDnd Railroad was persuaded to move its Brooklyn
terminus t o Hunters Point. Travelers from Manhattan now disembarked here from the Thirty-Fourth
Street ferry to transfer to tho railroad."

**F33.** "Residents of Hunters Point thus saw Theodore Roosevelt on his way to Sagamore Hill and later
witnessed the IIInerican troops as they wore sent to fight in Europe during World War I." [OCR:
"IIInerican" = American]

**F34.** "The movement marke d the beginning of a chnnge of chnracter in the neigh- borhood as inns
and taverns wore openod to accommodnte the cammuters."

**F35.** Near-secession to Brooklyn. "In 1865 it was proposed that Bunters Point secede from
agricultural Newtown mid form a separate township. It was at first thought that the area would join
the city of Brooklyn, but in 1870 it chose instccid t o become a part of tho proposed Long Island
City." [OCR: "Bunters" = Hunters; "instccid" = instead]

**F36.** County seat moved to LIC. "Soon after the incorporation, the state Legislature authoriz&d the
moving of the Queens county s oat to tho now city, perhaps because of its proximity to tho cities of
Now York and Brooklyn. In 1872, tho State Legislature finnnced the building of a county courthouse in
Hunters Point on land donated by Union College for that purpose. Hunters Point thus boc::ime the scat
of government for both Long Island City and Queens County."

**F37.** "White Collar Row". "The stone houses erected were unique in HUhters Point, for most of the
houses were wooden. The block became the neighborhood showplace and was known as 'White Collar Row'.
The development was begun by Spencer B. Root of Greenfield, Massachusetts and John P. Rust of
Brooklyn, New York who bought the land from Union College on December 22, 1870."

**F38.** Van Alst farm origins of the district's land. "On September 16, 1670, two large plantations
had b8cn confirmed to George Van Alst. These remained quietly in the family for nearly two hundred
years, until 1861 when they were purchased by the trustees of Union College as an addition to their
Hunters Point holdings." [OCR: date printed as "1670" in one place and "16 70" context — verify.]

### B3. Dutch Kills, Ravenswood, Blissville, Sunswick

**F39.** Meaning of "Dutch Kills". "'Kill' is a Dutch word which means 'little stream,' and the area
takes its name from the 1643 Dutch settlement near the 'kill' that flowed south to Newtown Creek. A
small village surrounded by outlying farms developed here during the 17th and 18th centuries."
Source: https://www.nycgovparks.org/parks/dutch-kills-playground/history

**F40.** "The Long Island Rail Road arrived in 1861, and several factories opened in the area. Dutch
Kills joined Astoria Village, Hunter's Point, Ravenswood, Middletown, and Blissville (now Sunnyside)
to form Long Island City in 1870. The Queensboro Bridge, opened in 1909, directly linked the
community to Manhattan."
Source: https://www.nycgovparks.org/parks/dutch-kills-playground/history
**⚑ Note this source equates Blissville with Sunnyside ("Blissville (now Sunnyside)"), which conflicts
with F45 below, where Blissville and Sunnyside are separate. NOT RESOLVED.**

**F41.** Mespeatch peoples and the creek. "This site was once home to the Mespeatch peoples, whose
name means 'at the bad water place' or 'overflow,' most likely referring to the areas surrounding
swamp lands and stagnant water. The Canapaukah Creek, now known as the Dutch Kills, a tributary of
Newtown Creek (Mespeatches Kill), flowed up to modern-day Queens Plaza."
Source: https://www.nycgovparks.org/parks/murray-playground/history

**F42.** Burger Jorissen's 1643 mill and the surviving millstones. "In 1643, Burger Jorissen received
a patent for land along the Canapaukah, which would have encompassed this site. Jorissen, a
well-respected Blacksmith from Silesia, constructed a mill powered by the creek. Though the dam
Jorissen built across the body of water was demolished in 1861 due to the construction of the Long
Island Railroad, one can still find traces of the mill at the Dutch Kills Green, where two gristmill
stones reside. The twin stones were originally preserved by a descendant of the Payntar-Skillman
family, who acquired the mill and much of the land in the area in 1801."
Source: https://www.nycgovparks.org/parks/murray-playground/history
**Strong visitor-facing candidate: two 17th-century gristmill stones on public display at Dutch Kills
Green, Queens Plaza.**

**F43.** Subway spoil filled Dutch Kills. "By 1910, most of Dutch Kills had been filled with excavated
soil from nearby subway construction. The area quickly became a center for transportation and
industry. Standard Oil Company occupied much of the 11th Street basin one block away, and an iron
works and machine shop were just to the west of the playground across 11th Street."
Source: https://www.nycgovparks.org/parks/murray-playground/history

**F44.** Naming of Ravenswood — a clergyman's rename. "This playground is named after Ravenswood, the
shoreside Long Island City neighborhood in which it resides. In 1831, Reverend Francis Lister Hawks
(1798-1866) moved from South Carolina to New York… Reverend Hawks stumbled on the area in the 1830s
and named it Ravenscroft after his friend and fellow clergyman, John Stark Ravenscroft (1772-1830).
Years went by, and the settlement deteriorated significantly. Hawks reconsidered having his friend's
name attached to such a location, and renamed it Ravenswood, a linguistic sleight-of-hand; Ravenswood
and Ravenscroft bear the same meaning, as 'croft' means 'wood' in Middle English."
Source: https://www.nycgovparks.org/parks/ravenswood-playground/history
**Note this source explicitly calls Ravenswood "the shoreside Long Island City neighborhood" while
assigning the playground ZIP 11106 / Community Board 1. See Section J.**

**F45.** Blissville. "Blissville, which has the ZIP Code 11101, is a neighborhood within Long Island
City… bordered by Calvary Cemetery to the east; the Long Island Expressway to the north; Newtown
Creek to the south; and Dutch Kills, a tributary of Newtown Creek, to the west. Blissville was named
after Neziah Bliss, who owned most of the land in the 1830s and 1840s."
Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

**F46.** "Bliss built the first version of what was known for many years as the Blissville Bridge, a
drawbridge over Newtown Creek, connecting Greenpoint, Brooklyn and Blissville; it was replaced in the
20th century by the Greenpoint Avenue Bridge , also called the J. J. Byrne Memorial Bridge, located
slightly upstream." Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

**F47.** Sunswick / the Gibbs estate. "This was once the site of Colonel George Gibbs's (1776-1833)
estate which included a mansion and farmlands overlooking the East River. Gibbs was a mineralogist
whose collection can be found at the Yale Peabody Museum. Originally from Newport, Rhode Island, he
bought property in this area in 1814 that was once called Sunswick, which is believed to be the
Algonquin word for 'woman chief' or 'Sachem's wife'. After Gibbs died in 1833, three developers
divided his land into nine estates."
Source: https://www.nycgovparks.org/parks/ravenswood-playground/history

**F48.** Dutch Kills in the Revolution. "Dutch Kills was an important road hub during the American
Revolutionary War , and the site of a British Army garrison from 1776 to 1783."
Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

**F49.** Peter G. Van Alst, LIC surveyor. "Born in Dutch Kills, Queens on May 28, 1828, Van Alst
received his education at the District School and the Astoria Institute… in 1872, when the city
legislature appointed him to serve as a commissioner, surveying and supervising the construction of
several roads in Long Island City, Queens. In 1874, Van Alst and three fellow Long Island City
citizens comprised the First Ward Improvement Commission, which was in charge of raising the grades
of Jackson Avenue from Vernon Avenue to the courthouse from three to eight feet, which profoundly
affected the daily life of the city."
Source: https://www.nycgovparks.org/parks/van-alst-playground/history
**Note: "Their Dutch family name was perpetuated in the naming of Van Alst Street, until it was
renamed 21st Street" — same source.**

### B4. 20th century decline and 21st century growth

**F50.** "Through the 1930s, three subway tunnels, the Queens-Midtown Tunnel , and the Queensboro
Bridge were built to connect the neighborhood to Manhattan. By the 1970s, the factories in Long
Island City were being abandoned."
Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

**F51.** "In the 1990s, Queens West on the west side of Long Island City was developed to revitalize
74 acres (30 ha) along the East River , with plans to bring in as many as 16,000 new residents in a
total of 19 new buildings." Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

**F52.** "In 2001, the neighborhood was rezoned from an industrial neighborhood to a residential
neighborhood, and the area underwent gentrification , with developments such as Hunter's Point South
being built in the area." … "with 41 new residential apartment buildings being built just between
2010 and 2017." Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

**F53.** Amazon HQ2. "The selection was confirmed by Amazon on November 13, 2018… On February 14,
2019, Amazon announced it was pulling out, citing unexpected opposition from local lawmakers and
unions." Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.
**High-salience but aggregator-only here; re-source before use.**

**F54.** LIC BID. "Since 2005, part of the neighborhood has been maintained by the LIC Partnership as
part of the Long Island City Business Improvement District… Initially, the business improvement
district comprised 84 properties on either side of Queens Plaza. The BID was expanded in 2017… and
the BID was again expanded in 2024." Source: https://en.wikipedia.org/wiki/Long_Island_City —
aggregator.

**F55.** Asian population growth. "According to a New York Times article from October 18, 2021, the
Asian population of Long Island City has grown fivefold since 2010 nearing 11,000 residents making up
34% of the neighborhood's population. The new Asian residents are mainly Chinese, Bengalis, Koreans,
and Japanese, and the neighborhood had at least 15 Asian-owned businesses in the neighborhood."
Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator, itself citing NYT.
**This is an aggregator's summary of a paywalled NYT article. Do NOT treat the numbers as verified.**

---

## C. Designated landmarks — PRIMARY designation documents obtained

**There are exactly six NYC-designated landmarks assigned to Long Island City** in the index I used,
and I retrieved the LPC designation report PDF for **all six**. Index:
https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_Queens (aggregator, used
only to obtain LP numbers; each LP number was then fetched from the City's own server).

### P16 / F56. Hunters Point Historic District — LP-0450, designated **May 15, 1968**
Primary: http://s-media.nyc.gov/agencies/lpc/lp/0450.pdf
- Header verbatim: "Landmarks Preserv~tion Commission … May 15, 1968, Calendar No. 2 … HUNTERS POINT
  HISTORIC DISTRICT, Borough of Queens" [OCR artifacts].
- Boundary verbatim: "The property bounded by the southern property lines of 21-12 through 21-48 4Sth
  Avenue, the eastern property line of 21-48 45th Avenue, 4Sth Avenue, 23rd Street, the northern
  property lines of 44-70 23rd Street and 21-SS through 21-09 4Sth Avenue, the western property line
  of 21-09 45th Avenue, 45th Avenue and the western property line of 21-12 45th Avenue." [OCR: "4Sth"
  = 45th; "21-SS" = 21-55 (unconfirmed)].
- Public hearing: "On November 22, 1966, the Landmarks Preservation Commission held a public hearing
  on the proposed designation of the Hunters Point Historic District (Item No. 1)."
- Character: "The Hunters Point Historic District is a microcosm of the domestic archi- tecture of
  New York City from the Civil T..rar to the turn of the Century." [OCR: "Civil T..rar" = Civil War]
- Extent: "This small Historic District extends along Forty-Fifth Avenue between Twenty-First and
  Twenty-Third Streets."
- Standout rows: "Particularly outstanding are those rows Numbers 21-12 through 21-20 on the south
  side and 21-21 through 21-29 on the north side . These handsome town houses with their pedimented
  doorways , and their fine segmental-arched windows, with arched lintels carried on brackets, lend
  an air of great dignity to this Avenue."
- Testimony from a resident at the 1966 hearing (Salvatore Saraceno): "About eight years ago when I
  first saw 4Sth Avenue I thought it was an unusual street …. I was very fortunate to find one for
  sale, which I bought and renovated, changing it from a legal rooming house to a legal two family."
- Queens Borough President Mario J. Cariello's letter, verbatim as printed: "…. let me commend you on
  your selection of the proposed site. I agree with you entirely that you may expect considerable
  support from this neighborhood."

**F57. ⚑ COUNT CONFLICT on the number of houses in the district.**
- Aggregator A: "A collection of 47 Italianate , French Second Empire , and Neo-Grec townhouses on
  45th Avenue, built in 1871–1890." — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_Queens
- Aggregator B: "a national historic district that includes 19 contributing buildings along 45th
  Avenue between 21st and 23rd Streets." — https://en.wikipedia.org/wiki/Long_Island_City
**47 vs 19. Different designations (NYC district vs NRHP district) may be counting different things.
NOT RESOLVED — flagged.**

**F58.** NRHP listing of the same district: reference number **73001251**, listed **September 19,
1973**, location given as "Along 45th Ave., between 21st and 23rd Sts.", city "Long Island City".
Index source: https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens_County,_New_York
**Primary nomination NOT obtainable:** https://npgallery.nps.gov/NRHP/GetAsset/NRHP/73001251_text
returns the literal text "The PDF file for this National Register record has not yet been digitized."
Area given as "1.5 acres (0.61 ha)"; architectural style "Mixed (More Than 2 Styles From Different
Periods)" — https://en.wikipedia.org/wiki/Long_Island_City (aggregator).

### P17 / F59. New York State Supreme Court, Queens County, LIC Branch — LP-0925, **May 11, 1976**
Primary: http://s-media.nyc.gov/agencies/lpc/lp/0925.pdf
- Verbatim header: "NEW YORK STATE SUPREME COURT, QUEENS COUNTY, LONG ISLAND CITY B~CH, 25-10 Court
  Square, Long Island City, Borough of Queens. Built 1872-1876, architect George Hathorne; rebuilt
  1904-1908, architect Peter M. Coco." [OCR: "B~CH" = BRANCH]
- Landmark Site: "Borough of Queens Tax Map Block 83, Lot 1."
- Hearing: "On March 23, 1976, the Landmarks Preservation Commission held a public hearing… Five
  witnesses spoke in favor of designation."
- Description: "The courthouse at Long Island City, a dignified and monumental nee-English
  Renaissance building designed in the early years of the twentieth century, today houses a branch of
  the State Supreme Court. A prominent structure in Queens, it is not only architecturally notable,
  but also a striking visual reminder of the history of the area." [OCR: "nee-English" = neo-English]
- Predecessor courthouse ("Old Brig") color: "The 'Old Brig' had a colorful history and one sheriff,
  in the early 1800s, sold liquor there in ~is spare time… The resourceful sheriff, obeying the legal
  notice, built a lean- to shed in front of the building and continued to ply his trade through an
  adjoining window into the courthouse." … "In 1910, after being vacant for some time, 'Old Brig'
  burned down. The fire was seen for miles by the local residents who had always described the old
  building as resembling a windmill." **[The "Old Brig" was in Jamaica, NOT in LIC — do not
  mis-assign this anecdote to LIC.]**
- Why the seat moved: "In the mid-nineteenth century it had been decided to move the Queens County
  Seat from Jamaica to a more convenient location. A logical site for this relocation was near the
  convergence of all the Long Island railroad lines in the newly formed township of Long Island City."
- On LIC's pre-1870 composition: "Long Island City had previously consisted of several communities,
  the most important of which were Newtown and Astoria." **⚑ This conflicts with F9/F8, which list
  Astoria plus Ravenswood/Hunters Point/Blissville/Sunnyside/Dutch Kills/Steinway/Bowery Bay/
  Middleton and place LIC within the Town of Newtown rather than containing it. NOT RESOLVED.**
- Corruption context: "Rapid development in the 1860s resulted in a series of disjointed areas
  without sufficient municipal services, while corrupt politicians, the most notorious group being
  the Newtown ring, consisting mainly of liquor dealers, were in power."
- NRHP: "Long Island City Courthouse Complex", ref **83001776**, listed **September 26, 1983**,
  "25-10 Court Sq." — index https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens_County,_New_York ;
  primary nomination not digitized (same NPS message as F58).
- Aggregator description: "English Renaissance Revival courthouse dating from 1872–1876, and rebuilt
  in 1904–1908." — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_Queens

### P18 / F60. New York Architectural Terra Cotta Works Building — LP-1304, **August 24, 1982**
Primary: http://s-media.nyc.gov/agencies/lpc/lp/1304.pdf
- Verbatim header: "NEW YORK ARCHITECTURAL TERRA COTTA WORKS BUILDING, 42-10 -- 42-16 Vernon
  Boulevard, Borough of Queens. Built in 1892." Landmark Site: "Borough of Queens Tax Map Block 477,
  Lot 20."
- Hearing: "On June 8, 1982, the Landmarks Preservation Commission held a public hearing… A total of
  10 witnesses spoke 1n favor of designation at the hearing. There were two speakers in opposition to
  designation."
- Significance: "The New York Architectural Terra Cotta Works Building is a unique vestige of one of
  the most important terra cotta manufacturing concerns in the Northeast. Built in 1892, the building
  served as the office headquarters of the New York Architectural Terra Cotta Company, New York's only
  major manufacturer of architectural terra cotta."
- "It is a veritable catalogue of the company's art and the only one of its kind known to survive in
  the United States."
- Company founding: "The New York Architectural Terra Cotta Company, which owed much of its success
  to Taylor's expertise, was established in 1886 by New York real estate magnate Orlando B. Potter,
  with his son-in-law, attorney Walter Geer."
- James Taylor: "Taylor has been called the 'father of architectural terra cotta' in the United
  States."
- **⚑ Neighborhood-language of interest:** "A six-story manufac- turing building on the waterfront in
  the once rural **Ravenswood area of Queens (now Long Island City}**, was built on the site of the
  Wallach estate." — i.e. the City's own document treats Ravenswood as having been absorbed into LIC.
- Plant layout: "The first kiln was set in operation at the works on April 29, 1886. The cellar of the
  new factory contained clay pits, an engine, and machinery for burning clay. The ground floor had
  kilns and offices . The second floor had a showroom, and molding rooms were located on the third and
  fourth floors. The top floor had a draft- ing room and modelling studios. The old Wallach mansion was
  used for showrooms and private offices."
- Architect of the manufacturing building: "The architect was Clarence B. Cutler of Troy, New York."
- Aggregator style description: "Renaissance and Tudor Revival building constructed in 1892 as the
  headquarters of the New York Architectural Terra-Cotta Company , the city's sole architectural
  terracotta manufacturer." —
  https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_Queens
  **⚑ Note LPC says "New York's only major manufacturer"; the aggregator says "the city's sole
  architectural terracotta manufacturer". "Only major" ≠ "sole". Flagged.**

### P19 / F61. Pepsi-Cola Sign — LP-1653, designated **April 12, 2016**
Primary: http://s-media.nyc.gov/agencies/lpc/lp/1653.pdf
- Verbatim header: "Pepsi-Cola Sign, 4-09 47th Road, Long Island City, Queens. Built: 1940; General
  Outdoor Advertising Company, Manufacturer. Restored: 1993; Artkraft Strauss Sign Corporation,
  Manufacturer. Permanently Relocated: 2009."
- Landmark Site: "Borough of Queens, Tax Map Block 21, Lot 120"
- **A 28-year designation fight — strong narrative material.** "On April 19, 1988, the Landmarks
  Preservation Commission held a public hearing on the proposed designation as a Landmark of Pepsi
  Cola Sign… Two people testified against designation… The owner's attorney requested a continuance.
  The public hearing was continued on July 12, 1988… The Chair noted opposition from Queens Borough
  President's office." Then: "On October 8, 2015, the Landmarks Preservation Commission held a special
  public hearing… The owner spoke in opposition to designation. Ten people spoke in favor of
  designation, including State Senator Tony Avella, The Queens Borough Historian, and representatives
  from the Queens Preservation Council, the Historic District Council, the Municipal Art Society, the
  Four Borough Neighborhood Preservation Alliance, and the New York Landmarks Conservancy."
- Summary verbatim: "One of the best known features of the New York City waterfront, the Pepsi-Cola
  Sign has become an iconic piece of the urban landscape, representing commercial advertising and
  American industry. The Pepsi-Cola Sign was constructed in 1940 and erected on the roof of the
  Pepsi-Cola bottling facility in Long Island City."
- "At the time of its construction, the Pepsi-Cola Sign was the longest electric sign in New York
  State."
- "Situated on the edge of the East River, the sign was clearly visible from Manhattan's East Side and
  the recently completed FDR."
- "The 50-foot painted Pepsi bottle was probably replaced in the 1970s with an updated bottle
  featuring the company's contemporary design. In 1993, the 53-year-old sign was rebuilt due to
  significant deterioration."
- "In 2003, Pepsi sold their facility to the Queens West Development Corporation. The Pepsi-Cola
  bottling facility was demolished and the sign was temporally relocated. Today, the sign stands
  within feet of its original location inside Gantry Plaza State Park." [sic: "temporally"]
- Dimensions: "The grid structure is 49 feet high and 150 feet long and is constructed of 'L' angle
  rail. It is supported by trusses spaced evenly along the approximately 150-foot span." Foundation:
  "40 piles driven into the bedrock with four, five-foot concrete pile caps."
- Logo: "The Pepsi-Cola trademark logo consists of the words 'Pepsi' and 'Cola' separated by a colon.
  The bottom of the letters begin 20 feet above ground level".
- Closing significance: "The Pepsi-Cola Sign remains one of the most conspicuous features on the New
  York waterfront and serves as a reminder of Long Island City's industrial past."

### P20 / F62. Fire Engine Company No. 258, Hook and Ladder Company No. 115 — LP-2200, **June 20, 2006**
Primary: http://s-media.nyc.gov/agencies/lpc/lp/2200.pdf
- Verbatim header: "Fire Engine Company No. 258, Hook and Ladder Company No. 115, 10-40 47th Avenue
  (aka 10-38 to 10-40 47th Avenue) Queens, New York. Built 1902-4; Bradford Lee Gilbert, architect."
- Landmark site: "Borough of Queens Tax Map Block 46, Lot 34."
- Hearing: "On May 16, 2006 the Landmarks Preservation Commission held a public hearing… Three
  witnesses spoke in favor of designation".
- Aggregator style label: "Renaissance Revival firehouse built in 1902–1904." —
  https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_Queens
- Still an active firehouse: "Engine Company 258/Ladder Company 115 – 10-40 47th Avenue" listed among
  FDNY stations serving LIC — https://en.wikipedia.org/wiki/Long_Island_City (aggregator).
  **[PARAPHRASE] A visitor-relevant point: this is a working firehouse, not a museum.**

### P21 / F63. Bank of the Manhattan Company Building ("Long Island City Clocktower") — LP-2570, **May 12, 2015**
Primary: http://s-media.nyc.gov/agencies/lpc/lp/2570.pdf
- Verbatim header: "BANK OF THE MANHATTAN COMPANY BUILDING, LONG ISLAND CITY / 29-27 Queens Plaza
  North (aka 29-27 41st Avenue, 29-39 Northern Blvd), Borough of Queens / Built 1925-27; Morrell
  Smith, architect."
- Landmark Site: "Borough of Queens Tax Map Block 403, Lot 9."
- Hearing: "On April 21, 2015, the Landmarks Preservation Commission held a public hearing… Six people
  spoke in favo[r]…"
- **⚑ DATE CONFLICT.** LPC's own header says "Built 1925-27". The aggregator index says "Queens' first
  skyscraper, a neo-Gothic clock tower built in **1927** by the Manhattan Company ."
  https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_Queens
  **1925-27 vs 1927. Also the "Queens' first skyscraper" claim is aggregator-only. NOT RESOLVED.**
- **⚑ NAME CONFLICT.** Wikipedia's LIC article refers to this as "the Chase Manhattan Bank Building"
  in its landmark list — https://en.wikipedia.org/wiki/Long_Island_City . LPC calls it "Bank of the
  Manhattan Company Building". Address given in the index as "29-27 41st Avenue"; LPC gives "29-27
  Queens Plaza North (aka 29-27 41st Avenue, 29-39 Northern Blvd)". **Three street names for one
  building — record all three.**

### P22 / F64. Ed Koch Queensboro Bridge — LP-0828, **April 16, 1974**
Primary (LPC): http://s-media.nyc.gov/agencies/lpc/lp/0828.pdf
Primary (NYC DOT): https://www.nyc.gov/html/dot/html/infrastructure/queensboro-bridge.shtml
- LPC verbatim header: "Q.UEENSBORO BRIDGE (excluding the service building o.nd elevator on Roosevelt
  Island), 11th Street and Bridge Plaza North and Bridge Plaza South, Borough of Queens, to Second
  Avenue and East 59th Street and 60th Street, Borough of Manhattan . Begun 1901, completed 1908 ·,
  arc hi teet Henry Hornbostel." [OCR artifacts]
- LPC on completion/opening: "Because of modifications made in the original plans, the bridge was not
  completed until June 15, 1908. It vras opened to traffic on **March 30, 1909** and to pedestrians on
  **June 12, 1909**."
- **⚑ MAJOR DATE CONFLICT.** NYC DOT says: "the Ed Koch Queensboro Bridge was constructed between 1901
  and 1909. The bridge opened to traffic on **June 18, 1909** as the longest cantilever bridge in the
  United States." — https://www.nyc.gov/html/dot/html/infrastructure/queensboro-bridge.shtml
  **March 30, 1909 (LPC) vs June 18, 1909 (DOT). Two City agencies disagree. NOT RESOLVED.**
- Design lineage (LPC): "Hornbostel's design for the bridge appears to have been influenced by Jean
  Resal 's Pont Mirabeau in Paris which 1vas completed in 189 5, while Hornbostel was a student at the
  Ecole des Beaux Arts. Montgomery Schuyler, the noted architec- tural critic, described the two
  outside spans of the Queensboro Bridge as having 'the sllape of the universally admired curves of
  the Pont Mirabeau' in The Archi- tectur~l Record of October, 1905 ." [OCR: "sllape" = shape]
- Structure (LPC): "The Queensboro Bridrse is a 'through-type' cantilever in vrhich the roadway passes
  beb•een the towers and trusses as opposed to a 'deck-type' cantilever… The length of the bridge is
  over 7,000 feet and it has a clearance of 135 feet above high water level."
- Original configuration (LPC): "vlhen the bridge ,.,as first opened, there were four elevated railroad
  tracks for the Second Avenue 11 E111 on the upper level; four trolley tracks and a roadway ran on the
  lower level."
- DOT facts verbatim: "An average of 129,874 vehicles, 7,568 cyclists, and 2,785 pedestrians travel
  over the Ed Koch Queensboro Bridge each day." / "Total length: 3,725 feet" / "Total length including
  the approaches: 7,449 feet" / "75,000 tons of steel went into the original bridge and its
  approaches. Its original cost was about $18 million, including $4.6 million for land."
  **⚑ Note DOT's "Total length: 3,725 feet" vs LPC's "length of the bridge is over 7,000 feet" — the
  two are reconcilable only via the approaches figure. Flagged, not resolved.**
- DOT: "This five span cantilever truss bridge, designed to accommodate heavier loads, is the only one
  of the four great East River Bridges that is not a suspension bridge."
- DOT: "In 2025, the south outer roadway was converted into a dedicated space for pedestrians."
- **⚑ THIRD DATE CONFLICT.** DOT: "The Ed Koch Queensboro Bridge was designated as a national landmark
  on November 23, 1973." But the NRHP index gives listing date **December 20, 1978**, ref **78001879**
  ( https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens_County,_New_York )
  and LPC designation is April 16, 1974. **Three different dates for three different (or conflated)
  designations. NOT RESOLVED.**
- Also: DOT spells the architect "Henry Hornbosted"; LPC spells "Henry Hornbostel". **Flagged.**
- NRHP location field: "59th St.", city "Long Island City", with note "Also listed in the Borough of
  Manhattan".
- Popular alternate name per DOT: "also known as the 59th Street Bridge".

---

## D. Other National Register listings in LIC

**F65. US Post Office–Long Island City** — NRHP ref **88002348**, listed **May 11, 1989**, address
"4602 21st St.", city "Long Island City".
Index: https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens_County,_New_York
Nomination PDF not digitized (NPS returns "The PDF file for this National Register record has not yet
been digitized." at https://npgallery.nps.gov/NRHP/GetAsset/NRHP/88002348_text ).
**⚑ Address-format conflict:** NRHP writes "4602 21st St."; Wikipedia's LIC article writes "the Long
Island City Station at 46-02 21st Street"; the QPL/postal convention is hyphenated Queens format.
Not resolved.

**F66. 45th Road–Court House Square Station (Dual System IRT)** — NRHP ref **05000229**, "Added to
NRHP March 3, 2005", MPS "New York City Subway System MPS".
Source: https://en.wikipedia.org/wiki/Court_Square_station — aggregator.
- "In 2005, the station was listed on the National Register of Historic Places ." (same source)
- "The IRT's 45th Road–Court House Square station opened on November 5, 1916, as part of a two-stop
  extension of the line from Hunters Point Avenue to Queensboro Plaza". (same source)
- **This gives LIC a fifth NRHP entry that is easy to miss because the station has since been
  renamed.** The station is now part of the Court Square–23rd Street complex.

---

## E. Museums and cultural institutions

### P1 / F67. MoMA PS1 — 22-25 Jackson Avenue
Primary: https://www.momaps1.org/en/visit and https://www.momaps1.org/en/about
- Address verbatim from the Visit page: "22-25 Jackson Avenue" / "Long Island City, Queens".
- Also given as "22-25 Jackson Avenue, Queens, NY 11101" with neighborhood "Long Island City, Queens".
- **Free admission, verbatim:** "MoMA PS1 is a place for everyone. Free admission for all is made
  possible by Sonya Yu." with "Adults FREE / Seniors 65+ with ID FREE / Students with ID FREE /
  Children 16 and under FREE" and "General admission tickets are free for everyone."
- Hours verbatim: "Open 12–6 p.m. / Sat open 10 a.m. / Closed Tue and Wed" and "Closed Thanksgiving,
  Christmas, New Year's Day".
- Founding: "In 1976, PS1 opened with the seminal Rooms exhibition".
- Building: "a historic nineteenth-century public school building" and "Decommissioned as a public
  school in 1963".
- MoMA affiliation: "To celebrate its affiliation with the Museum of Modern Art in 2000".
- Warm Up: "Warm Up summer music series (established in 1998) connects fans to innovative and
  experimental music".
- YAP: "the Young Architects Program (1999–2019), a collaboration with MoMA that invited architects and
  designers to create experimental public environments".
- **⚑ Superlative claim, aggregator-only, needs re-sourcing:** "MoMA PS1 , an affiliate of the Museum
  of Modern Art , is the oldest and second-largest non-profit arts center in the United States solely
  devoted to contemporary art. It is named after the former public school in which it is housed." —
  https://en.wikipedia.org/wiki/Long_Island_City
- **Note on provenance:** the six MoMA PS1 quotes above marked as from `/en/about` were returned by a
  summarizing fetch tool rather than by my raw-text pipeline. **Treat them as second-hand until the
  verifier re-reads the page directly.** The Visit-page quotes (address, hours, admission) came from
  raw text I read myself.

### P2 / F68. The Noguchi Museum — 9-01 33rd Road
Primary: https://www.noguchi.org/visit/ and https://www.noguchi.org/about/mission-history/
- Address verbatim, repeated three times on the Visit page: "The Isamu Noguchi Foundation / and Garden
  Museum / 9-01 33rd Road (at Vernon Boulevard) / **Long Island City, New York 11106** / 718.204.7088"
- Self-assignment verbatim: "**Located in Long Island City, Queens**, the Museum itself is widely
  viewed as among the artist's greatest achievements."
- Founding: "Founded in 1985 by category-defining artist Isamu Noguchi (1904–1988), The Isamu Noguchi
  Garden Museum (now known as The Noguchi Museum), was the first museum in the United States to be
  established, designed, and installed by a living artist to show their own work."
- Collection & building: "Holding the world's largest collection of his works, it features open air
  and indoor galleries in a repurposed 1920s industrial building and a serene outdoor sculpture
  garden."
- Display philosophy: "Consistent with Noguchi's interest in art being experiential, works are often
  displayed without barriers or interpretation to encourage visitors to form p[ersonal…]" [truncated
  in fetched text].
- Noguchi's own words as quoted by the museum: "I define the reason for the Isamu Noguchi Museum as a
  desire to show the totality of my work as an evolving relationship significant to our time…This is
  called a garden museum as a metaphor for the world, and how an artist attempted to influence its
  becoming."
- Community line: "Fulfill Noguchi's hope that the Museum serves as a place for the local community—
  'that this is their place.'"
- Archive caption locating Noguchi's studio: "Isamu Noguchi at **32-37 Vernon Boulevard, Long Island
  City, New York, 1980s**. The Noguchi Museum Archives, 04160 ."
- Hours verbatim: "Wednesday–Sunday / 11 am–6 pm / Monday–Tuesday / Closed".
- Transit verbatim: "N & W trains: Broadway / M train: Queensbridge/21 St (weekdays) / F train:
  Queensbridge/21 S (weekends) / 7 train: Vernon-Jackson" and "Directions from NYC Ferry : Astoria".
  **[sic] "21 S" appears to be a typo for "21 St" on the museum's own page.**
- **⚑ SEE SECTION J:** the museum self-assigns to Long Island City, but its own ferry directions point
  riders to the **Astoria** landing, and the aggregator describes it as "Across the street from
  Socrates Sculpture Park is the Isamu Noguchi Foundation and Museum" —
  https://en.wikipedia.org/wiki/Long_Island_City
- Aggregator adds: "After undergoing a two-and-a-half-year renovation completed at a cost of $13.5
  million, the museum reopened in 2004 with newer and advanced facilities." (aggregator-only).
- Origin of the building's use, aggregator: "Artist Isamu Noguchi converted a photo-engraving plant
  into a workshop; the site is now the Noguchi Museum , a space dedicated to his work." —
  https://en.wikipedia.org/wiki/Long_Island_City. **⚑ Conflicts with the museum's own "repurposed
  1920s industrial building" phrasing, which does not say photo-engraving. NOT RESOLVED.**

### P3 / F69. Socrates Sculpture Park — 32-01 Vernon Boulevard
Primary (institution): https://socratessculpturepark.org/about/ — address verbatim: "**32-01 Vernon
Boulevard, Long Island City, NY 11106**".
Primary (City): https://www.nycgovparks.org/parks/socrates-sculpture-park/history
- **⚑ The City's historical sign text repeatedly frames the site as ASTORIA, while the mailing address
  is Long Island City. Both verbatim:**
  - "Throughout the 17th and 18th centuries, this narrow strait **between Astoria and Wards Island**
    was infamous for treacherous navigational conditions caused by powerful tides and dangerous rock
    outcroppings."
  - "Unfortunately, in the years preceding 1985, the long-abandoned Marine Terminal had become
    desecrated with illegal dumping and graffiti, its panoramic vista **inaccessible to citizens of
    Astoria and Long Island City**."
  - "they began the arduous process of restoring the site, and named it Socrates Sculpture Park - both
    in honor of Socrates (469-399 B.C.), the great Greek philosopher, and also as a **tribute to the
    people of Astoria, New York's largest Greek community**."
- Founding: "In 1985 a coalition of artists led by local sculptor Mark di Suvero came here with a
  vision for an outdoor sculpture laboratory dedicated to up-and-coming artists."
- "By 1990, when Socrates Sculpture Inc. was formed to raise funds, oversee the arts programming, and
  manage the daily operations of the park, di Suvero and others had restored this beautiful park and
  begun to develop its international reputation as a cultural institution."
- "Since 1993, the park has been under the jurisdiction of Parks."
- "Socrates Sculpture Park was officially assigned as Parkland on December 14, 1998."
- Hell Gate: "Situated at the confluence of the Harlem and East Rivers, the site has a picturesque view
  of 'Hell Gate,' or 'Hellegat' as originally named by the Dutch colonists."
- Shipwreck: "The 1780 shipwreck of the British ship Hussar and numerous other marine tragedies which
  occurred in this channel necessitated an 1876 effort by the Army Corps of Engineers to blast away
  much of the dangerous ledge."
- City data verbatim: "Zip Code: 11106 / Community Board: 1 / Park ID: Q465 / Acreage: 6.28 / Property
  Type: Neighborhood Park".
- Aggregator location: "Socrates Sculpture Park is an outdoor sculpture park located one block from the
  Noguchi Museum at the intersection of Broadway and Vernon Boulevard." —
  https://en.wikipedia.org/wiki/Long_Island_City

### P4 / F70. SculptureCenter — 44-19 Purves Street
Primary: https://www.sculpture-center.org/
- Verbatim from the site: "**44–19 Purves Street** / **Long Island City, NY 11101** / +1 718 361 1750"
- Hours verbatim: "Open Thu–Mon / 12pm–6pm"
- **[PARAPHRASE]** As of the fetch date the site displayed a closure notice: "SculptureCenter is closed
  for installation until Sat, Sep 19, 2026." — a transient operational fact, not a durable one.
- Aggregator history (institution's own About page 404'd on every path I tried): "SculptureCenter is
  New York City's only non-profit exhibition space dedicated to contemporary and innovative sculpture.
  SculptureCenter re-located from Manhattan's Upper East Side to a former trolley repair shop in Long
  Island City, Queens renovated by artist/designer Maya Lin in 2002. Founded by artists in 1928,
  SculptureCenter has undergone much evolution and growth". —
  https://en.wikipedia.org/wiki/Long_Island_City. **SOURCE TIER: aggregator. The "former trolley repair
  shop", the "Maya Lin, 2002" renovation, the 1928 founding, and the "only non-profit exhibition space"
  superlative are ALL aggregator-only and must be re-sourced.**

### P32 / F71. Culture Lab LIC
Primary: https://www.culturelablic.org/
- **[PARAPHRASE]** The organization's own home page describes six years of operation and a 2026 gala,
  and refers to "Culture Lab LIC's upcoming season of free public art exhibitions, community
  programming, and vital artist residency grants" (verbatim).
- Verbatim: "LIC's favorite local jazz night is back!" (Sunset JAZZ programming).
- Verbatim: "Culture Lab has evolved from a seedling of an idea into the vibrant, perennial space that
  local creatives have come to love."
- **No street address was captured in the fetched text. Address unknown — do not invent one.**

### P31 / F72. New York Irish Center
Primary: https://www.newyorkirishcenter.org/mission-2
- Mission verbatim: "The New York Irish Center's mission is to share Ireland's culture and foster
  collaboration between people of all heritages through social services, cultural and educational
  programs."
- Location & community, verbatim: "**Our Long Island City, Queens, location is paramount to our story**,
  as is our involvement with the community at large. We depend on the community, and many of the Irish
  in LIC (and surrounding neighborhoods such as Sunnyside, Woodside, Maspeth) depend on us. **Our
  building on Jackson Avenue** is central to the collective ethos of our founders, Fr. Colm Campbell
  and Paddy Reilly."
- Founding sequence verbatim: "our Long Island City property was secured in 2003. Following an enormous
  injection of sweat equity for renovations by its early members, and tremendous generosity from Irish
  building contractors, the Center opened its doors to all in 2005."
- Verbatim: "there's a céad mile fáilte (one hundred thousand welcomes) here for you!"
- **Street number not captured — only "our building on Jackson Avenue". Do not invent a number.**
- **Directly supports the Irish immigrant thread (F22, F19).**

### P33 / F73. Greater Astoria Historical Society
Primary: https://astorialic.org/about/
- Verbatim: "Greater Astoria Historical Society, founded in 1985 is the place to learn and celebrate
  **Long Island City and its neighborhoods**. Through education programs, exhibitions, the research
  library, our historic sites, and special events, GAHS offers New Yorkers and visitors to Queens a
  chance to connect with the heritage of Queens."
- Mission verbatim: "To display, present, and exhibit to the public such items of historical interest
  and significance; to conduct tours of the area relating to points of interest for informational and
  educational purposes, and to maintain a library of information relating to **the history of the Long
  Island City area**."
- Verbatim: "Bob Singleton created GAHS in the 1980's as the first Historical Society in Queens."
- Verbatim tagline: "Serving the Borough of Queens Since 1985".
- **⚑ SECTION J item and a notable one: the organization is named "Greater ASTORIA Historical Society",
  its domain is astorialic.org, and it defines its own subject matter as "Long Island City and its
  neighborhoods." It is the single clearest institutional expression of the Astoria/LIC boundary
  ambiguity in this wave.**

### P37 / F74. 5 Pointz (demolished) and the 5Pointz towers
Aggregator: https://en.wikipedia.org/wiki/Long_Island_City
- "Long Island City was the home of 5 Pointz , a building housing artists' studios, which was legally
  painted on by a number of graffiti artists and was prominently visible near the Court Square station
  on the 7 and < 7 > ​ trains ."
- "The 5 Pointz building was painted over and demolished by the property owner, starting in 2013. The
  owner was ordered to pay $6.75 million to artists as compensation."
- "In 2021, a pair of connected rental towers dubbed 5Pointz opened."
- **SOURCE TIER: aggregator for all three. The $6.75M VARA judgment is a court matter and should be
  sourced to the decision, not to an encyclopedia.**

### P50 / F75. Fisher Landau Center for Art (closed)
Aggregator: "The Fisher Landau Center for Art is a private foundation that offers regular exhibitions
of contemporary art that closed to the public in November 2017." —
https://en.wikipedia.org/wiki/Long_Island_City. **SOURCE TIER: aggregator. Note the sentence is
internally ungrammatical (present tense + closed); treat with care. A dedicated Wikipedia article did
not exist (404).**

### P44 / F76. Museum of the Moving Image — **assigns itself to ASTORIA**
Primary: https://movingimage.org/visit/
- The museum's own navigation reads verbatim: "**Getting to & Exploring Astoria**".
- Self-description verbatim: "Museum of the Moving Image is the country's only museum dedicated to the
  art, history, technique, and technology of the moving image in all its forms."
- Admission verbatim: "Adults (18+) $20 / Seniors (65+) $12 / Students (18+) $12 / Youth (3-17) $10"
  and "Free admission for Museum members and children under 3. Free Museum hours every Thursday,
  2:00–6:00 p.m."
- Hours verbatim: "Thursday 2:00–6:00 p.m. / Friday 2:00–8:00 p.m. / Saturday & Sunday 11:00 a.m.–6:00
  p.m."
- Verbatim: "Through our Open Worlds initiative, visitors have free access to the Museum's lobby, cafe,
  and Kaufman Courtyard (weather permitting) during open hours."
- **Included here ONLY because it is a Section J candidate — it is adjacent to LIC, shares ZIP 11106
  territory, and is sometimes grouped with LIC arts institutions. Its own site says Astoria.**

---

## F. Parks and the waterfront

### P5 / F77. Gantry Plaza State Park — NY State park inside LIC
Source: https://parks.ny.gov/parks/gantryplaza/details.aspx — **retrieved via a summarizing fetch tool
because the state server refused my direct client (HTTP 403). Quotes below are as that tool reported
them and are SECOND-HAND; the verifier should re-read the page.**
- Reported address: "4-44 47th Road, Long Island City, NY 11101"; size "12-acre".
- Reported verbatim on the gantries: "These industrial monuments were once used to load and unload
  railcar floats and barges; today, they are striking reminders of our waterfront's past."
- Reported verbatim on views: "spectacular views of the midtown Manhattan skyline, including the Empire
  State Building and the United Nations."
- Aggregator description: "Gantry Plaza State Park , a 12-acre (4.9 ha) park on the East River
  waterfront **between Anable Basin to the north and 50th Avenue to the south**" —
  https://en.wikipedia.org/wiki/Long_Island_City
- **Cross-link:** the Pepsi-Cola Sign now stands inside this park — see F61, LPC primary: "Today, the
  sign stands within feet of its original location inside Gantry Plaza State Park."
- **Cross-link:** NYC Parks directs dog owners here — "Dog owners are encouraged to visit the nearest
  dog run, located at Gantry Plaza State Park ." —
  https://www.nycgovparks.org/parks/murray-playground/history

### P6 / F78. Hunter's Point South Park
Primary (NYC Parks): https://www.nycgovparks.org/parks/hunters-point-south-park
- Location line verbatim: "Center Blvd. bet. 50 Ave. and 2 St. / Queens"
- Verbatim: "This waterfront park was until recently an abandoned post-industrial area **in Long Island
  City**. Transformed into a space that offers fun and relaxation for everyone in the area, the new
  park includes a central green, playgrounds, adult fitness equipment a dog run, a bikeway, a waterside
  promenade, picnic terraces a basketball court, a 30-foot-tall cantilevered platform for viewing the
  skyline and waterfront, and a 13,000 square foot pavilion that contains comfort stations,
  concessions, and an elevated cafe plaza."
- Verbatim: "Take a run along the East River waterfront in this newly constructed 10-acre park,
  featuring breath-taking views of the Midtown East skyline."
- City data verbatim: "Zip Code: 11101 / Community Board: 2 / Park ID: Q471 / **Acreage: 22.81** /
  Property Type: Neighborhood Park"
- **⚑ ACREAGE CONFLICT, three ways.** NYC Parks data field says **22.81**; NYC Parks prose on the same
  page says **"10-acre"**; NYCEDC says **11 acres**: "NYCEDC completed the park in summer 2018,
  transforming **11 acres** of an abandoned post-industrial landscape into a vibrant and resilient
  waterfront park." — https://edc.nyc/project/hunters-point-south ; and Wikipedia says "a 10-acre (4.0
  ha) park". **NOT RESOLVED.**

**F79. Hunter's Point South development (NYCEDC).** Primary: https://edc.nyc/project/hunters-point-south
- Verbatim: "Hunter's Point South is a vibrant and sustainable mixed-use community and waterfront park
  in Long Island City."
- Verbatim: "The project is a multi-agency, two-phase effort, including infrastructure and roadway
  improvements, a waterfront park, and seven residential buildings."
- By-the-numbers verbatim: "5,000 New units of residential housing"; "60% Permanently affordable
  apartments for low, moderate, and middle-income families"; "11 Acres of waterfront open space"; "1.5
  Acres of newly established wetlands".
- Verbatim: "Phase II opened in June 2018 and includes: Pedestrian and bicycle pathways / Adult fitness
  equipment / A playground / Picnic terraces and a collection of wooden seating areas / Newly
  established wetlands / A kayak launch / A 30-foot-high cantilevered platform offering unparalleled
  views of the Manhattan [skyline]"
- Project Status field verbatim: "Completed".
- **⚑ Height conflict on the same feature: NYC Parks says "30-foot-tall cantilevered platform"; NYCEDC
  says "30-foot-high cantilevered platform". (Consistent in substance; noted only for exact wording.)**

### P7 / F80. Queensbridge Park
Primary: https://www.nycgovparks.org/parks/queensbridgepark/history
- City data verbatim: "Zip Code: 11101 / **Community Board: 1, 2** / Park ID: Q104 / Acreage: 20.86 /
  Property Type: Community Park"
- **The Historical Signs Project text is EMPTY on this page** — the page renders the heading "This text
  is part of Parks' Historical Signs Project and can be found posted within the park." with no body.
  **No City history narrative is available for Queensbridge Park. Do not fill the gap from memory.**
- Aggregator location: "Queensbridge Park, a park on the East River waterfront north of Queensboro
  Bridge , within the Queensbridge Houses" — https://en.wikipedia.org/wiki/Long_Island_City

### P8 / F81. Rainey Park — **title-verified re-fetch**
Primary: https://www.nycgovparks.org/parks/rainey-park-q048/history
- Verbatim: "The site was to be the Queens anchorage of the Blackwell Island Bridge linking Queens and
  Manhattan, named so for its midpoint on Blackwell Island (now Roosevelt Island). The project backed
  by citizens of Long Island City after the American Civil War, who in 1871 incorporated the New York
  and Queens County Bridge Company."
- Verbatim: "Ultimately, the effort fell apart during the financial Panic of 1873."
- Verbatim: "Efforts were renewed the following year, under the company's then-treasurer Dr. Thomas
  Rainey, who became the organization's president in 1877. Despite Dr. Rainey's lobbying, the War
  Department withheld approval amidst concern that a bridge could interfere with the defense of New
  York and access to the Brooklyn Navy Yard."
- Verbatim: "After the consolidation of New York City in 1898, the project for a bridge between Queens
  and Manhattan gained new momentum, resulting in the construction of the Queensboro Bridge several
  blocks south."
- Acquisition verbatim: "On April 18, 1904, the City of New York acquired by condemnation several acres
  of waterfront property belonging to property owners Florence O.H. Antony, Libbie Devlin, and Dr.
  S.T.W. Sanford. A concrete sea wall was completed in 1912, and an exchange of properties with local
  landowners James J. and Elizabeth W. Herman in 1917 added nearly three acres to the northern part of
  the park."
- A lost monument, verbatim: "The bronze and granite **Ravenswood War Memorial** stood in the park from
  1921 to 1967, when the stele was stolen. The bronze tablet was recovered, consigned and installed on
  the exterior wall of St. Rita's School (now P.S. 83) in 1971. The monument's base was removed around
  1985."
- Verbatim: "During the construction of a new store abutting the park in 1996, **Costco** made
  improvements to the landscaping and fencing at the very northern border of the park."
- Verbatim: "Around 2008, new mounded play features referencing the whimsical playground designs of
  sculpture Isamu Noguchi were added. **A museum dedicated to his work is located opposite the park.**"
  [sic "sculpture" for "sculptor"] — **and note the 2024 removal:** "In 2024, the park was reconstructed
  with improvements to the playground, picnic grove and basketball court, as well as a rerouting of and
  expanded entrance to the Greenway, **and removal of the 2008 play mounds**."
- Namesake verbatim: "Dr. Thomas Rainey (1824-1910), **a resident of Ravenswood**, spent 25 years of his
  life and most of his fortune advancing the construction of a bridge across the East River between
  Manhattan and Long Island City."
- Verbatim, a superb visitor-facing quote: "A year before his death, Dr. Rainey realized his dream as he
  crossed the new Queensboro Bridge with Governor Charles Evans Hughes (1862-1948) on opening day.
  Rainey received a gold medal inscribed 'The Father of the Bridge.' On that day Rainey told the New
  York Times, '**This is my bridge. At least it is the child of my thought, of my long years of arduous
  toil and sacrifice.**'" [quote continues "Just over the…" and is truncated in the fetched text]
- **⚑ CAUTION FOR THE VERIFIER: my first fetch of this exact URL returned the text of CUNNINGHAM PARK.
  The above is from a re-fetch whose `<title>` was confirmed as "Rainey Park Highlights : NYC Parks".
  Re-verify independently.**

### P9 / F82. Murray Playground
Primary: https://www.nycgovparks.org/parks/murray-playground/history
- Acquisition verbatim: "The City of New York acquired the land for Murray Playground in four parts by
  purchase and condemnation between 1941 and 1945."
- Namesake verbatim: "Murray Playground is one of a handful of parks named for former Parks Department
  employees. In 1948, a local law renamed the park after John F. Murray (1889-1944), a lifetime Queens
  resident and a dedicated recreation supervisor for Queens parks for many years."
- Verbatim: "Murray supervised the **Long Island City Knights of Columbus**, the local chapter of the
  Roman Catholic fraternal order which organized charitable events and promoted Catholic causes."
- Verbatim: "Murray also organized local boxing tournaments and trained prize fighters such as **Paul
  Berlenbach (1901-1985), the world champion light heavyweight boxer**."
- Dedication verbatim: "On April 10, 1949, Queens Borough President James Burke hosted the dedication
  and opening ceremony. He described Murray, who had died on April 6, 1944, at the age of fifty-four,
  as 'an outstanding proponent of the proper kind of facilities for the use of the borough.'"
- City data verbatim: "Zip Code: 11101 / Community Board: 2 / Council Member: Julie Won / Park ID: Q141"
- **⚑ NAME CONFLICT: Wikipedia lists both "Murray Park" and "Murray Playground" as separate LIC parks
  ( https://en.wikipedia.org/wiki/Long_Island_City ) while NYC Parks has only "Murray Playground". Also
  the LIC article locates it "between 45th Avenue, 45th Road, and 11th and 21st Streets". NOT RESOLVED.**

### P10 / F83. Dutch Kills Playground — see F39, F40 for history
Primary: https://www.nycgovparks.org/parks/dutch-kills-playground/history
- Verbatim: "Parks acquired this land as a site for a new playground in 1946… The Dutch Kills School,
  P.S. 112, welcomed its first pupils in 1952, and the playground opened to the public in 1954. The
  playground was called Crescent Street Playground for the street to its west, and later became Dutch
  Kills Playground to honor the neighborhood."
- Design verbatim: "The playground features a Dutch decorative theme that honors the European colonists
  that settled in New York (then New Amsterdam) in the 17th century. **A windmill-shaped spray shower,
  painted murals of Dutch river scenes, a colored concrete map of New York City, and eight medallions
  depicting plants and native wildlife** are all part of the design of Dutch Kills Playground."
- City data verbatim: "Zip Code: 11101, 11106 / Community Board: 1 / Park ID: Q218 / Acreage: 2.40 /
  Property Type: Jointly Operated Playground"

### P15 / F84. "Notorious LIC Park" (formerly Bridge and Tunnel Park)
Primary: https://www.nycgovparks.org/parks/bridge-and-tunnel-park/history
- **⚑ The page title and breadcrumb read "Notorious LIC Park" while the historical-sign body text is
  headed "Bridge and Tunnel Park". The URL slug is still `bridge-and-tunnel-park`. The renaming is not
  explained anywhere in the fetched text. Record the discrepancy; do not guess the reason.**
- Verbatim: "The 'bridge' and 'tunnel' in this park's name refer to Pulaski Bridge and the
  Queens-Midtown Tunnel, which connect Queens to Brooklyn and to Manhattan, respectively. Both are
  visible from the park."
- Pulaski verbatim: "It was named after Casimir Pulaski (1747-1779), a Polish-born brigadier general
  known as the 'father of American cavalry,'… 'I came here,' Pulaski wrote in his first letter to
  General George Washington, 'where freedom is being defended, to serve it, and to live and die for
  it.' Pulaski did, in fact, die for it, receiving a fatal wound at the Battle of Savannah in 1779."
- Marathon verbatim: "Pedestrians can access the six-lane drawbridge at 11th Street and 50th Avenue in
  Long Island City, Queens, or at McGuinness Avenue and Freeman Street in Greenpoint, Brooklyn. **Every
  year on the first Sunday of November, New York City Marathon runners know they have reached the
  halfway mark of the 26.2-mile race when they cross the Pulaski Bridge into Queens.**"
- Tunnel verbatim: "The Queens-Midtown Tunnel is a double tube tunnel that runs under the East River
  between 36th Street in Manhattan and Long Island City, Queens… It opened to traffic in 1940, and was
  the third tunnel to provide motor vehicle access to Manhattan. Advanced construction techniques
  employed by engineer and designer Ole Signstad enabled workers to complete this 1.19 mile (1.92
  kilometer) long tunnel in just four years."
- Park history verbatim: "The City acquired the land that is now Bridge and Tunnel Park in 1848 by
  condemnation for the Pulaski Bridge approach. Parks gained jurisdiction over the property in 1957…
  In 1976, the Triborough Bridge and Tunnel Authority agreed to maintain the park… In 1979, Bridge and
  Tunnel Park opened, equipped with two handball courts and a basketball court."
  **⚑ "1848" for a Pulaski Bridge approach is chronologically impossible (the Pulaski Bridge opened in
  the 20th century). Likely a typo for 1948 in the City's own sign text. RECORD AS-IS; flagged.**
- City data verbatim: "Zip Code: 11101 / Community Board: 2 / Park ID: Q360U / Acreage: 0.32"

### P14 / F85. Andrews Grove (Andrews Playground)
Primary: https://www.nycgovparks.org/parks/andrews-grove/history
- Verbatim: "In 1932, the park opened to the public. That same year, the Board of Alderman named the
  facility Andrews Playground for one John F. Andrews (1896-1980) 'to do honor to the memory of one
  active in the civic affairs of the Borough of Queens during his lifetime.' Unfortunately, we know
  very little about Andrews, save that he was **born on December 15, 1896, in Long Island City,
  Queens**, and died in August of 1980."
- **A genuinely charming primary detail, verbatim:** "Readers of this sign who have information on the
  life of John F. Andrews (1896-1980) should contact the Parks Library at (212) 360-8240."
- Location verbatim: "Andrews Playground resides at the intersection of 49th Avenue, 5th Street, and
  Vernon Boulevard in Long Island City, Queens."
- **⚑ ACREAGE CONFLICT within one page:** prose says "These two additions brought the park to its
  current size of **2.542 acres**"; the data field says "**Acreage: 0.52**". **NOT RESOLVED.**
- **⚑ NAME CONFLICT:** breadcrumb "Andrews Grove", sign text "Andrews Playground".

### P11 / F86. Ravenswood Playground — see F44, F47
Primary: https://www.nycgovparks.org/parks/ravenswood-playground/history
- Verbatim: "The City of New York acquired this land in 1949 on behalf of the New York City Housing
  Authority for the Ravenswood Houses… Months later, Ravenswood Houses Playground opened, equipped with
  basketball, handball and shuffleboard courts, an ice skating area, a softball field, swings, jungle
  gyms, and a sandpit."
- Verbatim: "In 1987 NYC Parks shortened the name to simply Ravenswood Playground. The playground
  adjoins the Ravenswood Houses, **one of the city's largest housing projects**."
- City data verbatim: "Zip Code: 11106 / Community Board: 1 / Park ID: Q333 / Acreage: 2.76"

### F87. Queens East River and North Shore Greenway — links the LIC/Astoria waterfront parks
Primary: https://www.nycgovparks.org/parks/hallets-cove-playground/history
- Verbatim: "In a project completed in portions in 2013, the Queens East River and North Shore Greenway
  linked this playground to other Queens waterfront parks to the north and south, including **Astoria
  Park, Queensbridge Park, Rainey Park, Socrates Sculpture Park, and Ralph DeMarco Park**. The Greenway
  is a shared-access trail that runs along the Queens shoreline."
- **This one sentence puts Astoria-side and LIC-side parks in a single continuous chain — useful for the
  arbitration note, since the Greenway is exactly what makes the three neighborhoods feel contiguous on
  the ground.**

### F88. Other LIC parks named by the aggregator (NOT independently verified)
Source: https://en.wikipedia.org/wiki/Long_Island_City — SOURCE TIER: aggregator, all of these:
- "Malt Drive Park, a 3.5-acre (1.4 ha) park just south of Hunters Point South Park. The park includes
  native plantings, and it slopes down from the neighboring buildings toward Newtown Creek."
- "Hunters Point Community Park, a 600-by-60-foot (183 by 18 m) linear park located on the south side of
  48th Avenue between Fifth Street and Vernon Boulevard"
- "Old Hickory Playground, at Jackson Avenue and 51st Avenue"
- "City Ice Pavilion, with 33,000 square feet (3,100 m 2 ) of skating surface, opened in Long Island City
  in late 2008. The ice skating rink is on the roof of a two-story storage facility."
- Water Taxi Beach: "Water Taxi Beach was New York City's first non-swimming urban beach , and was
  located on the East River in Long Island City." and "It was discontinued in 2011 due to new
  construction on the site of the old landing." **[Closed — do not present as a current attraction.]**

---

## G. Industry, housing, immigrant history, and the working waterfront

**F89.** The bakery-to-studio lineage, aggregator: "Long Island City was once home to many factories and
bakeries, some of which are finding new uses. The former Silvercup bakery is now home to Silvercup
Studios … The former Sunshine Bakery is now one of the buildings which houses LaGuardia Community
College . Other buildings on the campus originally served as the location of the Ford Instrument
Company, which was at one time a major producer of precision machines and devices."
Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

### P27 / F90. Silvercup Studios
Primary: https://silvercupstudios.com/about/ (resolved from http://www.silvercupstudios.com/about/)
- Founding verbatim: "Brothers Alan and Stuart Suna, and their father Harry, opened the first Silvercup
  Studios location in **1983** on the site of what was originally **Silvercup Bread Bakery**."
- Verbatim: "With two lots in Long Island City and one in The Bronx, Silvercup Studios touts 23
  world-class sound stages, 133,380 square feet of turnkey production office space and 157,400 of
  support space".
- Productions verbatim: "hundreds of movies and shows have been filmed here— Succession, Sex and the
  City, The Sopranos, Gossip Girl, 30 Rock, Pose, The Devil Wears Prada, When Harry Met Sally , to name
  just a few."
- Ownership verbatim: "In 2020, Silvercup Studios was acquired by an affiliate of Hackman Capital
  Partners, the world's largest owner and operator of independent film and television studios."
- **Addresses verbatim, both in LIC:** "Silvercup Main Lot / **42-22 22nd Street, Long Island City, New
  York 11101**" and "Silvercup East Lot / **34-02 Starr Avenue, Long Island City, New York 11101**".
  (Third lot: "Silvercup North Lot / 295 Locust Avenue, Bronx, New York 10454".)
  **⚑ NOTE: the studio's own site places BOTH New York City Queens lots in Long Island City. Some
  popular sources describe a "Silvercup North" in Astoria — the company's own site says the North lot is
  in the BRONX. See Section J.**
- Stats verbatim: "557,942 SF of World-Class Production Space / Three studio lots / 23 sound stages,
  totaling 237,400 SF / 290,780 SF of office and support space".
- **⚑ INTERNAL INCONSISTENCY on the same page:** prose says "133,380 square feet of turnkey production
  office space and 157,400 of support space" (=290,780, consistent), but note the sound-stage figure
  appears as "23 sound stages, totaling 237,400 SF" while 557,942 − 290,780 = 267,162. Flagged.
- The sign, aggregator: "The Silvercup sign is visible from the IRT Flushing Line and BMT Astoria Line
  trains going into and out of Queensboro Plaza" — https://en.wikipedia.org/wiki/Long_Island_City

### P25 / F91. Queensbridge Houses
- Aggregator: "Northeast of the bridge are the Queensbridge Houses , a development of the New York City
  Housing Authority and **the largest public housing complex in the Western Hemisphere**." —
  https://en.wikipedia.org/wiki/Long_Island_City
- **⚑ SUPERLATIVE CONFLICT within the same article:** later in the same page: "The Queensbridge Houses ,
  a public-housing complex, comprises over 3,000 units, making it **the largest such complex in North
  America**." **"Western Hemisphere" vs "North America" — NOT RESOLVED, and neither is primary-sourced.**
- ZIP given as "11101"; nicknames given as "Queensbridge, QB, The Bridge, and The Projects"; coordinates
  40.755, -73.945. Source: https://en.wikipedia.org/wiki/Queensbridge_Houses — aggregator.
- **Hip-hop heritage, aggregator:** "People raised in the Queensbridge Houses include hip-hop producer
  **Marley Marl** , and rappers **MC Shan , Mobb Deep , Nas , and Roxanne Shante** ." —
  https://en.wikipedia.org/wiki/Long_Island_City. **This is one of the strongest visitor-interest
  threads in LIC and it is currently aggregator-only. Re-source before use.**
- Language access issue, aggregator citing NYT: "the growing Asian population in NYCHA 's Queensbridge
  Houses section of Long Island City at 11% are mostly from immigrant working-class backgrounds and
  largely have limited English skills, which has presented issues when residents are unable to find
  interpreters to communicate with NYCHA."

### P26 / F92. Ravenswood Generating Station ("Big Allis")
Aggregator: https://en.wikipedia.org/wiki/Ravenswood_Generating_Station
- "Ravenswood Generating Station is a 2,480 megawatt power plant **in Long Island City** in Queens , New
  York City, owned and operated by LS Power/ Helix Energy Solutions Group ."
- "Ravenswood was originally built and owned by Consolidated Edison of New York Inc. (Con Edison) in
  1963. The first two units constructed in 1963 were Ravenswood 10 and 20, each having a generating
  capacity of approximately 385 megawatts . Then, in 1965, **Ravenswood 30 (commonly called ' Big Allis
  ')** was commissioned with a generating capacity of nearly 981 megawatts."
- "Originally fuelled by coal, the plant has been fueled primarily by fuel oil (no. 6) and natural gas
  since 1971." / "An early proposal included a nuclear power reactor on the site."
- "In 1999, Con Edison transferred ownership of Ravenswood to KeySpan Energy for $597 million."
- "In 2019, it was announced that a 316 MW battery storage system would be built at the Ravenswood
  Generating Station."
- **SOURCE TIER: aggregator throughout. The operator's own site (riselightandpower.com) refused
  connection. See Section L.**

### F93. Companies and manufacturing, aggregator (all from https://en.wikipedia.org/wiki/Long_Island_City)
- Fortune cookies: "Long Island City is currently home to the largest fortune cookie factory in the
  United States, owned by Wonton Foods and producing four million fortune cookies a day. Lucky numbers
  included on fortunes in the company's cookies led to **110 people across the United States winning
  $100,000 each in a May 2005 drawing for Powerball**."
- Ties: "The Brooks Brothers tie manufacturing factory, which employs 122 people and produces more than
  1.5 million ties per year, has operated in Long Island City since 1999."
- "Other companies headquartered in Long Island City include independent film studio **Troma** and
  Standard Motor Products ."
- Eagle Electric: "Eagle Electric , now known as Cooper Wiring Devices, was one of the last major
  factories in the area, before it moved to China ; Plant No. 7, which was the largest of their
  factories and housed their corporate offices, is being converted to residential luxury lofts ."
- Standard Motor Products Building: "The former factory built in 1919 now houses the **Jim Henson
  Company** , Society Awards , and a commercial rooftop farm run by **Brooklyn Grange** ." (also: "The
  Standard Motor Products headquarters, a manufacturing site producing items like distributor caps, was
  once located in the industrial neighborhood of Long Island City until purchased by Acuman Partners in
  2008 for $40 million… acquired by RXR Realty, LLC for $110 million.")
- MoMA's temporary home: "From June 2002 to September 2004, the former **Swingline Staplers** plant was
  the temporary headquarters of the Museum of Modern Art ."
- "Other former factories in Long Island City include **Fisher Electronics , Marantz and Chiclets Gum**."
- JetBlue: "In spring 2010, JetBlue Airways announced it was moving its headquarters from Forest Hills to
  Long Island City… made the **Brewster Building** in Queens Plaza its home… The airline moved there
  around mid-2012."
- **ALL of F93 is aggregator-only. The Jim Henson Company, Brooklyn Grange, Troma and Wonton Foods items
  are high visitor interest and should each be re-sourced to the company itself.**

### F94. Tall buildings (aggregator, https://en.wikipedia.org/wiki/Long_Island_City)
- "The 658-foot (201 m) One Court Square , formerly the Citicorp Building, was built in 1990 in
  Courthouse Square ; it is currently the fourth tallest building in Queens and the fifth-tallest on Long
  Island, and was Queens' tallest building until 2019."
- "The tallest building in the borough and second tallest on Long Island, the 811-foot (247 m) **Orchard**
  residential tower, was architecturally topped-out in July 2024."
- "Yet another skyscraper, the 755-foot (230 m) tower named **Sven** , completed construction at Queens
  Plaza and became the third tallest building in the borough."
- "The first tower, the 42-floor **Citylights**, opened in 1998 with an elementary school at the base."
- **⚑ CONFLICT: this article says One Court Square is 658 ft and "built in 1990"; the LIC article's
  earlier phrasing and the Court Square station article say the Citigroup tower opened at One Court
  Square in 1990 ("The first was built in 1990, following the opening of the Citigroup office tower at
  One Court Square" — https://en.wikipedia.org/wiki/Court_Square_station ). A commonly cited height of
  673 ft circulates elsewhere. Heights and rankings are volatile; treat all of F94 as unverified.**

### F95. Education (aggregator, https://en.wikipedia.org/wiki/Long_Island_City)
- "City University of New York School of Law is located at 2 Court Square."
- "LaGuardia Community College is located at 3110 Thomson Avenue."
- "Touro College is located at 2511 49th Avenue."
- Long Island City is home to "Baccalaureate School for Global Education , a 7–12 school" and to
  numerous high schools including "Aviation Career and Technical High School (Q610)", "Newcomers High
  School - Academy for New Americans (Q555)", "Long Island City High School (Q450)".
  **⚑ Note: "Frank Sinatra School of the Arts (Q501)" is also on this list, but that school is generally
  associated with ASTORIA. See Section J.**

### P29 / F96. Hunters Point Community Library — a genuine architectural draw
Aggregator: https://en.wikipedia.org/wiki/Long_Island_City
- "The Hunters Point Community Library is located at 47-40 Center Boulevard on the bank of the East
  River . Designed by **Steven Holl Architects** in 2010 and opened on **September 24, 2019**, the
  library has a floor area of 22,000 ft 2 (2,000 m 2 ) and is 82 feet (25 m) tall, measuring 168 feet
  (51 m) along the New York City waterfront."
- "Features include an art installation by **Julianne Swartz** , designer furniture by **Eames and Jean
  Prouvé** , and a reading garden surrounded by ginkgo trees and designed by **Michael Van Valkenburgh**."
- "The branch cost $40 million to construct because the site had to undergo pollution remediation, since
  it was previously used by a factory that processed asphalt and other bituminous products."
- "Though the building is compliant with the Americans with Disabilities Act of 1990 , its stepped
  terraces and single elevator have been criticized for being inaccessible to the disabled."
- **SOURCE TIER: aggregator. My attempt to fetch the QPL Hunters Point branch page succeeded (HTTP 200)
  but the fetched text was dominated by site chrome and no address/description block was captured.
  Re-fetch https://www.queenslibrary.org/about-us/locations/hunters-point directly.**

### P30 / F97. Long Island City Library (QPL branch) — PRIMARY, address captured
Primary: https://www.queenslibrary.org/about-us/locations/long-island-city
- Address verbatim: "**37-44 21 Street** / **Long Island City, NY 11101** / (718) 752-3700"
- Verbatim: "24/7 drop-off for materials" / "Wheelchair accessible"
- Hours verbatim: "Sunday: Closed / Monday: Closed / Tuesday: 1:00 pm/6:00 pm / Wednesday: 10:00 am/6:00
  pm / Thursday: 12:00 pm/8:00 pm / Friday: 10:00 am/6:00 pm / Saturday: 10:00 am/5:00 pm"
- Verbatim: "Learn about the services we provide at the **Jeanne Elmezzi Long Island City Adult Learning
  Center** ." and "Teens: Come visit the **Long Island City Teen Center** !"
- Transit verbatim: "to 21 St-Queensbridge / Q66 / Q69 / Q100LTD / Q103" and "From Manhattan: Queensboro
  Bridge to 21st Street to 38th Avenue"
- **⚑ Wikipedia gives this branch's address as "37-44 21st Street"; QPL's own page writes "37-44 21
  Street" (no "st"). Trivial but record the primary form.**

**F98.** A third, now-closed branch, aggregator: "the Court Square branch, opened in 1989 and was located
on the ground floor of One Court Square… One Court Square's former owner, Citigroup , leased the space
to the library for $1 per month. After the tower's new owner Savanna failed to renew the Court Square
branch's lease, the location was closed in February 2020… Queens Public Library agreed in 2024 to open a
new branch at the 5 Pointz development." — https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

---

## H. Transportation

**F99. Subway stations serving LIC** (aggregator list, https://en.wikipedia.org/wiki/Long_Island_City):
verbatim — "21st Street–Queensbridge ( F and ​ M trains )"; "21st Street ( G train )"; "39th Avenue ( N
and ​ W trains )"; "Court Square–23rd Street ( 7 , < 7 > ​ ​ , E , ​ F , < F > ​ , and G ​ trains )";
"Hunters Point Avenue ( 7 and < 7 > ​ trains )"; "Queens Plaza ( E , ​ F , < F > , and ​ R trains )";
"Queensboro Plaza ( 7 , < 7 > ​ ​ , N and ​ W trains )"; "Vernon Boulevard–Jackson Avenue ( 7 and < 7 > ​
trains )".
**⚑ SOURCE TIER: aggregator. mta.info returned HTTP 403 to every client I tried (both my direct fetcher
and the summarizing fetch tool). NO PRIMARY MTA SOURCE WAS OBTAINED FOR ANY TRANSIT FACT. This is the
single biggest sourcing gap in this file. See Section L.**
Partial primary corroboration from institutions' own directions pages:
- Noguchi Museum: "N & W trains: Broadway / M train: Queensbridge/21 St (weekdays) / F train:
  Queensbridge/21 S (weekends) / 7 train: Vernon-Jackson" — https://www.noguchi.org/visit/
- QPL LIC branch: "to 21 St-Queensbridge" — https://www.queenslibrary.org/about-us/locations/long-island-city

**F100. Court Square complex history** (aggregator, https://en.wikipedia.org/wiki/Court_Square_station):
- "The Court Square–23rd Street station is a New York City Subway station complex on the IND Crosstown
  Line , the IRT Flushing Line and the IND Queens Boulevard Line . The complex is located in the vicinity
  of One Court Square in **Hunters Point and Long Island City, Queens** ."
- "The Flushing Line station was the first to open, in 1916. The Crosstown Line station opened in 1933,
  followed by the Queens Boulevard Line station in 1939."
- "Two passageways were built to connect the three stations. The first was built in 1990, following the
  opening of the Citigroup office tower at One Court Square."
- Former names verbatim: "23rd Street–Ely Avenue station (Queens Boulevard Line), Long Island City–Court
  Square station (Crosstown Line), and 45th Road–Court House Square station (Flushing Line)."
- "The first part of the future IRT Flushing Line, from Grand Central–42nd Street in Manhattan to
  Vernon–Jackson Avenues in Long Island City, opened in 1915 and was extended to Hunters Point Avenue in
  February 1916."
- "The platforms at the station were extended in 1955–1956 to accommodate 11-car trains."
- Locale field verbatim: "Locale Hunters Point , Long Island City".

**F101. Bus routes** (aggregator, https://en.wikipedia.org/wiki/Long_Island_City), verbatim:
"Q32 : to Pennsylvania Station (Manhattan) or Jackson Heights via Queens Plaza and Queens Boulevard";
"Q39 : to Glendale via Thomson Avenue"; "Q60 : to East Midtown (Manhattan) or Jamaica via Queens Plaza
and Queens Boulevard"; "Q63 and Q66 : to Flushing–Main Street ( 7 and < 7 > ​ trains ) via 21st Street";
"Q67 : to Middle Village via Borden Avenue"; "Q69 : to East Elmhurst via 21st Street"; "**Q100 : to
Rikers Island (Bronx) via 21st Street**"; "Q101 : to Hunters Point or **Steinway** via Queens Plaza and
Northern Boulevard"; "Q102 : to Roosevelt Island (Manhattan) or Court Square"; "**Q103 : to Astoria or
Hunters Point via Vernon Boulevard**"; "B32 : to Williamsburg Bridge Plaza Bus Terminal via 11th/21st
Streets"; "**B62 : to Downtown Brooklyn or Astoria**".
**Note the Q101 (to Steinway), Q103 (to Astoria) and B62 (to Astoria) all physically tie LIC to the other
two neighborhoods in this wave.**

**F102. Long Island Rail Road**, aggregator: "The Long Island City and Hunterspoint Avenue stations of the
Long Island Rail Road (LIRR) are also located within Long Island City. The US$11.1 billion East Side
Access project, which brought LIRR trains to Grand Central Terminal in Manhattan , opened in 2023; this
project created a new train tunnel beneath the East River , connecting Long Island City and Queens with
the East Side of Manhattan." — https://en.wikipedia.org/wiki/Long_Island_City — aggregator.
**Historic root, primary: "In 1861, the Long IslDnd Railroad was persuaded to move its Brooklyn terminus
t o Hunters Point." — LP-0450, http://s-media.nyc.gov/agencies/lpc/lp/0450.pdf (F32).**

### P46 / F103. NYC Ferry — the "Long Island City" landing, PRIMARY
Primary: https://www.ferry.nyc/routes-and-schedules/route/astoria/
- Route description verbatim: "The **Astoria route** of NYC Ferry connects the growing residential and
  business communities of Western Queens and Roosevelt Island."
- Landing list verbatim, in route order: "East 90th Street", "Astoria", "Roosevelt Island", "Long Island
  City", "East 34th Street", "Brooklyn Navy Yard", "Wall Street/Pier 11".
- Addresses verbatim as published: "East 90th Street and F.D.R. Drive / Manhattan, NY 10128";
  "**3-10 Astoria Boulevard / Astoria, NY 11102**"; "East Main Street / **Long Island City, NY 10044**";
  "**46th Avenue and Center Boulevard / Long Island City, NY 10044**"; "East 35th Street at F.D.R. Drive
  / Manhattan, NY 10016"; "141 Flushing Avenue / Brooklyn, NY 11205"; "Gouverneur Lane at South Street
  and F.D.R. Drive / Manhattan, NY 10005".
- **⚑ TWO ERRORS ON THE OPERATOR'S OWN PAGE, recorded verbatim above and confirmed by me in the raw HTML
  (not a summarizer artifact): (a) the ROOSEVELT ISLAND landing is labeled "Long Island City, NY 10044",
  and (b) the LONG ISLAND CITY landing is given ZIP "10044", which is Roosevelt Island's ZIP, not LIC's.
  I verified this against the raw page text after a summarizing tool produced the same odd output.
  Do not propagate ZIP 10044 for the LIC landing.**
- Landing codes verbatim: "East 34th Street: 2319805 / Wall St./Pier 11: 2319811 / **Astoria: 2319818** /
  Roosevelt Island: 2319819 / **Long Island City: 2319820** / East 90th St: 2319872 / Brooklyn Navy Yard:
  2319875"
- **⚑ SECTION J RELEVANCE: NYC Ferry's route is NAMED "Astoria" but its LIC landing is a separate, named
  stop. The Noguchi Museum tells visitors to use the ASTORIA landing (F68), not the LIC landing.**

**F104.** Ferry history, aggregator: "In June 2011, NY Waterway started service to points along the East
River. On May 1, 2017, that route became part of the NYC Ferry 's East River route… One NYC Ferry stop
for the East River route is located at Hunters Point South, while another NYC Ferry stop for a route to
Astoria is located at Gantry Plaza State Park."
Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.
**⚑ This conflicts with the operator's current page (F103), which lists a single Queens LIC landing at
"46th Avenue and Center Boulevard" on the Astoria route. NOT RESOLVED.**

**F105. Roads**, aggregator: "Cars enter from Brooklyn by the Pulaski Bridge from Brooklyn; from Manhattan
by the Queensboro Bridge and the Queens–Midtown Tunnel ; and from Roosevelt Island by the Roosevelt Island
Bridge . Major thoroughfares include 21st Street… I-495 (Long Island Expressway) ; the westernmost portion
of Northern Boulevard ( New York State Route 25A ), which becomes Jackson Avenue (the former name of
Northern Boulevard) south of Queens Plaza ; and Queens Boulevard… and Vernon Boulevard."
Source: https://en.wikipedia.org/wiki/Long_Island_City — aggregator.

**F106. BQX**, aggregator: "There are plans to build the Brooklyn–Queens Connector (BQX), a light rail
system that would run along the waterfront from Red Hook in Brooklyn **through Long Island City to
Astoria**. However, the system is projected to cost $2.7 billion, and the projected opening has been
delayed until at least 2029." — https://en.wikipedia.org/wiki/Long_Island_City — aggregator.
**Speculative/future — do not present as existing.**

**F107.** Queensboro Bridge tolling, aggregator: "Long Island City is the eastern terminus of the
Queensboro Bridge , **the only non-tolled automotive route connecting Queens and Manhattan** ." —
https://en.wikipedia.org/wiki/Long_Island_City — aggregator. **Superlative; may have been affected by
congestion pricing. Re-source.**

---

## I. Food and businesses — MANDATORY SOURCING DISCLOSURE

**Per the wave rules, I state explicitly for each: whether the ONLY source is a DOHMH/DCWP inspection
dataset.**

**I consulted NO DOHMH or DCWP inspection dataset at all in this research.** Therefore **none** of the
businesses below is DOHMH/DCWP-only sourced — but that also means none has been checked against an
official registration/inspection record. Each rests on the business's own website or on an aggregator, as
labeled.

### P40 / F108. Court Square Diner
Primary (own website): https://www.courtsquarediner.com/
- Verbatim: "**Court Square Diner has been serving the Long Island City area since 1946.** Since then it
  has only had three ownerships. The current owners, Steve and Nick have been in operation since 1991.
  In 2009, the Court Square Diner was renovated with an all new retro look."
- Verbatim: "The delivery service is 24 hours a day seven days a week. All the baking for the diner is
  done on the premises."
- A quoted testimonial on the diner's own page, verbatim: "'In 2011, the first year of the festival, the
  Court Square diner gave us the biggest donation… the reason that it was explained to me; **when this
  area was bleak the artists were the best supporters of the diner**.' — Richard Mazda, **LIC Arts Open**
  Executive Director."
  **This also surfaces LIC Arts Open as a candidate annual event (first year 2011) — see F111.**
- **SOURCING: business's own website. NOT a DOHMH/DCWP dataset. No street address was captured in the
  fetched text — do not invent one.**

### P41 / F109. M. Wells
Primary (own website): https://www.magasinwells.com/
- Verbatim: "**Long Island City, NY 11101** / 718 786-9060"
- Verbatim: "M. Wells and the folks who brought you **the Diner, the Dinette, the Steakhouse and the
  Mothership** in Long Island City, hosts events and residencies regularly throughout New York City and
  destinations further afield."
- Verbatim: "Stay tuned for M. Wells M. Eat Pies! - Tourtières Pick-ups & Pop Ups"
- **⚑ CAUTION: the page describes past/companion concepts in a way that does NOT clearly establish which
  are currently open. The site presents a reservations widget with location "M. Wells". Do not assert
  that the Diner, Dinette, Steakhouse or Mothership are currently operating.**
- **SOURCING: business's own website. NOT a DOHMH/DCWP dataset. No street address on the page.**

**F110. Wonton Foods, Brooks Brothers tie factory, Troma, Jim Henson Company, Brooklyn Grange** — all
listed in F93 above. **SOURCING: aggregator (Wikipedia) only. NOT DOHMH/DCWP. All should be re-sourced to
the companies themselves before any of them is written up.**

**F111. LIC Arts Open** — surfaced only via the Court Square Diner testimonial (F108): "In 2011, the first
year of the festival". **Single indirect source; the festival's own site was not fetched. Weak candidate.**

**F112. LIC Flea** — attempted; https://licflea.com/ returned HTTP 522 (server unreachable). **No source
obtained. Do not write about it.**

---

## J. ⚑ CONTESTED NEIGHBORHOOD ASSIGNMENTS — the register (recorded, NOT resolved)

For each: the place, its street address as published, and what each source says.

| # | Place | Address as published | Source A says | Source B says |
|---|---|---|---|---|
| J1 | **Socrates Sculpture Park** | 32-01 Vernon Blvd, Long Island City, NY 11106 (own site) | Own site: "Long Island City, NY 11106" — https://socratessculpturepark.org/about/ ; NYC Parks data: "Zip Code: 11106 / Community Board: 1" | NYC Parks sign text frames it as Astoria three times: "between Astoria and Wards Island"; "inaccessible to citizens of Astoria and Long Island City"; named "as a tribute to the people of **Astoria**, New York's largest Greek community" — https://www.nycgovparks.org/parks/socrates-sculpture-park/history |
| J2 | **The Noguchi Museum** | 9-01 33rd Road (at Vernon Boulevard), Long Island City, NY 11106 | Own site, explicit: "Located in **Long Island City**, Queens" — https://www.noguchi.org/about/mission-history/ | Own site's ferry directions send visitors to the "**Astoria**" landing — https://www.noguchi.org/visit/ ; and it sits opposite Rainey Park / one block from Socrates, both of which carry Astoria-inflected City text |
| J3 | **Rainey Park** | Vernon Blvd vicinity (Q048); NYC Parks lists it among parks near both Socrates and Ravenswood | NYC Parks text ties it to LIC: "The project backed by citizens of **Long Island City**"; namesake "Dr. Thomas Rainey… **a resident of Ravenswood**" — https://www.nycgovparks.org/parks/rainey-park-q048/history | Listed by NYC Parks as one of the Astoria-cluster waterfront parks in the Greenway chain alongside "Astoria Park… Socrates Sculpture Park, and Ralph DeMarco Park" — https://www.nycgovparks.org/parks/hallets-cove-playground/history |
| J4 | **Ravenswood Playground** | ZIP 11106, Community Board 1 | NYC Parks, explicit: named after "Ravenswood, **the shoreside Long Island City neighborhood** in which it resides" — https://www.nycgovparks.org/parks/ravenswood-playground/history | Shares ZIP 11106 and CB1 with Astoria-side parks; adjoins Ravenswood Houses, which sit in the Astoria/LIC transition zone |
| J5 | **Ravenswood (the sub-neighborhood itself)** | n/a | LPC primary treats it as absorbed: "the once rural **Ravenswood area of Queens (now Long Island City}**" — http://s-media.nyc.gov/agencies/lpc/lp/1304.pdf ; and it is listed as a 1870 constituent of LIC (F9) | Some City text treats Ravenswood as a distinct shoreside place with its own war memorial ("**Ravenswood War Memorial**", F81) |
| J6 | **Ravenswood Generating Station** | 38-54 Vernon Blvd (address NOT independently confirmed here) | Aggregator: "a 2,480 megawatt power plant **in Long Island City**" — https://en.wikipedia.org/wiki/Ravenswood_Generating_Station | Commonly described in popular sources as Astoria; operator's own site unreachable (see Section L). **Address unverified — do not publish a street number.** |
| J7 | **Queensbridge Park / Queensbridge Houses** | ZIP 11101 | NYC Parks: Queensbridge Park "**Community Board: 1, 2**" (BOTH) — https://www.nycgovparks.org/parks/queensbridgepark/history | Wikipedia places the Houses in LIC ("Northeast of the bridge are the Queensbridge Houses") — https://en.wikipedia.org/wiki/Long_Island_City |
| J8 | **Museum of the Moving Image** | 36-01 35th Ave (address not captured in my fetch) | Own site: navigation reads "Getting to & Exploring **Astoria**" — https://movingimage.org/visit/ | Frequently grouped with LIC arts institutions in tourism writing; shares the 11106 ZIP band. **Its own site says Astoria.** |
| J9 | **Greater Astoria Historical Society** | Not captured | Named "Greater **Astoria** Historical Society" | Its own mission is LIC: "the place to learn and celebrate **Long Island City** and its neighborhoods"; domain is **astorialic.org** — https://astorialic.org/about/ |
| J10 | **Silvercup Studios "North" lot** | 295 Locust Avenue, Bronx, NY 10454 | Company's own site places the North lot in **the Bronx** — https://silvercupstudios.com/about/ | Popular usage sometimes refers to a "Silvercup North" in **Astoria**. **The company's own site contradicts the Astoria attribution.** Main (42-22 22nd St) and East (34-02 Starr Ave) lots are both LIC per the company. |
| J11 | **Frank Sinatra School of the Arts (Q501)** | Not captured | Listed by Wikipedia among schools "Long Island City is home to" — https://en.wikipedia.org/wiki/Long_Island_City | Generally associated with **Astoria**. Not resolved here. |
| J12 | **Van Alst Playground** | ZIP 11102, CB1 | NYC Parks, explicit: "Van Alst Playground **is located in Astoria**" — https://www.nycgovparks.org/parks/van-alst-playground/history | Named for Peter G. Van Alst, a **Long Island City** commissioner; the same page recounts LIC's founding at length. Included as a boundary marker: this is the City drawing the line on the Astoria side. |
| J13 | **Hallets Cove Playground** | ZIP 11102, CB1 | NYC Parks: "Hallets Point was initially the commercial center of **Astoria**" — https://www.nycgovparks.org/parks/hallets-cove-playground/history | Its Greenway text chains it directly to Queensbridge Park and Rainey Park (LIC side). Boundary marker on the Astoria side. |
| J14 | **Dutch Kills (sub-neighborhood)** | ZIPs 11101 **and** 11106 (per Dutch Kills Playground) | NYC Parks: "Dutch Kills joined **Astoria Village**, Hunter's Point, Ravenswood, Middletown, and Blissville… to form Long Island City in 1870" — https://www.nycgovparks.org/parks/dutch-kills-playground/history | Wikipedia treats Dutch Kills as a subsection **of LIC** occupying "what today is Queens Plaza" — https://en.wikipedia.org/wiki/Long_Island_City |
| J15 | **Blissville** | ZIP 11101 | Wikipedia: "a neighborhood **within Long Island City**" — https://en.wikipedia.org/wiki/Long_Island_City | NYC Parks writes "**Blissville (now Sunnyside)**" — https://www.nycgovparks.org/parks/dutch-kills-playground/history — i.e. it equates Blissville with a *different* neighborhood entirely |
| J16 | **Long Island City itself (community district)** | n/a | Wave brief asserts CD1 | Sources say CD1 **and** CD2, split at Queens Plaza (see F2). **This is the top-priority arbitration item.** |

---

## K. Cross-source discrepancies NOT about neighborhood (for the verifier's attention)

1. **F10/F9** — LIC incorporation date: May 4, 1870 (Wikipedia) vs May 6, 1870 (LPC LP-0925).
2. **F13** — first mayor named "A.D. Ditmars" vs "Abram D. Ditmars".
3. **F16** — name origin: Levi Hayden's 1853 coinage (LPC) vs the "Long Island City Star" newspaper (NYC
   Parks) vs "the Long Island Star" (LPC, same document).
4. **F57** — Hunters Point Historic District: 47 townhouses vs 19 contributing buildings.
5. **F63** — Bank of the Manhattan Company Building: built "1925-27" (LPC) vs "1927" (aggregator); also
   called "Chase Manhattan Bank Building" elsewhere; three street addresses.
6. **F64** — Queensboro Bridge opened to traffic March 30, 1909 (LPC) vs June 18, 1909 (NYC DOT); length
   3,725 ft (DOT) vs "over 7,000 feet" (LPC); architect "Hornbostel" (LPC) vs "Hornbosted" (DOT);
   designation dates Nov 23 1973 (DOT, "national landmark") vs Apr 16 1974 (LPC) vs Dec 20 1978 (NRHP).
7. **F78** — Hunter's Point South Park acreage: 22.81 (NYC Parks data field) vs "10-acre" (NYC Parks
   prose) vs 11 acres (NYCEDC).
8. **F85** — Andrews Grove acreage: 2.542 acres (prose) vs 0.52 (data field), on the same City page.
9. **F84** — Bridge and Tunnel Park land acquired "in 1848 by condemnation for the Pulaski Bridge
   approach" — chronologically impossible; likely 1948.
10. **F91** — Queensbridge Houses: "largest public housing complex in the Western Hemisphere" vs "largest
    such complex in North America", both in the same article.
11. **F103** — NYC Ferry's own site gives ZIP 10044 (Roosevelt Island's) for the Long Island City landing,
    and labels the Roosevelt Island landing "Long Island City, NY 10044".
12. **F104 vs F103** — whether the LIC ferry stop is at Hunters Point South, at Gantry Plaza State Park, or
    at "46th Avenue and Center Boulevard".
13. **F59** — LP-0925 says LIC "previously consisted of several communities, the most important of which
    were Newtown and Astoria", which conflicts with the standard account that LIC was formed *within* the
    Town of Newtown.
14. **F60** — NY Architectural Terra Cotta: "New York's only major manufacturer" (LPC) vs "the city's sole
    architectural terracotta manufacturer" (aggregator).
15. **F82** — "Murray Park" and "Murray Playground" listed as two parks by the aggregator; NYC Parks has one.
16. **F84** — park called both "Notorious LIC Park" (breadcrumb/title) and "Bridge and Tunnel Park" (sign
    text) on the same City page, with URL slug still `bridge-and-tunnel-park`.
17. **F68** — Noguchi building described by the museum as "a repurposed 1920s industrial building" vs the
    aggregator's "photo-engraving plant".
18. **F90** — Silvercup square-footage figures on the company's own page do not reconcile.

---

## L. Sourcing gaps and failed fetches — what a follow-up pass must still get

**This is not a complete file. The following were attempted and FAILED, so the topics below are
under-covered or aggregator-only:**

- **WebSearch entirely unavailable** (session budget 200/200 consumed before this agent started). No
  discovery pass was possible; everything was URL-guessed or link-followed.
- **mta.info — HTTP 403 to every client.** No primary source for ANY subway or bus fact (F99, F101).
- **parks.ny.gov — HTTP 403 to my direct fetcher.** Gantry Plaza State Park (F77) rests on a summarizing
  tool's second-hand report.
- **NPS NRHP nominations — not digitized.** All four LIC NRHP nominations (73001251, 83001776, 78001879,
  88002348) return "The PDF file for this National Register record has not yet been digitized."
- **sculpture-center.org/about — 404 on every path tried.** SculptureCenter's 1928 founding, the trolley
  repair shop, and the Maya Lin 2002 renovation are aggregator-only (F70).
- **Connection refused / unreachable:** riselightandpower.com (Ravenswood Generating Station operator),
  plaxallgallery.com (Plaxall Gallery), stmarylic.org and stpatricksqueens.org (**both LIC parish
  churches — HISTORIC CHURCHES ARE THEREFORE ENTIRELY UNCOVERED IN THIS FILE**), kaufmanastoria.com,
  licflea.com (HTTP 522), longislandcityqueens.com/about-us (404), culturelablic.org/about (404),
  guide.michelin.com (HTTP 202, no body).
- **Topics I could NOT source and which are therefore MISSING, not absent:**
  - **Historic churches in LIC** (St. Mary's, St. Patrick's, and any others) — zero sources obtained.
    Note that no church appears among LIC's six LPC-designated landmarks or four/five NRHP listings.
  - **Historic houses** other than the Hunters Point Historic District rowhouses.
  - Anable Basin, Newtown Creek as a visitor subject, Plaxall Gallery, LIC Springs / LIC Arts Open,
    the Queens Night Market, restaurants generally (only two were sourced, both self-reported).
  - Any **DOHMH/DCWP** record for any business (deliberately not consulted).
  - Current LIC Partnership / BID material.
- **Reliability warning, repeated:** one NYC Parks fetch in this session returned a completely different
  park's page. Every Parks fact here was title-verified on re-fetch, but the verifier should assume this
  environment can silently return wrong-page content and should re-check independently.

---

## Tally

- **Candidate facts recorded (F1–F112): 112**
- **Candidate places recorded (P-numbered and cross-referenced): 50**
  P1 MoMA PS1 · P2 Noguchi Museum · P3 Socrates Sculpture Park · P4 SculptureCenter · P5 Gantry Plaza
  State Park · P6 Hunter's Point South Park · P7 Queensbridge Park · P8 Rainey Park · P9 Murray
  Playground · P10 Dutch Kills Playground · P11 Ravenswood Playground · P12 Van Alst Playground ·
  P13 Hallets Cove Playground · P14 Andrews Grove · P15 Notorious LIC / Bridge and Tunnel Park ·
  P16 Hunters Point Historic District · P17 LIC Courthouse (NYS Supreme Court, Queens Co.) · P18 New
  York Architectural Terra Cotta Works Building · P19 Pepsi-Cola Sign · P20 Firehouse Engine 258/Ladder
  115 · P21 Bank of the Manhattan Company Building (LIC Clocktower) · P22 Ed Koch Queensboro Bridge ·
  P23 US Post Office–Long Island City · P24 Court Square–23rd St / 45th Rd–Court House Sq station ·
  P25 Queensbridge Houses · P26 Ravenswood Generating Station · P27 Silvercup Studios · P28 LaGuardia
  Community College · P29 Hunters Point Community Library · P30 Long Island City Library (QPL) · P31 New
  York Irish Center · P32 Culture Lab LIC · P33 Greater Astoria Historical Society · P34 Pulaski Bridge ·
  P35 Queens–Midtown Tunnel · P36 One Court Square · P37 5 Pointz / 5Pointz towers · P38 Brewster
  Building (JetBlue HQ) · P39 Standard Motor Products Building · P40 Court Square Diner · P41 M. Wells ·
  P42 Anable Basin · P43 Newtown Creek · P44 Museum of the Moving Image (self-assigned Astoria) ·
  P45 LIRR Long Island City & Hunterspoint Avenue stations · P46 NYC Ferry Long Island City landing ·
  P47 Calvary Cemetery (Blissville boundary) · P48 Malt Drive Park · P49 Skyline/Orchard/Sven towers ·
  P50 Fisher Landau Center for Art (closed)
- **Places with contested neighborhood assignment: 16 (J1–J16)**
- **Non-neighborhood cross-source discrepancies: 18 (Section K)**

*No verdicts issued. Nothing above is confirmed.*
