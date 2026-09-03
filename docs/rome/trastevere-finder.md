# Trastevere (R. XIII, code 113) — FINDER file

Wave 1, Rome programme. Research date **2026-09-02**. This is **evidence, not adjudication**.
I am not deciding what ships. A verifier adjudicates; an arbitrator rules ownership of straddlers.

**Rulings observed.** No designation/`vincolo`/"listed"/"protected monument" claim appears anywhere
below — not in English, not in Italian. Vincoli in Rete re-tested this session and still dead
(`urlopen error timed out` on `vincoliinrete.beniculturali.it`, consistent with the earlier
ECONNREFUSED finding). No Vatican City place is claimed for Trastevere. `"photos": []` — I sourced,
named and linked no image; photo leads are quarantined in §9 for the later wave.

---

## 1. Headline numbers

| | |
|---|---|
| Deduplicated place candidates found | **210** |
| Cleanly inside Trastevere (geometry wholly within R. XIII) | **193** |
| **Straddlers — flagged, NOT resolved by me** | **17** |
| Candidates that fell wholly outside | 0 (see §7 for things I looked for and did *not* find inside) |
| Raw OSM objects behind those 210 (13 duplicate groups collapsed) | 232 |

The brief anticipated ~102 named entries. I found roughly double. That is **not** a claim that 210
should ship — a large share are parish churches, minor garden fountains, schools and embassies whose
guide-worthiness is thin (§6). Per the brief's own warning, I have deliberately over-collected at the
edges and marked the weak ones rather than pre-filtering them.

---

## 2. Method, and a correction to the earlier scoping research

### 2.1 The geocoder route failed — I replaced it with geometry

The brief said "Nominatim reverse geocoding returns the rione as the `quarter` field and worked for
8 of 8 central landmarks in earlier research." **It did not work here.** A 232-point reverse-geocode
run returned `HTTP 429 Too Many Requests` on essentially every call; the `quarter` field came back
`None` for 219 of 220 cached rows. Had I trusted the cache shape without opening a row, I would have
concluded that 219 places have no rione. **Anyone repeating the earlier method at volume will hit
this.** Nominatim's public instance is fine for a handful of lookups, not for a corpus.

**What I did instead**, which is stronger and is the method I recommend the programme standardise on:

1. Pulled full boundary geometry for **all 22 rioni plus Q.XI Portuense, Q.XII Gianicolense and
   Q.XIII Aurelio** from Overpass (`rel["boundary"="place"]["place"="quarter"]`, `out geom`).
2. Stitched the unordered way fragments into closed rings by endpoint matching. All 25 units
   resolved to exactly **one clean closed ring each** — no gaps, no multipolygon ambiguity.
3. Ran ray-casting point-in-polygon locally. No rate limit, no network per lookup, deterministic.
4. For every way/relation candidate, fetched full geometry and tested **every vertex**, so a bridge
   or a wall reports *all* the units it crosses rather than just the unit its centroid lands in.

This is the difference that matters: **centroid and geometry disagree on 9 of the 17 straddlers.**
A centroid-only method (which is what a reverse geocoder gives you) silently assigns Ponte Garibaldi
to Regola, Ponte Cestio and Ponte Palatino to Ripa, and Ponte Sublicio to Testaccio, and never tells
you Trastevere has a claim at all.

**Sanity check of the polygon set**, run before trusting it — 8 landmarks with independently known
rioni: Santa Maria in Trastevere→Trastevere, Fontanone→Trastevere, Piazza Navona→Parione,
Pantheon→Pigna, Trevi Fountain→Trevi, Colosseum→Celio, Santa Maria Maggiore→**Monti**.
That last one is the brief's own known straddler and it lands in Monti — consistent with
"straddles Monti and Esquilino" with the bulk in Monti. Piramide Cestia returned **empty**, because
it sits exactly on the Testaccio/San Saba line; that is a true limitation of the method — *points on
a boundary line resolve to nothing* — and it is why I tested full geometry rather than centroids.

- Trastevere boundary relation: **OSM r2529081**, `official_name=Rione XIII Trastevere`, `ref=XIII`,
  `wikidata=Q914255`, `wikipedia=it:Trastevere`.
  https://www.openstreetmap.org/relation/2529081
- Note the `ref` normalisation trap flagged in earlier research holds: Trastevere carries `ref=XIII`
  (bare numeral), while e.g. Ponte carries `ref=R. V`. Any roster join on `ref` must normalise.

### 2.2 New source discovered: the Sovrintendenza Capitolina per-monument URL pattern

Earlier scoping research recorded: *"I could not establish the per-monument URL pattern. Two guessed
paths 404'd and there is no sitemap to enumerate from. Discovering the real path shape is unfinished
work."* **That is now done.** The pattern is:

```
https://www.sovraintendenzaroma.it/i_luoghi/<section>/<subsection>/<slug>
```

Live, enumerable index pages (each lists its children as `<a href>`; all HTTP 200):

| Index | Items |
|---|---|
| `/i_luoghi/roma_medioevale_e_moderna/monumenti` | 13 |
| `/i_luoghi/roma_medioevale_e_moderna/beni_architettonici` | 11 |
| `/i_luoghi/roma_medioevale_e_moderna/fontane` | 44 |
| `/i_luoghi/ville_e_parchi_storici/ville_dei_nobili` | 10 |
| `/i_luoghi/ville_e_parchi_storici/ville_della_borghesia` | 8 |
| `/i_luoghi/ville_e_parchi_storici/passeggiate_parchi_e_giardini` | 18 |
| `/i_luoghi/roma_antica/aree_archeologiche` | 8 |
| `/i_luoghi/musei/musei_in_comune` | 20 |
| `/i_luoghi/musei/altri_musei_e_collezioni` | 2 |

(`/i_luoghi/roma_antica/archi_porte_e_ponti`, `/i_luoghi/roma_antica/beni_architettonici` and
`/i_luoghi/mura_urbane` appear in the site's own nav but **404** — the nav over-promises.
`/i_luoghi/roma_medioevale_e_moderna/edicole_sacre` returns 200 with zero child links.)

**This matters beyond Trastevere.** It is Roma Capitale's own heritage voice, human-readable but
per-monument and stable, and it is the closest thing the programme has to an institutional
per-property source now that the state registers are unreachable. Crucially, **some of its pages
carry an explicit `Rione:` field** — Roma Capitale stating the rione itself, which is better
evidence than OSM for unit assignment. It gave me `Rione: Trastevere` outright for the Piazza
Trilussa fountain and the Piazza Mastai fountain, and `Municipio I, Rione XIII - Trastevere` for
Villa Sciarra and the Passeggiata del Gianicolo.

**It does not state protection status**, so nothing here breaches Ruling 1.

### 2.3 Reachability re-tested this session (raw `python3 urllib`, not WebFetch)

