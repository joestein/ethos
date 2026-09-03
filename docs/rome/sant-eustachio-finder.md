# Sant'Eustachio (R. VIII, Roma Capitale toponymic code 108) — FINDER research file

Finder pass, wave 4. **Nothing here is a shipping decision.** A separate verifier adjudicates and one
arbitrator rules ownership across all nine rioni. Every straddler is flagged, none resolved here.

---

## 0. Collision check — run mechanically, not from memory

`python3 .superpowers/taken_slugs.py` was run first and reports **450 places across 12 shipped
files**. Searched fragments and results:

| fragment | hits |
|---|---|
| `sapienza` | 0 |
| `eustachio` | 0 |
| `madama` | 1 — `pigna / madama-lucrezia-piazza-san-marco-rome` (the talking statue, unrelated) |
| `luigi` | 1 — `prati / giardino-luigi-bigiarelli` (unrelated) |
| `agostino` | 0 |
| `andrea` | 2 — Sant'Andrea delle Fratte (Colonna), Sant'Andrea al Quirinale (Monti). **Sant'Andrea della Valle is free.** |
| `catinari` | 0 |
| `abate` | 0 |
| `valle` | 0 |
| `libri` | 0 |
| `pantheon` | 1 — `pigna / pantheon-pigna-rome` (Pigna's; do not touch) |
| `argentina` | 6 — **all Pigna**: Area Sacra, Tempio A, Tempio B, Tempio C, Curia di Pompeo, Torre del Papito |

**Result: no candidate below is already owned.** The Largo di Torre Argentina archaeology is
entirely Pigna's; the **Teatro Argentina building** on the west side of the largo is a separate
thing and is untaken.

---

## 1. Boundary method, stated once (research-file only — must not appear in reader text)

Nominatim's `/reverse` endpoint returned **HTTP 429 on 31 of 32 attempts** across three runs spaced
from 1.2 s to 12 s apart; the service is being throttled hard from this network. The one call that
got through returned `quarter = Sant'Eustachio` for Sant'Andrea della Valle, agreeing with the
method actually used below.

So boundaries were resolved **directly against the OpenStreetMap rione boundary relations** — the
same data Nominatim derives its `quarter` field from, read one layer lower and therefore not
rate-limited:

* Overpass query `rel["boundary"="place"]["place"="quarter"]["ref"~"^R\."]` over a bbox covering
  central Rome returned **21 of the 22 rioni** (Trastevere R. XIII fell outside the bbox; not
  needed here). All 21 assembled into **single closed rings**.
* Sant'Eustachio is **relation 5452746**, tagged `official_name = Rione VIII Sant'Eustachio`,
  `ref = R. VIII`, `wikidata = Q2223960`.
* Every candidate was point-in-polygon tested against all 21 rings. **No candidate fell in two
  rioni and none fell in none.** Distance to the nearest boundary segment was computed for each so
  that near-edge cases could be flagged rather than silently resolved.
* Overpass endpoint note: `overpass-api.de` refused connections throughout; `overpass.kumi.systems`
  and `overpass.osm.ch` served every query.

The rione's own bbox is a **long, narrow north–south strip**: lat 41.89344–41.90171, lon
12.47372–12.47688 — roughly 900 m by 250 m, from Piazza Sant'Agostino down to Largo Arenula. This
shape is why so many candidates sit within 25 m of an edge.

it.wikipedia's `Sant'Eustachio (rione di Roma)` article gives Roma Capitale's own border
description, which was used as an independent cross-check:

* **Campo Marzio**: via dei Portoghesi, via della Stelletta, piazza e via di Campo Marzio
* **Colonna**: via e piazza della Maddalena, via del Pantheon, piazza della Rotonda
* **Pigna**: via della Rotonda, piazza santa Chiara, via di Torre Argentina, largo di Torre Argentina
* **Sant'Angelo**: largo Arenula, via di sant'Elena, via in Publicolis, via di Santa Maria del Pianto
* **Regola**: via Arenula, piazza Benedetto Cairoli, via dei Giubbonari
* **Parione**: via dei Chiavari, piazza dei Satiri, largo Pallaro, largo dei Chiavari, corso Rinascimento, piazza delle Cinque Lune
* **Ponte**: piazza sant'Agostino, via dei Pianellari

Source: https://it.wikipedia.org/w/api.php?action=parse&page=Sant%27Eustachio%20(rione%20di%20Roma)&prop=wikitext

**Lateran Treaty check: nothing in R. VIII is an Art. 15 or Art. 16 property.** No candidate here
needs the third-tier treatment. Sant'Agostino's convent block houses the Biblioteca Angelica, which
is an Italian state library under the Ministero della Cultura (`bibliotecaangelica.cultura.gov.it`),
not a Holy See property.

**Designation check: no page below claims any protection, listing or vincolo status.** Vincoli in
Rete and the Catalogo generale were not reachable and were not consulted.

---

## 2. Yield judgement

**Guide, comfortably — not a town page.** 34 candidates below, of which roughly a dozen are
first-rank: Borromini's Sant'Ivo inside the Palazzo della Sapienza, San Luigi dei Francesi with
three Caravaggios, Sant'Agostino with a fourth Caravaggio plus a Raphael and two Sansovinos, the
Senate in Palazzo Madama, the room where the Constitution was signed in Palazzo Giustiniani, two
working theatres, one of the oldest public libraries in Europe, and Giulio Romano's only surviving
Roman palace façade. The rione is small in area but exceptionally dense.

I have deliberately included edge and weak candidates so the verifier has something to reject; a
high confirmation rate here would mean I did not look hard enough.

---

## 3. Straddlers — FLAGGED, NOT RESOLVED

The arbitrator sees all nine files. Do not take my word on any of these.

| Candidate | Polygon says | Distance to R. VIII edge | Rival rione | Note |
|---|---|---|---|---|
| **Chiesa di Santa Maria in Publicolis** | R. VIII | **13.3 m** | **Sant'Angelo** | **Real conflict.** it.wikipedia's article says "situato nel rione Sant'Angelo"; the Sant'Eustachio rione article does not list it. The OSM polygon disagrees with both. **My recommendation: leave it to Sant'Angelo.** Listed below only so the arbitrator sees it. |
| **Basilica di Sant'Agostino in Campo Marzio** | R. VIII | 19.4 m | **Ponte** (piazza Sant'Agostino is the stated border) | The rione article lists it under Sant'Eustachio's own monuments; turismoroma files it under piazza Sant'Agostino 80. The church's own site brands it "ROMA · CAMPO MARZIO", which is the ancient region name, not the rione. Leans Sant'Eustachio. |
| **Piazza di Sant'Agostino** and **Arco di Sant'Agostino** | R. VIII | 13.8 m / **0.1 m** | Ponte | The arch is *on* the line. |
| **Biblioteca Angelica** | R. VIII | 38.4 m | Ponte | Sits in the Sant'Agostino convent block; follows whatever Sant'Agostino follows. |
| **Chiesa dei Santi Biagio e Carlo ai Catinari** | R. VIII | 39.0 m | **Regola** (piazza Benedetto Cairoli is the stated border) | turismoroma states outright "sorge nel rione Sant'Eustachio". Address Piazza Benedetto Cairoli 117 — north side. Leans Sant'Eustachio but Regola's finder will want it. |
| **Basilica di Sant'Andrea della Valle** | R. VIII | 24.3 m | Parione / Regola | The one Nominatim call that succeeded returned `quarter = Sant'Eustachio`. Strongest evidence of any candidate here. |
| **Teatro Argentina** | R. VIII | 36.4 m | **Pigna** | Wave 2 already ruled it Sant'Eustachio's; the polygon agrees independently. |
| **Chiesa dei Santi Benedetto e Scolastica all'Argentina** | R. VIII | **10.0 m** | Pigna (via di Torre Argentina is the border) | Entrance is on the via di Torre Argentina front of Palazzo Lucarucci; official address Vicolo Sinibaldi 1. |
| **Largo di Torre Argentina** (the square itself) | mixed | — | **Pigna owns the Area Sacra and 5 more** | **Do not claim the largo.** Flagged only because Teatro Argentina fronts it. |
| **Avvocatura Generale dello Stato** (via dei Portoghesi) | R. VIII | **10.6 m** | Campo Marzio | |
| **Aldo Fefé** (via della Stelletta 20b) | R. VIII | 9.2 m | Campo Marzio | via della Stelletta is the stated border. |
| **Gelateria della Palma** (via della Maddalena 19–23) | R. VIII | **3.2 m** | **Colonna** | via della Maddalena is the stated border. Very weak. |
| **Cremeria Monteforte** (via della Rotonda 22) | R. VIII | 8.2 m | Pigna | via della Rotonda is the stated border. |
| **Hotel Pensione Barrett** (largo di Torre Argentina 47) | R. VIII | 9.3 m | Pigna | |
| **Musja** (via dei Chiavari 7/9) | R. VIII | **5.2 m** | Parione | via dei Chiavari is the stated border. |
| **Il Sanlorenzo** (via dei Chiavari 4/5) | R. VIII | 5.4 m | Parione | |
| **Antico Forno Roscioli** (via dei Chiavari 34) | R. VIII | 21.0 m | Parione | |
| **Corso del Rinascimento** and **Piazza Madama** | R. VIII | 3.6 m each | **Parione** | The corso *is* the Parione/Sant'Eustachio boundary line — it.wikipedia's own street article gives `quartiere = R. VI Parione` **and** `R. VIII Sant'Eustachio`. A street that is itself a border is not a place either rione can own cleanly. |
| **Armando al Pantheon** (salita de' Crescenzi 31) | R. VIII | 26.0 m | Pigna | Named for the Pantheon, which is Pigna's. |

---

## 4. Candidates

Kind values are drawn from the thirteen the schema allows. There is no `church`, `monument`,
`square` or `bridge` kind — Rome's churches are `historic-site`.

### First rank

**1. Chiesa di Sant'Ivo alla Sapienza** — `historic-site`
Corso del Rinascimento 40 (Sunday entrance from Via del Teatro Valle 33). 41.898189, 12.474849.
Stands inside the courtyard of the Palazzo della Sapienza. Built 1642–1660 by Francesco Borromini,
appointed architect of the Sapienza in 1632 by Urban VIII to finish a complex already designed and
partly built by Giacomo Della Porta. Borromini added the attic over the existing façade, decorated
with the Chigi eight-pointed stars and six hills for Alexander VII; above it the lobed dome and the
spiral cusped lantern with travertine torches, topped by a flaming crown carrying a wrought-iron
sphere, cross and dove. Centralised plan on a six-pointed star; high altar canvas of Sant'Ivo by
Pietro da Cortona, finished 1683 by his pupil Giovanni Ventura Borghesi; marble intarsia floor
designed by Borromini.
**Status, and this matters:** the rector's own site states *"La Chiesa di S. Ivo è chiusa per lavori
in corso"* — Sunday 11.00 Mass is held in the Sala della Rettoria, entrance Via del Teatro Valle
33, September to June, not in July or August. turismoroma's own hours line says the same. A page
that promises the Borromini interior to a visitor right now would be wrong.
Sources: https://www.turismoroma.it/it/luoghi/chiesa-di-santivo-alla-sapienza · https://www.sivoallasapienza.eu/

**2. Palazzo della Sapienza / Archivio di Stato di Roma** — `museum` (or `historic-site`)
Corso del Rinascimento 40. 41.898181, 12.474549.
Seat of the Studium Urbis, the university founded by Boniface VIII in 1303, until 1935. Guidetto
Guidetti, Pirro Ligorio and — for the sixteenth-century phase — Giacomo Della Porta worked on it;
Borromini from 1632 to 1667. Housed the **Biblioteca Alessandrina**, named for its patron Alexander
VII Chigi, a rectangular hall in three bays on the second floor left of the church, built 1659–1665,
with Clemente Maioli's allegorical *Trionfo della religione* on the central vault; the Archivio has
turned the monumental hall into an exhibition room. The Archivio di Stato di Roma has been here
since 1936 and holds the central administrative and judicial archives of the Papal State from the
15th century to 1870, hospital, family, confraternity and religious-corporation fonds, thousands of
notarial protocols and about 20,000 parchments, the earliest dated 883.
Sources: https://www.turismoroma.it/it/luoghi/archivio-di-stato-di-roma · https://archiviodistatoroma.cultura.gov.it/ (linked by turismoroma; the `.beniculturali.it` and `.cultura.gov.it` hosts did not resolve from here, so hours must not be stated)

**3. Chiesa di San Luigi dei Francesi** — `historic-site`
Piazza di San Luigi de' Francesi 5. 41.899572, 12.474548.
The French national church, founded 1518 by Cardinal Giulio de' Medici (later Clement VII),
completed 1589 by Domenico Fontana to a design by Giacomo Della Porta. Travertine late-Renaissance
façade in five bays with a triangular pediment carrying the arms of France and statues by Pierre
Lestache (1758) of Charlemagne, Louis IX, St Clotilde and St Joan of Valois. **Cappella
Contarelli**, last chapel on the left, named for Cardinal Mathieu Cointrel: three Caravaggio
canvases painted between 1599 and 1602 — *Vocazione di san Matteo*, *San Matteo e l'angelo*,
*Martirio di san Matteo*; vault frescoes by the Cavalier d'Arpino. Second chapel on the right,
St Cecilia: Domenichino frescoes and a Guido Reni altarpiece. Organ by Joseph Merklin, 1881. Tombs
include Pauline de Beaumont (built by Chateaubriand), Cardinal de Bernis and Frédéric Bastiat.
Note: turismoroma's page states in its own words that the church is "situata nel rione
Sant'Eustachio" — useful, non-superlative rione evidence.
Sources: https://www.turismoroma.it/it/luoghi/san-luigi-dei-francesi · https://www.saintlouis-rome.net/ (reachable; the `/horaires-des-visites/` path 404s, so **hours must not be stated** from it)

**4. Palazzo Madama (Senato della Repubblica)** — `historic-site`
Piazza Madama. 41.899133, 12.474847.
Land ceded in 1478 by the monks of the imperial abbey of Farfa to France, for a hostel for French
pilgrims. Bought 1505 by Cardinal Giovanni de' Medici, later Leo X, restored to a Giuliano da
Sangallo design; passed to Giulio de' Medici (Clement VII), then in 1534 to Alessandro de' Medici,
and on his death in 1537 in usufruct to his widow **Margherita d'Austria, "la Madama"**, natural
daughter of Charles V — the source of the name. Baroque façade by Paolo Marucelli, finished 1642.
To the Lorraine in 1737; bought 1755 by Benedict XIV for the Governatorato, when a second courtyard
was opened where the Senate chamber now sits. Ministry of Finance under Pius IX; chosen as seat of
the Senate of the Kingdom in **February 1871**.
**Status:** turismoroma states *"Le visite di Palazzo Madama sono sospese"* — visits are suspended.
A virtual tour is offered at senato.it. (`www.senato.it` itself returns an empty body to a plain
HTTP fetch, so nothing may be sourced directly to it.)
Source: https://www.turismoroma.it/it/luoghi/palazzo-madama-sede-del-senato-della-repubblica

**5. Palazzo Giustiniani** — `historic-site`
Via della Dogana Vecchia 29. 41.899133 / 41.89922, 12.475335.
Core of 1585, probably by Giovanni Fontana, for Monsignor Francesco Vento; bought 1590 by the
Giustiniani, who had come to Rome from Chios after the Turkish reconquest. Enlarged from 1650, in
part to Borromini designs; the staircase and courtyard were built into the early eighteenth century,
absorbing buildings as far as Piazza della Rotonda. Held Vincenzo Giustiniani's (1564–1637)
collection of sculpture and painting — Caravaggio, Raphael, Giorgione, Titian, Andrea del Sarto —
dispersed between the late 18th and early 19th century. Seat of the Grande Oriente d'Italia from
1898. Bought by the Italian State in 1943 and made the residence of the President of the Senate.
**On 27 December 1947 the Constitution of the Italian Republic was signed in the library room by
President Enrico De Nicola.** Linked to Palazzo Madama by an underground gallery built in 1938.
Source: https://www.turismoroma.it/it/luoghi/palazzo-giustiniani

**6. Basilica di Sant'Eustachio** — `historic-site`
Via di Sant'Eustachio 19 (church tel. 06 6865334). 41.898648, 12.475730.
The church that names the rione. Present fabric is eighteenth-century; the surviving medieval
element is the Romanesque campanile built for Celestine III around 1195, decorated with polychrome
bowls. Single nave, three side chapels. Counter-façade: a *Maddalena penitente* window made in the
last decade of the nineteenth century by Gabriel and Louis Gesta of Toulouse, and an
eighteenth-century organ. High altar in polychrome marble and bronze by **Nicola Salvi, 1739**,
over an urn said by tradition to hold the bodies of the saint, his wife and his children, under a
baldachin with stag, dove, cherubs and palms by **Ferdinando Fuga**. Above the pediment the gilded
stag's head with a cross between its antlers. A plaque on the façade near the corner with via di
Sant'Eustachio marks a Tiber flood: *AN(NO) SAL(UTIS) M VD TIBERIS SERENO AERE AD HOC — SIG(NUM)
CREVIT NON(IS) DECEMB(I)R(IS) ALEX(ANDRI) VI P(ONTIFICIS) M(AXIMI) AN(NO) III* — 5 December 1495.
turismoroma states no fixed hours; `santeustachio.it` refused connection, so **no hours may be
given**.
Source: https://www.turismoroma.it/it/luoghi/basilica-di-santeustachio

**7. Basilica di Sant'Andrea della Valle** — `historic-site`
Piazza Vidoni 6 / Corso Vittorio Emanuele II. 41.896003, 12.474333.
Begun 1591 to a design by Gian Francesco Grimaldi and Giacomo Della Porta, funded largely by
Cardinal Alessandro Peretti di Montalto, nephew of Sixtus V. **Carlo Maderno** took over in 1608,
widened the transept and raised the dome, inaugurated **6 November 1622**. Travertine façade by
**Carlo Rainaldi**, second half of the seventeenth century. Dome interior frescoed by **Giovanni
Lanfranco, 1621–1625**; pendentives and apsidal transept by **Domenichino, 1621–1628**; apse by
Mattia Preti. The young **Francesco Borromini** worked the lantern capitals, whose cherubs' wings
form volutes. Two funerary monuments of Popes Pius II (c. 1470) and Pius III Piccolomini (early
1500s), brought here from the old Vatican basilica in **1614**. The Barberini chapel is known as the
*Cappella della Tosca* because part of Puccini's opera is set there. The Abate Luigi statue stands
against the flank outside.
**Hours, from the basilica's own site:** open Mon–Sat 15.00–19.30, Sun 08.30–19.30. Mass weekdays
19.00; Sunday 09.00, 11.00, 12.00 (in Filipino) and 19.00. Confessions 30 minutes before each Mass.
Sources: https://www.turismoroma.it/it/luoghi/basilica-di-santandrea-della-valle · https://santandrea.teatinos.org/orari/
*Caution for the writer:* turismoroma's text ranks the dome by size against St Peter's. That is a
superlative and cannot be reproduced, attributed or not.

**8. Basilica di Sant'Agostino in Campo Marzio** — `historic-site` — **STRADDLER, see §3**
Piazza di Sant'Agostino 80. 41.901063, 12.474270.
Augustinian; the first church here was finished in 1420 and proved both too small and too low
against Tiber floods. Rebuilt and raised above a flight of steps about fifty years later by
**Giacomo da Pietrasanta and Sebastiano da Firenze** for Cardinal Guillaume d'Estouteville. The
two-order travertine façade is faced with blocks said by tradition to come from the Colosseum;
d'Estouteville's arms are carved in the tympanum. **Luigi Vanvitelli** added the lateral volutes and
between 1746 and 1750 built the new convent and cloister, recast the interior and turned the
fifteenth-century campanile into a square tower. Inside: **Sansovino's *Madonna del Parto*, 1516**,
just right of the entrance; Andrea Sansovino's marble group of St Anne with the Virgin and Child on
the third left pillar; **Raphael's fresco of the Prophet Isaiah, 1512**, on that same pillar;
**Caravaggio's *Madonna dei Pellegrini*, 1604**, in the first chapel on the left. High altar of 1627
to a Bernini design, executed by Orazio Torriani, carrying a Byzantine *Virgin and Child* icon from
Santa Sofia in Constantinople. Guercino and Lanfranco in the right transept chapel. Burials include
St Monica and Contessina de' Medici.
**Mass times (turismoroma, with the site's own caveat that they may change):** Mon–Sat 08.00 and
18.30; Sun and feasts 08.00, 10.00, 12.00, 18.30. OSM separately records opening Mon–Sa
07.30–12.30, 16.00–19.30; Su 08.00–12.45, 16.00–19.30 — two sources, not identical; prefer the
Mass-time list, which is Roma Capitale's.
Sources: https://www.turismoroma.it/it/luoghi/basilica-di-santagostino-campo-marzio · https://www.santagostinoroma.it/

**9. Teatro Argentina (Teatro di Roma)** — `theater` — **STRADDLER, see §3**
Largo di Torre Argentina 52. 41.895583, 12.475928.
Stands in front of the Area Sacra, on the site of the hall called the Curia Pompeii. **Opened 13
January 1732** with Domenico Sarro's *Berenice*, when the theatre belonged to the Sforza Cesarini.
Paganini played in the room above the vestibule in **1827**. Verdi's *La battaglia di Legnano*
premiered here in **1849**. Acquired by the city after 1870 as its institutional theatre. Facilities
listed by Roma Capitale: accessible, accessible toilets, rehearsal room, cloakroom. Season 2026/2027
running; tickets via teatrodiroma.vivaticket.it; box office 06 684000311 / 06 684000314.
Sources: https://www.turismoroma.it/it/luoghi/teatro-di-roma-teatro-argentina · https://www.teatrodiroma.net/spazio/teatro-argentina/

**10. Teatro Valle "Franca Valeri"** — `theater`
Via del Teatro Valle 21. 41.897189, 12.475107. Capacity 900. Owner: Roma Capitale.
Financed by the nobleman Camillo Capranica, designed by **Tommaso Morelli**, **inaugurated 7 January
1727** with Simone Falconio Prato's tragedy *Matilde*; originally an all-timber Italian-style house
with five tiers of boxes and a gallery. Roman premiere of Mozart's *Don Giovanni* (1811); world
premieres of Rossini's *La Cenerentola* (1817), works by Donizetti, and Pirandello's *Sei personaggi
in cerca d'autore* (1921). Closed 2010; peacefully occupied by activists 2011–2014; transferred to
Roma Capitale in 2016; partially reopened 2018; **named for Franca Valeri in 2021**. Now programmed
by Teatro di Roma — a **2026/2027 season is published**, opening 16–18 October with Francesco
Piccolo's *La sera della prima. Sei personaggi in cerca d'autore al Teatro Valle*.
Sources: https://it.wikipedia.org/w/api.php?action=parse&page=Teatro%20Valle&prop=wikitext ·
https://www.teatrodiroma.net/spettacoli/il-teatro-e-vita-la-stagione-2026-2027-del-teatro-di-roma/teatro-valle/teatro-valle-roma-stagione-2026-2027/
*Caution:* it.wikipedia calls it "il teatro moderno più antico d'Europa". Banned superlative — the
1727 date carries the same information legitimately.

**11. Biblioteca Angelica** — `museum` (library open to readers) — **STRADDLER, see §3**
Piazza di Sant'Agostino 8. 41.900644, 12.474552. Tel. 06 6840801.
In the block beside Sant'Agostino. Roughly 200,000 volumes: about 3,000 Latin, Greek and Oriental
manuscripts; 1,000 incunabula, among them the *De Oratore* of Cicero, the first movable-type book
printed in Italy; 20,000 sixteenth-century editions; 10,000 prints and maps. First traces go back to
the fourteenth century, but the decisive act is the Augustinian bishop **Angelo Rocca**, who in
**1604** entrusted his library of about 20,000 volumes to the friars of Sant'Agostino, endowed it,
and directed that it be **open to all without limit of rank or means**. Lukas Holste's printed books
came in 1661, Cardinal Domenico Passionei's collection in 1762. By special papal authorisation it
also kept books on the Index, marked with an arrow on the spine. **Luigi Vanvitelli** rebuilt the
reading room, completed **1765** — the "vaso Vanvitelliano". Acquired by the Italian State after
Unification. Since **1940** it also houses the **Accademia dell'Arcadia**, founded 1690. Used as a
film location, including De Sica's *Il Giardino dei Finzi Contini* and Howard's *Angels & Demons*.
OSM records Mon–Fri 08.30–18.30, Sat 08.30–13.30; turismoroma gives no hours and
`bibliotecaangelica.cultura.gov.it` timed out, so **treat the hours as unsourced**.
Source: https://www.turismoroma.it/it/luoghi/biblioteca-angelica
*Caution:* turismoroma calls it "una delle più antiche biblioteche pubbliche del mondo". Banned.
The 1604 endowment and the open-to-all clause say it without ranking.

**12. Palazzo Maccarani Stati (Palazzo Stati Cenci Maccarani)** — `historic-site`
Piazza di Sant'Eustachio. 41.8983, 12.4757 (façade block). Owner: Demanio dello Stato.
Built **1519–1524** by **Giulio Romano** for Cristoforo Stati (1498–1550), Conservatore di Roma, with
his wife Faustina Cenci's dowry — one of few Roman works by the artist, drawing on a simplified
version of Bramante's Palazzo Caprini. Rusticated ground floor, portal between rusticated pilasters
under a triangular tympanum, four carriage doors; mezzanine with four plain-framed windows; five
first-floor windows with alternating segmental and triangular pediments; five second-floor windows
under flattened arches. The scheme continues on the via dei Caprettari and via del Teatro Valle
elevations; a nineteenth-century storey was added on the right. Asymmetrical courtyard, three arches
on pilasters with Doric pilaster strips, Ionic loggia above, Corinthian columns on the second.
Restored 1972 and 2001; the second campaign uncovered painted decoration, attributed by Giuseppina
Magnanimi to Perin del Vaga and his shop, dated between 1543 and 1551.
Source: https://it.wikipedia.org/w/api.php?action=parse&page=Palazzo%20Maccarani%20Stati&prop=wikitext
*Weakness: it.wikipedia only. No Roma Capitale page exists for it.*

### Second rank — solid, sourced, smaller

**13. Palazzo Vidoni Caffarelli** — `historic-site`
Corso Vittorio Emanuele II 116. 41.896270, 12.475161.
Built for the Caffarelli in 1515. Site of the 1536 meeting between Paul III Farnese and Charles V.
Sold 1767 to Cardinal Stoppani, 1816 to Cardinal Vidoni. In 1886, after the demolitions that widened
Corso Vittorio, the new owner Carlo Giustiniani Bandini had **Francesco Settimi** rebuild the
elevations on the corso and on Piazza Vidoni and added a storey; **the original sixteenth-century
façade is the one on via del Sudario**. Interiors include frescoes by Anton Raphael Mengs and by the
school of Perin del Vaga. Before the Second World War it housed the directorate of the Partito
Nazionale Fascista. **Today it holds ministerial offices — the Dipartimento della Funzione Pubblica
— and is closed to the public; turismoroma's own hours field reads "visibile solo dall'esterno".**
Source: https://www.turismoroma.it/it/luoghi/palazzo-vidoni
*Note:* turismoroma attributes the 1515 design to "Lorenzo Lotto, allievo di Raffaello", which is
an error the writer should not repeat verbatim; safest to give the date and the 1886 rebuilding.

**14. Abate Luigi** — `attraction`
Piazza Vidoni, against the flank of Sant'Andrea della Valle. 41.895968, 12.474633.
Late-Roman statue of a togate man, near life size, headless, right arm bent with the hand on the
chest, a *capsa* for scrolls at his feet — dress and attribute point to a public official. One of
the talking statues, the Congresso degli Arguti, with Marforio, Babuino, Facchino, Madama Lucrezia
and Pasquino. Named by popular tradition after a sacristan of the nearby church of the Sudario whom
it resembled. Originally on the corner of a small palace on via del Sudario; then in Palazzo
Caffarelli Vidoni (1888–1924); moved to the courtyard of Palazzo Chigi when that building was cut
back for Corso Vittorio Emanuele II; then to a niche on the Caffarelli-Vidoni staircase; **in place
at Piazza Vidoni since 1924**. The head has been replaced repeatedly after thefts and is now absent.
Base inscription by Giuseppe Tomassetti, cut at the order of Prince Giustiniani Bandini: *"Fui
dell'antica Roma un cittadino / ora Abate Luigi ognun mi chiama…"*
Sources: https://sovraintendenzaroma.it/content/statua-detta-dell%E2%80%99abate-luigi (Sovrintendenza
Capitolina, Roma Capitale) · https://www.turismoroma.it/it/luoghi/abate-luigi
*Note the two sources disagree on the Palazzo Chigi sequence; the Sovrintendenza's version (moved to
Palazzo Chigi after the demolition for Corso Vittorio) is the one to follow.*

