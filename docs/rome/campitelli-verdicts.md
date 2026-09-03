# Campitelli (R. X, code 110) — VERIFIER verdicts

Adjudicating `docs/rome/campitelli-finder.md`. Verification date: 2026-09-02.
I did not gather the finder's evidence and I owe it no loyalty. Every ruling below is mine.

**Tally: 51 PUBLISH · 46 REWRITE · 21 DROP** across the finder's 118 numbered candidates, plus
**13 claim-level DROPs** listed in §5 that are not attached to any one candidate.

**TIER RULING: GUIDE.** Far more than four places survive with fetched, re-verified sources.

---

## 1. RE-FETCH LOG — what I checked myself

I re-fetched with `python3 + urllib` and read the returned bytes. The finder leaned hardest on these;
all but two came back and said what was claimed.

| Source | Status | Verdict on the finder's use of it |
|---|---|---|
| `museicapitolini.org/it/informazioni_pratiche/orari_e_indirizzi` | 200 | **Confirmed verbatim.** "Tutti i giorni ore 9.30-19.30", "24 e 31 dicembre ore 9.30-14.00", "1° gennaio 2026 dalle 11.00 alle 20.00", "Giorni di chiusura 1 maggio e 25 dicembre", call centre 060608 9.00–19.00. |
| `museicapitolini.org/.../biglietti_e_videoguide` | 200 | **Confirmed but the finder flattened it.** See §3, item 5. |
| `museicapitolini.org/it/il_museo/storia_del_museo` | 200 | **Confirmed verbatim**: "La nascita dei Musei Capitolini viene fatta risalire al 1471, quando il papa Sisto IV donò al popolo romano un gruppo di statue bronzee". |
| `museicapitolini.org/it/sede/piazza_e_palazzi` | 200 | **Confirmed verbatim** on Michelangelo. |
| `museicapitolini.org/it/sede/campidoglio_antico` | 200 | **Confirmed verbatim**: two summits *Capitolium* and *Arx*, valley "il cui livello era circa 8 metri al di sotto dell'attuale". |
| `vive.cultura.gov.it/it/vittoriano`, `/storia`, `/altare-della-patria`, `/terrazza-panoramica`, `/museo-centrale-del-risorgimento`, `/ala-fori-imperiali` | 200 ×6 | **All confirmed verbatim**, including the two tripwires the finder flagged. |
| `sovraintendenzaroma.it/.../aree_archeologiche/fori_imperiali` | 200 | **Confirmed verbatim**: "€ 18,00 intero", MIC €14, "A partire dal 18 ottobre 2023 … biglietto nominativo", "in circa due ore", entrance Colonna Traiana / exit via Bonella. |
| `sovraintendenzaroma.it/.../monumenti/monumento_a_cola_di_rienzo` | 200 | **Confirmed verbatim**, every date and both names. |
| `sovraintendenzaroma.it/.../fontane/fontana_di_piazza_d_ara_coeli` | 200 | Confirmed. |
| `sovraintendenzaroma.it/.../fontane/fontana_della_dea_roma_...` | 200 | Confirmed. |
| `sovraintendenzaroma.it/.../aree_archeologiche/via_alessandrina` | 200 | **Confirmed verbatim**: Bonelli, "aperta nel 1584 e lunga più di 400 metri". |
| `sovraintendenzaroma.it/.../musei_in_comune/musei_capitolini` | 200 | **Confirmed verbatim** — and it does say "Il museo pubblico più antico del mondo". Banned, see §5. |
| `sovraintendenzaroma.it/.../sala_s_rita_gia_chiesa_di_s_rita_da_cascia` | 200 | Confirmed, including 1938–1940 / 1928 / "intorno al 1650 su progetto di Carlo Fontana". |
| `whc.unesco.org/en/list/91/` | **403 on a plain UA; 200 with a browser UA** | **Confirmed** once reached. See §3, item 112 — the finder's framing is wrong even so. |
| `santamariainportico.it` | 200 | Confirmed: Piazza Campitelli 9, 06 68803978 / 06 6874285, Chierici Regolari della Madre di Dio, Leonardi 1574. Mass-time wording caveat in §3. |
| `sansebastiano.fraternita-gerusalemme.it/home` | 200 | **Confirmed verbatim**, every prayer time and the Friday/Saturday "deserto". |
| `nobilecollegio.it` | 200 | **Confirmed verbatim**: "L'8 Marzo 1429 … Papa Martino V donò … alla Corporazione dei Farmacisti Romani, la Collegiata di San Lorenzo". |
| `risorgimento.it` | 200 | Live, names the museum. Confirmed. |
| `terrazzacaffarelli.it` | 200 | Confirmed — including the "First lady e capi di Stato" line. Banned, see §5. |
| **`cosmadamiano.com`** | **406 Not Acceptable** | **THE FINDER REPORTED THIS AS REACHED. I could not re-fetch it.** See §2. |
| it.wikipedia `action=parse` — Campitelli, S. Maria in Portico, Palazzo Albertoni Spinola, Palazzo Muti Bussi, Tor de' Specchi, Vittoriano, S. Maria della Consolazione, Antiquarium Forense | 200 (after 429 backoff) | Mixed. Two of the finder's readings are wrong; see §2. |

I also ran my **own** Overpass `is_in()` tests, independent of the finder's, on the two disputed
blocks. Results in §2. `overpass-api.de` then began timing out and refusing connections, and both
mirrors returned 504, so four of my twelve points did not resolve.

---

## 2. WHAT THE FINDER GOT WRONG — the four things that worry me

### 2.1 The via dei Cerchi block is NOT Campitelli. The finder's containment query is wrong.
The finder put seven entries on via dei Cerchi inside Campitelli via an Overpass containment query,
suspected it, and could not get a second determination because Nominatim 429'd.

