# Citi Field — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/citi_field_places.ex`
and `lib/ethos/seeds/citi_field_guide.ex`.

Committed on purpose: the research artifact lives under `.superpowers/`, which
`.gitignore` excludes.

Source: the 2026-08-30 New York Mets research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/new-york-mets.json`,
`verified: true`). This artifact splits its verdicts into `identity.verdicts`,
`getting_there_verdicts` and `history_verdicts` alongside each place's own
array; all four are read.

**8 places and 1 guide shipped** from 8 researched places. One verdict was
`refuted`; every other item is `confirmed`.

---

## Identity, county and town

| Field | Value | Verdict |
|---|---|---|
| venue | Citi Field | *"Citi Field is the current official name of the ballpark; Citigroup purchased naming rights in a deal announced November 2006."* — confirmed |
| city | Flushing | *"The ballpark's address is 41 Seaver Way, Flushing, NY 11368."* — confirmed |
| state | New York | as above |
| county | **Queens** | *"Queens is a borough of New York City that is coextensive with Queens County."* — confirmed |

`"Queens"` is the borough-as-county form this corpus uses throughout New York
City, the same convention under which the Yankee Stadium guide's `"Bronx
County"` was refuted down to `"Bronx"`. The coextension fact is published as
prose in the guide rather than in the field.

**Two towns.** The place records do not flatten to the borough. Citi Field, the
Unisphere, the Queens Museum, the New York State Pavilion and the tennis center
carry Flushing; the New York Hall of Science, the Queens Zoo and the Queens
Theatre carry the Corona addresses their sources give. The roster row is checked
against the venue place, and that row reads Flushing.

---

## 1. Places, against the verdicts they rest on

### citi-field — Citi Field (`stadium`)

`41 Seaver Way, Flushing, NY 11368` · `official_url: https://www.mlb.com/mets/ballpark`

Confirmed and published: home ballpark of the Mets, opened 2009, seating
capacity 41,922; the address; the 2019 change to 41 Seaver Way honoring Tom
Seaver; Citi Field as the current official name; the Citigroup deal announced
November 2006 at $20 million annually over 20 years, "the most expensive
sports-stadium naming-rights agreement ever" **at the time** — the qualifier is
in the verdict and is kept; the Ebbets Field exterior reference and PNC Park
interior; orange foul poles; the Hell Gate Bridge pedestrian bridge; Shea
Stadium's dates and other tenants; Shea's dismantling October 2008 to February
2009; the footprint now in the parking lots with plaques at home plate, mound
and bases.

`status_verdict: confirmed`. The verifier's note is worth recording: the
finder's citation was MLB.com, the team's own site, which under the research
contract cannot alone establish current operation; ESPN's live 2026 schedule
supplied the independent leg.

### unisphere — Unisphere (`historic-site`) · `official_url: nil`

Three confirmed verdicts, published whole: built March 6 to August 13, 1963;
dedicated early March 1964 as the theme symbol of the 1964-65 World's Fair,
theme "Peace Through Understanding"; NYC Landmarks Preservation Commission
designation May 1995; standing at the center of the park with the Queens Museum
entrance facing it and the tennis center to its north.

That last is a **sourced** spatial arrangement and therefore publishable — the
rule bans the unmeasurable gesture, not the relationship a source states.

`could_not_establish`: no official municipal URL — nycgovparks.org returned 403.
`official_url` is nil; an unreachable domain is not a verified one.

### queens-museum — Queens Museum (`museum`)

Verdict #0 **refuted**, correction: *"Founded in 1972 and housed in the former
New York City Building from the 1939 World's Fair — one of five buildings that
survive from that fair, not one of only two."* The correction's number is what
ships, in the place record, the guide section and an FAQ answer.

Verdicts #1 and #2 confirmed and published whole: the Panorama of the City of
New York, roughly 9,335 square feet, 1:1200 scale, the city as of 1992; hours
closed Monday and Tuesday, Wednesday to Friday noon to 5pm, weekends 11am to
5pm, last ticketed gallery entry 4:30pm; suggested pay-what-you-wish admission
$8 adults, $6 seniors and students, under-13s free.

"Last ticketed gallery entry 4:30pm" is a clock time and publishes. Contrast the
zoo below.

### new-york-hall-of-science — New York Hall of Science (`museum`)

Two confirmed verdicts and nothing else: founded 1964, built for the 1964
World's Fair, at 47-01 111th Street, Corona. The record says outright that no
source reached gives current hours or admission. **A short record is not a
defect**; padding it would be.

