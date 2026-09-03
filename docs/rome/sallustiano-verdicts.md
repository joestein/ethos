# Sallustiano (R. XVII) — VERIFIER file

Wave 3, Rome programme. **Adjudication.** I did not gather this evidence and I owe it no loyalty.

Verification date: 2026-09-02. Verifier agent (Sallustiano).
Adjudicating: `docs/rome/sallustiano-finder.md`.

Every ruling below is PUBLISH, REWRITE or DROP. REWRITE rulings carry the exact replacement
wording; the author uses it verbatim.

---

## 0. What I re-fetched, and what I ran

The three binding rulings in `priv/seed_data/rome_roster.json` were read in full before adjudicating.

**Sources re-fetched (all HTTP 200 unless stated), browser UA, `python3 urllib`, never piped curl:**

| # | Source | Result |
|---|---|---|
| 1 | `https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-della-vittoria` | 200, 128 kB — **says what the finder says it says**, with one addition (§1.1) |
| 2 | `https://www.turismoroma.it/it/luoghi/horti-sallustiani` | 200, 137 kB — **contradicts the finder on the street number** (§1.2) |
| 3 | `https://www.turismoroma.it/it/luoghi/chiesa-di-san-camillo-de-lellis` | 200, 128 kB — confirmed in full |
| 4 | `https://www.turismoroma.it/it/luoghi/villa-paolina-bonaparte` | 200, 124 kB — confirmed, but **the page contradicts itself** on 1815/1816 (§1.4) |
| 5 | `https://www.turismoroma.it/it/luoghi/palazzo-canevari` | 200, 123 kB — confirmed, one hedge dropped by the finder (§1.5) |
| 6 | `https://www.carmelitanicentroitalia.it/dove-siamo/conventi-della-provincia/s-maria-della-vittoria-roma` | 200, 145 kB — hours confirmed exactly |
| 7 | `https://www.sovraintendenzaroma.it/content/pietro-consagra-giano-nel-cuore-di-roma` | 200, 45 kB — confirmed, but **the finder drew a false inference from it** (§4.4) |
| 8 | `https://hortisallustiani.it/` and `/contatti/` | **200, 284 kB — the finder said this could not be fetched. It can.** (§4.1) |
| 9 | `https://www.masaf.gov.it/.../IDPagina/721` | 200, 51 kB — rich primary material the finder pointed at and did not mine (§2.8) |
| 10 | `https://www.politicheagricole.it/.../IDPagina/5935` | 200, 55 kB |
| 11 | `https://www.iubilaeum2025.va/.../chiesa-santa-maria-della-vittoria.html` | 200, 40 kB — **and it is wrong about this church** (§4.2) |
| 12 | `https://www.romasegreta.it/sallustiano/` | 200 — **five articles, exactly as the finder said** |
| 13 | it.wikipedia `action=parse` wikitext for 19 titles | see §1.6 |
| 14 | `https://www.parrocchiasancamillo.it/` | **Connection refused** — finder confirmed |
| 15 | `https://direzionemuseiroma.cultura.gov.it/` | **DNS failure** — finder confirmed |

**Boundary work re-run independently.** I downloaded
`https://api.openstreetmap.org/api/0.6/relation/5454324/full.json`, assembled the outer ring in
Python (**one ring, 136 points, closed**) and ran my own point-in-polygon over 32 coordinates. The
relation's tags are exactly as the finder reported: `boundary=place`, `place=quarter`,
`ref=R. XVII`, `official_name=Rione XVII Sallustiano`, `wikidata=Q532968`, no `admin_level`.

**My PIP reproduced the finder's result on every single one of the 32 points.** That includes all
five straddler flags. I also re-ran six Nominatim reverse lookups and reproduced every quarter
value the finder reported. **The geometry in the finder file is sound and independently
reproducible. It is the best part of the file.** The errors are all in the reading of sources, not
in the boundary work.

