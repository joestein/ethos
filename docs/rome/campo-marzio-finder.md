# Campo Marzio (R. IV, Roma Capitale toponymic code 104) — FINDER file

Wave 4. Written 2026-09-02. Author: finder agent for Campo Marzio.
Nothing in this file is a shipping decision. A verifier adjudicates; one arbitrator rules ownership
across all nine rioni of this wave. Everything marked STRADDLER is handed up unresolved.

---

## 1. Headline numbers

| | |
|---|---|
| Candidates recorded below | **126** |
| Cleanly inside Campo Marzio by geometry (single rione, every test point) | **108** |
| Straddlers flagged, NOT resolved | **13** |
| Already owned by a shipped rione — must NOT be claimed | **2** (Ponte Regina Margherita → Prati; Basilica di San Lorenzo in Lucina → Colonna) |
| Name traps: sound like Campo Marzio, are not | **7** |
| Photographs sourced | **0**. Ruling 3 — `"photos": []` everywhere. Leads quarantined in §12. |
| Designation claims made | **0**. Ruling 1. One source tries to hand me one; see §11.1. |

**My judgement: Campo Marzio is a GUIDE, not a town page, and it is not close.** It contains the
Spanish Steps, Piazza del Popolo, the Mausoleum of Augustus, the Ara Pacis, the Pincio, Villa
Medici and the Tridente shopping streets. Roma Capitale's own rione page opens by calling it "un
luogo vivace ed elegante, quasi totalmente dedicato allo shopping e al relax". The problem here is
not yield, it is triage: 126 candidates is more than a single page can carry and the verifier will
need to cut, not hunt.

**The shape of the risk is unusual for this programme.** Campo Marzio's weak edge is not thin
churches — it has twenty-seven religious buildings, most of them with real sourced history. The
weak edge is (a) two buildings with **non-Italian sovereign or diplomatic status that is NOT the
Lateran Treaty** and which the vatican_ruling does not directly cover, and (b) a headline café
whose trading status is currently contested in the Consiglio di Stato. Both are in §11.

---

## 2. Corrections to my brief, up front

### 2.1 San Lorenzo in Lucina is Colonna's, and it is already shipped

My brief lists "San Lorenzo in Lucina" as a likely subject. `python3 .superpowers/taken_slugs.py
lucina` returns:

```
  colonna            basilica-di-san-lorenzo-in-lucina-colonna   Basilica di San Lorenzo in Lucina
```

The basilica is in rione Colonna and shipped in wave 2. **Do not take it.** The *piazza* it stands
on is a different object and a genuine straddler (§8), and the **Rome Baptist Church at piazza San
Lorenzo in Lucina 35 is a separate building that Colonna did not take and that both it.wikipedia
and my own geometry place in Campo Marzio** — see §6.4.

### 2.2 The Orologio di Augusto is already shipped, by Colonna, on the institution's own address

`taken_slugs.py augusto` returns `colonna / orologio-di-augusto-colonna`. Colonna's finder recorded
that Roma Capitale gives the monument two addresses — Via in Lucina 16/a (Colonna) and **Via di
Campo Marzio 48 (Campo Marzio)** — and shipped it under Colonna. I am not re-litigating it and I
have not recorded it as a candidate. It is noted here only so the arbitrator knows the Augustan
sundial complex is split across two files by decision, not by accident: the **gnomon obelisk** is
Colonna's (Obelisco di Montecitorio, shipped), the **meridian pavement** is Colonna's, and the
**Ara Pacis and the Mausoleum, the other two members of the same Augustan complex, are Campo
Marzio's** and are in this file.

### 2.3 "In Campo Marzio" in a church name almost never means rione IV

The ancient *Campus Martius* covered nine of today's rioni. it.wikipedia's own rione article says so
explicitly. Churches carrying the tag that are **NOT** in rione Campo Marzio:

| Name | Actually in | Evidence |
|---|---|---|
| Sant'Ignazio di Loyola in Campo Marzio | **Pigna** | already shipped, `taken_slugs.py` |
| Sant'Agostino in Campo Marzio | **Sant'Eustachio** | not this wave's |
| Santa Maria Maddalena in Campo Marzio | **Colonna** | shipped wave 2 |
| Santa Maria in Campo Marzio (Benedictine convent) | Colonna side | see the Colonna dell'Immacolata provenance, §6.2 |

