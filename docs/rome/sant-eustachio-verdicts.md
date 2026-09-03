# Sant'Eustachio (R. VIII) — VERIFIER verdicts

Adjudicated against the finder file `docs/rome/sant-eustachio-finder.md`. I did not gather this
evidence and owe it no loyalty. Codes: **P** publish · **R** rewrite (exact replacement wording
given; the author uses it verbatim) · **D** drop.

**Result: 19 P · 11 R · 11 D. 30 places survive. Tier: GUIDE.**

---

## 1. Collision check, re-run mechanically

`python3 .superpowers/taken_slugs.py` → **450 places across 12 shipped files**, matching the
finder's figure. I re-ran it myself on every candidate stem rather than trusting the finder's table:

| fragment | result |
|---|---|
| `eustachio` `sapienza` `agostino` `valle` `catinari` `coppelle` `sudario` `giustiniani` `libri` `musja` `roscioli` `abate` `publicolis` `chiara` `torre-argentina` | **0 hits each** |
| `madama` | 1 — `pigna / madama-lucrezia-…` (the talking statue) |
| `argentina` | 6 — **all Pigna**, all Area Sacra archaeology |
| `andrea` | 2 — delle Fratte (Colonna), al Quirinale (Monti). **Sant'Andrea della Valle is free** |
| `carpegna` | 1 — `trevi / trevi-accademia-nazionale-di-san-luca` (**Palazzo Carpegna, Trevi**) |
| `teatro` | 8, none in R. VIII |

**No candidate below is already owned.** The finder's collision work stands.

**Carpegna warning upheld and sharpened.** Trevi already ships *Accademia Nazionale di San Luca,
Palazzo Carpegna*. Sant'Eustachio's **Palazzo Baldinotti Carpegna** is a different building. Slug it
`palazzo-baldinotti-carpegna-sant-eustachio-rome` and name it *Palazzo Baldinotti Carpegna*
throughout — never the bare "Palazzo Carpegna".

---

## 2. Re-fetched sources

I re-fetched sixteen sources, well past the required five. Every one below was pulled fresh in this
pass.