**15. Fontana dei Libri** — `attraction`
Via degli Staderari, in the flank wall of the Palazzo della Sapienza. 41.898402, 12.474202.
Made in **1927 by Pietro Lombardi**, part of a Comune di Roma programme of fountains recalling the
old rioni and vanished trades, replacing cast-iron *nasoni* then thought ugly. Set in a niche: a
stag's head — the rione emblem — between four antique books on two brackets; water runs from two
bookmark-shaped spouts and from the two upper volumes. The books refer to the university in the
Palazzo della Sapienza behind the wall; the street's earlier name was via dell'Università. Above is
the Medici emblem, for Palazzo Madama opposite. The *staderari* who gave the street its present name
were makers of steelyard balances. **The fountain is inscribed `S. EVSTACCHIO – R IV`, and the
numeral is wrong: Sant'Eustachio is the eighth rione, not the fourth.** That mistake is a fact about
the object, not a ranking, and is publishable.
Source: https://www.turismoroma.it/it/luoghi/fontana-dei-libri

**16. Palazzetto di Tizio da Spoleto** — `historic-site`
Piazza di Sant'Eustachio 6. 41.898353, 12.475839.
Built at the start of the sixteenth century for Tizio di Spoleto, chamberlain to Cardinal Alessandro
Farnese, later Paul III. The painted exterior is among the first independent works of **Federico
Zuccari**; per Vasari he got the commission through his brother Taddeo, in whose workshop he had
been training since arriving in Rome in 1550. The figures show scenes from the life of St Eustace,
including the Baptism and the Martyrdom. The arms of Pius IV Medici date the work to **1559**.
turismoroma: "Visitabile solo dall'esterno".
Source: https://www.turismoroma.it/it/luoghi/palazzetto-di-tizio-da-spoleto

