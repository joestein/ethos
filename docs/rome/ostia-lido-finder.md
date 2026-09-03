# Ostia Lido — Q. XXXIII, Roma Capitale toponymic code 233 — FINDER

Zone slug: `ostia-lido`. Roster row: `unit: quartiere`, `code: 233`, `numeral: Q. XXXIII`.
Roster `draw` text: *"Rome's beach. Spans the three marine quartieri Q.XXXIII–XXXV; the roster carries the
first and any page must not claim the others."*

Research date: 2026-09-03. Finder only — nothing here is a shipping decision.

---

## 0. HEADLINE FINDING — READ THIS BEFORE ANYTHING ELSE

**Q. XXXIII is not "Ostia Lido". It is `Lido di Ostia Ponente`, the WESTERN THIRD of the settlement,
and it does not contain the town centre.**

The it.wikipedia article the roster's own code resolves to opens:

> «'''Lido di Ostia Ponente''', solitamente abbreviato in '''Ostia Ponente''' e alternativamente noto
> come '''Nuova Ostia''', è il trentatreesimo quartiere di Roma, indicato con '''Q. XXXIII''', nonché
> uno dei tre quartieri di Ostia.»

*"Lido di Ostia Ponente, usually abbreviated Ostia Ponente and alternatively known as Nuova Ostia, is
the thirty-third quartiere of Rome, denoted Q. XXXIII, and one of the three quartieri of Ostia."*
— https://it.wikipedia.org/wiki/Lido_di_Ostia_Ponente (wikitext via `action=parse`, fetched 2026-09-03)

**Four of the five subjects the brief names as a starting point are NOT in Q. XXXIII.** This is the
single most important thing this file has to say, and the evidence is in §2.

| Brief's suggestion | Actual unit | How established |
|---|---|---|
| Pontile di Ostia | **Q. XXXIV Levante** (boundary object) | Roma Capitale's own address for it is *Piazza dei Ravennati*; its published POINT falls inside the OSM Levante polygon. §2.3 |
| Piazza Anco Marzio + "the Borgo" | **Q. XXXIV Levante** / the Borgo is **Z. XXXV Ostia Antica** | Piazza Anco Marzio is listed under Levante's own monuments section; Borgo Gregoriopoli belongs to the Ostia Antica zona §2.2 |
| Pineta di Castel Fusano | **Q. XXXV Lido di Castel Fusano** | It is the only entry in Q. XXXV's `Aree naturali` section. §2.2 |
| Idroscalo | **Q. XXXIII — ours.** | Listed under Ponente's `Architetture militari`; point-in-polygon confirms. §3 |

Consequence for the writer: **this page cannot be "Rome's beach".** The historic seafront — the pier,
the rotonda, the 1920s–30s villini, the Governatorato, Santa Maria Regina Pacis, the famous bathing
establishments (Kursaal, Vecchia Pineta, Plinius), the pinewood, both railway stations that say
"Ostia" to a traveller — are all in Q. XXXIV or Q. XXXV. What Q. XXXIII actually holds is the **Tiber
mouth**: two coastal towers, the disused seaplane base and the marina and bird reserve built over it,
plus one inland strip of 1920s–30s civic architecture along corso Duca di Genova and via Ostiense.

That is a real subject. It is not the subject the brief expected.

---

## 1. TAKEN-SLUG CHECK — RUN AND CLEAN

```
python3 .superpowers/taken_slugs.py ostia    → 0 matches
python3 .superpowers/taken_slugs.py fusano   → 0 matches
python3 .superpowers/taken_slugs.py lido     → 0 matches
python3 .superpowers/taken_slugs.py mare     → 4 matches, none in Ostia
```
Nothing in any of the four Ostia units is owned by the 21 shipped rioni (786 places). No collision
risk with wave 1–4. The collision risk is **lateral**, with the other eight zones in this wave —
specifically `ostia-antica` (Z. XXXV), which is a live roster row with its own finder. See §5.

---

## 2. BOUNDARY WORK — how each unit was established

### 2.1 Method

Three independent instruments, used together:

1. **The quartiere articles' own boundary prose**, which Roma Capitale-derived and mutually
   consistent across all three marine quartieri (each names the other as its neighbour and names the
   same separating street).
2. **OSM relation polygons**, fetched from Overpass and point-in-polygon tested locally in Python
   rather than through Nominatim reverse geocoding (Nominatim rate-limited hard after five calls and
   returns `suburb: "Municipio Roma X"` for parts of Ponente, i.e. it is unreliable here).
   Relations used: `r5362392` Lido di Ostia Ponente (581-node ring), `r5362391` Lido di Ostia Levante
   (246), `r5358875` Lido di Castel Fusano (319), `r5329140` Ostia Antica (204). All four stitched
   closed cleanly.
3. **The institution's or subject's own statement** where it exists — several it.wikipedia articles
   name the quartiere in their first sentence, and several carry an explicit
   `[[Categoria:Roma Q. XXXIII Lido di Ostia Ponente]]`.

Where all three agree I treat the unit as established. Where any two disagree I flag it and do not
resolve it.

### 2.2 The boundary prose, verbatim

**Q. XXXIII Ponente** — https://it.wikipedia.org/wiki/Lido_di_Ostia_Ponente

> «Il quartiere confina:
> * a nord-ovest con il comune di Fiumicino (ex Z. XXXVI Isola Sacra) [Separato dal fiume Tevere,
>   dalla foce al ponte di Tor Boacciana]
> * a nord-est con la zona Z. XXXV Ostia Antica [Separato da via di Tor Boacciana e via Guido Calza,
>   dal Ponte di Tor Boacciana a via Ostiense]
> * a est con la zona Z. XXXIV Casal Palocco [Separato dalla via Ostiense, nel tratto da via Guido
>   Calza fino all'altezza di via Capo dell'Argentiera] e il quartiere Q. XXXIV Lido di Ostia Levante
>   [Separato dalla via Ostiense, da viale Capitan Consalvo e da viale della Marina fino alla rotonda
>   (piazza dei Ravennati)]
> * a sud-ovest con il Mar Tirreno [Dalla rotonda alla foce del Tevere]»

**Q. XXXIV Levante** gives the mirror image — https://it.wikipedia.org/wiki/Lido_di_Ostia_Levante