Churches carrying the tag that **ARE** in rione Campo Marzio: **Sant'Antonio in Campo Marzio**
(= Sant'Antonio dei Portoghesi) and **Santa Maria della Concezione in Campo Marzio**. Both tested
inside. A corpus that pattern-matches on the phrase will get four wrong out of six.

### 2.4 The Ara Pacis is two places, not one, and only one of them has a photo problem

My brief is right and it matters enough to write down. The **Ara Pacis Augustae** is an altar voted
by the Senate in 13 BC and inaugurated in 9 BC — ancient, publishable, no photo issue in principle.
The **Museo dell'Ara Pacis** that encloses it is a 2006 building by Richard Meier, who is living.
They have separate Wikidata items (Q623612 / Q3867996), separate OSM ways (`way/201291264` /
`way/201293294`) and separate Roma Capitale pages. Recording them as two candidates. Photos are
zero for both this wave anyway.

### 2.5 The Colosseum and Teatro di Marcello rulings — verified, not inherited

My brief told me to verify rather than inherit. I ran both through my own polygon set:

```
Colosseum centroid   -> ['Celio']
Teatro di Marcello   -> ["Sant'Angelo"]
```

Independently reproduced. Neither is mine and neither is in this file.

---

## 3. Method

### 3.1 Geometry, not reverse geocoding

I used the method the Trastevere finder proposed and the Colonna finder validated. It held up again.

1. Overpass: `rel["boundary"="place"]["place"="quarter"](41.85,12.42,41.95,12.55); out geom;`
   → **22 relations, one per rione.**
2. Stitched unordered member ways into closed rings by endpoint matching. **All 22 resolved to
   exactly one clean closed ring** — no gaps, no multipolygons. Campo Marzio's ring is **215
   points**; the smallest is Pigna at 97, the largest Esquilino at 589.
3. Ray-casting point-in-polygon locally. No per-lookup network call, deterministic, repeatable.
4. For ways and relations I fetched full geometry and tested **every vertex**, so a street reports
   all the rioni it crosses rather than only the one its centroid lands in.

**Campo Marzio's boundary relation:** OSM `relation/5452743`, `ref=R. IV`.
https://www.openstreetmap.org/relation/5452743
Bounding box **41.901127–41.912874 N, 12.471958–12.488000 E** — roughly 1.30 km N–S by 1.33 km E–W.

**The `ref` normalisation trap is confirmed a third time.** 21 rioni carry `ref=R. <numeral>`;
Trastevere alone carries bare `ref=XIII`. Any join on `ref` drops exactly one row.

**Polygon sanity check** — 15 landmarks with independently known rioni, run before I trusted
anything:

```
Colonna of Marcus Aurelius -> Colonna        Trevi Fountain      -> Trevi
Pantheon                   -> Pigna          Piazza Navona       -> Parione
Spanish Steps              -> Campo Marzio   Colosseum           -> Celio
Teatro di Marcello         -> Sant'Angelo    Piazza del Popolo   -> Campo Marzio
Mausoleum of Augustus      -> Campo Marzio   Ara Pacis           -> Campo Marzio
Palazzo Borghese           -> Campo Marzio   San Lorenzo in Lucina -> Colonna
Villa Medici               -> Campo Marzio   Trinità dei Monti   -> Campo Marzio
Pincio terrace             -> Campo Marzio
```

15/15. The two that matter most as controls are San Lorenzo in Lucina landing in **Colonna** (it
would be the easy false positive here, since the piazza is mostly Campo Marzio) and the two wave-1
rulings reproducing.

### 3.2 Overpass notes for the next finder

- Confirming Colonna's finding: **`out geom tags;` on a relation returns tags and an empty member
  list.** Use `out geom;`. Print ring counts before trusting anything.
- **A single Overpass query with a dozen `nwr[...]` clauses will hang for an hour without emitting
  a line.** My first harvest ran 40 minutes across all four mirrors and produced nothing; I killed
  it. Splitting the same work into **eight one-or-two-clause queries with `flush=True` printing**
  finished each in under 90 seconds. Do not batch Overpass filters. Chunk them and print as you go.
- Mirrors that worked: `overpass-api.de`, with `overpass.kumi.systems`,
  `overpass.private.coffee`, `overpass.osm.jp` as fallbacks.

### 3.3 Sources actually reached, ranked by how much I trust them

| Source | Status | What it carries |
|---|---|---|
| **OpenStreetMap / Overpass** | 200 | Geometry only. Nothing else. |
| **turismoroma.it** (Roma Capitale, Dip. Grandi Eventi, Sport, Turismo e Moda) | 200 | The strongest institutional source for this rione. Per-place pages with a `POINT(lon lat)`, a street address, opening hours and substantial prose on architects and dates. **35 of 105 slugs I guessed resolved**; the rest 404. No enumerable index. |
| **turismoroma.it `/it/page/rione-iv-campo-marzio`** | 200 | **Roma Capitale's own street-by-street boundary definition for R. IV.** Quoted in full at §4. This is the single most valuable fetch in this file. |
| **turismoroma.it `/it/tag/negozi-storici`** | 200 | Roma Capitale's own shortlist of *botteghe storiche* with addresses. Three of the eight are in Campo Marzio. This is the register the Colonna finder could not reach on `comune.roma.it`; **it is reachable here, under a different path.** |
| **sovraintendenzaroma.it** | 200 | Roma Capitale's heritage voice. Author, date, material and original water supply per fountain/monument. Its `/fontane` index enumerates **44 fountains city-wide**, five of which are Campo Marzio's. |
| **Official sites of the institutions** | mixed | villamedici.it, fondazionedechirico.org, allsaintsrome.org, canovatadolini.com, abaroma.it, trinitadeimonti.net, chiesadegliartisti.it, casadigoethe.it, arapacis.it all 200. `ksh.roma.it` (Keats-Shelley) is behind an Anubis proof-of-work wall and returned only the challenge page — **the museum's own hours are therefore unsourced and no page may state them.** |
| **it.wikipedia (`action=parse` / `action=query`)** | 200 | Enumeration and leads. Attribute it or replace it. |
| `comune.roma.it` / `dati.comune.roma.it` | not retried | Recorded unreachable by scope research. |
| Vincoli in Rete / Catalogo generale | not reachable | Per the evidence_ruling. **No designation claims anywhere in this file.** |

---

## 4. The boundary, from Roma Capitale itself

turismoroma.it's own R. IV page states the rione's perimeter as a named-street ring:

> **Confini**: piazzale Flaminio, via Luisa di Savoia, lungotevere Arnaldo da Brescia, lungotevere
> in Augusta, piazza del Porto di Ripetta, lungotevere Marzio, via del Cancello, via dei Portoghesi,
> via della Stelletta, piazza Campo Marzio, via degli Uffici del Vicario, via di Campo Marzio,
> piazza San Lorenzo in Lucina, via Frattina, piazza Mignanelli, via dei Due Macelli, via Capo le
> Case, via Francesco Crispi, via di Porta Pinciana, viale del Muro Torto.
> — https://www.turismoroma.it/it/page/rione-iv-campo-marzio

it.wikipedia's rione article gives the same ring as a neighbour list, and the two agree:

> Il rione confina con: **Quartiere Flaminio** (Municipio II) — lungo le mura a sinistra di Porta
> del Popolo, piazzale Flaminio; **Ludovisi** — via di Porta Pinciana, via Francesco Crispi;
> **Colonna** — via Francesco Crispi, via Capo le Case, via dei Due Macelli, via Frattina, piazza
> San Lorenzo in Lucina, via di Campo Marzio; **Sant'Eustachio** — piazza Campo Marzio, via della
> Stelletta, via dei Portoghesi; **Ponte** — via del Cancello; **Tevere**.
> — https://it.wikipedia.org/wiki/Campo_Marzio

**Four neighbours plus the Tiber plus a quartiere.** Note what this means structurally, exactly as
it meant for Colonna: **almost every one of Campo Marzio's land borders runs down a named shopping
street.** Via Frattina, via dei Due Macelli, via di Campo Marzio and via Francesco Crispi are the
boundary; they are not near it. That is why §8 is long and why the arbitrator will have real work
on the Tridente.

Also note the north-west border is the **river**, and the north border is **Quartiere Flaminio,
Municipio II** — not a rione at all. Campo Marzio is the only rione in this wave with a municipio
boundary on it. The roster carries Flaminio as an in-scope quartiere (Q. I, code 201), so the two
files can meet there; the arbitrator should know the Porta del Popolo / piazzale Flaminio line is
that meeting point.

---

## 5. Special-status buildings — read §11 before writing any of these

Campo Marzio contains **three** buildings whose legal status is neither "ordinary Italian building"
nor "Lateran Treaty extraterritorial property", and the vatican_ruling does not cover any of them
directly. They are recorded as candidates in §6 with their facts, and the status question is
isolated in §11 so the verifier can rule on wording once.

- **Palazzo Magistrale**, Via dei Condotti 68 — Sovereign Military Order of Malta.
- **Palazzo di Spagna**, Piazza di Spagna — Embassy of Spain to the Holy See.
- **Palazzo di Propaganda Fide** — a genuine Lateran Treaty property, and **it is in Colonna, not
  here**, but it fronts Campo Marzio's piazza. §8.

---

## 6. Candidates, cleanly inside Campo Marzio

Every entry below tested **Campo Marzio and nothing else** on every point I tried. Straddlers are
in §8, not here.

### 6.1 Antiquity, and the Augustan complex

**1. Ara Pacis Augustae** — historic-site. The altar itself, not the museum.
- Voted by the Senate in **13 BC**, inaugurated **9 BC**, to mark Augustus' return from Gaul and
  Spain. https://it.wikipedia.org/wiki/Ara_Pacis
- Roma Capitale: "L'altare venne edificato lungo la via Flaminia, al confine del Campo Marzio
  settentrionale, ma la natura alluvionale dell'area e le inondazioni del Tevere … determinarono ben
  presto l'interramento dell'Ara." Reconstruction was decided for the **1937/8 bimillenary of
  Augustus' birth**, entrusted to the archaeologist **Giuseppe Moretti**, and physically carried out
  in the summer of **1938** inside a pavilion on via di Ripetta designed by **Vittorio Ballio
  Morpurgo**. https://www.turismoroma.it/it/luoghi/museo-dellara-pacis
- it.wikipedia adds the siting fact, which is a *measurement* and so publishable: the original site
  was one Roman mile (1,472 m) from the pomerium.
- Geometry: `way/201291264`, wikidata Q623612 → Campo Marzio.
- CAUTION: turismoroma calls it "uno degli esempi più alti dell'arte classica". Superlative. Drop it.

**2. Mausoleo di Augusto** — historic-site. Piazza Augusto Imperatore.
- Begun **28 BC** on Octavian's return from Egypt, in the then-unurbanised northern Campo Marzio.
  Diameter **300 Roman feet, about 87 m**. Bronze *Res Gestae* tablets stood near the entrance;
  their text is transcribed on the wall of the Ara Pacis museum. Ashes of Octavia, Marcellus,
  Agrippa, Drusus, Germanicus, Livia, Tiberius, Agrippina, Caligula, Britannicus, Claudius and
  Poppaea were deposited there; **Nerva was the last emperor buried in it**.
  https://www.turismoroma.it/it/luoghi/mausoleo-di-augusto
- Two granite obelisks stood in front of it and were reused — one at piazza dell'Esquilino behind
  Santa Maria Maggiore (1587), the other in the fontana dei Dioscuri at piazza del Quirinale (1783).
  Same source. **Both of those destinations are already-shipped places in other rioni** — Monti owns
  `obelisco-esquilino-rome`, Trevi owns `trevi-fontana-dei-dioscuri-monte-cavallo`. A cross-reference
  the corpus can honestly make.
- Later used as fortress, garden, amphitheatre, and in the early 1900s a **concert hall**. Restored
  1936–38 with the demolition of the surrounding quarter.
- **STATUS, and it must agree with the prose:** turismoroma's own Orari field reads *"Dal 6 GIUGNO
  2022 il Mausoleo è CHIUSO per consentire l'avanzamento dei lavori di riqualificazione di piazza
  Augusto Imperatore."* A second phase of work began in **2025**; completion is stated as **end of
  2026**. Any record shipping now must carry a closed status. The page also names **Rem Koolhaas**
  as designer of the forthcoming museum layout and **Bvlgari** as funder — Koolhaas is living, which
  is a photo problem for a later wave, not a text problem now.
- CAUTION: "è il più grande sepolcro circolare che si conosca" — superlative, attributed to Roma
  Capitale, still banned. The **87 m diameter** carries the same information legally.
- Geometry: `relation/2709954`, Q770847 → Campo Marzio.

**3. Porta del Popolo** — historic-site. Piazzale Flaminio.
- Built under **Aurelian, 3rd century**, also known as Porta Flaminia because the via Flaminia left
  the city through it "ed esce tuttora". Outer façade commissioned by **Pius IV from Michelangelo**,
  who passed the job to **Nanni di Baccio Bigio**, executed **1562–1565**, modelled on the Arch of
  Titus; its four columns came from the old St Peter's. Statues of Peter and Paul by **Francesco
  Mochi**, 1638. Inner façade by **Gian Lorenzo Bernini** for Alexander VII, for the arrival of
  **Christina of Sweden on 23 December 1655** — the inscription "Felici faustoque ingressui MDCLV"
  records it. https://www.turismoroma.it/it/luoghi/porta-del-popolo
- Geometry: `way/798054736`, Q1760057 → Campo Marzio.
- Nice detail for the page, sourced: the service door still carries the older spelling **"Campo
  Marzo"**, the rione's name until the Napoleonic period. https://it.wikipedia.org/wiki/Campo_Marzio

**4. Obelisco Flaminio** — historic-site. Centre of piazza del Popolo.
- Carved **c. 1300 BC** for the temple of the Sun at Heliopolis, hieroglyphs ordered by **Seti I and
  Ramesses II**. **25.90 m** tall; **36.50 m** with base and cross. Brought to Rome in **10 BC** and
  set on the spina of the Circus Maximus by Augustus. Re-erected in piazza del Popolo in **1589**
  under Sixtus V. In **1823** Leone XII had **Valadier** give it a raised base with the lion
  fountains. https://www.turismoroma.it/it/luoghi/obelisco-flaminio
- CAUTION: the same page calls it "uno dei più importanti obelischi della città e il primo a essere
  portato dall'Egitto a Roma". The first clause is a superlative and must go; **"the first obelisk
  brought from Egypt to Rome"** is a sequence claim, which the rules explicitly permit — but note
  turismoroma's own piazza del Popolo page words it as "fu il primo obelisco a essere trasferito a
  Roma, al tempo di Augusto", so the safe form is *brought to Rome under Augustus, in 10 BC*.
- Geometry: `way/103363773`, Q568194 → Campo Marzio.

**5. Obelisco Sallustiano** — historic-site. Piazza della Trinità dei Monti, at the top of the
Spanish Steps.
- it.wikipedia: "un obelisco di Roma situato in piazza della Trinità dei Monti di fronte
  all'omonima chiesa in cima alla scalinata che porta a piazza di Spagna, nel rione Campo Marzio."
  https://it.wikipedia.org/wiki/Obelisco_Sallustiano
- **NAME TRAP.** It is called Sallustiano because it came from the Horti Sallustiani. It is **not in
  rione Sallustiano**, which is already shipped, and `taken_slugs.py` confirms Sallustiano did not
  take it. Geometry: `way/202351242`, Q784104 → Campo Marzio.
- Sourced companion fact: Sixtus V's new strada Felice (today via Sistina) was framed between two
  obelisks, "l'Esquilino e il Sallustiano".
  https://it.wikipedia.org/wiki/Via_Gregoriana

**6. Obelisco del Pincio (Obelisco di Antinoo)** — historic-site. Viale dell'Obelisco / piazza
Bucarest, Pincio.
- Roma Capitale: "l'obelisco che l'imperatore Adriano aveva dedicato al suo favorito Antinoo:
  rinvenuto nei pressi di Porta Maggiore, l'obelisco venne trasportato e collocato al Pincio nel
  **1822** per volere di Pio VII."
  https://www.turismoroma.it/it/luoghi/terrazza-e-passeggiata-del-pincio
- Geometry: `way/1183619459`, Q3348567 → Campo Marzio.

**7. Muro Torto** — historic-site. The stretch of the Aurelian Walls behind the Pincio.
- it.wikipedia: "un antico muro di sostruzione di Roma, che dà il nome al viale del Muro Torto,
  alle spalle del Pincio e al confine con villa Borghese."
  https://it.wikipedia.org/wiki/Muro_Torto
- OSM carries two wall ways tagged `historic=citywalls`, `way/1050857480` and `way/1050857483`,
  both testing Campo Marzio.
- **STRADDLER-ADJACENT, see §8.9.** The *wall* tests inside; a point on the *viale* named after it
  (12.4830, 41.9100) tests **OUTSIDE ALL 22 RIONI** — it is in the Villa Borghese gap between the
  rione ring and Q. III Pinciano. Roma Capitale lists "viale del Muro Torto" as the rione's
  boundary, which is consistent: the road is the edge.

**8. Porto di Ripetta (site) and the Fontana del Porto di Ripetta** — historic-site.
- it.wikipedia: "uno scalo fluviale di Roma situato lungo il Tevere, nell'area antistante alla
  chiesa di San Girolamo dei Croati." https://it.wikipedia.org/wiki/Porto_di_Ripetta
- Roma Capitale's Sovrintendenza names it in one breath with the Spanish Steps and the Trevi
  Fountain as the three great 18th-century Roman urban works, and states plainly that it was
  **demolished at the end of the 19th century**.
  http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/scalinata_di_trinita_dei_monti
- it.wikipedia's rione history: the port was buried under **Ponte Cavour**, built 1902 downstream.
- The surviving fountain is OSM `way/551346066`, Q3747369, tagged `it:Fontana del porto di Ripetta`
  → Campo Marzio. There is also `way/634760438` "Fontana del porto di Ripetta" tagged as a park.
- Honest framing for the page: this is a *lost* place with a surviving fountain, and the record
  should say so rather than imply a visitable port.

**9. Anfiteatro di Statilio Tauro** — **DO NOT SHIP HERE.** it.wikipedia lists it under Campo
Marzio's "Altro" section, but its coordinate (41.900105, 12.469811) tests **Ponte**, and the
building is destroyed and its site disputed. it.wikipedia: "fu il primo anfiteatro permanente
costruito a Roma." Recording it only so the next reader does not re-find it.
https://it.wikipedia.org/wiki/Anfiteatro_di_Statilio_Tauro

### 6.2 Piazza di Spagna and its furniture

**10. Piazza di Spagna** — attraction.
- Roma Capitale: commercially important already in the 15th century "per la presenza di molti
  alberghi e di case abitate da stranieri, richiamati in questa zona dalle rappresentanze dei
  governi spagnolo e francese." https://www.turismoroma.it/it/luoghi/piazza-di-spagna
- it.wikipedia: named for the Palazzo di Spagna, seat of the Spanish embassy to the Holy See **from
  1622**; seen from above the piazza has a butterfly-wing shape, two triangles meeting at a vertex.
  https://it.wikipedia.org/wiki/Piazza_di_Spagna
- Geometry: `relation/13474926`, Q15124814. **Vertex test: Campo Marzio 83 / Colonna 3** — the three
  Colonna vertices are its southern kerb. Colonna's own finder reached the same count and its
  arbitration left the piazza to Campo Marzio. I record it as **effectively clean but noted**, and
  as the reason Propaganda Fide is a trap (§8.1).

**11. Scalinata di Trinità dei Monti (the Spanish Steps)** — historic-site.
- Roma Capitale's Sovrintendenza: built **1723–1726** to the design of the Roman architect
  **Francesco De Sanctis (1693–1740)**. The idea of a stair is documented as early as **1559**;
  twenty years later the Camera Apostolica bought the land; in **1660** the bequest of the Frenchman
  **Stefano Gueffier** produced the first designs, among them one attributed to Bernini's workshop
  which proposed the concave/convex walls and the pincer ramps. A dispute between the Papal State and
  the French crown over ownership of the ground delayed everything; **Clement XI** held a competition
  in **1717**; work began under **Innocent XIII** (whose Conti eagles appear with the French fleurs-
  de-lis on the cippi) and was finished under **Benedict XIII in 1726**.
  http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/scalinata_di_trinita_dei_monti
- Same source, sourced dates for the modern history: full restoration **1995**; restored again from
  **October 2015**, reopened **22 September 2016**, walkable again from **23 September 2016**.
- Geometry: `way/134400816`, Q848072 → Campo Marzio. Also turismoroma
  https://www.turismoroma.it/it/luoghi/scalinata-di-trinita-dei-monti with `POINT (12.482529 41.905973)`.

**12. Fontana della Barcaccia** — historic-site.
- Roma Capitale: **1626–29**, by **Pietro Bernini**, father of Gian Lorenzo. Boat-shaped with
  identical bow and stern in an oval basin; the low gunwales make it look as if it is sinking. Two
  large **Urban VIII coats of arms with three bees** on the outside of bow and stern, water issuing
  from mock gunports beside them. The name refers to the boats used on the Tiber at the nearby port
  of Ripetta; the Sovrintendenza also records the naumachia tradition and the Tiber floods that
  carried boats up to the foot of Trinità dei Monti as rival explanations.
  https://www.turismoroma.it/it/luoghi/piazza-di-spagna ·
  http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_della_barcaccia
- Geometry: `way/662008076`, Q1114231 → Campo Marzio.
- Note the attribution conflict to resolve before shipping: turismoroma's piazza page says "opera di
  Pietro Bernini, padre di Gian Lorenzo"; it.wikipedia says "realizzata da Pietro Bernini e da suo
  figlio". Write the joint form, or attribute each.

**13. Colonna dell'Immacolata** — historic-site. Piazza Mignanelli.
- Roma Capitale: inaugurated **8 December 1857**. The column was found in **1777** in the convent of
  the Benedictines of **Santa Maria in Campo Marzio**; unfinished, so probably never used. It lay
  near Palazzo Montecitorio for about eighty years until **1854**, when **Pius IX** decided to raise
  a monument after promulgating the dogma. Funded by **Ferdinand II of the Two Sicilies** as a
  gesture of reconciliation after the lapse of the Chinea tribute; architect **Luigi Poletti**.
  Cipollino column about **12 m** high, diameter nearly **1.5 m**; four reliefs on the base; statues
  of Moses, Isaiah, Ezekiel and David at the corners; bronze Virgin **4 m** high by **Giuseppe
  Obici**. Raised by **220 firemen**, which is why the Vigili del Fuoco lay a wreath every 8 December.
  https://www.turismoroma.it/it/luoghi/colonna-dellimmacolata
- **Date conflict to resolve:** turismoroma says inaugurated **8 December 1857**; it.wikipedia says
  "L'8 settembre 1857 Papa Pio IX inaugurò la Colonna dell'Immacolata".
  https://it.wikipedia.org/wiki/Piazza_di_Spagna · https://it.wikipedia.org/wiki/Colonna_dell%27Immacolata_(Roma)
  Prefer Roma Capitale, or state neither.
- Geometry: `way/202121644`, Q429103 → Campo Marzio.

**14. Keats-Shelley Memorial House** — museum. Piazza di Spagna 26.
- Roma Capitale: the house where **John Keats died in 1821**; Shelley and Byron, the museum's other
  two poets, also lived in the district. **First opened to the public in 1909.** The 18th-century
  building "appare molto simile a com'era quando Keats arrivò a Roma". Holds letters, manuscripts,
  portraits and relics; two terraces, a bookshop, a screening room.
  https://www.turismoroma.it/it/luoghi/keats-shelley-house · `POINT (12.482309 41.905774)`
- Geometry: `way/202110420`, Q1133966 → Campo Marzio.
- **HOURS ARE UNSOURCED.** `ksh.roma.it` serves an Anubis proof-of-work challenge page and no
  content. The page must say something like *"No source available here states its opening hours, so
  none are given"* — never why.

**15. Casa Museo Giorgio de Chirico** — museum. Piazza di Spagna 31.
- The Fondazione's own site: de Chirico settled there in **1948, aged sixty**, and lived and worked
  the last thirty years of his life in the three-floor apartment-studio, now visitable.
  Open **Monday, Tuesday, Thursday, Friday, Saturday and the last Sunday of the month**; closed
  Wednesday. Guided visits only, **maximum 15 people per slot**; tickets **€8 full, €5 reduced
  (under 18, over 65), free under 12**, paid at the house on the day of the visit.
  https://www.fondazionedechirico.org/casa-museo/
- Geometry: hand-tested at 12.48256, 41.90536 → Campo Marzio.
- Not in my brief; a real find. de Chirico is also independently attested as a via Margutta figure
  and a Caffè Greco regular, so the rione has a de Chirico thread running through three records.

**16. Babingtons** — cafe. Piazza di Spagna 23.
- Roma Capitale's *botteghe storiche* register: founded in **1893** by **Anna Maria Babington and
  Isabel Cargill**; today run by Isabel's great-grandchildren **Chiara and Rory**. Open **Monday to
  Sunday 10.00–21.15**. https://www.turismoroma.it/it/luoghi/sala-da-babington
- Geometry: `node/1172691363`, Q2892984 → Campo Marzio.
- CAUTION: the same page says "la prima sala da tè di Roma e d'Italia". Superlative-shaped. The
  **1893 founding date** carries the interest without the claim.
- Sourced companion fact: it.wikipedia records that the text of Pavese's *Passerò da piazza di
  Spagna* is on a plaque near Babington's. https://it.wikipedia.org/wiki/Piazza_di_Spagna

**17. Palazzo di Spagna** — historic-site. Piazza di Spagna. **Special status, see §11.2.**
- it.wikipedia: seat of the Spanish embassy to the Holy See, "dalla quale la piazza assunse il nome
  nel XVII secolo"; extends onto via Borgognona and via Mario de' Fiori; site area **3,589 m²**,
  **11,000 m²** of building including plantings and terraces.
  https://it.wikipedia.org/wiki/Palazzo_di_Spagna
- Geometry: `relation/326198`, Q9054484 → Campo Marzio.

**18. Palazzo Gabrielli-Mignanelli** — historic-site. Piazza Mignanelli 22.
- it.wikipedia: "si trova a Roma, al numero civico 22 di piazza Mignanelli, della quale costituisce
  lo scenografico sfondo." https://it.wikipedia.org/wiki/Palazzo_Gabrielli-Mignanelli
- Geometry: `relation/2713738`, Q2277048 → Campo Marzio.
- **Thin.** One sourced sentence. Flagging as weak-edge.

**19. Piazza Mignanelli** — attraction. turismoroma has a page,
https://www.turismoroma.it/it/luoghi/piazza-mignanelli, `POINT (12.483356711755 41.90518677829)`,
but the body is only 1,261 characters and mostly navigation. **Thin.** Probably folds into the
Colonna dell'Immacolata record rather than standing alone.

### 6.3 Piazza del Popolo, the Tridente head, and its five fountains

**20. Piazza del Popolo** — attraction.
- Roma Capitale: the vertex where **via del Babuino, via di Ripetta and via del Corso** meet.
  Urbanisation begins in the second half of the 16th century with a first fountain by **Giacomo
  Della Porta** (today in piazza Nicosia) and the obelisk in **1589**.
  https://www.turismoroma.it/it/luoghi/piazza-del-popolo
- The Sovrintendenza gives the fullest sequence: first fountain **1572** by Della Porta, "architetto
  del Popolo Romano"; obelisk **1589** under Sixtus V; Porta del Popolo transformed by Bernini and
  the twin churches built during the 1600s; the whole-square redesign begun by **Giuseppe Valadier
  in 1811**, continued with the French architect **L.M. Berthault** in the Napoleonic years, and
  finished in **1828**, giving "una grande ellisse incentrata sull'obelisco e delimitata da due
  emicicli". Full restoration and pedestrianisation **1997–1998**.
  http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_dei_leoni_in_piazza_del_popolo
- Geometry: `relation/318583`, Q824997 → Campo Marzio at centre, north edge and south edge.

**21. Fontana dei Leoni** — historic-site. Centre of piazza del Popolo, around the obelisk.
- Sovrintendenza: **Giuseppe Valadier (1762–1839)**, **1814–1828**, marble and travertine, originally
  fed by the **acquedotto Vergine**. Four round travertine basins at the corners of the stepped base,
  with white marble **Egyptian-style lions** on stepped truncated pyramids. It replaced the
  16th-century fountain, which was dismantled and later re-erected in **piazza Nicosia**. Maintenance
  work in **2015**. Same URL as above.

**22. Fontana del Nettuno (piazza del Popolo)** — historic-site. The western hemicycle.
- Sovrintendenza: completed **1823**; **Valadier and Giovanni Ceccarini (c. 1790–1861)**; travertine
  semicircular basin, a great travertine shell above it, Neptune with a trident in his right hand,
  two tritons on dolphins at his feet. Valadier's original scheme included two small ground-level
  lakes at the foot of the hemicycles, never built.
  http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_del_nettuno_in_piazza_del_popolo
- Geometry: `way/201608823`, Q5465137 → Campo Marzio.

**23. Fontana della Dea Roma (piazza del Popolo)** — historic-site. The eastern hemicycle, under the
Pincio.
- Sovrintendenza: completed **1823**, **Valadier and Ceccarini**. Armed Dea Roma flanked by seated
  figures of the **Tiber and the Aniene**, with the she-wolf and twins at her feet.
  http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_della_dea_roma_in_piazza_del_popolo
- Geometry: `relation/11496554` (OSM name "Fontana della Dea di Roma") → Campo Marzio. OSM also
  carries the two river gods as separate artwork nodes, "Tevere" `node/6708697871` and "Aniene"
  `node/6708697872`.
- **NAME COLLISION, flag it.** Campitelli has already shipped `fontana-della-dea-roma-campidoglio`.
  The Sovrintendenza itself keeps two distinct pages, `fontana_della_dea_roma_in_piazza_del_popolo`
  and `fontana_della_dea_roma_in_piazza_del_campidoglio`. **Any Campo Marzio record must carry the
  piazza in its name and slug** or the corpus will read as having shipped one fountain twice.

**24. Fontane sarcofago di piazza del Popolo** — historic-site. Two of them, at the north end.
- Sovrintendenza: part of Valadier's **1814–1828** furnishing of the square; they replaced a
  drinking trough and a wash-house "che fino al Settecento davano al luogo un carattere agreste".
  One is set against **Santa Maria del Popolo**, for which Valadier designed the sacristy and the
  whole convent flank; the other against the opposite **"Giacomo Acqua" barracks**, formerly the
  papal guards', also his. The strigilated sarcophagus by the church carries a portrait of a married
  couple in a clipeus and dates to the **mid-3rd century AD**; the other, with a single togate male
  figure, to the **last quarter of the same century**.
  http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontane_sarcofago_in_piazza_del_popolo
- A genuinely good small record: two reused Roman sarcophagi doing municipal work.

**25. Basilica di Santa Maria del Popolo** — historic-site. Piazza del Popolo 12.
- Roma Capitale: grew in the 15th century from a small chapel built at the wish of **Paschal II** at
  the expense of the Roman people, "da cui prende il nome". The **Cappella Chigi**, second on the
  left, designed by **Raphael** for the banker **Agostino Chigi from 1513** and finished only
  **1652–1656** with **Bernini's** intervention for Alexander VII Chigi; Raphael made the cartoons
  for the dome mosaics and the design for the pyramid tombs, executed by **Lorenzetto, Raffaello da
  Montelupo and Bernini**. The **Cappella Cerasi** in the left transept holds two **Caravaggio**
  canvases, the *Crocifissione di San Pietro* and the *Conversione di San Paolo*, both around
  **1601**, commissioned in **September 1600** by **Tiberio Cerasi**, treasurer of Clement VIII; the
  altarpiece *Assunzione della Vergine* is by **Annibale Carracci**. The **Cappella del Presepio (della
  Rovere)** is by **Andrea Bregno**, late 15th–early 16th century, frescoed by **Pinturicchio and his
  workshop**. https://www.turismoroma.it/it/luoghi/basilica-di-santa-maria-del-popolo
- Hours: the Roma Capitale page declines to state them — "Per gli orari delle messe e le modalità di
  visita rivolgersi ai contatti indicati" — and gives the parish site
  `www.agostiniani.it/comunita-agostiniane-provincia/parrocchia-santa-maria-popolo` and phone
  **06 45675909**. `santamariadelpopolo.it` returns 200 but is a large single-page site I did not
  extract a clean timetable from. **Treat hours as unsourced unless someone confirms them.**
- Sourced sequence fact, not a superlative: Sixtus V's bull made it one of the **"sette chiese"**
  pilgrims were to visit, replacing San Sebastiano fuori le Mura.
  https://www.turismoroma.it/it/luoghi/obelisco-flaminio
- CAUTION: "uno degli edifici più significativi del Rinascimento romano" — drop.
- Geometry: `way/52430153`, Q869513 → Campo Marzio.

**26. Chiesa di Santa Maria dei Miracoli** — historic-site. Piazza del Popolo, between via del Corso
and via di Ripetta.
**27. Basilica di Santa Maria in Montesanto (Chiesa degli Artisti)** — historic-site. Piazza del
Popolo 18, between via del Corso and via del Babuino.
- The pair must be written together and then separated. Roma Capitale: both originally designed by
  **Carlo Rainaldi**, both completed by **Bernini with Carlo Fontana**; conceived as symmetrical but,
  for want of space, with different plans and different domes — **octagonal for Santa Maria dei
  Miracoli, dodecagonal for Santa Maria in Montesanto** — which from the square read as identical
  "grazie a un puro effetto ottico". https://www.turismoroma.it/it/luoghi/piazza-del-popolo ·
  https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-dei-miracoli
- Montesanto's own site is the better source for itself: construction began **1662** under
  **Alexander VII**, on the site of a small church belonging to the Carmelites of the province of
  **Monte Santo in Sicily**; after an interruption work resumed in **1673** under **Carlo Fontana**
  with **Bernini** supervising, and the interior decoration was finished in **1679**. It became the
  "Chiesa degli Artisti" in **1953**, when **Monsignor Ennio Francia** made it the seat of the
  *Messa degli Artisti*. https://www.chiesadegliartisti.it/
- Geometry: Miracoli `way/60517021` Q934416; Montesanto `way/60517009` Q1809115. Both Campo Marzio.

**28. Fontana del Trullo** — historic-site. Piazza Nicosia. *(Also §29.)*
- Sovrintendenza: designed by **Giacomo Della Porta** in **1572** and originally at the centre of
  piazza del Popolo, one of the public fountains built after the **acquedotto Vergine** was
  reactivated. A **1665 Falda engraving** shows the original form — octagonal basin, two concentric
  round bowls on four dolphins. Dismantled around **1820** for Valadier's redesign, rebuilt in the
  small square in front of San Pietro in Montorio on the Janiculum, removed again to municipal
  stores, and finally set in piazza Nicosia in **1950**, in a new opening designed by **Marcello
  Piacentini (1881–1960)** after the **1936** demolitions. Only the octagonal basin is original; a
  cipollino baluster carries a bowl decorated outside with **Borghese** heraldry. Travertine bollard
  fence added in the **1998** restoration.
  http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_in_piazza_nicosia
- it.wikipedia adds the etymology: piazza del Popolo was originally "piazza del Trullo", which is
  where the fountain's name comes from. https://it.wikipedia.org/wiki/Fontana_del_Trullo
- Geometry: `way/130714837`, Q3747367, `start_date=1572` → Campo Marzio.
- **A very good record**: one object, five locations, four centuries, entirely from Roma Capitale.

**29. Piazza Nicosia** — attraction. Campo Marzio at centre (12.47431, 41.90352). No it.wikipedia
article; carried by the Sovrintendenza fountain page above and by the rione article's piazze list.
**Thin on its own** — likely folds into the fountain.

**30. Museo Da Vinci** — museum. `node/4729693089`, at 41.91128, 12.47627, i.e. inside piazza del
Popolo's north side. OSM gives `opening_hours=Mo-Su 10:00-20:00`, `fee=yes`, `museum=person`,
`operator:type=private`, `check_date=2024-07-23`. **No institutional source reached, OSM only.**
Weak edge; recorded for completeness, and I would not ship it on OSM tags alone.

### 6.4 Churches — the rione has twenty-seven and they are not filler

All tested Campo Marzio. Grouped by how much sourced substance I actually have.

**Strong.**

**31. Chiesa e Convento della Trinità dei Monti** — historic-site. Piazza della Trinità dei Monti.
- it.wikipedia: on the summit of the eponymous staircase; officiated also in French; entrusted to
  the **Communauté de l'Emmanuel**; one of the **five French-speaking Catholic churches of Rome**,
  with San Luigi dei Francesi, San Nicola dei Lorenesi, Sant'Ivo dei Bretoni and Santi Claudio e
  Andrea dei Borgognoni. https://it.wikipedia.org/wiki/Chiesa_della_Trinit%C3%A0_dei_Monti
  Roma Capitale repeats the "cinque chiese cattoliche francofone" fact.
  https://www.turismoroma.it/it/page/rione-iv-campo-marzio
- The church's own site: the domain was entrusted to the Communauté de l'Emmanuel by an accord of
  **25 July 2016** between the French State and the Holy See; about twenty community members are in
  residence; the convent runs guided visits led by art historians licensed by the Regione Lazio,
  and there is a **casa per ferie San Giuseppe** for pilgrims, plus the **Cappella di Mater
  Admirabilis** and the **Istituto Sacro Cuore**. https://www.trinitadeimonti.net/it/
- turismoroma page: https://www.turismoroma.it/it/luoghi/chiesa-e-convento-di-trinita-dei-monti,
  `POINT (12.482852 41.907063)`.
- Roma Capitale's piazza page dates the foundation to **1495**.
  https://www.turismoroma.it/it/luoghi/piazza-di-spagna
- Geometry: `way/54044477`, Q1229008 → Campo Marzio.
- Two derived candidates the convent's own site supports: the **Cappella di Mater Admirabilis** and
  the **Casa per ferie San Giuseppe** (a bnb-shaped thing with an institutional source). I record
  them as sub-places rather than separate top-level entries; the verifier can split.

**32. Basilica dei Santi Ambrogio e Carlo al Corso** — historic-site. Via del Corso.
- it.wikipedia: minor basilica and rectory, the **national church of the Lombards resident in
  Rome**; construction began **1612**, replacing a **10th-century** building; officiated by the
  **Rosminians since 1906**. https://it.wikipedia.org/wiki/Basilica_dei_Santi_Ambrogio_e_Carlo_al_Corso
- turismoroma page exists: https://www.turismoroma.it/it/luoghi/basilica-dei-santi-ambrogio-e-carlo-al-corso,
  `POINT (12.478625 41.905182)`.
- Geometry: `relation/3078796`, Q1631620 → Campo Marzio. OSM also carries **Largo San Carlo al
  Corso** `relation/3078797` and **Palazzo Vitelli** `relation/3078799` in the same complex.
- Two OSM memorial nodes, "San Carlo" `node/3154799948` and "Sant'Ambrogio" `node/3154799949`, sit
  on the façade.

**33. Chiesa di Sant'Antonio dei Portoghesi (Sant'Antonio in Campo Marzio)** — historic-site.
- it.wikipedia: "Situata nel cuore del rione Campo Marzio, vicino all'antica osteria dell'Orso, è la
  **Chiesa nazionale della comunità portoghese a Roma**."
  https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Antonio_in_Campo_Marzio