**17. Palazzo Baldassini / Istituto Luigi Sturzo** — `historic-site`
Via delle Coppelle 35. 41.900706, 12.475348. Tel. 06 6840421.
Built **1515–1518** by **Antonio da Sangallo the Younger** for the jurist Melchiorre Baldassini, of
Neapolitan origin, reader in civil law at the Sapienza, consistorial advocate and "advocate of the
poor", who took part in the Fifth Lateran Council in 1512. Painted decoration by the School of
Raphael — **Perin del Vaga, Giovanni da Udine, Polidoro da Caravaggio and Maturino**; the Giovanni
da Udine room was frescoed between 1517 and 1519 while the palace was still under construction.
Plan built on an axial route from street through *vestibulum* and *atrium* courtyard to a rear
*viridarium*, and a Florentine-Renaissance façade that anticipates Palazzo Farnese, which Sangallo
began a few years later. Seat of the **Istituto Luigi Sturzo**, founded 1951 by Don Luigi Sturzo;
turismoroma says the Institute has been at Palazzo Baldassini **since 1956**, the Institute's own
site says **since 1951** — a conflict to resolve or avoid. Holdings: 70 personal archives and 3
party archives; a library of about 120,000 volumes.
Sources: https://www.turismoroma.it/it/luoghi/palazzo-baldassini · https://www.turismoroma.it/it/luoghi/istituto-luigi-sturzo · https://sturzo.it/istituto/palazzo-baldassini/