| Source | Verdict on the finder's use of it |
|---|---|
| `turismoroma.it/it/luoghi/chiesa-di-santivo-alla-sapienza` | **Partly misreported. See §3.1** |
| `sivoallasapienza.eu` | **Confirms verbatim**: *"La Chiesa di S. Ivo è chiusa per lavori in corso"*; Sunday 11.00 Mass in the Sala della Rettoria, entrance Via del Teatro Valle 33, September to June, not July or August |
| `turismoroma.it/…/palazzo-madama-sede-del-senato-della-repubblica` | **Confirms** *"Le visite di Palazzo Madama sono sospese."*; Margherita d'Austria; Marucelli façade finished 1642; February 1871 |
| `santandrea.teatinos.org/orari/` | **Confirms every figure**: Mon–Sat 15.00–19.30, Sun 08.30–19.30; Mass weekdays 19.00, Sun 9.00 / 11.00 / 12.00 in Filipino / 19.00; confessions 30 min before each Mass |
| `turismoroma.it/…/chiesa-dei-santi-biagio-e-carlo-ai-catinari` | **Confirms** *"sorge nel rione Sant'Eustachio"* — the rione claim is real, and it is Roma Capitale's own words. Also confirms the two banned superlatives the finder flagged |
| `turismoroma.it/…/san-luigi-dei-francesi` | **Confirms** *"Situata nel rione Sant'Eustachio"*; Contarelli chapel; Lestache 1758 |
| `turismoroma.it/…/basilica-di-santagostino-campo-marzio` | **Confirms all of it**, including the Colosseum travertine *"secondo la tradizione"* and the Mass times exactly as the finder gave them |
| `turismoroma.it/…/teatro-di-roma-teatro-argentina` | **Confirms** 13 January 1732 / *Berenice* / Domenico Sarro / Sforza Cesarini; Paganini 1827 in the room above the vestibule; *La battaglia di Legnano* 1849; Stagione 2026/2027 live |
| `turismoroma.it/…/biblioteca-angelica` | **Confirms** the collection counts the finder gave (≈3,000 manuscripts, 1,000 incunabula incl. the Cicero *De Oratore*, 20,000 cinquecentine, 10,000 engravings and maps, ≈200,000 volumes), Rocca 1604, the open-to-all clause, Vanvitelli 1765, Arcadia from 1940, the two films. Hours field: *"Per gli orari e le modalità di accesso rivolgersi ai contatti indicati"* — **no hours exist to publish** |
| `turismoroma.it/…/palazzo-vidoni` | **Confirms** *"visibile solo dall'esterno"* and the via del Sudario façade. **Does NOT say "Dipartimento della Funzione Pubblica". See §3.2** |
| `turismoroma.it/…/basilica-di-santeustachio` | **Confirms** Celestine III campanile c. 1195, polychrome bowls, Gesta window, Salvi 1739 altar, Fuga baldachin, the 1495 flood plaque verbatim, and that no fixed hours are given |
| `turismoroma.it/…/archivio-di-stato-di-roma` | **Confirms** Studium Urbis / Boniface VIII 1303, Guidetti–Ligorio–Della Porta, Borromini 1632–1667, Biblioteca Alessandrina 1659–1665, Maioli's *Trionfo della religione*, the hall now an exhibition room, ≈20,000 parchments earliest 883, 1936 |
| `sovraintendenzaroma.it/…/abate-luigi` + `turismoroma.it/…/abate-luigi` | **Both confirm.** turismoroma adds a fact the finder missed — see §4 |
| `turismoroma.it/…/palazzo-baldassini` + `…/istituto-luigi-sturzo` | **Confirms** Sangallo, School of Raphael. **The "conflict" the finder reports does not exist. See §3.3** |
| `turismoroma.it/…/palazzo-patrizi-montoro` | **Confirms** the whole history, ≈800 paintings, *"Visitabile solo su prenotazione"*, and the address/coordinate mismatch the finder flagged |
| `sangiulianodeifiamminghi.com` | **Confirms** Mon–Thu 10.00–12.00 *"a partire dal 3 febbraio 2025"*, and the 41-vs-42 address split |
| `musja.it` | **The finder's warning is correct and worse than stated. See §3.4** |
| `it.wikipedia … Sant'Eustachio (rione di Roma)` | **Confirms the border list verbatim** and the rione's own monument list |
| `it.wikipedia … Teatro Valle`, `… Chiesa evangelica battista` | **Confirm** the facts and the two banned phrasings |
| `docs/rome/pigna-verdicts.md` (wave 2) | **Confirms** *"the Teatro Argentina is Sant'Eustachio's"* — and hands over something else too. See §5 |

**Nothing the finder leaned on failed to say what was claimed, with four exceptions**, all in §3.

---

## 3. What the finder got wrong

### 3.1 Sant'Ivo — a source attributed a statement it does not make
The finder writes: *"turismoroma's own hours line says the same."* It does not. turismoroma's hours
line reads: *"La Santa Messa viene celebrata dal Lunedì al venerdì alle ore 9.00 presso la Sala
della rettoria … La Domenica e festivi, l'ingresso è consentito solo da Via del Teatro Valle 33 …
alla riapertura della Chiesa, la Liturgia verrà trasferita in Sant'Ivo alla Sapienza."*
No Sunday 11.00, no September-to-June, no July/August exclusion. Those come **only** from the
rector's site. The two sources agree that the church is shut and disagree on the Mass schedule.
The rector's site is the church's own voice on its own hours, so it wins — but the record may not
claim turismoroma corroborates it.

### 3.2 Palazzo Vidoni — an unsourced tenant
turismoroma says only *"Oggi accoglie vari uffici ministeriali ed è chiuso al pubblico; visibile
solo dall'esterno."* The **Dipartimento della Funzione Pubblica** appears on no page the finder
fetched. Cut it.

### 3.3 Palazzo Baldassini — an invented conflict
The finder reports turismoroma saying the Istituto has been at Palazzo Baldassini "since 1956" and
the Institute saying "since 1951", and calls it *"a conflict to resolve or avoid."* There is no
conflict. turismoroma's own Istituto Luigi Sturzo page says both, in one sentence:
*"Fondato nel 1951 da don Luigi Sturzo … Dal 1956 ha sede a Palazzo Baldassini."* 1951 is the
foundation of the Institute; 1956 is its arrival in the building. The finder conflated two
different facts and then flagged the result as unreliable.

