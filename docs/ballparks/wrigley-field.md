# Wrigley Field — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/wrigley_field_places.ex`
and `lib/ethos/seeds/wrigley_field_guide.ex`.

**This file is committed on purpose.** The research artifact and the task report
live under `.superpowers/`, which `.gitignore:42` excludes — the same
arrangement that lost the Brooklyn research artifacts and is the reason
`docs/content-defects.md` exists. A moduledoc that cites a git-ignored path for
its audit trail has no audit trail a year from now. The moduledocs cite this
file instead.

Source: the 2026-08-30 Wrigley Field research artifact, adjudicated by an
independent adversarial verifier. The `verdicts` arrays hold **157 confirmed,
4 refuted, 7 uncertain**; separately each of the 23 researched places carries a
`status_verdict` — **18 open, 5 uncertain, 0 closed**.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**21 places and 1 guide shipped** from 23 researched places.

---

## 1. Places, against the verdicts they rest on

### wrigley-field — Wrigley Field (`stadium`)

`1060 West Addison Street, Chicago, IL 60613` · `official_url: nil`

| Published | Verdict `item` |
|---|---|
| "The home ballpark of the Chicago Cubs, at 1060 West Addison Street" | *"Wrigley Field is the home ballpark of the Chicago Cubs of Major League Baseball."* + *"The ballpark's address is 1060 West Addison Street, Chicago, Illinois."* |
| "in the Wrigleyville neighborhood of the Lake View community area on Chicago's North Side" | *"Wrigley Field is in the Wrigleyville neighborhood of the Lake View community area, on Chicago's North Side."* |
| "opened on April 23, 1914 as Weeghman Park" | *"The ballpark opened on April 23, 1914, as Weeghman Park."* |
| "built for Charles Weeghman's Chicago Whales of the Federal League" | *"It was originally built for the Chicago Whales of the Federal League, who played there in 1914 and 1915."* — the builder's name from that verdict's correction, which lists it as available and unused. |
| "designed by Zachary Taylor Davis" | *"The architect was Zachary Taylor Davis."* |
| "Capacity is 41,649." | *"Capacity is given as 41,649."* |
| "coming second in the Federal League in 1914 and winning the championship in 1915" | same verdict's reason and correction. |
| "the Cubs moved in from the West Side Grounds before the 1916 season" | *"The club moved from the West Side Grounds to the much newer Weeghman Park before the 1916 season."* |
| "named Cubs Park from 1920 to 1926, before changing its name to Wrigley Field in 1927" | verbatim; the verifier re-checked this against a conflicting "November 1926" reading. |
| "It follows the jewel-box ballpark design that was popular in the early part of the 20th century." | the **refuted** verdict on the finder's no-style claim: *"Publish that wording or nothing. Do not paraphrase it into an architectural-movement label."* |
| "the oldest park in the National League, the second-oldest in the majors after Fenway Park (1912), and the only remaining Federal League park" | *"Sourced superlatives about the ballpark that the finder did not capture"* — correction: *"These may be published as quoted."* |
| "Bill Veeck planted the ivy against the outfield walls in 1937" | *"In 1937, Bill Veeck planted ivy vines against the outfield walls."* |
| the scoreboard sentence, including "from within the scoreboard" | correction: *"If quoted, quote it whole — the phrase 'from within the scoreboard' is part of the sentence."* |
| "art deco-style marquee … installed in 1934, was originally green, and was repainted red on March 23, 1960 … \"Wrigley Field, Home of Chicago Cubs\" in white" | the marquee verdict; "art deco-style" from its correction, which authorises it **for the marquee, not for the ballpark**. |
| "the last Major League Baseball park to have lights installed … August 8, 1988, after 5,687 consecutive Cubs day games" | verbatim; the verifier checked the superlative separately from the date. |
| "Chicago Landmark on February 1, 2004, and a National Historic Landmark and a National Register listing on September 23, 2020" | two verdicts, one per designation. |
| "$575-million privately funded 1060 Project … January 2013 Cubs Convention … phase one … September 29, 2014" | verbatim verdict `item`. |
| "ivy-covered walls in the left and right field corners were cut from 15 to 11 feet before the 2015 season" | *"…reduced from 15 to 11 feet in height prior to the 2015 season."* |

