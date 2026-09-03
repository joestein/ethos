# Trevi (R. II, Roma Capitale toponymic code 102) — FINDER file

Wave 2, Rome programme. Research date **2026-09-02**. This is **evidence, not adjudication.**
I am not deciding what ships. A verifier adjudicates each claim; an arbitrator rules ownership of
straddlers with all four wave-2 files, and the wave-1 reservation, in front of it.

**Rulings observed.**

- **Ruling 1 (no designation claims).** Nothing below says or implies *vincolato*, *vincolo
  monumentale*, "listed", "scheduled", "declared a monument", "protected", "heritage-listed",
  *bene culturale tutelato* or *dichiarazione di interesse culturale*, in English or Italian.
  I re-tested both registers this session and both are still dead from this network (§2.4).
- **Ruling 2 (Vatican City belongs to no rione).** No Vatican City place is claimed for Trevi.
  **But the brief's expectation that Trevi holds no Lateran Treaty property is wrong** — Trevi holds
  one Art. 15 property and three Art. 16 properties, and the Art. 15/Art. 16 distinction the brief
  warns about bites here harder than in any other rione in this wave. See §5, which is the most
  important section in this file.
- **Ruling 3 (no photographs).** I sourced, named and linked no image. `"photos": []` everywhere.
  Photo leads are quarantined in §9 for the later wave.

---

## 1. Headline numbers

| | |
|---|---|
| Raw OSM objects returned inside/touching Trevi | **294** |
| Deduplicated by name | **288** |
| **Place candidates a guide could honestly write about** | **118** |
| — of which sourced only from OSM | 105 |
| — of which OSM missed entirely and I found in text sources | 13 |
| **Straddlers — flagged, NOT resolved by me** | **18** |
| Hospitality / retail / bank / pharmacy noise, listed as a class only | 163 |
| Candidates I looked for and found to be **outside** Trevi | 9 (§7) |
| Objects that are OSM data errors, not places | 3 (§8.3) |

Trevi is the smallest rione in this wave at 0.5 km², and it is the densest per hectare of anything
I have seen in this programme. **118 is not a claim that 118 should ship.** A large share are
palazzi with a Wikipedia stub and nothing else, or parish churches whose guide-worthiness is thin.
Per the brief's warning I have over-collected at the edges and marked the weak ones (§6) rather
than pre-filtering them. If the verifier confirms a high proportion of these, that is a sign I did
not push far enough, not a sign I did well.

---

## 2. Method

### 2.1 I used the wave-1 geometry method, and it reproduced wave-1's answers exactly

The brief offered Nominatim reverse geocoding. The Trastevere finder found that it 429s at volume
and replaced it with local point-in-polygon against OSM boundary geometry. I used the geometry
method as primary **and** Nominatim as an independent second opinion at low volume, because with
18 straddlers I wanted two methods that could disagree.

1. Pulled boundary geometry for **all 22 rioni** from Overpass
   (`rel["boundary"="place"]["place"="quarter"]`, bbox `41.86,12.42,41.95,12.55`).
   All 22 returned, all 22 stitched to **exactly one clean closed ring** — no gaps, no
   multipolygon ambiguity.
2. Ray-casting point-in-polygon locally, testing **every vertex** of every candidate's geometry,
   so a building or street reports *all* the rioni it crosses rather than only the one its
   centroid lands in.
3. Trevi's own relation: **OSM r5452710**, `official_name` absent, `ref=R. II`,
   `wikidata=Q1584104`, `wikipedia=it:Trevi (rione di Roma)`.
   https://www.openstreetmap.org/relation/5452710

**Sanity check before trusting the polygon set** — the same 8 landmarks the Trastevere finder used,
all reproduced identically: Trevi Fountain→Trevi, Pantheon→Pigna, Piazza Navona→Parione,
Piazza Colonna→Colonna, Piazza di Spagna→Campo Marzio, Colosseum→Celio,
Santa Maria Maggiore→Monti, Largo di Torre Argentina→Pigna. The two methods agreeing with an
independent earlier run on 8/8 is the strongest evidence I have that the polygons are sound.

### 2.2 The cross-check: 79 key objects, two methods