### 3.4 Musja — the finder was right, and it is disqualifying
`musja.it` resolves 200 and serves a Non-AAMS online-casino affiliate page under the title
*"Musja – Arte oltre il museo"*, last updated 05.05.2026, with bonus codes and deposit tables. The
institution has no live voice. Roma Capitale's page is self-contradictory on hours (body text gives
Tue–Fri 12.00–19.00 / Sat–Sun 11.00–20.00; its own hours field says contact the venue), and the
place sits 5.2 m from the Parione line. Three strikes. **D.**

### 3.5 Two banned superlatives the finder passed over
The finder caught the Catinari dome ranking, the Angelica "one of the oldest in the world" and the
Teatro Valle "oldest modern theatre in Europe". It did not flag two more on pages it cites:
* `archivio-di-stato-di-roma`: *"è una delle più belle chiese barocche di Roma"* — **banned**.
* `palazzo-baldassini`: *"è considerato uno dei migliori esempi di palazzi romani dell'inizio del
  XVI secolo"* — **banned**.
Neither reached the finder's records. Flagged so they do not reach the author's.

### 3.6 Method language and proximity language in draft prose
The finder's records carry sentences that must not survive into reader text: *"the `.cultura.gov.it`
hosts did not resolve from here"*, *"`santeustachio.it` refused connection"*, *"the `/horaires-des-
visites/` path 404s"*, *"`siae.it` … returns a 404"*, *"behind the Teatro Argentina"*, *"near the
corner with via di Sant'Eustachio"*, *"the other café on the same small square"*. Replacements are
given per record below. The provenance belongs in the research file and stays there.

### 3.7 The finder's own §2 count is wrong
§2 says "34 candidates below". The list runs to 41. Not a corpus defect, but the yield judgement was
written against a number the file does not contain.

---

## 4. Rulings, candidate by candidate

### First rank

