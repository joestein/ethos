# Rome scope research — Angle 3: The Sovereignty Problem

Research inputs for the Rome corpus spec. **Evidence, not adjudication.** A later step picks.

**Method note.** WebSearch was unavailable and `WebFetch` was blocked for part of this session
(safety-classifier outage), so everything below was fetched by `python urllib` against URLs named in
advance: Wikipedia/Wikisource `action=raw` wikitext, and the Lateran Treaty PDF from the Internet
Archive. The `grep`-through-`rtk` shell was used only for locating lines inside already-downloaded
files, never as a source of truth. Every claim below carries its URL. Primary-source (treaty text,
vatican.va) claims are marked **[PRIMARY]**; Wikipedia-only claims are marked **[WIKI]**.

Cached source files: `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/a3_pages/`

---

## 0. The three legal tiers (this is the finding that reorganizes everything)

The programme's instinct is to treat "Vatican" as one boundary problem. The Lateran Treaty actually
creates **three** distinct statuses, and conflating tiers 2 and 3 is the most common error in
secondary sources — including in the pages I read.

| Tier | Legal status | Treaty basis | What it means physically |
|---|---|---|---|
| **1. Vatican City State** | Foreign sovereign territory | Arts. 3–4, Attachment I map | Not Italy. Not Rome. Not in any rione. |
| **2. Extraterritorial properties** | **Italian soil**, with diplomatic-mission immunity | Art. 15 (Attachment II) | In the Comune di Roma, in a rione/quartiere. Like an embassy. |
| **3. Exempt properties** | **Italian soil**, tax/expropriation exemption only | Art. 16 (Attachment III) | Ordinary Italian territory. **Not extraterritorial at all.** |

**[PRIMARY]** Art. 15 grants the tier-2 properties, "even if such edifices form part of the territory
of the Italian State … the immunities granted by International Law to the headquarters of the
diplomatic agents of foreign States."
Source: Lateran Treaty (English), Art. 15 —
`https://web.archive.org/web/20110813090725if_/http://www.vaticanstate.va/NR/rdonlyres/3F574885-EAD5-47E9-A547-C3717005E861/2528/LateranTreaty.pdf`

**[PRIMARY]** Art. 16 gives its (different) list only this: the buildings "will never be subject to
liens or to expropriation for reasons of public utility, save by previous agreement with the Holy
See, and will be exempt from taxes." No immunity clause. Same source, Art. 16.

**VERIFIED consequence for a visitor:** extraterritoriality is *not* being abroad. The Holy See's own
press office says the properties "godono del privilegio della extraterritorialità e sono esenti da
espropriazione e da tributi" ("enjoy the privilege of extraterritoriality and are exempt from
expropriation and from taxes") — a property/immunity privilege, not a border.
Source: vatican.va, *Zone extraterritoriali vaticane*, updated 03.04.2001 —
`https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html`

**[WIKI]** Stated plainly: "those visiting these properties are generally required to follow the
immigration rules of Italy. For example, American seminarians at the Pontifical North American
College need an Italian visa, despite residing, and studying, in extraterritorial property of the
Holy See." — `https://en.wikipedia.org/wiki/Properties_of_the_Holy_See`