**Not published:** record attendance 47,171 (the correction warns explicitly
against publishing it as capacity); 2026 schedule, ticket and tour prices
(unreachable); whether "The Yard at Wrigley Field" announced January 2025 has
opened (confirmed *unestablished*); any `official_url` — mlb.com returned HTTP
406 to every fetch.

### billy-goat-tavern-wrigleyville — Billy Goat Tavern & Grill (Wrigleyville) (`restaurant`)

| Published | Verdict `item` |
|---|---|
| "the chain's own locations page gives at 3724-3726 N. Clark Street" | *"The chain's own locations page lists a Wrigleyville branch at 3724-3726 N. Clark Street, Chicago, IL 60613."* |
| "The chain's Wikipedia article lists eight locations and this is not among them" | *"could_not_establish: the Wikipedia article does not list a Wrigleyville location while the chain's own site does."* |
| "William \"Billy Goat\" Sianis bought the Lincoln Tavern at 1855 W. Madison St. in 1934" | verbatim verdict `item`. |
| "in 1964 that tavern moved to 430 N. Michigan Ave., which is actually below Michigan Avenue" | verbatim verdict `item`. |
| "Sianis brought his pet goat to Game 4 of the 1945 World Series … against the Detroit Tigers" | verbatim verdict `item`. |
| the "cheezborger" / Belushi / *Olympia Cafe* sentence | verbatim verdict `item`. |

**Correction obeyed:** *"Attribute to the chain and to the original Madison
Street tavern, never to 3724 N Clark."* The history field opens with that
attribution in prose. **Not published:** any reason for the 1945 ejection; the
branch's opening year, menu or hours.

### metro-chicago — Metro (`theater`)

Music venue at 3730 N Clark Street; founded by Joe Shanahan; first opened 1982;
capacity 1,100 across main floor and balcony; Smart Bar opened July 1982 as a
dance club, initially fourth floor, later basement, holds 400; building built
1927 as a Swedish Community Center; Stages Music Hall 1979-1982, Cabaret Metro
1982-1992; Nirvana, Soundgarden, Mudhoney, Jane's Addiction, Hole, Oasis,
Smashing Pumpkins, Liz Phair.

Every clause is a verdict `item` verbatim except the capacities and the 1927
building, from the **refuted** verdict's correction: *"Publishable: built 1927
as a Swedish Community Center; capacity 1,100 across main floor and balcony;
Smart Bar 400. Still no architectural style — do not supply one."* **No style is
supplied.**

### gman-tavern — Gman Tavern (`restaurant`)

3740 N Clark St.; rotating draft list; vinyl collection; M-F from 3pm, Sat/Sun
from noon; opens two hours before every Cubs home game start and during all
Metro shows; happy hour weekdays 3pm-6pm **excluded on Cubs home games**, with
discounted draft and well drinks, Malort shots and a "Chicago Handshake"; no
founding year; no stated ownership relationship to Metro.

Correction obeyed: *"The happy hour is stated as weekdays 3-6pm and excluded on
Cubs home games — publish the exclusion with it or neither."*

**Not published:** "next door to Metro" — an unsourced spatial claim that reached
a first draft. Adjacency is not in any verdict.

### murphys-bleachers — Murphy's Bleachers (`restaurant`)

Address published as **3655 North Sheffield Avenue**, not the licence range
3653-3655, per the correction preferring the business's own street address.

Local craft beers and pub food; hours Sun-Fri 11am-2am, Sat 11am-3am; recurring
Pub Trivia Night except on home game days; Murphy Rooftop Company holds a City
licence of type "Wrigley Field" at 3649 N Sheffield Ave.