**I got the second determination.** My own `is_in(41.8862, 12.4838)` — via dei Cerchi 65, the "075"
address — returns:

> `Municipio Roma I [admin_level 10]; Rione XII Ripa [place=quarter]`

**Ripa. Campitelli is not returned at all.** That agrees with it.wikipedia's rione article, which
names via dei Cerchi as the Ripa boundary, and it disagrees with the finder's containment result.
Two independent methods now say Ripa and one says Campitelli, and the outlier is the same Overpass
primitive that already contradicted itself at the Arch of Constantine.

**Consequence: DROP all seven.** 075, Ad Hoc Circo Massimo, Osteria Circo, Art Cafe, Gelateria
Artigianale, Easy Bike Rent (item 106) and Museo della Cucina (item 109) leave Campitelli. Record
them for Ripa. This was the finder's own largest low-confidence block and it does not survive.

### 2.2 Santa Maria della Consolazione — the finder's §4.4 misreads its own source.
The finder wrote: *"A page that says 'in piazza della Consolazione, in the rione Campitelli' would be
asserting something no source supports."*

**That is false.** it.wikipedia's article on the church says, in its opening sentence:

> "…è un luogo di culto cattolico del centro storico di Roma, **situato rione Campitelli nella piazza
> omonima**, nei pressi del Foro Romano e ai piedi della rupe Tarpea"

A source supports exactly the sentence the finder said no source supports. The article's own infobox
then gives `NomeComune = Roma, viale Jugario` — a third location, on a street the rione article names
as the Ripa border. So this is a genuine three-way straddler, but the finder characterised the
evidence wrongly, and an arbitrator reading only the finder's file would rule on a false premise.
**Escalating on corrected evidence, not the finder's.**

### 2.3 `cosmadamiano.com` did not answer me.
The finder lists it under "Reached (HTTP 200, raw bytes)" and uses it for "the basilica's own site is
live". I get **HTTP 406 Not Acceptable** on the same URL. I am not calling this fabricated — a 406 is
content-negotiation and a different client can get a 200 — but the finder's own rule is that a source
you could not fetch is not a source. **I could not fetch it.** Item 34 accordingly publishes on
it.wikipedia attribution only, and **no hours, Mass times or opening information may be taken from
that domain** until someone re-fetches it and records the bytes. Same treatment I would give any
unreachable operator.

### 2.4 A superlative the finder did not quarantine.
it.wikipedia's Campitelli article says Campitelli is *"il rione meno popolato di Roma"* with 516
inhabitants. The finder quarantined six superlatives and missed this one, in the single article he
leaned on most. It is an unattributed superlative from an aggregator, and it sits directly on top of
the 515/516 population conflict he correctly flagged. **DROP as written.** Replacement wording in §5.

**Minor corrections, for the record.** (a) The Musei Capitolini "1271" banner is real — I found it in
the raw HTML of all five pages I fetched, exactly as described. Good catch, correctly handled.
(b) The finder gives Tor de' Specchi's address as "via del Teatro di Marcello / via Tor de' Specchi";
it.wikipedia says only "in via Tor de Specchi". The first street is unsourced — drop it.
(c) The finder flagged VIVE's 70 m against it.wiki's 81 m as an unresolved conflict; it.wikipedia's
own infobox carries **both** (`altezza = 81 m`, `altezza tetto = 70`), which resolves it.
(d) Item 75 cites `it.wikipedia.org/wiki/Criptoportico` — the generic architectural article — for the
**Criptoportico Neroniano**. The source does not say what the entry implies.

---

## 3. PLACE-BY-PLACE VERDICTS

Numbering follows the finder's §3. "Attributed" means the sentence must name it.wikipedia or say what
Roma Capitale / the institution says, never assert it in the corpus voice.

