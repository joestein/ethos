# Regola (R. VII, Roma Capitale toponymic code 107) — FINDER

Research file. Not reader-facing copy. Provenance arguments, failed fetches, superlative
warnings and boundary disputes are recorded here **because they must not appear on any page**.

Researched 2026-09-02. Every claim below carries the URL it came from. Where a source uses a
superlative or a designation word, that is flagged **BANNED — do not publish** and the
publishable residue is stated instead.

---

## 0. HEADLINE

- **Candidates found: 96.** Full-guide rione by a wide margin, not a town page.
- Regola is dense: it owns Palazzo Farnese, Palazzo Spada with the Galleria Spada and the
  Borromini colonnade, most of via Giulia, twenty-one churches and ex-churches, and a
  restaurant/hotel layer that is genuinely worth writing about rather than filler.
- **Three of the brief's "likely subjects" are NOT in Regola.** The Museo Criminologico
  (via del Gonfalone 29) and the Oratorio del Gonfalone (via del Gonfalone 32/a) both fall in
  **Ponte**. So does Palazzo Sacchetti (via Giulia 66). See §2.
- Twelve boundary cases are flagged for the arbitrator in §3. I have not resolved any of them.

## 1. HOW RIONE MEMBERSHIP WAS ESTABLISHED (method — research file only)

