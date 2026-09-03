# Campitelli (R. X, code 110) — FINDER file

Wave 1, Rome programme. **Evidence, not adjudication.** A verifier adjudicates; an arbitrator rules
ownership of straddlers. Research date: 2026-09-02.

Roma Capitale Annuario statistico 2022 Tab. 1.3 gives Campitelli 0,6 km², 515 residents, 873,0 ab./km²
(carried in `priv/seed_data/rome_roster.json`, sourced there). It.wikipedia's rione article says 516 —
a one-unit disagreement with the Comune's own table. **Do not publish a population figure without a
third source.**

---

## 0. THE THREE RULINGS — compliance notes for this file

1. **No designation claims.** I found designation language in two fetched sources and have quarantined
   it. See §7. Nothing in §3 asserts protection status.
2. **Vatican.** No Vatican property is in or near Campitelli; no Lateran Treaty extraterritorial
   property falls in Campitelli either (Santa Maria Maggiore is Monti/Esquilino; San Paolo is Ostiense).
   Campitelli is clean on this ruling.
3. **No photographs.** `"photos": []` everywhere. Image leads noted in §8 for the later photo wave only;
   nothing is sourced, named or linked as a publishable image.

---

## 1. What I could and could not fetch

Every status below was observed by me in this session with `python3 + urllib`, not assumed.

### Reached (HTTP 200, raw bytes)
| Source | URL | What it is good for |
|---|---|---|
| Musei Capitolini (Roma Capitale / Sovrintendenza) | `https://www.museicapitolini.org/it/informazioni_pratiche/orari_e_indirizzi` | address, hours, closures |
| " | `https://www.museicapitolini.org/it/informazioni_pratiche/biglietti_e_videoguide` | prices |
| " | `https://www.museicapitolini.org/it/il_museo/storia_del_museo` | foundation 1471 |
| " | `https://www.museicapitolini.org/it/sede/piazza_e_palazzi` | Michelangelo authorship of the piazza |
| " | `https://www.museicapitolini.org/it/sede/campidoglio_antico` | the two summits, the 8 m fill |
| Sovrintendenza Capitolina | `https://www.sovraintendenzaroma.it/i_luoghi/...` (per-place paths, see below) | dating, authorship, materials |
| VIVE — Vittoriano e Palazzo Venezia (MiC institute) | `https://vive.cultura.gov.it/it/vittoriano`, `/storia`, `/altare-della-patria`, `/terrazza-panoramica`, `/museo-centrale-del-risorgimento`, `/ala-fori-imperiali` | Vittoriano complex |
| Parrocchia S. Maria in Portico in Campitelli | `https://www.santamariainportico.it/` | address, Mass times, order |
| Basilica SS. Cosma e Damiano | `https://www.cosmadamiano.com/`, `/la-basilica/` | parish/own account |
| Chiesa di San Sebastiano al Palatino | `https://sansebastiano.fraternita-gerusalemme.it/home` | prayer/opening times, community |
| Nobile Collegio Chimico Farmaceutico | `https://nobilecollegio.it/` | 1429 papal grant, San Lorenzo in Miranda |
| Istituto per la storia del Risorgimento italiano | `https://www.risorgimento.it/` | operator of the Museo Centrale del Risorgimento |
| UNESCO WHC | `https://whc.unesco.org/en/list/91/` | inscription 1980, ref 91, criteria (i)(ii)(iii)(iv)(vi) |
| 060608 (Roma Capitale contact centre) | `https://060608.comune.roma.it/` | live, but delegates to per-site pages |
| OSM Overpass | `https://overpass-api.de/api/interpreter` (+ kumi.systems, private.coffee mirrors) | boundary containment |
| Nominatim | `https://nominatim.openstreetmap.org/reverse` | reverse geocode `quarter` field |
| it.wikipedia MediaWiki API | `action=parse&prop=wikitext` | aggregator, attribute explicitly |

### NOT reached — this is load-bearing
| Host | Result |
|---|---|
| `parcocolosseo.it` / `www.parcocolosseo.it` | **TCP timeout**, 3 paths, 2 attempts each |
| `colosseo.it` | **TCP timeout** |
| `cultura.gov.it` | **TCP timeout** |
| `ticketing.colosseo.it` | 403 |
| `www.turismoroma.it` | 403 on every path tried (it/ and en/) |
| `www.santamariainaracoeli.it`, `www.carceremamertino.it`, `www.santoteodoro.it`, `www.olivetanisantafrancescaromana.it`, `www.santafrancescaromana.va` | DNS: no such host |
| `www.museodellacucina.it` | TLS: self-signed certificate |
| `www.fratipalatino.org/convento` | 404 |

> **CONSEQUENCE, and the verifier must weigh it.** The single largest visitor site in the rione — the
> Roman Forum and the Palatine — is run by the **Parco archeologico del Colosseo**, whose own domain
> is unreachable from this network in exactly the way the MiC netblock was in the earlier scoping
> research. Every operational fact I have about PArCo (hours, the €18 Forum Pass Super, the named-ticket
> rule from 18 Oct 2023) comes **second-hand from the Sovrintendenza Capitolina's page** at
> `https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/aree_archeologiche/fori_imperiali`.
> That is a public body republishing another public body's tariff. It is not the operator's own site.
> **Flagging it rather than treating it as primary.** Same shape as the Vincoli in Rete problem: not
> false, just not provenanced to the body that sets it.
>
> Note also that `www.museicapitolini.org` returns HTTP **404 with a full styled page body** (87–88 KB)
> for wrong paths. Anything scraping it must check status, not body length.

---

## 2. BOUNDARY METHOD, and where the methods disagree

I used three independent determinations per place and recorded all three when they diverged:

- **(A) OSM Overpass `is_in(lat,lon)` → `area["place"~"quarter"]`** against the 22 rione boundary
  relations. Campitelli is **relation 5454237**, `official_name=Rione X Campitelli`. This is a true
  point-in-polygon test. 122 points tested across two batches.
- **(B) Nominatim reverse geocode**, reading the `quarter` field — the method the earlier scoping
  research reported as 8/8 correct on central landmarks.
- **(C) it.wikipedia**, both the rione article's own boundary prose and each monument article's
  stated rione. Aggregator — attributed, never asserted.

**Method (A) is not free of contradiction with itself.** A `map_to_area(rel 5454237)` containment
query returned the Arch of Constantine node as inside Campitelli, while `is_in()` at the *same
coordinates* returned Celio and only Celio. Two Overpass primitives over the same relation disagree.
I did not resolve it and the arbitrator should not assume Overpass speaks with one voice here.

**Method (B) disagreed with (A) twice**, both times at famous places (Arch of Constantine, Piazza
Venezia). The earlier scoping note that Nominatim "worked for 8 of 8 central landmarks" should not be
read as a guarantee at rione *edges* — Campitelli is 0,6 km² and almost everything in it is near an edge.

**The rione's own it.wikipedia boundary prose is a list of streets and squares that are themselves
the border**, which is the root of most of the trouble:

> confina con: **Pigna**: via e piazza San Marco · **Trevi**: piazza Madonna di Loreto · **Monti**: via
> dei Fori Imperiali · **Celio**: via di San Gregorio · **Ripa**: via dei Cerchi, piazza Santa Anastasia,
> via di San Teodoro, via dei Fienili, piazza della Consolazione, vico Jugario, via di Monte Caprino ·
> **Sant'Angelo**: via Montanara, piazza di Campitelli, via Cavalletti, via dei Delfini, piazza e vicolo
> Margana, via dell'Aracoeli
> — `https://it.wikipedia.org/wiki/Campitelli`

Piazza di Campitelli, piazza della Consolazione and piazza Margana are each named as the *boundary*.
A building on one side is in, on the other side out, and no source I reached says which side.

### Determinations that came back cleanly Campitelli (all three methods agree)
Piazza del Campidoglio · Palazzo Senatorio · Palazzo dei Conservatori · Palazzo Nuovo · Palazzo
Caffarelli · Cordonata · Santa Maria in Aracoeli · Vittoriano · Roman Forum (centre) · Arch of
Septimius Severus · Curia Iulia · Arch of Titus · Palatine · Palatine Stadium · Septizodium · Terme
di Massenzio · Carcere Mamertino · Santa Francesca Romana · Sant'Anastasia al Palatino · Santa Maria
della Consolazione (the church) · SS. Cosma e Damiano · SS. Luca e Martina · San Teodoro · San
Sebastiano al Palatino · San Bonaventura al Palatino · Santa Maria Antiqua · Oratorio dei Quaranta
Martiri · San Giuseppe dei Falegnami · Insula dell'Ara Coeli · Tor de' Specchi · Sepolcro di Bibulo ·
Tabularium · Rupe Tarpea / Monte Caprino · Belvedere Tarpeo · Temple of Venus and Rome · Meta Sudans ·
Piazza d'Aracoeli · Antiquarium Forense · Museo Palatino · Casa di Augusto · Casa di Livia · Domus
Tiberiana · Horti Farnesiani · Basilica of Maxentius · Temple of Saturn · Temple of Vesta · Column of
Phocas · Umbilicus Urbis · Basilica Aemilia · Basilica Iulia · Temple of Castor and Pollux · Temple of
Antoninus and Faustina · Temple of Divus Romulus · Lapis Niger · Elagabalium / Vigna Barberini ·
Palazzo Fani · Palazzo Massimo di Rignano · Palazzo Muti Bussi · Palazzo Maccarini Odescalchi ·
Piazza Margana · Teatro della Cometa.

