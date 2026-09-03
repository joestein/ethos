# Sant'Angelo (R. XI) — VERIFIER VERDICTS

Adjudicated 2026-09-02 against `docs/rome/sant-angelo-finder.md`. I did not gather this evidence and
owe it no loyalty. Every ruling below is PUBLISH, REWRITE or DROP, with the reason.

**Headline: PUBLISH 63 · REWRITE 14 · DROP 30 named (plus the ~15-item tail the finder himself
expected to be cut) · ESCALATE 8. Surviving place count 77. TIER: GUIDE.**

---

## 0. Collision check — run mechanically, not reasoned

`python3 .superpowers/taken_slugs.py` plus targeted searches on `marcello`, `mattei`, `campitelli`,
`portico`, `ghetto`, `sinagog`, `ebraic`, `balb`, `santacroce`, `astalli`, `margan`, `shoah`,
`caetani`, `savelli`, `carcere`, `botteghe`.

**No collision with any candidate this file publishes.** The finder's two near-misses are real and
his handling of both is correct: `antico-caffe-del-teatro-marcello` stays Campitelli's, and
`palazzo-mattei-albani-del-drago-rome` is the Castro Pretorio building on via delle Quattro Fontane,
not one of the four Mattei palaces here.

**One thing the finder did not surface.** Campitelli has already shipped three places addressed on
piazza Margana / vicolo Margana: `palazzo-maccarini-odescalchi-margana`,
`antica-trattoria-angelino-margana`, `eduardo-ii-vicolo-margana`. That is not a collision, but it is
strong practical evidence on straddler §5.2 (Torre dei Margani) and I have weighted it accordingly.

**Second thing the finder did not surface.** Campitelli's shipped guide intro already states, in the
corpus, that its boundary with Sant'Angelo runs down "via Montanara, piazza di Campitelli, via
Cavalletti, via dei Delfini, piazza e vicolo Margana and via dell'Aracoeli", and that Santa Maria in
Portico in Campitelli is not in Campitelli. The wave-1 ruling is therefore already load-bearing in
shipped text. Any arbitrator reversal on §5.1 has a live consequence.

---

## 1. Sources re-fetched — I confirmed eleven, not five

All fetched this session with python3 + urllib, HTTP 200 unless noted.

| Source | Claim tested | Result |
|---|---|---|
| `sovraintendenzaroma.it/…/teatro_di_marcello` | `Rione: XI - Sant'Angelo`; hours | **CONFIRMED verbatim.** "Aperto tutti i giorni… ora legale 9.00–19.00… ora solare 09.00–18.00 — ingresso gratuito. 1 maggio chiuso." |
| `sovraintendenzaroma.it/…/portico_d_ottavia` | `Rione: XI - Sant'Angelo`; the 442 arch | **Rione CONFIRMED. The 442 earthquake is NOT on this page** — see §2.1. |
| `museoebraico.roma.it/info/` | the full 2026 hours table | **CONFIRMED verbatim**, every band. |
| `museoebraico.roma.it/tariffe/` | €12 / €6 / €10, free list, €1 commission, tour prices | **CONFIRMED verbatim.** |
| `museodellashoah.it/contatti/` | address, phone, Su–Th 10–18, Fr 10–13, Sa closed | **CONFIRMED verbatim.** |
| `turismoroma.it/it/page/rione-xi-santangelo` | the `Confini` list; Boccione; Urbani; the Manilio inscription and 1468 | **CONFIRMED verbatim**, including the full Latin text and the Italian translation. |
| `turismoroma.it/…/trattoria-giggetto…` | 1923, Ceccarelli, hours | **CONFIRMED verbatim.** One correction: Roma Capitale gives the site as **giggettoalportico.it**, not giggetto.it. |
| `sovraintendenzaroma.it/…/casina_dei_vallati` | 1929–32 Fidenzoni; "rione S.Angelo"; the stale 1933 sentence | **CONFIRMED**, including that the page still ends "Dal 1933 l'edificio è sede degli Uffici della Ripartizione Antichità e Belle Arti". |
| `turismoroma.it/…/museo-nazionale-romano-crypta-balbi` | closed 9 Jan 2023, URBS | **CONFIRMED verbatim**, and via delle Botteghe Oscure 31. |
| `it.wikipedia.org` Rastrellamento del ghetto di Roma | the 2,091 figure | **REFUTED as stated.** See §2.2 — this is the file's one serious factual error. |
| `it.wikipedia.org` Attentato alla sinagoga di Roma | Stefano Gaj Taché | **CONFIRMED and expanded.** See §2.3. |