| # | Place | | Ruling |
|---|---|---|---|
| 1 | **Chiesa di Sant'Ivo alla Sapienza** | **R** | Publish Borromini 1642–1660, the Urban VIII appointment of 1632, Della Porta's prior fabric, the Chigi stars and hills, the lobed dome, the spiral lantern, the six-pointed-star plan, Pietro da Cortona's altar canvas finished 1683 by Borghesi, the Borromini intarsia floor — all confirmed at source. **Status must read exactly:** *"The rector's office states that the church is closed for works in progress. The Sunday 11.00 Mass is held in the Sala della Rettoria, entrance Via del Teatro Valle 33, from September to June and not in July or August. Roma Capitale states that a Mass is celebrated Monday to Friday at 9.00 in the same room."* Do not write that the two sources agree. |
| 2 | **Palazzo della Sapienza / Archivio di Stato di Roma** | **P** | Every element re-confirmed. Publish with **no hours**: *"No opening hours are given here; the Archive publishes its reading-room access rules itself."* Do not carry turismoroma's "one of the most beautiful Baroque churches in Rome". Note the two turismoroma pages date the church 1642–1660 and 1643–1660; use 1642–1660, from the church's own page. |
| 3 | **Chiesa di San Luigi dei Francesi** | **R** | Everything confirmed, including *"Situata nel rione Sant'Eustachio"* — quotable as Roma Capitale's own siting. **No hours.** Replace any hours sentence with: *"Roma Capitale directs enquiries about Mass times and visiting to the church itself, so no hours are given here."* |
| 4 | **Palazzo Madama (Senato della Repubblica)** | **P** | Confirmed throughout. Status field and prose must both say visits are suspended — *"Roma Capitale states that visits to Palazzo Madama are suspended."* Source nothing to `senato.it`. |
| 5 | **Palazzo Giustiniani** | **P** | Confirmed line by line: 1585 core probably Giovanni Fontana for Mgr Vento, 1590 purchase by the Giustiniani come from Chios, enlargement from 1650 in part to Borromini designs, staircase and courtyard into the early 1700s absorbing buildings as far as Piazza della Rotonda, 1898 Grande Oriente, 1943 purchase by the State, residence of the President of the Senate, **27 December 1947** signature of the Constitution by De Nicola in the library room, 1938 underground gallery. |
| 6 | **Basilica di Sant'Eustachio** | **P** | Confirmed including the flood plaque verbatim and its 5 December 1495 reading. The rione article's own image caption confirms the stag's head on the tympanum. **No hours**: *"Roma Capitale gives no fixed hours for the basilica, so none are given here."* Delete *"near the corner with via di Sant'Eustachio"* from the plaque sentence — the plaque is on the façade, full stop. |
| 7 | **Basilica di Sant'Andrea della Valle** | **P** + escalate | Hours re-fetched and confirmed exactly. Publish Grimaldi and Della Porta from 1591, Peretti di Montalto's funding, Maderno from 1608, dome inaugurated 6 November 1622, Rainaldi's façade, Lanfranco 1621–1625, Domenichino 1621–1628, Preti's apse, Borromini on the lantern capitals, the Piccolomini tombs brought here in 1614, the Cappella della Tosca. **The dome-size ranking is banned and must not appear in any form.** |
| 8 | **Basilica di Sant'Agostino in Campo Marzio** | **P** + escalate | All confirmed at Roma Capitale, including the Colosseum travertine as tradition and the Mass times. Use the Mass-time list, not OSM, exactly as the finder advised. |
| 9 | **Teatro Argentina** | **P** + escalate resolved | Wave 2's Pigna verdicts state in terms: *"the Teatro Argentina is Sant'Eustachio's"*. The polygon agrees. This is settled; publish. Facilities and box-office numbers are Roma Capitale's and publishable. Say the theatre stands in front of the Area Sacra — an adjoining physical fact, not wayfinding. |
| 10 | **Teatro Valle "Franca Valeri"** | **P** | it.wikipedia states the theatre is *"sito nel rione Sant'Eustachio"* — usable rione evidence the finder did not cite. Publish 7 January 1727, Morelli, capacity 900, Roma Capitale as owner, the premieres, closure 2010, occupation 2011–2014, transfer 2016, partial reopening 2018, the 2021 naming, and the published 2026/2027 season. **"Il teatro moderno più antico d'Europa" is banned** — the 1727 date carries it. |
| 11 | **Biblioteca Angelica** | **P** + escalate | Counts, Rocca 1604, the open-to-all clause, Vanvitelli's 1765 salone, the Index arrow, Holste 1661, Passionei 1762, Arcadia from 1940, the two films — all confirmed. **No hours may be given**, OSM's included: *"Roma Capitale directs enquiries about access to the library itself, so no hours are given here."* The "one of the oldest public libraries in the world" line is banned even though turismoroma names its comparators. |
| 12 | **Palazzo Maccarani Stati** | **P** | it.wikipedia only, but the rione article independently lists it as *"Palazzo Stati Cenci alla Dogana, oggi Palazzo Maccarani Stati, su piazza di S. Eustachio"*, which corroborates identity and siting. Publish Giulio Romano 1519–1524, the Bramante Palazzo Caprini derivation, the elevations, the courtyard orders, the 1972 and 2001 restorations and the Perin del Vaga attribution by Magnanimi. **Do not write "one of few Roman works by the artist"** — that is a rarity ranking. Write: *"Giulio Romano built it in Rome between 1519 and 1524."* |

### Second rank