### Determined NOT Campitelli — recorded so a later rione does not lose them
| Place | Method A (`is_in`) | Note |
|---|---|---|
| **Colosseum** | **Celio** at centroid and all four corners tested | it.wikipedia's Campitelli article nevertheless lists *Piazza del Colosseo* among Campitelli's piazze — and the west end of that piazza **is** inside Campitelli per Overpass. The amphitheatre is not. |
| **Theatre of Marcellus** | **Sant'Angelo** | The Wave-1 brief lists it as a likely Campitelli subject. **The brief is wrong.** Nominatim agrees: `Teatro di Marcello, Via del Foro Piscario, Sant'Angelo`. |
| Piazza Venezia | **Trevi** (A) / **Pigna** (B) / **Pigna** (it.wiki infobox) | it.wiki's Campitelli article lists it as a Campitelli piazza. Four-way mess — see §4. |
| Palazzo Venezia | Pigna | |
| San Marco Evangelista al Campidoglio | Pigna | The Campitelli churches' parent parish, but not in the rione. |
| Palazzo Astalli | Pigna | it.wiki says "(Rione X Campitelli)". **Direct contradiction** — see §4. |
| Trajan's Forum, Trajan's Column, Trajan's Markets, Torre delle Milizie, Casa dei Cavalieri di Rodi, Foro di Augusto, Torre dei Conti, Santa Maria di Loreto, SS. Nome di Maria, Piazza Madonna di Loreto, Domus Aurea, Ludus Magnus | Monti | |
| Circus Maximus, Piazza della Consolazione (the square), Area sacra di Sant'Omobono, Arco di Giano, Santa Maria in Cosmedin | Ripa | Note the church of Santa Maria della Consolazione is Campitelli while **the square it stands on** is Ripa. |
| San Nicola in Carcere, Crypta Balbi, Palazzo Cavalletti | Sant'Angelo | |
| Palazzo delle Assicurazioni Generali | Trevi | |

---

## 3. CANDIDATES

118 candidates. Format: **name** — kind · address · what it is · dating/authorship · rione evidence ·
source URL for each fact. `"photos": []` throughout.

### 3.1 The Capitoline: piazza, palaces, museums

1. **Piazza del Campidoglio** — monumental square · Piazza del Campidoglio, 00186 Roma. Musei
   Capitolini's own site: *"La piazza del Campidoglio nel suo aspetto attuale fu progettata intorno
   alla metà del Cinquecento da Michelangelo Buonarroti"*, and the constituent palaces, sculpture and
   paving were carried out over the following centuries with additions and changes
   (`https://www.museicapitolini.org/it/sede/piazza_e_palazzi`). Same site on the ancient hill: the
   Campidoglio had two summits, *Capitolium* and *Arx*, separated by a valley corresponding to today's
   piazza, whose level was about **8 metres below** the present one
   (`https://www.museicapitolini.org/it/sede/campidoglio_antico`). Rione: A=B=Campitelli; it.wiki
   infobox `quartiere=Campitelli`.
   *Caution:* the same museum page calls the Campidoglio *"il più piccolo dei colli di Roma"* — a
   superlative on the operator's own site. Corpus rule bars publishing it as fact.
2. **Palazzo Senatorio** — city hall · Piazza del Campidoglio 1. Seat of the Comune; Roma Capitale's
   own address record gives Piazza del Campidoglio 1 (OSM `addr` on the Roma Capitale object matches
   the Musei Capitolini address). it.wikipedia (aggregator): built from the first half of the 12th c.,
   municipal function continuously since 1144, on the ruins of the Tabularium and the temple of
   Veiovis, refaced in the 16th c. under Michelangelo then Giacomo Della Porta
   (`https://it.wikipedia.org/wiki/Palazzo_Senatorio`). **The "longest-serving town hall still in use"
   claim on that page is an unsourced superlative — do not carry it.**
3. **Palazzo dei Conservatori** — museum building · piazza del Campidoglio. it.wiki: architects
   Michelangelo Buonarroti and Giacomo Della Porta; commissioned by the Comune di Roma; named for the
   elective city magistracy that sat there for four centuries
   (`https://it.wikipedia.org/wiki/Palazzo_dei_Conservatori`).
4. **Palazzo Nuovo** — museum building · Piazza del Campidoglio. it.wiki: built in the 17th c. under
   Girolamo then Carlo Rainaldi, completed **1663**; facade design attributed to Michelangelo
   (`https://it.wikipedia.org/wiki/Palazzo_Nuovo_(Roma)`).
5. **Musei Capitolini** — municipal museum · **Piazza del Campidoglio 1 — 00186 Roma**. Hours, from
   the museum's own site: **daily 09.30–19.30**; 24 and 31 December 09.30–14.00; 1 January from
   11.00–20.00; last admission one hour before closing; **closed 1 May and 25 December**. Contact:
   call centre 060608 daily 09.00–19.00, `info.museicapitolini@comune.roma.it`
   (`https://www.museicapitolini.org/it/informazioni_pratiche/orari_e_indirizzi`).
   Tickets (same site, fetched 2026-09-02): from **February 2026 admission is free for residents of
   Roma and the Città Metropolitana** on production of an identity card; otherwise, with the current
   exhibitions, **€20,50 full / €15,00 reduced for non-residents**; online or 060608 presale carries a
   €1,00 booking fee; presold tickets are non-refundable and non-changeable; free for valid Roma MIC
   card holders (`https://www.museicapitolini.org/it/informazioni_pratiche/biglietti_e_videoguide`).
   Founding: the museum's own history page says **1471**, when Sixtus IV gave the Roman people a group
   of bronze statues (`https://www.museicapitolini.org/it/il_museo/storia_del_museo`).
   **TWO PROBLEMS THE VERIFIER MUST SEE.** (a) The museum's own site banner on every page reads
   *"La nascita dei Musei Capitoli viene fatta risalire al **1271**, quando il papa Sisto IV dono.."* —
   the site contradicts itself, 1271 vs 1471, on the same domain. Sixtus IV reigned 1471–84, so 1471
   is the coherent reading, but the corpus should cite the history page and not the banner. (b) The
   Sovrintendenza Capitolina calls it *"Il museo pubblico più antico del mondo, fondato nel 1471 da
   Sisto IV"* (`https://www.sovraintendenzaroma.it/i_luoghi/musei/musei_in_comune/musei_capitolini`).
   That is the operator's parent body asserting a world superlative about itself. **Corpus rule: an
   institution's own site does not establish "the oldest". Attribute it or drop it.**
6. **Palazzo Caffarelli al Campidoglio** (Palazzo Clementino Caffarelli / Villa Caffarelli) — museum
   wing · **Piazzale Caffarelli 4**. it.wiki: 16th-c. Caffarelli residence, later the Prussian embassy,
   expropriated by the Italian state after WWI, partly demolished and rebuilt as a municipal museum
   and linked to the Musei Capitolini; architect Gregorio Canonica
   (`https://it.wikipedia.org/wiki/Palazzo_Caffarelli_al_Campidoglio`).
7. **Cordonata Capitolina** — monumental ramped stair · from via del Teatro di Marcello to piazza del
   Campidoglio. it.wiki: designed 1534–38 by Michelangelo for Paul III, partly modified by Giacomo
   Della Porta; the Dioscuri groups placed on the balustrade in **1583**, the Trofei di Mario in
   **1590**, black basalt lion fountains at the foot
   (`https://it.wikipedia.org/wiki/Cordonata_(Roma)`). Rione: it.wiki infobox `quartiere=Campitelli
   (rione)`; A=Campitelli.
8. **Fontana della Dea Roma, piazza del Campidoglio** — fountain. Sovrintendenza Capitolina: author
   **Matteo Bartolani da Città di Castello**, dated **1588–1589**, marble, originally fed by the
   Acqua Felice; the Nile and Tiger (later Tiber) colossi were placed by Michelangelo on plinths in
   1543, the central niche took a Minerva in 1583, replaced in 1593 by a small seated Domitianic
   Minerva in porphyry and marble
   (`https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_della_dea_roma_in_piazza_del_campidoglio`).
9. **Marforio** — Roman colossal statue, one of Rome's talking statues · in the Palazzo Nuovo
   courtyard, Musei Capitolini. it.wiki: 1st-c. marble, possibly Neptune, Oceanus or the Tiber; found
   around 1510 in the Forum of Augustus (`https://it.wikipedia.org/wiki/Marforio`).
10. **Statua equestre di Marco Aurelio (copy in the piazza; original in the Musei Capitolini)** —
    sculpture · piazza del Campidoglio. OSM `wikidata=Q907387`. Facts to be sourced to the museum
    before publication; I did not fetch a per-object museum page.