### §3.1 The Capitoline — items 1–19
| # | Place | Ruling | Reason |
|---|---|---|---|
| 1 | Piazza del Campidoglio | **PUBLISH** | Michelangelo attribution and the 8 m fill both re-verified verbatim on the museum's own site. The superlative was correctly withheld. |
| 2 | Palazzo Senatorio | **REWRITE** | The finder sources the address to "OSM `addr` on the Roma Capitale object". OSM is not Roma Capitale. Use: *"Palazzo Senatorio stands at Piazza del Campidoglio 1, the address the Musei Capitolini give for the Capitoline complex; it houses the Comune di Roma. it.wikipedia dates the building to the first half of the 12th century, on the ruins of the Tabularium, with a 16th-century refacing under Michelangelo and Giacomo Della Porta."* Superlative stays out. |
| 3 | Palazzo dei Conservatori | **PUBLISH** | Attributed. |
| 4 | Palazzo Nuovo | **PUBLISH** | Attributed. |
| 5 | Musei Capitolini | **REWRITE** | Hours confirmed verbatim — publish as written. Tickets are wrong in shape: €20,50/€15,00 is the **exhibition-inclusive** tariff, and the page separately gives an ordinary tariff. Use: *"From February 2026 the museum's own site states that admission is free for residents of Roma and the Città Metropolitana on production of an identity card. For non-residents the site gives, in the absence of temporary exhibitions, €15,00 full and €9,50 reduced; with the exhibitions running when this page was checked on 2 September 2026, €20,50 full and €15,00 reduced, a ticket which the site states does not admit to exhibitions at Villa Caffarelli. Online, 060608 and box-office presale carry a €1,00 booking fee, and presold tickets are stated to be non-refundable and non-changeable. Tariffs change with the exhibition programme; check the museum's own page."* Founding: cite the history page for 1471 and say nothing about the banner. |
| 6 | Palazzo Caffarelli al Campidoglio | **PUBLISH** | Attributed. |
| 7 | Cordonata Capitolina | **PUBLISH** | Attributed. |
| 8 | Fontana della Dea Roma | **PUBLISH** | Sovrintendenza page re-fetched; author, 1588–1589, materials all confirmed. |
| 9 | Marforio | **PUBLISH** | Attributed. |
| 10 | Statua equestre di Marco Aurelio | **DROP** | The finder states outright: *"I did not fetch a per-object museum page."* No fetched source, no entry. An OSM `wikidata` tag is not a source. |
| 11 | Lupa Capitolina | **REWRITE** | The 5th-c.-BC dating rests on one blog post and is contested; the finder says so himself. Use: *"The Lupa Capitolina, a bronze she-wolf, is held in the Musei Capitolini."* Nothing on date. |
| 12 | Colosso di Costantino | **DROP** | *"listed on the site index; I did not fetch it."* Not fetched, not published. |
| 13 | Protomoteca Capitolina | **PUBLISH** | Named on the museum's own `piazza_e_palazzi` page; I saw it in the re-fetched bytes. |
| 14 | Tabularium | **PUBLISH** | Attributed. |
| 15 | Terrazza Caffarelli | **REWRITE** | Identity and address only. Use: *"Terrazza Caffarelli, an events venue at Piazzale Caffarelli 4."* The "First lady e capi di Stato" line is banned (§5). |
| 16 | Rupe Tarpea | **PUBLISH** | Attributed. |
| 17 | Belvedere Tarpeo / Giardino di Monte Caprino | **REWRITE** | OSM tags only. Name, `leisure=park` and coordinates — no history, no character. |
| 18 | Rampa Caffarelli, Scala dell'Arce Capitolina, Scalinata dell'Ara Coeli, Clivus Capitolinus | **REWRITE** | Named ways from Overpass. List them; claim nothing about them. |
| 19 | Avvocatura Capitolina, Ragioneria generale, Dipartimento Organizzazione e Risorse umane | **DROP** | Municipal back-offices. The finder himself calls them "likely thin for a travel guide". He is right. |

### §3.2 The Vittoriano complex — items 20–31
| # | Place | Ruling | Reason |
|---|---|---|---|
| 20 | Vittoriano | **REWRITE** | VIVE and it.wiki both re-verified. Do not blur the ranges and do not touch legal status. Use: *"VIVE, the Ministry of Culture institute that runs the complex, states that it was conceived in January 1878, in the days after the death of Italy's first king, and inaugurated in 1911; VIVE's history gives Giuseppe Sacconi as its architect, building from 1885 to 1905. it.wikipedia's infobox gives the inauguration as 4 June 1911, a construction period of 1885–1935, and a height of 81 metres."* Two sources, two ranges, kept apart. |
| 21 | Altare della Patria | **PUBLISH** | Sacconi, Zanelli and the 1921 Tomb all confirmed verbatim on VIVE. |
| 22 | Tomba del Milite Ignoto | **PUBLISH** | Same page, confirmed. |
| 23 | Terrazza Panoramica | **REWRITE** | Use: *"VIVE describes the panoramic terrace, also called the terrazza delle Quadrighe, as standing at seventy metres with a 360° view, reached by lifts; two bronze quadrigas at the lift exit stand for the Unity and the Liberty of Italy. it.wikipedia's infobox gives the monument's overall height as 81 metres and its roof height as 70."* Lift duration and "nessun altro luogo" both banned (§5). |
| 24 | Museo Centrale del Risorgimento | **REWRITE** | Do not reconcile the sources. Use: *"VIVE states the museum was conceived in 1884 but opened only in 1970. it.wikipedia gives the exhibition spaces as created in 1935 and opened in 1970, at via di San Pietro in Carcere on the left flank of the Vittoriano, administered by the Istituto per la storia del Risorgimento italiano."* |
| 25 | Ala Fori Imperiali | **REWRITE** | The finder gives only half the page. VIVE says both "è di prossima apertura" and "lo spazio è attualmente in corso di completo restauro". Use: *"VIVE describes the Ala Fori Imperiali, designed by Armando Brasini between the 1920s and 1930s with its own entrance onto via dei Fori Imperiali, as under complete restoration and due to open (VIVE's page, checked 2 September 2026)."* |
| 26 | Sacrario delle Bandiere | **DROP** | *"No official page fetched."* The finder's own note says it needs a source before publication. It does not have one. |
| 27 | Sculptural and memorial elements | **REWRITE** | Only the ones VIVE's "cosa vedere" index actually names may be listed, attributed to VIVE. The OSM-only ones (the six altari delle città redente, the Bollettino inscription) drop out unless VIVE names them. |
| 28 | Fontana del Tirreno / dell'Adriatico | **DROP** | *"Need a Sovrintendenza or VIVE page."* They do not have one. |
| 29 | Sepolcro di Gaio Publicio Bibulo | **PUBLISH** | Attributed. A good find and it survives. |
| 30 | Insula dell'Ara Coeli | **PUBLISH** | Attributed — and independently corroborated: the Sovrintendenza's Santa Rita page confirms the medieval San Biagio "de mercato" stood on that site. |
| 31 | Monumento a Cola di Rienzo | **PUBLISH** | Re-fetched and confirmed word for word, including "inaugurata senza clamore il 20 settembre 1887" and the reused Ara Coeli reliefs. The strongest single sourced entry in the file. |

