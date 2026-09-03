# Testaccio (R. XX, code 120) — VERIFIER'S VERDICTS

Adjudication of `docs/rome/testaccio-finder.md`. Ruled **2026-09-02**.
I did not gather this evidence and I owe it no loyalty. Every verdict below is mine.

**Tally: 30 PUBLISH · 25 REWRITE · 33 DROP** — 88 rulings over 65 candidate records and 23
claim-level items. **Surviving places: 41.** Tier: **GUIDE**.

---

## 0. RE-FETCH AUDIT — the sources the finder leaned on hardest

I re-fetched sixteen URLs with raw `python3 urllib` and browser headers, never WebFetch, and read
every one from raw bytes. **Fifteen returned HTTP 200. One returned 403 — and that 403 is itself a
finding the finder called correctly.**

| # | URL | Result | Does it say what the finder says? |
|---|---|---|---|
| 1 | `sovraintendenzaroma.it/…/monte_testaccio` | 200 | **Yes, verbatim** — 54 m, circumference c. 1 km, *testae*, Augustan to mid-3rd c. AD, Baetican oil residue, lime as deodorant and binder, ramp and two cart tracks, stamps and *tituli picti*, *ludus Testacie*, *ottobrate*. **Plus a field the finder missed: `Rione: XX - Testaccio`.** |
| 2 | `cemeteryrome.it/` | 200 | **Yes, verbatim** — "cimitero attivo fin dal 1716", "oltre 6000 sepolture", "più di cinquanta denominazioni religiose di quasi sessanta paesi"; hours 9–17 / 9–13 with the two last-admission times. |
| 3 | `cemeteryrome.it/pianifica-la-tua-visita/` | 200 | **Yes, verbatim** — including the load-bearing one: **"Via Caio Cestio, 6 nel Rione di Testaccio, 00153 Roma."** Group slots, "il Cimitero non offre al momento visite guidate", the directions sentence, the Pyramid-not-enterable sentence: all confirmed word for word. |
| 4 | `mattatoioroma.it/` | 200 | **Yes** — "Costruito fra 1888 e 1891 da Gioacchino Ersoch", and the banned superlative that follows it, both present. 11.00–20.00 band shown live. |
| 5 | `sovraintendenzaroma.it/…/fontana_delle_anfore` | 200 | **Yes, verbatim and complete** — 1924 competition, Pietro Lombardi (1894–1984), inaugurated 26 October 1927, 1932 proposal, 1933 consent, 1935 works, 2012 market move, "oltre 350 blocchi", "45 ugelli", first lighting, re-inaugurated 24 January 2015. |
| 6 | `soprintendenzaspecialeroma.it/…/piramide-cestia-un-nuovo-ciclo…` | 200 | **Substantially yes**, with one defect the finder inherited — see V-R08b. |
| 7 | `soprintendenzaspecialeroma.it/luoghi/piramide-di-caio-cestio/` | 200 | **Yes** for 36.40 m, base 29.50 m, chamber c. 23 m², 18–12 BC, 330 days, Aurelian 272–279, brick-faced concrete core, Luna marble, medieval north cunicolo, nymphs / lustral vases / four winged Victories, restorations 2001, 2012–15, 2025 PNRR. **NO** for CIL VI 1374, Pontius Mela, Potho and the forfeiture penalty — see V-R08a. |
| 8 | `sovraintendenzaroma.it/…/fontana_di_pio_ix_in_lungotevere_testaccio` | 200 | **Yes, verbatim** — Antonio Muñoz (1884–1960), 1939–1940, the 1869 plaque and Mastai Ferretti arms moved into the parapet in axis with via Florio, 3rd-c. AD strigillated sarcophagus, lion's-head spout, six travertine bollards, restored 1993 and 2000 after vandalism, **`Rione: Testaccio`**. |
| 9 | `mercatoditestaccio.it/area-archeologica/` | 200 | **Partly. The horreum quotation is NOT on this page.** See V-R04. Everything else — the suspension banner verbatim, 45 minutes, max 20, free, donation, stall 63, Soprintendenza Speciale — confirmed. |
| 10 | `mercatoditestaccio.it/info/` | 200 | **Yes** — Mon–Sat 07.00–15.30, four named entrances. |
| 11 | `mercatoditestaccio.it/` | 200 | Carries the horreum sentence the finder cited to #9. |
| 12 | `turismoroma.it/…/monte-dei-cocci` | 200 | **Yes** for the grottini sentence, 54 m, 1 km, booking on 060608 09.00–19.00, max 30, own guide, Via Nicola Zabaglia 24. **NO for the tariffs** — see V-R01. |
| 13 | `turismoroma.it/…/emporium-antico-porto-fluviale-di-testaccio` | 200 | **Yes** — "Edificato nel I secolo d.C.", travertine quay, two ranges of warehouses on a cryptoporticus, offices above, Ostia and Portus, Trajanic peak, 4th-c. abandonment, medieval burials, rediscovery from the late 1800s, "Visitabile solo in occasione di visite straordinarie". |
| 14 | `turismoroma.it/…/teatro-vittoria` | 200 | **Yes, in full** — Amati's cinema, closure at the end of the 1970s, works from May 1986, Attilio Corsini, Attori & Tecnici, Enrico Nespega, December 1986, **560 red velvet seats**, Corsini's death in 2008. |
| 15 | it.wikipedia `Museo diffuso di Testaccio`, `Rome War Cemetery`, `Servio Sulpicio Galba`, `Testaccio` | 200 | **Yes** on every NB note and the Celio caption — see §2. |
| 16 | `cwgc.org/…/rome-war-cemetery/` | **403** | **The finder's provenance problem is real. I reproduced it independently with browser-identical headers.** The 426 count has no reachable authority. |

**Three citations in the file point at pages that do not contain the claim** (V-R01, V-R04, V-R08a).
All three facts are true and available elsewhere; all three citations would have shipped wrong. That
is the single failure in this file with fabrication shape, and it is the reason this audit exists.

---

## 1. COLLISION CHECK — re-run mechanically, not inherited

I re-ran `python3 .superpowers/taken_slugs.py` myself on `testaccio`, `piramide`, `cimitero`,
`marmorata`, `mattatoio`, `liberatrice`, `mercato`, `ponte`, `fontana-delle` and `mura`.

**No Testaccio candidate collides with any of the 450 shipped places.** The finder's §0 is upheld.

But two returns matter and the finder did not run them:

- **`ponte` → 5 hits.** Prati holds Regina Margherita, Pietro Nenni and Giacomo Matteotti;
  Trastevere holds Ponte Sisto and Ponte Giuseppe Mazzini. **Trastevere shipped without taking Ponte
  Sublicio**, so the Sublicio is genuinely unclaimed rather than merely unmentioned. That changes the
  §2d escalation from "who gets it" to "Testaccio or Ripa", with Trastevere already out by conduct.
- **`mura` → 4 hits, including `mura-aureliane-segment-trastevere-rome`, "Aurelian Walls, Trastevere
  segment".** See V-S03: the programme has already answered the finder's §2c alarm.

---

## 2. THE MISALLOCATIONS — every one upheld, on re-read sources

The finder ruled against its own brief four times. I checked each against raw wikitext, and each
holds.

- **V-M01 · Porta San Paolo, the Museo della Via Ostiense, Piazzale Ostiense, Piazza di Porta San
  Paolo, the 1943 plaques, and the Piramide/Ostiense transport cluster are NOT Testaccio's.**
  UPHELD, and the it.wikipedia rione page does list Porta San Paolo under the rione's archaeological
  sites, so the finder is right that its brief and its aggregator are both wrong on the geometry.
  **To San Saba and Q. X Ostiense.**
- **V-M02 · Palazzo delle Poste, Via Marmorata 4 → San Saba.** UPHELD. The Museo diffuso wikitext
  reads, verbatim: `NB Sebbene questo edificio si trova nel [[San Saba (rione di Roma)|rione San
  Saba]], viene citato nella brochure`. Tell San Saba's finder: Libera and De Renzi's building is
  theirs and Testaccio has not taken it.