11. **Lupa Capitolina** — bronze sculpture, Musei Capitolini. The Musei in Comune blog (operator
    channel, linked from museicapitolini.org) calls it a 5th-c.-BC lost-wax bronze; the dating is
    contested in scholarship and **should not be published from that blog post alone**
    (`https://museiincomuneroma.wordpress.com/2023/09/19/le-lupe-di-roma/`).
12. **Statua colossale di Costantino / Testa di Costantino** — sculpture and 2024–26 reconstruction ·
    Palazzo dei Conservatori courtyard and Villa Caffarelli. The museum runs a dedicated page
    `https://www.museicapitolini.org/it/mostra-evento/il-colosso-di-costantino` (listed on the site
    index; I did not fetch it).
13. **Protomoteca Capitolina** — bust gallery, listed by the museum as one of its rooms/venues
    (`https://www.museicapitolini.org/it/sede/piazza_e_palazzi`).
14. **Tabularium** — Roman public-record building, now part of the Musei Capitolini circuit ·
    beneath Palazzo Senatorio, arcaded facade onto the Forum. it.wiki
    (`https://it.wikipedia.org/wiki/Tabularium`). A=Campitelli.
15. **Terrazza Caffarelli** — public viewpoint and, separately, a private events venue at Piazzale
    Caffarelli 4 (`https://www.terrazzacaffarelli.it/`). The venue site is marketing copy — usable for
    identity and location only, and its "first ladies and heads of state" line is not publishable.
16. **Rupe Tarpea (Tarpeian Rock)** — cliff on the south side of the Capitoline. it.wiki
    (`https://it.wikipedia.org/wiki/Rupe_Tarpea`). A=Campitelli.
17. **Giardino di Monte Caprino / Belvedere Tarpeo** — public garden and viewpoint. OSM
    `leisure=park`, name "Belvedere Tarpeo", 41.891482/12.4818829. A=Campitelli. **Note via di Monte
    Caprino is itself the Ripa boundary per it.wiki.**
18. **Rampa Caffarelli**, **Scala dell'Arce Capitolina**, **Scalinata dell'Ara Coeli**, **Clivus
    Capitolinus** — named stairs and ramps, all inside Campitelli per Overpass. The Ara Coeli
    staircase has no it.wikipedia article of its own (checked: MISS).
19. **Avvocatura Capitolina**, **Ragioneria generale di Roma Capitale**, **Roma Capitale —
    Dipartimento Organizzazione e Risorse umane** — municipal offices on the hill, each with a
    `comune.roma.it` page (OSM `website` tags). Civic interest only; likely thin for a travel guide.

### 3.2 The Vittoriano complex

20. **Vittoriano / Monumento Nazionale a Vittorio Emanuele II** — national monument · piazza Venezia,
    north slope of the Capitoline. VIVE (the MiC institute that runs it): *"Il complesso, pensato nel
    gennaio del 1878, all'indomani della scomparsa del primo re d'Italia, Vittorio Emanuele II, fu
    inaugurato nel 1911"* (`https://vive.cultura.gov.it/it/vittoriano`). VIVE's eight-act history:
    origin by decision of the Italian government after the king's death in 1878; **Giuseppe Sacconi**
    designed it and built it **1885–1905**; Vittorio Emanuele III pushed the site so it could open in
    **1911**, the fiftieth anniversary of unification; the Unknown Soldier's burial turned it into a
    shrine; in the last years of WWII its basements sheltered Roman civilians; postwar it was closed
    to the public and tried for "offesa estetica"; relaunched under President Ciampi
    (`https://vive.cultura.gov.it/it/vittoriano/storia`).
    it.wikipedia adds: inaugurated **4 June 1911**; construction 1885–1935; **height 81 m**; owner
    Repubblica Italiana — Ministero della cultura (`https://it.wikipedia.org/wiki/Vittoriano`).
    **DATE CONFLICT to flag:** VIVE's dedicated Vittoriano page says the complex was *conceived* in
    January 1878; it.wiki's infobox says construction ran to 1935 while VIVE's history says Sacconi's
    build was 1885–1905. Both can be true (Sacconi died 1905; work continued) but the corpus must not
    blur them into one date range.
21. **Altare della Patria** — the monument's central altar. VIVE: conceived by Sacconi as an integral
    part of the design, sculpted frieze by **Angelo Zanelli**, and it **received the Tomb of the
    Unknown Soldier in 1921** to commemorate the First World War dead; a laurel wreath is still laid
    there at official ceremonies (`https://vive.cultura.gov.it/it/altare-della-patria`). VIVE also
    notes that very many people use "Altare della Patria" for the whole Vittoriano — useful, and a
    naming trap for the corpus.
22. **Tomba del Milite Ignoto** — the tomb itself, with its guard of honour. Same VIVE page.
23. **Terrazza Panoramica / Terrazza delle Quadrighe** — rooftop terrace, reached by panoramic lifts.
    VIVE: at **seventy metres**, a 360° view; two bronze quadrigas at the lift exit standing for the
    Unity and the Liberty of Italy (`https://vive.cultura.gov.it/it/terrazza-panoramica`).
    **Conflict with #20's 81 m** — different measurements (terrace vs total height), and the corpus
    must say which.
    *Rule tripwire:* the VIVE page says the lift ride takes "about a minute" and that "no other place
    in Rome is more central, elevated or spectacular". **The first is a trip duration, the second a
    superlative. Neither may be published.**
24. **Museo Centrale del Risorgimento al Vittoriano** — museum · entrance on the left flank of the
    Vittoriano, via **San Pietro in Carcere**. VIVE: *"concepito nel 1884 ma aperto effettivamente
    solo nel 1970"*, covering the 18th century to the First World War
    (`https://vive.cultura.gov.it/it/museo-centrale-del-risorgimento`). it.wiki gives the exhibition
    spaces as created in 1935 and opened 1970, address *"Via di San Pietro in Carcere, fianco sinistro
    del Vittoriano, Rione Campitelli"*, administered by the Istituto per la storia del Risorgimento
    italiano (`https://it.wikipedia.org/wiki/Museo_centrale_del_Risorgimento_al_Vittoriano`).
    **CONFLICT: VIVE says conceived 1884, it.wiki says spaces realised 1935. Both say opened 1970.**
    The Istituto's own site is live at `https://www.risorgimento.it/` and names the museum.
25. **Ala Fori Imperiali (ex Ala Brasini)** — exhibition wing facing via dei Fori Imperiali. VIVE:
    designed by **Armando Brasini** between the 1920s and 1930s with its own entrance, originally
    intended to house the Museo Centrale del Risorgimento; **currently under complete restoration**
    (`https://vive.cultura.gov.it/it/ala-fori-imperiali`). Publish the closure, dated to fetch date.
26. **Sacrario delle Bandiere delle Forze Armate** — flag shrine inside the complex. OSM
    `tourism=museum`, 41.8949213/12.4835868, A=Campitelli. No official page fetched — **needs a
    Difesa/VIVE source before publication.**
27. **Statua equestre di Vittorio Emanuele II**, **Quadriga dell'Unità**, **Quadriga della Libertà**,
    **Vittoria Alata**, the **Bollettino della Vittoria** inscription, and the **six "altari delle
    città redente"** (Trento, Trieste, Gorizia, Pola, Fiume, Zara) — sculptural and memorial elements
    catalogued in OSM inside the monument, all A=Campitelli. VIVE's "cosa vedere" index names the
    ingresso principale, scalinata, sculptural groups on the first balustrade, Porte della Libertà and
    dell'Unità, Piazzale del Bollettino, sommoportico, colonne trionfali, propilei, Terrazza Italia,
    Sala Zanardelli, Atrio della Libertà, Atrio Giuseppe Sacconi, Gallerie Giuseppe Sacconi and the
    sotterranei (`https://vive.cultura.gov.it/it/vittoriano/cosa-vedere`).
28. **Fontana del Tirreno** and **Fontana dell'Adriatico** — the two flanking fountains of the
    Vittoriano. OSM `amenity=fountain`, A=Campitelli. Need a Sovrintendenza or VIVE page.
29. **Sepolcro di Gaio Publicio Bibulo** — Roman tomb, early 1st c. BC · beside the left flank of the
    Vittoriano, by the flowerbed in front of the Adriatic fountain. it.wiki: tufo dell'Aniene and
    travertine, surviving height 4,76 m, only the west wall and a fragment of the south-west corner of
    the cella remain, the podium largely buried because the ancient street level was far lower
    (`https://it.wikipedia.org/wiki/Sepolcro_di_Gaio_Publicio_Bibulo`). A=Campitelli — a genuine
    edge-of-the-rione find that is easy to miss.
30. **Insula dell'Ara Coeli** — 2nd-c. Roman apartment block at the foot of the Capitoline, in the
    angle between the Ara Coeli staircase and the Vittoriano. it.wiki: brick, resting on an
    opus-reticulatum wall probably of the 1st c. built to consolidate the hill; in the Middle Ages
    the upper part was occupied by the church of San Biagio de Mercato, replaced in **1653** by Santa
    Rita da Cascia, dismantled in the 1930s for the Vittoriano works — and the insula was found during
    that dismantling (`https://it.wikipedia.org/wiki/Insula_dell%27Ara_Coeli`). A=Campitelli.