Confirmed inside: Santa Maria della Vittoria (building *and* turismoroma's point), Horti Aula,
Museo Boncompagni, San Camillo, Sacro Cuore, Villa Paolina (building and turismoroma's point),
Palazzo Canevari **building**, Palazzo dell'Agricoltura, Villino Rudinì, Piazza Sallustio, the
Breccia memorial, the Mura Aureliane segment, Sulpicio Massimo, the US Embassy to the Holy See, and
all the villini coordinates.
Confirmed outside: Palazzo Canevari's **turismoroma point**, Largo di Santa Susanna's wiki
coordinate, Porta Salaria's wiki coordinate, Porta Pia, Santa Susanna, the Fontana del Mosè, the
Museo dei bersaglieri, and via XX Settembre's wiki coordinate.

---

## 1. The five sources the finder leaned on hardest — do they say what he says?

### 1.1 turismoroma, Santa Maria della Vittoria — YES, in full
Address `Via XX Settembre, 17` and `POINT (12.4943365 41.9045242)` confirmed. Maderno 1608–1620,
the St Paul dedication, the White Mountain victory of 8 November 1620, the image carried in on
8 May 1622, the 1626 travertine façade by Soria at Scipione Borghese's expense in exchange for the
*Sleeping Hermaphrodite* found in 1608, Cerrini's vault and dome, Serra's apse, Guercino, Nicolas
Lorrain and Domenichino, and the Cornaro Chapel with Bernini's *Ecstasy* in marble and gilt bronze,
1647–1652 — **all present, all as quoted.**

One addition the finder omitted and the author should have: under *Orari* the portal says only
*«Per gli orari delle messe e le modalità di visita rivolgersi ai contatti indicati»*. Roma Capitale
publishes **no hours** for this church. The hours therefore rest entirely on source 6.

### 1.2 turismoroma, Horti Sallustiani — YES on substance, NO on the address
Every historical and archaeological claim confirmed verbatim, including the Serapeum comparison, the
14-metre depth, the *cocciopesto* floor with its glazed opening, the 1998 Soprintendenza recovery
project, and the provenance of the *Dying Gaul*, the *Suicidal Gaul*, the *Ludovisi Throne* and the
obelisk.

**But the page's Location field reads `Horti Sallustiani, Piazza Sallustio, 21`.** The finder gave
the address as "Piazza Sallustio", noting OSM's "Piazza Sallustio 3", and never reported the number
Roma Capitale actually publishes. The venue's own site (source 8) also gives **Piazza Sallustio 21**.
Two sources against OSM. See §2.2.

### 1.3 turismoroma, San Camillo de Lellis — YES, in full
Address, Pius X, Passarelli, 1906 start, Cardinal Agliardi's first stone, 1910 consecration and
parish, the Ministers of the Infirm, Paul VI's 1965 elevation and the cardinalatial title, the
30-metre campanile, Galli's 1911 statue, and the Vegezzi-Bossi organ of 1910–11 (opus 1314) to
Capocci's design donated by Margherita of Savoy with electric action from 1999 and 29 stops —
**all present.** Both mass timetables confirmed word for word, as is the page's own warning that
times change and are posted on the church's external noticeboards.

### 1.4 turismoroma, Villa Paolina Bonaparte — YES, with an internal contradiction the finder missed
Address `Via Piave, 23` confirmed. 1750 for Cardinal Silvio Valenti Gonzaga; Paolina Borghese there
until 1824; her death in 1825; nephews and descendants to 1906; sale to the Prussian government;
legation to the Holy See in 1908; German embassy 1920–1944; Reich property taken by the Allies in
1945; d'Ormesson's move on 15 December 1950 — **all confirmed.** The *bersaglieri* sentence and the
orange trees opposite the Ministry of the Treasury are confirmed verbatim.

Also confirmed, and useful: Roma Capitale states outright that the villa **«è sede dell'Ambasciata
di Francia presso la Santa Sede (con ingresso in via Piave)»**. That is an official source for the
embassy identity, which is stronger than what the finder claimed to have.

**The contradiction:** the opening paragraph says Paolina bought the villa **in 1816**; the *Cenni
storici* section says she joined her family in Rome **in 1815 and bought Villa Valenti**. The finder
reported 1816 without noting that his own source gives both. See §2.6.

### 1.5 turismoroma, Palazzo Canevari — YES, with one hedge silently removed
Quintino Sella, the Regio Ufficio Geologico and its Museo Agrario-Geologico, 1873–1881, Raffaele
Canevari, reuse of seventeenth-century masonry, exhibition rooms on cast-iron piers, the gallery
over the reading room, the inauguration of 3 May 1885 with King Umberto I, and closure in 1995 —
**all confirmed.** Address `Largo di Santa Susanna, 13` and `POINT (12.493163 41.905259)` confirmed.

The finder wrote that "the portal calls it *«tra i primi esempi di "stile liberty"»*". The portal
actually says **«considerato tra i primi esempi»** — *considered* among the first. The hedge is the
source's and must survive. See §2.7.

### 1.6 The Carmelites' site and the it.wikipedia set — YES
Source 6's hours are confirmed character for character, including the capitalised
*«DURANTE LE CELEBRAZIONI E LE PREGHIERE LE VISITE NON SONO CONSENTITE»* and the request that guided
groups use headsets.

The Sallustiano article's *Confini* paragraph is confirmed verbatim, as is the reciprocal sentence
in the Ludovisi article. The Largo di Santa Susanna article's *«in parte nel rione Sallustiano e in
parte in quello Trevi»* is confirmed verbatim. The Villino Boncompagni Ludovisi lead's
*«Rione XVII Sallustiano, quartiere Ludovisi»* wording hazard is confirmed exactly as flagged.

**Sources that do NOT say what the finder said they say:** the Horti address (§1.2), the Canevari
hedge (§1.5), `hortisallustiani.it` (§4.1), the Museo Boncompagni article (§4.3), the Sovrintendenza
Consagra page (§4.4), and the `Villino Macchi di Cèllere al Sallustiano` article, **which does not
exist** (§4.5).

---

## 2. Rulings, candidate by candidate

### 2.0 The rione itself (finder §2)

| # | Claim | Ruling |
|---|---|---|
| R1 | Code 117 / R. XVII; area 0,2 km²; population 2.191 at 31.12.2021; density 8.872,1 ab./km², all from Roma Capitale's *Annuario statistico 2022* Tab. 1.3 | **PUBLISH** |
| R2 | Municipio I | **PUBLISH.** Sallustiano is not the Castro Pretorio case; the roster carries Municipio I for it directly, so cite the roster, not the Wikipedia infobox. |
| R3 | Created 1921, one of seven rioni instituted by the Giunta Municipale, each given a coat of arms | **PUBLISH** |
| R4 | Coat of arms: *«Di azzurro allo specchio di Venere Ericina d'oro»*, alluding to the temple in the Horti | **REWRITE.** The finder called Pietrangeli 1953 "an article I could not fetch". The wikitext's citation carries a live URL to the Archivio Capitolino's digital resources. Publish as: *"Italian Wikipedia gives the rione's arms as a gold mirror of Venus Erycina on blue — «Di azzurro allo specchio di Venere Ericina d'oro» — alluding to the goddess's temple in the Gardens of Sallust, citing Carlo Pietrangeli's 1953 article on the arms of the rioni of Rome."* The Archivio Capitolino URL is a retrievable lead for a later pass. |
| R5 | Borders paragraph, quoted verbatim in Italian with translation, and the reciprocal Ludovisi sentence | **PUBLISH.** Confirmed verbatim in both articles. |
| R6 | Porta Pia excluded; Piazza Fiume excluded | **PUBLISH** as statements of what the border text says. My PIP puts Porta Pia outside and the Porta Salaria coordinate outside; both consistent. |
| R7 | Historical spine — Regio VI Alta Semita; Horti and the temple of Venus Erycina; via Piave on the line of the via Salaria Nova out of Porta Collina toward the demolished Porta Salaria; Alaric 410 and the depopulation between Pincio and Quirinale; sixteenth-century revival with via Pia and Sixtus V's Acqua Felice; the zone part of rione Trevi with villa Barberini, villa Mandosi and villa Cicciaporci; urbanisation after 1870; rione from 1921 | **PUBLISH**, attributed to Italian Wikipedia as an aggregator. All confirmed in the wikitext. |
| R8 | The rione is two zones, the second *«praticamente disabitata e con un'alta concentrazione di uffici e ministeri»* | **PUBLISH.** Confirmed verbatim. This sentence should carry the page. |
| R9 | (not made by the finder) The rione's only surviving green area | **ADD — the finder missed it.** The same article states that the rione's only remaining green is the ground against the walls between Porta Pia, via Augusto Valenziani and via Piave, the site of the former villa Cicciaporci Valenti Gonzaga, now known as villa Paolina. Publish as: *"Italian Wikipedia states that the rione's only surviving green space is the ground against the walls between Porta Pia, via Augusto Valenziani and via Piave — the grounds of the former villa Cicciaporci Valenti Gonzaga, now known as villa Paolina."* |

### 2.1 Chiesa di Santa Maria della Vittoria — **the anchor. PUBLISH.**

| # | Claim | Ruling |
|---|---|---|
| 1a | Address Via XX Settembre 17, 00187 Roma, from two sources | **PUBLISH** |
| 1b | At the corner of via XX Settembre and largo di Santa Susanna | **PUBLISH** |
| 1c | *«rappresenta uno fra i più importanti esempi del periodo barocco a Roma»* | **REWRITE.** A superlative must be attributed, not asserted. Publish as: *"Roma Capitale's tourism portal describes the church as one of the most important examples of the Baroque period in Rome."* |
| 1d | Maderno, 1608–1620, first a chapel to St Paul for the Discalced Carmelites | **PUBLISH** |
| 1e | Title from the White Mountain victory near Prague, 8 November 1620; miraculous image carried in 8 May 1622 | **PUBLISH** |
| 1f | Travertine façade 1626, Soria's design, Scipione Borghese's expense, in exchange for the *Sleeping Hermaphrodite* found in 1608 in the foundations | **PUBLISH** |
| 1g | Interior: Latin cross, single nave, barrel vault, three chapels a side; Cerrini vault and dome; Serra apse; Guercino, Nicolas Lorrain, Domenichino | **PUBLISH** |
| 1h | Cornaro Chapel: Cardinal Federico Cornaro's family, Bernini, *Ecstasy of Saint Teresa of Ávila*, marble and gilt bronze, 1647–1652, family watching from theatre boxes | **PUBLISH** |
| 1i | Hours from the Carmelite province's site | **REWRITE** — needs attribution and an as-of date. Publish as: *"The Discalced Carmelite province of central Italy, whose community serves the church, publishes these hours: the church open 6.45–12.00 and 16.00–19.00, and on Sundays 9.00–12.00 and 16.00–18.00. Visiting hours are given separately as 8.00–12.00 and 16.00–18.00 on weekdays and 9.00–12.00 and 16.00–18.00 on Sundays. Mass is at 7.00 Monday to Saturday and 10.30 on Sundays and holy days of obligation; Eucharistic adoration is on Tuesdays 18.00–19.00 and Thursdays 18.30–19.00. The same page states that visits are not permitted during services and asks guided groups to use audio headsets. Hours as published by the province and checked on 2 September 2026."* |
| 1j | "The re-inauguration of the Cornaro Chapel after restoration, 22 October 2021" | **REWRITE.** 22 October 2021 is the date of the notice, not a sourced date for a ceremony. Publish as: *"The Carmelite province's site carries a notice dated 22 October 2021 announcing the inauguration of the Cornaro Chapel after its restoration, which the same page attributes to the Soprintendenza Speciale di Roma."* |
| 1k | Contacts: tel. 06 42740571, `vittoria@carmelitaniroma.it` | **PUBLISH** |
| 1l | The Jubilee 2025 page as "a Holy See source for the church's place in a Jubilee walking route" | **PUBLISH the link and the routing fact only. DROP everything else on that page** — see §4.2, it is wrong about this church. |
| 1m | Rione = Sallustiano; the caveat that turismoroma's point reverse-geocodes into Castro Pretorio | **PUBLISH the assignment; DROP the caveat.** My PIP puts *both* the building centre and turismoroma's own point inside the ring. The Nominatim snap is a snap, not a boundary problem. The record is not marginal and should not be written as if it were. |
| 1n | The church stands on the north side of via XX Settembre; Santa Susanna opposite is Trevi's | **PUBLISH.** Confirmed by PIP. Note for the author: the Largo di Santa Susanna article says Santa Susanna actually fronts the adjoining piazza San Bernardo, not the largo. |

### 2.2 Horti Sallustiani / Aula Adrianea — **PUBLISH, with the access question now answered**

| # | Claim | Ruling |
|---|---|---|
| 2a | Address "Piazza Sallustio", OSM's "Piazza Sallustio 3" | **DROP and replace.** Roma Capitale's Location field and the venue's own site both give **Piazza Sallustio 21**. Publish as: *"Piazza Sallustio 21, 00187 Rome — the address given both by Roma Capitale's tourism portal and on the site's own website."* |
| 2b | The gardens of Sallust, *«il più grande parco monumentale di Roma»*, between today's via Salaria, via Veneto, via XX Settembre and the Aurelian Walls | **REWRITE** — superlative, attribute it. Publish as: *"Roma Capitale's tourism portal calls the Horti Sallustiani, with their gardens and villa, the largest monumental park in Rome, covering the ground between today's via Salaria, via Veneto, via XX Settembre and the Aurelian Walls."* |
| 2c | Caesar's land, bought by Sallust in 44 BC; imperial under Tiberius; Vespasian stayed, Nerva died there; work under Hadrian and Aurelian; Aurelian's hippodrome; damaged in 410 and never rebuilt | **PUBLISH** |
| 2d | The surviving complex: three parts, 14 m below street level, circular domed hall compared to the Serapeum of Hadrian's Villa, niches opening into two side rooms possibly nymphaea, the glazed opening in the *cocciopesto* floor, the semicircular multi-storey residential building with frescoes, mosaics and windows, the vanished north stair | **PUBLISH** |
| 2e | 1998 Soprintendenza recovery project of the Aula Adrianea for cultural events and conferences | **PUBLISH** |
| 2f | "hortisallustiani.it returned HTTP 403 and I could not read it" | **DROP — false.** It returns 200 to a browser user-agent. See §4.1. |
| 2g | "This file states no opening hours and no ticket price for the Aula" | **REWRITE — the real answer is better than 'unknown'.** The site establishes that there are none to state. Publish as: *"The Aula is run as a private venue for hire. Its own website advertises corporate events, conferences and meetings, receptions, gala dinners, fashion shows, art exhibitions, music events and photographic and film shoots, and offers an enquiry form rather than opening hours; no public opening hours and no admission price are published. Enquiries: 06 4201 1597, or eventi@hortisallustiani.it. The site's footer carries the copyright of Tecno Holding S.p.A."* |
| 2h | "Do not cite the hyphenated domain `horti-sallustiani.it` as the venue's official site" | **PUBLISH the warning** — confirmed as a parked for-sale domain and still what OSM has tagged. |
| 2i | Provenance of the *Dying Gaul*, *Suicidal Gaul*, *Ludovisi Throne* and the Spanish Steps obelisk, none of them in Sallustiano today | **PUBLISH as provenance context only.** The finder's own instruction to name the Capitoline Museums only as a bare cross-reference, if at all, is correct and stands. Do not write the Capitoline Museums as a place. |
| 2j | Rione = Sallustiano | **PUBLISH.** PIP confirmed. |
| 2k | (not flagged by the finder) The venue's *Come raggiungerci* section | **DROP one line of it.** It says "Stazione Termini, 15 min a piedi". **That is a trip duration and is banned.** The adjacent "Fermata Metro A Barberini-Repubblica, 800 mt" is a measured distance and is publishable if wanted. Also note the site's "Recensioni" block is unfinished Lorem ipsum with invented attributions; use the site for address, contact and use-of-premises only. |

### 2.3 Museo Boncompagni Ludovisi — **PUBLISH the museum, DROP the hours**

| # | Claim | Ruling |
|---|---|---|
| 3a | Address Via Boncompagni 18 | **PUBLISH** |
| 3b | Full name Museo Andrea e Blanceflor Boncompagni Ludovisi; decorative arts, costume and Italian fashion; housed in the Villino Boncompagni Ludovisi | **PUBLISH**, attributed to Italian Wikipedia |
| 3c | Left to the Italian State in 1972 by the will of Princess Blanceflor de Bildt Boncompagni, *"esclusivamente per scopi artistico-culturali di pubblica utilità"* | **PUBLISH** |
| 3d | Opened to the public in 1995 | **PUBLISH** |
| 3e | Administrative chain: state-owned, formerly under the Galleria Nazionale d'Arte Moderna, from December 2014 the Polo museale del Lazio, from December 2019 the Direzione Musei statali di Roma | **PUBLISH** |
| 3f | 9.782 visitors in 2018, citing a MiBAC spreadsheet | **PUBLISH** with the year and the attribution both stated. The wikitext's reference is an archived MiBAC file, which is a real citation. |
| 3g | "Five exhibition rooms showing the villino's original furnishings" | **REWRITE — thin, and the article says much more.** The finder gave the museum's paperwork and none of its contents, which is the only reason a visitor would go. Publish as: *"Italian Wikipedia describes five exhibition rooms holding the villino's original furnishings — furniture, tapestries, paintings and ceramics — alongside a collection covering Italian fashion, costume and design, with garments by Fausto Sarli, Fernanda Gattinoni, Valentino, Roberto Capucci, Raffaella Curiel, Lorenzo Riva, Renato Balestra, Mila Schön, André Laug and Angelo Litrico, and a group of dresses that belonged to Palma Bucarelli, director of the Galleria nazionale d'arte moderna from 1941 to 1975, added in 1996. The museum's own site could not be reached to confirm what is currently on display."* |
| 3h | "I have no fetched source for opening hours, closing days or admission. The corpus must not invent them." | **REWRITE — the conclusion is right, the statement of fact is wrong.** The it.wikipedia article the finder fetched and quoted six times *does* state hours (9.00–19.30, ticket office closing 18.30), prices (€6 full, €2 reduced) and closing days (Mondays, 1 January, 25 December). The finder either did not read to the end of the article or reported a gap that his own source filled. The hours still **must not be published** — they are uncited in the aggregator, the institution's site is unreachable to confirm them, and museum hours and prices go stale. Publish as: *"The museum's own website could not be reached from this network and no opening hours or admission price are given here. Italian Wikipedia states hours and prices for the museum but cites no source for them; they are not repeated."* |
| 3i | Rione = Sallustiano | **PUBLISH.** PIP confirmed. |
| 3j | Villino Boncompagni Ludovisi: 1901–1903 by Giovanni Battista Giovenale (1849–1934) for the Boncompagni Ludovisi princes, on a plot at the corner of via Boncompagni and via Quintino Sella that had been part of Villa Ludovisi, subdivided from 1883; two storeys over basement and mezzanine, crowned by a balustrade; short side to via Boncompagni, three façades to the garden; sober *barocchetto* with rococo flourishes in the window frames and the via Boncompagni portal | **PUBLISH**, with one caveat the finder omitted: **this article carries Wikipedia's own "unsourced" banner, dated November 2015.** Say "according to Italian Wikipedia, which cites no source". |
| 3k | The *«Rione XVII Sallustiano, quartiere Ludovisi»* wording hazard | **PUBLISH the warning.** Confirmed verbatim. Correctly identified and genuinely dangerous. |

### 2.4 Basilica di San Camillo de Lellis — **PUBLISH**

| # | Claim | Ruling |
|---|---|---|
| 4a | Address Via Sallustiana 24 | **PUBLISH** |
| 4b | Pius X; Tullio Passarelli; begun 1906; first stone by Cardinal Antonio Agliardi; consecrated and erected a parish 1910; entrusted to the Clerks Regular Ministers of the Infirm | **PUBLISH** |
| 4c | 1965: Paul VI raised it to minor basilica and created the cardinalatial title *San Camillo de Lellis agli Orti Sallustiani* | **PUBLISH** |
| 4d | Architecture: neo-Romanesque with Gothic inflections, red brick with stone detail outside and travertine throughout inside, Latin cross; three portals under lunette reliefs with *Christ presents St Camillus to the sick* in the centre; rose window; 1907 *Good Shepherd* relief over the side portal on via Sallustiana; square campanile with pyramidal spire reaching 30 m; three aisles on round arches, cross vaults, five apse windows with *Christ and the four Evangelists*; statue of St Camillus by Alberto Galli, 1911 | **PUBLISH** |
| 4e | Organ built 1910–11 by Carlo Vegezzi-Bossi (opus 1314) to Filippo Capocci's design, donated by Margherita of Savoy; electric action from 1999; 29 stops over two manuals and pedal | **PUBLISH** |
| 4f | Mass times, both seasons | **REWRITE** — needs the chain of custody stated. Publish as: *"Roma Capitale's tourism portal publishes the parish's mass times. In autumn and winter: Monday to Saturday 09.00 and 18.00; Sundays and feasts 09.00, 11.30 and 19.00. In spring and summer: Monday to Saturday 09.00 and 19.00; Sundays and feasts 09.00, 11.30 and 19.00. The portal itself warns that times may change and that changes are posted on the church's external noticeboards. The parish's own website could not be reached to confirm them; as published by the portal and checked on 2 September 2026."* |
| 4g | Tel. 06 4818188 | **PUBLISH** |
| 4h | Rione = Sallustiano | **PUBLISH.** PIP confirmed. |
| 4i | Site is the former villa Spithöver, neo-Renaissance, 1870, Luca Carimini, demolished at the end of the nineteenth century; church built 1906–10 | **PUBLISH**, attributed to Italian Wikipedia. Confirmed in the wikitext twice, in the history and in the civil-architecture list. Note the article spells it "Spithover"/"Spithoever" and has no article of its own. |

### 2.5 Chiesa del Sacro Cuore di Gesù — **PUBLISH, street only**

| # | Claim | Ruling |
|---|---|---|
| 5a | Address: via Piave, no street number sourced | **PUBLISH as the street alone.** Do not invent a number. Publish as: *"Via Piave. No street number could be sourced."* |
| 5b | Built 1914–1916 to a design by Aristide Leonori; the elevation gives onto via Piave though the original project faced via XX Settembre; wrought-iron railing; central projecting body with a five-arched loggia reached by two side ramps | **PUBLISH** |
| 5c | Interior: three aisles on columns carrying a matroneum, ogival vault; windows above the matroneum glazed with glass from Munich showing saints whose names match those of the architect's family; transept windows; side apses with a *St Ignatius of Loyola* and a copy of the *Madonna della Strada*; central apse in marble and mosaic with *Christ among saints* | **PUBLISH** |
| 5d | "Adoration of the Eucharist by all races" | **REWRITE** for register while keeping the source's meaning. Publish as: *"The left transept window is described by Italian Wikipedia as an Adoration of the Eucharist by all the peoples of the world («Adorazione dell'Eucaristia da parte di tutte le razze»)."* |
| 5e | Run by the Ancelle del Sacro Cuore di Gesù (Handmaids of the Sacred Heart, Madrid) | **PUBLISH.** Add that the article says the congregation's convent adjoins the church. |
| 5f | "The article notes the tomb of St María Rafaela in the church" | **REWRITE — the source says something more specific.** Publish as: *"Italian Wikipedia states that the body of the congregation's foundress, Rafaela Porras y Ayllón, lies in a chapel on the left-hand side of the church."* |
| 5g | Rione = Sallustiano; the article's lead says *«situato nel rione Sallustiano, in via Piave»* | **PUBLISH.** Confirmed verbatim; PIP confirmed. This is the cleanest rione attribution in the file. |
| 5h | romasegreta index page | **PUBLISH** as an aggregator cross-reference only. |

### 2.6 Villa Paolina Bonaparte — **PUBLISH the building, under ruling 2**

| # | Claim | Ruling |
|---|---|---|
| 6a | Address Via Piave 23 | **PUBLISH** |
| 6b | What survives of a villa that ran inside the Aurelian Walls between Porta Pia and Porta Salaria; the *casino* stands in the middle of the park; built in 1750 for Cardinal Silvio Valenti Gonzaga, Secretary of State to Benedict XIV, who turned orchards into gardens with exotic planting and raised the villino at their centre | **PUBLISH** |
| 6c | "Bought in 1816 by Paolina Borghese ... who lived there until 1824" | **REWRITE — the source gives two dates.** Publish as: *"Roma Capitale's tourism portal states that Paolina Borghese, Napoleon's sister, bought the villa in 1816 and lived there until 1824; the same page's historical note says she reached Rome in 1815 and bought Villa Valenti then. On her death in 1825 it passed to her nephews and their descendants."* |
| 6d | Sold to the Prussian government in 1906; legation to the Holy See installed 1908; German embassy 1920–1944; Reich property taken by the Allies in 1945; France acquired it; on 15 December 1950 Wladimir d'Ormesson moved the French embassy to the Holy See into Villa Bonaparte | **PUBLISH**, with one addition: **Italian Wikipedia dates the French embassy's arrival to 1951.** Publish the 1950 date from Roma Capitale and note the discrepancy rather than silently picking one. |
| 6e | The *bersaglieri* found themselves inside Villa Paolina in 1870 | **PUBLISH**, quoted and attributed to Roma Capitale. |
| 6f | The orange trees on via XX Settembre opposite the Ministry of the Treasury as a memento of the villa's orangery | **PUBLISH** |
| 6g | Ruling-2 handling: French Embassy to the Holy See, on Italian soil, not Vatican territory, not French territory, not a Lateran Treaty Art. 15 property | **PUBLISH — and this is exactly right.** Use verbatim: *"Villa Paolina, also called Villa Bonaparte, is the seat of the Embassy of France to the Holy See, with its entrance on via Piave. It is a diplomatic mission standing on Italian soil in the rione Sallustiano: it is not Vatican territory, it is not French territory, and it is not one of the Lateran Treaty's extraterritorial properties."* Roma Capitale's own page states the embassy identity, so this does not rest on OSM. |
| 6h | Not visitable; no public opening sourced; the OSM `leisure=garden` is inside the compound | **PUBLISH the non-access statement. DROP the garden as a place.** |
| 6i | Rione = Sallustiano | **PUBLISH.** PIP confirmed on the building and on turismoroma's point. |
| 6j | `it.ambafrance.org` is the embassy to Italy and must not be used as this building's site | **PUBLISH the warning.** Correct and worth keeping. |

### 2.7 Palazzo Canevari — **ESCALATED, and publishable only if the arbitrator grants it**

| # | Claim | Ruling |
|---|---|---|
| 7a | Address Largo di Santa Susanna 13 | **PUBLISH** |
| 7b | Wanted by Quintino Sella to house the Regio Ufficio Geologico and its Museo Agrario-Geologico; built 1873–1881 to Raffaele Canevari's design; reused seventeenth-century masonry; exhibition rooms on cast-iron piers; gallery over a large reading room | **PUBLISH** |
| 7c | Inaugurated 3 May 1885 in the presence of King Umberto I | **PUBLISH** |
| 7d | "the portal calls it among the first examples of Liberty style in Italian public building" | **REWRITE.** Publish as: *"Roma Capitale's tourism portal describes the palazzo as considered among the first examples of 'stile liberty' in Italian public building."* |
| 7e | Housed the Geological Institute and the museum collections until 1995, when it was closed; no public access; under refurbishment; owned by Cassa depositi e prestiti per the Wikipedia infobox | **PUBLISH** the closure and the absence of public access. Publish the ownership and refurbishment only as "according to Italian Wikipedia's infobox", which cites nothing. |
| 7f | The archaic dwelling of the early sixth century BC found under the palazzo in excavations from 2013 | **DROP.** One uncited line in an aggregator's list, no second source. The finder's own instruction not to publish on this alone is correct and I am converting it into a ruling. |
| 7g | Rione | **ESCALATE.** See §3.1. My PIP and Nominatim both reproduce the split exactly: the building is Sallustiano's, turismoroma's own point is Trevi's, and Trevi is reserved to Wave 2. |
| 7h | The FAI page as the only listed "website" | **DROP** as a source — the finder did not fetch it and neither did I. |

### 2.8 Palazzo dell'Agricoltura — **PUBLISH**

| # | Claim | Ruling |
|---|---|---|
| 8a | Address Via XX Settembre 20 | **PUBLISH** |
| 8b | Built 1908–1914 at the wish of Francesco Cocco-Ortu, Minister of Agriculture, Industry and Commerce; the frieze carries three Latin inscriptions; interior decoration on agricultural and rural themes, with the article's own caveat that the documentation is too thin to explain how the artists were chosen; houses the biblioteca storica nazionale dell'agricoltura, first created in 1848; seat of the Ministero dell'agricoltura, della sovranità alimentare e delle foreste | **PUBLISH** |
| 8c | "The verifier should read the ministry's own pages rather than lean on Wikipedia" | **DONE — and the finder should have.** Both pages are live and carry material nobody has used. **ADD**, sourced to `masaf.gov.it`: *"The Ministry's own account of the building describes an atrium by the engineer Giuseppe Canonica, who found the original vestibule too cramped, had its end wall taken down and moved the columns so that they became load-bearing. It has twenty-two columns of red Baveno granite and bronze high reliefs above its six side doors, framed in coloured marble. The five gates connecting the atrium to the street, the lamps outside and the wrought-iron lights within are by the Roman artist Alberto Gerardi, who won the competition held for the commission. Three bronze bas-reliefs on the left-hand wall are by the Sicilian sculptor Benedetto D'Amore — the Ploughing, the Wheat Harvest and the Working of Iron — and three on the right, on the theme of human labour, are by Guido Calori."* |
| 8d | Working ministry; no public opening; masaf offers a virtual tour | **PUBLISH.** Publish as: *"The building is a working ministry and is not open to callers; the Ministry publishes a virtual tour of it instead."* |
| 8e | Rione = Sallustiano | **PUBLISH.** PIP confirmed; the article's lead says *«nel rione Sallustiano»*. |

### 2.9 Villino Rudinì — **PUBLISH, under ruling 2**

| # | Claim | Ruling |
|---|---|---|
| 9a | Address Via Quintino Sella 60 | **PUBLISH** |
| 9b | Designed and built 1904–1906 by Ernesto Basile for the family of Antonio Starabba, marchese di Rudinì, twice Prime Minister of the Kingdom of Italy; severe parallelepiped set back from the street, three storeys over basement plus recessed attic, entrance through a projecting body of three round arches; post-Risorgimento monumental shell with Liberty decoration in the squared attic mullioned windows, the frieze running the full perimeter, and floral Art Nouveau motifs in the window frames, portico, railings and gate | **PUBLISH** |
| 9c | (not reported by the finder) The article names the craftsmen | **ADD.** It states, citing *L'Architettura Italiana*, December 1907, that the Palermo sculptor Gaetano Geraci executed the principal ornamental sculpture, the stuccoist G. Varnesi of Rome the secondary work, the Li Vigni firm the front portico and hall decoration, and Antonio Ronconi the wrought iron. This is the only sourced statement in the article and the finder left it out. |
| 9d | Present use: chancery and consular section of Japan's embassy to the Italian State | **PUBLISH with ruling-2 wording.** Publish as: *"Italian Wikipedia states that the villino houses the chancery and consular section of the Embassy of Japan to the Italian State. Diplomatic premises stand on Italian soil; the building is not Japanese territory. It is not open to visitors."* Note the Sallustiano article calls it more loosely the "sede consolare"; the Rudinì article is the more precise of the two. |
| 9e | `it.emb-japan.go.jp` returned 403 and is unverified | **PUBLISH the caveat** — but note that a 403 to a research user-agent is not evidence a site is down; see §4.1. |
| 9f | Rione = Sallustiano | **PUBLISH.** PIP confirmed; the lead says *«nel rione R. XVII Sallustiano»*. |
| 9g | "it.wikipedia's coordinate template for this article is shared with Villino Rattazzi (both 41.90806, 12.49306)" | **DROP — unsupported.** Neither article's infobox contains a coordinate; both read `P625` from Wikidata. Whatever produced the identical pair, it is not "it.wikipedia's coordinate template", and the finder's §4.4 states it as a fact about the wikitext. Same defect applies to the claimed Pignatelli/Rasponi pair. See §4.6. |

### 2.10 Via XX Settembre — **DROP as a place**

| # | Claim | Ruling |
|---|---|---|
| 10a | The ancient *Alta Semita* line, opened in the sixteenth century as via Pia, renamed for the 1870 breach | **PUBLISH as context**, inside the rione's history, not as an entry. |
| 10b | Three-rione street, filed in all three categories; its wiki coordinate PIPs into Castro Pretorio | **CONFIRMED.** My PIP puts the wiki coordinate outside Sallustiano. |
| 10c | The street as a place owned by Sallustiano | **DROP.** The finder's own recommendation — treat it as context inside each rione's page, never as an owned place — is correct and I am converting it into a ruling. Three waves would otherwise each claim it and the corpus gate would fail. Recorded in §3.4 for the coordinator, but no wave should seed it. |

### 2.11 Piazza Sallustio — **REWRITE: fold into 2.2**

| # | Claim | Ruling |
|---|---|---|
| 11a | *«unica vera piazza del rione»* — the rione's only true square, with the Horti remains visible in it | **PUBLISH the fact, attributed**, as part of the Horti entry rather than as an entry of its own: *"Italian Wikipedia calls piazza Sallustio the rione's only true square, and the centre of it, with the remains of the Horti Sallustiani from which the rione takes its name still visible there."* |
| 11b | Piazza Sallustio as a standalone place | **REWRITE — fold in.** It is the setting for entry 2 and adds no second visit. The finder said as much; I am ruling it. |
| 11c | Rione = Sallustiano | **PUBLISH.** PIP confirmed. |

### 2.12 Breccia di Porta Pia memorial and the Aurelian Walls — **mostly DROP, remainder ESCALATED**

| # | Claim | Ruling |
|---|---|---|
| 12a | OSM carries a `historic=memorial` named "Breccia di Porta Pia" and a `Mura Aureliane` citywalls segment, both inside the ring | **CONFIRMED by my PIP**, and Nominatim returns the name "Breccia di Porta Pia" at that point. |
| 12b | "Two sources, one of them official, pointing the same way" on the breach being opened in Sallustiano's stretch of wall | **DROP the framing.** The it.wikipedia sentence is uncited. The turismoroma sentence says the *bersaglieri* found themselves inside Villa Paolina once through the breach — it does not say the breach was in this rione. That is one uncited aggregator claim plus one official statement about something adjacent, not two sources agreeing. |
| 12c | The publishable residue | **REWRITE.** Publish only: *"Roma Capitale's tourism portal states that it was inside Villa Paolina that the bersaglieri found themselves when they got through the Aurelian Walls at the breach of Porta Pia in 1870."* Anything stronger about which rione owns the breach needs a source neither of us has. |
| 12d | The memorial as a place for Sallustiano | **ESCALATE, and my recommendation is against.** See §3.3. The finder wrote that Nominatim "declines to name a quarter" there. It does more than decline: it returns **`suburb: Salario`**. That is a third answer, and it is the same answer the border text gives for the walls beyond Piazza Fiume. |
| 12e | The general turismoroma Mura Aureliane page as a city-wide source, not a rione-specific one | **PUBLISH the caveat.** Correct discipline. |
| 12f | Porta Pia and the Museo storico dei bersaglieri belong to Castro Pretorio | **PUBLISH.** My PIP puts both outside. See §3.5 for the double-category problem, which is real: the Sallustiano article lists the Museo dei bersaglieri under its own *Musei* heading. |

### 2.13–2.21 The villini and palazzine — **one grouped passage, not nine entries**

The finder's judgement here is right and I am upholding it. Rulings on the individual rows:

| # | Row | Ruling |
|---|---|---|
| 13 | **Villino Rattazzi**, via Boncompagni 8–10, c. 1900, Giulio Podesti, for the Rattazzi family of Urbano Rattazzi, third PM of the Kingdom; offices | **PUBLISH** the building. Confirmed, and this article *is* sourced, to an Archivio Storico Capitolino building-permit file. |
| 13b | "from H2 2021 the new home of Netflix Italia, citing *Variety* 9 Feb 2021" | **DROP.** The wikitext reads *«ospiterà»* — future tense, "will host" — in a sentence written in February 2021 and never updated. A five-year-old forward-looking claim about a tenancy, unverified, in a guide published in 2026. The finder flagged it "re-verify or drop"; there is nothing to re-verify it against and it goes. |
| 14 | **Villino Rasponi**, via Boncompagni 14, corner via Piemonte, 1901, Carlo Pincherle (father of Alberto Moravia), for Count Giulio Rasponi Murat; offices | **PUBLISH** with "according to Italian Wikipedia, which cites no source" — the article carries an unsourced banner dated January 2013. |
| 15 | **Villino Pignatelli**, via Boncompagni 12, corner via Piemonte, 1898, Giuseppe Mariani (1863–1932), for Duke Giuseppe di Terranova Pignatelli; offices | **PUBLISH** with the same caveat — unsourced banner dated April 2018. The article adds that the duke used it as his Roman residence when he was elected deputy and later senator. |
| 16 | **Villino Levi**, via Boncompagni 28, corner via Nerva, c. 1890, Augusto Giustini for Baron Giorgio Levi delle Trezze, builder Zeffiro Rossellini, enlarged 1905 by Carlo Pincherle | **PUBLISH** with the unsourced-banner caveat (April 2018). The finder's coordinate flag is confirmed: the infobox coordinate 41.909116, 12.496537 is real and does PIP inside Sallustiano on my ring, while reverse-geocoding to Ludovisi. Near the via Calabria line but not over it. |
| 16b | (not reported by the finder) | **ADD as a lead, do not yet publish.** The same article states that Baron Giorgio Levi delle Trezze and his wife Xenia Poliakoff were deported in 1944 and died at Auschwitz. It is the single most human fact in this whole group and the finder omitted it. Because the article is unsourced, it needs a second source before publication — that is a research task, not a reason to lose it. |
| 17 | **Villino Casati**, via Piemonte 51, 1906, Achille Majnoni d'Intignano's design built by Carlo Pincherle for the Casati Stampa di Soncino, Roman residence of the Marchesa Luisa Casati; offices | **PUBLISH.** Confirmed, and this is the best-sourced of the villini articles — it cites info.roma.it and palazzi.abi.it, and carries its own coordinate. |
| 18 | **Villino Maccari**, via Sallustiana, 1902, Augusto Fallani, for the painter Cesare Maccari | **PUBLISH the building, DROP the coordinate.** The article-body `{{Coord}}` is confirmed shared with row 19 and is a placeholder. Use the OSM named-building polygon or state the street alone. |
| 19 | **Villino Macchi di Cèllere al Sallustiano**, via Piemonte, 1887, Carlo Pincherle, for the Macchi di Cèllere family | **DROP ENTIRELY.** See §4.5. The finder wrote "the linked article exists but I did not fetch it". **It does not exist** — the title is a red link. The article that *does* exist under the similar name describes a different building, at viale Giulio Cesare 31, built in 1904 by Garibaldi Burba for the diplomat Vincenzo Macchi di Cellere, **in the rione PRATI (R. XXII) — which is another agent's rione in this same wave.** The Sallustiano entry is one uncited list line with a known-placeholder coordinate and a name that collides with a Prati building. Publishing it would be the exact two-rione collision the reservation exists to prevent. |
| 20 | **Palazzo Fiat**, via Calabria, 1924–26, *barocchetto*, Enrico Del Debbio | **ESCALATE.** See §3.2. Straddler confirmed on both tests. |
| 21 | **Palazzo della Società Beni Stabili**, via Piemonte corner via Giosuè Carducci, 1957, modernist, Cesare Pascoletti | **PUBLISH** as part of the grouped passage. PIP and Nominatim both Sallustiano; both confirmed. |
| 22 | The four OSM-only named buildings — Villino Berti o Dionisi Spierer, Palazzo di Bernich a Via Aureliana, Casamento Scipioni, Villa Adrianea | **DROP all four as places.** No history sourced for any of them, and the finder is right that "Villa Adrianea" is almost certainly the modern building over the Aula, not a separate villa. OSM names are not a source for what a building is. Keep as leads only. |

**Grouped replacement passage** (use verbatim in place of rows 13–21): *"The plots north of via Boncompagni were subdivided out of the Villa Ludovisi estate from 1883 and built up as detached villini around the turn of the twentieth century. Italian Wikipedia records villino Rattazzi at via Boncompagni 8–10, of about 1900, by Giulio Podesti for the family of Urbano Rattazzi, third prime minister of the Kingdom of Italy; villino Pignatelli at no. 12, of 1898, by Giuseppe Mariani for Duke Giuseppe di Terranova Pignatelli; villino Rasponi at no. 14, of 1901, by Carlo Pincherle, the father of Alberto Moravia, for Count Giulio Rasponi Murat; villino Levi at no. 28 on the corner of via Nerva, of about 1890, by Augusto Giustini for Baron Giorgio Levi delle Trezze and enlarged in 1905 by Pincherle; villino Casati at via Piemonte 51, of 1906, built by Pincherle to a design by Achille Majnoni d'Intignano for the Casati Stampa di Soncino and the Roman residence of the Marchesa Luisa Casati; and villino Maccari on via Sallustiana, of 1902, by Augusto Fallani for the painter Cesare Maccari. Most are now offices, and none is open to visitors. Italian Wikipedia cites no sources for the Pignatelli, Rasponi and Levi articles."*

### 2.22 Embassy row — **PUBLISH as texture, no entries**

| # | Claim | Ruling |
|---|---|---|
| E1 | Six diplomatic missions PIP inside the rione (France to the Holy See, Japan to Italy, Eritrea, Cape Verde, Timor-Leste to the Holy See, the United States to the Holy See), plus the Ministero dell'ambiente at Via Sallustiana 53 | **PUBLISH as texture only**, exactly as the finder recommends — a sentence about the character of the streets, not entries. |
| E2 | The ruling-2 statement covering all three named diplomatic buildings | **PUBLISH.** The finder's §6.1 is correct in every particular: none is foreign territory, none is Vatican territory, none is an Art. 15 extraterritorial property, and Art. 16 does not enter into it. Carry it into the page. |
| E3 | The US Embassy to the Holy See as Sallustiano's | **ESCALATE.** See §3.2. |

---

## 3. Straddlers I am escalating to the arbitrator

I resolve none of these. All five reproduce exactly on my independent geometry.

### 3.1 Palazzo Canevari and Largo di Santa Susanna — **into TREVI, reserved to Wave 2**
Italian Wikipedia says the square is *«in parte nel rione Sallustiano e in parte in quello Trevi»*
and is filed in **both** rione categories — the finder reported only the Sallustiano one, which
understates his own case. Its infobox nonetheless names Sallustiano alone.
My results: the square's wiki coordinate is **outside** my ring; the Canevari **building** is inside
and Nominatim returns `quarter: Sallustiano, Largo di Santa Susanna 13, Palazzo Canevari ex Società
Geologica Italiana`; turismoroma's own point for the same palazzo is **outside** and Nominatim
returns `quarter: Trevi, Via Leonida Bissolati 84`.
**My recommendation:** the building evidence is much stronger than the portal's point, which is a
block off, as the portal's point for Santa Maria della Vittoria also is. Award Palazzo Canevari to
Sallustiano; award the square itself to neither, or to Trevi. Do not let Wave 2 seed the palazzo.

### 3.2 Three straddlers into LUDOVISI, being written in this same wave
- **Palazzo Fiat, via Calabria.** PIP inside Sallustiano; Nominatim `quarter: Ludovisi, Via
  Calabria`. Via Calabria is the declared border itself. Both results reproduced.
- **United States Embassy to the Holy See, via Sallustiana 49.** PIP inside Sallustiano; Nominatim
  resolves the point into `Via Vittorio Veneto 119/a, Ambasciata degli Stati Uniti d'America,
  quarter: Ludovisi` — that is the Palazzo Margherita compound, which is Ludovisi's. Both results
  reproduced. Whoever takes it, ruling 2 applies: an embassy is not foreign territory. It is not a
  visitor place under either owner and I would not seed it at all.
- **Villino Levi.** PIP inside; the article's own coordinate reverse-geocodes to Ludovisi. Weakest
  of the three; I would leave it in the Sallustiano grouped passage.

### 3.3 The Breccia di Porta Pia memorial and the Aurelian Walls stretch — **against CASTRO PRETORIO and SALARIO**
PIP puts the memorial and the walls segment inside Sallustiano. Nominatim returns no quarter and
**`suburb: Salario`**. The border text excludes Piazza Fiume and gives the walls beyond it to the
quartiere Salario. Porta Pia and the Museo dei bersaglieri are outside on my ring.
**My recommendation:** do not seed the memorial. Three sources give three answers, the strongest
publishable fact in the whole cluster is the Villa Paolina sentence (§2.12c), and no wave is writing
Castro Pretorio to argue the other side.

### 3.4 Via XX Settembre — a three-rione street
Filed in the Sallustiano, Ludovisi and Castro Pretorio categories; its single wiki coordinate is
outside my Sallustiano ring. **Recommendation: not a place in this corpus at all.** Context inside
each rione page. If the coordinator disagrees, it cannot be seeded by more than one wave.

### 3.5 Museo storico dei bersaglieri — a double category no wave will catch
Filed in **both** `Roma R. XVII Sallustiano` and `Roma R. XVIII Castro Pretorio`, and listed under
the Sallustiano article's own *Musei* heading — I confirmed both. Geometry puts it outside
Sallustiano and the border text excludes Porta Pia, which is where it physically is. No wave is
writing Castro Pretorio, so it will simply fall out of the corpus. **Recorded for the coordinator,
not claimed.** The finder handled this correctly.

### 3.6 Piazza Fiume, Porta Salaria and the tomb of Sulpicius Maximus
Three sources, three answers, as the finder said. The Sulpicio Massimo node is inside my ring; the
Porta Salaria wiki coordinate 30 m away is outside it. The gate no longer exists. **Recommendation:
seed neither**; the gate is not a place and the tomb sits in a garden the border text hands to
Salario.

---

## 4. What the finder got wrong

**4.1 He reported a live source as unfetchable, and it is the one that answered his biggest question.**
`hortisallustiani.it` returns **HTTP 200, 284 kB**, to a browser user-agent. The finder recorded it
as a 403 he could not read, and built §7.3 — "no opening hours, no booking terms, no admission
price" — on that. The site does not give hours because **the Aula is a private events venue and has
none**. That is a better answer than a gap, and it was one user-agent header away. The finder used a
browser user-agent for Nominatim in the same session and did not try it here. His §7 gaps for
`emb-japan.go.jp` (also a 403) should be read with the same suspicion; the two DNS failures and the
one connection-refused are genuine and I reproduced them.

**4.2 The Holy See's Jubilee page is about a different church, and the finder recommended it.**
`iubilaeum2025.va`'s page for Santa Maria della Vittoria opens with the story of a building of 1495
on the site of a house belonging to the Jewish banker Daniel Norsa, demolished after a 1493
sacrilege. **That is Santa Maria della Vittoria in Mantua**, not Rome; the Roman church was built by
Maderno from 1608. The Holy See's page has conflated the two and then appended the Roman church's
White Mountain history and its Bernini. The finder fetched it, recorded HTTP 200 and offered it as a
source. **Cite it only for the church's place on a Jubilee walking route. Take no history from it.**

**4.3 He said he had no source for the museum's hours while quoting the source that has them.**
The it.wikipedia article he cites six times states opening hours, ticket prices and closing days in
its own body text. His §7.2 says "I have no fetched source for opening hours, closing days or
admission". The right conclusion — do not publish them — survives, for a better reason: they are
uncited and unconfirmable. But the finder's statement of what his sources contain is wrong, and a
later agent trusting §7.2 would waste a pass rediscovering it.

**4.4 He read a corroboration into the Sovrintendenza page that is not there.**
The page says Consagra's *Giano* stands *«nel punto in cui affiorano alcune tracce delle antiche
mura serviane, in largo di Santa Susanna»*. The finder took this as independent corroboration of two
OSM `Mura Serviane` nodes he found. **Those nodes are about 180 m away** — Nominatim returns
`road: Via Antonio Salandra` for the first of them, not largo di Santa Susanna. The Sovrintendenza
is describing an outcrop in the square, which my PIP puts on the Trevi side; the OSM nodes are
separate, unsourced features inside Sallustiano. Two different things. The Consagra work and the
outcrop the Sovrintendenza describes are Wave 2's, correctly not claimed; the OSM nodes are
unsourced and should not be seeded by anyone.

**4.5 He asserted an article exists that does not, and the name collides with another wave's rione.**
`Villino Macchi di Cèllere al Sallustiano` is a **red link**. `Villino Macchi di Cellere` exists and
is a building at viale Giulio Cesare 31 **in Prati**, by Garibaldi Burba, 1904, for the diplomat
Vincenzo Macchi di Cellere. Candidate 19 is dropped; see §2.13–21 row 19. This is the only error in
the file that could have put the same name in two seed files.

**4.6 Two of his three coordinate-hygiene claims are unsupported.**
The Maccari / Macchi di Cèllere shared `{{Coord|41.907393|12.494026}}` is real — I read it twice in
the Sallustiano wikitext, exactly as reported. But the claimed Pignatelli/Rasponi and
Rattazzi/Rudinì shared coordinates are **not in the wikitext**: none of those four infoboxes carries
a coordinate, and all four read `P625` from Wikidata. The finder attributes to "it.wikipedia's
coordinate template" something his own method produced. His conclusion — re-derive every coordinate
from the building — is right; his evidence for two thirds of it is not.

**4.7 Smaller things.**
- He gave the Horti's address from OSM when Roma Capitale and the venue both publish Piazza
  Sallustio **21** (§1.2).
- He removed turismoroma's hedge on Palazzo Canevari's Liberty status (§1.5).
- He reported Villa Paolina's purchase date without noting his own source gives two (§1.4).
- He did not report that four of the villini articles and the Villino Boncompagni Ludovisi article
  carry Wikipedia's own unsourced banners.
- He wrote that Nominatim "declines to name a quarter" at the Breccia; it returns `suburb: Salario`.
- He gave the Museo Boncompagni's administrative history and none of its collection (§2.3g).
- He did not mine the two ministry pages he told the verifier to read (§2.8c).
- He missed the deportation and deaths of the Levi delle Trezze family (§2.13–21 row 16b).
- He missed the rione's-only-green-space sentence in the article he quoted most (§2.0 R9).
- He truncated a phone number: the Horti's second mobile is 348 185 3911.
- **His §7.5 warning stands and is important:** the four records that went unanswered at the
  Nominatim rate limit carry their gap honestly. That is good practice and I want it on the record
  alongside the errors.

**What he got right, and it is the load-bearing half of the file.** The boundary method is correct
and I reproduced all 32 point-in-polygon results and all six Nominatim quarters without a single
disagreement. Every ruling-1 and ruling-3 obligation is met: there is not one designation claim in
the file, not one photograph, and not one trip duration or vague proximity of his own composing. His
ruling-2 handling of the doubled diplomatic trap is exact and should be carried into the page
verbatim. His straddler flags are all real and all reproduce. And his refusal to pad — §9 — is the
right instinct, even where I disagree with where it lands (§5).

---

## 5. TIER RULING

**GUIDE. Eight surviving places. I am ruling against the brief's stated expectation, and here is the
arithmetic.**

The brief says a town-page needs an intro of 90 words and at least two outbound links; a guide needs
4+ places; and that if the survivors number 3, rule town-page. It also says Sallustiano is expected
to land at town-page. I have counted twice, on two different definitions, and both clear the bar.

**Surviving places, unambiguously in Sallustiano, each with a re-fetched source and real content:**

1. Chiesa di Santa Maria della Vittoria — Bernini's *Ecstasy of Saint Teresa*, sourced hours
2. Horti Sallustiani / Aula Adrianea, Piazza Sallustio 21 — visible from the square, access resolved
3. Museo Boncompagni Ludovisi, in the Villino Boncompagni Ludovisi
4. Basilica di San Camillo de Lellis
5. Chiesa del Sacro Cuore di Gesù
6. Villa Paolina Bonaparte — exterior and grounds, embassy, ruling-2 wording
7. Palazzo dell'Agricoltura — exterior, with the Ministry's own account of its atrium
8. Villino Rudinì — exterior, Ernesto Basile

Plus **Palazzo Canevari**, which I have excluded from the count pending arbitration, and the villini
grouped passage, which is one passage and not a place.

Under the strict filter — somewhere a visitor can go inside, or a public open space — the count is
**five**: Santa Maria della Vittoria, San Camillo, the Sacro Cuore, the Museo Boncompagni and piazza
Sallustio. Under the looser filter it is eight. **Both clear 4+, so the ruling does not depend on
which standard the programme applies.** That is why I am confident this is not a stretch.

**The honest caveats the coordinator should have with the ruling:**
- The practical-information layer is thin. Of the five enterable places, **two have no sourced
  opening hours at all** (the Sacro Cuore and the Museo Boncompagni), and a third's hours are Roma
  Capitale's transcription of a parish whose own site is down.
- Three of the eight are buildings you can only look at from the pavement.
- The page will rest heavily on one object. That is not a defect — the *Ecstasy of Saint Teresa* is
  worth a page on its own — but the guide should not pretend to a breadth the rione does not have.
- The finder's own yield assessment (§9) argued for town-page. I have read it, verified the
  arithmetic behind it, and disagree only on the classification: he counted "enterable with hours"
  and the tier test counts places. His five-enterable figure and my five-strict figure are the same
  number; we differ on whether that number clears the bar. It does.

If the coordinator applies a standard I cannot see that requires sourced hours per place, the count
drops to three and the ruling flips to **town-page**. I flag that explicitly rather than bury it.

---

## 6. TALLY

| Ruling | Count |
|---|---|
| **PUBLISH** | 84 |
| **REWRITE** | 15 |
| **DROP** | 14 |
| **ADD** (material the finder missed, ruled publishable) | 4 |
| **ESCALATED to the arbitrator** | 6 clusters |

Total claims adjudicated: 113, plus 4 additions.

**REWRITTEN, itemised:** R4 (arms citation), 1c (superlative), 1i (hours attribution), 1j (Cornaro
restoration date), 2b (superlative), 2g (Aula access), 3g (museum collection), 3h (museum hours
statement), 4f (mass times attribution), 5d (window subject), 5f (foundress's body), 6c (1815/1816),
7d (Liberty hedge), 11b (piazza folded in), 12c (breach residue).

**DROPPED, itemised:** the Horti's OSM address (2a); the "hortisallustiani.it is a 403" finding
(2f); the Aula's "15 min a piedi" (2k, trip duration); the garden of Villa Paolina as a place (6h);
the archaic dwelling under Palazzo Canevari (7f); the FAI page as a source (7h); via XX Settembre as
an owned place (10c); piazza Sallustio as a standalone place (11b); the "two sources agree" framing
on the breach (12b); the Breccia memorial as a Sallustiano place (12d, recommendation); the Netflix
Italia tenancy (13b); Villino Macchi di Cèllere al Sallustiano entirely (row 19); the four OSM-only
named buildings (row 22); and the shared-coordinate claims for Rudinì/Rattazzi and
Pignatelli/Rasponi (9g).

**Not dropped and worth saying: no claim in this file was dropped under ruling 1.** The finder wrote
no designation claim of any kind, in either language, and declined two live temptations by name. No
claim was dropped under ruling 3 either — every record carries `"photos": []`. One claim was
corrected under ruling 2 in the sense of being made *more* precise (9d), and none violated it.