- turismoroma page: https://www.turismoroma.it/it/luoghi/chiesa-di-santantonio-dei-portoghesi,
  `POINT (12.474455 41.901695)`, 4,808 characters of prose.
- Geometry: `way/60615623`, Q751480 → Campo Marzio. **STRADDLER-ADJACENT**: via dei Portoghesi is
  the Sant'Eustachio boundary and tests Campo Marzio 3/3, so the church is inside but the street is
  the line. See §8.6.
- NOTE the Wikidata/Wikipedia identity merge: "Chiesa di Sant'Antonio in Campo Marzio" redirects to
  the Portuguese national church and shares Q751480. One place, two names — do not create two.

**34. Chiesa di San Girolamo dei Croati** — historic-site. Via di Ripetta / piazza Augusto Imperatore.
- it.wikipedia: the **national church of the Croats in Rome**, formerly San Girolamo degli Illirici
  / degli Schiavoni; rectory of San Lorenzo in Lucina and a cardinal title.
  https://it.wikipedia.org/wiki/Chiesa_di_San_Girolamo_dei_Croati
- Roma Capitale records that it and **San Rocco** were the only two buildings spared when the
  quarter around the mausoleum was demolished from 1934.
  https://www.turismoroma.it/it/luoghi/piazza-augusto-imperatore
- turismoroma page: https://www.turismoroma.it/it/luoghi/chiesa-di-san-girolamo-dei-croati,
  `POINT (12.476355 41.904829)`. Geometry: `way/60615616`, Q2791338 → Campo Marzio.
- OSM also carries **Largo degli Schiavoni** `way/1393307859` beside it — the old name of the
  community.

**35. Chiesa di San Rocco all'Augusteo** — historic-site. Piazza Augusto Imperatore.
- it.wikipedia: a **17th-century** church in rione Campo Marzio.
  https://it.wikipedia.org/wiki/Chiesa_di_San_Rocco_all%27Augusteo
- Roma Capitale: survived the 1934 demolitions but was "privata però dell'attiguo ospedale e del
  campanile". https://www.turismoroma.it/it/luoghi/piazza-augusto-imperatore
- Geometry: `way/201292278`, Q3671940, `addr:street=Piazza Augusto Imperatore` → Campo Marzio.
- **Do not use `sanrocco.info`.** That domain is *San Rocco*, an architecture magazine registered in
  Venice. Nothing to do with the church.

**36. Chiesa di Ognissanti / All Saints' Anglican Church** — historic-site. Via del Babuino 153.
- The church's own site: "An Anglican congregation has been worshipping together in the city of Rome
  **since 1816**. For over 120 years we have gathered in our church with its **red brick and its
  white spire** here on Via del Babuino." Service times, from the same page: **Sundays Low Mass
  8:30, Sung Mass with choir 10:30; Thursdays midweek Mass 12:45**; worship in English.
  https://allsaintsrome.org/
- it.wikipedia: also officiated by the Old Catholic community; "una delle due chiese anglicane
  romane", the other being **San Paolo dentro le Mura** — which is already shipped by Castro
  Pretorio. https://it.wikipedia.org/wiki/Chiesa_di_Ognissanti_(chiesa_anglicana_di_Roma)
  A clean cross-reference the corpus can honestly make. **"One of the two" is a count, not a
  superlative** — permissible.
- Geometry: `way/201750571`, Q3669448 → Campo Marzio.