### queens-zoo — Queens Zoo (`attraction`)

Both verdicts confirmed. Published: opened October 26, 1968, children's farm
February 28, 1968; Wildlife Conservation Society since the 1992 reopening; the
2026 seasonal hours in full.

**Not published: the last-entry interval.** The source states it as a number of
minutes before closing, and every duration-shaped string is banned corpus-wide.
This is the Southport Grocery ruling from the Wrigley checkpoint applied
unchanged: the clause is dropped rather than an allowlist widened, because the
ballpark gate's allowlist is keyed `{file, phrase}` over a whole module and
cannot be narrowed to one field.

The ban is enforced by a scan over module **source**, so the moduledocs that
record this omission cannot quote the clause either. That is why they describe
it rather than repeat it.

### usta-billie-jean-king-national-tennis-center (`attraction`)

Both verdicts confirmed: opened 1978; home of the US Open annually from late
August to early September ever since; 46.5 acres of the park. The
`still_trading` note's wording — open to the public for play except during the
US Open, junior and wood-racquet competitions — is Wikipedia's and is published
as the fact it is.

`could_not_establish`: *"No specific street address/zip was stated by any source
fetched; usopen.org's official visit page could not be retrieved (request timed
out)."* The `address` field is the park, and the record says so.

### new-york-state-pavilion — New York State Pavilion (`historic-site`)

Three confirmed verdicts, published whole: Philip Johnson and Richard Foster,
cable-suspension roof engineered by Lev Zetlin, built 1962-1964 for the 1964
fair; National Register November 20, 2009 and the New York State Register;
restoration phase one finished April 2023, phase two of tower repairs began
October 2023 targeted for October 2026; illuminated nightly as of 2023.

**No trading claim.** This record has no `status_verdict` at all — instead a
`status_verdict_note` stating that the finder correctly left it null, that the
source describes active renovation with the interior closed, that there is no
positive evidence of public entry **and no claim of closure**, and that
"uncertain trading status of this kind does not block publication; it only means
nothing may be said about whether it is open." The summary, the guide section
and an FAQ answer all say exactly that and no more.

### queens-theatre — Queens Theatre (`theater`)

Both verdicts confirmed and published whole: the 1964 fair's Theaterama, the
Queens Playhouse from 1972, Queens Theatre in the Park from 1993; 14 United
Nations Avenue South; box office Tuesday to Friday noon to 6pm and two hours
before most ticketed events.

The box-office clause is an operating rule, not a journey, and matches the
Wrigley precedent that published Gman Tavern's "opens two hours before every
Cubs home game start".

---

## 2. The guide

`slug: citi-field-guide` · `destination: "Flushing, New York"` ·
`state: "New York"` · `county: "Queens"`

### Getting there

Eight confirmed `getting_there_verdicts`, all published: the 7 at all times and
the express <7> during peak-direction rush hours or after sporting events; the
LIRR Port Washington Branch interchange at the same location; the former Shea
stairway now reaching the Jackie Robinson Rotunda and the fare controls
deactivated during Mets games; the E/F/M/R, N/W and G transfers; the 61
St-Woodside construction that **may** limit express service in 2026, published
with its modal verb intact and with the mta.info pointer the source gives; the
Q19, Q66 and Q90; the satellite lots in Flushing Meadow Park from College Point
Boulevard; and the confirmed finding that no published parking rate could be
established from any source fetched.

No station, bus route or lot becomes a place record.

### Around the ballpark

Organised by what the fairs left. The only spatial relationship published is the
Unisphere/museum/tennis-center arrangement the source states, and the section
says so in as many words.

### The ballpark and the team

The nine confirmed `history_verdicts`. The two claims that are attributions
rather than facts are published as attributions: the naming-rights deal was the
most expensive **at the time**, and the Soto contract is **described as** the
largest in professional sports history.

### FAQ

Six questions. Three exist to publish a gap honestly: the express-7 caveat, the
parking rate, and whether the New York State Pavilion can be visited.

---

## 3. What is absent from the whole site

* **No trip duration**, including the zoo's sourced last-entry interval.
* **No unsourced proximity.** One sourced arrangement publishes.
* **No parking price**, because none could be established.
* **No trading claim for the New York State Pavilion**, and no claim of closure
  either.
* **"One of only two surviving buildings" does not appear anywhere** — the
  refuted count is replaced by the correction's, not merely dropped.