| Host | Result |
|---|---|
| `it.wikipedia.org/w/api.php` | 200 (raw wikitext via `action=query&prop=revisions`) |
| `overpass-api.de` | 200, but **429s under load** — I rotated across `overpass.kumi.systems` and `overpass.private.coffee` with backoff |
| `nominatim.openstreetmap.org` | 200 for single calls, **429 at volume** |
| `www.sovraintendenzaroma.it` | 200, per-monument pages resolve (§2.2) |
| `060608.comune.roma.it` | 200 — and a per-attraction path **does** exist: `/it/scheda/<slug>` resolves (2.8 MB) |
| `whc.unesco.org/en/list/91/` | **200** — earlier research recorded 403; it answers `urllib` even though it bot-blocks WebFetch |
| `www.vatican.va` Lateran Treaty full text | 200 |
| `www.villafarnesina.it`, `www.museodiromaintrastevere.it`, `www.museodellarepubblicaromana.it`, `www.lincei.it`, `www.accademiaspagna.org`, `www.aarome.org`, `www.cinematroisi.it`, `www.teatrobelli.it` | 200 |
| `vincoliinrete.beniculturali.it` | **timeout — still unreachable** |
| `www.turismoroma.it` | 403 |
| `barberinicorsini.org/en/palazzo/palazzo-corsini/`, `web.uniroma1.it/ortobotanicoroma/`, `museiincomuneroma.it/it/museo/...` | 404 — path shapes changed, need rediscovery |
| `santacecilia.roma.it`, `nuovosacher.com` | DNS does not resolve |
| `sanfrancescoaripa.com` | TLS self-signed cert failure |

---

## 3. THE 17 STRADDLERS — flagged, not resolved

Per the brief I do **not** resolve these. `cent` = the unit the centroid falls in;
`geom` = every unit the full geometry touches.

### 3.1 The six Tiber bridges — the single biggest straddler cluster

Trastevere's **entire eastern boundary is the river**, so every bridge to the left bank straddles by
construction. it.wikipedia's Trastevere article states the boundary explicitly and enumerates it in a
footnote: *"a est, al di là del Tevere ... con i rioni Ponte, Regola, Ripa e Testaccio"*, footnoted as
*"Lungotevere Gianicolense fino al ponte Mazzini, lungotevere della Farnesina fino al ponte Sisto,
lungotevere Raffaello Sanzio fino al ponte Garibaldi, lungotevere degli Anguillara fino al ponte
Cestio, lungotevere degli Alberteschi fino al ponte Palatino, lungotevere Ripa fino al ponte
Sublicio."* (aggregator — attribute, or re-source).

| Bridge | cent | geom | Note |
|---|---|---|---|
| **Ponte Sisto** | Trastevere | Regola + Trastevere | it.wikipedia says outright *"nei rioni Regola e Trastevere"* |
| **Ponte Giuseppe Mazzini** | Trastevere | Regola + Trastevere | |
| **Ponte Garibaldi** | **Regola** | Regola + Trastevere | it.wikipedia: *"nei rioni Regola e Trastevere"* |
| **Ponte Cestio** | **Ripa** | Ripa + Trastevere | Connects Trastevere bank to **Isola Tiberina**, not to the left bank |
| **Ponte Palatino** | **Ripa** | Ripa + Trastevere | |
| **Ponte Sublicio** | **Testaccio** | Ripa + Testaccio + **Trastevere** | Three units. it.wikipedia: links *piazza dell'Emporio, nel rione Ripa* to *Trastevere ... piazza di Porta Portese* |

Four of the six have centroids **outside** Trastevere. A centroid-only method loses them.

### 3.2 Isola Tiberina

`cent=Ripa`, `geom=Regola + Ripa + Trastevere`. Traditionally reckoned to Ripa. Its geometry clips
Trastevere. **Do not let this one default to Trastevere** — I flag it only because the geometry
touches, and I record my own view for the arbitrator that Ripa has the stronger claim.

### 3.3 Janiculum-ridge straddlers (Trastevere ↔ Q.XII Gianicolense / Q.XIII Aurelio)

| Place | cent | geom |
|---|---|---|
| **Villa Sciarra** | Trastevere | Gianicolense + Trastevere |
| **American Academy in Rome** | Trastevere | Gianicolense + Trastevere |
| **Pontificio Collegio Americano del Nord** | Trastevere | Aurelio + Trastevere |
| **Largo Giorgio Roberti** | Gianicolense | Gianicolense + Trastevere |

Villa Sciarra is the interesting one: **the Sovrintendenza states flatly `Dove si trova: Municipio I,
Rione XIII - Trastevere`**, i.e. Roma Capitale claims it wholly for Trastevere, while OSM geometry
has it crossing into Gianicolense — and it.wikipedia describes it as *"situata sulle pendici del colle
Gianicolo tra i quartieri di Trastevere e Monteverde Vecchio"* ("between Trastevere and Monteverde
Vecchio"). Three sources, three shapes. Arbitrator's call.

### 3.4 Walls, tunnel, and the extraterritorial overlay

| Place | geom |
|---|---|
| **Mura gianicolensi** | Aurelio + Gianicolense + Trastevere |
| **Mura Aureliane** (relation) | 10 rioni incl. Trastevere |
| **"Mura di Roma"** (relation) | 13 units incl. Trastevere |
| **Galleria Principe Amedeo Savoia-Aosta (PASA tunnel)** | Aurelio + Borgo + Trastevere |
| **Pontificia Università Urbaniana** | cent=**Borgo**, geom=Borgo + Trastevere |
| **"Zona extraterritoriale della Santa Sede"** (r6474878) | 8 units incl. Trastevere |

The PASA tunnel *is* Trastevere's northern boundary per it.wikipedia (*"a nord dalla galleria
Principe di Savoia-Aosta (PASA)"*), so it straddles definitionally. The Urbaniana sits on the
Janiculum's north side and is probably Borgo's — flagged, not resolved.

There is also a separate **`Mura Aureliane` way (w204145793) lying wholly inside Trastevere**, which
is a clean segment candidate distinct from the whole-circuit relation.

---

## 4. THE LATERAN TREATY TIER IN TRASTEVERE — sourced from the Treaty's own text

Fetched raw from the Holy See:
https://www.vatican.va/roman_curia/secretariat_state/archivio/documents/rc_seg-st_19290211_patti-lateranensi_it.html

**Palazzo di San Callisto is a genuine Art. 15 extraterritorial property standing on Italian soil in
Trastevere.** The chain, quoted from the Treaty:

- **Art. 13**, third paragraph: *"Resta del pari inteso che la Santa Sede è libera proprietaria del
  dipendente edificio di S. Callisto presso S. Maria in Trastevere (Alleg. II, 9)."*
- **Art. 15**: *"Gli immobili indicati nell'art. 13 ... benché facenti parte del territorio dello
  Stato italiano, godranno delle immunità riconosciute dal diritto internazionale alle sedi degli
  agenti diplomatici di Stati esteri."*