**18. Chiesa di San Salvatore alle Coppelle** — `historic-site`
Piazza delle Coppelle 72/b. 41.900637, 12.476028. Tel. 06 6875796.
**National church of Romania** and for over a hundred years the meeting point of the Romanian
Greek-Catholic community; an iconostasis separates presbytery from nave and the liturgy follows the
Eastern rite. Consecrated or reconsecrated by **Celestine III in 1195** — the dedicatory plaque
inside and the small Romanesque campanile, now partly absorbed into the neighbouring building, date
from then. Called *de Cupellis* already in a bull of Honorius III of 1222, from the workshops of
makers of small barrels, *coppelle*. Given in 1404 to the Università degli Orefici, Ferrari e
Sellari; the saddlers stayed until 1740. From 1633 also the seat of the Confraternita del
Santissimo Sacramento della Divina Perseveranza, which cared for sick pilgrims and foreigners — a
**letterbox-shaped plaque on the left flank**, dating from the **Jubilee of 1750**, instructs
innkeepers and lodging-house keepers to drop in a note reporting any guest who fell ill:
*"QUI DEVONO METTERE I VIGLIETTI TUTTI GLI OSTI ALBERGATORI LOCANDIERI…"*. The medieval church was
rebuilt for that Holy Year to a design by **Carlo De Dominicis**, funded by Cardinal Giorgio Spinola,
buried in one of the chapels under a polychrome marble monument by Bernardino Ludovisi. Two
fifteenth-century fresco fragments survive, a *Dormitio Virginis* and a *Virgin with the Child on
her knees*, school of Antoniazzo Romano. Three naves, the original marble columns replaced by
masonry piers in the late eighteenth century.
Source: https://www.turismoroma.it/it/luoghi/chiesa-di-san-salvatore-alle-coppelle

