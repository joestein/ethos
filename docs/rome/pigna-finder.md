# Pigna (R. IX, Roma Capitale toponymic code 109) — FINDER file

Wave 2, Rome programme. Research date **2026-09-02**. This is **evidence, not adjudication.**
I am not deciding what ships. A verifier adjudicates the facts; an arbitrator rules ownership of
straddlers with all four wave-2 files (and, later, the wave-1 files) in front of it.

**Rulings observed.**

1. **No designation claims.** Nothing below says *vincolato*, *vincolo monumentale*, "listed",
   "scheduled", "declared a monument", "protected monument", "heritage-listed",
   "bene culturale tutelato" or "dichiarazione di interesse culturale", in English or Italian.
   I did not re-test Vincoli in Rete or the Catalogo generale, but I did independently confirm the
   MiC network block is still live: `cultura.gov.it` and `casanatense.cultura.gov.it` both **time out
   at TCP connect** from here, while `vive.cultura.gov.it` (a different IP, 95.174.28.35) is open.
   The block is per-host, not per-domain. See §8.1.
2. **Vatican City belongs to no rione.** No Vatican City place is claimed for Pigna — none is
   anywhere near it. Pigna does hold one **Lateran Treaty Art. 15 extraterritorial** property,
   **Palazzo Maffei Marescotti**, and §5 sets out exactly what may and may not be said about it,
   from the Treaty text I fetched and read myself.
3. **No photographs.** `"photos": []` everywhere. I named, sourced and linked no image. Two photo
   leads worth a later wave are quarantined in §9 and are deliberately not usable as-is.

---

## 1. Headline numbers

| | |
|---|---|
| Deduplicated place candidates found | **131** (in 129 roster rows; one row covers three shrines) |
| Geometry wholly inside Pigna — **every** OSM vertex in R. IX | **49** |
| Point candidates whose single coordinate falls in Pigna | **64** |
| **Straddlers — flagged, NOT resolved by me** | **7 roster places + 3 boundary streets = 10**, plus **Palazzo Venezia** flagged for contest though it tests 35/35 Pigna (§4.1) |
| Candidates attested to Pigna by a source but with **no OSM object** to test | **6** |
| Roster rows that are components of another record (no geometry of their own) | **3** |
| Reserved-to-wave-1 places I found associated with Pigna and did **not** take | **1** (Vittoriano — and it tests to Campitelli anyway) |

Raw OSM objects behind those 131: a 408-object named-feature sweep of the Pigna bounding box
(93 with a centroid in Pigna), a 65-name commerce/memorial sweep inside the polygon, and a
148-object full-geometry straddle run.

Pigna is tiny. Its OSM boundary ring spans **41.8948–41.8994 N, 12.4763–12.4823 E** — roughly
500 m by 500 m, ninety-seven boundary vertices, the smallest ring of the twenty-two. Inside that
square sit the Pantheon, two of the three great Jesuit churches of Rome, four Republican temples,
a national museum, a ministry, a senate library and a chamber-of-deputies palace. The candidate
count is high not because I padded it but because the density is extraordinary.

**A warning I want on the record, per the brief's own instruction that a high confirmation rate is
a failure signal:** I expect a large minority of the 131 to fail verification. The talking statues,
the wayside shrines, the embassies, the four ambiguous *palazzi* on Via del Corso and most of the
restaurants are thin. I have marked them rather than pre-filtering them.

---

## 2. Method

### 2.1 I used the geometry method, not the geocoder — and I recommend the programme standardise on it

The brief offered Nominatim reverse geocoding ("worked for 8 of 8 central landmarks"). The wave-1
Trastevere finder had already found that it collapses at volume (HTTP 429, `quarter` null on 219 of
220 rows). **I did not use it at all.** I replicated and extended the Trastevere geometry method:

1. Pulled boundary geometry for **all 22 rioni** from Overpass
   (`rel["place"="quarter"]["boundary"="place"](41.86,12.42,41.94,12.53)`, `out geom`).
   Exactly 22 relations returned, matching R. I–R. XXII.
2. Stitched unordered way fragments into closed rings by endpoint matching. **All 22 resolved to
   exactly one clean closed ring each** — no gaps, no multipolygon ambiguity. This independently
   reproduces the wave-1 result on a larger set (they stitched 25 units including three quartieri).
3. Ray-casting point-in-polygon locally. Deterministic, no per-lookup network, no rate limit.
4. For every way and relation candidate I fetched full geometry and tested **every vertex**, so a
   square or a street reports *all* the rioni it crosses, not just the one its centroid lands in.

**Sanity check before trusting the polygons** — twelve landmarks with independently known rioni:

| Test point | Resolved to | Expected |
|---|---|---|
| Pantheon | Pigna | Pigna ✓ |
| Santa Maria sopra Minerva | Pigna | Pigna ✓ |
| Sant'Ignazio (church body) | Pigna | Pigna ✓ |
| Chiesa del Gesù | Pigna | Pigna ✓ |
| Collegio Romano | Pigna | Pigna ✓ |
| Largo di Torre Argentina | Pigna | Pigna ✓ |
| Palazzo Venezia | Pigna | Pigna ✓ (see §4.1) |
| Piazza Colonna | Colonna | Colonna ✓ |
| Trevi Fountain | Trevi | Trevi ✓ |
| Piazza Navona | Parione | Parione ✓ |
| Colosseum | Celio | Celio ✓ |
| Piazza Venezia | Trevi (centroid) | **three-way straddle**, §4.2 |

Pigna's boundary relation is **OSM r5452758**, `official_name=Rione IX Pigna`, `ref=R. IX`,
`wikidata=Q1329671`, `wikipedia=it:Pigna (rione di Roma)`.
https://www.openstreetmap.org/relation/5452758

The `ref` normalisation trap flagged by earlier research holds and bit me: Pigna carries `ref=R. IX`
(with prefix and space) while Trastevere carries the bare `ref=XIII`. Any roster join on `ref` must
normalise both shapes.

### 2.2 Centroid and geometry disagree on 6 of the 10 straddlers

This is the headline methodological result and it is the reason I am confident the arbitrator needs
the vertex counts and not just a rione label. A centroid-only method (which is what a reverse
geocoder gives you) would have:

- assigned **Piazza della Rotonda** — the Pantheon's own square — to Colonna outright, with no hint
  that Pigna has a claim at all;
- assigned **Piazza di Sant'Ignazio** to Colonna outright, likewise;
- assigned **Piazza Venezia** to Trevi outright, hiding both the Pigna and the Campitelli claims;
- reported **Largo di Torre Argentina** as clean Pigna, hiding the Sant'Eustachio overlap on the
  square (though *not* on the archaeological area, which really is clean — see §4.3, this
  distinction matters and only vertex testing surfaces it).

### 2.3 Overpass capacity

`overpass-api.de` refused the socket (`ECONNREFUSED`) partway through the session after several
heavy queries, and did not recover across four retries with backoff.
**`overpass.kumi.systems` served the same queries without complaint** and I completed the work
there. Any wave doing this at volume should carry the mirror list. Both are recorded in
`fetch.py`/`commerce.py` in my scratchpad.

---

## 3. The boundary of Pigna, as its neighbours describe it

Two independent Wikipedia rione articles describe the same border from opposite sides and they
agree. I record this as **aggregator** evidence (attributable to it.wikipedia, not to Roma
Capitale) but it is a genuine cross-check because the two articles are written from either side.

Pigna's own article (`https://it.wikipedia.org/wiki/Pigna_(rione_di_Roma)`) gives its borders as:

- **Colonna**: via del Seminario, piazza Sant'Ignazio, via del Caravita
- **Trevi**: via del Corso e piazza San Marcello, piazza Venezia
- **Campitelli**: via San Marco
- **Sant'Angelo**: via delle Botteghe Oscure, via Florida
- **Sant'Eustachio**: via della Torre Argentina, piazza Santa Chiara, via della Rotonda, piazza della Rotonda

Colonna's article (`https://it.wikipedia.org/wiki/Colonna_(rione_di_Roma)`) gives its Pigna border
as "via del Caravita, piazza sant'Ignazio, piazza San Macuto, via del Seminario" — the same four
streets, plus piazza San Macuto which Pigna's article omits. **My geometry finds piazza San Macuto
straddling** (Pigna 13 vertices, Colonna 5), so Colonna's article is the more complete of the two.

**Street-centreline consequence, confirmed by vertex testing.** Where the border runs *along* a
street, OSM draws the boundary on one side of the carriageway, so the street object itself often
tests to the *other* rione while Pigna's pavement and buildings sit on the near side:

| Street | OSM segments tested | Result |
|---|---|---|
| Via del Corso | w22979103, w108565606, w128665329, w204390269, w366692686/7, w1236333976 | carriageway resolves to **Trevi** and **Colonna**; only single vertices touch Pigna |
| Via delle Botteghe Oscure | w28867489, w232765095 (carriageway) vs w223671083/503/504, w1137951735/6 (footways) | **carriageway Sant'Angelo/Campitelli; the footways are Pigna** |
| Via del Plebiscito | w28159703, w36779753, w36780068/9, w1297716852 | **wholly Pigna** (21 of 21 vertices) |
| Via dei Cestari | w25631253, w128665326, w128752446, w203752588 | **wholly Pigna** |
| Via del Gesù | w25631407, w130807537/8, w130920757 | **wholly Pigna** |
| Via di Torre Argentina | w28159153, w159830886 | Pigna 27 vertices, Sant'Angelo 1 |

**Do not read the Corso result as "Palazzo Doria Pamphilj is in Trevi".** The palazzo's own
footprint (r1707363) is **83 of 83 vertices in Pigna**; it merely has a Corso address. Any place
whose street address is on Via del Corso, Via delle Botteghe Oscure or Piazza Venezia needs its
*building* tested, not its street. I tested all of them.

---

## 4. STRADDLERS — flagged, not resolved. Ten, plus one contested clean case.

Format: OSM object, centroid result, **every-vertex** result, and what the documentary sources say.

### 4.1 Palazzo Venezia — I believe it is Pigna, and here is why, but it is Campitelli's to contest

This is the case the brief singled out. The brief's instruction was: *"Pigna may write Palazzo
Venezia ONLY if it can source that the palazzo is in Pigna; if it cannot, it drops it rather than
guessing."* I can source it, three ways:

- **OSM geometry.** `w140186882` "Palazzo Venezia" — **35 of 35 vertices in Pigna. Zero in
  Campitelli. Zero in Trevi.** Not a straddle at all by geometry.
- **it.wikipedia's Palazzo Venezia article** opens: *"un palazzo monumentale di Roma situato tra
  piazza Venezia, via del Plebiscito e via degli Astalli, **nel rione Pigna**."*
  `https://it.wikipedia.org/wiki/Palazzo_Venezia`
- **it.wikipedia's Pigna rione article** lists Palazzo Venezia in Pigna's *Architetture civili*,
  "su piazza Venezia e via del Plebiscito", and lists the Museo nazionale del Palazzo di Venezia as
  Pigna's museum. `https://it.wikipedia.org/wiki/Pigna_(rione_di_Roma)`

**Why it still belongs in this section.** The palazzo fronts the piazza that straddles three rioni
(§4.2), the *Vittoriano* directly opposite is reserved to wave 1, and Campitelli's article
historically claims the Piazza Venezia frontage. **I am not taking it unilaterally.** If wave 1's
Campitelli file also claims Palazzo Venezia, the arbitrator has my evidence above; I would argue
Pigna wins on 35/35 geometry plus two documentary attestations, but that is the arbitrator's call.

Same reasoning, same evidence shape, for the two objects attached to it:

- **Palazzetto Venezia** `r2766771` — 13/13 Pigna.
- **Basilica di San Marco Evangelista al Campidoglio** `w140031952` — 15/15 Pigna. Note the *name*
  says "al Campidoglio" and it.wikipedia's own article says it is "di fianco a Palazzo Venezia" on
  piazza San Marco. The name is a dedication, not a rione. `https://it.wikipedia.org/wiki/Basilica_di_San_Marco_Evangelista_al_Campidoglio`
- **Museo Nazionale del Palazzo di Venezia** `n4376017562`, addr "Piazza Venezia 1" — Pigna.
- **Biblioteca di Archeologia e Storia dell'Arte (BiASA)** `n1391511097`, addr "Piazza Venezia 3" — Pigna.

### 4.2 Piazza Venezia — genuine three-way straddle. I do NOT claim it.

`w713360712` — centroid **Trevi**; vertices **Pigna 12, Campitelli 8, Trevi 8**. Twelve of
twenty-eight vertices are Pigna, so Pigna has the largest single share and still under half.
it.wikipedia's Pigna article lists Piazza Venezia among Pigna's *piazze* **and** names it as the
Trevi border in the same article — the article contradicts itself.

**Arbitrator:** three rioni, no majority, and the reserved Vittoriano stands on its south-east side.
My recommendation is that Piazza Venezia is written once, by whoever gets the Vittoriano, with the
other two rioni's claims noted — but I am flagging, not deciding.

### 4.3 Largo di Torre Argentina — two objects, two different answers

This is the subtlest finding in the file and it only appears under vertex testing.

- **The archaeological area** `w23955329` (`tourism=attraction`, `historic=archaeological_site`) —
  **39 of 39 vertices in Pigna. Clean.**
- **The square** `w125374921` (`place=square`) — **Pigna 20, Sant'Eustachio 7. Straddle.**

it.wikipedia: *"una piazza del centro storico di Roma sita al **confine tra i rioni Pigna,
Sant'Angelo e Sant'Eustachio**"* — naming three rioni where my geometry finds two.
`https://it.wikipedia.org/wiki/Largo_di_Torre_Argentina`

**Consequence for the corpus:** the *Area Sacra* (the ticketed archaeological site) is cleanly
Pigna and should be safe to write here. The *square* — including the **Teatro Argentina**, which my
geometry puts squarely in **Sant'Eustachio** (`w125831637`) — is shared. **Sant'Eustachio is a
wave-2 rione but is not one of my four**, so this straddle may be unadjudicated. Flagging loudly.

Within the Area Sacra, individual temples:

| Object | Vertices |
|---|---|
| Tempio A / Tempio delle Ninfe `w125375013` | 10/10 Pigna |
| Tempio B `w125566965` | 18/18 Pigna |
| Tempio C `w125566967` | 5/5 Pigna |
| **Tempio D `w125566969`** | **Pigna 3, Sant'Angelo 2 — straddle** |
| Curia di Pompeo `w1543173037` (tagged "Curia di Pompio", typo in OSM) | 5/5 Pigna |
| Torre del Papito `w125566970` | 7/7 Pigna |
| Chiesa di San Nicola de Calcarario `w125566963` | 5/5 Pigna |
| Piazza dei Calcarari `r1707370` | 26/26 Pigna |

Tempio D's overlap is on 5 vertices only and may be OSM noise rather than a real straddle; I record
it because I said I would test every vertex, not because I think it is substantive.

### 4.4 Piazza della Rotonda — the Pantheon's own square is MOSTLY NOT PIGNA

The most counter-intuitive result in the file, and I checked it three ways because I did not
believe it.

- `w1295329514` — centroid **Colonna**; vertices **Colonna 30, Pigna 5**.
- `w4949653` (second square object) — Colonna.
- **Fontana di piazza della Rotonda** `r1737642` — Colonna.
- **Obelisco Macuteo** (the obelisk on the fountain) `w128740184` — Colonna.
- **But the Pantheon itself**, `r3374342`, is **38 of 38 vertices in Pigna.**

Documentary agreement: it.wikipedia's Piazza della Rotonda article states the piazza is in
**Colonna, Sant'Eustachio and Pigna** — three rioni — citing Roma Capitale's own street register
(`comune.roma.it/servizi/SITOWPS/dettaglioAreaCircolazione.do?codiceVia=9528`).
`https://it.wikipedia.org/wiki/Piazza_della_Rotonda`

Colonna's rione article names piazza della Rotonda as its **Sant'Eustachio** border and does not
mention Pigna there; Pigna's article names piazza della Rotonda as its **Sant'Eustachio** border.
So all three articles agree the piazza is shared and disagree about who shares it with whom.

**Consequence:** Pigna can write the Pantheon. **Pigna should probably not write "Piazza della
Rotonda" as its own place**, and no Pigna page may describe the fountain or the Macuteo obelisk in
front of the Pantheon as being in Pigna. Colonna is a wave-2 rione but not one of my four —
flagging for the coordinator.

I attempted the Roma Capitale street register directly. **It is a dead lead**: `comune.roma.it` is
unreachable per the roster, and the archived snapshot
(`https://web.archive.org/web/20190419191045/https://www.comune.roma.it/servizi/SITOWPS/dettaglioAreaCircolazione.do%3FcodiceVia%3D9528`)
returns a **zero-byte body**. If it were live it would be the per-street rione source this
programme lacks, and it is worth a later attempt from another network.

### 4.5 Piazza di Sant'Ignazio — Raguzzini's rococo square is mostly Colonna, and the sources conflict three ways

- `w130807531` "Piazza di Sant'Ignazio" — centroid **Colonna**; vertices **Colonna 79, Pigna 5**.
- `w128665348` — Colonna 4, Pigna 1. `w366692678` — Colonna 4, Pigna 1.
- `w130807527` / `w128665308` "Piazza San Ignazio" (variant spelling) — Pigna 2/2 each.
- **The church**, `w23840659` — **28 of 28 vertices in Pigna.**