| # | Place | | Ruling |
|---|---|---|---|
| 13 | **Palazzo Vidoni Caffarelli** | **R** | Cut the Dipartimento della Funzione Pubblica (§3.2). Cut the Lorenzo Lotto attribution, which is turismoroma's error. **Status sentence:** *"Roma Capitale states that the palace houses ministerial offices, is closed to the public and can be seen only from outside."* Publish 1515, the 1536 meeting of Paul III and Charles V, Stoppani 1767, Vidoni 1816, Settimi's 1886 rebuilding of the corso and piazza Vidoni fronts with an added storey, and that the original sixteenth-century façade is the one on via del Sudario. |
| 14 | **Abate Luigi** | **P** | Both sources re-fetched and confirmed, including the Tomassetti inscription cut at the order of Prince Giustiniani Bandini. Follow the Sovrintendenza's sequence, as the finder advised. **Fact the finder missed and should be used:** turismoroma opens *"Nel Rione Sant'Eustachio, in piazza Vidoni…"* — Roma Capitale siting both the statue and Piazza Vidoni in this rione. Locate it as the Sovrintendenza does: at the corner of Piazza Vidoni between Sant'Andrea della Valle and the Theatine convent. |
| 15 | **Fontana dei Libri** | **P** | Confirmed verbatim, `S. EVSTACCHIO – R IV` included, with turismoroma's own statement that the numeral is wrong because Sant'Eustachio is the eighth rione. The finder's reading is right: that is a fact about the object, not a ranking. Publishable. |
| 16 | **Palazzetto di Tizio da Spoleto** | **P** | Confirmed entire: Tizio di Spoleto as chamberlain to Cardinal Alessandro Farnese, the Zuccari exterior, Vasari on Taddeo's intercession, the 1550 arrival, the Baptism and Martyrdom of St Eustace, the arms of Pius IV dating it 1559, *"Visitabile solo dall'esterno"*. |
| 17 | **Palazzo Baldassini / Istituto Luigi Sturzo** | **R** | Delete the false conflict (§3.3). **Replacement:** *"Roma Capitale records that the Istituto Luigi Sturzo was founded in 1951 by Don Luigi Sturzo and has had its seat at Palazzo Baldassini since 1956."* Publish 1515–1518, Antonio da Sangallo the Younger, the School of Raphael names, the axial vestibulum–atrium–viridarium plan, 70 personal and 3 party archives, ≈120,000 volumes. **Cut "anticipates Palazzo Farnese"** — the source says Sangallo had a strong tie to the Farnese family, not that this façade anticipates that palace. **Cut "one of the best examples"** (§3.5). |
| 18 | **Chiesa di San Salvatore alle Coppelle** | **P** | Confirmed in full, including *"Rione Sant'Eustachio"* in Roma Capitale's own text, the 1195 consecration or reconsecration by Celestine III, the 1222 Honorius III bull and the *coppelle*, the 1404 grant to the Università degli Orefici Ferrari e Sellari, the letterbox plaque of the Jubilee of 1750 with its inscription, De Dominicis, Cardinal Spinola and the Ludovisi monument, the two Antoniazzo-school fragments, and the masonry piers replacing marble columns at the end of the eighteenth century. **No hours.** |
| 19 | **Chiesa di San Giuliano dei Fiamminghi** | **R** | Hours confirmed at the church's own site. **Delete "behind the Teatro Argentina"** — vague proximity. **Address:** the site's own body text reads *"si trova in Via del Sudario 41"* while its page heading reads *"Via del Sudario 42"* and Roma Capitale gives 40. Write: *"The church gives its address as Via del Sudario 41; Roma Capitale lists it at Via del Sudario 40."* **Hours sentence:** *"The church states that it is open for prayer and visits Monday to Thursday, 10.00 to 12.00."* Drop the "a partire dal 3 febbraio 2025" clause and the single dated Mass on the front page — both are stale notices, not a schedule. |
| 20 | **Chiesa del Santissimo Sudario dei Piemontesi** | **P** | Confirmed line by line, including *"Sorge nel rione Sant'Eustachio"*, the 1270 origin, the 1597 confraternity, 1603–1605 Castellamonte, Rainaldi's 1678 façade with Garoli, the 1798–99 deconsecration, the 1856 restoration, the Savoy chapel role after 1870, the Cappellani Palatini, Maccari, Gherardi, Cerrini, the Maria Francesca di Savoia Shroud reproduction given by Clement VIII, Lazzaro Baldi in the sacristy, and the Mass times exactly as given. |
| 21 | **Chiesa dei Santi Benedetto e Scolastica all'Argentina** | **P** + escalate | Listed in the rione's own monument list. Publish the 1615 foundation and its papal approvals, Lucarucci's 1619 room and 1622 bequest, the 1798 and 1849 depredations and the lost archive, the restoration under Pius IX and Leo XIII, the extinction of the archconfraternity in 1960, the roundel inscription, the single nave, and the *ciambella* etymology. Mass daily 18.00, with Roma Capitale's caveat. |
| 22 | **Chiesa dei Santi Biagio e Carlo ai Catinari** | **P** + escalate | The rione claim is Roma Capitale's own and re-confirmed: *"sorge nel rione Sant'Eustachio"*. Publish Rosati, the twelfth-century predecessor, 1620, the *catinari* etymology, Soria's façade c. 1635–38 and the Leni frieze, the twelve-pilaster drum, the elongated Greek cross and its 1646 form, the 1897 restoration, Domenichino 1627–1630, Lanfranco 1646, Longhi the Younger's altar under *Humilitas*, Pietro da Cortona's canvas placed 1667, the other paintings, and the Rieger Opus 600. **Both the fourth-largest-dome ranking and "one of the most beautiful" are banned.** |
| 23 | **Palazzetto del Burcardo** | **R** | Publish Burckardt, 1491–1500, the Farfa lease, the absorbed tower, and the *episcopus argentinensis* etymology that Roma Capitale confirms on its own Largo di Torre Argentina page — that is the record's strongest fact. **Status must not mention research.** Replacement: *"The Biblioteca e Museo teatrale del Burcardo was housed here from 1932; it.wikipedia's rione article records it at this address until February 2017. No current source states whether the building is open, so no opening information is given here."* Nothing about SIAE's website. |
| 24 | **Chiesa di Santa Maria in Monterone** | **R** | it.wikipedia only and carrying a citation-needed banner, but the rione's own monument list corroborates the church's existence and siting. Publish only the load-bearing, unbannered elements: the 1186 bull of Urban III, the 1597 raising against flooding, the complete rebuilding of 1682 under Innocent XI, the Monteroni-of-Siena naming and the pilgrim hospice, the transfer of the cure of souls to Sant'Eustachio under Leo XII, the three naves on antique columns with dissimilar Ionic capitals, Batoni's high-altar painting, the Durazzo monument, and the Redemptorists. Nothing else. |
| 25 | **Chiesa di Gesù Nazareno** | **R** | it.wikipedia only; the rione list corroborates existence and siting. Publish a short record: the earlier names, the barbers' guild rebuilding of 1622 and dedication to Ss Cosmas and Damian, the 1722–1724 rebuilding, the deconsecration after 1870, the 1896 grant to the Arciconfraternita di Gesù Nazareno and the present name, the Pomarancio *Sant'Elena*, and the reopening at Christmas 2012. Do not extend it. |
| 26 | **Chiesa evangelica battista di via del Teatro Valle** | **R** | **"The first building put up in Rome for evangelical worship" is banned.** The permitted sequence exemption covers a bounded series — *the first church on this site* — not a first-in-Rome ranking against a set no reachable register enumerates. It is the same shape as "the oldest X in Rome" and all three prior arbitrators barred that. **Replacement opening:** *"The Foreign Mission Board of the Southern Baptist Convention bought a property adjoining the Teatro Valle in 1878, with funds raised among American Baptist congregations, and the church was inaugurated with a service on Sunday 2 November 1878."* Everything else in the record — Cote, via della Croce 39 in 1871, Taylor, the Caffè Cesano hall of 1874, Paschetto's Liberty interior, the UCEBI congregation, the Capranica property — is confirmed and publishable. |
| 27 | **Palazzo Baldinotti Carpegna** | **P** | Listed in the rione's own monument list on corso del Rinascimento. Publish De Rossi's probable design for the Baldinotti, Cardinal Albani's residence before his election as Clement XI, the Carpegna marriage, the 1919 State purchase and the university Faculty of Letters, the 1935 partial demolition for the corso, the rebuilding on a set-back line, the two-storey portico to Palazzo Madama, and the Senate's offices and standing committees. **Naming discipline per §1.** |
| 28 | **Corso del Rinascimento** | **D** + escalate | A street that *is* the Parione/Sant'Eustachio boundary is not a place either rione can own; it.wikipedia's own article assigns it to both R. VI and R. VIII. The finder also states plainly that it did not fetch the SISTO toponymy record the article cites. Drop from this file and escalate the street, Piazza Madama and the Corso frontage as one question. |
| 29 | **Palazzo Mazzetti di Pietralata** | **R** | it.wikipedia only, privately owned, not visitable, but corroborated by the rione monument list on piazza Rondanini. Publish a short record: built for the II Marchese di Pietralata from about 1820 over roughly fifteen years, the two competing attributions given as competing, the block occupation to Piazza delle Coppelle, the courtyard preserving in plan the footprint of a hall of the Terme di Nerone with a stretch of semicircular wall, recorded on a marble plaque by the secondary staircase, the elevation description, Camuccini's piano nobile frescoes, and the sale in the 1930s. **Add:** *"The palace is privately owned and is not open to visitors."* |
| 30 | **Palazzo Melchiorri Aldobrandini** | **D** | A stub sourced to a single thin it.wikipedia article, no address, no hours, no distinguishing fact beyond "twinned in form with Palazzo Crescenzi Bonelli". Not a place record. |
| 31 | **Palazzo Patrizi Montoro** | **R** | History and the ≈800-painting Pinacoteca del Tesoriere all confirmed. **The address conflict is real** — Roma Capitale's address field says Via di Montoro 37 while its own coordinate and the rione list both put the palace on Piazza di San Luigi de' Francesi. **Publish no street address.** Write: *"Roma Capitale places the palace on Piazza di San Luigi de' Francesi. Its address field gives a different street, so no street number is given here."* **Status:** *"Roma Capitale states that the palace can be visited by booking only."* Drop the private-events, concert and wine-tasting list and the named marchese conducting visits — that is promotional copy from the owner's site, not identity, location or hours. |