**19. Chiesa di San Giuliano dei Fiamminghi** — `historic-site`
Via del Sudario 40 per Roma Capitale; **Via del Sudario 41 (and 42 in a page heading) per the
church's own site — an address conflict to resolve.** 41.895869, 12.475686.
**Royal Belgian church**, national church of Belgium, behind the Teatro Argentina. Tradition puts a
foundation in the eighth century; more likely the Flemish community in Rome built a hospice with a
chapel in the eleventh, and Robert II of Flanders, in Rome in 1096 for Urban II's crusade, is said
to have stayed and restored it. First documentary mention **1444**, the date of the statutes of the
Confraternita dei Fiamminghi. Between **1680 and 1682** the confraternity enlarged the church,
turning a Latin-cross plan into an **oval with eight columns**. The hospice closed with the French
Revolution and became the Belgian college, now on via Aurelia. Administered today by the
**Stichting Sint-Juliaan**, a lay foundation descended from the confraternity. Small façade set into
the former hospice, portal decorated with the **Lion of Flanders**; a modern copy of Jodocus Haerts'
seventeenth-century elm statue in the upper niche, the original kept inside. Vault with the arms of
Bruges, Ghent and Ypres and a *Glory of St Julian* frescoed in the early eighteenth century by
**William Kent**. Monument to Ludovica de Timbrune-Valence, 1830, by **Matthieu Kessels**.
**Hours, from the church's own site:** open for prayer and visits **Monday to Thursday 10.00–12.00**,
"a partire dal 3 febbraio 2025". Visits and Masses by arrangement with the secretariat.
Sources: https://www.turismoroma.it/it/luoghi/chiesa-di-san-giuliano-dei-fiamminghi · https://sangiulianodeifiamminghi.com/

**20. Chiesa del Santissimo Sudario dei Piemontesi** — `historic-site`
Via del Sudario 47. 41.895849, 12.475221.
Subsidiary church of the **Ordinariato Militare in Italia**. Origins traced to 1270, when Piedmontese,
Niçois and Savoyards returning from the Eighth Crusade formed a small community in Rome; in **1597**
they founded the Confraternita del Santissimo Sudario. Under Sixtus V the archconfraternity obtained
permission to build; the church went up **1603–1605** to a design by the Turin architect **Carlo di
Castellamonte (1560–1641)**. Restored 1678 by **Carlo Rainaldi**, who gave it the two-order façade,
assisted by the Piedmontese painter-architect Pier Francesco Garoli. Deconsecrated and used as a
store and stables during the Roman Republic of 1798–99; restored 1856; after 1870 effectively a
private chapel of the House of Savoy. Officiated today by the Cappellani Palatini. One nave with two
side chapels, polychrome stone floor, vault frescoed by **Cesare Maccari (1840–1919)**; high altar
with a seventeenth-century *Pietà e santi* by **Antonio Gherardi**; left altar *Il beato Amedeo IX*
by Giovanni Domenico Cerrini; a life-size sixteenth-century reproduction of the Shroud by **Maria
Francesca di Savoia**, given by Clement VIII; *Scene della Passione* by Lazzaro Baldi in the sacristy.
**Mass times (Roma Capitale, with its own caveat):** Mon–Fri 16.30; Saturday and vigils 18.00;
Sunday and feasts 18.00.
Sources: https://www.turismoroma.it/it/luoghi/chiesa-del-santissimo-sudario-dei-piemontesi · https://www.ordinariatomilitare.it/sudario

**21. Chiesa dei Santi Benedetto e Scolastica all'Argentina** — `historic-site` — **STRADDLER, see §3**
Vicolo Sinibaldi 1 (entrance through the via di Torre Argentina front of Palazzo Lucarucci).
41.896822, 12.476253. Tel. 06 6877180.
The regional church of the *nursini*, people of Norcia. Five devotees — Laerzio Cherubini, Benedetto
and Francesco Passerini, Sebastiano Masseroni, Olimpo Cistarelli — founded a company at Cherubini's
house in **February 1615**, approved as a confraternity by **Paul V on 9 November 1615** and raised
to Venerable Archconfraternity by **Gregory XV on 4 February 1623**. Its first official seat was a
chapel inside Sant'Eustachio; in 1619 the *nursino* **Piermatteo Lucarucci** made available a
ground-floor room in his house at Vicolo Sinibaldi on the corner of via di Torre Argentina, and in
**1622** left the whole building to the confraternity by will, which allowed the oratory to be
enlarged into a church. Stripped by the French in 1798 and again under the Roman Republic of 1849 —
the archive was lost — and restored under **Pius IX and Leo XIII**. The archconfraternity died out
in 1960 and the church passed to the Vicariate. No façade of its own; the portal carries a roundel
reading *Divis Benedicto et Scholasticae patronis ordo et populus nursinus*. Single nave with painted
false columns and the inscription *Felix Nursiae tellus quae talem genuit alumnun*, divided in two
bays by an arch on half-piers. Also called **San Benedetto della ciambella**, from a bronze imperial
civic crown dug up in the Baths of Agrippa nearby by Cardinal della Valle, which the diggers likened
to a ring-shaped bun.
**Mass daily at 18.00** (Roma Capitale, with the usual caveat).
Sources: https://www.turismoroma.it/it/luoghi/chiesa-dei-santi-benedetto-e-scolastica-allargentina · https://www.nursini.org/quisumus.html

