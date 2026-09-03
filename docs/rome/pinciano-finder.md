# Pinciano (Q. III, code 203) — FINDER research file

Zone: **Pinciano**, third *quartiere* of Rome, Roma Capitale toponymic code **203**, numeral **Q. III**.
Roster slug `pinciano`. Unit = **quartiere**, NOT a rione.
Researched 2026-09-03. Nothing here is a shipping decision; a verifier adjudicates and an arbitrator
rules ownership across the nine zones in this wave.

---

## 0. HOW I CHECKED WHAT WAS ALREADY TAKEN

`python3 .superpowers/taken_slugs.py` (786 places, 21 shipped rioni) plus targeted searches on
`borghese`, `pincio`, `villa`, `medici`, `pinciana`, `galleria`, and a full dump of the
`campo-marzio`, `ludovisi` and `sallustiano` rows.

**Already owned — struck from this file, do not re-propose:**

| Place | Owner |
|---|---|
| Villa Medici, Accademia di Francia a Roma | campo-marzio |
| Pincio, Terrazza e Passeggiata | campo-marzio |
| Piazzale Napoleone I (Pincio Belvedere) | campo-marzio |
| Obelisco del Pincio (Obelisco di Antinoo) | campo-marzio |
| Busti del Pincio | campo-marzio |
| Statue dei viali del Pincio | campo-marzio |
| Idrocronometro del Pincio (the "Orologio ad acqua" in Villa Borghese's own monument table) | campo-marzio |
| Fontana della Vasca del Pincio | campo-marzio |
| Monumento ai fratelli Cairoli | campo-marzio |
| Monumento a Enrico Toti | campo-marzio |
| Casina Valadier | campo-marzio |
| Convento di Santa Rita al Pincio | campo-marzio |
| Muro Torto | campo-marzio |
| Porta del Popolo | campo-marzio |
| Piazza del Popolo + its four fountains | campo-marzio |
| Palazzo Borghese, Piazza Borghese | campo-marzio |

Six of those (Casina Valadier, the water clock, the Cairoli and Toti monuments, the Pincio busts,
the Pincio obelisk) appear inside **Villa Borghese's own** it.wikipedia buildings/monuments tables.
They are on the Pincio, south of the Aurelian Walls, and Campo Marzio was right to take them. **No
Pinciano record may reuse them.** Villa Borghese's own text is the reason: see §1.

Also relevant: `villa-di-lucullo` is in the it.wikipedia category `Roma Q. III Pinciano`, but its own
article places the horti Luculliani on the Pincio, with the surviving fabric under the Trinità dei
Monti convent, under the Bibliotheca Hertziana and under Palazzo Mediobanca in Piazza di Spagna —
all three of which are Campo Marzio's. **Villa di Lucullo is not a Pinciano candidate.** The
category tag is wrong. https://it.wikipedia.org/wiki/Villa_di_Lucullo

---

## 1. BOUNDARY WORK — how I know what is in Pinciano

### 1.1 The official unit, verbatim

it.wikipedia `Pinciano`, infobox and lead
(https://it.wikipedia.org/wiki/Pinciano — fetched via `action=parse&prop=wikitext`, 2026-09-03):

> `|circoscrizione = [[Municipio Roma II]]`
> `|cap = 00197/00198`
> «**Pinciano** è il terzo quartiere di Roma, indicato con **Q. III**.»
> «Si trova nell'area nord della città, a ridosso delle mura aureliane.»

**Municipio II IS stated for this quartiere**, by name, in the unit's own infobox. It is
independently corroborated by two other sources fetched below (Sovrintendenza Capitolina; OSM /
Nominatim address chain "Pinciano, Municipio Roma II, Roma, Lazio, 00197"). Per the wave brief I
would not have asserted a Municipio without that; here it is sourced three ways.

### 1.2 The four boundaries, verbatim, with the separating street named

Same article, `Il quartiere confina:` with footnotes:

* **North — Q. II Parioli.** «Separato dall'intero viale Maresciallo Pilsudski, dall'intero viale
  dei Parioli e dall'intero viale Liegi fino a via Salaria.»
* **East — Q. IV Salario.** «Separato da via Salaria, nel tratto da viale Regina Margherita a
  piazza Fiume.»
* **South — R. XVI Ludovisi.** «Separato dalle mura (Corso d'Italia), da piazza Fiume a piazzale
  Brasile (Porta Pinciana).»
* **South — R. IV Campo Marzio.** «Separato dalle mura (viale del Muro Torto), da piazzale Brasile
  (Porta Pinciana) a piazzale Flaminio (Porta del Popolo).»
* **West — Q. I Flaminio.** «Separato da via Flaminia, da piazzale Flaminio (Porta del Popolo) a
  viale Maresciallo Pilsudski.»

So the operative rule for the whole southern edge is: **the Aurelian Walls are the line.** North of
the walls = Pinciano. South of the walls (the Pincio) = Campo Marzio.

### 1.3 Villa Borghese's own article says the same thing, verbatim

https://it.wikipedia.org/wiki/Villa_Borghese :

> «Si estende in gran parte sul quartiere **Pinciano** e in piccola parte sul rione **Campo
> Marzio**, divisi dalle **Mura aureliane**, e con 80 ettari è il quinto più grande parco pubblico
> a Roma…»

(The "fifth largest" clause is a ranking — **do not publish it**. The 80 hectares is a measurement
and publishes.)

### 1.4 Roma Capitale (Sovrintendenza Capitolina) states the quartiere outright

https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/ville_dei_nobili/villa_borghese

> «Villa Borghese — **Dove si trova: Municipio II, quartiere Pinciano**
> Epoca: XVII - XX secolo — Estensione: **80 ettari**
> Ingressi: Via Aldrovandi, Via Raimondi (2 ingressi), Via Pinciana (2 ingressi), Piazzale San Paolo
> del Brasile, Piazzale Flaminio, Piazzale Cervantes, Piazzale Pablo Picasso (via di Valle Giulia)»

That is a Roma Capitale organ naming the quartiere for the single biggest subject in the zone. It
also gives the nine gates, which is a publishable, non-impressionistic locator set.

### 1.5 Geometric test — OSM boundary polygons, done properly

Nominatim's `/reverse` endpoint rate-limited me out after eight calls, so I fetched the boundary
**relations themselves** from the OSM API and ran point-in-polygon locally. This is stronger than
reverse geocoding because it tests the actual polygon rather than a nearest-feature guess.

Relations (from Overpass, `rel[name][place~suburb|quarter]`), all carrying the official Roma
Capitale ref in their own tags:

| OSM relation | name | place | ref | official_name |
|---|---|---|---|---|
| 5459658 | Pinciano | suburb | **Q. III** | Quartiere III Pinciano |
| 5459647 | Parioli | suburb | Q. II | Quartiere II Parioli |
| 5459632 | Flaminio | suburb | Q. I | Quartiere I Flaminio |
| 5459659 | Salario | suburb | Q. IV | Quartiere IV Salario |
| 5452743 | Campo Marzio | quarter | R. IV | Rione IV Campo Marzio |
| 5454323 | Ludovisi | quarter | R. XVI | Rione XVI Ludovisi |

Fetched `https://api.openstreetmap.org/api/0.6/relation/<id>/full`, stitched the outer ways into a
ring (Pinciano: single closed ring, 580 vertices), tested with a ray-cast. Pinciano bbox:
**41.90777 / 12.47096 → 41.92980 / 12.49847.**

Results (all coordinates from the it.wikipedia `coordinates` API prop or from OSM object centres):

| Point | tested lat,lon | polygon says |
|---|---|---|
| Galleria Borghese | 41.91421, 12.49214 | **Pinciano Q.III** |
| Bioparco | 41.91747, 12.48519 | **Pinciano Q.III** |
| Villa Giulia / ETRU | 41.91870, 12.47760 | **Pinciano Q.III** |
| GNAM | 41.91639, 12.48167 | **Pinciano Q.III** |
| Museo Pietro Canonica | 41.91511, 12.48629 | **Pinciano Q.III** |
| Museo Carlo Bilotti | 41.91336, 12.48339 | **Pinciano Q.III** |
| Museo Civico di Zoologia | 41.91930, 12.48840 | **Pinciano Q.III** |
| Casa del Cinema | 41.91089, 12.48766 | **Pinciano Q.III** |
| Cinema dei Piccoli | 41.91161, 12.48774 | **Pinciano Q.III** |
| Globe Theatre | 41.91446, 12.48556 | **Pinciano Q.III** |
| Casina di Raffaello | 41.91284, 12.48654 | **Pinciano Q.III** |
| S. Maria Immacolata a Villa Borghese | 41.91291, 12.48650 | **Pinciano Q.III** |
| Basilica di Santa Teresa d'Avila | 41.91146, 12.49489 | **Pinciano Q.III** |
| Basilica di Sant'Eugenio | 41.91849, 12.47474 | **Pinciano Q.III** |
| Basilica del Sacro Cuore Immacolato di Maria | 41.92738, 12.48108 | **Pinciano Q.III** |
| S. Teresa del Bambin Gesù in Panfilo | 41.91846, 12.49346 | **Pinciano Q.III** |
| Santa Maria della Pace ai Parioli | 41.92191, 12.48376 | **Pinciano Q.III** |
| Palazzo Borromeo | 41.91847, 12.47352 | **Pinciano Q.III** |
| Villa Strohl Fern | 41.91375, 12.47725 | **Pinciano Q.III** |
| Villa Giorgina | 41.91612, 12.49592 | **Pinciano Q.III** |
| Mausoleo di Lucilio Peto | 41.91500, 12.49661 | **Pinciano Q.III** |
| Ipogeo di via Livenza | 41.91358, 12.49589 | **Pinciano Q.III** |
| Fonte di Anna Perenna | 41.92747, 12.48023 | **Pinciano Q.III** |
| Villa Balestra | 41.92121, 12.47384 | **Pinciano Q.III** |
| Stazione di Piazza Euclide | 41.92760, 12.48080 | **Pinciano Q.III** |
| Uccelliera / Meridiana | 41.91482, 12.49105 / 41.91524, 12.49039 | **Pinciano Q.III** |
| — control — Pincio Terrazza | 41.91139, 12.47889 | Campo Marzio R.IV |
| — control — Casina Valadier | 41.91167, 12.47806 | Campo Marzio R.IV |
| — control — Porta Pinciana (wiki coord) | 41.90944, 12.48833 | **Ludovisi R.XVI** |

The two Campo Marzio controls come back Campo Marzio, which is the right answer and the shipped
file agrees, so the method is calibrated.

### 1.6 One more Roma Capitale layer, and why I am NOT using it as a locator

it.wikipedia `Villa Borghese (zona di Roma)`: «Villa Borghese è la **zona urbanistica 2X** del
Municipio Roma II… **Si estende sul quartiere Q. III Pinciano**.» It borders zone 2B Parioli, 2D
Salario, 1A Centro Storico, 2C Flaminio.
https://it.wikipedia.org/wiki/Villa_Borghese_(zona_di_Roma)

This is the *zona urbanistica* layer, not the toponymic layer, and it draws Villa Borghese's south
edge differently (against 1A Centro Storico). Per the wave brief the two layers «non hanno alcuna
relazione». **I am using only the toponymic layer.** Recording 2X here so nobody later mistakes it
for a boundary source.

---

## 2. THE STRADDLERS — flagged, NOT resolved by me

### S1. PORTA PINCIANA — Pinciano vs Ludovisi. Genuinely on the line, 4 metres apart.

* Pinciano's own article lists it under `=== Porte nelle Mura aureliane ===`, together with Porta
  del Popolo. https://it.wikipedia.org/wiki/Pinciano
* Pinciano's own boundary footnote makes it the **corner point** of the Ludovisi/Campo Marzio
  hinge: «da piazza Fiume a piazzale Brasile (**Porta Pinciana**)».
* Point-in-polygon, two OSM objects both named Porta Pinciana, both on the gate:
  * node at **41.90947, 12.48838** → **Ludovisi R.XVI**
  * object centre at **41.90947, 12.48843** → **Pinciano Q.III**
  * the it.wikipedia coordinate 41.909444, 12.488333 → **Ludovisi R.XVI**
* **Ludovisi is SHIPPED and did NOT claim it.** `taken_slugs.py pinciana` → 0 matches. Ludovisi's
  ten places are all inside the walls (Cappuccini, Palazzo Margherita, Casino dell'Aurora, Villa
  Maraini, Palazzo Piacentini, four churches).
* Facts if it is awarded to Pinciano: one of the gates of the Aurelian Walls; enlarged from an
  earlier Aurelianic *posterula* by the emperor Honorius during the restoration of **403**, when
  the two semicircular flanking towers were added; the original travertine arch survives; earlier
  names *Porta Turata* (because walled up) and *Porta Salaria Vetus* (the older via Salaria left
  the city here); the medieval "Porta Belisaria" story is a legend, and the article says so.
  https://it.wikipedia.org/wiki/Porta_Pinciana
* **RULING NEEDED.** My reading: the gate is the hinge point between three units and no zone can
  own it on geometry alone. Ludovisi has already declined it by omission.

### S2. THE AURELIAN WALLS between Porta Pinciana and Piazzale Flaminio — Pinciano vs Campo Marzio.

The walls ARE the boundary. Campo Marzio already owns `muro-torto-campo-marzio-rome`. Two OSM
`citywalls` segments in my sweep (41.90971, 12.49038 and 41.91077, 12.49703) test inside Pinciano —
these are the Corso d'Italia stretch, east of Porta Pinciana, i.e. the Pinciano/Ludovisi and
Pinciano/Sallustiano frontage, **not** the Muro Torto. Sovrintendenza's Villa Borghese page:
«Il Parco di Villa Borghese occupa una vasta area nel cuore della città, compresa tra il tratto
delle Mura Aureliane che unisce Porta Pinciana a Piazzale Flaminio, ed i nuovi quartieri Salario e
Pinciano». **RULING NEEDED** on whether any wall stretch may be a Pinciano place at all given
Campo Marzio holds the Muro Torto.

### S3. VIA FLAMINIA FRONTAGE — Pinciano vs Flaminio (a sibling zone in THIS wave, unshipped).

Via Flaminia is the west boundary. The OSM Pinciano ring runs along it, so **everything on the
east/even-numbered side tests inside Pinciano.** Four subjects sit exactly there and I could not
settle any of them:

| Subject | address | OSM polygon | what the subject's own source says |
|---|---|---|---|
| **Chiesa di Sant'Andrea del Vignola** (Sant'Andrea a via Flaminia) | via Flaminia, 41.92123/12.47216 | **Pinciano** | its own article: «una piccola chiesa che si trova a Roma nel quartiere **Flaminio**» — and the wave scope doc records it in Q.I Flaminio's own monument list |
| **Explora — Il Museo dei Bambini di Roma** | «Via Flaminia 82» / footer «Via Flaminia, 80/86 – **00196** Roma» | **Pinciano** | own site gives CAP 00196; Pinciano's CAPs are 00197/00198 |
| **Accademia Filarmonica Romana / Sala Casella** | «Via Flaminia 118 - **00196** Roma» | **Pinciano** | own site CAP 00196; the it.wikipedia photo of its seat is filed `Q01 - via Flaminia` |
| **Fontana di Papa Giulio III** (Ammannati) | junction via Flaminia / via di Villa Giulia, 41.91832/12.47331 | **Pinciano** | Palazzo Borromeo's article: the palace «fu costruito a ridosso, inglobandola, di una preesistente fontana (detta di Papa Giulio III) capolavoro di Bartolomeo Ammannati che ancora si affaccia all'incrocio tra via Flaminia e via di Villa Giulia» |

Sources: https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Andrea_del_Vignola ·
https://www.mdbr.it/ · https://www.filarmonicaromana.org/ ·
https://it.wikipedia.org/wiki/Palazzo_Borromeo_(Roma)

Note the CAP is *not* decisive on its own — Villa Lubin, unambiguously inside Villa Borghese and
inside Pinciano, carries `00196` in its own infobox. But three independent 00196s plus one explicit
"quartiere Flaminio" is enough to stop me. **RULING NEEDED, four subjects, and Flaminio's finder
will have found the same four.** My weak read: Sant'Andrea del Vignola to Flaminio on its own
article's say-so; the other three genuinely unclear.

### S4. CATACOMBA DI SAN VALENTINO — Pinciano vs Parioli.

* Pinciano's own article lists it under `=== Siti archeologici ===`: «Catacomba di San Valentino,
  su **viale Maresciallo Pilsudski**.»
* Viale Maresciallo Pilsudski is **the Pinciano/Parioli boundary street** by Pinciano's own
  footnote («Separato dall'intero viale Maresciallo Pilsudski…»).
* The catacomb's own article: «posta al secondo miglio della via Flaminia, oggi in viale Maresciallo
  Pilsudski, nel moderno quartiere **Parioli**.»
  https://it.wikipedia.org/wiki/Catacomba_di_San_Valentino
* No coordinate is published for it, so I could not run the polygon test.
* **RULING NEEDED.** Two Wikipedia pages disagree, exactly the Castro Pretorio situation.

### S5. MAUSOLEO DI LUCILIO PETO — Pinciano vs Salario.

* Its own article: «Si trova **al confine del quartiere Pinciano**, ma l'ingresso è su via Salaria.»
* Via Salaria is the Pinciano/Salario boundary street.
* Sovrintendenza Capitolina: «Costruita sul **lato sinistro** della Via Salaria a circa 500 metri
  dalle Mura Aureliane». Left side going outward from the city = the west side = the Pinciano side.
* Polygon test at 41.91500/12.49661 → **Pinciano**.
* **Weak straddler; I lean Pinciano** on two agreeing sources, but Salario is not in this wave and
  nobody else will claim it, so the risk is low either way.
  https://it.wikipedia.org/wiki/Mausoleo_di_Lucilio_Peto ·
  https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/mausoleo_di_lucilio_peto

### S6. CORSO D'ITALIA — Pinciano vs Salario (and it fronts Ludovisi/Sallustiano across the walls).

it.wikipedia `Corso d'Italia (Roma)` infobox: `quartiere = Pinciano / Salario`, `cap = 00198`,
runs Porta Pinciana → Porta Pia. Body: «Corso d'Italia si snoda tra due quartieri.»
https://it.wikipedia.org/wiki/Corso_d%27Italia_(Roma)
Neither Ludovisi nor Sallustiano took it. **RULING NEEDED** if anyone proposes the street itself.

### S7. VIA SALARIA and VIA FLAMINIA as streets. Both are boundary streets by definition. Pinciano's
own article lists both under its infrastructure/odonymy. Neither should be a Pinciano place; noting
so the verifier does not have to re-derive it.

### S8. BASILICA DEL SACRO CUORE IMMACOLATO DI MARIA and STAZIONE DI PIAZZA EUCLIDE, piazza Euclide.

Both test cleanly inside Pinciano (41.92738/12.48108 and 41.92760/12.48080) and piazza Euclide is
named in Pinciano's own church list and archaeology list. But piazza Euclide reads as Parioli to
most visitors and sits within ~150 m of the viale dei Parioli line. **Low-risk flag only** —
geometry and Pinciano's own article agree.

### S9. VILLA BALESTRA — name says Parioli, sources say Pinciano. Resolved in the sources.

«Il giardino, che occupa l'estrema propaggine dei Monti Parioli, **pertiene tuttavia al quartiere
Pinciano**, come la via Bartolomeo Ammannati da cui vi si accede.»
https://it.wikipedia.org/wiki/Villa_Balestra — this one is settled by an explicit sentence, and the
polygon agrees. Not really a straddler; flagged because the name misleads.

### S10. CHIESA DI SANTA MARIA DELLA PACE **AI PARIOLI** — same trap, same resolution.

«è una chiesa di Roma, **nel quartiere Pinciano**, in viale Bruno Buozzi», category
`Chiese di Roma - Q.III Pinciano`, coordinate 41.921909/12.483761 → Pinciano.
https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_della_Pace_ai_Parioli

---

## 3. THE VATICAN / EXTRATERRITORIALITY QUESTION IN PINCIANO

Three Holy See–linked properties sit in this quartiere. **None of them is a Lateran Treaty Art. 15
extraterritorial property**, and no page may imply otherwise.

### 3.1 Villa Giorgina — Apostolic Nunciature to Italy. Owned by the Holy See. NOT Art. 15.

* Via Po 27, 41.91612/12.49592 → Pinciano. Infobox: `proprietario = Santa Sede`, `uso = ambasciata`,
  built **1920**, architect **Clemente Busiri Vici**, neoclassical.
* «La villa è sede della **nunziatura apostolica in Italia**. Il parco circostante occupa un'area di
  **20.000 m²** ed è delimitata da un muro di cinta lungo via Po, via Salaria, largo Ponchielli, via
  Peri e via Caccini. **L'edificio non è aperto al pubblico.**»
* Chain of title: built for the industrialist and senator **Isaia Levi**, who named it for his
  daughter; Mussolini considered moving in in 1927 and declined because of the tram noise from via
  Po and via Salaria; Levi, a convert, left it to **Pius XII in 1949**; **John XXIII** moved the
  nunciature's offices there ten years later, from a via Nomentana villa now used by the Libyan
  embassy. Alberto Moravia set *Gli indifferenti* inside it and lived opposite as a child.
  https://it.wikipedia.org/wiki/Villa_Giorgina
* **Critical:** the Lateran annexes list properties as they stood in **1929**. This was bequeathed in
  **1949** and became the nunciature in **1959**. It is a diplomatic mission on Italian soil under
  the ordinary law of missions, not an Art. 15 or Art. 16 property. **A page must not call it
  Vatican territory, extraterritorial, or Art. 15.**
* Status = closed; its own article says the building is not open to the public. Kind: historic-site.
  Honest verdict: **weak for a travel guide** (nothing to visit), strong as context.

### 3.2 Palazzo Borromeo — the **Italian** embassy TO the Holy See. The mirror case.

* Viale delle Belle Arti 2, entrance on via delle Belle Arti, standing on via Flaminia.
  41.91847/12.47352 → Pinciano. Built **1561** to a design by **Pirro Ligorio** for **Pius IV**;
  `proprietario = Stato italiano`.
* Its own article: «Nel **1929** dopo i Patti Lateranensi venne acquistato dallo Stato Italiano per
  farne la nuova **ambasciata d'Italia presso la Santa Sede**, tuttora attiva. Si tratta dell'unico
  caso di una sede diplomatica distaccata sul territorio dello stesso Paese che rappresenta.
  Pertanto è anche l'unica ambasciata al mondo a non godere del privilegio dell'extraterritorialità.»
* **CORPUS TRAP:** «l'unico caso», «l'unica ambasciata al mondo» are superlatives. Attribution does
  not save them. The publishable version is the plain fact: *Italy's embassy to the Holy See has
  stood here since 1929, on Italian soil, a few hundred metres outside the walls.* Say what it is;
  do not rank it.
* Built on Julius III's "vigna vecchia", the same three vineyards that carry Villa Giulia and Villa
  Poniatowski; it swallowed the pre-existing **Fontana di Papa Giulio III by Bartolomeo Ammannati**,
  which still faces the via Flaminia / via di Villa Giulia junction (see S3). Interiors carry stuccos
  and frescoes commissioned by Pius IV and Marcantonio Colonna. Not open to the public.
  https://it.wikipedia.org/wiki/Palazzo_Borromeo_(Roma)

### 3.3 Villa Elia — Portuguese embassy to the Holy See.

Pinciano's own article, `=== Ville e parchi ===`: «Villa Elia, su via di S. Valentino. Sede
dell'Ambasciata del Portogallo presso la Santa Sede.» OSM park polygon 41.92605/12.47801 →
Pinciano. Again: a third-country mission accredited to the Holy See, sitting on Italian soil. Not
extraterritorial in the Lateran sense. Thin — one sentence of sourced fact and no public access.
**Weak.**

---

## 4. CANDIDATES

Numbered. Each carries: what it is, address if sourced, dates/authorship if sourced, status, and a
URL per fact. `kind` uses the thirteen the schema allows (museum, theater, restaurant, cafe,
brewery, hotel, bnb, park, historic-site, amusement-park, shop, stadium, attraction). **Churches are
`historic-site`.**

### 4A — VILLA BORGHESE, THE PARK ITSELF

---

**1. Villa Borghese** — kind `park`

* Roma Capitale, Sovrintendenza Capitolina: «Dove si trova: Municipio II, quartiere Pinciano ·
  Epoca: XVII - XX secolo · **Estensione: 80 ettari** · Ingressi: Via Aldrovandi, Via Raimondi (2
  ingressi), Via Pinciana (2 ingressi), Piazzale San Paolo del Brasile, Piazzale Flaminio, Piazzale
  Cervantes, Piazzale Pablo Picasso (via di Valle Giulia)».
  https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/ville_dei_nobili/villa_borghese
* Foundation: the core was already Borghese property in **1580**; **Cardinal Scipione Borghese**,
  nephew of **Paul V**, began building in **1606**, entrusting the works to **Flaminio Ponzio** and,
  after Ponzio's death, to **Giovanni Vasanzio (Jan van Santen)**, with the gardener Domenico Savini
  da Montepulciano and contributions from **Pietro and Gian Lorenzo Bernini**. «La villa fu
  completata nel 1633.» https://it.wikipedia.org/wiki/Villa_Borghese
* 1766: Prince **Marcantonio IV Borghese** commissioned **Antonio Asprucci** and his son **Mario** to
  remodel the Casino nobile, the Casino dei giuochi d'acqua (today the Aranciera / Museo Carlo
  Bilotti) and above all the park, laying out the **Giardino del lago**. (ibid.)
* Early 19th c.: **Camillo Borghese** bought land toward porta del Popolo and porta Pinciana and had
  **Luigi Canina** knit it in; through the century much of the Italian garden became English
  landscape. (ibid.)
* «Il complesso… fu acquistato dallo Stato italiano nel **1901** e ceduto al comune di Roma nel
  **1903** per essere stabilmente aperto al pubblico… La villa fu acquistata per **3 milioni di lire**
  dell'epoca… e denominata ufficialmente **Villa comunale Umberto I già Borghese**. I romani non
  smisero mai di chiamarla villa Borghese.» (ibid.)
* Gate opening/closing hours — Roma Capitale's tourism board, verbatim: «Il servizio di apertura e
  chiusura è affidato a Risorse per Roma **fino al 31 dicembre 2027** secondo i seguenti orari:
  **06.30–08.30 e 17:00–19:00** periodo novembre–febbraio; **06:30–08:30 e 19:00–21:00** periodo
  marzo–aprile e settembre–ottobre; **06:30–08:30 e 20:00–22:00** periodo maggio–agosto.»
  https://www.turismoroma.it/it/luoghi/villa-borghese
  (The it.wikipedia infobox instead says `apertura = Tutti i giorni dall'alba al tramonto`. Prefer
  the Roma Capitale text; it is the operator's own schedule.)
* Roma Capitale also calls it, in quotes, «**Parco dei Musei**» — that is the Sovrintendenza's own
  nickname for it and is safe as a quoted nickname. The same paragraph contains «una delle più
  ricche» — **superlative, do not publish.**
* Straddle: **§1.3** — the walls divide the Pinciano part from the Campo Marzio (Pincio) part.
  Campo Marzio owns the Pincio furniture. A Pinciano Villa Borghese record must be written so it
  does not annex the Pincio.
* Photo note for the later wave: nothing here is in architectural copyright.

---

**2. Villa Borghese Pinciana — the Casino Nobile** — kind `historic-site` (probably merge into #3)

The 1606–1633 house itself, «costruita dall'architetto Flaminio Ponzio, che sviluppò gli schizzi di
Scipione Borghese. Alla morte di Ponzio, i lavori furono terminati dal fiammingo Giovanni Vasanzio.»
Façade originally set with **144 bas-reliefs and 70 busts**; **Lodovico Cigoli** frescoed a Story of
Psyche; the many windows and the room sequence were laid out to show the works well.
https://it.wikipedia.org/wiki/Galleria_Borghese · https://it.wikipedia.org/wiki/Villa_Borghese
Separate it.wikipedia article exists: https://it.wikipedia.org/wiki/Villa_Borghese_Pinciana
**Recommendation: fold into the Galleria Borghese record rather than ship twice.**

---

**3. Galleria Borghese** — kind `museum` — the anchor of the zone

* **Piazzale Scipione Borghese 5, 00197 Roma.** Tel +39 06 8413979. Official site footer:
  https://www.galleriaborghese.it/ (the `.beniculturali.it` host OSM records **does not resolve**
  from this network; the working official domain is `galleriaborghese.it`, and it is the one to
  cite). Wikipedia infobox gives the address as «Piazzale del Museo Borghese, 5» — same place,
  different street-name form; prefer the museum's own footer.
* «La galleria Borghese è un museo statale italiano, con sede nella villa Borghese Pinciana a Roma.
  Ospita tuttora gran parte della collezione d'arte iniziata da Scipione Borghese, cardinal nipote di
  papa Paolo V.» https://it.wikipedia.org/wiki/Galleria_Borghese
* Artists named by the article: **Bernini, Bronzino, Canova, Caravaggio, Raffaello, Perugino, Lorenzo
  Lotto, Antonello da Messina, Cranach, Annibale Carracci, Rubens, Bellini, Tiziano.** Named works:
  Bernini's *David* and *Apollo e Dafne*, Canova's *Paolina Borghese come Venere Vittoriosa* (Sala I,
  the Sala della Paolina). (ibid.)
* **DANGER, ibid.:** «Si può considerare unica al mondo per quel che riguarda il numero e
  l'importanza delle sculture del Bernini e delle tele del Caravaggio.» — banned superlative. Also
  banned: the article's «l'affare del secolo» framing of the 1902 purchase and «il nono sito statale
  italiano più visitato». A **count** is fine: state the number of Bernini sculptures if a source
  gives one; do not rank.
* Dates: **1891** the Palazzo Borghese picture gallery in via Ripetta moved up to the piano nobile;
  **1902** the Italian state acquired the *Fidecommisso Borghese* collections and the villa became a
  museum; first director **Giovanni Piancastelli** (1845–1926), succeeded **1906** by **Giulio
  Cantalamessa**. Closed **1983**, reopened **June 1997** after a fourteen-year restoration.
  Since 2014 one of the state museums with *autonomia speciale*. Director **Francesca Cappelletti**
  since November 2020. (ibid.)
* Visitors: **590,891 in 2023** (it.wikipedia infobox `Visitatori`/`Anno visitatori`). A count, not
  a ranking — publishable with the year attached.
* **Hours: I could not obtain them.** `galleriaborghese.it` is a single-page JS shell: every path
  (`/en/visit/`, `/visita/info-biglietti/`) returns the identical HTML with no hours in it. The
  address, phone and booking number are in the server-rendered footer and are safe. **The page must
  say nothing about opening hours** — per the corpus rule, write "No source states its opening hours,
  so none are given here", never anything about fetching. Timed entry is real (the site's own
  standing banner warns about unauthorised resellers and gives a booking line, +39 06 32810) but I
  would only state what the footer states.

---

**4. Galleria nazionale d'arte moderna e contemporanea (GNAM / La Galleria Nazionale)** — `museum`

Everything below from the museum's own site, https://lagallerianazionale.com/en/visit/ :

* **viale delle Belle Arti, 131 — 00197 Roma.** T +39 06 322981.
* **Opening: Tuesday to Sunday, 8.30am – 7.30pm; last admission 45 minutes before closing; closed
  every Monday, 1 January and 25 December.**
* **Tickets: full € 10.00; reduced € 5.00** (EU citizens 18–25; teachers of EU state schools). Free
  under 18, journalists with a valid card, tourist guides, ICOM members, MiC staff, and the first
  Sunday of the month (#domenicalmuseo). Reduced for holders of a MAXXI or MuCiv ticket. Audioguide
  Italian and English € 5.00.
* Its own accessibility statement: lifts, lift platforms and two wheelchairs available, including
  for independent use.
* Its own visitor rules include «it is possible to take photographs without flash and amateur
  videos» — **useful for the photo wave, and a rare explicit permission. Record it; do not act on it
  in this wave.**
* Transport, from the same page: metro Line A – Flaminio (about 600 m); trams 3 and 19 on viale
  delle Belle Arti; buses 61, 89, 160, 490, 495, M at piazzale del Fiocco; Roma–Viterbo line,
  Flaminio station.
* Building: erected for the **1911 Esposizione nazionale** to a design by **Cesare Bazzani**, in the
  Valle Giulia laid out for that exhibition. https://it.wikipedia.org/wiki/Valle_Giulia and
  https://it.wikipedia.org/wiki/Villa_Borghese
* Photo note: Bazzani died 1947 — building out of architectural copyright; **the modern and
  contemporary works inside are not.** Highest-risk interior class in the zone.

---

**5. Museo nazionale etrusco di Villa Giulia (ETRU)** — `museum`

Official site https://www.museoetru.it/ , server-rendered, all of this verbatim from the home page:

* **Villa Giulia — Piazzale di Villa Giulia, 9.**
* **Opening hours: «Martedì - domenica 08.30 - 19.30 (chiusura sale ore 19.00) (ultimo ingresso ore
  18.30)».**
* **Tickets: «intero 13 € · ridotto 2 €».**
* Free first Sunday of the month («6 settembre 2026 ingresso gratuito per la prima domenica del
  mese»).
* Current on-site notices worth knowing but too perishable to publish: the Tomba François has been
  visible to the public since 1 July alongside the exhibition *Il Ritorno degli Eroi*; the Sarcophagus
  of the Spouses is back in its case with restoration continuing, viewable in the laboratory Tuesdays
  and Thursdays 10–13.
* From it.wikipedia https://it.wikipedia.org/wiki/Museo_nazionale_etrusco_di_Villa_Giulia :
  a state museum for **Etruscan and Faliscan** antiquities of Lazio, southern Etruria and Umbria,
  **founded 1889** by **Felice Barnabei**; housed in **Julius III's** villa, built as a suburban
  residence **1551–1553** to designs by **Vignola**, **Giorgio Vasari** and **Bartolomeo Ammannati**;
  since 2016 one of the museums with *autonomia speciale*; **80,266 visitors in 2023**; director
  **Luana Toniolo** from 16 May 2024. In **2012** it opened rooms in the neighbouring **Villa
  Poniatowski**. It is the historic venue of the **Premio Strega** final.
* Named holdings: the **Sarcofago degli Sposi**, the **Lamine di Pyrgi**, the **Apollo di Veio**, the
  remains and reconstruction of the Etruscan temple of **Alatri**, the **Pyrgi** high relief with the
  Seven against Thebes, the **Barberini, Castellani and Pesciotti** collections, the **Cista
  Ficoroni**, the **Olpe Chigi**. (ibid.)
* **DANGER:** the article calls the Sarcofago degli Sposi «l'opera più famosa» — banned. Say it is a
  terracotta funerary monument showing a near life-size couple reclining at a banquet, and stop.

---

**6. Villa Giulia (the building)** — `historic-site`

Separate it.wikipedia article: https://it.wikipedia.org/wiki/Villa_Giulia — the 1551–1555 suburban
villa of Julius III, Vignola/Vasari/Ammannati. Villa Borghese's own article notes it is «Contigua a
villa Borghese, ma oggi fuori dal perimetro vero e proprio del parco, ai piedi del colle».
**Recommendation: fold into #5 unless the verifier wants the architecture as its own record.**

---

**7. Villa Poniatowski** — `historic-site` / museum annex

* **Via di Villa Giulia, 34.** Second seat of the Museo nazionale etrusco; holds Etrusco-Italic
  material from *Latium vetus* and Umbria, including parts of the grave goods of the **Barberini**
  and **Bernardini** tombs of Palestrina and remains of the temple of Mater Matuta at **Satricum**.
* Land bought by Cardinal **Pierdonato Cesi** around **1570**; **Montaigne** described it in 1581;
  Borromeo property by a Venturini engraving of 1683; Cesi → Sinibaldi 1702 (Vasi engraving, 1757)
  → Candelori 1798; then Prince **Stanisław Poniatowski**, who had **Giuseppe Valadier** rebuild the
  16th-c. casino and the terraced Italian garden. Badly damaged in the 1849 fighting between
  Garibaldini and French troops; the Riganti family put a tannery in the garden after 1870.
  **Bought by the Italian state in 1988**, recovery works by the Soprintendenza in 1998 for the 2000
  Jubilee, **museum seat inaugurated 2012.**
  https://it.wikipedia.org/wiki/Villa_Poniatowski
* Access is via ETRU; opening is not separately stated on museoetru.it's home page. Do not invent one.

---

**8. Bioparco di Roma (the Giardino zoologico)** — `attraction` (schema has no zoo kind; `park` also
defensible — verifier's call)

From the Bioparco's own site:

* **«Il Bioparco, il Giardino Zoologico di Roma, si trova in Piazzale del Giardino Zoologico n. 1».**
  Administrative address in the same site's footer: **Viale del Giardino Zoologico, 20, 00197 Roma.**
  https://www.bioparco.it/bioparco-roma-come-arrivare/
* **Hours (2026), verbatim:** 1 January – 28 March **09.30–17.00**; 29 March – 24 October
  **09.30–18.00**; 25 October – 31 December **09.30–17.00**; extended hours 29 March – 4 October
  **09.30–19.00 Saturdays, Sundays and public holidays only**. «Chiusura biglietterie e ultimo
  ingresso consentito 1h prima dell'orario di chiusura del parco. **Il parco è aperto tutti i giorni
  dell'anno tranne il 25 dicembre.**» https://www.bioparco.it/biglietti-bioparco/
* **Tariffs (box office):** intero a data fissa **€ 19,00**; ridotto **€ 14,00** (children over 1 m
  tall up to 10 years; over-65s — €9 on Wednesdays for over-65s only); groups of 15+ in free visit
  **€ 14,00**; disabled visitors with recognised invalidity below 100% **€ 11,00**; free for children
  under 1 m and for visitors with 100% recognised invalidity plus one companion. (ibid.)
* Transport, own site: tram 19, stop 'Bioparco'; buses 3, 52, 53, 926, 217, 360 and 910 (910 stops at
  the entrance only on Saturdays, Sundays and holidays); metro line A, Flaminio and Spagna.
* Scale, from it.wikipedia: «ospita circa **1200 animali** di circa **150 specie** diverse tra
  mammiferi, rettili e uccelli su una superficie complessiva di circa **155 480 m²**»; **552,468
  visitors in 2022**; run by the Fondazione Bioparco di Roma, controlled by Roma Capitale; located
  «nella **porzione settentrionale** di villa Borghese». https://it.wikipedia.org/wiki/Bioparco_di_Roma
* History: Rome's council resolved to create a zoological garden inside Villa Umberto I in **1907**;
  the Società anonima italiana per l'impianto e l'esercizio del Giardino Zoologico di Roma was formed
  **1909**, chaired first by Baron Giorgio Sonnino then by Prince Francesco Chigi, on ground between
  via delle Tre Madonne and the land of Villa Taverna; it engaged **Carl Hagenbeck**, whose Hamburg
  Tierpark had introduced barless enclosures modelled on habitat. Contract of **8 May 1909**: 45
  years' use, after which the buildings passed to the comune. Hagenbeck presented his scheme at the
  **Hotel Excelsior on 12 November 1908** — about **12 hectares**, with a large restaurant. Interiors
  of the enclosures by Moritz Lehmann (decoration) and Ernest Eggenschwiler (rockwork); planting by
  **Giuseppe Roda**; the monumental entrance by **Giulio Barluzzi** with **Armando Brasini**. Opened
  1911. Renamed Bioparco at the end of the 20th century. (ibid.)
* **DANGER, twice over:** the Bioparco's own page title reads «visita nel giardino zoologico **più
  antico d'Italia**» and it.wikipedia repeats «Si tratta del più antico giardino zoologico d'Italia».
  **Banned superlative, attributed or not.** The publishable version is the sequence: the council
  resolved on it in 1907, the company formed in 1909, the garden opened in 1911.
* Villa Borghese's own article notes the **Portale dei vasi** was moved from Porta Pinciana to the
  zoo entrance in 1914 — see #38.

---

**9. Museo Civico di Zoologia** — `museum`

* **Via Ulisse Aldrovandi, 18 — 00197 Roma.** **09:00 – 19:00. Closed Mondays.**
  https://www.museodizoologia.it/it/informazioni-pratiche
* Part of the Sistema Musei di Roma Capitale, listed among the *Musei scientifici*.
  https://www.sovraintendenzaroma.it/i_luoghi/musei/musei_scientifici2
* Named holdings from its own site: the **Collezione Monterosato** (shells of the Marchese Di Maria),
  the **Collezione Arrigoni degli Oddi** (ornithology), the *Sala degli scheletri*, the standing
  exhibition *Vivere al limite*, and **ZooLab**.
* it.wikipedia: https://it.wikipedia.org/wiki/Museo_civico_di_zoologia_di_Roma . Physically adjoins
  the Bioparco — the two share a boundary, so "adjoin" is a permitted locator.

---

**10. Museo Pietro Canonica a Villa Borghese (la Fortezzuola)** — `museum`

All verbatim from the museum's own Roma Capitale site:

* **Viale Pietro Canonica (Piazza di Siena) 2 — 00197 Roma.** Call centre 060608, daily 09.00–19.00.
* **Winter hours** (last Sunday of October to last Saturday of March): **Tuesday to Sunday
  10.00–16.00**, last admission 15.15 — an hour earlier if the visit includes the private apartment
  on the first floor and the Villa Borghese sculpture-store gallery. 24 and 31 December 10.00–14.00;
  1 January 2026, 11.00–16.00.
* **Summer hours** (last Sunday of March to last Saturday of October): **Tuesday to Friday
  10.00–16.00; Saturday and Sunday 10.00–19.00**, last admission 45 minutes before closing (an hour
  earlier for the apartment and store).
* **Closed Mondays, 1 May and 25 December.**
* «L'Appartamento privato e il Deposito delle Sculture di Villa Borghese sono sempre visitabili negli
  orari di apertura del Museo, accompagnati dal personale di sala.»
  https://www.museocanonica.it/it/informazioni_pratiche/orari_e_indirizzi
* **Tickets** (shared civic-museum tariff page): intero **€ 7,50**, ridotto **€ 6,00**; with
  exhibition, intero **€ 11,00**, ridotto **€ 7,50**; presale right € 1,00 online, none at the desk.
  The **MIC card** (€ 5) gives twelve months' free entry across the Sistema Musei di Roma Capitale.
  https://www.museocanonica.it/it/informazioni_pratiche/biglietti
* The building: «Indicata dai documenti seicenteschi come "**Gallinaro**", dove venivano allevati
  struzzi, pavoni e anatre per le battute di caccia della famiglia Borghese. L'attuale denominazione
  deriva dalla caratteristica **cinta turrita di stampo medievale** che risale a un intervento di
  fine Settecento, attribuito ad **Antonio Asprucci**. … **Felice Giani** decorò la facciata con
  **otto teste di Cariatidi** sopra porte e finestre, nel **1793**. Nel **1919**, utilizzato per
  uffici amministrativi, l'edificio subì un incendio che ne decretò l'abbandono. Nel **1926** fu
  ceduto in uso allo scultore **Pietro Canonica**, che provvide alla sistemazione del fabbricato e
  alla trasformazione delle stalle ad uso espositivo. Dopo la sua morte (**1959**) la raccolta delle
  sue opere ha costituito il primo nucleo del Museo… La moglie, scomparsa nel **1987**, volle donare
  al Comune di Roma anche gli arredi di pregio dell'appartamento da loro abitato.»
  https://www.museocanonica.it/it/sede/la_fortezzuola
* In the courtyard: a 15th-century octagonal **vera da pozzo** bearing Cardinal Rangoni's arms,
  originally from one of the demolished cloisters of **Santa Maria in Aracoeli**, moved here in 1960;
  and a white-marble mascaron fountain on the east wall.
  https://it.wikipedia.org/wiki/Villa_Borghese

---

**11. Museo Carlo Bilotti — Aranciera di Villa Borghese** — `museum`

* **Via Fiorello La Guardia, 6 and Viale dell'Aranciera 4 — 00197 Roma.** Email
  info@museocarlobilotti.it, call centre 060608.
* **Tuesday to Friday 10.00–16.00; Saturday and Sunday 10.00–19.00**; last admission 45 minutes
  before closing; 24 and 31 December 10.00–14.00; 1 January 2026, 11.00–16.00. **Closed Mondays,
  25 December, 1 May.** https://www.museocarlobilotti.it/it/informazioni_pratiche/orari_e_indirizzi
* Tickets as #10. https://www.museocarlobilotti.it/it/informazioni_pratiche/biglietti
* The building is the **Aranciera**, the Casino dei giuochi d'acqua remodelled for Marcantonio IV
  Borghese by Antonio Asprucci from 1766. https://it.wikipedia.org/wiki/Villa_Borghese
* Collection, from its own site: works by **Giorgio de Chirico** (*Cavalli in riva al mare*,
  *Archeologi misteriosi*, *Autoritratto con testa di Minerva*, *Donna bionda di spalle*, *Cavaliere
  antico*, *Cavallo*), **Andy Warhol** (*Madre e figlia: Tina e Lisa Bilotti*), **Larry Rivers**
  (*Carlo con Dubuffet sullo sfondo*), **Gino Severini**, **Giacomo Manzù**.
  https://www.museocarlobilotti.it/
* In the atrium and to the left of the building, two 17th-century features: a rustic nymphaeum with a
  sarcophagus and a tufa rockwork fountain, both at Piazzale Victor Hugo.
  https://it.wikipedia.org/wiki/Villa_Borghese
* **Photo note:** de Chirico died 1978, Warhol 1987, Rivers 2002 — the collection is deep in
  copyright. Interior photography is a reject.

---

**12. Casa del Cinema (Casina delle Rose)** — `theater` (a cinema/cultural venue)

* **Largo Marcello Mastroianni 1, Roma.** https://www.casadelcinema.it/
* it.wikipedia: «La Casa del Cinema si trova a Roma, in largo Marcello Mastroianni 1, all'interno di
  Villa Borghese.» Conceived by the journalist **Felice Laudadio**; the **Casina delle Rose**, comune
  property and derelict for 25 years, was identified in **September 2001**; restored for **€7
  million** and **inaugurated by mayor Walter Veltroni on 18 September 2004**. Directors: Laudadio to
  2011, **Caterina D'Amico** 2011–2014, **Giorgio Gosetti** 2014–2022. Management passed from Azienda
  Speciale Palaexpo to Zètema in February 2011 and to the **Fondazione Cinema per Roma** in February
  2023; after restyling it **reopened on 5 May 2023**; editorial line curated by **Paola Malanga**.
  Facilities: three screening/conference rooms, an open-air theatre for digital projection and live
  performance, two exhibition rooms, a networking space, a cafeteria and a restaurant.
  https://it.wikipedia.org/wiki/Casa_del_cinema
* **DANGER:** the same article says it is «a pochi metri da via Veneto» — that is orientation by
  impression and a distance the article does not source. Drop it.
* Its outdoor arena is separately named in OSM as **Teatro all'aperto Ettore Scola**
  (41.91121/12.48731 → Pinciano). Probably a sub-feature of #12, not its own record.

---

**13. Cinema dei Piccoli** — `theater`

* **Own site, footer: «Viale della Pineta, 15 – 00197 Roma – Italia».** Ticket **€ 3,50**.
  https://www.cinemadeipiccoli.com/ — **note the domain is `.com`, not `.it`; `cinemadeipiccoli.it`
  timed out and should not be cited.**
* it.wikipedia's infobox instead gives «Largo Marcello Mastroianni, 15». **Discrepancy — the
  operator's own footer should win.** https://it.wikipedia.org/wiki/Cinema_dei_Piccoli
* Measurements and counts (publishable): **71.52 m²**, **63 seats**; screen 5 m × 2.5 m and DTS
  stereo installed in the **1991** refit; a Sony 4K projector in **2013**; a Barco SP 2K-7 laser
  projector in **2021**. (ibid.)
* History: built by **Alfredo Annibali in 1934** as "**Casa di Topolino**", with a Mickey Mouse
  holding a cine-camera beside the sign until Disney forced the name off (the image stayed to the
  1970s); shut during the war and reopened straight after; programming passed at the end of the
  1970s to **Enzo Fiorenza**, founder of AIACE, who opened it to *cinema d'essai*; in **1978** AIACE
  gave it to **Fulvio Wetzl** and Titta Labonìa, who founded the Piccolo Officine cineclub and
  premiered Wenders's *Falso movimento* in Italy; run from **1980** by Roberto Fiorenza and Caterina
  Roverso; **1993–95** it ran a schools programme with the Cineteca Nazionale; the **Dei Piccoli
  Film Festival** began in **2007** with Regione Lazio support. (ibid.)
* **DANGER:** it.wikipedia and Villa Borghese's article both call it «la sala cinematografica più
  piccola del mondo» and cite the 2005 **Guinness** entry ("edificio più piccolo del mondo adibito a
  spettacoli cinematografici") and a 2006 FICE prize. **The superlative is banned in any form.** The
  measurement and the seat count carry the same information and are welcome. **The Guinness entry is
  a judgement call I am escalating: it is a ranking in a commercial record book, not a position in
  an official series like a toponymic code. My read is that it should NOT publish.** The FICE prize
  is an award and is out under the operator-site rule by analogy.

---

**14. Gigi Proietti Globe Theatre Silvano Toti** — `theater` — **STATUS UNRESOLVED, see below**

* **Largo Aqua Felix**, inside Villa Borghese, near Piazza di Siena. 41.91446/12.48556 → Pinciano.
* Measurements and counts, all from it.wikipedia
  https://it.wikipedia.org/wiki/Gigi_Proietti_Globe_Theatre : total capacity **1206**; the standing
  pit holds up to **415**; boxes on **three levels** linked by walkways; height **10 m**, internal
  diameter **23 m**, external diameter **33 m**, external circumference **100 m**; built entirely in
  oak from managed and replanted forest; floor of dry-laid tufa blocks; copper-shingle roof.
* Built in **2003**, in three months, inside the Villa Borghese gardens in the year the park marked
  a century as a public park; realised by the comune from an idea of **Gigi Proietti** and financed
  by the **Fondazione Silvano Toti**. Opened in **2003** with *Romeo e Giulietta* directed by
  Proietti, who was artistic director for seventeen years until his death in 2020. On **3 November
  2020** mayor Virginia Raggi and the foundation announced it would also carry Proietti's name.
  **Nicola Piovani** artistic director from summer **2022**. In **2020** the *Archivio "Gigi Proietti
  Globe Theatre"* opened with Roma Tre's foreign-languages department; catalogue at
  https://bacheca.uniroma3.it/archivio-globe/
* **On the morning of 22 September 2022**, at the end of a morning performance of *Macbeth*, the
  stair of the theatre's outermost ring collapsed; **twelve people were injured**, five adults and
  seven young people aged 15–19, mostly pupils of the Liceo Saffo of Roseto degli Abruzzi on a school
  trip. The theatre was **sequestered** for the investigation and repairs. The **2023** season, the
  institution's twentieth, was held in a temporary **860-seat** *Arena Gigi Proietti Globe Theatre
  Silvano Toti* adjacent to the original. (ibid.)
* **STATUS PROBLEM.** The it.wikipedia article carries nothing after the 2023 arena season. OSM still
  records `website=https://www.globetheatreroma.com/`, and **that domain now serves unrelated
  Indonesian gambling content** — it is not the theatre's site any more and must not be cited or
  linked. `globetheatreroma.it` and `fondazionesilvanototi.it` do not resolve. The Sovrintendenza's
  Villa Borghese page still describes it in the present tense: «In prossimità di Piazza di Siena, è
  stato allestito un ampio padiglione teatrale a pianta circolare, il Globe Theater, su modello dei
  teatri elisabettiani, associato alla programmazione shakespeariana.»
  https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/ville_dei_nobili/villa_borghese
* **RULING NEEDED on the `status` field.** A `closed` is an affirmative claim and I have no source
  for it in 2026. A `open` is the schema default and the prose can honestly say the theatre stages
  a summer Shakespeare season, that the outer ring's stair collapsed in September 2022 injuring
  twelve, and that the 2023 season played in an adjacent temporary arena — and then stop. **Do not
  write "no longer operating".**

---

**15. Casina di Raffaello** — `attraction` (children's playroom)

* Own site: **«Viale della Casina di Raffaello, 19, 00197 Roma RM»**; **hours 1 September – 31
  October 2026: Tuesday to Friday 10.00–18.00; Saturday, Sunday and holidays 10.00–19.00; Monday
  closed.** https://www.casinadiraffaello.it/
* Roma Capitale's tourism board gives the full seasonal calendar and the age range: winter
  (November–February) Tue–Fri 10:00–15:30, Sat/Sun/holidays 10:00–18:00; spring–autumn (March–May to
  8 June; 15 September–October) Tue–Fri, Sat/Sun/holidays 10:00–19:00; summer (5 June–30 August)
  Mon–Fri 08:30–17:30, Sat 10:00–15:00; closed Mondays; reduced 10.00–14.00 on 24 and 31 December;
  closed Easter Monday, 1 May, 25 December. «La ludoteca di Villa Borghese dedicata a tutti i bambini
  **dai 3 ai 14 anni**.» https://www.turismoroma.it/it/luoghi/casina-di-raffaello
* The name misleads and the sources say so: «Il nome con cui si conosce il palazzo è fuorviante, in
  quanto non si riferisce a Raffaello Sanzio, che non progettò l'edificio né vi abitò né vi ebbe mai
  a che fare, e si confonde invece con il Casino di Raffaello che si trovava a Villa Doria nel
  Galoppatoio.» https://it.wikipedia.org/wiki/Casina_di_Raffaello
* Built in the **17th century** for Cardinal **Scipione Borghese** at the same time as the Villa
  Pinciana; it stood in a mulberry grove, felled when Piazza di Siena was made, whence its first
  name «Palazzina dell'arboreto de' gelsi». Originally the villa wardrobe-keeper's lodging, with two
  loggias, one chiaroscuro-decorated; one side faced a small square garden with an orchard and citrus
  grove, replaced in the 18th century under the Asprucci by a church dedicated to the Immaculate
  Conception (#16). It stayed a private residence until **2003**. The Sovraintendenza Comunale's
  restoration reinstated the 18th-century spatial arrangement given it by **Antonio Asprucci**; the
  ground-floor principal room carries **frescoes by Felice Giani**. (ibid.)

---

**16. Chiesa di Santa Maria Immacolata a Villa Borghese** — `historic-site`

* «nel quartiere Pinciano, in **Piazza di Siena**», 41.912907/12.4865 → Pinciano. Built at the end of
  the **18th century** for Prince **Marcantonio Borghese**, who had a farmworkers' *casale* on his
  land converted into a church, the work entrusted to **Mario Asprucci**; **frescoes by Felice Giani,
  1791–1793**; further work and **frescoes by Pietro Carrarini in 1829**; characteristic portico with
  **four Doric columns**. It is set inside the Casina di Raffaello (#15) and is a subsidiary place of
  worship of the parish of Santa Teresa d'Avila (#28). Church's own site given by Wikipedia:
  http://www.immacolatavillaborghese.it/ (not fetched).
  https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Immacolata_a_Villa_Borghese
* Start date discrepancy: the infobox says `InizioCostr = 1792`, the body «fine del XVIII secolo» with
  frescoes from 1791. Use the fresco dates, which are the firmer ones.

---

**17. Piazza di Siena** — `historic-site`

* «una vasta area, non aperta al traffico veicolare, che si trova a Roma, all'interno di villa
  Borghese. Deve il suo nome a **Siena**, luogo originario della famiglia Borghese.» Created at the
  end of the 18th century at the wish of Prince **Marcantonio IV (1730–1800)**, who asked for a space
  inside the villa recalling **piazza del Campo**; finished after his death and given over to public
  entertainments. https://it.wikipedia.org/wiki/Piazza_di_Siena
* Villa Borghese's own monument table dates it **1792**, «Tra Viale Pietro Canonica e Viale dei
  Pupazzi». https://it.wikipedia.org/wiki/Villa_Borghese
* Sport: it hosted the **1907, 1908 and 1909** Italian athletics championships on a **370.30 m**
  track; from **1922** it became the home of an equestrian competition, **international from 1926**,
  now the **Concorso ippico internazionale "Piazza di Siena"**; and in **1960** it staged the
  individual jumping, individual dressage, individual and team eventing of the **XVII Olympiad**, for
  which temporary stands for **15,000** spectators were installed. Concerts: Claudio Baglioni's
  *Alé-oó* closing show in **1982**; Renato Zero's eight *Sei Zero* concerts, 29 September – 9 October
  **2010**. (ibid.)
* Villa Borghese's own article: the Concorso ippico «giunto nel **2023** alla **90ª edizione**» — a
  position in a numbered series, which the brief explicitly allows.
  https://it.wikipedia.org/wiki/Villa_Borghese
* `piazzadisiena.it` resolves but returned HTTP 503 on the day; do not cite it unless it comes back.

---

**18. Giardino del Lago** — `park` (or `historic-site`)

* Laid out **1786** by **Antonio Asprucci** for Marcantonio IV Borghese; at its centre an artificial
  islet carrying the **Tempietto di Esculapio**, reachable by short boat trips.
  https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/ville_dei_nobili/villa_borghese
* Roma Capitale's tourism page: «il **Giardino del lago**, dove è possibile **noleggiare delle
  barchette** e ammirare, al centro dello specchio d'acqua, il Tempietto dedicato ad Esculapio e,
  lungo le sponde, la **Meridiana** e la **Fontana della Famiglia dei Satiri**.»
  https://www.turismoroma.it/it/luoghi/villa-borghese
* Within it, from Villa Borghese's own fountain table: two circular-basin fountains and a rustic
  circular fountain (20th c.); four fountains with semicircular basins and the **Fontana dei
  Mascheroni e Tritoni** (1909), reusing sculpture brought from **Piazza Navona**; a rustic lake of
  **1791**; a niche fountain of **1620**; and **Fonte Gaia** (also Fonte dei Satiri / dei Conigli),
  **1929**, a bronze group of two satyrs holding a young satyr at the centre of the lake. The
  planting list runs to trachycarpus, chamaerops, phoenix, erythea, stone pine, cypress, deodar,
  Lawson cypress, araucaria, atlas cedar, swamp cypress, cedar of Lebanon, cycas, bamboo,
  cryptomeria, lagerstroemia, paulownia, bitter orange, camphor, eucalyptus, magnolia. Fauna recorded
  includes peregrine falcon, kestrel, black kite, hooded crow, jackdaw, cormorant, moorhen, mallard,
  gadwall, and in the water largemouth bass, pumpkinseed and carp.
  https://it.wikipedia.org/wiki/Villa_Borghese

---

**19. Tempio di Esculapio** — `historic-site`. Ionic tempietto, **1786**, in the Giardino del lago.
https://it.wikipedia.org/wiki/Tempio_di_Esculapio_(Villa_Borghese) ·
https://it.wikipedia.org/wiki/Pinciano (Pinciano's own list: «Tempietto in stile ionico del XVIII
secolo (1786)»). OSM `artwork` node "Esculapio" 41.91498/12.48291 → Pinciano.

**20. Tempio di Diana** — `historic-site`. Monopteral tempietto, **1789**, Viale della Casina di
Raffaello. https://it.wikipedia.org/wiki/Tempio_di_Diana_(Villa_Borghese) · Pinciano's own list ·
Villa Borghese's monument table.

**21. Tempio di Antonino e Faustina** — `historic-site`. **1792**, Viale di Antonino e Faustina;
«Fu progettato da **Cristoforo Unterperger** su commissione di Marcantonio Borghese. È stato
realizzato mediante delle rovine antiche atte a rappresentare un rudere secondo una moda inglese. Ai
due lati vi sono due altari con delle iscrizioni in greco.»
https://it.wikipedia.org/wiki/Villa_Borghese · OSM `ruins` 41.91527/12.48726 → Pinciano.

**22. Arco di Settimio Severo (Villa Borghese)** — `historic-site`. Largo Santander, at the entrance
to the Giardino del Lago; «Fu progettato da **Luigi Canina** in stile romano. In cima Canina vi pose
una statua dell'imperatore Settimio Severo.» ibid. · OSM `archaeological_site` 41.91461/12.48197 →
Pinciano. (Note the OSM tag is wrong — it is an early-19th-c. folly, not an archaeological site.
Say so plainly rather than repeat the tag.)

**23. Propilei Egizi** — `historic-site`. **1825**, Viale Fiorello La Guardia; «Furono costruiti da
Luigi Canina in stile egiziano. Univano i giardini del Muro Torto con il viale ove vennero posti i
propilei.» ibid. · OSM 41.91362/12.48153 → Pinciano.

**24. Portico dei Leoni** — `historic-site`. Viale Fiorello La Guardia; «Fu iniziato da Antonio
Asprucci e terminato da **Luigi Canina** secondo le mode dell'epoca», late 18th to early 19th c.
ibid. · OSM 41.91304/12.48417 → Pinciano.

**25. Prospettiva del Teatro** — `historic-site`. Viale Fiorello La Guardia; «Anticamente era posta
tra i giardini e la parte rustica. La facciata è vivacemente decorata.» ibid. Thin.

**26. Grotta dei Vini** — `historic-site`. 17th c., at the via Pinciana entrance; «Venne realizzata
su disegno di **Flaminio Ponzio**. Fu utilizzata per organizzare feste, banchetti e cantina. Nella
volta vi sono degli affreschi posti tra decorazioni in stucco con temi mitologici pagani disegnati da
**Archita Ricci**.» ibid.

**27. Serbatoio dell'Acqua Marcia** — `historic-site`. **1922–1925**, Parco dei Daini; designed by
**Raffaele De Vico** in a baroque manner; served the neighbouring quartieri. ibid.

---

### 4B — VILLA BORGHESE: THE HISTORIC CASINI, GARDENS AND GATES

**28. Casino dell'Uccelliera** and **29. Casino della Meridiana**, with the **Giardini Segreti**
— `historic-site`

Sovrintendenza Capitolina: «Villa Borghese ospita numerosi edifici storici coevi, quali il Casino del
Graziano, il Casino Giustiniani, l'**Uccelliera** e la **Meridiana** con i meravigliosi giardini
segreti, **ripristinati secondo l'originario assetto seicentesco**».
https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/ville_dei_nobili/villa_borghese
Roma Capitale tourism names the four: «i **Giardini Segreti** (Giardino dell'Uccelliera, Giardino
Vecchio, Giardino della Meridiana e Giardino della Coltivazione), ricostruiti sulla base di
documentazioni storiche e iconografiche.» https://www.turismoroma.it/it/luoghi/villa-borghese
Fountains in them, from Villa Borghese's own table: the 18th-c. **Fontana dell'Aquila** (First Secret
Garden) and **Fontana del Drago** (Second), both with Borghese heraldry; four rustic **marmo
africano** fountainlets of **1609–1623** in the Second and Third; a circular fountain at Viale
dell'Uccelliera / Fourth Secret Garden. https://it.wikipedia.org/wiki/Villa_Borghese
OSM: Uccelliera 41.91482/12.49105 → Pinciano; Meridiana 41.91524/12.49039 → Pinciano.
The Uccelliera is also currently used for exhibition installations by the Galleria Borghese
(its own site announces an Isaac Julien film installation «per gli spazi dell'**Uccelliera** della
Galleria Borghese» from 15 September 2026). https://www.galleriaborghese.it/

**30. Casino del Graziano** — `historic-site`. Viale del Giardino Zoologico, at the edge of the Valle
dei Platani. «Nel **1616** fu comprato dal cardinale Borghese per farvi una mostra di quadri e
statue, ma principalmente fu usato come casino di *delitia* e riposo dopo le battute di caccia»;
built the previous century for one Stefano Graziani; three floors, the third a loggia room; enclosure
wall, two square courtyards each with a rockwork fountain; 16th-c. grotesque decoration on the ground
floor including a *Ratto di Europa* in the manner of **Prospero Fontana**.
https://it.wikipedia.org/wiki/Villa_Borghese

**31. Casale Cenci-Giustiniani** — `historic-site`. Viale David Lubin. Shown as a dependency of the
Orti Giustiniani on an **1828** plan and as "Casale Giustinani" in an **1840** engraving by G. H.
Busse; façades and portico carry fresco fragments of sculpture and trompe-l'œil perspectives;
currently houses a cultural association. ibid.

**32. Casina dell'Orologio** — `historic-site`. Named by both the Sovrintendenza and it.wikipedia
among the villa's neoclassical and 19th-c. buildings. Thin — no date or author found. ibid.

**33. Casina del lago (caffetteria Bilotti)** — `cafe`. Named in Villa Borghese's own building list.
Thin; no operator source found.

**34. Casino degli Uffizi (o delle Officine)** — `historic-site`. Named in the same list; the
**Portale del drago** «attualmente dà accesso a una scuola materna sita nell'ex Casino degli Uffizi».
ibid. Thin, and now a nursery school — probably a reject.

**35. Parco dei Daini** — `park`. Named by the Sovrintendenza and Roma Capitale tourism among the
villa's principal places. Planting list from it.wikipedia: holm oak, bay, black poplar, eucalyptus,
red oak, hackberry, stone pine, cypress, olive. Contains the small artificial lake created
**1922–1925** by **Raffaele de Vico** with a concrete silen at its centre (the *Fontana con Sileno
che versa l'acqua*, also called the fountain of Atlas), the **Edicola del Dace** (early 20th c., with
a Hadrianic Dacian statue), and the Acqua Marcia reservoir (#27). OSM park polygon 41.9154/12.49161 →
Pinciano. https://it.wikipedia.org/wiki/Villa_Borghese ·
https://www.turismoroma.it/it/luoghi/villa-borghese

**36. Valle dei Platani** — `park`. Named in Villa Borghese's own garden list; planting recorded as
oriental plane, lime, common and black walnut, catalpa, albizia, hackberry, red and pedunculate oak,
sweet chestnut, box elder, black locust, horse chestnut, Judas tree. The Sovrintendenza notes it was
brought into the villa under Vasanzio, together with the ground the Bioparco now occupies, to make a
*barco* for hunting. ibid. + Sovrintendenza page.

**37. Giardini di Valle Giulia and the Scalinata** — `park`. Named in Villa Borghese's garden list.
The two **Fontane delle Tartarughe** on the Valle Giulia garden steps are **by Cesare Bazzani, 1910**,
built for the **1911** Esposizione nazionale, and were restored, with the surrounding squares, in
**2004**; they stand at Esedra Petar II Petrović Njegoš and Esedra Giulio Carlo Argan.
https://it.wikipedia.org/wiki/Villa_Borghese

**38. The monumental gates of Villa Borghese** — `historic-site`, best as ONE record

From Villa Borghese's own `Ingressi monumentali` table, all with dates and authors
(https://it.wikipedia.org/wiki/Villa_Borghese):

| Gate | date | where | note |
|---|---|---|---|
| Portale Flaminio Ponzio | 1609 | Via Pinciana, near no. 67 | arched, armorial; built by **Flaminio Ponzio** as the main entrance; moved back 1910–12 to widen via Pinciana |
| Propilei delle aquile | 1790 | Piazzale San Paolo del Brasile | by **A. Asprucci**, first placed at the Muro Torto entrance, moved to Porta Pinciana in **1933** |
| Propilei neoclassici | completed 1827 | Piazzale Flaminio | by **L. Canina**, on ancient Greek models |
| Portale del leone | 17th c. | Via P. Raimondi | attributed to Flaminio Ponzio; lion protome above the keystone survives; gives on to the Parco dei Daini |
| Portale del drago | 1617 | Via Pinciana | pedimented, with the Borghese dragon |
| Portale dei vasi (ex Portale di Porta Pinciana) | before 1914 | Via U. Aldrovandi | originally at Porta Pinciana, moved **1914** to the entrance of the Giardino Zoologico opened in 1911 |

The **Propilei neoclassici at Piazzale Flaminio** are the one to watch: Piazzale Flaminio is the
three-way hinge of Pinciano / Flaminio / Campo Marzio. OSM tests them at 41.91209/12.4768 →
**Pinciano**, and the monumental entrance itself is the subject of the it.wikipedia lead image
(«L'ingresso monumentale su piazzale Flaminio»). Flag it with S3.

**39. The fountains of Villa Borghese (Pinciano side)** — `historic-site`, probably 3–5 records not 30

The full table is at https://it.wikipedia.org/wiki/Villa_Borghese . The ones with a date, an author
and a location, and which test inside Pinciano, are:

* **Fontana dei Cavalli Marini**, **1791**, at the piazzale of the same name. «Fu progettata dal
  pittore **Cristopher Unterberger** su un modello preesistente. La realizzazione è di **Vincenzo
  Pacetti**. Sostituisce nel Settecento la precedente fontana del Mascherone… La fontana consta di
  una grande vasca circolare che è sorretta da **quattro ippocampi**.» OSM 41.91348/12.48913 →
  Pinciano.
* **Fontana del Fiocco** (o Fontana di Esculapio), **1833**, Piazza del Fiocco. «Fu progettata da
  **Luigi Canina** e realizzata successivamente tra il **1830 e il 1834** per via dei lavori di
  ricongiungimento tra i terreni dei Borghese e Piazza del Popolo… un arco classico con una statua di
  Esculapio in restauro.» OSM 41.91389/12.48052 → Pinciano. (The table gives 1833 in one column and
  1830–1834 in the other; report the range.)
* **Fontana dei Pupazzi**, late 18th c., Via dei Pupazzi at Piazza di Siena. Granite basin apparently
  from an earlier Narcissus fountain that stood behind the Casino Nobile; **the putti and dolphins
  were stolen in 1983**. OSM 41.91294/12.48816 → Pinciano.
* **Mostra dell'Acqua Felice**, late 18th c., Viale Pietro Canonica. Built by **Antonio Asprucci**;
  a sarcophagus slab carried by two griffins and surmounted by a lion, between two shell-shaped
  fountainlets. OSM `artwork` 41.91267/12.48497 → Pinciano.
* **Fonte Gaia** (see #18), **1929**.
* **Fontana del Sarcofago delle Vittorie**, **1917**, Viale Goethe.
* **Fontane Oscure** (già Fontana Rotonda and Fontana Ovale), **1620**, Viale del Museo Borghese —
  a pair either side of the avenue.
* **Two shell-basin fountainlets**, **1618–1620**, Piazzale Scipione Borghese; **two trilobed
  fountainlets with reliefs**, c. **1897**, Piazzale Museo Borghese; **Due Fontane delle Piramidi**,
  late 17th c., Viale delle Piramidi; **Seconda Fontana della Venere**, 19th c., Piazzale Scipione
  Borghese; **Fontana di Diana** and **Prima Fontana della Venere**, Giardini all'italiana, Piazzale
  Ferdowsi.
* **Fontana dei Leoni** (before 1788) and the **Fontana con vasca ovale / della Preschiera** (**1908**,
  «Venne realizzata quando fu costruito il **ponte che collega Villa Borghese con il Pincio**»), both
  Viale Fiorello La Guardia. OSM has a "Fontana dei Leoni" at 41.91788/12.4788 → Pinciano.
* **Fontana-Ninfeo-Laghetto** and a headless river-god fountain, 16th c., Viale Giorgio Washington;
  «Tali fontane erano già nella Villa Giustiniani».
* Also on the acqueduct history: «Nel **1610** fu affidato a **Giovanni Fontana** la costruzione
  dell'acquedotto dell'Acqua Felice e le fontane della villa… **Raffaele De Vico** costruì il
  serbatoio dell'Acqua Pia Antica Marcia, che approvvigionava l'acqua destinata alle fontane e ai
  laghetti della villa, ora fornita dal Peschiera.» A publishable paragraph in its own right.
* **CAUTION:** the table's `Fontana dell'Acqua Felice` row contains an internal contradiction («L'Acqua
  Felice fu portata a Villa Borghese da Giovanni Fontana nel **1910**» under an object dated «Fine
  XVIII secolo»). Giovanni Fontana died 1614. **Do not publish the 1910 date.**

**40. The donated monuments of Villa Borghese** — `historic-site`, best as ONE record

Villa Borghese's own monument table lists a long series of statues given by foreign states and
associations, all Pinciano-side and all clustered on the avenues around Piazzale Ferdowsi and Viale
Madama Letizia (all coordinates tested → Pinciano). With dates, sculptors and donors, verbatim from
https://it.wikipedia.org/wiki/Villa_Borghese :

* **Monumento a Wolfgang Goethe**, **1904**, Viale Goethe — **Valentino Casali**, Carrara marble,
  **donated by Wilhelm II of Germany**; three sculpture groups at the base for the three phases of
  Goethe's poetics (Iphigenia and Orestes for the dramatic; Mignon and Lothario for the lyric; Faust
  and Mephistopheles for the didactic). OSM 41.91154/12.48634.
* **Monumento a Victor Hugo**, **1905**, Piazzale Victor Hugo — **Lucien Pallez**, donated by the
  Franco-Italian League. OSM 41.91313/12.48283.
* **Monumento a Umberto I**, **1926**, Viale della Pineta — begun by **Davide Calandra** in 1914,
  completed by **Edoardo Rubino**, inaugurated 1926; porphyry base, bronze equestrian statue, two
  reliefs of Valour and royal Piety, and a veiled Italia mourning the king. Separate article:
  https://it.wikipedia.org/wiki/Monumento_a_Umberto_I_(Roma) . OSM `artwork` "Umberto Re d'Italia"
  41.91233/12.48894.
* **Monumento all'Alpino e all'Umile Eroe**, **1940–1957**, Viale Pietro Canonica in front of the
  Museo Canonica — in 1940 **Pietro Canonica** gave the bronze *L'umile eroe*, the mule Scudela,
  decorated with a valour medal after the First World War; the Alpino figure was added in 1957. OSM
  has both at 41.91499/12.48672 and 41.91498/12.48671.
* **Monumento a George Byron**, c. **1959**, via della Pineta — a copy of **Bertel Thorvaldsen**'s
  statue at Trinity College, Cambridge, with passages from *Childe Harold's Pilgrimage* on the
  pedestal. OSM records a "Thorvaldsen" memorial at 41.91755/12.48014.
* **Monumento a Simón Bolívar**, **1930**, Piazzale Simón Bolívar — by **Pietro Canonica**,
  originally in a widening of the via Flaminia (today piazzale Manila), **moved in 1960** to stand in
  front of the British academy. Pinciano's own article dates the bronze **1933** and says it was
  originally in the viale Tiziano gardens. **The two Wikipedia pages disagree on both date and
  original site — report the conflict, do not pick.** OSM 41.91774/12.48065.
* Then, by date: **Firdusi/Ferdowsi** 1958, Sadighi, marble, given by the city of Tehran, Piazzale
  Ferdowsi; **Francisco de Paula Santander** 1961, Carlos Viejo, bronze, given by Colombia, Viale
  Madama Letizia; **Ahmed Shawqi** 1962, Gamal El Sagini, given by Cairo's higher council for
  literature, arts and sciences, Piazzale Paolina Borghese; **José Artigas** 1966, copy after José L.
  Zorilla, given by the Italo-Uruguayan association, Largo José Artigas; **Garcilaso de la Vega**
  1967, Joaquín Roca Rey, marble, given by the Peruvian committee, Piazzale Paolina Borghese;
  **Aleksandr Pushkin** 2000, Yuri Orekow, given by the city of Moscow, Viale Madama Letizia;
  **Nikolaj Gogol** 2002, Zurab Tsereteli, bronze, given by Russia, Viale Bernadotte; **Petar
  Njegoš** 2005, copy after Sreten Stojanović, given by Montenegro, Piazzale Paolina Borghese;
  **Henryk Sienkiewicz** 2006, Czesław Dźwigaj, for the Archconfraternity of Archers of Kraków, with
  the Polish embassy's patronage, Piazzale Ferdowsi, replacing an earlier Sienkiewicz;
  **Nizami Ganjavi** 2012, Salxab Məmmədov and Əli İbadullayev, given by Azerbaijan, Viale Madama
  Letizia. Also a **1983 stele to José Martí and Garibaldi**, Viale Madama Letizia, and a **2000
  stele to George Washington**, Viale Giorgio Washington.
* OSM adds several the table does not: **Bernardo O'Higgins**, **José de San Martín**, **Ivan Vazov**,
  **Shota Rustaveli**, **José Rizal**, and a **Monica Vitti** (41.92693/12.48572, outside the park,
  toward piazza Euclide). Unverified against a text source.
* **Monumento a Jan van der Capellen de Poll**, 18th c., **currently in temporary deposit at the
  Museo Canonica**, formerly in the Giardino del Lago — by **Giuseppe Ceracchi** for the Netherlands,
  bought by the Borghese in **1835**, who split it into its four parts (Capellen de Poll in Roman
  dress; allegories of Temperance and Justice; a lion for Fortitude). Not on public display in situ.

---

### 4C — VALLE GIULIA AND THE FOREIGN ACADEMIES

**41. Valle Giulia** — `historic-site` (a named place, not a park)

* «Valle Giulia è una zona centrale di Roma, tra Villa Borghese e la collina dei Parioli, una piccola
  valle dove ancora oggi è collocata **Villa Giulia**… L'assetto attuale della valle deriva, in larga
  misura, da quello che le fu dato in occasione dell'**esposizione nazionale del 1911**: vi sorge la
  Galleria Nazionale d'Arte Moderna, opera di **Cesare Bazzani**, edificata per l'occasione. A partire
  dal 1911, proseguendo poi nei periodi successivi, ha avuto luogo la localizzazione nell'area di
  molti **istituti di ricerca di Paesi esteri**.» Category: `Roma Q. III Pinciano`.
  https://it.wikipedia.org/wiki/Valle_Giulia
* The institutes named there: **British School at Rome** (UK), **Academia Belgica** (Belgium),
  **Accademia di Romania** (Romania), **Accademia di Danimarca** (Denmark), **Istituto svedese di
  studi classici** (Sweden), the **Koninklijke Nederlandse Akademie van Wetenschappen** (Netherlands,
  i.e. the KNIR), and the **Istituto Giapponese di Cultura** (Japan).
* «Alle pendici della collina che prospetta la valle ha sede la prima facoltà italiana di
  **architettura**, inaugurata da "La Sapienza" nel **1920** ed ancora oggi esistente.» — «la prima
  facoltà italiana» is a priority claim and is **banned**; the 1920 date is fine.
* «Il **1º marzo 1968** l'area attorno alla facoltà di architettura fu teatro di gravissimi scontri
  tra studenti e forze dell'ordine, dando vita alla celebre **battaglia di Valle Giulia**.» Pasolini's
  *Il PCI ai giovani!* was written about it. Both publishable as dated events.
  https://it.wikipedia.org/wiki/Battaglia_di_Valle_Giulia (not fetched)

**42. British School at Rome** — `historic-site` / `attraction`

* **via Antonio Gramsci 61, 00197 Roma**, own site footer. https://www.bsr.ac.uk/
* «È stata **fondata nel 1901** ed è stata riconosciuta da un Royal Charter nel **1912**… La sede,
  situata nel quartiere **Pinciano**, a nord del Pincio e ai piedi dei Monti Parioli, fu progettata
  dall'architetto sir **Edwin Lutyens**, che si ispirò al piano superiore della cattedrale di San
  Paolo a Londra. Venne realizzata come **padiglione britannico all'Esposizione internazionale di
  Roma del 1911**. Il terreno fu quindi donato dallo Stato italiano e l'edificio permanente venne
  completato nel **1916**.» https://it.wikipedia.org/wiki/British_School_at_Rome
* Its own site marked **125 years** on the evening of 25 June 2026. Director **Abigail Brundin**.
* Access: it is a residential research institute; the site publishes events, exhibitions and a
  library, not general opening hours. **Do not state opening hours.**
* Photo note: Lutyens died 1944 — the building is out of architectural copyright.
* Facing it: the **Monumento a Simón Bolívar** (see #40), in Piazzale Simón Bolívar.

**43. Istituto Giapponese di Cultura and its Giardino Giapponese** — `attraction`

* Pinciano's own article: «Istituto Giapponese di Cultura in Roma, **in via Antonio Gramsci**.»
  https://it.wikipedia.org/wiki/Pinciano
* OSM: `arts_centre` "Istituto Giapponese di Cultura" 41.91868/12.47924 → Pinciano; separate
  `garden` "Giardino Giapponese" 41.91843/12.47968 → Pinciano, tagged
  `website=https://www.jfroma.it/giardino-orari-di-apertura/`.
* **`jfroma.it` returns HTTP 400 to plain urllib requests** and I did not get a page from it. So I
  have no operator-sourced address or hours. A record could honestly say the institute is on via
  Antonio Gramsci in Valle Giulia and that its garden is open on a published schedule, and give no
  times. Better: send this back for a second fetch attempt.
* The garden is the reason this is a visitor subject at all; without hours it is thin.

**44. Accademia di Danimarca** — `historic-site`. **Via Omero 18, 00197 Roma**, own site footer.
https://acdan.it/it/

**45. Forum Austriaco di Cultura Roma** — `historic-site`. **Viale Bruno Buozzi 113, 00197 Roma**,
own site. https://www.austriacult.roma.it/ · OSM `arts_centre` 41.91897/12.4786 → Pinciano.

**46. Reale Istituto Neerlandese (KNIR)**, **Academia Belgica**, **Istituto svedese di studi
classici**, **Accademia di Romania** — `historic-site`, probably ONE grouped record

Named in the Valle Giulia article as the foreign institutes of the valley. I fetched
https://www.knir.it/ (Dutch institute, live, library and courses, no street address in the served
HTML), https://isvroma.org/ and https://www.academiabelgica.it/ (both returned only a cookie-wall
stub of 1378 bytes — no usable content). **Addresses for these three not obtained.** The
conventional cluster is via Omero and via Antonio Gramsci; do not assert a number I have not read.

**47. Facoltà di Architettura "Valle Giulia", Sapienza Università di Roma** — `historic-site`

Pinciano's own article: «Facoltà di Architettura "Valle Giulia" della Università degli Studi di Roma
- Sapienza, **in via Antonio Gramsci**.» https://it.wikipedia.org/wiki/Pinciano · founded 1920 and
the site of the 1 March 1968 clashes (#41). Worth a record chiefly for the 1968 event.

**48. Chiesa della Madonna dell'Arco Oscuro** — `historic-site`

* «nel quartiere Pinciano, in **viale delle Belle Arti**», near Villa Giulia. **Built 1797**,
  consecrated **10 September 1797**, to house a Marian icon that had hung under a bridge linking
  **Villa Poniatowski** to **Villa Giulia** — the *arco oscuro*. External plaque: *Sacellum Matri
  Divinae Providentiae de Arcu Obscuro dicatum*. **Innocent XI**'s arms on the entrance architrave.
  Two rooms: the first modern, with ex-votos and a modern Annunciation mosaic; the second the late
  18th-c. chapel proper, with the *arco oscuro* and the Marian image walled in and a fourteen-station
  Via Crucis. Rendina quotes the *Giornale di Roma* of 30 September 1797 on Fra Giovanni Andrea
  Michelotti chiselling the chapel out of the tufa and its solemn blessing on Sunday 10 September.
  https://it.wikipedia.org/wiki/Chiesa_della_Madonna_dell%27Arco_Oscuro
* No coordinate published; not polygon-tested. Viale delle Belle Arti is wholly inside Pinciano, so
  the risk is low.

**49. Basilica di Sant'Eugenio** — `historic-site`

* «una chiesa di Roma, nel quartiere Pinciano, in **viale delle Belle Arti**.» 41.918486/12.474736 →
  Pinciano.
* «Avvicinandosi il XXV anniversario della consacrazione episcopale di **Pio XII**, il Papa fece
  sapere che con i doni che gli erano stati preannunciati da parte di cattolici di tutto il mondo,
  egli voleva fare costruire una chiesa in un nuovo quartiere romano privo di chiesa parrocchiale.»
  Dedicated to **St Eugene I**, Pacelli's baptismal name. **Begun 1942** to designs by **Enrico
  Pietro Galeazzi** and **Mario Redini**, interrupted by the war, **finished 1951**, **consecrated by
  Pius XII himself on 2 June 1951**. Parish from 1951 (brief *Petrianae navis*, 16 March); entrusted
  since **1980** to priests of the personal prelature of **Opus Dei**; cardinalatial deaconry since
  1960; raised to **minor basilica on 23 May 1951** (brief *Honoris pastoralis*). **John Paul II
  visited on 3 March 1986.**
* Fabric: neo-baroque, travertine façade, one tall central and two lower lateral portals, two orders;
  six pilasters with eclectic Corinthian capitals below; over the minor portals, *Allegories of
  Justice and Peace* by **Alessandro Monteleone**; above, a large window with loggia flanked by the
  *Symbols of the four Evangelists* by **Francesco Nagni**; a bronze **St Michael** by A. Gerardi on
  the dome. Behind, a bell tower with **eight bells in B♭2** with falling clappers, cast by the
  **Fonderia Colbachini of Padua** in the 1950s. Interior of three aisles on paired columns, with
  transept, **five side chapels** and a high dome.
  https://it.wikipedia.org/wiki/Basilica_di_Sant%27Eugenio
* Note: Sant'Andrea del Vignola (S3) is a subsidiary place of worship of this parish, which is one
  more reason the church-boundary question there is genuinely unclear.

---

### 4D — CHURCHES OUTSIDE VILLA BORGHESE

**50. Basilica di Santa Teresa d'Avila** — `historic-site`

* «situato nel quartiere Pinciano, in **corso d'Italia, 37**.» 41.911455/12.49489 → Pinciano. OSM
  confirms the number and gives the parish site
  http://parrocchiasantateresadavila.it/contattaci/index.html
* Dedicated to the Spanish foundress of the **Discalced Carmelites**, to whom the church and the
  attached curia generalizia belong. **Built 1901–1902 to designs by Tullio Passarelli**, with later
  remodelling mostly by Passarelli himself; **inaugurated 20 April 1902**, recorded on a plaque left
  of the main door. **Parish erected 6 January 1906 by Pius X** (bull *Romanas aequabilis*); **raised
  to minor basilica by Pius XII in 1951**; cardinalatial title *Santa Teresa al corso d'Italia* since
  **1962**.
* Fabric: neo-Romanesque, with a **40-metre** campanile with blind arcading and a clock. Two-order
  façade: below, a protiro portal with columns and pediment, above it a small loggia with arches and
  colonnettes; the upper part between two pilaster strips whose bases carry **two marble lions by
  Armando Brasini**; a rose window with Christ and the apostles, surmounted by a cross-shaped window.
  Bronze panels of *Episodes from the life of St Teresa* by the Carmelite **Serafino Melchiorre** in
  the doorway; a relief of *Christ blessing and St Teresa* in the lunette. Three aisles on piers and
  arches; the side aisles were raised above the central one **until 1936**; groin-vaulted ceiling;
  confessionals by the cabinetmaker Alfonsi; a marble pulpit carved with scenes of the saint's life.
  https://it.wikipedia.org/wiki/Basilica_di_Santa_Teresa_d%27Avila

**51. Basilica del Sacro Cuore Immacolato di Maria** — `historic-site`

Pinciano's own article: «su **piazza Euclide**. Chiesa del XX secolo (**1923-51**).»
41.927378/12.481078 → Pinciano. Article fetched at
https://it.wikipedia.org/wiki/Basilica_del_Sacro_Cuore_Immacolato_di_Maria (6.7 kB) — I did not read
it out in full; a writer should mine it for the architect and the basilica date. See straddler S8.

**52. Chiesa di Santa Teresa del Bambin Gesù in Panfilo** — `historic-site`

Pinciano's own article: «all'incrocio tra **via Giovanni Paisiello e via Gaspare Spontini**.»
41.918456/12.493456 → Pinciano. Its importance is that **the present access to the catacomb of San
Panfilo is inside this church** — see #57. Article at
https://it.wikipedia.org/wiki/Chiesa_di_Santa_Teresa_del_Bambin_Ges%C3%B9_in_Panfilo (7 kB, fetched,
not read out).

**53. Chiesa di Santa Maria della Pace ai Parioli** — `historic-site`

* «una chiesa di Roma, nel **quartiere Pinciano**, in **viale Bruno Buozzi**» — OSM gives the number,
  **viale Bruno Buozzi 75**, and the operator site
  https://opusdei.org/it/section/santa-maria-della-pace/ . 41.921909/12.483761 → Pinciano.
* «È la **chiesa prelatizia dell'Opus Dei**, che conserva i resti mortali del suo fondatore. Il fonte
  battesimale della chiesa è quello in cui fu battezzato **Josemaría Escrivá de Balaguer** nel
  **1902**, donato dalla diocesi di Barbastro a questa chiesa.»
* Burials: **St Josemaría Escrivá de Balaguer (1902–1975)** in the altar; in the crypt, Bl. **Álvaro
  del Portillo (1914–1994)**, bishop and first successor, **Javier Echevarría Rodríguez (1932–2016)**
  and **Dora del Hoyo (1914–2004)**; in the sub-crypt, Carmen Escrivá, the founder's sister.
  https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_della_Pace_ai_Parioli
* No construction date or architect in the article; do not invent one. See straddler S10 (name only).

---

### 4E — ARCHAEOLOGY

**54. Mausoleo di Lucilio Peto** — `historic-site` — **STATUS: CLOSED, with a source**

* Sovrintendenza Capitolina, verbatim: **«Orario: Temporaneamente chiuso»**.
  https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/mausoleo_di_lucilio_peto
  A `status` of closed is sourced here.
* Same page: circular plan, a drum **about 34 m in diameter and 16 m high**, concrete core faced in
  travertine blocks between two plain dentil cornices. **Discovered in 1887**, about **6 m** below
  modern level, during work on the former Vigna Bertone. Belongs to the via Salaria burial area and
  is dated to **the last years of the 1st century BC**. Built on the left side of the via Salaria
  **about 500 m from the Aurelian Walls**. The covering was probably a conical earth tumulus. The
  marble inscription on the main front assigns it to **Lucilius Paetus of the Scaptia tribe, military
  tribune, prefect of engineers and of cavalry**, who built it in his lifetime for himself and his
  sister **Lucilia Polla**. A rear entrance and corridor lead to a cruciform burial chamber with
  three niches for funerary couches. Abandoned and almost buried by the Trajanic period; reused in
  the **4th century**, when small masonry tombs were built against the drum (found and destroyed in
  the excavation) and two tiers of *loculi* were cut in the corridor, with a small catacomb dug into
  the tufa, reached by a stair, with a main gallery and unused branches. Robbed of its furnishings
  and marble already in the 4th c. and again in the 16th–17th. **Restored in 2025 under the PNRR –
  Caput Mundi programme.**
* it.wikipedia adds: reopened to the public in **August 2010** after a long restoration campaign; the
  floor lies about **six metres below street level**; an archaeological area in front of the eastern
  arch conceals a row of tufa blocks running fifteen metres east of the monument, reached by two
  flights of stairs built in **1925** (now recovered for conservation); the inscription is in **Luni
  marble**, five courses surviving, framed by a **kyma lesbio**.
  https://it.wikipedia.org/wiki/Mausoleo_di_Lucilio_Peto
* Straddler S5.

**55. Ipogeo di via Livenza** — `historic-site` — **STATUS: CLOSED, with a source**

* Sovrintendenza Capitolina, verbatim: **«il sito è temporaneamente chiuso al pubblico per i lavori
  previsti dal PNRR»**; when open, «Ingresso consentito solo a **gruppi accompagnati. Max 10 persone
  a visita.** Prenotazione obbligatoria allo **060608** dalle 9.00 alle 19.00»; **tariffe: intero
  € 4,00, ridotto € 3,00**, free for residents of Rome and the metropolitan area on production of
  proof of residence, and free for MIC card holders; guided tours not included in the price.
  **Restored in 2025 under PNRR – Caput Mundi.**
  https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/ipogeo_di_via_livenza
* Same page: «Nel **1923** gli scavi per la costruzione di una palazzina **tra via Livenza e via Po**
  portarono alla scoperta di un edificio sotterraneo ma irrimediabilmente ne danneggiarono le
  strutture.» Elongated plan, an apsed main hall and secondary rooms; a trapezoidal fragment
  survives. The north wall is articulated in three adjacent arches; the central one, richly decorated
  with frescoes and mosaics and closed by two marble screens, holds a deep rectangular basin with
  water inlet and outlet. **Dated by consensus to the second half of the 4th century AD**; its
  function is still argued — a shrine of the Thracian goddess **Cotys** and the mystery sect of the
  **Baptai**; an early **baptistery**; a temple of the cult of waters; a place for magical practice; a
  meeting place for a syncretistic sect; or simply a nymphaeum built over an underground spring.
* it.wikipedia adds the measurements: the building was **21 × 7 m**, oriented north–south, circus-like
  in plan; the basin **2.90 × 1.70 m and 2.50 m deep**, entered down three steps, the first very high;
  the stair retains many original ancient treads; a surviving mosaic fragment may show **St Peter**
  striking water from a rock to baptise a converted centurion.
  https://it.wikipedia.org/wiki/Ipogeo_di_via_Livenza

**56. Fonte di Anna Perenna** — `historic-site`

* «una fontana votiva risalente al **IV secolo a.C.** dedicata al culto della omonima divinità
  romana, rinvenuta nel **1999** a Roma e **utilizzata fino al VI secolo d.C.**» Discovered at the
  corner of **via Guidubaldo del Monte and piazza Euclide** (Pinciano's own article); OSM gives the
  number, **Via Guidubaldo del Monte 4b**, 41.92747/12.48023 → Pinciano. Infobox:
  `Ente = Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma`, `Visitabile = Visite
  guidate su prenotazione`.
* «La scoperta ha permesso di localizzare con certezza l'originaria ubicazione del **bosco sacro di
  Anna Perenna**, già citato da **Ovidio** nei *Fasti*, e di testimoniare lo svolgimento di una
  quantità eccezionale di pratiche magiche protrattesi nel corso di molti secoli.» Rectangular, in
  tufa blocks and brick, found between **6.2 m and 10.3 m** below street level; an altar on the front
  carried the inscription **NYMPHIS SACRATIS ANNAE PERENNAE**. A rectangular cistern behind it
  collected the spring water and yielded the objects of the magical rituals; the cistern was damaged
  by the works for the underground car park. **The finds are displayed at the Museo nazionale romano
  – Terme di Diocleziano** (which is in Castro Pretorio, already shipped — a cross-reference, not a
  claim). https://it.wikipedia.org/wiki/Fonte_di_Anna_Perenna
* Official record: https://www.soprintendenzaspecialeroma.it/schede/fonte-di-anna-perenna_2976/
  (URL from the OSM object and from the it.wikipedia infobox; **not fetched** — a verifier should).
* Pinciano's own article footnotes a Ministry-published paper: Marina Piranomonte and Francisco Marco
  Simón, *The Daemon and the Nymph: Abraxas and Anna Perenna*, Bollettino di Archeologia on line I
  2010, Volume speciale D/D8/1.

**57. Catacomba di San Panfilo** — `historic-site`

* «si estende sotto le **vie Paisiello e Spontini**, nel quartiere Pinciano… **l'accesso attuale si
  trova nella chiesa di Santa Teresa del Bambin Gesù in Panfilo**» (#52). Ente: **Pontificia
  Commissione di Archeologia Sacra**.
* On the line of the ancient **Salaria vetus**; ancient sources call it the first catacomb on that
  road out of **porta Pinciana**. Three levels: a lower and an upper connected, plus an intermediate.
  The **lower**, **20 m below ground level**, is the oldest, **3rd century**: a main artery, a kind of
  hypogean *decumanus* about **60 m** long, with galleries at right angles; a new region of galleries
  was added at the same level in the **4th century**, containing the *cubiculum duplex* where the
  remains of the martyr **Pamphilus**, of Carthaginian origin, were found. The intermediate level is
  essentially two ambulacra joined by galleries. The upper, badly damaged by the buildings above, is
  dated between **348 and 361**.
* History: the primitive nucleus is 3rd-century; forgotten after the catacombs were abandoned;
  **Antonio Bosio** entered the first level on **16 May 1594**; it then stayed hidden from the
  *corpisantari* for three more centuries, which preserved the two lower levels; rediscovered and
  identified by **Enrico Josi from 1920**.
  https://it.wikipedia.org/wiki/Catacomba_di_San_Panfilo
* No visiting information in the article. **Do not state hours or access.**

**58. Catacomba di Sant'Ermete (di Bassilla)** — `historic-site`

* «posta sull'antica **via Salaria vetus**, oggi in **via Bertoloni**, nel moderno quartiere
  Pinciano.» Ente: Pontificia Commissione di Archeologia Sacra.
* Two ancient names: the older **Bassilla** — either the owner of the ground in which the hypogean
  cemetery was dug in the first half of the **3rd century**, or the martyr the *Depositio martyrum*
  commemorates on **22 September**, killed in Diocletian's persecution of **304**; scholars have not
  settled it and the article says a case of homonymy cannot be excluded. **Sant'Ermete** is the
  best-known martyr buried there. The oldest liturgical sources record four burials on the Salaria
  vetus: **Ermete, Proto, Giacinto and Bassilla**; early-medieval pilgrim itineraries add Crispo,
  Ercolano, Leopardo, Vittore and Massimiliano, of whom almost nothing is known. Inscriptions of
  Bassilla from this catacomb are now in the **Museo Pio Cristiano** in Vatican City, and the
  *Notitia ecclesiarum urbis Romae* attests an above-ground basilica dedicated to her.
* Article sections not read out: *Storia*, *Topografia e descrizione*, *Basilica di sant'Ermete*,
  *Oratorio medievale*, *Cripta dei santi Proto e Giacinto*.
  https://it.wikipedia.org/wiki/Catacomba_di_Sant%27Ermete
* Cross-check needed: several Roman catacombs of the Pontificia Commissione are open only by
  appointment or not at all. **No source I fetched states access here.**

**59. Catacomba di San Valentino** — `historic-site` — **STRADDLER S4**

* On viale Maresciallo Pilsudski at the second mile of the via Flaminia, at the foot of the Parioli
  hill. **Antonio Bosio** was the first into the upper level (no longer visible); **Orazio Marucchi**
  (1852–1931) first excavated it, walking by chance into a cellar in **1878** and finding a painted
  funerary room, and later found the remains of the external basilica; new campaigns by **Bruno Maria
  Apollonj Ghetti** in **1949**.
* The excavations showed the martyr Valentine was **not** buried in the catacomb but in an open grave
  outside it, over which **Julius I (336–352)** built a first basilica, enlarged by **Honorius I
  (625–638)** and **Theodore I (642–649)**, restored down to **Nicholas II** in the mid-11th century;
  an adjoining monastery is attested in that century. The basilica still stood in the 13th century and
  traces were visible in Bosio's day (1594). In the **6th century** an open-air necropolis of mausolea,
  tombs and sarcophagi grew up between basilica and catacomb.
* «Oggi della catacomba, originariamente disposta su tre livelli, **non resta quasi più niente**,
  soprattutto a causa dell'**alluvione e della frana che coinvolse la zona nel 1986** e che ha reso
  inaccessibili la maggior parte delle gallerie. Gli unici manufatti di un certo rilievo sono la
  basilica esterna e l'ambulacro scoperto dal Marucchi nel 1878.»
* The article also sets out the three scholarly positions on whether the Roman and the Terni
  Valentine are one person or two, citing the **Cronografo del 354** of Furius Dionysius Filocalus for
  a basilica *quae appellatur Valentini*. https://it.wikipedia.org/wiki/Catacomba_di_San_Valentino

**60. Porta Pinciana** — `historic-site` — **STRADDLER S1**, facts under §2.

**61. Sepolcro di Cornelia** and **62. the 1870 cannonball hole in the Aurelian Walls** —
`historic-site`, both **OSM-only, unverified**

OSM `attraction` nodes at 41.91079/12.49659 ("Sepolcro di Cornelia") and 41.91087/12.49463 («Buco con
palla di cannone, battaglia del 1870»), both inside the Pinciano polygon on the Corso d'Italia wall
frontage. **I found no text source for either.** A cannonball lodged in the walls from the taking of
Rome would be a good subject if it can be sourced; as it stands it is a bare OSM tag and should not
publish on that alone.

---

### 4F — VILLAS, VILLINI AND 20TH-CENTURY ARCHITECTURE

**63. Villa Strohl-Fern** — `historic-site` / `park`

* «un complesso storico di circa **80.000 m²** situato a Roma su **viale David Lubin**, all'interno
  del parco di Villa Borghese, nel quartiere **Pinciano**.» `proprietario = stato francese`,
  `committente = Alfred Wilhelm Strohl`, 19th c., eclectic. 41.91375/12.47725 → Pinciano.
* Named for the Alsatian **Alfred Wilhelm Strohl** (Sainte-Marie-aux-Mines 1847 – Rome 1927), patron
  and artist; he took refuge in Paris in the Franco-Prussian war of 1870, travelled Europe and settled
  in Rome in **1879**, buying **eight hectares** that year and turning them into a park of studios.
  The name combines his surname with the German *fern*. He conceived it to house artists of any school
  and nationality.
* **Antonello Trombadori**, who went there from 1919 with his father the painter **Francesco
  Trombadori**, wrote that the property «**non è mai stata una parte di Villa Borghese**», but a
  wooded and meadowed holding bordering it, running from the left Propileo to the Valle Giulia
  steps, and that only after the Second World War was the park temporarily annexed to the public
  Villa Borghese while keeping its own history and identity. He described its core as a «città
  proibita» behind a high fence, a «favoloso giardino» of rare species with false-stalactite fountains,
  concrete tanks, cedars, bamboo and holm oaks. Francesco Trombadori had his studio there and died
  there in **1961**. https://it.wikipedia.org/wiki/Villa_Strohl_Fern
* It now contains the **Liceo Chateaubriand**, the French lycée of Rome — separate article, in the
  `Roma Q. III Pinciano` category: https://it.wikipedia.org/wiki/Liceo_Chateaubriand_(Roma) (fetched,
  7.1 kB, not read out). The lycée is not a visitor subject; the villa and its studios are.

**64. Villa Lubin (seat of the CNEL)** — `historic-site`

* **Viale Davide Lubin, 2, 00196 Roma** (infobox). Inside Villa Borghese. Also called Villa Italia or
  Palazzina Internazionale dell'Agricoltura. `proprietario = Stato Italiano`, neo-baroque and liberty.
* «Fu disegnata dall'architetto **Pompeo Passerini**, in collaborazione con l'architetto **Raffaele De
  Vico**, ed edificata tra il **1906-1908** per ospitare inizialmente l'**Istituto internazionale di
  agricoltura** (IIA), precursore della FAO, voluta da **David Lubin**. La costruzione della villa
  causò numerose polemiche, poiché dovettero essere abbattuti alcuni pini secolari.»
* «Nel **1933** l'architetto **Paolo Rossi De Paoli** realizzò nel vicino piazzale il **villino Ruffo**
  (ristrutturato nel 1981), che oggi ospita gli oltre **75.000 libri** della biblioteca del CNEL, una
  sala per convegni e la sede dell'Autorità garante per l'infanzia e l'adolescenza. Dal **1952 al
  1960** il piccolo padiglione fu sede dell'Istituto per l'Oriente.» After the IIA moved to the FAO
  the building reverted to the Italian government, which made it the seat of the **Consiglio nazionale
  dell'economia e del lavoro**, installed **20 February 1958**; restored and enlarged in **1959** by
  **Clemente Busiri Vici**; in **1960** also seat of the Committee of Ministers for the Mezzogiorno.
  In the access road below there is a grotto with a headless recumbent river-god statue. It appears on
  the Italian **200-lire** commemorative coin struck for the first World Food Day in **1981**.
  https://it.wikipedia.org/wiki/Villa_Lubin
* Not open to the public as a rule; do not state hours.

**65. Villa Balestra** — `park`

* **Via Bartolomeo Ammannati, 3**; a **15,000 m²** public municipal garden owned by the Comune di
  Roma, on the top of **Monte San Valentino**, the tufa hill above viale Tiziano; explicitly
  «pertiene tuttavia al quartiere Pinciano». Occupies a small part of the grounds of **Villa
  Poggio**, built by the Bolognese cardinal **Giovanni Poggio** (also "Poggi"), treasurer of the
  Apostolic Camera under Paul III and nuncio in Spain and Germany. An 1834 encyclopaedia still calls
  it «la villa Poggi fuori di Porta del Popolo a Roma, dove ora si fermano i cardinali e gli
  ambasciatori quando fanno il loro pubblico ingresso». Bought in **1880** by Cavaliere **Giuseppe
  Balestra**, who returned the farmed part to vineyard. **Broken up from 1910**; part built over in
  1928. https://it.wikipedia.org/wiki/Villa_Balestra · OSM park 41.92121/12.47384 → Pinciano.

**66. Villa Marignoli (Villino Marignoli)** — `historic-site`

* «all'angolo tra **via Po (civici 2-4)** e **Corso d'Italia (civico 35)**, nel Quartiere III
  Pinciano.» Art Nouveau; **designed in 1907 by Giulio Magni** (Velletri, 1 November 1859; great-
  nephew of **Giuseppe Valadier**); originally the Marignoli family's town residence, now a
  *residenza turistico-alberghiera*. https://it.wikipedia.org/wiki/Villa_Marignoli
* Pinciano's own article dates it **1907** at «via Po, angolo corso d'Italia».
* **CORPUS TRAP:** the article opens «Oggi sotto la tutela della **Soprintendenza ai Monumenti** di
  Roma e del Lazio» — that is a **protection-status claim and is BANNED** under evidence_ruling. Also
  banned: «uno degli edifici che meglio rappresentano gli influssi dell'Art Nouveau in Giulio Magni»
  and «una delle figure artistiche più interessanti dell'inizio del '900». Take the address, the date
  and the architect; leave the rest.

**67. Villino Astaldi** — `historic-site`

* «su **via Saverio Mercadante, angolo via Niccolò Porpora**, nel quartiere Q. III Pinciano.» Built
  **1920–1923** as *villino Rosmunda* for the engineer **Adolfo Sebastiani**'s daughter, on land at
  the eastern edge of Villa Borghese subdivided after the **1909** master plan; designed by **Arnaldo
  Foschini** with **Attilio Spaccarelli**; a parallelepiped main block along via Mercadante of two
  storeys above a semi-basement plus attic, with a secondary rear block. A second campaign
  **1955–1956** by **Mario Ridolfi** and **Volfango Frankl**. Later associated with **Maria Luisa
  Astaldi** and with **Italia Nostra**. https://it.wikipedia.org/wiki/Villino_Astaldi
* Pinciano's own article gives 1920–23 and «via Saverio Mercadante, angolo via Nicolò Porpora».

**68. Villino Alatri** — `historic-site` — **two sources disagree; report the conflict**

* Its own article: «all'incrocio tra **via Giovanni Paisiello e via Vincenzo Bellini** (con **ingresso
  su quest'ultima strada**), nel quartiere Pinciano. Edificato nel **1928** e ristrutturato nel
  **1949**… Il villino fu commissionato a **Vittorio Ballio Morpurgo** negli anni venti da **Giacomo
  Alatri** – industriale tessile e importante esponente della comunità ebraica romana.» Right-angled
  corner front, L-plan with the long side on via Paisiello where the entrance originally was; an
  internal garden behind; three floors of which two above ground, the basement holding boiler, garage
  and porter's flat; a third floor in the roof for the servants and an *altana* on the via Bellini
  side. https://it.wikipedia.org/wiki/Villino_Alatri
* **Pinciano's own article instead says «su via Giovanni Paisiello. Edificio del XX secolo
  (1924-28)»** and names no architect. The build date **1924–28 vs 1928**, and the entrance street,
  differ. Report the range.

**69. Villa Titta Ruffo (Villino Titta Ruffo, also villa Zanardo)** — `historic-site`

* «situato in **via Sassoferrato**, nel quartiere Q. III Pinciano» — infobox `via Sassoferrato 11`,
  `periodo costruzione = 1919`, `ingegnere = Giovanni Sleiter`. «Fu edificata intorno al **1919** come
  residenza unifamiliare per il celebre baritono **Titta Ruffo**, su progetto dell'ingegner **Giovanni
  Sleiter**, ad opera dell'impresa edile di **Zeffiro Rossellini**, prozio del celebre regista
  Roberto.» Composite tufa, grey stone and exposed brick; several heterogeneous blocks around a
  five-storey central trunk; two square turrets; late liberty with Mediterranean vernacular terraces,
  loggias and *altane*; a large park with surviving stone pines and tall palms.
  https://it.wikipedia.org/wiki/Villa_Titta_Ruffo
* **DANGER:** «Si trova in **una delle zone di maggior pregio** della capitale» — banned. Drop it.

**70–77. The rest of Pinciano's own civil-architecture list** — `historic-site`, each thin but each
carrying a date and usually an author. All from https://it.wikipedia.org/wiki/Pinciano :

| # | Building | Address | Date | Author / note |
|---|---|---|---|---|
| 70 | **Ex Istituto Cabrini — Casa generalizia delle Missionarie del Sacro Cuore** | via Ulisse Aldrovandi | late 19th c., *barocchetto* | «Nel **1981** viene trasformato nell'albergo **Aldrovandi Villa Borghese**» |
| 71 | **Villa Serena** | via Carlo Dolci | 1909, neo-medieval | conversion of a *casino nobile* by the architect **Garibaldi Burba** |
| 72 | **Palazzo dell'Istituto Poligrafico dello Stato** | piazza Giuseppe Verdi | 1913–18, eclectic | **Garibaldi Burba**; seat of the institute until **2010** |
| 73 | **Villa Ambron** | via delle Tre Madonne | 1920, *barocchetto* | **Marcello Piacentini** |
| 74 | **Palazzina Marchi** | via Giacomo Carissimi | 1924, *barocchetto* | **Mario Marchi** |
| 75 | **Palazzina Giorgi** | via Antonio Bertoloni | 1927, *barocchetto* | engineer **Oscar Giorgi Alberti** |
| 76 | **Palazzina Virgili** | via Angelo Secchi | 1929, rationalist | **Pietro Aschieri** for Filippo Virgili; «Nel **1933** divenne residenza della figlia di Benito Mussolini, **Edda**, con il marito **Galeazzo Ciano**» |
| 77 | **Palazzina Acerbo** | via Nicolò Tartaglia | 1930, *barocchetto* | **Guido Fiorini** for the *gerarca* **Giacomo Acerbo**; «Attuale sede dell'**ambasciata del Venezuela**» |

Photo note for the later wave: Piacentini d. 1960, Aschieri d. 1952, Fiorini d. 1981 (**still in
copyright to 2051**), Morpurgo d. 1966, Ridolfi d. 1984 (**to 2054**). The Villino Astaldi's 1955–56
Ridolfi/Frankl campaign and the Palazzina Acerbo are photo problems.

**78. Aldrovandi Villa Borghese (hotel)** — `hotel`

* «un albergo di lusso a 5 stelle situato vicino al parco romano Villa Borghese», `indirizzo = Via
  Ulisse Aldrovandi`, 19th-century palazzo, formerly the **Istituto Cabrini**, a girls' boarding
  school run by the *Sœurs du Sacré-Cœur*. **92 rooms and 16 suites**, two restaurants, two bars, an
  outdoor pool, private gardens, nine meeting and banqueting rooms.
  https://it.wikipedia.org/wiki/Aldrovandi_Villa_Borghese
* **DANGER:** the article's Michelin two-star (2011) and the 2014 La Mer spa are **awards / commercial
  claims** and do not publish. Nor does its Leading Hotels of the World membership. The building
  history (Istituto Cabrini → hotel in 1981) is the publishable part and comes from Pinciano's own
  article. **Weak candidate; recommend `historic-site` on the ex-Cabrini building rather than a hotel
  record.** No street number sourced.

**79. Villa Giorgina** — see §3.1. **80. Villa Elia** — see §3.3.
**81. Palazzo Borromeo** — see §3.2.

---

### 4G — PARKS AND GARDENS OUTSIDE VILLA BORGHESE

From the OSM sweep, all polygon-tested inside Pinciano, all **OSM-only unless noted**:

**82. Giardino delle Belle Arti** (41.9197/12.47295) · **83. Giardino di Viale Tiziano**
(41.92243/12.47181) · **84. Giardino Renato Nicolini** (41.91826/12.48022) · **85. Giardino Armida
Barelli** (41.92058/12.48013) · **86. Giardini dell'Accademia Filarmonica Romana**
(41.91677/12.47471, and therefore caught by straddler S3) · **87. Giardino del Parco dei Principi**
(41.91725/12.49177) · **88. Fontana delle Tre Vasche** (41.92301/12.47165) and **Fontana delle
Conche** (41.91822/12.47338) · **89. Monumento ai fratelli Archibugi** (41.91942/12.47307).

None of these has a text source I could find. **All weak; several are probably municipal flower beds
rather than places.** I am listing them so the verifier can see the tail and cut it, not because I
think they ship.

---

### 4H — OTHER

**90. MACRI — Museo Ambiente e Crimine** — `museum`. At the Bioparco; OSM 41.91731/12.48647 →
Pinciano, `website=https://www.bioparco.it/il-museo-ambiente-e-crimine/`. **URL not fetched.** A
Carabinieri environmental-crime museum inside the zoo would be a genuinely distinctive subject if the
page is live; recommend a second fetch.

**91. Teatro del Pinguino** — `theater`. Puppet theatre, OSM 41.91846/12.48681 → Pinciano. Roma
Capitale's Villa Borghese services list includes «**Teatro burattini**».
https://www.turismoroma.it/it/luoghi/villa-borghese — that corroborates a puppet theatre in the park
without naming it. Thin.

**92. Next Museum Rome** — `museum`. **Corso d'Italia 37** per OSM (the same address as Santa Teresa
d'Avila — the venue occupies part of the block), `website=https://www.nextmuseum.net/en/exhibition-locations/next-museum-rome/`,
41.91119/12.49514 → Pinciano. **Not fetched.** A commercial immersive-exhibition venue; verify it is
still trading before proposing it.

**93. Stazione di Piazza Euclide** — `historic-site`. Station of the **Roma–Viterbo** line;
41.9276/12.4808 → Pinciano; in the `Roma Q. III Pinciano` category. Pinciano's own infrastructure
box: `{{Ferrovia atac|linea=RM-VT|Piazzale Flaminio|Piazza Euclide}}` and `{{metroroma|linea=A|Flaminio}}`.
https://it.wikipedia.org/wiki/Stazione_di_Piazza_Euclide (fetched, 5.9 kB, not read out).
Transport, not a sight; include only if the corpus wants stations.

**94. Istituto italiano per l'Africa e l'Oriente (IsIAO)** — in the `Roma Q. III Pinciano` category;
the institute was **wound up**, so this is history not a place.
https://it.wikipedia.org/wiki/Istituto_italiano_per_l%27Africa_e_l%27Oriente **Probably a reject.**

**95. Associazione italiana società concessionarie autostrade e trafori (AISCAT)** — also in the
Pinciano category. A trade association's office. **Reject.**

**96. Palazzo della Rinascente, piazza Fiume** — `shop` / `historic-site` — **STRADDLER**

it.wikipedia `Corso d'Italia (Roma)`: «Tra i più notevoli figura quello della **Rinascente**,
realizzato da **Franco Albini** e **Franca Helg** nel **1957**, che insiste sulla strada proprio
all'altezza della citata **piazza Fiume**.» Piazza Fiume is the exact hinge of the Pinciano /
Salario / Sallustiano boundaries by Pinciano's own footnotes. **Sallustiano is shipped and did not
take it.** Flag. Photo note: **Albini d. 1977, Helg d. 1989 — deep in architectural copyright, photo
reject.** https://it.wikipedia.org/wiki/Corso_d%27Italia_(Roma)

**97. Explora — Il Museo dei Bambini di Roma** — `museum` — **STRADDLER S3**

Its own site: «**Via Flaminia 82**, nel centro di Roma»; footer «**Via Flaminia, 80/86 – 00196 Roma –
Italia**». **Hours: Tuesday to Sunday, four sessions of 1 h 45 min — 10.00–11.45, 12.00–13.45,
15.00–16.45, 17.00–18.45. Closed Mondays.** https://www.mdbr.it/
Its it.wikipedia article does not exist under the title I tried. Facts are good; **the zone is not**.

**98. Accademia Filarmonica Romana and the Sala Casella** — `theater` — **STRADDLER S3**

* «**Via Flaminia 118 - 00196 Roma**», own site https://www.filarmonicaromana.org/ , which publishes a
  dated concert calendar (17, 24, 30 September; 2, 8, 11, 15 October 2026).
* «un ente privato senza scopo di lucro, **fondato a Roma nel 1821**… con lo scopo di favorire
  l'esecuzione di musica da camera e sinfonica, o per l'esecuzione in forma di concerto di opere
  liriche la cui rappresentazione fosse impedita dalla censura.» Made an official institution of the
  Papal State in **1824**; suspended **1849–1856** for money and **1860–1870** for politics
  (a number of academicians held liberal views); refounded by **Cesare De Sanctis on 4 January 1856**
  and again after 1870. From **1878** it had charge of the music at official commemorations in the
  **Pantheon**. In **1915** it took a new seat in **via di Ripetta**, the *Sala Sgambati*, and from
  **1920**, under the secretary **Romolo Giraldi**, it concertised in the auditorium built on the site
  of the **Mausoleo di Augusto**, which the fascist regime demolished in **1936** together with the
  Sala Sgambati. Activity suspended **1943**; refounded **1946** with **Alfredo Casella** as artistic
  director. https://it.wikipedia.org/wiki/Accademia_Filarmonica_Romana
* OSM has both the Accademia (41.91668/12.47402) and its **Sala Casella** (41.91654/12.47459) and its
  gardens. The it.wikipedia photo of the seat is filed under **Q01** (Flaminio).

**99. Chiesa di Sant'Andrea del Vignola (Sant'Andrea a via Flaminia)** — `historic-site` —
**STRADDLER S3, and its own article says Flaminio**

Facts if it lands here: built on the urban stretch of the **via Flaminia** between porta del Popolo
and ponte Milvio to a design by **Jacopo Barozzi da Vignola**; **Julius III had it raised about
1553** inside the complex of his suburban villa (Villa Giulia) in memory of his escape from Rome —
he had been a hostage during the **1527** sack and was probably to be executed, and got out on
**30 November**, the feast of St Andrew — so it is a votive church, private chapel and extra-urban
rural church. Partly restored **1826–1830**, **Giuseppe Valadier** among those involved; further work
in **1977** (dome clad in lead) and in the 1990s (dome returned to *coccio pesto*). The polychrome
floor was restored in **1950**. It is a subsidiary place of worship of the parish of **Sant'Eugenio**
(#49). https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Andrea_del_Vignola

**100. Fontana di Papa Giulio III (Ammannati)** — `historic-site` — **STRADDLER S3**. Facts under S3
and #81. OSM "Fontana di Papa Giulio" 41.91832/12.47331.

**101. Corso d'Italia** — `historic-site` — **STRADDLER S6**. If it is written: the first stretch grew
after **20 September 1870**, alongside the **1882 Viviani** master plan, on ground immediately outside
the Aurelian Walls near Porta Pia and via Nomentana, built speculatively though off-plan, in the
intensive-palazzo type, with *villini* left to the on-plan land right of via Nomentana; more buildings
went up along it in the new Pinciano quartiere beyond piazza Fiume in the 20th century. For the
**1960 Olympics** its level crossings were removed by building a long underpass, branched at the
eastern end with exits to viale del Policlinico and via Nomentana and one to via di Castro Pretorio,
and at the western end with exits to via Po, via Pinciana and Villa Borghese, joining straight on to
**viale del Muro Torto** and passing under Porta Pinciana and the via Veneto traffic.
https://it.wikipedia.org/wiki/Corso_d%27Italia_(Roma)

**102. Hotel Parco dei Principi** — `hotel`. OSM records its garden inside Pinciano
(41.91725/12.49177). No it.wikipedia article under the title I tried. **No sourced facts. Weak.**

---

## 5. HONEST YIELD ASSESSMENT

**This is a guide page, not a town page, and it is not close.** Pinciano has:

* **six state or civic museums** with published addresses, hours and tariffs (Galleria Borghese,
  GNAM, ETRU, Museo Canonica, Museo Carlo Bilotti, Museo Civico di Zoologia), plus the Bioparco;
* **an 80-hectare historic park** whose own municipal owner publishes its gates and its opening
  service hours;
* **four cinema/theatre venues** inside that park;
* **four parish churches** with dated fabric and named architects, one of them the prelatic church of
  Opus Dei with its founder's tomb;
* **three catacombs, a mausoleum, a late-antique hypogeum and a 4th-century-BC votive spring**;
* **a cluster of foreign academies** with the British School's Lutyens building at its centre;
* and a **twentieth-century villino belt** with named architects on nearly every entry.

Count: **102 numbered candidates**, of which I would call roughly **40 strong** (own-source address
and/or hours, own-source dates, clean geometry), **35 middling** (one text source, no visiting
information — most of the Villa Borghese fountains, gates, monuments and villini, best consolidated
into grouped records), and **27 weak or reject** (§4G's unsourced gardens, the trade-association and
wound-up-institute category entries, the two OSM-only wall features, Villa di Lucullo which belongs to
Campo Marzio, and the five subjects I expect to lose to Flaminio).

The honest risk in the other direction is **over-shipping Villa Borghese furniture**. Its
it.wikipedia article lists roughly **fifty fountains** and **forty monuments** in two tables. Most are
a name, a century and an avenue. Shipping them one by one would pad the file without giving a reader
anything. My recommendation is grouped records — one for the gates (#38), one to three for the
fountains (#39), one for the donated monuments (#40) — and individual records only where there is a
date, an author and something to see.

**What I could not get, and a second pass should try:**
1. **Galleria Borghese opening hours** — the site is a JS shell; only the footer is server-rendered.
2. **Globe Theatre current operating status** — no live official domain exists.
3. **jfroma.it** (Japanese Institute and its garden) — HTTP 400 to urllib.
4. **soprintendenzaspecialeroma.it** record for the Fonte di Anna Perenna — never attempted.
5. **nextmuseum.net** and the **bioparco.it MACRI** page — never attempted.
6. **Nominatim reverse geocoding** — rate-limited after eight calls; replaced by direct OSM relation
   polygons, which is the better method anyway and is what §1.5 rests on.
7. Addresses for **Academia Belgica**, the **Swedish Institute** and the **KNIR** — cookie walls.
8. **piazzadisiena.it** — HTTP 503.

## 6. PHOTO WAVE NOTES (no photographs taken or proposed in this wave; every record emits `"photos": []`)

* **Out of architectural copyright, safe subjects when the photo wave comes:** everything Borghese
  (Ponzio d. 1613, Vasanzio d. 1621, the Asprucci, Canina d. 1856), Villa Giulia (Vignola d. 1573),
  the GNAM building (Bazzani d. 1947), the British School (Lutyens d. 1944), Santa Teresa d'Avila
  (Passarelli d. 1941), Villa Lubin (Passerini; De Vico d. 1967 — **check**), Porta Pinciana and the
  walls.
* **In copyright, photo rejects:** Palazzina Acerbo (Guido Fiorini d. 1981 → 2051); the Villino
  Astaldi's Ridolfi/Frankl campaign (Ridolfi d. 1984 → 2054); the Rinascente at piazza Fiume (Albini
  d. 1977, Helg d. 1989 → 2059); Sant'Eugenio's sculpture programme (Nagni d. 1977, Monteleone d.
  1967) and probably the church itself (Galeazzi d. 1986, Redini — **check**).
* **Interiors:** the Museo Carlo Bilotti's collection (de Chirico d. 1978, Warhol d. 1987, Rivers d.
  2002) and the GNAM's modern and contemporary holdings are the two worst cases in the zone.
* **A rare explicit permission worth recording:** the GNAM's own visitor rules state «it is possible
  to take photographs without flash and amateur videos», with written authorisation required only for
  professional or commercial filming. https://lagallerianazionale.com/en/visit/
* Roma Capitale's own museums publish an *Autorizzazione riprese fotografiche* page
  (museocanonica.it, museocarlobilotti.it) — the route for the civic-museum interiors.