I took the 79 most significant candidates, pulled exact OSM geometry for each, computed a
centroid, and reverse-geocoded that centroid through Nominatim
(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&zoom=18&addressdetails=1`), reading
the `quarter` field.

**Polygon and Nominatim agreed on 78 of 79.** The single disagreement is Via del Nazareno, a street
that *is* the Trevi/Colonna boundary — it is a straddler, not a method failure (§3.9).

This is a materially stronger result than the Trastevere finder got from Nominatim, and the reason
is volume: at ~80 lookups with a 1.2 s delay I saw **zero 429s**. The earlier finding stands for
corpus-scale runs; for a curated shortlist Nominatim is a usable second opinion, and the programme
should treat it that way rather than abandoning it.

### 2.3 A trap in Overpass output that silently cost me every relation

My first harvest used `out center geom tags;`. It returned **951 elements and not one relation** —
node 724, way 154, relation 0. That silently dropped the **Fontana di Trevi itself**
(`relation/13448560`), the **Palazzo del Quirinale** (`relation/2707110`), the **Basilica dei
Santi XII Apostoli** (`relation/2054912`), **Palazzo Colonna**, **Palazzo Barberini**, the
**Scuderie del Quirinale** and the **Museo delle Cere**. Re-running the identical query with
`out geom;` returned **1292 elements including 104 relations**.

> **Finding for the programme.** `out center geom tags` is accepted by Overpass and returns a
> plausible-looking result set with every multipolygon missing. In a rione whose marquee subject is
> a relation, that is a silent total loss of the headline place. Any wave using Overpass should use
> **`out geom;`** and should assert a non-zero relation count before trusting a harvest.

### 2.4 Reachability re-tested this session (raw `python3` + `urllib`, never WebFetch)

| Host | Result |
|---|---|
| `overpass-api.de` | 200 (rotated to `overpass.kumi.systems`, `overpass.private.coffee` under load) |
| `nominatim.openstreetmap.org` | 200, **no 429s at ~80 calls with 1.2 s spacing** |
| `it.wikipedia.org/w/api.php` | 200 raw wikitext; **429s in a tight loop** — needs ~3 s spacing |
| `www.sovraintendenzaroma.it` | 200, per-monument pages resolve, **and carry a `Rione:` field** (§2.5) |
| `fontanaditrevi.roma.it` | **200** — official Roma Capitale ticketing site for the fountain |
| `060608.comune.roma.it/it/scheda/<slug>` | 200 (`fontana-di-trevi`, `palazzo-del-quirinale` both resolve) |
| `www.turismoroma.it` | **200** — earlier research recorded 403; it answers a browser `User-Agent` |
| `www.scuderiequirinale.it`, `www.barberinicorsini.org`, `www.galleriacolonna.it`, `www.palazzovalentini.it`, `www.vicuscaprarius.com`, `www.teatroquirino.it`, `teatroservi.it`, `museodelcorso.com`, `www.cinemabarberini.it`, `www.unigre.it`, `www.chiesavaldese.org`, `www.acea.it` | 200 |
| `www.accademiasanluca.it` | 200 — **note the TLD**; `www.accademiasanluca.eu` fails TLS handshake |
| `whc.unesco.org/en/list/91/` | 200 |
| `www.vatican.va` Lateran Treaty full Italian text | 200 |
| `www.quirinale.it`, `palazzo.quirinale.it` | **403** — bot-blocked even with a browser UA. This is a problem: the Quirinal's own site is the only authority for visiting arrangements and I could not read it. **Unfinished work.** |
| `vincoliinrete.beniculturali.it` | **timeout — still unreachable** |
| `catalogo.beniculturali.it` | **timeout — still unreachable** |
| `dati.comune.roma.it` | 200 but only **2,469 bytes** — a stub/error page, not the data portal. Better than the earlier total timeout, still not usable. |
| `www.grafica.beniculturali.it` | DNS does not resolve (despite being the `website` tag on OSM way/131235448) |
| `www.biblicum.com`, `www.biblico.it` | 403 |
| `www.presbyterianchurchrome.org` | TLS cert verify failure; 200 with verification disabled |
| `www.museodellepaste.it` | DNS does not resolve (museum is closed — §8.2) |

**Ruling 1 is re-confirmed on fresh evidence.** Both per-property registers timed out again today.

### 2.5 Roma Capitale states the rione itself — the best evidence in this file

The Sovrintendenza Capitolina per-monument pages carry an explicit `Rione:` field, which is
Roma Capitale asserting the rione in its own voice. Better than OSM, better than Nominatim, better
than Wikipedia. For Trevi it gave me, verbatim:

| Page | Field |
|---|---|
| `.../fontane/fontana_di_trevi_mostra_dell_acqua_vergine` | **`Rione: Trevi`** |
| `.../fontane/fontana_di_monte_cavallo_in_piazza_del_quirinale` | **`Rione: Trevi`** |
| `.../roma_antica/monumenti/acquedotto_vergine` | **`Rione: II - Trevi`** |
| `.../fontane/fontana_in_piazza_colonna` (control) | `Rione: Colonna` |

**Note which two pages have no `Rione:` field at all: `fontana_del_tritone` and
`complesso_delle_quattro_fontane`.** Those are precisely the two Trevi fountain subjects that my
geometry flags as contested (§3.3, §3.11). Roma Capitale declining to state a rione on exactly the
two contested ones is either a coincidence or a signal, and the arbitrator should know it either way.

Index enumerated (all 200): `/i_luoghi/roma_medioevale_e_moderna/fontane` — 44 fountains, of which
4 are in or contested for Trevi.

---

## 3. THE 18 STRADDLERS — flagged, NOT resolved

`geom` = every rione the full geometry touches. `cent` = the rione the centroid falls in.
`nom` = Nominatim's `quarter` for the centroid.

### 3.1 Palazzo del Quirinale — **Monti + Trevi**
`relation/2707110` · geom `['Monti','Trevi']` · cent `Trevi` · nom `Trevi`.
The single biggest straddler in this wave. The palace complex crosses the Via del Quirinale line
that it.wikipedia gives as the Monti boundary (*"Monti: via del Quirinale, piazza del Quirinale,
via Ventiquattro Maggio, largo Magnanapoli"*,
https://it.wikipedia.org/wiki/Trevi_(rione_di_Roma)). Both methods put the bulk in Trevi and
it.wikipedia's Trevi article lists *"Palazzo del Quirinale, su piazza del Quirinale"* under Trevi's
civil architecture. **Monti is a wave-1 rione and its arbitrator cannot see this.** Monti's own
article does *not* claim the palace — it claims Palazzo della Consulta and Sant'Andrea al Quirinale
on the same square (https://it.wikipedia.org/wiki/Monti_(rione_di_Roma)), which is complementary
rather than conflicting. **Recommend Trevi, but do not let it land in two files.**

### 3.2 Piazza del Quirinale — **Monti + Trevi**
`way/516174441` · geom `['Monti','Trevi']` · cent `Trevi` · nom `Trevi`.
**it.wikipedia states the straddle outright**: *"Piazza del Quirinale è una piazza romana situata
fra Via del Quirinale e Via XXIV Maggio, **nei rioni I Monti e II Trevi**"*
(https://it.wikipedia.org/wiki/Piazza_del_Quirinale). An aggregator confirming my geometry
independently. Roma Capitale calls the fountain in it `Rione: Trevi` (§2.5) without ruling on the
square. The **Fontana dei Dioscuri** (`way/112795345`) and the **Obelisco del Quirinale**
(`way/135609691`) both sit wholly inside the Trevi part — they are clean even though their square
is not.

### 3.3 Piazza Barberini — **Colonna + Ludovisi + Trevi**
`way/1371637706` · geom `['Colonna','Ludovisi','Trevi']` · cent `Trevi` · nom `Trevi`.
A three-way. Colonna's own article names the square as its boundary with Trevi
(*"Trevi: piazza Barberini, via del Tritone, largo Chigi, piazza Colonna, via del Corso"*,
https://it.wikipedia.org/wiki/Colonna_(rione_di_Roma)) — **Colonna is in this wave**, so this one
is resolvable inside the wave. The **Fontana del Tritone** in the middle of it
(`way/662063745`) tests wholly in Trevi on both methods, and Roma Capitale's page for it declines
to state a rione (§2.5).

### 3.4 Piazza Venezia — **Campitelli + Pigna + Trevi** — TOUCHES THE WAVE-1 RESERVATION
`way/713360712` · geom `['Campitelli','Pigna','Trevi']` · cent `Trevi` · **nom `Pigna`**.
The only object in this file where my two methods disagree on the *primary* rione, and it is the
one that matters most. Three rioni across two waves: **Campitelli is wave 1**, Pigna and Trevi are
wave 2. Both it.wikipedia articles name it as their mutual boundary — Trevi's
(*"Pigna: piazza Venezia, via del Corso, piazza San Marcello"*) and Pigna's
(*"Trevi: via del Corso e piazza San Marcello, piazza Venezia"*) — and **Pigna's article
additionally lists Piazza Venezia as one of its own piazze**, which Trevi's does not.
**I am not taking it.** The Vittoriano is reserved to wave 1 and sits on this square; I confirmed
the Vittoriano itself (`relation/1849830`, "Altare della Patria") tests wholly in **Campitelli**,
so no reserved place is at risk of entering a Trevi file. Palazzo Venezia likewise is not in Trevi.

### 3.5 Piazza di San Claudio — **Colonna + Trevi**
`relation/11497565` · geom `['Colonna','Trevi']` · cent `Trevi` · nom `Trevi`.
The church on it, **Santi Claudio e Andrea dei Borgognoni** (`way/131235402`), tests wholly in
Trevi on both methods. The square does not. Intra-wave, resolvable.

### 3.6 Largo Chigi — **Colonna + Trevi**
`way/724036186` · geom `['Colonna','Trevi']` · cent `Colonna` · nom `Colonna`.
Named in Colonna's own boundary description. Both methods lean Colonna. Intra-wave.

### 3.7 Via del Corso — **Campo Marzio + Colonna + Pigna + Trevi**
`relation/6890532` · geom `['Campo Marzio','Colonna','Pigna','Trevi']` · cent `Colonna`.
A four-rione street and the exact "Piazza Colonna / Via del Corso line" the brief told me to watch.
It is the Trevi/Colonna boundary in Colonna's article and the Trevi/Pigna boundary in Pigna's.
No single rione can own it. Two Trevi-side buildings on it are clean, though:
**Palazzo Mancini** (`way/131235450`) and **San Marcello al Corso** (`way/52458908`), both wholly
Trevi on both methods.

### 3.8 Via delle Quattro Fontane — **Castro Pretorio + Trevi**
`way/77052546` · geom `['Castro Pretorio','Trevi']` · cent `Castro Pretorio` · nom `Castro Pretorio`.
Named in Castro Pretorio's article as its Trevi boundary
(*"il rione Trevi nel tratto Via delle Quattro Fontane-Via XX Settembre fino a Largo Santa Susanna"*,
https://it.wikipedia.org/wiki/Castro_Pretorio). Castro Pretorio is in neither wave.

### 3.9 Via del Nazareno and Largo del Nazareno — **Colonna + Trevi**
`way/366692688` (Via) · geom `['Colonna']` · cent `Trevi` · **nom `Trevi`** — *the one method
disagreement in the 79-object cross-check*, and it is a boundary street, so both readings are
defensible. `way/190022904` (Largo) · geom `['Colonna']` · cent `Trevi` · nom `Colonna`.
**This drags the Aqua Virgo arches with it — see §3.10.**

### 3.10 The visible Aqua Virgo arches at Via del Nazareno — **Trevi/Colonna, and the sources fight**
`way/1390965274` ("Acquedotto Vergine", `historic=ruins`, `wikidata=Q600139`).
- My polygon test: **wholly Trevi**.
- Nominatim on its western end (41.902692, 12.483761): **`quarter=Trevi`**, `name=Acquedotto Vergine`.
- Nominatim 30 m east (41.90258, 12.48405): **`quarter=Colonna`**.
- **Roma Capitale says `Rione: II - Trevi`**
  (https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/acquedotto_vergine).
- **it.wikipedia's own image caption on the Aqua Virgo article says the opposite**:
  *"Colonna - arcate Acqua Vergine a via del Nazzareno"* (https://it.wikipedia.org/wiki/Aqua_Virgo).

Roma Capitale's explicit statement should outweigh a Wikipedia file caption, but the arches
physically sit on the line and the arbitrator should rule rather than let both rioni take it.

### 3.11 Le Quattro Fontane — **Trevi + Monti**, and 3 of the 4 corners are in Monti
The four corner fountains of the Strada Pia / Strada Felice crossing. Roma Capitale treats them as
one object, `complesso_delle_quattro_fontane`, *"Domenico Fontana (attr.), Pietro Berrettini da
Cortona, 1588-1593, 1667-69"*, **with no `Rione:` field**. Corner-by-corner:

| Corner | polygon | Nominatim |
|---|---|---|
| NW | **Trevi** | Monti |
| NE | Monti | Monti |
| SW | Monti | Monti |
| SE | Monti | Monti |

it.wikipedia lists *"Le Quattro Fontane"* under **Trevi**'s monuments; Monti's article claims the
two churches on the crossing (**San Carlo alle Quattro Fontane**, **Santi Gioacchino e Anna**),
both of which I confirm are wholly in **Monti** and neither of which I take. **Monti is wave 1.**
On the evidence the fountain complex leans Monti and Trevi's own Wikipedia list over-claims it.

### 3.12 Via Venti Settembre — **Castro Pretorio + Sallustiano + Trevi**
`relation/6598408`. Three-way; neither of the other two is in either wave.

### 3.13–3.15 Three places it.wikipedia assigns to Trevi that **both my methods put elsewhere**

These are not straddlers so much as **over-claims in Trevi's own Wikipedia article**, and they are
the clearest evidence in this file that the article's lists cannot be trusted as a roster.

| Place | Trevi's article says | polygon | Nominatim | Corroboration |
|---|---|---|---|---|
| **Galleria Alberto Sordi** | listed under Trevi's *Strade* | Colonna | Colonna | **Colonna's article claims it explicitly**: *"Galleria Alberto Sordi (già Galleria Colonna), su via del Corso"* |
| **Piazza di San Silvestro** | listed under Trevi's *Piazze* | Colonna | Colonna | — |
| **Piazza San Bernardo** | listed under Trevi's *Piazze* | Castro Pretorio | Castro Pretorio | Monti's article claims *San Bernardo della Compagnia*; Castro Pretorio's claims *San Bernardo alle Terme* |

**Recommend Trevi drops all three.** Colonna is in this wave and should take the Galleria and
Piazza di San Silvestro if it wants them.

### 3.16 Palazzo del Bufalo alle Fratte — text says Trevi, geometry says Colonna
it.wikipedia: *"si trova in Largo del Nazareno e lungo via Del Bufalo, **nel rione Trevi**"*,
built 1620–1630 by Francesco Peparelli for the del Bufalo family
(https://it.wikipedia.org/wiki/Palazzo_del_Bufalo_alle_Fratte). But Largo del Nazareno tests
**Colonna** (§3.9), and the **Fontana del Bufalo** (`node/495048559`) tests **Colonna** on
polygon. Contested Trevi/Colonna, intra-wave.

### 3.17 Resti di Mura Serviane at Largo Magnanapoli — Trevi by both methods, on the Monti line
`way/427413247` · geom `['Trevi']` · nom `Trevi`. Clean on the evidence, but Largo Magnanapoli is
named in **both** rioni's articles as the Trevi/Monti boundary, and **Monti is wave 1**. Flagging
because a Monti finder looking at the same segment of the Servian Wall would have an arguable case.

### 3.18 The Trajan's-Forum edge group — clean in Trevi, but abutting reserved wave-1 ground
**Not straddlers by geometry** — all four test wholly in Trevi on *both* methods — but every one of
them sits directly against **Trajan's Forum, Trajan's Column and Trajan's Market, which are
reserved to wave 1**, and three carry `addr:street=Foro Traiano`:

| Place | OSM | polygon | Nominatim |
|---|---|---|---|
| Santa Maria di Loreto | `way/140031975` | Trevi | Trevi |
| Santissimo Nome di Maria al Foro Traiano | `relation/1892863` | Trevi | Trevi |
| Palazzo Valentini + Domus Romane | `relation/1892857`, `node/4798279227` | Trevi | Trevi |
| Auditoria di Adriano (Athenaeum) | `relation/19906545` | Trevi | Trevi |

**I am taking none of the reserved places.** But a wave-1 Monti or Campitelli finder writing up
the Imperial Fora will very plausibly sweep these four in as part of the ensemble, and that would
put the same place in two seed files. **This is the highest-risk collision in this file after
Piazza Venezia**, and the arbitrator should look for it explicitly.

---

## 4. Candidates — the strong core

Every rione assignment below is **polygon + Nominatim, both agreeing, wholly inside Trevi**, unless
the row says otherwise. Photos omitted per Ruling 3.

### 4.1 The Trevi Fountain — Fontana di Trevi
- **Kind:** monumental fountain / *mostra* (terminal display) of the Acqua Vergine aqueduct.
- **Address:** Piazza di Trevi. OSM `relation/13448560`; the square is `relation/13448561`.
- **Rione:** **Roma Capitale states `Rione: Trevi`** —
  https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_di_trevi_mostra_dell_acqua_vergine
- **What it is / who / when:** Roma Capitale, same page: *Autore: Nicola Salvi, Giuseppe Pannini;
  Datazione: 1732-1762*. It.wikipedia adds that the commission followed a competition called in
  **1731 by Pope Clement XII**, that work began in **1732**, that it passed in **1759** to Pietro
  Bracci assisted by his son Virginio, and that it was **inaugurated in 1762**; and that the
  fountain is built against the façade of **Palazzo Poli**
  (https://it.wikipedia.org/wiki/Fontana_di_Trevi). Materials per the same article: travertine,
  marble, plaster, stucco, various metals.
- **Restoration history, from Roma Capitale itself** (publishable, well sourced, and unusually
  specific): restoration **1989–1991**; maintenance of the central section **1999**; a major
  restoration funded by **FENDI** beginning **2014** and completed after seventeen months in
  **2015**, inaugurated **3 November**; and a maintenance intervention **October–December 2024**
  under the *PNRR – Caput Mundi* programme (*Manutenzione straordinaria di alcune fontane
  monumentali del Centro Storico di Roma, n. 323*).
- **Current visiting arrangements — the single most perishable and most useful fact in this file.**
  Roma Capitale, same page: access to the **inner perimeter** of the fountain is now **capped at
  about 400 people at a time**, **entry by the central staircase and exit by the gate on the
  via dei Crociferi side**, and it is **ticketed at €2,00 for tourists and non-residents of Rome
  and the Città Metropolitana**, charged **09:00–22:00** including the first Sunday of the month.
  Free for: residents of Rome and the Città Metropolitana on production of an identity card;
  Roma MIC Card holders; disabled visitors and one companion; licensed tour guides on production of
  a valid badge; and children up to 5. **After the 22:00 daily closure the fountain remains
  visible free of charge to everyone.** Roma Capitale directs hours to its own dedicated site,
  **fontanaditrevi.roma.it**, which I confirmed returns 200.
- **Verifier note:** a ticketed Trevi Fountain will read as wrong to anyone whose mental model is
  older than 2025. It is Roma Capitale's own page. Do not let it get edited out.
- **Do NOT write:** any protection status; "the most famous fountain in the world"; the coin-throwing
  revenue figure (I did not source one); any walking time from anywhere.

### 4.2 Palazzo del Quirinale — **STRADDLER, see §3.1**
- **Kind:** palace; official residence of the President of the Italian Republic.
- **Address:** Piazza del Quirinale. OSM `relation/2707110`.
- **When / who:** it.wikipedia infobox: *periodo costruzione 1573–1583*; architects listed as
  **Ottaviano Mascherino, Gian Lorenzo Bernini, Ferdinando Fuga, Domenico Fontana**; owner
  *Stato italiano* (https://it.wikipedia.org/wiki/Palazzo_del_Quirinale). The Piazza del Quirinale
  article gives a slightly different construction span and attribution — *"costruito negli anni
  1573–1585 da Martino Longhi il Vecchio e poi (1578) da Ottaviano Mascherino"*, later enlarged by
  *Fontana, Ponzio, Maderno e Bernini*. **The two Wikipedia articles disagree on both dates and
  first architect; do not state either as settled.**
- **Use, sourced:** papal residence **1605–1870**; royal residence **1871–1946**; presidential
  residence since (it.wikipedia infobox). The article ties the change to the **presa di Roma of
  20 September 1870** and the **referendum of 2 June 1946**.
- **Unfinished work:** `quirinale.it` and `palazzo.quirinale.it` both **403** from here. I have
  **no** source for visiting arrangements, ticketing or opening days, and the corpus must not
  invent them. `060608.comune.roma.it/it/scheda/palazzo-del-quirinale` returns 200 and is the
  obvious next fetch.

### 4.3 Piazza del Quirinale, the Dioscuri and the obelisk
- **Piazza del Quirinale** — `way/516174441`. **STRADDLER, Monti + Trevi (§3.2).** Known until the
  19th century as **Piazza di Monte Cavallo** (https://it.wikipedia.org/wiki/Piazza_del_Quirinale).
- **Fontana dei Dioscuri / Fontana di Monte Cavallo** — `way/112795345`, wholly Trevi both methods.
  **Roma Capitale states `Rione: Trevi`** and attributes it *Autore: Giacomo della Porta;
  Raffaele Stern. Datazione: 1589; 1818. Materiali: granito, marmo*
  (https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_di_monte_cavallo_in_piazza_del_quirinale).
  **Source conflict:** it.wikipedia credits the fountain to **Domenico Fontana** under Sixtus V
  after the 1587 completion of the Acqua Felice (https://it.wikipedia.org/wiki/Fontana_dei_Dioscuri).
  **Prefer Roma Capitale; do not state a single architect without flagging the disagreement.**
  The Dioscuri group itself came from the nearby **Terme di Costantino** (both sources agree).
- **Obelisco del Quirinale** — `way/135609691`, wholly Trevi. it.wikipedia: red Aswan granite,
  **14.63 m** high, **28.94 m** with its base; brought to Rome in the 1st century AD, probably
  under Domitian; originally at the entrance to the **Mausoleum of Augustus** with the Esquiline
  obelisk; found in **1527**, erected here only in **1786** under **Pius VI** by the architect
  **Giovanni Antinori** (https://it.wikipedia.org/wiki/Obelisco_del_Quirinale). It has no
  hieroglyphic inscriptions.
- **Giardini del Quirinale** — `way/201506665`, wholly Trevi, `wikidata=Q55831685`.

### 4.4 Santi Vincenzo e Anastasio a Trevi
- **Kind:** Catholic church. `way/201721148`, `wikidata=Q2313394`. Wholly Trevi, both methods.
- **Address:** Piazza di Trevi, immediately beside the fountain.
- **When:** it.wikipedia infobox *InizioCostr 1644, FineCostr 1650*; rebuilt in Baroque form at the
  order of **Cardinal Mazarin**; known as *Sant'Anastasio de Trivio* as a medieval church and under
  the present double dedication **from 1570**
  (https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Vincenzo_e_Anastasio_a_Trevi).
- **The hook:** it held the office of *parrocchia pontificia* because the Quirinal, the papal
  residence, stood in the parish; and it preserves the **precordia** (organs removed during
  embalming) of popes — the same source says **22 popes, from Sixtus V to Leo XIII**, and states
  they are **not on display to the faithful**. Belli's nickname for it, quoted there:
  *"un museo de corate e de ciorcelli"*. Its popular name was *il canneto*, for the **18 columns**
  on its façade.
- **Careful:** "the church where the popes' hearts are kept" is the kind of line a guide reaches
  for. The source says precordia, not hearts, and says they are not exhibited.

### 4.5 Accademia Nazionale di San Luca, in Palazzo Carpegna
- **Kind:** academy of artists, with a gallery. `node/7012887885` (POI) and `way/201723068`
  (Palazzo Carpegna). Both wholly Trevi, both methods.
- **Address:** **Piazza dell'Accademia di San Luca 77** (it.wikipedia infobox and the OSM
  `addr:housenumber`, agreeing). OSM `opening_hours=Mo-Sa 09:00-18:00` — **OSM, not the institution;
  attribute or re-source before publishing hours.**
- **Official site:** `https://www.accademiasanluca.it/` returns 200. **`accademiasanluca.eu` fails
  TLS** — the `.eu` is the wrong host, worth recording so nobody retries it.
- **Institution:** it.wikipedia dates the transformation from the older *Universitas* of painters,
  illuminators and embroiderers into an academy to **1577 under Gregory XIII**, and gives the
  foundation proper as **1593 by Federico Zuccari**, its first *Principe*
  (https://it.wikipedia.org/wiki/Accademia_nazionale_di_San_Luca). Note the infobox says
  *Fondazione 1577* while the lead says 1593 — **the article contradicts itself; do not state a
  single founding year without saying which.**
- **Building:** Palazzo Carpegna, built late 16th–first half 17th century by a pupil of Giacomo
  della Porta for the **Vaini of Imola**; bought c. 1630 by **Count Ambrogio di Carpegna**, who
  commissioned **Francesco Borromini** for major enlargement and remodelling; completed under
  **Francesco Ferrari, 1732–1736**; **seat of the Accademia since 1934**
  (https://it.wikipedia.org/wiki/Palazzo_Carpegna).

### 4.6 Galleria Sciarra
- **Kind:** covered pedestrian courtyard, private but open to the public in office hours.
  `way/203858795` (`highway=pedestrian`). Wholly Trevi, both methods.
- **Address:** it.wikipedia infobox gives *Via di Santa Maria in Via 30-31 / Piazza dell'Oratorio*;
  the article text gives the entrances as **Via Marco Minghetti and Piazza dell'Oratorio**.
  **The infobox and the body disagree on the street; source the address again before publishing.**
- **When / who:** **1886–1888**, architect **Giulio De Angelis**, commissioned by
  **Prince Maffeo Sciarra**, style given as *Umberto I*, current use offices
  (https://it.wikipedia.org/wiki/Galleria_Sciarra).
- **Do NOT write:** it.wikipedia calls it *"un luogo poco visitato e conosciuto solo dai turisti
  più attenti"* and describes it as one of Rome's few Liberty works. **The first is an unsourceable
  impression and the second is a superlative** — both are exactly what the corpus rules exclude.
  Write the date, the architect, the patron and the fact that it is a covered passage.

### 4.7 The Acqua Vergine / Aqua Virgo — **arches contested, see §3.10**
- **Kind:** Roman aqueduct, still in use; the Trevi Fountain is its terminal *mostra*.
- **Roma Capitale, in its own words**: *"L'Acquedotto Vergine (Aqua Virgo) è l'unico degli undici
  principali acquedotti di Roma antica rimasto ininterrottamente in funzione sino ai nostri giorni
  alimentando le monumentali fontane della città barocca, tra cui Fontana di Trevi. Proprio la
  Fontana di Trevi, in età moderna, ne rappresenta la mostra terminale."* Inaugurated **19 BC by
  Agrippa**; sources in the *Agro Lucullano* at the eighth mile of the Via Collatina, at Salone;
  **over 20 km**, mostly underground; `Rione: II - Trevi`
  (https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/acquedotto_vergine).
- The same page carries the **Claudian inscription of AD 46** in full Latin with an Italian
  translation, recording the rebuilding of arches damaged *per C. Caesarem* (Caligula) — a strong,
  quotable primary text from a municipal source.
- it.wikipedia gives the length as **20.5 km** and dates the inauguration to **9 June 19 BC**
  (https://it.wikipedia.org/wiki/Aqua_Virgo). Roma Capitale says "over 20 km"; the two are
  compatible but not identical — **do not present 20.5 km as Roma Capitale's figure.**
- **Visible remains in Trevi:** `way/1390965274` at Via del Nazareno. **Contested with Colonna
  (§3.10).** Roma Capitale also notes two further travertine arches *"al di sotto di Palazzo
  Sciarra, presso via del Corso"* — **that is Palazzo Sciarra on Via del Corso, which tests in
  Pigna, not the Palazzo Sciarra Colonna di Carbognano that is in Trevi.** Two different
  buildings with confusable names; see §8.1.

### 4.8 Vicus Caprarius — "La Città dell'Acqua"
- **Kind:** underground archaeological area, open to visitors. `node/6908586063`. Wholly Trevi.
- **Official site:** `https://www.vicuscaprarius.com` — 200.
- **OSM `opening_hours=Tu-Fr 11:00-17:30, Sa-Su 11:00-19:00`** — **OSM, not the site. Re-source
  from vicuscaprarius.com before publishing hours.**
- **What it is:** it.wikipedia's Trevi article describes excavation at the end of the 1990s during
  consolidation work on buildings near the fountain, revealing an **insula of Neronian date**
  fronting the *Vicus Caprarius*, partly converted in the mid-**4th century** into a patrician
  *domus* and partly into a large **cistern collecting the Acqua Vergine**, with remains of
  **12th- and 13th-century** buildings above; and it links the surviving medieval portico on the
  side of the square opposite the fountain to that phase
  (https://it.wikipedia.org/wiki/Trevi_(rione_di_Roma)).

### 4.9 Palazzo Poli
- `way/131235596`, `wikidata=Q3890694`. Wholly Trevi, both methods. **The building the Trevi
  Fountain is built against** — sourced from the Fontana di Trevi article, §4.1. it.wikipedia's own
  *Palazzo Poli* article is a 357-byte stub and carries essentially nothing; **the palazzo is
  under-sourced on its own and is best written as part of the fountain.**

### 4.10 Palazzo Colonna and the Galleria Colonna
- `relation/2054909` (palazzo), `node/1649776329` (gallery POI), `relation/2054914` (Villa Colonna).
  All wholly Trevi, both methods.
- **Address:** Via della Pilotta 17 (OSM `addr:street`/`addr:housenumber`).
- **Official site:** `https://www.galleriacolonna.it/` — 200. OSM carries
  `opening_hours=Sa 09:00-13:15`, which matches the gallery's long-standing Saturday-only pattern
  but **is OSM, not the institution — re-source it from galleriacolonna.it.**

### 4.11 Basilica dei Santi XII Apostoli — **and the Art. 14/15/16 trap, see §5**
- `relation/2054912`, `wikidata=Q1515300`, `building=basilica`. Wholly Trevi, both methods.
- On Piazza dei Santi Apostoli (`way/32454221`, wholly Trevi).

### 4.12 Scuderie del Quirinale
- `relation/2054913`, `wikidata=Q26840128`. Wholly Trevi, both methods.
- **Address:** Via Ventiquattro Maggio 16 (OSM). **Official site:**
  `https://www.scuderiequirinale.it/` — 200.
- OSM carries `start_date=1730`, `architect=Ferdinando Fuga`. **Treat as a lead, not a source** —
  OSM tags are crowd-sourced. it.wikipedia's article on the Scuderie is fetched and available for
  the verifier to confirm against.

### 4.13 Palazzo Barberini and the Gallerie Nazionali d'Arte Antica
- `relation/2716050` (palazzo, `wikidata=Q1136614`), `node/2122709063` (gallery POI).
  **Both wholly Trevi on both methods** — and this corrects an error I made early on: a coarse
  hand-typed coordinate put Palazzo Barberini in Colonna, and the actual building relation does
  not. it.wikipedia's Trevi article lists *"Palazzo Barberini, su via Quattro Fontane"* under Trevi.
  Its **square** is a three-way straddler (§3.3); the **palace** is not.
- **Address:** Via delle Quattro Fontane 13 (OSM). **Official site:**
  `https://www.barberinicorsini.org` — 200.
- **Giardini di Palazzo Barberini** `way/201592884` — wholly Trevi.
- **Mitreo Barberini** `node/9244137967`, `wikidata=Q3859475` — wholly Trevi, both methods.
  OSM records `start_date=C2` and access `Sa [2,4] 10:00-13:00; "by appointment"`. **The OSM
  `website` tag points at `soprintendenzaspecialeroma.it/schede/mitreo-barberini_2980/`, which
  404s.** The mithraeum is real and notable; the citable source for its access is not yet found.

### 4.14 Domus Romane di Palazzo Valentini — **see §3.18**
- `node/4798279227` (museum), `relation/1892857` (palazzo, `wikidata=Q751105`). Wholly Trevi.
- **Address:** Foro Traiano 85. **Official site:** `https://www.palazzovalentini.it/` — 200.
- OSM `opening_hours=We-Mo 09:30-18:30` — re-source from the official site.
- Palazzo Valentini is also the seat of the **Città metropolitana di Roma Capitale** and the
  **Prefettura di Roma** (`node/10844266259`, `node/10844266260`, both wholly Trevi).

---

## 5. THE LATERAN TREATY IN TREVI — the brief's expectation is wrong, and the Art. 15/16 trap bites hardest here

The brief states that of the four wave-2 rioni, *"three of the four rioni hold one"* extraterritorial
property — Parione, Colonna and Pigna — implying **Trevi holds none**. That is not what the Treaty
text says. I read the full Italian text at
https://www.vatican.va/roman_curia/secretariat_state/archivio/documents/rc_seg-st_19290211_patti-lateranensi_it.html
(HTTP 200) rather than any summary of it.

### 5.1 Art. 15 names the **Palazzo della Dataria**, and the Palazzo della Dataria is in Trevi

Art. 15, verbatim: *"Gli immobili indicati nell'art. 13 e negli alinea primo e secondo dell'art. 14,
**nonché i palazzi della Dataria**, della Cancelleria, di Propaganda Fide in Piazza di Spagna, il
palazzo del Sant'Offizio ed adiacenze, quello dei Convertendi … in piazza Scossacavalli, il palazzo
del Vicariato … godranno delle immunità riconosciute dal diritto internazionale alle sedi degli
agenti diplomatici di Stati esteri."*

The **Palazzo della Dataria Apostolica** is at **Via della Dataria**, and it is in Trevi:
- **it.wikipedia states the rione outright**: *"è un palazzo di Roma che si trova in via della
  Dataria, **nel rione Trevi**, accanto al Palazzo della Panetteria e di fronte al Palazzo di San
  Felice"* (https://it.wikipedia.org/wiki/Palazzo_della_Dataria).
- **My geometry agrees**: OSM `way/202158195`, wholly Trevi on the polygon test, and Nominatim
  returns `quarter=Trevi` for its centroid.

**So Trevi does hold an Art. 15 property.** The brief's list is incomplete and the arbitrator
should not rely on it as exhaustive for any rione.

### 5.2 …but the same source says it was **sold in 1973**, so its status today is NOT established

it.wikipedia, same article: the palace *"nei Patti Lateranensi (1929) fu assegnato alla Santa Sede
e fu venduto, **nel 1973, all'ANSA** per 2 500 000 dollari"*, and the infobox gives
`proprietario = ANSA`. History: originally the *Tribunale dei Benefici*, late-16th-century, owned by
**Cardinal Orazio Maffei**; passed to the Camera Apostolica on his death in **1609**; seat of the
**Dataria Apostolica from 1625**; remodelled under **Paul V**; **completely rebuilt in 1860 under
Pius IX by the architect Andrea Busiri Vici**.

> **What the corpus may say:** that the Lateran Treaty's Article 15 names the Palazzo della Dataria
> among the buildings granted the immunities of the headquarters of diplomatic agents of foreign
> states, on Italian soil; and that it.wikipedia reports the building was sold in 1973 and gives
> ANSA as its owner.
> **What the corpus may NOT say:** that it is extraterritorial *today*, that it is "in the
> Vatican", that it is Vatican territory, or that it is a border of any kind. Article 15 grants a
> diplomatic-headquarters immunity on Italian soil; visitors there follow Italian law. A property
> sold out of Holy See ownership half a century ago cannot be asserted to still carry it, and I
> found no source that resolves the question either way. **Flagging this as genuinely unresolved
> rather than guessing is the right output.**

### 5.3 The Art. 14 / Art. 15 / Art. 16 three-way trap, and Trevi contains all three tiers

This is the conflation the brief warns about, and Trevi is where it is easiest to get wrong.

**Art. 14, third *alinea*** transfers to the Holy See in full ownership *"gli edifici ex-conventuali
in Roma **annessi alla Basilica dei Santi XII Apostoli** ed alle chiese di Sant'Andrea della Valle e
di San Carlo ai Catinari"*.

**Art. 15 grants its immunity only to** *"gli immobili indicati nell'art. 13 e negli **alinea primo
e secondo** dell'art. 14"*, plus the named palaces. **The SS XII Apostoli transfer is in the THIRD
alinea of Art. 14.** It is therefore **outside Art. 15 entirely**.

**Art. 16** then covers *"gli immobili indicati nei tre articoli precedenti"* — 13, 14 and 15 — plus
a separate list of pontifical institutes, granting them only **exemption from expropriation for
public utility and from ordinary and extraordinary taxation**. That is a tax and expropriation
exemption. **It is not extraterritoriality and it is not immunity.**

Art. 16's own institute list names **"Università Gregoriana, Istituto Biblico"** — and both are in
Trevi:

| Place | OSM | Rione (polygon + Nominatim) | Treaty tier |
|---|---|---|---|
| **Palazzo della Dataria** | `way/202158195` | Trevi | **Art. 15** (immunity), but see §5.2 |
| ex-conventual buildings annexed to **Basilica dei Santi XII Apostoli** | `relation/2054912` | Trevi | **Art. 14 third alinea → Art. 16 only.** *Not* Art. 15. |
| **Pontificia Università Gregoriana**, Piazza della Pilotta 4 | `way/53182757` | Trevi | **Art. 16 only** |
| **Pontificio Istituto Biblico** | `node/2175094020` | Trevi | **Art. 16 only** |

> **Instruction to the verifier.** Any sentence that calls the Gregoriana, the Biblicum or the
> Santi XII Apostoli convent buildings "extraterritorial" is **wrong on the face of the Treaty
> text**, not merely unsourced. The distinction is legible in the article numbering and I have
> quoted the operative clauses above. None of these four is in Vatican City; none is a border; all
> stand on Italian soil in rione Trevi and are written up under Trevi.

`www.unigre.it` returns 200. `www.biblicum.com` and `www.biblico.it` both 403 from here.

---

## 6. The rest of the candidate list

Rione column is polygon + Nominatim agreeing on Trevi unless noted. Straddlers cross-referenced.

### 6.1 Churches and oratories (23)

| Place | OSM | Note / source |
|---|---|---|
| Santi Vincenzo e Anastasio a Trevi | `way/201721148` | §4.4 — **strong** |
| Basilica dei Santi XII Apostoli | `relation/2054912` | §4.11, §5.3 — **strong** |
| San Marcello al Corso | `way/52458908` | Piazza di San Marcello; `wikidata=Q972881` |
| Santa Maria in Via | `way/60616315` | `wikidata=Q1785234` |
| Santa Maria in Trivio | `node/279379894` | `wikidata=Q1423813`; only an **en**-wiki link in OSM |
| Santa Maria di Loreto | `way/140031975` | **§3.18 collision risk.** OSM `start_date=1507`, `architect=Antonio da Sangallo il Giovane` — *tags, not a source* |
| Santissimo Nome di Maria al Foro Traiano | `relation/1892863` | **§3.18.** Foro Traiano 89; OSM `opening_hours=Tu-Su 10:00-12:30,17:00-19:30` |
| Santi Claudio e Andrea dei Borgognoni | `way/131235402` | Piazza di San Claudio (**square straddles, §3.5**) |
| Santa Rita da Cascia alle Vergini | `way/131235669` | `wikidata=Q3585441` |
| Santa Croce e San Bonaventura dei Lucchesi | `way/202161466` | `wikidata=Q2222865` |
| Santa Maria del Carmine alle Tre Cannelle | `relation/2054911` | `wikidata=Q3585427` |
| San Silvestro al Quirinale | `way/204998147` | `wikidata=Q1538594` |
| Oratorio del Crocifisso | `way/131235435` | `wikidata=Q1165020` |
| Oratorio del Santissimo Sacramento al Tritone | `way/60616323` | Piazza Poli 11; `wikidata=Q3884473` |
| Santa Susanna alle Terme di Diocleziano | `way/52251976` | **Both methods Trevi**, and Nominatim returns `quarter=Trevi` for Largo di Santa Susanna itself — even though Trevi's article names that largo as the *Sallustiano* boundary. OSM `opening_hours=closed`. Sallustiano's article claims Palazzo Canevari on the same largo, not the church |
| San Nicola da Tolentino | `way/203944603` | `denomination=armenian_catholic`; `wikidata=Q1097292` |
| San Basilio agli Orti Sallustiani | `way/203944602` | `wikidata=Q3669578` |
| Saint Andrew's Church of Scotland | `way/334298311` | Via XX Settembre 7; site 200 only with TLS verification disabled |
| **Chiesa evangelica valdese in Trevi** | *not in OSM under this name* | **OSM miss.** it.wikipedia: on **via Quattro Novembre**, *nel rione Trevi*; **1883–1884**, architect **Benedetto Andolfi**; neo-Romanesque exterior, neo-Renaissance interior; the article explicitly distinguishes it from the Waldensian church in Piazza Cavour, **rione Prati** — and I confirm OSM's "Chiesa Evangelica Valdese" `way/358538665` is the **Prati** one. Easy place to publish the wrong church |
| **Cappella della Madonna dell'Archetto** | *not in OSM* | **OSM miss.** it.wikipedia: *"nel rione Trevi, in Via di San Marcello 41b"*; official name *Santa Maria Causa Nostrae Laetitiae*; built for an image painted on majolica in **1690 by Domenico Maria Muratori**; **inaugurated and opened to the public 31 May 1851** |
| Cappella della Madonna del Pozzo | `way/447999165` | thin — OSM only, no wiki, no site |
| Chiesa di San Giovanni della Ficozza | *deconsecrated* | it.wikipedia article exists; listed under Trevi's *Sconsacrate* |
| Chiesa di Sant'Andrea degli Scozzesi | *deconsecrated* | it.wikipedia article exists; listed under Trevi's *Sconsacrate* |

### 6.2 Palazzi (24)

Palazzo del Quirinale (§4.2, **straddler**), Palazzo Barberini (§4.13), Palazzo Colonna (§4.10),
Palazzo Poli (§4.9), Palazzo Carpegna (§4.5), Palazzo della Dataria (§5.1), Palazzo Valentini
(§4.14) are covered above. The remainder, all wholly Trevi on both methods:

| Place | OSM | Note |
|---|---|---|
| Palazzo Chigi-Odescalchi | `relation/2054910` (OSM name "Palazzo Odescalchi") | Piazza Santi Apostoli; it.wikipedia: originally Colonna, sold to the Ludovisi in **1622** and bought back; ceded in usufruct to **Cardinal Flavio Chigi in 1661** and transformed by **Gian Lorenzo Bernini, c. 1665**; passed to Prince **Baldassare Odescalchi in 1745**; architects listed Bernini, **Nicola Salvi**, **Luigi Vanvitelli**. **Do not confuse with Palazzo Chigi on Piazza Colonna, which is in Colonna** |
| Palazzo Sciarra Colonna di Carbognano | `relation/1764095` | `wikidata=Q56650659`. **Not the same building as Palazzo Sciarra on Via del Corso, which is in Pigna — §8.1** |
| Palazzo della Panetteria | `way/…` (mapped as part of the Quirinale complex) | it.wikipedia: Via della Dataria, *nel rione Trevi*, between the Palazzo della Dataria and the Palazzo del Quirinale; official name *Palazzo della Famiglia Pontificia*; built by **Paolo Posi, 1764–1766**; reached from the Quirinale through the **Torre di Urbano VIII** (Swiss Guard tower); rebuilt under **Clement XIII**; now an annexe of the Quirinale. **The infobox says commissioned by Paul V, which cannot be right for a 1764 building — the article contradicts itself; do not repeat the patron** |
| Palazzo di San Felice | — | it.wikipedia: Via della Dataria, opposite the Palazzo della Dataria |
| Palazzo Mancini | `way/131235450` | Via del Corso; `wikidata=Q3360896` |
| Palazzo Baracchini | `relation/4718958` | Via XX Settembre; `wikidata=Q60059450`. it.wikipedia (Trevi article): **1876–83**, architect **Giulio Podesti**, seat of the **Ministero della difesa** |
| Palazzo della Stamperia (OSM) / Palazzo Cornaro (wiki) | `way/131235588` | `wikidata=Q20088658`. **Name conflict between OSM and Wikipedia — resolve before publishing** |
| Palazzo Scanderbeg | `way/198947251` | now a hotel; `wikidata=Q129150`; site 200 |
| Palazzo Salviati-Mellini | `way/109472622` | Via del Corso / Piazza di San Marcello |
| Palazzo Volpi (Galloppi) | `way/202323987` | `wikidata=Q56643009`; Via del Quirinale |
| Palazzo Moroni a Trevi | `relation/2707972` | Salita di San Nicola da Tolentino |
| Villa Savorgnan di Brazzà | `way/201588732` | `wikidata=Q56654982`; Salita di San Nicola da Tolentino |
| Palazzo del Bufalo alle Fratte | — | **CONTESTED, §3.16.** it.wikipedia: **1620–1630**, architect **Francesco Peparelli**, for the del Bufalo family |
| Palazzo Muti Papazzurri (Balestra) | — | it.wikipedia article exists; Piazza della Pilotta. The Madonna dell'Archetto article calls it *palazzo Savorelli Muti Papazzurri, un tempo palazzo Balestra* — three names for one building |
| Palazzo Mengarini | — | Via Ventiquattro Maggio; it.wikipedia article exists |
| Palazzo Guglielmi Gori | — | Piazza dei Santi Apostoli |
| Palazzo Riario Della Rovere | — | Piazza dei Santi Apostoli |
| Palazzo del Tritone | — | Via del Tritone |
| Palazzo Gentili del Drago | — | Via in Arcione. **it.wikipedia article MISSING** — Trevi's rione article links it but the target does not exist |
| Villa Colonna | `relation/2054914` | garden of Palazzo Colonna, `leisure=park` |
| Agenzia del Demanio building | `way/334305167` | `wikidata=Q392936` |
| Rappresentanza in Italia della Commissione europea | `relation/2057842` | Via Quattro Novembre 149 |
| Collegium Germanicum et Hungaricum | `way/334674330` | Via di San Nicola da Tolentino 13; `wikidata=Q868294` |
| Pontificio Collegio Armeno | `relation/4772638` | Salita di San Nicola da Tolentino 17; `wikidata=Q1377062` |

### 6.3 Museums, galleries and cultural institutions (12)

| Place | OSM | Note |
|---|---|---|
| Gallerie Nazionali d'Arte Antica, Palazzo Barberini | `node/2122709063` | §4.13; `barberinicorsini.org` 200 |
| Galleria Colonna | `node/1649776329` | §4.10; `galleriacolonna.it` 200 |
| Accademia Nazionale di San Luca | `node/7012887885` | §4.5; **`accademiasanluca.it`, not `.eu`** |
| Domus Romane di Palazzo Valentini | `node/4798279227` | §4.14; **§3.18 collision risk** |
| Scuderie del Quirinale | `relation/2054913` | §4.12 |
| Vicus Caprarius — La Città dell'Acqua | `node/6908586063` | §4.8 |
| Istituto Centrale per la Grafica | `way/131235448` | Via della Stamperia 6, `operator=MIC`. **Its OSM `website` host `grafica.beniculturali.it` does not resolve in DNS** — needs a current URL |
| Museo del Corso | `node/12376449856` | Via Marco Minghetti 22, `operator=Fondazione Roma`; site 200. OSM `opening_hours` encodes a **2024-11-30 → 2025-06-29** run "by appointment" — that window has closed; **do not publish it as current** |
| Museo delle Cere | `relation/2054907` | `wikidata=Q3868139`; Piazza dei Santi Apostoli |
| Istituto Italiano di Numismatica | `node/2122709061` | `wikidata=Q3803769` |
| Escuela Española de Historia y Arqueología en Roma | `node/5733532021` | Via di Sant'Eufemia 13; site 200 |
| Biblioteca di Archeologia e Storia dell'Arte | `node/11263818910` | Via della Dataria, `operator=MIC`, OSM `architect=Martinucci Filippo` |
| **Museo Nazionale delle Paste Alimentari** | `node/…` at Piazza Scanderbeg | **CLOSED — do not publish as operating. §8.2** |

### 6.4 Theatres and cinemas (5)

Teatro Quirino (`node/4228668019`, Via delle Vergini 7, `wikidata=Q3982110`, site 200) ·
Teatro de' Servi (`way/131235456` / `node/4711620951`, Via del Mortaro 22/24, site 200) ·
Quirinetta (`node/4418775773`, Via Marco Minghetti 5) ·
Cinema Barberini (`way/201588734`, Piazza Barberini 25, `wikidata=Q37000295`, site 200) ·
Cinema Fiamma (`node/1118787065`, Via Leonida Bissolati 47, `wikidata=Q37000377`).
Time Elevator (`node/6023597888`, Via dei Santi Apostoli 20) is a commercial attraction, not a
cinema — judge on its merits.

### 6.5 Archaeology and water (7)

Acquedotto Vergine (§4.7, **contested §3.10**) · Vicus Caprarius (§4.8) · Mitreo Barberini (§4.13) ·
Auditoria di Adriano / Athenaeum `relation/19906545` (**§3.18**) · Resti di Mura Serviane
`way/427413247` (**§3.17**) · **Complesso di via in Arcione** (*OSM miss*; it.wikipedia: also called
*Complesso dei Maroniti*, **nel rione Trevi** between via dei Maroniti and via in Arcione, 2nd–4th
century AD, **c. 1540 m²**, excavated **1969–1973** during construction of a multi-storey
underground car park) · Fontana delle tre cannelle `node/248743319` (`wikidata=Q76938649`).

### 6.6 Squares and named streets wholly inside Trevi (9)

Piazza di Trevi `relation/13448561` · Piazza dei Santi Apostoli `way/32454221` ·
Piazza della Pilotta `relation/2736102` · Piazza di San Marcello `way/52458682` ·
Piazza dei Crociferi `way/190525450` · Piazza dell'Oratorio `relation/2738420` ·
Piazza Poli `way/28160524` · Piazza Scanderbeg `way/202252481` (`wikidata=Q129169`) ·
**Via Rasella** `way/24180680` (`wikidata=Q130471636`).

**Via Rasella** deserves separate handling. it.wikipedia's Trevi article names the
**attentato di via Rasella** of 1944 as an event in the rione, and the dedicated article is
231 kB — by far the longest source I fetched. **This is a partisan-attack-and-massacre subject
with a contested historiography and a live legal and political afterlife.** It is not a "place a
travel guide writes about" in the ordinary sense and I am not summarising it here. Flagging it as
a subject requiring editorial judgement well above the level of a fountain, not as a candidate I
am recommending.

### 6.7 Weak — collected because the brief told me to over-collect, and I do not defend them

Fountains inside the Quirinal gardens, mapped but with no independent source and no public access
established: Diana `way/429306228`, Giunone `way/429306229`, Fontana delle Bagnanti
`way/629823442`, Fontana Martinucci `way/629823441`, Fontana dell'Organo `node/662527388`,
Fontana Rustica `node/9202612506`. "Oceano" `node/6242722715` (`start_date=1762`) is the central
figure **of** the Trevi Fountain, not a separate place — Nominatim returns it as the `name` for the
fountain's own coordinates. "Miracle Water" `node/4450594029`. Government tenants that are
organisations rather than places: Autorità nazionale anticorruzione, Garante per la protezione dei
dati personali, IVASS, Presidenza della Repubblica (an office node, distinct from the palace),
Ambasciata dell'India, Il Messaggero. **Esperienza Europa** `node/3517484221`
(`operator=Parlamento Europeo`, OSM hours `Mo-Fr 10:00-19:00; Sa,Su 12:00-18:00`) is a genuine free
visitor centre and is the strongest of this group.

### 6.8 Hospitality, retail, banks, pharmacies (163) — listed as a class, not written up

163 named restaurants, bars, gelaterie, hotels, guest houses, banks, pharmacies and chain shops
test inside Trevi. **None has a source beyond OSM, none has an award or a founding date I could
verify, and the corpus rules forbid "the oldest", "the best" and trading-length claims from a
business's own site.** Several carry names that invite exactly those claims —
*L'Antica Birreria Peroni*, *Il Gelato di San Crispino*, *Antica Trattoria Tritone*,
*Trattoria Al Moro*. If the wave wants any of them, each needs its own independent source; I am not
supplying one from a shopfront name.

---

## 7. Places I looked for and confirmed are NOT in Trevi

Recorded so nobody has to re-do the search, and so the arbitrator can see the negative space.

| Place | Actually in | Method |
|---|---|---|
| Galleria Alberto Sordi | **Colonna** | both methods; **Colonna's own article claims it** (§3.13) |
| Piazza di San Silvestro | **Colonna** | both methods (§3.13) |
| Piazza San Bernardo | **Castro Pretorio** | both methods (§3.13) |
| San Carlo alle Quattro Fontane | **Monti** | polygon; `way/201374573` |
| Santi Gioacchino e Anna alle Quattro Fontane | **Monti** | polygon; `way/201374574` |
| Sant'Andrea al Quirinale | **Monti** | polygon; `way/112820613`; Monti's article claims it |
| Palazzo della Consulta | **Monti** | polygon; `relation/2737120`; Monti's article claims it |
| Fontana dell'Acqua Felice (Mosè) | **Castro Pretorio** | polygon; `way/338548547` |
| Fontana del Bufalo | **Colonna** | polygon; `node/495048559` |
| Vittoriano / Altare della Patria | **Campitelli** | polygon; `relation/1849830`. **Reserved to wave 1 and confirmed nowhere near a Trevi file** |
| Palazzo Sciarra (Via del Corso) | **Pigna** | Nominatim (§8.1) |
| Torre delle Milizie, Mercati di Traiano | **Monti** | polygon; `relation/13353038` |

---

## 8. Traps for the verifier

### 8.1 Two Palazzi Sciarra, in two different rioni
**Palazzo Sciarra Colonna di Carbognano** (`relation/1764095`) is in **Trevi**.
**Palazzo Sciarra** on **Via del Corso** is in **Pigna** (Nominatim, `quarter=Pigna`).
Roma Capitale's Aqua Virgo page places two visible travertine arches *"al di sotto di Palazzo
Sciarra, presso via del Corso"* — **that is the Pigna one**, and a careless read would hand a
Pigna aqueduct feature to Trevi. Pigna is in this wave; the collision is live.

### 8.2 The pasta museum is closed and the two sources disagree on when
it.wikipedia's **Museo nazionale delle paste alimentari** infobox: *Data di apertura 1993,
**Data di chiusura 2007***. it.wikipedia's **Trevi rione article** lists it under Musei as
*"(fino al 2016)"*. Its domain `museodellepaste.it` does not resolve. **The museum is not open;
the two dates conflict; publish neither as fact and do not present the museum as operating.**
Palazzo Scanderbeg, its former seat, is now a hotel (`way/198947251`, site 200).

### 8.3 Three OSM objects inside Trevi that are data errors, not places
- **"Fontana delle Tartarughe"** `node/9206467464` — the real one is in **Sant'Angelo**, on Piazza
  Mattei. Roma Capitale lists it in its own fountains index as a distinct monument.
- **"Merdiana di Borromini"** `node/9206467463` — misspelt, and the Borromini meridian is not here.
- **"Palazzo Odescalchi"** `relation/2054910` carries `building=church`. It is a palace.

An automated pipeline that trusts OSM `name` inside a rione polygon will publish the Turtle
Fountain in Trevi. It is not in Trevi.

### 8.4 Facts that look sourced but are only OSM tags
`start_date`, `architect`, `opening_hours`, `operator` and `website` are crowd-sourced. I have
marked every place I relied on one. **Specifically do not publish as sourced:** Santa Maria di
Loreto `start_date=1507`/`architect=Antonio da Sangallo il Giovane`; Scuderie del Quirinale
`start_date=1730`/`architect=Ferdinando Fuga`; Fontana di Trevi `start_date=1735` (**which
contradicts Roma Capitale's own `1732-1762`** — the OSM tag is wrong, and Roma Capitale is right);
and every `opening_hours` string in this file.

### 8.5 Wikipedia articles that contradict themselves
Three of Trevi's core subjects have internally inconsistent it.wikipedia articles — the Accademia
di San Luca (1577 vs 1593), the Palazzo del Quirinale (1573–1583 / Mascherino vs 1573–1585 /
Martino Longhi il Vecchio), and the Palazzo della Panetteria (a 1764–66 building attributed to a
pope who died in 1621). Galleria Sciarra's infobox and body give different street addresses.
**Each needs a second source or an explicit "sources differ".**

### 8.6 Trevi's own Wikipedia article over-claims
Three places on its lists are in other rioni (§3.13) and a fourth is contested (§3.11).
**The article's monument lists are a search index, not a roster**, and should never be used as
evidence of rione membership on their own.

---

## 9. Photo leads — quarantined for the later wave, per Ruling 3

I emitted no images and linked none. Recording only that Italy has **no freedom of panorama**, that
the Trevi Fountain's 2014–15 FENDI restoration and the 2024 PNRR maintenance are recent
interventions whose documentation may carry its own rights, and that the **Galleria Sciarra**'s
painted interior and the **Quirinal gardens** are private or restricted-access spaces where a
photograph's provenance will matter more than usual. The Palazzo del Quirinale is a working
presidential residence. Nothing here is a recommendation; it is a note for whoever runs that wave.

---

## 10. Unfinished work, in priority order

1. **`quirinale.it` and `palazzo.quirinale.it` return 403 from this network.** The Quirinal Palace
   is Trevi's second subject and the corpus has **no** source for its visiting arrangements.
   Try `060608.comune.roma.it/it/scheda/palazzo-del-quirinale` (confirmed 200, 2.7 MB) or a
   different network.
2. **Resolve the Palazzo della Dataria's present status (§5.2).** Art. 15 names it; it.wikipedia
   says it was sold to ANSA in 1973. No reachable source settles whether the Art. 15 immunity
   survived the sale. Until it does, the corpus must state the Treaty text and the reported sale
   and stop there.
3. **Rule §3.18 before wave 1 lands.** Santa Maria di Loreto, SS Nome di Maria, Palazzo Valentini
   and the Auditoria di Adriano are clean Trevi by both methods but sit inside the visual envelope
   of the reserved Trajan's Forum complex.
4. **Rule Piazza Venezia (§3.4)** — three rioni, two waves, and my two methods disagree on the
   primary.
5. Re-source every `opening_hours` in §6 from the institution's own site. All the relevant sites
   return 200 except the Quirinal's.
6. Find a live URL for the **Istituto Centrale per la Grafica** — its OSM host does not resolve.
7. Find a citable source for **Mitreo Barberini** access; the Soprintendenza *scheda* URL 404s.
8. Standardise on **`out geom;`** in Overpass across the programme and assert a non-zero relation
   count (§2.3). This one is worth writing into the method doc — it silently dropped the Trevi
   Fountain.