**Not published, and named as unverified:** the Ernie's Bleachers origin story
and "first rooftop in 1984" — both **`uncertain`**. **Not published at all:** the
"award-winning menu" claim and "close to 80 years".

### the-cubby-bear — The Cubby Bear (`restaurant`) · `official_url: nil`

The verifier's instruction was literal: *"This record is two facts and should be
published as two facts."* Those two: the Lake View article's naming of it among
the Clark-and-Addison establishments hosting Cubs crowds, and the licensed
entity Cubby Bear Lounge Ltd with its four licence types.

**`official_url` is nil.** cubbybear.com returned HTTP 403 to both the finder
and the verifier, so nothing establishes the domain belongs to the business. A
first draft published it as official while the record's own prose said the site
refused every fetch.

### sluggers-chicago — Sluggers (`restaurant`) — **renamed and re-slugged**

`3540 North Clark Street, Chicago, IL 60657` — ZIP corrected: *"ZIP IS WRONG. The
licence register gives zip_code 60657 for 3540 N Clark St, not 60613."*

Wings, burgers, pizza, salads, appetizers, full bar; second level with batting
cages, electronic basketball, skee-ball, air hockey, arcade and virtual driving
games; over 40 TVs including six 10-foot screens; hours Mon-Thu 3pm-2am, Fri
11am-2am, Sat 11am-3am, Sun 11am-2am, Cubs home game hours subject to change.

**Dropped from the verdict `item`:** "dueling pianos" and "dance floor", per the
correction. **Dropped entirely:** "family owned … over 35 years" (**uncertain**);
"THE premiere sports bar in all of the city of Chicago"; "the best APPETIZERS in
Wrigleyville"; "WORLD FAMOUS BATTING CAGES"; "one of the most well known sports
bars in the world"; "sports bar on steroids".

**Name and slug changed** from `sluggers-world-class-sports-bar` / "Sluggers
World Class Sports Bar & Grill" to `sluggers-chicago` / **"Sluggers"**. No
verdict carries the long name; the register carries "Sluggers" and "Sluggers
Grill". The long form would have published an unsourced self-superlative as an
`<h1>` and in a URL — the same class of claim the verifier struck four times on
this record's own page. `ballpark_seed_data_test.exs` now gates this.

### yakzies-bar-and-grill — Yakzie's Bar & Grill (`restaurant`) — **re-slugged**

3710 N Clark St; wings, burgers, sandwiches, cheese curds, an Italian beef
sandwich; hours Mon-Sat 11:00 AM-12:00 AM, Sun 1:00 PM-12:00 AM; states it opens
for every Cubs game.

**Not published:** "Wrigleyville's #1 Cubs party headquarters for 36 years", and
no founding year derived from "36 years", which carries no date. Name from the
register's "YAKZIE'S BAR & GRILL"; slug follows the name.

### smoke-daddy-wrigleyville — Smoke Daddy (Wrigleyville) (`restaurant`)

Two locations, Wicker Park and this one at 3636 North Clark Street; tagline "BBQ,
Blues, Beers"; own sauces and rubs; no source states whether live blues is
programmed at this branch.

**Not published:** the 1994 founding date — **uncertain**, and not attributable
to either branch. Omitted silently rather than named, because naming it would
put the disputed year on the page. **Dropped:** "CHICAGO STYLE SPARE RIBS", per
the correction; "world-class BBQ".

### mordecai-wrigleyville — Mordecai (`restaurant`)

"An American bistro at 3632 N. Clark Street, across from the ballpark, serving
classic dishes and wine" — exactly the factual core the correction authorises.
Plus: the licensee of record is registered as Mordecai Brown, also the name of a
Cubs pitcher, **and no source states the bar is named after him**.

**Dropped:** "lively", "done right", "a bar that always has room".

### hotel-zachary — Hotel Zachary (`hotel`) · `official_url: nil`

3630 North Clark Street; "just across Clark Street" (verbatim); constructed along
the west side of Clark Street as part of the Wrigley Field renovation project;
open for business in time for the Cubs' first home game on April 9, 2018.