- **V-M03 · Arco di San Lazzaro → Ripa.** UPHELD, same construction: `NB Sebbene questo edificio si
  trova nel [[Ripa (rione di Roma)|rione Ripa]]`.
- **V-M04 · The tomb of Sulpicius Galba is Celio's.** UPHELD on the caption verbatim: `[[File:Tomb of
  Servius Sulpicius Galba, Rome 3.jpg|thumb|left|La tomba di Galba, oggi al [[Parco archeologico del
  Celio]]]]`. And the Museo diffuso NB is verbatim too: the Testaccio object is `un pannello con la
  storia di questa tomba`. **Testaccio has an information board. Celio has the tomb. Celio should be
  told.**
- **V-M05 · "viale del Campo Boario" is the wrong address for both cemeteries.** UPHELD and
  independently strengthened: the `Rome War Cemetery` article gives the address itself as **"in via
  Nicola Zabaglia"**, and the cemetery operator gives **Via Caio Cestio, 6**. Use the operators'
  addresses; the rione page's Campo Boario line is a loose gloss.

**CAUTION THE FINDER DID NOT RAISE, and the arbitrator should weigh.** Three of these five rulings
rest on the `Museo diffuso di Testaccio` article, and that article contains **two plain factual
errors** in the same list: it names **"Porta San Sebastiano, sita tra Piazzale Ostiense e Piazza
Porta San Paolo"** (that is Porta San Paolo; San Sebastiano is on the Appian Way), and it places
Santa Maria Liberatrice in **"piazza Santa Maria Ausiliatrice"**. The NB notes still stand because
the finder's own geometry independently agrees with all three. But the file treats this article as
an authority and it is not one.

---

## 3. PUBLISH — 30 records

Ruled publishable as written or with the trims named. Every one has a source I re-fetched or that the
finder cited and I sampled.

- **V-P01 Monte Testaccio** — the whole quantitative and chronological core, verbatim from the
  owner. 54 m, circumference c. 1 km, Augustan to mid-3rd c. AD, the Baetican oil-residue
  explanation, lime as deodorant and binder, the ramp and two cart tracks, the stamps and *tituli
  picti* naming exporter, contents, in-transit checks and consular date, the *ludus Testacie*, the
  *ottobrate*. **Publish 54 m (the manager's figure) and no amphora count** — the finder's
  recommendation, and turismoroma's own "milioni di testae" shows why: the sources will not converge.
  *Additions the finder left on the table, all on the same page and all publishable:* free for MIC
  card holders; the entry price does not include a guide; low comfortable shoes advised; the site is
  not accessible to wheelchair users; there are no toilets; approaching the edges or going onto the
  slopes is forbidden, as is picking up sherds. **`Rione: XX - Testaccio` on the manager's own page
  is better rione evidence than everything in §1 of the finder's file. Cite it.**
- **V-P03 Porticus Aemilia** — 193 BC (Lepidus and Paullus), 174 BC rebuild (Fulvius Flaccus and
  Postumius Albinus), *opus incertum* in tufa, 487 × 60 m, 294 piers, 7 ranks, 50 aisles at 8.30 m,
  vaulted, 25,000 m², c. 90 m back from the river; Piranesi 1756. **And the disputed identification
  must be on the page, not in a footnote** — the Cozza and Tucci *navalia* reading of 2006, and the
  2010 excavations that supported neither identification. A page that states a live scholarly dispute
  is stronger than one that hides it.
- **V-P08 Piramide di Caio Cestio** — 18–12 BC with the sumptuary-law and Agrippa bracket; the
  330-day testamentary requirement; 36.40 m on a 29.50 m square base; concrete core, brick facing,
  Luna marble skin; burial chamber c. 23 m², barrel-vaulted, walled up at burial; the fresco scheme
  with nymphs, lustral vases and four winged Victories; incorporation into the circuit built at
  Aurelian's initiative 272–279; medieval violation by the north cunicolo, losing the urn; the *meta
  Remi* identification and Petrarch; Alexander VII's excavations of 1660–63, the empty chamber, the
  pedestals recovered c. 1662, the two re-erected corner columns; the abandoned Borromini project;
  the lightning strike and the conductor; restorations 2001 and 2012–15. Free entry; responsible
  official Barbara Rossi; entrance from Via Raffaele Persichetti. *Add the transport the finder
  omitted:* Metro B Piramide; bus 23, 75, 280, 716; tram 3, 8. Visits run 45 minutes.
  **Straddler — escalated at V-S01, and I recommend Testaccio.**
- **V-P09 Cimitero Acattolico di Roma** — the best-evidenced record in the file and the only one with
  a three-witness rione. Active since 1716; over 6,000 burials; more than fifty religious
  denominations from nearly sixty countries; privately managed and still an active burial ground.
  Hours exactly as the operator gives them, including last admissions. The holiday closure list. The
  group regime. "Il Cimitero non offre al momento visite guidate" — publish that; it corrects a real
  visitor assumption. The directions sentence and the Pyramid-visible-but-not-enterable sentence, in
  the operator's own framing. The Centro Visitatori, the toilets, the chapel, the cat colony. The
  history: the 1671 Holy Office ruling, William Arthur in 1716, Valesio on William Ellis in 1732,
  the official opening of 11 October 1821, the 1824 ditch, the ban on crosses and Resurrection texts
  until 1870, the walled enclosure. Custody by the foreign missions with the presidency rotating
  annually among ambassadors. Keats, Shelley, Gramsci, Gadda, Camilleri, Foà, August von Goethe, von
  Marées, and Story's *Angelo del dolore*. The Keats date puzzle — Severn's 23 February against the
  stone's 24 February, explained by the Roman civil day beginning at the evening Ave Maria — is
  exactly the kind of checkable, non-superlative anecdote this corpus wants. Camilleri 18 July 2019;
  Napolitano 26 September 2023.
  *Additions the finder missed, all on the operator's visit page:* groups capped at 14 visitors plus
  one leader or licensed guide (15 total); at most two groups in the morning and two in the
  afternoon; no bookings for groups under 16; a suggested voluntary contribution of €5 per visitor;
  bus 3, 23, 30, 60, 75, 83, 95, 175, 280 and Metro B Piramide; and the operator's own statement
  that architectural barriers may affect some visitors' experience.
- **V-P12 Chiesa di Santa Maria Liberatrice** — 1906–08, Mario Ceradini, neo-Romanesque and
  neo-Byzantine; Pius X to the Benedictines then definitively to the Salesians; Luigi Maria Olivares
  as first parish priest; Nathan and Orano in the same years; the transferred *titulus* of the
  demolished church at the Forum, with the *Sancta Maria libera nos a poenis inferni* fresco, concave
  because it came from the old apse, kept by the Oblates of Tor de' Specchi; three aisles on columns
  with evangelist-symbol capitals; the black-and-white mosaic floor band with zodiac panels; Luciano
  Bartoli's apse fresco and glass, 1956–64; the old altar moved here and the façade mosaic
  reproducing one of its decorations. **"L'unica parrocchia presente nel quartiere" is struck** —
  V-D-C03.
- **V-P13 Chiesa di Santa Maria della Divina Provvidenza** — 1887–89, consecrated 1889, neo-Baroque;
  built for the Figlie della Divina Provvidenza, founded 1832 by Maria Elena Bettini, with the
  Barnabites of San Carlo ai Catinari; canteen, orphanage and school; served the quarter before the
  parish existed; mother house until the end of the 20th century, then Via Matteo Bartoli 255; the
  complex closed in 2008; the diocese no longer lists it. The façade: four Doric pilasters, arched
  pediment over the portal. **Both architect attributions must appear** — Antonio Lenti, and
  Armellini's 1891 "coi disegni del signor Barbiellini" for a start in 1888. Do not pick silently;
  the finder is right. **The page must not imply it can be entered.**
- **V-P15 Mattatoio di Roma** — 1888–1891, Gioacchino Ersoch, in the operator's own words; Filippo
  Laccetti and the offal-disposal system; 25,000 m²; the pavilion type and the geometric plan with
  slaughter halls flanking the main avenue and the pig and offal work pushed to the Manuzio
  periphery; decommissioned 1975 for the Tor Sapienza plant; the Zoneattive idea, works 2006–2010 on
  the water-tank pavilions, the *pelanda* and the pig slaughterhouse; Musei in Comune to 2017,
  Azienda Speciale Palaexpo for Roma Capitale since 2018; pavilions 9a and 9b to MACRO in 2002,
  "Macro Future" then "Macro Testaccio". Hours 11.00–20.00, last admission 19.30, closed Mondays,
  open only when an exhibition is running — and that "solo in caso di mostre in corso" qualifier is
  not optional. Metro B Piramide; tram 3; bus 719, 170, 781. **The superlative is struck** —
  V-D-C02.
- **V-P16 La Pelanda** — c. 5,000 m²; the preserved structures and fittings of the Galleria delle
  Vasche; the nave with its truncated-cone chimney and metal plant; the open, modular, walk-through
  restoration with large glazed surfaces; dance, research theatre, music, installation, workshops and
  production residencies. The Aula Studio is a free study room. **The weather closure is a dated
  notice and is not the regime; I Rimessini are in the future tense on turismoroma and must not be
  published as open.** Both cautions are the finder's and both are right.
- **V-P19 Scuola Popolare di Musica di Testaccio** — founded 1975 on Bruno Tommaso's initiative with
  Martin Joseph, Tony Ackerman, Maurizio Giammarco, Giancarlo Schiaffini, Eugenio Colombo, Giovanna
  Marini, Michele Iannaccone and Danilo Terenzi; early activity partly at Teatro Spazio Zero;
  priority enrolment and free workshop access for residents of the rione; 147 enrolled and 20
  teachers before opening, c. 250 by the end of the first term (1 March – 30 June 1975), a 450 cap
  within two years for want of space; the 1983 European tour of *Il Regalo dell'Imperatore*; the
  library founded 1983, over 9,000 titles, plus the Fondo Furlan. Still operating — enrolment for
  2026/27 and concerts in the Sala Giovanna Marini. **The 2005 Premio Sienbaneck is struck** —
  V-D-C05. Note this is a founding date attested by a third party, not by the school about itself,
  so V-R-C01 does not bite here.
- **V-P23 Nuovo Mercato Testaccio** — Mon–Sat 07.00–15.30; entrances from Via Beniamino Franklin,
  Via Alessandro Volta, Via Aldo Manuzio and Via Lorenzo Ghiberti; registered office Via Lorenzo
  Ghiberti; the operator's "100 banchi, 100 storie, 1000 prodotti" as its own words; the 2012 move
  from Piazza Testaccio, which turismoroma, the Sovrintendenza fountain page and the rione page all
  give independently — a rare three-source agreement in this file, and worth stating plainly. The
  Inti-Illimani song *El mercado Testaccio* on *Palimpsesto* (1981) is charming, checkable and
  publishable.
- **V-P24 Volpetti** · **V-P25 Pasticceria Barberini** · **V-P26 Pasticceria Linari** ·
  **V-P27 Checchino dal 1887** · **V-P28 Felice a Testaccio** · **V-P30 Trattoria Perilli** ·
  **V-P32 Da Bucatino** — seven food records survive on identity, address and operator-stated hours,
  which is exactly what the evidence ruling licenses. Barberini: Mon–Sat 06.00–21.00, Sun
  06.00–20.00, tel. 06 5725 0431, *lievito madre*, named suppliers. Linari: Via Nicola Zabaglia 9,
  tel. 06 5782358, daily 06.30–21.30, Tuesday 06.30–13.30. Checchino: Via di Monte Testaccio 30,
  Wed–Sun, lunch 12.30–15.00, dinner 19.30–23.00, closed Mon and Tue, exclusive bookings of 30+ on
  closing days, *quinto quarto* with the named dishes. Felice: Via Mastro Giorgio 29, daily, lunch
  12.30–15.30, dinner 19.00–23.30, cacio e pepe finished at the table, Milan 2017 and Turin 2024.
  Perilli: Via Marmorata 39, tel. 06 5755100 / 06 5742415, the Checco Durante poem. Bucatino: Via
  Luca della Robbia 84/86, Tue–Sun 12.15–15.00 and 19.00–23.55, tel. 06 5746886. Volpetti: Via
  Marmorata 47, cured meats, cheeses, baked goods and wine; Volpetti Più is a separate address.
  **Every quality claim, rating, testimonial and founding year is struck** — V-D-C06, V-D-C07 and
  V-R-C01.
- **V-P39 L'Alibi** — Via di Monte Testaccio 40/44 on the operator's own authority, against OSM's 34;
  an LGBTQIA+ club run as a cultural association with ARCO membership; tel. +39 380 8980243. The
  finder is right to trust the operator on its own address. **"Pietra miliare" and "punto di
  riferimento" struck; the 1970 founding date falls under V-R-C01.**
- **V-P42 Teatro Vittoria** — I re-fetched this one specifically because the history is unusually
  good, and it is confirmed to the word: the Vittoria as Testaccio's theatre from the early 1900s, a
  two-storey building on an unpaved square doing variety; demolished after the war; the replacement
  block whose ground floor held Amati's cinema; closure at the end of the 1970s; works from May 1986
  commissioned by Attilio Corsini of Attori & Tecnici from Enrico Nespega; opening in December 1986
  with **560 red velvet seats**; Corsini's death in 2008; *Rumori fuori scena* as the cooperative's
  signature production. Piazza di Santa Maria Liberatrice 10; tel. 06 5781960; Vivaticket; there is a
  bar. **No hours** — turismoroma refers the reader to the contacts and the operator's contact path
  refuses connections. The honest page says: *"No source states its opening hours, so none are given
  here."* **Struck: turismoroma's "il celebre e quotato architetto" for Nespega, and its "un
  quartiere degradato" for 1970s Testaccio** — the first is a ranking, the second is a judgement
  about a living neighbourhood that the page must not adopt in its own voice.
- **V-P46 Multisala Greenwich** — Via Giovanni Battista Bodoni 59, operated with the Cinema Mignon
  under one booking site. The page establishes identity and operation and nothing else, and the
  record should claim nothing else. `theater` is the correct legal kind; there is no cinema kind.
- **V-P47 Museo Storico dei Vigili del Fuoco** — inaugurated 18 April 2002; the reconstructions of
  the fire of AD 64, the 847 fire, the Sack of 1527 and the bombing of 19 July 1943; the sections on
  divers, helicopter crews and the speleo-alpine-fluvial service; the two audio-and-effects
  reconstructions; the multimedia room; the combustion bench; the collection transferred from the
  Scuola Antincendi at Capannelle. **Visitable by appointment only** — ufficiostampa.roma@vigilfuoco.it,
  tel. 06 46722237; museum tel. 06 5781495; Via Galvani 2, barracks entrance Via Marmorata 15.
  On the set-piece disagreement I rule with the finder: **name only what vigilfuoco.it lists**,
  because it is the corps' own page, and leave turismoroma's 1734 Ripetta fire out.
- **V-P48 Caserma dei Vigili del Fuoco Alberto De Jacobis** — Vincenzo Fasolo; **inaugurated 28
  October 1929**; named for vice-brigadier Alberto De Jacobis, killed 10 September 1943, dedicated to
  him from 1994; semicircular plan; seven flat-arched doorways on Via Marmorata separated by
  rusticated pilasters with fireman's-helmet capitals; the entrance at no. 15 up seven steps between
  two plaques; the sword-and-axe badge over the windows; the corbelled square tower over the
  courtyard. **Publish no construction span.** Three sources give 1926–29, 1925–28 and 1928–30 and
  all three agree only on the inauguration. The finder called this exactly right and the wave-2
  precedent — publish neither year when years conflict — is on its side.
- **V-P49 Museo diffuso di Testaccio** — created by the Soprintendenza Speciale; a route across the
  rione with teaching panels, a children's play-and-learn area, and bookable access to the Emporium,
  the Porticus Aemilia park and the market's archaeological area; "Percorso rionale: accesso libero";
  bookings sottosopra.testaccio@gmail.com; c. 60 hectares. **The count of 17 boards is publishable**
  — a count is not a ranking, and it is genuinely the most useful single sentence a walker could be
  given about this rione. Attribute the museum to the Soprintendenza Speciale as turismoroma does,
  not to the Sovrintendenza Capitolina, which the wiki infobox wrongly wikilinks.
- **V-P51 Piazza Testaccio** — the rione instituted 1921; the 1905 assignment of a cleared lot to the
  Comitato per il miglioramento economico e morale di Testaccio; the original name piazza Mastro
  Giorgio; the district market held here for many years; the 2015 restyling with new paving and
  street furniture and the fountain's return to the centre. **Kind ruling: `attraction`, not `park`.**
  The schema has no square kind; a paved market square with a fountain is not a park, and `park` is
  reserved for V-P55 and V-P56, which are actual planted ground. Gabriella Ferri's birthplace plaque
  — **quote the inscription as an inscription**, with quotation marks, or paraphrase without
  "grande". The page must not adopt the plaque's ranking as its own voice.
- **V-P52 Fontana delle Anfore** — the Sovrintendenza chronology entire, and I confirmed every date
  and number in it against the owner's page: 1924 competition for five fountains in newly built
  quarters, Pietro Lombardi (1894–1984) winning for piazza Mastro Giorgio, inauguration 26 October
  1927, ground settlement, the 1932 proposal to move it to piazza dell'Emporio, Lombardi's consent in
  1933, the 1935 rebuilding, the return within the 2012 piazza redevelopment, over 350 numbered
  blocks dismantled and reassembled, the 45 reactivated nozzles, lighting inside the four rectangular
  basins for the first time, re-inauguration 24 January 2015. Travertine, circular plan, two-step
  base, amphora pinnacle, four radial basins with the Comune's arms crowned by a ram's head, arched
  outer ends with amphorae in low relief. **Publish this chronology and not turismoroma's 1926 or
  it.wikipedia's €900,000 and September 2014** — the owning authority is internally consistent and
  the others are not. The finder's reasoning is sound and I adopt it.
  On Lombardi's other fountains: **one sentence that he made a series, naming no rione's fountain**.
  Several of those rioni are shipped and this file must not reach into them.
- **V-P53 Fontana di Pio IX in Lungotevere Testaccio** — Antonio Muñoz (1884–1960), 1939–1940, white
  marble, travertine and brick facing; built to close the vista along Via Florio; the 1869 plaque and
  papal arms moved from their river-facing position into the parapet and joined to a 3rd-century AD
  strigillated sarcophagus with new work; the plaque commemorating the finds and arrangements of
  1868–69 under Pius IX, with Pietro Ercole Visconti; two rusticated travertine pilasters topped by
  spheres and flanked by volutes; the Mastai Ferretti arms between two festoons; a lion's-head spout;
  six travertine bollards; restored 1993 and again in 2000 after vandalism. **Publish 1939–40 and
  Muñoz; do not publish it.wikipedia's 1869 as the fountain's date.** The finder's reading is right
  and the owner's page carries its own `Rione: Testaccio`.
- **V-P55 Piazza di Santa Maria Liberatrice and the Giardino Famiglia Di Consiglio** — the parish
  church and the theatre on the square, the planted garden at its centre. **The Di Consiglio family,
  murdered at the Fosse Ardeatine — six of them, sourced to Alessandro Portelli, *L'ordine è già
  stato eseguito*, Rome 1999, p. 159: "un ragazzo di sedici anni, quello di diciassette, di
  diciannove, di ventuno, il padre, il nonno", the grandfather Mosè born in 1870; small Testaccio
  traders, hawkers and butchers.** The finder calls this the most affecting fact in the rione and it
  is right. A named book, a page number, six ages. **Write it plainly and add nothing.** No adjective
  this corpus could supply would improve it, and any it supplied would cheapen it.
- **V-P56 Parco Testaccio / ex Campo Testaccio** — A.S. Roma's ground from 3 November 1929 to 30 June
  1940; 161 matches, 103 won, 32 drawn, 26 lost; Silvio Sensi, on the model of British grounds and
  Goodison Park; four wooden stands in gold and Pompeian red; capacity 20,000; an adjustable pitch;
  the manager's house with the badge painted on its wall; 1,530,000 lire; average attendance about
  10,000; tickets from 5–6 lire *popolari* to 30–35 covered, half price for women, *dopolavoristi*,
  soldiers and students, 2 lire *balilla*; the free view from Monte dei Cocci on the Zabaglia side,
  where the stand roof hid half the pitch; Rugby Roma 1937–39 and one Italy international; abandoned
  after 1939–40 and demolished that October; the 5–0 over Juventus on 15 March 1931 behind the film
  *Cinque a zero* and the nickname *Roma testaccina*; the derby of 1 November 1933. All counts, all
  dates, no rankings. **"Culla dell'A.S. Roma" is struck** — V-D-C08.
- **V-P59 Via Marmorata** — the etymology, in the rione page's own terms: the marbles landed at the
  port gave the street its name, and the street connects the port of Ripa with Porta San Paolo; after
  Rome's decline the unworked marble lay as *res nullius*, an open-air quarry of part-worked stone.
  **The record must say it is writing about the Testaccio side.** No. 4 is in San Saba (V-M02) and a
  page claiming the whole street would claim another rione's building.
- **V-P60 Via di Monte Testaccio and the *grottini*** — confirmed verbatim on turismoroma: caves cut
  at the base of the hill, used as cellars and stables, "oggi diventati ristoranti e disco-pub che
  animano la vita notturna di Roma"; it.wikipedia adds that the clay holds them at about 10 °C
  year-round and that they held taverns from the Middle Ages. **Publish the street and the caves;
  publish no club list** — V-D14. The finder's instinct here is exactly right: the geology is
  permanent and the tenants are not.

---

## 4. REWRITE — 11 records and 14 claims. Exact replacement wording given; the author uses it verbatim.

### Records

- **V-R02 Emporium — the date conflict must not be resolved silently in either direction.**
  turismoroma says "Edificato nel I secolo d.C."; it.wikipedia, following Livy 35.10.12, gives the
  aediles Marcus Aemilius Lepidus and Lucius Aemilius Paullus in 193 BC and the stone paving and
  stepped barriers of 174 BC. The finder proposed to publish 193 BC and suppress turismoroma. **I
  decline that.** Suppressing the municipal tourist board's date in favour of an encyclopedia's is
  the reverse of this corpus's attribution rule, and the two dates may not even be about the same
  thing. Publish both, attributed, and assert neither in the page's own voice:

  > Livy places the building of the Emporium in 193 BC, by the aediles Marcus Aemilius Lepidus and
  > Lucius Aemilius Paullus, and its paving in stone in 174 BC. Roma Capitale's tourism service dates
  > the port to the 1st century AD. The two accounts are not reconciled here.

  Everything else in the record publishes: the travertine quay, the two ranges of warehouses fronting
  a cryptoporticus with offices above, the goods landed at Ostia and Portus and redistributed here —
  wine, grain, *garum*, above all oil — the Trajanic peak in the 2nd century, abandonment in the 4th,
  burial, medieval use as a burial ground, rediscovery from the end of the 19th century, the
  1868–1870 and 1952 excavations, c. 500 m of quay surviving 90 m deep with stairs, ramps and
  projecting travertine mooring blocks. Lungotevere Testaccio, opposite no. 11. **"Visitabile solo in
  occasione di visite straordinarie"** is the access sentence and it must not be softened into an
  implication that the quay can be visited.

- **V-R04 Area archeologica del Nuovo Mercato Testaccio — the citation is wrong and the access
  sentence needs rebuilding.** The *horreum* quotation the finder attributes to
  `mercatoditestaccio.it/area-archeologica/` **is not on that page.** It is on the site's home page,
  `mercatoditestaccio.it/`, where it reads: "Anni di scavi e restauri hanno riportato alla luce i
  resti di un antichissimo *horreum*, un magazzino di stoccaggio di epoca romana, che ancora conserva
  centinaia di anfore e reperti." **Fact sound, citation wrong, fix the citation.** For access:

  > The site is reached through the market on open days announced by its traders, in visits led by
  > the archaeologists who excavated it, lasting about forty-five minutes for groups of up to twenty,
  > free, with an optional donation. The assembly point is at stall 63. The market states that visits
  > are suspended while the spaces are refurbished.

  That carries the fact without narrating a fetch. **Do not publish the booking widget's
  "23 novembre" slots** — that is leftover interface state, not a schedule, and the finder did not
  notice it. Also struck: the same site's **"l'unico al mondo con un sito archeologico"**, a
  world-priority claim the finder's banned-language register missed.

- **V-R08a Piramide — three details are cited to a page that does not contain them.** CIL VI 1374,
  the heir Lucius Pontius Mela son of Publius of the Claudian tribe, the freedman Potho, and the
  penalty of the heirs forfeiting the estate are **not on `soprintendenzaspecialeroma.it/luoghi/
  piramide-di-caio-cestio/`**, under which the finder bullets them. That page gives only "dispose nel
  testamento che la costruzione … avvenisse in 330 giorni". The details are it.wikipedia's.
  **Re-attribute or drop.** Two further over-specifications against the same page: it says
  "membro del collegio sacerdotale degli **epuloni**", not *septemviri epulones*; and it says the
  sumptuary law stopped the heirs placing "alcuni pregiati **arazzi**" in the chamber, not
  *attalica*. Write what the source writes.

- **V-R08b Piramide — the openings, and a defect in the source the finder passed through.** The press
  release says **"cinque aperture serali"** and then lists **four dates** — 4, 11, 18, 25 September.
  The finder reproduced both the count and the four dates without noticing they disagree. **Publish
  the dates and times, never the count.** Replacement:

  > After works funded under the PNRR, the Soprintendenza Speciale announced a cycle of special
  > openings between 4 September and 31 October 2026: unguided daytime visits on 5, 12 and 19
  > September and 3, 10, 17, 24 and 31 October at 16.30, 17.30 and 18.30, for up to fifty people a
  > turn; free guided evening visits on 4, 11, 18 and 25 September at 19.00, 20.00 and 21.00, for up
  > to thirty; and openings for the European Heritage Days on 26 and 27 September, hourly from 10.00
  > to 16.00, for up to fifty. Each visit runs forty-five minutes. Booking is compulsory through
  > Eventbrite, and entry is from Via Raffaele Persichetti. Outside announced openings the monument
  > is not open to visitors.

  Also: the finder writes that "in 2025 PNRR works began". The *luoghi* page says that; the press
  release of 28 August 2026 describes the intervention as **finished** ("Al termine dell'intervento")
  and itemises it — the access staircase made safe, the garden's planting surveyed and monitored,
  new lighting, and new interpretive and welcome panels for accessibility. **Publish the completed
  intervention, not the 2025 start alone.**

- **V-R11 Rome War Cemetery — publish the structure, drop the number.** I reproduced the CWGC 403
  myself. The 426 burials and the Louis de Soissons attribution rest on an it.wikipedia article that
  cites neither. Of the two, the count is the one that cannot ship: a precise figure is exactly the
  claim that needs the register the network will not give us. **Publish:** established 1947; built by
  the Commonwealth War Graves Commission, which still manages and maintains it, as one of about fifty
  comparable sites in Italy, to a design by the architect Louis de Soissons; laid out on the
  state-owned strip of the old "prati del popolo romano" between Monte Testaccio and the Aurelian
  Walls; originally for the Rome garrison, later receiving bodies from the province and airmen and
  soldiers who died in captivity, 1939–1945; approached through an open circular vestibule sheltering
  a bronze box with the names of the dead; headstones aligned along the walls; the Stone of
  Remembrance at the centre of the rows; a large stone cross at the end of the avenue facing the
  entrance; no wall separates it from the street, only a light railing. Address **Via Nicola
  Zabaglia**, which the article itself gives. **Drop 426. Drop "il luogo è molto sereno, al riparo
  dalle correnti di traffico che rumoreggiano poco lontano"** — the finder is right that it edges
  into vague proximity, and it is unsigned atmosphere besides. The Ragione 2023 CIRICE paper stays in
  the research file as a lead for a later wave.

- **V-R14 The *madonnelle* — one record, and only the one that is sourced.** The finder states
  plainly that it **did not fetch info.roma.it**, which is the only source for four of the five.
  Four unfetched URLs are not four places. **Publish a single grouped record built on what was
  fetched:** turismoroma's description of the Piazza Testaccio *madonnella* — a copy of a
  seventeenth-century image once in Santa Maria Liberatrice al Foro Romano and placed in 1908 on the
  altar of the Testaccio church — which also ties the record to V-P12 and V-P51. The record may say
  that further wayside shrines stand in the rione; **it may not list addresses from pages nobody
  opened.**

- **V-R17 Città dell'Altra Economia** — publish 3,500 m² recovered from the old *Pese del Bestiame*
  and the Campo Boario canopies; the conservative restoration on bioarchitecture principles within
  the wider Mattatoio recovery; opened 2007; organic-agriculture and fair-trade markets, training
  workshops, concerts, festivals; a bio-bar and a bio-restaurant; Largo Dino Frisullo; hours Tuesday
  to Sunday 07.30–24.00; bike racks, car park, Metro B Piramide, bus 719. **Struck: "uno dei primi
  spazi in Europa"** (a European priority claim) **and "15 anni di utopia"** (stale). The "100+
  eventi l'anno" figure may stand only as the operator's own statement, attributed.

- **V-R29 Flavio al Velavevodetto — publish the restaurant, not the cave.** Via di Monte Testaccio
  97; part of a group with Velavevodetto ai Quiriti at Piazza dei Quiriti 4/5 and two Milan rooms.
  The dining rooms cut into the flank of Monte Testaccio are the only reason a guide would mention
  this address, and the finder is honest that **the operator's own site does not say so**. Until it
  is sourced to this address, **the record says nothing about caves.** V-P60 carries the *grottini*
  as a class, sourced; that is where a reader learns the fact.

- **V-R31 Lo Scopettaro** — Lungotevere Testaccio 7. **"Da oltre 80 anni" is struck outright**: a
  trading duration sourced only to the business is a named DROP trigger in my brief, and it is vague
  besides. **"Una delle trattorie più antiche e famose di Roma" struck.** What survives is an
  address and an identity, which is enough for a `restaurant` record and not enough for a paragraph.

- **V-R43 Teatro di Documenti — publish the theatre, hold the attribution.** Via Nicola Zabaglia 42;
  tel. 06 455 485 78; it sells guided visits of its own building ("Visita del Teatro", "Visita
  Spettacolo") and runs a school programme; POR FESR Lazio 2021–2027 support. **The Luciano Damiani
  attribution does not ship this wave.** The finder saw the name in a navigation menu and did not
  open the page; a designer credit taken from a menu label is not a fetched fact. A theatre that
  sells tours of its own architecture is worth a record regardless. Give no hours — the events list
  read "Nessun Evento" and a page that implies a programme it cannot see is worse than a quiet one.

- **V-R54 Fontana del Boccale** — the Sovrintendenza URL 404s, so unlike V-P52 and V-P53 there is no
  owner-authority page. 1931 and Raffaele De Vico reach us only through it.wikipedia's citation of
  rerumromanarum and romasegreta. **Publish attributed and lightly:** the fountain stands in a small
  masonry exedra on Via Nicola Zabaglia, shaped as a tankard in a circular basin, in red Vicenza
  marble on salvaged material from the area, and **it.wikipedia dates it to 1931 and attributes it to
  Raffaele De Vico**. Attribution in the sentence, not in a footnote.

- **V-R62 "Il Quartiere Moderno" — split it.** Two different things are fused in the finder's entry.
  **Publish** the rione-character record: **detached from Ripa in 1921**, which is the single most
  important administrative fact about Testaccio and is stated plainly in the source ("fu scorporato
  nel 1921 dal vasto e poco popolato rione Ripa"), with turismoroma independently giving 1921 for the
  institution; the 1873 master plan already siting industrial expansion in the Ostiense area on flat
  ground served by the via Ostiense, the river port and the railway; the residential quarter built
  for the workers of those industries from the late 1800s; the arms, "Di rosso all'anfora d'oro",
  cited to Carlo Pietrangeli, *Capitolium* XXVIII/6, 1953, p. 190; and the street-naming policy —
  explorers, navigators, entrepreneurs, shipowners, engineers, scientists, publishers, printers and
  artists: Volta, Galvani, Franklin, Manuzio, Bodoni, Ghiberti, Vespucci, Rubattino, Zabaglia. That
  last is checkable, delightful, and a genuine key to walking the place.
  **Drop** the Sabbatini half. The finder says outright it found no fetchable source naming which
  blocks are Innocenzo Sabbatini's or dating them. A museo diffuso board bearing a name is not an
  attribution. **And "un esempio unico, a Roma, di urbanizzazione programmata" is struck** —
  V-D-C04.
  *Worth adding, and missed:* the rione page records the palio held here in the 13th and 14th
  centuries, from which the hill's other name *Mons de Palio*. A dated fact, no ranking.

- **V-R64 Elsa Morante's house** — publish the address and the *Stolperstein*, and **quote the 2004
  plaque as a quotation** — "In questa casa ha abitato una straordinaria scrittrice italiana / Elsa
  Morante" — with the quotation marks doing the work. The page must not call anyone extraordinary in
  its own voice. Many episodes of *La Storia* are set in Testaccio, and Paola Cortellesi's *C'è
  ancora domani* (2023) is set in the rione: both publishable.

### Claims

- **V-R-C01 · Operator-stated founding years, eight records.** The finder wrote that volpetti.com
  "establishes identity, location and **the 1973 trading date it states about itself**." **That is a
  direct misreading of the evidence ruling**, which says a place's own website "does NOT establish
  awards, superlatives, **or how long it has traded**," and of my own DROP trigger for "trading
  duration sourced only to the business itself." A founding year is a statement of how long a
  business has traded. **Ruling: no founding year ships from an operator's own site** — Volpetti
  1973, Linari 1971, Checchino 1887, Felice 1936, Perilli 1911, Il Grottino 1936, L'Alibi 1970, Lo
  Scopettaro's eighty years. **What may ship is the trading name itself**, verbatim, because naming a
  business is not asserting a date: write "Checchino dal 1887" and "Felice a Testaccio" as names, and
  make no claim in the page's voice about when they opened. Where a third party attests the year it
  returns — V-P19 is the example. *Escalated to the arbitrator:* if "how long it has traded" is read
  as covering durations only and not years, these eight dates come back. I have drawn the strict
  line because it is the line my brief draws, and because the finder drew the opposite one explicitly
  and would have shipped it.
- **V-R-C02 · Monte Testaccio tariffs, wrong citation.** €4.00 full, €3.00 reduced and free for
  residents of Rome and the metropolitan area are **on the Sovrintendenza page, not on turismoroma's
  `/monte-dei-cocci`**, where the finder cites them. turismoroma carries the booking regime and the
  safety notes but no prices. Fix the citation and add "free for MIC card holders", which is on the
  same line and was dropped.
- **V-R-C03 · The cemetery's Ferragosto closure is fifteen days, not a fortnight.** The operator says
  "quindici giorni nel periodo di Ferragosto". Write fifteen.
- **V-R-C04 · The cemetery's dated notices must not become the regime.** The 13–19 July maintenance
  closure and the 1–31 August 2026 closure were live at fetch and are dated notices. The finder says
  so and is right. The standing hours are the regime; add the operator's own caution that it may
  close for reasons beyond its control without notice.
- **V-R-C05 · The Mattatoio address.** `mattatoioroma.it` does not state Piazza Orazio Giustiniani 4
  on its home page; the address comes from turismoroma. Attribute it there.
- **V-R-C06 · The market's registered office has no street number** on the operator's page — "via
  Lorenzo Ghiberti, 00153 Roma". The no. 19 the finder attaches to the archaeological area comes from
  turismoroma. Keep them apart.
- **V-R-C07 · Monte Testaccio's "discarica" is not a superlative and the finder over-flagged it.**
  Both the Sovrintendenza and turismoroma put *discarica* in quotation marks as a characterisation of
  function. It carries no ranking. It may be paraphrased as a tip or dump. ("Unico nel suo genere"
  is a separate phrase and remains banned.)
- **V-R-C08 · turismoroma calls Testaccio a *quartiere*** on the Monte dei Cocci page ("Situato nel
  quartiere Testaccio"). It is a rione, R. XX. Do not carry the aggregator's loose usage; the
  Sovrintendenza's own `Rione: XX - Testaccio` field is the form to follow.
- **V-R-C09 · The Museo diffuso founder.** The wiki infobox names the Soprintendenza Speciale but
  wikilinks the Sovrintendenza Capitolina — two different bodies, one state and one municipal.
  Follow turismoroma and the market's own page: **Soprintendenza Speciale Archeologia Belle Arti e
  Paesaggio di Roma.**
- **V-R-C10 · The 60 hectares has a second witness** the finder did not notice: the market's own site
  reproduces it ("Il rione Testaccio, che occupa circa 60 ettari sulla riva sinistra"). Worth having,
  since the figure otherwise rested on one encyclopedia article.
- **V-R-C11 · The UNESCO inscription.** The finder's handling is correct and I restate it as binding
  for the author: the 1980 inscription of the Historic Centre of Rome may be mentioned **as an
  inscription**, and **Testaccio may not say it lies inside the property**, notwithstanding that the
  it.wikipedia infoboxes for Monte Testaccio, the Pyramid, the Emporium and the Porticus Aemilia all
  carry `Parte di = Centro storico di Roma`. Four infoboxes agreeing is exactly the trap the
  evidence ruling anticipates.
- **V-R-C12 · No designation language anywhere in this rione.** I found no designation claim in the
  file — the finder kept clean — but note that the cemetery's own site uses "Tombe d'interesse
  culturale" as a navigation label and calls itself "un importante sito". Neither may be rendered as
  protection, listing or designation.
- **V-R-C13 · The finder's own §1 narrates method at length** — Nominatim 429s, ray-casting, vertex
  counts, closed rings. That belongs in the research file and it is correctly placed there. **None of
  it may migrate into a record.** Flagging because §2's tables are seductive and an author drafting
  from them could slip a "footprint test" or a "vertex" into prose.
- **V-R-C14 · A silent omission the arbitrator should know about.** The it.wikipedia rione page
  carries a passage on the rione's "non buonissima fama" and on the 1980s–90s "Testaccini", a faction
  of a Roman criminal organisation. The finder omitted it entirely without saying so. **I uphold the
  omission** — it is a reputational claim about a living neighbourhood, resting on an unsourced
  encyclopedia paragraph — but a deliberate omission should be recorded as one, not left to look like
  an oversight.

---

## 5. DROP — 24 records and 9 claims

### Records

- **V-D05 ❌ Horrea Galbana.** No visitable remains, no address, no standing fragment. Its museo
  diffuso marker is placed "presso piazza dell'Emporio", and Piazza dell'Emporio tests **Ripa**. The
  finder recommends the cut and I agree. Its only distinctive sentence is a banned superlative
  besides.
- **V-D06 ❌ Sepolcro di Servio Sulpicio Galba, as a place.** The monument is Celio's (V-M04). The
  Testaccio object is an interpretive panel — OSM tags it `tourism=information`, `information=board`
  — and a panel about a tomb in another rione is not a place in this one. If the findspot is worth a
  sentence it belongs inside V-P03, where the *Horrea Galbana* connection actually sits.
- **V-D07 ❌ Schola Collegi.** A line in a brochure inventory and an OSM board. The finder says
  outright it "could not find a single page describing what survives, who excavated it, or when," and
  would not write a paragraph on this evidence. Neither will I. Not a place; a research lead.
- **V-D10 ❌ Cappella del Cimitero Acattolico, as a standalone.** Inside the walls of V-P09, listed by
  the cemetery as one of its own facilities. It is a sentence in the cemetery record. Splitting it
  out would be padding, which is what the finder suspected.
- **V-D18 ❌ Villaggio Globale.** `villaggioglobale.roma.it` does not resolve; there is no operator
  source for hours, programme or whether it is currently open. The finder's own formulation is the
  right one — a page that says a venue is open when it may not be is worse than no page. An OSM
  `amenity=community_centre` tag and a mention in a wiki infobox do not establish a going concern.
- **V-D20 ❌ Università Roma Tre, Dipartimento di Architettura** and **V-D21 ❌ Accademia di Belle
  Arti, Campo Boario.** Working university premises, not visitor places. Both are legitimately one
  clause each inside V-P15, naming the 2000 conversion of Pavilion 7 and the Via Franklin pavilions
  to lecture rooms. The finder proposed exactly this and then listed them as candidates anyway.
- **V-D22 ❌ Centro socio-culturale Ararat.** The finder states it has **no fetched source** and is
  flagging rather than claiming. Correct call; I make it a drop. A Kurdish cultural centre in the
  Campo Boario with a real history deserves a properly sourced record in a later wave, not a stub
  built on an unopened blogspot link.
- **V-D33 ❌ Pizzeria da Remo**, **V-D34 ❌ Agustarello a Testaccio**, **V-D36 ❌ Il Grottino a
  Testaccio**, **V-D38 ❌ Oasi della Birra.** OSM names and nothing else — no fetched page, no hours,
  no fact. Names in a list are not candidates. (Oasi della Birra fails twice: `brewery` would also be
  the wrong kind for a beer bar, and the finder was right to ask.)
- **V-D35 ❌ Trapizzino Testaccio.** `trapizzino.it` returned 403; there is no operator source. And
  the one thing that would make the address interesting — that the format started here — is precisely
  what the finder could not verify. **Publish no origin claim** and publish no record.
- **V-D37 ❌ Antico Forno a Testaccio.** The finder records that the site returned 200 and records
  **not one fact from it** — no hours, no description. A status code is not evidence. Drop unless
  someone opens it.
- **V-D14 ❌ The Monte Testaccio club strip as individual records** — Akab, Conte Staccio, Coyote,
  Trentatré, Caffè Latino, Charro Café, Euphoria. No fetched source for any. The finder's own
  judgement is the right one and I adopt it as a ruling: **publish the street (V-P60), not the
  clubs.** Turnover on this strip is high and a stale list ages badly.
- **V-D15 ❌ The remaining food list as a class** — Acquasanta, Da Oio a Casa Mia, Piatto Romano, La
  Fraschetta di Mastro Giorgio, Kiki's Kitchen, Osteria degli Amici, Pecorino, Masto, Comus,
  Divinare, both Botticelle, Gelateria Giolitti a Testaccio, Pizzeria Nuovo Mondo, and the sixty-odd
  more in the Overpass dump. **No fact was gathered about any of them.** This is the same ruling the
  Trastevere verifier made at V-D15 and it is the same situation. The finder itself expects perhaps
  eight to survive; eight did (V-P24 to V-P32), and these are not they. *One warning to carry
  forward:* the Giolitti on Via Amerigo Vespucci is a licensee and **must never be conflated with the
  Via degli Uffici del Vicario original**, which belongs to a different rione's file.
- **V-D44 ❌ Teatro Petrolini.** `teatropetrolini.it` returned 403. No operator source for programme
  or status.
- **V-D45 ❌ Teatro Studio Zagreus.** Site not fetched.
- **V-D50 ❌ Biblioteca Enzo Tortora.** Not fetched. A branch library with an OPAC code is thin even
  when sourced.
- **V-D57 ❌ Parco Joyce Lussu** and **V-D58 ❌ Giardino Domenico Pertica.** OSM `leisure=park` and
  nothing else. The Giardino Famiglia di Consiglio is a different matter and publishes at V-P55,
  because it has Portelli.
- **V-D61 ❌ Lungotevere Testaccio as a standalone street record.** Everything it would carry is
  already in V-P02 and V-P53. The finder anticipated this.
- **V-D63 ❌ Scuola elementare IV Novembre / IC Elsa Morante.** A working primary school. The 1920–23
  dating and the Augusto Antonelli attribution are real and may be a clause in V-R62's quarter
  record. The finder says it would not send visitors, which is the answer to whether it is a place.
- **V-D65 ❌ Monumento ai caduti di Testaccio.** A single line on a list page and no further source.
- **V-D-X1 ❌ The Grimaldi / Righi / Celluprica plaque** (`start_date=1945-10-07`). Unresearched by
  the finder's own account. Someone should find out who they were — in a later wave, with a source.

### Claims

- **V-D-C01 ❌ Every banned phrase in the finder's §6 register**, which I have checked and which is
  accurate as far as it goes. To it I add four the finder missed and I found on re-fetch: **"il
  celebre e quotato architetto"** (turismoroma, of Nespega); **"un quartiere degradato"**
  (turismoroma, of 1970s Testaccio); **"l'unico al mondo con un sito archeologico"**
  (mercatoditestaccio.it); and **"uno dei primi esempi di sepolcro individuale romano pervenutoci"**
  (it.wikipedia, Galba).
- **V-D-C02 ❌ "Uno dei più importanti edifici di archeologia industriale della città."** Confirmed
  present on the Mattatoio's own home page and on turismoroma. **Attribution does not save it.** The
  operator saying it about itself makes it worse, not better.
- **V-D-C03 ❌ "L'unica parrocchia presente nel quartiere."** A count of parishes would be publishable
  from a source that states one. "The only" is not, and no reachable source establishes it.
- **V-D-C04 ❌ "Un esempio unico, a Roma, di urbanizzazione programmata."** The descriptive clause
  around it publishes at V-R62; this one does not.
- **V-D-C05 ❌ Awards, all of them** — the 2017 Europa Nostra award for the Pyramid, the 2005 Premio
  Sienbaneck within the Premio Abbiati for the music school, and Checchino's "Premi e riconoscimenti"
  section. Not establishable from the sources we have, and in Checchino's case sourced only to the
  business.
- **V-D-C06 ❌ Ratings and testimonials** — dabucatino.it's Google 4.9 and three customer quotes;
  Linari's visitor quotes. Reviews are not publishable from an operator page.
- **V-D-C07 ❌ Marketing quality copy** — volpetti.com's "il meglio della gastronomia", "i migliori
  prodotti", "le eccellenze"; barberini's "elite della pasticceria romana" and "punto di riferimento
  dell'alta pasticceria"; feliceatestaccio's "un'istituzione della cucina romana, famosa a livello
  nazionale e internazionale"; alibiclubroma's "una pietra miliare della cultura romana"; perilli's
  and loscopettaro's "una delle trattorie più antiche di Roma".
- **V-D-C08 ❌ "Fu la culla dell'A.S. Roma."** The finder declines to write it because it has not
  verified the club's origin against the club, and it is right to. **Everything else at V-P56
  publishes** — the dates, the matches, the counts, the ticket prices. Those are better than the
  claim anyway.
- **V-D-C09 ❌ "Testaccio deteneva il primato nazionale del consumo di alcolici" (1884).** Confirmed
  present in the rione page verbatim. A *primato* is a national ranking, it is unverifiable against
  any reachable register, and it is a slur on a living neighbourhood carried by an unsigned
  encyclopedia. Banned three times over. The finder registered it and was tempted; it was right not
  to be.

---

## 6. STRADDLERS ESCALATED TO THE ARBITRATOR — 5

I re-ran nothing geometric; I did not gather this evidence and cannot re-derive it. What I did was
check each escalation against the shipped corpus and against the sources, and two of them change
shape once you do.

| # | Object | Straddle | My note |
|---|---|---|---|
| **V-S01** | **Piramide di Caio Cestio** | Testaccio ↔ Q. X Ostiense | The finder's own test gives 5 of 8 footprint vertices and the centroid in Testaccio, and explains the split correctly — the Pyramid is a bastion *in* the Aurelian Wall, so its outward face lies across a boundary that follows the wall. Three things point the same way and the finder used none of them: it.wikipedia categorises it `Roma R. XX Testaccio`; the Soprintendenza's own address is "Via Raffaele Persichetti - via del Campo Boario", the space in front, which is Testaccio-side; and the Cimitero Acattolico — an operator that states its own rione as Testaccio — orients its visitors by the Pyramid as the thing next door. **I recommend TESTACCIO.** If the arbitrator sends it to Ostiense, Testaccio drops to 40 and the tier does not move. |
| **V-S02** | **Ponte Sublicio** | Testaccio ↔ Ripa ↔ Trastevere | **The collision check changes this one.** Trastevere is shipped and did **not** take the Sublicio, so the western landing is settled by conduct and the live contest is Testaccio versus Ripa, which is in this wave. The finder's tests put the deck and mid-river in Testaccio and Piazza dell'Emporio in Ripa, and it.wikipedia agrees with the second. **A three-way straddler with one party already out.** Facts if it lands here: 1914–1917, Marcello Piacentini, inaugurated 21 April 1919, three masonry arches, 105 m by 20 m. |
| **V-S03** | **The Aurelian Walls** | seven-plus units | **The finder asked for a programme-level ruling that already exists, and a single `taken_slugs.py` query would have found it.** Trastevere has shipped **`mura-aureliane-segment-trastevere-rome`, "Aurelian Walls, Trastevere segment"**. The precedent is settled: **a named stretch per unit, never "the Aurelian Walls" unqualified.** The Museo diffuso list even names Testaccio's stretch for us — "Mura aureliane, site lungo via del Campo Boario". Escalated only so the arbitrator can confirm I am reading the precedent as intended; I do not think it needs deciding again. |
| **V-S04** | **Ponte Testaccio** | Testaccio ↔ Q. XI Portuense | it.wikipedia double-categorises it under both units and says so in prose. Portuense is not in this wave, so nothing is contested; the only question is whether Testaccio may carry a bridge whose midpoint is outside it. Facts: begun 1938, the architect Bastianelli with the engineer Cesare Pascoletti, originally to be called *ponte d'Africa* and to reach Trastevere station by demolishing the Mattatoio; inaugurated 1948; single arch, 122 m, four travertine reliefs at the abutments. **The demolition that did not happen is the good sentence here**, and it ties to V-P15. |
| **V-S05** | **Sepolcro di Servio Sulpicio Galba** | Testaccio panel ↔ Celio monument | Not a boundary question but an allocation one, and it needs an addressee. **Celio was in no wave and nobody has told it that it holds this tomb.** Confirmed verbatim: "La tomba di Galba, oggi al Parco archeologico del Celio". Escalated so the coordinator can route it. |

---

## 7. TIER RULING

**GUIDE.** Surviving count **41** — 30 records ruled PUBLISH plus the 11 ruled REWRITE, all of which
still ship, with the wording supplied above.

I have tested the ruling the way wave 2 said a tier ruling should be tested: **strike every contested
object and it does not move.** Remove the Pyramid, the two bridges, the walls stretch and the Galba
panel and Testaccio still stands at forty. The four-place floor is not remotely in play, and no part
of this tier rests on anything I escalated.

**I looked for the town-page answer and I do not think it is here.** Not because the material is
thin — it is the opposite — but because of *where* the density is. Testaccio has four unrelated
centres of gravity, exactly as the finder says: a Roman river port with its debris mountain, a
Romantic-era foreign cemetery, an industrial complex turned arts campus, and a working food quarter.
Three of those four are genuinely strong. But the fourth is thinner than the finder's own count
implies, and the two areas the finder honestly names as weak — religious architecture and standing
ancient masonry — got weaker under adjudication, not stronger: the Horrea Galbana, the Schola
Collegi and the Galba tomb all fell, and four of the five *madonnelle* collapsed into one grouped
record because their sources were never opened. Trastevere shipped at 63 and was ruled GUIDE.
Forty-one is a good guide page and it is not a town.

**Two things about this unit that the tier ruling should not be read as licence to paper over.**

First, **the food quarter is the weakest-evidenced part of the strongest-flavoured rione in the
wave.** Seventy-odd eating places were found and seven survive, on hours and addresses. A reader
arrives in Testaccio expecting the food and this corpus can honestly give them seven doors and a
market. It must not inflate that with atmosphere, and after V-R-C01 it cannot even lean on the
founding dates. That is the right outcome and it will feel thin to whoever writes it.

Second, **the ancient material is almost all inaccessible and the page must say so plainly and
often.** Monte Testaccio is booked groups only. The Emporium opens for extraordinary visits. The
market's *horreum* is closed for works. The Pyramid opens on an announced cycle and not otherwise.
The Porticus Aemilia is glimpsed between apartment blocks. Four separate access sentences, each
honest, is not a defect in the page; it is the truthful shape of this rione, and a writer smoothing
them into implied opening hours would do more damage than any single dropped fact in this file.

---

## 8. WHAT THE FINDER GOT WRONG

Ranked by what would have shipped.

1. **Three citations point at pages that do not contain the claim** — V-R04 (the *horreum*
   quotation, on the market's home page and not on the archaeological-area page it is cited to),
   V-R-C02 (the Monte Testaccio tariffs, on the Sovrintendenza page and not on turismoroma), and
   V-R08a (CIL VI 1374, Pontius Mela, Potho and the forfeiture penalty, bulleted under a
   Soprintendenza page that says only "330 giorni"). **All three facts are true. All three citations
   are wrong.** This is the one failure mode with fabrication shape, it is the reason the re-fetch
   audit is not a formality, and it is the same failure the Trastevere verifier caught in that file.
   Two waves running is a pattern, and the coordinator should treat "cite the page you actually read
   the sentence on" as a standing instruction rather than an assumption.

2. **It misread the evidence ruling on trading dates, in writing, and built eight records on the
   misreading.** "The site establishes identity, location and the 1973 trading date it states about
   itself" is the opposite of what the ruling says. The finder quoted the rule correctly elsewhere in
   the same file, which makes this a lapse rather than a disagreement — but it is the lapse that
   touches the most records.

3. **It missed the best rione evidence it had, twice over.** The Sovrintendenza's Monte Testaccio
   page carries `Rione: XX - Testaccio` in its own metadata. The finder cited that page for six
   separate facts, cited the identical field on the Fontana di Pio IX page as decisive evidence, and
   then rested the rione's headline place on OSM ray-casting and a turismoroma coordinate. It had the
   owner's own statement in hand and did not use it.

4. **It escalated a question the programme has already answered.** §2c asks for a walls ruling in
   capitals — "Do not let nine files each claim 'the Aurelian Walls'" — when `taken_slugs.py mura`
   returns Trastevere's already-shipped named segment. The file's own §0 demonstrates the finder knew
   how to run that query. The alarm is right; the research was one command short.

5. **It treated the `Museo diffuso di Testaccio` article as an authority.** Three of its five
   misallocation rulings rest on that article's NB notes. The notes are correct, and I upheld all of
   them — but the same list calls Porta San Paolo "Porta San Sebastiano" and puts Santa Maria
   Liberatrice in "piazza Santa Maria Ausiliatrice". The rulings survive because the finder's own
   geometry independently agrees. They survive *despite* the source, not because of it, and the file
   does not know the difference.

6. **Over-specification against its own sources.** *Septemviri epulones* where the Soprintendenza
   writes "collegio sacerdotale degli epuloni"; *attalica* where it writes "pregiati arazzi"; "a
   fortnight" where the cemetery writes "quindici giorni". Each is a small upgrade in the direction
   of sounding better informed than the source, and each is the habit that produces item 1.

7. **It passed through a source's internal contradiction without seeing it.** The Pyramid press
   release says five evening openings and lists four dates. The finder reproduced both.

8. **A silent omission.** The rione's organised-crime paragraph is left out with no note. I agree
   with leaving it out. A file this careful about flagging should have flagged it.

**What the finder got right, and it is the larger part of the file.** It ruled against its own brief
four times and was correct all four times. It reproduced the CWGC 403 accurately — I got the same
403 independently — and refused to launder an unsourced burial count. It caught that the museo
diffuso brochure is an itinerary and not a cadastre, which is the insight the whole of §2 turns on.
It built its own boundary method when the briefed one was unavailable and said plainly that OSM
`place` relations are not a municipal boundary file. It kept `photos: []` throughout, made no
designation claim anywhere, handled the extraterritorial and UNESCO questions correctly without being
asked to, and assembled a banned-language register that was accurate on every phrase I checked. It
declined to claim Porta San Paolo, the Poste, the Arco di San Lazzaro and the Galba tomb when three
of the four were handed to it. **A finder that hands its verifier the evidence against its own
candidates is doing the job.** The corrections above are corrections to a good file.