> «a ovest il quartiere Q. XXXIII Lido di Ostia Ponente [Separato, a partire dalla rotonda, da viale
> della Marina, da viale Capitan Consalvo e da via Ostiense, fino all'altezza di via Capo
> dell'Argentiera]»

**So the Ponente/Levante line is: via Ostiense → viale Capitan Consalvo → viale della Marina → the
rotonda at piazza dei Ravennati.** Everything seaward and east of that line is Levante.

**Q. XXXV Lido di Castel Fusano** — https://it.wikipedia.org/wiki/Lido_di_Castel_Fusano — has a
`Monumenti e luoghi d'interesse` section of exactly two entries: Villa della Palombara (the
"villa di Plinio") and the **Parco urbano Pineta di Castel Fusano**. The pinewood is unambiguously
Q. XXXV and **no page of ours may claim it.**

Also note, because the numeral collides: **Q. XXXV is Lido di Castel Fusano; Z. XXXV is Ostia
Antica.** They are different units. `docs/rome/scope-quartieri.md` §5.1 already flags this.

### 2.3 Point-in-polygon results (OSM relations, tested locally)

Ours — inside `r5362392` Lido di Ostia Ponente:

| Subject | lat,lon | Source of the coordinate |
|---|---|---|
| Tor San Michele | 41.74266, 12.25217 | it.wiki `{{Coord}}` in the Ponente article |
| Tor Boacciana / Roman lighthouse remains | 41.75267, 12.27775 | it.wiki `{{Coord}}`; OSM `man_made=tower` node |
| Ex Colonia marina Vittorio Emanuele III | 41.73178, 12.27136 | it.wiki `{{Coord}}` |
| Cappella della Colonia marina | 41.73141, 12.27158 | it.wiki `{{Coord}}` |
| Teatro del Lido | 41.73265, 12.27103 | OSM `amenity=arts_centre`, `wikipedia=it:Teatro del Lido` |
| Biblioteca Elsa Morante (in the Colonia) | 41.73185, 12.27046 | OSM `amenity=library` |
| Ufficio postale di Ostia Lido | 41.73234, 12.27778 | OSM, `wikipedia=it:Ufficio postale di Ostia Lido` |
| Fontana delle Sirene (in its portico) | 41.73226, 12.27776 | OSM `amenity=fountain` |
| Cineland | 41.74626, 12.28691 | OSM, matches it.wiki infobox 41.746749/12.286394 |
| Centro Habitat Mediterraneo | 41.74023, 12.24772 | OSM `leisure=nature_reserve` |
| Parco Letterario Pier Paolo Pasolini + Pasolini memorial | 41.74167, 12.24895 / 41.74154, 12.24894 | OSM `leisure=park` / `historic=memorial` |
| Case popolari, corso Duca di Genova | 41.73379, 12.27283 | it.wiki `{{Coord}}` |
| Chiesa di Santa Monica | 41.73686, 12.27227 | OSM, `wikipedia=it:Chiesa di Santa Monica (Ostia)` |
| Chiesa di Nostra Signora di Bonaria | 41.73814, 12.26346 | it.wiki `{{Coord}}` |
| Chiesa di Santa Teresa di Gesù Bambino | 41.73079, 12.27490 | OSM |
| Chiesa di San Vincenzo de' Paoli | 41.73722, 12.26070 | OSM |
| Antico Deposito Ghiaccio Birra Peroni | 41.73380, 12.27850 | OSM `historic=monument` |
| Mercato Orazio dello Sbirro | 41.73326, 12.27607 | OSM `amenity=marketplace` |
| Mercato dell'Appagliatore | 41.73889, 12.26332 | OSM `amenity=marketplace` |
| Parco Willy Ferrero | 41.73646, 12.25732 | OSM / it.wiki |
| Parco Giuseppe Pallotta | 41.74133, 12.26208 | OSM / it.wiki |
| Giardino Alberto Giaquinto | 41.73894, 12.26877 | it.wiki `{{Coord}}` |
| Parco Gioacchino Angelo | 41.74062, 12.27191 | it.wiki `{{Coord}}` |
| Teatro Affabulazione | 41.73627, 12.26502 | OSM `amenity=theatre` |
| The OSM settlement node "Lido di Ostia" (`wikipedia=it:Ostia (Roma)`) | 41.73260, 12.27846 | OSM |

NOT ours — tested and landing in a neighbouring unit:

| Subject | Lands in | lat,lon |
|---|---|---|
| Pontile di Ostia, landward end | **Levante** | 41.72921, 12.27617 (Roma Capitale's own published POINT) |
| Rotonda / piazza dei Ravennati | **Levante** | 41.72986, 12.27694 |
| Piazza Anco Marzio / Palazzo del Pappagallo | **Levante** | 41.72943, 12.27837 |
| Villini Rossini | **Levante** | 41.72957, 12.27736 |
| Palazzo del Governatorato (seat of Municipio X) | **Levante** | 41.73066, 12.27963 |
| Chiesa di Santa Maria Regina Pacis | **Levante** | 41.73166, 12.28131 |
| Stazione Lido Centro | **Levante** | 41.73320, 12.28417 |
| Stazione Stella Polare | **Levante** | 41.72718, 12.29534 |
| Pineta di Ostia | **Levante** | 41.73620, 12.30179 |
| Borghetto dei Pescatori | **Levante** (its own article: «un rione che sorge nella parte levante della città») | ~41.72191, 12.30244 |
| Fontana dello Zodiaco + piazzale Cristoforo Colombo ("la Rotonda") | **Q. XXXV** | 41.71428, 12.31693 |
| Kursaal Village, La Vecchia Pineta, Nuova Pineta, Plinius-area lidos | **Q. XXXV / Levante** | 41.715–41.723, 12.293–12.316 |
| Enalc Hotel (now Roma Tre) | **Q. XXXV** — its own article says it is reached from Stazione di Castel Fusano | ~41.716, 12.317 |
| Centro Olimpico Matteo Pellicone / PalaPellicone | **Q. XXXV** | 41.71968, 12.30921 |
| Parco urbano Pineta di Castel Fusano, Villa della Palombara/"di Plinio", Villa Chigi | **Q. XXXV / Z. XXX** | 41.71–41.735, 12.318–12.347 |
| Ostia Antica scavi, Museo Ostiense, Castello di Giulio II, Basilica di Sant'Aurea, Borgo | **Z. XXXV** | 41.749–41.760, 12.281–12.302 |

### 2.4 Municipio

The three marine quartieri **do** have a clean single Municipio, unusually for quartieri: all three
infoboxes give `circoscrizione = Municipio Roma X`, and `docs/rome/scope-quartieri.md` §2.2 records
independently that "Q.XXXIII/XXXIV/XXXV → X". **Municipio Roma X is safe to state for this zone.**
Its seat, however (Palazzo del Governatorato, piazza della Stazione Vecchia), is in Levante and must
not be written as a place here.

Zona urbanistica: «Nel territorio di Lido di Ostia Ponente si estende la zona urbanistica 13F Ostia
Nord.» — the Ponente article. 13G Ostia Sud is Levante's, 13H Castel Fusano is Q. XXXV's, 13E Ostia
Antica is the zona's. Roma Capitale's own 155-row zone-urbanistiche table (already extracted in
`scope-quartieri.md`) lists `13F Ostia Nord`, `13G Ostia Sud`, `13H Castel Fusano`, `13E Ostia
Antica`, which corroborates all four.

---

## 3. CANDIDATES — Q. XXXIII, with sourced facts

Kind values are from the thirteen the schema allows (`kind_note` in the roster). There is no
"church", "monument", "square", "library" or "marina" kind; those become `historic-site`,
`attraction` or `park`.

### 3.1 Tor San Michele — `historic-site` — STRONGEST CANDIDATE

- **Address**: via degli Atlantici (Ponente article). 41.74266, 12.25217.
- **Unit**: stated by the subject itself. «La torre è posizionata nella parte orientale di un'ampia
  area verde compresa tra via degli Atlantici e via dell'Idroscalo, **nel quartiere di Roma Lido di
  Ostia Ponente**, e dista circa un centinaio di metri dal fiume e più o meno due chilometri dal
  mare, anche se originariamente era posta ad una distanza di 50 metri dalla linea di costa.»
  — https://it.wikipedia.org/wiki/Tor_San_Michele
- **What it is / when / by whom**: an octagonal coastal fort at the Tiber mouth. Roma Capitale's own
  sheet: «Il ruolo di presidio fortificato del Tevere fu quindi assunto dalla medioevale Tor
  Boacciana … in attesa che venisse edificato, presso l'idroscalo di Ostia, il maschio di Tor San
  Michele. La costruzione della struttura, progettata da Michelangelo Buonarroti, ebbe inizio nel
  1559 e fu terminata nel 1568, durante il pontificato di Pio V, da Giovanni Lippi, che subentrò a
  Michelangelo dopo la sua morte.»
  — https://www.comune.roma.it/web-resources/cms/documents/Tor_SanMichele.pdf (PDF, text extracted)
- **Why it was built**: the same PDF: «Lo straripamento del Tevere nel 1557 comportò un notevole
  mutamento nelle condizioni del nostro territorio, spostando il corso del fiume verso settentrione e
  provocando un avanzamento della costa, nei pressi del suo delta, di oltre un chilometro.»
- **Measurements**: Roma Capitale — «L'edificio a pianta ottagonale ha un'altezza di 18 metri ed un
  perimetro di 96, è totalmente casamattato e dislocato su tre livelli, ognuno comprensivo di otto
  vani con volta a crociera. Originariamente era circondato da un fossato con un doppio sistema di
  ponti levatoi.» Turismo Roma (Roma Capitale) repeats this verbatim:
  https://www.turismoroma.it/it/luoghi/tor-san-michele
  it.wikipedia's infobox gives a total height of 24.1 m (18.5 m tower + 5.6 m lantern turret) and
  sides of ~12 m. **CONFLICT: 18 m (Roma Capitale) vs 24.1 m (it.wiki infobox).** They are measuring
  different things; publish the Roma Capitale figure for the tower or publish neither.
- **Later life**: absorbed into the seaplane base and used as a lighthouse then a radio beacon.
  «Con l'inaugurazione dell'idroscalo di Ostia Carlo del Prete nel 1928 la torre fu ricompresa nel
  perimetro di quest'ultimo ed assunse la funzione di radiofaro.» (it.wiki)
- **Access**: it.wiki infobox `Visitabile = Sì su prenotazione`, `Proprietario attuale =
  Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma`, and the article says the
  Soprintendenza tendered the management, won in 2018 by the Associazione Culturale Quattro Sassi,
  which reopened the tower during 2021. **The Soprintendenza's own page for it
  (`soprintendenzaspecialeroma.it/schede/tor-san-michele_3213/`) now returns 404** — so we have no
  first-party statement of current hours. Write: no source states its opening hours, so none are
  given here. `status: open` with prose saying access is by arrangement, or `status: open` with
  silence — do NOT write "closed", which would be an affirmative claim.
- **Attribution caution**: the Michelangelo attribution is contested in the subject's own article
  («L'attribuzione del progetto a Michelangelo non è mai stata accertata») even though Roma Capitale
  states it flat. Write it as Roma Capitale's attribution, or write "on a design attributed to
  Michelangelo". Do not write "Michelangelo's only …" — that would be a banned superlative.

### 3.2 Tor Boacciana, with the Roman lighthouse remains beneath it — `historic-site` — STRADDLER, FLAGGED

- **Address**: via del Ponte di Tor Boacciana (Ponente article). 41.75267, 12.27775.
- **Unit**: it.wikipedia carries `[[Categoria:Roma Q. XXXIII Lido di Ostia Ponente]]`, and the
  Ponente article lists it under `Architetture militari`. Point-in-polygon: inside Ponente.
  **BUT** the subject's own institutional page places it under the Ostia Antica park:
  «Tor Boacciana è una torre medievale e sito archeologico situata lungo la riva del fiume Tevere,
  a circa 4 km dalla foce, nel territorio di Roma Capitale al confine con quello del comune di
  Fiumicino, **gestito dal Parco archeologico di Ostia antica**.»
  — https://it.wikipedia.org/wiki/Tor_Boacciana ; institutional page
  https://www.ostiaantica.beniculturali.it/it/aree-archeologiche-e-monumentali/ostia-antica/tor-boacciana/
  **FLAG FOR THE ARBITRATOR: the `ostia-antica` finder may claim this on institutional grounds.
  Geographically it is Ponente. I have not resolved it.** Note that Z. XXXV's own monuments list does
  *not* include Tor Boacciana, which argues for Ponente.
- **Facts**: the base is imperial Roman, probably a lighthouse or watchtower, dated by brick stamps:
  «La base della torre, composta da ruderi di epoca romana imperiale, è probabilmente quanto rimane
  di un faro o di una torre di avvistamento risalente al II secolo – come reso evidente dai bolli sul
  laterizio – e verosimilmente legata all'attività commerciale di Porto.» The upper tower is 12th
  century. Restored 1406 under Innocent VII and 1420 under Martin V; used as the papal customs post
  from 1562 until 1568, when customs moved to Tor San Michele.
- The Ponente article separately lists the **Faro romano** as its own `Siti archeologici` entry, on
  via del Ponte di Tor Boacciana, 41.75267/12.27766, dated «98-117 d.C.», with the note «Sui resti fu
  eretta la torre Boacciana». Same object, two entries. Treat as one place.

### 3.3 The Idroscalo — ex Idroscalo Lido di Roma "Carlo Del Prete" — `historic-site`

- **Location**: «all'estremità ovest del quartiere» (Ponente article, `Architetture militari`), at
  the Tiber mouth. Access road via dell'Idroscalo.
- **Unit**: listed by the Ponente article; the whole cluster (marina, LIPU oasis, Pasolini park) PIPs
  inside Ponente.
- **Facts, from Roma Capitale's own tourism site**
  (https://www.turismoroma.it/it/luoghi/l%E2%80%99idroscalo):
  «l'idroscalo viene costruito una prima volta nel 1919, inaugurato con il primo collegamento aereo
  tra l'Italia e le coste nordafricane. A causa di problemi di erosione fu smantellato nel 1922 per
  essere ripristinato poco più in là a partire dal 3 marzo del 1926. Nel 1933 presso l'idroscalo di
  Ostia atterrò Italo Balbo dopo aver trasvolato l'Atlantico.» And: «Il 2 novembre del 1975 il corpo
  di Pasolini venne ritrovato in quest'area.»
- **Fuller version** — https://it.wikipedia.org/wiki/Idroscalo_di_Ostia — first built to the design
  of the engineer Raffaele Tarantini; named for the aviator Carlo Del Prete after 1928; arrival point
  of Francesco de Pinedo's Two Americas cruise in 1927 and of Italo Balbo's Decennale squadron on
  12 August 1933; home to the Società Aerea Mediterranea and Ala Littoria. In 1929 the futurist
  Gerardo Dottori decorated the waiting-room walls; only a sketch survives. German forces destroyed
  the main structures in 1943. A spontaneous settlement grew there from the 1960s; ~35 dwellings were
  cleared in 2010. The 2020 documentary *Punta sacra* (Francesca Mazzoleni, Alice nella città) is
  about the surviving community.
- **Film**: sequences of *8½* (Fellini, 1963), *Amore tossico* (Caligari, 1983) and *Caro diario*
  (Moretti, 1993) were shot in the area. (it.wiki, cited to ANSA and Corriere.)
- **Prose caution**: this is a place where a real person was murdered and where people were evicted
  from their homes. Handle plainly; state the date and the fact, and do not aestheticise it.

### 3.4 Porto Turistico di Roma — `attraction`

- **Address**: main entrance **Lungomare Duca degli Abruzzi 84**; vehicle entrance from via del Porto
  di Roma. — https://it.wikipedia.org/wiki/Porto_turistico_di_Roma
- **Unit**: the entrance address PIPs inside Ponente. The basin itself falls outside every land
  polygon (it is water); the it.wiki infobox coordinate 41.771333/12.220324 is plainly wrong (it is
  out at sea north of the Tiber) — **do not use it.** The wikitext says the port is "nella frazione
  litoranea di Ostia, nel territorio del Municipio Roma X" and was built as part of the Idroscalo
  regeneration, which is Ponente.
- **Facts, official site** — https://www.portoturisticodiroma.it/ :
  «Inaugurato il 23 giugno del 2001, il Porto Turistico di Roma si trova immediatamente a sud della
  foce del Fiume Tevere» — and the site's own figures: **840 posti barca**, **100 negozi e
  ristoranti**, **1400 posti auto**, control tower on VHF 74 **active 07.00–23.00**, office
  **09.00–13.00 and 15.00–19.00**, promenade «di un chilometro».
- **CONFLICT**: it.wikipedia gives the inauguration as **24 June 2001** (cited to *la Repubblica*,
  24 June 2001) and `postibarcatotali = 833`. The operator's own site says 23 June 2001 and 840.
  Use the operator for identity/berths/hours (its own site establishes those per the corpus rules);
  either drop the date or attribute the newspaper's. **Do not write a founding year as a
  trading-duration claim** — "open since 2001" is fine as an event; "has served boaters for 25 years"
  is not, and the site's own "25 Years Experience" banner is exactly the thing the corpus bans.
- **Do not repeat** the operator's marketing line "LA PORTA DI ACCESSO ALLA CAPITALE DAL MARE".
- **Do not mention** the 2015 arrest of the port's administrator; it is an ongoing-reputation matter
  about a named private individual and has no place in a travel entry.

### 3.5 Centro Habitat Mediterraneo (Oasi LIPU Ostia) + Parco Letterario Pier Paolo Pasolini — `park`

- **Address**: **Via dell'Idroscalo, 00121 Lido di Ostia RM** — the operator's own page,
  https://www.lipu.it/oasi-riserve/oasi-chm-ostia
- **Unit**: 41.74023, 12.24772 → inside Ponente. Also listed under Ponente's `Aree naturali`, with
  the note «Comprende il Parco Pier Paolo Pasolini».
- **Hours, from LIPU itself** (a first-party statement of access, so publishable):
  «Il centro visite dell'Oasi è aperto nelle giornate di lunedì-mercoledì-venerdì-sabato-domenica
  dalle ore 10 alle ore 13 per informazioni ed il recupero della fauna selvatica. Il sabato e la
  domenica dalle 10 alle 13 vi è libero accesso all'Oasi, mentre, previa prenotazione, sono possibili
  visite guidate durante tutti i giorni della settimana.»
- **What it is**, from the Porto Turistico's page on it
  (https://www.portoturisticodiroma.it/il-centro-habitat-mediterraneo-lipu/): «un centro naturalistico
  ampio oltre 20 ettari, realizzato in una zona precedentemente occupata da una discarica a cielo
  aperto». A reconstructed coastal lake; «oltre 200 specie di uccelli» recorded; a nature trail
  reaching «tre ampi capanni per il birdwatching, tre moderni capanni Skua … ed il giardino delle
  farfalle»; an open-air classroom and the Mario Pastore visitor centre.
- **BANNED PHRASE PRESENT IN THE SOURCE**: LIPU/the port write that the purple heron is here «con la
  più importante colonia del Lazio». That is a superlative and **must not be reproduced**, attributed
  or not. Write "purple heron breeds here" and stop.
- The **Parco Letterario Pier Paolo Pasolini** occupies the place where Pasolini was killed; the port
  describes it as «recuperato ed attrezzato a giardino letterario». OSM has both a `leisure=park`
  named *Parco Letterario Pier Paolo Pasolini* and a `historic=memorial` *Monumento a Pier Paolo
  Pasolini* at 41.74154/12.24894. The Ostia article notes there are **four** Pasolini memorials in
  the settlement — piazza Anco Marzio, parco Willy Ferrero, piazza Lorenzo Gasparri, via
  dell'Idroscalo — of which the Anco Marzio one is in **Levante** and the other three are ours.

### 3.6 Ex Colonia marina Vittorio Emanuele III — `historic-site` — with a hard warning

- **Address**: **Lungomare Paolo Toscanelli 176–184 / Via Adolfo Cozza 7** (it.wiki infobox). Occupies
  the block bounded by lungomare Paolo Toscanelli, via Adolfo Cozza, largo delle Sirene and via
  Giuliano da Sangallo. 41.73178, 12.27136 → Ponente.
- **Facts, Roma Capitale's own sheet**
  (https://www.comune.roma.it/web-resources/cms/documents/Ex_colonia.pdf, PDF text extracted):
  «La prima colonia marina di Ostia nacque nel 1916, su progetto dell'architetto Marcello Piacentini.
  Era una costruzione in cemento armato che vantava refettori, cucine, sale svago e due grandi
  camerate per un totale di 80 posti letto … Nel 1925 … venne proposto l'ampliamento della struttura
  per contrastare la lotta alla tubercolosi. Il progetto venne affidato all'architetto Vincenzo
  Fasolo, che dette il via ai lavori il 20 gennaio del 1927. L'inaugurazione della struttura avvenne
  il 24 gennaio del 1932, alla presenza della regina Elena … il cosiddetto "Ospizio Marino e Colonia
  di Profilassi" fu intitolato al sovrano d'Italia. Il tutto era dislocato su un'area di circa 16.000
  metri quadrati … Per facilitare lo spostamento dei ragazzi fino al mare fu costruito un sottopasso,
  ancora esistente, che li conduceva direttamente in spiaggia. Il complesso fu occupato e
  semidistrutto dai tedeschi nel 1943 e rimase inattivo fino alla ristrutturazione avvenuta nei primi
  anni '50.»
- **Description**: it.wiki — two linked blocks, the eastern one four comb-plan buildings on a
  hospital model, the western one arranged round a courtyard "quasi ad un convento".
- **⛔ EVIDENCE-RULING VIOLATION IN THE SOURCE.** it.wikipedia states: «L'edificio, di proprietà
  comunale, è **sottoposto a vincolo** ai sensi del Codice dei beni culturali e del paesaggio.»
  **This is exactly what evidence_ruling bans. It must not appear in any form in the corpus** — not
  as "vincolato", not as "protected", not as "listed", not attributed to Wikipedia or to Roma
  Capitale's technical report. Delete the idea, not just the word.
- **⛔ SUPERLATIVE IN THE SOURCE.** Roma Capitale's sheet calls the Elsa Morante library «una delle
  migliori della capitale». Banned. Do not reproduce.
- **What it holds now**: the Teatro del Lido, the Biblioteca Elsa Morante, a Caritas soup kitchen, a
  seniors' centre, the Municipio X technical office and a hostel. Part of the complex is occupied by
  people living there. Write the civic uses; do not write the occupation as colour.

### 3.7 Teatro del Lido di Ostia — `theater`

- **Address**: **Via delle Sirene 22, 00121 Ostia (Roma)** — the theatre's own page under Roma
  Capitale's Teatri in Comune network, https://teatriincomune.roma.it/teatro-del-lido-di-ostia/
  (`teatrodellido.it` redirects there).
- **Unit**: it.wikipedia carries `[[Categoria:Roma Q. XXXIII Lido di Ostia Ponente]]`. PIP: Ponente.
- **What it is**: one of the four venues in Roma Capitale's *Teatri in Comune* circuit (with Teatro
  Biblioteca Quarticciolo, Teatro Tor Bella Monaca, Teatro Villa Pamphilj). It sits inside the ex
  Colonia marina complex. https://it.wikipedia.org/wiki/Teatro_del_Lido
- **History**: the spaces stood unused for over 25 years until local artists started the theatre in
  1997; restoration began in 2000; the new venue was inaugurated in February 2003; it closed in June
  2008; on 26 February 2010 a committee reoccupied it and it later reopened under an agreement.
- **⛔ SUPERLATIVE IN THE SOURCE**: it.wikipedia calls it «il primo "teatro di cintura" della città di
  Roma». "The first X in Rome" is a priority claim of exactly the banned kind and there is no
  reachable register to check it against. Do not publish it. The *Legge regionale 15 settembre 2005
  n. 16* definition of *teatri di cintura* that the footnote quotes is publishable as a description
  of the category; the "first" is not.
- **Hours/programme**: the official page carries a live listing that at time of research read
  "Non ci sono eventi in programma." **Do not publish a programme state** — it changes weekly and
  saying "nothing is on" would be a false permanent claim. `status: open`; say the season is
  published by Teatri in Comune.

### 3.8 Biblioteca Elsa Morante — `attraction` (no `library` kind exists)

- **Normal address**: inside the ex Colonia, lungomare Paolo Toscanelli. **Currently displaced.**
- **The live fact, and it matters**: «Dal settembre 2025, per lavori di manutenzione, la sede della
  biblioteca è stata provvisoriamente trasferita presso il porto turistico di Ostia» — it.wikipedia,
  corroborated by the Porto Turistico article: «Dal 4 settembre 2025 il Porto turistico ospita
  temporaneamente la Biblioteca Elsa Morante». OSM has both nodes: 41.73185/12.27046 (Colonia) and
  41.73762/12.24930 (Lungomare Duca degli Abruzzi 84, the port). **Both are in Ponente**, so the move
  does not change ownership — but a page that gives the Colonia address without the move is wrong.
- Opened 2001 out of Giubileo 2000 funds; part of Roma Capitale's Istituzione Sistema Biblioteche e
  Centri Culturali; ~31,000 books, 3,100 DVDs, 2,500 audio CDs; open-shelf; a collection of nearly a
  hundred titles in Comunicazione Aumentativa e Alternativa.
  https://www.bibliotechediroma.it/opac/library/Biblioteca%20Elsa%20Morante/RMBO2
- **Recommend: verify the move is still current before shipping.** A temporary relocation is the kind
  of fact that goes stale. If it cannot be re-checked, write the library as part of the Colonia entry
  rather than as its own place.

### 3.9 Ufficio postale di Ostia Lido (Palazzo delle Poste), with the Fontana delle Sirene — `historic-site`

- **Address**: **piazzale della Posta**, on the corner of via Ostiense and corso Duca di Genova.
  41.73234, 12.27778 → Ponente. it.wikipedia carries
  `[[Categoria:Roma Q. XXXIII Lido di Ostia Ponente]]`; its first line says «situato in piazzale
  della Posta, nel quartiere Lido di Ostia Ponente».
- **⚠ DATE CONFLICT, UNRESOLVED.** The building's own article says: «Progettato nel 1933
  dall'architetto e ingegnere Angiolo Mazzoni su commissione del Ministero delle comunicazioni, fu
  inaugurato nel 1934» (infobox: `periodo costruzione = 1933-34`). **But** both the Ponente quartiere
  article and the main Ostia article date it **1939-42**. ArchiDiAP, the architecture-school source
  both cite, gives «Corso Duca di Genova, 00121 Lido di Ostia RM, Italia, **-1934**»
  (https://www.archidiap.com/opera/ufficio-postale-di-ostia-lido/), i.e. it agrees with 1933–34. My
  reading is that 1933–34 is right and 1939-42 is a Wikipedia list error propagated between articles
  — but two Wikipedia pages disagree and I am not resolving it. **Either publish 1933–34 citing
  ArchiDiAP, or publish no date.**
- **What it is**: Mazzoni was chief engineer of the Ferrovie dello Stato and designed the post offices
  of Grosseto, Sabaudia, Latina, Palermo, La Spezia, Trento and Ostia. The Ostia building is a
  futurist-inflected work — Mazzoni co-signed the *Manifesto futurista dell'architettura aerea* with
  Marinetti in the same years.
- **The fountain**: **Napoleone Martinuzzi** (1892–1977), a Murano glass artist and sculptor, made the
  fountain at the centre of the portico's open basin: «La fontana in rame sbalzato rappresenta due
  sirene a doppia coda che sopra il capo sorreggono due calici d'acqua; il rivestimento della vasca è
  di mattoni di vetro azzurro di Murano». OSM records it as `amenity=fountain` "Fontana delle Sirene"
  at 41.73226/12.27776.
- **Still in use**: it houses the Roma Ostia Lido post office (frazionario 55472). The 1934 plaque
  reading REGIE POSTE TELEGRAFI TELEFONI is still at the entrance (it.wiki photo caption).
- **Caution**: the it.wikipedia article carries an `{{NN}}` unsourced-content banner over its
  architecture section and its long comparative essay is unattributed opinion. Take the hard facts
  (architect, materials, fountain, function) and leave the criticism.

### 3.10 Cineland, in the ex Meccanica Romana — `theater` (multiplex cinema)

- **Address**: **Viale dei Romagnoli 515** (it.wiki infobox and OSM `addr:street`/`addr:housenumber`).
  41.74626, 12.28691 → Ponente. Both `Cineland` and `Ex Meccanica Romana` carry
  `[[Categoria:Roma Q. XXXIII Lido di Ostia Ponente]]`; the Meccanica Romana article says «situato su
  via dei Romagnoli, nel quartiere Lido di Ostia Ponente».
- **The building**: built 1927–29 for the engineer Pio Perrone to a design by **Pietro Barbieri**,
  Ostia's first factory, opened in 1929 as S.T.I.M.A. (Società Trattori Italiani e Macchine Agricole)
  — a name proposed by Mussolini. It became a steelworks (SAR) in 1941, was bought by Breda Meccanica
  Romana in 1952 to build parts for the Roma–Lido trains, and closed in 1973.
  https://it.wikipedia.org/wiki/Ex_Meccanica_Romana
- **The cinema**: converted from a project dated 10 December 1987, by the architects **Maria Guarrera
  and Bruno Spinozzi**, opened **15 September 1999** by Ci.Me. Grandi Impianti S.r.l. of Giuseppe
  Ciotoli and Giuseppe Merluzzi, at a cost of 26 billion lire.
  Roma Capitale's sheet (https://www.comune.roma.it/web-resources/cms/documents/Cineland.pdf) adds:
  all the original façades were kept and consolidated; the steelwork was reproduced; **15,000 m²
  covered and 60,000 m² of green**; **14 screens**, **16 bowling lanes**, an arcade and VR centre,
  restaurants, shops and **3,000 parking spaces**. it.wiki gives **2,860 seats**.
  Live programme and ticketing: https://www.cineland.it/
- **⛔ SUPERLATIVE IN THE ROMA CAPITALE SHEET**: it opens «Una delle più grandi multisala
  cinematografiche d'Europa». Banned, attributed or not. Screen count and seat count are the
  publishable substitutes.
- **⚠ NUMBER CONFLICT**: 15,000 m² covered + 60,000 m² green (Roma Capitale) vs `area calpestabile =
  14 000 m²` and «60 000 m² di verde» (it.wiki infobox/body). Pick one source and attribute it.

### 3.11 Palazzo dell'ex GIL — `historic-site` — CLOSED, and say so honestly

- **Address**: **Corso Duca di Genova 82 / Via delle Sirene 79 / Via Franco Mezzadra 36**, the block
  bounded by corso Duca di Genova, via delle Sirene, viale Vasco de Gama and via Francesco Mezzadra,
  120 × 70 m. https://it.wikipedia.org/wiki/Palazzo_dell%27ex_GIL_(Roma,_Ostia)
- **Unit**: same block as the Teatro del Lido; PIP Ponente.
- **Facts**: designed by **Paolo Benadusi** as the local seat of the Opera Nazionale Balilla, built
  1933–36, inaugurated **8 August 1935** in Mussolini's presence. Later a public school, closed in
  July 2009 as unfit for use. The Region transferred it to Roma Capitale in 2020 and thence to
  Municipio X, which plans to restore it as the local police "X Mare" group's seat and a giudice di
  pace office. Three ranges in an L round a rectangular courtyard, with a semicircular three-storey
  tower rising to 18.5 m over an open ground-floor portico. A 1930s decorative panel by **Oddo
  Aliventi** survives in the meeting room.
- **Status**: infobox `stato = abbandonato`. This is one of the few places here where `closed` is an
  affirmative claim the source actually supports — the school closed July 2009 and the building is
  recorded as abandoned. Even so, prefer prose ("it has stood empty since the school closed in 2009")
  over a bare status flag, and re-verify before shipping.

### 3.12 Scuola Fratelli Garrone — `historic-site`

- **Address**: **corso Duca di Genova**. https://it.wikipedia.org/wiki/Scuola_Fratelli_Garrone —
  first line: «è un edificio scolastico di Roma situato su corso Duca di Genova, **nel quartiere Lido
  di Ostia Ponente**», and it carries the Q. XXXIII category.
- **Facts**: commissioned in 1934 by the Governatorato di Roma from **Ignazio Guidi**, built 1934–35,
  opened 1935, dedicated to the brothers Giuseppe and Eugenio Garrone. Three ranges for three streams
  — 24 elementary classrooms, ten for the ginnasio, ten for vocational — with a gymnasium and a
  first-aid post each having an independent entrance. Contemporary source: *Capitolium. Rassegna
  mensile del Governatorato*, anno X n. 8, 1934, "Una nuova scuola al Lido di Roma", scanned at
  archiviocapitolinorisorsedigitali.it (URL in the article's bibliography).
- **It is a working primary school** (secondary site of the Istituto Comprensivo "Via Giuliano da
  Sangallo"). Publishable as an exterior; do not imply a visitor can go in.

### 3.13 Case popolari, corso Duca di Genova — `historic-site` (streetscape)

- 41.73379, 12.27283 → Ponente. Buildings of 1926 in *barocchetto romano* by **Camillo Palmerini**.
  Both the Ponente article and the main Ostia article carry this. The only cited source is a photo
  album on lamiaostia.com (http://www.lamiaostia.com/case_popolari/album/), an enthusiast site.
  **Weak sourcing — attribute the aggregator or drop.**

### 3.14 Chiesa di Santa Monica — `historic-site`

- **Address**: **piazza di Santa Monica**. 41.73686, 12.27227 → Ponente. OSM carries
  `wikipedia=it:Chiesa di Santa Monica (Ostia)`.
- **Facts**: work began **13 June 1968**, Corpus Domini, with Paul VI blessing the foundation stone;
  designed by **Ernesto Vichi**; opened on the evening of **7 December 1972** by Rome's auxiliary
  bishop Remigio Ragonesi; consecrated **22 December 1973**. A vicecura from January 1956, it became
  a parish on **13 November 1958** by the decree *Romanus Pontifex* of Cardinal Vicar Clemente
  Micara. https://it.wikipedia.org/wiki/Chiesa_di_Santa_Monica_(Ostia) ; parish record at
  https://www.diocesidiroma.it/phpenti/ente/?ID=150
- Note for context, not for a claim: Paul VI's presence and the dedication to Monica of Tagaste, who
  died at Ostia, are both real hooks. Do not turn "she died at Ostia" into a claim about *this*
  building.

### 3.15 Cappella della Colonia marina Vittorio Emanuele III — `historic-site`

- Lungomare Paolo Toscanelli, 41.73141/12.27158 → Ponente. A chapel of **1932** by **Vincenzo
  Fasolo**, part of the Colonia complex. Source: the Ponente article's `Architetture religiose`
  section only; **no standalone article exists** (I checked; the title 404s). Thin. Best folded into
  the Colonia entry rather than shipped alone.

### 3.16 Antico deposito della Birra Peroni — `historic-site`

- OSM `historic=monument`, "Antico Deposito Ghiaccio Birra Peroni", 41.73380/12.27850 → Ponente.
  The Ostia article calls it «un edificio del 1922 in stile razionalista», cited only to a local news
  feature (https://ostia.newsgo.it/2017/09/ostia-segreta-lantico-deposito-della-birra-peroni/).
  **Single weak source; "1922 in rationalist style" is also stylistically odd for that date.**
  Flag as low-confidence; verify or drop.

### 3.17 Parks and squares in Ponente — mostly `park`, mostly thin

All PIP inside Ponente; all sourced only to the quartiere article's own coordinate list:
- **Parco Willy Ferrero**, between piazzale Lorenzo Gaspari and lungomare Duca degli Abruzzi,
  41.73651/12.25734 — carries one of the four Pasolini memorials.
- **Parco Giuseppe Pallotta**, between via della Martinica, via Tancredi Chiaraluce, via
  dell'Appagliatore and via delle Ebridi, 41.74162/12.26218.
- **Parco Gioacchino Angelo**, inside piazza Ener Bettica, 41.74062/12.27191.
- **Giardino Alberto Giaquinto**, between via Aristide Carabelli, viale delle Repubbliche Marinare
  and via Corrado del Greco, 41.73894/12.26877.
- **Giardino Giovanni Camilli** and **Parco Clemente Riva** — OSM only, not in the Wikipedia list.
- **Pineta delle Acque Rosse**, between via Tancredi Chiaraluce, via delle Azzorre and viale dei
  Romagnoli (main Ostia article; no coordinate given; probably Ponente but **unverified**).
- ⚠ **Giardino Paolo Orlando**, "interno a piazzale della Stazione del Lido", 41.73227/12.28300 — the
  Ponente article lists it, but **PIP puts it in Levante**, next to Lido Centro station which is also
  Levante. **CONFLICT. Do not claim it.**

None of these is a destination. At most one — Parco Willy Ferrero, because of the Pasolini memorial —
earns a place entry, and only if the memorial is the subject.

### 3.18 Markets — `shop`

- **Mercato Orazio dello Sbirro** (41.73326/12.27607) and the **mercato dell'Appagliatore**
  (41.73889/12.26332), both PIP Ponente. The main Ostia article lists the daily markets as «via
  Orazio dello Sbirro, via Capo Passero (antimeridiano) e il mercato dell'Appagliatore», and a
  twice-weekly market at via Desiderato Pietri (Mon and Fri, mornings). OSM also has a
  Wednesday/Saturday market near piazza Ener Bettica.
  **Mornings only is a sourced fact about access and is publishable.** Nothing else here is.

### 3.19 Teatro Affabulazione — `theater`

- OSM `amenity=theatre`, **Piazza Marco Vipsanio Agrippa 7h**, 41.73627/12.26502 → Ponente. No
  Wikipedia article, not in the Ostia article's theatre list (which names Dafne 1, Fara Nume, Nino
  Manfredi, Pegaso, Piccolo Teatro Arcadia — of which Piccolo Teatro Arcadia is on viale Capitan
  Consalvo, i.e. **on the Ponente/Levante boundary street**, and the rest are elsewhere).
  **Unverified beyond OSM. Needs a first-party source or drop.**

### 3.20 The beach and the lungomare in Ponente

Honest position: the beach in Q. XXXIII exists but has almost no written record. OSM shows only two
named bathing establishments inside the Ponente polygon (*Elmi*, 41.72921/12.27510 — itself a metre
or two from the Levante line — and one tagged simply "Stabilmento", 41.73267/12.26693), against
twenty-odd in Levante and Castel Fusano. The famous ones — **Kursaal, La Vecchia Pineta, Plinius,
Battistini, the vanished Stabilimento Roma** — are all outside our unit. The historic pier is outside
our unit.

What is honestly ours on the shore: the stretch of **Lungomare Duca degli Abruzzi** running west from
the ex Colonia to the marina, and the **sottopasso** under the lungomare built so the colonia's
children could reach the sand (Roma Capitale: «ancora esistente»). That is a paragraph in the Colonia
entry, not a place.

### 3.21 Riserva naturale statale Litorale Romano — CONTEXT, and a ruling question

Tor San Michele, Tor Boacciana and the Centro Habitat Mediterraneo all fall inside the reserve.
https://it.wikipedia.org/wiki/Riserva_naturale_statale_Litorale_Romano gives:
`provvedimenti istitutivi = DD.MM. 428, 28.07.87 / 29.03.96 / 19.12.96`; 16,327 ha across the comuni
of Roma and Fiumicino, jointly managed by the two comuni; EUAP0086.

**QUESTION FOR THE VERIFIER/ARBITRATOR.** Is naming the reserve a "designation claim" under
evidence_ruling? My reading is no — evidence_ruling bans saying a *building* is vincolato/listed,
because there is no reachable per-property register. A state nature reserve is an area that exists by
ministerial decree and describes *itself*, the way the UNESCO inscription of the Historic Centre is
publishable as an inscription. But it is close enough to the line that I am flagging it rather than
assuming. If it is allowed, the safe form is "the reserve, instituted by ministerial decree in 1996,
takes in the Tiber mouth"; the unsafe form is "Tor San Michele is a protected monument".
**⛔ In any case the article's «è la più grande area protetta affacciata sul Mar Mediterraneo» is a
superlative and is banned.**

### 3.22 Ponte della Scafa / Ponte di Tor Boacciana — STRADDLER, FLAGGED

Listed under Ponente's `Altro` as «Ponte della Scafa o di Tor Boacciana, lungo via di Tor Boacciana.
Ponte del XX secolo (1950)». OSM has two overlapping named ways at ~41.7539/12.2781, one PIPping into
the Ostia Antica polygon and one into none. It carries the SS 296 della Scafa across the Tiber to
Fiumicino. **Three-way straddler: Ponente / Z. XXXV Ostia Antica / comune di Fiumicino. Do not
resolve here.** Low guide value regardless — it is a road bridge.

---

## 4. EXPLICITLY NOT OURS — the exclusion list a writer will otherwise get wrong

Because the settlement reads as one town and every source says "Ostia", these will keep drifting in.
Each was tested; none may appear as a place in this file's zone.

**Q. XXXIV Lido di Ostia Levante** — Pontile di Ostia · piazza Anco Marzio · piazza dei Ravennati ·
Palazzo del Pappagallo (Mario Marchi, 1929) · Palazzina Marchi (1928–30) · Villini Rossini (Augusto
Antonelli, 1927) · Villino di Luigi Moretti (1932–37) · Palazzo del Governatorato (Vincenzo Fasolo,
1924–28, seat of Municipio X) · Chiesa di Santa Maria Regina Pacis · Chiesa di San Nicola di Bari ·
Collegio Navale IV Novembre / Caserma IV Novembre · Pineta di Ostia · Borghetto dei Pescatori and the
Sagra della tellina · Torre ACEA · stazione Lido Centro · stazione Stella Polare · stazione Lido Nord
(see below).

**Q. XXXV Lido di Castel Fusano** — Parco urbano Pineta di Castel Fusano · Villa della Palombara
("villa di Plinio") · Fontana dello Zodiaco and piazzale Cristoforo Colombo, "la Rotonda" (Mario
Ferrero, 1957) · Enalc Hotel / Roma Tre polo · Centro Olimpico Matteo Pellicone and the Museo degli
Sport di Combattimento · Kursaal Village · La Vecchia Pineta · stazione Castel Fusano · stazione
Cristoforo Colombo · the dunes and free beaches.

**Z. XXXV Ostia Antica** (a different roster row, with its own finder) — the scavi · Museo Ostiense ·
Castello di Giulio II · Borgo Gregoriopoli · Basilica di Sant'Aurea · Casone pontificio del Sale ·
Parco dei Ravennati · stazione Ostia Antica.

**Comune di Fiumicino, not Rome at all** — Isola Sacra, Porto di Fiumicino, Museo delle navi,
Necropoli di Porto, and every hotel and marina on the north bank of the Tiber that a bbox search
returns (Hotel Riviera, Golden Tulip Isola Sacra, Fiumicino Nautilus/Tecnomar/Darsena Netter…).

**Both railway stations resolved against the quartiere article.** The Ponente article's transport
template lists "Lido di Ostia Nord" and "Lido di Ostia Centro". **Both stations' own articles say
Levante:**
- «La stazione di Lido di Ostia Nord … è una fermata ferroviaria della ferrovia Roma-Lido situata a
  Ostia **nel quartiere Lido di Ostia Levante**.» (opened 2000; murals by Lucamaleonte 2019 and the
  Subworld collective 2021) — https://it.wikipedia.org/wiki/Stazione_di_Lido_di_Ostia_Nord
- «La stazione di Lido di Ostia Centro … situata a Ostia **all'interno del quartiere Lido di Ostia
  Levante**.» (built 1950, opened 28 June 1951) —
  https://it.wikipedia.org/wiki/Stazione_di_Lido_di_Ostia_Centro

PIP agrees for Lido Centro (Levante) and puts Lido Nord just outside every polygon. **Neither station
is ours.** The quartiere template lists them as *serving* the quartiere. A page may say the Metromare
(ex ferrovia Roma–Lido) runs to Ostia; it may not claim a station.

---

## 5. STRADDLERS — flagged, NOT resolved

1. **Tor Boacciana + the Roman lighthouse remains.** Geographically Ponente (it.wiki category, PIP);
   institutionally managed by the Parco archeologico di Ostia antica, which is Z. XXXV's institution.
   Z. XXXV's own monuments list omits it. **Arbitrator call.**
2. **Pontile di Ostia.** Roma Capitale's own address for it is Piazza dei Ravennati and its published
   POINT is inside Levante; the quartiere boundary prose puts "la rotonda" exactly at the junction of
   the two quartieri; the pier physically projects from that junction. My reading is Levante, and I
   have written it into §4 as not ours — **but it is a boundary object and the Levante finder does
   not exist in this wave**, so if the arbitrator wants the pier written at all, this file is where
   the evidence lives. **Do not let a page claim it without a ruling.**
3. **Ponte della Scafa / Ponte di Tor Boacciana.** Ponente / Z. XXXV / comune di Fiumicino.
4. **Giardino Paolo Orlando.** Ponente article lists it; PIP says Levante. Do not claim.
5. **Piccolo Teatro Arcadia, viale Capitan Consalvo 2.** Viale Capitan Consalvo *is* the boundary
   street. Unresolvable without a house-number-level source.
6. **Elmi bathing establishment**, 41.72921/12.27510, sits metres from the Ponente/Levante line on the
   sand. Not worth claiming either way.
7. **Porto Turistico di Roma.** Entrance address is in Ponente; the basin is water outside every land
   polygon; the it.wiki infobox coordinate is wrong. Ownership is clear (Ponente) but any coordinate
   we publish should be the entrance, not the infobox.

---

## 6. CORPUS-RULE HAZARDS FOUND IN THE SOURCES — a checklist for the writer

These are live landmines in material a writer will legitimately be reading:

| Hazard | Where it appears | Rule |
|---|---|---|
| «sottoposto a **vincolo** ai sensi del Codice dei beni culturali» | it.wiki, Colonia marina VE III | evidence_ruling — **banned outright** |
| «immobile demaniale di interesse importante» | Roma Capitale via it.wiki, Tor San Michele | Same family. Avoid. |
| «Una delle **più grandi** multisala cinematografiche d'Europa» | Roma Capitale sheet, Cineland | superlative — banned |
| «una delle **migliori** della capitale» (library) | Roma Capitale sheet, ex Colonia | superlative — banned |
| «il **primo** "teatro di cintura" della città di Roma» | it.wiki, Teatro del Lido | priority claim — banned |
| «la **più importante** colonia del Lazio» (purple heron) | LIPU / Porto Turistico | superlative — banned |
| «è la **più grande** area protetta affacciata sul Mar Mediterraneo» | it.wiki, Litorale Romano | superlative — banned |
| «Il **più antico** di essi è il Battistini» (bathing establishments) | it.wiki, Ostia | superlative — and the subject is in another quartiere anyway |
| «la stazione **più recente** fra le stazioni situate nell'area di Ostia» | it.wiki, Lido Nord | superlative — and Lido Nord is Levante's |
| «25 Years Experience» | Porto Turistico official site | trading-duration claim from an operator's own site — banned |
| «simbolo **indiscusso** di una città», «vista **ineguagliabile**» | Turismo Roma, Pontile | superlatives — and the pier is Levante's |
| «a soli 10 minuti di auto dall'aeroporto» | Porto Turistico official site | trip duration — banned |
| The Soprintendenza page for Tor San Michele returning 404 | research method | never say so on the page; write "no source states its opening hours, so none are given here" |

**Photographs**: none in this wave; emit `"photos": []`. For the later photo wave, note that
Ostia's 1930s buildings are by architects who died recently enough to matter — **Vincenzo Fasolo
d. 1969, Angiolo Mazzoni d. 1979, Ignazio Guidi, Paolo Benadusi, Napoleone Martinuzzi d. 1977** —
and Italy has no freedom of panorama. Treat the ex Colonia, the post office (and its fountain), the
Garrone school and the ex GIL as **photo-risk**, on the same reasoning that made the Palazzo della
Civiltà Italiana a reject. Tor San Michele and Tor Boacciana are pre-modern and safe. Cineland's 1999
conversion is by living architects.

---

## 7. HONEST YIELD ASSESSMENT

**Candidate count: 26 examined; 22 land inside Q. XXXIII; I would put 9 forward as writable places
and expect the verifier to cut that to 6 or 7.**

Ranked by how much a travel guide could honestly say:

1. **Tor San Michele** — a Michelangelo-attributed fort at the Tiber mouth, with Roma Capitale's own
   text, measurements, and a real access story. The one unambiguous draw.
2. **The Idroscalo / Porto Turistico / Centro Habitat Mediterraneo cluster** — three places on one
   site, with a hard historical spine (1919 seaplane base → 1975 → 2001 marina and bird reserve),
   first-party opening hours from LIPU and from the port, and a documented literary park.
3. **Ex Colonia marina Vittorio Emanuele III**, holding the **Teatro del Lido** and the **Biblioteca
   Elsa Morante** — one 16,000 m² complex, three entries, all civically live.
4. **Ufficio postale di Ostia Lido** — a Mazzoni futurist-rationalist post office with a Martinuzzi
   Murano-glass fountain, still working. Genuinely good, if the date conflict is settled.
5. **Tor Boacciana** — subject to the straddler ruling.
6. **Cineland** — a 14-screen multiplex inside a 1927 tractor factory. Real, if unglamorous.
7. **Palazzo dell'ex GIL** and **Scuola Fratelli Garrone** — good architecture, no visitor access.
   One of them, not both.
8. **Chiesa di Santa Monica** — a competent 1968–72 parish church with a papal foundation stone.
9. Everything else — the small parks, the minor churches, the Peroni depot, the markets, the case
   popolari — is **filler**. I would not fight for any of it.

**Guide or town-page: TOWN-PAGE.** Not because Ostia is thin — Ostia as a whole is not — but because
this roster row is one third of Ostia and it is the third without the seafront. The unit has one
first-rank monument, one strong three-place cluster at the river mouth, one civic-architecture strip,
and no square, no promenade set-piece, no beach institution and no station. A reader arriving at
"Ostia Lido" expecting Rome's beach will not find it here. If the arbitrator wants a page that
delivers on the roster's own `draw` text ("Rome's beach"), the honest options are (a) rule that this
row covers all three marine quartieri and rename it, or (b) accept a town-page about the Tiber mouth
and the 1920s new town, and say plainly in the intro that the quartiere is the western third of the
settlement. **I recommend (b), and I recommend the page never uses the bare word "Ostia" as its
subject.**

The three I am least confident about:
- **Tor Boacciana** — ownership, not facts. It is Ponente by geography and Ostia Antica by
  institution, and the other finder has an equally good claim.
- **Ufficio postale di Ostia Lido** — the 1933–34 vs 1939–42 conflict runs between two Wikipedia
  pages that cite the same third source, and ArchiDiAP's own header is a bare "-1934". I believe
  1933–34 but I did not find a document that settles it.
- **Biblioteca Elsa Morante** — the September 2025 relocation to the Porto Turistico is sourced twice
  but is by nature temporary, and a page that gets it wrong sends a reader four kilometres to a
  building site. Re-verify at write time or fold it into the Colonia.

---

## 8. SOURCES ACTUALLY FETCHED

**it.wikipedia wikitext, via `action=parse&prop=wikitext` (not the rendered page):**
`Lido di Ostia Ponente` · `Lido di Ostia Levante` · `Lido di Castel Fusano` · `Ostia (Roma)` ·
`Parco urbano Pineta di Castel Fusano` · `Idroscalo di Ostia` · `Tor Boacciana` · `Tor San Michele` ·
`Pontile di Ostia` · `Colonia marina Vittorio Emanuele III` · `Ufficio postale di Ostia Lido` ·
`Cineland` · `Ex Meccanica Romana` · `Ferrovia Roma-Lido` · `Chiesa di Santa Monica (Ostia)` ·
`Borghetto dei Pescatori` · `Porto turistico di Roma` · `Centro Habitat Mediterraneo` ·
`Stabilimento Roma` · `Riserva naturale statale Litorale Romano` · `Camillo Palmerini` ·
`Vincenzo Fasolo` · `Palazzo dell'ex GIL (Roma, Ostia)` · `Enalc Hotel` · `Teatro del Lido` ·
`Scuola Fratelli Garrone` · `Centro Olimpico Matteo Pellicone` · `Fontana dello Zodiaco (Roma)` ·
`Stazione di Lido di Ostia Nord` · `Stazione di Lido di Ostia Centro`.
Titles that do not exist and were checked: `Stabilimento Kursaal`, `Stabilimento Battistini`,
`Chiesa di Nostra Signora di Bonaria (Ostia)`, `Cappella della Colonia marina Vittorio Emanuele III`,
`Villaggio dei Pescatori`, `RomaOstia`.

**Roma Capitale, first party:**
- https://www.comune.roma.it/web-resources/cms/documents/Tor_SanMichele.pdf
- https://www.comune.roma.it/web-resources/cms/documents/Ex_colonia.pdf
- https://www.comune.roma.it/web-resources/cms/documents/Cineland.pdf
- https://www.comune.roma.it/web-resources/cms/documents/Palazzo_Governatorato.pdf (Levante; context)
- https://www.turismoroma.it/it/luoghi/tor-san-michele
- https://www.turismoroma.it/it/luoghi/l%E2%80%99idroscalo
- https://www.turismoroma.it/it/luoghi/pontile-di-ostia (carries Roma Capitale's own POINT for it)
- https://teatriincomune.roma.it/teatro-del-lido-di-ostia/
- https://www.bibliotechediroma.it/opac/library/Biblioteca%20Elsa%20Morante/RMBO2

**Operators, first party:**
- https://www.portoturisticodiroma.it/ and /il-centro-habitat-mediterraneo-lipu/
- https://www.lipu.it/oasi-riserve/oasi-chm-ostia
- https://www.cineland.it/

**Ministry of Culture:**
- https://www.ostiaantica.beniculturali.it/it/aree-archeologiche-e-monumentali/ostia-antica/tor-boacciana/

**Academic:**
- https://www.archidiap.com/opera/ufficio-postale-di-ostia-lido/ (Sapienza DiAP)

**Geometry:**
- OpenStreetMap via Overpass — relations 5362392, 5362391, 5358875, 5329140 (`out geom`), plus a
  tagged-POI sweep over bbox 41.700,12.230,41.760,12.360. Rings stitched and point-in-polygon tested
  in Python locally.

**Reached for and not obtained:** `soprintendenzaspecialeroma.it/schede/tor-san-michele_3213/` (404,
so no first-party opening hours for the tower); `lipu.it/oasi-lipu-ostia` (404; the working path is
`/oasi-riserve/oasi-chm-ostia`); Nominatim forward search (rate-limited after five calls, replaced by
Overpass + local PIP). None of this may appear in reader-facing text.