### Third rank

| # | Place | | Ruling |
|---|---|---|---|
| 32 | **Sant'Eustachio Il Caffè** | **D** | The domain returns a redirect loop in every variant, there is no Roma Capitale botteghe-storiche page, and the 1938 date is a trading-duration claim with no source at all — not even the business's own, which would not carry it anyway. Nothing survives but an OSM pin. The finder's own instruction ("Do not ship the date") leaves nothing to ship. |
| 33 | **Camilloni a Sant'Eustachio** | **D** | OSM only. |
| 34 | **Antica Cartotecnica** | **P** | Re-fetched and confirmed under Roma Capitale's own **Botteghe storiche** section: Elisa Berti at the SACE Cartoleria Esperia in the 1930s, the takeover as Cartotecnica Commerciale with two other employees, Paola and Giovanni from the 1950s and the shift to writing instruments, De Filippo and Rascel as customers, Alessandro Billi from the 1990s, the stock of pens, inks, wooden set squares, drafting boards and typewriters. **Banned and confirmed present on the page:** *"assolutamente unica nel suo genere"*, *"la carta più raffinata e le migliori penne"*. Reproduce neither. |
| 35 | **Musja** | **D** + escalate | See §3.4. Escalate to the arbitrator as a Parione straddle in case a live official source appears; it does not exist today. |
| 36 | **Armando al Pantheon** | **D** | The 1961 takeover and the Gargioli succession are trading history sourced only to the business's own site, which the standing rule does not accept for it. Strip that and nothing distinctive remains but OSM hours. It is also a Pigna straddle named for a place Pigna owns. |
| 37 | **Antico Forno Roscioli** | **D** | Same defect: 1824 and 1972 are trading history from the bakery's own page. Parione straddle. |
| 38 | **Casa Bleve** | **D** | OSM only; own site unreachable. |
| 39 | **Aldo Fefé** | **D** | OSM only; no botteghe-storiche page; the Teatro di Roma credit is not a source and the finder says so. Campo Marzio straddle at 9.2 m. |
| 40 | **Spazio Sette** | **D** | OSM only. |
| 41 | **Fondazione Lelio e Lisli Basso** | **D** | The seat page could not be located; the hours are OSM's. Nothing establishes the institution at this address in its own words. |