31. **Monumento a Cola di Rienzo** — statue · in the planted area on the left flank of the Cordonata.
    Sovrintendenza Capitolina: statue by **Girolamo Masini** (1840–1885), base by **Francesco Azzurri**
    (1827–1901); *"Datazione: 1871 realizzazione statua; 1886-1887 realizzazione monumento"*; bronze,
    marble and brick facing; the Council authorised the purchase in 1886; the base reuses ancient
    marble reliefs partly from the Ara Coeli staircase; **unveiled without ceremony on 20 September
    1887**; no dedicatory inscription except "Cola de Rienzi" cut into the bronze
    (`https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/monumenti/monumento_a_cola_di_rienzo`).

### 3.3 Churches and religious houses (in Campitelli)

32. **Basilica di Santa Maria in Aracoeli** — minor basilica on the Arx · reached by the Scalinata
    dell'Ara Coeli. it.wiki: originally *Santa Maria in Capitolio*, part of the monastery complex on
    the hill; the present name is attested from **1323**; construction 13th–18th c., Gothic and Baroque
    (`https://it.wikipedia.org/wiki/Basilica_di_Santa_Maria_in_Aracoeli`). **Its own domain
    `santamariainaracoeli.it` does not resolve** — no operator source for hours.
33. **Basilica di Santa Francesca Romana (Santa Maria Nova)** — Piazza di Santa Francesca Romana 4,
    facing the Colosseum, next to the Basilica of Maxentius. it.wiki: built about the middle of the
    9th c. on an earlier oratory under Paul I; after 10th-c. restoration rededicated as Santa Maria
    Nova to distinguish it from Santa Maria Antiqua in the Forum
    (`https://it.wikipedia.org/wiki/Basilica_di_Santa_Francesca_Romana`). Official site: `.va` domain
    does not resolve; the it.wiki infobox points at a Facebook page, which is not a publishable source.
34. **Basilica dei Santi Cosma e Damiano** — via dei Fori Imperiali, built into the Temple of Peace.
    The basilica's own site is live (`https://www.cosmadamiano.com/`, `/la-basilica/`). it.wiki: 6th c.,
    the first church founded in the Forum area, minor basilica, and mother house of the Franciscan
    Third Order Regular since **1512**
    (`https://it.wikipedia.org/wiki/Basilica_dei_Santi_Cosma_e_Damiano`). Its famous 18th-c. Neapolitan
    presepe is tagged in OSM as a museum at 41.8922983/12.4873775.
35. **Chiesa dei Santi Luca e Martina** — in the Forum, by the Curia. it.wiki: begun **1634**,
    finished **1664**; originally dedicated to Santa Martina, founded in the 7th c., probably by
    Honorius I; a rectory within the parish of San Marco Evangelista al Campidoglio
    (`https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Luca_e_Martina`). Pietro da Cortona's authorship
    is the obvious next fact and is **not** in what I fetched — source it before writing.
36. **Chiesa di San Giuseppe dei Falegnami** — above the Carcere Mamertino, on the Clivo Argentario.
    it.wiki: *"sito nel rione Campitelli"*; begun **1597**, completed **1663**, consecrated **11
    November 1663**; the Carpenters' confraternity had rented San Pietro in Carcere inside the
    Mamertine from 1540 (`https://it.wikipedia.org/wiki/Chiesa_di_San_Giuseppe_dei_Falegnami`).
37. **Chiesa di Santa Maria della Consolazione** — piazza della Consolazione, at the foot of the
    Tarpeian Rock. it.wiki: *"situato rione Campitelli"*; built 1585–1600, Baroque; a rectory of the
    Capuchins within the parish of Santa Maria in Portico in Campitelli; the earlier church was built
    in the second half of the 15th c. and **dedicated 3 November 1470**, named "della consolazione"
    for consoling those condemned to death on the nearby Tarpeian Rock, where sentences were carried
    out until 1550; a hospital was added alongside in 1475
    (`https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_della_Consolazione_(Roma)`).
    **STRADDLER-ADJACENT:** the church is Campitelli (A and it.wiki agree) but the square is Ripa
    (A), and it.wiki's rione article names piazza della Consolazione as the Ripa border. See §4.
38. **Chiesa di San Teodoro al Palatino** — Greek Orthodox church on via di San Teodoro, under the
    north-west slope of the Palatine. it.wiki: built in the 6th c. on the ruins of the Horrea
    Agrippiana, probably reusing a pre-existing circular temple; religion given as **cristiana
    ortodossa**; works to 1705 (`https://it.wikipedia.org/wiki/Chiesa_di_San_Teodoro_al_Palatino`).
    **Its own domain does not resolve.** Note via di San Teodoro is itself the Ripa border.
39. **Basilica di Sant'Anastasia al Palatino** — on the Palatine slope above the Circus Maximus.
    it.wiki: minor basilica; national church for Rome's Peruvian community and for the Syro-Malabar
    Indian community; a stational church; built in the first decades of the 4th c. (325–326?) over
    earlier Roman structures beside the Circus Maximus enclosure; recorded as *titulus Anastasiae* in
    the acts of the synod of 499 (`https://it.wikipedia.org/wiki/Basilica_di_Sant%27Anastasia_al_Palatino`).
40. **Chiesa di San Sebastiano al Palatino** — on the Palatine, at the Vigna Barberini. Its own site is
    live: run by the **Fraternité Monastique de Jérusalem**, with published prayer times — Sunday
    Eucharist 11.30, adoration 17.00–18.00, Vespers 18.00; Tue–Thu adoration from 17.00, Vespers 18.00,
    Eucharist 18.30; Sat and Mon Eucharist 12.00, adoration from 17.00, Vespers 18.00; Friday afternoon
    and Saturday morning are a community "desert" of silence
    (`https://sansebastiano.fraternita-gerusalemme.it/home`). it.wiki: *"nel rione Campitelli"*; a
    first building in the 10th c., present arrangement from the **1624** rebuilding under Urban VIII;
    also known as Santa Maria in Pallara
    (`https://it.wikipedia.org/wiki/Chiesa_di_San_Sebastiano_al_Palatino`).
41. **Chiesa e convento di San Bonaventura al Palatino** — on the south side of the Vigna Barberini.
    it.wiki: *"nel rione Campitelli"*; built **1675** on the remains of a Roman cistern for Cardinal
    Francesco Barberini at the request of Bonaventura da Barcellona; paintings by Giovanni Battista
    Benaschi and a *Madonna del bell'amore* (1736–37) by Sebastiano Conca
    (`https://it.wikipedia.org/wiki/Chiesa_di_San_Bonaventura_al_Palatino`). The convent site
    `fratipalatino.org/convento` returned 404.
42. **Chiesa di San Lorenzo in Miranda** — inside the Temple of Antoninus and Faustina in the Forum.
    it.wiki: 7th or 11th c.; the temple may have been reused as a church from the 7th c. because it was
    believed to be where St Lawrence was condemned; the church is attested in sources only from the
    11th c. (`https://it.wikipedia.org/wiki/Chiesa_di_San_Lorenzo_in_Miranda`).
43. **Nobile Collegio Chimico Farmaceutico** — historic pharmacists' college and small museum, in and
    above San Lorenzo in Miranda. Its own site: *"L'8 Marzo 1429, l'illuminata volontà di Papa Martino
    V donò … alla Corporazione dei Farmacisti Romani, la Collegiata di San Lorenzo eretta all'interno
    dell'antico Tempio Romano"*; it holds collections of pharmacy jars and mortars and a library with
    an online catalogue (`https://nobilecollegio.it/`). OSM 41.8922989/12.4868828, A=Campitelli.
    **A strong edge find — a visitable institution most Rome guides miss.**
44. **Chiesa di Santa Maria Annunziata a Tor de' Specchi** — via del Teatro di Marcello / via Tor de'
    Specchi, attached to the monastery of Santa Francesca Romana. it.wiki: *"nel rione Campitelli"*;
    **open to the public only on 9 March**, the saint's feast day; corresponds to the medieval Santa
    Maria de Curte; after the monastery was erected in **1433** the church was granted to the Oblates
    of Santa Francesca Romana and rebuilt in the early 18th c.; two earlier fresco cycles of the
    saint's life survive in the oratory
    (`https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Annunziata_a_Tor_de%27_Specchi`).
    The once-a-year opening is a real, publishable, useful fact.
45. **Chiesa di Santa Maria Antiqua** — 6th-c. church in the Forum, in the vestibule of Domitian's
    palace, with the Oratory of the Forty Martyrs and the Domitianic ramp. it.wiki cites the PArCo
    "mirabilia" page as its official link — **that host is unreachable from here**
    (`https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Antiqua`).
