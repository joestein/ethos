# Borgo (R. XIV, Roma Capitale toponymic code 114) — FINDER file

Wave 1, Rome programme. **Evidence, not adjudication.** A verifier adjudicates; an arbitrator rules
ownership of straddlers. I do not resolve straddlers here.

Research date: 2026-09-02. Author: finder agent.

---

## 0. Compliance statement (read before using anything below)

Three binding rulings from `priv/seed_data/rome_roster.json` (scope_ruling / vatican_ruling /
evidence_ruling), read in full before work began.

1. **NO DESIGNATION CLAIMS.** Nothing in this file asserts that any building is *vincolato*,
   listed, scheduled, declared a monument, or under state protection. I re-tested the registers and
   they remain unreachable from this network (§7). Where a source I fetched happens to mention
   protection I have omitted it rather than transcribe it.
2. **VATICAN CITY BELONGS TO NO RIONE.** St Peter's Basilica, St Peter's Square, the Vatican
   Museums and the Sistine Chapel do not appear as Borgo candidates. They appear only in §5, the
   explicit-exclusion list. I have not stated the border more precisely than the Lateran Treaty
   does; where I cite OpenStreetMap's Vatican polygon I say so and flag that it is not authority
   (§4.3 — OSM gets the Ricciolo d'Italia wrong, which is the proof).
3. **NO PHOTOGRAPHS.** Every record is `"photos": []`. I sourced, named and linked no image. Photo
   leads noted for the later wave are parked in §8 as prose only, with no URL.

Corpus rules observed: no trip durations, no vague proximity, aggregators attributed, every factual
claim carries the URL I actually fetched.

---

## 1. Method, and what "I know which rione" means here

**Tooling.** WebSearch budget was exhausted, so every retrieval ran against URLs named in advance,
fetched with `python3 urllib` (never piped `curl`, never `grep` as a source of truth). Cached at
`<scratchpad>/borgo/cache` and `<scratchpad>/borgo/ovcache`; scripts at `<scratchpad>/borgo/`.

**Boundary method — this is the load-bearing part.** Per-point Nominatim reverse geocoding failed:
`https://nominatim.openstreetmap.org/search` returned **HTTP 429** on the first request of a batch
and never recovered, so the "8 of 8 landmarks" technique from the scoping wave was *not* available
to me. Overpass `is_in()` per point also rate-limited (HTTP 406, then empty `elements` from the
kumi.systems and private.coffee mirrors, which do not carry generated areas — a trap worth
recording: **an Overpass mirror can return a syntactically valid empty answer to a point-in-polygon
query**).

What worked, and what every rione assignment below rests on: **one** Overpass call downloading full
member geometry for the boundary relations, then point-in-polygon computed locally in Python.

```
[out:json][timeout:240];
( rel(5454294); rel(5454355); rel(2529127); rel(2529081);
  rel["boundary"="administrative"]["admin_level"="2"]["name"~"Vatican",i]; );
out geom;
```
`https://overpass-api.de/api/interpreter` — HTTP 200. Rings assembled and verified **closed**:
Rione XIV Borgo (r5454294, 324 nodes), Rione XXII Prati (r5454355, 176), Rione V Ponte (r2529127,
133), Rione XIII Trastevere (r2529081, 208), Stato della Città del Vaticano (257). A second call
added Quartiere XIII Aurelio (709), XII Gianicolense (753), XIV Trionfale (872).

So when a record says **"Borgo — OSM PIP"** it means: the coordinate stated, tested against OSM
relation 5454294's assembled outer ring, falls inside. Attribute it as OpenStreetMap, not as Roma
Capitale. OSM is not the Comune's cadastre and the corpus should never write "Roma Capitale says X
is in Borgo" on this evidence.

**Second, independent check** on most records: the it.wikipedia article's own lead sentence and its
`Categoria:Roma R. XIV Borgo` membership. Italian Wikipedia is an **aggregator** — where I use it
the record says so, and the corpus must attribute it or find the underlying source.

**Coordinates** come from `it.wikipedia.org/w/api.php?action=query&prop=coordinates`, except where
noted as hand-placed by me from the street address (those are marked *approx*).

---

## 2. The rione itself

| Fact | Value | Source I fetched |
|---|---|---|
| Official code / numeral | 114 / R. XIV | `docs/rome/scope-rioni.md` §1.2, quoting Roma Capitale *Annuario statistico 2022*, Tab. 1.3 |
| Area | 0,5 km² | same |
| Resident population (31.12.2021) | 2.689 | same |
| Density | 5.924,8 ab./km² | same |
| Municipio | I | `https://it.wikipedia.org/wiki/Borgo_(rione_di_Roma)`, citing Deliberazione n. 11 of 11 March 2013; before 2013 Borgo sat in the former Municipio XVII |
| Created as 14th rione | 9 December 1586, by Sixtus V | it.wiki *Borgo (rione di Roma)*, §"XIV rione di Roma", citing Ceccarelli p. 10 — **aggregator; the underlying citation is a 1938 book I could not fetch** |
| Stated borders | "la Città del Vaticano (piazza San Pietro) ad ovest; il Tevere ad est; il rione Prati a nord; il quartiere Aurelio a sud-ovest; il rione Trastevere a sud" | it.wiki, same article |
| Street naming | the main east–west streets are called *borghi*, not *vie*; via della Conciliazione is the modern exception | it.wiki, same article |
| Demonym | *borghiciani* (romanesco) | it.wiki, same article |

**Historical spine, all from it.wiki *Borgo (rione di Roma)* unless stated** (an aggregator — the
corpus should re-source or attribute): Roman *Ager Vaticanus*, outside the *pomerium*, used for
burial; Leo IV walls the quarter 848–852 after the Saracen sack of 846, creating the *Civitas
Leonina*; Sixtus IV opens the street now called Borgo Sant'Angelo; Alexander VI opens the *Via
Alexandrina* (Borgo Nuovo) for the 1500 Jubilee, creating the *spina*; Pius IV lays out Borgo Pio,
Borgo Vittorio and Borgo Angelico from 1565 (the *Civitas Pia*); 1527 Sack of Rome enters through
the Borgo; 1870 the rione passes to the Kingdom of Italy by royal decree of 11 October (it.wiki
records 1.566 of 16.590 eligible Leonine City residents voting for annexation on 2 October 1870,
citing Valentini pp. 65–66); 1936–1950 the *spina* is demolished for via della Conciliazione.

---

## 3. Candidates

74 candidates. Format: name · kind · address · what it is · date/author · rione evidence · sources.
All records carry `"photos": []`.

### 3.1 The anchors

**1. Castel Sant'Angelo / Mausoleo di Adriano — monument, archaeological site and state museum**
- Address: **Lungotevere Castello 50** — Roma Capitale's tourism portal, `https://www.turismoroma.it/it/luoghi/castel-santangelo` (field "Location": *"Castel Sant'Angelo, Lungotevere Castello, 50"*; field "Indirizzo": `POINT (12.46638831 41.90262909)`).
- Hours, same source: *"Dal martedì alla domenica 9.00-19.30. Ultimo ingresso alle ore 18.30. Chiuso il lunedì, il 25 dicembre, il 1° gennaio (salvo aperture straordinarie su progetto MiC)."* Same page adds a *"Lunedì di Castello"* opening from 3 August 2026 for the rest of 2026. Tel. 06 6819111.
- Official site given by that portal: `https://direzionemuseiroma.cultura.gov.it/museo-nazionale-di-castel-santangelo` — **I could not fetch it**: DNS failure for `*.cultura.gov.it` from this network (§7). So the museum's own site does NOT back any claim here; Roma Capitale's portal does.
- What it is: Hadrian's mausoleum, later a fortress and papal refuge, now a state museum. Built **130–139 AD** (begun under Hadrian, completed under Antoninus Pius); heavily rebuilt **1447–1527**. Museum since **1925**. — it.wiki *Castel Sant'Angelo* infobox and lead; turismoroma confirms *"sede museale nel 1925"* and describes it as *"monumento, area archeologica e museo"*.
- Ownership: Italian State, Ministero della cultura; managed since December 2019 through the Direzione Musei statali di Roma. — it.wiki lead (aggregator).
- Visitor number: 966.623 in 2022, per it.wiki citing *Il Giornale dell'Arte*. **Weak** — an aggregator citing a trade magazine. Do not publish as a superlative ("one of Italy's most visited") on this.
- Rione: **Borgo — OSM PIP** at 41.903044, 12.466307. it.wiki lead independently: *"nel rione XIV - Borgo"*.
- Photos: []

**2. Parco Adriano / the Castel Sant'Angelo gardens — public park around the castle**
- Rione: **Borgo — OSM PIP** at 41.90420, 12.46480 (*approx*, hand-placed).
- Content lead only: it.wiki *Piazza Pia (Roma)* states that archaeological finds from the 2023–24 Piazza Pia dig *"verranno trasferiti nei giardini di Castel Sant'Angelo"*. Future tense, weakly sourced. Do not publish as fact.
- Photos: []

**3. Ponte Sant'Angelo (pons Aelius) — bridge — STRADDLER**
- What/when: built **135 AD** by Hadrian to reach his mausoleum, designer given as Demetrianus. Clement IX had Bernini design a new parapet in **1669**, carrying **ten** angels with the instruments of the Passion, carved by Bernini's pupils under his direction; only the earlier Peter and Paul statues remain from the previous set. Named sculptors per it.wiki: Antonio Raggi, Lazzaro Morelli, Paolo Naldini, Cosimo Fancelli, Girolamo Lucenti, Ercole Ferrata, Giulio Cartari. Two of Bernini's own angels were never installed and are in Sant'Andrea delle Fratte (rione Colonna — not Borgo).
- Sources: `https://it.wikipedia.org/wiki/Ponte_Sant%27Angelo` (aggregator); a stub record exists at `https://www.turismoroma.it/it/luoghi/ponte-santangelo` giving `POINT (12.4665074 41.9011928)` but no prose.
- **Rione: STRADDLER, Ponte ↔ Borgo.** it.wiki lead: *"collega piazza di Ponte S. Angelo al lungotevere Vaticano, a Roma, nei rioni Ponte e Borgo."* OSM PIP agrees and localises it: west end 41.90185, 12.46578 → **Borgo**; east end 41.90175, 12.46700 → **Ponte**; the it.wiki centroid 41.901803, 12.46645 → **Ponte**. **Do not resolve — arbitrator.**
- Photos: []

**4. Passetto di Borgo (*er Coridore*) — elevated fortified corridor — STRADDLER WITH VATICAN CITY**
- What/when: a raised pedestrian passage **c. 800 m** long linking the Apostolic Palace to Castel Sant'Angelo, formed in **1277** by Nicholas III inside a stretch of the Vatican walls, reusing fabric from Totila's siege (546) and the Civitas Leonina (848–852). Used as an escape route by Alexander VI in 1494 and Clement VII in 1527. — `https://it.wikipedia.org/wiki/Passetto_di_Borgo` (aggregator). Roma Capitale's portal repeats the same two escapes and calls it *"un passaggio sopraelevato e fortificato che collega il Vaticano con Castel Sant'Angelo, passando sulle Mura Vaticane"*, adding that it is walkable *"in alcuni periodi dell'anno"* — `https://www.turismoroma.it/it/luoghi/castel-santangelo`.
- Reopening: it.wiki cites a Direzione generale Musei notice of 23 December 2024 and an Artribune piece of the same date for a 2024 restoration and reopening to the public. **I could not fetch either** (`musei.beniculturali.it` unreachable, §7). Treat the reopening as UNVERIFIED.
- **Rione: STRADDLER, Borgo ↔ Vatican City.** OSM PIP: midpoint 41.903333, 12.461667 → **Borgo**; the western end at the Apostolic Palace, 41.90295, 12.45745 → **inside the Vatican polygon**. This is the single object in this file that physically crosses the sovereign border, and per the vatican_ruling the corpus must not state where the crossing point is: the Treaty defines the line only by its 1:5000 map. **Arbitrator.**
- Photos: []

**5. Mura leonine — city wall — STRADDLER WITH VATICAN CITY**
- What/when: c. **5 km** of wall with **44 towers 14 m high**, built **848–852** by Leo IV around the Vatican hill and St Peter's after the 846 Saracen sack; Lothar I decreed and helped finance it in October 846. Extended by Paul III and by Pius IV to 1565. — `https://it.wikipedia.org/wiki/Mura_leonine` (aggregator).
- **Rione: STRADDLER.** OSM PIP for the surviving Passetto stretch, 41.903056, 12.459722 → **Borgo**. But it.wiki's own infobox gives the wall's state as *"{{PON}} (848-1870) / {{VAT}} (dal 1929)"* — i.e. most of the circuit is now the Vatican's perimeter, not Borgo's. Only the Passetto stretch and the Porta Santo Spirito stretch are demonstrably on the Italian side. **The corpus must not publish "the Leonine Walls are in Borgo" flat. Arbitrator.**
- Photos: []

**6. Via della Conciliazione — street**
- What/when: **c. 420 m**, from largo Giovanni XXIII to piazza Pio XII; CAP 00193; paved in *sampietrini*; designed by **Marcello Piacentini and Attilio Spaccarelli**; construction from **1936** on the demolition of the Spina di Borgo; completed for the **1950** Jubilee with two rows of obelisk lampposts. Named for the Lateran Pacts of 11 February 1929. — `https://it.wikipedia.org/wiki/Via_della_Conciliazione` infobox and lead (aggregator).
- The same article states the street's east end at piazza Pio XII is where *"una sottile linea di travertino romano … delinea il confine di Stato tra Italia e Vaticano."* **DO NOT PUBLISH AS FACT** — the vatican_ruling forbids stating the border more precisely than the Treaty does, and the travertine line is exactly the oversimplification named in the ruling. Recorded here only so the verifier can catch it if a writer lifts it.
- The article's own critical framing: *"una delle opere urbanistiche più discusse e aspramente criticate del Novecento"*, citing Benevolo; it.wiki *Borgo* adds that Benevolo, Cederna, Vannelli and Insolera are all extremely critical. Publishable as attributed opinion, not as fact.
- Rione: **Borgo — OSM PIP** at 41.902389, 12.461153.
- Photos: []

**7. Piazza Pia — square**
- Rione: **Borgo — OSM PIP** at 41.90230, 12.46450 (*approx*) and at Roma Capitale's own `POINT (12.464443758832395 41.902368220766036)` — `https://www.turismoroma.it/it/luoghi/piazza-pia` (that page carries the point and nothing else: no prose, no hours).
- it.wiki *Piazza Pia (Roma)* gives: named for Pius IX; **7.200 m²**; pedestrianised for the **2025 Jubilee** at a stated **€85,3 m**, works completed in **490 days**, extending the Lungotevere in Sassia underpass so traffic runs below; travertine paving, benches, fountains, steps and trees; a 2nd-century AD *fullonica* and a garden attributed to Caligula found during the dig.
- **LOW CONFIDENCE — flagged for the verifier.** That article's sources are `romanoimpero.com` and `theplan.it`, and it contains a plain error (it places the Meta Romuli in the *Servian Wall*, which is on the other side of the river and centuries wrong). It cites one Roma Capitale page, `https://www.comune.roma.it/web/it/notizia.page?contentId=NWS1075685`, which **I could not fetch** (§7). The Jubilee redevelopment is real and important and a travel guide will want it — but **nothing in this record is currently sourced well enough to ship**, except the coordinate from turismoroma. Someone with reachable `comune.roma.it` should redo it.
- Photos: []

**8. Piazza Pio XII — square at the Vatican end of via della Conciliazione**
- Rione: **Borgo — OSM PIP** at 41.90248, 12.45930 (*approx*, eastern edge). A point 140 m west, 41.90252, 12.45790, falls inside the OSM Vatican polygon. That bracket is all I will say: it locates the transition to within ~140 m and no further. **The corpus must not narrow it.**
- What it is: the terminal square of via della Conciliazione, formed between Piacentini's two propylaea; it occupies roughly the site of the demolished piazza Rusticucci. — it.wiki *Via della Conciliazione* and *Palazzo Rusticucci-Accoramboni*.
- Photos: []

**9. Largo Giovanni XXIII — the western end of the Lungotevere in Sassia underpass / start of via della Conciliazione**
- Rione: **Borgo — OSM PIP** at 41.90230, 12.46450 (*approx*). it.wiki *Via della Conciliazione* infobox gives it as the street's `inizio`.
- Photos: []

### 3.2 The Santo Spirito complex

**10. Arcispedale di Santo Spirito in Saxia — hospital complex, now also a conference venue**
- Address given by it.wiki *Borgo*: *"su via S. Pio X"*. The modern working hospital beside it is the ASL Roma 1 *Presidio S. Spirito in Sassia*.
- What/when: grew from the *Schola Saxonum* founded by **Ine, king of Wessex** (it.wiki dates the schola 726–728 in one article, "beginning of the 8th century" in another — **internal inconsistency, flag**); the xenodochium founded **794** by Offa of Mercia; turned into a hospital by **Innocent III in 1198**, the complex designed by Marchionne Aretino. — `https://it.wikipedia.org/wiki/Arcispedale_di_Santo_Spirito_in_Saxia` and `https://it.wikipedia.org/wiki/Chiesa_di_Santo_Spirito_in_Sassia`.
- **"L'ospedale più antico d'Europa"** — it.wiki asserts this, citing Mattoni et al., *Italian Journal of Public Health* 7(2), 2012. This is a **superlative from an aggregator**; under the corpus rules it is not publishable on a place's own or a summary source. Either fetch the journal article or drop it.
- Corsia Sistina: built for Sixtus IV, **120 m long by 12 m wide**, facing Borgo Santo Spirito, split by a *tiburio* under an octagonal tower into the *Braccio di sotto* and *Braccio di sopra*; the altar at the centre of the tiburio is described as probably Palladio's only Roman work; the *portale del Paradiso* is attributed to Andrea Bregno; a fresco cycle of more than fifty scenes was painted in **1478**. Beside the Bregno portal is the **ruota degli esposti**, the foundling wheel. — same it.wiki article. All of this is aggregator-sourced and attribution-dependent; the Palladio attribution is hedged in the source itself ("dovrebbe essere") and must stay hedged.
- Rione: **Borgo — OSM PIP** at 41.901539, 12.462667.
- Photos: []

**11. Palazzo del Commendatore — palace inside the Santo Spirito complex**
- Address: **Borgo Santo Spirito 3** — `https://www.turismoroma.it/it/luoghi/palazzo-del-commendatore` (Roma Capitale), field "Location", with `POINT (12.461159 41.901512)`.
- What/when, same source: built **1566–1572** under Pius V to a design by **Giovanni Lippi, called Nanni di Baccio Bigio**; original seat of the *commendatore* of the Ospedali Riuniti di S. Spirito; two-storey façade of eight windows each; arcaded courtyard with a 17th-century fountain and a **six-hour clock** whose single hand is shaped like a lizard, framed by an ouroboros and topped by a bronze cardinal's hat; a loggia at *piano nobile*; the frescoed **Salone del Commendatore**.
- Access, same source: *"Visitabile solamente il cortile durante l'orario dell'ASL Presidio S. Spirito in Sassia — Dal lunedì al venerdì dalle ore 7.30 alle 18.00; Sabato dalle 7.30 alle 12.00."* Booking of the Salone via `www.aslroma1.it/salone-del-commendatore` (I did not fetch that page).
- Rione: **Borgo — OSM PIP** at 41.901512, 12.461159 (Roma Capitale's own coordinate).
- Photos: []

**12. Museo storico nazionale dell'arte sanitaria — museum**
- **ADDRESS CONFLICT, flagged.** it.wiki's infobox says *"Lungotevere in Sassia 4"*; its own lead sentence says *"in Lungotevere in Sassia 3"*; Roma Capitale's turismoroma page for the Palazzo del Commendatore places the museum inside that palace at **Borgo Santo Spirito 3**. Its own site says only *"nell'ala secentesca dell'Ospedale Santo Spirito in Sassia"* — `https://www.museiscientificiroma.eu/artesanitaria/storia.htm`. Three different numbers. **Do not publish an address until this is resolved.**
- What/when, from the museum's own site: opened **1933**, conceived by professors **Pietro Capparoni** and **Giovanni Carbonelli** with General **Mariano Borgatti**, built on the collection of the old Anatomical Museum; documents the passage of medicine, surgery and pharmacology from magic to science; holds anatomo-pathological preparations and wax models (sala Flajani), Paolo Mascagni's anatomical plates, and oil paintings that belonged to the anatomist Guglielmo Riva (sala Alessandrina).
- it.wiki adds the institutional chain: Istituto per il Museo storico dell'Arte Sanitaria founded 1920, R.D. 1746 of 14 May 1922; became the Accademia di Storia dell'Arte Sanitaria (A.S.A.S.) in 1934; Santo Spirito granted a wing in the former corsia Alessandrina in 1929. `https://it.wikipedia.org/wiki/Museo_storico_nazionale_dell%27arte_sanitaria` (aggregator).
- **No hours found.** The museum's own site did not yield an hours page I fetched. Do not invent one.
- Rione: **Borgo — OSM PIP** at 41.90140, 12.46280 (*approx*).
- Photos: []

**13. Accademia Lancisiana, its library, and the Spezieria — institutions inside Palazzo del Commendatore**
- Roma Capitale: the palace houses *"l'antica Spezieria, dove venivano trattate le erbe medicinali — di cui si conservano tuttora antichi vasi e mortai, e l'Accademia Lancisiana con la sua Biblioteca, fondata nel Settecento sotto il pontificato di Clemente XI."* — `https://www.turismoroma.it/it/luoghi/palazzo-del-commendatore`.
- Rione: **Borgo** (same building as #11).
- Note for the verifier: whether these ship as separate places or as detail inside #11 is an editorial call, not a sourcing one.
- Photos: []

**14. Chiesa di Santo Spirito in Sassia / Santuario della Divina Misericordia — church**
- Address: **Via dei Penitenzieri 12, 00193 Roma** — the sanctuary's own site, `https://www.divinamisericordia.it/contatti`. Tel. 06 6879310; general secretariat reachable 10:00–12:00 Mon–Fri.
- Hours, from the same site's `/orari` page: church open weekdays **07.00–12.00 and 14.50–19.30**; Sundays and feast days the same. Mass September–June Mon–Fri 7.30 / 11.00 / 18.30; Sat 7.30 / 11.00 (unless a wedding) / 18.30; Sun and feasts 9.00 (English) / 10.30 / 12.30 / 16.00 (Polish) / 18.30. July–August Mon–Sat 7.30 / 11.00 / 18.30; Sun 9.00 (English) / 10.30 / 16.00 (Polish) / 18.30. Daily: 15.00 Hour of Mercy and Chaplet; 17.30 Eucharistic adoration; 18.00 Rosary. **A place's own site establishes hours — this is squarely publishable.**
- What/when: present church begun **1538**, finished **1590**; consecrated **17 May 1571**; architects given as **Antonio da Sangallo il Giovane** (church), **Baccio Pontelli** (bell tower, c. 1471–1475), **Guidetto Guidetti** (façade). It is a *rettoria*, not a parish, and carries a cardinal-deacon's title. Predecessor church S. Maria in Saxia founded under Ine with Gregory II's assent, rebuilt by Leo IV c. 850 after the 846 Saracen raid. In 1369 the Byzantine emperor John V Palaiologos abjured the schism there before Urban V. — `https://it.wikipedia.org/wiki/Chiesa_di_Santo_Spirito_in_Sassia` (aggregator, but densely footnoted to Armellini, Hülsen, Krautheimer, Gigli).
- Rione: **Borgo — OSM PIP** at 41.901194, 12.461139.
- Photos: []

### 3.3 Churches and oratories

**15. Basilica di Santa Maria in Traspontina — parish church**
- Address, from the parish's own site: **Via della Conciliazione 14/C, 00193 Roma**; parish office at **Borgo Sant'Angelo 15, 00193 Roma**; parish priest p. Giuseppe Midili O.Carm.; tel. +39 06 68806451; email santamariaintraspontina@diocesidiroma.it — `https://www.parrocchiatraspontina.it/contatti/`. That page heads itself **"BASILICA DI SANTA MARIA IN TRASPONTINA"**, which is the church's own designation of itself.
- **No opening hours captured** — the site's hours page 404'd at `/orari-delle-celebrazioni/`; the link exists in the nav but I did not find the working URL. Someone should chase it before shipping hours.
- What/when: founded **16th century** to replace an older church that Pius IV had demolished in **1564** because it blocked the field of fire of Castel Sant'Angelo's guns; for the same reason the dome is very flat and **has no drum**. Built on Borgo Nuovo, so when via della Conciliazione was cut it stayed aligned to the vanished street rather than the new one, and steps had to be added because the new roadbed is lower. Carmelite; parish; cardinal title. it.wiki's infobox credits **Il Vignola** as architect while its body text credits "Alex Tica" of Bologna and it.wiki *Borgo* credits **G. S. Peruzzi** — **three different attributions inside one encyclopedia; do not publish an architect.** — `https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_in_Transpontina`, `https://it.wikipedia.org/wiki/Borgo_(rione_di_Roma)`.
- Rione: **Borgo — OSM PIP** at 41.902692, 12.462185.
- Photos: []

**16. Oratorio della Dottrina Cristiana — oratory**
- Location: corner of via della Conciliazione and vicolo del Campanile, to the right of Santa Maria in Traspontina.
- What/when: built **1714–1715** for cardinal **Giuseppe Sacripante**, architect **Nicola Michetti**, rococo; single long narrow nave, barrel vault, semicircular apse; inscription over the portal *"Non cesses fili audire doctrinam"*. — `https://it.wikipedia.org/wiki/Oratorio_della_Dottrina_Cristiana` (aggregator).
- Rione: **Borgo** — it.wiki lead and `Categoria:Roma R. XIV Borgo`. No coordinate published; I did not PIP it. **Weaker than the rest of this file on that point.**
- Photos: []

**17. Chiesa di San Lorenzo in Piscibus — church**
- What/when: **12th century** origin (tradition ascribes it to Santa Galla in the 6th); the name *in piscibus* from the quarter's old name *Piscina*, possibly a medieval fish market. When via della Conciliazione was cut it was radically transformed and **swallowed inside the 20th-century buildings** of the south side of the street and piazza Pio XII, its apse still visible from Borgo Santo Spirito. Inside the parish of Santa Maria in Traspontina; carries a cardinal-deacon's title; seat of the **Centro Internazionale Giovanile San Lorenzo**. — `https://it.wikipedia.org/wiki/Chiesa_di_San_Lorenzo_in_Piscibus` (aggregator; it cites a vatican.va page for the youth centre which I did not fetch).
- Rione: **Borgo — OSM PIP** at 41.90175, 12.459222.
- Photos: []

**18. Chiesa di Santa Maria Annunziata in Borgo (*l'Annunziatina*) — oratory**
- Location: **Lungotevere Vaticano**.
- What/when: built **1742–1745** in Borgo Santo Spirito by **Pietro Passalacqua** as the oratory of the Archconfraternity of the Santo Spirito hospital; **dismantled in 1940** for via della Conciliazione and **re-erected ten years later** on its present site by the Tiber. Holds works rescued from the demolished church of San Michele Arcangelo ai Corridori, including a *Madonna del latte* attributed to Antoniazzo Romano. — `https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Annunziata_in_Borgo` (aggregator).
- Rione: **Borgo — OSM PIP** at 41.901972, 12.463639.
- Photos: []

**19. Chiesa dei Santi Michele e Magno — church — LATERAN TREATY EXTRATERRITORIAL (tier 2)**
- Location: **largo degli Alicorni**, at the top of a steep flight of steps facing the southern colonnade of St Peter's Square.
- Status: **extraterritorial property of the Holy See.** Named in the Holy See's own enumeration, item 13 (*gli immobili sul Gianicolo*), which lists *"Chiesa dei Ss. Michele e Magno"* — `https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html` (I fetched this page directly; it is dated 03.04.2001). Per the vatican_ruling this is a **third tier** — Italian soil with the immunities of a diplomatic headquarters, not foreign territory. It publishes under Borgo with the status stated. The same vatican.va page states the properties *"godono del privilegio della extraterritorialità e sono esenti da espropriazione e da tributi"*.
- What/when: **first half of the 12th century**, consecrated **30 January 1141**, reconsecrated **6 May 1759** after an 18th-century rebuild by **Carlo Murena**; Romanesque bell tower, Baroque church. Known medievally as *San Michele de Porticu*, from the 15th century as *San Michele in Borgo*. National church of the **Frisians**; today serves Rome's Dutch Catholic community and the Archconfraternity of the Blessed Sacrament in St Peter's. — `https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Michele_e_Magno` (aggregator, but it cites vatican.va for the status).
- it.wiki *Borgo* adds a claim I am flagging as **unsourced and un-publishable**: that the staircase up to the church *"possiede gli stessi privilegi della Scala Santa"*. Its footnote points to a dead personal homepage. Drop it.
- Rione: **Borgo — OSM PIP** at 41.901447, 12.458891.
- Photos: []

**20. Chiesa di San Pietro in Borgo — oratory — EXTRATERRITORIAL (inside the Sant'Uffizio complex)**
- Location: **piazza del Sant'Uffizio**, by Porta Cavalleggeri.
- Status: it.wiki states it *"sorge … in un'area italiana però soggetta ad extraterritorialità a favore della Santa Sede"* — consistent with vatican.va item 7, *"il Palazzo del Sant'Offizio ed adiacenze"*, which I fetched.
- What/when: medieval, **11th century**; also recorded as *San Salvatore de ossibus* / *in terrione*; listed among the Vatican basilica's dependencies in papal bulls of 1053, 1158 and 1186; the *Schola Francorum* hospice adjoined it; restored under Nicholas V (1447–1455), then abandoned and partly destroyed for the building of the Palazzo del Sant'Uffizio; **restored as an oratory in 1923**. Holds 15th-century frescoes and a 16th-century *Madonna col Bambino*; cardinal Alfredo Ottaviani is buried there. — `https://it.wikipedia.org/wiki/Chiesa_di_San_Pietro_in_Borgo` (aggregator).
- Rione: **Borgo — OSM PIP** at 41.900672, 12.456273.
- Photos: []

**21. Cappella di Santa Monica — chapel of the Collegio Internazionale Agostiniano**
- Location: **piazza del Sant'Uffizio**, facing San Pietro in Borgo.
- What/when: built **1941** by **Giuseppe Momo**; the chapel of the Augustinians' international college beside their curia generalizia. Since 30 September 2023 a cardinal-deaconry; its first titular was **Robert Francis Prevost**, later Pope Leo XIV, who had been ordained priest in this chapel on **19 June 1982**. — `https://it.wikipedia.org/wiki/Cappella_di_Santa_Monica_(Roma)` (aggregator; **no footnote at all on the Prevost sentence** — this is a high-interest claim on zero citation. Flag hard: a travel guide will want it and it must be sourced elsewhere before it ships).
- Status note: vatican.va item 13 includes *"Collegio Internazionale S. Monica"* among the extraterritorial *immobili sul Gianicolo*. Whether the chapel is inside that grant is **not stated by the source** — do not assert it.
- Rione: **Borgo — OSM PIP** at 41.900576, 12.456703.
- Photos: []

**22. Chiesa di Santa Maria della Pietà in Camposanto dei Teutonici, and the Campo Santo Teutonico — church and cemetery — SOVEREIGNTY UNRESOLVED**
- Location: **piazza dei Protomartiri Romani**, immediately south of St Peter's Basilica.
- **This is the hardest case in the rione and I am not resolving it.** Four sources, three answers:
  - it.wiki: *"Sorge in territorio italiano soggetto ad extraterritorialità a favore della Santa Sede"* — but its only footnote for that is `globalgeografia.com`, a hobby site. `https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_della_Piet%C3%A0_in_Camposanto_dei_Teutonici`
  - en.wiki body: *"The cemetery lies entirely outside the borders of Vatican City. It is an extraterritorial property of the Holy See."* en.wiki **short description on the same page**: *"Burial site in Vatican City"*; its Wikidata coordinate is tagged `region:VA`. `https://en.wikipedia.org/wiki/Teutonic_Cemetery`
  - **The Holy See's own 2001 enumeration does not list it at all** — I read all 13 Rome items at vatican.va and Campo Santo Teutonico is absent.
  - OSM: PIP at 41.901327, 12.45475 → **inside Rione XIV Borgo**, and additionally inside an OSM area named *Zona extraterritoriale della Santa Sede*.
- Given ruling 2, the safe reading is that **nothing here is settled** and the corpus should not publish a sovereignty statement for this site in wave 1. **Arbitrator.**
- Content, if it ships: church founded with college and cemetery in the 8th century on the site of an earlier hospice; rebuilt around the 1450 Holy Year; present hall-church late 15th century, German in type; the German confraternity became the *Arciconfraternita di Nostra Signora nel Campo santo tedesco presso San Pietro* in **1597**; a college for students of Christian archaeology added **1876**; restored after storm damage in **1910**; bronze door given by German president **Theodor Heuss** in **1957**. — it.wiki as above.
- Photos: []

**23. Cappella di San Francesco Borgia dei Gesuiti — chapel inside the Jesuit Curia Generalizia**
- Location: **Borgo Santo Spirito 4** (the Jesuit general curia). it.wiki lists it under *Architetture religiose* of Borgo with the note *"all'interno della casa generalizia dei gesuiti"* — `https://it.wikipedia.org/wiki/Borgo_(rione_di_Roma)`.
- Status note: vatican.va item 13 ends with *"immobili su Borgo Santo Spirito contigui alla Curia dei Gesuiti"* — i.e. **buildings adjacent to** the Jesuit curia are extraterritorial. Whether the curia itself and this chapel are inside the grant **is not stated**. Do not assert either way.
- Rione: **Borgo — OSM PIP** at 41.90145, 12.46030 (*approx*, from the street address).
- Photos: []

### 3.4 Palaces on and around via della Conciliazione

**24. Palazzo dei Penitenzieri (Palazzo della Rovere) — palace**
- Address: **via della Conciliazione**; it.wiki gives no number. Owner: **Ordine Equestre del Santo Sepolcro di Gerusalemme**, which has its Grand Magisterium there. The order's own site `https://www.oessh.va/` responded HTTP 200 but rendered as a near-empty shell to a non-JS fetch — **no fact taken from it.**
- What/when: begun **c. 1480** for cardinal **Domenico Della Rovere**, possibly by **Baccio Pontelli**; renamed under Alexander VII when he moved the *penitenzieri* confessors in; façade modelled on Palazzo Venezia with a corner tower; two-level central courtyard, the upper kept as a walled garden; the **Soffitto dei Semidei** by Pinturicchio; a 16th-century frescoed gallery at *piano nobile*, the right wing visitable **on request to the Order**. A hotel occupied part of the palace until **2018**. — `https://it.wikipedia.org/wiki/Palazzo_dei_Penitenzieri` (aggregator; the hotel closure is footnoted to Il Messaggero, which I did not fetch).
- Rione: **Borgo — OSM PIP** at 41.901944, 12.461111.
- Photos: []

**25. Teatro di Nerone — archaeological site, in the courtyard of #24**
- What/when: Nero's private theatre, known only from literary sources until its remains were **excavated 2020–2023** and announced in **2023**. Excavation run for the **Ordine Equestre del Santo Sepolcro di Gerusalemme**; scientific authority **Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma (SSABAP)**, named officials Daniela Porro, Alessio De Cristofaro, Renato Sebastiani; archaeologists Marzia Di Mento, Laura Stamerra, Filippo Salamone, Cecilia de Leone, Flavia Botrugno. Sited in the *Ager Vaticanus*, in the *horti* of Agrippina the Elder, the same area as Caligula's circus. — `https://it.wikipedia.org/wiki/Teatro_di_Nerone` (aggregator; its source is a Corriere della Sera piece of 26 July 2023 which I did not fetch. **The Soprintendenza's own announcement should be found before this ships** — this is the single most newsworthy thing in Borgo since 2020 and it deserves a primary source).
- Rione: **Borgo** (same courtyard as #24).
- Visitability: **not established.** Do not imply it can be visited.
- Photos: []

**26. Palazzo Castellesi / Giraud / Torlonia — palace**
- Address: **via della Conciliazione 30** — it.wiki infobox.
- What/when: built **1499–1517** for cardinal **Adriano Castellesi** of Corneto (Tarquinia); design generally attributed to **Bramante** (the article hedges with "viene generalmente attribuito"); façade a rereading of Alberti's Palazzo Rucellai by way of the Palazzo della Cancelleria; twin pilaster orders over smooth travertine ashlar; central courtyard porticoed on all four sides on rectangular piers. Successively the English embassy, an ecclesiastical college, a hospice, then Palazzo Giraud, then Torlonia. Present owner given as the Torlonia del Fucino family; use, private residence. Originally faced piazza Scossacavalli; the *spina* demolition left its façade on the edge of via della Conciliazione. — `https://it.wikipedia.org/wiki/Palazzo_Castellesi` (aggregator).
- Rione: **Borgo — OSM PIP** at 41.902611, 12.460611 (*approx*).
- Photos: []

**27. Palazzo dei Convertendi — palace — EXTRATERRITORIAL (tier 2)**
- Address: **via della Conciliazione 32** — it.wiki infobox, which also gives 41.902694, 12.460611.
- Status: named in the Holy See's own list as item 8, *"il Palazzo dei Convertendi, sede della Congregazione per le Chiese Orientali"* — vatican.va, fetched. Also called Palazzo della Congregazione per le Chiese orientali.
- What/when: 16th-century in origin; **demolished** for via della Conciliazione and **rebuilt in 1940** on the north side of the street. Bounded east by via dell'Erba (which separates it from Palazzo Torlonia) and west by Palazzo Rusticucci-Accoramboni. — `https://it.wikipedia.org/wiki/Palazzo_dei_Convertendi`.
- Rione: **Borgo — OSM PIP** at 41.902694, 12.460611.
- Photos: []

**28. Palazzo Caprini ("Casa di Raffaello") — vanished palace, absorbed into #27**
- What/when: a house called *"della Stufa"* on the north-west edge of piazza Scossacavalli, sold in 1500 to the apostolic protonotary Adriano (or Alessandro) Caprini; rebuilt by **Bramante**; **bought by Raphael in 1517**, who spent his last three years there; later absorbed into Palazzo dei Convertendi. it.wiki *Borgo* adds that the 1937 demolition of the Convertendi exposed vaulted structures belonging to Palazzo Caprini. — `https://it.wikipedia.org/wiki/Palazzo_dei_Convertendi`, `https://it.wikipedia.org/wiki/Borgo_(rione_di_Roma)`.
- Rione: **Borgo — OSM PIP** at 41.902611, 12.460611.
- Note: it.wiki *Via della Conciliazione* garbles this, writing that "the palazzo dei Convertendi (of Bramante and Peruzzi)" was demolished, linking to Palazzo Caprini. **Aggregator inconsistency; do not repeat.**
- Photos: []

**29. Palazzo Rusticucci-Accoramboni — palace, demolished and rebuilt**
- What/when: late Renaissance, built for cardinal **Girolamo Rusticucci**, secretary to Pius V; architects **Domenico Fontana** and **Carlo Maderno**; **demolished and rebuilt in 1940** on the north side of via della Conciliazione by Clemente Busiri Vici. Before that it faced piazza Rusticucci, the vestibule of St Peter's Square, itself destroyed in the 1930s. West of it, via Rusticucci separates it from the northern propylaeum. — `https://it.wikipedia.org/wiki/Palazzo_Rusticucci-Accoramboni` (aggregator).
- Rione: **Borgo — OSM PIP** at 41.902694, 12.46.
- Photos: []

**30. Palazzo Cesi-Armellini — palace**
- What/when: first built **c. 1520** for cardinal **Francesco Armellini**, Leo X's counsellor and Clement VII's treasurer; bought by the **Cesi** family in 1565; cardinal Pier Donato Cesi had **Martino Longhi il Vecchio** rebuild it **1570–1575** (infobox says 1570–88) into its present form. it.wiki records that Charles V's *Lanzichenecchi* entered Rome through this building in the **1527** sack. **Mutilated** for via della Conciliazione: windows cut from 13 to 8, monumental staircase destroyed. Light brick façade in three bands, paired pilasters, an antique lion protome at the right corner, Doric-pilastered portal, large rectangular courtyard. Owner: Curia Generalizia of the Society of the Divine Saviour. — `https://it.wikipedia.org/wiki/Palazzo_Cesi-Armellini` (aggregator).
- Rione: **Borgo — OSM PIP** at 41.901872, 12.460486.
- Photos: []

**31. Palazzo Serristori — palace**
- Location: between via della Conciliazione and Borgo Santo Spirito, main façade east on **via dei Cavalieri del Santo Sepolcro**.
- What/when: built **1565** by **Averardo Serristori**, ambassador of Cosimo I de' Medici to Pius IV, on the site of a small palace once owned by Cesare Borgia and then by cardinal Bartolomeo Della Rovere. Became the Tuscan embassy to the pope before that moved to Palazzo Firenze in Campo Marzio. **One of the few Renaissance buildings in Borgo to survive the demolition of the rione's centre.** A Renaissance plaque on the palace commemorates Serristori. — `https://it.wikipedia.org/wiki/Palazzo_Serristori_(Roma)` (aggregator).
- Rione: **Borgo — OSM PIP** at 41.901872, 12.460417.
- Photos: []

**32. Palazzo Alicorni — palace, demolished and rebuilt**
- Address: **Borgo Santo Spirito 78** — it.wiki infobox, with 41.901694, 12.461806.
- What/when: 16th century, built for **Trajano Alicorni**, of an Albanian family that had fled the Ottoman advance under Pius II. Originally stood metres from Bernini's colonnade; **restored 1928**, then **demolished in 1931 in the course of defining the boundaries of the new Vatican City State**, and **rebuilt in 1938** several hundred metres east. Faces the Palazzo del Commendatore; via Scossacavalli separates it from Palazzo dei Penitenzieri to the west; via dell'Ospedale bounds it east, its name recalling the destroyed Ospedale di San Carlo. — `https://it.wikipedia.org/wiki/Palazzo_Alicorni`.
- **Note the 1931 demolition reason.** It is a genuinely interesting fact about how the border was made physical, and it is exactly the kind of fact that tempts a writer into stating where the border runs. It does not license that.
- Rione: **Borgo — OSM PIP** at 41.901694, 12.461806.
- Photos: []

**33. Palazzo San Pio X (Palazzo Pio) — palace — EXTRATERRITORIAL, WITH A CARVE-OUT**
- Address: **via della Conciliazione 4** — it.wiki infobox.
- Status, from the Holy See's own list (item 11), which I fetched verbatim: *"il Palazzo Pio, dichiarato extraterritoriale nel 1979 **(con esclusione tuttavia dei locali che ospitano attualmente l'Auditorium)** in sostituzione del Palazzo della Dataria, non più di proprietà della Santa Sede."* — `https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html`. **The Auditorium's rooms are explicitly carved out of the extraterritoriality.** This is a hard, primary-sourced, testable fact and it is the sharpest edge in the rione.
- What/when: built **1948–1950** by **Marcello Piacentini and Giorgio Calza Bini**; modernist; occupies a whole block bounded west by via della Traspontina, north by Borgo Sant'Angelo and the Passetto, east by piazza Pio XII. Houses Curia offices, the Dicastero per la comunicazione, and the embassies to the Holy See of **Canada** and **Taiwan**. Frequently miscalled "Palazzo Pio XII". — `https://it.wikipedia.org/wiki/Palazzo_San_Pio_X` (aggregator, but it cites vatican.va, which I verified independently).
- **Internal contradiction to flag:** that same it.wiki article says the palace is bounded *east* by piazza Pio XII and that Castel Sant'Angelo's park is "sul lato opposto della strada, a ovest". Both cannot be right. Do not publish orientation from it.
- Rione: **Borgo — OSM PIP** at 41.90248, 12.46280 (*approx*).
- Photos: []

**34. Auditorium Conciliazione — concert hall and congress venue**
- Address, from its own site: **Borgo S. Angelo 5, 00193 Roma**; tel. 06 684391; email info@auditoriumconciliazione.it — `https://auditoriumconciliazione.it/contatti/`. The same page states the box office is at **Via della Conciliazione 4** (a TicketOne outlet) and that it is **momentarily closed until further notice**, tickets available online or at other authorised outlets, with a same-evening box office opening one hour before the show.
- Roma Capitale's record gives `POINT (12.4633802 41.90254)` and, for hours, only *"Verificare l'orario della biglietteria sul sito"* — `https://www.turismoroma.it/it/luoghi/auditorium-conciliazione`.
- Note the SSL warning: `https://www.auditoriumconciliazione.it/` (with `www.`) fails certificate verification — hostname mismatch. The apex domain works. Use the apex.
- What it is, in its own words: a hall for dance, music, visual arts and congresses, with a foyer, the *Chorus Cafè*, and the **Visionarea Art Space** gallery. — same site, homepage.
- Its physical relationship to #33: it.wiki says Palazzo San Pio X *"funge da accesso all'Auditorium Conciliazione"*. Combined with the vatican.va carve-out, the fact worth telling is that **the auditorium sits inside a Holy See extraterritorial palace but is itself explicitly excluded from that status.** That is publishable and is sourced to the Holy See's own text.
- Rione: **Borgo — OSM PIP** at 41.90252, 12.46260.
- Photos: []

**35. Palazzo dell'Azione Cattolica — palace**
- Address: **via della Conciliazione 1** — it.wiki infobox.
- What/when: **1948–1950**, **Marcello Piacentini and Giorgio Calza Bini**, modernist; faces Palazzo San Pio X across the head of the street; seat of **Azione Cattolica since 1948**; also houses diplomatic missions to the Holy See. Shares a block with Santa Maria Annunziata in Borgo and abuts via San Pio X, Lungotevere Vaticano and piazza Pia. — `https://it.wikipedia.org/wiki/Palazzo_dell%27Azione_Cattolica` (aggregator).
- **STATUS CONFLICT, flagged.** it.wiki files this page under `Categoria:Zone extraterritoriali della Santa Sede in Roma`. **The Holy See's own 2001 enumeration does not name it.** Under the vatican_ruling's logic — the Holy See's list is the authority — the corpus should **not** call this building extraterritorial. Verifier: catch this if a writer copies the Wikipedia category.
- Rione: **Borgo — OSM PIP** at 41.90248, 12.46280 (*approx*, same block).
- Photos: []

**36. Palazzo delle Congregazioni ai Propilei — twin palaces — EXTRATERRITORIAL (tier 2)**
- Address: **Piazza Pio XII 3–10, 00193 Roma** — it.wiki infobox, coordinate 41.90281, 12.45897.
- Status: vatican.va item 10, *"il Palazzo delle Congregazioni ai Propilei"* — fetched.
- What/when: built at the end of the **1930s** alongside the design of via della Conciliazione; modernist; two buildings flanking the street's end, named for their proximity to the colonnade's propylaea. **Edificio Nord (no. 10)**: Dicasteri delle cause dei santi; culto divino; testi legislativi; vescovi. **Edificio Sud (no. 3)**: clero; istituti di vita consacrata; cultura. Also houses the **Sala stampa della Santa Sede**, entrance at **via della Conciliazione 54**. — `https://it.wikipedia.org/wiki/Palazzo_delle_Congregazioni_ai_Propilei` (aggregator).
- **Flag:** that article's infobox carries **both** `paese = Italia` **and** `paese2 = VAT`. Whatever the editor meant, do not read it as a sovereignty claim — the Holy See's own list treats the building as an extraterritorial property on Italian soil, which is tier 2, not the border.
- Rione: **Borgo — OSM PIP** at 41.90281, 12.45897.
- Photos: []

**37. Palazzo del Sant'Uffizio — palace — EXTRATERRITORIAL (tier 2)**
- Address: **Piazza del Sant'Uffizio 11** — it.wiki infobox.
- Status: vatican.va item 7, *"il Palazzo del Sant'Offizio ed adiacenze, sede della Congregazione della Dottrina della Fede"* — fetched. it.wiki's lead states the building *"si trova al di fuori dei confini della Città del Vaticano, presso il suo angolo sudorientale"* and is an extraterritorial zone under the 1929 Lateran Pacts.
- What/when: first built **1514** for cardinal **Lorenzo Pucci** (as Palazzo Pucci); façade rebuilt **1524–1525** by **Giuliano Leni**, **Pietro Roselli** and **Michelangelo**; work continued by **Antonio da Sangallo il Giovane** from 1532; **bought by Pius V in 1566 or 1567 for 9.000 scudi** and turned into the seat of the Inquisition; restorations by **Pirro Ligorio** and **Giovanni Sallustio Peruzzi**; Sixtus V built prisons there in 1586. Today the seat of the **Dicastero per la dottrina della fede** and other Curia offices. — `https://it.wikipedia.org/wiki/Palazzo_del_Sant%27Uffizio` (aggregator; the 1514/1531 detail is footnoted to a Gangemi catalogue).
- **Date error in the source, flagged:** it.wiki writes *"Tra il 1811 e il 1814 papa Leone XII restaurò l'edificio"*. Leo XII reigned 1823–1829. Do not repeat.
- Rione: **Borgo — OSM PIP** at 41.900830, 12.456160 (*approx*, from the address).
- Photos: []

**38. Pontificio Istituto Patristico Augustinianum — pontifical institute, library and congress centre**
- Address, from its own site: **Via Paolo VI 25, 00193 Roma**; tel. +39 06 68006238 / +39-06-680061; email segreteria@patristicum.org — `https://www.patristicum.org/`.
- What it is, in its own words: a pontifical institute for the study of the Fathers of the Church, with a **Biblioteca Augustinianum**, and a **Centro congressi** comprising the Auditorium "p. Agostino Trapè", an Aula "Minor" and other rooms. Its own site posts an academic calendar (library reopening 14/9/2026 at the time of fetch).
- Rione: **Borgo — OSM PIP** at 41.90055, 12.45705 (*approx*, from the address).
- Note: **not** a Holy See extraterritorial property under any item of the vatican.va list I read. Do not label it one.
- Photos: []

**39. Libera Università Maria Santissima Assunta (LUMSA) — university**
- Its own site `https://www.lumsa.it/` responded HTTP 200; I read the homepage but **did not capture an address from it**, so the commonly cited Borgo Sant'Angelo address is **not sourced here**. Anyone shipping this must fetch LUMSA's own contacts page.
- Rione: **Borgo — OSM PIP** at 41.90325, 12.46135 (*approx*, Borgo Sant'Angelo). **Weak: the coordinate is my own placement from an unsourced address.** Treat the rione assignment as provisional.
- Photos: []

**40. Palazzo Latmiral — palace, incorporating #41**
- it.wiki has a page (`Palazzo Latmiral`, wikidata Q59393700) but **no published coordinate**. Its owner Gaetano Latmiral ordered the 1936 restoration of the Casa del boia, which is incorporated into it. — `https://it.wikipedia.org/wiki/Casa_del_boia_(Roma)`.
- Rione: **Borgo** by it.wiki category `Roma R. XIV Borgo`. **Not PIP-verified.**
- Photos: []

**41. Casa del boia / Casa di Mastro Titta — house**
- Address: **Vicolo del Campanile 4** — it.wiki infobox.
- What/when: a **15th-century** house, four storeys, with deteriorated **grisaille** decoration on the front; restored **1936** for Gaetano Latmiral and incorporated into Palazzo Latmiral. Vasari attributed a sgraffito façade "in the middle of the Borgo" of around 1520 to **Giulio Romano**; it.wiki repeats that attribution for this house. Described programme: Dacian prisoner-kings, a Medici arms with lions, mythological female figures, Argus, winged lions and fruit vases, lion heads at the top. — `https://it.wikipedia.org/wiki/Casa_del_boia_(Roma)` (aggregator; sourced to `specchioromano.it`, a personal site).
- Context, from it.wiki *Borgo*: the executioner's trade was typical of Borgo because the executioner was barred from the left bank — the Roman proverb *"Boia nun passa Ponte"*. The best-known was **Giovanni Battista Bugatti, "Mastro Titta"**, who began in **1796**, took his last head in **1864**, executed 516 people in total, and lived in Borgo Nuovo. **That footnote points to a tripod.com page — unusable. The house's association with him needs a real source before it ships**, and the 516 figure certainly does.
- Rione: **Borgo — OSM PIP** at 41.90310, 12.46020 (*approx*, vicolo del Campanile).
- Photos: []

### 3.5 Gates, walls and infrastructure

**42. Porta Santo Spirito, and the Sangallo bastion — gate**
- Location: **Via di Porta Santo Spirito**, behind the hospital, near piazza della Rovere. Roma Capitale gives `POINT (12.461623867996 41.900493725477)` — `https://www.turismoroma.it/it/luoghi/porta-santo-spirito`.
- What/when, from that Roma Capitale page: it stands on what was the southern limit of the **Civitas Leonina** walled by Leo IV around **850**; rebuilt in the mid-16th century by **Antonio da Sangallo il Giovane** for Paul III after the 1527 Sack; framed by bastions **added in 1564 by Pius IV**; a large central archway flanked by pairs of Doric columns and niches. In **1642** under Urban VIII the building of the **Mura Gianicolensi** put it inside the new circuit and it lost its function; **it was left unfinished and remains so**.
- it.wiki adds the earlier name *posterula Saxonum* and the renaming under Innocent III — `https://it.wikipedia.org/wiki/Porta_Santo_Spirito` (aggregator). Note it.wiki *Porta Santo Spirito* attributes the bastion to Sangallo while it.wiki *Borgo* says Paul III "fece erigere tre nuovi Bastioni e la Porta Santo Spirito (opera di Antonio da Sangallo il Giovane), mai completata" — consistent.
- Rione: **Borgo — OSM PIP** at 41.900306, 12.461611 and at Roma Capitale's own point.
- Photos: []

**43. Porta Castello — vanished gate, and the surviving fornici in the Passetto**
- What/when: a gate in the stretch of wall added to the *Civitas Leonina* by **Pius IV around 1563**, at what is now the junction of via di Porta Castello, via delle Fosse di Castello and via G. Vitelleschi. **Closed in 1798**; the wall from piazza Risorgimento to Castel Sant'Angelo and both its gates were demolished in the late-19th-century works. What is called "porta Castello" today, at the corner of via di Porta Castello and Borgo Sant'Angelo, is **not the gate**: it is a pair of arches cut through the wall of the Passetto, one by Pius IV and one by the Comune di Roma, for traffic. Probably twin to Porta Angelica, with the same Pius IV arms and inscriptions (Piale, writing in 1828, recorded *"PIUS IIII. PONT. MAX. PORTAM NOVAM ET MOENIA A FUNDAMENTIS EREXIT"* on both). Cola di Rienzo entered Rome in triumph through it on **1 August 1354**. — `https://it.wikipedia.org/wiki/Porta_Castello` (aggregator).
- **This is a good example of a fact a guide will get wrong.** The thing tourists photograph and call Porta Castello is not Porta Castello.
- Rione: **Borgo — OSM PIP** at 41.904139, 12.463194.
- Photos: []

**44. Ponte Vittorio Emanuele II — bridge — STRADDLER**
- What/when: designed **1886** by **Ennio De Rossi**; works interrupted and resumed 1908; first inaugurated **5 May 1911** for the 50th anniversary of Italian unification, again **28 April 1912** when the travertine groups were finally placed. **Three arches, 110 m**, 20 m wide, travertine. Winged Victories in bronze by **Elmo Palazzi, Luigi Casadio, Amleto Cataldi and Francesco Pifferetti**. Officially renamed *ponte Vittorio Emanuele Secondo* by Giunta Capitolina deliberation n. 246 of 22 July 2015. — `https://it.wikipedia.org/wiki/Ponte_Vittorio_Emanuele_II` (aggregator; it cites Roma Capitale's SISTO street register and the Sovrintendenza Capitolina).
- Roma Capitale's turismoroma record for it gives `POINT (12.464385 41.900279)` and points to `http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale` — `https://www.turismoroma.it/it/luoghi/ponte-vittorio-emanuele-ii`.
- **Rione: STRADDLER, Ponte ↔ Borgo.** it.wiki lead: *"collega piazza Pasquale Paoli, nel rione Ponte, al lungotevere Vaticano (Borgo)."* OSM PIP: west end 41.90130, 12.46340 → **Borgo**; east end 41.90105, 12.46560 → **Ponte**. **Arbitrator.**
- Photos: []

**45. Ponte Principe Amedeo Savoia Aosta (ponte PASA) — bridge — STRADDLER, THREE-WAY**
- What/when: **1939–1942**, 109,70 m long, 20 m wide, three masonry arches faced in white marble with two round-arched openings between them and two ship-shaped piers; construction entrusted to Rodolfo Stoelcker, project by the Comune di Roma; originally called the *Nuovo ponte dei Fiorentini*. Named for Amedeo di Savoia-Aosta. — `https://it.wikipedia.org/wiki/Ponte_Principe_Amedeo_Savoia_Aosta` (aggregator; flagged `{{F}}` and `{{S}}` on Wikipedia itself, i.e. Wikipedia says it is under-sourced and a stub. **Treat accordingly.**)
- **Rione: STRADDLER and internally contradictory.** The same article's lead says *"nei rioni Ponte, Trastevere e Borgo"* and then two paragraphs later says *"Collega il rione Borgo con il rione Ponte."* Three or two. OSM PIP: west end 41.89985, 12.46225 → **Borgo**; east end 41.89968, 12.46470 → **Ponte**; my sample points did not fall in Trastevere. **Arbitrator, and note the source disagrees with itself.**
- Photos: []

**46. Galleria Principe Amedeo di Savoia-Aosta (galleria PASA) — road tunnel — STRADDLER, BORGO ↔ AURELIO**
- What/when: an urban tunnel under the Gianicolo between **Porta Cavalleggeri and Porta Santo Spirito**, designed by **Cesare Bazzani** from 1930, works begun **1938**, opened **1940**; single bore, **0,250 km**, 16 m diameter; originally called the *galleria Gianicolense*. Motorcycles under 125 cc excluded. — `https://it.wikipedia.org/wiki/Galleria_Pasa` (aggregator; the article is tagged as a stub).
- **Rione: STRADDLER.** OSM PIP: east portal 41.90040, 12.46060 → **Borgo**; west portal 41.90000, 12.45560 → **Quartiere XIII Aurelio**. So the tunnel runs out of the rione entirely at its western end. **Arbitrator.**
- Photos: []

**47. Lungotevere Castello — embankment street — STRADDLER, BORGO ↔ PRATI**
- What/when: runs from piazza di Ponte Sant'Angelo to piazza dei Tribunali; named for the castle; **now a pedestrian area**. — `https://it.wikipedia.org/wiki/Lungotevere_Castello` (aggregator, citing Rendina-Paradisi).
- **Rione: STRADDLER, stated by the source itself.** it.wiki lead: *"nei rioni Borgo e Prati"*; the infobox `quartiere` field reads *"Borgo - Prati"*. **Arbitrator.**
- OSM PIP caution worth recording: two points I placed along the roadway (41.90480, 12.46680 and 41.90210, 12.46630) both returned **Borgo**, but it.wiki's own published centroid for the street (41.902503, 12.46823) returns **Prati** — it sits out over the river. **A pipeline that trusts Wikipedia centroids will mis-assign riverside streets in this rione.**
- Photos: []

**48. Lungotevere in Sassia — embankment street**
- Rione: **Borgo — OSM PIP** at 41.900711, 12.462987 and at 41.89990, 12.46270. it.wiki category `Roma R. XIV Borgo`.
- Carries the underpass extended in the 2023–24 Piazza Pia works (see #7, low confidence).
- Photos: []

**49. Lungotevere Vaticano — embankment street**
- Rione: **Borgo — OSM PIP** at 41.901913, 12.464262 and 41.90300, 12.46680. it.wiki category `Roma R. XIV Borgo`; it.wiki *Ponte Vittorio Emanuele II* names it as the bridge's Borgo-side landing.
- Photos: []

**50. Fontana delle Palle di Cannone — fountain, by Pietro Lombardi**
- Listed under *Altro* in it.wiki *Borgo*, credited to **Pietro Lombardi**. **No dedicated article, no coordinate, no date, no primary source.** Rione: **Borgo — OSM PIP** at 41.90200, 12.46390 (*approx*, my own placement near via di Porta Castello) — **provisional, and the placement is mine, not a source's.**
- One of Lombardi's *fontane rionali*; the corpus should find Sovrintendenza Capitolina's record before shipping this.
- Photos: []

### 3.6 The streets of the Borghi

All of the following are in `Categoria:Roma R. XIV Borgo` and all sample points fall inside OSM
relation 5454294. Coordinates marked *approx* are mine.

**51. Borgo Pio — street.** Runs from via di Porta Castello to via di Porta Angelica. Established by the bull of **Pius IV**, *"Erectionis civitatis Piae prope arcem Sancti Angeli"*, dated **5 December 1565**; construction continued under Gregory XIII, attested by an epigraph near Sant'Anna dei Palafrenieri dated *anno VIII MDLXXX*. Also called *borgo Sant'Anna*. — `https://it.wikipedia.org/wiki/Borgo_Pio` (aggregator, citing Rendina-Paradisi p. 1018–1019). Rione: **Borgo — OSM PIP** at 41.903783, 12.460527. Photos: []

**52. Borgo Santo Spirito — street.** Medieval; earlier names *Burgus Saxonum*, *Burgus Frisonum*, Borgo San Michele, Borgo San Martino. Runs from via San Pio X to largo degli Alicorni; *sampietrini*. Until 1870 the stretch of today's via dei Penitenzieri between nos. 12 and 32 was part of it. it.wiki calls it *"la più interessante strada del rione"* from a historical point of view, citing Delli p. 196 — **that is an aggregator's editorial judgement, publish only as attributed opinion or not at all.** — `https://it.wikipedia.org/wiki/Borgo_Santo_Spirito`. Rione: **Borgo — OSM PIP** at 41.90155, 12.461806. Photos: []

**53. Borgo Sant'Angelo — street.** Opened by **Sixtus IV** parallel to the Passetto and originally called *via Sistina* in his honour. — it.wiki *Borgo (rione di Roma)*. Rione: **Borgo — OSM PIP** at 41.90325, 12.46135 (*approx*). Photos: []

**54. Borgo Vittorio — street.** One of the three laid out from **1565** by **Pius IV**; named for the victory of **Lepanto**. — it.wiki *Borgo (rione di Roma)*. Rione: **Borgo — OSM PIP** at 41.90435, 12.46035 (*approx*). Photos: []

**55. Borgo Angelico — street.** One of the three of 1565; named for **Angelo**, Pius IV's baptismal name. — it.wiki *Borgo (rione di Roma)*. Rione: **Borgo — OSM PIP** at 41.90490, 12.46000 (*approx*). Photos: []

**56. Via dei Corridori — street.** Runs along the Passetto; formerly *Borgo dell'Elefante*, named for **Annone**, Leo X's elephant. The relocated façades of the **Casa di Febo Brigotti** and **Palazzo Jacopo da Brescia** were remounted here when the *spina* came down. — it.wiki *Borgo (rione di Roma)*. Rione: **Borgo — OSM PIP** at 41.90335, 12.46095 (*approx*). Photos: []

**57. Vicolo del Campanile — alley.** Named for Santa Maria in Traspontina's bell tower. it.wiki records that a rare Renaissance *casa graffita* survives on its left side and that Ettore Roesler Franz painted the alley around 1880. Contains #41. — it.wiki *Borgo (rione di Roma)*. Rione: **Borgo — OSM PIP** at 41.90310, 12.46020 (*approx*). Photos: []

**58. Via degli Ombrellari — alley.** it.wiki: the umbrella-makers' workshops were concentrated here because of the smell of the varnished cloth. — it.wiki *Borgo (rione di Roma)* (**no footnote on that sentence**). Rione: **Borgo — OSM PIP** at 41.90405, 12.46080 (*approx*). Photos: []

**59. Vicolo del Farinone — alley.** it.wiki: the last bell foundry in Borgo stood here and closed around **1995** after some 450 years of activity — footnoted to an archived `lignarius.net` page. **A "how long it has traded" claim from a dead hobby site: not publishable as it stands.** Rione: **Borgo — OSM PIP** at 41.90390, 12.46150 (*approx*). Photos: []

**60. Piazza della Città Leonina — square.** Rione: **Borgo — OSM PIP** at 41.90475, 12.45905 (*approx*). Listed in it.wiki *Borgo*'s *Piazze*. No further sourced content found. Photos: []

**61. Via del Mascherino — street.** it.wiki *Borgo* records that extensive demolitions in the 1930s hit the north-west of the rione, *"via di Porta Angelica e via del Mascherino"*, and that these were *"ufficialmente intraprese per definire meglio il confine fra l'Italia e il nuovo Stato della Città del Vaticano."* Rione: **Borgo — OSM PIP** at 41.90420, 12.45930 (*approx*). Photos: []

**62. Via di Porta Angelica — street.** Same 1930s demolitions. **Rione: check carefully.** OSM PIP at 41.90520, 12.45830 (*approx*, southern stretch) → **Borgo**; at 41.90570, 12.45880 (*approx*, northern stretch) → **Prati**. The street runs across the rione line. **Arbitrator.** Photos: []

**63. Via dei Cavalieri del Santo Sepolcro, via dell'Ospedale, via Scossacavalli, via della Traspontina, via San Pio X, via dei Penitenzieri, via Paolo VI, vicolo delle Palline, vicolo d'Orfeo, via del Falco, via dell'Erba, via Plauto, via Rusticucci, salita dei Santi Michele e Magno, via dei Tre Pupazzi, via Giovanni Vitelleschi, via Alberico II, via dei Bastioni, via delle Fosse di Castello, via delle Grazie, vicolo dell'Inferriata, via Stefano Porcari, via di Porta Castello, via di Porta Santo Spirito, viale Giuseppe Ceccarelli — the remaining street network.** Enumerated in it.wiki *Borgo (rione di Roma)* §Strade. No individual sourcing gathered; listed so the verifier knows the finder saw them and judged them thin. Photos: []

### 3.7 Archaeology, and what is no longer there

Borgo is unusual: a large share of what a guide would write about **has been demolished**, mostly in
1936–1940. These are real candidates for a history section, not padding — but every one of them
needs the tense right.

**64. Meta Romuli — vanished Roman pyramid.** A pyramidal monumental tomb near the crossing of the via Cornelia and the via Trionfale in the *Ager Vaticanus*, popularly linked to the Pyramid of Cestius (*meta Remi*) and believed to mark one end of a line whose midpoint was Peter's martyrdom. Survived into the Middle Ages; **demolished in 1499** (it.wiki *Borgo*). it.wiki *Meta Romuli* says it stood *"dove oggi si trova l'Auditorium Conciliazione su Via della Conciliazione"*, citing Petacco 2016. — `https://it.wikipedia.org/wiki/Meta_Romuli`. Rione: **Borgo**. Photos: []

**65. Terebinto di Nerone (*Therebintus Neronis*) — vanished Roman tomb.** A round tomb topped by a tall tower, beside the Meta Romuli; demolished from the 7th century. — it.wiki *Borgo* (citing Borgatti p. 5) and `https://it.wikipedia.org/wiki/Terebinto_di_Nerone`. Rione: **Borgo — OSM PIP** at 41.902856, 12.463333. Photos: []

**66. Ager Vaticanus — the ancient landscape.** it.wiki *Borgo*: the territory belonged to the 14th Augustan *Regio, Transtiberim*; outside the *pomerium* and malarial, so used for burial; the via Cornelia and the *via Triumphalis* left the foot of the Vatican hill; the *Horti Agrippinae* and *Horti Domitiae* lay near the slopes; Caligula built the *Circus Gaianus*, enlarged by Nero; the Vatican obelisk now in St Peter's Square stood on its *spina*; Nero replaced the wooden bridge of the via Triumphalis with the stone **Pons Neronianus**, whose remains are visible in the Tiber at low water. Rione: **Borgo — OSM PIP** at 41.9054, 12.4662. Photos: []

**67. Spina di Borgo, with Borgo Nuovo and Borgo Vecchio — the vanished block and its two streets.** *Borgo Vecchio* replaced the collapsed medieval *Portica* (it.wiki notes its near-constant width of **6,90 m** as the evidence, citing Borgatti p. 61); *Borgo Nuovo* was the *Via Alexandrina* opened by Alexander VI for the **1500** Jubilee; the wedge of houses between them was the *spina*. Demolition began ceremonially on **29 October 1936 at 09.00**, when Mussolini struck the cornice of Palazzo Sauve in piazza Pia with a pickaxe, accompanied by governor **Giuseppe Bottai**; the project had been presented to Mussolini at Castel Sant'Angelo on **20 June 1936** and to Pius XI in the Loggia di Raffaello eight days later. Expropriations ran under **Regio Decreto 981 of 1931**; named contractors Vaselli, La Prenestina, Tudini e Talenti, Federici, Manfredi. **By 8 October 1937 the spina had ceased to exist and St Peter's was visible from Castel Sant'Angelo.** Most of the displaced residents were moved to the *borgate*, e.g. Acilia. **No survey of the old quarter was ever made**, only drawings. — `https://it.wikipedia.org/wiki/Borgo_(rione_di_Roma)` (citing Vannelli; Parisi Presicce & Petacco; ACS; Ceccarelli) and `https://it.wikipedia.org/wiki/Spina_di_Borgo`. Rione: **Borgo**. Photos: []

**68. Piazza Scossacavalli — vanished square.** Also known as piazza di San Clemente, di Trento, d'Aragona, Salviati. Quadrangular, between Borgo Nuovo and Borgo Vecchio at about two-thirds of their length; the centre of the *spina* and the most important square of the Borgo. **Demolished 1937.** Its fountain, by **Carlo Maderno**, was re-erected in front of Sant'Andrea della Valle in rione Sant'Eustachio, where it still is. — `https://it.wikipedia.org/wiki/Piazza_Scossacavalli` and it.wiki *Borgo*. **Flag:** the Piazza Scossacavalli infobox says `circoscrizione = Municipio Roma XIV` and `cap = 00185`. Both are wrong for Borgo (Municipio I, CAP 00193). Aggregator noise. Rione: **Borgo**. Photos: []

**69. Chiesa di San Giacomo a Scossacavalli — demolished church.** Stood on piazza Scossacavalli; **demolished 1937 and never rebuilt** (it.wiki *Borgo*, citing Cambedda p. 22). Rione: **Borgo — OSM PIP** at 41.902361, 12.461528. Photos: []

**70. Chiesa di San Michele Arcangelo ai Corridori di Borgo — demolished church.** Stood along the Passetto; **demolished 1939**, never rebuilt; works from it are in the Annunziatina (#18). Rione: **Borgo — OSM PIP** at 41.903331, 12.463278. Photos: []

**71. Oratorio di San Filippo Neri in Borgo — demolished oratory, 1938.** Rione: **Borgo — OSM PIP** at 41.902306, 12.460667. — it.wiki *Borgo*. Photos: []

**72. Chiesa di Santa Maria della Purità — demolished church, between 1937 and 1940.** Rione: **Borgo** (it.wiki category; no coordinate published). Photos: []

**73. Ospedale di San Carlo — demolished hospital, 1939**, on Borgo Santo Spirito; via dell'Ospedale is named for it. Rione: **Borgo — OSM PIP** at 41.901944, 12.463611. — it.wiki *Borgo*, *Palazzo Alicorni*. Photos: []

**74. Palazzo del Governatore di Borgo (Palazzo delle Prigioni / del Soldato) — demolished palace, 1936–37**, by **Antonio da Sangallo il Giovane**, at the junction of Borgo Vecchio, Borgo Nuovo and vicolo Dritto. Also demolished in the same sweep: the **Collegio di Santa Maria per le Missioni Maronite** on Borgo Nuovo. — it.wiki *Borgo*. Rione: **Borgo**. Photos: []

**Also vanished, recorded for completeness, all from it.wiki *Borgo*:** **Palazzo Branconio dell'Aquila**, designed by **Raphael**, demolished **1667** to open piazza Rusticucci (OSM PIP of the site, 41.902278, 12.458722 → Borgo); **Palazzo Jacopo da Brescia** (demolished 1936, façade remounted on via dei Corridori); **Casa di Febo Brigotti** (same); **Chiesa di Santa Maria della Febbre**; **Porta Angelica** (demolished — but see §5, the site is in Prati); **piazza Rusticucci**, **piazza Armellina**, **vicolo del Boia**, **vicolo Dritto**, **vicolo Torto**, **vicolo del Villano**, **vicolo dell'Armellino**, **vicolo del Colonnato**, **vicolo della Traspontina**, **via dell'Elefante**. Photos: [] on all.

---

## 4. Straddlers — the consolidated list

**Do not resolve any of these. Arbitrator only.**

| # | Place | Straddles | Evidence |
|---|---|---|---|
| 4 | **Passetto di Borgo** | **Borgo ↔ VATICAN CITY** | OSM PIP: mid 41.903333/12.461667 → Borgo; west end 41.90295/12.45745 → Vatican polygon. it.wiki: *"collega il Vaticano con Castel Sant'Angelo"*. **The one object that physically crosses the sovereign border.** |
| 5 | **Mura leonine** | **Borgo ↔ VATICAN CITY** | OSM PIP of the Passetto stretch → Borgo; it.wiki infobox gives the wall's state as Vatican from 1929. Most of the circuit is the Vatican's perimeter. |
| 3 | **Ponte Sant'Angelo** | Ponte ↔ Borgo | it.wiki lead names both rioni. OSM PIP: W end Borgo, E end and centroid Ponte. |
| 44 | **Ponte Vittorio Emanuele II** | Ponte ↔ Borgo | it.wiki lead names both. OSM PIP: W end Borgo, E end Ponte. |
| 45 | **Ponte Principe Amedeo Savoia Aosta** | Ponte ↔ Borgo, **possibly Trastevere** | it.wiki lead says three rioni, its own body says two. OSM PIP found two. Source self-contradictory. |
| 46 | **Galleria PASA** | **Borgo ↔ Quartiere XIII Aurelio** | OSM PIP: E portal Borgo, W portal Aurelio. Crosses out of the rione system into the quartiere layer. |
| 47 | **Lungotevere Castello** | Borgo ↔ Prati | it.wiki lead and infobox both say both. |
| 62 | **Via di Porta Angelica** | Borgo ↔ Prati | OSM PIP: southern stretch Borgo, northern stretch Prati. |
| 22 | **Campo Santo Teutonico / S. Maria della Pietà** | **Sovereignty unresolved** — Borgo, or extraterritorial, or Vatican City | it.wiki says extraterritorial (weak source); en.wiki says both things on one page; the Holy See's own list omits it; OSM puts it in Borgo. |
| 36 | **Palazzo delle Congregazioni ai Propilei** | Extraterritorial, and it.wiki tags it `paese=Italia` **and** `paese2=VAT` | vatican.va item 10 settles the *status*; the infobox is noise, but a writer may read it as a border claim. |
| — | **Aula Paolo VI** | **Genuinely split; not assignable to one polygon** | OSM PIP puts my sample point 41.900697/12.454697 in **Borgo**, which the scope file's evidence says is wrong: the Italo-Vatican border runs *through* the hall (`scope-vatican-and-extraterritorial.md` §1b, §2, quoting it.wiki *Confine*), and the Holy See's 2001 list does not name it. **Do not publish, in Borgo or anywhere.** |

### 4.3 OSM is wrong at the colonnade, and here is the proof

I ran a control: the **Ricciolo d'Italia**, the ~3 m × 60 m strip of Italian territory behind the
north colonnade documented in `scope-vatican-and-extraterritorial.md` §1c. OSM PIP at its published
coordinate 41.90361111, 12.45638889 returns **Status Civitatis Vaticanae** — i.e. OSM's polygon
absorbs the Ricciolo into the Vatican, which is exactly the error that Italian Wikipedia says even
the Italian police and the Swiss Guard make.

**Consequence for the corpus, and I want the verifier to hold this:** OSM's rione polygons are good
enough for "which rione is this palazzo in" across the body of Borgo, and I have used them that way
throughout. They are **not** good enough at the Vatican edge, and no OSM result in this file should
ever be used to make a statement about where the international border runs. That is precisely what
the vatican_ruling forbids, and here is an independent demonstration of why the ruling is right.

---

## 5. Explicit exclusions — things a Borgo writer will reach for and must not have

**Vatican City (ruling 2 — these belong to no rione and get the standalone page):**
- **St Peter's Basilica**, **St Peter's Square**, the **Vatican Museums**, the **Sistine Chapel**, the Apostolic Palace, the Vatican Gardens. Not candidates. Not Borgo.
- **Chiesa di Sant'Anna dei Palafrenieri** — **this is the trap.** It sits at the head of Borgo Pio, it.wiki *Borgo Pio* cites an epigraph "near Sant'Anna dei Palafrenieri" as evidence for the street's construction, and a writer walking Borgo Pio will walk straight at it. OSM PIP at 41.90455, 12.45715 (*approx*) → **inside the Vatican polygon**. **Exclude.** (Porta Sant'Anna itself, 41.90447, 12.45766 *approx*, returns Borgo — another reason not to draw fine lines here.)
- **Ricciolo d'Italia** — do not publish. It is Italian soil per it.wiki, Vatican per OSM, and administered by the Vatican in practice. Any sentence about it is a sentence about where the border runs.
- **Aula Paolo VI** — see §4.
- Note for the verifier: **Roma Capitale's own tourism portal carries a page for Piazza San Pietro** (`https://www.turismoroma.it/it/luoghi/piazza-san-pietro`, `POINT (12.457291 41.902357)`). That the city's tourism office writes about it is **not** evidence that it is Italian territory, and a writer may reach for it as if it were. It is not.

**In Prati (R. XXII), not Borgo — despite Wikipedia filing several of them under Borgo:**
- **Porta Angelica** (site) — OSM PIP 41.906222, 12.456694 → **Prati**, though it.wiki puts the article in `Categoria:Roma R. XIV Borgo`. The two angels salvaged from it are set in the wall at the corner of via dei Bastioni di Michelangelo and piazza del Risorgimento (it.wiki *Porta Castello*), and my PIP at 41.90600, 12.45720 → **Prati**.
- **Chiesa di Santa Maria delle Grazie a Porta Angelica** (site, demolished 1939) — OSM PIP 41.906671, 12.456807 → **Prati**, again despite the Borgo category.
- **Piazza del Risorgimento** — OSM PIP 41.90740, 12.45890 → **Prati**. No it.wiki article exists.
- **Ottaviano metro station** (Line A) — it.wiki *Borgo* lists it as the rione's transport link; the station itself is in Prati. Say "the nearest metro station is Ottaviano" only if you can source the station's own location, and **never** with a walking time (corpus rule).

**In Quartiere XIII Aurelio, not Borgo:**
- **Largo di Porta Cavalleggeri** — OSM PIP 41.90020, 12.45660 → **Aurelio**. This matters because Palazzo del Sant'Uffizio (#37) and San Pietro in Borgo (#20) are described in their sources as "presso Porta Cavalleggeri" while themselves PIPing into Borgo. The palace is Borgo; the largo is not.
- **Roma San Pietro railway station** — OSM PIP 41.89700, 12.45420 → **Aurelio**.
- The **west portal of the Galleria PASA** — see §4.

**In Trastevere:** the **Ospedale Bambino Gesù** on the Gianicolo (OSM PIP 41.89185, 12.46050 → Trastevere) is on the vatican.va extraterritorial list under item 13 but is not in Borgo.

---

## 6. Extraterritorial properties standing in Borgo — the tier-2 register

From the Holy See's own enumeration, which I fetched directly:
`https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html` (updated 03.04.2001).

Per the vatican_ruling these are **Italian soil with the immunities of a diplomatic headquarters**;
they publish under Borgo with the status stated; visitors follow Italian law.

| vatican.va item | Property | This file |
|---|---|---|
| 7 | *il Palazzo del Sant'Offizio ed adiacenze* | #37, and #20 (San Pietro in Borgo, inside the complex) |
| 8 | *il Palazzo dei Convertendi* | #27 |
| 10 | *il Palazzo delle Congregazioni ai Propilei* | #36 |
| 11 | *il Palazzo Pio* — **"con esclusione tuttavia dei locali che ospitano attualmente l'Auditorium"** | #33, and the carve-out is #34 |
| 13 | *gli immobili sul Gianicolo* — includes *Chiesa di S. Michele e Magno*, *Collegio Internazionale S. Monica*, and *immobili su Borgo Santo Spirito contigui alla Curia dei Gesuiti* | #19; #21 (chapel's inclusion **not stated**); #23 (curia's own inclusion **not stated**) |

**Not on the list, though Wikipedia implies otherwise:** Palazzo dell'Azione Cattolica (#35) and the
Campo Santo Teutonico (#22). **Do not label either extraterritorial.**

The same page gives the total extraterritorial estate as *"circa 700 mila metri quadrati"*.

---

## 7. What I could not reach, and what that costs

| Host / URL | Result | Consequence |
|---|---|---|
| `vincoliinrete.beniculturali.it`, `catalogo.beniculturali.it` | still unreachable (per `scope-sources.md` §1; I did not re-probe, having no claim that needed them) | **Ruling 1 stands.** No designation claim anywhere in this file. |
| `*.cultura.gov.it` — incl. `direzionemuseiroma.cultura.gov.it`, `castelsantangelo.cultura.gov.it` | **DNS resolution failure** (`gaierror`) | Castel Sant'Angelo's and the Passetto's own museum authority cannot be cited. Roma Capitale's turismoroma stands in. |
| `castelsantangelo.beniculturali.it` | TCP timeout | same |
| `musei.beniculturali.it` | not reachable | the Passetto's **2024 reopening is UNVERIFIED** |
| `https://www.comune.roma.it/web/it/notizia.page?contentId=NWS1075685` | not fetched | **Piazza Pia (#7) has no usable primary source.** The single biggest recent change in the rione is currently unshippable. |
| `https://www.parrocchiatraspontina.it/orari-delle-celebrazioni/` | HTTP 404 | **no Mass times for Santa Maria in Traspontina** |
| `https://www.auditoriumconciliazione.it/` (with `www.`) | SSL hostname mismatch | use the apex domain |
| `https://www.oessh.va/` | HTTP 200 but JS-only shell | Palazzo dei Penitenzieri's owner establishes nothing |
| `https://nominatim.openstreetmap.org/search` | **HTTP 429 immediately** | the scoping wave's reverse-geocode technique was unavailable; replaced with the local PIP method (§1) |
| Overpass mirrors kumi.systems, private.coffee | **empty `elements` on `is_in`** | they lack generated areas; **only `overpass-api.de` may be used for point-in-polygon** |

**One new reachable Roma Capitale source, worth a follow-up wave.** SISTO, the Comune's street and
toponymy register, answers over HTTP: `https://geoportale.comune.roma.it/sisto/api/viario/<id>`
returned a full JSON record (I read id 11479, Corso Vittorio Emanuele II) with the official
*toponimo*, the *limiti*, the deliberation that created or modified it, and the **municipio**. It
does **not** carry a rione field (`suddivisioni` was null on the record I read), and I could not
find the search endpoint — every guess returned HTTP 400 and `/api/rioni` and `/api/suddivisioni`
returned HTTP 401. But this is a live Roma Capitale toponymic API, and it is the closest thing this
programme has found to an official per-street record. Someone should work out its query interface.

---

## 8. Notes parked for the photo wave (ruling 3 — prose only, no URLs, no filenames)

Borgo's picture problem is unusual and the photo wave should know it in advance: the rione's most
photogenic subjects are (a) Castel Sant'Angelo and Ponte Sant'Angelo, both out of copyright as
architecture and both heavily photographed; (b) the view **down** via della Conciliazione, whose
framed subject is St Peter's — a Vatican building, in a wave that will have its own rules; (c) the
Piacentini/Spaccarelli buildings of 1936–1950 lining the street, whose architects died in 1960 and
1959, which under Italy's 70-year term and absence of freedom of panorama puts them out of reach
until 2030 and 2031 respectively; and (d) the 1948–50 Palazzo San Pio X and Palazzo dell'Azione
Cattolica, same architects, same dates, same problem. That is most of the street. The pre-1900
fabric — the hospital complex, the surviving Renaissance palaces, the Borghi north of the Passetto —
is where the photo wave will actually find usable material.

---

## 9. Handover: what the verifier should test first

1. **Every "Borgo — OSM PIP" is a single method with a single failure mode.** If the arbitrator wants a second geographic witness, the cheapest is Nominatim reverse-geocode once the rate limit clears; the scoping wave got `address.quarter` = rione for 8/8 central landmarks, including Castel Sant'Angelo.
2. **The three high-interest, badly-sourced claims**, in order of how much a writer will want them: Leo XIV's ordination in the Cappella di Santa Monica (#21, **zero footnote**); the Teatro di Nerone excavation (#25, newspaper-only); "the oldest hospital in Europe" (#10, a superlative through an aggregator, and barred by the corpus rules as written).
3. **Piazza Pia (#7)** — the rione's newest and most visible feature, and currently unshippable.
4. **The Museo dell'arte sanitaria's address (#12)** — three different answers, and no hours at all.
5. **Two Wikipedia category errors that will propagate**: Porta Angelica and Santa Maria delle Grazie a Porta Angelica are filed under Borgo and are in Prati.
6. **Santa Maria in Traspontina's architect (#15)** — three attributions inside one encyclopedia.

**Yield note, offered as the brief asks.** 74 candidates. I would expect a materially lower
confirmation rate than a Manhattan wave, and that is the point: roughly a sixth of this file is
buildings that no longer exist, another sixth is Holy See property whose status is set by a treaty
list rather than by the ground, and the rione's western edge is a border that two sovereign states
declined to ratify. If most of this comes back confirmed, the verifier was not testing the edges.
