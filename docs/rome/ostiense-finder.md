# Ostiense (Q. X, toponymic code 210) — FINDER

Wave 5. Finder only. **I am not deciding what ships.** Every straddler is flagged, not resolved.

---

## 0. COLLISION CHECK — run mechanically, before anything else

```
python3 .superpowers/taken_slugs.py                 -> 907 places across 21 shipped files
python3 .superpowers/taken_slugs.py paolo           -> 6 matches, NONE in Ostiense:
    castro-pretorio  chiesa-di-san-paolo-dentro-le-mura-rome
    celio            celio-basilica-santi-giovanni-e-paolo-rome
    celio            celio-casa-esercizi-clero-santi-giovanni-e-paolo-rome
    monti            pontificio-istituto-giovanni-paolo-ii-rome
    regola           regola-san-paolo-alla-regola-rome
    san-saba         porta-san-paolo-san-saba-rome                  <-- SHIPPED, not mine
python3 .superpowers/taken_slugs.py ostiense        -> 2 matches, BOTH San Saba:
    san-saba         museo-della-via-ostiense-san-saba-rome         <-- SHIPPED, not mine
    san-saba         palazzo-delle-poste-roma-ostiense-san-saba-rome <-- SHIPPED (Via Marmorata 4)
python3 .superpowers/taken_slugs.py piramide        -> testaccio piramide-di-caio-cestio-testaccio-rome  <-- SHIPPED
python3 .superpowers/taken_slugs.py montemartini    -> 0
python3 .superpowers/taken_slugs.py gazometro       -> 0
python3 .superpowers/taken_slugs.py commodilla      -> 0
python3 .superpowers/taken_slugs.py eataly          -> 0
python3 .superpowers/taken_slugs.py ponte           -> 58 matches; NONE of the five Ostiense bridges
                                                       (Industria, San Paolo, Marconi, Scienza,
                                                        Settimia Spizzichino) is among them
```

**Not one candidate below collides with a shipped slug.** The whole of Q. X Ostiense is unclaimed
by the twenty-one shipped files. The collision risk is with **Ardeatino and EUR, live in this same
wave**, plus the already-shipped San Saba / Testaccio edge at Piazzale Ostiense. §2.

---

## 1. BOUNDARY METHOD — what I actually did

Nominatim was not used. Instead I fetched six OSM boundary relations with Overpass
`out geom`, stitched each into a closed ring locally, and ran ray-cast point-in-polygon tests
against all six at once. Every relation closed cleanly (first vertex == last vertex, one ring each).

| unit | OSM relation | tags | ring pts |
|---|---|---|---|
| **Ostiense** | **5460386** | `place`, `ref=Q. X` | 445 |
| Testaccio | 5454344 | `place`, `ref=R. XX` | 148 |
| San Saba | 5454343 | `place`, `ref=R. XXI` | 415 |
| Portuense | 5460387 | `place`/`suburb`, `ref=Q. XI` | 454 |
| Ardeatino | 5473394 | `place`/`suburb`, `ref=Q. XX` | 791 |
| E.U.R. (Q. XXXII Europa) | 5460399 | `place`/`suburb`, `ref=Q. XXXII` | 248 |

Ostiense bbox: lat 41.83775–41.87773, lon 12.46054–12.49831. That is the six directions Ostiense
can leak into, and it matches the it.wikipedia quartiere page's own boundary prose verbatim:

> «Il quartiere confina: a nord con i rioni R. XX Testaccio [Separato dalle Mura Aureliane, dal
> fiume Tevere a Porta San Paolo] e R. XXI San Saba [Separato dalle Mura Aureliane, da Porta San
> Paolo a Porta Ardeatina]; a est con il quartiere Q. XX Ardeatino [Separato da via Cristoforo
> Colombo … e da via Laurentina …]; a sud con il quartiere Q. XXXII Europa [Separato da viale
> dell'Atletica e dal viadotto della Magliana fino al fiume Tevere]; a ovest con il quartiere Q. XI
> Portuense [Separato dal fiume Tevere, dal viadotto della Magliana al Ponte dell'Industria].»
> — `https://it.wikipedia.org/w/api.php?action=parse&page=Ostiense&prop=wikitext`

Three independent confirmations that the polygon is the right one:

- **The Aurelian Walls are the north edge.** Every point outside the walls between Porta San Paolo
  and Porta Ardeatina tests Ostiense; every point inside tests San Saba or Testaccio.
- **Testaccio's own finder handed me a list.** Its §5 "THINGS I DELIBERATELY DID NOT CLAIM" reads:
  *"Piramide metro station, Roma Porta San Paolo rail station, Polo museale ATAC Porta San Paolo,
  Roma Ostiense station → Ostiense (Q. X). All test outside every rione polygon except Ostiense"*
  and *"Centrale Montemartini (41.86685, 12.47575) → outside all six polygons, i.e. deeper into
  Ostiense"* and *"Basilica di San Paolo fuori le Mura → Ostiense"*. All four re-tested here on my
  own polygon: **Ostiense, 4 of 4.**
- **wave4-arbitration.md** ruled *"Piazzale Ostiense · Piazza di Porta San Paolo · the 1943 plaques ·
  the Piramide/Ostiense transport cluster — **OUT of Testaccio; San Saba and Q. X Ostiense**"*.

### 1.1 What the toponymic layer actually says — read before writing a locator

Ostiense is a **quartiere**, not a rione. Roma Capitale's own framing (quoted in
`docs/rome/scope-quartieri.md` §2.1) is that these areas «non hanno alcuna relazione con le aree
urbanistiche né amministrative». Consequences, all verified from it.wikipedia infoboxes:

- **Q. X Ostiense straddles THREE Municipi: I, VIII and IX.** Its own infobox reads
  `circoscrizione = Municipio Roma I, Municipio Roma VIII e Municipio Roma IX`. **DO NOT put a
  single Municipio on the zone page.** Individual buildings may carry one only where a source states
  it *for that building* — e.g. Forte Ostiense («nel territorio del Municipio Roma IX») and the
  Stazione di Roma Porta San Paolo («nel territorio dell'VIII Municipio») each name their own.
- **The zone urbanistiche inside it**, from the same article: *«l'omonima 11A, la 11B Valco San
  Paolo e la 11C Garbatella per intero, a sud la parte nord della 12A Eur e a nord la parte sud
  della 1C Aventino.»*
- **GARBATELLA IS 11C AND IS PART OF THIS QUARTIERE, not a unit of its own.** Verbatim:
  «Garbatella è la denominazione dell'abitato fondato il 18 febbraio del 1920 e che ad oggi coincide
  con la zona urbanistica **11C** del Municipio Roma VIII di Roma Capitale. **La zona è compresa nel
  quartiere decimo (Q. X) Ostiense.**» — `https://it.wikipedia.org/w/api.php?action=parse&page=Garbatella&prop=wikitext`
- **MARCONI IS NOT MINE.** «Marconi … è la zona urbanistica **15A** del Municipio Roma XI … Si
  estende sul quartiere **Q. XI Portuense**» — `…page=Marconi%20(zona%20di%20Roma)`. Only the bridge
  named after Marconi touches Ostiense. Anything else "in Marconi" belongs to Portuense.
- **Roma Capitale's own tourism office markets this area as "Ostiense - Garbatella - San Paolo"** —
  that string is the area tag on turismoroma.it's pages for both Centrale Montemartini and San Paolo
  fuori le Mura. Useful framing for a zone page; it is *not* a toponymic unit.

Because a quartiere is large, **"in Ostiense" is a weak locator and must not be the only one.**
Every candidate below carries a street address where a source gives one.

---

## 2. STRADDLERS AND FLAGS — read this before anything else

I am not resolving any of these.

### 2a. THE FOUR RIVER BRIDGES ALL STRADDLE. The railway flyover does not.

| bridge | test | it.wikipedia categories | verdict |
|---|---|---|---|
| **Ponte dell'Industria** ("ponte di ferro") | midspan 41.871909, 12.471948 → **Portuense**; east abutment on via del Porto Fluviale 41.872157, 12.474000 → **Ostiense** | article text: *«collega via del Porto Fluviale a via Antonio Pacinotti, tra i quartieri Ostiense e Portuense»* | **STRADDLER, Ostiense/Portuense** |
| **Ponte San Paolo** (rail) | 41.872600, 12.471666 → Portuense side | `Roma R. XX Testaccio` + `Roma Q. X Ostiense` + `Roma Q. XI Portuense` | **TRIPLE STRADDLER**, and Testaccio is already shipped |
| **Ponte Guglielmo Marconi** | 41.860048, 12.470377 → **Ostiense** | `Roma Q. X Ostiense` + `Roma Q. XI Portuense`; text names Municipio XII north, Municipio VIII south | **STRADDLER** |
| **Ponte della Scienza Rita Levi-Montalcini** | 41.868489, 12.473719 → **Ostiense** | article: *«nei quartieri Portuense e Ostiense»* | **STRADDLER** |
| **Ponte Settimia Spizzichino** (Cavalcavia Ostiense) | 41.867163, 12.484076 → **Ostiense** | `Roma Q. X Ostiense` only; it crosses the *railway*, not the river | **CLEAN. Ostiense.** |

**Do not let Ostiense and Portuense each publish four bridges.** One owner each, or a named half.

### 2b. THE PIAZZALE OSTIENSE CLUSTER — partly already shipped to San Saba

Wave 4 ruled Porta San Paolo, the Museo della Via Ostiense and the Palazzo delle Poste to
**San Saba**, and those three are live. What wave 4 explicitly did **not** award to San Saba, and
what tests Ostiense on my polygon:

| place | point | result |
|---|---|---|
| Piramide metro station (building) | 41.874972, 12.482406 | **Ostiense** |
| Stazione di Roma Porta San Paolo (Roma-Lido terminus) | 41.875393, 12.481637 | **Ostiense** |
| Polo museale ATAC Porta San Paolo | 41.875040, 12.481168 | **Ostiense** |
| Stazione di Roma Ostiense (FS) | 41.872863, 12.484286 | **Ostiense** |
| the four 1943 memorial plaques at the gate | 41.876224 / .876229 / .876219 / .876234, 12.4805 | **Ostiense**, 4 of 4 (Testaccio's own test) |
| "Piazza di Porta San Paolo" ways | 10 of 10 (Testaccio's test) | **San Saba** |

Textual backing beyond geometry: it.wikipedia on the Roma-Lido terminus says *«Posta nel quartiere
Ostiense, nel territorio dell'VIII Municipio»*; the Polo museale article says *«L'ingresso è situato
in via Bartolomeo Bossi, 7 nel quartiere Ostiense»*.

**Flag: the four 1943 plaques and Piazza di Porta San Paolo point in opposite directions.** San Saba
holds the piazza and the gate; the plaques test Ostiense. An arbitrator should keep them together
with the gate rather than split a single memorial group across two files. **I am not claiming them.**

### 2c. THE PYRAMID AND THE WALLS ARE ALREADY SHIPPED. Do not re-take them.

Testaccio's finder recorded that 3 of the Pyramid's 8 OSM footprint vertices fall in Ostiense, and
that the walls' stretch at the Pyramid (41.876335, 12.480681) tests Ostiense. Both are shipped
(`piramide-di-caio-cestio-testaccio-rome`, `mura-aureliane-segment-testaccio-rome`). **Ostiense may
mention the walls as its northern edge; it may not claim a walls place, and may not claim the
Pyramid.**

### 2d. CASA DEL JAZZ — Ostiense on every test, but its address invites an Ardeatino claim

Address is **Viale di Porta Ardeatina 55, 00154 Roma** (its own site, `https://www.casadeljazz.com/i-luoghi/`).
That street name will read as Ardeatino to Ardeatino's finder. Evidence it is Ostiense:
- polygon tests: 41.873334, 12.493693 and 41.873484, 12.494903 → **Ostiense**, both; **not** in the
  Ardeatino relation (whose western bbox limit is lon 12.47899, well east of the villa).
- it.wikipedia categorises the article `[[Categoria:Roma Q. X Ostiense]]`.
- structurally consistent with the quartiere page: everything *outside* the Aurelian Walls between
  Porta San Paolo and Porta Ardeatina is Ostiense.
**FLAG, do not resolve.** Ardeatino should be asked to concede or contest.

### 2e. THE SOUTHERN TAIL — Tre Fontane, and where Ostiense stops

The OSM polygon runs south to lat 41.83775, which puts a strip of **Via delle Tre Fontane** and the
**Stadio Tre Fontane** rugby ground (41.841239, 12.470094) inside Ostiense. Adjacent points a few
hundred metres east test **Europa** or **Ardeatino**. The toponym "Tre Fontane" belongs to a zona
urbanistica next to EUR, and the abbey that gives it the name is *not* mine:

- **Chiesa di San Paolo alle Tre Fontane**, 41.833867, 12.484189 → **Ardeatino**
- **Chiesa di Santa Maria del Terzo Millennio alle Tre Fontane**, 41.836096, 12.480140 → **Europa**
- it.wikipedia on the **Abbazia delle Tre Fontane**: *«dà il nome alla zona urbanistica Tre Fontane,
  in prossimità dell'EUR»* — `…page=Abbazia%20delle%20Tre%20Fontane`
- `docs/rome/scope-quartieri.md` §3.2 assigns the whole Tre Fontane abbey complex to **Q. XX Ardeatino**.

**I do not claim the Tre Fontane abbey complex or anything using the Tre Fontane name.** I flag the
sports-ground strip as a polygon artefact that Ardeatino/EUR may want. **Low confidence.**

### 2f. OTHER FLAGS

- **Circonvallazione Ostiense** is categorised `Roma Q. X Ostiense` + `Roma Q. XX Ardeatino` +
  `Roma Q. IX Appio-Latino`. Three quartieri. Not a clean place for anyone.
- **Roma Tre's Dipartimento di Architettura**, Largo G. B. Marzi 10, tests **Testaccio** (it is in
  the ex-Mattatoio, which is shipped as `mattatoio-di-roma-testaccio-rome`). A "Università Roma Tre"
  place in Ostiense must be written as the *Ostiense campus* and must not sweep the Mattatoio in.
- **Forte Ostiense** (41.844257, 12.474013 → Ostiense) is categorised `Roma Q. X Ostiense`, but its
  own article puts it in **Municipio IX** and its neighbours are Montagnola. **Moderate confidence.**
- **Basilica di Santa Maria Regina degli Apostoli alla Montagnola** (41.853371, 12.483153 →
  Ostiense) is categorised `Chiese di Roma - Q.X Ostiense` and the article says *«nel quartiere
  Ostiense, in via Antonino Pio»* — but "Montagnola" is a toponym normally used for the
  Ardeatino/Giuliano-Dalmata edge. **Flag; textual evidence favours Ostiense.**
- **Catacomba di Santa Tecla** (via Silvio d'Amico, ≈41.851, 12.4782 → Ostiense) sits in the
  southern strip near Montagnola. Article says *«nel quartiere Ostiense»*. Fine, but note it.
- **The zona 12A Eur overlap.** The quartiere page says Ostiense contains "la parte nord della 12A
  Eur". EUR is a separate zone in this wave. Nothing I claim is inside that overlap, but the EUR
  finder should be told.

---

## 3. THE VATICAN RULING'S TEST CASE: SAN PAOLO FUORI LE MURA

This is the property that forced `vatican_ruling`. Here is exactly what the primary text says, so
the writer does not have to guess.

**Lateran Treaty, 11 February 1929, Italian text on vatican.va**
(`https://www.vatican.va/roman_curia/secretariat_state/archivio/documents/rc_seg-st_19290211_patti-lateranensi_it.html`):

> **Art. 13** — «L'Italia riconosce alla Santa Sede la piena proprietà delle Basiliche patriarcali di
> San Giovanni in Laterano, di Santa Maria Maggiore e di San Paolo, cogli edifici annessi (Alleg. II,
> 1, 2 e 3). Lo Stato trasferisce alla Santa Sede la libera gestione ed amministrazione della detta
> Basilica di San Paolo e dell'annesso Monastero…»
>
> **Art. 15** — «Gli immobili indicati nell'art. 13 … **benché facenti parte del territorio dello
> Stato italiano**, godranno delle immunità riconosciute dal diritto internazionale alle sedi degli
> agenti diplomatici di Stati esteri.»
>
> **Art. 16** — a *different* list (Università Gregoriana, Istituto Biblico, Orientale,
> Archeologico, Seminario Russo, Collegio Lombardo, the two palazzi of Sant'Apollinare, the Casa
> degli esercizi per il Clero di San Giovanni e Paolo) which gets only exemption from expropriation
> and from taxation. **San Paolo is Art. 13/15, not Art. 16. Do not conflate.**

**The Holy See's own list** — *Zone extraterritoriali vaticane*, Sala Stampa, updated 03.04.2001
(`https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html`)
— item 3 of 13: *«la Basilica di S. Paolo fuori le Mura con gli edifici annessi»*, described as
enjoying «il privilegio della extraterritorialità» and exemption from expropriation and taxes.

**How the page must read.** The basilica stands on Italian soil, two kilometres outside the Aurelian
Walls, in quartiere Q. X Ostiense. It has the immunities of a diplomatic mission's premises under
Art. 15. It is **not** "in the Vatican", **not** "Vatican territory", and **not** a border you cross.
it.wikipedia states the geography plainly: *«Sorge lungo la via Ostiense, nell'omonimo quartiere,
vicino alla riva sinistra del Tevere, a circa 2 km fuori dalle mura aureliane»*.

**The UNESCO inscription may be stated as an inscription, and it names this basilica.** The property
is *"Historic Centre of Rome, the Properties of the Holy See in that City Enjoying Extraterritorial
Rights and San Paolo Fuori le Mura"*, inscribed 1980 (it.wikipedia UNESCO infobox on the basilica
article; `docs/rome/scope-vatican-and-extraterritorial.md` records the same title with ID 91ter).
**NO ZONE MAY CLAIM TO LIE INSIDE THE PROPERTY.** State the inscription's own name and date. Nothing
more.

---

## 4. CANDIDATES

Kind values are from the thirteen the schema allows (`kind_note`). There is no church/monument/
bridge/square kind: those are `historic-site`.

### 4.1 THE SAN PAOLO COMPLEX — Piazzale San Paolo 1, 00146 Roma

**C01 · Basilica papale di San Paolo fuori le Mura** — `historic-site`
Piazzale San Paolo 1, 00146 Roma (own site, footer of every page:
`https://www.basilicasanpaolo.org/`). Test point 41.858790, 12.476570 → Ostiense; turismoroma's own
`POINT (12.47661 41.859004)` → Ostiense.
- **Hours, from the basilica's own site** (`https://www.basilicasanpaolo.org/orari/`): *"La Basilica
  è aperta ogni giorno dalle 07:00 alle 18:30, ingresso libero."* Sacristy 08:00–12:00 and
  16:00–18:30 daily. Confessions 10:00–12:00 and 16:00–18:30. Mass Mon–Fri 07:00, 10:00, 17:00;
  Sat 07:00, 10:00, 18:00; Sun 08:00, 10:00 (conventual), 12:00, 18:00.
- Consecrated 18 November 324 under Silvestro I, founded by Constantine; rebuilt under Theodosius,
  Arcadius and Valentinian II from 391; that fabric stood until the fire of **1823**.
- Rebuilding ordered by **Leo XII** (encyclical *Ad plurimas*, 25 January 1825; chirograph of
  18 September 1825 requiring that «niuna innovazione dovrà dunque introdursi nelle forme e
  proporzioni architettoniche»). Works directed by **Pasquale Belli** on a Valadier scheme; the
  present appearance is largely **Luigi Poletti**'s. Altar of the Confession dedicated by Gregory XVI
  5 October 1840; whole basilica consecrated by **Pius IX on 10 September 1854**.
- Donors named in the article: **Tsar Nicholas I** gave the malachite for the two transept altars;
  the Viceroy of Egypt sent the alabaster columns; **King Fuad I of Egypt** gave the alabaster
  window slabs after the 1891 Forte Portuense explosion shattered Antonio Moroni's 1830 glass.
- Dimensions: **131 m long, 65 m wide, 29.70 m high** (Zeppegno 1996 p. 45, cited in the article).
- **Quadriportico** 70 m square, built 1890–1928 by **Giuseppe Sacconi** and **Guglielmo Calderini**
  on Poletti's scheme; central marble statue of St Paul by **Giuseppe Obici**; gates by **Gino
  Benigni**, competition 1913, installed 1926; damaged in the earthquake of 30 October 2016.
- **Façade mosaics** 1854–1874 to cartoons by **Filippo Agricola** and **Nicola Consoni**.
- **Doors**: central bronze door by **Antonio Maraini**, 1931, 7.48 × 3.35 m. The right-hand door is
  the 11th-century **"porta bizantina"**, 54 panels, main entrance until 1967, since then the inner
  face of the Holy Door. **Porta Santa** by **Enrico Manfrini**, 3.71 × 1.82 m.
- **Campanile** by Poletti, finished 1860, five orders; seven bells, six cast 1959 by the Pontificia
  fonderia Marinelli of Agnone, the highest dating 1653; the great bell "Pierpaola" sounds G2, 2 m
  diameter, ≈5,000 kg.
- **Interior**: Latin cross, five aisles, four rows of 20 monolithic Montorfano granite columns.
  Roundel portraits of every pope from St Peter to Leo XIV, begun 1847; **267 tondi at present, with
  25 medallions still empty** after 25 more were added under John Paul II. 36 frescoes of the life of
  St Paul above them, finished 1860. Over **1,700 inscribed slabs** recovered, from an estimated
  5,000+ burials still under the floor.
- **Triumphal arch of Galla Placidia**, 5th-c. mosaic under Leo I, two inscriptions (ICUR II 4780 and
  4784). **Apse mosaic** made under **Honorius III (1216–1227)**. **Ciborium by Arnolfo di Cambio**,
  1285, for Abbot Bartolomeo, with a *socius Petrus*. **Paschal candelabrum by Pietro Vassalletto
  and Nicolò D'Angelo, 1170.**
- **Four transept chapels**: Santo Stefano (Podesti's *Martirio*, statue by Rinaldo Rinaldi);
  Santissimo Sacramento by **Carlo Maderno**, which survived the 1823 fire, with a wooden crucifix
  Vasari gave to Pietro Cavallini (more probably early-14th-c. Sienese; others say Tino da Camaino);
  San Lorenzo, also Maderno, with a **marble triptych by Andrea Bregno, 1494**; San Benedetto by
  Poletti, statue by **Pietro Tenerani**, twelve antique columns from **Veii**. Adjoining is the
  **Sala del Martirologio (oratory of San Giuliano)** with 12th–13th-c. fresco fragments.
- **Great organ** built 1857–58 by Enrico Priori from Serassi material, moved here 1858 (Serassi
  *opus 649*); electric action, **36 stops, 2,556 pipes**. Second organ in the San Lorenzo chapel,
  probably **William George Trice, 1891**, 12 stops, 698 pipes.
- Only two popes are buried inside: **Felix III and John XIII**.
- Sources: `https://it.wikipedia.org/w/api.php?action=parse&page=Basilica%20di%20San%20Paolo%20fuori%20le%20mura&prop=wikitext` ·
  `https://www.basilicasanpaolo.org/orari/` · `https://www.turismoroma.it/it/luoghi/basilica-di-san-paolo-fuori-le-mura`

**C02 · Chiostro e Area Espositiva e Archeologica di San Paolo** — `museum`
Entered from the basilica. Own site, `https://www.basilicasanpaolo.org/chiostro-e-area-archeologica/`
and `https://www.basilicasanpaolo.org/orari/`:
- **Open daily 08:00–18:00, last entry 17:30. €4.00, reduced €3.00; groups over ten €3.00 a head,
  group leader free.**
- The 13th-century **cloister** (Jacopo and Pietro Vassalletto per turismoroma), plus the
  **Pinacoteca**, the **Cappella delle Reliquie** and a gallery.
- The **archaeological area** was excavated 2007–2009 in the abbey's kitchen garden and **opened to
  the public on 1 July 2013**. About 1,000 m². It contains: an 8th–15th-century building yard (mortar
  tanks, a lime kiln, marbles staged for burning); remains of the late-antique **porticus sancti
  Pauli** that led from the city to Paul's tomb; and rooms of a monastery of Santo Stefano, later
  perhaps inside the fortified **Johannipolis**. Work directed by the **Musei Vaticani** with the
  Pontificio Istituto di Archeologia Cristiana and La Sapienza.
- The cloister holds fragments from the old basilica and finds from the neighbouring **sepolcreto
  ostiense** (turismoroma).
- **BANNED PHRASE ALERT.** turismoroma calls the cloister *«una delle meraviglie della Roma
  duecentesca»* and calls a small bell-tower base found in 2007 *«il più antico esempio di questo
  tipo di costruzione conservato a Roma»*. **Both are superlatives. Do not reproduce either,
  attributed or not.**

**C03 · Abbazia benedettina di San Paolo fuori le Mura** — `historic-site`
OSM way 110134183, 41.857780, 12.477021 → Ostiense. Own site `https://www.abbaziasanpaolo.org/`.
- The territorial abbacy was **suppressed 7 March 2005**; on **31 May 2005** Benedict XVI's motu
  proprio *L'antica e venerabile Basilica* set an archpriest over the basilica with the abbot as his
  vicar for pastoral care. Archpriests: Cordero Lanza di Montezemolo 2005–2009, Monterisi 2009–2012,
  **James Michael Harvey since 23 November 2012**. Abbot at the site's own date: **Dom Donato Ogliari**.
- The monks have kept the tomb's liturgy and votive lamp since the 8th century. The abbey holds a
  monumental **library** whose origins the abbey traces to a **1608 motu proprio of Paul V**.

**C04 · Giardino monastico e Spezieria monastica dell'Abbazia** — `attraction`
**Entrance Via Ostiense 186**, at the abbey's Spezieria (own site,
`https://www.abbaziasanpaolo.org/giardino-monastico/`).
- Guided visits **by booking only, in two seasons a year, spring and autumn**, small groups, with a
  participation fee. Tel **06 698 80 811**, `giardino@abbaziasanpaolo.org`.
- Contains the **orto dei semplici (*hortus simplicium*)** growing the officinal plants used for the
  herbal preparations sold at the Spezieria monastica.
- The abbey's own page calls it *«normalmente non accessibile al pubblico»* — so a `status` of
  "open" would contradict the prose. **This one needs a careful status field.**
- **BANNED PHRASE ALERT.** The abbey's own copy uses «un giardino unico nel suo genere» and «un
  luogo di straordinaria bellezza»; turismoroma adds «una splendida oasi». All banned.

### 4.2 ARCHAEOLOGY

**C05 · Sepolcreto della via Ostiense (Necropoli di San Paolo)** — `historic-site`
In **Parco Ildefonso Schuster**, on via Ostiense. 41.860040, 12.478129 → Ostiense.
Sovrintendenza Capitolina, `https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/necropoli_di_san_paolo`
(the official name on that page is **"Sepolcreto della via Ostiense"**, not "Necropoli di San Paolo").
- A large necropolis along the via Ostiense between the Rupe di San Paolo and the Tiber bend; Paul's
  burial was in one of these tombs and the cult site grew around it. Most of it is still buried.
- Finds recorded in the 1700s; notable discoveries 1859 and 1872 in the vigna Villani at the corner
  of via Ostiense and via delle Sette Chiese; a large 1897/98 sewer trench destroyed many burials but
  produced much epigraphy; the **1917/18** widening of via Ostiense documented the surviving sector,
  and a further **1933** widening exposed the tombs now visible. Continuous use **1st c. BC to 4th c.
  AD**, showing the change from cremation to inhumation. Oldest structures are quadrangular
  *columbaria*.
- The 1917/18 sector was roofed, restored and **annexed to Parco Schuster for the Jubilee of 2000**.
- **Visitor terms, from the same page**: groups only, max 25 per visit, **booking obligatory on
  060608, 09:00–19:00**; individual visits also possible by booking on a published calendar.
  **€4.00 full, €3.00 reduced; free for residents of Rome and the metropolitan area and for MIC
  card holders.** Guided tour not included. **The area is accessible to disabled visitors.**

**C06 · Tombe della Rupe di San Paolo** — `historic-site` (or a section of C05)
Same Sovrintendenza page. A newly restored sector by the Rupe di San Paolo, restored under the
**PNRR Caput Mundi** programme, **opened to the public on Wednesday 8 July 2026, 18:00–19:30 (last
entry 19:00)**. **Nine burials**, seen from the street front and around an internal courtyard,
showing the change from cremation to inhumation during the 2nd century AD. New display with
**full-size reproductions of three frescoed lunettes**, new lighting and interpretive panels.
Courtyard access capped at **10 people at a time**. A visit to the Sepolcreto now includes it, as a
single one-hour route.

**C07 · Catacomba di Commodilla** — `historic-site`
**Via delle Sette Chiese 42, 00145 Roma.** 41.861213, 12.483410 → Ostiense.
Pontificia Commissione di Archeologia Sacra,
`https://www.catacombeditalia.va/content/archeologiasacra/it/visita-catacombe/per-regione/roma/catacomba-di-commodilla.html`
- **"Visita su richiesta"** — by request only. Tel +39 064465610 / +39 064467601;
  `protocollo@arcsacra.va`. There is a published «Regolamento per la visita delle catacombe chiuse
  al pubblico». **Status field must reflect "by request", not "open".**
- Named probably for the Roman matron who gave the land; holds **Felix and Adauctus**, martyred
  under Diocletian in the early 4th century, in an underground basilica arranged by **Damasus
  (366–384)** and **Siricius (384–399)** and better defined under **John I (523–526)**.
- Paintings: the **"Madonna di Turtura"** (Virgin enthroned between Felix and Adauctus, with the
  elderly deceased), a St Luke, a *Traditio clavium*, and the **cubiculum of Leo, an official of the
  Annona**.
- it.wikipedia adds: three levels, the middle one cut in an old **pozzolana quarry**; burials cease
  after the end of the 4th century, devotional use in the 5th–6th; papal restorations to the 9th c.;
  coins of **Gregory IV (827–844)** found; **Leo IV (847–855)** gave the martyrs' relics to the
  Emperor Lothair's wife. Rediscovered by **Antonio Bosio in 1595**, identified as Commodilla by
  **Giovanni Battista de Rossi** in the 19th century; early-20th-century campaigns fully excavated
  the second level. Distinctive **"a pozzo" burials**, shafts with up to 20 stacked loculi.
  Entrance is in the **Parco di Commodilla** (ex vigna Serafini) per the Garbatella article.
- **BANNED PHRASE ALERT.** The PCAS page says «l'affresco più celebre del complesso» and «uno dei
  vertici della produzione artistica della Roma sotterranea cristiana». Both banned.

**C08 · Catacomba di Santa Tecla** — `historic-site`
Along **via Silvio d'Amico** (which follows the old via delle Statue), near San Paolo. ≈41.851,
12.4782 → Ostiense. it.wikipedia: *«nel quartiere Ostiense»*. Small: an underground basilica of the
4th century over a 3rd-century cemetery, three ambulacra in an isosceles triangle with **22 burial
chambers**. Who Tecla was is unresolved — Paul Styger argued for Thecla of Iconium; Umberto Maria
Fasola for a Roman woman martyred under Diocletian. Excavated by Fasola in the later 20th century.
**No opening information found from PCAS on this one; say so by saying nothing.**
Source: `https://it.wikipedia.org/w/api.php?action=parse&page=Catacomba%20di%20Santa%20Tecla&prop=wikitext`

**C09 · Cisterna della via Colombo** — `historic-site`
OSM way 66599244, 41.864667, 12.496765 → Ostiense.
`https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/cisterna_della_via_colombo`
Found in **1940** under a farmhouse demolished during the cuttings for the via Imperiale (now via
Cristoforo Colombo); clearance finished **1969**; conservation and presentation **1991–92**. A large
circular cistern of the **early 2nd century AD** in *opus reticulatum*, with a smaller circular
structure attached: trapezoidal vestibule, a vaulted annular corridor divided into ten intercommunicating
bays, a second undivided concentric corridor, and a domed central chamber almost 3 m across, all
lined in *signino*. **No hours given on the page. Say nothing about access.**

**C10 · Forte Ostiense** — `historic-site` — **MODERATE CONFIDENCE, see §2f**
41.844257, 12.474013 → Ostiense. it.wikipedia, categorised `Roma Q. X Ostiense`:
*«Si trova nel quartiere Q. X Ostiense, nel territorio del Municipio Roma IX.»* One of the fifteen
forts of Rome built 1877–1891; **begun 1882, finished 1884, 8.8 ha, at the fourth kilometre of via
Ostiense**, from which it takes its name. Now assigned to the **Polizia di Stato** (Centro
Psicotecnico, Servizio Tecnico Logistico). On **10 September 1943** some eight hundred Grenadiers
held out here against German paratroopers who had come through the EUR; Don Pietro Occelli,
director of the Istituto Gaetano Giardino next door, raised a white sheet to surrender the fort;
Suor Teresina di Sant'Anna (Cesarina D'Angelo) died on 8 May 1944 of injuries from a German soldier
she struck in the fort's chapel. **This is a police facility — it is not open, and the prose must
not imply it is.**
Source: `https://it.wikipedia.org/w/api.php?action=parse&page=Forte%20Ostiense&prop=wikitext`

### 4.3 INDUSTRIAL ARCHAEOLOGY, MUSEUMS AND TRANSPORT

**C11 · Musei Capitolini Centrale Montemartini** — `museum` — **STRONGEST CANDIDATE AFTER SAN PAOLO**
**Via Ostiense 106, 00154 Roma.** 41.866622, 12.478033 → Ostiense.
`https://www.centralemontemartini.org/it/informazioni_pratiche/orari_e_indirizzi`
- **Hours: Tuesday to Sunday 09:00–19:00.** 24 and 31 December 09:00–14:00. Last entry one hour
  before closing. **Closed Mondays, 1 May and 25 December.** Call centre 060608 daily 09:00–19:00.
  `info.centralemontemartini@comune.roma.it`.
- **Tickets** (`…/informazioni_pratiche/biglietti`): **full €11.00, reduced €6.50**; free for
  residents of Rome and the metropolitan area on production of ID (from February 2026) and for MIC
  card holders. **Capitolini Card** (7 days, Musei Capitolini + Centrale Montemartini) **€15.50 full,
  €11.50 reduced.**
- **The building** (`…/infopage/la-centrale-elettrica`): a municipal thermoelectric station
  **inaugurated in 1912** under mayor **Ernesto Nathan**, named in **1913** for **Giovanni
  Montemartini**, Nathan's technical assessor, who died during a council session. Built after the
  **referendum of 20 September 1909** on municipalising public services, which also created the AEM,
  today's **Acea**. Sited between via Ostiense and the Tiber for continuous water, rail and road
  access, and because it lay **outside the customs boundary** and so paid no fuel duty. Steam
  turbines with their boilers ran alongside diesel engines: turbines for base load, diesels for
  peaks. **Decommissioned in the mid-1960s.** Acea converted the Sala Macchine and the new Sala
  Caldaie into an art centre in the late 1980s.
- **The museum** (`…/il_museo/storia_del_museo`): began **1997**, when Capitoline sculpture was moved
  here during the Capitoline restoration; the exhibition **"Le macchine e gli dei"** opened
  **October 1997**; it became a **permanent museum in 2001**; in **November 2016** a new room opened
  displaying the three carriages of the **train of Pius IX, of 1858**.
- Named works on the site's own pages: the pediment statues of the **temple of Apollo Sosianus**, the
  colossal acrolith of **Fortuna** from Largo Argentina, the muse **Polimnia**, the seated girl, the
  portrait of **Cleopatra**, the **Marsyas**, and the great hunting mosaic from **S. Bibiana**. Sala
  Macchine keeps its turbines, diesel engines and steam boiler with **Liberty-style fittings**.
- **BANNED PHRASE ALERT.** The museum's own copy says *«La Montemartini è stata la prima centrale
  pubblica di produzione di elettricità a Roma»* and *«uno straordinario esempio di riconversione»*
  and *«il primo impianto pubblico di Roma»*. turismoroma repeats them. **Priority claims and
  superlatives. Do not publish any of them, attributed or not.** The publishable facts are the
  1912 inauguration, the 1909 referendum, the 1913 naming, the 1960s closure and the 1997/2001 dates.

**C12 · Gazometro (Gasometro) di Roma** — `historic-site`
**Via del Commercio.** OSM way 26840361, 41.869526, 12.474700 → Ostiense.
`https://it.wikipedia.org/w/api.php?action=parse&page=Gazometro%20di%20Roma&prop=wikitext` ·
`https://www.info.roma.it/monumenti_dettaglio.asp?ID_schede=11019` (gives Via del Commercio and
"Quartiere dell'area Urbana di Roma: Q.X Ostiense", date 1936)
- The gasworks and the first gasholders were designed **1909** for the gas plant Ernesto Nathan
  wanted. Three smaller holders built by **Samuel Cuttler & Sons of London, 1910–1912**, of 25,000 m³
  each for the two smaller and 60,000 m³ for the third.
- The great frame was erected by **Ansaldo of Genoa with Klönne of Dortmund between 1935 and 1937**,
  for the **Società Anglo-Romana per l'Illuminazione di Roma col Gas**. **89.10 m high, 63 m in
  diameter, 200,000 m³**, 1,551 piles driven for a total pile length of 36 km.
- After decommissioning the holder bell itself was removed; **only the surrounding steel frame
  stands**. Of the three smaller holders one became a gas pressure-reduction plant, one a technical
  building with a boiler house and stores, one a multi-storey car park.
- **Eni has owned the site since 1967**, inherited with Italgas via Snam. The area is over 12
  hectares. 2006 saw the "Luxometro" lighting work; Eni's **Joule** school opened 2020, the **ZERO**
  cleantech accelerator from 2021, **Eni 2050 Lab** in building 30 in 2022, and **ROAD (Rome
  Advanced District)** was inaugurated on **17 May 2023** by Eni, Acea, Autostrade per l'Italia,
  Bridgestone, Cisco, Gruppo FS and Nextchem. **Maker Faire Rome** was held here in 2021 and 2022.
- **This is a working private industrial estate, not a visitor site.** It is seen from via del
  Commercio, from Ponte della Scienza and from the Riva Ostiense. The prose must not imply entry.
- **BANNED PHRASE ALERT.** it.wikipedia's first sentence is *«è stato il gasometro più grande
  d'Italia»* and it reports a Guardian ranking of "coolest neighbourhoods". **Both banned.**

**C13 · Ex Mercati Generali** — `historic-site` — **WEAKEST SOURCING OF THE BIG ITEMS**
OSM relation 13557047, 41.868910, 12.481764 → Ostiense; OSM nodes "Ostiense/Mercati Generali" at
41.871490/41.871651, 12.4800 → Ostiense. On via Ostiense, opposite Centrale Montemartini
(turismoroma's Montemartini page: *«di fronte agli ex Mercati Generali»*).
**The dating is contradictory and I could not settle it.** The it.wikipedia quartiere article gives
both *«Mercati Generali all'Ostiense, 1908-1916, progettisti: arch. ing. Francesco La Grassa; ing.
Emilio Saffi»* **and**, three paragraphs earlier, *«i Mercati Generali inaugurati … nel 1921»*.
The Ponte Settimia Spizzichino article refers to *«il più ampio piano di riassetto dell'intera area
degli ex mercati generali di via Ostiense»*, so the redevelopment is real and long-running.
`https://www.archidiap.com/opera/mercati-generali/` returned 404 and I found no institutional page.
**Recommend: publish the architects and the fact of closure and redevelopment; publish NO
construction date until a second source is found. Or hold the whole record.**

**C14 · Edificio d'ingresso ai Magazzini del Consorzio Agrario** — `historic-site`
**Via del Porto Fluviale.** it.wikipedia quartiere article: *«Edificio del XX secolo (1925)»*,
`{{Coord|41.872186|12.474420}}` → Ostiense. Thin but dated and located.

**C15 · Ex caserma dell'Aeronautica, Via del Porto Fluviale 10 — the Blu murals** — `historic-site`
it.wikipedia quartiere article lists *«ex caserma dell'aeronautica (via del porto fluviale 10)»*
under "Archeologia militare". The building carries two entire painted façades by the street artist
**Blu**, begun **2013**: *«dipingendo due facciate intere di un edificio occupato a via del porto
fluviale (CSOA fronte del porto) nel quartiere Ostiense»* —
`https://it.wikipedia.org/w/api.php?action=parse&page=Blu%20(artista)&prop=wikitext`
**PHOTO NOTE for the later wave: this is a living artist's copyrighted mural on a building. Treat as
high-risk, like MAXXI and the Palazzo della Civiltà.**

**C16 · Stazione di Roma Ostiense** — `historic-site`
Piazzale dei Partigiani. OSM relation 1821285, 41.872863, 12.484286 → Ostiense.
`https://it.wikipedia.org/w/api.php?action=parse&page=Stazione%20di%20Roma%20Ostiense&prop=wikitext`
- A stop opened here **1 May 1911**, raised to a station **21 October 1922**.
- For **Hitler's visit of 6 May 1938** a temporary "monumental station" was thrown up in **45 days**
  from Innocenti tubing faced with wood and stucco imitating travertine, to designs by **Roberto
  Narducci**. The permanent building, almost identical and by the same designer, was built for the
  1942 Exposition that never happened and was **inaugurated on 28 October 1940**.
- The avenue to Porta San Paolo and the forecourt were named **via A. Hitler and piazzale A. Hitler**
  for the visit; they are now **viale delle Cave Ardeatine and piazzale dei Partigiani**.
- Façade entirely faced in travertine with a pillared portico; on the right a **1940 relief of
  Bellerophon and Pegasus by Francesco Nagni**, on the left a **1957 fountain with sea horses**.
  Floor **mosaics in black and white** on Roman themes, from Aeneas leaving Carthage to St Peter's,
  designed by **Giulio Rosso and Maria Immacolata Zaffuto**.
- Narducci's circular jet fountain on the forecourt was removed for the 1990 World Cup works and
  never restored; it appears at the end of Verdone's *Un sacco bello*.
- **BANNED PHRASE ALERT.** The article calls it *«Terzo scalo della capitale per numero di
  passeggeri»* — a ranking. Banned.

**C17 · Stazione di Roma Porta San Paolo (Roma-Lido terminus)** — `historic-site`
41.875393, 12.481637 → Ostiense; article states *«Posta nel quartiere Ostiense, nel territorio
dell'VIII Municipio»*. Work began **1919** to designs by **Marcello Piacentini**, twin of his
Marina di Ostia terminus; **inaugurated 10 August 1924** with the first train to the Lido, Mussolini
aboard. Undamaged in the war, unlike the Ostia end. Modernised **9 September 1989 to 1996** (the
terminus fell back to EUR Magliana meanwhile). Wide booking hall with **marine-themed frescoes by
Giulio Rosso**. Refurbishment works in 2026 again pushed the terminus back to EUR Magliana on
weekdays 09–13 and 16–20 February, 11:00–16:00.
`https://it.wikipedia.org/w/api.php?action=parse&page=Stazione%20di%20Roma%20Porta%20San%20Paolo&prop=wikitext`

**C18 · Piramide (stazione della linea B)** — `historic-site`
41.874862, 12.482477 → Ostiense. Designed by **Marcello Piacentini**; plain geometry, roofed in
white travertine slabs, entrance steps onto the piazzale di Porta San Paolo. Refurbished 1989; a
subway to Roma Ostiense opened 1990 with a second entrance and hall on via delle Cave Ardeatine.
Its platforms sit in an **open cutting**. A small **chapel dedicated to San Filippo Neri** stands on
the Rebibbia/Jonio platform (also OSM node 4426929027, 41.875590, 12.482071 → Ostiense). Rolling
stock of the Roma-Lido was sheltered in the unfinished station during the 1943 bombing.
`https://it.wikipedia.org/w/api.php?action=parse&page=Piramide%20(metropolitana%20di%20Roma)&prop=wikitext`
**Note: the article calls the open cutting «caso unico in tutta la rete romana» — banned.**

**C19 · Polo museale dei trasporti (Polo museale ATAC di Roma Porta San Paolo)** — `museum`
**Via Bartolomeo Bossi 7**, next to the Roma-Lido terminus; article states *«nel quartiere
Ostiense»*. 41.875040, 12.481168 → Ostiense. Opened by Met.Ro. on **18 September 2004**, on an idea
of the engineer Angelo Curci, during Rome's second notte bianca, in the old goods yard. Part
open-air (restored rolling stock), part indoors (models, instruments). Stock built **1907–1945**,
including a Breda-AEG locomotive of 1915 (STEFER no. 01), a Carminati & Toselli-TIBB of 1922 (STEFER
no. 05, Roma-Lido), a Stanga-TIBB ECD railcar of 1931 (SRFN no. 21) and STFER tram no. 404 of 1941.
**CLOSED TO THE PUBLIC SINCE 2020** — first for COVID measures, then pending unfunded maintenance
and the handover of the Roma-Lido from ATAC to COTRAL/ASTRAL. **A "closed" status here is an
affirmative claim the source supports.**

**C20 · Ex Air Terminal Ostiense and Eataly Roma Ostiense** — `shop`
**Piazzale XII Ottobre 1492.** OSM relation 3304088 (Eataly Roma) 41.871233, 12.486632 → Ostiense;
OSM way 24178414 "Ex Air Terminal Ostiense" same point → Ostiense.
The terminal was designed by **Julio Lafuente and Giulio Sanrocchi** and opened for the **1990 World
Cup** as an air terminal for Fiumicino, linked to the station by four escalator flights and two
travelators; it never worked, closed and was abandoned. **RFI sold it on 15 June 2009 to Geal s.r.l.
for €10,820,000.** **Eataly opened inside on 21 June 2012.** Eataly's own store directory lists
"Roma Ostiense" as one of its three Rome stores (`https://www.eataly.net/it_it/negozi/roma/`).
**Hours were not obtained; the store page is JS-rendered. Do not invent them.**
**BANNED PHRASE ALERT.** The Garbatella article says Eataly became *«il più grande luogo al mondo
dedicato alle eccellenze agroalimentari italiane»*. Banned.

**C21 · Ponte Settimia Spizzichino (Cavalcavia Ostiense)** — `historic-site` — the one clean bridge
Part of the Circonvallazione Ostiense; crosses the Roma-Lido and metro line B beside Garbatella
station and the ex-Mercati Generali. **41.867163, 12.484076 → Ostiense**, and categorised only
`Roma Q. X Ostiense`. Executive design by **Solidus s.r.l. (Francesco Del Tosto)**, built by
**Cimolai SpA**; a steel space-frame tied arch on three supports carrying a double deck on steel
cables. **160 m long overall, 126 m central suspended span, 42 m rise, two carriageways of 16.5 m
with three lanes each, a 1.5 m cycle lane in the central strip.** Lighting by Francesco Bianchi.
Three years on site; **inaugurated 20 June 2012 at about €15.4 million.** Named on the proposal of
the Municipio VIII giunta for **Settimia Spizzichino**, who survived the **round-up of the Roman
Ghetto on 16 October 1943** and deportation to Auschwitz.
`https://it.wikipedia.org/w/api.php?action=parse&page=Ponte%20Settimia%20Spizzichino&prop=wikitext`

**C22–C25 · The four river bridges** — `historic-site` — **ALL STRADDLERS, see §2a**
Facts gathered so whoever gets them is not starting cold:
- **Ponte dell'Industria**: designed by the Belgian engineer **Louis Hach**, built in England
  1862–63, shipped in pieces and **inaugurated 24 September 1863** in the presence of Pius IX; iron
  and cast-iron arches on cast-iron tubular piers filled with concrete; a **bascule track** in the
  centre let ships reach Ripa Grande. Three spans, ≈131 m long, 7.25 m wide. Rail traffic moved to
  Ponte San Paolo in 1911. Fires on **1 February 2013** and on the night of **2–3 October 2021**, the
  latter deforming the structure and dropping one of the south-side steel walkways.
  **CAUTION**: the article records the 7 April 1944 "eccidio del ponte dell'Industria" but says the
  episode is *«mai confermato da alcun documento e rivelato dal solo De Simone 50 anni dopo»*. There
  is an OSM memorial "Memoriale dell'eccidio del ponte dell'Industria" at 41.872157, 12.472765 →
  Ostiense. **If written at all, write it as a memorial and as a contested account, or leave it.**
- **Ponte San Paolo**: built **1907–1910** by Impresa Allegri for the Ferrovie dello Stato, reusing
  material from the demolished stretch of Aurelian Wall the new alignment cut through; three masonry
  arches, ≈101 m.
- **Ponte Guglielmo Marconi**: planned from the early 1930s, begun **1937**, interrupted by the war,
  resumed 1953, **inaugurated 26 February 1955**; Gerber-beam construction, ≈235 m, 32 m cross
  section, four lanes each way, travertine parapets; restored 1975. **BANNED: the article twice
  calls it «il ponte più lungo di Roma».** The **Darsene di Pietra Papa** river-port site lies just
  upstream.
- **Ponte della Scienza Rita Levi-Montalcini**: cycle-pedestrian, from an international competition
  won in **2000** by **APsT Architettura (Gianluca Andreoletti, Maximiliano Pintore, Stefano
  Tonucci)**, structures by Giorgio Monti and EDIN; built from **2008** by Maeg Costruzioni; total
  length **147 m**, 90 m span; briefly opened 9 February 2013, **opened to traffic 29 May 2014** and
  **inaugurated 8 July 2014**, when the mayor named it for Rita Levi-Montalcini. It lands on the
  Ostiense side at the Gazometro.

### 4.4 GARBATELLA (zona urbanistica 11C, inside this quartiere)

Everything here tests Ostiense and every article is categorised `Roma Q. X Ostiense`.

**C26 · Piazza Benedetto Brin and the 1920 foundation inscription** — `historic-site`
41.862246, 12.482159 → Ostiense. **King Victor Emmanuel III laid the first stone here on
18 February 1920**, Ash Wednesday, with **Adolfo Apolloni** as mayor. The inscription walled into
the central building of the square reads, verbatim: *«Per la mano augusta di S.M. il Re Vittorio
Emanuele III / l'Ente autonomo per lo sviluppo marittimo e industriale / e l'Istituto delle Case
popolari di Roma / con la collaborazione delle Cooperative di lavoro / ad offrire quieta e sana
stanza agli artefici del rinascimento economico della Capitale / questo aprico quartiere fondato
oggi XVIII Febbraio MCMXX.»* The oldest surviving lots are around this square. OSM also carries a
memorial node "Fondazione Quartiere Vittorio Emanuele III" at 41.862118, 12.482441 → Ostiense, and
"Alla Garbatella" at 41.862295, 12.481862.
Source: `https://it.wikipedia.org/w/api.php?action=parse&page=Garbatella&prop=wikitext`

**C27 · Piazza Damiano Sauli** — `historic-site`
41.862900, 12.488100 → Ostiense. The square is defined by the school, the church of San Francesco
Saverio and a housing-and-shops block on the north side with **three central archways** through to
piazza Nicola Longobardi (ArchiDiAP). Rebuilt in the 1990s under Rome's **"100 Piazze"** programme.

**C28 · Scuola "Cesare Battisti", piazza Damiano Sauli 3** — `historic-site`
41.861153, 12.488616 → Ostiense. By **Angelo Brunetta**, **1931, raised a storey in 1937**
(`https://www.archidiap.com/opera/scuola-in-piazza-damiano-sauli/`). Two C-shaped wings, originally
three storeys, now four over a basement, joined by a two-storey block crowned with a tower; a
double-height gymnasium in the central block; reinforced-concrete piers and floors, large glazing,
iron crown. Originally named for the fascist gerarca **Michele Bianchi** at Mussolini's wish
(it.wikipedia quartiere article, citing the school's own site). Used as a location in Nanni
Moretti's *Bianca* and in the TV series *I Cesaroni*.

**C29 · Chiesa di San Francesco Saverio alla Garbatella** — `historic-site`
**Piazza Damiano Sauli.** 41.861915, 12.489660 → Ostiense; categorised `Chiese di Roma - Q.X
Ostiense`. Designed by **Alberto Calza Bini** (ArchiDiAP dates the build **1931–1933**); erected a
parish on **1 May 1933** by Pius XI, constitution *Quo omnes sacrorum*. Brick and travertine façade,
central portal under a large lunette window, arms of Pius XI above, high dome. Three aisles on
Ionic columns, transept; apse canvas of the saint preaching; in the transept a *Madonna del Divino
Amore succouring Rome after the 1943 bombing* and a *Christ in glory with angels*; bronze
*Crucifixion* and *Madonna* flanking the entrance. **John Paul II came here on Sunday 3 December
1978** — the Vatican's own text of the homily is at
`http://www.vatican.va/holy_father/john_paul_ii/homilies/1978/documents/hf_jp-ii_hom_19781203_franc-saverio_it.html`
and he says: *«È una grande gioia per me poter visitare come prima parrocchia romana proprio la
vostra … negli anni dell'immediato dopoguerra, come studente a Roma, mi recavo quasi ogni domenica
proprio alla Garbatella, per aiutare nel servizio pastorale.»*
**VERIFIER, RULE ON THIS:** "the first Roman parish he visited as pope" is a *sequence* fact with a
date, sourced to the pope's own words, not a ranking. The corpus rules permit "a date or sequence".
I read it as publishable **as the dated quotation**, but I flag it rather than assume.

**C30 · Teatro Palladium** — `theater`
**Piazza Bartolomeo Romano 8, 00154 Roma** (`https://teatropalladium.uniroma3.it/il-teatro/`,
tel +39 06 57332772). 41.862490, 12.485491 → Ostiense. Designed by **Innocenzo Sabbatini**,
built **1927–28** as the *Cinema Teatro "Garbatella"*, Istituto per le Case Popolari lot 12,
building 6; the building also carries private flats on six floors. Horseshoe auditorium, no pit.
Owned and run by **Università Roma Tre** through the **Fondazione Roma Tre Teatro Palladium**; it
programmes theatre, cinema, music and dance. It faces piazza Bartolomeo Romano together with the
**Bagni Pubblici**, also Sabbatini's (see C31).

**C31 · Bagni Pubblici di piazza Bartolomeo Romano** — `historic-site`
Named in the Teatro Palladium article as *«l'edificio dei Bagni Pubblici, progettato dallo stesso
Sabbatini per accogliere i primi servizi di pertinenza al quartiere»*, on the same square. Thin —
one sentence and an architect. **Weak; a verifier may well cut it.**

**C32 · Alberghi Suburbani della Garbatella — the Albergo Rosso** — `historic-site`
**Piazza Eugenio Biffi.** OSM relation 919376, 41.866307, 12.491100 → Ostiense.
`https://www.archidiap.com/opera/albergo-rosso/` — **Innocenzo Sabbatini, Piazza Eugenio Biffi,
1927–1928**. Four "Alberghi" (**Rosso, Bianco, Giallo, Beige**) were built from 1927 for the
Istituto Case Popolari under **Alberto Calza Bini**, who called them *«Alberghi di transito»* —
transit hotels for families evicted by the *sventramenti* of the late 1920s. They combined temporary
housing with collective functions: canteen, crèche and school, chapel, laundries and ironing rooms,
kitchens, shared washrooms, day rooms, outdoor play space and stores. **Sabbatini resigned from the
ICP on 7 March 1929** over changes made during construction. The Albergo Rosso is identified by its
**clock tower**, its render colour and a slight setting-out shift from the other three.

**C33 · Lotto 24, the "casette modello"** — `historic-site`
Between via delle Sette Chiese, via De Jacobis and via Borri. **Thirteen villini** built for the
**XII International Congress of Housing and Town Planning of 1929**; marble plaques at the entrances
name the architects; the competition was won by the corner building at via delle Sette Chiese/via
Borri, by **Mario De Renzi** (it.wikipedia Garbatella article).
**BANNED PHRASE ALERT: the article calls the lot «tra i più belli e interessanti». Banned.**

**C34 · Fontana della Carlotta and the Scala degli Innamorati** — `historic-site`
**Piazza Ricoldo da Montecroce.** OSM node 267110207, 41.863913, 12.490991 → Ostiense. Named in the
Garbatella article as *«la "Fontana della Carlotta" di piazza Ricoldo da Montecroce, con la relativa
scalinata, detta "degli Innamorati"»*. The *Carlotta* of the name is the innkeeper of the
etymological legend (C40). The lot beside it, lot 31, carries a plaque to the Roman singer **Alvaro
Amici**, born and living there, laid by Municipio VIII on **8 September 2007**; a second plaque of
the same day, at lot 28, via Guglielmo Massaia 22, remembers **Iole Zedde**, aged sixteen, killed on
**12 September 1944** by a German soldier guarding wagons at the Ostiense railway station (OSM node
"targa a Iole Zedde", 41.863287, 12.492640 → Ostiense).

**C35 · Il ponticello medievale di piazza Eugenio Biffi** — `historic-site`
One clause in the Garbatella article: *«il ponticello medioevale in piazza Eugenio Biffi»*. **Very
thin. Flagged as probably uncuttable to a verifier.**

**C36 · Chiesa dei Santi Isidoro e Eurosia, "la Chiesoletta"** — `historic-site`
**Via delle Sette Chiese.** Categorised `Chiese di Roma - Q.X Ostiense`. An external plaque records
that it was built in **1818** by Monsignor **Nicola Maria Nicolai**, whose family held the
neighbouring estate, the *tenuta dei 12 cancelli*. The entrance pronaos is attributed to **Giuseppe
Valadier**. Ruinous in the 19th century, bought and restored by the Oratorian priest **Generoso
Calenzio**. The portico holds three plaster relief *bozzetti* held to be by **Antonio Canova**:
*Virgin with the Child and St John the Baptist*, *The Saviour receiving the children*, and *St John
the Baptist baptising Christ*. Single nave, one central altar in polychrome marble, four side
windows, a cantoria. Now annexed to the parish of San Filippo Neri in Eurosia and run by the
Oratorian Confederation. The 1818 dedicatory inscription is quoted in full in the Garbatella
article. It stands on the **via delle Sette Chiese** pilgrimage route.
`https://it.wikipedia.org/w/api.php?action=parse&page=Chiesa%20dei%20Santi%20Isidoro%20e%20Eurosia&prop=wikitext`

**C37 · Chiesa di San Filippo Neri in Eurosia** — `historic-site`
**Via delle Sette Chiese.** OSM relation 5289250, 41.860748, 12.492857 → Ostiense; categorised
`Chiese di Roma - Q.X Ostiense`. Built **1952–1955** to designs by **Pier Luigi Maruffi**, at the
suggestion of Giovanni Battista Montini, then Substitute at the Secretariat of State, with the
American benefactors **Tommaso and Irene Bradley**. Parish erected **20 December 1952** (decree
*Mirabili sollicitudine* of Cardinal Vicar Clemente Micara); entrusted to, and owned by, the
Oratorian Congregation. Cardinalatial title created by Paul VI on **7 June 1967**. Visited by
**Paul VI on 19 February 1967** and by **John Paul II on 23 February 1982**. Brick exterior with
portico and side campanile; on the trabeation the Gospel line *«Venite a me voi tutti che siete
affaticati ed oppressi ed io vi ristorerò»*, and on the façade top *«D.O.M. in honorem S. Philippi
Nerii A.D. MCMLII»*. Three aisles on stone columns; a fibreglass statue of the saint flanked by
portraits of **Cesare Baronio** and **John Henry Newman**; a **1996 mural of Filippo Neri** painted
on the flank.

**C38 · Via delle Sette Chiese** — `historic-site` (a street; verifier should test it against P6)
Named in three separate articles as the road pilgrims took from San Paolo to San Sebastiano, at
right angles to the Ardeatina and the Appia, from the 16th century part of the **Giro delle Sette
Chiese**, and still walked on the pilgrimage to the **Santuario del Divino Amore**. Prior waves have
ruled some streets OUT as places (wave 4 struck Via Marmorata under P6). **Flagged, not claimed.**

**C39 · Parco di Commodilla** — `park`
The Garbatella article puts the entrance to the Commodilla catacomb in *«il Parco di Commodilla (ex
vigna Serafini)»*. Pairs with C07.

**C40 · The Garbatella name itself** — background for the zone page, not a place
Three competing accounts, all in the it.wikipedia article: (a) an innkeeper, "Carlotta" or "Maria",
so obliging that travellers called her the *Garbata Ostella*, syncopated to Garbatella; (b) the
pleasantness of the place; (c) the *a garbata* vine-training used on the *tenuta dei 12 cancelli*
held in the 19th century by Monsignor Alessandro Nicolai. A 2019 study by Giorgio Guidoni in
*Garbatella 100* proposes the innkeeper was **Clementina Eusebi**, who ran the inn c. 1835–1850, and
that the name came from her mother's surname, **Maddalena Garbata**, the two being distinguished as
*Garbata* (mother) and *Garbatella* (daughter); the inn stood on via Ostiense halfway between the
Pyramid and San Paolo, where via degli Argonauti now begins. **Write this as competing accounts,
never as settled.** Also: the name was debated until about 1930, with *Concordia* and *Remuria*
proposed as alternatives.

**C41 · Palazzo della Regione Lazio** — `historic-site`
**Via Cristoforo Colombo**, entrances also on piazza Odorico da Pordenone. OSM way 24594056,
41.859154, 12.494737 → Ostiense; the article says *«presso il quartiere Garbatella»*. Rationalist;
built as the national headquarters of **INAM**; after that body was wound up it passed in **1980** to
the Lazio regional giunta, and the **Regione Lazio bought it in 2009**. Three blocks: palazzina A on
the Colombo (president's offices), palazzina B in the middle and tallest (regional directorates),
palazzina C (service companies). It was the **Megaditta** in *Fantozzi* (1975), which is why Romans
call it the *Palazzo di Fantozzi*.
`https://it.wikipedia.org/w/api.php?action=parse&page=Palazzo%20della%20Regione%20Lazio&prop=wikitext`

### 4.5 THE OTHER CHURCHES

**C42 · Chiesa di San Benedetto** — `historic-site`
**Via del Gazometro.** 41.871549, 12.478615 → Ostiense; categorised `Chiese di Roma - Q.X Ostiense`.
**Pius X** decided in **1912** to build a church near the gasworks but died first; **Benedict XV**
started the work and the dedication to St Benedict remembers him. A hut was fitted out as a church
in **1916**; only piers and roof stood at Benedict XV's death; the work was finished under **Pius XI**
and the church **erected a parish on 3 June 1926** by the constitution *Nostri pastoralis officii*
(text in AAS 19 (1927) p. 121, `http://www.vatican.va/archive/aas/documents/AAS-19-1927-ocr.pdf`).
Now served by the Society of the Divine Word. Brick, two orders; an atrium on two piers under the
Latin motto *«Obsculta o fili praecepta magistri: ora et labora»*; oval window above with cross,
fish, chi-rho, dove and crozier; the arms of Pius XII at the top. Single nave with a right-hand
aisle and four chapels on the left: a **Sacred Heart mosaic by Armando Baldinelli**; a *Madonna and
Child* by **Silvio Consadori (1951)**; *St Joseph with the adolescent Christ* by **Luigi Filocamo
(1953)**; the high altar with a *San Benedetto* by **Ferruccio Ferrazzi**; a terracotta Via Crucis by
**Antonio Giuseppe Santagata**. Plaques record **John Paul II's visit of 14 February 1988** and the
elevation to cardinalatial deaconry on **28 June 1988**. Parish site
`http://www.parrocchiasanbenedetto.org/`.

**C43 · Chiesa di Santa Galla** — `historic-site`
**Circonvallazione Ostiense.** 41.867741, 12.489481 → Ostiense; categorised `Chiese di Roma - Q.X
Ostiense`. Built **1940** to designs by **Tullio Rossi**; parish erected **13 December 1940** by
decree *Templum in honorem* of Cardinal Vicar Francesco Marchetti Selvaggiani; consecrated by
Cardinal **Ugo Poletti on 15 December 1990**, the parish's fiftieth anniversary. Visited by
**Paul VI on 13 March 1966** and **John Paul II on 25 January 1981**. Travertine colonnade round the
sagrato; brick façade *a salienti*, arms of Pius XII over the window; campanile with three bells in
E3 cast in **1940** by Cobalchini of Padua. Three aisles on red marble columns, trussed timber
ceiling, fourteen clear windows, semicircular apse. It keeps works from the **demolished old church
of Santa Galla** (pulled down in 1935 for the widening of via del Teatro Marcello, in rione Ripa),
including a 17th-century *Vision of Santa Galla*.
**The altar is the strongest single fact here**: a white marble **funerary altar of full Flavian
date**, reused as a Christian reliquary in the 11th century, from the lost church of Santa Maria in
Portico (demolished 1932), briefly in San Giorgio in Velabro, and **in Santa Galla since 20
September 1988**. Two incised inscriptions record the consecration of Santa Maria in Portico by
**Gregory VII** and the altar's own consecration on **8 July 1073**, listing relics of the True Cross
and the sponge, of the cross of St Andrew and parts of his bones, and of 21 other martyrs, six of
them women. Carved fronts: a stork pecking a bee, a sparrow with a shoot, a pelican, and a laurel
tree with birds. **Organ by Bartolomeo Formentelli**, developed to **2003** from a 1967 core, fully
mechanical, **94 stops, over 5,000 pipes**, four manuals of 58 notes and a 30-note pedalboard.
Parish site `http://www.santagalla.it/`.

**C44 · Teatro in Portico** — `theater`
OSM node 10082931681, 41.867757, 12.489967 → Ostiense. The it.wikipedia quartiere article lists it
under Teatro as *«Teatro in Portico, adiacente la Chiesa di Santa Galla»*. **One line of sourcing.
Weak; verify against the theatre's own site or cut.**

**C45 · Basilica di Santa Maria Regina degli Apostoli alla Montagnola** — `historic-site` — see §2f
**Via Antonino Pio.** 41.853371, 12.483153 → Ostiense; categorised `Chiese di Roma - Q.X Ostiense`.
Run by the **Società San Paolo (Paolini)**. **Don Giacomo Alberione**, founder of the Famiglia
Paolina, had wanted a shrine to Mary Queen of Apostles; the decision came in **1943** after a
bombing on the site caused no casualties. Built after the war to a design by **Leone Favini**,
finished **1954**. Cardinalatial title from **1965**; parish from **1976** by will of Paul VI;
**minor basilica since 1984**. Central plan under a large dome, Roman-Baroque in inspiration, with
Marian frescoes by **Antonio Giuseppe Santagata**. It holds the remains of **Don Alberione**,
**Tecla Merlo**, and **Giuseppe Timoteo Giaccardo**. The funeral of the exorcist **Gabriele Amorth**
was held here on 19 September 2016.

**C46 · Chiesa di Santa Marcella** — `historic-site`
**Piazza Nicoloso da Recco.** 41.874400, 12.488295 → Ostiense; categorised `Chiese di Roma - Q.X
Ostiense`; article says *«nel quartiere Ostiense … non lontano dal monastero di San Cosimato e dalla
stazione Ostiense»*. Designed by **Leonardo Del Bufalo**; parish instituted **13 May 1958** by
decree *Qua celeritate* of Cardinal Vicar Clemente Micara. **Hexagonal plan** with a matroneum along
the side walls and counter-façade; tall reinforced-concrete campanile alongside. Two altarpieces by
the Abruzzese painter **Marcello Ercole** (exhibited at the IX Quadriennale, 1965) and a
counter-façade fresco by **Dilvo Lotti**. **Mascioni organ *opus 962*, 1973.**

**C47 · Chiesa di San Leonardo Murialdo** — `historic-site`
OSM way 146066123, 41.853590, 12.468031 → Ostiense, wikipedia tag `it:Chiesa di San Leonardo
Murialdo`. **The Italian article at that exact title is a disambiguation page; the Rome article is
at "Chiesa di San Leonardo Murialdo (Roma)". I did not fetch it. Unresearched — flagged for the
verifier as a real candidate with no gathered facts.**

### 4.6 CULTURE, UNIVERSITY AND PARKS

**C48 · Casa del Jazz (Villa Osio)** — `theater` (a concert venue) — **STRADDLER FLAG, §2d**
**Viale di Porta Ardeatina 55, 00154 Roma**, tel 06 80241281 (`https://www.casadeljazz.com/i-luoghi/`).
The villa was built **1936–1939** on the ruins of a 17th-century casale for **Arturo Osio**,
co-founder of the Banca Nazionale del Lavoro, by the engineer **Cesare Pascoletti**, a pupil of
Marcello Piacentini; the park was laid out by the landscape architect **Pietro Porcinai**. In the
1980s **Enrico Nicoletti**, the Banda della Magliana's cashier, bought it from the Vicariate of Rome
and made heavy unauthorised alterations. **Seized 14 November 1996, definitively confiscated
20 February 2001, and assigned to the Comune di Roma on 26 September 2001** under law 109/1996
("Pio La Torre"). **Casa del Jazz opened in April 2005.** A stele at the park gate, made with
**Libera**, carries **683 names of mafia victims from 1893 to 2005**. Inside: a multi-purpose
auditorium, the **Sala concerti "Armando Trovajoli"**; rehearsal and recording rooms; a guest house
for visiting musicians; a restaurant; a fresco of a view of **Piazza Navona by Amerigo Bartoli** in
the ground-floor former dining room. **Villa Osio covers 2,500 m² in a park of 25,240 m².**
**CONFLICT TO RESOLVE:** it.wikipedia and one page of the venue's own site say the auditorium seats
**150**; another page of the same site says **134**. Publish neither, or publish "about 150" only if
the verifier can pin one page. **Also note the operator changed**: it.wikipedia says Palaexpo; the
venue's own current site says **Fondazione Musica per Roma**. Use the venue's own site.
Box office opens on performance days from 19:00 until 40 minutes after the start; tickets via
TicketOne.

**C49 · Università degli Studi Roma Tre — Ostiense campus** — `attraction`
Via Ostiense 133 (rectorate/OSM way 1422836179, 41.864712, 12.480108 → Ostiense), Via Ostiense 123
(student registry), Via Ostiense 139 (**ex Tommaseo**, home of the **DAMS**), Largo San Leonardo
Murialdo and Via della Vasca Navale 79/84 (**ex Vasca Navale**, science and engineering), Via
Gabriello Chiabrera 199 (political science), Via Silvio D'Amico 77 (economics). The university has
been in the quartiere **since 1992** (it.wikipedia quartiere article) and its own Palladium page
names the **ex Vasca Navale** and the **ex Mattatoio** as its recent building-recovery projects.
Garbatella article: *«ha una delle sue sedi nelle vecchie vetrerie ai piedi del quartiere e ne ospita
il teatro, il "Palladium"»*. **DO NOT sweep in the Dipartimento di Architettura at Largo G. B. Marzi
10 — that tests Testaccio and sits in the shipped Mattatoio (§2f).**

**C50 · Caffè Letterario** — `cafe`
**Via Ostiense 95**, OSM node 41.871070, 12.480210 → Ostiense; own site
`https://caffeletterarioroma.it`. The quartiere article lists its library, the *Bibliocaffè*, under
the quartiere's libraries, citing `https://www.caffeletterarioroma.it/biblioteca/`.

**C51 · Officine Fotografiche** — `attraction`
OSM node 3106146429, 41.864708, 12.480935 → Ostiense; `http://www.officinefotografiche.org`.
Photography school and gallery. **Sourcing so far is OSM plus a website; needs the operator's own
address page.**

**C52 · The Via Libetta club strip** — `nightclub` cluster
Within a hundred metres of each other on and beside **Via Giuseppe Libetta**, all → Ostiense:
**Vinile** (Via Giuseppe Libetta 19, 41.862980, 12.480450), **Rashomon Club** (Via degli Argonauti
16, `https://www.rashomonclub.com/`), **Neo Club** (Via degli Argonauti 18), **Goa Club**
(`https://goaclub.com/`), **Saponeria**. The quartiere article records that **Muccassassina** began
near the ex-gasworks on via Ostiense in the 1990s and that the quartiere hosts **Arcigay**, the
**Circolo di cultura omosessuale Mario Mieli** (OSM node 41.854414, 12.476705 → Ostiense,
`https://www.mariomieli.org`) and **Di' Gay Project**. **These are OSM-plus-own-site only; a verifier
must check each against its own site, and the corpus rules forbid publishing a founding year taken
from an operator's site.**

**C53 · Parco Ildefonso Schuster and the Monumento ai Caduti di Nassiriya** — `park`
Park: OSM way 24570497, 41.860517, 12.476422 → Ostiense; it holds the Sepolcreto (C05). The monument
was **inaugurated on 30 March 2008** in the park, for the victims of the **attack of 12 November 2003**
on the Italian base at Nasiriyah, and is the work of the sculptor **Giuseppe Spagnulo** (it.wikipedia
quartiere article; OSM node 10578706896, 41.861974, 12.478037 → Ostiense).

**C54 · Other green space** — `park`, weaker
All test Ostiense: **Parco Giovannipoli** (rel 1849471, 41.861045, 12.483051 — the name preserves
the 9th-century fortified *Giovannipoli* founded by **John VIII** around the basilica, per the
quartiere article), **Parco Garbatella** (rel 941682), **Parco Marcella e Maurizio Ferrara**,
**Parco Tashunka Witko Cavallo Pazzo**, **Parco dei Caduti del Mare**, **Giardino Zen** (rel 1849134)
and the **Orti urbani Garbatella** (rel 1849135), **Parco Donatella Colasanti**, **Parco Enrico
Maria Salerno**, **Parco Gino Strada**. **Tiberis**, the seasonal river beach, OSM node 13833893713,
41.859091, 12.469381 → Ostiense. **Sourcing on all of these is OSM only. A verifier should demand a
Sovrintendenza or Roma Capitale page per park and cut the ones that have none.**

### 4.7 STREET ART — all → Ostiense, all OSM-tagged with artist

| work | artist (OSM `artist_name`) | point |
|---|---|---|
| **Hunting Pollution** | Iena Cruz | 41.872282, 12.478890 |
| **Wall of Fame** | JB Rock | 41.871815, 12.477927 |
| **Pianeta Terra** | Herbert Baglione | 41.874006, 12.477917 |
| **Outside In** | Judith de Leeuw (JDL); project page `https://yourban2030.org/it/outsidein.html` | 41.855873, 12.475059 |
| **Il sorriso dell'universo** | Giulia Ananìa, Martina de Maina, Zara Kiafer, Lola Poleggi | 41.850902, 12.472369 |
| **Quel che di più Caro** | Rame13 | 41.851140, 12.472880 |
| **Scienza (è) Vita** | m@rt, Giusy Guerriero | 41.851177, 12.472162 |
| **Murale Alberto Sordi** | — | 41.865545, 12.490432 |
| the two **Blu** façades, via del Porto Fluviale | Blu (it.wikipedia, 2013) | C15 |
| **Tutti Potenziali Bersagli** (sculpture) | Emilio Leofreddi | 41.876128, 12.481521 |

**PHOTO WAVE NOTE: every one of these is a living artist's work in copyright. Flag the whole street-art
group as high-risk alongside MAXXI and the Palazzo della Civiltà.** For text, the artist attributions
above come from OSM tags and need a second source before any of them publishes as a place.

### 4.8 FOOD, DRINK AND MARKETS

The polygon returns **355 named food/drink/lodging/artwork features**. That is far more than a guide
needs and far more than can be honestly sourced. These are the ones with a real hook or their own
site; all test Ostiense.

| # | name | kind | address | source |
|---|---|---|---|---|
| C55 | **Porto Fluviale** | restaurant | Via del Porto Fluviale 22 | `https://www.portofluviale.com/` |
| C56 | **Trattoria Pennestri** | restaurant | Via Giovanni da Empoli 5 | OSM only — needs own site |
| C57 | **Trattoria Zampagna** | restaurant | Via Ostiense 179 | OSM only |
| C58 | **Al Biondo Tevere** | restaurant | Via Ostiense 178 | `https://www.albiondotevere.it/` — carries the Pasolini association; **do not publish "the last place he ate" without a hard source, and note the corpus bans trading-duration claims taken from an operator's site** |
| C59 | **Pasticceria Andreotti** | cafe | Via Ostiense 54b | `https://www.andreottiroma.it/` |
| C60 | **Romeow Cat Bistrot** | restaurant | Via Francesco Negri 15 | `https://www.romeowcatbistrot.com` |
| C61 | **Hopside** | brewery/pub | Via Francesco Negri 39/41 | `https://www.hopside.it/` |
| C62 | **Eataly Roma Ostiense** | shop | Piazzale XII Ottobre 1492 | C20 |
| C63 | **Al Ristoro degli Angeli** | restaurant | Via Luigi Orlando 2, Garbatella | OSM only |
| C64 | **Trecca — Cucina di Mercato** | restaurant | Via Alessandro Severo 222 | OSM + Facebook only |
| C65 | **Tre de Tutto** | pub | Via Giustino de Jacobis 19, Garbatella | `https://tredetuttogarbatella.it/` |
| C66 | **Mercato Circonvallazione Ostiense** | shop | OSM way 259476379, 41.868103, 12.488382 | OSM only |
| C67 | **Mercato Ostiense** | shop | OSM way 58882828, 41.854656, 12.475151 | OSM only |
| C68 | **Lana Mixology & Rooftop bar** | cafe | Via del Porto Fluviale 35 | `https://lanarooftop.com/` — **the address Ferzan Özpetek used for *Le fate ignoranti* (2001), per the quartiere article** |
| C69 | **Caffè Letterario** | cafe | Via Ostiense 95 | C50 |

**A verifier should cut this list hard.** A place's own website establishes its identity, address and
hours and nothing else — no awards, no superlatives, and **no founding year**.

### 4.9 UNRESEARCHED BUT REAL — handing these on rather than pretending

- **Chiesa di San Leonardo Murialdo (Roma)** — C47, article not fetched.
- **Teatro Mongiovino** (OSM way 58460472, 41.859755, 12.495507 → Ostiense) — no it.wikipedia
  article; a puppet/children's theatre by reputation. Needs its own site.
- **Teatro Garbatella** (OSM node 1646269932, `https://www.teatrogarbatella.it`) and **Teatro dei
  Conciatori** (41.874408, 12.479115) and **Teatro Spazio 18B** (`https://www.spazio18b.com/`) —
  four small theatres, all OSM-only.
- **ACEA Heritage** (OSM node 13028360534, tagged `tourism=museum`, 41.874981, 12.483688 → Ostiense).
  Acea's historical archive is cited on the Montemartini site. Unresearched; could be a real museum
  record or could be an office.
- **Villa Osio park** vs **Casa del Jazz** — one place or two.
- **Monumento alla Resistenza** (OSM way 959973420, 41.861037, 12.485976 → Ostiense) — no source
  found beyond OSM.
- **Cappella di San Filippo Neri on the Piramide metro platform** — noted at C18; charming, but I
  found no source beyond the metro article's one clause.
- **Darsene di Pietra Papa** — named on the Ponte Marconi and San Paolo articles as a river-port site
  active 1st c. BC to 2nd c. AD; **I did not establish which bank it is on, and it may be
  Portuense.** Flagged.
- The **Quartiere INA-Casa / IACP di Valco San Paolo, the four star-plan towers**, between via Valco
  di San Paolo, via Corinto, via Efeso and via Filomene, **1949–50**, by **Mario De Renzi, Saverio
  Muratori, Eugenio Montuori, Mario Paniconi, Giulio Pediconi and Fernando Puccioni**
  (`https://www.archidiap.com/opera/quartiere-valco-san-paolo-torri-stellari/`; 41.853076, 12.474327
  → Ostiense). Total area 8,000 m², **440 dwellings, 2,600 rooms**; each tower eight storeys, three
  flats a floor, **24 flats**. I gathered this but did not number it as a candidate because a housing
  estate may not survive the kind test. **The verifier should decide.** ArchiDiAP's copy contains
  *«sono il prototipo delle torri romane a impianto stellare, usate qui per la prima volta»* —
  a priority claim, **banned**.

---

## 5. BANNED-PHRASE REGISTER — every superlative I found, so nobody reuses one

| phrase | where it came from |
|---|---|
| «la più grande dopo quella di San Pietro in Vaticano» (San Paolo) | it.wikipedia basilica article, opening line |
| «è per grandezza la seconda delle quattro basiliche patriarcali» | same article, Descrizione |
| «la ventesima campana più grande presente nella penisola italiana» (Pierpaola) | same article |
| «la porta di destra … è la più antica» | same article — rephrase as "the 11th-century door" |
| «una delle meraviglie della Roma duecentesca» (cloister) | turismoroma |
| «il più antico esempio di questo tipo di costruzione conservato a Roma» (bell-tower base) | turismoroma |
| «un giardino unico nel suo genere», «di straordinaria bellezza», «una splendida oasi» | abbaziasanpaolo.org, turismoroma |
| «La Montemartini è stata la prima centrale pubblica di produzione di elettricità a Roma» | centralemontemartini.org |
| «il primo impianto pubblico di Roma per la produzione di energia elettrica» | centralemontemartini.org, turismoroma |
| «uno straordinario esempio di riconversione» | centralemontemartini.org |
| «è stato il gasometro più grande d'Italia» | it.wikipedia Gazometro |
| Guardian "10 of the coolest neighbourhoods in Europe", eighth place, 2020 | it.wikipedia Gazometro |
| «Terzo scalo della capitale per numero di passeggeri» | it.wikipedia Stazione Ostiense |
| «caso unico in tutta la rete romana» (open-cut platforms) | it.wikipedia Piramide station |
| «è il più lungo ponte della Capitale» / «è il ponte più lungo di Roma» | it.wikipedia Ponte Marconi, twice |
| «il più grande luogo al mondo dedicato alle eccellenze agroalimentari italiane» (Eataly) | it.wikipedia Garbatella |
| «tra i più belli e interessanti» (Lotto 24) | it.wikipedia Garbatella |
| «l'affresco più celebre del complesso», «uno dei vertici della produzione artistica della Roma sotterranea cristiana» | catacombeditalia.va, Commodilla |
| «sono il prototipo … usate qui per la prima volta» (star towers) | ArchiDiAP Valco San Paolo |
| «uno dei primi ambienti industriali romani» | turismoroma Montemartini |

**Also banned by evidence_ruling, and it appears in one of my sources:** the Abbazia delle Tre
Fontane article says *«È monumento nazionale italiano»*. That is a designation claim. It is not my
place anyway (§2e), but no zone may reproduce it.

---

## 6. PHOTOGRAPHS — none this wave

`"photos": []` everywhere. For the later photo wave, the high-risk set in Ostiense is:
- **every street-art work in §4.7**, and the **Blu façades on via del Porto Fluviale** — living
  artists, architectural-copyright-adjacent, and in some cases the whole subject of the frame;
- **Ponte Settimia Spizzichino** (2012), **Ponte della Scienza** (2014) and the **ex Air Terminal**
  (1990) — recent architecture by named living or recently-living designers;
- the **Casa del Jazz** interiors and the **Bartoli** fresco.
Older and safer: the basilica and its cloister, the Sepolcreto, the Gazometro frame, the 1940
Stazione Ostiense, the 1924 Porta San Paolo station, the Garbatella lots.

---

## 7. THINGS I DELIBERATELY DID NOT CLAIM

- **Porta San Paolo, the Museo della Via Ostiense, the Palazzo delle Poste** — shipped to San Saba.
- **Piramide di Caio Cestio, the Aurelian Walls segment** — shipped to Testaccio, despite parts of
  both testing Ostiense.
- **Piazza di Porta San Paolo and the four 1943 plaques** — §2b. San Saba's or Ostiense's; not mine
  to take unilaterally.
- **Abbazia delle Tre Fontane, San Paolo alle Tre Fontane, Santa Maria Scala Coeli, Santa Maria del
  Terzo Millennio** — Ardeatino and EUR. §2e.
- **Anything under the name "Marconi" except the bridge** — zona 15A is Portuense. §1.1.
- **Teatro India** (Lungotevere Vittorio Gassman) and the **ex Mira Lanza** — right bank, Portuense.
- **Roma Tre Dipartimento di Architettura, Largo G. B. Marzi 10** — Testaccio, in the shipped
  Mattatoio.
- **Stadio Tre Fontane and the Via delle Tre Fontane strip** — polygon says Ostiense, toponymy says
  otherwise. §2e. Offered to Ardeatino/EUR.
- **The four river bridges** — flagged, not claimed, facts gathered anyway. §2a.

---

## 8. YIELD — my honest read

**~69 numbered candidates plus a research tail.** This is a **guide, not a town page**, and it is not
close. Ostiense carries:

1. a **papal basilica** with a ticketed cloister, an archaeological area, a monastic garden and an
   abbey — four or five publishable records on one site, with real hours and real prices;
2. a **Musei Capitolini branch** with published hours, published prices and a documented building;
3. a **Sovrintendenza-run necropolis** with published booking terms and a sector that opened in
   July 2026;
4. **two catacombs** run by the Pontificia Commissione;
5. an **industrial-archaeology cluster** — Gazometro, ex Mercati Generali, ex Consorzio Agrario,
   the 1940 station, the 1924 station, the transport museum — that no rione has an equivalent of;
6. **Garbatella**, which is a coherent 1920s garden-suburb story with named architects, dated
   buildings, a founding inscription and a king who laid the stone;
7. five bridges, five 20th-century parish churches with named architects, a university campus, a
   confiscated-mafia-villa jazz venue and a street-art corridor.

The failure mode here is **not thinness, it is looseness**: a quartiere this big will tempt vague
locators and will tempt a writer to hoover up 355 restaurants. Address everything. Cut the OSM-only
records ruthlessly.

**Least confident three:**
1. **Ex Mercati Generali (C13)** — the only major subject where I could not settle a construction
   date, and it.wikipedia contradicts itself in the same article (1908–1916 vs 1921). No
   institutional page reachable.
2. **Casa del Jazz (C48)** — Ostiense on the polygon and on it.wikipedia's own category, but the
   address is *Viale di Porta Ardeatina* and Ardeatino is live in this wave; and the venue's own site
   gives two different seat counts.
3. **Forte Ostiense (C10) and the southern Tre Fontane strip (§2e)** — categorised Ostiense but
   sitting in Municipio IX among Montagnola/EUR toponyms, on the part of the polygon I trust least.

Runner-up worry: **C45 Santa Maria Regina degli Apostoli alla Montagnola**, same southern-edge
problem, though its article names the quartiere outright.

---

## 9. SOURCES FETCHED

**Roma Capitale / institutional**
- `https://www.centralemontemartini.org/it/informazioni_pratiche/orari_e_indirizzi` · `…/biglietti` ·
  `…/infopage/la-centrale-elettrica` · `…/il_museo/storia_del_museo` · `…/infopage/presentazione`
- `https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/necropoli_di_san_paolo`
- `https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/cisterna_della_via_colombo`
- `https://www.turismoroma.it/it/luoghi/centrale-montemartini`
- `https://www.turismoroma.it/it/luoghi/basilica-di-san-paolo-fuori-le-mura`
- `https://www.info.roma.it/monumenti_dettaglio.asp?ID_schede=11019` (Gazometro) · `…?ID_schede=7204`

**Holy See**
- `https://www.vatican.va/roman_curia/secretariat_state/archivio/documents/rc_seg-st_19290211_patti-lateranensi_it.html` (Lateran Pacts, Artt. 13–16)
- `https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html` (Zone extraterritoriali vaticane, 03.04.2001)
- `https://www.catacombeditalia.va/content/archeologiasacra/it/visita-catacombe/per-regione/roma/catacomba-di-commodilla.html`
- `http://www.vatican.va/holy_father/john_paul_ii/homilies/1978/documents/hf_jp-ii_hom_19781203_franc-saverio_it.html` (cited in the wiki article; not separately fetched)
- `http://www.vatican.va/archive/aas/documents/AAS-19-1927-ocr.pdf` (cited, not fetched)

**Own sites of the places**
- `https://www.basilicasanpaolo.org/` · `/orari/` · `/chiostro-e-area-archeologica/`
- `https://www.abbaziasanpaolo.org/` · `/giardino-monastico/` · `/biblioteca-monastica/`
- `https://www.casadeljazz.com/` · `/i-luoghi/`
- `https://teatropalladium.uniroma3.it/` · `/il-teatro/`
- `https://www.uniroma3.it/ateneo/sedi/`
- `https://www.eataly.net/it_it/negozi/roma/`

**ArchiDiAP (Sapienza DiAP)**
- `https://www.archidiap.com/opera/gazometro/`
- `https://www.archidiap.com/opera/albergo-rosso/`
- `https://www.archidiap.com/opera/quartiere-valco-san-paolo-torri-stellari/`
- `https://www.archidiap.com/opera/scuola-in-piazza-damiano-sauli/`

**it.wikipedia wikitext, all via `action=parse&prop=wikitext`**
Ostiense · Garbatella · Basilica di San Paolo fuori le mura · Centrale Montemartini · Gazometro di
Roma · Catacombe di Commodilla · Catacomba di Santa Tecla · Chiesa dei Santi Isidoro e Eurosia ·
Chiesa di San Filippo Neri in Eurosia · Chiesa di San Francesco Saverio alla Garbatella · Chiesa di
San Benedetto (Roma) · Chiesa di Santa Galla (Roma) · Chiesa di Santa Marcella · Basilica di Santa
Maria Regina degli Apostoli alla Montagnola · Forte Ostiense · Casa del jazz · Palazzo della Regione
Lazio · Teatro Palladium · Innocenzo Sabbatini · Stazione di Roma Ostiense · Stazione di Roma Porta
San Paolo · Piramide (metropolitana di Roma) · Polo museale dei trasporti · Ponte dell'Industria ·
Ponte San Paolo · Ponte Guglielmo Marconi · Ponte della Scienza · Ponte Settimia Spizzichino ·
Circonvallazione Ostiense · Valco San Paolo · Marconi (zona di Roma) · Via Ostiense · Blu (artista) ·
Abbazia delle Tre Fontane · Università degli Studi Roma Tre · Eccidio del ponte dell'Industria ·
Settimia Spizzichino · Teatro India

**OSM / Overpass** — boundary relations 5460386, 5454344, 5454343, 5460387, 5473394, 5460399, all
fetched with `out geom` and tested locally; two tag-scans of the Ostiense area returning 157 named
heritage/culture/transport features and 355 named food/lodging/artwork features.

**Prior corpus files read**: `docs/rome/scope-quartieri.md`, `docs/rome/scope-vatican-and-extraterritorial.md`,
`docs/rome/testaccio-finder.md`, `docs/rome/wave4-arbitration.md`, `priv/seed_data/rome_roster.json`.