Also spot-checked and confirmed: `sovraintendenzaroma.it/content/albergo-della-catena-0` ("È stato
in passato sede istituzionale della Sovrintendenza Capitolina" — the finder's claim is exact) and
`/content/edicola-sacra-…-palazzetto-dell'olmo` (Vincenzo Milone, 1788, the 1796 eye-movement
epigraphs, "circa venticinque" images). Both are accurate as reported.

**Sources that do not say what the finder said: two.** The Sovrintendenza Portico d'Ottavia page
(§2.1) and it.wikipedia's rione article on 16 October 1943 (§2.2).

---

## 2. WHAT THE FINDER GOT WRONG

### 2.1 The 442 earthquake at the Portico d'Ottavia — REWRITE

The finder wrote: *"Two front columns were replaced by the surviving brick arch after the earthquake
of 442."* He listed the Sovrintendenza page first among his sources for the entry.

The Sovrintendenza page says something else. Verbatim: *"in seguito anche a importanti rifacimenti
della chiesa della fine del '200, le due colonne frontali orientali della facciata del propileo,
probabilmente gravemente lesionate, furono asportate e sostituite con un grande arco in mattoni,
affrescato e tutt'ora visibile."* No earthquake, no 442, and a date eight centuries later. The 442
version is it.wikipedia's alone.

**RULING: REWRITE.** The author uses this verbatim:

> Two columns of the propylaeum's eastern front were removed and replaced by the large brick arch
> that still stands, painted with fresco, in the course of major works on the church at the end of
> the 1200s.

Do not write "earthquake" and do not write "442".

### 2.2 Largo 16 Ottobre 1943 — the 2,091 figure is misattributed. REWRITE, and this one matters.

The finder wrote: *"On 16 October 1943, after the community had been made to pay 50 kg of gold to
the SS to avoid deportation, 2,091 Roman Jews were deported."* He flagged that the two articles
disagree and asked a verifier to reconcile them or publish neither.

They reconcile, and the rione article is wrong. it.wikipedia's dedicated article, citing Katz and
the Comunità Ebraica's own archive:

* the round-up of 16 October 1943 ran 05:30–14:00 and led to the arrest of **1,259 people — 689
  women, 363 men, 207 children**;
* after the release of *mischlinge*, foreigners and mixed families, **1,023 were deported directly
  to Auschwitz**; **sixteen returned** (fifteen men and one woman, Settimia Spizzichino);
* **2,091 is the total number of Roman Jews deported across the whole German occupation** — the
  figure on the commemorative plaque in largo 16 Ottobre 1943 itself, 1,067 men, 743 women, 281
  children, of whom 101 returned.

Attaching 2,091 to the single day is a factual error, on a memorial to a deportation, and it would
have shipped.

The gold survives: Kappler demanded at least 50 kg within thirty-six hours and promised safety in
exchange; the community paid. And "many more were killed at the Fosse Ardeatine" is loose — the
sourced statement is that **75 of the 335 killed at the Fosse Ardeatine on 24 March 1944 belonged to
the Roman Jewish community**.

**RULING: REWRITE.** The author uses this verbatim:

> The square is named for 16 October 1943. Between 5.30 in the morning and two in the afternoon, SS
> and German order police, working from a census taken years earlier by the Fascist government,
> arrested 1,259 people here and in the surrounding streets — 689 women, 363 men and 207 children.
> Weeks earlier the community had been made to hand over fifty kilograms of gold against a promise
> of safety, and had done so. After foreign nationals and members of mixed families were released,
> 1,023 people were deported to Auschwitz; sixteen came back. The plaque in the square records 2,091
> Roman Jews deported over the whole of the German occupation, of whom 101 returned. Of the 335
> people killed at the Fosse Ardeatine on 24 March 1944, seventy-five belonged to the Roman Jewish
> community.

### 2.3 Largo Stefano Gaj Taché — REWRITE, and the source now has been read

The finder wrote one line and said explicitly that he had not read the article. I have.

**RULING: REWRITE.** The author uses this verbatim:

> The square carries the name of Stefano Gaj Taché, who was two years old. At 11.55 on Saturday
> 9 October 1982 — Shemini Atzeret, and the day several dozen of the community's adolescents were
> celebrating their bar mitzvah — attackers threw grenades and fired on people leaving the Tempio
> Maggiore. He was killed by grenade fragments. About forty people were wounded, among them his
> parents and his four-year-old brother Gadiel.

No adjective beyond the facts. No "tragic", no "senseless", no comparative.

### 2.4 Piazza Paganica and Piazza dell'Enciclopedia Italiana are one square — the finder listed both

Entries **72** and **73** are the same piazza; the finder's own note on 73 says "Formerly piazza
Paganica" and he still carried 72 as a separate line. That is a duplicate record inside one file.
(it.wikipedia's rione article lists both names in its piazze list, which is how the error arose.)

**RULING: REWRITE — one record**, titled *Piazza dell'Enciclopedia Italiana (formerly piazza
Paganica)*. Drop entry 72. Note that **via Paganica** and **vicolo Paganica** are separate streets
and are not affected.

### 2.5 Piazza Gerusalemme — DROP

Entry **74** rests on OSM alone. It appears in neither official boundary list, neither Roma Capitale's
`Confini` nor it.wikipedia's rione article, and it.wikipedia's list of the rione's piazze does not
contain it. A piazza of that name exists elsewhere in Rome. **DROP** pending a second source.
Separately: it.wikipedia's rione article lists **Piazza dei Calcarari**, which the finder's harvest
missed entirely. Not added here — no second source was fetched — but recorded.

### 2.6 Santa Maria in Publicolis — it.wikipedia contradicts itself on the date the finder used

The finder gave "since 1835 the general house of the Missionari dei Sacri Cuori di Gesù e Maria".
The article's lead says **1858** and its history section says **1835**. Whatever the arbitrator rules
on the rione, **the year does not publish**: write "the church is in the care of the Missionari dei
Sacri Cuori di Gesù e Maria, who have their general house here" and stop. (1642–1643, De Rossi and
Cardinal Marcello Santacroce are confirmed and would publish.)