So: Art. 13 names it, Art. 15 confers diplomatic-headquarters immunities on Art. 13 properties, and
the Treaty itself says these are *"facenti parte del territorio dello Stato italiano"* — part of
Italian territory. That is exactly the third tier the vatican_ruling describes, and it publishes
under Trastevere with its status stated accurately. It is **not** Vatican City and must not be
described as such.

> ⚠️ **Textual discrepancy — do not paper over.** The Treaty's own annexe index lists
> *"Tav. 8 — Palazzo di S. Callisto in Trastevere"*, but **Art. 13 cites it as `Alleg. II, 9`**, and
> Art. 15's parenthetical `(Alleg. II, 6, 7, 8, 10 e 11)` lists six palaces against five numbers. The
> vatican.va HTML also skips Tav. 11 entirely in the index. The table number is internally
> inconsistent in the source. **The legal substance is unaffected** — Art. 13 names the building in
> words — but no page should cite a table number as if it were settled.

> ⚠️ **Second Lateran item touching this area, unresolved.** Art. 14's second paragraph covers
> *"gli immobili siti nel lato nord del Colle Gianicolense appartenenti alla Sacra Congregazione di
> Propaganda Fide ... e prospicienti verso i palazzi vaticani (Alleg. II, 12)"* — and Art. 15 extends
> immunities to *"gli alinea primo e secondo dell'art. 14"*, so these **also** carry extraterritorial
> status. Which rione the "north side of the Janiculum hill" properties fall in is **not settled by
> me** — the Trastevere/Borgo line runs through there and my geometry puts the Urbaniana's centroid
> in Borgo. Flagged for the arbitrator.

> ⚠️ **Ruling-1 tripwire in the Treaty's own text.** Art. 16 reads *"non saranno mai assoggettati a
> **vincoli** o ad espropriazioni per causa di pubblica utilità"*. This is the Treaty speaking about
> its own properties, which Ruling 1 expressly permits — and note it says these properties shall
> *never* be subjected to vincoli, which is the opposite of a designation claim. I record it here
> for completeness; **I recommend the verifier still keep the word out of published prose**, because
> a reader cannot be expected to parse that inversion and the word itself is banned.

Also present and needing the same care: **Palazzo delle Sacre Congregazioni Romane** (w203854795,
Q56428154) sits inside Trastevere per geometry. I could **not** find it in the Treaty's annexe lists
under that name, and the Art. 15 "Convertendi/Sant'Offizio" properties are at Piazza Scossacavalli in
Borgo. **Do not assume this building is extraterritorial.** Unresolved.

---

## 5. Candidate records with sourced facts

Sources keyed: **[SOV]** = sovraintendenzaroma.it (Roma Capitale, institutional);
**[ITW]** = it.wikipedia raw wikitext (**aggregator — attribute or re-source**);
**[OSM]** = OpenStreetMap (**crowd-sourced — attribute**); **[OWN]** = the institution's own site;
**[LAT]** = Lateran Treaty text on vatican.va.

### 5.1 Churches — the spine of the rione (37 candidates found; majors below)

| Name | What / when / by whom | Address | Source |
|---|---|---|---|
| **Basilica di Santa Maria in Trastevere** | Catholic basilica, the principal church of the rione. Tradition founds it under Pope Callistus I (217–222), completed under Julius I (337–352); renewed 12th c. under Innocent II. Minor basilica; cardinalatial title. | Piazza di Santa Maria in Trastevere | [ITW], [OSM] Q1137391 |
| **Basilica di Santa Cecilia in Trastevere** | Minor basilica. Late-Palaeochristian structure/apse/narthex; Baroque interior, façade and forebuilding. **Ferdinando Fuga** — forebuilding and courtyard. | Piazza di Santa Cecilia | [ITW] Q1479873 |
| **Basilica di San Crisogono** | 4th-c. origin, `Titulus Chrysogoni` in the 499 list. Rebuilt 12th c., again **1626 to a design by Giovanni Battista Soria** for Cardinal Scipione Caffarelli-Borghese. Romanesque campanile, Baroque basilica. | Piazza Sidney Sonnino 44 | [ITW] Q1631638, [OSM] |
| **Chiesa di San Francesco a Ripa** | Parish church, Order of Friars Minor. Architects **Onorio Longhi, Mattia de Rossi**; consecrated **2 October 1701**. Named for its position by the suppressed Porto di Ripa Grande. | Piazza di San Francesco d'Assisi | [ITW] Q571088 |
| **Chiesa di San Pietro in Montorio** | Renaissance rectory church on the Janiculum, Friars Minor. Badly damaged in the 1849 siege of Rome. | Piazza di San Pietro in Montorio | [ITW] Q1258576 |
| **Tempietto di San Pietro in Montorio** | Small circular building in a cloister of the convent. **Bramante**; infobox also names Baccio Pontelli and Amedeo di Francesco da Settignano. High Renaissance. | Piazza di S. Pietro in Montorio 2 | [ITW] Q12960184 |
| **Chiesa di Santa Maria della Scala** | Built **1593–1610**; Baroque; Discalced Carmelites. | Piazza della Scala | [ITW] Q2533316 |
| **Chiesa di Santa Maria dell'Orto** | Architect **Vignola**; Renaissance/Baroque. National church of the Japanese in Rome by will of Sixtus V, honouring the Tenshō Embassy. | Via Anicia / Via Madonna dell'Orto | [ITW] Q1634605 |
| **Chiesa di San Giovanni Battista dei Genovesi** | Built **1481–1492** by the Genoese Meliaduce Cicala, treasurer of the Apostolic Chamber, with a hospital for Genoese sailors. National church of the Genoese. | Via Anicia 12 | [ITW] Q3585341 |
| **Chiesa di Santa Maria in Cappella** | Consecrated **25 March 1090**. | Vicolo di S. Maria in Cappella 6 | [ITW] Q2223175 |
| **Chiesa di San Benedetto in Piscinula** | Very small, very old. Piazza's name attested from the 12th c., from the remains of a public baths. | Piazza in Piscinula | [ITW] Q3585317 |
| **Chiesa di Santa Maria dei Sette Dolori** | Built beside the *sui juris* monastery of the Augustinian oblates, order founded c. 1640 by **Camilla Virginia Savelli Farnese**, Duchess of Latera. | Via Garibaldi 27 | [ITW] Q1258812 |
| **Chiesa di Santa Maria della Luce** | Originally San Salvatore della Corte; said founded by St Bonosa in the 4th c. by the **excubitorium of the VII cohort of the vigiles**. | Via della Luce | [ITW] Q1071768 |
| **Chiesa di San Callisto** | On the house where tradition holds Callistus I prayed and was martyred by drowning; the well is in the ex-convent courtyard. | Piazza di S. Calisto 6 | [ITW] Q202369 |
| **Chiesa di Santa Dorotea** (SS. Silvestro e Dorotea) | On the site of a medieval church attested in a bull of Callistus II, **1123**. | Via di Santa Dorotea 23 | [ITW] Q426226 |
| **Chiesa di Sant'Egidio** | Rectory church; cardinalatial title created **2019** by Pope Francis. Near the older San Lorenzo in Janiculo. | Piazza di Sant'Egidio | [ITW] Q1445530 |
| **Chiesa di Sant'Onofrio al Gianicolo** | Church-convent complex, Franciscan Friars of the Atonement; mother church of the Equestrian Order of the Holy Sepulchre. | Piazza di Sant'Onofrio 2 | [ITW] Q1627320 |