### §3.3 Churches and religious houses — items 32–49
| # | Place | Ruling | Reason |
|---|---|---|---|
| 32 | Santa Maria in Aracoeli | **PUBLISH** | Attributed. Domain dead — **no hours may be published.** |
| 33 | Santa Francesca Romana | **PUBLISH** | Attributed. `.va` domain dead, Facebook is not a source — **no hours.** |
| 34 | SS. Cosma e Damiano | **REWRITE** | See §2.3. Publish the it.wikipedia facts attributed — 6th century, minor basilica, mother house of the Franciscan Third Order Regular since 1512, built into the Temple of Peace. **Nothing from `cosmadamiano.com`**, which returned 406 to me. |
| 35 | SS. Luca e Martina | **PUBLISH** | 1634–1664 attributed. Pietro da Cortona correctly withheld — keep it withheld. |
| 36 | San Giuseppe dei Falegnami | **PUBLISH** | Attributed. |
| 37 | Santa Maria della Consolazione | **REWRITE** + escalate | See §2.2. Use: *"it.wikipedia places the church of Santa Maria della Consolazione in the rione Campitelli, on the square of the same name at the foot of the Tarpeian Rock, within the parish of Santa Maria in Portico in Campitelli and served by the Capuchins; it dates the earlier church's dedication to 3 November 1470 and the present building to 1585–1600. Overpass places the square itself in Ripa, and it.wikipedia's own rione article names piazza della Consolazione as the Ripa boundary."* Say both. Escalated. |
| 38 | San Teodoro al Palatino | **PUBLISH** | Attributed. Domain dead — **no hours.** |
| 39 | Sant'Anastasia al Palatino | **PUBLISH** | Attributed. |
| 40 | San Sebastiano al Palatino | **PUBLISH** | Prayer times re-fetched and confirmed to the minute, including the Thursday adoration to 21.00 the finder omitted and the Friday/Saturday "deserto". Operator's own site, publishable as identity and hours. |
| 41 | San Bonaventura al Palatino | **PUBLISH** | Attributed. Convent site 404 — no hours. |
| 42 | San Lorenzo in Miranda | **PUBLISH** | Attributed. |
| 43 | Nobile Collegio Chimico Farmaceutico | **PUBLISH** | 1429 grant confirmed verbatim on the institution's own site. Note the site publishes **no opening hours**, only guided visits by booking — say that, do not invent hours. The finder is right that this is a strong find. |
| 44 | Santa Maria Annunziata a Tor de' Specchi | **REWRITE** | The 9 March opening is real and confirmed, but it is it.wikipedia, not the monastery. Use: *"it.wikipedia records that the church, in via Tor de' Specchi and attached to the monastery of Santa Francesca Romana, is open to the public only on 9 March, the saint's feast day; it corresponds to the medieval Santa Maria de Curte, was granted to the Oblates of Santa Francesca Romana after the monastery was founded in 1433, and was rebuilt in the early 18th century."* Drop the unsourced "via del Teatro di Marcello". |
| 45 | Santa Maria Antiqua | **REWRITE** | it.wikipedia only; its cited PArCo link is unreachable. Publish the description attributed and say nothing operational. |
| 46 | Oratorio dei Quaranta Martiri | **PUBLISH** | Attributed. |
| 47 | Sant'Adriano al Foro Romano | **REWRITE** | Same fabric as the Curia Iulia (item 51). One entry, not two: the Curia, with the church's 630–1930s life as a paragraph inside it. |
| 48 | Santa Maria delle Grazie / San Biagio de Mercato | **REWRITE** | Not visitable places. San Biagio folds into item 30 as the substructure; Santa Maria delle Grazie is a line of narrative, not an entry. |
| 49 | Nine vanished churches | **DROP** as places | The finder agrees. Keep one sentence: Santa Maria Liberatrice was demolished in 1900 to excavate Santa Maria Antiqua. |

### §3.4 The Roman Forum — items 50–63
| # | Place | Ruling | Reason |
|---|---|---|---|
| 50 | Foro Romano | **REWRITE** | I re-fetched the Sovrintendenza page and every figure is verbatim correct. But it is a third party republishing PArCo's tariff, and that must show. Use: *"The Roman Forum is run by the Parco archeologico del Colosseo. The Parco's own site could not be reached for this entry; the following is as published by the Sovrintendenza Capitolina and checked on 2 September 2026. Opening is daily with last entry an hour before closing: 09.00–17.30 from 1 to 27 March, 09.00–19.15 from 28 March to 30 September, 09.00–18.30 from 1 to 24 October, 09.00–16.30 from 25 October to 28 February; 09.00–14.00 on 24 and 31 December; 08.30–16.30 on 1 January. The Forum Pass Super is given as €18,00 full, valid for the day across the Foro Romano, the Fori Imperiali and the Palatino. Named tickets have been required for all admissions to the Parco archeologico del Colosseo since 18 October 2023. Check with the Parco before travelling."* "Circa due ore" banned (§5). |
| 51 | Curia Iulia | **PUBLISH** | Attributed. Absorbs item 47. |
| 52 | Arco di Settimio Severo | **PUBLISH** | Attributed. |
| 53 | Arco di Tito | **PUBLISH** | Attributed. |
| 54 | Colonna di Foca | **PUBLISH** | Attributed. |
| 55 | Tempio di Saturno | **PUBLISH** | Attributed, with the disputed consecration kept disputed. |
| 56 | Tempio di Antonino e Faustina | **PUBLISH** | Attributed. The inscription is independently corroborated on `nobilecollegio.it`, which quotes DIVAE FAVSTINAE EX S C and the 161 addition. |
| 57 | Basilica di Massenzio | **PUBLISH** | Attributed. Note the finder's own numbering collides — his §3.3 item 47 says "Same building as #57", but #57 is the Basilica of Maxentius, not the Curia. A numbering slip, not an evidence problem. |
| 58 | Tempio di Venere e Roma | **REWRITE** | The superlative is banned (§5). The twenty-four elephants are a classical anecdote — attribute or drop. Keep Hadrian, 121–135–141, attributed. |
| 59 | Casa delle Vestali | **PUBLISH** | Attributed. |
| 60 | Lapis Niger | **PUBLISH** | Attributed. |
| 61 | Carcere Mamertino | **REWRITE** | Structure attributed; **no hours, no tickets** — `carceremamertino.it` does not resolve and OSM's `tourism=museum` is not an operator. "Il più antico carcere di Roma" banned (§5). |
| 62 | ~33 further mapped Forum features | **REWRITE** | These are not thirty-three places. They are the contents of one ticketed enclosure, sourced to a containment query and nothing else. Fold them into item 50 as a named list. The finder's own §5 says exactly this; I am ruling it, not suggesting it. |
| 63 | Antiquarium Forense | **PUBLISH** | Address "piazza Santa Maria Nova 53" and "creato nel 1900 da Giacomo Boni" both re-verified. Note it.wikipedia gives the official name as Museo del Foro Romano, citing a PArCo page we cannot reach — attribute that, do not assert it. |