**Not published:** room count, architect, namesake, brand affiliation, in-house
restaurants. The verdict's note is pointed — *"room counts are a documented
source of finder error in this programme — publish none without a verdict"*.

**`official_url` is nil.** hotelzachary.com returned HTTP 403 to both agents and
there is no Wikipedia article, so nothing ties the domain to the hotel.

### guthries-tavern — Guthries Tavern (`restaurant`)

Name spelled as the source and the register spell it, without an apostrophe.

1300 W Addison; a large collection of board games; craft cocktails, draft and
bottled beer, wine, cider, hard seltzer; pizza, soft pretzels, potato chips,
cheese flights; hours Mon-Fri 3 PM-2 AM, Sat 11 AM-3 AM, Sun 11 AM-2 AM;
Thursday Jeopardy! league, Tuesday trivia, euchre leagues (from the correction,
listed as available and unused).

**Reputation converted to offering**, per the correction: *"Publish the offering,
not the reputation … Drop 'well known for'."* **Dropped:** the 1900
corner-grocery / 1933 Moretti / 1986 renaming history — one `uncertain` verdict
covering all three.

### bernies-chicago — Bernie's (`restaurant`) — **renamed and re-slugged** · `official_url: nil`

The name verdict is **`uncertain`**: *"If this record ships, name it 'Bernie's' —
the name the register carries. Do not publish 'Tap & Grill'."* The slug moved off
`bernies-tap-and-grill` for the same reason — a slug is published text.

3664 North Clark Street; the register carries it as Bernie's with Tavern, Outdoor
Patio, Retail Food Establishment and Public Place of Amusement licences; that
entry is the only source reached, because berniestap.com does not resolve in DNS.

**Kept rather than dropped** — the finder suggested dropping it. Four licence
categories say what the place *is*, which meets the "what they are, where they
are" threshold. Cubs Store, below, does not.

### nisei-lounge — Nisei Lounge (`restaurant`) — **trading status `uncertain`** · `official_url: nil`

`3439 North Sheffield Avenue, Chicago, IL 60657` — ZIP corrected.

A bar at that address, on the register with Tavern and Outdoor Patio licences;
niseilounge.com does not resolve; founding year, history and the origin of the
name are not published.

**Explicitly not written:** that it is open or currently trading, and that it is
long-established. The verifier: *"This bar is widely described as long-established
in Wrigleyville, but I have no source for that and it must not be written."*

### merkles-bar-and-grill — Merkle's Bar & Grill (`restaurant`) — **trading status `uncertain`** · `official_url: nil`

`3516 North Clark Street, Chicago, IL 60657` — ZIP corrected.

Register entry with Public Place of Amusement, Retail Food Establishment and
Consumption on Premises licences; the Lake View article names Merkle's among the
Clark-and-Addison establishments hosting Cubs crowds, **and the record says that
sentence carries no date**. Menu, hours, founding year and namesake not published
(merklesbarandgrill.com returned HTTP 401).

The naming sentence is attributed to the article rather than asserted, so it does
not read as a claim that the bar is trading today.

### clark-street-sports-wrigleyville — Clark Street Sports (Wrigleyville) (`shop`) — **trading status `uncertain`**

Storefront at 3650 North Clark Street on the register; the company's
self-description as *"a locally owned Chicago sports apparel retailer with more
than 10 locations across Chicagoland"*; apparel, shirts, hats, jerseys,
accessories, souvenirs, gifts and pet merchandise for the **Cubs, White Sox,
Blackhawks, Bulls and Bears**; and that its own site lists no store addresses.

**Five teams, not eight**, per the correction: *"Drop Chicago Sky, Red Stars and
Fire FC unless re-verified."* **Not published:** any founding year; any
relationship to "Sports World" at 3555 N Clark, which the finder inferred.

### music-box-theatre-chicago — Music Box Theatre (`theater`) · `official_url: nil`

`3733 North Southport Avenue, Chicago, IL 60613` — correct, and the correction
warns that Southport Grocery further south is 60657 and *"Do not normalise
them."*