46. **Oratorio dei Quaranta Martiri** — Forum, south of the Lacus Iuturnae. it.wiki: originally a
    quadrangular hall serving the ramp up to Domitian's palace, converted to a church with a small apse
    after the Byzantine capture of Rome under Narses in **552**
    (`https://it.wikipedia.org/wiki/Oratorio_dei_Quaranta_Martiri`).
47. **Chiesa di Sant'Adriano al Foro Romano (deconsecrated; the Curia Iulia)** — it.wiki: built inside
    the Curia Iulia by **Pope Honorius I in 630**; raised to a diaconia by Hadrian I; restored 1228
    under Gregory IX when the floor was raised three metres; deconsecrated and stripped back to the
    Curia in the 1930s (`https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Adriano_al_Foro_Romano`).
    Same building as #57 — the corpus must decide whether these are one entry or two.
48. **Chiesa di Santa Maria delle Grazie al Foro Romano** and **Chiesa di San Biagio de Mercato** —
    deconsecrated / lost, listed by it.wikipedia's rione article. Included for completeness; San Biagio
    survives only as the substructure under #30.
49. **Vanished churches of the rione** — Sant'Andrea in Vincis, Santa Maria in Vincis, Sante Orsola e
    Caterina, San Lorenzo in Nicolanaso, Santa Maria Liberatrice al Foro Romano, Santi Venanzio e
    Ansovino, Santi Sergio e Bacco al Foro Romano, Oratorio di San Gregorio Taumaturgo, Oratorio di
    Santa Maria del Riscatto (`https://it.wikipedia.org/wiki/Campitelli`). **Not candidates for
    places — but Santa Maria Liberatrice is the church demolished in 1900 to excavate Santa Maria
    Antiqua, which is a story worth one sentence somewhere.**

### 3.4 The Roman Forum (Parco archeologico del Colosseo)

50. **Foro Romano** — archaeological area bounded by the Palatine, the Capitoline, via dei Fori
    Imperiali and the Colosseum. Operator: **Parco archeologico del Colosseo**, an autonomous MiC
    institute established **2017** whose remit covers the Colosseum, the Forum, the Palatine and the
    Domus Aurea (`https://it.wikipedia.org/wiki/Parco_archeologico_del_Colosseo`). OSM records the
    PArCo administrative address as **Via in Miranda 5**. Hours and tariff, **second-hand via the
    Sovrintendenza Capitolina**: daily; last entry one hour before closing; 09.00–17.30 (1–27 March),
    09.00–19.15 (28 March–30 September), 09.00–18.30 (1–24 October), 09.00–16.30 (25 October–28
    February); 24 and 31 December 09.00–14.00; 1 January 08.30–16.30. **Forum Pass Super €18,00 full**,
    valid for the day across Foro Romano, Fori Imperiali and Palatino; MIC-card holders can buy a €14
    ticket covering the archaeological area and the Colosseum subject to availability, excluding Super
    sites; **named tickets have been required for all PArCo admissions since 18 October 2023**
    (`https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/aree_archeologiche/fori_imperiali`).
    *The Sovrintendenza page describes the walk as taking "about two hours" — **a trip duration.
    Not publishable.***
51. **Curia Iulia** — Senate house. it.wiki: at the head of the Forum's short side, between the
    Argiletum and the Comitium; epoch given as 29 BC–AD 526 as the Senate's seat; the Curia Hostilia
    preceded it, enlarged by Sulla in 80 BC as the Curia Cornelia, damaged by fire in 52 BC, rebuilt
    monumentally in Caesar's works (`https://it.wikipedia.org/wiki/Curia_Iulia`).
52. **Arco di Settimio Severo** — triple triumphal arch at the Forum's north-west corner, on a
    travertine plinth. it.wiki: **erected 202–203**, dedicated by the Senate to Septimius Severus and
    his sons Caracalla and Geta for the Parthian victories of 195 and 197–198; **height 23 m**; steps
    under the bays barred wheeled traffic
    (`https://it.wikipedia.org/wiki/Arco_di_Settimio_Severo`).
53. **Arco di Tito** — single-bay arch on the east slope, at the Forum's east end. it.wiki: 1st c.;
    dedication by the Senate to Titus as *divus*, therefore after his death and deification in **81**,
    and complete by **90**; **height 19,15 m** (`https://it.wikipedia.org/wiki/Arco_di_Tito`).
54. **Colonna di Foca** — honorary column before the Rostra. it.wiki: dedicated or rededicated to the
    emperor Phocas on **1 August 608**; the last honorary monument erected in the Forum
    (`https://it.wikipedia.org/wiki/Colonna_di_Foca`).
55. **Tempio di Saturno** — it.wiki: built in the early Republic at the foot of the Capitoline,
    south-west of the imperial Rostra, restored repeatedly into the late 4th c.; consecration date
    disputed, one tradition giving Tullus Hostilius, another the consulship of Aulus Sempronius
    Atratinus and Marcus Minucius Augurinus in **497 BC**
    (`https://it.wikipedia.org/wiki/Tempio_di_Saturno`).
56. **Tempio di Antonino e Faustina** — it.wiki: north of the Regia, between the Basilica Aemilia and
    the Temple of Divus Romulus; erected after the empress's death in **141** and dedicated by the
    Senate (inscription DIVAE FAVSTINAE EX S C); on Antoninus's death in **161** the line DIVO ANTONINO
    ET was added above (`https://it.wikipedia.org/wiki/Tempio_di_Antonino_e_Faustina`).
57. **Basilica di Massenzio** — it.wiki: the last and largest civil basilica of monumental Rome, on
    the Velia; **built by Maxentius 308–312**, rededicated to Constantine, who replaced Maxentius's
    head on the colossal statue in the west apse; recorded as Basilica Nova / Constantini; **height 35
    m** (`https://it.wikipedia.org/wiki/Basilica_di_Massenzio`).
58. **Tempio di Venere e Roma** — it.wiki: dedicated to Venus Felix and Roma Aeterna, occupying the
    whole space between the Basilica of Maxentius and the Colosseum; **the architect was the emperor
    Hadrian himself**; begun **121**, inaugurated **135**, finished **141** under Antoninus Pius; the
    site had held the atrium of Nero's Domus Aurea and the colossus, moved with the help of
    twenty-four elephants (`https://it.wikipedia.org/wiki/Tempio_di_Venere_e_Roma`).
59. **Casa delle Vestali / Atrium Vestae** — it.wiki: behind the Regia, forming a unit with the Temple
    of Vesta; the residence joined the complex only from the 2nd c. BC; recent excavation found remains
    of an 8th-c.-BC hut (`https://it.wikipedia.org/wiki/Casa_delle_Vestali`).
60. **Lapis Niger** — it.wiki: black paving over an archaic sacred area at the Comitium, sealed in the
    late Republic; **rediscovered by Giacomo Boni on 10 January 1899**
    (`https://it.wikipedia.org/wiki/Lapis_niger`).
61. **Carcere Mamertino (Tullianum)** — it.wiki: two superimposed levels of chambers cut into the
    south slope of the Capitoline beside the Scale Gemonie; the deeper is archaic (8th–7th c. BC), the
    upper Republican (`https://it.wikipedia.org/wiki/Carcere_Mamertino`). OSM records it as
    `tourism=museum`; **its own domain `carceremamertino.it` does not resolve**, so hours and tickets
    have no reachable operator source. it.wiki's "il più antico carcere di Roma" is a superlative from
    an aggregator — **do not publish**.
62. **Also mapped inside the Forum, all A=Campitelli, each a candidate:** Tempio di Vesta · Tempio dei
    Dioscuri (Castore e Polluce) · Tempio del Divo Giulio and Rostra ad Divi Iulii · Tempio del Divo
    Romolo · Tempio della Concordia · Tempio di Vespasiano e Tito · Tempio di Augusto · Portico degli
    Dei Consenti · Basilica Aemilia (with the Tabernae Novae) · Basilica Iulia · Regia · Domus Publica ·
    Rostra Vetera · Umbilicus Urbis Romae · Miliarium Aureum · Lacus Iuturnae · Arco di Augusto ·
    Colonne Onorarie · Doliola · Necropoli arcaica · Horrea Agrippiana · Horrea Vespasiani · Horrea
    Piperataria · Vicus Tuscus · Via Sacra · Argiletum · Clivus Capitolinus · Latrine pubbliche ·
    Sacello di Bacco · Casa di Marco Emilio Scauro · Tomba di Giacomo Boni · Portico medievale ·
    Torre del Tabularium (viewpoint). All from the Overpass containment query on relation 5454237.
63. **Antiquarium Forense (Museo del Foro Romano)** — museum · **piazza Santa Maria Nova 53**, in
    rooms of the former monastery of Santa Francesca Romana. it.wiki: created **in 1900 by Giacomo
    Boni**, the first to excavate the Forum stratigraphically, to hold the finds and his layer records
    (`https://it.wikipedia.org/wiki/Antiquarium_Forense`).

### 3.5 The Palatine