### §3.5 The Palatine — items 64–80
| # | Place | Ruling | Reason |
|---|---|---|---|
| 64 | Palatino | **REWRITE** | **Publish no height.** The finder found one it.wikipedia page giving 51 m in the body and 48,2 in its own infobox. Use: *"The Palatine is one of Rome's seven hills, between the Velabrum and the Forum. it.wikipedia describes two summits, the higher called Palatium and the other Germalus or Cermalus."* No number. |
| 65 | Domus Flavia | **PUBLISH** | Attributed. |
| 66 | Domus Augustana | **PUBLISH** | Attributed. |
| 67 | Stadio Palatino | **PUBLISH** | Attributed. |
| 68 | Domus Severiana, Terme Severiane, Arcate severiane, Terme di Massenzio | **REWRITE** | Overpass only, no per-place source. Name them inside the Palatine entry. |
| 69 | Settizonio | **PUBLISH** | Attributed. Genuinely the southernmost find and it holds up. |
| 70 | Casa di Augusto | **PUBLISH** | Attributed. Flag it as a ticketed Super site without pricing it — we have no operator source. |
| 71 | Casa di Livia | **PUBLISH** | Attributed, with the identification kept as an identification. |
| 72 | Casa dei Grifi | **REWRITE** | "Oldest surviving painted Republican house on the hill" is a superlative from an aggregator. Cut the clause; keep the house. |
| 73 | Aula Isiaca | **REWRITE** | A bare URL with no fact attached. Either state something the article says or drop it. |
| 74 | Domus Tiberiana | **DROP** | The only thing the finder offers is a reopening date he says needs a PArCo source he could not reach. Nothing else is stated. Nothing to publish. |
| 75 | Criptoportico Neroniano | **REWRITE** | See §2.4 — the cited article is the generic `Criptoportico`, which does not describe this structure. Re-source or fold into the Palatine entry as a mapped feature only. |
| 76 | Elagabalium / Vigna Barberini | **PUBLISH** | Attributed. |
| 77 | Tempio della Magna Mater | **REWRITE** | Bare citation, no stated fact. Same treatment as 73. |
| 78 | Twelve further Palatine features | **REWRITE** | Fold into the Palatine entry. Not twelve places. |
| 79 | Horti Farnesiani | **REWRITE** | No standalone article; the redirect resolves to Palatino. Publish as a named section of the hill, attributed. |
| 80 | Antiquarium del Palatino / Museo Palatino | **PUBLISH** | Attributed; Rosa, Lanciani 1882 and Bartoli all in the cited article. |

### §3.6 The Imperial Fora strip — items 81–85 (all escalated)
| # | Place | Ruling | Reason |
|---|---|---|---|
| 81 | Foro di Cesare | **PUBLISH** + escalate | Attributed. |
| 82 | Foro di Nerva | **PUBLISH** + escalate | Attributed. |
| 83 | Tempio della Pace | **PUBLISH** + escalate | Attributed; SS. Cosma e Damiano is built into it. |
| 84 | Basilica Argentaria, Tempio di Venere Genitrice, Via Alessandrina | **PUBLISH** + escalate | Via Alessandrina re-verified verbatim on the Sovrintendenza: Bonelli, opened 1584, over 400 metres. Keep the past tense — the street was largely destroyed in the 1930s. |
| 85 | Fori Imperiali visitor route | **REWRITE** + escalate | Re-verified verbatim. The split must be stated, not smoothed. Use: *"The Sovrintendenza Capitolina describes a walkway through the Imperial Fora entering at the Trajan's Column end and leaving at the Foro di Cesare on via Bonella, passing beneath via dei Fori Imperiali. The entrance stands in the rione Monti and the exit in Campitelli; the road between them is the boundary."* |