Opened August 22, 1929 with a seating capacity of 750; **present seated capacity
748**; second screen 75; first-run features, repertory, weekend matinees,
midnight cult films, foreign and independent film; independently owned and
operated by the Southport Music Box Corporation since 2003; Edward Steinborn and
Louis I. Simon as original architects; first theatre organ, an Allen three manual
electronic, installed in the previously empty organ chambers in 1984; annual
traditions — *White Christmas*, *It's A Wonderful Life*, a 24-hour horror movie
film festival in October, a 70mm festival, yearly *2001: A Space Odyssey*.

**The 750/748 split is deliberate:** *"If a present-tense capacity is published it
is 748, not 750. Keep 750 only in the sentence about 1929."* Both appear, each in
its own tense.

**Architectural style — published, in the source's words, under attribution.**
The correction permits two forms and forbids a third: *"Either state the style as
atmospheric, which the article asserts in its own voice, or quote the melange
line WITH its attribution to Paul Gapp of the Chicago Tribune, 1983. Never
present the melange wording as the article's own description."* The record does
both permitted things and neither forbidden one.

### southport-grocery-and-cafe — Southport Grocery & Cafe (`cafe`)

`3552 North Southport Avenue, Chicago, IL 60657` — the finder listed this ZIP as
**unsourced**; the verifier sourced it to the register: *"ZIP 60657 confirmed by
the City licence register. Publish it."*

Breakfast and lunch; specialty grocery of house-made preserves, pickles and
mustards plus artisanal local products; hours every day 8 AM-3 PM with the
kitchen closing before that; no founding year; and the 60657/60613 contrast with
the Music Box stated on the record so a later editor does not "correct" it.

**Not published:** "the kitchen closing 30 minutes prior", although sourced and
not a travel time. A `{file, phrase}` allowlist key over a 300-line Elixir module
would pardon any "30 minutes" anywhere in the file, and the gate is worth more
than the clause. See `ballpark_seed_data_test.exs`. **Not published:** "ten
blocks south of the Music Box" — see §2.

### the-vic-theatre — The Vic Theatre (`theater`) — **trading status `uncertain`** · `official_url: nil`

`3145 North Sheffield Avenue, Chicago, IL 60657` — the finder marked this ZIP
unsourced; the verifier **refuted** that and sourced it to the register.

Opened 1912 as the Victoria Theatre; designed by John Eberson; the article's
phrase *"a luxurious five-story Vaudeville house"* **inside the quotation**, per
the correction: *"'Luxurious' is the source's adjective, not a fact about the
building today. Use it inside the quotation or not at all."*; recorded as a music
venue owned by Jam Productions accommodating 1,400, or 1,000 seated; Brew & View
established mid-1990s, **in the past tense**, with the record stating no source
says whether it still runs.

**Design attributed, not construction.** A first draft read "designed by John
Eberson, who built it as…". The source attributes the design; it does not say he
built it.

**No location claim relative to the ballpark**, per the verdict. The record states
the sourced fact that Wrigleyville's southern boundary is Cornelia Avenue, north
of 3145 N — a bordering relationship, which §8 permits.

### alta-vista-terrace-district — Alta Vista Terrace District (`historic-site`) · `official_url: nil`

One-block street in Lake View at 1050 West, running north from Grace Street (3800
North) to Byron Street (3900 North); 40 small, single-family rowhouses; built 1904
by real estate developer Samuel Gross, inspired by the row houses of London after
a trip to Europe; twenty exterior designs arranged so matching houses face
diagonally across the street; style given as **"Late 19th And 20th Century
Revivals"**; Doric and Ionic wood pilasters, Gothic arches, Palladian windows,
stained and leaded-glass fanlights, bay and bow windows; Chicago Landmark
September 15, 1971; NRHP March 16, 1972, reference number 72000448.

**Boundary hedged**, per the verdict: *"hedge any boundary language and do not
assert it is 'in' Wrigleyville."* The record says "at or just beyond that edge".