64. **Palatino** — one of Rome's seven hills, between the Velabrum and the Forum; the hill of the
    foundation myth and of the imperial palaces; **maximum height 51 m a.s.l.**; two summits, the
    higher called *Palatium*, the other *Germalus/Cermalus*
    (`https://it.wikipedia.org/wiki/Palatino`). *The it.wiki infobox separately gives 48,2 — the article
    body and its own infobox disagree. Do not publish a height from this page alone.*
65. **Domus Flavia** — public wing of Domitian's palace, west half. it.wiki: works begun soon after
    the fire of 64, directed by the architect **Rabirio** from 81, concluded **92**
    (`https://it.wikipedia.org/wiki/Domus_Flavia`).
66. **Domus Augustana** — private wing, east half, same build and dates
    (`https://it.wikipedia.org/wiki/Domus_Augustana`).
67. **Stadio Palatino** — the third part of Domitian's palace, the last built; brick, with Hadrianic
    work in the porticoes and Severan work in the exedra
    (`https://it.wikipedia.org/wiki/Stadio_palatino`).
68. **Domus Severiana**, **Terme Severiane**, **Arcate severiane**, **Terme di Massenzio** — the
    southern extension and bath buildings, all A=Campitelli (Overpass).
69. **Settizonio (Septizodium)** — it.wiki: the monumental multi-storey nymphaeum facade raised by
    **Septimius Severus in 203** at the foot of the Palatine, forming the Domus Severiana's face
    toward the Appian Way; epoch given 3rd–16th c. — it stood until it was demolished under Sixtus V
    (`https://it.wikipedia.org/wiki/Settizonio`). A=Campitelli. **Southernmost Campitelli find.**
70. **Casa di Augusto** — it.wiki: Augustus's private house on the south-west slope; Suetonius has him
    first living above the *scalae anulariae* near the Velia, then moving to the Palatine into
    Hortensius's modest house (`https://it.wikipedia.org/wiki/Casa_di_Augusto`). OSM tags it
    `tourism=museum` — it is a ticketed Super site.
71. **Casa di Livia** — it.wiki: a Republican house excavated **from 1869**; the identification came
    from a lead pipe naming *Iulia Aug(usta)* found in Pietro Rosa's excavations for Napoleon III, but
    the oldest parts date to **75–50 BC**; now thought to be an apartment for Livia within Augustus's
    house (`https://it.wikipedia.org/wiki/Casa_di_Livia`).
72. **Casa dei Grifi** — it.wiki, oldest surviving painted Republican house on the hill
    (`https://it.wikipedia.org/wiki/Casa_dei_Grifi`).
73. **Aula Isiaca** — it.wiki (`https://it.wikipedia.org/wiki/Aula_Isiaca`).
74. **Domus Tiberiana** — it.wiki (`https://it.wikipedia.org/wiki/Domus_Tiberiana`). Reopened to
    visitors in recent years; **the reopening date needs a PArCo source I could not reach.**
75. **Criptoportico Neroniano** — A=Campitelli, mapped as an accessible footway
    (`https://it.wikipedia.org/wiki/Criptoportico`).
76. **Elagabalium / Vigna Barberini** — it.wiki: the temple to Sol Invictus, later Jupiter, at the
    north-east corner of the hill (`https://it.wikipedia.org/wiki/Elagabalium`).
77. **Tempio della Magna Mater (Cibele)** — it.wiki
    (`https://it.wikipedia.org/wiki/Tempio_della_Magna_Mater`).
78. **Capanne Romulee**, **Auguratorium**, **Tempio di Apollo (Palatino)**, **Pedagogio /
    Paedagogium**, **Schola Praeconum**, **Bagni di Livia**, **Loggia Mattei**, **Ninfeo degli
    Specchi**, **Ninfeo della Pioggia**, **Cisterne**, **Criptoportico ipogeo centrale**, **Ambiente
    4** — further Palatine features mapped inside relation 5454237.
79. **Horti Farnesiani** — the 16th-c. Farnese gardens on the north side of the hill; it.wiki treats
    them within the Palatino article (`https://it.wikipedia.org/wiki/Palatino` — a redirect from
    *Horti Farnesiani* resolves there, which is itself worth noting: there is **no standalone article**).
80. **Antiquarium del Palatino / Museo Palatino** — museum on the hill. it.wiki: the first Antiquarium
    was created in the later 19th c. by **Pietro Rosa** in a Farnese building; that building was
    demolished by **Rodolfo Lanciani in 1882** to link the Forum and Palatine excavations and the
    collections went to the Terme di Diocleziano; the present museum stems from **Alfonso Bartoli's**
    1930s initiative (`https://it.wikipedia.org/wiki/Antiquarium_del_Palatino`).

### 3.6 The Imperial Fora strip (south side of via dei Fori Imperiali)

**All four items here are straddler-flagged — see §4.**

81. **Foro di Cesare** — it.wiki: the first of the five Imperial Fora, inaugurated still incomplete by
    Caesar on **26 September 46 BC**, the last day of his four triumphs; completed under Augustus
    (`https://it.wikipedia.org/wiki/Foro_di_Cesare`). A=Campitelli.
82. **Foro di Nerva (Foro Transitorio)** — it.wiki: built by Domitian, already conceived in 85–86 per
    Martial, inaugurated with the temple of Minerva in **late 97** by Nerva after Domitian's murder
    (`https://it.wikipedia.org/wiki/Foro_di_Nerva`). A=Campitelli.
83. **Tempio della Pace (Foro della Pace)** — A=Campitelli; SS. Cosma e Damiano is built into it
    (`https://it.wikipedia.org/wiki/Tempio_della_Pace`).
84. **Basilica Argentaria**, **Tempio di Venere Genitrice**, **Via Alessandrina** — A=Campitelli.
    Sovrintendenza on Via Alessandrina: Cardinal **Michele Bonelli** (1541–1598), nephew of Pius V,
    laid out the area in the later 16th c.; the street was **opened in 1584** and was **over 400 metres
    long**, named "Alessandrina" for the cardinal
    (`https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/aree_archeologiche/via_alessandrina`).
85. **Fori Imperiali visitor route** — Sovrintendenza: entrance at the Trajan's Column end, exit at
    the Foro di Cesare on **via Bonella** off via dei Fori Imperiali; the walkway passes under via dei
    Fori Imperiali; timed entry
    (`https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/aree_archeologiche/fori_imperiali`).
    **The entrance is in Monti; the exit is in Campitelli. This route is itself a straddler.**

### 3.7 Squares, streets and palaces of the inhabited rione

86. **Piazza d'Aracoeli** — it.wiki infobox `quartiere = Campitelli (rione)`; runs from via del Teatro
    di Marcello to via di Tor Margana; formerly *piazza del Mercato*, split into Mercato and
    Mercatello, and it lost a whole side to the Vittoriano works from 1885 and the 1930s isolamento of
    the Capitoline (`https://it.wikipedia.org/wiki/Piazza_d%27Aracoeli`). A=Campitelli.
87. **Fontana di piazza d'Aracoeli** — Sovrintendenza: author **Giacomo della Porta** (1533–1602),
    dated **1589**, marble and travertine, originally fed by the Acqua Felice; sculptors Andrea Brasca,
    Pietro Gucci, Pace Naldini; the wide circular basin at the base was added around **1860**;
    **restored in 2025 under the PNRR Caput Mundi programme**
    (`https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_di_piazza_d_ara_coeli`).
88. **Piazza Margana** — A=Campitelli. Medieval tower square; **it.wiki's rione article names piazza e
    vicolo Margana as the Sant'Angelo border**, so the far side is not ours.
89. **Palazzo Maccarini Odescalchi** — piazza Margana. it.wiki's rione article: 17th-c. Mannerist
    (`https://it.wikipedia.org/wiki/Campitelli`). A=Campitelli.
90. **Palazzo Muti Bussi** — **Via dell'Aracoeli 2**. it.wiki: *"(Rione X Campitelli)"*; designed and
    begun by **Giacomo Della Porta about 1585** for Orazio Muti; after Della Porta's death **Giovanni
    Antonio De Rossi** worked on it 1642–45 and completed the entrances and courtyard 1660–62;
    modernised in the 18th c.; took its present name when Cecilia Muti married Count Giulio Bussi in
    the early 19th c. (`https://it.wikipedia.org/wiki/Palazzo_Muti_Bussi`). A=Campitelli.
91. **Palazzo Fani (Fani Pecci Blunt / Malatesta)** — **Piazza d'Aracoeli 3**, at the corner with via
    della Tribuna di Tor de' Specchi. it.wiki: *"nel rione Campitelli"*; Mannerist; the Fani engaged
    **Giacomo Della Porta** to renew it; let to Cardinal Federico Borromeo in 1599
    (`https://it.wikipedia.org/wiki/Palazzo_Fani`). it.wiki's rione article separately dates it 1575
    with an 1885–88 raising by Giovanni Battista Giovenale — **the two Wikipedia pages do not agree and
    neither is a primary source.**
92. **Palazzo Massimo di Rignano (Massimo di Rignano Colonna)** — Piazza d'Aracoeli, at the corner
    with via del Teatro di Marcello. it.wiki: Baroque, *"nel rione Campitelli"*; structure of 15th-c.
    origin built for the Boccabella; the Massimo di Rignano engaged **Carlo Fontana** to remodel it
    (`https://it.wikipedia.org/wiki/Palazzo_Massimo_di_Rignano`). The rione article dates it 1696 and
    credits Carlo Fontana — again two Wikipedia pages, one date each.
