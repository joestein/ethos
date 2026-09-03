# Testaccio (R. XX, Roma Capitale toponymic code 120) — FINDER research

Researcher: finder agent, wave 4. Date of research: 2026-09-02.
Deliverable: candidate places with sourced facts and a rione ruling for each. **I am not the verifier
and not the arbitrator.** Everything below is offered for adjudication.

---

## 0. Collision check — MECHANICAL, run first

```
python3 .superpowers/taken_slugs.py testaccio   -> 0 matches
python3 .superpowers/taken_slugs.py piramide    -> 0 matches
python3 .superpowers/taken_slugs.py aventino    -> 0 matches
python3 .superpowers/taken_slugs.py ostiense    -> 0 matches
python3 .superpowers/taken_slugs.py marmorata   -> 0 matches
python3 .superpowers/taken_slugs.py cimitero    -> 0 matches
python3 .superpowers/taken_slugs.py mercato     -> 1 match, "Mercato Monti Urban Market" (Monti) —
                                                   a different market in a different rione, no conflict
```

**Testaccio is entirely unclaimed by the twelve shipped rioni (450 places).** Not one candidate below
collides with a shipped slug. The collision risk in this rione is not with the shipped twelve — it is
with **San Saba, Ripa, Celio and the Ostiense quartiere**, all live in this wave or adjacent to it.
Every such case is flagged in §2.

---

## 1. Boundary method — what I actually did

Nominatim reverse geocoding **could not be used**: every request from this network returned
HTTP 429 on the first call of a run, including after multi-minute backoff and across two separate
sessions. The brief's stated method (Nominatim `quarter` field) is therefore unavailable to me, and
I did not want to guess. I substituted two independent methods:

1. **Local point-in-polygon against the OSM boundary relations themselves.** I fetched the full
   `out geom` of six relations from Overpass, assembled each into a closed ring (all six closed
   cleanly — 1 ring each, first vertex == last vertex), and ran a ray-cast test locally. Relations:

   | unit | OSM relation | tags |
   |---|---|---|
   | Testaccio | 5454344 | `place`, `ref=R. XX` |
   | Ripa | 5454276 | `place`, `ref=R. XII` |
   | San Saba | 5454343 | `place`, `ref=R. XXI` |
   | Celio | 5454335 | `place`, `ref=R. XIX` |
   | Ostiense (quartiere) | 5460386 | `place`, `ref=Q. X` |
   | Portuense (quartiere) | 5460387 | `place`, `ref=Q. XI` |

   Six polygons give complete coverage of every direction Testaccio can leak into, which the it.wiki
   rione page confirms: "confina a est con i rioni R. XII Ripa e R. XXI San Saba, a sud con il
   quartiere Q. X Ostiense, a ovest con i quartieri Q. XI Portuense e Q. XII Gianicolense"
   (https://it.wikipedia.org/w/api.php?action=parse&page=Testaccio&prop=wikitext).

2. **Overpass `area(3600000000+5454344)` enumeration.** Anything Overpass returns as inside the
   Testaccio area relation is a candidate; I then re-tested its centroid with method 1. The two
   agreed everywhere except for objects whose OSM *centre* lies far outside the area (long ways like
   the Aurelian Walls relation, and the UNESCO "Centro storico di Roma…" relation), which I discarded
   by hand.

3. **Cross-checks against coordinates published by the institutions themselves.** turismoroma.it
   emits a `POINT (lon lat)` for each place; I ran those points through method 1 too, and they agreed
   with the OSM centroids in every case I tested. Where an operator states its own rione in prose
   (the Cimitero Acattolico does), I recorded that as an independent third witness.

**A caution for the verifier.** These are OSM `place` relations, not a Roma Capitale cadastral
export. I could not reach comune.roma.it or dati.comune.roma.it (the rome_roster.json `source` field
records the same failure from the scoping wave). So the boundary evidence here is OSM's rendering of
the rione, corroborated by institutional prose where prose exists. It is good, and it is not a
municipal boundary file.

---

## 2. STRADDLERS AND MISALLOCATIONS — read this before anything else

I am not resolving any of these. Flagging only.

### 2a. PORTA SAN PAOLO IS NOT IN TESTACCIO — against my own brief

My brief lists Porta San Paolo as a likely Testaccio subject. It.wikipedia's Testaccio rione page
lists it under "Siti archeologici … Porta San Paolo, su piazzale Ostiense". **Both are wrong on the
geometry.** Every test I ran puts the gate outside Testaccio:

| point | source of point | polygon result |
|---|---|---|
| 41.8768632, 12.481956 | turismoroma.it's own `POINT` for Porta San Paolo | **San Saba** |
| 41.876395, 12.481128 | OSM, centre of the gate structure area | **Ostiense (Q. X)** |
| 41.876708, 12.481442 | OSM node, Museo della Via Ostiense (housed *inside* the gate) | **San Saba** |
| 41.877106, 12.480944 / 41.877271, 12.481779 / 41.876936, 12.481529 (+7 more) | every OSM way named "Piazza di Porta San Paolo" | **San Saba**, 10 of 10 |
| 41.876224 / .876229 / .876219 / .876234, 12.4805 | the four 1943 memorial plaques at the gate | **Ostiense (Q. X)**, 4 of 4 |
| 41.874972, 12.482406 | Piramide metro station (building) | **Ostiense (Q. X)** |
| 41.875393, 12.481637 | Roma Porta San Paolo rail station | **Ostiense (Q. X)** |
| 41.875040, 12.481168 | Polo museale ATAC Porta San Paolo | **Ostiense (Q. X)** |

So the gate, the museum inside it, its piazza, its war memorials, the metro station and the two rail
stations all fall in San Saba or in Q. X Ostiense — not Testaccio. **Porta San Paolo, the Museo della
Via Ostiense, Piazzale Ostiense and the Piramide/Ostiense transport cluster should go to San Saba or
Ostiense, not to me.** I have gathered facts on them anyway (§4.10) so whoever gets them is not
starting cold, but I am not claiming them and the arbitrator should not let me.

The relevant sourced facts if they go elsewhere:
- Porta San Paolo was the *Porta Ostiensis*; two gates originally flanked the Pyramid, the western
  one closed and then demolished in 1888; Honorius reduced it to a single fornix and raised the
  towers between 401 and 403; the *Castelletto*, a Maxentian counter-gate of the early 4th century,
  now houses the Museo della Via Ostiense. Sovrintendenza Capitolina,
  https://sovraintendenzaroma.it/content/porta-san-paolo
- The same page contains the banned formula "tra le più maestose e meglio conservate dell'intera
  cerchia" — a superlative. **Do not reproduce it**, attributed or not.
- Museo della Via Ostiense created 1954; 12,153 visitors in 2018 (MiBAC figures); holds Italo
  Gismondi's 1930s model of Ostia. https://it.wikipedia.org/w/api.php?action=parse&page=Museo%20della%20Via%20Ostiense&prop=wikitext

### 2b. THE PYRAMID OF CESTIUS STRADDLES — majority Testaccio

I tested the OSM footprint way 432946457 (`building=pyramid`, `historic=tomb`, `start_date=-12`,
`wikidata=Q725404`) vertex by vertex:

- 8 vertices: **5 in Testaccio, 3 in Ostiense (Q. X)**
- centroid (41.876440, 12.480878): **Testaccio**
- a NE point (41.876650, 12.481050): Testaccio; a SW point (41.876250, 12.480700): Ostiense

The split is the expected one — the Pyramid is a bastion *in* the Aurelian Wall, so its outward face
sits on the far side of a boundary that follows the wall. Majority and centroid say Testaccio, and
it.wikipedia categorises it `Roma R. XX Testaccio`. I recommend Testaccio; **the arbitrator decides.**

### 2c. THE AURELIAN WALLS STRADDLE

OSM carries the walls as multiple ways. Two centroids I tested landed on opposite sides:
41.873479, 12.471951 → **Testaccio**; 41.876335, 12.480681 (the stretch at the Pyramid) →
**Ostiense (Q. X)**. The walls are a single continuous monument crossing at least seven of this
wave's units. **Do not let nine files each claim "the Aurelian Walls".** If the corpus wants a walls
page it needs one owner, or each rione gets a named stretch and says only that.

### 2d. PONTE SUBLICIO — Testaccio / Ripa / Trastevere

- East abutment (41.882849, 12.475707): **Testaccio**. Mid-river (41.881980, 12.475170): **Testaccio**.
- But it.wikipedia says the bridge "collega Aventino e Testaccio da un lato (piazza dell'Emporio, nel
  rione Ripa) con Trastevere dall'altro".
- And I tested Piazza dell'Emporio itself (41.882817, 12.476157): **Ripa**, confirming it.wiki.