**Not published:** "The houses are private residences" as a source statement. The
artifact's line is *"The houses are private residences; I found no source stating
whether any is open to visitors. Assume none."* — "assume none" is the verifier
reasoning, not a source. The record publishes only the sourced negative: no
source states whether any house is open to visitors.

### graceland-cemetery-chicago — Graceland Cemetery (`historic-site`) · `official_url: nil`

4001 N. Clark Street; **121 acres** present-day with **80 acres** given separately
as Swain Nelson's *original* layout, per the correction: *"121 acres present-day;
80 acres was the original layout. Keep them apart."*; founded 1860 by Thomas
Barbour Bryan, first burial April 1860 when Bryan's son Daniel was reinterred;
Horace Cleveland's 1870 curving paths, open vistas and small lake; Ossian Cole
Simonds landscape architect from 1879 and superintendent until 1897; the Getty
Tomb and Martin Ryerson Mausoleum by Louis Sullivan, who is buried there; the
Schoenhofen Pyramid Mausoleum; Eternal Silence and The Crusader by Lorado Taft;
the Marshall Field memorial by Henry Bacon with sculpture by Daniel Chester
French; Daniel Burnham, George Pullman and Ernie Banks buried there; NRHP January
18, 2001.

**Boundary hedged and access withheld:** north of Grace Street (3800 N),
Wrigleyville's sourced northern boundary, so beyond that edge; no source gives
visiting hours or states whether it is open without appointment.

**No community area is named for it.** Alta Vista Terrace's placement in Lake View
is confirmed; Graceland's is not. A first draft's FAQ read "Both are in Lake
View" — one sentence confirming one half and carrying the other along. The only
relevant verdict establishes that 4001 N is north of Grace Street and nothing
more.

---

## 2. What was not published, and why

### Two place records dropped

**the-park-at-wrigley.** Carries an `uncertain` verdict on its own current name —
*"A verifier must settle the current name before this record is authored, or the
record should be dropped"*, correction: *"Drop this record. Rule 8 of the
contract — nothing about identity ships from an unchecked name — applies to a
venue's own name most of all"* — and a confirmed verdict that its address is
**not** established: *"could_not_establish: the plaza's street address is inferred
from the licence record."*

The record therefore cannot say what it is called or where it is, which is the
whole of what an uncertain-trading record is meant to publish. Its only other
substance is one past-tense clause whose correction forbids converting it to the
present.

This is a drop on **identity**, not on trading status. Uncertain trading status
does not block publication; an uncertain *name or address* does, because those
are the two things the publish-what-is-confirmed rule asks for. Upheld at review.

**cubs-store-wrigleyville.** Only confirmed content is a Limited Business License
at 3637 N Clark St. Correction: *"Do not describe this as the Cubs' own team
store. The licensee is Levy Premium Foodservice Limited Partnership. Given the
record would be a name, an address and a licence category, dropping it is
defensible."*

Distinguished from Bernie's, which shipped: Bernie's four licence categories say
what the place *is*. Cubs Store's single Limited Business License says nothing
about what it sells, and the artifact establishes that the name implies an
affiliation that is **false**. A page titled "Cubs Store" forbidden from saying
whether it is the team store asserts the affiliation by omission. Upheld at
review.

### Strange Cargo — excluded, and gated

The register shows STRANGE CARGO, LTD. held licences at 3448 N Clark through a
term expiring 2019-02-15, and the same entity's licences at 5216 N Clark (ZIP
60640) run to 2027-02-15 — the overlap is the move. A successor, 7 HEAVEN SMOKE
KING, has held a Tobacco licence at 3448 since 2023. 5216 N Clark is roughly 1.7
miles north of the ballpark, outside Wrigleyville's sourced northern edge at
Grace Street.

Per the verifier's `gate_recommendation`, `wrigley_field_test.exs` asserts the
corpus names neither "Strange Cargo", "3448 N Clark" nor "5216 N Clark" —
following the `antique_trail_test.exs` precedent.