Further church candidates found and located inside R. XIII, with OSM ids and Wikidata but **not yet
fact-gathered** — flagged as thin, for the verifier to triage: Santi Maria e Gallicano (Q3668274),
Sante Rufina e Seconda (Q1539997), Santa Margherita in Trastevere (Q3585415), San Cosimato
(Q3669802), Santi Quaranta Martiri e San Pasquale Baylon (Q3668394), Sant'Agata in Trastevere
(Q3585390), Sant'Antonio Maria Zaccaria (Q16540535), San Giovanni della Malva (Q3585348), San
Giacomo alla Lungara (Q3670275), San Giuseppe alla Lungara (Q1345190), Santa Croce alla Lungara
(Q3673033), Sant'Andrea dei Vascellari (Q3672480, deconsecrated), Santa Maria della Visitazione e
San Francesco di Sales (Q3673939, deconsecrated, attached to Regina Coeli), Sacro Cuore di Gesù a
Villa Lante (Q3668612), Santa Maria Assunta al Gianicolo (Q53953641), Santa Maria del Ritiro al
Gianicolo (Q25420062), North American College Chapel, Chiesa del Collegio Pio Romeno.

### 5.2 Museums and cultural institutions

| Name | Facts | Source |
|---|---|---|
| **Villa Farnesina** | Built **1506–1512**, designed by **Baldassarre Peruzzi**; prototype of the Roman suburban villa. Frescoes by **Raphael** and his school. Seat of the **Accademia Nazionale dei Lincei**. Official address **Via della Lungara 230, 00165 Roma**; `villafarnesina@lincei.it`; +39 06 68 02 72 68. Rooms named on the official site: Loggia di Amore e Psiche, Sala del Fregio, Loggia di Galatea, Sala delle Prospettive, Sala delle Nozze, Saletta Pompeiana, Galleria delle Grottesche. | [OWN] villafarnesina.it, [ITW] Q1126723 |
| **Museo di Roma in Trastevere** | Municipal museum in part of the former **Discalced Carmelite** monastery; first nucleus founded in the early decades of the 17th c. by the church of San Lorenzo in Ianiculo, later restored and dedicated to Sant'Egidio. Subject: Roman popular life, late 18th–19th c. Info/booking **tel. 060608, 09:00–19:00**. Free entry for MIC cardholders. Address **Piazza Sant'Egidio 1/b**. | [SOV] `/i_luoghi/musei/musei_in_comune/museo_di_roma_in_trastevere`, [ITW] Q3868182 |
| **Museo della Repubblica Romana e della memoria garibaldina** | Municipal museum, housed in **Porta San Pancrazio**. Historic/modern; covers the Roman Republic and the Risorgimento via documents, artworks and multimedia. Info/booking **tel. 060608**. **Ingresso gratuito** (free entry). | [SOV] `/i_luoghi/musei/musei_in_comune/museo_della_repubblica_romana_e_della_memoria_garibaldina`, [OWN] museodellarepubblicaromana.it, Q3868045 |
| **Galleria nazionale d'arte antica di palazzo Corsini** | State gallery in Palazzo Corsini. **Via della Lungara 10**. | [OSM] Q3757768, [ITW] |
| **Palazzo Corsini alla Lungara** | Built at the end of the **15th c. by the Riario**, nephews of Sixtus IV, in the lowest part of Villa Corsini; opposite Villa Farnesina. **Queen Christina of Sweden** lived here in the 17th c. Address Via della Lungara 10, 00165. | [ITW] Q2517648 |
| **Orto botanico di Roma** | On the Janiculum slopes in the old park of Villa Corsini, once Christina of Sweden's residence. Run by the **Dipartimento di Biologia Ambientale, Sapienza Università di Roma**. Address given as **via di Villa Corsini / largo Cristina di Svezia 24**. | [ITW] Q1072277, [OSM] r11487908 |
| **Real Academia de España en Roma** | Spanish state academy at **Piazza di San Pietro in Montorio 3**; site live. | [OWN] accademiaspagna.org, Q531779 |
| **Accademia Nazionale dei Lincei / Biblioteca Corsiniana** | Via della Lungara 10. | [OWN] lincei.it, Q338432 / Q3639657 |
| **American Academy in Rome** | Via Angelo Masina 5. Owns the **Villa Aurelia** property since **1909**. ⚠️ straddler (§3.3). | [OWN] aarome.org, [ITW], Q463271 |
| **Museo tassiano** and **Spezieria di Santa Maria della Scala** | Named by [ITW] as Trastevere museums; **I did not verify either independently.** Thin. | [ITW] |

### 5.3 Fountains — where Roma Capitale's own voice is strongest