### 2.7 Superlatives the finder's quarantine missed

§11 is good work and catches most of them. Three more, all from `turismoroma.it/it/page/rione-xi-santangelo`,
which the author will read:

* **"l'unico conservato dei grandi portici romani"** (Portico d'Ottavia) — a uniqueness claim. Banned.
* **"la grande e bellissima Sinagoga"** — evaluative. Banned.
* **"difficile immaginare che possa esistere un altro posto al mondo che consenta di godere delle
  delizie del palato sotto l'ala di un monumento precristiano perfettamente preservato"**
  (turismoroma, Giggetto). A world-comparative. Banned.

Also: Roma Capitale's Giggetto page notes the trattoria "soffierà nel 2023 sulla sua centesima
candelina". **The 1923 founding date publishes** — it is Roma Capitale's, not the business's, so the
trading-duration bar does not bite. The centenary sentence does not publish.

### 2.8 Rulings the finder got right, and I am upholding

* **THE COLOSSEUM IS CELIO'S.** Five points, two methods, four of five and both methods Celio; the
  one dissenting point is on the Monti perimeter line. It is 2.6 km away and Sant'Angelo makes no
  claim on it. Upheld.
* **The Teatro di Marcello is Sant'Angelo's.** Three independent methods including the
  Sovrintendenza's own `Rione:` field, which I re-fetched. Upheld.
* **Ruling 2 is clean.** No Vatican City property and no Lateran Treaty property of either tier in
  this rione. The two diplomatic premises are correctly identified as *not* Lateran cases, and the
  finder's §7 wording discipline is exactly right. See §4 for the exact wording I am imposing.
* **Ruling 3 is clean.** `"photos": []` everywhere; no image named or linked.
* **Ruling 1 is clean.** No designation claim anywhere in the file, in either language. The UNESCO
  relation is correctly quarantined and **no Sant'Angelo page may say it lies inside the property**.

---

## 3. THE DROPS

### 3.1 Dropped for no usable source (8)

| # | Place | Reason |
|---|---|---|
| 11 | Case medievali e romane a piazza di Monte Savello | OSM label only; no source names the entity |
| 50 | Case dei Fabi | OSM label only |
| 64 | Spazio Treccani Arte | OSM only; unconfirmed on treccani.it |
| 95 | Ditta Leone Limentani | Roma Capitale's own page for it 404s. A register index entry is not a source for a record |
| 109 | Thompson Rome | hyatt.com returned 403; no first-party source exists in the file |
| 111 | Rialto (Circolo Arci) | OSM only |
| 107 | Tribuna Campitelli | OSM only, no street number |
| 97 | Bar Totó | no address, no source |

### 3.2 Dropped because the building could not be identified (2)

| # | Place | Reason |
|---|---|---|
| 52 | Palazzo Santacroce (piazza Costaguti) | it.wikipedia's `Palazzo Santacroce` article is a different building in Regola; the rione article lists a bare "Palazzo Santacroce" with no street; PIP and Nominatim disagree. **We cannot say what building this is. It does not ship.** |
| 53 | Palazzo Astalli | the only prose source places it at via San Marco 8, Rione X Campitelli, with a plan that does not match OSM's polygon. Either OSM is mislabelled or there are two. Publishing it would silently transfer a palazzo between two live rioni. |

### 3.3 Dropped because nothing survives, or the record is a paragraph (7)

| # | Place | Ruling |
|---|---|---|
| 9 | Circo Flaminio | nothing visible; a sentence inside the Portico d'Ottavia record |
| 10 | Portico di Filippo | *"Di esso non si conserva nulla."* Not a place. One clause in Sant'Ambrogio at most |
| 7 | Crypta Balbi (archaeological complex) | **merged into 60.** One site, one record — two would double-count the same walls |
| 8 | Teatro di Balbo | a paragraph inside 60, not a record |
| 55 | Convento di Sant'Ambrogio alla Massima | folded into 17 |
| 31 | Pietre d'inciampo | a paragraph in the quarter's text. **No count may be stated** — none was established |
| 81 | Via Elio Toaff | the name is all there is, and the naming itself was not verified |

### 3.4 Dropped as institutional occupants, not visitable records (7)

61 Biblioteca di storia moderna e contemporanea (own site unreachable, no hours, no admission terms —
appears as an occupant of Palazzo Mattei di Giove), 62 Istituto della Enciclopedia Italiana,
63 Biblioteca dell'Istituto dell'Enciclopedia Italiana, 65 Centro Studi Americani (every interior
page 404s), 66 ANIMI, 67 Universitas Mercatorum, 46-adjacent: the Soprintendenza occupant of Palazzo
Clementi (see REWRITE).

### 3.5 Dropped on judgement (6)

| # | Place | Reason |
|---|---|---|
| 59 | Lapide per Aldo Moro | OSM only, and the finder states he did not read the source. **It marks a murder. It does not ship on an OSM tag.** Recoverable in a later wave with the article properly read |
| 112 | Scuola Elementare Vittorio Polacco | a working school with children in it. The finder's own recommendation, and it is right |
| 92 | Il Giardino Romano | a name and an address, nothing else |
| 104 | Bottega Tredici | a name and an address |
| 105 | Osteria Pane Vino e San Daniele | no address at all; "near piazza Mattei" is vague proximity and is banned |
| 74 | Piazza Gerusalemme | §2.5 |

### 3.6 The tail — dropped as a class

Alice, Oriental Fonzie, Panepiú Bistrot, Bar Amore, Marcus Shoes, Sciunnacche, Dispensa, Enzo Bar,
two Pam Local, Mini Market, Self Service Laundry, two opticians, a lawyer's office, two segway
operators. The finder expected these to be cut and they are cut. Roughly fifteen entries.

---

## 4. THE REWRITES — exact replacement wording, to be used verbatim

**1. Portico d'Ottavia** — §2.1 above.

**13. Sant'Angelo in Pescheria — the vault fresco.** Roma Capitale writes "Innocenzo Sacconi",
it.wikipedia writes "Innocenzo Tacconi". One of them is wrong and nothing reachable settles it.
Use: *"The chapel of Sant'Andrea was raised in 1571 as the seat of the fishmongers' company. Its
altarpiece is by Giorgio Vasari; the vault fresco is not securely attributed."* And, on hours:
*"No source states opening hours, so none are given here."*

**22. Sala Santa Rita — the two Roma Capitale pages name two different streets.** Use:
*"The church was dismantled stone by stone in 1928 and re-erected on the present site in 1937–1940,
during the works that opened the via del Mare."* Do not name via del Teatro di Marcello and do not
name via Petroselli.

**26. Casina dei Vallati — the occupancy conflict.** Do not let the two sentences sit side by side.
Use: *"The Sovrintendenza Capitolina's account of the building runs to its restoration of 1929–1932,
to a project by Paolo Fidenzoni. The Fondazione Museo della Shoah ETS gives the Casina dei Vallati as
its museum, at via del Portico d'Ottavia 29, open Sunday to Thursday 10.00–18.00 and Friday
10.00–13.00 excluding Jewish holidays, closed Saturday."* Attribute each half to its own body and
say nothing that requires the two to agree.

**29. Largo 16 Ottobre 1943** — §2.2 above.

**30. Largo Stefano Gaj Taché** — §2.3 above.

**38. Palazzo Caetani — the embassy.** Use: *"The palace houses the embassy of Brazil to the Holy
See, the Fondazione Camillo Caetani, offices of the Fondazione Roffredo Caetani and the FAI Rome
delegation."* Nothing about the Vatican, nothing about extraterritoriality. And on the architect:
*"The architect is not settled: Ammannati has often been given and has recently been doubted, and
Baglione mentions a contribution by Vignola without saying whether he designed it."*

**39. Palazzo Mattei di Paganica — the address.** Treccani's own site could not be made to state a
street number. Write the square, not the number: *"Palazzo Mattei di Paganica, on piazza
dell'Enciclopedia Italiana, is the seat of the Istituto della Enciclopedia Italiana, founded in Rome
on 18 February 1925 by Giovanni Treccani and Giovanni Gentile."*

**43. Palazzo Savelli Orsini — the Order of Malta.** Use exactly: *"The palace houses the embassy of
the Sovereign Military Order of Malta to the Holy See."* Full stop. No "extraterritorial", no
"Vatican", no "Holy See property", no Article 15.

**44. Palazzo Lovatelli → Palazzo Caetani Lovatelli.** it.wikipedia's rione article names it
*"Palazzo Caetani Lovatelli, su piazza Lovatelli"*; use that name. **Delete the Della Porta
attribution** — OSM carries it with a question mark in the data itself.

**46. Palazzo Clementi — delete the occupant.** The only source is the piazza article, the body it
names has since been reorganised, and no current source was fetched. Publish the building and the
tower del Merangolo absorbed into the house of Fabrizio de Massimi; say nothing about who is in it.

**72/73. Merge into one square record** — §2.4 above.

**83. Antico Forno Urbani — delete the hours.** The only hours are an OSM survey stamped 2024-01-29,
two years stale, for a bakery. Publish the shop, the address (piazza Costaguti 31) and Roma
Capitale's mention of it. The finder is right that *"antico"* in the name is not evidence of age and
no age claim may be made.

**86. BellaCarne — delete the hours.** The finder cites bellacarne.it as the source but the hours
given are OSM's. A business's own site establishes its hours; OSM does not. Either the author fetches
bellacarne.it and quotes it, or the record carries no hours.

**Applies across the food section:** the same rule bites entries 90, 96, 98, 99 and 101, whose hours
are OSM's. Those entries **PUBLISH** because their hours are recent OSM surveys the finder dated and
labelled as OSM, and the author must label them the same way or omit them — but **82 Boccione must
carry no hours at all**, because OSM holds two contradictory records for it, as the finder correctly
found.

---

## 5. ESCALATED TO THE ARBITRATOR — 8 straddlers, with my reading

I am not resolving these. My reading is offered, not taken.

| # | Straddler | Evidence | My reading |
|---|---|---|---|
| 23 | **Chiesa di Santa Maria in Publicolis** | it.wikipedia says "rione Sant'Angelo" in terms and categorises it under Sant'Angelo; 8/8 footprint vertices test Sant'Eustachio; both boundary lists say the street divides Sant'Angelo from **Regola**, naming neither Sant'Eustachio nor agreeing with the geometry. Three authorities, three answers. Note that it.wikipedia's own bibliography for the church cites the **Rione VIII Sant'Eustachio** guide. | **Genuinely open. Do not let it default.** If Sant'Eustachio is not in this wave, leaving it unwritten is better than a wrong file |
| 51 | **Villino Lupi**, piazza Cinque Scole 37 | it.wikipedia says Sant'Angelo in terms and lists it in the rione's architecture list; Nominatim at hn 37 returns Regola; both boundary lists make the square the seam | Sant'Angelo, on two it.wikipedia statements against one Nominatim reading |
| 54 | **Torre dei Margani** | PIP 5/5 Sant'Angelo; Nominatim Campitelli; both boundary lists make piazza Margana the border; OSM's piazza relation is 22/25 Campitelli; **and Campitelli has already shipped three places on that square** | **Campitelli's.** The shipped corpus settles the practical question |
| 57 | **Fontana in piazza delle Cinque Scole** | PIP Sant'Angelo and the Sovrintendenza's own map coordinate lands inside the polygon; Nominatim Regola; both lists make the square the seam | Sant'Angelo, on the Sovrintendenza coordinate |
| — | **Piazza delle Cinque Scole** itself | OSM ways split 3 Sant'Angelo / 1 Regola / 3 mixed, relation centre Sant'Angelo; Nominatim Regola | A seam square. Wave 2's "shared by several, owned by none" precedent fits |
| — | **Piazza di Campitelli** (§5.1) | relation centre Sant'Angelo; roadway way 3/3 Campitelli; Nominatim Campitelli; it.wikipedia's **rione article lists "Piazza Campitelli" among Sant'Angelo's piazze**, while Campitelli's shipped guide calls it a boundary. Wave 1 ruled Sant'Angelo | **The wave-1 ruling should stand**, and the finder was right to re-flag rather than overturn. The church is settled independently on 30/30 and three sources; Palazzetto di Flaminio Ponzio and Palazzo Clementi ride on the square and go with it |
| 100 | **Pizza Florida**, via Florida 25 | via Florida is the Pigna seam; one way centroid Pigna, one Sant'Angelo | Needs a footprint test on the building, not the street. Unresolved |
| 113 | **Centro di Documentazione dell'Appia**, via del Teatro di Marcello 5 | the Sovrintendenza's own map coordinate is inside the polygon; wave 1 ruled that businesses addressed on via del Teatro di Marcello publish under Campitelli | The wave-1 rule was about **businesses**. This is a Sovrintendenza facility and the coordinate is inside. Arbitrator's call |

**Boundary streets (§5.5).** I endorse the finder's reading without adopting it: largo Arenula,
piazza Margana, Tempio D, the Tiber, lungotevere dei Pierleoni and ponte Fabricio all carry a
plurality elsewhere and should not be Sant'Angelo's. Lungotevere de' Cenci, via della Tribuna di
Campitelli, via dei Polacchi, via dei Delfini and via dei Funari carry a plurality here. Largo
Arenula and the Tiber look like the wave-2 "owned by none" case.

---

## 6. TIER RULING

**GUIDE. Surviving count 77.**

All twelve shipped Rome files carry `"tier": "guide"`, across a range from Sallustiano at 9 places to
Campitelli at 77. Sant'Angelo at 77 sits at the top of that range, in a unit of about a tenth of a
square kilometre.

The tier is not carried by the count alone, and it should not be. It is carried by what a visitor can
actually do inside 480 metres: two ticketed institutions with hours and prices I re-fetched and
confirmed line by line (the Museo Ebraico with the Tempio Maggiore; the Fondazione Museo della Shoah
at the Casina dei Vallati), a national museum whose closure since 9 January 2023 is stated by Roma
Capitale, a monument with published free opening hours from the Sovrintendenza (the Teatro di
Marcello), ten churches, four Roman monuments within 300 m, the Isola Mattei with four palaces, and
roughly nineteen food and lodging records that survive scrutiny.

Nothing here is a town page. **Guide, comfortably, and it does not need the straddlers to get there
— it is a guide at 69 even if every escalated case goes the other way.**

One thing the guide must say and must not overstate: **"the Ghetto's restaurants" is not a set that
maps onto one rione.** Piperno, Sora Margherita, Al Pompiere, Beppe e i suoi formaggi and Sheva are
Regola's. Giggetto, Nonna Betta, Ba'Ghetto, BellaCarne, La Taverna del Ghetto, Renato and Boccione
are here. The finder is right that the page must not pretend otherwise, and right that the page does
not go hungry.

---

## 7. STANDING PROHIBITIONS FOR THE AUTHOR OF THIS FILE

* **No designation claim**, English or Italian. The 1980 UNESCO inscription may be named **as an
  inscription**; **Sant'Angelo may not say it lies inside the property.** The Sovrintendenza's
  buffer-zone pages are linked from every place page — do not follow them.
* **No superlative from any source, attributed or not.** §11 of the finder file plus the three in
  §2.7 above. "Il rione più piccolo della città" is banned even though Roma Capitale and
  it.wikipedia both say it; write about 480 m by 360 m, roughly a tenth of a square kilometre.
* **No research method in reader-facing text.** No timeouts, no 404s, no 403s, no Nominatim, no
  vertices, no "the Sovrintendenza page carries a Rione field". The finder's §2.4 exists so none of
  it travels; keep it there.
* **No trip durations and no vague proximity.** The Hosianum's own "4 minutes from piazza Venezia" is
  dead. Structural adjacency publishes and is the right tool: the church built into the propylaeum,
  the tower set against the Portico, the palace standing on the theatre, the three temples inside
  the basilica walls, the museum inside the synagogue complex.
* **Every `kind` must be one of the schema's thirteen.** There is no church, monument, square or
  bridge kind — three Sallustiano churches shipped as `church` and the changeset rejected them.
  Rome's churches, the squares, the streets, the towers and the ruins are all **`historic-site`**.
  The Teatro di Marcello is `historic-site`, not `theater`: what a visitor sees is a ruin with a
  Renaissance palace on it, viewable only from outside.
* **`"photos": []` everywhere.**
* **A `status` field must agree with the record's own prose.** Crypta Balbi is the live case: the
  prose says closed since 9 January 2023 for the URBS project, on Roma Capitale's account of a state
  museum, and **no reopening date may be given because none is stated**.