### §3.7 Squares, streets and palaces — items 86–98
| # | Place | Ruling | Reason |
|---|---|---|---|
| 86 | Piazza d'Aracoeli | **PUBLISH** | Attributed. |
| 87 | Fontana di piazza d'Aracoeli | **PUBLISH** | Re-verified: Della Porta, 1589, the c.1860 basin, the 2025 PNRR Caput Mundi restoration. Date the restoration to the fetch. |
| 88 | Piazza Margana | **REWRITE** + escalate | it.wikipedia names piazza e vicolo Margana as the Sant'Angelo boundary. Use: *"Piazza Margana, a medieval tower square. it.wikipedia's rione article names the square and vicolo Margana as the boundary with Sant'Angelo."* |
| 89 | Palazzo Maccarini Odescalchi | **REWRITE** | The only source is a one-line bullet in the rione article. Use: *"Palazzo Maccarini Odescalchi, on piazza Margana; it.wikipedia's Campitelli article describes it as a 17th-century Mannerist building."* |
| 90 | Palazzo Muti Bussi | **PUBLISH** | Re-verified verbatim, address included: "via dell'Aracoeli, 2 (Rione X Campitelli)", Della Porta c.1585, De Rossi 1642–45 and 1660–62, the Bussi marriage. Worth adding that the article gives it five facades — which is why the rione article lists it on via di San Venanzio and the palace article on via dell'Aracoeli. Not a conflict. |
| 91 | Palazzo Fani | **REWRITE** | Worse than the finder said: the rione article is self-contradictory in one line — *"Edificio in stile manierista del XVII secolo (1575)"*, a 17th-century building dated to the 16th. Use: *"Palazzo Fani, at the corner of piazza d'Aracoeli and via della Tribuna di Tor de' Specchi. it.wikipedia describes it as Mannerist and credits Giacomo Della Porta with its renewal for the Fani; its rione article adds a raising by Giovanni Battista Giovenale in 1885–88. The two Wikipedia pages give different dates and neither is a primary source."* |
| 92 | Palazzo Massimo di Rignano | **REWRITE** | Same shape. Attribute Carlo Fontana; carry both the "Baroque, 15th-c. origin for the Boccabella" reading and the rione article's "XVII secolo (1696)" without choosing. |
| 93 | Piazza della Consolazione | **DROP** from Campitelli | Tests Ripa. Record for Ripa. |
| 94 | Ex Ospedale della Consolazione | **DROP** | *"Needs its own source."* It has none. |
| 95 | Teatro della Cometa | **REWRITE** | I did not re-fetch it and the finder gives no fact from it beyond that the domain redirects. Use: *"Teatro della Cometa, a working theatre in the rione, at teatrodellacometa.com."* No programme, no history, no "genuinely useful" editorialising until someone reads the site. |
| 96 | Rappresentanza della Regione Calabria | **DROP** | A regional government office. Civic, thin, no visitor content. |
| 97 | Named streets | **REWRITE** | A street list, not places. Mark which are boundaries — via dei Fori Imperiali (Monti), via di San Teodoro, vico Jugario, via di Monte Caprino (Ripa). |
| 98 | Bus interchange "P.za Venezia" | **REWRITE** | OSM only. It is a useful illustration of how tight the boundary is; it is not a place. One line inside the boundary discussion. |

### §3.8 Eating, drinking and staying — items 99–109
| # | Place | Ruling | Reason |
|---|---|---|---|
| 99 | Antica Trattoria Angelino, Piazza Margana 37 | **REWRITE** | Overpass name and address only, and Piazza Margana is a boundary. Publish name and address, nothing else. **No trading duration** — "Antica" in a business name is not evidence of age and must not be glossed. |
| 100 | La Terrazza Caffarelli, Piazzale Caffarelli 4 | **REWRITE** | Address re-verified on the venue's own site. Identity and address only. |
| 101 | Eduardo II, Vicolo Margana 14 | **REWRITE** | Name and address only. |
| 102 | DIDDIBISTRO, Piazza d'Aracoeli 4 | **REWRITE** | Name and address only. |
| 103 | Antico Caffè del Teatro Marcello, Via del Teatro di Marcello 42 | **REWRITE** | Name and address only; same "Antico" caution as 99. |
| 104 | Bar Campidoglio, Caffé Rudy, Vacanze Romane, Caffè del Teatro, Espresso & Co | **REWRITE** | Overpass names. Two of them ("Vacanze Romane", "Caffè del Teatro") have no street number in the file — publish only those with a full address. |
| 105 | Caffeteria del Parco | **REWRITE** | Inside the archaeological enclosure; publish as an amenity of item 50, not a standalone. |
| 106 | 075, Ad Hoc Circo Massimo, Osteria Circo, Art Cafe, Gelateria Artigianale, Easy Bike Rent | **DROP** | **Ripa.** See §2.1 — my independent `is_in` on via dei Cerchi returns Rione XII Ripa. |
| 107 | Bella Nonna | **DROP** | Aggregator-hosted listing, no independent source, and a single apartment rental is not a guide entry. |
| 108 | Touristation | **DROP** | No fetched source, no stated fact, and an "area" address is not an address. |
| 109 | Museo della Cucina | **DROP** | **Ripa**, and its site presents a self-signed certificate and could not be fetched. Two independent reasons. |

### §3.9 Visitor infrastructure — items 110–112
| # | Place | Ruling | Reason |
|---|---|---|---|
| 110 | Centro Informazioni Turistiche PArCo | **DROP** | Its only website is unreachable. An OSM `information` node is not a source for a staffed facility's existence or hours. |
| 111 | Four ticket offices | **REWRITE** | OSM points. Fold into the parent entries as "the ticket point for X is at…", never as places. |
| 112 | UNESCO status | **REWRITE** | **The finder's framing is wrong even though his figures are right.** UNESCO's own page says the property was *"first inscribed on the World Heritage List in 1980 and extended in 1990 to the walls of Urban VIII, to the Holy See's extraterritorial properties, and to the Basilica of Saint Paul's Outside the Walls"* — the long serial title dates from the 1990 extension, not from 1980. Use: *"Campitelli lies within the UNESCO World Heritage property Historic Centre of Rome, the Properties of the Holy See in that City Enjoying Extraterritorial Rights and San Paolo Fuori le Mura (ref. 91). UNESCO records the historic centre as first inscribed in 1980, with a significant boundary modification in 1990 that extended the property to the walls of Urban VIII, the Holy See's extraterritorial properties and San Paolo fuori le Mura, and minor modifications in 2015 and 2023; the criteria are (i)(ii)(iii)(iv)(vi), the property 1,469.7 ha and the buffer zone 7,158.933 ha. UNESCO's brief synthesis describes the property as encompassing the whole historic centre of Rome within the city walls at their widest extent in the 17th century."* The finder is right that this is the **only** heritage-status statement any Campitelli page may carry. |