**22. Chiesa dei Santi Biagio e Carlo ai Catinari (San Carlo ai Catinari)** — `historic-site` — **STRADDLER, see §3**
Piazza Benedetto Cairoli 117. 41.894375, 12.475165. Tel. 06 68300486.
turismoroma states plainly: "sorge nel rione Sant'Eustachio". Commissioned by the Barnabites from
**Rosato Rosati**, on the site of a small twelfth-century church, and built in honour of Cardinal
Carlo Borromeo in **1620**; "ai Catinari" from the basin-makers' shops nearby. Travertine two-order
façade by **Giovanni Battista Soria**, about **1635–38**, the frieze cut with the name of Cardinal
Leni who paid for it. Rosati's dome, finished 1620, has a tall drum on twelve pilaster strips with
arched windows between. Interior an elongated Greek cross, taking its present form in 1646 with the
rebuilding of the apse; restored 1897 for the canonisation of Antonio Maria Zaccaria, founder of the
Barnabites. **Domenichino** painted the pendentives with the four cardinal virtues, 1627–1630;
**Giovanni Lanfranco** the apse semi-dome, 1646. High altar by **Martino Longhi the Younger** under
Borromeo's motto *Humilitas*, with **Pietro da Cortona's** canvas of Borromeo carrying the Holy Nail
in procession during the Milan plague, placed in 1667. Also Mattia and Gregorio Preti on the
counter-façade, Lanfranco's *Annunciazione* (1624), Giacinto Brandi's *Martirio di San Biagio*
(1678), Antonio Gherardi's *Santa Cecilia*, Francesco Romanelli's *Martiri Persiani*, Andrea Sacchi's
*Morte di Sant'Anna*. **Rieger organ Opus 600**, built 1897 to Filippo Capocci's tonal design,
restored 1995 by Angelo Carbonetti.
**Mass times (Roma Capitale, with caveat):** Mon–Sat 08.00; Sun and feasts 10.00; in summer the
10.30 Sunday celebration is kept.
Source: https://www.turismoroma.it/it/luoghi/chiesa-dei-santi-biagio-e-carlo-ai-catinari
*Caution:* turismoroma ranks the dome fourth in Rome by size and calls it one of the most beautiful.
Both banned.

**23. Palazzetto del Burcardo (and the Torre Argentina)** — `historic-site`
Via del Sudario 44. 41.895936, 12.475432. Owner: Comune di Roma.
Late-Gothic house built **1491–1500** for **Johannes Burckardt**, the Alsatian bishop and papal
master of ceremonies, born near Strasbourg between 1445 and 1450, in Rome from 1467, papal chaplain
1478, apostolic protonotary 1481, master of ceremonies of the papal chapel 1484, bishop of Orte and
Civita Castellana 1503; author of the *Liber Notarum*, the diary he kept from 25 December 1484 to
27 April 1506. In 1491 he leased ground near the via Papalis from the abbey of Farfa, holding the
ruins of a medieval convent with a tower, and built his house around it. **The tower he absorbed
took the name "Argentina" from the way he signed himself — *episcopus argentinensis*, Strasbourg
being *Argentoratum* — and that is where Largo di Torre Argentina gets its name.** Roma Capitale
confirms this etymology on its own Largo di Torre Argentina page.
**Status is unresolved and must be checked before writing:** the palazzetto housed the **Biblioteca e
Museo teatrale del Burcardo** (SIAE) from 1932; it.wikipedia's rione article says the library was
there "fino al febbraio 2017", while turismoroma's Largo di Torre Argentina page, undated, calls the
building "oggi sede del Museo Teatrale". SIAE's own page at
`siae.it/it/chi-siamo/biblioteca-e-museo-teatrale-del-burcardo/` returns a 404 "page not found".
**Write nothing about current opening.**
Sources: https://it.wikipedia.org/w/api.php?action=parse&page=Palazzetto%20del%20Burcardo&prop=wikitext · https://www.turismoroma.it/it/luoghi/largo-di-torre-argentina

**24. Chiesa di Santa Maria in Monterone** — `historic-site`
Via Monterone. 41.896770, 12.475539.
First recorded among the daughter churches of San Lorenzo in Damaso in a bull of **Urban III, 1186**.
Restored 1245 and again 1597, when it was raised to escape repeated Tiber flooding, and **completely
rebuilt in 1682** under Innocent XI. The name appears to come from the Monteroni family of Siena,
who founded it together with a small hospice for Sienese pilgrims. It was a parish church until
Leo XII (1823–29) transferred the cure of souls to Sant'Eustachio. Basilican plan, three naves on
antique columns whose Ionic capitals are all different, arranged in the medieval period. High altar
*Madonna between St Peter Nolasco and St Peter Pascasius* by **Pompeo Batoni**; funerary monument of
Cardinal Stefano Durazzo on the left presbytery wall; Gondi family burials in the left nave.
Adjoining convent, now of the **Redemptorists**, who officiate the church.
Source: https://it.wikipedia.org/w/api.php?action=parse&page=Chiesa%20di%20Santa%20Maria%20in%20Monterone&prop=wikitext
*Weakness: it.wikipedia only, and that article carries a "citation needed" banner. No turismoroma page
exists. Treat as low confidence.*

**25. Chiesa di Gesù Nazareno** — `historic-site`
Via dei Barbieri. 41.895304, 12.475647.
Small church formerly called *de' Filonardi* or *del Crocifisso*, also dedicated to the Most Holy
Trinity; Franciscan tertiaries lived in an adjoining house. Entrusted in the sixteenth century to
the guild of barbers, who rebuilt it in **1622** and consecrated it to Ss Cosmas and Damian. Almost
entirely rebuilt **1722–1724**. Deconsecrated after 1870; in **1896** given to the Arciconfraternita
di Gesù Nazareno, which gave it its present name. Inside, a *Sant'Elena* attributed to Pomarancio;
a *Santa Caterina d'Alessandria* by the Cavalier d'Arpino in the adjoining convent.
**Reopened on Christmas night 2012** after years of consolidation and restoration.
Source: https://it.wikipedia.org/w/api.php?action=parse&page=Chiesa%20di%20Ges%C3%B9%20Nazareno%20(Roma)&prop=wikitext
*Weakness: it.wikipedia only.*

**26. Chiesa evangelica battista di via del Teatro Valle** — `historic-site`
Via del Teatro Valle. 41.8974, 12.4751 approx.
**The first building put up in Rome for evangelical worship.** After 1870 the Foreign Mission Board
of the Southern Baptist Convention sent William Nelson Cote to Italy; a Baptist church opened in via
della Croce 39 in 1871 but the community was repeatedly moved on by landlords. Under Georg Boardman
Taylor the movement took a large hall in the former Caffè Cesano at piazza Montecitorio 17 in 1874
and began raising money for a building of its own. In **1878** the Foreign Mission Board bought,
with funds collected among American Baptist congregations, a property in the rione Sant'Eustachio
adjoining the Teatro Valle; the church was **inaugurated with a solemn service on Sunday 2 November
1878**. Interior painted in Liberty style by **Paolo Paschetto**, himself a member of the
congregation until his death. Still the meeting place of a congregation of the UCEBI. The premises
had belonged, with the Teatro Valle and Palazzo Capranica alla Valle (1530), to a single Capranica
property running from Piazza Sant'Andrea della Valle to Piazza Sant'Eustachio, and were probably
stables or coach houses.
Source: https://it.wikipedia.org/w/api.php?action=parse&page=Chiesa%20evangelica%20battista%20di%20via%20del%20Teatro%20Valle&prop=wikitext
*"The first building in Rome for evangelical worship" is a sequence claim with a date attached, not a
ranking. The verifier should decide; I read it as permitted, like "the first church on the site".*