---

## 5. Straddlers escalated to the arbitrator

I resolve none of these. Ranked by how much turns on them.

1. **Largo di Torre Argentina, the square.** The finder says *"Do not claim the largo."* Wave 2's
   Pigna verdicts say something different: the table row reads *Pigna 20, Sant'Eustachio 7 →
   **Sant'Eustachio (wave 2, not mine)**, "Shared; the Teatro Argentina is Sant'Eustachio's."* A
   shipped rione's verdict file appears to hand the square to Sant'Eustachio while Sant'Eustachio's
   finder declines it. `taken_slugs.py` confirms no shipped file owns it, so it is currently
   unwritten by anyone. **The arbitrator must decide whether it stays unwritten or lands here.**
2. **Piazza di Santa Chiara.** Wave 2 ruled it *Pigna 15, Sant'Eustachio 6 → Sant'Eustachio*.
   `taken_slugs.py` confirms it is unowned. **The finder never mentions it.** It is a place ceded to
   this rione by a shipped file and left on the floor. Escalating rather than adding a candidate I
   did not research.
3. **Basilica di Sant'Agostino, Piazza di Sant'Agostino, the Arco di Sant'Agostino and the
   Biblioteca Angelica** — one question, not four, since the Angelica sits in the convent block and
   the arch is 0.1 m from the line. Ponte is the rival; the rione's own article lists the basilica
   under Sant'Eustachio. Leans Sant'Eustachio.