### §3.10 Boundary-line items — items 113–118
| # | Place | Ruling | Reason |
|---|---|---|---|
| 113 | Arco di Costantino | **DROP** pending arbitration | Escalated. I tried to settle it and could not: my `is_in` at the finder's coordinates timed out on `overpass-api.de` and returned 504 on both mirrors. Two verifiers have now failed to resolve it. |
| 114 | Meta Sudans | **DROP** pending | Same contested strip; my query timed out too. |
| 115 | Base del Colosso di Nerone | **DROP** pending | Same strip, containment query only. |
| 116 | Piazza del Colosseo | **DROP** pending | Only its western pedestrian ways are claimed, and by the containment primitive that is already discredited on via dei Cerchi. |
| 117 | Piazza Venezia | **DROP** | My own `is_in` returns **Rione II Trevi**, matching the finder's method A against Nominatim's and it.wikipedia's Pigna. Four sources, three answers. **No Campitelli page may state which rione Piazza Venezia is in.** The Vittoriano fronting it is not evidence. |
| 118 | Piazza di Campitelli and Santa Maria in Portico | **DROP** the church; escalate the piazza | My independent `is_in(41.893127, 12.479498)` returns *"Municipio Roma I; Piazza di Campitelli [place=square]; **Rione XI Sant'Angelo**"*, and it.wikipedia's article on the church opens *"Santa Maria in Campitelli è una chiesa di Roma nel rione Sant'Angelo."* Two independent determinations, both Sant'Angelo, none for Campitelli. This is not an arbitration question for the **church** — it publishes under Sant'Angelo. The **square** is a genuine straddler and is escalated. |

---

## 4. THE THREE RULINGS — compliance

**Ruling 1 (no designation claims): one live violation, correctly quarantined by the finder, and I
confirm the ban.** I re-fetched `it.wikipedia.org/wiki/Palazzo_Albertoni_Spinola` and the sentence is
there verbatim: *"Il Palazzo Albertoni Spinola è un edificio a Roma **dichiarato di interesse
storico-artistico da parte del Governo Italiano**."* That is a *dichiarazione di interesse culturale*
claim in substance. **Banned at any strength, attributed or not.** The palace itself still publishes:
piazza Campitelli 2, Giacomo Della Porta and Girolamo Rainaldi, c.1580–c.1616, commissioned by
Baldassarre Paluzzi Albertoni, "si trova nel Rione X (Campitelli)" — all in the same article, all
clean, all attributed.

On the Vittoriano: **"Monumento Nazionale a Vittorio Emanuele II" is the monument's name and may be
used as a name.** No sentence may assert a protection status, a listing, or a legal designation for
it. The finder's caution here was right in substance and slightly over-broad in expression; this is
the line.

**Ruling 2 (Vatican): not engaged. Confirmed.** No part of Vatican City is in or near Campitelli, and
no Lateran Treaty extraterritorial property falls in the rione — the extraterritorial basilicas are
San Giovanni in Laterano, Santa Maria Maggiore (Monti/Esquilino) and San Paolo fuori le Mura
(Ostiense), none of them here. Campitelli is clean on this ruling and the finder said so correctly.

**Ruling 3 (no photographs): compliant.** `"photos": []` throughout, no image sourced, named or
linked. The finder's §8 records visual subjects for a later wave without linking anything, which is
the correct handling. His warning that Italy's lack of freedom of panorama must be re-analysed by the
photo wave rather than inherited is right and should carry forward.

---

## 5. CLAIM-LEVEL DROPS — 13 claims banned regardless of which entry they sit in

Six of these the finder quarantined himself and I confirm; the rest I add.

**Designation (ruling 1) — 1**
1. "dichiarato di interesse storico-artistico da parte del Governo Italiano" (Palazzo Albertoni Spinola). Re-fetched and confirmed present. **Banned.**

**Superlatives from an operator or an aggregator — 8**
2. "Il museo pubblico più antico del mondo" — Sovrintendenza Capitolina, about a museum it runs. Re-fetched, present verbatim. An institution's parent body does not establish "the oldest".
3. "il più piccolo dei colli di Roma" — Musei Capitolini, `campidoglio_antico`. Re-fetched, present verbatim.
4. "Nessun altro luogo a Roma è più centrale, elevato o spettacolare" — VIVE, terrazza panoramica. Re-fetched, present verbatim.
5. "il più importante monumento al primo re d'Italia" — VIVE, on the Vittoriano. Present verbatim; operator superlative.
6. "the longest-serving town hall still in use" — it.wikipedia, Palazzo Senatorio, unsourced.
7. "il più antico carcere di Roma" — it.wikipedia, Carcere Mamertino.
8. "il più grande tempio conosciuto dell'antica Roma" — it.wikipedia, Tempio di Venere e Roma.
9. **"il rione meno popolato di Roma"** — it.wikipedia, Campitelli. **The finder missed this one.** If the fact is wanted, the only publishable form is attributed and paired with the conflict: *"Roma Capitale's Annuario statistico 2022 records 515 residents in Campitelli; it.wikipedia's article gives 516 and calls it Rome's least-populated rione. The corpus states no population figure without a third source."* Better: state neither number and say the rione has a few hundred residents only if a third source is found.

**Trading duration / awards from the business itself — 1**
10. "First lady e capi di Stato di ogni parte del mondo hanno confermato lo scenario unico e incomparabile di Terrazza Caffarelli" — the venue's own marketing. Re-fetched, present verbatim. An award-and-prestige claim sourced to the business. **Banned.**