**27. Palazzo Baldinotti Carpegna (Palazzo Carpegna)** — `historic-site`
Corso del Rinascimento 44, adjoining Palazzo Madama. 41.8992 approx.
Built probably at the end of the seventeenth century to a design by **Giovanni Antonio De Rossi** for
the Tuscan Baldinotti family; Cardinal Giovanni Francesco Albani lived here until his election as
**Clement XI**. Passed to the Carpegna by marriage. Bought by the Italian State in **1919** and
joined to the Palazzo della Sapienza by a temporary flyover, becoming the university's Faculty of
Letters and Philosophy. **Partly demolished in 1935** for the cutting of Corso del Rinascimento, then
rebuilt on a set-back line and joined to Palazzo Madama by a two-storey portico. **Houses offices and
standing committees of the Senato della Repubblica; owner: Senato della Repubblica.** Not a
different building from the Accademia di San Luca's Palazzo Carpegna, which is in Trevi and already
shipped — check the slug carefully to avoid a name collision in search.
Source: https://it.wikipedia.org/w/api.php?action=parse&page=Palazzo%20Baldinotti%20Carpegna&prop=wikitext

**28. Corso del Rinascimento** — `attraction` — **STRADDLER, see §3; a boundary street**
Runs from Piazza di Sant'Andrea della Valle to Piazza delle Cinque Lune, **separating Parione from
Sant'Eustachio**. Sampietrino carriageway, basolato pavements. Planned in the 1931 master plan to
link the new Prati rione with Trastevere. Designed by **Arnaldo Foschini** with the engineer
Salvatore Rebecchini; it replaced the winding via del Pino, via del Pinnacolo and via della Sapienza
and required the partial or total demolition of Palazzo Cordelli alle Cinque Lune, Palazzo
Piccolomini, Palazzo Baldinotti Carpegna and part of San Giacomo degli Spagnoli. Convention signed
between the Governatorato di Roma and the INA on **3 April 1936**; site opened 21 April 1936; the
street **inaugurated 21 April 1938**. The Fontana di piazza Scossacavalli, from the demolished Spina
di Borgo, was moved to its Sant'Andrea della Valle end in 1957.
Source: https://it.wikipedia.org/w/api.php?action=parse&page=Corso%20del%20Rinascimento&prop=wikitext
(it.wikipedia cites Roma Capitale's SISTO toponymy record at
`geoportale.comune.roma.it/sisto/viario/9341/dettaglio`; **I did not fetch it and it should not be
cited as if I had** — the comune.roma.it hosts were unreachable in earlier waves.)

**29. Palazzo Mazzetti di Pietralata** — `historic-site`
Piazza Rondanini 33. 41.8998 approx. Neoclassical, three storeys plus mezzanine, privately owned.
Built for **Don Giovanni Battista Mazzetti, II Marchese di Pietralata**, from about **1820**, taking
fifteen years; attributed to **Virginio Vespignani** by Salvatore Rebecchini and to Giuseppe Marasca
by others. Occupies a whole block on four sides as far as Piazza delle Coppelle; **its central
courtyard preserves in plan the footprint of a large hall of the Terme di Nerone beneath it, and a
stretch of the baths' semicircular wall, as a marble plaque beside the secondary staircase records.**
Rusticated to the first floor; great arched doorway rising to the mezzanine; Greek-key frieze;
cornice on brackets carrying the family's lion's head, mace and roses. Frescoes by **Vincenzo
Camuccini** on the piano nobile. The family lived here until the 1930s, when the palace was sold.
Source: https://it.wikipedia.org/w/api.php?action=parse&page=Palazzo%20Mazzetti%20di%20Pietralata&prop=wikitext
*Weakness: it.wikipedia only; privately owned and not visitable.*

**30. Palazzo Melchiorri Aldobrandini** — `historic-site`
Between via della Rotonda, via di Sant'Eustachio and via della Palombella. Built in the second half
of the sixteenth century for Monsignor Girolamo Melchiorri, of a Recanati family ennobled in 1585;
twinned in form with Palazzo Crescenzi Bonelli.
Source: https://it.wikipedia.org/w/api.php?action=parse&page=Palazzo%20Melchiorri%20Aldobrandini&prop=wikitext
*Weakness: a stub. Thin. Include only if the guide wants a walking sequence along via della Palombella.*

**31. Palazzo Patrizi Montoro and the Pinacoteca del Tesoriere** — `museum` / `historic-site`
41.899646, 12.475148 — the coordinate is **Piazza di San Luigi dei Francesi**, and the rione article
places the palace "su piazza di San Luigi de' Francesi". **turismoroma's own address field says "Via
di Montoro, 37", which is a street in Regola/Parione and does not match its own coordinate.** The
family site gives no street address on its front page and its `/contatti/` path 404s. **Address
conflict — do not publish a street address until it is resolved.**
Origin in a modest house bought in 1512 by Gaspero dei Garzoni of Jesi from Alfonsina Orsini. In
1605 **Olimpia Aldobrandini** bought it together with an adjoining building of the Arciconfraternita
della Carità and the Ospedale della Consolazione and had the two joined; the façade was finished
1611. Sold in **1642 to the Patrizi**, a Sienese family in Rome from 1537; through Maria Virginia's
1726 marriage to Giovanni Chigi Montoro the line became the **marchesi Patrizi Naro Montoro, who
still own the building**. Altered by Sebastiano Cipriani in the early eighteenth century, again in
1747, and renovated in 1823 by Luigi Moneti. Three storeys and a mezzanine plus a nineteenth-century
addition; off-centre portal with two brackets carrying the stars and embattled band of the
Aldobrandini arms, repeated on windows and cornice. On the piano nobile the **Pinacoteca del
Tesoriere**: rooms frescoed by Raffaello Vanni, the family chapel, the Imperial ballroom and a
picture collection untouched since the end of the eighteenth century, about **800 paintings**.
**Visitabile solo su prenotazione** — bookable guided visits only, run personally by the Marchese
Corso Patrizi Montoro; private events up to 50 guests; concerts and wine tastings.
Sources: https://www.turismoroma.it/it/luoghi/palazzo-patrizi-montoro · https://www.palazzopatrizi.it/

### Third rank — businesses and shops, all needing a second source before shipping

**32. Sant'Eustachio Il Caffè** — `cafe`
Piazza di Sant'Eustachio 82. 41.898252, 12.475427.
OSM records `start_date = 1938` and hours Su–Th 07.30–01.00, Fr 07.30–01.30, Sa 07.30–02.00, plus
the site `santeustachioilcaffe.it`. **Every variant of that domain — `www.santeustachioilcaffe.it`,
`santeustachioilcaffe.com`, `www.santeustachioilcaffe.com`, http and https — returned a redirect
loop.** So the founding year, the hours and the trading history are all currently **unsourced**, and
under the rule that a business's own site establishes identity, location and hours but not how long
it has traded, the 1938 date needs a real source even if the site comes back. There is no
turismoroma "botteghe storiche" page for it (`/it/luoghi/santeustachio-il-caffe` 404s). Strong
candidate, weak evidence. **Do not ship the date.**

**33. Camilloni a Sant'Eustachio** — `cafe`
Piazza di Sant'Eustachio 54. 41.898296, 12.475767. OSM only. The other café on the same small square.
Include only if a source turns up.