**37. Chiesa di Sant'Atanasio dei Greci** — historic-site. Via del Babuino 149.
- it.wikipedia: a rectory church "sita nel rione Campo Marzio, in via del Babuino, e officiata col
  **rito bizantino**." https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Atanasio_(Roma)
  Wikidata Q242053 gives the address **via del Babuino 151**; it.wikipedia says 149. Resolve or omit
  the number.
- Roma Capitale's Sovrintendenza mentions it as the landmark beside which the Babuino fountain was
  reassembled in **1957**.
  http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_del_babuino
- Geometry: `way/60678483` → Campo Marzio.
- **TRAP I FELL INTO AND CAUGHT.** turismoroma has a page at
  `/it/luoghi/chiesa-di-santatanasio` — but its `POINT` is `(12.5443587 41.9119683)`, roughly 5 km
  east, in an entirely different part of the city. That page is a **different Sant'Atanasio** and
  must not be cited for this church.

**38. Chiesa dei Santi Nomi di Gesù e Maria (Gesù e Maria)** — historic-site. Via del Corso 45.
- it.wikipedia: "una chiesa barocca di Roma, situata nella centrale via del Corso, nel rione Campo
  Marzio." https://it.wikipedia.org/wiki/Chiesa_di_Ges%C3%B9_e_Maria_(Roma)
- Geometry: `way/60616956`, Q3669324 (OSM name "Santissimi Nomi di Gesù e Maria in Via Lata")
  → Campo Marzio.

**39. Chiesa di San Giacomo in Augusta (degli Incurabili)** — historic-site. Via del Corso 499.
- it.wikipedia: "annessa all'ospedale omonimo, detto anche di **San Giacomo degli Incurabili**."
  https://it.wikipedia.org/wiki/Chiesa_di_San_Giacomo_in_Augusta
- Wikidata Q2219582 gives the address **via del Corso 499**.
- Geometry: `way/60517417` → Campo Marzio.
- The **former Ospedale San Giacomo** next to it is a further candidate; I found no institutional
  page for it and no it.wikipedia article resolved. Weak edge, §10.

**40. Chiesa di Sant'Ivo dei Bretoni** — historic-site. Vicolo della Campana.
- it.wikipedia: "nel rione Campo Marzio, nel vicolo della Campana"; French name *Église
  Saint-Yves-des-Bretons*; one of the five French-speaking Catholic churches of Rome (see §31).
  https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Ivo_dei_Bretoni
- turismoroma page: https://www.turismoroma.it/it/luoghi/chiesa-di-santivo-dei-bretoni,
  `POINT (12.4747496 41.9026132)`, 5,557 characters.
- Geometry: `way/1363815097`, Q3584709 → Campo Marzio.

**41. Chiesa di Santa Maria Portae Paradisi** — historic-site. Via di Ripetta 61.
- Wikidata Q3673514 gives the address; it.wikipedia places it "nel rione Campo Marzio, affacciata su
  via di Ripetta." https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Portae_Paradisi
- turismoroma page: https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-portae-paradisi,
  `POINT (12.4757613 41.9067737)`, 4,232 characters.
- Geometry: `way/60517406` → Campo Marzio.

**42. Chiesa della Santissima Trinità degli Spagnoli** — historic-site. Via dei Condotti 41.
- it.wikipedia: "nel rione Campo Marzio, all'inizio di via dei Condotti."
  https://it.wikipedia.org/wiki/Chiesa_della_Santissima_Trinit%C3%A0_degli_Spagnoli_(Roma)
  Wikidata Q512703 address "via dei Condotti".
- turismoroma page: https://www.turismoroma.it/it/luoghi/chiesa-della-santissima-trinita-degli-spagnoli,
  `POINT (12.479096 41.904625)`, 4,676 characters.
- Geometry: `way/73811772` → Campo Marzio.

**43. Chiesa di San Nicola dei Prefetti** — historic-site. Via dei Prefetti.
- it.wikipedia: "comunemente detta 'San Nicola ai Prefetti', … nel rione Campo Marzio, posto in via
  dei Prefetti." https://it.wikipedia.org/wiki/Chiesa_di_San_Nicola_dei_Prefetti
- turismoroma page: https://www.turismoroma.it/it/luoghi/chiesa-di-san-nicola-dei-prefetti,
  `POINT (12.47667 41.902448)`, 4,815 characters.
- Geometry: Wikidata Q3671465 at 41.9025, 12.476694 → Campo Marzio. **Not in OSM under any of my
  eight filters** — a reminder that OSM completeness is not evidence of absence.

**44. Chiesa di Santa Maria della Concezione in Campo Marzio** — historic-site. Piazza Campo Marzio.
- it.wikipedia: "situato nel rione Campo Marzio, in piazza Campo Marzio; su di essa insiste
  l'omonima rettoria di **rito siro-antiocheno**."
  https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_della_Concezione_in_Campo_Marzio
- Geometry: `way/89985362`, Q3673825 → Campo Marzio.
- **STRADDLER-ADJACENT**: piazza Campo Marzio is a named boundary in Roma Capitale's own ring. §8.6.

**45. Chiesa di Santa Lucia della Tinta** — historic-site. Via di Monte Brianzo 61.
- it.wikipedia gives that exact address and rione.
  https://it.wikipedia.org/wiki/Chiesa_di_Santa_Lucia_della_Tinta
- turismoroma page: https://www.turismoroma.it/it/luoghi/chiesa-di-santa-lucia-della-tinta,
  `POINT (12.4737746 41.9026101)` — but only **1,788 characters**, the thinnest turismoroma body I
  pulled. Geometry: `way/130714809`, Q3673143 → Campo Marzio.

**46. Chiesa di San Gregorio dei Muratori** — historic-site. Via Leccosa.
- it.wikipedia carries an unusually complete account: an oratory, "fatta costruire nel **1527** dalla
  **Confraternita dei Muratori** e dedicata al loro santo patrono, Gregorio Magno." Originally near
  the port of Ripetta; today enclosed inside a **1934** building at the end of an alley. Frescoes of
  the life of St Gregory, stucco putti and gilding, original terracotta floor. Its nave is **wider
  than it is long**, and the façade runs parallel to the nave, so the two doors open on the church's
  right side rather than at its end.
  https://it.wikipedia.org/wiki/Chiesa_di_San_Gregorio_dei_Muratori
- Geometry: `way/1503417769`, Q3670719 → Campo Marzio.
- **A genuinely good small record** — the plan anomaly is a concrete, checkable, non-superlative fact.

**47. Chiesa dei Santi Giorgio e Martiri inglesi** — historic-site. Via di San Sebastianello.
- it.wikipedia: opened to the public **5 November 1887**, built with a large donation from **Prince
  Alessandro Torlonia**, today served by an English women's congregation, the **Poor Servants of the
  Mother of God**, who occupy the attached convent. Erected in memory of **Lady Georgiana Fullerton**,
  the congregation's founder, by her husband, in memory also of their son William. High altar canvas
  of St Gregory the Great by **A. Dies**; the altar was Torlonia's gift and came from the demolished
  church of **Santa Teresa alle Quattro Fontane**; the Madonna and Sacred Heart altars came from the
  demolished **Sant'Elisabetta dei Fornari**. Wall decoration by **Eugenio Cisterna**.
  https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Giorgio_e_Martiri_inglesi
- Geometry: `way/201751102`, Q3668193 → Campo Marzio.

**48. Chiesa di San Gregorio Nazianzeno** — historic-site. Vicolo Valdina.
- it.wikipedia: "nel rione Campo Marzio, in vicolo Valdina."
  https://it.wikipedia.org/wiki/Chiesa_di_San_Gregorio_Nazianzeno
- Geometry: Q3670718 at 41.901972, 12.476806 → Campo Marzio. Not in OSM under my filters.

**49. Chiesa di Santa Maria del Divino Amore (già Santi Cecilia e Biagio)** — historic-site. Vicolo
del Divino Amore.
- it.wikipedia: "nel rione Campo Marzio, posto nel vicolo del Divino Amore. Dedicato fino
  all'inizio dell'800 ai santi Cecilia e Biagio."
  https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_del_Divino_Amore_(Roma)
- Geometry: Q3668097 at 41.903111, 12.476278 → Campo Marzio.
- **Do not confuse with the Santuario della Madonna del Divino Amore** at Castel di Leva, far
  outside the walls. Different place, same devotion.

**50. Chiesa della Resurrezione di Nostro Signore Gesù Cristo** — historic-site. Via di San
Sebastianello.
- it.wikipedia: "sussidiario della parrocchia di San Giacomo in Augusta, situato nel rione Campo
  Marzio, in via di San Sebastianello."
  https://it.wikipedia.org/wiki/Chiesa_della_Resurrezione_di_Nostro_Signore_Ges%C3%B9_Cristo_(Roma,_Campo_Marzio)
  The article's body is largely a quotation of **Armellini** and gave me little else.
- Geometry: Q3669123 at 41.907354, 12.482252 → Campo Marzio. **Thin.**

**51. Cappella di San Giovanni Battista de La Salle alla Piazza di Spagna** — historic-site. Via di
San Sebastianello 1 / via Alibert.
- it.wikipedia: also known as San Giovanni Battista de La Salle nel **Collegio San Giuseppe Istituto
  De Mérode**; dedicated to the founder of the **Fratelli delle Scuole Cristiane**; "situata nel
  rione Campo Marzio, presso la via Alibert. L'indirizzo postale si trova in via di San Sebastianello
  1."
  https://it.wikipedia.org/wiki/Cappella_di_San_Giovanni_Battista_de_La_Salle_alla_Piazza_di_Spagna
- Geometry: Q25419839 at 41.907361, 12.481389 → Campo Marzio.

**52. Rome Baptist Church (Chiesa battista di Roma)** — historic-site. Piazza San Lorenzo in Lucina.
- it.wikipedia: "un luogo di culto protestante di lingua inglese situato nel centro storico di Roma,
  in piazza San Lorenzo in Lucina (**nel rione Campo Marzio**)."
  https://it.wikipedia.org/wiki/Rome_Baptist_Church
- Geometry: Wikidata Q25349986 at 41.903770, 12.478190 → Campo Marzio. OSM
  `node/1732938324`, `addr:street=Piazza San Lorenzo in Lucina` → Campo Marzio.
- **This is the interesting one on the Colonna line.** Colonna's finder vertex-tested the piazza at
  **Campo Marzio 15 / Colonna 9** and took the basilica but not this. Both the geometry and
  it.wikipedia put the Baptist church on the Campo Marzio side. **STRADDLER by association only** —
  I flag it in §8.2 so the arbitrator sees the basilica and the Baptist church land in different
  files off the same square, which is correct but will look odd if nobody says why.
- `chiesabattistaroma.org` does not resolve. No official-site hours.

**Deconsecrated, and still worth a line.**

**53. Chiesa dei Santi Giuseppe e Orsola** — historic-site. Via Vittoria.
- it.wikipedia: "una chiesa sconsacrata di Roma, nel rione Campo Marzio, in via Vittoria."
  https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Giuseppe_e_Orsola. Q3668215 → Campo Marzio. Thin.

**54. Oratorio del Santissimo Sacramento di San Lorenzo in Lucina** — historic-site. Via Belsiana.
- it.wikipedia: built **1578** as the oratory attached to the house of the confraternity of the
  Santissimo Sacramento of San Lorenzo in Lucina; small entrance staircase; decorated with large
  late-16th-century oil-painted wooden panels; between the late 19th and early 20th century it hosted
  baroque music concerts; **deconsecrated in 1970 and now a commercial premises**, with the
  confraternity house behind it in civil use.
  https://it.wikipedia.org/wiki/Oratorio_del_Santissimo_Sacramento_di_San_Lorenzo_in_Lucina
- Geometry: Q3884476 at 41.904611, 12.479861 → Campo Marzio. Note the **name** points at Colonna's
  basilica while the **building** is in Campo Marzio — a second instance of the §52 pattern.

**Also collected, one sourced sentence each, weak edge:** Cappella di San Gaetano alla Villa Medici
(Q61056456 → Campo Marzio; inside Villa Medici's grounds, so arguably part of §60 rather than its
own record).

### 6.5 The Pincio

Roma Capitale's own long-form page for the hill is the backbone here:
https://www.turismoroma.it/it/luoghi/terrazza-e-passeggiata-del-pincio (8,538 characters) plus
http://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/passeggiate_parchi_e_giardini/passeggiata_del_pincio
(10,384 characters).

**55. Pincio — Terrazza e Passeggiata** — park.
- it.wikipedia: a hill of Rome **61 m** above sea level, north of the Quirinal, facing west over the
  Campo Marzio, ringed by the Aurelian Walls to north and east; **not one of the traditional seven
  hills** despite being inside the walls. The public garden on its summit was designed by **Giuseppe
  Valadier between 1810 and 1818**. https://it.wikipedia.org/wiki/Pincio
- Roma Capitale dates the park to **1834** on the turismoroma page and **1810–1818** via it.wikipedia
  — a conflict; the Sovrintendenza page is the tiebreak to read carefully before shipping a date.
- The avenues were laid out from the start to take carriages; **the only access that has stayed
  strictly pedestrian is the one off viale delle Magnolie**. The monumental access opens on piazza
  del Popolo through **three "prospettive"** on the slope, linked by small flights and by via
  Gabriele D'Annunzio: the **first (1830)**, three niches with an antique **Igea**; the **second
  (1830)**, a relief of *Fama crowning the Genii of the Arts and Commerce* over a marble seat with
  two winged lions; the **third**, a three-arched loggia carrying the **Belvedere terrace**, in which
  a **nymphaeum as a mostra of the Acqua Vergine was built in 1936 to a design by Raffaele De Vico**
  after an idea of Valadier's. Same turismoroma page.
- Geometry: `relation/14026944`, Q550215 → Campo Marzio.

**56. Piazzale Napoleone I and the Belvedere terrace** — attraction. OSM `relation/19162137`.
- Roma Capitale describes the view: piazza del Popolo below, the dome of **St Peter's** on the
  horizon, **Monte Mario** to the right, the **Quirinale** to the left, and the Garibaldi equestrian
  monument on the Janiculum in the distance. it.wikipedia's Pincio article gives the same sweep plus
  the Vittoriano, the Campidoglio and, in the distance, EUR.
- **This is the single hardest record in the file to write within the rules.** Every source reaches
  for a superlative ("uno dei più celebri panorami della capitale", "indimenticabili tramonti").
  Write the *enumerated sightlines* instead — they are facts and they are better copy.

**57. Busti del Pincio** — historic-site.
- it.wikipedia: **229 busts** of figures from Italian history along the avenues; began as ordinary
  decoration and became small monuments to artists, writers and scientists; the choice of subjects
  is decorative, pedagogic and celebratory, and tied to Risorgimento patriotic values.
  https://it.wikipedia.org/wiki/Busti_del_Pincio
- Roma Capitale: "la teoria degli uomini illustri, la serie cioè di **229 busti** commemorativi
  collocati **a partire dal 1849**." Both sources agree on the count. Two independent 229s is as
  good as this corpus gets.
- OSM carries individual bust nodes, e.g. "Eleonora Fonseca Pimentel" `node/13123552616` and "Ercole
  Rosa" `node/13123527932`.

**58. Idrocronometro del Pincio (orologio ad acqua)** — historic-site. Viale dell'Orologio.
- Roma Capitale: the mechanism "è generalmente attribuito al padre domenicano **Giovanni Battista
  Embriaco**"; in **1873** the hydrochronometer was placed in its present position, at the centre of
  a small lake inside an iron railing. Note the source's own hedge — *generalmente attribuito* —
  keep the hedge.