Nominatim reverse geocoding worked for the first four lookups and then rate-limited us into a
hard 429 block that did not clear across ~25 minutes of exponential backoff. Two confirmed
readings survive from before the block and are recorded because they agree with everything
after: Palazzo Farnese 41.894681,12.471044 → `quarter=Regola`; Palazzo Spada
41.893918,12.472225 → `quarter=Regola`
(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=41.894681&lon=12.471044&zoom=18&addressdetails=1`).

The rest was done by **point-in-polygon against the OSM boundary relations themselves**, which
is stronger than reverse geocoding because it is the same data without the geocoder in the way:

- Relation IDs from Wikidata property P402 via
  `https://www.wikidata.org/w/api.php?action=wbgetentities&sites=itwiki&titles=...&props=claims`
  — Regola = Q261246 → OSM relation **5452745**; Ponte 2529127; Parione 5452744;
  Sant'Eustachio 5452746; Sant'Angelo 5454238; Trastevere 2529081; Campitelli 5454237.
- Geometry from `https://api.openstreetmap.org/api/0.6/relation/5452745/full.json`.
  Relation 5452745 tags: `boundary=place`, `place=quarter`, `name=Regola`,
  `official_name=Rione VII Regola`, `ref=R. VII`, `wikidata=Q261246`. Single closed outer ring,
  131 nodes, version 12 (2024-02-11). Bounding box lat 41.89102–41.89778, lon 12.46542–12.47686.
- Candidate coordinates from Wikidata P625 and from OSM object centroids
  (Overpass bbox dump; the main and kumi endpoints 504'd, `maps.mail.ru` mirror served it).
- Sanity check: a Colosseum-area control point returned NONE (correct — Celio is not in the
  loaded set), and Parione's five shipped border places (Campo de' Fiori, Santa Barbara dei
  Librai, Arco degli Acetari, Teatro di Pompeo, Palazzo Orsini Pio Righetti) all returned
  **Parione**, i.e. Parione's existing file does not collide with Regola.

**Caveat the arbitrator needs.** OSM draws the Regola/Parione and Regola/Ponte boundaries down
street centrelines. Roma Capitale's own boundary text names whole streets as the border
(`https://www.turismoroma.it/it/page/rione-vii-regola`: "Confini: vicolo della Scimia, via delle
Carceri, via dei Banchi Vecchi, via del Pellegrino, via dei Cappellari, Campo de' Fiori, via dei
Giubbonari, via di Santa Maria del Pianto, piazza delle Cinque Scole, via del Progresso,
lungotevere De' Cenci, lungotevere dei Vallati, lungotevere dei Tebaldi"). So an address **on**
one of those streets can land either side by a few metres. Everything with such an address is
flagged in §3 rather than claimed.

**Roma Capitale's own boundary note, publishable:** the city states that the church of San Carlo
ai Catinari was "un tempo inclusa nel perimetro del rione Regola, ma oggi appartenente al rione
S. Eustachio" (`https://www.turismoroma.it/it/luoghi/piazza-benedetto-cairoli`). Regola must not
claim San Carlo ai Catinari.

**Collision check run before anything else:** `python3 .superpowers/taken_slugs.py` — 450 places
across 12 shipped files. Searched for farnese, spada, giulia, monserrato, girolamo, mascherone,
criminolog, campo, fiori, pellegrini, caterina, eligio, salvatore, brigida, barbara, sisto,
cenci, ricci, mattei, giubbonari, banchi, arco, "via ". **Only three hits touch Regola's
territory and all are correctly owned elsewhere:** `ponte-sisto-rome` (Trastevere),
`santa-barbara-dei-librai-parione-rome` and `campo-de-fiori-parione-rome` (Parione). No Regola
candidate below duplicates a shipped slug.

## 2. RULED OUT — belongs to another rione (do not write these into regola.json)

| Place | Coord tested | Polygon result | Corroboration |
|---|---|---|---|
| **Museo Criminologico**, via del Gonfalone 29 | 41.897667,12.466556 | **Ponte** | it.wikipedia categorises it `[[Categoria:Roma R. V Ponte]]` |
| **Oratorio del Gonfalone**, via del Gonfalone 32/a | 41.897535,12.466283 | **Ponte** | same street, same block |
| **Palazzo Sacchetti**, via Giulia 66 | 41.898611,12.465833 | **Ponte** | it.wikipedia `[[Categoria:Roma R. V Ponte]]` |
| Ponte Sisto | 41.892336,12.470794 | Trastevere | already shipped as `ponte-sisto-rome` |
| Campo de' Fiori / Giordano Bruno / its fountain | 41.895664,12.472047 | Parione | already shipped |
| Santa Barbara dei Librai | 41.894810,12.473730 | Parione | already shipped |
| Arco degli Acetari | 41.896345,12.471398 | Parione | already shipped |
| Teatro di Pompeo, Santa Maria in Grottapinta, Palazzo Orsini Pio Righetti | — | Parione | already shipped |
| Palazzo della Cancelleria | 41.896687,12.471521 | Parione | already shipped |
| Lungotevere de' Cenci | 41.891800,12.477100 | Sant'Angelo | it.wiki dual-categorises Regola + Sant'Angelo |
| Lungotevere dei Sangallo | 41.898260,12.465012 | Ponte | it.wiki dual-categorises Ponte + Regola |
| San Carlo ai Catinari | — | Sant'Eustachio | Roma Capitale, link above |

**The brief's list is wrong on the Museo Criminologico.** It is worth writing about — 1931
foundation by Guardasigilli Alfredo Rocco, first housed on the ground floor of the Carceri Nuove
on via Giulia, moved 1975 into the ex juvenile prison in Palazzo del Gonfalone, Mastro Titta's
red executioner's cloak, Lombroso material
(`https://www.turismoroma.it/it/luoghi/museo-criminologico`;
`https://it.wikipedia.org/w/index.php?title=Museo_criminologico&action=raw`) — but it should be
written by **Ponte**, and the Carceri Nuove half of its story belongs to Regola. Note also a
straight source conflict on whether it is open: Turismo Roma's info block says only "Chiuso
domenica e lunedì", it.wikipedia says "Dal 1º giugno 2016 il museo è temporaneamente chiuso".
`cultura.gov.it` and `museocriminologico.it` were both unreachable. **No page may state its
opening hours** until someone can reach a primary source.

## 3. STRADDLERS — flagged, NOT resolved by me

The arbitrator sees all nine files; these are for them.

1. **Via Giulia** — it.wikipedia infobox: `quartiere = Regola, Ponte`; length 950 m, runs from
   piazza San Vincenzo Pallotti to piazza dell'Oro. Midpoint 41.894170,12.470070 → Regola. The
   northern third is Ponte. Regola holds the Farnese end; Ponte holds the San Giovanni dei
   Fiorentini end. Suggest Regola writes it and says so, or it splits.
2. **Palazzo dei Tribunali (Bramante's unfinished law courts, "i sofà di via Giulia")** —
   direct conflict. it.wikipedia places the site "tra via del Gonfalone e vicolo del Cefalo"
   (Ponte side), but the OSM building carrying `name=Palazzo dei Tribunali` (way 127942182,
   41.897396,12.467196) tests **Regola**, and the D.O.M Hotel occupies the same footprint. The
   surviving rusticated basement runs along the street and may genuinely cross the line.
3. **Santa Lucia del Gonfalone**, via dei Banchi Vecchi 12 — 41.897640,12.467410 tests
   **Regola**, but via dei Banchi Vecchi is the named Regola/Parione/Ponte border and it.wiki
   triple-categorises the street. Its confraternity's oratory is in Ponte.
4. **Piazza Benedetto Cairoli** and the **Monumento a Federico Seismit-Doda** (bronze by Eugenio
   Maccagnani, made 1905–06, placed here 1919) — 41.893782/41.893807 test Regola; it.wiki
   dual-categorises Regola + Sant'Eustachio. San Carlo ai Catinari on the same square is
   Sant'Eustachio's.
5. **Fontana di piazza delle Cinque Scole (Fontana del Pianto)** — 41.892771,12.476385 tests
   Regola; it.wiki dual-categorises Regola + Sant'Angelo. Piazza delle Cinque Scole is a named
   border.
6. **San Tommaso ai Cenci** — the church is in Monte de' Cenci (Regola) but it.wikipedia states
   "un'uscita laterale conduce in Piazza delle Cinque Scole, nel rione Sant'Angelo". Two rioni,
   one building.
7. **Ponte Garibaldi** — Roma Capitale itself says the bridge "unisce il rione Regola a
   Trastevere". Centroid 41.891111,12.474444 tests Regola.
8. **Ponte Giuseppe Mazzini** — centroid 41.896111,12.465833 tests **Trastevere**; it.wiki
   dual-categorises Regola + Trastevere.
9. **Via dei Giubbonari** and everything addressed on it (Salumeria Roscioli 21, Voglia di
   Pizza 33, Carrefour 13, B&B Giubbonari 23) — named Regola/Parione then Regola/Sant'Eustachio
   border. All test Regola by a few metres.
10. **Via del Pellegrino / via dei Cappellari frontages** — Trattoria Settimio (Pellegrino 117),
    La Locanda del Pellegrino (Pellegrino 107), Osteria dei Cappellari (Cappellari 66), La
    Moretta Trattoria, Maccarone il Pastificio all test Regola but sit on Parione border
    streets. Parione already owns Arco degli Acetari on via del Pellegrino.
11. **Via di Santa Maria del Pianto frontages** — Beppe e i suoi formaggi (9a), Catinari (15),
    Fonzie (13) test Regola; the street is the named Regola/Sant'Eustachio then
    Regola/Sant'Angelo border, and the Ghetto restaurants opposite are Sant'Angelo's.
12. **Sora Margherita**, piazza delle Cinque Scole 30, and **Ristorante Al Pompiere**, which has
    two OSM entries (piazza delle Cinque Scole 28 and via di Santa Maria de' Calderari 38).
    Sora Margherita's own site describes itself as "al confine tra i Rioni: La Regola e
    Sant'Angelo in pescheria" (`https://www.soramargherita.com`). Both test Regola.

---

## 4. CANDIDATES

`kind` values below are drawn only from the thirteen the schema allows. Rome churches are
`historic-site`, per the roster's `kind_note`. All records must emit `"photos": []`.

### 4.1 The anchors

**1. Palazzo Farnese** — `historic-site` (or `attraction`) — Piazza Farnese 67, 00186 Roma.
Coord 41.894681,12.471044 → Regola (Nominatim `quarter=Regola` AND polygon).
- Commissioned 1513 by Alessandro Farnese, later Paul III; work began 1514, halted by the 1527
  Sack of Rome, resumed 1541; completed 1589. Four architects in sequence: Antonio da Sangallo
  the Younger (original design), Michelangelo 1546–1549 (cornice, central balcony, much of the
  courtyard), Vignola 1569–1573 (rear façade), Giacomo della Porta (river front, finished 1589).
  Sources: `https://www.turismoroma.it/it/luoghi/palazzo-farnese`;
  `https://visite-palazzofarnese.it/palazzo-farnese/`;
  `https://it.wikipedia.org/w/index.php?title=Palazzo_Farnese_(Roma)&action=raw`.
- Carracci Gallery frescoed 1597–1604 by Annibale Carracci with Agostino Carracci, Domenichino
  and Giovanni Lanfranco; subjects largely from Ovid's *Metamorphoses*; the vault is 20 m
  (Turismo Roma; the official visits site gives "una magnifica volta di 20 metri").
- Owned by the Italian State; leased to France since 1936 for 99 years; French Embassy since
  1874 and École française de Rome since 1875 (it.wikipedia; official visits site).
- **Visiting, publishable and hard-sourced** (`https://visite-palazzofarnese.it/prodotto/visita-guidata-palazzo-farnese/`):
  entry by guided tour only, in Italian, French or English, tickets sold only on that site, up
  to 90 days ahead and until 5 days before. Palazzo Farnese: Monday 15.00, 16.00, 17.00;
  Tuesday, Thursday, Friday 15.00 and 16.00. Palazzo Farnese + Sotterranei: Monday 17.00
  (Italian), Tuesday 17.00 (English), Thursday 17.00 (French). Palazzo Farnese + École française
  de Rome: Friday 17.00. €15 / €20 / €22; free under 6. Visitors must arrive 30 minutes before
  their slot with the same ID used at purchase (passport or identity card; driving licences not
  accepted). No cloakroom; no trolleys, luggage or backpacks; women's handbags allowed. No
  photography inside. Groups max 33 (25 for the Tuesday/Thursday/Friday 17.00 slots). Accessible
  to disabled visitors except the École française de Rome and the Sotterranei; the Sotterranei
  are closed to under-12s.
- The Sotterranei opened to the public **29 May 2024**; they hold two black-and-white mosaic
  pavements, one of sea animals and monsters, one of circus acrobats on horseback (*desultores*)
  (`https://visite-palazzofarnese.it/palazzo-farnese/`).
- **BANNED — do not publish:** the official site's "uno degli edifici più belli ed importanti di
  Roma", "il suo capolavoro", "la più perfetta conclusione", Turismo Roma's "Tra i più bei
  palazzi del Cinquecento romano", it.wikipedia's "il palazzo gentilizio più importante della
  Roma rinascimentale". Publishable residue: the palace was one of the four things
  eighteenth-century Romans called *le quattro meraviglie di Roma* alongside the Borghese
  cembalo, the Caetani staircase (Palazzo Ruspoli) and the Carboniani portal — that is a named
  historical grouping, not a ranking we are asserting.
- Puccini set the second act of *Tosca* here (it.wikipedia).
- Phone 06 686011; embassy page `https://it.ambafrance.org/Palazzo-Farnese-11114` (Turismo Roma
  info block).

**2. Galleria Spada** — `museum` — Piazza Capo di Ferro 13, 00186 Roma. 41.893887,12.472201 →
Regola (Nominatim + polygon).
- Founded 1927, after the Italian State bought the Spada collection and the palace in November
  1926 for 14 million lire. Closed during the war; Federico Zeri became director in 1948,
  recovered the dispersed pictures and reopened it in 1951, arranging the four rooms as a
  seventeenth-century *quadreria*, frames touching, small pictures above large.
  (`https://it.wikipedia.org/w/index.php?title=Galleria_Spada&action=raw`)
- Four rooms on the first floor, in a seventeenth-century wing. Room III was designed 1636–37 by
  Paolo Maruscelli for Bernardino Spada's collection.
- Painters held: Guido Reni, Guercino, Orazio and Artemisia Gentileschi, Titian, Parmigianino,
  Jan Brueghel the Elder, Andrea del Sarto (copy), Salvator Rosa, Domenichino, Annibale
  Carracci, Pietro Testa, Niccolò Tornioli, Michelangelo Cerquozzi, Mattia Preti, Giovanni
  Lanfranco, Pieter van Laer, Francesco Solimena, plus Valentin de Boulogne, Trophime Bigot and
  Hendrick van Somer per Turismo Roma. Also a Bernini *Busto del Laocoonte*, and Blaeu celestial
  and terrestrial globes of the early eighteenth century.
- **Visitor count, a publishable number not a ranking: 63,099 in 2023**, MiC statistics
  (`http://www.statistica.beniculturali.it/rilevazioni/musei/Anno%202023/MUSEI_TAVOLA7_2023.pdf`,
  cited in the it.wikipedia infobox). Director Adriana Capriotti.
- **Hours — two independent readings, use the Roma Capitale one.** Turismo Roma
  (`https://www.turismoroma.it/it/luoghi/galleria-spada`): "Ultimo ingresso ore 19.00. Chiuso
  martedì, 25 dicembre, 1° gennaio salvo aperture straordinarie su progetto MiC. Visite guidate
  al Piano Nobile del Palazzo (Sale del Consiglio di Stato): 1° sabato del mese con prenotazione
  obbligatoria." Phone 06 6874896; booking 06 32810; email dms-rm.galleriaspada@cultura.gov.it;
  online tickets www.tosc.it/artist/galleria-spada; site galleriaspada.cultura.gov.it. OSM
  carries `opening_hours=We-Mo 08:30-19:30; Tu off; May 1 off; Dec 25 off` and
  `phone=+39 06 683 2409`, consistent with the 19.00 last admission. **Note for the verifier:**
  `galleriaspada.cultura.gov.it` and `galleriaspada.beniculturali.it` were both unreachable from
  this network (timeout / DNS failure), so the hours above are second-hand from Roma Capitale
  and OSM. If the page states hours it should state the last admission, which both agree on.

**3. Palazzo Spada** — `historic-site` — Piazza Capo di Ferro 13.
- Built from late 1548 for Cardinal Girolamo Recanati Capodiferro (1502–1559) by Bartolomeo
  Baronino of Casale Monferrato (1551–1554), on the family's pre-existing buildings; largely
  finished for the 1550 Jubilee, stucco by workshops under Giulio Mazzoni and Diego di Fiandra,
  and Tommaso del Bosco and Leonardo Sormani.
  (`https://www.turismoroma.it/it/luoghi/palazzo-spada`)
- Bought July 1632 by Cardinal Bernardino Spada (1594–1661), who set Borromini to enlarge and
  rework it over thirty years (it.wikipedia; Turismo Roma).
- Façade statues of Roman worthies — Trajan, Pompey, Fabius Maximus, Romulus, Numa Pompilius,
  Marcellus, Caesar, Augustus — with their deeds in eight panels on the top floor.
- Seat of the Consiglio di Stato since 1889; the State bought palace and collection in 1926.
- The colossal Pompey in the Sala di Pompeo was found in 1552 under a wall between two houses in
  vicolo dei Leutari; Julius III bought it and gave it to Capodiferro (it.wikipedia).
- **BANNED:** it.wikipedia's "la più ricca facciata del Cinquecento romano" and Turismo Roma's
  "il più spettacolare artificio barocco di Roma". Publishable residue: dates, authors, the
  eight named statues.

**4. Prospettiva / Colonnata del Borromini (Palazzo Spada forced-perspective gallery)** —
`attraction`, or a section of the Galleria Spada record.
- Built in a single year, 1652–1653, by Francesco Borromini assisted by the Augustinian
  Giovanni Maria da Bitonto; it replaced a painted perspective by Giovanni Battista Magni.
- **The measurements are the story and they are safe to publish:** the colonnade is
  **8.82 m long** and reads as roughly 35 m; the floor rises, the ceiling drops and the walls
  converge to one vanishing point. The statue at the far end is a cast of a Roman warrior
  **60 cm high**, placed in 1861 by Prince Clemente Spada, and looks life-size from the entrance.
  (it.wikipedia Palazzo Spada and Galleria Spada. Turismo Roma gives "solo 9 metri di
  lunghezza" and dates it 1653; the 8.82 m figure is the precise one. **Flag the 8.82 vs 9 m
  discrepancy for the verifier** — either is honest, they should not both appear.)
- Reached at the end of the first-floor museum route, through the Giardino Segreto (Turismo Roma).
- A 200-lire coin of 1990 and a €0.60 stamp of 2011 both carry it (it.wikipedia).

**5. Piazza Farnese** — `historic-site` — 41.895157,12.471234 → Regola.
- Paved from 1545; eight streets and alleys run into it, the largest being via di Monserrato.
  Buildings on it: Palazzo Farnese, Santa Brigida and its convent, Palazzo Fusconi Pighini
  (Palazzo del Gallo di Roccagiovine), Palazzo Mandosi Mignanelli at the vicolo de' Venti corner
  (which takes its name from a family, not from wind).
  (`https://it.wikipedia.org/w/index.php?title=Piazza_Farnese&action=raw`;
  `https://www.turismoroma.it/it/luoghi/piazza-farnese`)
- Used for tournaments, bullfights and popular festivals, and for the summer floodings that
  later became a Piazza Navona attraction (Turismo Roma).

**6. Le due fontane di piazza Farnese** — `historic-site` — 41.894722,12.470833 → Regola.
- Two Roman granite basins, both moved from piazza San Marco where they had stood since 1466;
  Paul III took the first, Cardinal Alessandro Farnese the second some forty years later. Their
  origin is usually given as the Terme di Caracalla and it.wikipedia is explicit that the debate
  is not settled — say "probably from" and cite it.
- Girolamo Rainaldi turned them into fountains **in 1626**, after Gregory XV granted the Farnese
  40 *once* of Acqua Paola water (document dated 1 September 1621). Each has a travertine outer
  basin, an amphora-shaped baluster, a smaller upper basin and the Farnese heraldic lily.
  **Seven jets** each. Restorations: the southern one 1938–39, both 1992–93, the southern one
  again 2007.
  (`https://it.wikipedia.org/w/index.php?title=Fontane_di_piazza_Farnese&action=raw`)

**7. Via Giulia** — `historic-site` — **STRADDLER, see §3.1.**
- Commissioned by Julius II from Donato Bramante, opened **1508**; **950 m** long, sampietrini
  paving, from piazza San Vincenzo Pallotti (at Ponte Sisto) to piazza dell'Oro. Also called
  *via Magistralis*. (`https://it.wikipedia.org/w/index.php?title=Via_Giulia&action=raw`)
- Three purposes stated: a through route over the medieval lane network; a monumental avenue;
  and a new administrative and banking centre near the Vatican and away from the Capitol.
- Cut off from the river by the lungotevere embankments built from 1888, which left the garden
  fronts of the Medici-Clarelli, Sacchetti, Varese and Falconieri palaces facing nothing.
  Fascist-era demolitions left the gap between via della Barchetta and vicolo delle Prigioni,
  only partly filled by the Liceo Virgilio.
- 2008 was the street's 500th anniversary; churches and palaces were restored and opened.

**8. Fontana del Mascherone** — `historic-site` — via Giulia, at the Palazzo Farnese rear.
OSM way 1434831406, 41.893874,12.470214 → Regola. **Roma Capitale's own file names the rione:
"Rione: Regola"** (`http://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_del_mascherone_in_via_giulia`).
- Sovrintendenza Capitolina: author Girolamo Rainaldi (1570–1655), attributed; dating
  seventeenth century, second quarter; materials grey granite, white marble, travertine, metal;
  originally fed by the **acquedotto Paolo**. A fountain for "Strada Giulia" had been assigned by
  the Congregazione sopra le fonti as early as 1570 and was to run on Acqua Vergine, but the
  work waited on the Acqua Paola channel of 1612.
- Originally free-standing in a small widening that held an open-air theatre **in 1660**; the
  wall behind it was built at the end of the nineteenth century. An antique granite thermal
  basin sits in a slightly sunken paved catch-basin; the marble backing is crowned by a metal
  lily and the antique mask pours the water.
- Turismo Roma adds the 1720 story: for Marco Antonio Zondadari's appointment as Grand Master of
  the Order of Malta, the fountain ran wine for three consecutive days
  (`https://www.turismoroma.it/it/luoghi/fontana-del-mascherone`). OSM carries `start_date=1626`.
  **Flag:** Turismo Roma's own coordinate for this fountain (12.467908,41.896453) is wrong by
  ~300 m; OSM's is right. Both fall inside Regola, so it does not change ownership.

**9. Arco Farnese** — `historic-site` — the arch carrying via Giulia between Palazzo Farnese's
garden and the river front. **LOW CONFIDENCE.** No it.wikipedia article, no Turismo Roma page, no
Sovrintendenza page found. The only source I hold is the it.wikipedia Via Giulia infobox image
caption ("Via Giulia con L'arco Farnese"). A verifier should either find a real source or drop
it. Do not repeat the common claim that Michelangelo designed it — I could not source that.

### 4.2 Churches and ex-churches (all `historic-site`)

All twenty-one below sit in the it.wikipedia category `Chiese di Roma (rione Regola)`
(`https://it.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Categoria:Chiese%20di%20Roma%20(rione%20Regola)`)
and every one that has a coordinate tested inside the Regola polygon.

**10. Santa Maria in Monserrato degli Spagnoli** — Via di Monserrato 115. 41.895990,12.469150 →
Regola. Spain's national church in Rome. First stone 13 June 1518, design entrusted to Antonio
da Sangallo the Younger, continued by Bernardino Valperga and Francesco da Volterra; high altar
consecrated 1594, nave vault finished 1598, apse vault and a new high altar 1675; restored
1818–21 and reconsecrated 1822. Grew out of two Catalan hospitals founded 1354 (Jacoba Ferrandes)
and 1363 (Margarida Pauli), merged 1803; the confraternity under the patronage of Santa Maria di
Monserrato was founded by Alexander VI in 1495.
(`https://it.wikipedia.org/w/index.php?title=Chiesa_di_Santa_Maria_in_Monserrato_degli_Spagnoli&action=raw`)
OSM: `website=https://ineroma.org`, `opening_hours=Mo-Sa 08:30-13:00,15:30-18:30;
Su,PH 10:00-12:00,15:30-18:30` — second-hand, flag for verification.

**11. San Girolamo della Carità** — Via di Monserrato 62/A (Turismo Roma) — note OSM and
Wikidata both give via di San Girolamo della Carità 63; **two addresses in circulation, flag**.
41.895290,12.470240 → Regola.
- Tradition puts the origin in 382, when Damasus set Jerome to work on the Bible and Jerome was
  lodged in the *domus* of the matron Paola, later turned into a church.
- 1524: Clement VII (as Giulio de' Medici) gave the complex to the Confraternita della Carità.
  San Filippo Neri lived in the adjoining convent for over thirty years from 1551 and began
  there the meetings that became the "oratorio"; his rooms are still visitable.
- Destroyed by fire in 1631 and rebuilt; the Baroque façade is by Carlo Rainaldi, who also did
  the high altar. Cappella Antamoro is Filippo Juvarra's, with a marble San Filippo Neri by
  Pierre Legros. **Cappella Spada, 1654**, by Virgilio Spada perhaps with Borromini: jasper and
  marble revetment, two white marble angels holding a jasper eucharistic cloth in place of a
  balustrade; the right-hand angel's wings are wood and swing on pivots to let people through.
- Turismo Roma: "Per prenotare una visita chiamare il numero 349 5880020"; phone 06 6879786;
  chiesasangirolamodellacarita@gmail.com. OSM: `Tu-Fr 17:00-19:00; Su 10:00-13:00`.
  (`https://www.turismoroma.it/it/luoghi/chiesa-di-san-girolamo-della-carita`)
- **BANNED:** Turismo Roma's "uno dei principali artefici della rinascita religiosa", "l'unica
  opera romana di Filippo Juvarra" (a "the only X" claim), "Un'eccezionale opera d'arte".

**12. Santa Caterina della Rota** — Via San Girolamo della Carità 80. 41.895260,12.469750 →
Regola. Recorded in the twelfth-century *Mirabilia Urbis Romae* and in a bull of Urban III as a
parish under San Lorenzo in Damaso; originally Santa Maria "in Catenariis". Restored in the
sixteenth century to a design by Ottaviano Mascherino, and rededicated to Catherine of
Alexandria. **Late-Baroque façade of 1730**, with the arms of the Chapter of St Peter's in the
tympanum. Single nave, three niches a side; the polychrome coffered wooden ceiling of the
sixteenth century came from San Francesco d'Assisi a Ponte Sisto, demolished with the Ospizio
dei Centopreti for the lungotevere. Holds the funerary memorial of the engraver Giuseppe Vasi.
Administered since 1929 by the Venerabile Arciconfraternita dei Palafrenieri; phone 06 6865407
(Sundays only), www.parafrenieri.org.
(`https://www.turismoroma.it/it/luoghi/chiesa-di-santa-caterina-della-rota`)
- **BANNED:** "una delle più antiche chiese del Rione Regola", "la celebre 'processione delle
  panze'". Publishable residue: the twelfth-century attestation, which is a date.

**13. San Tommaso di Canterbury** — Via di Monserrato 45. 41.895611,12.469921 → Regola. Known in
the seventh century as SS. Trinità degli Scozzesi; after the 1300 and 1350 Jubilees a hospice was
built and the older church attached to it. 1579: Gregory XIII gave the whole complex to the
Jesuits, who turned the hospice into an English college. Rebuilt to a design by Pietro Camporese
the Younger after heavy late-eighteenth-century damage, finished in the second half of the
nineteenth century by Virginio Vespignani. Right flank on via di Monserrato with an eclectic
Romanesque portal, four round oculi, arched windows above; rectangular three-aisle interior on
seven columns; funerary monuments including Thomas Dereham's by Ferdinando Fuga.
www.vecrome.org; 06 6865808. (`https://www.turismoroma.it/it/luoghi/chiesa-di-san-tommaso-di-canterbury`)

**14. Venerabile Collegio Inglese** — Via di Monserrato 45, adjoining no. 13.
41.895833,12.470000 → Regola; it.wikipedia `[[Categoria:Roma R. VII Regola]]`. In 1362 an English
merchant couple sold the guild of the English in Rome a house at what is now via di Monserrato
45; the guild founded the *Ospizio inglese della Santissima Trinità e di San Tommaso*. William
Allen turned it into a seminary in 1576; Gregory XIII's foundation bull is 1579; the first
seminarians arrived 1577. Summer residence at Rocca di Papa.
(`https://it.wikipedia.org/w/index.php?title=Venerabile_Collegio_Inglese&action=raw`)
- **BANNED:** "la più antica istituzione inglese al di fuori della Gran Bretagna". Publishable
  residue: the 1362 purchase and the 1576/1579 dates.

**15. Santa Brigida** — Piazza Farnese 96. 41.895284,12.470817 → Regola. Birgitta
Birgersdotter reached Rome in 1349; the small church was dedicated to her in **1391**, the year
after her canonisation, beside the hospice she had built, and forms one complex with the house
where she and her daughter Catherine of Sweden lived until their deaths. Late-Baroque façade
begun 1705, two Corinthian columns, statues of Brigida and Catherine above the tympanum; the
slender red-brick campanile is late nineteenth century. Barrel vault frescoed 1709 by Biagio
Puccini with the *Gloria di santa Brigida*, and six canvases of her life by the same hand. On the
right altar a late-seventeenth-century copy of a lost Annibale Carracci *Madonna col Bambino*.
Funerary monument to Nils Bielke, 1768, by Tommaso Righi to designs by Pietro Camporese the
Elder. Back with the Bridgettine sisters since 1931; recognised as the Swedish national church.
06 68892596; www.brigidine.org.
(`https://www.turismoroma.it/it/luoghi/chiesa-di-santa-brigida`)

**16. Stanze di Santa Brigida** — `museum` — the saint's rooms above the church, entered from
Piazza Farnese 96. OSM node 12504263090, 41.895322,12.470874 → Regola, `tourism=museum`,
`opening_hours=09:15-12:00,13:00-14:30,17:30-19:00`, `description=Si deve richiedere la visita
alla portineria o al telefono`, `contact:website=https://www.brigidine.org/`. Turismo Roma
confirms the rooms are "tuttora visitabili". Worth its own record; the hours are OSM-only, so
flag them.

**17. Santa Maria dell'Orazione e Morte** — Via Giulia 262. 41.894389,12.469611 → Regola.
- Built in the sixteenth century (Turismo Roma) — it.wikipedia's Via Giulia article gives
  1575–76 — for the Compagnia dell'Orazione e della Morte, founded 1538, whose task was the
  Christian burial of abandoned bodies recovered from the Tiber and the Campagna. Rebuilt in the
  first half of the eighteenth century to a design by **Ferdinando Fuga**; the Via Giulia
  article dates the demolition to 1733 and the rebuilding to 1737.
- Eighteenth-century façade with festoons, pilasters, skulls and funerary emblems, and two
  incised plaques: a winged skeleton with *Hodie mihi, cras tibi*, and Death seated with a winged
  hourglass watching a dying man. Oval dome; frescoes by Giovanni Lanfranco of the hermits
  Antony Abbot, Paul of Thebes and Simeon Stylites, previously in Cardinal Farnese's hermitage;
  high altarpiece of Christ on the cross by Ciro Ferri.
- The crypt is what remains of the confraternity's cemetery, largely destroyed for the
  lungotevere in 1886; it was in use until the nineteenth century and took **more than 8,000
  bodies**. Bones and skulls are arranged into crosses, sculptures and chandeliers; some skulls
  are inscribed with year, cause of death and place of recovery.
- **Access, hard-sourced:** "Aperta solo su appuntamento contattando l'Associazione Amici del
  Tevere", 339 5852777 / 339 7448084, associazioneamicideltevere@gmail.com
  (`https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-dellorazione-e-morte`).

**18. Sant'Eligio degli Orefici** — Via di Sant'Eligio 8/A. 41.895670,12.468020 → Regola.
- 1509: Julius II let the Università degli Orafi e degli Argentieri build their own seat off via
  Giulia. They asked **Raffaello** for a small temple to Eligius of Noyon. Building ran 1516–1583
  in its first phase with contributions from Baldassarre Peruzzi and Bastiano da Sangallo; by
  1522 everything but the dome was done, the dome attributed by some to Peruzzi. Repeated Tiber
  flood damage; a structural collapse in 1601 brought down part of Federico Zuccari's 1575 altar
  of the Magi; Flaminio Ponzio restored it and designed the façade **1620–21**.
- Greek-cross plan, hemispherical dome on a round drum on four central piers, lantern with eight
  windows. Frescoes of 1575: *Santissima Trinità* and *Madonna con Bambino e Santi* by Matteo da
  Lecce, *Profeti e Apostoli* by Taddeo Zuccari. The floor was replaced in 1864 with white marble
  and bardiglio salvaged from San Paolo fuori le Mura after the 1823 fire. Silver bust of
  Sant'Eligio holding relics given by the Bishop of Noyon in 1628.
- **Access, hard-sourced:** "Dal lunedì al venerdì, dalle ore 10.00 alle ore 13.00, previa
  prenotazione allo 06.6868260"; www.universitadegliorefici.it/la-chiesa;
  info@universitadegliorefici.it
  (`https://www.turismoroma.it/it/luoghi/chiesa-di-santeligio-degli-orefici`).

**19. Santa Caterina da Siena in via Giulia** — via Giulia. 41.895546,12.468900 → Regola.
The Sienese community's church, still the arciconfraternita's. Sienese merchants and bankers
lived in via Giulia from the fifteenth century; the confraternity was recognised by Leo X in
1519 and the church, oratory and clergy house were entrusted to **Baldassarre Peruzzi in 1526**,
funded by Sienese nobility including Cardinal Giovanni Piccolomini and the banker Agostino Chigi.
Ruined by Tiber floods and rebuilt entirely to a design by **Paolo Posi between 1766 and 1775**,
the year the new altar was consecrated. Façade in the manner of Borromini; Romulus, Remus and
the she-wolf flank the central window, Siena's emblem. Genga's *Resurrezione* altarpiece was
restored for the street's 500th anniversary in 2008.
(`https://it.wikipedia.org/w/index.php?title=Chiesa_di_Santa_Caterina_da_Siena_(Roma)&action=raw`;
via Giulia article section 9)
OSM: `website=https://www.arciconfraternitasantacaterina.it`, `Mo-Sa 17:30-19:00; Su 10:30-12:00`.
- **TRAP, flag hard.** `https://www.turismoroma.it/it/luoghi/chiesa-di-santa-caterina-da-siena`
  is a **different church** — via Populonia 44, a 1971 parish out near via Latina. Do not use it.
  Likewise Wikidata Q3585407 carries the wrong street address ("largo Magnanapoli") while its
  coordinate is correct; Santa Caterina a Magnanapoli is already shipped under Monti.

**20. Spirito Santo dei Napoletani** — Via Giulia 34. 41.896330,12.467830 → Regola.
Historically the national church of the Two Sicilies. Earlier Sant'Aurea *in strada Iulia* with a
convent; given to the Confraternita dello Spirito Santo dei Napoletani in 1572, who levelled it
and built the new church, dedicated **1574**, to a design by Domenico Fontana or possibly
Ottaviano Mascherino. Heavily reworked in the early eighteenth century by Carlo Fontana; Antonio
Cipolla rebuilt the neo-Renaissance façade in **1853** with carved portal and rose window and
Pietro Gagliardi's *Spirito Santo in Gloria*, and rebuilt the cantoria and apse. From 1934 to
1984 it held the bodies of Francesco II of the Two Sicilies, Queen Maria Sofia and their daughter
Maria Cristina Pia, moved that year to Santa Chiara in Naples. Closed for thirty years by water
damage; restored from 1980 under rector Natalino Zagotto, architect Giuseppe D'Emilio.
(`https://it.wikipedia.org/w/index.php?title=Chiesa_dello_Spirito_Santo_dei_Napoletani&action=raw`)

**21. Santi Giovanni Evangelista e Petronio dei Bolognesi** — Via del Mascherone 61.
41.894032,12.470610 → Regola. The Bolognese community formed a confraternity in 1575, recognised
by Gregory XIII in 1576; they built a new church in place of one that had belonged to the Spanish
community. Work began **1582** to a design by Ottaviano Nonni, *il Mascherino*, and finished only
in the mid-seventeenth century; **façade 1696–1700**. Suppressed in 1810 and used as a warehouse;
restored 1873 after the confraternity was re-formed. Greek-cross plan with side chapels and a
dome. Francesco Gessi's *Morte di San Giuseppe* on the right altar; Marcantonio Franceschini's
double-sided processional painting for the 1712 canonisation of Catherine of Bologna on the left.
Domenichino's high altarpiece was requisitioned by Napoleon in 1813 and is now in Palazzo
Barberini. **Hours, hard-sourced:** "Santa Messa si celebra da lunedì a venerdì alle ore 19:00.
La chiesa apre un'ora prima." www.arciconfraternitabolognesi.it.
(`https://www.turismoroma.it/it/luoghi/chiesa-dei-santi-giovanni-evangelista-e-petronio-dei-bolognesi`)

**22. Santissima Trinità dei Pellegrini** — Via dei Pettinari 36/A (Turismo Roma) / Piazza
Trinità dei Pellegrini 1 (OSM). 41.893668,12.472764 → Regola. Stands on the site of the older San
Benedetto de Arenula, which Paul IV gave to San Filippo Neri and his charity in **1558**. The
Arciconfraternita dei Pellegrini e dei Convalescenti began the rebuild at the end of the
sixteenth century; Martino Longhi the Elder first, then from 1603 Giovanni Paolo Maggi;
consecrated **1616**. The tall, slightly concave façade with stucco Evangelists is by **Francesco
De Sanctis**, about a century later. Pseudo-Latin-cross plan, three chapels a side reworked by
Antonio Sarti in 1853. Guido Reni's *Santissima Trinità* altarpiece, **1625**; a marble *San
Matteo e l'Angelo* by Jacob Cobaert and Pompeo Ferrucci; a *Madonna col Bambino e santi* by
Cavalier d'Arpino; and in the left transept the *Auxilium Christianorum* fresco brought from the
outside wall of Palazzo Capranica.
**Hours, hard-sourced:** Mon–Sat 07.15 and 18.30; Sunday 09.00, 11.00 (low Mass in August) and
18.30; 06 68300486; https://roma.fssp.it/ (Fraternity of St Peter).
(`https://www.turismoroma.it/it/luoghi/chiesa-della-santissima-trinit%C3%A0-dei-pellegrini-ai-catinari`)

**23. Ospizio dei Convalescenti e Pellegrini** — `historic-site`, adjoining no. 22 and largely
gone. Built **1625** for that Jubilee, largely demolished **1940**. Over roughly two centuries it
took up to 400,000 people. In 1849 it became a military hospital during the French assault on the
Roman Republic, run by Cristina Trivulzio di Belgiojoso with other Italian patriots and the
American journalist Margaret Fuller Ossoli; it treated more than 1,500 wounded, among them
**Goffredo Mameli, who died there at 21**. Roma Capitale states this in two places
(`https://www.turismoroma.it/it/luoghi/chiesa-della-santissima-trinit%C3%A0-dei-pellegrini-ai-catinari`
and `https://www.turismoroma.it/it/page/rione-vii-regola`). Good candidate for a short record or
a section of no. 22.

**24. San Paolo alla Regola** — Via di San Paolo alla Regola 6 / piazza San Paolo alla Regola.
41.893089,12.473584 → Regola. Rectory of the Third Order Regular of St Francis and seat of a
diaconia. Excavations **1978–1982** found stratified walls on four building levels over a street
line that survives today; the original use from the age of Augustus was warehouses and
river-trades including tent- and sail-making. Tradition holds Paul lodged and wrote here, and a
room inside is shown as his, converted to an oratory and then a church in the fourth century
under Sylvester. Attested from the thirteenth century; rebuilt at the end of the seventeenth by
Giovanni Battista Bergonzoni. A slab of **1096** from the older church survives on the high
altar, and a fourteenth-century *Madonna delle Grazie* nursing fresco. Greek-cross plan under a
dome with four corner chapels.
(`https://it.wikipedia.org/w/index.php?title=Chiesa_di_San_Paolo_alla_Regola&action=raw`)
OSM: `website=https://www.chiesadisanpaoloallaregola.it`, `opening_hours=09:00-12:30,15:00-20:00`.
- **25. The Roman insula beneath it** is a separate visitable-by-arrangement site. it.wikipedia
  has no article; the excavation is described in the church article. Needs a Sovrintendenza
  Capitolina or Soprintendenza source before it can ship. Flag as unresolved.

**26. Santa Maria in Monticelli** — Via di Santa Maria in Monticelli 29. 41.893097,12.474078 →
Regola. Named from a rise in the ground, perhaps rubble, that put it above the Tiber floods.
First recorded in the life of Paschal II, who restored it in **1101**; reconsecrated by Innocent
II in **1143**. Of the medieval church there survive the three-aisle basilica plan and the
Romanesque campanile, plus a fragment of the twelfth-century apse mosaic with the Face of Christ
and a fresco of a holy pontiff in a counter-façade niche. The campanile was cut from seven storeys
to five under Paul V for stability. Wholly rebuilt in **1716** by Matteo Sassi for Clement XI;
given to the Dottrinari under Benedict XIII, still their curia generalizia; restored again in 1860
by Francesco Azzurri, which produced the present look.
(`https://it.wikipedia.org/w/index.php?title=Chiesa_di_Santa_Maria_in_Monticelli&action=raw`)
OSM: `website=https://www.dottrinari.org/`.

**27. San Salvatore in Onda** — Via dei Pettinari 56–58. 41.893418,12.472189 → Regola. Late
eleventh or early twelfth century; first named in a bull of Honorius II of **1127** ("presbiter
Crescentius Salvatoris in Unda"); the name comes from the Tiber floods. Given to the Conventual
Franciscans by Eugene IV in **1445**, and on **14 August 1844** by Gregory XVI to Vincenzo
Pallotti for his new society. Reworked by Luca Carimini, who uncovered the original columns and
capitals. Three aisles on twelve columns; Cesare Mariani's *Madonna col bambino*, **1878**, in
the apse; Vincenzo Pallotti's urn on the high altar; Elisabetta Sanna buried here. Tamburini
organ opus 280, **1949**, 23 stops, two manuals and pedal. Medieval crypt on three small aisles
with a large Corinthian capital serving as altar.
(`https://it.wikipedia.org/w/index.php?title=Chiesa_di_San_Salvatore_in_Onda&action=raw`)
OSM: `opening_hours=08:00-12:00`.

**28. San Salvatore in Campo** — Piazza San Salvatore in Campo. 41.893634,12.473963 → Regola.
An earlier church is attested in the first half of the tenth century as *S. Salvatoris de domno
Campo*, from Campo, an abbot of Farfa; the name is in a bull of Urban III of **1186**. In 1551 the
medieval church was the first seat of Filippo Neri's Trinità dei Pellegrini confraternity. It was
demolished in the seventeenth century for the Palazzo del Monte di Pietà, and Urban VIII had the
present one built in **1639** by Francesco Peparelli on a different site, keeping the name. Now
used by the Eritrean Coptic Orthodox community; restored 2008.
(`https://it.wikipedia.org/w/index.php?title=Chiesa_di_San_Salvatore_in_Campo&action=raw`)

**29. Santa Maria della Quercia** — Piazza della Quercia 27. 41.894554,12.471993 → Regola. On the
site of the medieval San Nicolò de Curte, part of an Orsini courtyard complex. Julius II let
Viterbesi resident in Rome bring the cult of the Madonna della Quercia here; the oak was also the
della Rovere emblem. Many of those Viterbesi were butchers, and the butchers' corporation made
the church its confraternity seat. Rebuilt from scratch in the early eighteenth century by
**Filippo Raguzzini**, continued by **Domenico Gregorini**; bowed Rococo façade. The square was
merged with piazza Capo di Ferro in the early twentieth century by demolishing a whole block.
Greek-cross plan with dome and three chapels; marble revetments and frescoes from nineteenth-
century restorations; the Università dei Macellari's emblems frame the altar image and appear on
the metal balustrade. Still the church of Rome's butchers, who hold an annual feast in front of it
and in piazza Capo di Ferro. www.confraternitamacellairoma.org; 06 6865196.
(`https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-della-quercia`)

**30. Santa Maria del Pianto** — Via di Santa Maria de' Calderari 29. 41.893100,12.476470 →
Regola. In 1546 an image of the Virgin frescoed on a wall of the Portico d'Ottavia was said to
have wept at a murder committed in front of it; the fresco was detached and moved to the nearby
Santissimo Salvatore de Caccabariis. A confraternity took the name S. Maria del Pianto and began
the church in **1612** to a design by **Niccolò Sebregondi (1580–1652)**, left unfinished.
Greek-cross interior on pilasters; standard with the *Miracolo dell'immagine piangente* and a
*Vergine in gloria* by **Lazzaro Baldi (1624–1703)**, whose *Madonna e Santi* is in the right
crossing; the venerated fifteenth-century *Madonna del Pianto* fresco on the high altar.
06 6861796. (`https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-del-pianto`)

**31. San Tommaso ai Cenci** — Monte de' Cenci. **STRADDLER, §3.6.** 41.892400,12.476310 →
Regola. Built into Palazzo Cenci; medieval title *in capite molarum* from the mills on the bank;
also *San Tommaso Fraternitatis* as a seat of the Romana Fraternitas; renamed from the Cenci
palace from the fifteenth century. The Roman funerary inscription of *Marcus Cincius Theophilus*
is set between the two façade doors, walled there by the Cenci for the name. Rectangular
interior; the high altar holds a roundel of blue murra (iolite); first left chapel, *Storie della
Vergine* by Girolamo Siciolante da Sermoneta, **1585**. Formerly the Confraternita dei Vetturini's,
who had a Mass said each **11 September** for Beatrice and Giacomo Cenci; now a rectory of the
SS. Biagio e Carlo ai Catinari parish.
(`https://it.wikipedia.org/w/index.php?title=Chiesa_di_San_Tommaso_ai_Cenci&action=raw`)
OSM: `website=https://www.amorefamiliare.it/chiesa-san-tommaso-ai-cenci/`.
- **BANNED:** it.wikipedia's "l'unica che si conosca in Roma" about the murra roundel.

**32. Santa Lucia del Gonfalone** — Via dei Banchi Vecchi 12. **STRADDLER, §3.3.**
41.897640,12.467410 → Regola. Attested between the late twelfth and early thirteenth century;
entrusted in the sixteenth century to the Arciconfraternita del Gonfalone, which restored it in
1511 and 1603. Rebuilt in late-Baroque form by **Marco David between 1761 and 1764**; the present
appearance is the complete nineteenth-century rebuild by **Francesco Azzurri** with decoration by
**Cesare Mariani, 1863–1867**, under Pius IX. Two-order façade; single nave, three chapels a side;
sixteenth-century *Madonna del Gonfalone* panel and wooden crucifix over the high altar, which
Giuseppe Rinaldi built about the mid-nineteenth century and which holds a copy of the *Salus
Populi Romani* traditionally given to Livio Agresti. Pipe organ by **Nicola Morettini, 1882**.
www.santaluciagonfalone.it; 06 68193368.
(`https://www.turismoroma.it/it/luoghi/chiesa-di-santa-lucia-del-gonfalone`)

**33. San Filippo Neri in via Giulia** — Via Giulia 134/B. 41.897077,12.467463 → Regola.
Deconsecrated and **not visitable**; restored in 2000 but in secular use. Built for Rutilio
Brandi, a glove-maker from San Gimignano who, having gout, had it dedicated to San Trofimo,
protector of the gouty; the dedication later shifted to Filippo Neri. In 1797, when the French
demanded money from the pope under the Treaty of Tolentino, this was the one church in Rome to
keep its silver reliquary, its rector refusing to hand it over. Nearly all the buildings around
it were demolished from 1938; the church survived only because the war stopped the works.
Three-bay, two-storey façade by Fiori with a giant Ionic order; architrave inscribed
*DEO.IN.HONOREM.S.PHILIPPI.NERII.DICATUM*; single nave of three bays whose central axis is not
perpendicular to the façade.
(`https://it.wikipedia.org/w/index.php?title=Chiesa_di_San_Filippo_Neri_(Roma)&action=raw`)
- Any page must say it cannot be entered, not that it "could not be visited during research".

**34. San Giovanni in Ayno** — junction of via di Monserrato and piazza de' Ricci.
41.896639,12.468750 → Regola. Ex-church. First cited in a document of Urban III of **1186** among
the daughter churches of San Lorenzo in Damaso; in the Cencio Camerario catalogue as *sancto
Johanni in Agina*. Three competing explanations of the name are on record — a founding family
(Nibby), a popular corruption of *agnus* (Armellini), and the Semitic *ain*, spring (Rendina) —
and a page should give them as three explanations, not pick one. Parish of about 40 families and
300 people in 1566, about 60 families in 1660, about 30 in 1697. The portal architrave records
the rebuilding at the expense of Giusto Bonanni of San Gimignano.
(`https://it.wikipedia.org/w/index.php?title=Chiesa_di_San_Giovanni_in_Ayno&action=raw`)

**Thin or gone, listed for completeness, probably not shippable:** Santa Teresa a Monserrato,
Santi Teresa e Giovanni della Croce dei Carmelitani, San Nicola degli Incoronati, San Bartolomeo
dei Vaccinari, Santa Maria dei Calderari, San Benedetto in Arenula, Sant'Andrea de Azanesi, San
Martino ai Pelamantelli, Santi Vincenzo e Anastasio alla Regola, San Francesco d'Assisi a Ponte
Sisto — all in the same it.wikipedia category, all demolished. San Francesco d'Assisi a Ponte
Sisto is worth a sentence inside the Santa Caterina della Rota record, since its ceiling is there.

### 4.3 Palaces and civic buildings (all `historic-site`)

**35. Palazzo Falconieri** — Via Giulia 1. 41.894609,12.469326 → Regola.
- Built for the Ceci family from about 1515; sold by them in 1574 to the Odescalchi, in 1606 to
  the Farnese, and in **1638 to Orazio Falconieri for 16,000 scudi**. Turismo Roma dates the
  building itself to 1576 under the Odescalchi; it.wikipedia says the Ceci built it from c.1515
  — **flag the conflict**, both are sourced.
- **Borromini enlarged it 1646–1649**, taking it from eight window-bays to eleven and adding a
  matching blind portal with the Falconieri falcon. Two colossal herms with female busts and
  falcon heads at the façade ends. Three-arched loggia on the river side, 1646, with a balustrade
  of double-faced herms. Roman river-port remains survive under the building (Turismo Roma).
- Napoleon's mother Maria Letizia Ramolino lived here 1815–1818, her half-brother Cardinal Fesch
  being the resident.
- Sold to the Medici del Vascello when the Falconieri died out in 1865; altered on the river side
  in 1890 for the lungotevere; bought by Vilmos Frankoi, ceded to the Hungarian state in 1927;
  the **Accademia d'Ungheria** has been here since 1928 (it.wikipedia says founded 1927, Turismo
  Roma says seated from 1928 — flag). Library of over 20,000 volumes; Hungarian language courses.
- **Hours, hard-sourced:** "Aperto dal lunedì al sabato ore 9.30-19.30"; 06 68896700;
  https://culture.hu/it/roma (`https://www.turismoroma.it/it/luoghi/palazzo-falconieri`).
  OSM tags the same node `arts_centre`, `Accademia d'Ungheria in Roma`, Via Giulia 1.

**36. Palazzo Ricci (Ricci Paracciani)** — Piazza de' Ricci 132–140, second façade Via Giulia 146.
41.896528,12.468528 → Regola. Built in the early sixteenth century for the Calcagni, Tuscan
nobles in Rome from the late fifteenth. The painted façade on piazza de' Ricci is attributed to
**Polidoro da Caravaggio, about 1525**, with Maturino da Firenze; the ground-floor scenes are the
*Storia di Muzio Scevola*. Sold by the Del Bene in 1533 to Fabio Arcella; 1542 to Luigi Gaddi and
then Costanza Farnese, who lived there and enlarged it; on her death in 1545 to her son Cardinal
Guido Ascanio Sforza; bought **1577 by Giulio Ricci**, who moved here from Palazzo Sacchetti on
the same street. Via Giulia and vicolo di S. Aurea façades built **1634**. Late-nineteenth-century
repainting by Luigi Fontana (1827–1908) was removed in recent restorations except on the attic.
Turismo Roma calls the piazza Ricci front "l'unico esempio di facciata a gomito presente a Roma"
— **BANNED, an "only" claim**; describe the bent-corner façade without the ranking. Mario Praz
lived here; Monsignor Della Casa wrote the *Galateo* here about 1555 (Turismo Roma). A stucco
canopy at the via di Sant'Aurea corner shelters a seventeenth-century oil *Madonna dell'Orazione*.
(`https://www.turismoroma.it/it/luoghi/palazzo-ricci`;
`https://it.wikipedia.org/w/index.php?title=Palazzo_Ricci_(Roma)&action=raw`)
- **Flag:** Turismo Roma's info block carries two POINTs for this palace, one of them
  (41.901459) plainly wrong. Wikidata gives Piazza de' Ricci 129. Use the Via Giulia 146 /
  Piazza de' Ricci 132–140 pair from the Location block.

**37. Palazzo Fusconi Pighini / Palazzo del Gallo di Roccagiovine** — Piazza Farnese 44.
41.895333,12.471778 → Regola. Built about **1524 by Baldassarre Peruzzi** — the portal is
certainly his — for Francesco Fusconi of Norcia, papal physician to Clement VII and Paul III;
long misattributed to Vignola. Inherited about 1554 by Adriano Fusconi, bishop of Aquino, then to
the Pighini. Enlarged in the early eighteenth century by Alessandro Pighini to a design by
**Alessandro Specchi**. The Pighini kept an antiquities collection here including a *Meleager*
with the boar, a Roman copy after Skopas, now in the Museo Pio Clementino. Passed to the Curti
Lepri, then by dowry to the Del Gallo di Roccagiovine, whose descendants still live in it;
Giulia Bonaparte's literary salon met here.
(`https://it.wikipedia.org/w/index.php?title=Palazzo_Fusconi_Pighini&action=raw`)

**38. Palazzo dell'Ordine Teutonico** — Via del Mascherone 57, at the vicolo dei Venti corner.
41.894472,12.471111 → Regola. Baroque. Via del Mascherone separates it from Palazzo Farnese.
Rusticated arched Baroque portal with the original bossed wooden doors; an image of the Virgin
above it stands where the Teutonic Order's arms were until the eighteenth century; fourteen
windows on the two upper floors, stucco-framed on the first; rusticated quoin at the vicolo dei
Venti corner with a second Virgin at first-floor level. Appears in Vasi's 1748 engraving of
piazza Farnese. (`https://it.wikipedia.org/w/index.php?title=Palazzo_dell%27Ordine_Teutonico&action=raw`)

**39. Palazzo Cenci and Palazzetto Cenci** — Monte de' Cenci 17-20-21 / via Beatrice Cenci /
piazza Cenci. 41.892787,12.475376 → Regola. Most of the medieval palace was demolished; the
present building dates to **1570**. A medieval arch links it to the Palazzetto Cenci, designed by
**Martino Longhi the Elder**. Courtyard with an Ionic loggia; sixteenth-century room decoration;
plain flat-rusticated façade with a wide architraved portal joined to a seventeenth-century wing
of the same family complex. In the late Middle Ages the area was called *Campus Iudaeorum*, and
housed many Roman Jews who moved here from Trastevere after the 1268 fire that destroyed the old
synagogue. **Access, hard-sourced:** "Il palazzo è chiuso al pubblico ed è visibile solo
dall'esterno." (`https://www.turismoroma.it/it/luoghi/palazzo-cenci`)
- Beatrice Cenci, accused with her brothers and stepmother of her father's murder, was beheaded
  at Ponte Sant'Angelo in **1599** (same page). Roma Capitale's own rione page leads with this
  palace (`https://www.turismoroma.it/it/page/rione-vii-regola`).

**40. Palazzo del Monte di Pietà and the Arco del Monte** — Piazza del Monte di Pietà 32.
41.893944,12.473694 → Regola. Building periods **1588–1740**; the it.wikipedia infobox lists the
architects in sequence: il Mascherino 1588, Maderno with Borromini as collaborator 1630, Breccioli
1637, Peparelli 1639, De Rossi 1680, Salvi 1740. Owner today: Credito su Pegno S.p.A.
- The institution: Paul III approved the founding congregation in **1539**; Carlo Borromeo wrote
  its first rules. First seat at Banchi Vecchi near Santa Lucia del Gonfalone; in 1585 Sixtus V
  bought a building at the Coronari (hence vicolo and piazza di Monte Vecchio); then here.
  From 1584 Gregory XIII made it the deposit bank for civil judgements and for wards' and widows'
  property. From **1611** Paul V allowed agricultural lending up to 2,000 scudi. Its *cedole* were
  declared payable to bearer from **1724** and circulated as a kind of paper money. It ran the
  papal mint from **1749**. About a hundred staff in 1835. Split from the charitable function came
  with the Cassa di Risparmio di Roma in **1836**. Guarded by a Swiss detachment; small pledges up
  to 4 scudi were taken through *rigattieri* around the city.
  (`https://it.wikipedia.org/w/index.php?title=Monte_di_Pietà_(Roma)&action=raw` — note the
  it.wikipedia article is flagged incomplete from 1798 onward, so do not push the story past 1836.)

**41. Palazzo Barberini ai Giubbonari (Casa Grande Barberini)** — Via dell'Arco del Monte 99, with
frontage on via dei Giubbonari and piazza del Monte di Pietà. 41.894500,12.473300 → Regola;
**see §3.9 for the Giubbonari frontage**. The Barberini family's first Roman house; assembled over
**1581–1658** and four generations by buying up neighbouring houses, starting with a house with
four ground-floor shops bought from the Scapucci family on **15 June 1581** by Monsignor Francesco
Barberini (1528–1600). It stayed Taddeo Barberini's residence, Prince of Palestrina, until his
flight to France, and Barberini property until the 1730s, when they sold it to the Discalced
Carmelites for their curia; later to the Monte di Pietà; now owned by the Comune di Roma and
housing schools including the Liceo Vittoria Colonna.
(`https://it.wikipedia.org/w/index.php?title=Palazzo_Barberini_ai_Giubbonari&action=raw`)

**42. Palazzo Santacroce (Pasolini dall'Onda)** — between Piazza Benedetto Cairoli, via degli
Specchi and vicolo de' Catinari. 41.893951,12.475001 → Regola; OSM relation 1726905
`building=palace`. Onofrio Santacroce commissioned it in the late sixteenth century; **Carlo
Maderno** drew the design, taken up between **1630 and 1640 by Francesco Peparelli**; about 1670
**Giovanni Antonio De Rossi** unified the family's houses into one body with a loggia. Three
decorated façades; the fourth, on the narrow vicolo dei Catinari, is plain. Three storeys plus a
mezzanine between first and second; façades restored in the nineteenth century.
(`https://it.wikipedia.org/w/index.php?title=Palazzo_Santacroce&action=raw`; Roma Capitale's own
rione article cites `https://www.turismoroma.it/it/luoghi/palazzo-santacroce-pasolini-dall%E2%80%99onda`
but that URL 404s from here, so use the Wikipedia text.) it.wikipedia elsewhere dates the fabric
1598–1602 and credits Maderno.

**43. Palazzo Cisterna** — Via Giulia 163. 41.895339,12.469012 → Regola. Built in the second half
of the sixteenth century to the commission and design of the sculptor **Guglielmo Della Porta**,
who lived in it until his death in 1577. Bought in 1909 by the painter **Eugenio Cisterna**, who
decorated interiors and lived there; partly acquired after his death by the Ducci family, who
still own it; the Fondazione Paolo Francesco e Annamaria Ducci has been based here since 1998.
Painted coffered ceilings, walls frescoed with grotesques and incorporating Roman fragments; a
Roman cistern survives in the former stable basement.
(`https://it.wikipedia.org/w/index.php?title=Palazzo_Cisterna_(Roma)&action=raw`)

**44. Palazzo Baldoca-Muccioli** — Via Giulia 167. Sixteenth century (1570). History tied to
Palazzo Cisterna and probably by the same hand; passed to the Baldoca then the Muccioli. In the
early twentieth century it was the residence of the British ambassador **Lord Rennell of Rodd**,
who bought it and restored it in **1928**. (it.wikipedia Via Giulia, section 7.) No article of its
own, no Wikidata coordinate — a verifier will need to establish the point; Via Giulia 167 sits
between the Falconieri and Ricci stretches, i.e. Regola.

**45. Palazzo Varese** — Via Giulia 14–21, opposite Santa Caterina da Siena. Built **1616–18** to a
design by **Carlo Maderno** (it.wikipedia Regola article; Via Giulia section 10). No standalone
article; needs a coordinate check.

**46. Palazzo Incoronati (Incoronati de Planca)** — Via di Monserrato 152. 41.897028,12.468361 →
Regola. Mannerist; built early sixteenth century for the Incoronati de Planca, a family from the
Kingdom of Spain settled in Rome from the previous century. Passed in 1569 to G. B. Doni, a cleric
of the papal court, then to the Sacripante and Luparini.
(`https://it.wikipedia.org/w/index.php?title=Palazzo_Incoronati&action=raw`)

**47. Palazzo Alibrandi Cavalieri (Palazzetto Alibrandi)** — Piazza del Monte di Pietà, at the via
degli Specchi corner, also fronting via dei Pompieri. 41.894056,12.473944 → Regola. Alibrandi
property, sold to the Cavalieri in the early nineteenth century. Wide portal under a family
shield and a first-floor balcony, flanked by shops and mezzanine windows; two floors above the
mezzanine plus a **1930s added storey**. Appears in Vasi's 1759 engraving of the piazza del Monte
and on the Nolli map. (`https://it.wikipedia.org/w/index.php?title=Palazzo_Alibrandi_Cavalieri&action=raw`)
Thin; borderline shippable.

**48. Palazzo Piacentini / Ministero della Giustizia** — Via Arenula 70. 41.892528,12.474667 →
Regola. Designed by **Pio Piacentini in 1913** for the then Ministero di Giustizia e Culti, in a
late-fifteenth-century Renaissance classicism with diamond-point rustication. Excavation and
foundations began **1914**, halted by the First World War; the ministry moved in from Palazzo
Firenze in **1920**; the building was finished in **1924** and the rear wing raised in **1932**.
Not to be confused with the Palazzo Piacentini on via Veneto.
(`https://it.wikipedia.org/w/index.php?title=Palazzo_Piacentini_(via_Arenula)&action=raw`)

**49. Carceri Nuove** — Via Giulia 52. 41.897222,12.466944 → Regola; it.wikipedia
`[[Categoria:Roma R. VII Regola]]` and states the rione outright, with vicolo delle prigioni to
the south and vicolo della scimia to the north — which is exactly where the Ponte border runs, so
this is the northernmost thing Regola gets on via Giulia.
- Built **1652–1655** for Innocent X by **Antonio Del Grande**, to a detailed programme by Virgilio
  Spada, replacing Tor di Nona in Ponte, Corte Savella in Regola and the Borgo prison. Before it
  opened it was used during the **1656 plague** as a *stufa* for people quarantined at San
  Pancrazio and Sant'Eusebio. Prisoners were attended by the archconfraternities of San Giovanni
  della Pigna, the Assunta al Gesù and San Girolamo della Carità. Until Leo XII (1823–1829) it had
  rooms for clergy, afterwards held in Castel Sant'Angelo. A large kitchen was built on the ground
  floor in **1824** and the women's prison extended to the second floor. **In 1842 it held 600 men
  and 80 women.** In **1931** it became the seat of the Centro di studi penitenziari and the Museo
  Criminologico. In service until Regina Coeli was built in the early twentieth century. Now the
  Direzione nazionale antimafia e antiterrorismo.
  (`https://it.wikipedia.org/w/index.php?title=Carceri_Nuove_(Roma)&action=raw`)
- **BANNED:** "considerato sino al '700 un modello di prigione umanitaria" is an evaluative
  ranking; the publishable residue is Innocent X's stated motive and the dates.

**50. Collegio Ghislieri façade, now the Liceo Classico Virgilio** — Via Giulia 38.
41.896556,12.467778 → Regola; it.wikipedia `[[Categoria:Roma R. VII Regola]]`. The college was
founded **1656** by Giuseppe Ghislieri to house 24 sons of decayed papal nobility free during
their studies; under the protection of the Salviati dukes; moved to via Giulia in **1670**; closed
**1928**. The building, possibly by **Carlo Maderno**, was demolished in the 1930s; its via Giulia
façade and some decoration survive, absorbed into the Liceo Classico Virgilio, built on the site
**1936–1939** to a design by **Marcello Piacentini**.
(`https://it.wikipedia.org/w/index.php?title=Collegio_Ghislieri_(Roma)&action=raw`)

**51. Palazzo dei Tribunali (remains)** — **STRADDLER, §3.2.** Bramante's design for Julius II,
about **1506**, to gather Rome's civil, ecclesiastical and criminal courts in one seat; site chosen
between via del Gonfalone and vicolo del Cefalo, fronting via Giulia. Begun about **1508**, halted
by **1511**, abandoned after pope and architect died; private buildings went up on the plinth,
which is still visible in stretches. The design is known from a sketch by Fra' Giocondo and a
Peruzzi drawing (Uffizi 109 A) and evolved from the Palazzo Caprini type.
(`https://it.wikipedia.org/w/index.php?title=Palazzo_dei_Tribunali_(Roma)&action=raw`)

**52. Locanda del Gallo (Albergo della Vacca)** — corner of vicolo del Gallo and via dei
Cappellari. 41.895778,12.471417 → Regola; it.wikipedia `[[Categoria:Roma R. VII Regola]]`.
Acquired in the fifteenth century by **Vannozza Cattanei**, mother of Lucrezia, Cesare, Giovanni
and Goffredo Borgia; her family arms are still on the building, on vicolo del Gallo. There is also
a Madonna dell'Immacolata at the via dei Cappellari corner.
(`https://it.wikipedia.org/w/index.php?title=Locanda_del_Gallo&action=raw`)
- **BANNED:** "Probabilmente l'edificio più famoso di Campo dei Fiori". Also note the article
  says the children were "tutti nati sul posto" — that is contested biography; a verifier should
  soften or drop it. And Campo de' Fiori itself is Parione's.

**53. École française de Rome** — Piazza Farnese 67, inside Palazzo Farnese; its library occupies
the palace's second and third floors. 41.895012,12.470723 (OSM library node) → Regola;
it.wikipedia `[[Categoria:Roma R. VII Regola]]`. Housed here since **1875**. The library can be
seen on the Friday 17.00 Palazzo Farnese + École française tour, €22
(`https://visite-palazzofarnese.it/prodotto/visita-guidata-palazzo-farnese/`;
`https://www.efrome.it/bibliotheque`). Not accessible to disabled visitors, per the same page.

**54. Palazzo Capponi Antonelli** — OSM node 6484135186, 41.896229,12.469056, `tourism=attraction`,
via di Monserrato. **No Wikipedia article, no Turismo Roma page.** Listed so a verifier can decide;
I would not ship it without a source.

**55. Scuderie di Augusto** — largo Lorenzo Perosi, at the corner of via Giulia and via della
Moretta, under lungotevere dei Tebaldi. OSM node 3761053209, 41.896850,12.466731 → Regola;
it.wikipedia states "nel VII rione Regola". Found **2009** during archaeological clearance for a
366-space underground car park; parallel walls and travertine pier bases identify the *stabula* of
the Circus Flaminius, of the Augustan period and Agrippa's, in use to at least the fourth century.
Museum display was planned in 2011 and shelved in 2014 for lack of funds; the excavation was
reburied under more than 7,000 m² of sampietrini, and a Consiglio di Stato opinion of September
2018 cleared the way for a garden over the car park. **Visitabile: No** — the it.wikipedia infobox
says so explicitly, and any page must say the site is buried, not that it "could not be reached".
(`https://it.wikipedia.org/w/index.php?title=Scuderie_di_Augusto&action=raw`)

### 4.4 Streets, squares, bridges and water

**56. Via di Monserrato** — the spine of the northern half of the rione; Palazzo Incoronati 152,
Chez Dédé 35, San Tommaso di Canterbury 45, the English College, Santa Maria in Monserrato 115.
No it.wikipedia article. Roma Capitale's Piazza Farnese page calls it the most important of the
eight streets running into piazza Farnese — **BANNED as phrased**; say it is one of eight and
name it.

**57. Via dei Giubbonari** — **STRADDLER, §3.9.** Roma Capitale calls it "una tra le più amate vie
dello shopping di Roma" (`https://www.turismoroma.it/it/page/rione-vii-regola`) — **BANNED**;
publishable residue is that it is a shopping street and that Roma Capitale's own boundary text
names it as the rione limit.

**58. Piazza Benedetto Cairoli** — **STRADDLER, §3.4.** Named for Benedetto Cairoli (1825–1889),
who fought at the Cinque Giornate di Milano, Custoza, Varese, Calatafimi and Mentana, was
Garibaldi's aide in the Thousand, deputy for Pavia for thirty years, then prime minister and
minister of foreign affairs and of agriculture. Formerly also called Tagliacozza, from houses of
Isabella Orsini, lady of Tagliacozzo. Enlarged repeatedly, above all when via Arenula was cut at
the end of the nineteenth century. Cairoli lived at no. 113 of the square later named for him
(`https://www.turismoroma.it/it/page/rione-vii-regola`;
`https://www.turismoroma.it/it/luoghi/piazza-benedetto-cairoli`).
- **Monumento a Federico Seismit-Doda** on the same square: bronze by **Eugenio Maccagnani**, made
  **1905–06**, placed here **1919** (it.wikipedia Regola article). OSM node 4208626021.

**59. Piazza della Quercia and Piazza Capo di Ferro** — merged in the early twentieth century by
demolishing a block between them (Turismo Roma, Santa Maria della Quercia). Neither has its own
article; treat as context inside nos. 2, 3 and 29.

**60. Fontana di piazza delle Cinque Scole (Fontana del Pianto)** — **STRADDLER, §3.5.**
41.892765,12.476395 (OSM way 125375042) → Regola. Designed by **Giacomo Della Porta in 1591** and
built by Pietro Gucci over the next two years for piazza Giudia, using white marble from the
Temple of Serapis on the Quirinal, after the Acqua Felice branch of **1587** finally brought water
towards the Tiber Island and the ghetto, which had had none since 1555. The Fontana delle
Tartarughe had been intended for piazza Giudia in 1581 but Muzio Mattei got it moved in front of
his own palace. **Definitively placed in its present square in 1930.**
(`https://it.wikipedia.org/w/index.php?title=Fontana_di_piazza_delle_Cinque_Scole&action=raw`)

**61. Fontana di Palazzo Spada** — OSM way 551344880, 41.894353,12.472103 → Regola,
`fountain=sarcophacus`, `drinking_water=no`. No Wikipedia article. A verifier will need a
Sovrintendenza source; the OSM Commons file names it "Fountain at Palazzo Ossoli", so the
attribution is unsettled. **Low confidence.**

**62. Ponte Garibaldi** — **STRADDLER, §3.7.** Built **1884–1888** by the architect Vescovali; the
first bridge built in Rome after unification; **121 m by 23 m**; restored 1953–1956 by Giulio
Krall, who widened the two original metal spans and rebuilt them in reinforced concrete, giving
the present two segmental arches. The Renella beach and its bathing establishments were on the
left bank near it. Roma Capitale states the bridge "unisce il rione Regola a Trastevere".
(`https://www.turismoroma.it/it/luoghi/ponte-garibaldi`)
- **BANNED:** "All'epoca era il terzo per larghezza nella classifica mondiale" — a ranking. The
  dimensions are fine on their own.

**63. Ponte Giuseppe Mazzini** — **STRADDLER, §3.8.** it.wikipedia dual-categorises Regola +
Trastevere; centroid tests Trastevere. Flagged only.

**64. Lungotevere dei Tebaldi** and **65. Lungotevere dei Vallati** — both test Regola
(41.894856,12.468598 and 41.891866,12.472724) and both are named in Roma Capitale's boundary text
as the rione's river edge. Thin as places; better as context for the 1873–1888 embankment story
that reshaped the rione (it.wikipedia Regola: "La costruzione dei muraglioni del Tevere del 1875
cambiò radicalmente il volto del rione").

**66. Monte de' Cenci** — the small rise carrying Palazzo Cenci, San Tommaso ai Cenci and
Ristorante Piperno. Named in Roma Capitale's street list for the rione.

### 4.5 Eating, drinking, sleeping, shopping

All coordinates below come from the Overpass bbox dump and were tested against the Regola
polygon; all returned Regola. Where I fetched the business's own site I say so; where the only
source is OSM I say so, and OSM is not a publishable source for hours on its own.

`restaurant` unless marked.

**67. Salumeria Roscioli** — Via dei Giubbonari 21. 41.894220,12.474260. **§3.9 straddler.**
Own site `https://www.salumeriaroscioli.com/` reachable but JS-heavy; OSM has
`Mo-Sa 09:00-24:00`. Verify hours from the site before publishing.
**68. Roscioli Caffè Pasticceria** — `cafe` — Piazza Benedetto Cairoli 16. 41.894153,12.474433.
**Own site states, publishable:** "Piazza Benedetto Cairoli, 16 · +39 06 89165330 ·
info@rosciolicaffe.com · sala interna prenotabile · lun-sab 7:00-18:00, dom 8:00-18:00"
(`https://www.rosciolicaffe.com/`). Note OSM says Mo-Sa 07:00-21:00 — **the site wins.**
**69. Rimessa Roscioli** — Via del Conservatorio 58. 41.892778,12.472936, OSM `wine`/`restaurant`,
`Mo-Su 18:30-23:30`.
**70. Pierluigi** — Piazza de' Ricci 144. 41.896719,12.468535. OSM `Mo-Su 12:00-15:00,
19:00-23:30`.
**71. Per Me Giulio Terrinoni** — Vicolo del Malpasso 9. 41.897326,12.467532. Own site
`https://www.giulioterrinoni.it/`, whose page title reads "Fine Dining Restaurant in the heart of
Rome – 1* Star • MICHELIN Guide Italia 2024". **The Michelin star is an award and the roster's
evidence rule says a business's own site does not establish awards.** If it is to be mentioned,
cite the Michelin Guide itself; otherwise omit. OSM `Mo-Su 12:30-15:00, 19:00-22:30`.
**72. Osteria La Quercia** — Piazza della Quercia 23. 41.894552,12.471689. Own site
`http://www.osterialaquercia.com/` reachable. OSM `Mo-Su 12:00-23:00`.
**73. Camponeschi** — Piazza Farnese. 41.894849,12.471562. OSM `Mo-Sa 15:45-23:45`. A second OSM
node tags a `bar` of the same name.
**74. Ristorante Piperno** — Monte de' Cenci 9. 41.892322,12.476086.
**75. Ristorante Al Pompiere** — Via di Santa Maria de' Calderari 38 (and a second OSM node at
Piazza delle Cinque Scole 28). **§3.12 straddler.** 41.893086,12.476310. Its own site places it
"al piano terra dello storico Palazzo di Beatrice Cenci" and says "gestito dal 1928"
(`https://www.alpompiereroma.com/`). **The 1928 date is a trading-longevity claim, which the
roster says an official site does NOT establish — do not publish it.** The Palazzo Cenci location
is fine and matches the geometry. OSM `Mo, We-Sa 12:30-15:00, 19:00-23:00; Su 12:30-15:30; Tu off`.
**76. Sora Margherita** — Piazza delle Cinque Scole 30. **§3.12 straddler.** 41.892985,12.476490.
Own site (`https://www.soramargherita.com`) states lunch only, 12:30–15:30, every day, booking
advised on 06 6874216, and describes itself as on the Regola/Sant'Angelo border. **"Dal 1927"
also unpublishable** on the same rule. OSM disagrees with the site on evening service — the site
wins, and the site's text is a COVID-era notice, so a verifier should re-read it.
**77. Beppe e i suoi formaggi** — Via di Santa Maria del Pianto 9a/11. **§3.11 straddler.**
41.893322,12.476432. `http://beppeeisuoiformaggi.it`; OSM `Mo-Sa 09:00-23:00`.
**78. Da Sergio** — Vicolo delle Grotte 27. 41.894096,12.472305. OSM only.
**79. L'Angolo Divino** — `cafe`/wine bar — Via dei Balestrari 12. 41.894681,12.472205. OSM only.
**80. Open Baladin** — `brewery` (schema allows it; it is a craft-beer bar) — Via degli Specchi 6.
41.893572,12.474438. `https://www.baladin.it/it/i-locali/open-baladin-roma`; OSM
`Mo-We 12:00-15:00,17:00-01:00, Th 12:00-01:00, Fr,Sa 12:00-02:00, Su 12:00-01:00`.
**81. Giulia Restaurant** — Lungotevere dei Tebaldi 4/a. 41.893430,12.470566.
`https://www.giuliarestaurant.it/`; OSM `We-Mo 18:00-02:00; Tu off`.
**82. Giulietta Vino e Cucina** — Via Giulia 169. 41.895019,12.469322.
`https://www.giuliettavinoecucina.com/`.
**83. Piano Strada Laboratorio di Cucina** — Via delle Zoccolette 22. 41.892977,12.471998.
**84. Sensus** — Vicolo del Giglio 22. 41.894710,12.472136. `http://www.sensusrestaurant.com`.
**85. Santa Maria Bistrot** — Via Arenula 20. 41.893514,12.475746.
`https://santamariabistrot.com/`; OSM `Mo-Th 07:00-02:00; Sa-Su 11:00-02:00`.
**86. Myto** — Via Arenula 48–49. 41.892269,12.474923. OSM `We-Mo 12:00-15:30,19:00-24:00`.
**87. Alberto Pica** — `cafe`/gelateria — Via della Seggiola 12. 41.893047,12.474856.
**88. Punto Gelato** — Via dei Pettinari 43. 41.892895,12.471657. `http://www.puntogelato.info`.
**89. Assunta Madre** — Via Giulia 14. 41.895483,12.468754.
**90. Voglia di Pizza** — Via dei Giubbonari 33. **§3.9.** 41.894413,12.473676.
**91. Trattoria Settimio / La Locanda del Pellegrino / Osteria dei Cappellari / La Moretta
Trattoria / Maccarone il Pastificio** — all on via del Pellegrino or via dei Cappellari.
**§3.10 straddlers, one line each at most.**

`hotel` / `bnb`:
**92. Hotel Ponte Sisto** — Via dei Pettinari 64. 41.893269,12.471882. OSM way 220585377.
**93. Chapter Roma** — Via di Santa Maria de' Calderari 47. 41.893112,12.475813. **Its own site
places itself in the rione: "Find us behind an old door in a narrow side street of Regola"**
(`https://www.chapter-roma.com/`) — useful corroboration for the arbitrator.
**94. D.O.M Hotel** — Via Giulia 131. 41.897385,12.467198. Own site `https://domhotelroma.com/`
states it is a five-star property. Shares a footprint with the OSM `Palazzo dei Tribunali`
building — **see §3.2**.
**95. Casa di Santa Brigida** — Piazza Farnese 96. 41.895305,12.470619. Guesthouse run by the
Bridgettines in the Santa Brigida complex; own site `https://www.casabrigidaroma.it/` confirms
the address. Same complex as nos. 15 and 16, so the three records must not repeat each other.
**96. Monte Cenci** — Via Beatrice Cenci 10. 41.892273,12.475677. `https://montecenci.com/`.
Also in the polygon but thinner: Arenula Suites (Via Arenula 41), Locanda Cairoli, Claudia Rooms
(Via Arenula 29), Alla Renella Guesthouse, B&B Giubbonari (Via dei Giubbonari 23) — all `bnb`,
all OSM-only, listed so the verifier can see the whole set.

`theater` / `shop`:
- **Off/Off Theatre** — Via Giulia 19. 41.895685,12.468575. `https://off-offtheatre.com/`;
  artistic direction Silvano Spada; the site carries the 2025/26 programme and a box office page.
  A real, publishable `theater` record.
- **Chez Dédé** — Via di Monserrato 35. 41.896166,12.469283. `https://www.chezdede.com/`;
  OSM `Mo 15:00-19:30, Tu-Sa 10:30-19:30`.
- **Biblioteca Centrale Ragazzi** — 41.893222,12.473120, Biblioteche di Roma,
  `https://www.bibliotechediroma.it/opac/library/Biblioteca%20Centrale%20Ragazzi/RMBBR`,
  OSM `Tu,Th 10:00-18:00`. A civic children's library; `attraction` at best, probably skip.
- Thinner shops in the polygon: NaturaSì (Piazza Farnese 99/100), Antica Pasticceria Mariani,
  I Dolci di Nonna Vincenza (Via dell'Arco del Monte 98a), Di Bartolomei bicycles (Piazza di
  Santa Caterina della Rota 93), La Bottega di Campo (Vicolo del Gallo 18), Ancient Pizzicheria
  Ruggeri (Campo de' Fiori 1 — **Parione-facing address, treat as §3 straddler**).
- **Lorcan O'Neill Gallery** — OSM node 6802315285 at 41.893536,12.473002. The gallery has moved
  more than once; **do not publish without checking its current address.**

---

## 5. THINGS I DELIBERATELY DID NOT CLAIM

- No designation, *vincolo*, listing or protection status anywhere. Vincoli in Rete and the
  Catalogo generale were not attempted; the roster's `evidence_ruling` forecloses it.
- The UNESCO Historic Centre inscription of 1980 is not asserted for Regola. Regola sits inside
  the historic centre geographically, but the ruling forbids a rione claiming to lie inside the
  property, so no record says so.
- No Lateran Treaty property is involved. The Venerable English College, Santa Maria in
  Monserrato and San Tommaso di Canterbury are pontifical institutions on Italian soil in Regola
  and are **not** Art. 15 extraterritorial properties as far as I could establish; nothing here
  should be described as Vatican territory.
- No photographs. Good candidates exist on Commons (`Category:Rione VII - Regola`,
  `Category:Fontana del Mascherone a via Giulia`, `Category:Galleria Spada (Rome)`) and are noted
  here only for the later image wave.
- No trip durations, no "a pochi passi da", no "nel cuore del rione" — Turismo Roma uses all
  three and they must be stripped in rewriting.

## 6. THE THREE I AM LEAST CONFIDENT ABOUT

1. **Arco Farnese (no. 9).** Sourceless beyond a Wikipedia image caption. Either someone finds a
   Sovrintendenza or Turismo Roma page or it should not ship.
2. **Palazzo dei Tribunali / D.O.M Hotel footprint (no. 51, §3.2).** it.wikipedia puts the site in
   Ponte's block; OSM's building of that name tests Regola. One of them is wrong and I cannot
   tell which.
3. **Santa Lucia del Gonfalone (no. 32, §3.3).** Tests Regola by a few metres on a street Roma
   Capitale names as the border, and its own confraternity's oratory across the way is Ponte's.
   A rione split through one institution is exactly the case the arbitrator exists for.

Runners-up: the Galleria Spada hours (Roma Capitale and OSM agree but the museum's own domain was
unreachable), and the Museo Criminologico open/closed contradiction — which is Ponte's problem now.
