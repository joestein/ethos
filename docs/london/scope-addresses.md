# London scoping — Angle 3: the address and postcode forms the parser will meet

Research inputs for the UK branch of `Ethos.Places.Address`, gathering the evidential basis
that the American, Italian and Vatican branches each already carry in their comments.

**Method.** Every address below was fetched from the institution's own website with
`python3 + urllib` and extracted verbatim from the rendered text or from the page's own
JSON-LD `PostalAddress`. Raw extracts are in the session scratchpad under `angle3_addr/`.
Postcode behaviour was probed live against `api.postcodes.io`. Regex behaviour was measured
by simulating the four existing branches in Python against the 4,204 addresses currently in
`priv/seed_data/`.

**What bit me.** The WebSearch budget was exhausted (200/200) before this wave ran, exactly
as the brief warned, so every URL here is one I could name in advance. Two named targets
were unreachable and are recorded as failures, not glossed: see §6.

---

## 1. The postcode format

### 1.1 The six valid patterns

Verified against [Wikipedia, *Postcodes in the United Kingdom*](https://en.wikipedia.org/wiki/Postcodes_in_the_United_Kingdom),
which sources its validation rules to **BS 7666**:

| Format | Where used | Example |
|---|---|---|
| `A9 9AA` | single-letter areas B, E, G, L, M, N, S, W | `M1 1AE` |
| `A99 9AA` | " | `B33 8TH` |
| `A9A 9AA` | E1, N1, W1 | `W1A 0AX` |
| `AA9 9AA` | most of the UK | `CR2 6XH` |
| `AA99 9AA` | " | `DN55 1PT` |
| `AA9A 9AA` | **WC, EC1–EC4, SW1, NW1W, SE1P** | `EC1A 1BB` |

A postcode is an **outward code** (postcode area + district) and an **inward code** (sector
digit + two-letter unit), conventionally separated by a single space.

### 1.2 Letter restrictions, position by position

VERIFIED, quoting the Wikipedia article's own wording:

- 1st position: `Q, V and X` not used.
- 2nd position: `I, J and Z` excluded.
- 3rd position, `A9A` form only: only `A, B, C, D, E, F, G, H, J, K, P, S, T, U, W`.
- 4th position, `AA9A` form only: only `A, B, E, H, M, N, P, R, V, W, X, Y`.
- Final two letters (the unit): `C, I, K, M, O, V` excluded.

**These two third/fourth-position classes are different, and conflating them breaks London
specifically.** My own first draft of a strict regex reused the `A9A` class in the `AA9A`
slot. That regex rejected `EC3N 4AB` (Tower of London), `WC2R 1LA` (Somerset House),
`WC1X 0DA` (the Postal Museum) and `EC2Y 8DS` (the Barbican) — four real addresses collected
below, all of them in the City and the WC districts, which is the exact population the
`AA9A` form exists for. Recording the mistake because it is the one a London parser is most
likely to make.

### 1.3 The government's own regex

VERIFIED from a live gov.uk asset — `BulkDataCommon-v2.1.xsd` inside
<https://assets.publishing.service.gov.uk/media/6866429be6557c544c74db83/XML_schema.zip>,
linked from <https://www.gov.uk/government/publications/bulk-data-transfer-for-sponsors-xml-schema>.
Its own annotation reads `UK Post-code, corresponding to BS7666`:

```
([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|
(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9]?[A-Za-z])))) [0-9][A-Za-z]{2})
```

**It requires a literal space and it is therefore wrong for our corpus.** It rejects
`W1F7LW` — the Photographers' Gallery's own printed address, three times on their own visit
page. It also does not enforce the positional letter classes. Cite it as the authority for
the *shape*; do not adopt it as the *pattern*.

### 1.4 The regex I would use

```elixir
# Outward code + inward code, the space optional because institutions print it both
# ways — the Photographers' Gallery publishes "16-18 Ramillies Street, London W1F7LW"
# with no space at all.
#
# The two interior letter classes are NOT the same and must not be merged:
#   third position of the A9A form  -> ABCDEFGHJKPSTUW
#   fourth position of the AA9A form -> ABEHMNPRVWXY
# The AA9A form is the London form — WC, EC1-EC4, SW1 — so merging them rejects
# EC3N 4AB, WC2R 1LA, WC1X 0DA and EC2Y 8DS, four addresses in this corpus.
@uk_postcode ~r/(?:GIR ?0AA|(?:[A-PR-UWYZ][0-9]{1,2}|[A-PR-UWYZ][A-HK-Y][0-9]{1,2}|[A-PR-UWYZ][0-9][A-HJKPSTUW]|[A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]) ?[0-9][ABD-HJLNP-UW-Z]{2})/
```

**What it deliberately does not match:**

- **Lowercase.** Left case-sensitive on purpose. This is what buys the false-positive result
  in §1.6 — an unanchored case-insensitive scan over free prose is a different, riskier
  instrument, and nothing in the corpus prints a postcode in lower case.
- **`SAN TA1`** (the Royal Mail Santa address) and `XM4 5HQ`. Neither is a well-formed
  postcode; both are mnemonics. No London place will carry one.
- **Overseas territory codes** (`AI-2640`, `ASCN 1ZZ`, `BBND 1ZZ`, `BIQQ 1ZZ`, `FIQQ 1ZZ`,
  `GX11 1AA`, `PCRN 1ZZ`, `SIQQ 1ZZ`, `STHL 1ZZ`, `TDCU 1ZZ`, `TKCA 1ZZ`). The `Z` in the
  unit position and the `I/J/Z` in the second position are excluded above. Out of scope for
  33 London pages.
- **`GIR 0AA` is matched**, as an explicit alternation. It is Girobank's non-geographic code,
  no longer in Royal Mail's PAF. It will never appear in a London guide; it is in the pattern
  only because every published UK regex carries it and omitting it invites someone to "fix"
  the pattern later without the note explaining why.
- **BX and other non-geographic codes are matched by shape** and cannot be excluded by
  pattern — `BX1 1LT` is `AA9 9AA` like any other. They are a lookup problem, not a regex
  problem (§5).

Note the spec's proposed pattern, `[A-Z]{1,2}\d[A-Z\d]?\s*\d[A-Z]{2}`, is **not wrong for
this corpus**: measured against all 55 codes I collected it accepted every real one
including `W1F7LW`, and produced zero false positives against the 4,204 existing corpus
addresses (§1.6). Its only miss is `GIR 0AA`. The case for the longer pattern is not that
the short one fails today — it is that the short one silently accepts `SW1Q 9ZZ`,
`IV9 9CC` and other well-shaped non-postcodes, so a typo in a seed file publishes rather
than failing the gate.

### 1.5 Live validation of the pattern

VERIFIED empirically: 100 postcodes drawn at random from `api.postcodes.io/random/postcodes`
(real ONS-registered codes, nationwide) — **0 rejected** by the §1.4 pattern. All 50 London
codes collected in §2 — **0 rejected**.

### 1.6 It does not misfire on the corpus we already have

VERIFIED by scanning all **4,204** addresses currently in `priv/seed_data/` (388 files) with
the §1.4 pattern unanchored and case-sensitive: **0 hits.** The spec's shorter pattern also
scores 0. So adding a UK postcode scan alongside `scan_postal/1` cannot corrupt an American
or Italian address.

---

## 2. The address shape — fifty real addresses, verbatim

Every one is quoted as the institution prints it. Line breaks in the source are shown as
`, ` where the page laid the address out over several lines; where a page prints it inline I
have kept its punctuation exactly.

| # | Place | Verbatim address | Source |
|---|---|---|---|
| 1 | Tate Modern | `Bankside, London SE1 9TG` | [tate.org.uk](https://www.tate.org.uk/visit/tate-modern) |
| 2 | Tower of London | `Tower Hill` / `London` / `EC3N 4AB` (page's own JSON-LD `PostalAddress`) | [hrp.org.uk](https://www.hrp.org.uk/tower-of-london/visit/) |
| 3 | Kew Gardens | `Kew, Richmond, London, TW9 3AE` | [kew.org](https://www.kew.org/kew-gardens/visit-kew-gardens) |
| 4 | Horniman Museum and Gardens | `Horniman Museum and Gardens, 100 London Road, Forest Hill, London, SE23 3PQ` | [horniman.ac.uk](https://www.horniman.ac.uk/contact-us/) |
| 5 | National Theatre | `National Theatre, Upper Ground, South Bank, London, SE1 9PX` | [nationaltheatre.org.uk](https://www.nationaltheatre.org.uk/your-visit/) |
| 6 | Natural History Museum | `Cromwell Road, London, SW7 5BD` | [nhm.ac.uk](https://www.nhm.ac.uk/visit.html) |
| 7 | Shakespeare's Globe | `21 New Globe Walk, Bankside, London SE1 9DT` | [shakespearesglobe.com](https://www.shakespearesglobe.com/visit/) |
| 8 | Hackney Council (borough council) | `Hackney Service Centre, 1 Hillman Street, London, E8 1DY` | [hackney.gov.uk](https://hackney.gov.uk/contact-us) |
| 9 | The Churchill Arms (pub) | `The Churchill Arms, Kensington, 119 Kensington Church Street, London, W8 7LN` | [churchillarmskensington.co.uk](https://www.churchillarmskensington.co.uk/) |
| 10 | Royal Court Theatre | `Royal Court Theatre, Sloane Square, London, SW1W 8AS` | [royalcourttheatre.com](https://royalcourttheatre.com/visit/) |
| 11 | Wallace Collection | `The Wallace Collection, Hertford House, Manchester Square, London W1U 3BN` | [wallacecollection.org](https://www.wallacecollection.org/visit/) |
| 12 | Mudchute Park and Farm | `Mudchute Park and Farm, Pier Street, Isle of Dogs, London E14 3HP` | [mudchute.org](https://www.mudchute.org/) |
| 13 | Kenwood | `Hampstead Lane, Hampstead, Greater London, NW3 7JR` | [english-heritage.org.uk](https://www.english-heritage.org.uk/visit/places/kenwood/) |
| 14 | Westminster Abbey | `The Chapter Office, Westminster Abbey, 20 Dean's Yard, London, SW1P 3PA` (and, on the same site, `Dean's Yard, London SW1P 3PA`) | [westminster-abbey.org](https://www.westminster-abbey.org/visit-us/plan-your-visit) |
| 15 | Kensington Palace | `Kensington Palace, Kensington Gardens, London W8 4PX` | [hrp.org.uk](https://www.hrp.org.uk/kensington-palace/visit/) |
| 16 | Richmond upon Thames Council | `Civic Centre, 44 York Street, Twickenham, TW1 3BZ` | [richmond.gov.uk](https://www.richmond.gov.uk/contact_us) |
| 17 | Croydon Council | `Croydon Council, Bernard Weatherill House, 8 Mint Walk, Croydon, CR0 1EA` | [croydon.gov.uk](https://www.croydon.gov.uk/contact-us) |
| 18 | Somerset House | `Somerset House Trust, Somerset House, Strand, London, WC2R 1LA` | [somersethouse.org.uk](https://www.somersethouse.org.uk/contact-us) |
| 19 | The Postal Museum | `The Postal Museum, 15-20 Phoenix Place, London, WC1X 0DA` | [postalmuseum.org](https://www.postalmuseum.org/visit/) |
| 20 | Eltham Palace | `Court Yard, Eltham, Greenwich, London, SE9 5NP` | [english-heritage.org.uk](https://www.english-heritage.org.uk/visit/places/eltham-palace-and-gardens/) |
| 21 | Brixton Windmill | `Windmill Gardens, Blenheim Gardens, Brixton, London, SW2 5DA` | [brixtonwindmill.org](https://brixtonwindmill.org/visit/) |
| 22 | Old Operating Theatre Museum | `Old Operating Theatre Museum and Herb Garret, St Thomas' Church, 9a St Thomas Street, London, SE1 9RY` | [oldoperatingtheatre.com](https://oldoperatingtheatre.com/visit/) |
| 23 | The Old Vic (theatre) | `The Old Vic, The Cut, London SE1 8NB` | [oldvictheatre.com](https://www.oldvictheatre.com/your-visit) |
| 24 | WWT London Wetland Centre | `WWT London, Queen Elizabeth Walk, Barnes, London, SW13 9WT` | [wwt.org.uk](https://www.wwt.org.uk/wetland-centres/london/) |
| 25 | Bexley Council | `Civic Offices, 2 Watling Street, Bexleyheath, DA6 7AT` | [bexley.gov.uk](https://www.bexley.gov.uk/contact-us) |
| 26 | Barbican Centre | `Barbican Centre, Silk Street, London, EC2Y 8DS` | [barbican.org.uk](https://www.barbican.org.uk/your-visit/getting-here) |
| 27 | Sir John Soane's Museum | `13 Lincoln's Inn Fields, London, WC2A 3BP` | [soane.org](https://www.soane.org/visit) |
| 28 | Design Museum | `224 – 238 Kensington High Street, London W8 6AG` (and, in prose on the same page, `224–238 Kensington High Street, Kensington, London W8 6AG`) | [designmuseum.org](https://designmuseum.org/visit-us) |
| 29 | Ranger's House | `Chesterfield Walk, Blackheath, London, SE10 8QX` | [english-heritage.org.uk](https://www.english-heritage.org.uk/visit/places/rangers-house-the-wernher-collection/) |
| 30 | Jewel Tower | `Abingdon Street, Westminster, London, SW1P 3JX` | [english-heritage.org.uk](https://www.english-heritage.org.uk/visit/places/jewel-tower/) |
| 31 | Apsley House | `149 Piccadilly, Hyde Park Corner, London, W1J 7NT` | [english-heritage.org.uk](https://www.english-heritage.org.uk/visit/places/apsley-house/) |
| 32 | Wellington Arch | `Apsley Way, Hyde Park Corner, London, W1J 7JZ` | [english-heritage.org.uk](https://www.english-heritage.org.uk/visit/places/wellington-arch/) |
| 33 | Down House (Bromley) | `Luxted Road, Downe, Kent, BR6 7JT` | [english-heritage.org.uk](https://www.english-heritage.org.uk/visit/places/home-of-charles-darwin-down-house/) |
| 34 | Chelsea Physic Garden | `66 Royal Hospital Road, Chelsea, London SW3 4HS` | [chelseaphysicgarden.co.uk](https://www.chelseaphysicgarden.co.uk/visit/) |
| 35 | The Photographers' Gallery | `16-18 Ramillies Street, London W1F7LW` | [thephotographersgallery.org.uk](https://thephotographersgallery.org.uk/visit) |
| 36 | Whitechapel Gallery | `Whitechapel Gallery, 77-82 Whitechapel High St, London, E1 7QX` | [whitechapelgallery.org](https://www.whitechapelgallery.org/visit/) |
| 37 | London Museum Docklands | `No. 1 Warehouse, West India Quay, London E14 4AL` | [londonmuseum.org.uk](https://www.londonmuseum.org.uk/london-museum-docklands/) |
| 38 | London Museum (Smithfield) | `London Museum, Smithfield, London EC1 9AG` | [londonmuseum.org.uk](https://www.londonmuseum.org.uk/london-museum-docklands/) |
| 39 | HMS Belfast | `The Queen's Walk, London, SE1 2JH` | [iwm.org.uk](https://www.iwm.org.uk/visits/hms-belfast) |
| 40 | Imperial War Museum London | `Lambeth Road, London, SE1 6HZ` | [iwm.org.uk](https://www.iwm.org.uk/visits/iwm-london) |
| 41 | Freud Museum | `20 Maresfield Gardens, Hampstead, London NW3 5SX` | [freud.org.uk](https://www.freud.org.uk/visit/) |
| 42 | Handel Hendrix House | `Handel Hendrix House, 25 Brook Street, Mayfair, London, W1K 4HB` | [handelhendrix.org](https://handelhendrix.org/visit/) |
| 43 | William Morris Gallery | `William Morris Gallery, Lloyd Park, Forest Road, London E17 4PP` | [wmgallery.org.uk](https://www.wmgallery.org.uk/visit) |
| 44 | London Museum of Water & Steam | `Green Dragon Lane, Brentford, London TW8 0EN` | [waterandsteam.org.uk](https://waterandsteam.org.uk/visit/) |
| 45 | Brunel Museum | `Brunel Museum, Railway Avenue, Rotherhithe, London, SE16 4LF` | [thebrunelmuseum.com](https://thebrunelmuseum.com/visit/) |
| 46 | Garden Museum | `Lambeth Palace Road, London, SE1 7LB` | [gardenmuseum.org.uk](https://gardenmuseum.org.uk/visit/) |
| 47 | Boxpark Shoreditch | `2 – 10 Bethnal Green Road, Shoreditch, London, London, E1 6GY` | [boxpark.co.uk](https://www.boxpark.co.uk/venues/shoreditch/) |
| 48 | Hogarth's House | `Hogarth's House, Hogarth Lane, Great West Road, London W4 2QN` | [hogarthshouse.org](https://hogarthshouse.org/visit/) |
| 49 | V&A South Kensington | `Cromwell Road, London, SW7 2RL` | [vam.ac.uk](https://www.vam.ac.uk/visit) |
| 50 | Young V&A | `Cambridge Heath Rd, Bethnal Green, London E2 9PA` | [vam.ac.uk](https://www.vam.ac.uk/visit) |

### 2.1 Classification of the fifty

My classification, applied to the address as printed:

| Property | Count | Share |
|---|---:|---:|
| Ends in a postcode | **50** | 100% |
| Carries a house number on the thoroughfare line | **19** | 38% |
| No house number anywhere | **31** | 62% |
| Leads with a named building rather than a number | **17** | 34% |
| Carries a locality/sub-locality between the street and `London` | **22** | 44% |
| Names `London` at all | **46** | 92% |
| Does **not** name `London` despite being in a London borough | **4** | 8% |
| House number is a range (`15-20`, `77-82`, `224 – 238`, `2 – 10`) | **5** | 10% |

The two headline numbers for the parser:

- **62% carry no house number.** The American `@house_number` rule would suppress the street
  line on nearly two addresses in three. This is the Rome situation again, but worse: Rome's
  no-number addresses were squares, which a thoroughfare word identifies. London's include
  `Bankside`, `Smithfield`, `The Cut` and `Upper Ground`, which no thoroughfare word
  identifies at all (§4.2).
- **44% carry a middle locality.** `100 London Road, Forest Hill, London SE23 3PQ` has the
  same comma count as an American address and a different meaning in every field.

---

## 3. The hard cases

Each of these is a real address from §2, and each defeats a specific rule the module already
has or the spec already proposes.

### 3.1 Building name, no number — Somerset House (asked for by name)

```
Somerset House Trust, Somerset House, Strand, London, WC2R 1LA
```
<https://www.somersethouse.org.uk/contact-us>

Three names before the thoroughfare, and the thoroughfare is `Strand` — a proper noun with
no suffix. The Wallace Collection (`Hertford House, Manchester Square`) and Hogarth's House
(`Hogarth's House, Hogarth Lane, Great West Road`) take the same shape. `No. 1 Warehouse,
West India Quay` puts a number *inside the building name*, so `~r/^\d/` fails on it even
though a digit is present — `No. 1` needs `~r/^(?:No\.?\s*)?\d/` if it is to be recognised.

### 3.2 Sub-locality — Southwark, London SE1 (asked for by name)

`Southwark` as a printed sub-locality did not appear in my sample; what did appear, 22 times,
is the same *shape* with a different name:

```
100 London Road, Forest Hill, London, SE23 3PQ          (Horniman)
21 New Globe Walk, Bankside, London SE1 9DT             (Shakespeare's Globe)
25 Brook Street, Mayfair, London, W1K 4HB               (Handel Hendrix House)
Court Yard, Eltham, Greenwich, London, SE9 5NP          (Eltham Palace — TWO sub-localities)
Green Dragon Lane, Brentford, London TW8 0EN            (Water & Steam)
Kew, Richmond, London, TW9 3AE                          (Kew Gardens — the "street" IS a locality)
```

Eltham Palace is the worst of them: `street, sub-locality, borough, London, postcode` — four
comma segments before the postcode, where the American `@full` expects two.

I could not establish an address that prints the literal string `Southwark, London SE1`, and
say so plainly rather than manufacturing one.

### 3.3 A street with no number (asked for by name)

Common, not exceptional — 31 of 50. Clean examples:

```
Cromwell Road, London, SW7 5BD              (Natural History Museum)
Lambeth Road, London, SE1 6HZ               (IWM London)
Silk Street, London, EC2Y 8DS               (Barbican)
Abingdon Street, Westminster, London, SW1P 3JX   (Jewel Tower)
Chesterfield Walk, Blackheath, London, SE10 8QX  (Ranger's House)
```

### 3.4 Things that defeat a naive `street, locality postcode` pattern

**(a) No space in the postcode.**
```
16-18 Ramillies Street, London W1F7LW
```
The Photographers' Gallery prints it this way three times on its own visit page. The gov.uk
BS 7666 regex (§1.3) **rejects this address**. Any pattern we ship must make the space
optional.

**(b) A street name with no thoroughfare word and no number.**
```
Bankside, London SE1 9TG            (Tate Modern)
The Cut, London SE1 8NB             (The Old Vic)
Upper Ground, South Bank, London, SE1 9PX   (National Theatre)
Smithfield, London EC1 9AG          (London Museum)
Strand, London, WC2R 1LA            (Somerset House)
Kew, Richmond, London, TW9 3AE      (Kew Gardens)
```
Six addresses, three of them marquee institutions, where **both** the American house-number
rule and a Rome-style positive thoroughfare test return nil. See §4.2.

**(c) A street name with no thoroughfare word but *with* a number.**
```
149 Piccadilly, Hyde Park Corner, London, W1J 7NT       (Apsley House)
```
The number saves it. This is why the London street test must be a **disjunction** — house
number **or** thoroughfare word — not the single positive test Rome uses.

**(d) The locality printed twice.**
```
2 – 10 Bethnal Green Road, Shoreditch, London, London, E1 6GY       (Boxpark)
```
Real, from Boxpark's own site and their own JSON-LD (`"streetAddress": "2 – 10 Bethnal Green
Road Shoreditch"`). `drop_locality_segments/2` handles this one correctly *if* the locality
is captured as `London`; noted because it is the first corpus address where the duplication
is in the source rather than introduced by a greedy capture.

**(e) An en-dash, not a hyphen, in the house-number range.**
```
224 – 238 Kensington High Street, London W8 6AG         (Design Museum, U+2013 with spaces)
2 – 10 Bethnal Green Road, ...                          (Boxpark, U+2013 with spaces)
15-20 Phoenix Place, ...                                (Postal Museum, ASCII hyphen)
77-82 Whitechapel High St, ...                          (Whitechapel Gallery, ASCII hyphen)
```
Three punctuation variants for the same construct.

**(f) An abbreviated thoroughfare word.**
```
77-82 Whitechapel High St, London, E1 7QX               (Whitechapel Gallery)
Cambridge Heath Rd, Bethnal Green, London E2 9PA        (Young V&A)
```
A thoroughfare test on the full words alone misses both. Note the Whitechapel Gallery abbreviates
`Street` inside `High St` — a suffix test anchored to the end of the string catches `St`, but
only if `st` and `rd` are in the vocabulary, and `st` is a dangerous token (§4.3).

**(g) A house number with a letter.**
```
St Thomas' Church, 9a St Thomas Street, London, SE1 9RY    (Old Operating Theatre)
```

**(h) A London borough address that does not say "London".** Four of fifty:
```
Civic Centre, 44 York Street, Twickenham, TW1 3BZ       (Richmond upon Thames)
Bernard Weatherill House, 8 Mint Walk, Croydon, CR0 1EA (Croydon)
Civic Offices, 2 Watling Street, Bexleyheath, DA6 7AT   (Bexley)
Luxted Road, Downe, Kent, BR6 7JT                       (Bromley — English Heritage prints
                                                         the county as KENT, not London)
```
Down House is the sharpest: it is in the London Borough of Bromley and will sit on a London
page, and its own custodian addresses it to Kent. **A UK branch that requires the locality to
be the literal `London` would fail all four.** So would a gate assertion that every London
place's parsed locality is `London`.

**(i) `Greater London` as the region.**
```
Hampstead Lane, Hampstead, Greater London, NW3 7JR      (Kenwood)
```

**(j) A parenthetical or intermediate park/building segment.**
```
William Morris Gallery, Lloyd Park, Forest Road, London E17 4PP
Windmill Gardens, Blenheim Gardens, Brixton, London, SW2 5DA
```
`Lloyd Park` and `Windmill Gardens` are the London equivalent of `Brooklyn Bridge Park` — an
intermediate place name the greedy street capture will absorb. Neither mentions the locality,
so `drop_locality_segments/2` will *not* strip them.

---

## 4. The thoroughfare vocabulary

### 4.1 Measured, not guessed

The 50 addresses above are too small a sample to build a vocabulary from, so I measured a
large one. VERIFIED via the Overpass API (`https://overpass-api.de/api/interpreter`, HTTP
200), taking every named `highway` way inside the administrative boundary of a borough and
counting the final word of each distinct name.

**Royal Borough of Greenwich — 2,002 distinct street names** (outer/suburban):

| | | | | | | |
|---|---|---|---|---|---|---|
| Road 604 | Close 218 | Street 203 | Way 102 | Place 80 | Lane 69 | Gardens 58 |
| Walk 55 | Mews 48 | Drive 47 | Crescent 41 | Grove 39 | Court 37 | Avenue 37 |
| Path 31 | Terrace 31 | Hill 24 | Square 17 | Park 14 | Parade 11 | Yard 10 |
| Green 8 | Rise 8 | Approach 7 | Row 6 | House 6 | Passage 5 | Vale 5 |
| Gate 4 | Wharf 4 | Alley 4 | Bridge 3 | Quay 3 | Croft 3 | Villas 3 |

**London Borough of Camden + City of London — 1,568 distinct street names** (central):

| | | | | | | |
|---|---|---|---|---|---|---|
| Street 321 | Road 270 | Place 145 | Mews 115 | Close 62 | Gardens 55 | Terrace 42 |
| Square 42 | Lane 37 | Court 35 | Yard 34 | Way 33 | Walk 32 | Avenue 30 |
| Crescent 28 | Grove 25 | Hill 22 | Path 15 | Passage 12 | Bridge 9 | Park 9 |
| Studios 8 | Rise 8 | Villas 8 | Row 8 | Drive 7 | Alley 6 | Buildings 6 |
| Gate 5 | Parade 5 | End 5 | Mansions 5 | Cottages 4 | Market 4 | Circus 2 |

The two boroughs have visibly different distributions — `Mews` and `Place` are central,
`Close` and `Drive` are suburban — which matters because the roster spans both.

### 4.2 Coverage of the spec's proposed list

The spec proposes twenty words: *street, road, lane, place, square, gardens, terrace,
crescent, mews, row, hill, walk, way, close, court, avenue, embankment, bridge, wharf, yard*.

MEASURED against the 2,002 Greenwich street names, matching on the final word:

| Vocabulary | Names matched | Coverage |
|---|---:|---:|
| The spec's 20 words | 1,649 | **82.4%** |
| Extended list (§4.4) | 1,861 | **93.0%** |
| Residue matching nothing | 141 | 7.0% |

The 7% residue is not noise; it is a real class of British street name that carries no
suffix at all: `Bathway`, `Creekside`, `Crossway`, `Blackheath Village`, `Foxes Dale`,
`Charlton Dene`, `Broad Lawn`, `Kings Highway`, `East Flank`, `Ha'penny Hatch`,
`Church Hyde`, `High Point`, `Greenacres`.

**MEASURED on the fifty real addresses in §2:** applying `house number OR thoroughfare
suffix` to the first comma-segment of the street, **7 of 30** distinct street lines fail —
`Bankside`, `Kew`, `Upper Ground`, `Hertford House`, `Somerset House`, `The Cut`,
`Smithfield`. Testing the *whole* street segment rather than its first part rescues
`Hertford House, Manchester Square`, leaving **6**. Adding `strand` as a literal rescues
Somerset House, leaving **5** — Tate Modern, Kew Gardens, the National Theatre, the Old Vic
and the London Museum publishing no `streetAddress`.

That is the honest price of a positive thoroughfare test, and it is the same shape of
decision Rome made when it added `foro`, `campo`, `lungomare`, `quadrato`, `parco`,
`piazzetta`, `vico` and `monte` as bare literals. The London analogue is a short literal
list: `bankside`, `strand`, `piccadilly`, `smithfield`, `aldwych`, `cheapside`, `whitehall`,
`kingsway`, `holborn`, `poultry`, `minories`, `barbican`, `haymarket`, `pall mall`.

### 4.3 The words that are also ordinary nouns — where a positive test misfires

**The structural point first, because it is easy to miss:** Italian thoroughfare words
*lead* (`Piazza della Rotonda`), so Rome's test is anchored with `^`. British thoroughfare
words *trail* (`Ramillies Street`), so a London test must be anchored with `$` or applied to
the final word. An unanchored test is a different and much worse instrument — it would fire
on any prose containing the word "park" or "green" anywhere.

Even end-anchored, these tokens are ordinary English nouns and a descriptive location can
end in one. Flagged in rough order of danger:

| Token | Why it misfires |
|---|---|
| **park** | "adjacent to Greenwich Park", "in Victoria Park" — an end-anchored test converts a location into a street. Highest risk; also 14 real streets in Greenwich end in it. |
| **green** | "on Blackheath's green", "opposite the village green" |
| **hill** | "at the top of the hill", "Primrose Hill" (the park, not the street) |
| **bridge** | "at the north end of the bridge", "beside Tower Bridge" |
| **market** | "in Borough Market", "beside Leadenhall Market" — Borough Market is a *place*, not a street |
| **square** | "the north side of the square" |
| **gardens** | "in the gardens", "the gardens behind the house" |
| **court** | "in the court", plus every `... Court` that is a *building* (Hampton Court) |
| **yard** | "in the yard", "Neal's Yard" (a place) |
| **place** | "at this place" |
| **way** | "on the way to", "the Thames Path way-marking" |
| **close** | also an adjective and a verb — "close to the station" would be caught by an *unanchored* test |
| **row** | "in a row", "on the front row" |
| **walk** | "a short walk", "a ten-minute walk" — very common in guide prose |
| **rise** | also a verb |
| **end** | "at the east end" |
| **gate** | "through the gate" |
| **circus** | "the circus" |
| **fields** | "across the fields" |
| **view** | "with a view" |
| **village** | "in the village" |
| **house / buildings / mansions / cottages / studios** | building nouns, not thoroughfares — I would **exclude** these from the vocabulary even though Overpass shows them as street-name endings |
| **st** | abbreviation for both *Street* and *Saint*. `St Thomas Street` begins with it. Only safe end-anchored. |
| **park / green / hill / bridge / market** | all five are also the names of *places we will write guide entries about*, which is what makes them different from `mews` |

Comparatively safe — rarely a bare noun at the end of descriptive prose: **street, road,
lane, mews, crescent, terrace, avenue, embankment, wharf, quay, parade, passage, alley,
approach, boulevard, esplanade, vale, grove, drive**.

### 4.4 The list I would ship

```
street  st      road    rd      lane    ln      place   pl
square  sq      gardens gdns    terrace crescent        mews
row     hill    walk    way     close   court   avenue  ave
embankment      bridge  wharf   yard    drive   grove   rise
vale    parade  green   gate    alley   passage path    approach
quay    circus  fields  broadway        boulevard       parkway
arcade  steps   market  park    dene    croft   mount   heath
common  esplanade       promenade       causeway        rents
```

Recommend **excluding**: `house`, `buildings`, `mansions`, `cottages`, `studios`, `villas`,
`village`, `end`, `view`, `cross`, `link`, `roundabout`, `tunnel`, `footbridge`, `stairs`.
They appear in the Overpass data but they name buildings or structures, not postal
thoroughfares, and every one of them is a common noun in guide prose.

INFERRED, not verified: `rents`, `causeway`, `promenade`, `esplanade`, `common` and
`heath` are drawn from general British street-naming practice, not from an address I
collected. Flagged so the arbitrator can drop them.

---

## 5. Is there a reachable postcode API?

**Yes — postcodes.io, and it is reachable from this environment.** All calls below were made
with `python3 + urllib` and the HTTP status is what the server returned.

| Request | Status | Result |
|---|---:|---|
| `GET api.postcodes.io/postcodes/SW1A2AA` | **200** | full record |
| `GET api.postcodes.io/postcodes/EC1A1BB` | **200** | full record |
| `GET api.postcodes.io/postcodes/SW1A0AA` | **200** | full record |
| `GET api.postcodes.io/postcodes/WC2R1LA` | **200** | full record |
| `GET api.postcodes.io/postcodes/SE19TG` | **200** | full record |
| `GET api.postcodes.io/postcodes/E202AR` | **200** | full record |
| `GET api.postcodes.io/postcodes/SW1A2AA/validate` | **200** | `{"status":200,"result":true}` |
| `GET api.postcodes.io/outcodes/SE1` | **200** | outcode-level record |
| `GET api.postcodes.io/random/postcodes` | **200** | a random real postcode |
| `GET api.postcodes.io/postcodes/GIR0AA` | **404** | `{"status":404,"error":"Invalid postcode"}` |
| `GET api.postcodes.io/postcodes/GIR0AA/validate` | **200** | `{"status":200,"result":false}` |
| `GET api.postcodes.io/postcodes/SANTA1` | **404** | `{"status":404,"error":"Invalid postcode"}` |
| `GET api.postcodes.io/postcodes/BX11LT` | **404** | `{"status":404,"error":"Postcode not found"}` |
| `GET api.postcodes.io/postcodes/W1A0AX` | **404** | `{"status":404,"error":"Postcode not found","terminated":{"postcode":"W1A 0AX","year_terminated":2016,...}}` |

The space is optional in the request path; the response always normalises it back in
(`"postcode":"SW1A 2AA"`).

A 200 returns, among ~40 fields: `postcode` (normalised), `outcode`, `incode`, `country`
(`"England"`), `region` (`"London"`), **`admin_district`** (`"Westminster"`, `"Southwark"`,
`"Camden"` — i.e. the borough), `admin_ward`, `parish`, `parliamentary_constituency`,
`longitude`, `latitude`, `eastings`, `northings`, `nhs_ha`, `ccg`, `lsoa`, `msoa`.

### What this is and is not good for

- **It is a very good borough oracle.** `admin_district` is the borough name, from ONS data.
  A gate assertion that every place in `priv/seed_data/london/southwark.json` has a postcode
  whose `admin_district` is `Southwark` is a strong, cheap, mechanical check — stronger than
  anything Rome or San Francisco had. `outcodes/SE1` returns `admin_district:
  ["Lambeth","Southwark"]`, so outward codes straddle boroughs and cannot be used for this;
  the full postcode can.
- **It is NOT a format validator.** Three distinct 404s mean three different things:
  `"Invalid postcode"` (malformed — GIR 0AA, SAN TA1), `"Postcode not found"` (well-formed,
  no ONS record — BX1 1LT), and `"Postcode not found"` with a `terminated` block (W1A 0AX,
  retired 2016). **`GIR 0AA` fails `/validate` with `result: false`**, so the API and the
  BS 7666 regex disagree about it. Do not use the API to validate the regex, and do not use
  the regex to predict the API.
- **It is a live network dependency.** Nothing in the seed pipeline should call it at test
  time. Its role is research and one-off census, exactly as it was used here.

Distinguishing INFERRED from VERIFIED: I verified the statuses and bodies above. I did *not*
establish rate limits, terms of use, or uptime guarantees, and would not build a gate that
calls it on every run without doing so.

---

## 6. What I could not establish

Stated plainly rather than hedged.

1. **The British Museum's address from the British Museum's own website.** Named in the
   brief. `https://www.britishmuseum.org/visit`, `/about-us/contact-us` and the site root all
   return **HTTP 403** to `urllib` with three different browser-like header sets, and WebFetch
   returned 403 as well. The site bot-blocks. The spec itself uses `Great Russell Street,
   London WC1B 3DG`; I could corroborate only the postcode's *existence and borough* via
   postcodes.io, not the museum's own wording. **Someone should confirm this by hand.**
2. **A Tube station address from TfL.** Named in the brief. `tfl.gov.uk` returns **HTTP 403**
   to scripted requests on both `/tube/stop/...` and `/corporate/contact-us/`. I could not
   establish whether TfL publishes postal addresses for stations at all. My uncorroborated
   expectation is that most stations are addressed as `<Name> Station, <Road>, London
   <postcode>` — treat that as INFERRED and unverified. This matters because station entries
   are likely in the "Getting there" sections of 33 pages.
3. **An address printing the literal `Southwark, London SE1`.** Asked for by name; not found
   in my sample. The sub-locality shape is amply evidenced by the six examples in §3.2.
4. **An authoritative published list of British thoroughfare suffixes.** I looked for a
   council Street Naming and Numbering policy with a suffix appendix (Ealing, Barnet,
   Havering, Hounslow, Bexley, Merton) and found none that publishes one in HTML. §4.1's
   vocabulary is therefore derived empirically from 3,570 real street names via Overpass,
   which I would argue is better evidence than a policy list anyway, but it is derived rather
   than cited.
5. **Rate limits and terms for postcodes.io and Overpass.** Overpass returned HTTP 504 twice
   and HTTP 429 once during this wave; both are best-effort public endpoints.
6. **WebSearch was unavailable** (budget exhausted, 200/200) before this wave began, so every
   source here is a URL I could name in advance. Several institutions I would have liked
   (Tower Bridge, London Transport Museum, Southbank Centre, Dulwich Picture Gallery, the
   Roundhouse, Alexandra Palace, Camden Council) returned 403/404/521 on the paths I guessed.
   That is a bias in the sample toward English Heritage, IWM and small-charity sites, which
   are server-rendered; it does not affect the address *shapes*, but the reader should know
   the sample was not randomly drawn.

---

## 7. The finding that most affects the spec

**The spec's `@uk` branch, as written, would corrupt 43 addresses that parse correctly
today.** This is the one thing in this document that changes code.

The spec says:

> a `@uk` branch of the shape `<street>, <locality> <postcode>`, with the postcode optional
> so `"Trafalgar Square, London"` still yields a locality

and then:

> The Italian branch is consulted only after both American passes fail, and the UK branch
> only after all three. Each can turn a nil into a value and never one value into another —
> asserted, not assumed.

MEASURED, by simulating `@full`, `@head`, `@italian` and `@vatican` in Python over all 4,204
seed addresses: **76 addresses** currently fail all four branches and land on the
nil-with-scanned-postal path. A postcode-optional `@uk` branch matches **43 of those 76** —
and every one of the 43 is an American descriptive location that the corpus is *right* to
leave unparsed:

```
"Stratford, CT"                        -> street "Stratford",  locality "CT"
"Multiple trailheads in Farmington, CT" -> street "Multiple trailheads in Farmington", locality "CT"
"Mashantucket, CT (northeastern Ledyard)" -> street "Mashantucket", locality "CT (northeastern Ledyard)"
"West 125th Street, Harlem, New York"  -> street "West 125th Street, Harlem", locality "New York"
"Broad Street Green, Old Wethersfield" -> street "Broad Street Green", locality "Old Wethersfield"
"Kent Ave. bet. Quay St. and N 9 St., Brooklyn" -> street "Kent Ave. bet. Quay St. and N 9 St.", locality "Brooklyn"
```

The branch does not turn a nil into a value here. It turns a *correct* nil into a *wrong*
value, and it does so in Connecticut, Manhattan and Brooklyn files that London has no
business touching. The property the spec says it will assert is false as specified.

### The variants, measured

| Variant | Captures of the 76-address residue | Captures the 30 real London street lines |
|---|---:|---|
| **A** — postcode optional, no street test (*spec as written*) | **43** ✗ | 30 |
| **B** — **postcode REQUIRED** | **0** ✓ | **30** ✓ |
| **C** — postcode optional + thoroughfare test | 14 ✗ | 30 |
| **D** — postcode optional + locality must be `London` | 0 ✓ | 26 ✗ (loses Richmond, Croydon, Bexley, Bromley — §3.4h) |

**Recommendation: make the postcode REQUIRED in the `@uk` branch.** It is the only variant
that is both perfectly safe against the existing corpus and lossless against every real
London address I collected — because **100% of the fifty carry one** (§2.1). Variant C is
instructive about *why* the street test cannot do this job alone: `@uk`'s greedy street
capture means the thoroughfare suffix lands on the last segment before the locality, so
`"...and Suydam St., Brooklyn"` passes the test on `St.`.

The cost is that `"Trafalgar Square, London"` — the spec's own example — yields nothing.
That is the right trade: it is a hypothetical address, and I did not find a single real
postcode-less one in fifty. If a place genuinely has no postcode, the honest fix is to omit
the address rather than to widen a regex that reaches into four other jurisdictions.

### Two smaller consequences

- **The street test must be a disjunction, not Rome's single positive test.** `149
  Piccadilly` needs the house-number rule; `Cromwell Road` needs the thoroughfare rule; five
  addresses need a literal list (§4.2). Rome's `@italian_thoroughfare` is a single anchored
  positive test because Italian addresses have exactly one shape. London has three.
- **The house-number pattern needs widening.** `@house_number` is `~r/^\d/`. It misses
  `No. 1 Warehouse` (§3.1) and, applied to a British address, would need to *not* fire the
  `@ordinal_street` exclusion, since `4th Drive`-style ordinal street names are an American
  construct. A British-side `~r/^(?:No\.?\s*)?\d/` with no ordinal exclusion is what the
  evidence supports.