So the bridge's own deck reads Testaccio while its east landing square reads Ripa and its west
landing is Trastevere. Three-way straddler. Facts: built 1914–1917 to a design by Marcello
Piacentini, inaugurated 21 April 1919; three masonry arches, 105 m long and 20 m wide (turismoroma.it
via https://it.wikipedia.org/w/api.php?action=parse&page=Ponte%20Sublicio&prop=wikitext; the
turismoroma page https://www.turismoroma.it/it/luoghi/ponte-sublicio 200s).

### 2e. PONTE TESTACCIO — Testaccio / Portuense (Q. XI)

East abutment (41.874137, 12.472600): **Testaccio**. Mid-river (41.871410, 12.471320):
**Portuense (Q. XI)**. It.wikipedia categorises it under *both* `Roma R. XX Testaccio` and
`Roma Q. XI Portuense` and says it "collega largo Giovanni Battista Marzi al lungotevere Portuense…
nel rione Testaccio e nel quartiere Portuense". Portuense is not in this wave, so the practical
question is only whether Testaccio may carry it. Facts: begun 1938 to a design by the architect
Bastianelli and the engineer Cesare Pascoletti, originally to be called *ponte d'Africa* and to reach
Trastevere station by demolishing the Mattatoio; inaugurated 1948; single arch, 122 m overall, four
travertine reliefs at the abutments.
https://it.wikipedia.org/w/api.php?action=parse&page=Ponte%20Testaccio&prop=wikitext

### 2f. THE TOMB OF SULPICIUS GALBA IS PHYSICALLY IN CELIO

This one is a trap. The Testaccio rione page and the Museo diffuso brochure both list "Sepolcro di
Sulpicio Galba, su via Giovanni Branca" as a Testaccio site. But:

- The it.wikipedia article on the consul captions its own photograph "La tomba di Galba, **oggi al
  Parco archeologico del Celio**"
  (https://it.wikipedia.org/w/api.php?action=parse&page=Servio%20Sulpicio%20Galba%20(console%20108%20a.C.)&prop=wikitext),
  and the *Horrea Galbana* article carries the same caption.
- The Museo diffuso article states the position outright: "Sepolcro di Servio Sulpicio Galba, sito in
  via Giovanni Branca … **NB Nella brochure e nei vari pannelli esplicativi del museo diffuso viene
  definito come sepolcro, in realtà si tratta di un pannello con la storia di questa tomba**"
  (https://it.wikipedia.org/w/api.php?action=parse&page=Museo%20diffuso%20di%20Testaccio&prop=wikitext).
- OSM confirms: the object at 41.879888, 12.474486 named "Sepolcro di Galba" is tagged
  `tourism=information`, `information=board`. It is an interpretive panel.

**Testaccio has an information board about a tomb; Celio has the tomb.** If Testaccio publishes
anything here it must be the findspot and the panel, never the monument. Celio should be told.

### 2g. THE PALAZZO DELLE POSTE ON VIA MARMORATA IS IN SAN SABA

My first polygon test on a guessed coordinate said Testaccio, which was wrong — I had the wrong
point. The actual OSM building (`building=post_office`, `addr:street=Via Marmorata`,
`addr:housenumber=4`, centroid 41.877950, 12.480474) and the OSM `amenity=post_office` node
(41.877978, 12.480498) both test **San Saba**. This agrees with the Museo diffuso article's own note:
"Palazzo delle poste di Via Marmorata … **NB Sebbene questo edificio si trova nel rione San Saba**,
viene citato nella brochure nelle cose da visitare nel museo diffuso di Testaccio."

There *is* a separate Testaccio object: an OSM `information=board` named "Edificio delle Poste" at
41.877564, 12.479984, which tests Testaccio. That is a museo diffuso panel on the Testaccio side
pointing at a building in San Saba. **The building goes to San Saba.** (Libera and De Renzi's Poste
building is a genuinely significant piece of 1930s architecture — San Saba's finder should be told it
is theirs and not assume Testaccio took it.)

### 2h. THE ARCO DI SAN LAZZARO IS IN RIPA

Same pattern: listed in the Testaccio museo diffuso brochure, and the it.wikipedia Museo diffuso
article flags it — "**NB Sebbene questo edificio si trova nel rione Ripa**". My test at
41.884639, 12.479247 returns **Ripa**. Not mine.

### 2i. VIALE DEL CAMPO BOARIO IS MOSTLY IN Q. X OSTIENSE

The it.wikipedia rione page gives "viale del Campo Boario" as the address of both the Cimitero
acattolico and the Rome War Cemetery. That address is loose. Six OSM nodes along Viale del Campo
Boario test **Ostiense (Q. X)** (41.875568/.875607/.875505/.875044/.874833/.874126, lon ≈12.477–12.480),
while two western ones test Testaccio. **The two cemeteries themselves are firmly inside Testaccio**
(see §4.2) and both have better addresses from their own operators; use those, not "viale del Campo
Boario".

### 2j. Not straddlers, but worth stating

Everything else I tested returned a single unambiguous `testaccio`: Monte Testaccio, both cemeteries,
the Mattatoio complex, the Nuovo Mercato, Santa Maria Liberatrice, Piazza Testaccio, the Caserma dei
Vigili del Fuoco and its museum, the Emporium quay, the Porticus Aemilia remains, Villaggio Globale,
the Città dell'Altra Economia, the Roma Tre architecture faculty, all four theatres, the Greenwich
cinema, the Zabaglia and Lungotevere fountains, Parco Testaccio, Parco Joyce Lussu, the Giardino
Famiglia Di Consiglio, the Schola Collegi and Sabbatini panels, the Biblioteca Enzo Tortora, and
every restaurant, deli and club in §5. Full run log in
`/private/tmp/.../scratchpad/t/edge2.py` output.

---

## 3. Yield judgement — GUIDE PAGE, comfortably

Testaccio is not San Saba and it is not Sant'Angelo. It is 60 hectares (Museo diffuso article) of
dense, legible material with four unrelated centres of gravity: a Roman river port and its debris
mountain, a Romantic-era foreign cemetery, a 19th-century industrial complex turned arts campus, and
a working food quarter. I found **65 candidates** I would defend as researchable, of which maybe
30–35 could carry a paragraph a reader would want. I would call this a guide page, not a town page,
and I would expect a healthy fraction of my 65 to be cut — which per my brief is the point.

Where it is thin: religious architecture (one working parish, one deconsecrated convent chapel, one
cemetery chapel, and five *madonnelle*), and standing ancient masonry (nearly all of the Roman
material is buried, glimpsed through gratings, or visitable only by appointment).

---

## 4. CANDIDATES

Format: name · kind (schema-legal per `kind_note`) · address · what it is · dates and authorship ·
rione evidence · every URL I actually fetched.

### 4.1 THE ANCIENT PORT LANDSCAPE

---

**1. Monte Testaccio (Monte dei Cocci)** — `historic-site`
Via Nicola Zabaglia, 24. Centroid 41.876338, 12.475326 → **Testaccio** (pip); turismoroma's own
`POINT (12.476164 41.87711)` → Testaccio.

An artificial hill of deliberately stacked amphora sherds between the Aurelian Walls and the left
bank of the Tiber, formed by the systematic dumping of emptied oil amphorae from the adjoining river
port.

- Sovrintendenza Capitolina: "alto 54 metri e con una circonferenza di circa 1 chilometro"; the
  material is *testae*, mostly amphora fragments; the activity ran "tra il periodo augusteo e la metà
  del III sec. d.C."; the Baetican oil amphorae could not be reused because oil residue spoiled fast;
  lime was spread through the tip both to control decomposition odour and, incidentally, as a binder
  that has held the hill together; a ramp and two cart tracks made the height possible; many handles
  carry stamps and *tituli picti* recording exporter, contents, in-transit checks and consular date.
  https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/monte_testaccio
- Same page: from the medieval period the hill hosted the *ludus Testacie* and later the 19th-century
  *ottobrate*.
- it.wikipedia gives the competing measurement: 36 m above street level, 54 m above sea level, area
  c. 20,000 m², "oltre 53 milioni" of amphorae, two summits, and a ramp now called "salita Monte
  de' Cocci". It also records the artillery battery placed here during the 1849 siege and the WWII
  anti-aircraft battery whose concrete bases survive; and the earliest attestation of the name
  *Testacium* in a 7th-century inscription in the portico of Santa Maria in Cosmedin.
  https://it.wikipedia.org/w/api.php?action=parse&page=Monte%20Testaccio&prop=wikitext
- **Numbers conflict and the verifier must pick:** 54 m (Sovrintendenza, and turismoroma repeats it)
  vs 36 m above street level (it.wiki, citing Malizia and Almeida). 53 million amphorae (it.wiki) vs
  25 million (the it.wiki *rione* page and the *Emporium* article). I would publish the
  Sovrintendenza's figures because it is the site's manager, and simply not give an amphora count.
- Access, from Sovrintendenza and turismoroma: groups only with their own guide, max 30 per visit,
  compulsory booking on 060608 (09.00–19.00); individual visits also possible by booking, on a
  published calendar. Tariffs: €4.00 full, €3.00 reduced, free for residents of Rome and the
  metropolitan area on production of proof of residence.
  https://www.turismoroma.it/it/luoghi/monte-dei-cocci
- turismoroma also notes the *grottini* cut into the flanks, once cellars and stables, now
  restaurants and clubs.
- **Superlative hazard:** nearly every source reaches for one ("unico nel suo genere", "una vera e
  propria discarica"). The publishable core is entirely quantitative and chronological. Write the
  dates and the metres; write no ranking.

---

**2. Emporium — the ancient river port** — `historic-site`
Lungotevere Testaccio, fronte civico 11 (turismoroma) / opposite no. 11 for the visitable stretch.
41.882347, 12.474673 → **Testaccio**.

The quay of Rome's republican and imperial river port, set into the modern embankment wall.

- turismoroma: a long travertine-paved quay, still visible, giving on to two ranges of warehouses
  fronting a cryptoporticus, with offices above; goods from across the Mediterranean were landed at
  Ostia and Portus and redistributed here — wine, grain, *garum*, and above all oil; a peak under
  Trajan in the 2nd century, abandonment in the 4th, then burial; used as a burial ground in the
  Middle Ages; rediscovered only from the end of the 19th century.
  "Visitabile solo in occasione di visite straordinarie." `POINT (12.4740737 41.8815357)`.
  https://www.turismoroma.it/it/luoghi/emporium-antico-porto-fluviale-di-testaccio
- **DATE CONFLICT, flag it.** turismoroma says "Edificato nel I secolo d.C." it.wikipedia, following
  Livy 35.10.12, says the aediles Marcus Aemilius Lepidus and Lucius Aemilius Paullus built it in
  193 BC and that it was paved in stone and divided by barriers with stairs down to the Tiber in
  174 BC. The literary date is the standard one. I would use 193 BC with the Livian attribution and
  not repeat turismoroma's 1st century AD.
  https://it.wikipedia.org/w/api.php?action=parse&page=Emporium&prop=wikitext
- it.wikipedia adds: excavated 1868–1870 during the embankment works and again in 1952; c. 500 m of
  quay survives, 90 m deep, with stairs and ramps and projecting travertine mooring blocks.
- Managed by the Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma; part of the
  Museo diffuso di Testaccio; bookings via sottosopra.testaccio@gmail.com
  https://www.turismoroma.it/it/luoghi/museo-diffuso-di-testaccio

---

**3. Porticus Aemilia (urban archaeological park)** — `historic-site`
Remains visible in Via Giovanni Branca, Via Rubattino and Via Florio, between the apartment blocks;
the museo diffuso park entrances are on Via Rubattino and Via Beniamino Franklin.
41.879852, 12.473421 → **Testaccio**. OSM `start_date=193 BC`.

- Built 193 BC by the aediles Lepidus and Paullus, rebuilt 174 BC by the censors Quintus Fulvius
  Flaccus and Aulus Postumius Albinus (Livy 41.27.8). *Opus incertum* in tufa, 487 m long, 60 m wide,
  294 piers making 7 ranks and 50 aisles, each aisle 8.30 m wide and vaulted, 25,000 m² covered,
  c. 90 m back from the river.
- **The identification is genuinely disputed and the page should say so.** A 2006 proposal
  (Cozza and Tucci, *Archeologia Classica* 57) reads these remains as republican *navalia*, sheds
  for the war fleet. Excavations from 2010 by the Soprintendenza with the Royal Netherlands Institute
  and Municipio I "non hanno finora fornito dati utili a sostegno di questa identificazione ma
  neanche a sostegno dell'identificazione con la Porticus Aemilia citata dalle fonti letterarie."
  https://it.wikipedia.org/w/api.php?action=parse&page=Porticus%20Aemilia&prop=wikitext
- Piranesi engraved the remains in 1756 (*Le antichità Romane* IV, tav. XLVIII).
- Part of the Museo diffuso; two OSM interpretive boards on site (41.880083, 12.473721 and
  41.879133, 12.472143), both Testaccio.
- turismoroma has a page at https://www.turismoroma.it/it/luoghi/porticus-aemilia (fetched, 200).

---

**4. Area archeologica del Nuovo Mercato Testaccio** — `historic-site`
Beneath the market, Via Lorenzo Ghiberti 19; assembly point at market stall no. 63.
41.877598, 12.473846 → **Testaccio**.

- The market's own site: "Nei sotterranei del Mercato Testaccio … i resti di un antichissimo
  *horreum*, un magazzino di stoccaggio di epoca romana, che ancora conserva centinaia di anfore e
  reperti." Managed by the Soprintendenza Speciale; visits run by the archaeologists who dug it,
  about 45 minutes, max 20 people per turn, free, within Open Days promoted by the market traders,
  optional donation.
- **Currently closed:** "LE VISITE AL SITO ARCHEOLOGICO DEL MERCATO SONO MOMENTANEAMENTE SOSPESE PER
  INTERVENTI DI RISTRUTTURAZIONE DEGLI AMBIENTI." Fetched 2026-09-02.
  https://www.mercatoditestaccio.it/area-archeologica/
- Excavation publication: Renato Sebastiani, "Lo scavo del nuovo mercato di Testaccio. Fasi antiche:
  prime considerazioni", 2011 (cited in the it.wiki rione bibliography).
- **Do not publish an opening regime as current.** The honest sentence is that the site is reached
  through the market on open days announced by the traders, and that visits were suspended for works.

---

**5. Horrea Galbana** — `historic-site` — THIN, probably a cut
No visitable remains. Fragments of walls reappeared piecemeal during the construction of the modern
quarter. it.wikipedia gives coordinates 41.880228, 12.475758 (→ **Testaccio**) and describes:
*opus reticulatum* in tufa around three large porticoed rectangular courtyards with *tabernae*;
probably built at the end of the 2nd century BC by the consul Servius Sulpicius Galba, whence the
older name *Horrea Sulpicia*; restored under the emperor Galba in the 1st century AD.
https://it.wikipedia.org/w/api.php?action=parse&page=Horrea%20Galbana&prop=wikitext
The museo diffuso brochure places its marker "presso piazza dell'Emporio" — and Piazza dell'Emporio
tests **Ripa**. So even the panel may not be mine. **Recommend cut** unless the verifier can find a
standing fragment with an address.
Note: it.wiki says the *opus reticulatum* here is "l'esempio più antico conosciuto di questa tecnica"
— a superlative, banned, and unverifiable against any reachable register.

---

**6. Sepolcro di Servio Sulpicio Galba — findspot and panel** — see §2f. **Flagged. Celio has the
monument.** If anything is published here it is a panel in Via Giovanni Branca near the Giardino
Famiglia Di Consiglio, and the sentence must be about the findspot.

---

**7. Schola Collegi** — `historic-site` — THIN, needs a verifier's second pass
OSM `information=board` at 41.881392, 12.477075 → **Testaccio**, on Via Marmorata. Listed in the
Museo diffuso brochure inventory as "*Schola Collegi*, sita in via Marmorata"
(https://it.wikipedia.org/w/api.php?action=parse&page=Museo%20diffuso%20di%20Testaccio&prop=wikitext).
I could not find a single page describing what survives, who excavated it, or when. I am recording
it so the verifier knows it exists and can decide; I would not write a paragraph on this evidence.

---

**8. Piramide di Caio Cestio (Piramide Cestia)** — `historic-site` — **STRADDLER, see §2b**
Ingresso da Via Raffaele Persichetti — via del Campo Boario (the space directly in front of the
Pyramid). Free entry. Responsible official: Dott.ssa Barbara Rossi.

- Built between 18 and 12 BC as the tomb of Gaius Cestius Epulo, a member of the priestly college of
  the *septemviri epulones*. The bracket is deduced from the sumptuary law of 18 BC, which stopped
  the heirs laying valuable *attalica* in the chamber, and from the death in 12 BC of Agrippa, named
  among the beneficiaries of the will.
- Cestius' will required completion within 330 days, on pain of the heirs losing the estate; the
  east face carries the inscription recording it (CIL VI 1374), naming the heir Lucius Pontius Mela,
  son of Publius, of the Claudian tribe, and the freedman Potho.
- 36.40 m high on a square base 29.50 m a side; concrete core with brick facing; outer skin of
  Luna marble. Burial chamber c. 23 m², barrel-vaulted, walled up at burial in the Egyptian manner;
  frescoed in panels with nymphs alternating with lustral vases and four winged Victories at the
  vault angles.
- Incorporated as a bastion into the circuit built at Aurelian's initiative between 272 and 279 AD.
- Chamber restored by the Soprintendenza Archeologica di Roma in 2001; a further restoration ran
  2012–2015; in 2025 PNRR works began on a new layout of the area, restoration of the structures and
  new lighting.
  https://soprintendenzaspecialeroma.it/luoghi/piramide-di-caio-cestio/
- **Opening, verified against the operator's own announcement of 28 August 2026:** a cycle of
  special openings from 4 September to 31 October 2026 — eight daytime free unguided visits
  (5, 12, 19 September; 3, 10, 17, 24, 31 October, at 16.30 / 17.30 / 18.30, max 50 per turn), five
  evening free guided visits (4, 11, 18, 25 September, at 19.00 / 20.00 / 21.00, max 30 per turn),
  and special openings for the European Heritage Days on 26 and 27 September (10.00–16.00 hourly,
  max 50). Booking compulsory via Eventbrite. Entrance from Via Raffaele Persichetti.
  https://soprintendenzaspecialeroma.it/istituzionale/piramide-cestia-un-nuovo-ciclo-di-aperture-dopo-i-lavori-pnrr/
  Note that the same institution's *luoghi* page still reads "Il sito è accessibile solo con aperture
  straordinarie e in occasione di eventi" — consistent, but less current. **A dated open-days cycle
  is not a permanent opening regime; the page must not imply the Pyramid is open daily.**
- Other sourced detail from it.wikipedia (all cited there to the Soprintendenza or to the 2017
  *Bollettino di Archeologia Online* article by Filetici et al.): a medieval tunnel on the north side
  first violated the tomb, losing the cinerary urn and part of the decoration; the medieval
  identification as the *meta Remi*, paired with the *meta Romuli* that stood in Borgo and was
  demolished for Borgo Nuovo; Petrarch repeated the Remus attribution; Alexander VII's excavations of
  1660–1663 reopened the chamber, found it empty, recovered the two inscribed statue pedestals
  around 1662 and re-erected two corner columns; a Borromini project to turn the chamber into a
  church came to nothing; a 19th-century lightning strike brought down the apex and led to a
  conductor being fitted.
  https://it.wikipedia.org/w/api.php?action=parse&page=Piramide%20Cestia&prop=wikitext
- **BANNED PHRASING PRESENT IN SOURCES.** Both the Soprintendenza and it.wikipedia call it "l'unico
  monumento superstite" of Rome's 1st-century BC pyramids, and the press release calls it "uno dei
  suoi monumenti più riconoscibili". Those are superlatives; they may not be published. Also note the
  2017 European Nostra conservation award reported by it.wiki — an award, so not establishable from
  the site's own pages, and I would leave it out.

---

### 4.2 THE TWO CEMETERIES

---

**9. Cimitero Acattolico di Roma (Non-Catholic Cemetery)** — `historic-site`
**Via Caio Cestio, 6, 00153 Roma.** 41.876050, 12.479218 → **Testaccio**.
Third witness: the cemetery's own site writes its address as "Via Caio Cestio, 6 **nel Rione di
Testaccio**, 00153 Roma". That is an operator statement of rione, the strongest kind of evidence
available in this corpus.

- Its own homepage: "cimitero attivo fin dal **1716**. Il suo giardino storico ospita **oltre 6000
  sepolture** che rappresentano più di cinquanta denominazioni religiose di quasi sessanta paesi."
  Privately managed; still an active burial ground.
  https://www.cemeteryrome.it/
- **Hours, from the operator:** Monday to Saturday 09.00–17.00, last admission 16.30; Sundays and
  public holidays 09.00–13.00, last admission 12.30. Closed 1 and 6 January, a fortnight around
  Ferragosto, and 8, 24, 25, 26 and 31 December. Early closing at 13.00 (last entry 12.30) at Easter
  and Easter Monday, 25 April, 1 May, 2 and 29 June. Group visits by booking only, in fixed slots —
  Monday to Saturday 10.00, 11.30, 14.00, 15.30; Sundays and holidays 10.00, 11.00; no groups at All
  Saints. Groups bring their own guide; the cemetery states outright "il Cimitero non offre al
  momento visite guidate."
  https://www.cemeteryrome.it/pianifica-la-tua-visita/
  The homepage also carried, at fetch time, notices of a maintenance closure 13–19 July and a closure
  from 1 to 31 August 2026 inclusive. **Those are dated notices, not standing hours — do not publish
  them as the regime.**
- Directions in its own words: "Via Caio Cestio è una traversa di Via Marmorata sul lato nord della
  piramide. L'ingresso del Cimitero si trova sulla sinistra a metà della strada." It also states that
  the Pyramid can be seen well from the old cemetery but cannot be entered from the garden — a useful
  correction to a common visitor assumption, and publishable because the operator says it.
- Facilities it names: Centro Visitatori (volunteers, books and guides, group bookings), toilets, the
  chapel, and a registered cat colony ("I gatti della Piramide", per it.wikipedia).
- History, from it.wikipedia: burial in consecrated ground was closed to non-Catholics under the
  Papal States; a Holy Office ruling of 1671 let "Signori non cattolici" be buried here rather than
  at the Muro Torto; the first recorded Protestant burial is William Arthur, a follower of the exiled
  James Stuart, who died in Rome in 1716; Francesco Valesio records the burial of William Ellis,
  treasurer to the king of England, in 1732 "ai piedi della Piramide"; the official opening date
  given is **11 October 1821**; a ditch was dug round the old part in 1824; until 1870 crosses and
  inscriptions alluding to the Resurrection were forbidden; the older part was closed to burials in
  the 1820s and a walled enclosure added. Custody and management rest with the foreign missions in
  Italy, whose ambassadors take the presidency in annual rotation and who appoint a director.
  https://it.wikipedia.org/w/api.php?action=parse&page=Cimitero%20acattolico%20di%20Roma&prop=wikitext
- Named graves confirmed by OSM nodes inside the walls, all testing Testaccio: **John Keats**
  (41.877061, 12.480411 — OSM carries the epitaph verbatim: "Here lies One Whose Name was writ in
  Water"), **Percy Bysshe Shelley** (41.875981, 12.479890, inscription "Cor Cordium…"), **Antonio
  Gramsci** (41.875338, 12.477752), **Carlo Emilio Gadda**, **Andrea Camilleri**, **Arnoldo Foà**,
  **August von Goethe**, **Hans von Marées**, and **Emelyn Eldredge Story** — OSM tags the last
  `artist_name=William Wetmore Story`, the *Angelo del dolore*.
- it.wikipedia adds the Keats date puzzle in sourced form: Joseph Severn recorded the death at about
  eleven on the evening of 23 February 1821, while the stone reads 24 February, because the Roman
  civil day began at the evening Ave Maria. This is a good, checkable, non-superlative anecdote.
- Also: Andrea Camilleri's remains brought here 18 July 2019; Giorgio Napolitano buried 26 September
  2023.
- turismoroma page exists: https://www.turismoroma.it/it/luoghi/cimitero-acattolico (fetched, 200).
- **Photograph note (for the later wave, not this one):** I saw nothing I could clear. `photos: []`.

---

**10. Cappella del Cimitero Acattolico** — `historic-site` — thin sub-place
OSM `amenity=place_of_worship`, `building=chapel` at 41.875576, 12.477574 → **Testaccio**. Listed as
its own item in the it.wiki rione page's religious architecture section, and the cemetery's own site
has a "La Cappella del Cimitero" page. Probably folds into the cemetery record rather than standing
alone. Recorded for completeness.

---

**11. Rome War Cemetery (Cimitero di guerra del Commonwealth)** — `historic-site`
Via Nicola Zabaglia (the Museo diffuso brochure's address); OSM `landuse=cemetery` centroid
41.874481, 12.476391 → **Testaccio**.

- Established 1947, one of about fifty comparable sites in Italy built by the Commonwealth War Graves
  Commission, which still manages and maintains it, to a design by the architect **Louis de Soissons**.
  Laid out on the still-state-owned strip of the old "prati del popolo romano" between Monte
  Testaccio and the Aurelian Walls. **426 burials.** Originally for members of the Rome garrison,
  later receiving bodies from the province and airmen and soldiers who died in captivity, 1939–1945.
  Approached through an open circular vestibule sheltering a bronze box with the names of the dead;
  headstones aligned along the walls; the Stone of Remembrance at the centre of the rows; a large
  stone cross at the end of the avenue facing the entrance. No wall separates it from the street,
  only a light railing.
  https://it.wikipedia.org/w/api.php?action=parse&page=Rome%20War%20Cemetery&prop=wikitext
- **PROVENANCE PROBLEM the verifier must weigh.** The CWGC's own page is the natural authority for
  the burial count and the designer, and **cwgc.org returned HTTP 403 to every request I made**, on
  two URL patterns and with browser-identical headers. So the 426 figure and the de Soissons
  attribution rest on it.wikipedia alone. Options: publish nothing numerical, or publish with the
  CWGC named as the managing body (which it.wikipedia states and which is independently obvious from
  the site's category). **The page must not say the CWGC site "could not be reached" — that is
  research method.** The honest reader-facing move is to attribute the count to no one and drop it,
  or to attribute the management to the Commonwealth War Graves Commission and give no count.
- Also in the it.wiki text: "Il luogo è molto sereno, al riparo dalle correnti di traffico che
  rumoreggiano poco lontano" — atmospheric, sourced only to an unsigned encyclopaedia, and it edges
  toward vague proximity. I would not carry it.
- Bibliography exists for whoever wants depth: Roberto Ragione, "Il cimitero militare del
  Commonwealth nel rione Testaccio a Roma (Rome War Cemetery)", in *Città e guerra*, CIRICE 2023,
  FedOA, Naples 2023, pp. 877–885, ISBN 978-88-6887-175-8.
- OSM carries a museo diffuso board "Cimitero di Guerra del Commonwealth" at 41.875050, 12.477216 →
  Testaccio.

---

### 4.3 CHURCHES AND SACRED IMAGES

---

**12. Chiesa di Santa Maria Liberatrice** — `historic-site` (per `kind_note`: churches are
historic-site; there is no `church` kind and three Sallustiano records were rejected at seed time for
using one)
Piazza di Santa Maria Liberatrice. 41.879327, 12.473967 → **Testaccio**. OSM `historic=church`.

- Built 1906–1908 to a design by the architect **Mario Ceradini**, neo-Romanesque/neo-Byzantine.
  Pius X entrusted the construction first to the Benedictines and then definitively to the Salesians,
  who were already working in the quarter; the first parish priest was Luigi Maria Olivares, later
  bishop of Sutri and Nepi. In the same years the mayor Ernesto Nathan gave Domenico Orano the job of
  cultural and social work in the rione.
- The pope transferred to it the *titulus* of the demolished Chiesa di Santa Maria Liberatrice al
  Foro Romano — a 13th-century church built over Santa Maria Antiqua, remodelled by Onorio Longhi in
  1617 and destroyed in 1899 — together with the venerated image *Sancta Maria libera nos a poenis
  inferni*, an ancient fresco, slightly concave because it came from the old church's apse, kept
  after the demolition by the Oblates of Tor de' Specchi.
- Interior: three aisles on columns with capitals bearing the evangelists' symbols; central band of
  the floor in black-and-white mosaic with polychrome marble fragments, geometric motifs and zodiac
  signs in panels; between 1956 and 1964 Luciano Bartoli painted the apse fresco (Trinity,
  Incarnation, works of mercy below) and the stained glass of the façade and aisles.
  https://it.wikipedia.org/w/api.php?action=parse&page=Chiesa%20di%20Santa%20Maria%20Liberatrice%20(Roma)&prop=wikitext
- The it.wiki rione page adds that the altar of the old church was moved here and that the façade
  mosaic reproduces one of its decorations. It also calls it "la chiesa del popolo testaccino".
- **Superlative hazard:** the article says it is "l'unica parrocchia presente nel quartiere". A count
  is fine, "the only" is not; write "the rione's parish church" only if a source states there is one
  parish, and prefer simply naming it as the parish church.
- OSM museo diffuso board "Santa Maria Liberatrice" at 41.879301, 12.474517 → Testaccio.

---

**13. Chiesa di Santa Maria della Divina Provvidenza a Testaccio** — `historic-site` — deconsecrated
Via Alessandro Volta (the complex also fronted Via Galvani and Via Nicola Zabaglia).

- Neo-Baroque, by the architect **Antonio Lenti**; construction 1887–1889, consecrated 1889; built
  for the Figlie della Divina Provvidenza, a congregation founded in 1832 by Maria Elena Bettini to
  educate poor girls, with the support of the Barnabites of San Carlo ai Catinari. The complex held a
  canteen, an orphanage and a school; the church served the new quarter before the parish of Santa
  Maria Liberatrice existed. The convent was the congregation's mother house until the end of the
  20th century, when it moved to Via Matteo Bartoli 255 in Giuliano-Dalmata. The complex, which once
  included a small hospital, closed in 2008; the diocese no longer lists the church and it is
  presumed deconsecrated.
- **Attribution conflict to flag:** Mariano Armellini, *Le chiese di Roma dal secolo IV al XIX*
  (1891), says the church was begun in 1888 "coi disegni del signor Barbiellini" — a different
  architect from Lenti. Both are in the article. Do not silently pick one.
  https://it.wikipedia.org/w/api.php?action=parse&page=Chiesa%20di%20Santa%20Maria%20della%20Divina%20Provvidenza%20a%20Testaccio&prop=wikitext
- Façade: four Doric pilasters flanking the portal on the lower storey, the portal crowned by an
  arched pediment.
- **A deconsecrated, closed building with no visitor access.** Publishable as streetscape history;
  the page must not imply it can be entered.

---

**14. The five *madonnelle* (edicole sacre) of Testaccio** — `historic-site` (one grouped record)
Listed with individual sources on the it.wiki rione page:
- Piazza Testaccio at the corner of Via G. B. Bodoni — https://www.info.roma.it/monumenti_dettaglio.asp?ID_schede=1014
- Via N. Zabaglia at the corner of Via Galvani — https://www.info.roma.it/monumenti_dettaglio.asp?ID_schede=1972
- Via Marmorata at the corner of Via A. Manuzio — https://www.info.roma.it/monumenti_dettaglio.asp?ID_schede=2376
- Via N. Zabaglia by Campo Testaccio
- Via Beniamino Franklin at the corner of Via Galileo Ferraris — https://www.info.roma.it/monumenti_dettaglio.asp?ID_schede=1013

turismoroma independently describes the Piazza Testaccio one: "La Madonnella posta a uno degli angoli
della piazza è una copia di un'antica immagine seicentesca, un tempo conservata nella chiesa di Santa
Maria Liberatrice al Foro Romano e poi collocata, nel 1908, sull'altare della chiesa di Santa Maria
Liberatrice." https://www.turismoroma.it/it/luoghi/piazza-testaccio

I did **not** fetch info.roma.it — flagging that so the verifier does not assume I did. OSM confirms
two shrines on the ground (`historic=wayside_shrine` 41.877559, 12.475991; `historic=wayside_cross`
41.876350, 12.475196 and 41.874572, 12.476511), all Testaccio. **One combined record is honest; five
separate ones would be padding.**

---

### 4.4 THE MATTATOIO CAMPUS

---

**15. Mattatoio di Roma (ex Macro Testaccio)** — `museum`
**Piazza Orazio Giustiniani, 4, 00153 Roma.** Complex bounded by Via Beniamino Franklin (still the
main entrance), Lungotevere Testaccio, Via Aldo Manuzio and Viale del Campo Boario.
41.876162, 12.473090 → **Testaccio**; turismoroma's `POINT (12.4737224 41.8760422)` → Testaccio.

- **Built between 1888 and 1891 by the architect Gioacchino Ersoch** — this is the operator's own
  wording on its own home page: "Costruito fra 1888 e 1891 da Gioacchino Ersoch". The engineer
  Filippo Laccetti worked on the project and devised a system for disposing of offal into the Tiber.
  https://www.mattatoioroma.it/ ·
  https://it.wikipedia.org/w/api.php?action=parse&page=Ex%20mattatoio%20(Roma)&prop=wikitext
- Covers 25,000 m². Pavilion type: rectangular volumes, brick-finished walls, double-pitch roofs,
  regularly repeated arched openings, iron members inside; laid out on a geometric plan with the
  slaughter halls flanking the main avenue, stables, baths and blood-processing buildings beside
  them, and the pig and offal work pushed to the periphery on what is now Via Manuzio.
- Decommissioned **1975**, replaced by a plant on Viale Palmiro Togliatti at Tor Sapienza.
- Restoration project born in the early 2000s from an idea by Zoneattive; site works opened 2006 and
  finished 2010, covering the water-tank pavilions, the *pelanda* and the pig slaughterhouse.
- Managed by Musei in Comune of the Sovrintendenza Capitolina until 2017; since 2018 a significant
  part is managed for Roma Capitale by **Azienda Speciale Palaexpo** (registered office Via Nazionale
  194). https://www.turismoroma.it/it/luoghi/mattatoio
- 2002: pavilions 9a and 9b, nearest the Largo/Piazza Orazio Giustiniani entrance, assigned to MACRO
  for contemporary art, first "Macro Future" then "Macro Testaccio"; now run by Palaexpo within the
  Mattatoio project.
- **Hours, from turismoroma:** 11.00–20.00, last admission 19.30, closed Mondays; "Aperto solo in
  caso di mostre in corso." The operator's site showed the same 11.00–20.00 band on 3 September 2026.
- Getting there, from the operator: Metro B Piramide; tram 3 (Marmorata/Galvani); bus 719
  (Galvani/Zabaglia); 170 and 781 (L.go Marzi).
  https://www.mattatoioroma.it/pagine/dove-siamo
- **BANNED PHRASING IN THE OPERATOR'S OWN COPY.** Both the Mattatoio home page and turismoroma say it
  is "uno dei più importanti edifici di archeologia industriale della città". That is a superlative
  and attribution does not save it. Write the dates, the architect, the 25,000 m², the 1975 closure
  and the 2018 handover, and rank nothing.

---

**16. La Pelanda** — `theater` (performance venue within the Mattatoio) — or fold into 15
- "un ampio spazio di circa **5000 metri quadrati**"; the restoration preserved the structures and
  fittings of the "Galleria delle Vasche"; main body a large nave with a truncated-cone chimney and
  metal plant; the restoration was designed as an open, modular, fully walk-through system with large
  glazed surfaces. Used for dance, research theatre, music, installation and workshop work, and for
  production residencies. https://www.turismoroma.it/it/luoghi/mattatoio
- Also houses the **Aula Studio La Pelanda**, a free study room (OSM `amenity=library`,
  41.875533, 12.473361 → Testaccio; https://www.mattatoioroma.it/pagine/aula-studio-la-pelanda).
  At fetch time the operator's site said the study room was closed until weather conditions allowed
  reopening — a dated notice, not a regime.
- **I Rimessini**: two large spaces that once penned "indomiti" animals, being converted to catering
  (turismoroma, future tense — do not publish as open).

---

**17. Città dell'Altra Economia** — `attraction`
Inside the Campo Boario of the ex-Mattatoio, **Largo Dino Frisullo**. 41.874943, 12.472957 →
**Testaccio** (OSM `amenity=exibition_centre`).
- Occupies **3,500 m²** recovered from the old *Pese del Bestiame* (livestock weighbridge) building
  and the canopies and shelters of the Campo Boario; conservative restoration carried out on
  bioarchitecture principles, within the wider Mattatoio recovery that is to become the "Città delle
  Arti". **Opened 2007** (the it.wiki Mattatoio article dates the permanent 3,500 m² premises to
  29 September 2007, on Via del Campo Boario).
- Hosts organic-agriculture and fair-trade markets, training workshops, concerts, festivals; contains
  a bio-bar and a bio-restaurant.
- **Hours, from the operator:** "dal martedì alla domenica, dalle 7,30 alle 24,00." Bike racks and a
  large car park; Metro B Piramide; bus 719 to the stop in front of MACRO.
  https://www.cittadellaltraeconomia.org/
- The operator's own copy contains "uno dei primi spazi in Europa interamente dedicato a…" — a
  priority claim. Banned. Also "15 anni di utopia" and "100+ eventi l'anno" are marketing counts;
  the event count is fine as an operator statement, the "15 anni" is stale.
- The associated **Cafè Boario** appears in OSM at 41.874760, 12.472693 → Testaccio.

---

**18. Villaggio Globale** — `attraction`
Lungotevere Testaccio, in the ex-Mattatoio's former *Campo Boario*. 41.873560, 12.472356 →
**Testaccio** (OSM `amenity=community_centre`).
A long-running self-managed social centre occupying part of the complex; named as one of the current
uses of the ex-Mattatoio in the it.wikipedia infobox for the building. **Its own domain
villaggioglobale.roma.it does not resolve from this network**, so I have no operator source for
hours, programme or current status. **Recommend the verifier treat this as unconfirmed** — a page
that says a venue is open when it may not be is worse than no page. Adjacent OSM artwork "Worldwide
Wall" (41.873422, 12.472392) and a `historic=yes; man_made=tower` object (41.873583, 12.471900) sit
in the same corner, both Testaccio.

---

**19. Scuola Popolare di Musica di Testaccio** — `attraction`
Sala Giovanna Marini, Ex Mattatoio di Testaccio, **Piazza O. Giustiniani 4/a**.
41.876311, 12.473543 → **Testaccio**.
- Founded in Rome in **1975** on the initiative of Bruno Tommaso with other Roman musicians including
  Martin Joseph, Tony Ackerman, Maurizio Giammarco, Giancarlo Schiaffini, Eugenio Colombo, Giovanna
  Marini, Michele Iannaccone and Danilo Terenzi. Early activity partly hosted at the Teatro Spazio
  Zero; residents of Testaccio had priority in enrolment and free access to some workshops. 147
  enrolled and 20 teachers before activity even began; c. 250 by the end of the first term
  (1 March – 30 June 1975), with a cap of 450 imposed within two years for lack of space. European
  tour of Giovanna Marini's *Il Regalo dell'Imperatore* in 1983; library founded 1983, now over 9,000
  titles plus the Fondo Furlan of 18th- and 19th-century manuscripts.
  https://it.wikipedia.org/w/api.php?action=parse&page=Scuola%20popolare%20di%20musica%20di%20Testaccio&prop=wikitext
- Still operating: its own site was advertising enrolment for 2026/27 from 1 September and listing
  concerts in the Sala Giovanna Marini. https://www.scuolamusicatestaccio.it/
- The it.wiki article records a 2005 Premio Filippo Sienbaneck within the Premio Franco Abbiati.
  **An award — per the evidence rules a place's own site does not establish awards, and this is a
  third-party page. I would leave it out.**

---

**20. Università Roma Tre — Dipartimento di Architettura** — `attraction` (marginal)
**Largo Giovanni Battista Marzi, 10.** 41.876034, 12.472238 → **Testaccio**.
Pavilion 7 on Via Aldo Manuzio and the pavilions along Via Beniamino Franklin were converted to
lecture rooms for the Faculty of Architecture in 2000. Contains the Biblioteca di Area delle Arti,
Sezione Architettura "Enrico Mattiello" (OSM, Largo G. B. Marzi 10).
https://architettura.uniroma3.it/ · https://sba.uniroma3.it/biblioteche/biblioteca-di-area-delle-arti/sedi-e-orari/sezione-architettura-enrico-mattiello/
**A working university department. Probably a sentence in the Mattatoio record, not a place.**

**21. Accademia di Belle Arti di Roma — Campo Boario site** — same judgement.
OSM `amenity=college` at 41.873824, 12.473482 → Testaccio, Largo Dino Frisullo. Named by turismoroma
as one of the Mattatoio's occupants.

**22. Centro socio-culturale Ararat** — `attraction` (marginal)
Largo Dino Frisullo, at the Campo Boario. 41.874472, 12.474659 → **Testaccio**. OSM
`amenity=community_centre`, site http://ararat-roma.blogspot.com/ (not fetched). A Kurdish cultural
centre with a real history in the Campo Boario. **I have no fetched source; flagging for the
verifier rather than claiming it.**

---

### 4.5 THE MARKET AND FOOD INFRASTRUCTURE

---

**23. Nuovo Mercato Testaccio** — `shop` (covered municipal market)
Registered office Via Lorenzo Ghiberti; **entrances from Via Beniamino Franklin, Via Alessandro
Volta, Via Aldo Manuzio and Via Lorenzo Ghiberti.** 41.877598, 12.473846 → **Testaccio**.
- **Hours, from the operator: Monday to Saturday, 07.00–15.30.**
  https://www.mercatoditestaccio.it/info/
- The operator describes about **100 stalls**: "100 banchi, 100 storie, 1000 prodotti", and names
  traders including Pescheria Simona e Daniele, CasaManco (pizza alla pala), Mastro Papone Bistrot,
  Antico forno, Macelleria Iegri and Mordi e Vai. https://www.mercatoditestaccio.it/
- The market moved here from Piazza Testaccio: turismoroma dates the transfer to the new Via Galvani
  premises to **2012**, within the redevelopment of Piazza Testaccio; the Sovrintendenza's fountain
  page confirms "il trasferimento del mercato rionale nella nuova sede di via Galvani, angolo via B.
  Franklin" in 2012. The it.wiki rione page gives 2012 as well.
- Beneath it, the archaeological area (§4.4 above, item 4).
- OSM stall-level records with their own market pages: Fuori di zucca (greengrocer), La Contea del
  Pane (bakery), Mania del Gusto (cheese), Vini Sfusi e alla Spina, Max Caffè Piazzetta — each with a
  `mercatoditestaccio.it/banco/...` URL. Individually too small to be places; useful colour.
- Note for the writer: an Inti-Illimani song, "El mercado Testaccio", appears on the 1981 album
  *Palimpsesto* (it.wiki rione page). Charming and checkable.

---

**24. Volpetti** — `shop` (delicatessen)
**Via Marmorata 47.** 41.879027, 12.478667 → **Testaccio**.
Its own site: "Salumeria Volpetti, in via Marmorata 47 (zona Roma Testaccio)… **Dal 1973**", selling
cured meats, cheeses, baked goods and wine. https://www.volpetti.com/
The site's copy is full of unusable material — "il meglio della gastronomia", "i migliori prodotti",
"le eccellenze". Per the evidence rule, the site establishes identity, location and the 1973 trading
date it states about itself; it does not establish quality claims. A related **Volpetti Più**
(OSM `amenity=restaurant`, 41.878433, 12.478111) is a separate address.

**25. Pasticceria Barberini** — `cafe`
**Via Marmorata 41 (OSM: 41–43).** 41.878916, 12.478752 → **Testaccio**.
Own site: open every day, **Mon–Sat 06.00–21.00, Sunday 06.00–20.00**; tel. 06 5725 0431. Uses
*lievito madre*; names its suppliers (Dallagiovanna flours, Valrhona chocolate, Bourbon vanilla).
https://www.pasticceriabarberini.it/ — "elite della pasticceria romana" and "punto di riferimento
dell'alta pasticceria" are unusable.

**26. Pasticceria Linari** — `cafe`
**Via Nicola Zabaglia 9 (OSM: 9/9A).** 41.879441, 12.474732 → **Testaccio**.
Own site, footer: "LINARI ROMA S.R.L. - Via Nicola Zabaglia, 9 - 00153 Roma", tel. 06 5782358;
hours "Tutti i Giorni 06:30-21:30, Martedì 06:30-13:30". Trades as "Linari1971".
https://pasticcerialinari.com/ — the visitor quotes on the page ("best I ever had") are reviews and
not publishable.

**27. Checchino dal 1887** — `restaurant`
**Via di Monte Testaccio 30.** 41.876417, 12.473957 → **Testaccio**.
Own site: "Checchino ristorante a Testaccio dal 1887 per 6 generazioni"; cucina del quinto quarto;
**open Wednesday to Sunday, closed Monday and Tuesday; lunch 12.30–15.00, dinner 19.30–23.00**;
opens on closing days for exclusive bookings of at least 30. Signature dishes named on the site
include insalata di zampi, rigatoni con la pajata, rigatoni al sugo di coda, coda alla vaccinara.
http://www.checchino-dal-1887.com/
The site has a "Premi e riconoscimenti" section — **awards are not establishable from the operator's
own site; do not carry them.**

**28. Felice a Testaccio** — `restaurant`
**Via Mastro Giorgio 29.** 41.878501, 12.477466 → **Testaccio**.
Own site: "Dal 1936"; **open every day, lunch 12.30–15.30, dinner 19.00–23.30**; known for cacio e
pepe finished at the table; the group opened Milan in 2017 and Turin in 2024.
https://www.feliceatestaccio.com/ — "un'istituzione della cucina romana, famosa a livello nazionale e
internazionale" and "celebre per" are unusable.

**29. Flavio al Velavevodetto** — `restaurant`
**Via di Monte Testaccio 97.** 41.876633, 12.476085 → **Testaccio**.
Own site: "Dal '95"; part of a group with Velavevodetto ai Quiriti (Piazza dei Quiriti 4/5) and two
Milan rooms. https://www.ristorantevelavevodetto.it/ — the dining rooms are cut into the flank of
Monte Testaccio, which is the reason a guide would mention it; I did not find that stated on the
operator's own site, so it needs a source before it is written.

**30. Trattoria Perilli** — `restaurant`
**Via Marmorata 39.** 41.878781, 12.478815 → **Testaccio**.
Own site: "A TESTACCIO DAL 1911"; four generations; tel. 06 5755100 / 06 5742415; the family story
begins in the late 1800s with Bernardino Perilli and his wife Irene in Via dell'Oca. The page carries
a Checco Durante poem about the place. https://www.perilliatestaccio.com/
**Superlative on the operator's own page:** "una delle trattorie più antiche di Roma". Banned. "Dal
1911" is a date and is fine.

**31. Lo Scopettaro** — `restaurant`
**Lungotevere Testaccio 7.** 41.882295, 12.475148 → **Testaccio**.
Own site: "situato nel cuore di Testaccio, esattamente sul Lungotevere Testaccio 7 e da oltre 80
anni…". https://loscopettaroroma.com — "una delle trattorie più antiche e famose di Roma" is banned;
"da oltre 80 anni" is a vague duration rather than a date, and I would ask for a founding year.

**32. Da Bucatino** — `restaurant`
**Via Luca della Robbia 84/86.** 41.880339, 12.476859 → **Testaccio**.
Own site: **Tuesday to Sunday, 12.15–15.00 and 19.00–23.55**; tel. 06 5746886.
https://www.dabucatino.it/ — the page shows a Google rating of 4.9 and three customer testimonials.
**Ratings and reviews are not publishable from an operator page.**

**33. Pizzeria da Remo** — `restaurant`
Piazza di Santa Maria Liberatrice 44. 41.880934, 12.475329 → **Testaccio**. OSM only; no official
site found. **Needs a source before it can be written.**

**34. Agustarello a Testaccio** — `restaurant`
Via Giovanni Branca 98. 41.879567, 12.473601 → Testaccio. OSM only, no website. Same caveat.

**35. Trapizzino Testaccio** — `restaurant`
Via Giovanni Branca 88. 41.879711, 12.473764 → **Testaccio**. **trapizzino.it returned HTTP 403** to
every attempt, so I have no operator source. The Testaccio room is widely held to be where the format
started, and I could not verify that from anything I fetched. **Do not publish an origin claim.**

**36. Il Grottino a Testaccio dal 1936** — `restaurant`
Via Marmorata 165. 41.882052, 12.476606 → Testaccio. OSM name carries "dal 1936"; no site fetched.

**37. Antico Forno a Testaccio** — `restaurant` / bakery
Via Amerigo Vespucci 28. 41.880885, 12.474134 → Testaccio. https://www.anticofornotestaccio.com/
(fetched, 200).

**38. Oasi della Birra** — `brewery` (beer bar; the schema has no "bar" kind, `brewery` is the
nearest legal value and the verifier should sanity-check that)
Piazza Testaccio, OSM 41.879762, 12.477474 → Testaccio. No site fetched.

Also present and mapped, offered without individual research: Acquasanta (Via Aldo Manuzio 28, site
`acquasantaroma.com` failed with an SSL error), Da Oio a Casa Mia (Via Galvani 43), Piatto Romano
(Via G. B. Bodoni 58), La Fraschetta di Mastro Giorgio (Via Alessandro Volta 36), Kiki's Kitchen
(Via Beniamino Franklin 9), Osteria degli Amici, Pecorino (Via Galvani 64), Masto (Via Galvani 41),
Comus, Divinare, La Botticella (two of them, Via di Monte Testaccio 25 and Via Bodoni 84/86),
Gelateria Giolitti a Testaccio (Via Amerigo Vespucci 35 — note this is a licensee, not the Via degli
Uffici del Vicario original, and the page must not conflate them), Pizzeria Nuovo Mondo, and about
sixty more in the Overpass dump. **That is a food quarter, not a list of places; the verifier should
expect to keep perhaps eight.**

---

### 4.6 NIGHTLIFE ON MONTE TESTACCIO

The *grottini* dug into the hill are the physical reason this strip exists; the Sovrintendenza and
turismoroma both attest the caves, so the connection is sourced.

**39. L'Alibi** — `attraction` (club)
**Via di Monte Testaccio 40/44, 00153 Roma** (the club's own address; OSM says 34 — trust the
operator). 41.875358, 12.474430 → **Testaccio**.
Own site: "LGBTQIA+ dal 1970 — Testaccio, Roma"; "Fondato alla fine del 1970 sulle pendici di Monte
Testaccio"; runs as a cultural association with ARCO membership; tel. +39 380 8980243.
https://alibiclubroma.com/ — the same page says "Una pietra miliare della cultura romana" and "un
punto di riferimento", which are unusable. The 1970 founding date is publishable.

**40. Akab** (Via di Monte Testaccio 69), **Conte Staccio** (no. 65), **Coyote** (no. 48b),
**Trentatré Testaccio** (no. 33), **Caffè Latino**, **Charro Café** (no. 73), **Euphoria** —
all OSM, all → **Testaccio**, none with a fetched official source. Recorded so the verifier knows the
strip's shape. **I would publish the street, not the individual clubs**, unless someone can source
opening years and current status; club turnover on this street is high and a stale list ages badly.

**41. Via di Monte Testaccio** — `attraction` (the street itself) — see §4.8.

---

### 4.7 THEATRES, CINEMA, MUSEUMS, LIBRARY

---

**42. Teatro Vittoria** — `theater`
**Piazza di Santa Maria Liberatrice 10.** 41.879742, 12.475012 → **Testaccio**; turismoroma's
`POINT (12.4750501 41.8798405)` → Testaccio.
- turismoroma's history, which is unusually detailed: from the early 20th century the Vittoria was
  Testaccio's theatre, a two-storey building on an unpaved square, doing variety; demolished after
  the war and replaced by a block of flats whose ground floor held a cinema, built by the exhibitor
  Amati; the cinema closed at the end of the 1970s; conversion works to a prose theatre began in
  May 1986, commissioned by Attilio Corsini of the Attori & Tecnici cooperative from the architect
  Enrico Nespega, and the theatre opened in December 1986 with **560 red velvet seats**. Corsini died
  in 2008. https://www.turismoroma.it/it/luoghi/teatro-vittoria
- Tel. 06 5781960; tickets via Vivaticket; own site https://www.teatrovittoria.it/ (fetched, 200 —
  it was listing the 2026–2027 season, so the venue is live). The site's "/contatti/" path refused
  the connection, so I have no operator-stated box-office hours; turismoroma says "Per gli orari e le
  modalità di accesso rivolgersi ai contatti indicati". **The honest page gives no hours.**

**43. Teatro di Documenti** — `theater`
**Via Nicola Zabaglia 42, 00153 Roma.** 41.876825, 12.476005 → **Testaccio**. Tel. 06 455 485 78.
Its own site names Luciano Damiani in its "La Storia" navigation (Damiani, the Piccolo Teatro
designer, built this theatre), runs guided visits of the building itself ("Visita del Teatro",
"Visita Spettacolo") and a school programme, and receives POR FESR Lazio 2021–2027 support. At fetch
time the events list read "Nessun Evento". http://teatrodidocumenti.it
**A theatre that sells tours of its own architecture is exactly the kind of thing a guide should
carry.** But I did not fetch the Damiani page itself, so the attribution needs one more click before
it is written.

**44. Teatro Petrolini** — `theater`
**Via Rubattino 5.** 41.880272, 12.473959 → **Testaccio**. Named on the it.wiki rione page with its
official site https://www.teatropetrolini.it/ — **which returned HTTP 403 to me**, so I have no
operator source for programme or status. Flagging rather than claiming.

**45. Teatro Studio Zagreus** — `theater`
Lungotevere Testaccio 1. 41.873784, 12.472278 → **Testaccio**. OSM, site
http://www.teatrostudiozagreus.it/ (not fetched).

**46. Multisala Greenwich** — `theater` (cinema; the schema has no cinema kind)
**Via Giovanni Battista Bodoni 59.** 41.878859, 12.474110 → **Testaccio**. Operated with the Cinema
Mignon under one booking site, https://www.multisalagreenwichroma.com/ (fetched, 200; the page is
mostly a ticketing shell and a cookie notice, so it establishes identity and operation and little
else).

**47. Museo Storico dei Vigili del Fuoco "Roma Città del Fuoco"** — `museum`
**Via Galvani 2** (the museum's own address) / **Via Marmorata 15** (the barracks entrance).
turismoroma lists both points; both test **Testaccio**.
- Operator: "Inaugurato il **18 aprile 2002**, il museo storico dei Vigili del Fuoco di via Galvani 2
  propone… l'evoluzione dell'organizzazione del soccorso nella città di Roma, dall'antichità ai
  nostri giorni." Scenographic reconstructions of the fire of Nero in AD 64, the 847 fire that nearly
  took St Peter's, the Sack of Rome in 1527, and the bombing of Rome of 19 July 1943; sections on
  today's specialisms (divers, helicopter crews, speleo-alpine-fluvial service); two audio-and-effects
  reconstructions of a flat fire and of a collapse after an earthquake; a multimedia room; a
  laboratory bench for combustion experiments.
  https://www.vigilfuoco.it/chi-siamo/memoria-storica/i-musei/museo-storico-di-roma-ostiense
- turismoroma adds that the collection was transferred from the Scuola Antincendi at Capannelle, and
  gives the access rule: **visitable by appointment only**, ufficiostampa.roma@vigilfuoco.it,
  tel. 06 46722237; museum tel. 06 5781495.
  https://www.turismoroma.it/it/luoghi/museo-storico-dei-vigili-del-fuoco
- Note the two sources disagree on one set piece: vigilfuoco.it names the 1527 Sack, turismoroma
  names a 1734 fire at the port of Ripetta. Both are the operator's material; I would name only the
  ones vigilfuoco.it lists, since that is the corps' own page.

**48. Caserma dei Vigili del Fuoco Alberto De Jacobis** — `historic-site`
**Via Marmorata 15, at the corner of Via Luigi Galvani.** 41.878301, 12.479069 → **Testaccio**.
- Designed by the architect **Vincenzo Fasolo**; **inaugurated 28 October 1929**, on the seventh
  anniversary of the March on Rome; named for the vice-brigadier Alberto De Jacobis, killed on
  10 September 1943 during the German occupation of Rome — and, per Roma Segreta, dedicated to him
  from 1994.
- **CONSTRUCTION DATES CONFLICT THREE WAYS and the page must not pick silently:** the it.wikipedia
  infobox says 1926–29; the same article's body says "fra il 1925 e il 1928"; the it.wiki *rione*
  page says 1928–30. All three agree on the 28 October 1929 inauguration. **Publish the inauguration
  date and Fasolo; do not publish a construction span.**
- Description: semicircular plan; the Via Marmorata front has seven large doorways with flat arches
  separated by rusticated pilasters whose capitals carry a fireman's helmet; the entrance at no. 15
  is up seven steps and is flanked by two plaques (I Corpo Vigili del Fuoco Roma, I Settore Ostiense
  — Comando; Distaccamento Alberto De Jacobis); windows on this side are topped by a badge of a sword
  crossed with an axe; a square tower with corbels rises over the internal courtyard.
  https://it.wikipedia.org/w/api.php?action=parse&page=Caserma%20dei%20Vigili%20del%20Fuoco%20Alberto%20De%20Jacobis&prop=wikitext ·
  https://www.romasegreta.it/testaccio/caserma-vigili-del-fuoco.html
- OSM `man_made=tower` at 41.878206, 12.479093 → Testaccio is that tower. Museo diffuso board
  "Caserma dei Vigili del Fuoco" at 41.878028, 12.479410 → Testaccio.

**49. Museo diffuso di Testaccio** — `museum` (a distributed museum, not a building)
- Created by the Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma. turismoroma:
  the route runs across the rione with teaching panels, a play-and-learn area for children, and
  bookable access to the Emporium, the Porticus Aemilia urban archaeological park and the Nuovo
  Mercato archaeological area; a website and a mobile app complete a virtual route. "Percorso
  rionale: accesso libero." Emporium at Lungotevere Testaccio opposite no. 11; market area at
  Via L. Ghiberti 19; bookings sottosopra.testaccio@gmail.com
  https://www.turismoroma.it/it/luoghi/museo-diffuso-di-testaccio
- The it.wikipedia article says the route is spread over "gran parte dei **60 ettari** del Testaccio"
  and lists the full inventory of panels — from which I derived several candidates above, and two
  of the misallocations in §2.
  https://it.wikipedia.org/w/api.php?action=parse&page=Museo%20diffuso%20di%20Testaccio&prop=wikitext
- **The old project domain testaccio.romearcheomedia.it is unreachable from this network** ("Network
  is unreachable"), and the Soprintendenza's own scheda URL
  `soprintendenzaspecialeroma.it/schede/museo-diffuso-del-rione-testaccio_3025/` is the old site
  structure; `/luoghi/museo-della-via-ostiense/` and several sibling paths 404. So the museum's own
  pages are largely gone and turismoroma is the best current source. **Say what the page can honestly
  say; do not narrate the fetch.**
- I counted **17 distinct museo diffuso boards in OSM inside Testaccio**: Emporium ×2, Ex-Mattatoio
  ×2, Il Quartiere Moderno ×3, Il Rione Testaccio nel Tempo, Monte Testaccio, Nuovo Mercato
  Testaccio, Piramide di C. Cestius, Porticus Aemilia ×2, Santa Maria Liberatrice, Schola Collegi,
  Sepolcro di Galba, Edifici di I. Sabbatini, Edificio delle Poste, Caserma dei Vigili del Fuoco,
  Cimitero Acattolico, Cimitero di Guerra del Commonwealth, Campo A.S Roma. **A count is not a
  superlative and this one is a genuinely useful thing to tell a walker.**

**50. Biblioteca Enzo Tortora** — `attraction` (public library)
**Via Nicola Zabaglia 26b.** 41.876963, 12.477893 → **Testaccio**. Part of the Biblioteche di Roma
system, code RMBA3.
https://www.bibliotechediroma.it/opac/library/Biblioteca%20Enzo%20Tortora/RMBA3 (not fetched).
**Marginal.** Recorded.

---

### 4.8 SQUARES, STREETS, FOUNTAINS, GREEN SPACE

---

**51. Piazza Testaccio** — `park` (public square; the schema has no square kind — the verifier should
rule on whether `park` or `attraction` is the right legal value)
41.879548, 12.477060 → **Testaccio**; turismoroma `POINT (12.477186 41.8799658)` → Testaccio.
- turismoroma: one of the rione's two main squares; the rione was instituted in **1921**; in **1905**
  the Comitato per il miglioramento economico e morale di Testaccio obtained the assignment of a
  cleared lot on which the square was made, then called **piazza Mastro Giorgio**; it held the
  district market for many years; in **2015**, after a full restyling with new paving and street
  furniture, the market having moved to Via Galvani, the Fontana delle Anfore was returned to the
  centre. https://www.turismoroma.it/it/luoghi/piazza-testaccio
- The *madonnella* at one corner (see §4.3 item 14).
- OSM `place=square` at 41.879558, 12.477050.
- A plaque at 41.879942, 12.475466 (→ Testaccio) records **Gabriella Ferri**'s birthplace: "Qui è
  nata / Gabriella Ferri / Grande interprete della canzone italiana", dated 2015 (OSM inscription).
  **"Grande interprete" is the plaque's own wording; quoting an inscription is different from the
  page asserting a ranking, but the verifier should decide whether to quote it or paraphrase.**

**52. Fontana delle Anfore** — `historic-site`
Centre of Piazza Testaccio. turismoroma `POINT (12.4766805 41.8794247)` → **Testaccio**.
The Sovrintendenza Capitolina, which owns it, gives the fullest and most reliable account:
- In **1924** the Comune held a national competition for five fountains in newly built quarters; for
  piazza Mastro Giorgio (today piazza Testaccio) the winner was the architect **Pietro Lombardi
  (1894–1984)**. **Inaugurated 26 October 1927.** Ground settlement soon appeared; in **1932** the
  administration proposed moving it to piazza dell'Emporio; Lombardi consented in **1933**; the
  rebuilding works ran in **1935**. Within the piazza Testaccio redevelopment that moved the market in
  2012, the fountain was moved back: **over 350 constituent blocks** dismantled, transported, restored
  and reassembled, individually checked and numbered; a modern hydraulic system restored and
  reactivated the **45 water nozzles**, long inactive; lighting installed inside the four rectangular
  basins for the first time. **Re-inaugurated 24 January 2015.**
  https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_delle_anfore
- Form: entirely travertine, circular plan on a two-step base, surmounted by a tall pinnacle of
  massed amphorae; four elongated basins radiate from the base, each with the Comune's arms crowned
  by a ram's head; the outer arched ends carry amphorae in low relief.
- **DATE CONFLICTS the verifier must resolve.** turismoroma says the fountain was "realizzata nel
  1926" and "Dal 2012… è stata ricollocata"; it.wikipedia says made in 1927, moved in 1935 for ground
  problems, works begun September 2014, restoration cost €900,000, re-inaugurated 24 January 2015.
  The Sovrintendenza's chronology (1924 competition, 1927 inauguration, 1932–35 move, 2015 return) is
  the one I would publish, because it is the owning authority and it is internally consistent.
- turismoroma names Lombardi's other rione fountains — Libri (Sant'Eustachio), Artisti (Campo
  Marzio), Tiare and Palle di Cannone (Borgo), Pigna, Monti, Botte (Trastevere), Timone (Ripa).
  **Several of those rioni are shipped. Do not restate their fountains here; a single sentence that
  the same architect made a series is enough, and it must not rank them.**

**53. Fontana di Pio IX, Lungotevere Testaccio** — `historic-site`
Set into the parapet of the embankment wall, aligned with Via Florio. 41.880243, 12.472059 →
**Testaccio**; and the Sovrintendenza's page states its own field **"Rione: Testaccio"**.
- **Author: Antonio Muñoz (1884–1960). Date: 1939–1940.** Materials: white marble, travertine, brick
  facing. Muñoz built it to close the vista along the street: the 1869 plaque and papal arms, which
  had faced the river, were moved into the parapet and joined to a 3rd-century AD strigillated
  sarcophagus with new work. The plaque commemorates the excavations commissioned by Pius IX and
  conducted in the area by the archaeologist Pietro Ercole Visconti in 1868–1869. Brick front framed
  by two rusticated travertine pilasters topped by spheres and flanked by volutes; the Mastai
  Ferretti arms between two festoons above; a lion's-head spout feeds the sarcophagus; six travertine
  bollards surround it. Restored 1993 and again in 2000 after vandalism damaged the sarcophagus.
  https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_di_pio_ix_in_lungotevere_testaccio
- **DIRECT CONFLICT with it.wikipedia**, which says "Fu costruita nel 1869 sotto il pontificato di
  Pio IX" and describes the basin as a 3rd-century imperial piece. The Sovrintendenza's 1939–40
  Muñoz composition reusing an 1869 plaque explains both accounts and is the owner's own record.
  **Publish 1939–40 / Muñoz; do not publish 1869 as the fountain's date.**
- it.wikipedia does give the Latin inscription and an Italian translation, which is publishable
  quotation if wanted: "Pio IX Pontefice Massimo, ritrovati i gradini dell'Emporio presso il
  Tevere…" (the *Emporii gradibus ad Tiberim repertis* text).
  https://it.wikipedia.org/w/api.php?action=parse&page=Testaccio&prop=wikitext

**54. Fontana del Boccale** — `historic-site`
Via Nicola Zabaglia, in a small masonry exedra. 41.877539, 12.475403 → **Testaccio**.
Built **1931 by Raffaele De Vico**; shaped as a tankard (*boccale*) standing in a circular basin, on
salvaged material from the area, in red coral Vicenza marble. Sourced on the it.wiki rione page to
rerumromanarum.com and romasegreta.it. **The Sovrintendenza's own fountain URL for this one 404s**,
so unlike the other two fountains I have no owner-authority page. Weaker evidence; flag it.

**55. Piazza di Santa Maria Liberatrice and the Giardino Famiglia Di Consiglio** — `park`
41.880248, 12.475209 → **Testaccio** (OSM `leisure=park`, "Giardino Famiglia di Consiglio";
`place=square` for the piazza at 41.880281, 12.475120).
The it.wiki rione page: the square is "il cuore 'sociale' del rione", carrying the parish church and
the theatre, with a large planted garden at its centre named for the **Di Consiglio family**,
murdered at the Fosse Ardeatine — six of them, per Alessandro Portelli's *L'ordine è già stato
eseguito* (Rome 1999, p. 159): "un ragazzo di sedici anni, quello di diciassette, di diciannove, di
ventuno, il padre, il nonno", the grandfather Mosè born in 1870. Small Testaccio traders, hawkers and
butchers.
**This is the single most affecting fact I found in the rione and it is properly sourced to a named
book.** It must be written with care and without embellishment.

**56. Parco Testaccio / ex Campo Testaccio** — `park`
Via Nicola Zabaglia. 41.875879, 12.475165 → **Testaccio** (OSM `leisure=park` "Parco Testaccio";
`leisure=sports_centre` at 41.877538, 12.477120; museo diffuso board "Campo A.S Roma" at
41.876338, 12.476866).
- Campo Testaccio was A.S. Roma's ground, hosting home matches from **3 November 1929 to 30 June
  1940** — 161 matches, 103 won, 32 drawn, 26 lost. Designed by the engineer **Silvio Sensi**, father
  of Franco Sensi, on the model of British grounds and Goodison Park in particular; four wooden
  stands painted in the club's gold and Pompeian red; capacity 20,000; a grass pitch whose dimensions
  could be adjusted; the manager's house stood on the site with a giant club badge painted on its
  outside wall. Cost 1,530,000 lire. Average attendance about 10,000. Ticket prices from 5–6 lire for
  the *popolari* to 30–35 for the covered stand, with 50% off for women, *dopolavoristi*, soldiers and
  university students, and a 2-lire *balilla* rate. Those without tickets watched from the top of
  Monte dei Cocci on the Via Zabaglia side, where the stand roof hid half the pitch. It also hosted
  Rugby Roma for two seasons (1937–39) and one Italy rugby international. Abandoned at the end of
  1939–40 as obsolete and demolished that October. The 5–0 win over Juventus on 15 March 1931 gave
  rise to the film *Cinque a zero* and the nickname *Roma testaccina*; the derby win over Lazio on
  1 November 1933 is the other match the club's own history remembers.
  https://it.wikipedia.org/w/api.php?action=parse&page=Campo%20Testaccio&prop=wikitext
- **Facts to handle carefully:** attendance and win/loss figures are counts, fine. "Famoso per
  l'atmosfera unica" is not. Do not write that this is where Roma was born — the it.wiki rione page
  says the rione "fu la culla dell'A.S.Roma con il suo campo di calcio", which is a claim about a
  club's origin that I have not verified against the club.

**57. Parco Joyce Lussu** — `park`
41.877464, 12.479832 → **Testaccio** (OSM `leisure=park`). No source beyond OSM. Marginal.

**58. Giardino Domenico Pertica** (41.877472, 12.474958) and **Giardino Famiglia di Consiglio**
(41.880248, 12.475209) — both OSM `leisure=park`, both Testaccio.

**59. Via Marmorata** — `attraction` (street)
41.879027, 12.478667 and other points along it → **Testaccio** on the Testaccio side; note that the
street is a *boundary corridor* — the Palazzo delle Poste at no. 4 is in San Saba (§2g). **Any page
about Via Marmorata must not claim the whole street.**
The it.wiki rione page gives the etymology: the marbles landed at the port "diedero il nome alla via
Marmorata che mette in comunicazione il porto di Ripa con la Porta San Paolo", and records that after
Rome's decline the unworked marble lay as *res nullius* for centuries, an open-air quarry of valuable
part-worked stone.

**60. Via di Monte Testaccio and the *grottini*** — `attraction` (street)
Runs round the hill; every address I tested on it (nos. 25, 30, 33, 34, 40/44, 48b, 65, 69, 73, 97)
→ **Testaccio**. Sourced justification for treating it as a place: the Sovrintendenza and turismoroma
both record that caves were cut into the flanks and used as cellars and stables, and turismoroma says
they are "oggi diventati ristoranti e disco-pub che animano la vita notturna di Roma". it.wikipedia
adds that the clay keeps the caves at about 10 °C year round, and that they held taverns from the
Middle Ages.
**"animano la vita notturna di Roma" is turismoroma's phrasing, not a superlative, and is safe to
paraphrase. Do not upgrade it to a ranking.**

**61. Lungotevere Testaccio** — `attraction` (street) — probably folds into Emporium + Fontana di
Pio IX rather than standing alone.

**62. "Il Quartiere Moderno" and the Edifici di Innocenzo Sabbatini** — `historic-site`
Three museo diffuso boards named "Il Quartiere Moderno" at 41.878466/12.473509, 41.879583/12.476489
and 41.879809/12.474537, plus a board "Edifici di I. Sabbatini" at 41.881457, 12.477029 on Via
Marmorata — all → **Testaccio**.
- The it.wiki rione page frames the whole rione as "un esempio tipico di urbanizzazione industriale…
  il rione entro le mura nacque come propaggine residenziale destinata agli operai addetti alle
  attività che si vennero insediando lungo la via Ostiense dalla fine dell'Ottocento", and calls it
  "un esempio unico, a Roma, di urbanizzazione programmata" — **that last clause is a superlative and
  is banned.** The descriptive part is publishable.
- The 1873 first master plan of the capital already put industrial expansion in the Ostiense area,
  favoured by flat ground, the via Ostiense, the river port and the railway.
- The rione was **detached from Ripa in 1921** — this is the single most important administrative
  fact about Testaccio and it is stated plainly: "fu scorporato nel 1921 dal vasto e poco popolato
  rione Ripa". turismoroma independently gives 1921 for the rione's institution.
- Arms: "Di rosso all'anfora d'oro" (gules, an amphora or), cited to Carlo Pietrangeli, "Insegne e
  stemmi dei rioni di Roma", *Capitolium* XXVIII/6, 1953, p. 190.
- Street-naming policy: "Le strade del rione sono dedicate ad esploratori, navigatori, imprenditori,
  armatori, ingegneri, scienziati, editori, tipografi, artisti." A checkable, delightful fact — Volta,
  Galvani, Franklin, Manuzio, Bodoni, Ghiberti, Vespucci, Rubattino, Zabaglia.
- **I did not find a fetchable source naming which blocks are Sabbatini's or dating them.** The board
  exists; the attribution needs one more source before it is written.

**63. Scuola elementare IV Novembre / Istituto Comprensivo Elsa Morante** — `historic-site`
Via Alessandro Volta; it.wiki rione page gives 41.878395, 12.475841 (→ **Testaccio**) and dates the
building to **1920–23** by the architect **Augusto Antonelli**. A working school; I would not send
visitors. Recorded because the architecture is dated and attributed.

**64. Elsa Morante's house and plaque** — `historic-site` (marginal)
41.881565, 12.475380 → **Testaccio**. OSM carries the full inscription: "In questa casa ha abitato
una straordinaria scrittrice italiana / Elsa Morante… Anno 2004". A *Stolperstein* sits at
41.881569, 12.475346. The it.wiki rione page notes that many episodes of *La Storia* are set in
Testaccio, and that Paola Cortellesi's *C'è ancora domani* (2023) is set in the rione.
**"straordinaria" is the plaque's own word.** Quote it as an inscription or leave it; do not adopt it
as the page's voice.

**65. Monumento ai caduti di Testaccio** — `historic-site`
Piazza di Santa Maria Liberatrice (it.wiki rione page). No further source found. Thin.

Also mapped and unresearched: OSM memorial plaque "Grimaldi Italo, Righi Antonio, Celluprica
Francesco", `start_date=1945-10-07`, at 41.876271, 12.473282 → Testaccio, on the Mattatoio side.
Someone should find out who they were.

---

## 5. THINGS I DELIBERATELY DID NOT CLAIM

- **Porta San Paolo, Museo della Via Ostiense, Piazzale Ostiense, Piazza di Porta San Paolo, the four
  1943 memorial plaques** → San Saba / Ostiense. §2a.
- **Piramide metro station, Roma Porta San Paolo rail station, Polo museale ATAC Porta San Paolo,
  Roma Ostiense station** → Ostiense (Q. X). All test outside every rione polygon except Ostiense.
- **Palazzo delle Poste, Via Marmorata 4** → San Saba. §2g.
- **Arco di San Lazzaro, Piazza dell'Emporio, Roseto Comunale, Giardino degli Aranci** → Ripa.
- **Centrale Montemartini** (41.86685, 12.47575) → outside all six polygons, i.e. deeper into
  Ostiense. Named in the rione's own history as part of the Ostiense industrial story, but it is not
  in Testaccio and the page must not imply it is.
- **The tomb of Sulpicius Galba** → Celio. §2f.
- **Basilica di San Paolo fuori le Mura** → Ostiense, and it is a Lateran Treaty Art. 15
  extraterritorial property, which per the `vatican_ruling` publishes under the unit it physically
  stands in with its status stated accurately. Not Testaccio's, and not "in the Vatican".
- **The UNESCO inscription.** OSM carries the relation "Centro storico di Roma, le proprietà
  extraterritoriali della Santa Sede e la basilica di San Paolo fuori le mura". Per the
  `evidence_ruling`, the 1980 inscription is publishable **as an inscription**, but **no rione may
  claim to lie inside the property**, so Testaccio must not say it is in the World Heritage site,
  even though the it.wikipedia infoboxes for Monte Testaccio, the Pyramid, the Emporium and the
  Porticus Aemilia all carry `Parte di = Centro storico di Roma`.

---

## 6. BANNED-LANGUAGE REGISTER — phrases present in my sources that must not reach a page

| phrase | source |
|---|---|
| "tra le più maestose e meglio conservate dell'intera cerchia delle mura Aureliane" | Sovrintendenza, Porta San Paolo |
| "uno dei più importanti edifici di archeologia industriale della città" | mattatoioroma.it home page AND turismoroma, Mattatoio |
| "l'unico monumento superstite" / "uno dei suoi monumenti più riconoscibili" | Soprintendenza Speciale, Pyramid |
| "un sito archeologico unico nel suo genere" | it.wikipedia, Monte Testaccio |
| "l'esempio più antico conosciuto di questa tecnica" (opus reticulatum) | it.wikipedia, Horrea Galbana |
| "il primo monumento funebre individuale conosciuto a Roma" | it.wikipedia, Horrea Galbana / Emporium |
| "una delle trattorie più antiche di Roma" | perilliatestaccio.com AND loscopettaroroma.com |
| "l'unica parrocchia presente nel quartiere" | it.wikipedia, Santa Maria Liberatrice |
| "un esempio unico, a Roma, di urbanizzazione programmata" | it.wikipedia, Testaccio rione |
| "uno dei primi spazi in Europa interamente dedicato a…" | cittadellaltraeconomia.org |
| "il meglio della gastronomia", "i migliori prodotti", "le eccellenze" | volpetti.com |
| "elite della pasticceria romana" | pasticceriabarberini.it |
| "una pietra miliare della cultura romana" | alibiclubroma.com |
| "Testaccio deteneva il primato nazionale del consumo di alcolici" (1884 Comune survey) | it.wikipedia, Testaccio rione — a **primato**, banned, however tempting |
| Google rating 4.9 and three customer testimonials | dabucatino.it — reviews, not publishable |
| 2017 Europa Nostra award (Pyramid); 2005 Premio Sienbaneck (music school); Checchino "Premi e riconoscimenti" | awards, not establishable from the sources I have |

**Method words to keep out of reader text**, since several of my findings turn on them: nothing about
cwgc.org returning 403, nothing about Nominatim, nothing about "could not be reached", "404", "the
domain does not resolve", "vertex", "point-in-polygon", "boundary relation", "re-fetched". Where a
source failed, the page states what it can honestly state — e.g. for the Rome War Cemetery, name the
Commonwealth War Graves Commission as the body that built and maintains it and give no burial count;
for Villaggio Globale and Teatro Petrolini, give no hours.

---

## 7. PHOTOGRAPHS

`"photos": []` everywhere, per ruling 3. Noted for the later image wave: the Cimitero Acattolico is
privately managed and its regulations govern visitor conduct, so any image sourcing there needs the
administration's position checked first; the Mattatoio is managed by Azienda Speciale Palaexpo; the
Pyramid, the Emporium, the Porticus Aemilia and the market's archaeological area are Soprintendenza
Speciale sites. Italy has no freedom of panorama, which the roster already flags for EUR, Flaminio
and Parioli — the same problem will bite on the Fontana delle Anfore only if Lombardi (d. 1984) is
still in copyright, and on any interior of the 1986 Teatro Vittoria.

---

## 8. RAW MATERIAL LOCATION

Working files, Overpass dumps, boundary geometry, wikitext and stripped site text are under
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/t/`
— `geom.json` (six boundary relations), `cands.json` (105-row Overpass enumeration), `wiki/`
(24 Italian Wikipedia articles as raw wikitext), `sites/` (46 fetched pages as stripped text, each
with its URL on line 1). These are scratch files and will not survive the session; every claim above
carries its URL inline so nothing depends on them.