- Geometry: OSM `node/1305071783`, Q2272265 → Campo Marzio. it.wikipedia's article is
  https://it.wikipedia.org/wiki/Idrocronometro_del_Pincio and says it sits "all'interno di Villa
  Borghese", which is a park-name statement, not a rione statement. **Do not let a source's use of
  "Villa Borghese" override the rione geometry.** See §8.9.

**59. Casina Valadier** — restaurant / historic-site. Piazza Bucarest.
- Roma Capitale: built **1816–1837** to **Valadier's** design, at the highest and most panoramic
  point of the Pincio, the ancient **Collis Hortulorum**; neoclassical, a cubic block with an
  **exedra and Ionic colonnade**, reworking the earlier **Casino del Cardinale Della Rota**, itself
  raised over a Roman cistern. Interiors decorated in **Pompeian style**. Used from the start as a
  bistro-style meeting place; closed and used as a garden store under **Pius IX**, with the cruciform
  attic given over to military quarters; a fashionable café for intellectuals after the First World
  War; used by German and then British officers as an officers' club in the Second; restored in the
  early 2000s. https://www.turismoroma.it/it/luoghi/casina-valadier
- The turismoroma page's Servizi field says **Bar**; its own site markets it primarily as an events
  and weddings venue and gives **Piazza Bucarest, 00187 Roma**, switchboard **+39 06 69922090**,
  info@casinavaladier.it — and **states no opening hours at all**.
  https://www.casinavaladier.it/. Any record must not invent hours.
- Geometry: `way/201280472`, Q3661787, `addr:street=Piazza Bucarest` → Campo Marzio.
- Roma Capitale's turismoroma page also dates it "realizzata **nel 1813**" on the Pincio page and
  "**tra il 1816 e il 1837**" on its own page. Conflict; flag.
- CAUTION: turismoroma calls it "situata nel punto più alto e panoramico del Pincio". Superlative.

**60. Villa Medici — Accademia di Francia a Roma** — museum / historic-site. Viale della Trinità dei
Monti 1.
- Roma Capitale: the present building is **mid-16th century**, designed by **Giovanni Lippi, called
  Nanni di Baccio Bigio**, for Cardinal **Giovanni Ricci da Montepulciano**; bought in **1576** by
  Cardinal **Ferdinando de' Medici** to house his art collection; seat of the **Accademia di
  Francia** since the early 19th century, the Academy itself **founded in 1666** by **Colbert** and
  **Bernini** for the winners of the Prix de Rome. Plain outer façade against an ornate inner façade
  with garlands, masks, statues and antique reliefs, opening on a loggia over the gardens. The
  rectangular garden is divided into **sixteen square beds**; the green estate covers **over 7
  hectares** and largely keeps its 16th-century form. Cardinal Ricci bought the **Casina Crescenzi**
  on the *collis hortulorum* in **1564**; irrigation work by **Camillo Agrippa**; Ferdinando enclosed
  the villa between the **Aurelian Walls and via Pinciana** by buying Giulio Bosco's vineyard in
  **1580**, creating the long north–south axis to the **Parnaso**. The library, created in **1803** by
  **Joseph-Benoît Suvée** (director 1795–1807), holds about **37,000 volumes**; the collections
  include portraits of **460 fellows from 1798 to 1936**.
  https://www.turismoroma.it/it/luoghi/villa-medici-accademia-di-francia
- The Academy's own site: "Istituita più di 350 anni fa, l'Accademia di Francia a Roma – Villa
  Medici è una residenza per artisti, un centro d'arte … e un sito patrimoniale aperto ai
  visitatori", and the homepage carried on the day of fetch **"Oggi Villa Medici è aperta dalle 9:30
  alle 19:00."** https://www.villamedici.it/it/ — that is a same-day banner, not a published
  timetable; do not ship it as the hours. `villamedici.it/visite/` returned 500.
- Geometry: `way/23442671`, Q1362663, `addr:street=Viale della Trinità dei Monti` → Campo Marzio;
  the garden `relation/14026945` also Campo Marzio.
- CAUTION: turismoroma says the library is "una delle più grandi biblioteche di arti decorative di
  Roma". Superlative. The **37,000 volumes** carries it legally.

**61. Monumento ai fratelli Cairoli** — historic-site. Pincio.
- Roma Capitale: bronze monument raised in **1883** to **Enrico and Giovanni Cairoli**, Garibaldini
  killed in **1867 at Villa Glori**. Geometry: `way/201419228`, Q116029788 → Campo Marzio.

**62. Monumento a Enrico Toti** — historic-site. Pincio.
- Roma Capitale: "Nel **1922**, fu innalzato il monumento ad Enrico Toti."
  Geometry: `way/201422664` → Campo Marzio. No Wikidata item.

**63. Statues of the Pincio avenues** — historic-site, arguably one record.
- Roma Capitale enumerates, with dates: a small **Raffaello Sanzio** (1838); a round fountain with
  **Moses saved from the Nile**, placed **1868**; the bust of **Valadier** closing viale del
  Belvedere; **Esculapio**, a 5th-century body with a probably 4th-century head; **Cibele**, of
  Antonine date, which with **Polimnia** and **Abbondanza** — now in front of Villa Medici's entrance
  — was kept in the Palazzo dei Conservatori and moved to the Pincio in **1846**.
  https://www.turismoroma.it/it/luoghi/terrazza-e-passeggiata-del-pincio
- Note the Campidoglio provenance links to Campitelli's already-shipped `palazzo-dei-conservatori`.

**64. Teatro dei burattini San Carlino** — theater. Pincio.
- OSM `way/849317796`, `amenity=theatre`, `theatre:genre=puppet` → Campo Marzio. **OSM only, no
  institutional source reached.** Weak edge but a real and distinctive thing; worth one more attempt
  by the verifier.