**Trip durations — 2**
11. "Nel giro di un minuto" — VIVE, the Vittoriano lifts. Re-fetched, present verbatim.
12. "in circa due ore" — Sovrintendenza, the Forum Pass Super route. Re-fetched, present verbatim.

**Vague proximity — 1**
13. The finder's file is clean of vague proximity, with one exception to watch in drafting: item 29's *"beside the left flank of the Vittoriano, by the flowerbed in front of the Adriatic fountain"* is a located description, which is fine, but any drafting that softens it to "just by the Vittoriano" or "a short step from" is banned. Same for item 34's "built into the Temple of Peace", which is a physical fact and stays.

---

## 6. ESCALATED TO THE ARBITRATOR — six straddlers

1. **The Arch of Constantine strip** — Arco di Costantino, Meta Sudans, Base del Colosso di Nerone, the west end of Piazza del Colosseo. Overpass `is_in` says Celio; Overpass containment over the same relation says Campitelli; Nominatim says Campitelli; it.wikipedia's rione article implies Campitelli via the via di San Gregorio boundary. **Two Overpass primitives over one relation disagree, and I could not break the tie — my own queries timed out on three endpoints.** Note for the arbitrator: on via dei Cerchi, where I *could* get a second determination, the containment primitive was the one that was wrong. That is evidence about which primitive to trust, not proof.
2. **Piazza di Campitelli** — named by it.wikipedia's rione article as the Sant'Angelo *boundary* and simultaneously listed among Campitelli's five piazze, in one page. The church that names the rione is settled (Sant'Angelo, two independent determinations); the square, and Palazzo Capizucchi and Palazzo Albertoni Spinola on it, are not. Both palaces test Campitelli and both it.wikipedia articles say Campitelli, so they lean Campitelli — but they stand on a square the same encyclopaedia calls the border.
3. **Piazza Venezia** — Trevi (my `is_in`, and the finder's) / Pigna (Nominatim and it.wiki's own infobox) / Campitelli (it.wiki's rione article). **My recommendation: state no rione at all**, and let the Vittoriano carry the geography.
4. **Santa Maria della Consolazione** — church Campitelli, square Ripa, and it.wikipedia's church article says the church is *in Campitelli in the square of the same name* while its infobox gives vico Jugario, the Ripa border. Three positions inside one article set. **Escalating on corrected evidence — see §2.2, the finder's statement of this straddler is factually wrong.**
5. **The Imperial Fora strip** — Foro di Cesare, Foro di Nerva, Tempio della Pace, Basilica Argentaria, Tempio di Venere Genitrice and Via Alessandrina all test Campitelli because via dei Fori Imperiali is the boundary and they lie south of it; Trajan's Forum, Column, Markets and the Forum of Augustus are Monti. **The Sovrintendenza's own visitor route runs from Monti into Campitelli under the road.** Every guidebook treats the Imperial Fora as one thing in Monti. Whoever owns this must own the whole route or the corpus will describe half a walk.
6. **Piazza del Colosseo** — listed by it.wikipedia among Campitelli's piazze; the amphitheatre tests Celio at the centroid and all four perimeter points, which I independently confirm.

---

## 7. TIER RULING

**GUIDE.** Not close. Even after 21 drops and with the ~45 archaeological features folded back into
their two parent enclosures, Campitelli retains well over a dozen entries with fetched, re-verified,
operator-or-Sovrintendenza sourcing: the Musei Capitolini with confirmed hours and tariffs, Piazza
del Campidoglio, the Cordonata, the Fontana della Dea Roma, the Monumento a Cola di Rienzo, the
Fontana di piazza d'Aracoeli, the Vittoriano with the Altare della Patria, the Tomb of the Unknown
Soldier, the Terrazza Panoramica, the Museo Centrale del Risorgimento and the Ala Fori Imperiali, the
Roman Forum, the Palatine, the Antiquarium Forense, San Sebastiano al Palatino with published prayer
times, the Nobile Collegio Chimico Farmaceutico, Santa Maria Annunziata a Tor de' Specchi with its
one-day-a-year opening, Santa Maria in Aracoeli, Santa Francesca Romana, SS. Cosma e Damiano, the
Carcere Mamertino, Palazzo Muti Bussi, and the Sepolcro di Bibulo.

**But I endorse the finder's yield warning and put it in the ruling.** The 118 figure is inflated by
roughly sixty archaeological features inside two ticketed enclosures. Counting them as sixty places
would make Campitelli look like the richest rione in the programme when what it actually is, is two
of the greatest archaeological sites on earth plus a very small inhabited quarter of about 515 people
with six or seven cafés. **The guide should be built around the enclosures as entries, not around
their contents as entries.** If a later count treats the Forum's thirty-three mapped features as
thirty-three places, that is the corpus counting stones.

---

## 8. WHAT I WOULD CHASE NEXT

- **A working Overpass session for the Arch of Constantine strip.** Four points remain unresolved and
  they are the difference between Campitelli and Celio owning the single most photographed arch in
  Rome. One patient run at low rate would settle items 113–116.
- **`cosmadamiano.com` from a client that gets a 200.** It is the only operator source for a basilica
  we are otherwise publishing entirely on Wikipedia.
- **A PArCo source from any network.** Item 50 is the largest entry in the rione and rests wholly on
  a third party republishing the operator's tariff.
- **`dati.comune.roma.it` toponymic shapefile.** The finder is right that it would end §6 at a
  stroke, and neither of us retried it.
- **The Sovrintendenza sections neither of us crawled** — *Statue parlanti* almost certainly holds
  Marforio, and *Colombari e Sepolcri* the Sepolcro di Bibulo. Two entries currently on Wikipedia
  alone would move to a municipal source.