93. **Piazza della Consolazione** — **A = Ripa**, not Campitelli, though the church on it is
    Campitelli. See §4.
94. **Ex Ospedale della Consolazione** — A=Campitelli. Founded alongside the church in 1475 per
    it.wiki's church article. **Needs its own source.**
95. **Teatro della Cometa** — theatre, via del Teatro di Marcello area, A=Campitelli. Its site
    redirects `teatrodellacometa.it` → `https://teatrodellacometa.com/` (HTTP 200). A live, working
    performing-arts venue in a rione with 515 residents is a genuinely useful guide entry.
96. **Rappresentanza della Regione Calabria** — regional government office at piazza Campitelli-adjacent
    address, A=Campitelli. Civic only.
97. **Named streets and ways wholly or partly inside:** via dei Fori Imperiali (the Monti border) ·
    via del Teatro di Marcello · via dell'Aracoeli · via di San Teodoro (the Ripa border) · via dei
    Fienili · via dei Foraggi · via in Miranda · via di San Pietro in Carcere · via Bonella · Largo
    Enrico Berlinguer · Largo Guglielmo Gatti · vico Jugario (Ripa border) · via di Monte Caprino
    (Ripa border) · Piazza di Sant'Anastasia · Piazza di Santa Francesca Romana · Piazza di Santa
    Maria Nova · Piazza di Venere e Roma · Piazza dell'Arco di Costantino · Piazzale Caffarelli.
98. **Bus interchange "P.za Venezia"** at 41.8947929/12.481851 — mapped inside Campitelli even though
    the square itself is not. Practical, and a neat illustration of how tight the boundary is.

### 3.8 Eating, drinking and staying — the honest short list

Campitelli has 515 residents and almost no commercial fabric; this is the complete named set Overpass
returned inside relation 5454237, and it is short on purpose.

99. **Antica Trattoria Angelino** — restaurant, **Piazza Margana 37**. A=Campitelli.
100. **La Terrazza Caffarelli** — restaurant/events, **Piazzale Caffarelli 4**
     (`https://www.terrazzacaffarelli.it/`). Identity and location only; its marketing copy is not usable.
101. **Eduardo II** — restaurant, **Vicolo Margana 14**.
102. **DIDDIBISTRO** — restaurant, **Piazza d'Aracoeli 4**.
103. **Antico Caffè del Teatro Marcello** — café, **Via del Teatro di Marcello 42**.
104. **Bar Campidoglio** — café, **Piazza d'Aracoeli 11**. **Caffé Rudy** — café, Piazza d'Aracoeli 15.
     **Vacanze Romane** — gelato, piazza d'Aracoeli area. **Caffè del Teatro** — café.
     **Espresso & Co** — café, by the Vittoriano.
105. **Caffeteria del Parco** — café inside the archaeological park at 41.8925439/12.4869219.
106. **075** — café, **Via dei Cerchi 65** (`https://www.075roma.com/`); **Ad Hoc Circo Massimo** —
     restaurant, **Via dei Cerchi 75** (`https://www.ristoranteadhoc.com/ad-hoc-circo-massimo/`);
     **Osteria Circo**; **Art Cafe**; **Gelateria Artigianale**; **Easy Bike Rent**, Via dei Cerchi 59.
     **ALL SIX ARE ON VIA DEI CERCHI, WHICH it.wikipedia NAMES AS THE RIPA BORDER.** Overpass put them
     inside Campitelli; I do not believe that without a second check. **See §4.**
107. **Bella Nonna** — apartment rental, Via dei Foraggi 91b. Aggregator-hosted site; identity only.
108. **Touristation** — travel agency, piazza d'Aracoeli area (`https://www.touristation.it/`).
109. **Museo della Cucina** — **Via dei Cerchi 87**; OSM `tourism=museum`. Its site
     `www.museodellacucina.it` presents a **self-signed TLS certificate** and could not be fetched
     safely. Same via dei Cerchi boundary problem. **Low confidence, see §4.**

### 3.9 Visitor infrastructure

110. **Centro Informazioni Turistiche Parco archeologico del Colosseo** — 41.8904667/12.490531, OSM
     `information`, website `parcocolosseo.it` (unreachable).
111. **Ticket offices** — "Musei capitolini" ticket point (41.8931257/12.4826601), "Foro Romano"
     ticket point (41.892629/12.4870495), "Tickets Palatino" (41.887806/12.4896701),
     **Ascensore panoramico** ticket point at the Vittoriano (41.8942357/12.4831101). All A=Campitelli.
112. **UNESCO status of the area** — the whole rione lies inside the World Heritage property
     *Historic Centre of Rome, the Properties of the Holy See in that City Enjoying Extraterritorial
     Rights and San Paolo Fuori le Mura*: **inscribed 1980**, ref 91, criteria **(i)(ii)(iii)(iv)(vi)**,
     significant boundary modification 1990, minor modifications 2015 and 2023, property 1.469,7 ha,
     buffer zone 7.158,933 ha (`https://whc.unesco.org/en/list/91/`). The brief lists this as
     explicitly publishable. UNESCO's own brief synthesis describes the property as *"the whole
     historic centre of Rome within the city walls at their widest extent in the 17th century"* — which
     places Campitelli inside without needing a per-property claim. **This is the ONLY heritage-status
     statement any Campitelli page may carry.**

### 3.10 Boundary-line items that belong to Campitelli's story but not (or not only) to Campitelli

113. **Arco di Costantino** — see §4, item 1.
114. **Meta Sudans** — A=Campitelli. Flavian fountain by the Colosseum and the Arch of Constantine;
     it.wiki: shown on a coin of Titus dated **AD 80**, so building began that year
     (`https://it.wikipedia.org/wiki/Meta_Sudans`). Sits in the same contested strip as the Arch.
115. **Base del Colosso di Nerone** — A=Campitelli per the containment query, at 41.8908689/12.4909922,
     immediately beside the Colosseum. Same contested strip.
116. **Piazza del Colosseo** — its western pedestrian ways are inside Campitelli per Overpass; the
     amphitheatre is not. it.wikipedia's rione article lists the piazza as one of Campitelli's five.
117. **Piazza Venezia** — see §4, item 3.
118. **Piazza di Campitelli and the church that names the rione** — see §4, item 2. **The single most
     important finding in this file.**

---

## 4. STRADDLERS AND CONTRADICTIONS — for the arbitrator, not resolved here

### 1. Arco di Costantino — Campitelli vs Celio, with Overpass contradicting itself
| Method | Result |
|---|---|
| Overpass `is_in(41.8897623, 12.4906668)` | **Celio** [Rione XIX Celio] — Campitelli not returned |
| Overpass containment on `rel(5454237)` → area | Arch returned as **inside Campitelli** |
| Nominatim reverse, same point | `quarter=Campitelli`; display name *"Piazza dell'Arco di Costantino, Campitelli, Municipio Roma I"* |
| it.wikipedia (arch article) | says only "between the Palatine and the Celio" |
| it.wikipedia (Campitelli rione article) | boundary with Celio is via di San Gregorio, which runs south of the arch — implying the arch is Campitelli |

Two of three OSM-derived methods say Campitelli, one says Celio, and the two disagreeing methods are
**both Overpass over the same relation**. The Meta Sudans, the base of the Colossus of Nero and the
west end of Piazza del Colosseo sit in the same contested strip and inherit the same problem.

### 2. Santa Maria in Portico in Campitelli, Piazza di Campitelli, and the palaces on it
**The church that gives the rione its name is not in the rione, according to every source I can check.**

| Item | Overpass `is_in` | it.wikipedia |
|---|---|---|
| Chiesa di Santa Maria in Portico in Campitelli (Piazza Campitelli 9) | **Sant'Angelo** | *"Santa Maria in Campitelli è una chiesa di Roma **nel rione Sant'Angelo**"* |
| Piazza di Campitelli (centroid) | **Sant'Angelo** | infobox `quartiere = Rione Campitelli` |
| Palazzo Capizucchi, Piazza di Campitelli 3 | **Campitelli** | *"nel rione Campitelli"* |
| Palazzo Albertoni Spinola, Piazza Campitelli 2 | **Campitelli** | *"si trova nel Rione X (Campitelli)"* |
| Palazzo Cavalletti, Piazza Campitelli / via Cavalletti | **Sant'Angelo** | *"nel rione Campitelli"* |
| Chiesa di Santa Rita da Cascia in Campitelli, via Montanara | not tested directly; via Montanara is the border | *"nel rione **Sant'Angelo**"* |

And it.wikipedia's own Campitelli article names **piazza di Campitelli, via Cavalletti and via
Montanara** as the Sant'Angelo boundary, while also listing Piazza di Campitelli under Campitelli's
"Piazze" and Palazzo Cavalletti under Campitelli's "Architetture civili". **The rione article
contradicts itself within one page.**