### Distances between places — none published

A first draft carried "nine blocks south" (Murphy's to Nisei) and "ten blocks
south" (Music Box to Southport Grocery) on three surfaces including a place
summary. **No verdict carries either.** The "ten blocks" traced only to an aside
inside the Music Box address verdict's `correction`, whose confirmed content is
the ZIP pair — a verifier's throwaway clause promoted to published fact.

The artifact's own grid data refutes both: Grace Street at 3800 N and Byron at
3900 N are one block apart, so 3655 → 3439 is about two blocks, not nine.

Relative position is now given as a direction between two published street
numbers and nothing more.

### `official_url` — four records carry nil

Set only where a verdict establishes the domain belongs to the business. The
Cubby Bear and Hotel Zachary were published as official in a first draft while
both domains had returned HTTP 403 to both agents; an unreachable domain is not a
verified one. Wrigley Field itself has none (mlb.com HTTP 406), and Bernie's
domain does not resolve.

### The rooftop revenue share — written as history

**Confirmed with a material omission**: the finder dropped the end date. Full
sentence: *"Rooftop owners were required to pay the team 17% of their gross
revenue in an agreement lasting until 2023."*

Published in both the guide section and the FAQ as: *"Under an agreement reached
in 2004, rooftop owners were required to pay the club 17% of their gross revenue.
That agreement ran until 2023, and no source reached says what replaced it."* A
test asserts every 17% mention carries "ran until 2023" and that no mention uses
a present-tense form.

### The 1945 goat ejection — incident published, reason withheld

Two Wikipedia articles give two reasons and the verifier reproduced both. The
guide publishes the incident, states in prose that it gives neither reason, and
carries an FAQ making the position explicit. Registered in
`docs/content-defects.md` under "Open".

The telegram is quoted only as far as the confirmed `item` carries it. The
verifier notes the source continues *"…because you insulted my goat"* and warns
that *"the edge of the quotation is the edge of what is confirmed"*.

### Superlatives

Four are source-stated and ship in the source's wording: "the oldest park in the
National League", "the second-oldest in the majors after Fenway Park (1912)",
"the only remaining Federal League park", "the last Major League Baseball park to
have lights installed". **Every self-asserted superlative is excluded** — Sluggers
(six), Yakzie's (one), Smoke Daddy (one), Murphy's (one award claim) — and
`ballpark_seed_data_test.exs` now gates superlatives in slugs and names.

### Architectural style — published where sourced, withheld where not

The finder applied a blanket ban and lost content; the verifier **refuted** that
twice. Published for: Wrigley Field (jewel-box), the marquee (art deco-style),
the Music Box interior (atmospheric, plus the Gapp quotation under attribution),
Alta Vista Terrace (Late 19th And 20th Century Revivals). **Withheld** for Metro's
1927 building and the Vic, because no source states one.

### ZIP corrections

Three moved to 60657: Sluggers, Merkle's, Nisei Lounge. Two previously unsourced
are now sourced and correct: Southport Grocery 60657 and the Vic 60657. A test
pins all five **and** pins the Music Box at 60613 against Southport Grocery at
60657 — that pair looks like an inconsistency and is not one.

### Trip durations

None. The verifier scanned the artifact and found none to strip; none was
introduced. Distances are published as sources give them: "less than a mile",
"about one-half mile to the west on Irving Park Road", street numbers on the
Chicago grid.

### Parking and transit

Prose only. **No station, garage or bus route became a place record**, and a test
asserts it. No parking price is published (none was reachable) and no garage is
called an official Cubs lot. Parking operators are named by the register's legal
name, with the trading-name field disclosed where the two differ.

### Not researched, and named as such

Casey Moran's and Sports Corner appear in the Lake View sentence alongside four
places this guide carries. The "Around the ballpark" section names them as not
researched rather than listing four of six from a sourced list without comment.
The artifact's `candidates_seen_but_not_minted` holds a further 42 licensed
businesses on the four streets, for a later unthrottled pass.