| Name | Facts | Source |
|---|---|---|
| **Mostra dell'Acqua Paola al Gianicolo** ("Fontanone") | Commissioned by **Paul V Borghese** after his 1608 restoration of the Aqua Traiana; built **1610–1614** as the terminal display of the Traiano-Paolo aqueduct by **Giovanni Fontana (1540–1614)** assisted by **Flaminio Ponzio (1560–1613)**. Modelled on a triumphal arch: five arches, columns, wide attic. Spolia marbles from the Roman Forum and the Temple of Minerva in the Forum of Nerva; the red and grey granite columns came from **the old Constantinian St Peter's**. Front remodelled to its present form by **Carlo Fontana (1638–1714)**, dated **1690–1693**. Damaged by French cannon in **1849**; restored 1859, 1934, 1950s, and 2002–2004 by the Amministrazione Capitolina. From **1901 to the 1930s its water fed Rome's first hydroelectric station**. The Sovrintendenza also notes the attic inscription **contains an error** — it cites restoration of the *Alsietina* aqueduct when the aqueduct actually restored was the *Aqua Traiana*. | [SOV] `/i_luoghi/roma_medioevale_e_moderna/fontane/mostra_dell_acqua_paola_al_gianicolo` |
| **Fontana dell'Acqua Paola in Piazza Trilussa** (a.k.a. Fontana di Ponte Sisto) | **A different fountain from the Fontanone — do not conflate.** Built **1613** by the Fleming **Jan van Santen (1550–1621)**, "Giovanni Vasanzio", with **Giovanni Fontana (1540–1614)**, for **Paul V**. Originally on the **left** bank at the end of via Giulia, by the Ospizio dei Mendicanti. Dismantled **1879** for the Tiber embankments; rebuilt on the right bank **1898**, aligned with Ponte Sisto. Two inscriptions added after the move record the transfer. **`Rione: Trastevere`** stated by Roma Capitale. | [SOV] `/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_dell_acqua_paola_in_piazza_trilussa` |
| **Fontana in piazza Santa Maria in Trastevere** | Documented on **Pietro il Massaio's 1471 plan of Rome**. Restored under Alexander VI Borgia (2nd basin removed, wolf's-head spouts added); further work **1604 by Girolamo Rainaldi (1570–1655)**; moved to the centre of the square under **Alexander VII Chigi**, work entrusted to **Gian Lorenzo Bernini (1598–1680)**, who reworked the octagonal basin and added four double shells; transformed again **1692 by Carlo Fontana (1634/38–1714)** for Innocent XII, enlarging the travertine basin and replacing Bernini's shells; rebuilt by the **Comune di Roma in 1873** to the 1692 model in grey bardiglio, adding a prominent S.P.Q.R. Sovrintendenza summary line: *Autori: Carlo Fontana. Datazione: 1692, 1873.* | [SOV] `/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_in_piazza_santa_maria_in_trastevere` |
| **Fontana di Pio IX in piazza Mastai** | Built **1865** by architect **Andrea Busiri Vici (1817–1911)** to ornament the semicircular piazza before the Manifattura dei Tabacchi, the pivot of the new "Quartiere Mastai" that Busiri designed for **Pius IX Mastai-Ferretti**. Octagonal steps and basin; papal arms; dolphins beneath the lower basin, putti beneath the upper. Restored **1996**. **`Rione: Trastevere`** stated by Roma Capitale. | [SOV] `/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_di_pio_ix_in_piazza_mastai` |
| **Fontana del Prigione** | Made **1587–1590** by **Domenico Fontana** for **Sixtus V**, as the perspective backdrop of an avenue in the garden of Villa Montalto Peretti **on the Esquiline**. Villa destroyed late 19th c.; parts bought by the Comune, dismantled **1888**, stored; recomposed **1894–95** as the backdrop of via Genova; dismantled again and **recomposed in 1923 at its present site on via Goffredo Mameli** on the Janiculum slopes, to a Genio Civile design. The Prigione sculpture, the Apollo and Venus statues and the head of the Aesculapius are lost/missing. Restored 2005–2006. | [SOV] `/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_del_prigione_in_trastevere` |

Plus **~20 further fountains** found by OSM inside the rione, most of them inside Villa Sciarra and
mostly unsourced beyond OSM: Fontana dei Satiri, dei Satirelli, di Diana ed Endimione, della Lumaca,
della Tartaruga, dei Tritoni (×2), dei Tritoncini, dei Vizi Capitali, degli undici zampilli, della
Grotticella, della Botte (Q99726663), ovale, rustica dell'esedra (×2), rustica delle Mura, rustica
piccola, a muro semicircolare, con protomi leonine e foglie d'acanto, dei Putti o del Biscione.
**Thin — OSM-only.** Note the Sovrintendenza's Villa Sciarra page does independently name *"la
fontana dei satiri, la fontana di Diana ed Endimione"* among those restored in the 2000s.

### 5.4 Gates, walls, bridges, and the Janiculum