**65. Fontana del Mosè (Pincio)** — historic-site. OSM `way/201401355` → Campo Marzio; Roma Capitale
describes it as the round fountain with the group of Moses on the Nile placed in **1868** (§63).
**66. Fontana della Vasca (Vasca del Pincio)** — historic-site. OSM `way/551347274` → Campo Marzio;
Roma Capitale calls it "la fontana a tazza conosciuta come la **'Vasca del Pincio'**", on the
panoramic front facing Villa Medici. Same page.
**67. Fontana della Ciociara (Fontana dell'Anfora)** — historic-site. OSM `node/12254742425`,
Q126727103 → Campo Marzio. **No prose source reached.** Weak edge.
**68. Fontana di Corot** — historic-site. OSM `way/965243640`, `name:fr=Fontaine de Corot`
→ Campo Marzio. **No prose source reached.** Weak edge.
**69. Convento di Santa Rita al Pincio** — historic-site. Named by Roma Capitale on the Pincio
walk-through, with an adjoining fountain built from an antique red granite basin of the **2nd–3rd
century**, oval, with a lion's head spout, set in a circular bowl. Same page. No separate article.

### 6.6 Palaces

**70. Palazzo Borghese** — historic-site. Largo della Fontanella di Borghese / piazza Borghese.
- Roma Capitale: the main façade opens on largo della Fontanella di Borghese, but the palace fills
  an irregular block between **via di Ripetta, via dell'Arancio, via di Monte d'Oro, via della
  Fontanella di Borghese, via Borghese and piazza Borghese**. Called **"il cembalo"** for its shape.
  Begun **1560** when Monsignor **Tommaso del Giglio** commissioned a palazzetto from **Vignola**,
  completed and enlarged by **Martino Longhi il Vecchio** for the Spanish cardinal **Pedro Deza**;
  bought **1596** by Cardinal **Camillo Borghese**, shortly to be **Paul V**, after which work
  continued under **Flaminio Ponzio**, then **Carlo Maderno**, **Giovanni Vasanzio** and, after
  **1670**, **Carlo Rainaldi**. Monumental courtyard with a double order of **96 Doric and Ionic
  columns**, and the **"Bagno di Venere"** nymphaeum at the end.
  https://www.turismoroma.it/it/luoghi/palazzo-borghese
- Geometry: `way/80220847`, Q647919 → Campo Marzio; its garden `way/634768652` too.
- CAUTION: "è stato a lungo considerato una delle meraviglie di Roma". Attributed superlative. Banned.
- Sourced cross-reference: much of what hangs in the **Galleria Borghese** came from this palace —
  and the Galleria is in Q. III Pinciano, a different file.
- **Sapienza Facoltà di Architettura** faces it on piazza Borghese; OSM `node/261852636`. The rione
  article's own lead photo caption names the pairing.

**71. Palazzo Ruspoli** — historic-site. Via del Corso / largo Goldoni.
- Roma Capitale: built mid-16th century by the **Jacobilli**, who ran out of money and sold it in
  **1583** to the Florentine **Rucellai**, who had **Bartolomeo Ammannati (1511–1592)** finish it —
  the via del Corso façade and a loggia over the garden, whose gallery **Jacopo Zucchi** frescoed.
  Bought **1629** by the **Caetani**, who had **Bartolomeo Breccioli** alter the largo Goldoni façade
  in **1630**. Around **1640 Martino Longhi il Giovane (1602–1656)** built the staircase of **over a
  hundred steps** and the belvedere tower. Passed to the **Ruspoli in 1776**, who still own part of
  it. **Handel** composed *La Resurrezione* here as the Ruspoli princes' maestro di cappella;
  **Hortense de Beauharnais**, ex-queen of Holland, stayed here with her two sons, one of whom became
  **Napoleon III**. In **1812** the ground-floor apartment housed the **"Caffè di Bagnoli"**, known as
  the "Caffè Nuovo". Today the seat of the **Fondazione Memmo**, which mounts exhibitions.
  https://www.turismoroma.it/it/luoghi/palazzo-ruspoli
- Geometry: hand-tested 12.47899, 41.90435 → Campo Marzio; Wikidata Q2047605 at 41.904167, 12.478694
  → Campo Marzio.
- CAUTION: the staircase is "considerato una delle quattro meraviglie di Roma". Attributed
  superlative. Banned. The **hundred-plus steps** is the publishable version.
- `fondazionememmo.it` returns 200 but only **821 characters** — effectively a splash page. No hours.

**72. Palazzo Firenze** — historic-site. Piazza di Firenze.
- it.wikipedia: belonged to the **del Monte** family, then the **Medici of Florence**, hence the
  name; formerly the Ministry of Grace and Justice; today the **Società Dante Alighieri (since
  1926)** and the **Italian National Commission for UNESCO (since 1950)**.
  https://it.wikipedia.org/wiki/Palazzo_Firenze
- turismoroma page: https://www.turismoroma.it/it/luoghi/palazzo-firenze, `POINT (12.476045
  41.902311)`, 5,209 characters — the longest palazzo body I pulled after Borghese.
- Geometry: `relation/1249237`, Q3890121 → Campo Marzio.

**73. Palazzo Magistrale** — historic-site. Via dei Condotti 68. **Special status, §11.2.**
- it.wikipedia: the principal seat of the **Sovrano Militare Ordine di Malta**; residence of the
  **Grand Master and seat of the Order's government since 1834**; **owned by the Order since 1630**.
  https://it.wikipedia.org/wiki/Palazzo_Magistrale
- Geometry: `relation/415304`, Q2329591 → Campo Marzio.

**74. Palazzo Núñez-Torlonia** — historic-site. Via dei Condotti / via Bocca di Leone / via
Borgognona; Wikidata gives **79 via Bocca di Leone**.
- it.wikipedia: "posto nel rione Campo Marzio tra le vie Condotti, Bocca di Leone e Borgognona."
  https://it.wikipedia.org/wiki/Palazzo_N%C3%BA%C3%B1ez-Torlonia
- turismoroma page exists but is thin (2,147 characters):
  https://www.turismoroma.it/it/luoghi/palazzo-nunez-torlonia, `POINT (12.480699 41.904797)`.
- Geometry: `way/73811760`, Q17051524 → Campo Marzio. OSM also carries a **"Torlonia"** drinking
  fountain `way/1353218332` on via Bocca di Leone.

**75. Palazzetto Zuccari — Bibliotheca Hertziana** — historic-site. Between via Sistina and via
Gregoriana, on piazza Trinità dei Monti.
- it.wikipedia: built by **Federico Zuccari**; known popularly as the **"casa dei mostri"** for the
  door and window surrounds on the via Gregoriana front.
  https://it.wikipedia.org/wiki/Palazzetto_Zuccari
- it.wikipedia's via Gregoriana article adds that Zuccari built it at the top of the street, and
  that after a long restoration in the early 2000s it now houses the **Bibliotheca Hertziana**.
  https://it.wikipedia.org/wiki/Via_Gregoriana
- The Hertziana is "un istituto di ricerca della **Società Max Planck** dedicato alla storia
  dell'arte, con sede a Roma, nel Palazzo Zuccari."
  https://it.wikipedia.org/wiki/Bibliotheca_Hertziana. Its own site is up at https://www.biblhertz.it/
  (10,382 characters) though `/it/biblioteca` 404s.
- Geometry: `way/202067930` Q1277188 `addr:street=Via Gregoriana`, and `relation/2713672`
  (Bibliotheca Hertziana, `amenity=library`) → both Campo Marzio.
- **Two records or one?** The building and the institute have separate Wikidata items (Q1277188 /
  Q339759) and separate OSM objects. I record them as one candidate with two identities and let the
  verifier split. Note the OSM `relation/2713673` **"Palazzo Stroganoff"** sits in the same complex.

**76. Palazzi dell'INPS a Piazza Augusto Imperatore** — historic-site. Three buildings, north, east
and south sides.
- it.wikipedia: designed by **Vittorio Ballio Morpurgo** in **rationalist** style around the
  mausoleum, with the Ara Pacis museum on the west side.
  https://it.wikipedia.org/wiki/Palazzi_dell%27INPS_a_Piazza_Augusto_Imperatore
- Roma Capitale: "la piazza venne circondata a nord, est e sud dai tre nuovi grandi Palazzi
  dell'INPS arricchiti con **colonnati, bassorilievi e mosaici**."
  https://www.turismoroma.it/it/luoghi/piazza-augusto-imperatore
- Geometry: Wikidata Q56857790 at 41.906119, 12.477290 → Campo Marzio.
- **Morpurgo died 1966**; a photo question for a later wave, not now.

**77. Palazzo dell'ex Unione Militare** — historic-site. Corner of via del Corso and via Tomacelli.
- it.wikipedia: "all'angolo tra via del Corso e via Tomacelli nel rione Campo Marzio (Municipio Roma
  I)." https://it.wikipedia.org/wiki/Palazzo_dell%27ex_Unione_Militare
- The rione article dates the eclectic building to **1901** and states it was restructured to a
  design by **Massimiliano and Doriana Fuksas, 2008–2013**.
  https://it.wikipedia.org/wiki/Campo_Marzio
- Geometry: `way/74375150` (OSM "Unione Militare"), Q56879588 → Campo Marzio.
- **The Fuksases are living.** Photo reject for a later wave. Text is fine.

**78. Palazzo Rondinini** — historic-site. Via del Corso.
- it.wikipedia: "un palazzo settecentesco di Roma." One sentence.
  https://it.wikipedia.org/wiki/Palazzo_Rondinini
- turismoroma page: https://www.turismoroma.it/it/luoghi/palazzo-rondinini, `POINT (12.47701
  41.909224)`, 2,616 characters — thin but institutional.
- Geometry: `way/24186531`, Q48809118 → Campo Marzio.

**79. Palazzo Nainer** — historic-site. Via del Babuino 196.
- it.wikipedia: built **1818–1821** over a former **Augustinian monastery**, part of Valadier's new
  scheme for piazza del Popolo and the Tridente; adjoins **Santa Maria in Montesanto**; long façade
  in three parts, the central one in three orders articulated by pilasters, a rusticated cornice
  separating the upper order, and a balustraded terrace along the whole central section. Bought
  mid-19th century by the **Marchese Giampietro Campana**, who kept and showed part of his collection
  here. Raised by a storey in **1872** during the post-*Roma capitale* works. Today part of it is the
  **Hotel Palazzo Nainer**, the rest private flats.
  https://it.wikipedia.org/wiki/Palazzo_Nainer
- Geometry: Q3890539 at 41.909639, 12.477417 → Campo Marzio.

**80. Palazzo Boncompagni Cerasi** — historic-site. Via del Babuino 51.
- it.wikipedia: one sentence placing it in Campo Marzio at that number.
  https://it.wikipedia.org/wiki/Palazzo_Boncompagni_Cerasi. Q55778621 → Campo Marzio.
- Related, sourced: the Sovrintendenza's Babuino fountain page says the palazzetto that held the
  fountain "passò nel Seicento alla famiglia **Boncompagni-Ludovisi** che nel **1738** provvide alla
  sua completa ristrutturazione", and that the Silenus statue went into the courtyard of palazzo
  Boncompagni in 1877. Same family, same street — a real connection between two records.

**81. Palazzo Aragona Gonzaga** — historic-site. Via della Scrofa 117, at piazza Nicosia.
- it.wikipedia: also called **Palazzo Balami Galitzin / Negroni / Mancini**; 16th century, late
  Renaissance, given a more baroque cast by mid-18th-century restoration; adjacent to the site of the
  **Collegio Clementino**; residence of Cardinal **Scipione Gonzaga**; the via della Scrofa façade
  carries plaques for **St Aloysius Gonzaga** and **Torquato Tasso**.
  https://it.wikipedia.org/wiki/Palazzo_Aragona_Gonzaga. Q3889549 → Campo Marzio.
- **STRADDLER-ADJACENT**: via della Scrofa tests **Campo Marzio 11 / Sant'Eustachio 6**, but number
  117 is at the piazza Nicosia end, firmly inside. §8.7.

**82. Palazzo Capilupi (Palazzo Valdina Cremona)** — historic-site. Via dei Prefetti 17.
- it.wikipedia gives the address, the alternative name and the bounding alleys (**vicolo Rosini** to
  the east, **vicolo Valdina** to the south), and states outright "Municipio I - Rione IV Campo
  Marzio". https://it.wikipedia.org/wiki/Palazzo_Capilupi. Q3889770 → Campo Marzio.

**83. Palazzo Incontro** — historic-site. Via dei Prefetti 22.
- it.wikipedia: built in the second half of the 18th century, "esattamente nel **1765**",
  by the architect **Giovanni Paolo Burij**; owned by the **Provincia di Roma**, which restored it
  **2004–07**. https://it.wikipedia.org/wiki/Palazzo_Incontro. Q3890296 → Campo Marzio.
- The Provincia di Roma no longer exists as such; if the record says "owned by", it needs a current
  source or it should say what the source says and when.

**84. Palazzo Della Porta Negroni Caffarelli** — historic-site. Via dei Condotti 61.
- it.wikipedia: named to distinguish it from the family's other Roman palaces — **Palazzo Caffarelli
  al Campidoglio** (shipped by Campitelli), **Palazzo Vidoni Caffarelli**, **Palazzo Aragona Gonzaga
  Negroni Galitzin** (§81, also Campo Marzio).
  https://it.wikipedia.org/wiki/Palazzo_Della_Porta_Negroni_Caffarelli. Q7126985 → Campo Marzio.
- A rare honest cross-file link: two of the four Caffarelli palaces are in this wave's files.

**85. Palazzo Corrodi** — historic-site. Lungotevere Arnaldo da Brescia, filling the block with via
Luisa di Savoia, via Maria Adelaide and via Maria Cristina.
- it.wikipedia: "un ampio immobile di **inizio '900**, che occupa un intero isolato … (vie istituite
  – tutte – nel **1904**), nel rione Campo Marzio."
  https://it.wikipedia.org/wiki/Palazzo_Corrodi_(Roma). Q21787358 → Campo Marzio.
- Note lungotevere Arnaldo da Brescia is a named boundary in Roma Capitale's ring; the OSM way tests
  **25/25 Campo Marzio**, so no straddle here.

**86. Palazzo Cardelli** — historic-site. Piazza Cardelli 4 (Wikidata address).
- turismoroma page: https://www.turismoroma.it/it/luoghi/palazzo-cardelli, `POINT (12.4751832
  41.9028986)` — but only **1,854 characters**. Q56826993 → Campo Marzio. **Thin.**

**87. Palazzo Vitelli** — historic-site. OSM `relation/3078799`, Q55778942 → Campo Marzio, in the
San Carlo al Corso block. **No it.wikipedia article, no institutional page.** Weak edge.
**88. Palazzo Stroganoff** — historic-site. OSM `relation/2713673`, Q131910093 → Campo Marzio, in the
Palazzetto Zuccari complex. **Same problem.** Weak edge; likely folds into §75.

### 6.7 Fountains and street furniture outside the two big squares

**89. Il Babuino / Fontana del Babuino** — historic-site. Via del Babuino, beside Sant'Atanasio.
- Sovrintendenza: made around **1576**, a "semipubblica" fountain — built at the expense of a
  private citizen, the Ferrara merchant **Alessandro Grandi**, but for public use. An ancient grey
  granite basin under a life-size **tufa Silenus reclining on rocks**, set in a niche on Grandi's
  palazzetto. Moved left to number **49a** in the **1738** rebuilding by the **Boncompagni-Ludovisi**.
  Dismembered in **1877** for sewer works — Silenus to the Boncompagni courtyard, the basin to
  replace the trough on via Flaminia in front of Giulio III's fountain. Reassembled **1957** near
  the original site but on the opposite side of the street, left of Sant'Atanasio dei Greci. The
  Silenus is antique but its head does not belong; it has also been identified with the Sabine god
  **Sanco Fidio Semicapro**. **The street was renamed after it** — it had been via Clementina, opened
  by Clement VII.
  http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_del_babuino ·
  https://www.turismoroma.it/it/luoghi/fontana-del-babuino
- Roma Capitale names it as one of the **"statue parlanti"**, with **Pasquino, Marforio, Madama
  Lucrezia and Abate Luigi**, the "congresso degli arguti" on which Romans posted anonymous
  complaints. Marforio is already shipped by Campitelli (`marforio-musei-capitolini`); Pasquino is
  Parione's. **A five-way cross-reference the corpus can honestly make, and a good one.**
- Geometry: `node/4758761431`, Q1085738 → Campo Marzio.
- CAUTION: the Sovrintendenza explains the nickname by "la sua bruttezza". Editorialising in the
  source's voice; attribute or drop.

**90. Fontana degli Artisti** — historic-site. Via Margutta.
- OSM `node/257476623`, Q108107007, `addr:street=Via Margutta` → Campo Marzio. **No institutional
  prose source reached** — it is not on the Sovrintendenza's 44-fountain index. Weak edge.
**91. Fontana del Bottino** — historic-site. OSM `node/5383710021`, `amenity=fountain`,
`tourism=attraction`, `covered=yes` → Campo Marzio, just north of the Spanish Steps. **OSM only.**
**92. Fontana Torlonia** — historic-site. Via Bocca di Leone. OSM `way/1353218332`,
`fountain=decorative`, `drinking_water=yes` → Campo Marzio. **OSM only.**

**93. Er fico di via Margutta and the Salotto del Fico Marguttiano** — a small cluster of OSM
memorial/artwork nodes on via Margutta (`node/12598119018`, `node/12598119014`,
`node/12598119017` "Pianto pe la caduta der fico"), plus galleries "Galleria Vittoria"
`node/12598119015` and "Monogramma" `node/12598119016`. **No institutional source.** I record the
cluster because it is exactly the kind of thing a guide would notice on via Margutta, and exactly
the kind of thing this corpus cannot source. Weak edge.

**94. Esposizione permanente Fausto delle Chiaie** — an open-air one-artist display beside the Ara
Pacis. OSM `node/5340598393`, `tourism=museum`, `fee=no` → Campo Marzio. **No institutional source,
and the artist is living.** Recorded, not recommended.

**95. Segni delle inondazioni del Tevere** — historic-site. OSM `node/12481055293`, a flood-level
marker. The rione article independently documents the Tiber floods and the post-1870 **muraglioni**
built to stop them, with the new **Lungotevere in Augusta** and **Lungotevere Marzio** named after.
https://it.wikipedia.org/wiki/Campo_Marzio. A nice small record if a marker source can be found.

**96. Casa Caravaggio** — OSM memorial `node/13758528385` → Campo Marzio. **No source. Do not ship
without one** — Caravaggio addresses in Rome are a well-known attribution swamp.

### 6.8 Streets and squares as places in their own right

Vertex counts are from my own geometry run; the "notes" column is where the arbitrator should look.

| Street | OSM segs / pts | Vertex result | Note |
|---|---|---|---|
| **97. Via del Babuino** | 1 / 19 | **Campo Marzio 19** | clean. it.wikipedia: links piazza del Popolo to piazza di Spagna, eastern arm of the Tridente. Opened **1523–1527** under Clement VII as the third arm. |
| **98. Via Margutta** | 3 / 11 | **Campo Marzio 11** | clean. See §101. |
| **99. Via dei Condotti** | 2 / 11 | **Campo Marzio 11** | clean. it.wikipedia: "collega via del Corso a Piazza di Spagna." |
| **100. Via della Croce** | 3 / 10 | **Campo Marzio 10** | clean. Named in Roma Capitale's rione blurb. The 1909 *sventramento* plan would have demolished along it; see §103. |
| **101. Via Borgognona** | 3 / 8 | **Campo Marzio 8** | clean. it.wikipedia: runs parallel between via dei Condotti to the north and via Frattina to the south. |
| **102. Via Vittoria** | 3 / 9 | **Campo Marzio 9** | clean |
| **103. Via Bocca di Leone** | 4 / 12 | Campo Marzio 11 / **Colonna 1** | effectively clean, one kerb vertex |
| **104. Via di Ripetta** | 8 / 42 | **Campo Marzio 42** | clean. it.wikipedia: traced **1518** under Leo X as **via Leonina**, western arm of the Tridente. |
| **105. Via Tomacelli** | 7 / 40 | **Campo Marzio 40** | clean |
| **106. Via Gregoriana** | 1 / 6 | Campo Marzio 5 / Colonna 1 | effectively clean. Opened by **Gregory XIII** for the **1575** Jubilee, replacing Domenico Fontana's staircase, to link Trinità dei Monti to the city below. |
| **107. Via delle Carrozze** | 3 / 9 | **Campo Marzio 9** | clean |
| **108. Via Belsiana** | 2 / 11 | Campo Marzio 10 / Colonna 1 | effectively clean |
| **109. Via Laurina, via del Vantaggio, via dell'Oca, via di San Giacomo, via dei Greci, via di Gesù e Maria, via Angelo Brunetti, via Antonio Canova, via Ferdinando di Savoia** | — | **all 100% Campo Marzio** | the quiet Tridente cross-streets; one record between them at most |
| **110. Viale della Trinità dei Monti** | 2 / 16 | **Campo Marzio 16** | clean |
| **111. Via di San Sebastianello** | 2 / 24 | **Campo Marzio 24** | clean; carries §47, §50, §51 and Temple University |
| **112. Lungotevere in Augusta** | 3 / 28 | **Campo Marzio 28** | clean |
| **113. Lungotevere Arnaldo da Brescia** | 22 / 25 | **Campo Marzio 25** | clean |

Piazze that tested clean and are not covered above: **piazza Borghese** (`node/6938551404` largo
della Fontanella di Borghese; the rione article's own lead image is of it), **piazza di Firenze**
(`way/130714808`), **piazza Bucarest** (`way/24650963`), **piazza del Ferro di Cavallo**
(`way/201748495`), **largo San Rocco** (`way/634760440`), **largo Amleto Cataldi**
(`way/207400709`), **Giardini Emiciclo di Nettuno** (`way/202580555`, `way/202581027`).

### 6.9 Institutions, hotels and the historic trade

**114. Accademia di Belle Arti di Roma — Sede Storica** — historic-site. **Via di Ripetta 222**.
- The Academy's own contacts page gives the address, and **opening 07:30–19:15 Monday to Saturday**,
  tel **06 322 7025 / 06 322 7036**. A second Roman site, the **succursale at via del Corso 476**, is
  also inside Campo Marzio; the Campo Boario sites are in Testaccio.
  https://www.abaroma.it/contatti/
- it.wikipedia: it is in the AFAM university sector under **Legge 508/1999** and, under **DL 7 agosto
  2026 n. 144 art. 6 c. 2**, may award three-year and master's degrees.
  https://it.wikipedia.org/wiki/Accademia_di_belle_arti_di_Roma
- CAUTION: it.wikipedia opens "una fra le più importanti e antiche accademie di belle arti d'Italia
  ed è stata, inoltre, **la prima legalmente riconosciuta** dal Ministero". First clause superlative,
  banned. The "prima legalmente riconosciuta" is a sequence claim and technically permitted, but it
  rests on Wikipedia alone with no register behind it. **I would drop it.**
- Geometry: `node/13443245244`, Q338481 → Campo Marzio; hand-test of via di Ripetta 222 likewise.

**115. Casa di Goethe** — museum. **Via del Corso 18.**
- Roma Capitale: the Roman apartment where **Goethe lived 1786–1788** with the painters **Tischbein,
  Johann Georg Schütz and Friedrich Bury**; **opened 1997**; "attualmente **l'unico museo tedesco
  all'estero**". Collection of German artists from the poet's Roman circle plus contemporary Italian
  and German work; permanent display "Goethe in Italia"; holds **Andy Warhol's 1982 portrait of
  Goethe**, after Tischbein. Two libraries — the **Deutscher Künstlerverein** library and a reference
  library of about **8,500 volumes**. **Open Tuesday to Sunday 10.00–18.00, closed Monday, last
  admission half an hour before closing.** https://www.turismoroma.it/it/luoghi/casa-di-goethe ·
  `POINT (12.477033 41.908975)` · official site https://www.casadigoethe.it/
- Geometry: `node/2244843070`, Q959650, `addr:street=Via del Corso` → Campo Marzio.
- "L'unico museo tedesco all'estero" is a **uniqueness claim**, which is superlative-shaped. Roma
  Capitale asserts it; the rules say attribution does not save it. **Drop it**; the 1997 opening and
  the Goethe residency dates carry the record.
- The last-admission time is exactly the kind of fact the rules explicitly welcome.

**116. Museo Atelier Canova-Tadolini** — museum / restaurant. **Via del Babuino 150/a**, at the
corner of via dei Greci.
- Roma Capitale: in **January 1818** **Antonio Canova** signed to guarantee the lease of his "studio
  di uso di cultura" in favour of his pupil **Adamo Tadolini**, also allowing him to reproduce some
  of his works; Canova had himself worked in the rooms. The atelier stayed **Tadolini family
  property from 1818 until the late 1960s**, four generations — **Adamo, Giulio, Scipione, Enrico** —
  producing **over 500 works**. Bought later by the **Galleria Antiquaria Benucci** and reopened to
  the public in **2003 as a restaurant-café inside a museum**. About **400 works** on show: sketches,
  preparatory models, marble and bronze sculpture, anatomical studies, tools, documents.
  https://www.turismoroma.it/it/luoghi/museo-atelier-canova-tadolini
- Its own site: **bar/caffetteria daily 08:00–24:00, restaurant daily 12:00–23:00**; via del Babuino
  150/A; tel 06 32110702. https://www.canovatadolini.com/orari-di-apertura/
- Geometry: `node/11206128006` → Campo Marzio; hand-test of the address likewise.
- **DESIGNATION TRAP.** turismoroma says the collection "è stato **notificato dallo Stato italiano**
  e non è vendibile né movibile". That is a designation claim in Ruling 1's sense. **Banned.** The
  publishable residue is that the collection is presented as inalienable — and even that is safer
  omitted. See §11.1.

**117. Antico Caffè Greco** — cafe. **Via dei Condotti 86.** **STATUS RISK — see §11.3.**
- Roma Capitale: founded **1760** by **Nicola di Madalena**, a Levantine coffee-seller, "da qui il
  nome". Over **300 works** on the walls. The **Sala Omnibus** holds medallions, miniatures and
  plaster plaques recording Bizet, Baudelaire, Byron, D'Annunzio, Goethe, Joyce, Leopardi, Nietzsche,
  Silvio Pellico, Buffalo Bill and Sitting Bull. Listed in Roma Capitale's *negozi storici* register.
  https://www.turismoroma.it/it/luoghi/antico-caffe-greco · https://www.turismoroma.it/it/tag/negozi-storici
- it.wikipedia: the **"Gruppo dei Romanisti"** meets there the first Wednesday of every month, and
  since **1940** publishes the *Strenna dei Romanisti* each year on the **Natale di Roma, 21 April**.
  Member of **Locali storici d'Italia**. https://it.wikipedia.org/wiki/Antico_Caff%C3%A8_Greco
- CAUTION: "la più grande galleria d'arte privata aperta al pubblico del mondo" appears in **both**
  Roma Capitale and it.wikipedia. Superlative, and banned regardless of attribution. The **300+
  works** is the legal form.
- **The status problem is real and current.** it.wikipedia: "Nel corso del **2025** è stato chiuso
  temporaneamente dall'Ospedale Israelitico di Roma. A **maggio 2026** si ha notizia di una sua
  prossima riapertura." Its own site's homepage banner on the day of fetch read "IL CAFFÈ GRECO STA
  PER ESSERE DISTRUTTO / FAI LA TUA PARTE PER SALVARLO", with press releases dated **18 June 2026**
  about a Consiglio di Stato hearing on access to the ownership-transfer records.
  https://www.anticocaffegreco.eu/
  **No `status` field for this record can be written honestly as "open" today.** §11.3.

**118. Il Vero Alfredo** — restaurant. **Piazza Augusto Imperatore 30.**
- Roma Capitale's *negozi storici* register. The business began in **1908** in a small restaurant in
  **Piazza Rosa**, on the site later occupied by the Galleria Alberto Sordi, when **Alfredo Di Lelio**
  made fettuccine of semolino with butter and parmesan for his wife Ines after childbirth. Moved to
  **via della Scrofa in 1914**. **Mary Pickford and Douglas Fairbanks**, honeymooning in Rome, gave
  him two gold serving pieces. The via della Scrofa premises were given up around the Second World
  War; his son **Armando ("Alfredo II")** restarted after the war **in Piazza Augusto Imperatore**.
  Now run by **Ines Di Lelio** and her daughter **Chiara**. **450 photographs** on the walls.
  https://www.turismoroma.it/it/luoghi/il-vero-alfredo · https://www.turismoroma.it/it/tag/negozi-storici
- Geometry: hand-test of the address → Campo Marzio. Note **via della Scrofa is also in Campo
  Marzio** for most of its length (§8.7), so the 1914–1940s address is in this rione too. The 1908
  address, Piazza Rosa, is under the Galleria Alberto Sordi — **Colonna's**, and Colonna's finder
  flagged a naming collision there.
- **DESIGNATION TRAP.** The same page says the premises and photo archive are "oggetto di **vincolo
  e tutela** da parte del **Ministero dei beni e delle attività culturali**". That is precisely the
  banned form, in Italian, from an institutional source. **It must not appear on any page.** §11.1.
- Official site https://www.ilveroalfredo.it/ returns 200 (8,012 characters); I did not extract a
  clean opening-hours block and would not state hours without one.

**119. Grand Hotel Plaza** — hotel. **Via del Corso 126.**
- Roma Capitale's *Alberghi storici di Roma* feature: in the Tridente, on via del Corso, it "nasce
  come locanda nell'ultimo decennio della Roma pontificia" and quickly became a meeting point for
  nobles, artists and politicians. The same page explains that **Federalberghi Roma** gathered
  hotels founded **before 1950** into a **Comitato Alberghi Storici** with **over 40 members**, about
  half of them four- or five-star. https://www.turismoroma.it/it/page/gli-alberghi-storici-di-roma
- Geometry: `node/668952085`, `addr:street=Via del Corso` → Campo Marzio; hand-test likewise.

**120. Hotel d'Inghilterra** — hotel. **Via Bocca di Leone 14.** OSM `node/10436444376`, Q18350121
→ Campo Marzio. Official site https://www.starhotelscollezione.com/it/i-nostri-hotel/hotel-d-inghilterra-roma/
returns 200. **No institutional history source reached** beyond the Federalberghi framing above.
**121. Hotel Hassler** — hotel. **Piazza Trinità dei Monti 6.** Hand-test → Campo Marzio. Official
site https://www.hotelhasslerroma.com/ 200. Same evidence gap.
**122. Hotel de Russie** — hotel. **Via del Babuino 9.** Hand-test → Campo Marzio. Official site
https://www.roccofortehotels.com/hotels-and-resorts/hotel-de-russie/ 200. Same gap.
**123. Hotel de la Ville** — hotel. **Via Sistina 69.** Hand-test → Campo Marzio, on the stretch
Wikipedia assigns to Campo Marzio (§8.4).
**124. Hotel Palazzo Nainer** — hotel, inside §79, sourced by it.wikipedia.

Per the corpus rules, an official hotel site establishes **identity, location and hours** and
nothing else — not "founded in", not "the oldest", not awards. The only *history* claim I have an
institutional source for is the Grand Hotel Plaza's, and even that is loose ("nell'ultimo decennio
della Roma pontificia"). **§10 explains why I did not chase more.**

**125. Temple University Rome** — OSM `node/13700747901`, via di San Sebastianello, `opening_hours=
Mo-Su 08:00-21:00`, site https://rome.temple.edu/ → Campo Marzio.
**126. Accademia Nazionale dei Sartori** — OSM `node/10124850717`, **Via Francesco Crispi 115**,
site https://www.accademianazionaledeisartori.it/. Tests Campo Marzio — but **via Francesco Crispi
is a named rione boundary** and the OSM way tests **Colonna 23 / Ludovisi 6 / Trevi 1**. §8.5.
**STRADDLER.**

---

## 7. Things I looked for in Campo Marzio and did not find

- **No archaeological park or excavation open to visitors.** The Augustan monuments are the
  antiquity; there is no Campo Marzio equivalent of Trevi's Vicus Caprarius or Colonna's Hadrianeum
  that I could source. The mausoleum is shut.
- **No civic museum other than the Ara Pacis.** Casa di Goethe, Keats-Shelley, de Chirico and
  Canova-Tadolini are private or foreign foundations.
- **No theatre of note.** Teatro Salone Margherita is in Colonna (§8.3); the only theatre inside is
  the Pincio puppet booth, and I could not source it.
- **No market.** The Tridente is boutiques; there is no covered or street market I could source.
- **No metro station page material.** Spagna and Flaminio serve the rione (it.wikipedia's rione
  article gives Metro A, Spagna and Flaminio) but I found no institutional page worth a record.
- **No historic pharmacy inside the rione.** The one in Roma Capitale's *negozi storici* list,
  **Antica Farmacia Reale, Via del Gambero 13/a**, is in **Colonna**, not here.

---

## 8. Straddlers — flagged, NOT resolved

Handing all thirteen up. I have not adjudicated any of them.

**8.1 Palazzo di Propaganda Fide.** Fronts **piazza di Spagna**, which is Campo Marzio's (83/86
vertices), but the building is **55/55 in Colonna** and **Colonna has already shipped it**
(wave 2). it.wikipedia agrees: "sito nel rione Colonna con affaccio su piazza di Spagna". It is a
**Lateran Treaty extraterritorial property** and it is not mine. **The trap for the corpus is that
any address-string geocode of "Palazzo di Propaganda Fide, Piazza di Spagna" returns Campo Marzio.**
Recording it here purely so that if the Campo Marzio page describes the piazza's frontages, it does
not silently annex a shipped Colonna building.

**8.2 Piazza San Lorenzo in Lucina, and the two churches on it.** The piazza is a named rione
boundary. Colonna's finder vertex-tested it at **Campo Marzio 15 / Colonna 9** and took the
**basilica** (shipped). The **Rome Baptist Church** at the same square tests Campo Marzio and
it.wikipedia says Campo Marzio. Result: **two churches on one square, in two different rione
files.** Correct, but the arbitrator should confirm rather than let it look like an error.

**8.3 Via dei Due Macelli, and Teatro Salone Margherita on it.** The street is a named boundary and
vertex-tests **Colonna 6 / Campo Marzio 4 / Trevi 1** — identical to Colonna's independent run. The
theatre at **number 75** (OSM `node/4370077891`, Q3945740) tests **Colonna**. I am not claiming it;
flagging because it surfaced inside my bbox harvest and will surface in anyone else's.

**8.4 Via Sistina.** Vertex test **Colonna 8 / Campo Marzio 4 / Trevi 1**. it.wikipedia states the
rule explicitly and it agrees with the geometry: *"Provenendo da Trinità dei Monti, la via
appartiene al rione **Campo Marzio fino all'incrocio con via Francesco Crispi**; in seguito è parte
del rione Colonna fino a piazza Barberini."* https://it.wikipedia.org/wiki/Via_Sistina
**A street with a documented split point.** Whoever writes it should write the split.
Consequence: **Hotel de la Ville at via Sistina 69** is on the Campo Marzio stretch by my hand test.

**8.5 Via Francesco Crispi and via Capo le Case.** Both named boundaries with Colonna and Ludovisi.
Crispi vertex-tests **Colonna 23 / Ludovisi 6 / Trevi 1** — i.e. the centreline is *not* in Campo
Marzio at all, though Roma Capitale lists it as the border. **Via Capo le Case did not resolve in
OSM under my name query at all.** The **Accademia Nazionale dei Sartori, via Francesco Crispi 115**
(§126) is the object caught in this.

**8.6 Via dei Portoghesi, via della Stelletta, piazza Campo Marzio, via degli Uffici del Vicario.**
The Sant'Eustachio and Colonna edges. Results: via dei Portoghesi **Campo Marzio 3/3**; via della
Stelletta **Campo Marzio 5 / Sant'Eustachio 1**; via degli Uffici del Vicario **Colonna 7 / Campo
Marzio 2**. Buildings affected: **Sant'Antonio dei Portoghesi** (§33) and **Santa Maria della
Concezione in Campo Marzio** (§44), both of which test inside but sit on the line.

**8.7 Via della Scrofa.** **Campo Marzio 11 / Sant'Eustachio 6.** Not in Roma Capitale's boundary
ring, so this is a geometry-only straddle. Affects **Palazzo Aragona Gonzaga** at number 117 (§81,
tests inside) and the 1914 address of **Il Vero Alfredo** (§118).

**8.8 Via di Campo Marzio.** **Colonna 9 / Campo Marzio 4** — reproducing Colonna's count exactly.
The rione's namesake street is mostly in the neighbouring rione. It is also the street of the
already-shipped **Orologio di Augusto** (§2.2). Worth a line on the page if anyone writes the street,
and worth *not* writing if nobody wants to explain it.

**8.9 The Pincio / Villa Borghese seam.** The rione ring ends at **viale del Muro Torto** and **via
di Porta Pinciana**. My polygon set puts **Casina Valadier, the Pincio obelisk, the idrocronometro,
the Cairoli and Toti monuments and Piazzale Napoleone I all inside Campo Marzio** — but a point on
**viale del Muro Torto itself tests OUTSIDE ALL 22 RIONES**, in the Villa Borghese gap between the
rione ring and **Q. III Pinciano**, which the roster carries as a separate in-scope unit.
Meanwhile **it.wikipedia describes both the Casina Valadier and the idrocronometro as being
"all'interno di Villa Borghese"**, and Roma Capitale's Pincio page says the 1908 flyover over the
Muro Torto "lo collega … a Villa Borghese". **The park name and the rione are different things and
the sources use the park name.** This is the one straddle in the file that a careless writer will
get wrong in the *text* rather than in the *ownership*. **Pinciano is not in this wave**, so nothing
competes for these objects today, but the wording must not say "in Villa Borghese" as if that
settled a unit.

**8.10 Via Frattina.** it.wikipedia: *"condivisa fra i rioni **Colonna a sud e Campo Marzio a
nord**."* https://it.wikipedia.org/wiki/Via_Frattina — an explicit, sourced split.
**But my vertex test of the OSM centreline returns Colonna 9 / Campo Marzio 0**, while two
hand-picked points at the street's west and east ends both return Campo Marzio. **Geometry and
source disagree, and geometry disagrees with itself depending on which points you take**, because
the OSM way is drawn along the southern kerb. **I am not resolving this. Take the sourced split.**

**8.11 Piazza del Parlamento.** West side tests **Campo Marzio**, east side tests **Colonna**, and
**Palazzo Montecitorio itself is Colonna's and already shipped**. The square is genuinely cut in
two. Do not let a Campo Marzio page imply it faces the Chamber of Deputies.

**8.12 Via del Corso.** **Campo Marzio 32 / Colonna 21 / Trevi 20 / Pigna 1** — four rioni, and
Campo Marzio has the plurality. Colonna's finder got the same distribution. Everyone will want it;
nobody should get it silently. Note that a great many Campo Marzio addresses hang off it: Casa di
Goethe (18), Gesù e Maria (45), San Giacomo in Augusta (499), Palazzo Ruspoli, Palazzo Rondinini
(518), Grand Hotel Plaza (126), Accademia di Belle Arti succursale (476). **The buildings are not
straddlers; only the street is.**

**8.13 Lungotevere Marzio.** **Campo Marzio 25 / Ponte 8.** It is a named rione boundary and it
carries **Ponte Cavour's** eastern landing.

**Already resolved by prior shipping, listed so nobody re-opens them:**
- **Ponte Regina Margherita** — physically spans Campo Marzio and Prati and my midspan point tests
  Campo Marzio, but `taken_slugs.py` shows **`prati / ponte-regina-margherita-prati-rome`**. **It is
  Prati's. Do not claim it.** By contrast **Ponte Cavour is unclaimed**, and it.wikipedia says
  outright it is "nei rioni **Campo Marzio e Prati**", so it is the mirror-image case still open.
- **Basilica di San Lorenzo in Lucina** — Colonna's, shipped. §2.1.

---

## 9. The Aurelian Walls problem, isolated

Trastevere shipped `mura-aureliane-segment-trastevere-rome` — "Aurelian Walls, Trastevere segment".
Campo Marzio contains **two more OSM `historic=citywalls` ways** (`way/1050857480`,
`way/1050857483`) plus **Porta del Popolo**, all testing inside. Ludovisi, Sallustiano and Castro
Pretorio, all shipped, sit on the same wall circuit.

**The corpus has therefore already committed to modelling the Aurelian Walls as per-rione segments
rather than as one place.** If Campo Marzio ships a wall record it must follow that precedent and
name the segment, or the arbitrator must rule the other way and consolidate — but it cannot do
nothing, because "Mura Aureliane" appearing twice with different slugs and no segment qualifier is
the exact shape of the collision the corpus gate catches. **Porta del Popolo is a distinct named
object and is safe either way.**

---

## 10. The weak edge, and why I stopped where I did

I deliberately over-collected. These are the ones I expect the verifier to cut, with the reason.

**10.1 OSM-only objects with no institutional prose (10 records).** Fontana degli Artisti, Fontana
del Bottino, Fontana Torlonia, Fontana della Ciociara, Fontana di Corot, Fontana del Mosè, Fontana
della Vasca, Teatro dei burattini San Carlino, Palazzo Vitelli, Palazzo Stroganoff, Museo Da Vinci,
Casa Caravaggio, the via Margutta fig-tree cluster. Every one exists and is correctly located.
**None has a source that says anything about it beyond its name.** A record that can only say "this
is a fountain and it is here" should not ship.

**10.2 Hotels (6 records).** I can source **identity, location and, for some, hours** from official
sites — which the rules permit — and I can source the **Federalberghi Comitato Alberghi Storici**
framing (founded before 1950, 40+ members) from Roma Capitale. **I cannot source how long any
individual hotel has traded, and the rules say an official site does not establish it.** So the only
honest hotel records are "a hotel, at this address", which is thin, plus the Grand Hotel Plaza,
which Roma Capitale does describe. I would ship **at most the Plaza**, and let the rest go.

**10.3 Thin churches (5 records).** Chiesa della Resurrezione, Santi Giuseppe e Orsola, San Gregorio
Nazianzeno, Cappella di San Gaetano alla Villa Medici, Santa Maria del Divino Amore. Each has
exactly one sourced sentence: name, rione, street. A page can list them; a page should not pretend
each is a destination.

**10.4 Thin palazzi (4 records).** Palazzo Gabrielli-Mignanelli, Palazzo Cardelli, Palazzo Rondinini,
Palazzo Boncompagni Cerasi. turismoroma pages exist for three of them but run 1,800–2,600 characters
and are mostly navigation.

**10.5 Piazze that are really other records.** Piazza Nicosia (= the Fontana del Trullo), piazza
Mignanelli (= the Colonna dell'Immacolata), piazza Bucarest (= the Casina Valadier and the Pincio
obelisk), piazza Augusto Imperatore (= the mausoleum and the INPS palaces — though this one has
enough of its own 1934–1952 and 2020–2025 history to stand alone).

**Honest total after cutting §10:** I would expect roughly **60–70 shippable records**, of which
perhaps **25** are genuinely strong. That is still comfortably a guide.

---

## 11. The three things a verifier must rule on before anything ships

### 11.1 Two institutional sources hand me designation claims. Both must be refused.

Ruling 1 bans the claim in English and Italian. Two of my best sources make it anyway:

1. **Il Vero Alfredo**, turismoroma: *"oggetto di **vincolo e tutela** da parte del **Ministero dei
   beni e delle attività culturali**"*.
2. **Museo Atelier Canova-Tadolini**, turismoroma: *"è stato **notificato dallo Stato italiano** e
   non è vendibile né movibile"*.

Both are Roma Capitale's own words. Ruling 1 says attribution does not save it, and the
evidence_ruling explains why: there is no reachable per-property register against which either
statement can be checked. **Neither sentence, nor any paraphrase, may appear.** The publishable
residue for Alfredo is the 1908/1914/post-war chronology and the 450 photographs; for
Canova-Tadolini it is the 1818 lease, the four generations, the 400 works and the 2003 reopening.

Two further items to keep out for the same reason: the **Antico Caffè Greco**'s membership of
*Locali storici d'Italia* (a private association, not a designation — probably safe, but say what it
is), and turismoroma's inclusion of three Campo Marzio businesses in its ***negozi storici*** tag
(that is a Roma Capitale editorial listing, and can be written as "Roma Capitale lists it among the
city's historic shops" — a fact about a list, not about legal protection).

### 11.2 Palazzo Magistrale and Palazzo di Spagna are a status class the rulings do not cover

The vatican_ruling covers **Vatican City** (no rione) and **Lateran Treaty Art. 15 / Art. 16
properties** (publish under the unit they stand in, with status stated). Campo Marzio has neither
of those. It has:

- **Palazzo Magistrale, via dei Condotti 68** — seat of the **Sovereign Military Order of Malta**.
  it.wikipedia: owned by the Order since **1630**, Grand Master's residence and seat of government
  since **1834**, and "gode dello status di extraterritorialità da parte del governo italiano". The
  same article is careful about what the Order is: *"La giurisprudenza interna di molti Stati, fra
  cui l'Italia, ne riconosce l'esenzione dalla giurisdizione civile pur non considerandolo soggetto
  di diritto internazionale"*, with the majority of the international community treating it as an
  international NGO, "essendo anche ormai totalmente privo del requisito di territorialità". It has
  relations with **115 states**. https://it.wikipedia.org/wiki/Sovrano_Militare_Ordine_di_Malta ·
  https://it.wikipedia.org/wiki/Palazzo_Magistrale · official site https://www.orderofmalta.int/it/
- **Palazzo di Spagna, piazza di Spagna** — the **Embassy of Spain to the Holy See**, i.e. an
  ordinary diplomatic mission of an ordinary state, on Italian soil, accredited to a third party.
  The Spanish MFA page I tried 404'd; it.wikipedia is my source.

**My recommendation, offered not decided.** The vatican_ruling's logic transfers cleanly: neither is
a border, both stand on Italian soil in rione Campo Marzio, both publish here with their status
stated accurately and neither may be described as "not in Italy". But **the Order of Malta is not
the Holy See and the Lateran Treaty has nothing to do with it**, so no page may reach for Art. 15
language. And it.wikipedia's own hedging — exempt from civil jurisdiction, *not* a subject of
international law, no territory — means the safest form is to say what the building **is** (the
Order's seat since 1834, owned since 1630) and say nothing at all about sovereignty. Same for the
embassy: say it is the Spanish embassy to the Holy See and that the square is named after it.

### 11.3 The Antico Caffè Greco cannot be shipped with a "status" that agrees with its prose

The rules require a `status` field to agree with the record's own prose. For the Caffè Greco:

- it.wikipedia: temporarily closed during **2025** by the **Ospedale Israelitico di Roma**; news of a
  forthcoming reopening as of **May 2026**.
- Its own site, fetched **2026-09-02**: a homepage banner reading *"IL CAFFÈ GRECO STA PER ESSERE
  DISTRUTTO / FAI LA TUA PARTE PER SALVARLO"*, and press releases dated **16 and 18 June 2026** about
  a Consiglio di Stato case on access to ownership-transfer records.
- turismoroma still carries it as an active *bottega storica* with contact details and **no Orari
  field at all**.

**Three institutional-ish sources, three different implied states.** The options are: ship it as a
historic-site rather than a cafe, describing the 1760 foundation and the Sala Omnibus without
asserting that you can get a coffee; ship it with an explicitly uncertain status; or hold it. **I
recommend the first.** What I am confident of is that **no record may say it is open**, and that a
guide page which sends a reader to via dei Condotti 86 for an espresso may be wrong on the day.

The same care applies, less dramatically, to the **Mausoleo di Augusto** (closed since 6 June 2022,
works due to end 2026) and to **Piazza Augusto Imperatore** (reopened **June 2025** after the Urbs
et Civitas scheme). Both dates are Roma Capitale's own.

---

## 12. Photo leads — quarantined, NOT used

Ruling 3: `"photos": []` everywhere in this wave. I sourced none and used none. Noting leads only,
with the copyright facts I happen to have, for whoever runs the image wave.

- **Museo dell'Ara Pacis** — **REJECT.** Richard Meier is living. Roma Capitale names him.
- **Palazzo dell'ex Unione Militare** — **REJECT.** Massimiliano and Doriana Fuksas, living,
  restructured it 2008–2013.
- **Mausoleo di Augusto, forthcoming museum layout** — **REJECT for the new fit-out.** Rem Koolhaas
  is living. The ancient fabric is a different question.
- **Palazzi dell'INPS** — Vittorio Ballio Morpurgo died **1966**; Italy has no freedom of panorama,
  so a façade shot is not automatically safe. Needs the four-gate rule.
- **Casina Valadier, Pincio, piazza del Popolo fountains, Porta del Popolo, Spanish Steps, Barcaccia,
  the obelisks, all the churches, all the pre-1900 palazzi** — authors long dead; the blocker is
  Italy's lack of freedom of panorama and any site-specific reproduction rules, not authorship.
- **The Sovrintendenza runs a formal image-permission process** —
  `sovraintendenzaroma.it` carries "Autorizzazione all'uso di immagini del patrimonio culturale di
  Roma Capitale" and the Ara Pacis site carries "Autorizzazione riprese fotografiche". **That is the
  door the image wave should knock on**, and it is a better lead than any individual photograph.
- Roma Capitale's own captions credit "ph. Turismo Roma" / "Foto turismoroma" on several pages,
  which is a licensing question, not a licence.

---

## 13. Provenance — every source I actually fetched

**Geometry.** Overpass `overpass-api.de` (+ kumi.systems, private.coffee, osm.jp mirrors),
2026-09-02. Rione relations `rel["boundary"="place"]["place"="quarter"](41.85,12.42,41.95,12.55)`,
22 returned, 22 closed rings. Campo Marzio = `relation/5452743`, `ref=R. IV`, 215-point ring.
Eight chunked POI harvests over the Campo Marzio bounding box `41.901127,12.471958,41.912874,12.488000`
(`historic`; `tourism`; `amenity=place_of_worship`; `amenity` in theatre/library/college/university/
embassy/fountain etc.; `man_made`/`memorial`; `wikidata`+`building`; `leisure`/`place=square`;
`wikidata`+`shop`/`amenity` food/`tourism=hotel`+`stars`). One 45-name street query with full vertex
testing.

**Roma Capitale — turismoroma.it.** 35 place pages resolved of 105 slugs tried, each with a
`POINT(lon lat)`; plus `/it/page/rione-iv-campo-marzio` (the boundary ring, §4),
`/it/tag/negozi-storici` and `/it/page/gli-alberghi-storici-di-roma`. Slugs that resolved:
museo-dellara-pacis, mausoleo-di-augusto, basilica-di-santa-maria-del-popolo, casina-valadier,
terrazza-e-passeggiata-del-pincio, villa-medici-accademia-di-francia,
chiesa-e-convento-di-trinita-dei-monti, piazza-di-spagna, piazza-del-popolo,
scalinata-di-trinita-dei-monti, fontana-della-barcaccia, porta-del-popolo, obelisco-flaminio,
casa-di-goethe, keats-shelley-house, colonna-dellimmacolata, chiesa-di-santa-maria-dei-miracoli,
basilica-dei-santi-ambrogio-e-carlo-al-corso, palazzo-borghese, palazzo-ruspoli, fontana-del-babuino,
ponte-cavour, ponte-regina-margherita, piazza-augusto-imperatore, antico-caffe-greco,
chiesa-di-santantonio-dei-portoghesi, chiesa-di-san-girolamo-dei-croati, palazzo-firenze,
chiesa-di-santivo-dei-bretoni, chiesa-di-santa-maria-portae-paradisi,
chiesa-della-santissima-trinita-degli-spagnoli, chiesa-di-santa-lucia-della-tinta,
chiesa-di-san-nicola-dei-prefetti, palazzo-nunez-torlonia, palazzo-rondinini, palazzo-cardelli,
piazza-borghese, piazza-mignanelli, sala-da-babington, il-vero-alfredo, museo-atelier-canova-tadolini,
piazza-navona. **Known 404s that matter:** via-del-babuino, via-margutta, via-dei-condotti,
via-del-corso, via-di-ripetta, porto-di-ripetta, pincio, muro-torto, accademia-di-belle-arti,
chiesa-di-san-rocco, basilica-di-santa-maria-in-montesanto, chiesa-di-gesu-e-maria, palazzetto-zuccari,
casa-museo-de-chirico, babingtons-tea-rooms, idrocronometro-del-pincio, palazzo-di-propaganda-fide.
**One poisoned hit:** `chiesa-di-santatanasio` is a different church 5 km away (§37).

**Roma Capitale — sovraintendenzaroma.it.** Index pages `/fontane` (44 entries), `/monumenti` (13),
`/beni_architettonici` (11), `/passeggiate_parchi_e_giardini` (18), `/musei_in_comune` (20),
`/altri_musei_e_collezioni` (2). Per-object pages fetched: mausoleo_di_augusto,
fontana_della_barcaccia, fontana_del_babuino, museo_dell_ara_pacis,
fontana_dei_leoni_in_piazza_del_popolo, fontana_del_nettuno_in_piazza_del_popolo,
fontana_della_dea_roma_in_piazza_del_popolo, fontane_sarcofago_in_piazza_del_popolo,
fontana_in_piazza_nicosia, scalinata_di_trinita_dei_monti, palazzetto_di_flaminio_ponzio,
passeggiata_del_pincio, museo_napoleonico, monumento_a_pietro_metastasio.

**Official sites, 200:** villamedici.it, canovatadolini.com/orari-di-apertura, trinitadeimonti.net,
chiesadegliartisti.it, casadigoethe.it, abaroma.it/contatti, biblhertz.it, santamariadelpopolo.it,
anticocaffegreco.eu, casinavaladier.it, ilveroalfredo.it, allsaintsrome.org,
fondazionedechirico.org/casa-museo, fondazionememmo.it, arapacis.it, orderofmalta.int,
hotelhasslerroma.com, roccofortehotels.com/hotel-de-russie, starhotelscollezione.com/hotel-d-inghilterra.
**Failed:** `ksh.roma.it` (Anubis proof-of-work challenge, no content — this is why Keats-Shelley has
no hours), `chiesabattistaroma.org` (DNS), `museoatelier.com` (DNS),
`exteriores.gob.es/embajadas/santasede` (404), `villamedici.it/visite/` (500).
**Do not use:** `sanrocco.info` — an architecture magazine, not the church.

**it.wikipedia** via `action=parse` (raw wikitext) and `action=query&prop=extracts`: the rione
article `Campo_Marzio` in full, plus intro extracts for 110 titles across two batches. **Wikidata**
`wbgetentities` for 42 QIDs lacking Wikipedia coordinates, to recover `P625` and `P6375` (street
address).

**Taken-slug checks.** `python3 .superpowers/taken_slugs.py` dumped in full (450 places, 12 files)
and searched offline against 60+ candidate-name fragments. Two collisions found and honoured:
**San Lorenzo in Lucina (Colonna)** and **Ponte Regina Margherita (Prati)**. Nothing else in this
file collides.

---

## 14. What is unfinished, ranked by how much it matters

1. **The Ara Pacis museum's opening hours.** turismoroma states "Tutti i giorni 9.30–19.30; 24 e 31
   dicembre 9.30–14.00; ultimo ingresso un'ora prima della chiusura" and points at `arapacis.it`,
   which I reached but whose practical-information sub-page 404'd on every path I guessed. The
   turismoroma text is institutional and probably sufficient; someone should confirm against the
   museum's own page before it ships, because it is the rione's one civic museum.
2. **Keats-Shelley House hours.** Blocked by Anubis. Currently unshippable as a fact.
3. **Santa Maria del Popolo's visiting hours.** Roma Capitale explicitly declines to state them.
   The parish page under `agostiniani.it` is the right source and I did not extract it cleanly.
4. **The Pincio's date.** turismoroma says the park was "ideato da Giuseppe Valadier (1834)";
   it.wikipedia says designed 1810–1818; the Casina is dated 1813 on one Roma Capitale page and
   1816–1837 on another. Four numbers, one hill. Someone should read the Sovrintendenza's 10k-character
   Pincio page properly and settle it.
5. **Ospedale San Giacomo.** A large, visible, closed hospital complex on via del Corso attached to
   §39, with no article and no institutional page found. Either a real record or a deliberate omission.
6. **Via Frattina's geometry.** §8.10. The OSM centreline and my own hand points disagree. Worth
   ten minutes with the actual way geometry before the arbitrator rules.
7. **Whether the Bibliotheca Hertziana and the Palazzetto Zuccari are one place or two.** They have
   separate Wikidata items and separate OSM objects but one front door.
8. **Roma Capitale's full *negozi storici* register.** The `/it/tag/negozi-storici` tag page returns
   only **eight** businesses city-wide, which cannot be the whole register; the linked
   "Negozi Storici di Eccellenza di Roma" hub 404'd on both paths I tried. Finding the real index
   would materially help every remaining rione, not just this one.