Sources:
- Pigna's rione article names *piazza Sant'Ignazio* as the Colonna **border** and separately lists
  *Piazza Sant'Ignazio* among Pigna's piazze — self-contradictory again.
- Colonna's rione article names *piazza sant'Ignazio* as the Pigna border.
- it.wikipedia's **Piazza Sant'Ignazio** article's own infobox says
  `quartiere = Rione Campo Marzio`. **That is simply wrong** — Campo Marzio is R. IV, several
  hundred metres north across Colonna. `https://it.wikipedia.org/wiki/Piazza_Sant%27Ignazio`

**This is a live warning for the verifier:** an it.wikipedia infobox `quartiere` field is not
reliable for rione assignment. The prose leads and the category tags have been sound; the infoboxes
have not.

**Consequence:** Pigna writes the church. The piazza is shared and mostly Colonna's.

### 4.6 The remaining six straddlers

| # | Place | OSM | Centroid | Vertices |
|---|---|---|---|---|
| 1 | **Piazza di San Macuto** | `w28677769` | Pigna | Pigna 13, **Colonna 5** |
| 2 | **Piazza di Santa Chiara** | `w128740192` | Pigna | Pigna 15, **Sant'Eustachio 6** |
| 3 | **Tempio D** | `w125566969` | Pigna | Pigna 3, Sant'Angelo 2 |
| 4 | **Via di Torre Argentina** | `w159830886` | Pigna | Pigna 19, Sant'Angelo 1 |
| 5 | **Via delle Botteghe Oscure** (footways vs carriageway) | multiple | split | footways Pigna, carriageway Sant'Angelo/Campitelli |
| 6 | **Via del Corso** (Pigna's west frontage) | multiple | Trevi/Colonna | carriageway not Pigna; Pigna buildings front it |

Items 5 and 6 are boundary-line artefacts rather than contested places, but the arbitrator should
know that four significant Pigna buildings (Palazzo Doria Pamphilj, Palazzo De Carolis,
Santa Maria in Via Lata, Palazzo Verospi Vitelleschi) carry **Via del Corso addresses on a street
whose carriageway tests to Trevi or Colonna.** Their footprints are Pigna. An automated
address-to-rione join would get all four wrong.

---

## 5. The Lateran Treaty property: Palazzo Maffei Marescotti

**This is the ruling-critical record in the file. I read the Treaty text myself rather than relying
on the earlier scope research, and I found a nuance the scope research did not record.**

### 5.1 What the Treaty actually says (primary, fetched and read)

I downloaded the English Lateran Treaty PDF from the Internet Archive's capture of vaticanstate.va
— `https://web.archive.org/web/20110813090725if_/http://www.vaticanstate.va/NR/rdonlyres/3F574885-EAD5-47E9-A547-C3717005E861/2528/LateranTreaty.pdf`
(55,040 bytes, `%PDF-1.4`) — and read Arts. 13–17 directly.

**Art. 15**, verbatim in relevant part: the properties of Art. 13 and Art. 14 ¶1–2,

> "as well as the Palaces of the Dataria, of the Cancelleria, and of Propaganda Fide in Piazza di
> Spagna, the Palace of the Holy Office with its annexes, that of the Convertendi (now the
> Congregation for the Eastern Church) in Piazza Scossacavalli, **the Palace of the Vicariate**,
> and the other edifices in which the Holy See will in the future desire to locate others of its
> Dicasteries, **even if such edifices form part of the territory of the Italian State**, will
> enjoy the immunities granted by International Law to the headquarters of the diplomatic agents of
> foreign States."

**Art. 16**, the *different* list, verbatim: the Gregorian University, the Biblical, Oriental and
Archaeological Institutes, the Russian Seminary, the Lombard College, the two Palaces of
St Apollinaris, the Clergy Retreat House of Sts John and Paul — these

> "will never be subject to liens or to expropriation for reasons of public utility, save by
> previous agreement with the Holy See, and will be exempt from taxes."

**No immunity clause. Art. 16 properties are not extraterritorial.** None of them is in Pigna, so
this trap does not bite here — but I confirm the ruling's premise from the text.

### 5.2 The Pigna property

**"The Palace of the Vicariate"** in Art. 15 is **Palazzo Maffei Marescotti**, the Italian text's
*"il Palazzo Maffei o del Vicariato"*. In Pigna, on the corner of **Via dei Cestari and Via della
Pigna**, adjoining the church of the Santissime Stimmate di San Francesco.

- **OSM** `r1707369` "Palazzo Maffei Marescotti" — **29 of 29 vertices in Pigna.**
- **it.wikipedia** lead: *"un vasto palazzo, nato come palazzo nobiliare, ubicato **nel Rione
  Pigna**, in angolo tra via dei Cestari e via della Pigna, contiguo alla Chiesa delle Santissime
  Stimmate di San Francesco."* Categories: `Roma R. IX Pigna` **and** `Zone extraterritoriali della
  Santa Sede in Italia`. `https://it.wikipedia.org/wiki/Palazzo_Maffei_Marescotti`
- Also named in Pigna's own rione article under *Architetture civili*, "su via dei Cestari".

### 5.3 The nuance the corpus must not get wrong

**The Vicariate is no longer there.** it.wikipedia's history: the Holy See bought the palazzo in
1906 after the collapse of the Banca Romana and made it the seat of the **Vicariato di Roma**;
*"Dopo il trasloco del Vicariato nel Palazzo di San Callisto (1964), l'edificio ospita alcune
associazioni cattoliche e l'Opera romana pellegrinaggi."*

So: **a 1929 treaty names it "the Palace of the Vicariate"; the Vicariate moved out in 1964.**
A page that says "the Vicariate of Rome is here" would be wrong by sixty-two years.

**Permitted phrasing, per the vatican_ruling:** that Palazzo Maffei Marescotti is one of the
properties named in Art. 15 of the Lateran Treaty and therefore enjoys, on **Italian soil**, the
immunities international law grants to the headquarters of a foreign state's diplomatic agents;
that it is **not part of Vatican City**, is **not a border**, and that a visitor there is under
Italian law.

**Banned phrasing:** "in the Vatican", "Vatican territory", "you are leaving Italy", any
conflation with the Art. 16 tax-exempt list, and any present-tense claim that the Vicariate sits
there.

**Open question for the verifier.** I could not fetch a *current* Holy See list confirming that the
Art. 15 grant still attaches to this building after the 1964 move (compare the Palazzo della
Dataria, named in Art. 15, which vatican.va's 2001 list records as no longer Holy See property and
swapped for Palazzo Pio in 1979). The earlier scope research
(`docs/rome/scope-vatican-and-extraterritorial.md`) records vatican.va's list as including it.
**Recommend the verifier re-confirm against vatican.va before this record ships.**

### 5.4 Other Holy See institutions in Pigna that are NOT extraterritorial

Three, and none appears in Art. 15 or Art. 16. **They must not be described as extraterritorial.**

- **Pontificia Accademia Ecclesiastica**, `n2098756750`, Piazza della Minerva 74, in **Palazzo
  Severoli** (`r1737654`, 20/20 Pigna). The Holy See's diplomatic academy.
- **Pontificio Seminario Francese**, `r1737668` — **40 of 40 vertices in Pigna**, Via Santa Chiara.
- **Camere di Sant'Ignazio al Collegio del Gesù**, `n4464465299`, Piazza del Gesù — the rooms where
  Ignatius of Loyola lived and died, maintained by the Jesuit curia.

---

## 6. The candidate roster — 131 places

Column key: **G** = geometry result. `P` = every vertex in Pigna. `p` = single point in Pigna.
`S` = straddler (§4). `—` = no OSM object, sourced only.
Sources are the URLs I fetched this session; §8 lists what each one can and cannot establish.

### 6.1 Ancient Rome (16)

| # | Place | Kind | G | Address / OSM | What, and from where |
|---|---|---|---|---|---|
| 1 | **Pantheon** / Basilica di Santa Maria ad Martyres | Roman temple, now a basilica | P (38/38) | Piazza della Rotonda; `r3374342` | The basilica's own site: Agrippa built the temple in 27 BC dedicating it to the seven planetary divinities, from which *Pantheon*, "of all the gods"; the original, smaller, was rebuilt by Hadrian between 118 and 125 AD. Open daily 09:00–19:00, last entry 18:30; closed 1 Jan and 25 Dec; **paid entry since 3 July 2023**; free on the first Sunday of the month. `https://www.pantheonroma.com/il-pantheon/`, `https://www.pantheonroma.com/orari-e-info/`, `https://www.pantheonroma.com/contatti/` |
| 2 | **Area Sacra di Largo Argentina** | archaeological site, ticketed | P (39/39) | entry via di San Nicola de' Cesarini opposite no. 10; `w23955329` | Sovrintendenza Capitolina: demolition of the old quarter began **1926**; the site was inaugurated **21 April 1929**; reopened to the public **20 June 2023** with a walkway, funded by Bulgari. Tue–Sun; winter 10:00–16:00, summer 10:00–19:00; closed Mon, 25 Dec, 1 May. €7 full / €4 reduced, free to residents of Rome and the metropolitan area. `https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/aree_archeologiche/area_sacra_di_largo_argentina` |
| 3 | **Tempio C** | Republican temple | P | in the Area Sacra; `w125566967` | Sovrintendenza: earliest of the four, built at the **start of the 3rd c. BC**, probably to **Feronia**. Same URL as #2 |
| 4 | **Tempio A** (Tempio delle Ninfe) | Republican temple | P | `w125375013` | Sovrintendenza: **mid-3rd c. BC**, to **Juturna**. A church was built inside it, dedicated to St Nicholas in **1132**. Same URL |
| 5 | **Tempio D** | Republican temple | **S** | `w125566969` | Sovrintendenza: **early 2nd c. BC**, to the **Lares Permarini**. Straddle, §4.3 |
| 6 | **Tempio B** | Republican round temple | P (18/18) | `w125566965` | Sovrintendenza: **late 2nd c. BC**, to **Fortuna huiusce diei**. Same URL |
| 7 | **Curia di Pompeo** | Roman hall | P (5/5) | `w1543173037` (OSM name misspelt "Curia di Pompio") | it.wikipedia's Largo Argentina article: the killing of Julius Caesar in **44 BC** took place at the Curia of Pompey, between the temples and the portico of Pompey's theatre. `https://it.wikipedia.org/wiki/Largo_di_Torre_Argentina` — **aggregator; a verifier should seek a Sovrintendenza or archaeological-institute statement before this ships, it is the single most quotable fact in the rione and deserves a better source** |
| 8 | **Terme di Agrippa** | Roman baths, fragment | P (23/23) | via dell'Arco della Ciambella; `r6596512` | Rome's first public baths, the surviving fragment giving the street its name. Named in Pigna’s *Siti archeologici* by it.wikipedia. **Aggregator-only; thin** |
| 9 | **Porticus Divorum** | Roman portico, buried | p | `n8854537905` | it.wikipedia Pigna *Siti archeologici*. **Aggregator-only; nothing visible** |
| 10 | **Saepta Iulia** | Roman enclosure, buried | — | under the Pigna block east of the Pantheon | it.wikipedia Pigna *Siti archeologici*. **Aggregator-only, no OSM object, nothing visible** |
| 11 | **Iseo Campense / Tempio di Iside al Campo Marzio** | Roman temple, buried | — | Pigna | it.wikipedia Pigna *Siti archeologici*. Corroborated indirectly: it.wikipedia's obelisk article says the Minerva obelisk was brought from Heliopolis under Domitian **to decorate the Temple of Isis in the Campus Martius**. Rich material, but the temple itself is not visitable |
| 12 | **Basilica di Nettuno** | Roman basilica, buried | — | adjoining the Pantheon | it.wikipedia Pigna list. **Aggregator-only** |
| 13 | **Portico degli Argonauti** | Roman portico, buried | — | Pigna | it.wikipedia Pigna list. **Aggregator-only** |
| 14 | **Arco di Claudio** | Roman arch, lost | — | Via Lata / Via del Corso line | it.wikipedia Pigna list. **Aggregator-only; almost certainly not a visitable place — recommend REJECT** |
| 15 | **Piè di Marmo** | colossal marble foot | p | Via del Piè di Marmo; `n1441098724` | Street-name-giving fragment of a colossal statue, generally associated with the Iseo Campense. it.wikipedia Pigna *Altro*. **Aggregator-only for the attribution; the object's presence is OSM-attested** |
| 16 | **Torre del Papito** | medieval tower | P (7/7) | piazza dei Calcarari; `w125566970` | Sovrintendenza: the Area Sacra's **ticket office and bookshop are in the Torre del Papito**, and one of the two display areas is in its portico. it.wikipedia: probably 14th c., possibly built by the Papareschi. Sovrintendenza URL as #2 |

### 6.2 Churches and religious buildings (14)

| # | Place | Kind | G | Address / OSM | What, and from where |
|---|---|---|---|---|---|
| 17 | **Basilica di Santa Maria sopra Minerva** | basilica | P (38/38) | Piazza della Minerva 42; `w25400176` | The basilica's own site: *"una basilica di Roma situata **nel rione Pigna**, in piazza della Minerva"*; holds the remains of **Catherine of Siena** (declared a Doctor of the Church 1970) and of **Fra Angelico** (proclaimed universal patron of artists 1984), and a Melozzo da Forlì fresco. `https://www.santamariasopraminerva.it/` — **note this is a rare case of a place's own site attesting its rione.** Roma Capitale's tourism board gives the address as Piazza della Minerva 42 and mass times Mon–Sat 18:00, Sun 11:00 and 18:00. `https://www.turismoroma.it/it/luoghi/basilica-di-santa-maria-sopra-minerva` |
| 18 | **Chiesa del Gesù** (SS. Nome di Gesù all'Argentina) | church, Jesuit mother church | P (12/12) | Piazza del Gesù; `w25610962` | The church's own site: Ignatius commissioned a design from **Nanni di Baccio Bigio in 1551**; **Michelangelo** redrew the plan in **1554**, unbuilt; **Cardinal Alessandro Farnese** funded it in **1561** and gave it to **Vignola**; construction began **1568**; **Giacomo della Porta** designed the façade and completed the work in **1575**; dedicated **1584**. Later 17th c.: **Baciccia**'s painted decoration and the transept chapels of St Francis Xavier and St Ignatius. `https://www.chiesadelgesu.org/la-chiesa/storia-della-chiesa/`. Hours (winter/summer, incl. mass times) from Roma Capitale: `https://www.turismoroma.it/it/luoghi/chiesa-del-gesu` |
| 19 | **Chiesa di Sant'Ignazio di Loyola in Campo Marzio** | church | P (28/28) | Piazza Sant'Ignazio; `w23840659` | The church's own site (Jesuit province): Gregory XV gave the commission to **Orazio Grassi**; the church was **consecrated in 1722**; **Andrea Pozzo**, Jesuit and painter, made the interior decorations — *"la 'finta cupola', la volta e il presbiterio"* — in **1685**. Burials of **Aloysius Gonzaga, John Berchmans and Robert Bellarmine**. `https://santignazio.gesuiti.it/storia-della-chiesa/`. Roma Capitale gives hours Mon–Sun 09:00–23:30, masses Mon–Sat 18:30, Sun 11:30 and 18:30, tel. 06 6794406. `https://www.turismoroma.it/it/luoghi/chiesa-di-santignazio-di-loyola-campo-marzio` **Note the site's own strapline calls it "nel quartiere Campo Marzio"** — that is the ancient *Campus Martius*, not rione R. IV; the church tests 28/28 to Pigna and Pigna's rione article lists it. Do not let the name mislead |
| 20 | **Basilica di San Marco Evangelista al Campidoglio** | basilica | P (15/15) | Piazza San Marco; `w140031952` | it.wikipedia: built **336** by Pope Mark on an earlier oratory; recorded as *Titulus Marci* in the synod acts of **499**; restored 792 by Hadrian I, rebuilt 833 by Gregory IV; campanile **1154**; the Renaissance benediction loggia built for **Paul II in 1465–70**, traditionally attributed to **Alberti**, now generally to **Francesco del Borgo**, using travertine taken from the Colosseum and the Theatre of Marcellus; Baroque restoration 1654–57 and 1735–50 under Cardinal Querini. `https://it.wikipedia.org/wiki/Basilica_di_San_Marco_Evangelista_al_Campidoglio` **Aggregator — attribute; the Colosseum/Theatre of Marcellus spolia claim touches two reserved places and should be worded as history, not as a cross-reference** |
| 21 | **Basilica di Santa Maria in Via Lata** | basilica | P (11/11) | Via del Corso; `w130807533` | Named in Pigna’s *Architetture religiose* by it.wikipedia, "su via del Corso". **Aggregator-only; no official site fetched. Weak — needs a source before shipping** |
| 22 | **Chiesa di Santa Chiara** | church | P (15/15) | Piazza di Santa Chiara; `w128740178` | it.wikipedia Pigna list. **Aggregator-only** |
| 23 | **Chiesa di San Giovanni della Pigna** | church | P (12/12) | Piazza della Pigna; `w130807532` | it.wikipedia Pigna list. **Aggregator-only** |
| 24 | **Chiesa di Santo Stefano del Cacco** | church | P (25/25) | Via di Santo Stefano del Cacco; `w130807534` | it.wikipedia Pigna list. The dedication's "Cacco" is popularly derived from a statue of an Egyptian god found in the Iseo Campense area — **that derivation is unsourced here; do not publish it without one** |
| 25 | **Chiesa delle Santissime Stimmate di San Francesco** | church | P (40/40) | Via dei Cestari; `w125566927` | it.wikipedia Pigna list; adjoins Palazzo Maffei Marescotti (#40) |
| 26 | **Oratorio di San Francesco Saverio** ("del Caravita") | oratory | P (7/7) | Via del Caravita; `w130807646` | it.wikipedia Pigna list. **Aggregator-only** |
| 27 | **Santa Marta al Collegio Romano** | deconsecrated church, now a conference centre | P (7/7) | Piazza del Collegio Romano; `w130807638` | it.wikipedia lists it under Pigna's *Sconsacrate*. OSM tags it `amenity=conference_centre`. Present function needs a source |
| 28 | **Cappella del transito di Santa Caterina da Siena** | chapel | p | Via di Santa Chiara 14; `n5629466740` | The room in which Catherine of Siena died, reassembled here. **OSM-only; needs a source. Interesting and high-risk** |
| 29 | **Chiesa di San Nicola de Calcarario** | church remains inside Tempio A | P (5/5) | in the Area Sacra; `w125566963` | Sovrintendenza: first evidence of a church inside temple A from the 9th c.; **dedicated to St Nicholas in 1132**, first *de' Calcarario* then *de' Cesarini*; part of the decorated 12th-c. apse survives; the Baroque church above it was destroyed in the Governatorato demolitions. Same URL as #2 |
| 30 | **Camere di Sant'Ignazio al Collegio del Gesù** | historic rooms, visitable | p | Piazza del Gesù; `n4464465299` | The rooms of Ignatius of Loyola, presented by the Gesù's own site as *"Le stanze di Sant'Ignazio"*. `https://www.chiesadelgesu.org/` (site navigation; I did not fetch the sub-page — **verifier should**) |

### 6.3 Palazzi (18)

| # | Place | Kind | G | Address / OSM | What, and from where |
|---|---|---|---|---|---|
| 31 | **Palazzo Venezia** | 15th-c. palace, national museum | P (35/35) | Piazza Venezia / Via del Plebiscito / Via degli Astalli; `w140186882` | **VIVE — Vittoriano e Palazzo Venezia**, the state institute that runs it: *"Per molti secoli residenza di papi, cardinali e ambasciatori, Palazzo Venezia è un'antica e maestosa dimora del quindicesimo secolo"*; the façades and much of the detail go back to its founder and first occupant, **Cardinal Pietro Barbo, who became Paul II (1464–1471)**; **Paul III Farnese (1534–1549)** among later papal residents; **Erasmus** and **Charles V** among recorded guests. **CURRENT NOTICE, on the same page: the historic rooms (Sale Storiche) are closed to the public for restoration.** `https://vive.cultura.gov.it/it/palazzo-venezia`. it.wikipedia adds construction from **1455** for Barbo. §4.1 for the rione evidence |
| 32 | **Palazzetto Venezia** | attached palace block | P (13/13) | `r2766771` | Same complex. Sourced only by OSM + it.wikipedia |
| 33 | **Palazzo Doria Pamphilj** | private palace, house museum | P (83/83) | **Via del Corso 305**; `r1707363` | The family administration's own site: built on the core of **Cardinal Fazio Santoro**'s early-16th-c. residence, grown by annexation over 500 years through the Della Rovere, Aldobrandini, Pamphilj, Doria Pamphilj, Facchinetti, Colonna, Borghese and Savoia; the **Galleria took its present form 1731–1734** when Prince Camillo Pamphilj *iunior* commissioned **Gabriele Valvassori** to rework the Corso range; the pictures still hang to the **late-18th-c. arrangement documented in a 1767 manuscript** in the family archive. `https://doriapamphilj.it/roma/galleria/`. Roma Capitale confirms the address. `https://www.turismoroma.it/it/luoghi/palazzo-doria-pamphilj` |
| 34 | **Collegio Romano** (palace) | 16th-c. college, now ministry + liceo | P (20/20) | Piazza del Collegio Romano; `w130807586` | **VIVE (state institute), on the Sala della Crociera:** the Collegio Romano is *"il maestoso palazzo costruito fra il **1581 e il 1584** per volontà di **papa Gregorio XIII Boncompagni** come sede dello Studio della Compagnia di Gesù"*, and the Sala della Crociera on its second floor housed the Jesuits' **Bibliotheca Maior**. `https://vive.cultura.gov.it/it/incontriamoci-al-collegio-romano-la-bibliotheca-maior-si-apre-alla-citta`. it.wikipedia gives 1582–1584 and the seat of the college 1584–1870 — **a one-year discrepancy with VIVE on the start date; take VIVE's** |
| 35 | **Palazzo Altieri** | 17th-c. palace | P (33/33) | Piazza del Gesù; `r1707371` | it.wikipedia Pigna *Architetture civili*. **Aggregator-only** |
| 36 | **Palazzo Cenci Bolognetti** | palace | P (16/16) | Piazza del Gesù; `w125566948` | it.wikipedia Pigna list. OSM `building=government` |
| 37 | **Palazzo De Carolis** | 18th-c. palace | P (17/17) | Via del Corso; `w130807574` | it.wikipedia Pigna list. §4.6 on the Corso address trap |
| 38 | **Palazzo Grazioli** | palace | P (16/16) | Via del Plebiscito; `r2752045` | it.wikipedia Pigna list |
| 39 | **Palazzo San Macuto** | palace, Chamber of Deputies committee rooms | P (15/15) | Piazza di San Macuto; `w130807663` | it.wikipedia Pigna list; OSM `building=office`. **The Camera dei deputati connection is not sourced here — I could not reach a working camera.it page. Verifier must source or drop it** |
| 40 | **Palazzo Maffei Marescotti** | palace, Lateran Treaty Art. 15 | P (29/29) | corner Via dei Cestari / Via della Pigna; `r1707369` | **See §5 in full.** Designed **1580** by **Giacomo della Porta** for **Cardinal Marcantonio Maffei**, who died in 1583 leaving it unfinished; bought 1591 by **Camilla Peretti**, sister of Sixtus V; through Sannesio, Cardinal Ludovisi (1621), Francesco II d'Este (1668), an Acciaiuoli (1714), to the **Marescotti in 1764**, who had **Ferdinando Fuga** enlarge it; sold 1865 to the Banca Romana; bought by the **Holy See in 1906**, which made it the seat of the Vicariate of Rome; **the Vicariate left for Palazzo San Callisto in 1964**. `https://it.wikipedia.org/wiki/Palazzo_Maffei_Marescotti` |
| 41 | **Palazzo della Minerva** | palace, Senate library | P (17/17) | Piazza della Minerva 38; `r1761263` | OSM: `Biblioteca del Senato Giovanni Spadolini - Palazzo della Minerva`, `amenity=library`. **Senate sourcing incomplete — `senato.it/biblioteca` returned an empty body. Verifier must source** |
| 42 | **Palazzo Severoli** | palace, Pontifical Ecclesiastical Academy | P (20/20) | Piazza della Minerva 74; `r1737654` | OSM + the Academy node at the same address. §5.4 — **not extraterritorial** |
| 43 | **Palazzo Besso** | palace | P (10/10) | Largo di Torre Argentina; `w125566947` | it.wikipedia Pigna list |
| 44 | **Palazzo Frangipane** | palace | P (18/18) | `w130807583` | OSM only. **Thin** |
| 45 | **Palazzo Berardi** | palace, carries the water clock | P (5/5) | Via del Gesù; `w125566946` | it.wikipedia's Pigna article lists the **Idrocronometro di Palazzo Berardi** under *Altro* as "Orologio in via del Gesù". See #62 |
| 46 | **Palazzo Bonaparte** | palace, exhibition venue | p | Piazza Venezia; `n10215257717` | **Arthemisia**, the operator: *"Dal 2019 … gli spazi del palazzo accolgono esposizioni"*; it is presented as "Palazzo Bonaparte — Nuovo Spazio Generali Valore Cultura". `https://www.mostrepalazzobonaparte.it/` it.wikipedia lists it in Pigna, "su piazza Venezia" — **but it fronts the three-way straddle of §4.2; test the building before shipping** |
| 47 | **Palazzo Ginnasi** | palace | p | Largo de' Ginnasi; `w125566943` is the *largo* (10/10 Pigna), not the palace | it.wikipedia Pigna list, "su largo S. Lucia Filippini". **No OSM object for the palace itself** |
| 48 | **Palazzo Verospi Vitelleschi** | palace | — | Via del Corso | it.wikipedia Pigna list. **No OSM object found in the bbox. Weakest of the palazzi; recommend the verifier confirm it exists at a Pigna address or drop it** |

### 6.4 Museums, libraries, learning (9)

| # | Place | Kind | G | Address / OSM | What, and from where |
|---|---|---|---|---|---|
| 49 | **Galleria Doria Pamphilj** | private picture gallery | p | Via del Corso 305; `n706793341` | Family administration: entrance **Via del Corso 305, 00186 Roma**, tel. +39 06 6797323; **Mon–Thu 09:00–19:00** (last entry 18:00), **Fri–Sun 10:00–20:00** (last entry 19:00); **closed every Wednesday**, 1 Jan, Easter, 25 Dec; no cloakroom, no lift; booking advised. The **Appartamenti Segreti with the Bagno di Diana** are run separately by the Trust Floridi Doria Pamphilj and are **not** included in the ticket. `https://doriapamphilj.it/roma/la-visita/` |
| 50 | **Museo Nazionale del Palazzo di Venezia** | national museum | p | Piazza Venezia 1; `n4376017562` | Part of **VIVE — Vittoriano e Palazzo Venezia**, an *istituto autonomo* of the Ministero della Cultura. `https://vive.cultura.gov.it/` |
| 51 | **Biblioteca di Archeologia e Storia dell'Arte (BiASA)** | research library | p | Piazza Venezia 3; `n1391511097` | VIVE: *"un istituto pubblico per la ricerca e lo studio, il più importante del Ministero della Cultura specializzato nelle discipline archeologiche, architettoniche, artistiche e storico-artistiche. **Fondata nel 1875** come raccolta di libri dei funzionari della Direzione Generale Antichità e Belle Arti"*; holds the **Rodolfo Lanciani** collection on deposit; **split between Palazzo Venezia and the Palazzo del Collegio Romano**. `https://vive.cultura.gov.it/it/biblioteca-archeologia-e-storia-arte` **CURRENT NOTICE: VIVE's news index carries "BiASA: chiusura della sede di Palazzo Venezia a partire dal 7 settembre 2026" — the Palazzo Venezia site closes 7 Sept 2026. Any hours we publish must account for this** |
| 52 | **Sala della Crociera**, Palazzo del Collegio Romano | historic library hall | (inside #34) | Collegio Romano, 2nd floor | VIVE: housed the Jesuit **Bibliotheca Maior**; **since 1989 a detached section of the BiASA**, normally open only to scholars; opened to the public through the 2026 programme *Incontriamoci al Collegio Romano*, four lecture cycles and special openings **March–December 2026**, run by DiVa and VIVE. `https://vive.cultura.gov.it/it/incontriamoci-al-collegio-romano-la-bibliotheca-maior-si-apre-alla-citta` |
| 53 | **Biblioteca Casanatense** | state library | p | Via di Sant'Ignazio 52; `n2139261441` | **DANGER — see §8.2. `casanatense.it` is no longer the library. It now serves an Italian online-casino affiliate page. The library's real host, `casanatense.cultura.gov.it`, times out from this network.** No usable source obtained. **Recommend HOLD until a live official URL is confirmed** |
| 54 | **Biblioteca della Camera dei deputati** | parliamentary library | p | Via del Seminario 76; `n2632239837` | OSM only. Needs a camera.it source |
| 55 | **Liceo Classico Ennio Quirino Visconti** | state school in the Collegio Romano | p | Piazza del Collegio Romano 4; `n1257346321` | it.wikipedia's Collegio Romano article: the west wing houses the liceo, the east wing the Ministero della Cultura. **A school is a weak travel-guide subject; carried because it explains what half the building is** |
| 56 | **Ministero della Cultura (HQ)** | ministry, in the Collegio Romano | P (18/18) | Via del Collegio Romano; `w130807588` | VIVE calls the Collegio Romano *"l'attuale sede del Ministero della Cultura"*. Same URL as #52 |
| 57 | **Teatro Rossini** | theatre | p | Piazza di Santa Chiara 14; `n12923083994` | OSM only (`amenity=theatre`, `wikidata=Q3982122`). **Unsourced beyond OSM; needs a site or a Roma Capitale page** |

### 6.5 Squares, streets and open space (14)

| # | Place | G | OSM | Note |
|---|---|---|---|---|
| 58 | **Piazza della Minerva** | P (19/19) | `w23840745` | Roma Capitale tourism carries it as a place in its own right: `https://www.turismoroma.it/it/luoghi/piazza-della-minerva` |
| 59 | **Piazza del Gesù** | P (27/27) | `w22979108` | |
| 60 | **Piazza del Collegio Romano** | P (24/24) | `w130807528` | |
| 61 | **Piazza della Pigna** | P (25/25) | `w130807529` | The rione's name-square |
| 62 | **Piazza Grazioli** | P (14/14) | `w130807526` | |
| 63 | **Piazza dei Calcarari** | P (26/26) | `r1707370` | Area Sacra ticket office address |
| 64 | **Largo de' Ginnasi** | P (10/10) | `w125566943` | |
| 65 | **Largo di Santa Lucia Filippini** | P (10/10) | `w223671510` | |
| 66 | **Piazza di San Macuto** | **S** | `w28677769` | §4.6 |
| 67 | **Piazza di Santa Chiara** | **S** | `w128740192` | §4.6 |
| 68 | **Piazza di Sant'Ignazio** | **S** | `w130807531` + 3 more | §4.5 |
| 69 | **Largo di Torre Argentina** (the square) | **S** | `w125374921` | §4.3 |
| 70 | **Piazza della Rotonda** | **S** | `w1295329514` | §4.4 — mostly Colonna |
| 71 | **Piazza Venezia** | **S** | `w713360712` | §4.2 — three-way |

Wholly-Pigna streets that a guide might name: **Via del Plebiscito**, **Via dei Cestari**,
**Via del Gesù**, **Via del Piè di Marmo**, **Via della Gatta**, **Via di Torre Argentina**
(19/20). Evidence in §3.

### 6.6 Sculpture, fountains, street furniture (13)

| # | Place | Kind | G | OSM | What, and from where |
|---|---|---|---|---|---|
| 72 | **Obelisco della Minerva** ("Pulcin della Minerva") | Egyptian obelisk on a marble elephant | p | Piazza della Minerva; `n1340656195` | it.wikipedia: the elephant was carved by **Ercole Ferrata** to a **1667 design by Gian Lorenzo Bernini**; the obelisk is **4th c. BC**, about **5.50 m** tall, its tip **12.70 m** above the ground; originally from **Heliopolis**, brought to Rome under **Domitian** to decorate the **Temple of Isis in the Campus Martius**; the iconography follows Francesco Colonna's *Hypnerotomachia Poliphili* (1499). `https://it.wikipedia.org/wiki/Obelisco_della_Minerva` **Aggregator — attribute. The measurements are the kind of number the earlier research showed WebFetch corrupts; I read them from raw wikitext, not a summary** |
| 73 | **Fontana della Pigna** | fountain | p | Piazza San Marco; `n264897051` | it.wikipedia's Pigna article: a travertine pine-cone fountain in front of San Marco, erected by the **Comune di Roma** to restore the rione's emblem after the ancient bronze pine cone was moved to the Vatican; **by Pietro Lombardi**. **Note for the vatican_ruling: the ancient pine cone is in the Vatican's Cortile della Pigna and is NOT a Pigna place. The fountain is** |
| 74 | **Fontana del Facchino** | wall fountain, "talking statue" | p | Via Lata; `n281348354` | OSM `amenity=fountain`, `wikidata=Q3968656`. **Sovrintendenza's 44-fountain index does NOT include it, so no institutional source. Aggregator/OSM only** |
| 75 | **Madama Lucrezia** | "talking statue" | p | Piazza San Marco; `n1391514187` | it.wikipedia's San Marco article: one of Rome's talking statues, at the left of the basilica entrance, possibly originally a statue of **Isis**. The Sovrintendenza's site has a *Statue parlanti* section in its navigation but the URL **404s** — the nav over-promises, exactly as the wave-1 finder recorded |
| 76 | **Statua della Gatta** | marble cat on a cornice | p | Via della Gatta / Palazzo Grazioli; `n2112025092` | OSM only. Charming, thin |
| 77 | **Stemma araldico della famiglia Barbo** | heraldic arms | p | `n4295892980` | OSM only |
| 78 | **Sposalizio di Venere con il Mare** | fountain | P (20/20) | `w125226027` | OSM only |
| 79 | **Idrocronometro / Orologio ad acqua in via del Gesù** | water clock | (on #45) | Palazzo Berardi, Via del Gesù | it.wikipedia's Pigna article lists "Orologio in via del Gesù" under *Altro* and captions the water clock as being at Palazzo Berardi. **Aggregator-only, and the OSM node search returned nothing. Delightful if it can be sourced** |
| 80 | **Tomb of Raphael** (in the Pantheon) | tomb | p | `n12471834638` | The Pantheon's own site: *"Raffaello volle farne il luogo del proprio riposo eterno"* and names Raffaello among the five figures in its audio guide. `https://www.pantheonroma.com/il-pantheon/` |
| 81 | **Tomb of Vittorio Emanuele II** (in the Pantheon) | royal tomb | p | `n2575991936` | OSM `historic=tomb`. **The Pantheon site names Margherita di Savoia among its audio-guide figures but I did not fetch a page stating the royal burials. Verifier must source** |
| 82 | **Tomb of Umberto I** (in the Pantheon) | royal tomb | p | `n2575991896` | As #81 |
| 83–85 | **Three edicole sacre**: Madonna Addolorata `n1170556146`, Madonna della Pietà `n1253221573`, Madonna con Bambin Gesù `n1394267388` | wayside shrines | p | | OSM `historic=wayside_shrine`. The Sovrintendenza has an *Edicole Sacre* index page which returns **HTTP 200 with zero child links** — no per-shrine source exists there. **Thin as individual places; possibly one collective record** |

### 6.7 Institutions and offices (7)

| # | Place | G | Address / OSM | Note |
|---|---|---|---|---|
| 86 | **Pontificia Accademia Ecclesiastica** | p | Piazza della Minerva 74; `n2098756750` | §5.4 — **not extraterritorial** |
| 87 | **Pontificio Seminario Francese** | P (40/40) | `r1737668` | §5.4 |
| 88 | **Embassy of Panama to the Holy See** | p | Largo di Torre Argentina 11; `n8197650461` | `office=diplomatic`. Embassies are weak guide subjects; carried for completeness |
| 89 | **Embassy of Georgia** | p | Via del Plebiscito 102; `n8195355686` | As above |
| 90 | **Commissione di garanzia (sciopero nei servizi pubblici essenziali)** | p | Piazza del Gesù 46; `n8195168989` | Government office. **Recommend REJECT — no visitor interest** |
| 91 | **Partito Socialista Italiano (HQ)** | p | `n9239245131` | **Recommend REJECT unless the building itself carries a story** |
| 92 | **Mediateca Università telematica Nettuno** | p | Piazza Grazioli; `n10857746505` | **Recommend REJECT** |

### 6.8 Shops, food and lodging (39)

Per the corpus rules, a business's own site establishes identity, location and hours only — **not
"the oldest", not "since 18xx" unless the claim is separately sourced, not superlatives.** Where a
shop's name or signage carries a date I record the date as *signage*, not as fact.

| # | Place | Kind | G | Address / OSM | Note |
|---|---|---|---|---|---|
| 93 | **Ditta Annibale Gammarelli** | ecclesiastical tailor | p | Via Santa Chiara 34; `n2151224588` | Site reachable **only with a browser User-Agent** (403 otherwise): `https://www.gammarelli.com/`. It sells episcopal insignia, sacred vestments and ecclesiastical tailoring. **It makes no "papal tailor since 1798" claim on the page I fetched, and I am not making one.** The strapline is "Nobilitas in Traditione". Strong guide subject *if* a claim can be sourced |
| 94 | **Ditta G. Poggi** | artists' materials | P | `w130807651`; `https://www.poggi1825.it` | The site's own title is **"Ditta G.Poggi – Belle Arti dal 1825"**. That is the business's self-description; per the corpus rules it establishes identity, **not** trading longevity |
| 95 | **Libreria Cesaretti al Collegio Romano** | bookshop | p | Via del Piè di Marmo 27; `n7900365888` | `https://www.libreriacesaretti.com/` (not fetched) |
| 96 | **Grand Hotel de la Minerve** | hotel | P (16/16) | Piazza della Minerva; `r1761261` | OSM `tourism=hotel`. Occupies a palazzo on the Minerva square |
| 97 | **Minerva Roof Garden** | rooftop bar | p | Piazza della Minerva 69; `n2274002831` | `https://www.minervaroofgarden.it/` |
| 98 | **Hotel Santa Chiara** | hotel | p | Via Santa Chiara 21; `n708898438` | |
| 99 | **Hotel Le Clarisse al Pantheon** | hotel | p | Via dell'Arco della Ciambella 19; `n4944683321` | Named for the Baths of Agrippa arch (#8) |
| 100 | **Enoteca Corsi** | trattoria / wine shop | p | Via del Gesù; `n4278033490` | |
| 101 | **La Ciambella** | restaurant | p | Via dell'Arco della Ciambella 20; `n4538921591` | `https://www.la-ciambella.it/` — sits over the Baths of Agrippa remains |
| 102 | **Caffè Doria** | café | p | Via della Gatta; `n4464465298` | `https://www.caffedoria.it/` — the Doria Pamphilj café |
| 103 | **La Feltrinelli** | bookshop | p | Largo di Torre Argentina 5a; `n1141104517` | Chain; carried because it is a landmark of the largo |
| 104 | **Antico Caffè della Pigna** | café | p | Piazza della Pigna 24; `n6192927885` | |
| 105 | **Federico Polidori** | leather workshop | p | Via del Piè di Marmo 7–8; `n7900363702` | `http://federicopolidori.com/` |
| 106 | **Antica Erboristeria Romana** | herbalist | p | `n9352385517` | `https://www.anticaerboristeriaromanashop.com/` |
| 107 | **Erboristeria La Minerva** | herbalist | p | Via di Santa Caterina da Siena 44; `n5958291487` | |
| 108 | **Barbiconi** | clerical outfitter | p | Via di Santa Caterina da Siena 59; `n12804970361` | One of the Via dei Cestari / Santa Caterina cluster of ecclesiastical outfitters — **the cluster itself is the guide subject; individual shops are thin** |
| 109 | **Osteria di Agrippa** | restaurant | p | Via dei Cestari 38; `n4377432889` | |
| 110 | **Pigna Enoteca di Sardegna** | restaurant | p | Via della Pigna 3/3A; `n4386702193` | |
| 111 | **Vini e Cucina Blasi** | wine bar | p | Via di Torre Argentina 12; `n3781269001` | |
| 112 | **Pantha Rei** | restaurant | p | Via della Minerva 19; `n4721521489` | |
| 113 | **Ristorante La Sagrestia** | restaurant | p | Via del Seminario 89; `n4196496989` | |
| 114 | **Bibliothe** | café | p | Via Celsa 10; `n2012371794` | |
| 115 | **Da Vittorio Café Roma** | café | p | Piazza della Minerva 69; `n13727949301` | |
| 116 | **Scholars Lounge Irish Pub** | pub | p | Via del Plebiscito 101b; `n1253223527` | |
| 117 | **Trinity College** | bar | p | `n1253235860` | |
| 118 | **Pane Pane Vino ar Vino** | restaurant | p | Via del Gesù 84; `n11937053080` | |
| 119 | **La Locanda del Prosciutto** | restaurant | p | Via del Gesù 81; `n6165388288` | |
| 120 | **Pandalì** | restaurant | p | Via di Torre Argentina 3; `n12725805601` | |
| 121 | **L'Antica Enoteca Largo** | restaurant | p | Via di San Nicola de' Cesarini 13; `n13566787201` | |
| 122 | **Caffè Ristorante Domus Altieri** | restaurant | p | `n6192909073` | |
| 123 | **Gran Caffè Vittoriano** | café | p | Corso Vittorio Emanuele II 28; `n5308330922` | Named for a reserved monument; the café is in Pigna |
| 124 | **Castoro Ferramenta** | hardware | p | Via di Torre Argentina 16; `n6914766785` | Old-style ironmonger |
| 125 | **Namas Tey** | convenience | p | Via della Palombella 26; `n5983789699` | |
| 126 | **Articoli per belle arti** | art supplies | p | `n4792951821` | Possibly a duplicate of #94 under a shopfront name — **verifier should dedupe** |
| 127 | **Billetteria Pantheon** | ticket office | p | `n11835144015` | Practical, not a place |
| 128 | **Fox Gallery** | gallery | p | `n4617103889` | Unsourced |
| 129 | **Chiostro della cisterna** | garden/cloister | P (5/5) | `w257899533` | OSM `leisure=garden`. Unidentified — **verifier should establish what this is or drop it** |
| 130 | **Torre Argentina Cat Sanctuary** (Colonia felina di Torre Argentina) | animal sanctuary in the Area Sacra | (in #2) | `https://www.gattidiroma.net/` | The site's own title: *"Colonia felina di Torre Argentina — Torre Argentina Cat Sanctuary"*. it.wikipedia's Largo Argentina article calls it *"la più antica colonia felina della città"* — **that is a superlative from an aggregator and must NOT be published.** The colony's existence and location are fine. **The site is a frameset and I could not fetch its content pages; the verifier needs hours and access terms before this ships** |
| 131 | **Filmauro S.r.l.** | film company HQ | p | Piazza Venezia 5; `n12565606358` | **Recommend REJECT — no visitor interest** |

---

## 7. Reserved-to-wave-1 places: what I found and what I did with it

**I took nothing from the reserved list.** For completeness, here is what my Pigna-bbox sweep
surfaced from it and where it tested:

| Reserved place | My geometry says | Action |
|---|---|---|
| Vittoriano / Altare della Patria (`r1849830`) | **Campitelli** | Not taken. Wave 1 is right |
| Santa Maria in Aracoeli (`w25640152`) | **Campitelli** | Not taken |
| Capitoline Museums (`r9909127`), Piazza del Campidoglio (`w23055100`) | **Campitelli** | Not taken |
| Roman Forum (`r1841080`) | **Campitelli** | Not taken |
| Trajan's Forum (`r1754380`), Trajan's Column (`r3376015`), Basilica Ulpia (`r2051623`) | **Monti** | Not taken |
| Colosseum | **Celio** | Not taken |

**No argument to file.** I do not believe any reserved place belongs to Pigna. The only place where
the reservation and my rione meet is **Piazza Venezia** (§4.2), which is not itself on the reserved
list but on which the reserved Vittoriano stands. I have flagged it rather than claiming it,
exactly as the brief requires.

Two places sit near enough to the wave-1 boundary that the coordinator should double-check no
wave-1 file has taken them: **Palazzo Venezia** (§4.1) and **Basilica di San Marco** (#20), both of
which face Piazza Venezia and both of which test cleanly to Pigna.

---

## 8. Source assessment

### 8.1 What worked, and what each source can establish

| Source | Status | Can establish | Cannot establish |
|---|---|---|---|
| **Overpass / OSM** (`overpass.kumi.systems`; `overpass-api.de` refused mid-session) | Excellent | Geometry, rione membership, addresses, object existence | Anything historical |
| **Sovrintendenza Capitolina** `sovraintendenzaroma.it` | Excellent for the Area Sacra | Roma Capitale's own heritage voice: dates, dedications, excavation history, opening hours, prices | Nothing per-property outside its indexes; the *Statue parlanti*, *Beni archeologici* and *Archi, porte e ponti* nav entries **404** |
| **VIVE** `vive.cultura.gov.it` | Excellent, and **reachable while the rest of `cultura.gov.it` is not** | Palazzo Venezia, BiASA, Collegio Romano/Sala della Crociera; current closures | — |
| **turismoroma.it** (Roma Capitale, Dip. Grandi Eventi, Sport, Turismo e Moda) | Good | Addresses, coordinates, opening and mass times, phone/e-mail. Roma Capitale's own tourism voice | History; and its coverage is patchy — Palazzo Venezia, San Marco and the Area Sacra all **404** |
| **Places' own sites** — pantheonroma.com, chiesadelgesu.org, santignazio.gesuiti.it, santamariasopraminerva.it, doriapamphilj.it | Good | Identity, location, hours, tickets, their own institutional history | Superlatives, "oldest", trading longevity |
| **it.wikipedia raw wikitext** (`action=parse&prop=wikitext`) | Reliable transport, aggregator content | Leads, cross-checks, rione categories | Must be attributed; **infoboxes are unreliable for rione (§4.5)** |
| **Lateran Treaty PDF** via Internet Archive | Primary, verified | Arts. 13–17 verbatim | Anything about the properties today |

**Newly confirmed dead or blocked from this network:**

- `cultura.gov.it` — **TCP timeout**
- `casanatense.cultura.gov.it` — **TCP timeout**
- `comune.roma.it` — unreachable (per roster); its archived street-register snapshot returns a
  **zero-byte body**
- `museiincomuneroma.it` — host open, but `/it/musei/area-sacra-di-largo-argentina` **404s**
- `senato.it/biblioteca` — **empty body**
- `camera.it/leg19/1120` — **404**

**Two access techniques future waves should carry:**

1. **A browser User-Agent is required** by `gammarelli.com` and `santignazio.gesuiti.it`, both of
   which return **403** to a research UA and 200 to a Chrome UA.
2. `www.santignazio.gesuiti.it` presents a **certificate with a hostname mismatch**; the apex
   `santignazio.gesuiti.it` is fine. Use the apex.

### 8.2 A source-integrity finding the whole programme needs

**`casanatense.it` is no longer the Biblioteca Casanatense.** The domain now serves an Italian
online-casino affiliate page ("Casino Online non AAMS: Migliori Siti…", last-updated 11 Aug 2026,
with bonus tables and operator rankings). The word "Biblioteca Casanatense" survives only as a nav
link on that page.

This is a **lapsed-domain hijack of an institutional URL**, and it is exactly the failure mode that
would let a casino page into a heritage corpus through an old link. **Recommendations:**

1. No Pigna record cites `casanatense.it`.
2. The programme should sweep every already-collected source URL for the same pattern before any
   wave ships — a heritage domain that has been let go and re-registered will still look right in a
   bibliography.
3. The Casanatense record (#53) should be **held** until a live official URL is confirmed. Its real
   host times out from here, so I could not confirm one.

---

## 9. Photo leads — quarantined, per the no-photographs ruling

`"photos": []` everywhere above. I sourced, named and linked no image. Two leads for the later wave,
recorded so the work is not lost:

1. **The Sovrintendenza Capitolina publishes a licensing route** — its nav carries
   *"Autorizzazione all'uso di immagini del patrimonio culturale di Roma Capitale"* and
   *"Fotoriproduzioni di opere d'arte dei musei"* under `sovraintendenzaroma.it`. That is the
   permissions path for Area Sacra and Torre del Papito imagery.
2. **VIVE publishes three separate policy pages** — `/it/acquistare-o-scattare-una-foto`,
   `/it/richiedere-una-foto` and `/it/girare-un-film-o-un-video` — which govern Palazzo Venezia.
   **Neither was read. Both must be read before any Pigna photograph is considered**, and the
   roster's warning about state-museum interiors being the highest-risk photo class applies to the
   Museo Nazionale del Palazzo di Venezia.

I did not evaluate freedom-of-panorama exposure for any Pigna subject. Italy has no freedom of
panorama, and the roster already records that as fatal for 20th-century architecture; almost
everything in Pigna is old enough that the risk is in the *photograph's* rights, not the
building's — but that is an assertion I did not verify and the photo wave must not inherit it.

---

## 10. What I would tell the verifier to attack first

1. **The Curia of Pompey / death of Caesar (#7).** The single most quotable fact in the rione and I
   have it only from it.wikipedia. Find an institutional source or the corpus must hedge it.
2. **Palazzo Maffei Marescotti's current Art. 15 status (§5.3).** The Vicariate left in 1964 and
   Art. 15 named the building as "the Palace of the Vicariate". Confirm against vatican.va that the
   grant still attaches, and make sure no draft says the Vicariate is there.
3. **Biblioteca Casanatense (#53).** Held pending a live official URL. Do not let `casanatense.it`
   back in (§8.2).
4. **Piazza della Rotonda (§4.4).** If a draft says the fountain or the obelisk in front of the
   Pantheon is in Pigna, it is wrong by my geometry and by it.wikipedia's own citation of the Roma
   Capitale street register.
5. **Palazzo Verospi Vitelleschi (#48), Palazzo Ginnasi (#47), Teatro Rossini (#57), Palazzo San
   Macuto's parliamentary use (#39), the Pantheon royal tombs (#81–82), Chiostro della cisterna
   (#129).** Each is carried on a single weak source or none.
6. **Nine records I would reject outright on visitor interest** unless someone argues otherwise:
   #14 Arco di Claudio, #90 Commissione di garanzia, #91 PSI, #92 Nettuno mediateca, #127
   Billetteria, #131 Filmauro, and the three shrines #83–85 as separate records.

---

## 11. Working files

All research artefacts are in the session scratchpad
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/pigna/`:

- `fetch.py` — cached raw-bytes HTTP with browser UA and Overpass mirror fallback
- `geom.py` — rione ring builder, stitcher and point-in-polygon; `rione_rings.json` holds all 22 rings
- `poi.py` / `pois.json` — the 408-object bbox sweep and its rione classification
- `straddle.py` / `straddle.json` — the every-vertex straddle test, 148 geometry candidates
- `extra.py` — targeted street and building straddle tests
- `commerce.py` — the shop/food/memorial sweep inside the polygon
- `wt.py` — it.wikipedia raw-wikitext fetcher (no LLM summarisation in the loop)
- `lateran.pdf` — the Lateran Treaty English text I read Arts. 13–17 from