| Name | Facts | Source |
|---|---|---|
| **Porta Settimiana** | Gate in the **Aurelian Walls**, the northern vertex of the triangle the walls made climbing the Janiculum to enclose the Trastevere area. Termine costruzione: **III secolo**. At the start of via della Lungara. | [ITW] Q1422040 |
| **Porta San Pancrazio** | Southern gate of the Aurelian Walls near the Janiculum summit. Infobox: inizio **270**, termine **1854 (ricostruzione)**, neoclassical. Houses the Museo della Repubblica Romana. | [ITW] Q2000448 |
| **Porta Portese** | Built **1641–1644** by **Marcantonio de Rossi**, Baroque, for **Urban VIII**, replacing the older Porta Portuensis, in step with the Mura gianicolensi. | [ITW] |
| **Mura gianicolensi** | Raised **1643** by **Urban VIII** to supplement the Leonine walls and better protect the right bank; the Sovrintendenza's Villa Sciarra page dates the works **1642–44**. ⚠️ straddler. | [ITW] Q3867334, [SOV] |
| **Ponte Sisto** | *"Primo ponte edificato in epoca moderna"* — built by **Sixtus IV della Rovere (1471–1484)** for the **Jubilee of 1475**, to link Trastevere directly with the rest of the city; at the time only the Tiber Island bridges and Ponte Sant'Angelo worked. Four travertine-faced arches, central circular opening, five marble papal coats of arms. **The designer is unresolved** — Sovrintendenza says the Vasarian attribution to **Baccio Pontelli (c.1450–1492)** has fallen, since Pontelli reached Rome only after construction. In **1877** two suspended metal walkways were added to **Angelo Vescovali's (1826–1895)** design; after debate 1977–1998 a restoration by **Gaetano Miarelli Mariani** removed the 19th-c. metalwork and rebuilt the parapets. Sixtus IV's two plaques were removed for museum conservation. ⚠️ straddler. [ITW] gives build dates **1473–1479** and *"nei rioni Regola e Trastevere"*. | [SOV] `/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/ponte_sisto`, [ITW] Q586329 |
| **Ponte Garibaldi** | Designed by eng. **Angelo Vescovali**, built **1884–1888**, dedicated to Garibaldi. Links lungotevere de' Cenci to piazza G. G. Belli. ⚠️ straddler. | [ITW] Q2100416 |
| **Ponte Sublicio** | Built **1914–1917** to a design by **Marcello Piacentini**, inaugurated **21 April 1919**; three arches. Links piazza dell'Emporio (Ripa) to piazza di Porta Portese. ⚠️ straddler across three units. ⚠️ OSM carries **two different Wikidata ids** on the two objects — Q17052453 and **Q1466700, which is the ancient pons Sublicius** — a conflation of the modern bridge with the vanished Roman one. Do not inherit. | [ITW], [OSM] |
| **Ponte Cestio** | 19th-c. rebuild of the Roman bridge; also pons Aurelius/Gratiani/di San Bartolomeo/Ferrato. One of only two Rome bridges that do **not** directly join opposite banks — it links Trastevere to the Isola Tiberina. ⚠️ straddler. | [ITW] Q734903 |
| **Passeggiata del Gianicolo** | **Municipio I, Rione XIII – Trastevere.** Epoch **2nd half 19th c.**, extent **3.5 hectares**, entrances via Garibaldi and salita di Sant'Onofrio. Two great plane-lined avenues flanking Villa Aurelia, meeting at piazzale Garibaldi, then a single road descending in hairpins to Sant'Onofrio, **completed 1939**. The area saw the 1849 fighting; **in 1883** the new Italian State and Comune bought it and made it a public promenade dedicated to the memory of the Defence of Rome. Busts of Garibaldini line the avenues. Laying-out had begun under the papal government with a **bust of Torquato Tasso placed in 1857** by the old oak. | [SOV] `/i_luoghi/ville_e_parchi_storici/passeggiate_parchi_e_giardini/passeggiata_del_gianicolo` |
| **Villa Sciarra** | **Municipio I, Rione XIII – Trastevere**; epoch **XVII–XX c.**; **extent 63,500 m²**; entrances via Calandrelli, via Dandolo, via delle Mura Gianicolensi. Barberini property from the mid-17th c., then Maffeo Sciarra; transformed **1902** by **Giorgio Wurts** in neo-Baroque taste; consigned by his heirs **in 1930 to Benito Mussolini**. Area acquired **1575 by Mons. Innocenzo Malvasia**, who built the Casino Malvasia (now on American Academy land). Donated 1647 to Cardinal Antonio Barberini; sold **1710 to Cardinal Pietro Ottoboni** (d. 1740), who made three new gardens and promoted **excavations at the Syriac temple in 1720**. Enlarged with the orto Crescenzi **1811**. Casino Barberini and Casino Malvasia badly damaged in **1849**. ⚠️ straddler; ⚠️ see §8 for the area conflict. | [SOV] `/i_luoghi/ville_e_parchi_storici/ville_dei_nobili/villa_sciarra` |
| **Santuario siriaco del Gianicolo** | Archaeological site **inside Villa Sciarra**, built 4th c. over 1st–2nd c. remains within a private domus. Probably the site of the *lucus Furrinae*, where **Gaius Sempronius Gracchus** is said to have had himself killed in **121 BC**. ⚠️ address conflict: [ITW] **via Dandolo 47**, [OSM] **via Dandolo 45**. | [ITW], [OSM] |
| **Faro del Gianicolo** | Also "Faro di Roma" / "Faro degli italiani d'Argentina". Built **1911**, neoclassical, at Passeggiata del Gianicolo / Piazzale del Faro. Decades from the coast, it serves no navigation; lit only sporadically; **interior not open to the public**. | [ITW] |
| **Monumento a Giuseppe Garibaldi** | Equestrian statue at the Janiculum summit by **Emilio Gallori**, inaugurated **20 September 1895**, on the 25th anniversary of the taking of Rome. | [ITW] Q3862680 |
| **Monumento ad Anita Garibaldi** | On the Janiculum. | [OSM] Q17636665 |
| **Mausoleo Ossario Garibaldino** | On the Janiculum at **Colle del Pino**, where the last defence of the Roman Republic was fought **30 April – early July 1849**. Designed by **Giovanni Jacobucci (1895–1970)**, inaugurated **3 November 1941** after two years' work; holds the remains of the fallen in the battles for Rome **1849–1870**. Promoted in the 1930s by **Ezio Garibaldi**; built by the Uffici Tecnici del Governatorato. Travertine quadriportico, three round arches per side; central altar from a single block of **red Baveno granite**. | [SOV] `/i_luoghi/roma_medioevale_e_moderna/monumenti/mausoleo_ossario_garibaldino` |
| **Monumento a Giuseppe Gioachino Belli** | By sculptor **Michele Tripisciano (1860–1913)**, **1913**, for the 50th anniversary of Belli's death. Travertine and marble. Proposed to Mayor **Nathan in 1910** by Domenico Gnoli and others; sited in the Trastevere piazza facing Ponte Garibaldi, **then called piazza d'Italia**; funded by public subscription reaching **30,000 lire**. The poet's right hand rests on a reconstruction of the parapet of **Ponte Fabricio**. Base reliefs: the Tiber personified, and Pasquino among the populace. Twin fountains with masks of "Poetry" and "Satire". | [SOV] `/i_luoghi/roma_medioevale_e_moderna/monumenti/monumento_a_giuseppe_gioachino_belli` |
| **Cannone di Mezzogiorno** | Gun fired daily at exactly noon, in place under the Garibaldi statue **since 24 January 1904**; the noon blank was introduced by **Pius IX in 1847** as a time reference for the city's bells. | [ITW], [OSM] Q72686034 |
| **Busti dei patrioti sul Gianicolo** | The Garibaldini busts along the Passeggiata. Long [ITW] article (44 KB) not yet mined. | [ITW] |
| **Quercia del Tasso** / **Anfiteatro Quercia del Tasso** | The oak associated with Tasso; open-air theatre. | [OSM] Q115145930 / Q3616672 |

### 5.5 Palaces, civic and 20th-century buildings