Confirmed parish facts if it publishes anywhere: **Piazza Campitelli 9 — 00186 Roma**, tel. 06 68803978
(parish) / 06 6874285 (community), Masses festive 10.00 and 18.30, weekdays 7.30 and 18.30, served by
the **Chierici Regolari della Madre di Dio**, the order founded by **San Giovanni Leonardi in 1574**
(`https://www.santamariainportico.it/`). it.wikipedia adds: the earlier church is first mentioned in
the 12th c. in the *Liber Censuum*; Clement VIII granted it to Giovanni Leonardi on **4 August 1601**;
present church completed **1667** (`https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_in_Portico_in_Campitelli`),
with Carlo Rainaldi as architect per the rione article. **DO NOT PUBLISH IT UNDER CAMPITELLI ON MY
SAY-SO.** The arbitrator decides.

Related: **Santa Rita da Cascia in Campitelli** has a dating conflict as well. Sovrintendenza
Capitolina says *"costruito intorno al 1650 su progetto di Carlo Fontana (1634-1714)"* and rebuilt on
its present site **1938–1940** after being dismantled in **1928**
(`https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/sala_s_rita_gia_chiesa_di_s_rita_da_cascia`);
it.wikipedia says **1665**, and gives the dismantling as "the 1930s"
(`https://it.wikipedia.org/wiki/Chiesa_di_Santa_Rita_da_Cascia_in_Campitelli`). **Carlo Fontana was
born in 1634**, which makes the Sovrintendenza's "around 1650" hard to sustain — the municipal source
is the weaker one here, unusually. Flagging rather than choosing.

### 3. Piazza Venezia — a four-way disagreement
| Method | Result |
|---|---|
| Overpass `is_in(41.8961099, 12.4824204)` | **Trevi** [Rione II Trevi] |
| Nominatim reverse, same point | `quarter=Pigna` |
| it.wikipedia, Piazza Venezia article infobox | `quartiere = Pigna` |
| it.wikipedia, Campitelli rione article | lists **Piazza Venezia** among Campitelli's piazze |

Four sources, three answers, and the Vittoriano — which is unambiguously Campitelli by every method —
fronts onto it. it.wiki's Campitelli boundary prose gives *piazza Madonna di Loreto* as the Trevi
border and *via e piazza San Marco* as the Pigna border, which together carve the square three ways.
The bus interchange tagged "P.za Venezia" is itself inside Campitelli. **Do not state which rione
Piazza Venezia is in.**

### 4. Santa Maria della Consolazione — church in, square out
The church tests **Campitelli**; **piazza della Consolazione** tests **Ripa**; and it.wikipedia's
rione article names piazza della Consolazione as the Ripa border. A page that says "in piazza della
Consolazione, in the rione Campitelli" would be asserting something no source supports.

### 5. The via dei Cerchi commercial strip
Six businesses and the Museo della Cucina sit on **via dei Cerchi**, which it.wikipedia's rione article
names explicitly as the **Ripa** boundary. Overpass containment put them inside Campitelli; I did not
get a second determination because Nominatim rate-limited (HTTP 429) partway through my reverse batch
and I chose not to retry it aggressively against a shared public endpoint. **Treat all of §3.8 item
106 and item 109 as unverified.** This is the largest block of low-confidence finds in the file.

### 6. The Imperial Fora strip
Foro di Cesare, Foro di Nerva, Tempio della Pace, Basilica Argentaria, Tempio di Venere Genitrice and
Via Alessandrina all test **Campitelli**, because the rione boundary is **via dei Fori Imperiali** and
these lie on its south side. Trajan's Forum, Trajan's Column, Trajan's Markets and the Forum of
Augustus test **Monti**. The Fori Imperiali visitor route runs from one to the other and passes under
the road. **Every general reader and most guidebooks treat "the Imperial Fora" as one thing in Monti.
They are split, and the split runs down the middle of the visitor route.**

### 7. The Colosseum
Tested at the centroid and at four points around the perimeter: **Celio** every time. It.wikipedia's
Monti article and most guidebooks put it in Monti; it.wikipedia's Campitelli article claims *Piazza del
Colosseo*. The Wave-1 brief does not list the Colosseum for Campitelli, correctly. **But the brief DOES
list the Theatre of Marcellus, which tests Sant'Angelo by both Overpass and Nominatim.** The brief is
wrong on that one and the verifier should know the brief is not authoritative on placement.

---

## 5. Yield note

The brief predicted ~119 named entries — the highest of any rione. I found **118 candidates** at a
comparable count, but the composition is not what the number suggests: roughly **sixty** of them are
archaeological features inside two ticketed enclosures (the Forum and the Palatine) that a guide would
more honestly treat as sections of two entries than as sixty places. The rione's *inhabited* fabric —
churches you can walk into, palaces with addresses, squares, and somewhere to eat — is about **thirty
entries**, and a third of those are contested at the boundary. If the verifier confirms a high
proportion of the sixty, that is not a success signal; it means the corpus is counting stones in a
single archaeological park.

---

## 6. What I could not settle and would chase next

- A **PArCo** source reachable from another network. Everything operational about the two biggest
  sites in the rione currently rests on a third party.
- The **Sovrintendenza per-monument URL pattern** for Forum and Palatine monuments — I found working
  paths under `/i_luoghi/roma_antica/aree_archeologiche/` and
  `/i_luoghi/roma_medioevale_e_moderna/{monumenti,fontane,beni_architettonici}/` but the site has no
  sitemap (`/sitemap.xml` → 404) and the sections list only a dozen or so deep links each. There are
  further sections in its menu I did not crawl: *Archi, Porte e Ponti*, *Beni archeologici*, *Colombari
  e Sepolcri*, *Statue parlanti*, *Lapidi commemorative*, *Mura urbane*, *Passeggiate, parchi e
  giardini*. **Marforio and the Sepolcro di Bibulo are almost certainly in two of those.**
- A **second geocoder** for the via dei Cerchi strip and the Arch of Constantine. Nominatim 429'd; a
  patient re-run at 1 request per 2 seconds would settle six or seven of the flags above.
- **Roma Capitale's own toponymic shapefile.** The roster's own source note says
  `dati.comune.roma.it` was unreachable earlier; I did not retry it, and it is the one source that
  would end every boundary argument in §4 at a stroke.

---

## 7. Quarantined designation language — DO NOT PUBLISH

Two fetched sources carry exactly the claim the evidence ruling bans. Recording them so no later
writer reintroduces them from the same pages:

- it.wikipedia, **Palazzo Albertoni Spinola**: *"un edificio a Roma **dichiarato di interesse
  storico-artistico da parte del Governo Italiano**"*
  (`https://it.wikipedia.org/wiki/Palazzo_Albertoni_Spinola`). This is a *dichiarazione di interesse
  culturale* claim in all but name. **Banned. Not carryable at any strength, attributed or not.**
- it.wikipedia, **Vittoriano**: the page's framing as a *monumento nazionale* is a legal-status term.
  The safe formulation is VIVE's own — *"il più importante monumento al primo re d'Italia"* — and even
  that is a superlative from the operator. Say what it is and who built it; say nothing about its
  legal status.

Also quarantined as superlatives from an operator or aggregator: "the world's oldest public museum"
(Sovrintendenza, on itself), "il più piccolo dei colli di Roma" (Musei Capitolini), "the longest-serving
town hall still in use" (it.wiki, unsourced), "il più antico carcere di Roma" (it.wiki), "il più grande
tempio conosciuto dell'antica Roma" (it.wiki, Temple of Venus and Roma), "nessun altro luogo a Roma è
più centrale, elevato o spettacolare" (VIVE, Terrazza Panoramica).

Trip-duration tripwires found and not carried: VIVE's "nel giro di un minuto" for the Vittoriano lifts;
the Sovrintendenza's "in circa due ore" for the Forum Pass Super route.

---

## 8. Photo-wave notes (no images sourced, named or linked — ruling 3)

Recording only that the following are the visually obvious subjects a later four-gate photo wave will
want to assess, so that wave does not repeat this survey: Piazza del Campidoglio and the Cordonata;
the Vittoriano and its terrace; the Forum from the Tabularium and from the Campidoglio balustrade;
the Arch of Septimius Severus; the Palatine stadium; Santa Maria in Aracoeli's staircase. **All are
pre-1900 works in the public domain by age, but Italy has no freedom of panorama and the roster's own
EUR note shows the programme already treats that as decisive — the photo wave must run its own
analysis, not inherit an assumption from this line.** No image was sought, viewed or linked in
producing this file.

---

## 9. Files

Research artefacts for this run (scratchpad, not deliverables):
`campitelli_overpass.json`, `campitelli_overpass2.json`, `campitelli_isin_raw.json`,
`campitelli_isin2_raw.json`, `campitelli_wiki.json`, and the `src_*.html` / `sov_*.txt` fetch cache,
all under
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/rome/`.
Note that scratchpad is shared with other concurrent rione sessions and two of my scripts were
overwritten mid-run by a Trastevere session; the Campitelli-prefixed files are the ones that survived
and are mine.