**34. Antica Cartotecnica** — `shop`
Piazza dei Caprettari 61. 41.898149, 12.475770. Tel. 06 6875671.
Listed by Roma Capitale under **"Botteghe storiche"**. Pens, inks, wooden set squares and drafting
boards, typewriters. In the 1930s **Elisa Berti**, grandmother of the present owner Alessandro Billi,
worked at the SACE Cartoleria Esperia, a stationery warehouse supplying ministries, public offices
and schools; when the owner gave up the business she took it over as Cartotecnica Commerciale with
two other employees, later keeping part of it for herself. Her children Paola and Giovanni joined in
the 1950s and shifted the business to writing instruments; Eduardo De Filippo and Renato Rascel are
named as customers. Alessandro has run it since the 1990s.
Source: https://www.turismoroma.it/it/luoghi/antica-cartotecnica
*Note: the turismoroma text is written in a promotional register ("assolutamente unica nel suo
genere") that cannot be reproduced. The family sequence and dates can. `anticacartotecnica.it`
returned 403.*

**35. Musja** — `museum` — **STRADDLER, see §3; 5.2 m from the Parione line**
Via dei Chiavari 7/9. 41.895156, 12.474264. Tel. 06 68210213.
Contemporary art space created by the collector and entrepreneur **Ovidio Jacorossi**. Roma Capitale
lists hours **Tue–Fri 12.00–19.00, Sat–Sun 11.00–20.00** in the body text while its own hours field
says to contact the venue — an internal conflict.
**Serious warning: `musja.it`, the site Roma Capitale links, has been taken over and now serves
online-casino spam.** Do not link it and do not treat it as the institution's voice. Ship only if a
live official source is found.
Source: https://www.turismoroma.it/it/luoghi/musja

**36. Armando al Pantheon** — `restaurant` — **STRADDLER, 26 m from the Pigna line**
Salita de' Crescenzi 31. 41.899060, 12.476199.
From the restaurant's own site: in **1961 Armando Gargioli** took over an older restaurant at Salita
de' Crescenzi 31 and turned it into a "bottiglieria con cucina" named Armando al Pantheon; the
Gargioli family still runs it, Fabiana Gargioli (AIS sommelier diploma 2006) running the room and
the wine list. OSM records Mon–Fri 12.30–15.00 and 19.00–23.00, Sat 12.30–15.00.
Source: https://www.armandoalpantheon.it/
*A place's own site establishes identity, location and hours. The 1961 date is a trading-history
claim and needs a second source, per the rules.*

**37. Antico Forno Roscioli** — `shop` (bakery) — **STRADDLER, 21 m from the Parione line**
Via dei Chiavari 34. 41.894656, 12.474585. OSM hours Mon–Sat 08.00–20.00, Sun 08.30–18.00.
From the bakery's own site: **Marco Roscioli took over an oven in Via dei Chiavari dating from 1824
in 1972**, founding the Antico Forno Roscioli.
Source: https://anticofornoroscioli.it/
*Same caveat: the 1824 and 1972 dates are trading history from the business's own page.*

**38. Casa Bleve** — `restaurant`
Via del Teatro Valle 48–49. 41.897700, 12.475189. OSM hours Mon–Sat 12.30–15.00, 19.30–23.00.
`casableve.it` reset the connection; **no source beyond OSM. Weak.**

**39. Aldo Fefé** — `shop` — **STRADDLER, 9.2 m from the Campo Marzio line**
Via della Stelletta 20b. 41.901432, 12.476063. Hand-marbled paper and boxes; OSM `start_date = 1932`.
No page on Roma Capitale's botteghe storiche list (`/it/luoghi/aldo-fefe` 404s). A Cecilia Fefè is
thanked in Teatro di Roma's Teatro Valle exhibition credits, which is suggestive and not a source.
**Weak; include only if a source turns up.**

**40. Spazio Sette** — `shop`
Via dei Barbieri 7. 41.895181, 12.475555. OSM hours daily 10.30–19.30. Design store and bookshop in
Palazzo Lazzaroni. No turismoroma page (`/it/luoghi/spazio-sette` 404s). **Weak.**

**41. Fondazione Lelio e Lisli Basso** — `museum` (library and historical archive)
Via della Dogana Vecchia 5. 41.898908, 12.475352. OSM hours Mon–Fri 09.00–17.30.
The Foundation's site is live and has a section on its seat titled "Via della dogana vecchia"; a
library and a historical archive open to readers by request. `fondazionebasso.it/2015/la-fondazione/sede/`
404s, so the specific seat page must be found before writing.
Source: https://www.fondazionebasso.it/

---

## 5. Additional named features found inside the polygon, recorded but not worked up

These came out of the Overpass harvest (318 named OSM features tested inside R. VIII) and are logged
so nothing is silently dropped:

* **Arco di Sant'Agostino** (way 128740177) — 0.1 m from the boundary. A gate arch on via di
  Sant'Agostino. No source found.
* **"Vasca Romana"** (way 551337662), 41.898540, 12.474732 — an ancient basin near the Sapienza /
  Corso del Rinascimento front, tagged `amenity=fountain`. Plausibly from the Terme di Nerone, which
  ran under this block. **No source found; do not assert the provenance.**
* **Cortile d'Onore** (way 998911568) and **Cortile degli Aranci** (way 999208536) — courtyards
  inside the Palazzo Madama / Sapienza block. Not separately publishable.
* **Palazzo Capranica alla Valle** (OSM way 106361933 tagged simply "Palazzo Capranica"), Largo del
  Teatro Valle. Built 1530; the Teatro Valle and the Baptist church were both carved out of this
  Capranica property. No turismoroma page.
* **Palazzo Lante**, Piazza dei Caprettari — sixteenth century, design by Giuliano da Sangallo,
  executed by Nanni di Baccio Bigio, per the rione article. No dedicated article fetched.
* **Palazzo Datti**, Corso Vittorio Emanuele II (way 125831659, site paladatti.it). Minor.
* **Avvocatura Generale dello Stato**, via dei Portoghesi — 10.6 m from the Campo Marzio line;
  `avvocaturastato.it/it/contatti` 404s.
* **Presidenza del Senato della Repubblica** (node 8526374728) — this is Palazzo Giustiniani, already
  covered at §4.5, not a separate place.
* **Libreria Stendhal**, Piazza di San Luigi de' Francesi 23, French-language bookshop, Mon–Sat
  10.00–19.00 (OSM). **Weak; OSM only.**
* **Piazza di Sant'Eustachio**, **Piazza delle Coppelle**, **Piazza di San Luigi de' Francesi**,
  **Piazza Rondanini**, **Piazza Vidoni**, **Largo della Sapienza**, **Largo della Costituente**,
  **Largo Giuseppe Toniolo**, **Piazza dei Caprettari** — all squares inside the polygon; none has a
  turismoroma page. If the guide wants a square, Piazza di Sant'Eustachio is the one with the stag
  and the Palazzetto di Tizio on it.
* **Vanished churches** listed by the rione article, for a history sidebar only, not as places: Santi
  Cosma e Damiano de Monte Granato, Sant'Anna dei Falegnami, Sant'Elena dei Credenzieri, San
  Salvatore in Thermis.
* Hotels inside the polygon with no source beyond OSM: Hotel Navona (via dei Sediari 8), Hotel
  Tiziano (Corso Vittorio 110), Hotel della Torre Argentina (Corso Vittorio 102), Palazzo Navona
  Hotel (Largo della Sapienza 8), Palazzo delle Pietre (via delle Coppelle 23), Argentina Residenza
  Style Hotel, Torre Argentina Relais, Hotel Pensione Barrett. **None worked up; all OSM-only.**

---

## 6. Sources that failed, recorded once here so no page has to say so

`nominatim.openstreetmap.org` (HTTP 429, 31 of 32 calls) · `overpass-api.de` (connection refused) ·
`www.senato.it` (empty body) · `archiviodistatoroma.beniculturali.it` and
`archiviodistatoroma.cultura.gov.it` (DNS) · `bibliotecaangelica.cultura.gov.it` (timeout) ·
`santeustachioilcaffe.it` / `.com` (redirect loop) · `www.santeustachio.it` (connection refused) ·
`burcardo.org` (403) · `anticacartotecnica.it` (403) · `casableve.it` (connection reset) ·
`fondazionesturzo.it` (DNS; `sturzo.it` works) · `siae.it` Burcardo page (404) ·
`avvocaturastato.it/it/contatti` (404) · `saintlouis-rome.net/horaires-des-visites/` (404) ·
`musja.it` (resolves, but the domain now serves casino spam and is not the institution).

Vincoli in Rete and the Catalogo generale were not attempted; per the standing ruling no page may
claim a designation, protection status or listing date, so nothing here depends on them.

---

## 7. Photographs

Per the wave ruling, **`"photos": []` everywhere**. Roma Capitale's turismoroma pages carry
credited images ("ph. Turismo Roma", "Photo: Archivio di Stato di Roma official Facebook") for the
Teatro Argentina, Palazzo Vidoni, Palazzetto di Tizio da Spoleto, Palazzo Baldassini, San Salvatore
alle Coppelle and the Chiesa dei Santi Benedetto e Scolastica — noted here for whoever runs the
image wave under the four-gate rule. Nothing sourced or embedded in this pass.