| Name | Facts | Source |
|---|---|---|
| **Palazzo di San Callisto** | Baroque palace on Piazza di San Calisto / Piazza di S. Maria in Trastevere. **Lateran Treaty extraterritorial property — see §4 for the sourced legal chain.** Houses dicasteries and offices of the Roman Curia and the Holy See's diplomatic service. [ITW] dates it **1610–18**. In its courtyard the well where tradition says Callistus I was martyred. | [LAT] Art. 13 & 15, [ITW] Q5197044 |
| **Complesso monumentale di San Michele a Ripa Grande** | **Via di San Michele 18.** Built **1686–1834**; architects **Carlo Fontana, Mattia De Rossi, Giacomo Recalcati, Nicola Michetti, Ferdinando Fuga, Nicolò Forti, Luigi Poletti**. Born as a multi-purpose institution — orphanage, hospice and prison. Now **seat of various offices of the Ministero della Cultura**; OSM independently places the **ICCD** (Via di San Michele 18) and the **Soprintendenza Speciale di Roma** (Via di San Michele 17) here. | [ITW], [OSM] |
| **Carcere di Regina Coeli** | Via della Lungara 29. [ITW]: 17th-c. building (**1654**), converted to its present use in **1881**. Working prison. | [ITW], [OSM] |
| **Ex Casa della GIL** (Palazzo GIL / WeGil) | **Largo Ascianghi 5 / Via Girolamo Induno 1.** Commissioned **1933** by the **Opera Nazionale Balilla** from **Luigi Moretti**; construction period **1933–1937**. Rationalist, articulated as three juxtaposed buildings including a tower for the library. Now the WeGil cultural venue. ⚠️ [ITW]'s Trastevere article says "1933" while its dedicated article says "1933–1937" — cite the range. | [ITW] Q122442866, [OSM] |
| **Palazzo degli Esami** | Via Girolamo Induno. 20th c., **1912**. | [ITW] Q56425114 |
| **Ex Manifattura Pontificia dei Tabacchi** | Piazza Mastai. **1860–63**, the pivot of Pius IX's "Quartiere Mastai" — corroborated independently by the Sovrintendenza's Piazza Mastai fountain page, which names **Andrea Busiri Vici** as designer of the quarter. | [ITW], [SOV] |
| **Palazzo del Ministero della pubblica istruzione** | Viale di Trastevere. **1912–25**. Now Ministero dell'Istruzione e del Merito. | [ITW], [OSM] Q3858490 |
| **Villa Lante al Gianicolo** | Passeggiata del Gianicolo. 16th c., **1518–31**. | [ITW] Q2295190 |
| **Villa Spada al Gianicolo** | Via Giacomo Medici. 17th c. (**1639**); seat of the **Embassy of Ireland**. | [ITW] Q41739213, [OSM] Q103833212 |
| **Villa Aurelia / Casino Farnese al Gianicolo** | Property bounded by largo di Porta San Pancrazio, via Garibaldi and the Passeggiata del Gianicolo, **in the rione Trastevere**. Built c. **1650** for Cardinal **Girolamo Farnese**; **property of the American Academy in Rome since 1909**, used for events. ⚠️ **OSM tags the villa way with Q15852893, which is the *Casino Farnese*, a building inside the villa — a conflation.** | [ITW], [OSM] |
| **Palazzo Salviati** | Via della Lungara. OSM: seat of the **Centro Alti Studi per la Difesa**. | [OSM] Q3890811 / Q1054243 |
| **Palazzo delle Sacre Congregazioni Romane** | ⚠️ See §4 — **do not assume extraterritorial status.** | [OSM] Q56428154 |
| Others located, thin | Palazzo Anguillara, Palazzo Cavalieri Ossoli, Palazzo Pizzirani, Palazzo Diaconale di Santa Maria in Trastevere (Q58885954), Casino Barberini, Casino di Villa Gabrielli al Gianicolo, Casa medievale di vicolo della Luce, "casa più piccola di Trastevere" (via dell'Arco di San Callisto), Palazzo Dal Pozzo, Palazzo Del Cinque, Villa Alibert, Villa Leone Caetani, Casa dei Canonici di S. Maria in Trastevere | [ITW], [OSM] |

### 5.6 Squares

Piazza di Santa Maria in Trastevere (Q638259 — *"one of the most important squares in Rome, in the
centre of the rione"*, [ITW]); Piazza Trilussa; Piazza di Sant'Egidio; Piazza della Scala; Piazza di
San Calisto; Piazza in Piscinula; Piazza di Santa Cecilia; Piazza di San Giovanni della Malva;
Piazza di Sant'Onofrio; Piazza Giuseppe Gioachino Belli; Piazza del Drago; Largo San Giovanni De
Matha; Largo Ascianghi; Piazzale Anita Garibaldi; Piazzale del Faro. [ITW] additionally names Piazza
Mastai, Piazza San Cosimato and Piazza Sidney Sonnino as the 19th-c.-opened type, and classes the
first four above as the older intimate type.

### 5.7 Living-neighbourhood candidates (verify hard — the corpus rules bite here)

Mercato di San Cosimato (marketplace); the **Porta Portese** flea market (OSM has the gate and a
kiosk at Piazza di Porta Portese, **not** the market as an object — needs its own sourcing);
**Cinema Nuovo Sacher** (Q2972777 — built on the site of the Monopoli di Stato Dopolavoro per [ITW]'s
GIL article; **nuovosacher.com does not resolve**); **Cinema Troisi** (Via Girolamo Induno 1,
cinematroisi.it live) and its Aula Studio; Cinema Intrastevere; Filmstudio; Alcazar; Reale (Piazza
Sidney Sonnino 3); **Cinema America** (dismesso, 1955–56, via Natale Del Grande, [ITW]); Teatro
Belli; Teatro Trastevere; Teatro Argot Studio; bakeries and pastry shops (Biscottificio Artigiano
Innocenti, Pasticceria Valzani, Panificio Arnese, Le Levain, Panetteria Romana, Il Panettiere di
Riccardo Nicolai); Grattacheccaro "Alla Fonte d'Oro" (Q3775863); Cencio la Parolaccia (Q3664378).

> **Corpus-rule warning for this whole section.** These are the entries where "the oldest", "the
> best", "family-run since 1927" claims will want to creep in. **A shop's own site does not establish
> any of that.** I gathered no trading-longevity or superlative claim for any of them and the verifier
> should treat any that appears downstream as unsourced.

### 5.8 Universities, colleges, hospitals, embassies (located; guide-worthiness mostly thin)

John Cabot University (Guarini Campus, Via della Lungara 233; Tiber Campus); The American University
of Rome (Via Pietro Roselli 4); Pontificio Collegio Ucraino di San Giosafat; Pontificio Collegio Pio
Romeno; Pontificio Collegio Americano del Nord ⚠️straddler; Pontificia Università Urbaniana
⚠️straddler, probably Borgo; Istituto Italiano di Studi Germanici (Via Calandrelli 25); Ospedale
Pediatrico Bambino Gesù (Piazza di Sant'Onofrio 4); Ospedale Nuovo Regina Margherita; Embassy of
Spain; Embassy of Finland to the Holy See (Passeggiata del Gianicolo 9); Embassy of Ireland (Villa
Spada). Also located: Liceo scientifico J.F. Kennedy, ISIS "Vincenzo Gioberti", Commissariato
Trastevere, Zalib–Circolo Arci, Evans' Hall Library, and assorted memorials (Bartolomeo Pinelli,
Giorgiana Masi, Memoriale ai partigiani trasteverini, busto di Anna Magnani per [ITW]) and public
artworks (**Triumphs and Laments** — William Kentridge's Tiber-wall frieze, OSM `tourism=artwork`,
**unsourced beyond OSM and a living artist: photo-wave copyright risk**; *Homeless Jesus*; Angelo
Brunetti "Ciceruacchio"; Porchetta di Piazza San Giovanni).

---

## 6. What is publishable about the rione itself

- **Trastevere is R. XIII**, the thirteenth and **most extensive** rione, and its toponym also denotes
  **zona urbanistica 1B of Municipio Roma I** — [ITW], corroborated by OSM `official_name=Rione XIII
  Trastevere`, `ref=XIII`. Note the roster's own warning that Roma Capitale states toponymic areas
  *"non hanno alcuna relazione con le aree urbanistiche né amministrative"* — so the 1B equivalence
  should be attributed, not asserted as identity.
- **Name**: from Latin *trans Tiberim*, "beyond the Tiber", already the name of the corresponding
  Augustan region — the **Regio XIV Transtiberim** — [ITW].
- **Boundaries** as [ITW] states them: Janiculum walls south and west; the **PASA tunnel** north; the
  **Tiber** east. Borders Borgo (N); Ponte, Regola, Ripa, Testaccio (E, across the river); Aurelio,
  Gianicolense, Portuense (W and S). **My geometry independently confirms every one of these
  adjacencies.**
- **Rione history**: Sixtus V fixed the fourteen historic rioni in **1586**, Trastevere being XIII;
  **Benedict XIV's 1744 revision gave Trastevere its present boundaries** — [ITW]. Water reached the
  rione in **1612** via the Acqua Paola aqueduct under Paul V, reusing the ancient Trajanic aqueduct.
  The **Mura gianicolensi were raised in 1643 by Urban VIII** on a different line from the Aurelian
  Walls, which were demolished there, taking in via della Lungara and moving Porta Portese.
- **Coat of arms**: a gold lion's head on red — [ITW], citing Carlo Pietrangeli p. 190.
- **UNESCO**: `whc.unesco.org/en/list/91/` is **reachable via urllib** (200), so the 1980 inscription
  of the Historic Centre of Rome — expressly permitted by Ruling 1 — can be cited from the primary
  source rather than an aggregator. OSM also carries the site as relation **r14651598** whose geometry
  covers 16 units including Trastevere. **I did not extract the inscription text; the verifier should,
  from that URL.**
- **Population**: **DO NOT PUBLISH A FIGURE.** OSM's relation carries `population=18834`;
  it.wikipedia's rioni table says 12,962. Earlier research flagged this same disagreement and did not
  resolve it. It remains unresolved. Two sources, two numbers, no third.

---

## 7. Things I looked for and deliberately report as NOT Trastevere

- **Stazione di Roma Trastevere.** [ITW] states it directly: the station *"nonostante il nome, sorge
  al di fuori di esso"* — despite the name, it stands **outside** the rione. A guide writing "the
  Trastevere station" as a Trastevere place would be wrong. Excellent edge case.
- **Vatican City and everything in it** — St Peter's, the Square, the Museums, the Sistine Chapel.
  Trastevere's northern neighbour is **Borgo**, not the Vatican; the Vatican does not border
  Trastevere in [ITW]'s own boundary list. Nothing Vatican appears in this file. Per Ruling 2 these
  belong to no rione at all.
- **Monteverde / Gianicolense.** The Janiculum ridge shades into Q.XII Gianicolense; four candidates
  straddle (§3.3). Monteverde Vecchio is not Trastevere.
- **Isola Tiberina** — geometry clips Trastevere but the island's tradition and centroid are Ripa's
  (§3.2).
- **Excubitorium of the VII Cohort of the Vigiles** — referenced by [ITW]'s Santa Maria della Luce
  and Trastevere articles as a real Trastevere antiquity, but **it.wikipedia has no article**
  (`MISSING`) and **OSM has no object for it**. A genuine gap: a real site with no reachable source.
  Flagged for a researcher, not for publication.
- **Casa della Fornarina** — searched for, **no OSM object and no confirmed source found**. Commonly
  claimed for Trastevere in guidebooks. Do not publish on guidebook say-so.

---

## 8. Source conflicts the verifier must resolve — do NOT publish either side unaided

1. **Piazza S. Maria in Trastevere fountain, attribution.** [ITW] says *"una realizzazione di **Donato
   Bramante**, con dei perfezionamenti successivi da parte di Bernini e Carlo Fontana"*. **The
   Sovrintendenza never mentions Bramante**, giving instead a documented chain from the 1471 Massaio
   plan through Rainaldi (1604), Bernini, Carlo Fontana (1692) and the Comune (1873). Roma Capitale
   and the aggregator disagree on the author of a famous fountain. Prefer the institution.
2. **Same fountain, superlative.** [ITW] calls it *"la più antica fontana di Roma ancora
   funzionante"* — the oldest working fountain in Rome. **This is exactly the class of claim the
   corpus rules bar**, and the Sovrintendenza does **not** make it. Do not publish.
3. **Villa Sciarra, area.** Sovrintendenza: **63,500 m²**. [ITW]: *"sette ettari e mezzo"* = 75,000 m².
   A ~18% disagreement. Note this is precisely the numeric-fidelity failure mode earlier research
   warned about; both figures here were read from **raw bytes**, not a summariser, so the conflict is
   real and not an artefact.
4. **Ponte Sisto, dates.** Sovrintendenza frames it by the **Jubilee of 1475** under Sixtus IV;
   [ITW] gives construction **1473–1479**. Compatible but not identical — do not merge into a single
   unattributed date.
5. **Ponte Sublicio, identity.** OSM carries **two Wikidata ids** across its objects, one of which
   (Q1466700) is the **ancient** pons Sublicius, not the 1914–17 bridge. Do not inherit OSM's ids here.
6. **Villa Aurelia vs Casino Farnese** — OSM conflates container and contained (§5.5).
7. **Santuario siriaco address** — via Dandolo **47** [ITW] vs **45** [OSM].
8. **Trastevere population** — 18,834 [OSM] vs 12,962 [ITW]. Unresolved (§6).
9. **Lateran Treaty annexe numbering for San Callisto** — index says Tav. 8, Art. 13 says Alleg. II, 9
   (§4). Internal to the primary source.

---

## 9. Photo-wave notes (Ruling 3 — nothing sourced, named or linked)

`"photos": []` everywhere. Recording only **risk intelligence** for the later four-gate wave:

- **Ex Casa della GIL / WeGil** — Luigi Moretti **died 1973**; Italy has **no freedom of panorama**.
  Same shape as the roster's Palazzo della Civiltà Italiana reject. **Expect a reject.**
- **"Triumphs and Laments"** — William Kentridge, **living artist**, and the work is the subject.
  **Expect a reject.**
- **Mausoleo Ossario Garibaldino** — Giovanni Jacobucci **died 1970**. Same category.
- **Faro del Gianicolo (1911), Palazzo degli Esami (1912), Monumento a Belli (1913, Tripisciano
  d.1913)** — likely clear on authorship dates, but each needs the gate run properly.
- **Museum interiors** (Villa Farnesina, Palazzo Corsini, Museo di Roma in Trastevere) — the roster
  already flags state/museum interiors as the highest-risk class. The Sovrintendenza publishes an
  "Autorizzazione all'uso di immagini del patrimonio culturale di Roma Capitale" procedure, which is
  the relevant municipal permission route and is worth reading before that wave.

---

## 10. Working files

All under the session scratchpad
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/`:

| File | Contents |
|---|---|
| `trastevere_osm.json` | 232 raw OSM candidate objects with full tags |
| `rione_polys.json` | raw boundary geometry, 25 units |
| `pip.py` | ring stitcher + point-in-polygon + the 8-landmark sanity harness |
| `straddle.py` / `units.json` | per-candidate centroid **and** full-geometry unit assignment |
| `dedupe.py` | name-normalised dedupe and the 210/193/17 tally |
| `geoms.json` | cached full geometry for every way/relation candidate |
| `sovr_slugs.json`, `sovr_text.json` | Sovrintendenza index enumeration and 12 fetched monument texts |
| `wiki/` | 60+ raw it.wikipedia wikitext files (raw bytes, not summarised) |
| `revgeo.json` | the failed Nominatim run — **retained as evidence of the 429 failure, not as data** |