**INFERENCE (mine, flagged):** for a travel guide this means a tier-2 property needs no border
language at all. You walk in off a Roman street. The correct editorial treatment is a *status note*,
not a *location*. Tier-3 properties (Gregorian University, Sant'Apollinare, the Sts John & Paul
retreat house, San Carlo ai Catinari's attached palace) should carry **no** Vatican status note —
calling them extraterritorial would be a factual error the fact-fidelity reviewer should catch.

---

## 1. The Vatican City boundary, precisely

### 1a. What the treaty actually says

**[PRIMARY]** Art. 3, para. 2: "The boundaries of the said City are set forth in the map which
constitutes Attachment I of the present Treaty, of which it forms an integral part."

That is the *entire* textual definition. There is no verbal boundary description in the treaty. The
border is a 1:5000 map and nothing else.

**[PRIMARY]** Art. 3, para. 3 — the St Peter's Square clause, quoted in full because it is
load-bearing:

> "It remains understood that St. Peter's Square, **although forming part of Vatican City**, will
> continue to be normally open to the public and to be subject to the police power of the Italian
> authorities, who will stop at the foot of the steps leading to the Basilica … and they will,
> therefore, abstain from mounting the steps and entering the said Basilica, unless they are asked
> to intervene by the competent authority."

> "Whenever the Holy See consider it necessary … to close St. Peter's Square temporarily to the free
> passage of the public, the Italian authorities will withdraw beyond the outer lines of Bernini's
> Colonnade and their extension."

**VERIFIED: St Peter's Square is inside Vatican City.** The Italian police presence is a *policing
concession inside foreign territory*, not evidence that the piazza is Italian. This is the single
most-often-garbled fact in Rome guidebooks and the corpus should get it right.

### 1b. Where the line runs on the ground — and the travertine strip

The brief asks whether the travertine strip at the piazza edge is the boundary. **Answer: yes,
substantially — but with a twist that makes the simple version wrong.**

**[WIKI]** Italian Wikipedia, *Confine tra Città del Vaticano e Italia*
(`https://it.wikipedia.org/wiki/Confine_tra_Citt%C3%A0_del_Vaticano_e_Italia`), § *Delimitazione*:

> "Il confine segue le Mura Leonine fino a poco prima del colonnato di piazza San Pietro, dove una
> piccola parte di territorio italiano, chiamato anche Ricciolo d'Italia, si insinua nel territorio
> del Vaticano … poi segue il resto del colonnato di destra piazza San Pietro e la delimitazione tra
> piazza San Pietro e piazza Pio XII. **La linea esatta è segnata sul suolo da una linea curva di
> travertino.** … Il confine prosegue seguendo il bordo esterno del colonnato berniniano di sinistra,
> fino alla sacrestia della basilica di San Pietro, e prosegue dividendo l'Aula Paolo VI tra i due
> Stati (poltrone in Italia ma in zona extraterritoriale a favore della Santa Sede, palco in
> Vaticano)."

> *Translation:* "The border follows the Leonine Walls until just before the colonnade of St Peter's
> Square, where a small piece of Italian territory, also called the Ricciolo d'Italia, insinuates
> itself into Vatican territory … then it follows the rest of the right-hand colonnade of St Peter's
> Square and the demarcation between St Peter's Square and Piazza Pio XII. **The exact line is
> marked on the ground by a curved travertine line.** … The border continues along the outer edge of
> the left-hand Bernini colonnade as far as the sacristy of St Peter's Basilica, and continues by
> dividing the Paul VI Audience Hall between the two States (seating in Italy but in an
> extraterritorial zone in favour of the Holy See, stage in the Vatican)."

Same article: total border length **3.2 km**; it is an external EU border, but there are no customs
controls under a special arrangement.

**So the answer to the brief's question is:**
- The travertine line **is** the marked boundary, and it runs along the **Piazza San Pietro / Piazza
  Pio XII demarcation** and the outer edge of the colonnade — i.e. at the *open eastern end* of the
  piazza, where Via della Conciliazione arrives. Piazza Pio XII is Italy; Piazza San Pietro is the
  Vatican.
- **But** the boundary is *not* simply "the edge of the piazza," because of the Ricciolo.

### 1c. The Ricciolo d'Italia — the anomaly that breaks any naive rule

**[WIKI]** `https://en.wikipedia.org/wiki/Ricciolo_d%27Italia` and
`https://it.wikipedia.org/wiki/Ricciolo_d%27Italia`:

- A **~3 m wide, ~60 m long, <105 m² curl of Italian territory** that runs behind the **northern
  (right-hand, facing the basilica) arm of Bernini's colonnade**, beginning near **Porta Angelica**,
  with its tip near the Apostolic Palace. Marked by a curved travertine line.
- Created by the 1929 border as drawn. Overlooked by the Church of Santi Martino e Sebastiano degli
  Svizzeri, Porta San Pellegrino, the Vatican post office and the Apostolic Palace.
- **[WIKI]** "This strip of Italian soil is mistakenly considered … to be part of Vatican territory.
  Even Italian police forces and Swiss guards stationed there are said to consider the strip as
  belonging to the Vatican." In practice the Vatican administers it. The Comune di Roma has at times
  treated it as Vatican (it declined to license the news kiosk beside Porta Angelica); it appears on
  the Comune's georeferenced boundary map but **not** on the cadastral map.

**VERIFIED and important:** the border was never authoritatively surveyed. Italian Wikipedia (both
the *Confine* and *Ricciolo* articles, citing Aldo Maria Valli, *Piccolo mondo vaticano*, Laterza
2013, pp. 29–30, ISBN 978-88-581-0845-1):

> "la mappa … non è chiara in alcuni punti: per tale motivo venne costituita una commissione
> bilaterale italo-vaticana per verificare puntualmente i confini tra i due stati, tuttavia dopo
> quattro anni di lavori **le conclusioni non vennero più ratificate**, per cui in alcuni casi si
> sono consolidate le consuetudini."

> *Translation:* "the map … is not clear at some points: for this reason a bilateral Italo-Vatican
> commission was set up to verify the borders between the two states precisely; however, after four
> years of work **the conclusions were never ratified**, so in some cases customary practice has
> become settled."

*(Note a source disagreement: the `Ricciolo d'Italia` article says "tre anni" / three years; the
`Confine` article says "quattro anni" / four years. Both say the conclusions were never ratified.
Minor, but a verifier should not treat either number as established.)*

**INFERENCE (mine):** a corpus that must place every point in exactly one polygon is, at the
colonnade, asserting a line that the two sovereigns themselves declined to ratify. That is an
argument for prose status notes over hard geometric assignment at this one location.

### 1d. What is inside Vatican City

**[PRIMARY / WIKI]** Inside (tier 1): **St Peter's Basilica, St Peter's Square, the Vatican Museums,
the Sistine Chapel, the Vatican Gardens, the Apostolic Palace, the Governorate, Domus Sanctae
Marthae**, and the rest of the area within the Leonine Walls.
It. Wikipedia *Città del Vaticano*: "All'interno delle mura medievali e rinascimentali che
circondano, **eccetto piazza San Pietro**, l'intera area, si trovano il Palazzo Apostolico, il
Palazzo del Governatorato, i Musei Vaticani, i Giardini Vaticani e altri edifici minori."
("Within the medieval and Renaissance walls that surround the entire area, **except St Peter's
Square**, are the Apostolic Palace, the Governorate Palace, the Vatican Museums, the Vatican Gardens
and other minor buildings.") — `https://it.wikipedia.org/wiki/Citt%C3%A0_del_Vaticano`

Area **0.49 km²**; population **882** (Vatican City State figure, 31 Dec 2024) —
`https://en.wikipedia.org/wiki/Vatican_City`, citing
`https://www.vaticanstate.va/it/stato-governo/note-generali/popolazione.html`

### 1e. What sits just outside, in the rione of Borgo

**[WIKI]** `https://it.wikipedia.org/wiki/Borgo_(rione_di_Roma)`: Borgo is **rione XIV**, declared
the fourteenth rione by Sixtus V on 9 December 1586. Its stated borders: "**Il rione confina con: la
Città del Vaticano (piazza San Pietro) ad ovest**" ("The rione borders: Vatican City (St Peter's
Square) to the west").

So Borgo is the rione that **abuts** the piazza and contains everything east of the travertine line:
Via della Conciliazione, Piazza Pio XII, Castel Sant'Angelo, the Passetto di Borgo, Santa Maria in
Traspontina, Palazzo Torlonia, Palazzo dei Penitenzieri, and four of the extraterritorial palaces
(below). **Borgo is Italian, in the Comune di Roma, and is not the Vatican.** The 1929 talks
considered giving the pope sovereignty over the whole Leonine City; the article records that in 1870
Pius IX refused a similar offer and that in 1929 "solo la Città del Vaticano divenne *de iure* uno
stato estero" ("only Vatican City became *de iure* a foreign state").

---

## 2. The enumerated extraterritorial properties, with locations

The **authoritative enumeration is the Holy See's own**, not Wikipedia's. Below is the vatican.va
list (13 Rome entries, numbered as the source numbers them), with rione/quartiere established
separately from Italian Wikipedia article categories (`Categoria:Roma R. <n> <name>`), which encode
the official rione code.

Source for the list: `https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html`
Cross-check list: `https://it.wikipedia.org/wiki/Zone_extraterritoriali_della_Santa_Sede_in_Italia`

### In the Comune di Roma — all tier 2, all on Italian soil

| # | Property (vatican.va wording) | Rione / quartiere | Code | Verified how |
|---|---|---|---|---|
| 1 | "il complesso di S. Giovanni in Laterano (Basilica, Palazzo Apostolico Lateranense con gli edifici annessi e la Scala Santa)" | **Monti** — but the complex **straddles into Esquilino** (see note) | R.I / R.XV | Cat. `Roma R. I Monti` on *Palazzo del Laterano*; `Chiese di Roma (rione Monti)` on the basilica; **`Roma R. XV Esquilino` on *Scala Santa*** |
| 2 | "la Basilica di S. Maria Maggiore con gli edifici annessi" | **Monti *and* Esquilino** — explicitly both | R.I / R.XV | it.wiki lead: "situata nel **Rione Monti e nel Rione Esquilino**"; category is Esquilino |
| 3 | "la Basilica di S. Paolo fuori le Mura con gli edifici annessi" | **Ostiense** — a *quartiere*, not a rione; ~2 km **outside** the Aurelian Walls | Q.X | Cat. `Chiese di Roma - Q.X Ostiense` |
| 4 | "il Palazzo della Cancelleria" | **Parione** (between Corso Vittorio Emanuele II and Campo de' Fiori) | R.VI | Cat. `Roma R. VI Parione` |
| 5 | "il Palazzo di Propaganda Fide" | **Colonna** (on Piazza di Spagna) | R.III | Cat. `Roma R. III Colonna`; lead confirms "rione Colonna … con affaccio su piazza di Spagna" |
| 6 | "il Palazzo di S. Callisto in Trastevere" | **Trastevere** (Piazza San Calisto 16, beside Santa Maria in Trastevere) | R.XIII | it.wiki lead |
| 7 | "il Palazzo del Sant'Offizio ed adiacenze" | **Borgo** (Piazza del Sant'Uffizio, by Porta Cavalleggeri, beside the piazza) | R.XIV | Cat. `Roma R. XIV Borgo` |
| 8 | "il Palazzo dei Convertendi" | **Borgo** (north side of Via della Conciliazione; originally on Piazza Scossacavalli, demolished 1937, rebuilt) | R.XIV | Cat. `Roma R. XIV Borgo` |
| 9 | "il Palazzo Maffei o del Vicariato" | **Pigna** (corner of Via dei Cestari / Via della Pigna) | R.IX | Cat. `Roma R. IX Pigna` |
| 10 | "il Palazzo delle Congregazioni ai Propilei" | **Borgo** (Via della Conciliazione) | R.XIV | Cat. `Roma R. XIV Borgo` |
| 11 | "il Palazzo Pio" (Palazzo San Pio X), extraterritorial from 1979, **excluding the Auditorium premises**, in substitution for the Palazzo della Dataria | **Borgo** (Via della Conciliazione) | R.XIV | it.wiki lead: "in via della Conciliazione, nel rione di Borgo" |
| 12 | "il Pontificio Seminario Romano Minore" | Viale Vaticano 42, just **outside** the Vatican walls near Porta Pertusa, opposite the Vatican heliport — in the modern **quartiere Aurelio** | Q.XIII (**INFERRED**) | Address from it.wiki *Pontificio Seminario Romano Minore*; Aurelio "confina … a nord con … il territorio della Città del Vaticano" — but **I did not find a source stating the seminary's quartiere outright** |
| 13 | "gli immobili sul Gianicolo" — a cluster, not one building | **Trastevere** rione and adjacent **Gianicolense/Aurelio** quartieri (see below) | R.XIII + Q.XII/XIII | Partially verified only |

**Item 13 enumerated** (vatican.va's own parenthesis): Pontificio Collegio Pio Romeno; Pontificio
Collegio Ucraino di S. Giosafat; Pontificio Collegio Americano del Nord (North American College);
Ospedale del Bambino Gesù; **Chiesa di S. Onofrio e Convento**; Pontificia Università Urbaniana;
Area dei Servizi Tecnici della Santa Sede; Collegio Internazionale S. Monica; Curia Generalizia della
Compagnia di Gesù; Istituto di Maria Bambina; **Chiesa dei Ss. Michele e Magno**; Edificio delle
Suore Calasanziane; Casa delle Suore dell'Addolorata; immobili su Borgo Santo Spirito contigui alla
Curia dei Gesuiti.

Of these I could verify only **Sant'Onofrio al Gianicolo → rione Trastevere** (cat. `Chiese di Roma
(rione Trastevere)`). The rest are **UNVERIFIED as to rione**; note that "immobili su Borgo Santo
Spirito" are by name in **rione Borgo**, so item 13 itself spans at least two rioni. Anyone building
the roster must resolve these individually.

### Outside Rome — tier 2

**[PRIMARY]** vatican.va: "Immobili con privilegio di extraterritorialità fuori Roma sono: il Palazzo
Pontificio, la Villa Cybo e la Villa Barberini a **Castelgandolfo** … che coprono una superficie
globale di 400 mila metri quadrati, a cui venne ad aggiungersi il nuovo Centro radiotrasmittente di
**Santa Maria di Galeria**, sorto nei pressi di Cesano a 18 km da Roma, in seguito all'accordo tra
Santa Sede e Italia dell'8 ottobre 1951."

> *Translation:* "Properties with the privilege of extraterritoriality outside Rome are: the
> Pontifical Palace, Villa Cybo and Villa Barberini at Castel Gandolfo … covering a total of 400,000
> m², to which was added the new Santa Maria di Galeria transmitting centre, built near Cesano 18 km
> from Rome, following the Holy See–Italy agreement of 8 October 1951."

Total extraterritorial estate: **~700,000 m²** (vatican.va).

### Tier 3 — exempt but NOT extraterritorial (Art. 16)

**[PRIMARY]** Art. 16 names: the **Gregorian University**; the **Biblical, Oriental and
Archaeological Institutes**; the **Russian Seminary**; the **Lombard College**; the **two Palaces of
St Apollinaris**; the **Clergy Retreat House of Sts John and Paul**. English Wikipedia's
"Non-extraterritorial property" section adds the Palace of the Holy Apostles (attached to Santi
Apostoli), the palace attached to San Carlo ai Catinari, and the Collegio Bellarmino.

**These must not be labelled extraterritorial in the corpus.** Several tourist sources do.

### Former / no longer

**[PRIMARY]** **Palazzo della Dataria** (near the Quirinal) — named in Art. 15, but vatican.va's 2001
list records it is "non più di proprietà della Santa Sede," swapped for Palazzo Pio in 1979. A
guide should not list it.

### Two disagreements a verifier should re-check

1. **Campo Santo Teutonico (Teutonic Cemetery).** English Wikipedia's *body* says "The cemetery lies
   entirely outside the borders of Vatican City. It is an extraterritorial property of the Holy
   See" — while the *same page*'s short description says "Burial site in Vatican City" and it is
   filed under `Category:Cemeteries in Vatican City`
   (`https://en.wikipedia.org/wiki/Teutonic_Cemetery`). **The Holy See's own 2001 list does not
   include it at all.** I could not resolve this. Treat as unsettled.
2. **Paul VI Audience Hall (Aula Paolo VI).** English *Properties of the Holy See* lists it as
   partly extraterritorial "the rostrum with the papal throne however, is part of Vatican
   territory"; Italian *Confine* says the border runs through the hall, "poltrone in Italia ma in
   zona extraterritoriale … palco in Vaticano" (seats in Italy but extraterritorial, stage in the
   Vatican), adding that the state border "non risulta segnato sul pavimento dell'Aula e segue un
   percorso a zig-zag" ("is not marked on the floor of the Hall and follows a zig-zag path"). These
   broadly agree; the hall is genuinely split. **It is not assignable to one polygon.**
   The Holy See's 2001 list does not name it either.

**Note on UNESCO framing** — potentially useful for corpus structure: UNESCO treats these as a single
inscribed property, "Historic Centre of Rome, the Properties of the Holy See in that City Enjoying
Extraterritorial Rights and San Paolo Fuori le Mura" (ID 91ter, inscribed 1980, extended 1990 and
2015; area given as 38.9 ha) — `https://en.wikipedia.org/wiki/Properties_of_the_Holy_See`.
vatican.va confirms all Rome extraterritorial properties **except the Seminario Romano Minore** are
on the World Heritage list. So there is precedent from a serious institution for grouping the
extraterritorial properties as one named entity distinct from the historic centre.

---

## 3. Options for a corpus that assigns each place to exactly one neighborhood file

Stated with evidence for and against. **Not adjudicated.**

### The constraint, restated

Bronx/Queens assumed: every place sits in exactly one neighborhood, neighborhoods tile the borough,
and the roster's `in_scope` flag is a clean in/out. Rome breaks all three at the Vatican:
Vatican City is a different country; the Lateran properties are Italian-soil-with-immunity; the
Vatican/Italy border is unratified at the colonnade; and at least two structures (Aula Paolo VI, the
Lateran complex, arguably Santa Maria Maggiore) physically straddle a boundary.

### Option A — Vatican City as its own page, outside the rione system

- **For:** It is a sovereign state with its own area, population and border
  (`https://en.wikipedia.org/wiki/Vatican_City`). Matches how every atlas, UNESCO and the Holy See
  itself treat it. A reader searching "Vatican" expects one page. The five headline sites (Basilica,
  Square, Museums, Sistine Chapel, Gardens) are all tier 1, so the page is internally coherent.
- **For:** Avoids the false claim that the Vatican is a Roman neighborhood.
- **Against:** Breaks the "neighborhoods tile the administrative unit" invariant — the corpus would
  need a page type that is not a rione, and the test gate must be written to permit exactly one such
  exception (or a general "non-rione unit" concept, which invites scope creep).
- **Against:** It is not in the Comune di Roma at all, so any "places in Rome" count becomes
  ambiguous unless the schema carries a country/comune field.
- **Evidence note:** Art. 3's map-only boundary definition and the unratified 1932/33 commission mean
  the page cannot claim a precisely surveyed footprint; it can claim the Leonine Walls plus the
  piazza, which is defensible and citable.

### Option B — publish the four papal basilicas by the rione they physically stand in, with a status note

- **For:** Legally accurate. Art. 15 says these are *Italian territory* with embassy-style immunity;
  the Holy See's own page frames it as a privilege attaching to buildings, not a border.
- **For:** Matches how a visitor experiences them — you walk from a Roman street into San Giovanni in
  Laterano with no border, no passport, under Italian immigration law
  (`https://en.wikipedia.org/wiki/Properties_of_the_Holy_See`, seminarian-visa example).
- **For:** Keeps the rione tiling intact; the exception is a *field on the place record*, not a new
  page type.
- **Against:** Two of the four straddle rione boundaries. Santa Maria Maggiore is explicitly "nel
  Rione Monti e nel Rione Esquilino"; the Lateran complex is Monti while the Scala Santa across the
  piazza is categorised Esquilino. A one-file rule forces an arbitrary pick at exactly the two
  best-known sites.
- **Against:** San Paolo fuori le Mura is in **quartiere Ostiense**, ~2 km outside the Aurelian
  Walls — so "the four papal basilicas" cannot all live in the rione system either; one of them
  needs the quartiere system, which is a second scope decision (see Angle on rioni vs quartieri).
- **Against:** St Peter's — the fourth papal basilica — is **not** in this tier at all; it is tier 1.
  So "publish the four papal basilicas by rione" is incoherent as stated: three by rione/quartiere,
  one in the Vatican.

### Option C — a single "Vatican City & the extraterritorial properties" page

- **For:** Has institutional precedent: UNESCO inscribes exactly this grouping as one property
  (ID 91ter), and vatican.va treats the set as one list.
- **For:** Lets the guide explain the three tiers once, well, instead of repeating a status note on
  twenty records.
- **Against:** Geographically incoherent for a *travel* guide — it would put Piazza di Spagna's
  Propaganda Fide, Campo de' Fiori's Cancelleria, Trastevere's San Callisto and Ostiense's San Paolo
  on one page, when a visitor reaches them on four different days. Directly conflicts with the
  neighborhood-guide premise.
- **Against:** vatican.va's own list is 13 Rome entries where entry 13 is a 14-building cluster —
  the "one page" would be long and mostly about buildings closed to visitors.

### Option D — hybrid: Vatican City its own page (tier 1); tier-2 places live in their rione/quartiere with a typed status field; tier 3 gets no Vatican treatment

- **For:** Each tier is handled by the mechanism that matches its legal reality.
- **For:** Testable. A per-directory gate can assert: no place record has `neighborhood: vatican` and
  a rione; every tier-2 record carries `holy_see_status: extraterritorial` **and** a rione/quartiere;
  no Art. 16 property carries that flag. That is a gate writable *before* the content, which is what
  the programme requires.
- **Against:** Requires a new schema field the Bronx/Queens corpus does not have, so the shared
  library changes — outside this wave's remit but a real cost.
- **Against:** Still does not resolve the straddlers (Santa Maria Maggiore, the Lateran complex,
  Aula Paolo VI). Needs a tie-break rule, and any rule will be arbitrary at the seam.

### The straddler problem, isolated

Whatever option is picked, these need an explicit rule, because the sources themselves are split:

| Place | The conflict | Sources |
|---|---|---|
| Santa Maria Maggiore | Lead text says Monti **and** Esquilino; category says Esquilino | `https://it.wikipedia.org/wiki/Basilica_di_Santa_Maria_Maggiore` |
| Lateran complex | Basilica + Palace categorised **Monti**; Scala Santa categorised **Esquilino**; it.wiki *Zone extraterritoriali* locates the whole thing "sul **Celio**" (Caelian) — a third answer | `https://it.wikipedia.org/wiki/Palazzo_del_Laterano`, `.../Scala_Santa`, `.../Zone_extraterritoriali_della_Santa_Sede_in_Italia` |
| Aula Paolo VI | Border runs through it, unmarked, zig-zag | `https://it.wikipedia.org/wiki/Confine_tra_Citt%C3%A0_del_Vaticano_e_Italia` |
| Ricciolo d'Italia | Italy *de jure*, Vatican *de facto*; on the Comune's boundary map but not its cadastral map | `https://it.wikipedia.org/wiki/Ricciolo_d%27Italia` |

**INFERENCE (mine):** the Lateran "sul Celio" claim is probably loose topographic writing (the
Lateran sits on the Caelian's eastern slope) rather than an administrative claim, since rione Celio
(R.XIX) exists as a distinct unit. But I did not verify the Lateran's rione against a
Comune di Roma source, only against Wikipedia categories. **A verifier should check the Comune's own
rione cartography before the roster locks.**

---

## 4. Castel Gandolfo — in or out?

### Facts VERIFIED

- **A separate comune.** Its own municipality with its own government and domain
  (`https://www.comune.castelgandolfo.rm.it`) — `https://en.wikipedia.org/wiki/Castel_Gandolfo`.
  The `rm` in the domain is the Province/Metropolitan City of Rome.
- **~25 km southeast of Rome**, in Lazio, on a hilltop in the Alban Hills above Lake Albano;
  **~8,900 residents**; one of *I Borghi più belli d'Italia*; inside the Parco Regionale dei Castelli
  Romani. (same source)
- **The papal villas there are tier 2, not tier 1** — extraterritorial Italian soil, per Art. 14 and
  vatican.va. Art. 14 **[PRIMARY]**: "Italy recognizes the full ownership by the Holy See of the
  Papal Palace of Castel Gandolfo … and Italy also obliges itself to hand over to the Holy See …
  Villa Barberini in Castel Gandolfo." The extraterritorial zone is ~400,000 m² (vatican.va) /
  ~55 ha including the papal farm between Castel Gandolfo and Albano Laziale
  (`https://en.wikipedia.org/wiki/Properties_of_the_Holy_See`).
- **It is now genuinely visitable, which changes the calculus.**
  `https://it.wikipedia.org/wiki/Ville_pontificie_di_Castel_Gandolfo`: "Papa Francesco (2013–2025)
  invece non ha mai villeggiato a Castel Gandolfo … Il 14 ottobre 2016 viene reso noto che il papa ha
  deciso di aprire al pubblico l'intero complesso delle Ville Pontificie, **rendendole un museo**."
  ("Pope Francis never holidayed at Castel Gandolfo … On 14 October 2016 it was announced that the
  pope had decided to open the entire complex of the Pontifical Villas to the public, **making them a
  museum**.")
- **Papal use resumed under Leo XIV.** Same source: "Castel Gandolfo è tornato ad essere luogo di
  villeggiatura papale con **Leone XIV** (pontefice dal 2025); dopo il primo anno di pontificato, in
  cui ha scelto come sua residenza **Villa Barberini**" ("Castel Gandolfo has returned to being a
  papal summer residence under Leo XIV, pope since 2025; after the first year of his pontificate, in
  which he chose Villa Barberini as his residence"), cited to
  `https://www.vaticannews.va/it/papa/news/2025-07/papa-leone-xiv-trasferimento-castel-gandolfo-estate.html`.
  **I did not fetch the Vatican News article itself** — this is Wikipedia's citation, not my own
  verification, and it is recent enough to warrant a direct check before publication, including
  whether resumed papal use has changed museum access.
- Also there: the **Specola Vaticana** (Vatican Observatory), moved from the Collegio Romano in 1933;
  the Collegiate Church of San Tommaso da Villanova by Bernini; remains of the **Villa of Domitian**.

### The case for OUT

- It is **not in the Comune di Roma**. Every Bronx/Queens neighborhood was inside the borough; this
  is not inside the city. Including it means the corpus's unit of analysis silently becomes the
  Metropolitan City (which also contains Tivoli, Ostia Antica, Frascati, Anzio…), and there is no
  principled stopping point after that.
- 25 km out is a day trip, not a neighborhood. The programme's page type is a *neighborhood* guide.
- It has its own comune identity and would arguably deserve its own destination guide, not a Rome
  neighborhood file.

### The case for IN

- The brief's own framing — the papal properties as a set — is incomplete without it; vatican.va
  lists Castel Gandolfo in the same breath as the Roman properties.
- It is a genuine visitor destination now (museum since 2016, gardens, Bernini church, Domitian
  ruins, Lake Albano), reachable by train from Roma Termini.
- Excluding it means the "extraterritorial properties" story stops mid-sentence.

### A third framing (surfaced, not endorsed)

Because Castel Gandolfo is tier 2 — *Italian soil with immunity* — it is structurally identical to
San Giovanni in Laterano, differing only in **distance**. So the decision is not really about
sovereignty; **it is a radius decision**, and it belongs with whatever rule the programme adopts for
day-trip destinations generally (Ostia Antica, Tivoli), not with the Vatican question. The same is
true of **Santa Maria di Galeria** (the Vatican Radio transmitter site, 424 ha, 18 km out, ceded by
the 8 October 1951 agreement) — extraterritorial, but a fenced transmitter park with no visitor
function, which is probably out on relevance grounds regardless of radius.

---

## 5. What I could not establish

Stated plainly, as findings:

1. **I could not obtain Attachment I** (the 1:5000 boundary map) or Attachments II and III as
   images/transcriptions. All boundary geometry above is from the treaty's *text* plus secondary
   description. The Gazzetta Ufficiale scan is cited by it.wiki at
   `http://augusto.agid.gov.it/gazzette/index/download/id/1929130bis_P1` — **unfetched**.
2. **I could not verify the rione/quartiere of most of the Gianicolo cluster** (item 13) — only
   Sant'Onofrio (Trastevere). The Urbaniana and North American College pages 404'd under the titles
   I tried.
3. **The Pontificio Seminario Romano Minore's quartiere (Aurelio, Q.XIII) is my inference** from its
   Viale Vaticano 42 address plus Aurelio's stated northern border with Vatican territory. No source
   states it directly.
4. **Campo Santo Teutonico's status is unresolved** — English Wikipedia contradicts itself and the
   Holy See's list omits it.
5. **I did not verify any rione assignment against a Comune di Roma primary source**, only against
   Italian Wikipedia's `Roma R. <n>` categories. These are consistent and specific, but they are not
   the Comune's cartography.
6. **The Leo XIV / Castel Gandolfo development is second-hand** (Wikipedia citing Vatican News); it
   is recent and should be checked directly.
7. **WebSearch was unavailable and WebFetch was down** for part of this session, so I could not do
   open-ended discovery — everything came from URLs I could name in advance. Anything the Holy See
   has published since the 2001 press-office update would not have surfaced.

---

## Source index

- Lateran Treaty, English text (Arts. 3, 7, 13, 14, 15, 16) — `https://web.archive.org/web/20110813090725if_/http://www.vaticanstate.va/NR/rdonlyres/3F574885-EAD5-47E9-A547-C3717005E861/2528/LateranTreaty.pdf`
- Holy See Press Office, *Zone extraterritoriali vaticane* (03.04.2001) — `https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html`
- Lateran Pacts, Italian text (cited, not fetched) — `https://www.vatican.va/roman_curia/secretariat_state/archivio/documents/rc_seg-st_19290211_patti-lateranensi_it.html`
- `https://it.wikipedia.org/wiki/Confine_tra_Citt%C3%A0_del_Vaticano_e_Italia`
- `https://it.wikipedia.org/wiki/Ricciolo_d%27Italia` · `https://en.wikipedia.org/wiki/Ricciolo_d%27Italia`
- `https://it.wikipedia.org/wiki/Zone_extraterritoriali_della_Santa_Sede_in_Italia`
- `https://en.wikipedia.org/wiki/Properties_of_the_Holy_See`
- `https://en.wikipedia.org/wiki/Vatican_City` · `https://it.wikipedia.org/wiki/Citt%C3%A0_del_Vaticano`
- `https://it.wikipedia.org/wiki/Borgo_(rione_di_Roma)`
- `https://en.wikipedia.org/wiki/Castel_Gandolfo` · `https://it.wikipedia.org/wiki/Ville_pontificie_di_Castel_Gandolfo`
- `https://it.wikipedia.org/wiki/Aurelio_(Roma)`
- `https://en.wikipedia.org/wiki/Teutonic_Cemetery`
- Per-property rione categories: it.wikipedia.org articles for Palazzo del Laterano, Scala Santa,
  Basilica di Santa Maria Maggiore, Basilica di San Paolo fuori le mura, Palazzo della Cancelleria,
  Palazzo di Propaganda Fide, Palazzo di San Callisto, Palazzo del Sant'Uffizio, Palazzo dei
  Convertendi, Palazzo Maffei Marescotti, Palazzo delle Congregazioni ai Propilei, Palazzo San Pio X,
  Pontificio Seminario Romano Minore, Chiesa di Sant'Onofrio al Gianicolo