4. **Santi Biagio e Carlo ai Catinari.** Roma Capitale states in its own words that it stands in
   rione Sant'Eustachio; the address is on Piazza Benedetto Cairoli, which the rione article names
   as the Regola border. Regola's finder will want it. Roma Capitale's explicit statement is the
   better evidence.
5. **Basilica di Sant'Andrea della Valle.** Polygon plus the single successful Nominatim reverse,
   both Sant'Eustachio. Parione and Regola are the rivals.
6. **Santi Benedetto e Scolastica all'Argentina**, 10.0 m from the Pigna line, entrance on the via
   di Torre Argentina front. Listed under Sant'Eustachio in the rione article.
7. **Corso del Rinascimento and Piazza Madama** — the boundary street itself, dropped here (#28).
8. **Chiesa di Santa Maria in Publicolis.** The finder recommends leaving it to Sant'Angelo and I
   agree: it.wikipedia says *"situato nel rione Sant'Angelo"* and the Sant'Eustachio rione article
   does not list it. **Not a candidate in this file.** Recorded so the arbitrator sees the polygon
   dissent.
9. Third-rank straddlers — Musja, Roscioli, Il Sanlorenzo, Armando, Aldo Fefé, Gelateria della
   Palma, Cremeria Monteforte, Hotel Pensione Barrett, Avvocatura Generale — all dropped on
   evidence above, so the straddle is moot unless a source appears.

---

## 6. Standing rulings — compliance check

* **Designation claims:** none. No record asserts a vincolo, listing or protection status, and
  Vincoli in Rete and the Catalogo generale were not consulted. **Clean.**
* **Vatican City and the Lateran Treaty:** nothing in R. VIII is an Art. 15 or Art. 16 property. The
  Biblioteca Angelica is an Italian state library under the Ministero della Cultura, not a Holy See
  property, and must be described that way. **Clean.**
* **Photographs:** `"photos": []` everywhere. The credited turismoroma images the finder logged stay
  in the research file for the image wave. **Clean.**
* **Superlatives:** four caught by the finder, two more caught here (§3.5), one reclassified as
  banned (#26). All barred.
* **Trip durations and vague proximity:** three removals ordered (#6, #19, #9's phrasing).
* **Research method in reader text:** removals ordered at #1, #2, #3, #6, #11, #19, #23, #31.
* **Status fields agreeing with prose:** enforced at #1, #4, #13, #23, #29, #31.

---

## 7. Tier ruling

**GUIDE. Comfortably, and honestly.**

**Thirty places survive** — 19 at PUBLISH and 11 at REWRITE — against a guide threshold of four. The
spine is not thin: Borromini's Sant'Ivo and the Sapienza complex with the Alessandrina, three
Caravaggios at San Luigi dei Francesi and a fourth at Sant'Agostino with a Raphael and two
Sansovinos beside it, the Senate in Palazzo Madama and the room in Palazzo Giustiniani where the
Constitution was signed, Sant'Andrea della Valle with Lanfranco and Domenichino under Maderno's
dome, the rione's title church with the Salvi altar and the 1495 flood plaque, two working theatres
with published 2026/2027 seasons, the Angelica, Giulio Romano's Palazzo Maccarani Stati, Sangallo's
Palazzo Baldassini, five further churches each with a national or regional community behind it, a
talking statue, a Pietro Lombardi fountain that misnumbers its own rione, and one historic shop.

Eleven of the thirty carry a straddle flag, and the arbitrator could move as many as six of them.
Even at the pessimistic end — Sant'Agostino, the Angelica, Sant'Andrea della Valle, San Carlo ai
Catinari, SS Benedetto e Scolastica and the Teatro Argentina all going elsewhere — **twenty-four
places remain**, which is still a guide by a wide margin. The tier does not depend on winning any
boundary argument.

The drops are concentrated exactly where the finder predicted: eight of the eleven are third-rank
businesses whose only evidence was an OSM tag or a trading date the business asserts about itself.
That is the rule working, not a research failure. The finder said it had deliberately included weak
candidates so the verifier had something to reject, and it had.
