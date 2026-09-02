# Woodside, Queens — FINDER candidate file

**Role:** Finder only. Nothing below is verified, confirmed, or adjudicated. Every entry is a
CANDIDATE awaiting the verifier. Where I quote, the text between quotation marks is copied
character-for-character from the cited page. Where I do not quote, the line is explicitly marked
`[PARAPHRASE]`.

**Research constraint (disclose to verifier):** this session's WebSearch budget was exhausted before
any Woodside query ran (200/200 used on arrival). All material below was gathered by direct
retrieval of known URLs (WebFetch, and `urllib` for hosts that 403 WebFetch — nycgovparks.org,
Socrata/ArcGIS endpoints). That means source discovery was **directed, not exhaustive**: I could
only fetch sources I could name in advance. Absence of a topic below is not evidence of absence.

**Source-quality note:** LPC designation report LP-1956, the LPC ArcGIS landmark layer, NYC Parks
Historical Signs Project pages, NYC DCP's 2020 NTA table, NYCHA's development dataset, and MTA's
station dataset are primary/institutional. Wikipedia is used where flagged and should be treated by
the verifier as an aggregator requiring independent confirmation.

**Counts:** 167 candidate facts (F1–F167, numbered contiguously) across 41 candidate places (P1–P41).
**Contested neighborhood assignments:** 19 rows in §L, covering 17 distinct places plus one district
(Little Manila) and one event (St. Pat's for All Parade).

---

## §A — Boundaries and administrative geography (the contested core of this wave)

> This wave's arbitration hazard is Jackson Heights / Sunnyside / Woodside adjacency. The single
> most useful thing I found is that **the City itself does not treat "Woodside" as one unit.**
> Recorded, not resolved.

**F1.** NYC Department of City Planning's 2020 Neighborhood Tabulation Areas split Woodside across
two different Community District areas. Verbatim field values from the DCP NTA table:

| nta2020 | ntaname | cdta2020 | cdtaname |
|---|---|---|---|
| `QN0104` | `Astoria (East)-Woodside (North)` | `QN01` | `QN01 Astoria-Queensbridge (CD 1 Equivalent)` |
| `QN0203` | `Woodside` | `QN02` | `QN02 Long Island City-Sunnyside-Woodside (CD 2 Approximation)` |
| `QN0202` | `Sunnyside` | `QN02` | `QN02 Long Island City-Sunnyside-Woodside (CD 2 Approximation)` |
| `QN0271` | `Calvary & Mount Zion Cemeteries` | `QN02` | `QN02 Long Island City-Sunnyside-Woodside (CD 2 Approximation)` |
| `QN0261` | `Sunnyside Yards (South)` | `QN02` | `QN02 Long Island City-Sunnyside-Woodside (CD 2 Approximation)` |
| `QN0161` | `Sunnyside Yards (North)` | `QN01` | `QN01 Astoria-Queensbridge (CD 1 Equivalent)` |
| `QN0301` | `Jackson Heights` | `QN03` | `QN03 Jackson Heights-East Elmhurst (CD 3 Approximation)` |

Source: NYC Open Data, 2020 Neighborhood Tabulation Areas —
https://data.cityofnewyork.us/resource/9nt8-h7nd.json (queried `$select=nta2020,ntaname,ntatype,cdta2020,cdtaname` `$where=boroname='Queens'`)

**F2.** `[PARAPHRASE]` Consequence of F1, stated plainly for the verifier: northern Woodside is
inside CD 1 (Astoria) in the City's official geography, and *the name "Woodside" appears in the
official NTA label for that CD 1 area*. Anything in Woodside north of roughly 34th Avenue is
therefore assignable to two neighborhoods depending on which authority is used. **Do not resolve
this from a single source.**

**F3.** Wikipedia's infobox states Woodside's Community District as `Queens 2` only, with no mention
of the CD 1 portion. Verbatim wikitext field: `| subdivision_name4 = [[Queens Community Board 2|Queens 2]]`.
Source: https://en.wikipedia.org/wiki/Woodside,_Queens (raw wikitext via MediaWiki API)
→ **Conflicts with F1.** Recorded, not resolved.

**F4.** Wikipedia (article prose, via WebFetch) states Woodside "is bordered on the south by Maspeth,
on the north by Astoria, on the west by Sunnyside, and on the east by Elmhurst, Jackson Heights, and
East Elmhurst." Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F5.** ZIP Code. Verbatim from Wikipedia: "Woodside is covered by the [[ZIP Code]] 11377. The
[[United States Post Office]] operates the Woodside Station at 39-25 61st Street."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
Corroborating: every NYC Parks page for a Woodside park returns `Zip Code: 11377` (see §C).

**F6.** `[PARAPHRASE]` Every NYC Parks park page I retrieved inside Woodside lists `Community Board: 2`
and `Council Member: Julie Won`. NYCHA's Woodside development, by contrast, lists
`community_distirct: 1` [sic — field misspelled in the dataset] and `ny_city_council_district: 26`.
Sources: https://www.nycgovparks.org/parks/Q031 ; https://data.cityofnewyork.us/resource/evjd-dqpz.json
→ Another instance of the CD1/CD2 split.

**F7.** Woodside's historical relationship to Winfield. Verbatim from Wikipedia:
"The adjacent area of Winfield was largely incorporated into the post office serving Woodside and as
a consequence Winfield lost much of its identity distinct from Woodside."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F8.** Nineteenth-century town of origin. Verbatim from Wikipedia: "In the 19th century, the area
was part of the Town of Newtown (now [[Elmhurst, Queens|Elmhurst]])."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F9.** Area and population density (2010). Verbatim from Wikipedia: "the population of Woodside was
45,099, an increase of 1,253 (2.9%) from the 43,846 counted in [[2000 United States census|2000]].
Covering an area of {{convert|649.22|acres}}, the neighborhood had a population density of
{{convert|69.5|PD/acre|...}}." Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F10.** Racial makeup (2010 census, per Wikipedia): "22.5% (10,140) White, 1.3% (592) African
American, 0.2% (76) Native American, 39.9% (17,990) Asian, 0.0% (5) Pacific Islander, 0.5% (221)
from other races, and 2.2% (975) from two or more races. Hispanic or Latino of any race were 33.5%
(15,100) of the population." Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ NOTE: this is a *neighborhood* figure, not CD2.

**F11.** Wikipedia repeatedly reports statistics for "Woodside and Sunnyside" jointly because they
share Community Board 2. Verbatim: "The entirety of Community Board 2, which comprises Woodside and
Sunnyside, had 135,972 inhabitants as of ... NYC Health's 2018 Community Health Profile, with an
average life expectancy of 85.4 years." And: "As of 2017, the median household income in Community
Board 2 was $67,359." Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ **Caution for the writer:** these numbers are NOT Woodside-only. They are Woodside+Sunnyside.

---

## §B — History

**F12.** Pre-colonial and colonial character. Verbatim from NYC Parks' Historical Signs Project text
posted at General Hart Playground: "Once home to the Canarsie and Matinecock tribes, Woodside was
known as \"suicide's paradise\" for its snake-infested swamps and wolf-ridden woodlands in the
colonial era. The Dutch gave Massachusetts colonist Father John Doughty a charter for 13,000 acres
in 1642. In the mid-1800s, several mansions were built by a contingent of wealthy men from
Charleston, South Carolina. Developer Benjamin Hitchcock bought the estate of John Kelly in 1867,
which was divided into lots and renamed Woodside."
Source: https://www.nycgovparks.org/parks/general-hart-playground/history

**F13.** Wikipedia attributes the "suicide's paradise" phrasing to an unnamed source. Verbatim:
"one source maintains that \"during New York's colonial period, the area was known as 'suicide's
paradise,' as it was largely snake-infested swamps and wolf-ridden woodlands.\""
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ Same phrase as F12; the verifier should establish which is upstream of which.

**F14.** Marshland character and place-names. Verbatim from Wikipedia: "Its Native American
inhabitants called it a place of \"bad waters\", and it was known to early European settlers as a
place of \"marshes, muddy flats and bogs\", where \"wooded swamps\" and \"flaggy pools\" were fed by
flowing springs." And: "Until drained in the nineteenth century, one of these wet woodlands was
called Wolf Swamp after the predators that infested it. One of the oldest recorded locations in
Woodside was called Rattlesnake Spring on the property of a Captain Bryan Newton. The vicinity came
to be called ''Snake Woods,''" Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F15.** The 1642 Newtown patent, from the LPC designation report (primary). Verbatim:
"In 1642, a group of colonists from New England secured a patent for 13,332 acres in northwestern
Queens from the Dutch government in New Amsterdam and established the first European town on Long
Island at the headwaters of Newtown Creek at Maspeth."
Source: LPC LP-1956, Moore-Jackson Cemetery designation report, p.2 —
http://s-media.nyc.gov/agencies/lpc/lp/1956.pdf
→ **Acreage conflict with F12:** LPC says "13,332 acres"; NYC Parks says "13,000 acres". Recorded, not resolved.

**F16.** Continuation, verbatim from LP-1956: "The colonists abandoned this site in 1643 after Native
Americans attacked it, but in 1652 another group of English settlers established a new settlement on
the Maspeth patent at the present-day intersection of Broadway and Queens Boulevard (Elmhurst).
Originally called Middleburg, after a town in the Netherlands where many English non-conformists had
found refuge, the town soon came to be known as Newtown to distinguish it from the earlier
settlement." Source: http://s-media.nyc.gov/agencies/lpc/lp/1956.pdf

**F17.** Bowery Bay Road = present-day 51st Street. Verbatim from LP-1956: "Samuel Moore (d.1758)
took the southern part of the farm lying near the Bowery Bay Road (present-day 51st Street) and
Train's Meadow in present-day Woodside."
Source: http://s-media.nyc.gov/agencies/lpc/lp/1956.pdf
→ Useful street-history fact: 51st Street is a colonial road.

**F18.** British Revolutionary War headquarters in what is now Woodside. Verbatim from LP-1956:
"In September 1776, when a major portion of the British army was encamped in Newtown following the
British victory at the Battle of Long Island, Lt. Gen. Sir Henry Clinton set up his headquarters at
Nathaniel Moore's house while he planned the capture of Manhattan."
Source: http://s-media.nyc.gov/agencies/lpc/lp/1956.pdf
→ Strong visitor-interest fact if the site can be located; the farmhouse is demolished (see F21).

**F19.** The 1867 development of Woodside. Verbatim from Wikipedia: "Woodside was first developed on
a large scale beginning in 1867 by speculative residential neighborhood builder Benjamin W.
Hitchcock, who also founded [[Corona, Queens|Corona]] and [[Ozone Park, Queens|Ozone Park]], and John
Andrew Kelly." Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F20.** Contemporary 1874 description, quoted by Wikipedia as an ''New York Times'' blockquote.
Verbatim as it appears in the wikitext: "At Woodside there are now 100 houses erected, chiefly of
the villa-cottage order, and thirty trains daily stop at the station, making it, via the Hunter's
Point and James Slip Ferry, less than forty-five minutes from the lower part of the city. Woodside
is located on sloping ground, having a good elevation, and pleasing, though not very diversified
scenery. There is an abundance of good fruit trees in the vicinity..."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ This is Wikipedia quoting the NYT. The verifier should reach the 1874 NYT original before this is
used as a quotation.

**F21.** The "Charlottesville" subdivision and the fate of the Moore farmhouse. Verbatim from LP-1956:
"They had the Moore farm north of the Newtown Turnpike (Jackson Avenue) laid out into building lots
in 1868, naming their projected development Charlottesville. Most of the lots were sold off by 1871,
but at the turn of the century the blocks north of 32nd A venue [sic] remained completely
undeveloped. Bowery Bay Road was still a primitive country lane, and the Moore farmhouse had been
derelict for some decades prior to its demolition in 1901."
Source: http://s-media.nyc.gov/agencies/lpc/lp/1956.pdf

**F22.** The Great Chestnut Tree. Verbatim from Wikipedia: "The tree was hundreds of years old when
it finally came down in the last decade of the 19th century. It stood on high ground near a junction
of three dirt roads and \"was of great diameter, some 8 or 10 feet\"—perhaps 30 feet in
circumference." Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F23.** The 19th-century antiquarian's account of the chestnut tree, as blockquoted by Wikipedia
(verbatim, including Wikipedia's own bracketed editorial insertions): "Around the roots of the old
tree were the huts and stables of the cavalry: with a number of settler's huts ranged in woods...
Great festivities too were constant in the spacious rooms of the old Moore house, during the winter
months when the snow was deeper and the frost more cold than now-a-days. To the streaming lights
from the ball room, and the lanterns hung on the trees, were wont to assemble the gay sleighing
parties from the Sacket [i.e. Sackett], Morrell, Alsop, Leverich and other houses... Is there any
relic more associated with Newtown [i.e. the town in which the village of Woodside would come to be
located] than its old chestnut tree?... [Has it] not been for two centuries the \"Legal Notice\"
centre of Newtown, for all vendues, real estate transfers, town meetings, lost \"creeturs\" and
runaway slaves?" Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ Quoted-within-quoted. Verifier must reach the antiquarian original.

**F24.** The Sackett farm and the German estate owners. Verbatim from Wikipedia: "In 1802 he
inherited a farm of 115 acres including much of what is now Woodside, and in 1826 his heirs sold much
of the property to John A. Kelly, the son of a German immigrant, and his sister-in-law (also of
German descent), Catherine B. (Friedle) Buddy."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F25.** German-to-Irish ethnic succession. Verbatim from Wikipedia: "During the nineteenth century,
Germans largely took over from these first settlers. In addition to the major Germanic landowners
already mentioned (the Kellys—whose name was originally Kölle—Riker, Schroeder, Schmidt, Sussdorf,
and Windmuller), the first purchasers of Hitchcock's little plots were largely of German extraction.
They included men with names like Eberhardt, Groeber, and Schlepergrel."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F26.** "Irishtown". Verbatim from Wikipedia: "With large-scale [[residential development]] in the
1860s, Woodside became the largest [[Irish American]] community in Queens. In the early 1930s, the
area was approximately 80% Irish." And: "Woodside eventually became Irish enough to earn the
nickname \"Irishtown\"." Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ NOTE a possible internal inconsistency for the verifier: the WebFetch summary of the same article
rendered this as "being approximately 80% Irish by the 1930s", while the raw wikitext says "In the
early 1930s, the area was approximately 80% Irish." I am reporting the raw wikitext as authoritative
for what Wikipedia says.

**F27.** The 1980s–90s "new Irish". Verbatim from Wikipedia: "A subsequent influx of Irish occurred
during the 1980s and into the early 1990s when many Irish immigrated to New York due to poor economic
conditions in Ireland. Many of these \"new Irish\" settled in Woodside, where the men found work as
construction workers or bartenders while the women worked as waitresses, nannies or domestics."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F28.** Transit as the engine of growth. Verbatim from Wikipedia: "Woodside evolved as a hub for
railroad (the [[Main Line (Long Island Rail Road)|Long Island Rail Road's Main Line electrified]] in
1908), elevated [[rapid transit]] (the joint [[IRT Flushing Line|IRT/BRT Corona and Woodside Line]],
1917), and electrified trolleys (Newtown Railway Company, 1895, and [[New York and Queens County
Railway|New York and Queens County Line]], 1896)."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F29.** Verbatim from Wikipedia: "Although other areas of Queens benefited from the expansion of
cheap transit, Woodside was, back then, the only village in Queens with both railroad and rapid
transit stations in addition to trolley lines."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ Strong "why a visitor cares" claim, and a strong claim to verify.

**F30.** The five-cent fare. Verbatim from Wikipedia: "during rush hours, the five-cent trip took as
little as eight minutes to [[Times Square (IRT Flushing Line)|Times Square]]."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F31.** Early 20th-century apartment development. Verbatim from Wikipedia: "Three representative
examples are Woodside Apartments built in 1913, the [[Metropolitan Life Insurance Company]]'s project
of 1922, and the projects of the Woodside Development Corporation in 1923. ... Rents initially ranged
from $18 to $20 a month. ... Consisting of ten five-story buildings, the project had space for four
hundred families." Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F32.** 1943 community profile. Verbatim from Wikipedia: "A community profile, published in 1943,
characterized Woodside (along with Winfield, its neighbor to the south) as \"a district of small
homes and middle incomes.\" ... The number of single-family houses is given as 2,159, double-family
houses as 1,711, and larger residential buildings as 868."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ Note: this source calls Winfield Woodside's neighbor **to the south**, which is a boundary claim.

**F33.** Population series. Verbatim from Wikipedia: "The population was about 1,800 in 1880; 3,900 in
1900; 15,000 in 1920; and 41,000 in 1930. By 1963 it had grown to about 55,600, and by 2000, the
population had risen to 90,000." Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ **Flag:** the 2000 figure of "90,000" conflicts with F9's census figure of 43,846 for 2000.
Recorded, not resolved — this looks like a neighborhood-vs-district scope mismatch, but I am not
adjudicating it.

**F34.** The 1897 Guldensuppe murder. Verbatim from a Wikipedia image caption: "This extract from a
news article summarizes a sensational murder committed in a rented Woodside cottage on June 23, 1897.
The victim, his murderer, and the murderer's accomplice were all German, but none were Woodside
residents. The case is considered a landmark not in American jurisprudence but in the history of
yellow journalism." Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F35.** 1999 diversity claim. Verbatim from Wikipedia (via WebFetch): "In 1999, Woodsiders came from
49 countries and spoke 34 different languages."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

---

## §C — Parks and monuments (all NYC Parks pages, primary)

### P1 — Windmuller Park / Lawrence Virgilio Playground
- **NYC Parks official name:** `Lawrence Virgilio Playground`; the Historical Signs page is headed
  `Lawrence Virgilio Playground / Windmuller Park`.
- **Address as given by NYC Parks:** "52 St., Woodside Ave. bet. 39 Rd. and 39 Dr.", Queens
- **NYC Parks metadata (verbatim fields):** `Zip Code: 11377`, `Community Board: 2`,
  `Council Member: Julie Won`, `Park ID: Q031`, `Acreage: 3.01`, `Property Type: Neighborhood Park`
- **Neighborhood per source:** Woodside (explicit — see F36).
- Sources: https://www.nycgovparks.org/parks/lawrence-virgilio-playground ;
  https://www.nycgovparks.org/parks/lawrence-virgilio-playground/history

**F36.** Verbatim: "This park, located between 39th Road and 39th Drive and running from 52nd to 54th
Streets in Queens, is named for Louis Windmuller (1835-1913), a civic leader and businessman who
summered on this Woodside hill until his death in 1913."

**F37.** Verbatim: "Born in Westphalia, Germany in 1835, Louis Windmuller emigrated to the United
States at the age of 18. ... Windmuller also helped found the German-American Insurance Company in
response to the devastating fire that destroyed Chicago in 1871."

**F38.** Verbatim: "A fervent walker, Windmuller also established the \"Pedestrian Club\" which even
counted Mayor William Jay Gaynor as a member. In the summer, Windmuller often walked an hour from his
Woodside home to his Title Guaranty and Trust office downtown (via a ferry at Hunter's Point); he once
remarked that \"a good rule to make your tramp a really enjoyable pastime is to be careful and not
walk too fast.\""

**F39.** Verbatim: "In 1912 Windmuller's daughter Anna burned to death in a house fire and it was said
that he never recovered from the shock. ... An editorial in the New York Times called him \"an
exceedingly simple and likable man, whose kindly disposition and unfailing sympathy secured to him a
host of sincere friends.\""

**F40.** Verbatim: "The land comprising Windmuller Park was acquired from the Windmuller family in
1936 and the park was officially opened to the public in 1937."
→ **Conflicts with Wikipedia**, which says (verbatim): "In 1936, Windmuller's children donated the
family land to the city". *Acquired* vs *donated*. Recorded, not resolved.
Wikipedia source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F41.** Verbatim: "Neighboring Doughboy Park was fully improved and opened in 1957, and in 1959 the
section of 54th Street that ran between the two sites was closed to traffic and converted to
parkland, joining the two parcels."

**F42.** Verbatim: "The Windmuller Park Neighborhood Association was formed in the spring of 1973 and
in response to the community's enthusiastic support, Parks returned the favor that summer by making
significant repairs at the site. ... The park was so successful that it became one of the few in the
city where a flag actually flew on the flagpole installed at the site -- flag theft being a
widespread problem at that time."

**F43.** Verbatim: "In 2002 the park's playground was named for Lawrence Virgilio (1962-2001), a New
York City Firefighter who died in the World Trade Center on September 11, 2001. Virgilio, a
firefighter with the Greenwich Village-based Squad 18, used the playground as a youth growing up in
this neighborhood. Virgilio served 12 years with the Fire Department, receiving two unit citations for
bravery."

**F44.** Verbatim: "In 2007 a $2.1 million project added an open-air stage, a renovated ADA-accessible
public restroom, mini-pool, exercise track, pathways, fencing, basketball courts, and new exercise
equipment. City Council Member Eric Gioia funded $1.6 million for the project, with an additional
$485,000 from State Assembly Member Margaret Markey."

**F45.** Facilities listed by NYC Parks (verbatim list): "Basketball Courts / Eateries / Fitness
Equipment / Handball Courts / Outdoor Pools / Playgrounds / Public Restrooms / Running Tracks / Spray
Showers / Wi-Fi Hot Spots"

### P2 — Doughboy Park (a.k.a. Doughboy Plaza)
- **NYC Parks official name:** `Doughboy Park`. Requesting the slug `doughboy-plaza` redirects to
  the Doughboy Park page.
- **Address as given by NYC Parks:** "Woodside Ave. bet. 54 St. and 56 St.", Queens
- **NYC Parks metadata:** `Zip Code: 11377`, `Community Board: 2`, `Park ID: Q031A`,
  `Acreage: 1.71`, `Property Type: Triangle/Plaza`
- **Neighborhood per source:** Woodside (the monument is named "Woodside Doughboy").
- Sources: https://www.nycgovparks.org/parks/doughboy-park ;
  https://www.nycgovparks.org/parks/Q031A/history ; https://www.nycgovparks.org/parks/Q031A/monuments

**F46. ⚠ ADDRESS CONFLICT.** NYC Parks gives the location as "Woodside Ave. bet. 54 St. and 56 St."
Wikipedia gives it (verbatim) as "[[Doughboy Park|Doughboy Plaza]], bounded by Woodside Avenue, 52nd
Street, and 39th Road." The NYC Parks *monument* page gives a third form (verbatim):
"Location: Woodside and Roosevelt Avenues, 39 Road and 52 Street". Three different descriptions.
Recorded, not resolved. Sources: as above + https://en.wikipedia.org/wiki/Woodside,_Queens

**F47.** Verbatim: "The Town of Newtown acquired this land in 1893 as a play area for P.S. 11. It
passed into the City of New York's ownership in 1898, when Newtown and other Queens municipalities
were consolidated into the New York City. An adjacent park property was once the estate of Woodside
civic leader and businessman Louis Windmuller."

**F48.** Verbatim: "The land was eventually deemed too steep and overgrown for children's use and was
assigned to NYC Parks in 1957, and the new park opened the following year. The site was transformed
from a children's play area into a sitting area for adults, in keeping with the dignity of the park's
doughboy monument. ... Although the park was named in 1971, the bronze and granite monument has stood
on the site since 1923."

**F49.** The mustering ground. Verbatim: "Before the statue was erected, local soldiers gathered here
at the \"mustering ground\" before departing to fight in World War I. Ten men who left from this site
died in combat."

### P3 — The Woodside Doughboy (monument)
- Sculptor, dates, materials — all verbatim from the NYC Parks Art & Antiquities record:
  `Artist: Burt W. Johnson`, `Dedicated: 1923`, `Architect: C.N. Kent`, `Materials: Bronze, granite`,
  `Dimensions: Figure H: 7'2"; Pedestal H: 4'11½ W: 3'11" D: 3'11"`, `Cast: 1923`,
  `Inscription: LEST WE FORGET / 1917-1918 /`
- Source: https://www.nycgovparks.org/parks/Q031A/monuments

**F50.** Verbatim: "The Woodside Doughboy, alternately known as \"Lest We Forget\" or the \"Returning
Soldier,\" commemorates those from this community in Queens who served in World War I. The sculpture
was created by Burt W. Johnson (1890–1927), and was dedicated in 1923."

**F51.** Verbatim: "The monument was commissioned by the Woodside Community Council at a cost of
$5,000. Its granite pedestal was designed by C. N. Kent. The sculptor Burt Johnson was born in Flint,
Ohio, and lived for a time in Flushing, Queens. Johnson studied with sculptor James Earle Fraser and
Louis Saint-Gaudens, brother of the renowned artist Augustus Saint-Gaudens."

**F52.** Verbatim: "Unlike more active war memorial figures, Johnson's depiction of the doughboy
portrays a somber World War I soldier, with a downcast bandaged head, holding his helmet in front and
his gun to the side. The sculptor's health was failing as the piece was being completed, and he
supervised the final work from his wheelchair."

**F53.** The dedication ceremony. Verbatim: "The statue was dedicated on Memorial Day in 1923. The
ceremony included music by St. Mary's Military Band, a rendition of the \"Star Spangled Banner\" by
the children of P.S. 11, the doughboy's unveiling by Gold Star Relatives, and blessings by ministers
from St. Paul's and St. Sebastian's Churches."

**F54.** Verbatim: "In 1928, the American Federation of Arts selected the Woodside Doughboy as the
best war memorial of its kind."

**F55. ⚠ INTERNAL CONFLICT WITHIN NYC PARKS.** The Doughboy Park *history* page says (verbatim):
"The Woodside Doughboy is one of eight such statues erected in New York City's parks." The NYC Parks
*monument* page for the same statue says (verbatim): "The Woodside Doughboy is one of nine such
statues erected in New York City's parks." Eight vs nine, same agency. Recorded, not resolved.
Sources: https://www.nycgovparks.org/parks/Q031A/history ; https://www.nycgovparks.org/parks/Q031A/monuments

**F56.** Verbatim: "With the efforts of the Woodside Civic Association, in April 2007 a stone marker
was placed at the foot of the Doughboy statue listing the names of the 13 servicemen from Woodside who
gave their lives during World War I while serving their country."
→ **Flag:** F49 says "Ten men who left from this site died in combat"; F56 says a marker lists
"13 servicemen from Woodside". Both on NYC Parks. Not necessarily contradictory (different scopes)
but the verifier should not merge them.

**F57.** Verbatim: "A park restoration project completed in 2021 further improved the monument plaza
with bluestone paving, removal of high fences, increased seating, new lighting, and planting beds."
Source: https://www.nycgovparks.org/parks/Q031A/history

**F58.** Verbatim (headline on the park page): "NYC PARKS CELEBRATES NEW BLUESTONE PLAZA IN DOUGHBOY
PARK". Source: https://www.nycgovparks.org/parks/doughboy-park

**F59.** Origin of "doughboy". Verbatim: "The derivation of the term doughboy remains in question. It
was first used by the British in the late 18th and early 19th centuries to describe soldiers and
sailors. In the United States, the nickname was coined during the Mexican-American War (1846–1848),
and was widely popularized during World War I (1914–1918) to refer to infantrymen."

### P4 — Big Bush Playground / Bush Park
- **NYC Parks official name:** `Big Bush Playground`; Historical Signs heading `Bush Park`.
- **Address:** "Laurel Hill Blvd. bet. 61 St. and 64 St.", Queens
- **Metadata:** `Zip Code: 11377`, `Community Board: 2`, `Park ID: Q205A`, `Acreage: 2.50`,
  `Property Type: Community Park`
- **Neighborhood per source:** Woodside, explicitly.
- Sources: https://www.nycgovparks.org/parks/big-bush-park ; https://www.nycgovparks.org/parks/Q205A/history

**F60.** Verbatim: "Big Bush Playground is a hub of recreation for Woodside families, and a delightful
play space for kids."

**F61. ⚠ BOUNDARY CONFLICT.** NYC Parks' Historical Signs text says (verbatim): "Bush Park is bounded
by 61st and 64th Streets, Queens Boulevard, and the Brooklyn-Queens Expressway." Wikipedia says
(verbatim): "Big Bush Park, north side of Laurel Hill Boulevard between 61st and 64th Streets." The
park page header itself says "Laurel Hill Blvd. bet. 61 St. and 64 St." Recorded, not resolved.

**F62.** Verbatim: "In 1936, Mayor Fiorello H. LaGuardia (1882-1947, mayor 1934-1945) designated this
land as parkland; however, construction on the future Brooklyn-Queens Expressway interrupted
LaGuardia's plans."

**F63.** Verbatim: "The construction of the Kosciuszko Bridge over Newtown Creek in 1939 was the first
piece of what would later become the Brooklyn-Queens Expressway... The final bit of the Queens section
of the Expressway, including the segment that runs through Woodside, was completed in 1964."

**F64.** Verbatim: "The BQE, Bush Park, and Little Bush Park now share the land that was once Bush
Street." And: "Moses felt that \"the proposed park was located in a section of Queens which lacked
adequate recreational facilities.\""

**F65.** Verbatim: "Parks Commissioner August Heckscher and Queens Borough President Sidney Leviss
broke the ground for the $460,000 project on July 13, 1971... Commissioner Stern named the grounds
Bush Park on June 18, 1987."
→ **Conflicts with Wikipedia**, which says (verbatim) the park "opened in 1987, sixteen years after
construction started." NYC Parks describes 1987 as the *naming*. Recorded, not resolved.

**F66.** Verbatim (news headline on the park page): "NEW PLAYGROUND IN WOODSIDE'S BIG BUSH PARK NOW
OPEN AFTER NEARLY $2 MILLION IN UPGRADES". Source: https://www.nycgovparks.org/parks/big-bush-park

### P5 — General Hart Playground / Brig. Gen. Joseph T. Hart Park ⚠ CONTESTED
- **Address:** "Broadway, 37 Ave. bet. 65 St. and 69 St.", Queens
- **Metadata:** `Zip Code: 11377`, `Community Board: 2`, `Park ID: Q067A`, `Acreage: 0.90`,
  `Property Type: Neighborhood Park`
- Sources: https://www.nycgovparks.org/parks/general-hart-playground ;
  https://www.nycgovparks.org/parks/general-hart-playground/history

**F67. ⚠ CONTESTED ASSIGNMENT.** The NYC Parks history page for this park opens its "What was here
before?" section with the Woodside history quoted at F12 — i.e. NYC Parks frames it as a Woodside
park — but describes the honoree as (verbatim) "a resident of Elmhurst," and the page's "Other Parks
Nearby" list includes "Travers Park (0.55 miles)", which is the central Jackson Heights park. The
site sits at Broadway and 37th Avenue between 65th and 69th Streets, i.e. on the
Woodside/Jackson Heights/Elmhurst seam. Recorded, not resolved.

**F68.** Verbatim: "General Hart Playground was acquired by Parks & Recreation in 1954 as part of the
Brooklyn-Queens Expressway construction. It opened to the public in 1956. New play equipment and
benches were installed in 1996. In 2020, the playground was completely reconstructed to include
colorful play equipment and pavement treatments, a spray shower, and basketball courts. The playground
is incredibly vital to the neighborhood, where there are few other playgrounds."

**F69.** Verbatim: "In 1964, the park was named by the City Council for long time borough official
Brigadier General Joseph T. Hart (1902-1962)... He joined the National Guard in 1920 and enlisted in
the 69th Regiment, which later became the 165th Infantry. Hart rose through the ranks and was named
brigadier general in 1940. He served with the 165th in the South Pacific during World War II in the
battles of Makin and Saipan and commanded the unit at the Battle of Okinawa in April 1945."

**F70.** Verbatim: "In honor of his exemplary service, General Hart was awarded the Silver Star with a
Cluster, the Purple Heart, the American Defense Force Medal, and the New York State Conspicuous Service
Medal."

**F71.** `[PARAPHRASE]` The Philippine Forum's annual Filipino American History Month festival is held
at "the Hart Playground" per Wikipedia (verbatim: "The Philippine Forum also hosts the annual Bayanihan
Cultural Festival at the Hart Playground in September in commemoration of Filipino American History
Month."). Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ This links a contested-boundary park (P5) to Little Manila (§H).

### P6 — Torsney Playground / Lou Lodati Park ⚠ CONTESTED
- **Address:** "Skillman Ave. bet. 41 St. and 43 St.", Queens
- **Metadata:** `Zip Code: 11104`, `Community Board: 2`, `Park ID: Q340`, `Acreage: 2.03`
- Source: https://www.nycgovparks.org/parks/torsney-playground

**F72. ⚠ CONTESTED ASSIGNMENT.** ZIP 11104 is not Woodside's 11377, and NYC Parks' own sign text says
Torsney was a "supporter of parks and playgrounds for the Sunnyside area" (verbatim: "This playground
honors George F. Torsney (1896-1942), World War I veteran, New York State Assembly Member, and
supporter of parks and playgrounds for the Sunnyside area."). Yet the page's active capital project is
titled "Lou Lodati Playground and Dog Run Reconstruction". Included here because Skillman Avenue is the
Sunnyside/Woodside spine and this park is routinely claimed by both. Recorded, not resolved.

**F73.** Verbatim: "Born in Manhattan in 1896, Torsney attended public school until 1915 when he
graduated from the New York Evening High School. To earn extra money he sold newspapers on the corner
of 50th Street and Broadway in Manhattan. Torsney joined the Marines during World War I and was
promoted to First Sergeant. When he left the Marines in 1919 he began the Torsney & Moloney Trucking
Company. Torsney married Katherine Doyle in 1923 and the couple moved to 50th Avenue in Queens in 1926
where they had five children."

### P7 — L/CPL Thomas P. Noonan Jr. Playground ⚠ CONTESTED
- **Address:** "47 Ave., Greenpoint Ave. bet. 42 St. and 43 St.", Queens; `Park ID: Q044`
- Source: https://www.nycgovparks.org/parks/Q044

**F74. ⚠ CONTESTED ASSIGNMENT.** Listed by NYC Parks as 0.76 miles from Windmuller Park and 0.43 miles
from Torsney; the sign text (verbatim) reads "Bounded by Greenpoint and 42nd Avenues and 47th and 43rd
Streets, this site was acquired December 18, 1936 as part of Thomson Hill Park, and named for war hero
Thomas P. Noonan on May 14, 1996." Its location on Greenpoint Avenue in the 40s streets places it in
territory variously called Sunnyside and Woodside. Recorded, not resolved.

**F75.** Verbatim: "Noonan (1943-1969) was born in Brooklyn and graduated from Hunter College with a
bachelor's degree in Physical Education in 1966. On December 26, 1967 he enlisted in the U.S. Marine
Corps Reserve, and in July 1968, he was sent to the Republic of Vietnam, where he served as a mortarman
and later as a rifleman in the Third Marine Division. He was promoted to Lance Corporal on New Year's
Day in 1969."

### P8 — Nathan Weidenbaum Playground
**F76.** Verbatim from Wikipedia: "Nathan Weidenbaum Playground, south side of Laurel Hill Boulevard at
61st Street. It was named after a local resident who was one of the first occupants of the Wynwoode
Gardens Homes and advocated for improvements to the area."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ Also appears in NYC Parks "Other Parks Nearby" lists at 0.11 mi from Big Bush and 0.67 mi from
Doughboy. I did not retrieve its own NYC Parks page. `[GAP]`

### P9 — John Vincent Daniels Jr. Square
**F77.** Verbatim from Wikipedia: "John Vincent Daniels Jr. Square, 43rd and Roosevelt Avenues between
50th, 51st, and 52nd Streets, honors Vincent Daniels Jr., a Woodside resident killed in action during
World War I. He served as a Private 1st Class in the 102nd Field Signal Company and died during the
final days of the war in 1918. In 1933 the Board of Alderman named this site Vincent Daniels Square,
\"to pay tribute to a son of Queens County who made the supreme sacrifice in the World War."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ NOTE: the closing quotation mark is missing in the Wikipedia source itself. I have reproduced it as
found. Not independently retrieved from NYC Parks. `[GAP]`

### P10 — High Hopes Triangle
**F78.** Verbatim from Wikipedia: "High Hopes Triangle, a parklet at the meeting point of 66th and 67th
Streets north of Woodside Boulevard. This park recognizes the song \"High Hopes\" through a set of
concrete markers with lyrics from the song."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ Genuinely unusual visitor draw (a park built around a Sinatra song). Not independently retrieved
from NYC Parks. `[GAP]` Verifier should confirm the Sinatra/Sammy Cahn connection and why it is here.

---

## §D — Cemeteries and designated landmarks

### P11 — Moore-Jackson Cemetery (the ONLY NYC individual landmark LPC assigns to Woodside)

**F79.** LPC's own ArcGIS Individual Landmarks layer returns exactly one Queens record with
`NEIGHBORHO = Woodside`. Verbatim field values:
`LPC_NAME = Moore-Jackson Cemetery`; `Address = 51st to 54th Streets between 31st and 32nd Avenues`;
`LPC_LPNumb = LP-01956`; `NEIGHBORHO = Woodside`; `Date_Comb = 1733 - 1868`; `Arch_Prima = Unknown`;
`USE_ORIG = Cemetery`; `URL_REPORT = http://s-media.nyc.gov/agencies/lpc/lp/1956.pdf`
Source layer: https://services5.arcgis.com/Oos4pNA2538iVFA1/arcgis/rest/services/Individual_Landmark_Lots_Points/FeatureServer/0
(queried `where=Borough='QN'`, 86 records returned; only this one is tagged Woodside)
→ **Useful negative result for the verifier:** by LPC's own data, Woodside has *no* other individual
landmark and appears in no historic district. I did not separately query the historic-districts or
interior/scenic-landmark layers. `[GAP]`

**F80.** Designation header, verbatim from LP-1956: "Landmarks Preservation Commission / March 18,
1997; Designation List 278 / LP-1956" and "MOORE-JACKSON CEMETERY, 31-30 to 31-36 54th Street (aka
31-31 to 31-37 51st Street), Queens. Established by 1733." and "Landmark Site: Borough of Queens Tax
Map Block 1131, Lot 12." Source: http://s-media.nyc.gov/agencies/lpc/lp/1956.pdf

**F81. ⚠ CONTESTED — this is the sharpest boundary datum in the file.** The LP-1956 hearing record
lists who testified. Verbatim: "A total of nineteen witnesses spoke in favor of designation, including
Deputy Borough President Peter Magnani and representatives of Congressman Thomas Manton, Assemblyman
Joseph Crowley, Council Member Walter L. Mccaffrey, **Queens Community Board 1**, the Queens Historical
Society, the Queensborough Preservation League, the **Northern Woodside Coalition**, the **Greater
Astoria Historical Society**, the **Sunnyside Foundation for Community Planning and Preservation**, the
**Jackson Heights Beautification Group**, the Municipal Art Society, the New York Landmarks
Conservancy, and the Historic Districts Council; there were no speakers in opposition."
(Bold is mine, for the verifier's attention; the source has no bold.)
→ So: LPC calls the site Woodside, but the community board of record was **CD 1**, and civic groups
from Astoria, Sunnyside AND Jackson Heights all appeared. DCP's NTA layer (F1) puts this location in
`Astoria (East)-Woodside (North)`, CD 1. Recorded, not resolved.
Source: http://s-media.nyc.gov/agencies/lpc/lp/1956.pdf

**F82.** Summary, verbatim from LP-1956: "The Moore-Jackson Cemetery is a rare surviving Colonial-era
family burial ground. The Moore family burial ground was established by 1733 on the farm of Samuel
Moore and Charity Hallett Moore, not far from their house on Bowery Bay Road (present-day 51 st Street)
at the outskirts of the colonial village of Newtown. The Moores were wealthy landowners who played a
prominent role in the development of Queens and intermarried with such leading families as the Rikers ,
Berriens, Blackwells, Rapelyes , and Jacksons . The cemetery remained in active use until at least 1868
and contained at least fifty-one graves which were marked with fieldstone, brownstone, and marble
gravestones. Many of the headstones were lost or broken when the site suffered a period of neglect in
the early twentieth century. In 1936 the site was rehabilitated and the surviving stones were re-erected
at the east end of the property. Today fifteen gravestones survive including the exceptionally well
preserved fieldstone gravestone of Augustine Moore, dated 1769."
(Spacing irregularities are in the OCR of the original PDF.)

**F83.** The Augustine Moore stone, verbatim: "The earliest stone which remains legible is a fieldstone
slab in excellent condition, marked AxM, Dyd th 23, Nov. 1769 (fig. 6), which commemorates John and
Patience Moore's son Augustine, who died at the age of 17. (This headstone has been attributed to the
Thomas Brown, a New York stone carver active from the 1750s through the 1770s.)"
→ Note the LPC's own hedging shifts between sections: the Findings say "tentatively attributed to the
carver Thomas Brown" (verbatim). Recorded.

**F84.** Why family graveyards existed here, verbatim: "As Long Island is a glacial outwash with no
quarryable stone, there were no professional stone carvers in Queens until after 1800. Historic records
indicate that even the wealthiest early settlers employed wooden boards or posts as gravemarkers.
Fieldstones were also widely employed as gravestones in Queens between 1750 and 1775 and continued in
use through the early 1800s; most were originally carved with initials and death date by a member of
the family."

**F85.** The first recorded burial, verbatim: "The first recorded burial on the Moore plot was a
fieldstone slab inscribed SxR, dyed May ye 29, 1733 ... No longer identifiable, this marker probably
commemorated a remote kinsman, friend, or worker on the farm since no immediate family member appears to
have had a corresponding death date and initials."

**F86.** Last burials, verbatim: "John Mecke, who had bought the former Moore farmhouse and land in 1863,
made arrangements to bury his infant daughters, Augusta Eliza (died 1864) and Johanna Antoine (died
1865), in the graveyard. In 1867 Mecke himself was buried near his daughters, becoming one of the last
persons interred in the Moore Cemetery."

**F87.** The Jackson name. Verbatim: "In June 1867, concern about continued access to the burial grounds
prompted John C . Jackson (the husband of Martha Riker Jackson, a granddaughter of Nathaniel Moore, Jr.,
and Martha Gedney Moore) to purchase from Mosle a plot of land adjacent to the cemetery to expand it west
to the Bowery Bay Road, making a total extent of slightly more than half an acre."

**F88.** "Oak Hill" and the onset of neglect. Verbatim: "Although she Lived elsewhere, Mary Ann Riker
spent some time each year at the Jackson family mansion, \"Oak Hill,\" located on Newtown Road not far
from the Moore cemetery. In 1910 Mary Ann Riker's daughter, Margaret Haskell , had the Oak Hill mansion
disassembled and re-erected in Red Bank, New Jersey. At that point the Jackson-Riker heirs probably
stopped visiting the **Woodside-Elmhurst area** and the Moore-Jackson cemetery began to fall into
neglect." (Bold mine — note LPC here calls the district "Woodside-Elmhurst".)

**F89.** The 1919 survey. Verbatim: "The Moore-Jackson Cemetery was one of the first graveyards to be
surveyed in July 1919, at which time it had forty-two gravestones in varying states of preservation ."
And: "Eugene Armbruster took several photographs of the Moore-Jackson Cemetery in 1925 (fig. 9) , and the
Topographical Bureau photographed it in 1927 (fig. 10)."

**F90.** The WPA rediscovery. Verbatim: "In September 1935, a group of WPA workers, who had been assigned
to clear the lot of weeds and shrubs, discovered eighteenth-century gravestones and notified the
newspapers. The attendant publicity led Mrs. Charles B. Williams, Deputy Public Works Commissioner, to
renew her efforts to secure funds to restore this and about a dozen other private cemeteries that had
fallen into neglect. By April 1936, fill had been added at the Moore-Jackson Cemetery to bring the level
up to that of the adjacent streets."

**F91.** Twentieth-century episodes. Verbatim: "In 1954, a developer attempted to gain control of the
property by having the city foreclose for non-payment of taxes, but he abandoned this effort when he
discovered that the property was a tax-exempt cemetery. In 1956, a patriotic organization installed a
chain-Link fence around the lot to protect it from vandals. Neighbors and community groups , including
school classes and Boy Scout troops, have voluntarily cleared and cleaned the grounds over the years."

**F92.** Physical description. Verbatim: "Located at mid-block, between 31st Street and 32nd Street, the
Moore-Jackson Cemetery site extends from 51st to 54th Street. This lot was originally laid out as a
rectangle, but the northeast corner was cut off when 54th Street was cut through in the late-nineteenth
century. The lot has a frontage of 104 feet on 51st Street and seventy-eight feet on 54th Street."
→ **⚠ TYPO IN THE PRIMARY SOURCE.** LP-1956 here says "between 31st Street and 32nd Street" but its own
title block, and LPC's GIS layer, both say **31st and 32nd AVENUES**. Almost certainly an error in the
report. Flagging rather than fixing. Recorded, not resolved.

**F93.** Verbatim: "Within the gravestone area the fifteen surviving gravestones are oriented so that
most of them face towards 54th Street." And: "The surviving visible headstones were re-erected on a small
forty-by-fifty-foot plot at the 54th Street end of the lot which is set off by the cement posts of a
post-and-chain fence."

**F94.** Verbatim from the Findings: "the Moore-Jackson Cemetery is maintained by members of the local
community and is a tangible reminder of the borough's early history."

**F95.** Report authorship, verbatim: "Report prepared by / Gale Harris / Research Department"

**F96. ⚠ COUNT CONFLICT.** LP-1956 says "fifteen gravestones survive" and "contained at least fifty-one
graves". Wikipedia says (verbatim): "The cemetery is a [[New York City designated landmark]] with over 40
interments dating between 1733 and 1868." Elsewhere Wikipedia says (verbatim): "Only fifteen graves
remain visible, the earliest dated 1769." Fifteen visible stones ≠ 40+ interments ≠ 51 graves. Recorded,
not resolved. Sources: LP-1956 ; https://en.wikipedia.org/wiki/Woodside,_Queens

**F97.** Verbatim from Wikipedia: "the [[Moore-Jackson Cemetery]] on 51st and 54th Streets, between 31st
and 32nd Avenues, contains a community garden."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ LP-1956 corroborates a garden, verbatim: "the recent discovery of well-preserved fragments of a
gravestone by a volunteer laying out an herb garden near the center of the lot"

### P12 — Calvary Cemetery ⚠ CONTESTED

**F98.** The cemetery operator's own website lists the address as, verbatim:
"Calvary Cemetery / 49-02 Laurel Hill Blvd • Woodside, NY 11377 / 718-786-8000"
Source: https://www.calvarycemeteryqueens.com/ (Calvary & Allied Cemeteries, Archdiocese of New York)

**F99. ⚠ CONTESTED ASSIGNMENT.** The operator says Woodside. NYC DCP gives Calvary its own NTA,
`QN0271 Calvary & Mount Zion Cemeteries` (F1) — i.e. the City does not fold it into the Woodside NTA at
all. It is also commonly attributed to Maspeth, Sunnyside and Laurel Hill. Recorded, not resolved.

**F100.** Verbatim from Wikipedia: "[[Calvary Cemetery (Queens, New York)|Calvary Cemetery]] was founded
in 1845 by trustees of Manhattan's St. Patrick's Cathedral for Roman Catholic burials and was later
expanded by the addition of three sections comprising New Calvary. Calvary and New Calvary's combined
{{convert|300|acre|ha}} contain over three million burials."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ Not confirmed against the Archdiocese's own history page. `[GAP]`

**F101.** Verbatim from the operator's site, listing regular public events: "Calvary Cemetery – Mass /
September 5 @ 10:00 am" (recurring weekly Saturday Masses are listed).
Source: https://www.calvarycemeteryqueens.com/
→ Relevant to "what a visitor can actually do there."

---

## §E — Churches and religious institutions

**F102.** Verbatim from Wikipedia: "Of those for which information is available, Woodside's first church,
St. Paul's Protestant Episcopal, holds pride of place. It was damaged by fire in 2007 but still stands in
its original location." Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ WebFetch's summary of the same article gave the founding date as "(established 1874)" and St. Sebastian
as "founded 1896"; those dates are NOT in the raw wikitext passage above. **The verifier must not treat
1874/1896 as sourced from the passage I quote here.** `[GAP]`

### P13 — St. Sebastian Roman Catholic Church
**F103.** `[GAP] — NO PRIMARY SOURCE OBTAINED.` I could not reach a St. Sebastian (Woodside) parish site:
`stsebastianparish.org` resolves to a **different** St. Sebastian in Pocahontas, Iowa (its page verbatim:
"St. Sebastian Parish / 202 W Elm Ave | Pocahontas, IA"); `stsebastianwoodside.org` returned HTTP 521;
`stsebastian.church` returned an empty body; `parish.dioceseofbrooklyn.org` did not resolve. The parish is
attested only indirectly here:
- NYC Parks (verbatim, F53): "blessings by ministers from St. Paul's and St. Sebastian's Churches."
- Donovan's Pub's own site (verbatim): "Joe Donovan became well known throughout Woodside, especially with
  his neighbors across the street at St. Sebastian." — which places St. Sebastian across Roosevelt Avenue
  from 57-24 Roosevelt Ave. Source: https://www.donovansny.com/about
- Wikipedia lists "Saint Sebastian's Catholic Academy" among Woodside private schools.
The verifier must find a primary source (Diocese of Brooklyn parish directory) before any address or
founding date is written.

### P14 — Winfield Reformed Church ⚠ CONTESTED (by sub-neighborhood name)
**F104.** Verbatim from Wikipedia: "Winfield Reformed Church ( Chinese : 恩惠歸正教會 ) is a Protestant
church founded in 1880, located in Woodside , Queens , New York City . The church was originally located
on Queens Boulevard and moved to its current location in 1910. The current building was built in 1914. It
is part of the Reformed Church in America (RCA) denomination. **It is the oldest Taiwanese church
established in North America .**" (Bold mine.)
Coordinates given by the article: `40°44′33.5″N 73°53′51″W / 40.742639; -73.89750`
Source: https://en.wikipedia.org/wiki/Winfield_Reformed_Church

**F105.** Verbatim: "The church was historically Dutch -speaking and remained a mainly white congregation
until a large wave of Taiwanese immigrants came in the community in the 1960s. It became mostly Taiwanese
in the late 1960s and became the first mainly Taiwanese congregation in North America in 1969. Preaching
continued in both English and Taiwanese ." And: "Winfield was a hotbed for Taiwanese independence activism
outside of Taiwan for many decades."
Source: https://en.wikipedia.org/wiki/Winfield_Reformed_Church
→ **This is one of the richest under-told stories in Woodside.** The article is thin and I could not reach
`winfieldreformedchurch.org` (DNS failure). Verifier should chase RCA denominational records.
→ ⚠ Contested by name: the church carries the name of **Winfield**, a sub-neighborhood Wikipedia elsewhere
calls Woodside's "neighbor to the south" (F32) and which is also claimed by Maspeth and Elmhurst.

**F106.** WebFetch's summary of the Woodside article rendered this as: "the 'Winfield Reformed Church'
which 'began in 1880 as a Dutch Calvinist church.'" That phrase does **not** appear in the raw wikitext of
the Woodside article, which says only (verbatim): "In addition, the [[Winfield Reformed Church]] is located
in Woodside." **Treat "began in 1880 as a Dutch Calvinist church" as unsourced** unless the verifier
locates it. Recorded as a caution, not as a fact.

### P15 — Corpus Christi (parish/school), P16 — Razi School, P17 — Greater New York Academy
**F107.** Verbatim from Wikipedia's private-schools list: "Corpus Christi Elementary School / Greater New
York Academy, a Seventh Day Adventist school / [[Razi School]] / Saint Sebastian's Catholic Academy"
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ No addresses given; no primary sources retrieved. `[GAP]` Razi School is a Shia Islamic school and would
be a notable diversity datapoint if confirmed.

---

## §F — Housing and structures

### P18 — Woodside Houses (NYCHA) ⚠ CONTESTED
**F108.** NYCHA's own development dataset, verbatim field values (`development: WOODSIDE`, `tds_: 033`):
`completion_date: 1949-12-30`; `number_of_residential_bldgs: 20`; `number_of_stories: 6`;
`total_number_of_apartments: 1,357`; `number_of_current_apartments: 1,353`; `total_population: 2,648`;
`acres: 22.04`; `development_cost: $13,777,000`; `avg_monthly_gross_rent: $661`;
`location_street_a: 49TH ST`; `location_street_b: 51ST ST`; `location_street_c: 31ST AVE`;
`location_street_d: NEWTOWN RD`; `borough: QUEENS`; `community_distirct: 1` [sic];
`ny_city_council_district: 26`; `program: FEDERAL`; `type: NEW CONST`; `data_as_of: 1/1/2025`
Source: https://data.cityofnewyork.us/resource/evjd-dqpz.json

**F109. ⚠ CONTESTED ASSIGNMENT — and the cleanest example in this file.** NYCHA's building-address dataset
gives every Woodside Houses building the mailing city `WOODSIDE`, `zip_code: 11377` — while
simultaneously tagging each one `neighborhood_tabulation_area: QN0104`,
`neighborhood_tabulation_area_1: Astoria (East)-Woodside (North)`, `community_district: 1`. Sample verbatim
record: `{'development': 'WOODSIDE', 'address': '31-05 49TH STREET', 'city': 'WOODSIDE', 'zip_code':
'11377', 'neighborhood_tabulation_area': 'QN0104', 'neighborhood_tabulation_area_1': 'Astoria
(East)-Woodside (North)', 'community_district': '1', 'latitude': '40.757532', 'longitude': '-73.90977'}`
Source: https://data.cityofnewyork.us/resource/3ub5-4ph8.json
→ Same city agency, same row: named Woodside, districted Astoria. Recorded, not resolved.

**F110. ⚠ APARTMENT COUNT CONFLICT.** Wikipedia says (verbatim): "In 1949, construction was completed on
the Woodside Houses, a public housing complex built and operated by the [[New York City Housing Authority]].
The complex consists of 20 six-story buildings with **1,358** apartments. It is located in western Woodside,
bordering Astoria, between 49th and 51st Streets, 31st Avenue and Newtown Road." NYCHA's own dataset says
**1,357** total / **1,353** current (F108). Recorded, not resolved.
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ Note Wikipedia itself concedes the location is "in western Woodside, bordering Astoria."

### P19 — Big Six Towers
**F111.** From the co-op's own website, verbatim: page title "Big Six Towers Cooperative Housing in
Woodside, NY"; body: "Big Six is a Mitchell-Lama cooperative housing company that is home to almost 1,000
families."; and the management address, verbatim: "Big Six Towers, Inc. / Management Office / 60-10 Queens
Boulevard / Woodside, NY 11377" — with the note "(basement level of the shopping center)".
Sources: https://www.bigsixtowers.com/ ; https://www.bigsixtowers.com/about/
→ `[GAP]` Big Six was built by the Typographical Union No. 6 ("Big Six") per common accounts; the site does
not say so and I could not confirm it. The verifier should chase the union origin, which is the interesting
part.

### P20 — The former trolley car barn / Tower Square Shopping Center
**F112.** Verbatim from Wikipedia: "A trolley barn at Northern Boulevard and 51st Street has been preserved
as the Tower Square Shopping Center. The New York and Queens Railroad Company built the barn in 1896. A
transportation hub like the LIRR/IRT stations, it was the largest car barn in Queens."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ ⚠ Northern Blvd & 51st St is in the northern (CD 1) portion. See F1/F2.
→ ⚠ Wikipedia's own image caption for this is "Steinway Railway Woodside barn jeh.JPG" — naming *Steinway
Railway*, not New York and Queens Railroad. Recorded, not resolved. No primary source retrieved. `[GAP]`

### P21 — The Woodside copper beech
**F113.** Verbatim from Wikipedia: "Woodside also possesses an ancient tree, not the great chestnut (which
was gone by the end of the 19th century) but a large copper beech of somewhere between 150 and 300 years'
age. Documents in the archive of the Queens Historical Society suggest that it might have been planted
during the time of the Revolutionary War."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ No location given. `[GAP]` A visitor cannot find this from the source as written.

### P22 — Surviving 19th-century buildings (Forgotten NY list)
**F114.** Verbatim from Wikipedia: "An article published on the [[Forgotten NY]] weblog in 2005 lists this
and other interesting structures from 19th century Woodside which have survived. All are located close to
the center of town. They include the Hook and Ladder Company (1884), the home of Otto Groeber and his family
(1870), the Woodside Pavilion (1877), and Meyer's Hotel (1882)."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ ⚠ This is Wikipedia citing a **blog**, and I could not retrieve the underlying Forgotten NY article
(https://forgotten-ny.com/2005/09/woodside-queens/ returned HTTP 404). No addresses. These four buildings
are potentially the best "historic houses" material in Woodside and are currently **entirely unverified**.
`[GAP — HIGH PRIORITY FOR VERIFIER]`

### P23 — Former Childs Restaurant building
**F115.** Wikipedia's lead image caption, verbatim: "Former [[Childs Restaurant]] branch at 60th Street and
[[Queens Boulevard]] in Woodside" (file `Childs Woodside 5937 Queens Blvd 03.JPG`, implying the address
5937 Queens Blvd). Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ `[GAP]` Attested only by an image filename and caption. No text source. Chain-restaurant Childs
buildings are architecturally notable elsewhere in NYC; worth chasing.

### P24 — Bulova ⚠ CONTESTED / CONFLICTED
**F116. ⚠ SOURCE CONFLICT.** Wikipedia says (verbatim): "The [[Bulova Corporation]] had its headquarters in
northern Woodside along [[Interstate 278]] until 2014, when it sold the building for $30 million and
relocated to the [[Empire State Building]]. **The headquarters opened in 1875.**" Wikipedia's image caption
gives the address as "1 Bulova Avenue".
Bulova's own corporate site says (verbatim): "In New York City in 1875, Joseph Bulova set out to transform
how the world experienced time." — i.e. **1875 is the company's founding, in New York City, not the opening
of a Woodside headquarters.** Wikipedia appears to have conflated the two.
Sources: https://en.wikipedia.org/wiki/Woodside,_Queens ; https://www.bulova.com/us/en/about-us.html
→ Recorded, not resolved. Also note "northern Woodside along I-278" is CD 1 territory (F1/F2), and the
Bulova complex is frequently attributed to Jackson Heights / East Elmhurst. **Contested.**

---

## §G — Transit (MTA primary + Wikipedia)

**F117.** MTA's own station dataset, verbatim records (borough `Q`):
| stop_name | display_name | daytime_routes | structure_type | ada | lat, lon |
|---|---|---|---|---|---|
| `52 St` | `52 St (7)` | `7` | `Elevated` | `0` | 40.744149, -73.912549 |
| `61 St-Woodside` | `61 St-Woodside (7)` | `7` | `Elevated` | `1` | 40.74563, -73.902984 |
| `69 St` | `69 St (7)` | `7` | `Elevated` | `0` | 40.746325, -73.896403 |
| `Northern Blvd` | `Northern Blvd (M,R)` | `M R` | `Subway` | `1` | 40.752885, -73.906006 |
| `65 St` | `65 St (M,R)` | `M R` | `Subway` | `0` | 40.749669, -73.898453 |
Source: https://data.ny.gov/resource/5f5g-n3cz.json
→ Note MTA's official daytime routes for the Queens Boulevard stations are **M and R** — Wikipedia's
Woodside article describes them only as "IND Queens Boulevard Line local services". Also note only 61 St
and Northern Blvd are ADA-accessible (`ada: 1`).

### P25 — 61st Street–Woodside station (subway)
**F118.** Verbatim from Wikipedia: "61st Street–Woodside opened on April 21, 1917 as Woodside , as part of
an extension of the IRT Flushing Line to Alburtis Avenue (now 103rd Street–Corona Plaza). The Long Island
Rail Road station predates the station, as it originally opened in 1869."
Address per the article infobox: "61st Street & Roosevelt Avenue, Woodside, New York"; `locale: Woodside`.
Source: https://en.wikipedia.org/wiki/61st_Street%E2%80%93Woodside_station

**F119.** The escalator campaign. Verbatim: "On February 29, 1928, five petitions signed with 600 names were
sent to the New York State Transit Commission (NYSTC), requesting that an escalator be constructed at the
station to the southeastern corner of 61st Street and Roosevelt Avenue. ... The new escalator was placed
into service on December 27, 1930."

**F120.** Verbatim: "In 1981, the Metropolitan Transportation Authority (MTA) listed the station among the
69 most deteriorated stations in the subway system."

**F121.** Current renovation. Verbatim: "Construction began in June 2023, with work on the express track
slated to be completed in January 2024. However, additional structural repairs caused completion of this
work to be delayed until June 2025; the express track then reopened and work began on the Manhattan-bound
platform and local track... The work also included replacing 650 feet (200 m) of track. As of October 2025
, escalator replacement and renovation of the Manhattan-bound platform are slated to be completed in early
2026. A detailed timeline for reinstatement of express service west of 74th Street has not yet been
announced."
→ **⚠ TIME-SENSITIVE.** Express `<7>` service through Woodside was curtailed during this work. Verifier must
check current status before anything is written about express service.

**F122.** The interchange. Verbatim: "There is a mezzanine located at the center, underneath the platforms,
with an ADA-accessible elevator to each platform, as well as another to each Long Island Rail Road
platform." And accessible entrances listed verbatim: "Elevator at northeast corner of Roosevelt Avenue and
61st Street / Ramp to westbound Port Washington Branch platform from 63rd Street and Trimble Road / Ramp to
eastbound Main Line platform from dead end at 62nd Street near Woodside Avenue"

### P26 — Woodside station (LIRR)
**F123.** Infobox values, verbatim from wikitext: opened `1869|11|15` "(F&NS)"; closed `1914`; rebuilt
`1915` and `1999`; electrified `1910|06|16`, "750 V (DC) third rail"; `architect: Urbahn Architects`;
`code: WDD`; `zone: 1`; `platform: 2 side platforms / 1 island platform`; `tracks: 6`; lines
"Main Line / Port Washington Branch"; passengers "7,172 per weekday" for 2012–2014, "15 of 126".
Source: https://en.wikipedia.org/wiki/Woodside_station_(LIRR)
→ **This is the single most consequential transit fact for a visitor:** Woodside is the one Queens stop
where nearly all LIRR branches meet the 7 train. The platform table shows Main Line services plus the Port
Washington Branch both stopping here.

**F124.** Verbatim from the Woodside article: "Within Woodside, the double-decker station of the
[[Woodside (LIRR station)|Long Island Rail Road]] (built in 1869) and the [[61st Street – Woodside (IRT
Flushing Line)|IRT Flushing Line]] (built in 1917) both remain, and were renovated in 1999."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

### P27 — 52nd Street station ; P28 — 69th Street station
**F125.** Verbatim from the 52nd Street article infobox: "Address 52nd Street & Roosevelt Avenue, Woodside,
New York"; "Locale Woodside"; "Opened April 21, 1917"; "Former/other names 52nd Street–Lincoln Avenue";
"2024 1,479,311 ... Rank 215 out of 423".
Source: https://en.wikipedia.org/wiki/52nd_Street_station_(IRT_Flushing_Line)

**F126.** Verbatim from the 69th Street article: "The 69th Street station (also known as the 69th
Street–Fisk Avenue station ) is a local station on the IRT Flushing Line of the New York City Subway .
Located at 69th Street and Roosevelt Avenue in Woodside, Queens , it is served by the 7 train at all times."
Infobox: "Former/other names 69th Street–Fisk Avenue"; "2024 1,440,517 ... Rank 222 out of 423".
Source: https://en.wikipedia.org/wiki/69th_Street_station_(IRT_Flushing_Line)
→ ⚠ **69th Street is the contested eastern edge.** See F129/§L.

### P29 — Northern Boulevard station ; P30 — 65th Street station
**F127.** Both Wikipedia articles carry the infobox field `locale: Woodside` (verbatim wikitext:
`"locale":{"wt":"[[Woodside, Queens|Woodside]]"}`). Coordinates: Northern Blvd 40.753239, -73.906918;
65 St 40.7494, -73.8973.
Sources: https://en.wikipedia.org/wiki/Northern_Boulevard_station ;
https://en.wikipedia.org/wiki/65th_Street_station_(IND_Queens_Boulevard_Line)
→ ⚠ Northern Boulevard station at 40.7532 N sits in the CD 1 / `Astoria (East)-Woodside (North)` band.

### Buses and roads
**F128.** Verbatim from Wikipedia: "The Q18, Q32, Q39, Q47, Q53 SBS, Q60, and Q70 SBS buses connect Woodside
to the rest of Queens; the Q32 and Q60 run to [[Manhattan]], and the Q70 SBS goes to [[LaGuardia Airport]]
via [[Jackson Heights–Roosevelt Avenue/74th Street station|Roosevelt Avenue/74th Street]]."
And: "The [[Interstate 278|Brooklyn-Queens Expressway]] (I-278) is a major highway passing through the area,
serving Woodside via exits 39 through 43, as is the Long Island Expressway (I-495) via exit 18. [[Northern
Boulevard]] ([[New York State Route 25A|NY 25A]]) and [[Queens Boulevard]] ([[New York State Route 25|NY
25]]) also pass through Woodside." Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ **⚠ Cross-boundary hazard for this wave:** the Q70 SBS to LaGuardia is a Woodside *and* Jackson Heights
service; the 61 St-Woodside and Jackson Heights–Roosevelt Av/74 St stations are its two anchors. Do not
write it as exclusively Woodside's.

---

## §H — Culture

### P31 — "Little Manila" / Filipinotown ⚠ CONTESTED (extent)
**F129. ⚠ CONTESTED EXTENT.** Verbatim from Wikipedia's Woodside article: "\"[[Little Manila]]\", or
Filipinotown, stretches from 63rd-71st Streets on Roosevelt Avenue, where many Filipino-owned businesses
have flocked to serve Woodside's large [[Filipino American]] community". Verbatim from the *Little Manila*
article: "Along the 7 line, known colloquially as the \"International Express\", the **69th Street station
serves as the gateway** to Queens' very own Little Manila. ... The coverage of Little Manila is along
Roosevelt Avenue, from 63rd Street to 71st Street." (Bold mine.)
Sources: https://en.wikipedia.org/wiki/Woodside,_Queens ; https://en.wikipedia.org/wiki/Little_Manila
→ Roosevelt Avenue at 71st Street is three blocks from the Jackson Heights–Roosevelt Av/74 St hub. The
eastern half of Little Manila is routinely described as Jackson Heights by other writers. **Recorded, not
resolved.** Every business in §I east of ~69th Street inherits this problem.

**F130.** Verbatim: "Filipino cafés and restaurants dominate the area, as well as several freight and
remittance centers scattered throughout the neighborhood. Other Filipino-owned businesses including
professional services (medical, dental, [[optometry|optical]]), driving schools, beauty salons, immigration
services, and video rental places providing the latest movies from the Philippines dot the community. This
area attracts many local Filipinos and non-Filipinos alike and from neighboring places of [[Long Island]],
[[Connecticut]], [[Pennsylvania]], and [[New Jersey]]."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F131.** Verbatim from the *Little Manila* article: "Philippine remittance and shipping centers such as
Johnny Air Cargo, FRS, Edwards Travel, Apholo Shippers, Macro, Philippine National Bank , and Metrobank are
present in the area." Source: https://en.wikipedia.org/wiki/Little_Manila

### P32 — Little Manila Avenue (street co-naming)
**F132.** Verbatim from Wikipedia: "The intersection of 70th Street and Roosevelt Avenue was co-named
\"Little Manila Avenue\" on June 12, 2022, with a sign-unveiling ceremony to celebrate the Filipino
community's growing presence and contributions in Queens. Concomitantly, there is also a Roosevelt Avenue in
[[Roosevelt Avenue, Quezon City|Quezon City, Philippines]]."
Sources: https://en.wikipedia.org/wiki/Woodside,_Queens ; https://en.wikipedia.org/wiki/Little_Manila
→ `[GAP]` I could not retrieve the NYC Council local law authorizing the co-naming. Verifier should confirm
against NYC Council legislation. 70th St & Roosevelt Ave is inside the contested band (F129).

### P33 — Bayanihan Filipino Community Center
**F133.** Verbatim: "In February 2008, the Bayanihan Filipino Community Center opened its doors in Woodside,
a project spearheaded by the Philippine Forum."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ `[GAP]` No address. No primary source. Verifier should check whether it still operates.

### P34 — St. Pat's for All Parade ⚠ CONTESTED (route spans two neighborhoods)
**F134.** Verbatim from Wikipedia: "Woodside hosts New York City's only [[Saint Patrick's Day]] parade that
invites members of New York City's LGBTQ Irish community to march; it is called the [[St. Pat's for
All|St. Pat's for All Parade]]. The parade was founded by LGBTQ+ rights activist [[Brendan Fay]] after the
Irish Lesbian and Gay Organization (ILGO) was repeatedly denied permission to march in the Manhattan St.
Patrick's Day parade by the [[Ancient Order of Hibernians]]. **The parade runds [sic] from Sunnyside to
Woodside, with its starting point in 43rd Street and Skillman Avenue.**" (Bold mine; "runds" is a typo in
the source.) Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ ⚠ **The parade starts in Sunnyside.** 43rd St & Skillman Ave is Sunnyside. It is claimed by both
neighborhoods. Recorded, not resolved.

**F135.** Corroborating primary-ish source: Woodside on the Move's own events listing gives the parade's
location as, verbatim: "St. Patricks For All Parade / Windmuller Park (52nd St. and 39th Drive)" — i.e. the
organization lists a **Woodside** location, not the Sunnyside start.
Source: https://woodsideonthemove.org/
→ Two different locations for the same event, from two sources. Recorded, not resolved.

**F136.** Verbatim: "The slogan of the parade,\"Cherishing All the Children of the Nation Equally,\"
originates from the 1916 Easter [[Proclamation of the Irish Republic]]. The first parade was held on March
5, 2000." Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F137.** Verbatim: "In the inaugural year of 2000, the parade attracted over 70 groups of people, including
the Korean community honoring the important role that Irish nuns had played in their education, Chilean folk
musicians honoring Bernardo O' Higgins, the founding father and first president of Chile, and the son of an
Irish immigrant, children and their puppets, the Sunny Side Drum Corps, and LGBT organizations."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F138.** Verbatim: "The parade has attracted such politicians as former New York City mayors [[Rudy
Giuliani]] and [[Michael Bloomberg]]; [[Jason West]], mayor of [[New Paltz (town), New York|New Paltz, New
York]]; former congressman [[Joseph Crowley]], who represented the district; and former U.S. Senator and
Secretary of State [[Hillary Clinton]]." And: "St. Pat's for All Parade celebrated its 20th anniversary on
March 3, 2019." Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ ⚠ Arithmetic flag for the verifier: first parade March 5, 2000; "20th anniversary on March 3, 2019" is
the 20th *parade*, not 20 years. Recorded, not resolved.

### P35 — Celtic Park ⚠ CONTESTED (three different neighborhoods across two sources)
**F139. ⚠ CONTESTED ASSIGNMENT.** The Woodside article says (verbatim): "A major turning point in the
transition from German to Irish occurred in 1901 when the Greater New York Irish Athletic Association
formally opened a large athletic complex called Celtic Park **on the border between Woodside and Laurel
Hill**, its neighbor to the south."
The dedicated Celtic Park article's infobox says (verbatim): "Location **Sunnyside** , Queens , New York
City".
The same article's body says (verbatim): "The site lies in western Queens in what was historically known as
the **Laurel Hill** neighborhood, on rising ground near Calvary Cemetery within the wider **Long Island
City** district."
(Bold mine throughout.) Coordinates: 40°44′22″N 73°55′21″W.
Sources: https://en.wikipedia.org/wiki/Woodside,_Queens ;
https://en.wikipedia.org/wiki/Celtic_Park_(New_York_City)
→ Four names for one site. **Recorded, not resolved.**

**F140.** Verbatim: "In 1897 the Greater New York Irish Athletic Association, a working-class athletic club
founded earlier that year by P. J. Conway, purchased a parcel of about 7 acres (2.8 ha) from George Thomson
for $9,000. The association held its formal organizational meeting on January 30, 1898, at \"The Annex,\" a
Manhattan venue at Sixty-sixth Street and Third Avenue, with 100 members enrolling at that meeting. The club
chose the site for its proximity to the trolley line serving Calvary Cemetery, which made the new field
accessible to the Irish-Catholic working-class neighborhoods of Manhattan and Queens."
Source: https://en.wikipedia.org/wiki/Celtic_Park_(New_York_City)

**F141.** Verbatim: "The streets bordering the parcel were later renumbered as 42nd Street, 43rd Street, 44th
Street, 48th Avenue, and 50th Avenue, replacing Madden, Laurel Hill, Locust, Anable, and Gould Avenues
respectively." Source: https://en.wikipedia.org/wiki/Celtic_Park_(New_York_City)

**F142.** Verbatim: "The grounds were extensively remodeled over the winter of 1900–1901, and Celtic Park
reopened on Decoration Day , May 30, 1901, with what The New York Times had previewed as \"one of the most
completely equipped places of the kind about the city\"; about 5,000 spectators attended a carnival combining
track-and-field events, a Gaelic football match between the O'Connells and Young Irelands clubs, and Irish
reels and jigs." Source: https://en.wikipedia.org/wiki/Celtic_Park_(New_York_City)

**F143.** Verbatim: "The two-story clubhouse, measuring 104 by 120 feet (32 by 37 m) , contained bowling
alleys, sitting rooms, a kitchen, and a restaurant accommodating 1,000 patrons in the basement; on the floor
above were a café, dressing rooms, a reception room, private dining rooms, and an 80-by-100-foot (24 by 30 m)
dance hall with no internal supports, all opening onto piazzas with views of the track and the Manhattan
skyline. **The clubhouse was registered as a hotel, a designation that allowed it to serve alcohol on Sundays
despite the state's blue laws .**" (Bold mine — good colour.)
Source: https://en.wikipedia.org/wiki/Celtic_Park_(New_York_City)

**F144.** Verbatim: "The running surface was a circular 1⁄4-mile (400 m) track, with an enclosed grandstand
seating 2,500 on its west side and separate fields in the center and northeast of the park laid out for
baseball, cricket, polo, and football, and a 500-foot (150 m) rifle range with four ranges for \"match
shoots\" along the east side. Conway, in a 1931 interview, recalled the original grandstand as having held
8,000 spectators"
→ ⚠ Internal conflict inside the source: "grandstand seating 2,500" vs Conway recalling "8,000". Recorded,
not resolved. Source: https://en.wikipedia.org/wiki/Celtic_Park_(New_York_City)

### P36 — Woodside on the Move (community organization)
**F145.** From the organization's own website, verbatim: "Rooted in Woodside. All About Queens." and
"50 years strong in our community." / "Celebrating 50 Years". Programme description, verbatim: "We're all
about making Queens a better place to live, learn, and thrive. Through bold youth programs, fierce housing
advocacy, and vibrant cultural events, we uplift our neighbors and strengthen our community."
Source: https://woodsideonthemove.org/

**F146.** Events listed on its own site (verbatim): "Woodside Queens Fall Festival / 59th-63rd St. &
Woodside Ave, 11377"; "Woodside Queen Spring Festival / 61st Street and Woodside Ave (61st 7 train
station)"; "Spring Carnival / P.S. 11Q 54-25 Skillman Ave (Back Courtyard)"; "Back to School Backpack
Giveaway / Windmuller Park (52nd St. and 39th Drive)".
Source: https://woodsideonthemove.org/
→ Gives P.S. 11's address as 54-25 Skillman Ave, and confirms Windmuller Park as the org's anchor site.
→ A testimonial on the same page describes the org's catchment as, verbatim: "an irreplaceable resource for
the **Woodside-Sunnyside** community." (Bold mine.) — another shared-identity datapoint.

**F147.** LP-1956 (1997) cites a locally-published Woodside history by this organization, verbatim:
"Catherine Gregory, Woodside, Queens County, New York: A Historical Perspective, I652-1994 (Woodside, NY:
Woodside on the Move, Inc., 1994), 2-5, 14-19."
Source: http://s-media.nyc.gov/agencies/lpc/lp/1956.pdf
→ **Best lead in this file for deeper Woodside history.** A verifier or later wave should try to obtain it.

---

## §I — Restaurants and businesses

> **SOURCING RULE APPLIED:** For each entry I state explicitly whether the only source is the NYC DOHMH
> restaurant inspection dataset. Where a business has its own website, I say so and quote it.

### P37 — Donovan's Pub — **NOT DOHMH-only; primary source is the business's own website**
**F148.** Address per the business's own site markup, verbatim: `57-24 Roosevelt Avenue","addressLocality":"Woodside","addressRegion":"NY"` (ZIP 11377 also present in the page).
**F149.** Verbatim from its own About page: "Woodside's Landmark Gathering Place came to life in 1966 when a
New York City Firefighter named Joe Donovan, with the help of his father, purchased the Clover Leaf Bar on
the corner of 58th Street and Roosevelt Avenue. It didn't take long for Donovan's to become a favorite with
the heavily Irish community. Joe Donovan became well known throughout Woodside, especially with his neighbors
across the street at St. Sebastian."
**F150.** Verbatim: "The walls in Donovan's Pub tell the story of the community noting the heroism of many of
the neighbors - police officers and firefighters killed in the line of duty especially true of those lost in
the terrorist attacks on 9/11."
**F151.** Verbatim: "The Pub gained significant notoriety for its' signature burgers even being named by Time
Out New York, The New York Post, The Daily News, and others as the best burger in New York City!"
→ ⚠ This is the business's own claim about press coverage. The verifier must reach the actual Time Out / NY
Post / Daily News items before any "best burger in New York" claim is written.
**F152.** Verbatim: "With a desire to spend more time with family... after a 47 year run Joe Donovan decided
to put his landmark restaurant up for sale. But longtime employee Jimmy Jacobson wasn't going to take the end
of Donovan's sitting down. Jacobson-who had been there for 28 years, first as a busboy while in high school
and then as a bartender-partnered with his brother-in-law Dan Connor to save the landmark pub. **On January
20, 2013 (coincidentally the Feast Day of St. Sebastian), the new owners took over Donovan's Pub**"
(Bold mine.) Sources: https://www.donovansny.com/ ; https://www.donovansny.com/about
→ ⚠ Note the word "landmark" here is the pub's own marketing language, NOT a Landmarks Preservation
Commission designation. Per F79, Donovan's is not a designated landmark. **Do not let this collapse.**

### P38 — Sripraphai — **NOT DOHMH-only; primary source is the business's own website**
**F153.** Address per its own site, verbatim: `64-13 39th Ave,Woodside,NY,11377`; page title verbatim:
"SriPraPhai- Woodside - Woodside, Woodside, NY".
**F154.** Verbatim from its own site: "Established in 1990, the brand has been dedicated to delivering
Authentic Thai Cuisine to the local community and friends from all around with pride, passion, and
dedication." And: "Since the 1990s Sripraphai Tipmanee, has been sharing her love and passion of providing
traditional cuisine to the New York community. **She began with a small bakery in Elmhurst. In time she
turned the tiny bakery in Elmhurst into what became the first Sripraphai in Woodside**, serving a vast
variety of time-honored dishes and desserts." (Bold mine.)
Source: https://www.sripraphai.com/
**F155. ⚠ ADDRESS CONFLICT.** The business's own site says **64-13** 39th Ave. NYC DOHMH's inspection
dataset lists it as **`SRIPRAPHAI | 64-15 39 AVENUE | 11377 | Thai`**. Recorded, not resolved.
Sources: https://www.sripraphai.com/ ; https://data.cityofnewyork.us/resource/43nn-pn8j.json
→ The business also operates a second location in Williston Park (its menu nav lists "Williston Park
location food menu"), so "Sripraphai" alone is ambiguous.

### P39 — Ihawan · P40 — Renee's Kitchenette · P41 — Jollibee (Woodside), and the further establishments
listed at F156 — **DOHMH-ONLY. The ONLY source for the name+address pairing below is the NYC DOHMH
restaurant inspection dataset (https://data.cityofnewyork.us/resource/43nn-pn8j.json). This constrains what
may be written: it establishes that a permitted food establishment of this name exists at this address in
ZIP 11377, and its DOHMH cuisine label — nothing about quality, notability, hours, or current operation.**

**F156.** Verbatim DOHMH records (`dba | building street | zipcode | cuisine_description`):
```
IHAWAN                | 40-06 70 STREET        | 11377 | Filipino
RENEE'S KITCHENETTE   | 69-14 ROOSEVELT AVENUE | 11377 | Filipino
JOLLIBEE              | 62-29 ROOSEVELT AVENUE | 11377 | Chicken
TITO RAD'S GRILL      | 49-10 QUEENS BOULEVARD | 11377 | Filipino
SEAN OG'S IRISH PUB   | 60-02 WOODSIDE AVENUE  | 11377 | Irish
LA FLOR               | 53-02 ROOSEVELT AVENUE | 11377 | Mexican
DE MOLE               | 45-02 48 AVENUE        | 11377 | Mexican
WOODSIDE CAFE         | 60-06 WOODSIDE AVENUE  | 11377 | American
WOODSIDE CAFE         | 64-23 BROADWAY         | 11377 | Asian/Asian Fusion
```
→ ⚠ Note two distinct establishments both named "WOODSIDE CAFE" at different addresses with different
cuisine labels. Do not merge them.
→ ⚠ `IHAWAN` (70th St) and `RENEE'S KITCHENETTE` (69-14 Roosevelt Ave) sit in the contested eastern band
(F129) — both are within three blocks of Jackson Heights' 74th Street hub.
→ ⚠ `DE MOLE` at 45-02 48 Avenue is in the low-40s streets, i.e. the Sunnyside-contested western band.

**F157.** Non-DOHMH corroboration for some of these, from Wikipedia's *Little Manila* article, verbatim:
"Restaurants such as Ihawan, Perlas ng Silangan, Renee's Kitchenette, Fritzie's Bakeshop, Fiesta Grill,
Barrio Fiesta and Krystal's Cafe, are the most popular ones". And: "Jollibee , a famous fast-food chain in
the Philippines, **opened its first branch in New York in February 2009, selecting Woodside, Queens.** Red
Ribbon Bakeshop , a sister company of Jollibee, followed suit in January 2010." (Bold mine.)
Source: https://en.wikipedia.org/wiki/Little_Manila
→ The Jollibee "first in New York" claim is a strong visitor draw and needs verification.

**F158.** Verbatim from the *Little Manila* article, on businesses it places **outside** the Little Manila
strip but inside Woodside: "Other Filipino businesses that exist in Woodside but are not within the Little
Manila area are Engeline's, a Filipino restaurant at 59th Street and Roosevelt Avenue, Tito Rad's Restaurant
at Queens Boulevard and 50th Street, Payag Restaurant on 52nd Street - Roosevelt Avenue, Lourdess Restaurant
on 58th Street and 37th Avenue and Papa's Kitchen on 65th Place and Woodside Avenue."
Source: https://en.wikipedia.org/wiki/Little_Manila
→ ⚠ Wikipedia says Tito Rad's is at "Queens Boulevard and 50th Street"; DOHMH says `49-10 QUEENS BOULEVARD`.
Compatible but not identical. Recorded.

**F159.** Verbatim from the *Little Manila* article: "BPI , Getz Travel, Lucky Money Remittance, an office of
TFC and Papa's Kitchen, that offers KAMAYAN night every Friday and Saturday (**featured in The NY Times on
October 9, 2013/Dining/Hungry City**) on 65th Place & Woodside have also opened in Woodside's Little Manila."
(Bold mine.) Source: https://en.wikipedia.org/wiki/Little_Manila
→ Concrete, checkable citation. `[GAP]` I did not retrieve the NYT article.

**F160.** Verbatim from the *Little Manila* article, listing non-restaurant businesses: "Establishments such
as Eyellusion, Jefelli Photo and Video, Manila Phil-Am Driving, Santos Medical Clinic, Luz-Vi-Minda, Marlyn's
Beauty Salon, Marry Indo Beauty Salon, Freddy Lucero Beauty Salon, Dimple Beauty Salon, Bambina Salon, Jan-Mar
Technologies, Don's Professional Services, Casino Law Office, Kulay at Gupit, **Phil-Am Foodmart**, Mabuhay
Filipino Store, and Nepa Q Mart are also there to serve the thriving Filipino American community."
Source: https://en.wikipedia.org/wiki/Little_Manila
→ ⚠ **Currency warning:** this list is undated and includes "video rental places" elsewhere in the same
article. Much of it is likely stale. The verifier should assume nothing here is still open.
→ Phil-Am Foodmart is depicted in the article's photo caption, verbatim: "The Phil-Am grocery store in
Woodside, Queens, New York".

---

## §J — Schools, library, post office

**F161.** Public schools, verbatim from Wikipedia: "PS 11 Kathryn Phelan (grades K-6) / PS 12 James B Colgate
(grades K-5) / PS 151 Mary D Carter (grades PK-5) / PS 152 Gwendolyn N Alleyne School (grades PK-5) / PS 229
Emanuel Kaplan (grades PK-5) / IS 125 Thomas J McCann Woodside Intermediate School (grades 6–8) / William
Cullen Bryant High School (grades 9–12)"
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ ⚠ Wikipedia's *image caption* on the same page spells it "P.S. 152 Gwendoline N. Alleyne School" while the
list says "Gwendolyn N Alleyne". Recorded, not resolved.
→ ⚠ William Cullen Bryant High School is at 48-10 31st Avenue — in the northern (CD 1) band and widely
described as an **Astoria** school. Not confirmed here. `[GAP] / CONTESTED`
→ P.S. 11's address is given by Woodside on the Move as "54-25 Skillman Ave" (F146). Skillman Ave is the
Sunnyside/Woodside spine.

**F162.** Verbatim from Wikipedia: "I.S.125 Thomas J.McCann Intermediate school in 47th ave, Woodside,
Queens." (image caption). Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F163.** Queens Public Library, Woodside branch. The library's own page gives the address, verbatim:
`54-22 Skillman Avenue` with a directions link encoding `Skillman+Avenue%2C++Woodside%2C+NY+11377`.
Source: https://www.queenslibrary.org/about-us/locations/woodside
→ ⚠ Same Skillman Avenue caveat. The branch is named Woodside by QPL itself, which is decisive for QPL's
purposes but not for the neighborhood question.

**F164.** The branch runs active community programming. Verbatim event titles from its own page: "ESOL
Conversation Group", "Pathway to U.S. Citizenship: Becoming a ...", "Woodside Graphic Novel Book Club",
"Woodside Book Club", "Artificial Intelligence (AI) Essentials:...", "Clay Day".
Source: https://www.queenslibrary.org/about-us/locations/woodside
→ The ESOL and citizenship programming is a meaningful signal about the neighborhood's immigrant present.

**F165.** Post office, verbatim (repeat of F5): "The [[United States Post Office]] operates the Woodside
Station at 39-25 61st Street." Source: https://en.wikipedia.org/wiki/Woodside,_Queens

**F166.** Educational attainment, verbatim from Wikipedia: "While 45% of residents age 25 and older have a
college education or higher, 19% have less than a high school education and 35% are high school graduates or
have some college education." And: "In Woodside and Sunnyside, 11% of elementary school students missed twenty
or more days per [[school year]], lower than the citywide average of 20%. Additionally, 86% of high school
students in Woodside and Sunnyside graduate on time, more than the citywide average of 75%."
Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ ⚠ Again **Woodside AND Sunnyside**, not Woodside alone.

---

## §K — Notable residents (all from Wikipedia's list; none independently verified) `[GAP]`

**F167.** Verbatim list entries: "[[Edward Burns]] (born 1968), actor"; "[[James Caan]] (1940–2022), actor,
attended P.S. 150"; "[[Francis Ford Coppola]] (born 1939), movie director, screenwriter, producer";
"[[Morton Feldman]] (1926–1987), 20th-century composer"; "[[Joel Klein]] (born 1946), former New York City
Schools Chancellor, lived in the Woodside Houses housing project"; "[[Chris Gethard]] (born 1980), author,
comedian"; "[[Evelyn Fox Keller]] (1936–2023), [[physicist]], author and [[feminism|feminist]]";
"[[Harry Marmion]] (1931–2008)... president of the [[United States Tennis Association|United States Tennis
Association (USTA)]] during the construction and opening of the [[Arthur Ashe Stadium]]";
"[[Frank McCourt]] (1930–2009), [[Pulitzer Prize]]-winning author"; "[[Edmar Mednis]] (1937–2002),
International Grandmaster of chess"; "[[Jack Mercer]] (1910–1984), [[voice actor]], [[animator]] and writer,
who was best known as the voice of cartoon characters [[Popeye the Sailor]] and [[Felix the Cat]]";
"[[Robert Emmett O'Malley]] (born 1943), U.S. Marine veteran of [[Vietnam War]]; [[Medal of Honor]]
recipient."; "[[Thomas J. Pickard]] (born 1950), acting [[Director of the Federal Bureau of Investigation]]
for 71 days in mid-2001"; "**[[Charlotte E. Ray]], (1850–1911), the first Black American female lawyer in the
United States.**"; "[[Lynn Samuels]] (1942–2011), radio host"; "[[Joe Spinell]] (1936–1989), actor"
(Bold mine.) Source: https://en.wikipedia.org/wiki/Woodside,_Queens
→ ⚠ Wikipedia itself tags "[[Edmar Mednis]]" and "[[Joe Spinell]]" with `{{citation needed|date=November
2017}}`. I have preserved that signal.
→ ⚠ **Charlotte E. Ray** is the most significant name on this list and the one most worth verifying — she is
buried in Cypress Hills, and her Woodside connection needs an independent source.
→ ⚠ James Caan "attended P.S. 150" — P.S. 150 is not among the Woodside schools listed at F161.

---

## §L — CONTESTED NEIGHBORHOOD ASSIGNMENTS (recorded, NOT resolved)

Every place below has at least one source assigning it to a neighborhood other than Woodside, or to
Woodside-plus-another. **I make no determination.** Street address and each source's own assignment are given.

| # | Place | Address (as sourced) | Assigned "Woodside" by | Assigned elsewhere by |
|---|---|---|---|---|
| 1 | **Moore-Jackson Cemetery** (P11) | 31-30 to 31-36 54th St, aka 31-31 to 31-37 51st St; Block 1131 Lot 12 | LPC GIS `NEIGHBORHO = Woodside`; LP-1956 title | LP-1956's own hearing record names **Queens Community Board 1**; DCP NTA `QN0104 Astoria (East)-Woodside (North)`, CD1; LP-1956 body calls the district "the Woodside-Elmhurst area" |
| 2 | **Woodside Houses** (P18) | 49th–51st Sts, 31st Ave, Newtown Rd | NYCHA mailing `city: WOODSIDE`, ZIP 11377; Wikipedia | NYCHA's own row: `community_distirct: 1`, NTA `Astoria (East)-Woodside (North)`; Wikipedia concedes "bordering Astoria" |
| 3 | **Calvary Cemetery** (P12) | 49-02 Laurel Hill Blvd | Operator's own site: "Woodside, NY 11377" | DCP gives it a standalone NTA `QN0271 Calvary & Mount Zion Cemeteries`; commonly Maspeth/Laurel Hill/Sunnyside |
| 4 | **General Hart Playground** (P5) | Broadway, 37 Ave bet. 65–69 St | NYC Parks (ZIP 11377, CB2; Woodside history text) | NYC Parks' own text calls honoree "a resident of **Elmhurst**"; nearest-park list includes **Travers Park** (Jackson Heights) |
| 5 | **Torsney Playground / Lou Lodati Park** (P6) | Skillman Ave bet. 41–43 St | Capital-project name "Lou Lodati Playground"; Woodside adjacency | NYC Parks `Zip Code: 11104`; sign text says "the **Sunnyside** area" |
| 6 | **L/CPL Thomas P. Noonan Jr. Playground** (P7) | 47 Ave, Greenpoint Ave bet. 42–43 St | Proximity/park-cluster | Greenpoint Ave in the 40s streets is widely **Sunnyside**; originally "Thomson Hill Park" |
| 7 | **Celtic Park** (P35) | 42nd–44th Sts, 48th & 50th Aves | Woodside article: "border between Woodside and Laurel Hill" | Celtic Park infobox: "**Sunnyside**"; its body: "**Laurel Hill** ... within the wider **Long Island City** district" |
| 8 | **Little Manila (whole district)** (P31) | Roosevelt Ave, 63rd–71st Sts | Both Wikipedia articles | Eastern end (69th–71st) abuts **Jackson Heights**; "69th Street station serves as the gateway" |
| 9 | **Little Manila Avenue co-naming** (P32) | 70th St & Roosevelt Ave | Wikipedia (both articles) | 70th St is inside the contested band; 4 blocks from Jackson Heights–Roosevelt Av/74 St |
| 10 | **Renee's Kitchenette** | 69-14 Roosevelt Ave, 11377 (DOHMH-only for address) | DOHMH ZIP 11377; *Little Manila* article | Contested band per #8 |
| 11 | **Ihawan** | 40-06 70 Street, 11377 (DOHMH-only for address) | DOHMH ZIP 11377; *Little Manila* article | Contested band per #8 |
| 12 | **De Mole** | 45-02 48 Avenue, 11377 (DOHMH-only) | DOHMH ZIP 11377 | 48th Ave in the 40s streets is Sunnyside-contested |
| 13 | **St. Pat's for All Parade** (P34) | Starts 43rd St & Skillman Ave | Wikipedia headline claim "Woodside hosts"; Woodside on the Move lists it at **Windmuller Park** | Wikipedia's own body: "runs from **Sunnyside** to Woodside, with its starting point in 43rd Street and Skillman Avenue" |
| 14 | **Queens Public Library, Woodside branch** (F163) | 54-22 Skillman Ave | QPL's own branch name and address block | Skillman Ave is the Sunnyside/Woodside spine; adjacent P.S. 11 also on Skillman |
| 15 | **Bulova former HQ** (P24) | "1 Bulova Avenue", along I-278 | Wikipedia: "northern Woodside" | Northern = CD 1; the Bulova complex is commonly attributed to **Jackson Heights / East Elmhurst**; Bulova's own site says only "New York City in 1875" |
| 16 | **Former trolley car barn / Tower Square** (P20) | Northern Blvd & 51st St | Wikipedia | Northern Blvd & 51st is in the CD 1 / `Astoria (East)-Woodside (North)` band |
| 17 | **Winfield Reformed Church** (P14) | coords 40.742639, -73.89750 | Its Wikipedia article: "located in Woodside, Queens" | Named for **Winfield**, called Woodside's "neighbor to the south" (F32) and claimed by Maspeth/Elmhurst |
| 18 | **Northern Boulevard subway station** (P29) | Northern Blvd, 40.752885 N | Wikipedia infobox `locale: Woodside` | Latitude places it in the CD 1 / Astoria (East)-Woodside (North) band |
| 19 | **William Cullen Bryant High School** (F161) | 48-10 31st Ave *(address not sourced here — `[GAP]`)* | Wikipedia's Woodside school list | Widely described as an **Astoria** school; 31st Ave is in the CD 1 band |

(19 rows; 17 of these are distinct *places*, the other two being a district and an event.)

---

## §M — Open gaps and priorities for the verifier

1. **`[GAP — HIGH]`** The four surviving 19th-century buildings at F114 (Hook and Ladder Company 1884; Otto
   Groeber house 1870; Woodside Pavilion 1877; Meyer's Hotel 1882) are Woodside's best "historic houses"
   material and rest entirely on a Forgotten NY blog post I could **not** retrieve (HTTP 404). No addresses.
2. **`[GAP — HIGH]`** St. Sebastian RC Church (P13): no primary source reached at all. Three candidate
   domains failed; a fourth is a different parish in Iowa.
3. **`[GAP — HIGH]`** Catherine Gregory, *Woodside, Queens County, New York: A Historical Perspective,
   1652-1994* (Woodside on the Move, Inc., 1994) — cited by LPC (F147). This is the local history of record
   and nobody has consulted it.
4. **`[GAP]`** Winfield Reformed Church's claim to be "the oldest Taiwanese church established in North
   America" (F104) is remarkable and thinly sourced; its own domain failed DNS.
5. **`[GAP]`** LPC historic-district, interior-landmark and scenic-landmark layers not queried; only the
   Individual Landmarks layer was. National Register (NPS) listings not checked at all.
6. **`[GAP]`** NYC Parks pages not retrieved for Nathan Weidenbaum Playground, John Vincent Daniels Jr.
   Square, and High Hopes Triangle — all three rest on Wikipedia alone.
7. **`[GAP]`** The NYC Council local law co-naming "Little Manila Avenue" (F132) was not retrieved.
8. **`[GAP]`** The NYT items cited at F20 (1874 Woodside description) and F159 (Papa's Kitchen, Oct 9 2013
   Hungry City) were not retrieved.
9. **⚠ CURRENCY** The Little Manila business lists (F157, F158, F160) are undated and probably substantially
   stale — the same article still mentions "video rental places".
10. **⚠ CURRENCY** The 61 St-Woodside reconstruction (F121) was ongoing as of the source's October 2025
    update, with `<7>` express service curtailed and no announced restoration date. Check before writing.
11. **⚠ SCOPE** Do not write F11, F32 or F166 as Woodside statistics. They are **Woodside + Sunnyside**
    (Community Board 2) figures.
12. **⚠ UNRESOLVED NUMERIC CONFLICTS** logged above and left open: 13,332 vs 13,000 acres (F15/F12); eight
    vs nine doughboy statues (F55); ten vs thirteen WWI dead (F49/F56); 51 graves vs 40+ interments vs 15
    visible stones (F96); 1,357/1,353 vs 1,358 apartments (F110); 64-13 vs 64-15 39th Ave (F155); grandstand
    2,500 vs 8,000 (F144); 2000 population 43,846 vs 90,000 (F33); Bush Park opened vs named 1987 (F65);
    Windmuller land "acquired" vs "donated" (F40); Doughboy Park's three different addresses (F46).
13. **⚠ PARAPHRASE-LAUNDERING RISK** F106 records a phrase ("began in 1880 as a Dutch Calvinist church") that
    appeared in a WebFetch *summary* but is **not** in the source text. Likewise the "(established 1874)" /
    "(founded 1896)" church dates at F102. Do not let these enter the record as quotations.
