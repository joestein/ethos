# EUR — Quartiere Q. XXXII Europa, Roma Capitale toponymic code 232

**Finder research file. Evidence, not adjudication.** A verifier adjudicates each candidate; one
arbitrator rules ownership across the nine zones in this wave. Nothing below is a decision.

Research date: 2026-09-03. Every HTTP status and every quoted fact below was fetched by me in this
environment with `python3 + urllib` (raw bytes, not a summariser). Where a fetch failed I say so.

---

## 0. Headline

**64 candidates listed.** In my judgement EUR is a **full guide page, not a town page** — and it is
not close. The quartiere carries a state museum with two palazzi and published hours and prices, a
Roma Capitale civic museum plus a planetarium in the same building, a national archive with a free
permanent exhibition, four E42 monuments still standing in their designed relationship to one
another, two purpose-built Olympic venues from 1960 that still trade, a 165,000 m² park with an
artificial lake and a terraced water garden, a 1953 funfair, a domed basilica with published opening
hours, and a Marian shrine that a papal decree re-titled in April 2025.

The yield is *deep* rather than *broad*: EUR has few small places. It has perhaps thirty large ones,
almost all of them dated, attributed to named architects, and owned by one company (EUR S.p.A.) that
publishes per-building pages. That is an unusually strong evidential position for Rome — better than
several rioni already shipped — and it is why the count is high without padding.

**Where the yield genuinely thins:** shops and cafés. EUR is a business district; its bars and
restaurants are almost all ordinary neighbourhood trade with no published history. I list four, and
only one (Il Fungo, at the top of the water tower) has a claim on a guide beyond "there is a bar
here". I did not pad this section and the verifier should expect it to be short.

**Zero conflicts with shipped files.** `python3 .superpowers/taken_slugs.py eur` and searches for
`civilta`, `congressi`, `pietro-e-paolo`, `uffici`, `cascate`, `laghetto`, `ostiense`,
`colosseo-quadrato` returned **0 matches** across the 786 places in the 21 shipped rioni. EUR is
2 km beyond the Aurelian Walls; no rione reaches it.

---

## 1. Boundary work — how I know a place is in EUR

### 1.1 The OSM boundary relation exists, but it is not named the way you would guess

`rel(5460399)` — `boundary=place`, `place=suburb`, **`ref="Q. XXXII"`**,
`official_name="Europa"`, `name="E.U.R."`, `short_name="E.U.R."`, `old_name="E.42"`,
`wikidata=Q3734793`, `wikipedia=it:Europa (Roma)`, `note:it="Europa è il nome ufficiale del
quartiere"`. Bounds: **lat 41.8182931 – 41.8430397, lon 12.4495829 – 12.4812142**.

**Trap, and it cost me two queries.** Every other Roman quartiere I saw carries
`official_name="Quartiere NN Name"` — Q.X is `"Quartiere X Ostiense"`, Q.XX is `"Quartiere XX
Ardeatino"`, Q.XXXI is `"Quartiere XXXI Giuliano-Dalmata"`. **EUR carries `official_name="Europa"`
alone**, and its `name` is the abbreviation. A roster or checker that joins on
`official_name~"^Quartiere"` **will silently drop EUR** — my first query, over a bbox that certainly
contains it, returned Appio-Latino, Ostiense, Portuense, Gianicolense, Ardeatino and
Giuliano-Dalmata and *not* EUR. This is the same class of bug as the `ref` normalisation trap in
`docs/rome/scope-sources.md` §2. Flagging it because a later wave will hit it.

(The earlier note in `scope-sources.md` that Q.XXXII appeared absent from OSM was a bbox artefact
*and* a naming artefact. The relation is there. It is complete and it has geometry.)

### 1.2 Method actually used

Two independent mechanisms, and I ran both:

**(a) Polygon containment via Overpass `area(3605460399)`.** I ran two tag-filtered queries for
named features *inside the polygon* — museums, historic, places of worship, parks, stadia, hotels,
artwork, obelisks, archives, cinemas, restaurants, cafés. 201 elements in the first, 69 in the
second. Anything appearing in those results is inside the EUR polygon by OSM geometry, not by
reasoning. Marked **[in-poly]** below.

**(b) Nominatim reverse hierarchy.** For EUR addresses Nominatim returns
`"suburb": "E.U.R."` as a first-class component, exactly as it returns the rione for centro storico
addresses. Example, verbatim:
`"Palazzo dei Congressi, 10, Piazza John Kennedy, E.U.R., Municipio Roma IX, Roma, Lazio, 00144, Italia"`.
Marked **[nom: E.U.R.]** below. I tested 18 points; 16 returned `E.U.R.`, and the two that did not
are the two rejects in §6.

Where a candidate carries both marks, two independent sources agree. Where it carries one, I say
which.

### 1.3 The legal boundary, in the delibera's own terms

it.wikipedia's `Europa (Roma)` reproduces the confini from the 1961/1965 delibere, footnote by
footnote. Paraphrasing the four sides, because they are the thing that decides every straddler:

- **North** — Q. X Ostiense, along the Magliana viaduct from the Tiber to viale di Val Fiorita, then
  along Val Fiorita to via delle Tre Fontane, then along that to via Laurentina.
- **East** — Q. XX Ardeatino along via Laurentina (via delle Tre Fontane → via di Vigna Murata),
  then Q. XXXI Giuliano-Dalmata along via Laurentina (Vigna Murata → viale dell'Umanesimo).
- **South** — Z. XXIV Fonte Ostiense along viale dell'Umanesimo, and Z. XXVII Torrino along the whole
  of viale dell'Oceano Pacifico to the Tiber.
- **West** — S. VII Portuense, separated by the river Tiber up to the Magliana viaduct.

Source: `https://it.wikipedia.org/w/api.php?action=parse&page=Europa%20(Roma)&prop=wikitext`
(fetched 2026-09-03, HTTP 200, raw wikitext).

**Consequence a verifier should hold onto:** *via Laurentina is the eastern border and the Tre
Fontane complex sits astride it.* See §6.

### 1.4 The name, and the date it changed

Q. XXXII was created as **"Quartiere XXXII – E.U.R."** by delibera n. 2453 of 13 September 1961 of
the Commissario Straordinario, and renamed **"Quartiere XXXII – Europa"** by Giunta Municipale
delibera **n. 2509 of 5 May 1965**, on the favourable opinion of the Commissione Consultiva di
Toponomastica of 8 April 1965. Both delibere are quoted verbatim in the it.wikipedia article and the
second is quoted again in `docs/rome/scope-quartieri.md`. The acronym stands for *Esposizione
Universale di Roma*; the exposition was to have opened in 1942 and never did.

This is a clean, publishable, **non-superlative** fact set: two dated administrative acts and a
number in an official series. It is the kind of thing the corpus rules explicitly welcome.

### 1.5 Municipio — evidence, and my recommendation NOT to state it

The brief forbids stating a Municipio for a quartiere unless a source states it for *that*
quartiere. What I actually have:

- it.wikipedia's `{{Quartiere}}` infobox: `circoscrizione = [[Municipio Roma IX]]`.
- Nominatim returned `Municipio Roma IX` in the address hierarchy for **all 16** EUR points I
  tested (Palazzo dei Congressi, La Nuvola, Palazzo della Civiltà, ACS, Palazzo Uffici, Salone delle
  Fontane, basilica, Terzo Millennio, Grattacielo Italia, Torri Ligini, Il Fungo, Luneur, Palombini,
  Palazzo ENI, Istituto Massimo, Stadio Tre Fontane, Ospedale Sant'Eugenio).
- **No Roma Capitale primary source was fetched saying so.** comune.roma.it and
  dati.comune.roma.it were unreachable in wave 1 and I did not retry them.

Sixteen concordant geocodes and a Wikipedia infobox are *evidence*, not a Roma Capitale statement.
**My recommendation: the page should not name a Municipio.** Nothing a traveller needs turns on it,
and the ruling exists precisely because quartieri straddle. If the arbitrator wants it, the fact to
chase is Roma Capitale's own Municipio IX territorial delibera, which I could not reach.

---

## 2. THE HARD CONSTRAINTS, restated with what I actually found

### 2.1 Palazzo della Civiltà Italiana — WRITE, NEVER PHOTOGRAPH

Confirmed in the roster: `draw` for slug `eur` says *"NOTE: the Palazzo is a photo REJECT until 2043
— co-architect Giovanni Guerrini died 1972 and Italy has no freedom of panorama."* It stays a place
and it stays writable. It is the single most recognisable building in the quartiere and the page
would be absurd without it. **`"photos": []` everywhere in this wave anyway**, but the photo wave
must inherit this as a hard reject, not a caution.

### 2.2 Designation claims found in sources — DO NOT COPY THEM

Two of my best sources volunteer exactly the claim the evidence ruling bans. Both must be dropped:

1. **EUR S.p.A. on the Giardino delle Cascate**: *"il giardino è vincolato dalla Soprintendenza
   Archeologica Belle Arti e Paesaggio per il Comune di Roma ai sensi del D.Lgv.42/2004"*
   (`https://www.eurspa.it/parchi-giardini/parco-centrale-del-lago/`). **BANNED** — "vincolato" is
   on the banned list, English or Italian, attributed or not.
2. **MIMIT on the Museo storico della comunicazione**: *"il suo patrimonio è stato dichiarato dal
   MIBAC 'di interesse culturale e sottoposto a tutela'"*
   (`https://portalecultura.mise.gov.it/museo-storico-della-comunicazione/`). **BANNED** —
   "dichiarazione di interesse culturale" is named explicitly in the ruling.

Everything else on both pages is fine. The corpus can say the garden opened on 29 June 1961 and that
its lower section opened to the public on 5 May 2017; it cannot say it is protected.

### 2.3 Superlatives sitting in otherwise good sources — DO NOT COPY THEM

I hit five. Listing them so the verifier can spot them if a writer lifts a sentence wholesale:

| Source | Banned phrase | What the page may say instead |
|---|---|---|
| planetarioroma.it | *"uno dei più grandi planetari d'Italia"* | dome 14 m, 98 seats |
| planetarioroma.it | *"il più antico planetario del mondo al di fuori della Germania"* | the Rome planetarium dates from 1928; this installation reopened 22 April 2022 |
| acs.cultura.gov.it | *"Unico esempio di mostra integrata nei depositi di un archivio pubblico"* | the exhibition is laid out inside the archive's stacks; opened March 2023 |
| it.wikipedia, basilica SS Pietro e Paolo | *"la quarta di Roma per dimensioni… la terza per altezza"* | hemispherical dome, 32 m diameter |
| eurspa.it, Giardino delle Cascate | *"probabilmente l'area verde più pregiata"*, *"un unicum"* | ~42,000 m²; opened 29 June 1961 |

A dome diameter, a seat count, an area in m² and a date all publish. The rankings do not, and Rome
has no reachable per-property register to check a ranking against.

### 2.4 Vatican ruling — not engaged here

Nothing in EUR is Vatican City and nothing in EUR is on the Lateran Treaty Art. 15 list. The
extraterritorial hard case is Ostiense's (San Paolo fuori le Mura), not EUR's. The Tre Fontane
abbey — the Trappist house whose land was expropriated to build E42 — is **outside EUR** (§6) and in
any case is not an extraterritorial property.

### 2.5 No research method in reader-facing text

Several facts below exist only because a fetch failed (Luneur's hours, the Piscina delle Rose's
hours). The page must say *"No source states its opening hours, so none are given here"* or simply
omit them. It must not say a site could not be reached, was 403, or is a JavaScript app. That
argument lives in this file and dies here.

---

## 3. CANDIDATES

Kind values are from the thirteen the schema allows (`kind_note` in the roster): museum, theater,
restaurant, cafe, brewery, hotel, bnb, park, historic-site, amusement-park, shop, stadium,
attraction. **There is no church, monument, square or bridge kind** — churches are `historic-site`.

### A. The E42 core — the four palazzi of piazza Imperiale and the monuments around them

---

**A1. Palazzo della Civiltà Italiana** ("Colosseo Quadrato", also *Palazzo della Civiltà del Lavoro*)
· kind `historic-site` · **[in-poly]** (`relation/1559654`) **[nom: E.U.R.]**

- Address: **Quadrato della Concordia** (Nominatim; Turismo Roma gives the same). 41.83671, 12.46512.
- Architects **Giovanni Guerrini, Ernesto Bruno Lapadula, Mario Romano**. Conceived from 1936,
  designed 1937, **construction began December 1938**; work stopped in 1943 and was finished after
  the war. — eurspa.it; turismoroma.it.
- Form, from the owner's own page: a parallelepiped **51 m per side, 68 m high**, eight floors, six
  of them corresponding to the six orders of arches; set on a high stylobate at the end of the first
  decumanus at the highest ground level (**43 m a.s.l.**), with two opposed monumental staircases.
  Reinforced concrete (it was designed for load-bearing masonry; concrete was chosen for cost and
  time), clad in travertine. — `https://www.eurspa.it/edifici-storici/palazzo-della-civilta-italiana/`
- The frontone inscription, quotable verbatim: *«Un popolo di poeti di artisti di eroi di santi di
  pensatori di scienziati di navigatori di trasmigratori»*. — same page.
- **28 marble statues, each 3.40 m high**, under the entrance-level arcades, representing human
  activities; four sculptural groups of the Dioscuri flank the staircases, by **Publio Morbiducci**
  and **Alberto Felci**. — eurspa.it (`/opere/le-28-statue-in-marmo-di-carrara-di-palazzo-civilta-italiana/`,
  `/opere/i-dioscuri-a-felci-p-morbiducci/`).
- **Since 2015 it houses the headquarters of Fendi (LVMH).** — eurspa.it. Access for visitors is not
  stated by the owner; the ground-floor space has hosted exhibitions. Status should be `open` with
  the prose saying nothing is known about public access, per the status rule.
- **PHOTO: HARD REJECT until 2043.** See §2.1.
- Sources: `https://www.eurspa.it/edifici-storici/palazzo-della-civilta-italiana/` (200) ·
  `https://www.turismoroma.it/it/luoghi/palazzo-della-civilta-italiana` (200) ·
  `https://it.wikipedia.org/wiki/Palazzo_della_Civiltà_Italiana` (via action=parse, 200)

---

**A2. Museo delle Civiltà (MUCIV)** · kind `museum` · **[in-poly]** (two nodes)

The single strongest candidate in the quartiere: a state museum with an official site that publishes
address, hours and prices.

- **Two seats, both on the same square**: **Palazzo delle Scienze, Piazza Guglielmo Marconi 14**
  (prehistory, palaeontology, litho-mineralogy, African/American/Asian/Oceanian collections, early
  medieval, collections of colonial provenance, contemporary) and **Palazzo delle Arti e Tradizioni
  Popolari, Piazza Guglielmo Marconi 8** (Italian popular arts and traditions). — museum's own site.
- **Founded 2016**, an institute with special autonomy of the Ministero della Cultura. Extends over
  **c. 50,000 m²** of galleries and stores. — `https://www.museodellecivilta.it/chi-siamo/`
- **Hours: Tuesday–Sunday 8.00–19.00, last entry 18.30; closed Monday.** **Tickets: full €10,00;
  reduced €2,00; "Amico" €5,00; free for EU citizens under 18 and other entitled categories; free
  entry the first Sunday of every month.** The **Sala Grotta Guattari is temporarily closed for
  extraordinary maintenance**. — `https://www.museodellecivilta.it/visita/` (200, fetched 2026-09-03)
- Constituent collections, each with its own history: Museo Nazionale Preistorico Etnografico
  (founded by Luigi Pigorini **1875**, at the Collegio Romano, moved to the Palazzo delle Scienze in
  **1977**); Museo nazionale delle arti e tradizioni popolari (in the Palazzo delle Tradizioni
  Popolari from **1956**); Museo nazionale dell'Alto Medioevo; Museo nazionale d'arte orientale
  Giuseppe Tucci; ex Museo Coloniale; ISPRA palaeontology and litho-mineralogy collections.
- **Buildings.** Palazzo delle Scienze: **1938–1943**, architects **Luigi Brusa, Gino Cancellotti,
  Eugenio Montuori, Alfredo Scalpelli**, in Piacentini's team. Palazzo delle Arti e Tradizioni
  Popolari: designed **1938**, built to **1942**, architects **Massimo Castellazzi, Pietro Morresi,
  Annibale Vitellozzi**; mirror-image of the Palazzo delle Scienze, a colonnaded portico round a
  courtyard. — `https://www.museodellecivilta.it/il-museo-e-leur/`
- **Art the guide can point at, all named and dated by the museum itself**: in the Palazzo delle
  Scienze atrium, two murals by **Valerio Fraschetti** — *La scuola di Galileo* (complete) and *Le
  applicazioni tecniche della scienza* (left as preparatory ground when war stopped the work); above
  the monumental staircase, the polychrome window by **Giulio Rosso, 1941–42**; in the Salone delle
  Scienze, the marble intarsia floor by **Mario Tozzi, 1943**. In the Palazzo delle Arti e Tradizioni
  Popolari, the marble relief *Elementi caratteristici del folklore* by **Amerigo Tot** (1909–84)
  over the entrance to the Salone, and frescoes of Italian traditional life executed **1940–42**.
- **Two exterior mosaics, 1942**, facing each other across the square's flank: **Fortunato Depero**,
  *Le professioni e le arti*, on the Palazzo delle Scienze facing viale della Civiltà Romana, and
  **Enrico Prampolini**, *Le Corporazioni*, on the side facade of the Palazzo delle Tradizioni
  Popolari. — same page. (These are outdoor, permanent, and by artists who died 1960 and 1956 — a
  photo-wave lead, though Italy's lack of freedom of panorama still applies to the buildings.)
- Sources: `https://www.museodellecivilta.it/visita/` · `/chi-siamo/` · `/il-museo-e-leur/` (all 200)
  · `https://it.wikipedia.org/wiki/Palazzo_delle_Scienze` · `.../Palazzo_delle_Tradizioni_popolari`

Note for the arbitrator: the museum could be **one** record with the two palazzi named inside it, or
**three** (institution + two buildings). The museum's own site treats the two palazzi as *sedi* of
one museum. I lean to one record plus, at most, a separate record for the Palazzo delle Arti e
Tradizioni Popolari as a building; I am not deciding.

---

**A3. Palazzo dei Ricevimenti e dei Congressi** (Palazzo dei Congressi) · kind `attraction`
· **[in-poly]** (`way/23959054`) **[nom: E.U.R.]**

- Address: **Piazza John Kennedy 10**, 00144. 41.83397, 12.47477.
- **Adalberto Libera**, competition-winning design; **begun 1938, completed 1954**. Terragni,
  Cattaneo and Lingeri came second in the competition. It hosted the **fencing events of the 1960
  Olympic Games**. — it.wikipedia (action=parse, 200).
- From the owner: three principal bodies — a base **75 × 135 m in plan and 15 m high**, with the main
  colonnade facing Piazzale Kennedy and a secondary facade on Piazzale Arte formed by a glazed wall
  **10 m high and 65 m wide**; a **panoramic terrace of 2,500 m²** with roof gardens and an open-air
  theatre; the **Salone della Cultura**, a cube **45 m per side, 27 m high**, floor area 1,450 m²
  under a shallow cross vault; and the **Auditorium Capitalis, 792 seats**. Total area 30,000 m²,
  events to 5,000 people. Interior works by **Achille Funi** and **Gino Severini**.
  — `https://www.eurspa.it/polo-congressuale/palazzo-dei-congressi/` (200)
- Access: it is a working congress centre; the owner publishes an events calendar rather than
  visiting hours. Prose should say no general opening hours are published.

---

**A4. Palazzo degli Uffici (Palazzo Uffici)** · kind `historic-site` · **[in-poly]**
(`relation/2433845`) **[nom: E.U.R.]**

- Address: **Piazzale Konrad Adenauer** (Nominatim). 41.83694, 12.46852.
- Architect **Gaetano Minnucci**. **Works began at the end of 1937 and finished at the end of 1939** —
  the **first permanent building of E42 to be completed**, and the pilot for everything after it.
  Today the head office of EUR S.p.A. — `https://www.eurspa.it/edifici-storici/palazzo-uffici/` (200)
  ("first permanent work completed" is a **sequence**, not a superlative — publishable.)
- **Publio Morbiducci**'s travertine bas-relief *La storia di Roma attraverso le opere edilizie* over
  the principal entrance (the "Ingresso del Commissario"); **Giorgio Quaroni**'s *La fondazione di
  Roma*, mixed technique, painted **September 1939 – January 1940**, in the Sala Quaroni on the first
  floor. — same page + `/opere/` pages.
- **The air-raid shelter.** On the second basement level, by Minnucci: a reinforced-concrete volume
  isolated from the rest of the building by a **125 cm cavity**, about **475 m²**, with metal
  gas-proof doors and a **twin dynamo driven by two tandem bicycles** to run ventilation and
  lighting. This is the most vivid single fact in the quartiere and it comes from the owner's own
  page. Public access is not stated.
- Sources: `https://www.eurspa.it/edifici-storici/palazzo-uffici/` ·
  `https://it.wikipedia.org/wiki/Palazzo_degli_Uffici_(Roma)`

---

**A5. Salone delle Fontane** · kind `attraction` · **[in-poly]** (`relation/2433851`)
**[nom: E.U.R.]**

- Address: **Piazzale Konrad Adenauer**. 41.83740, 12.46880. Occupies a significant part of Palazzo
  Uffici; **built to house the ticket offices of the 1942 exposition**; now an events and conference
  space. Outside: a monumental pillared portico and a **large illuminated fountain divided into three
  basins**, lined with opaline-green Venetian mosaic, with water features over perimeter mosaics by
  **Gino Severini, Giulio Rosso and Giovanni Guerrini**, recently restored.
  — `https://www.eurspa.it/edifici-storici/palazzo-uffici/` (200)
- **Caution:** the mosaic is partly Guerrini's, the same co-architect whose 1972 death blocks the
  Palazzo della Civiltà photograph. For the photo wave this is a second Guerrini work and needs the
  same analysis. Prose is unaffected.

---

**A6. Palazzo ex Ristorante Ufficiale dell'Ente EUR** · kind `historic-site` · [wiki: Q.XXXII cat]

- Architect **Ettore Rossi**, designed **1939** alongside Palazzo Uffici, to receive foreign
  delegations at the 1942 exposition. Rectangular block, originally three floors, porticoed on all
  four sides with fluted gilt-calacatta marble facing. Abandoned after the war, **reopened for the
  1953 EA agricultural exposition**, then heavily altered in the 1960s (new floors and a curtain-wall
  destroyed the original travertine facades).
- **Two surviving decorative works** on the ground floor, inside what is today a commercial premises:
  a tempera mural by **Franco Gentilini** and a polychrome marble intarsia by **Eugenio Fegarotti**.
- **It housed Roma Capitale's urban-planning department until 2022 and still contains the caffè
  Palombini.** Under an agreement between EUR S.p.A. and **Bulgari Gioielli (LVMH)** it is to be
  regenerated as a high-end craft production centre. — `https://www.eurspa.it/edifici-storici/palazzo-del-ristorante-ufficiale/` (200)
- Ties directly to candidate F2 (Palombini). One record or two is the arbitrator's call.

---

**A7. Obelisco di Marconi** · kind `historic-site` · **[in-poly]** (`way/44104109`)

- **Piazza Guglielmo Marconi**, at the centre of the elliptical lawn on the axis of via Cristoforo
  Colombo. 41.83354, 12.47084.
- **Arturo Dazzi.** Commissioned **1939** by the Ministero della Cultura Popolare for what was then
  piazza Imperiale; work stopped in 1940 with two registers cut; resumed **1951**; **inaugurated
  12 December 1959**. Truncated-pyramid form, reinforced concrete faced with **92 slabs of Carrara
  marble** carrying high-reliefs in four rows. Height given as **45 m** in the infobox.
  — `https://it.wikipedia.org/wiki/Obelisco_di_Marconi` (action=parse, 200) ·
  `https://www.eurspa.it/opere/obelisco-a-guglielmo-marconi-a-dazzi/`

---

**A8. Piazza Guglielmo Marconi** · kind `attraction` · **[in-poly]** (`node/10937793530`)
**[nom: E.U.R.]**

- 41.83361, 12.47088. **Originally piazza Imperiale**, purpose-designed as one of the fulcra of the
  1942 exposition; the four palazzi around it were to hold four exhibitions — science, popular
  traditions, ancient art, modern art — with a cinema-theatre closing the fourth side that was never
  built. — `https://www.museodellecivilta.it/il-museo-e-leur/` + it.wikipedia.
- Usable as a locator: "on the north side of Piazza Guglielmo Marconi" is exactly the construction
  the corpus rules permit.

---

**A9. Palazzo dell'Archivio dello Stato / Archivio Centrale dello Stato** · kind `historic-site`
· **[in-poly]** (`way/149342843`) **[nom: E.U.R.]**

- Address: **Piazzale degli Archivi 27, 00144**. 41.82870, 12.47656. Tel +39 06 545481.
- Architects **Mario De Renzi** and **Figini e Pollini** (De Renzi and Pollini declared joint
  winners at the second competition, June 1938). Intended first as the Palazzo delle Forze Armate,
  then for the autarky/corporatism exhibition. **Foundations begun September 1939**; only foundations
  and frame existed before the war; completed in the 1950s under Virgilio Testa. Public rooms
  (entrance, reading room, library, conference room) redesigned in the 1990s by Giulio Savio.
  — `https://it.wikipedia.org/wiki/Palazzo_dell'Archivio_dello_Stato` (200)
- Getting there, from the institute itself: **Metro B to EUR FERMI**, or bus **714** to
  COLOMBO/MARCONI. — acs.cultura.gov.it.

---

**A10. Lo scrigno della memoria** (permanent exhibition inside the Archivio Centrale dello Stato)
· kind `museum` · same site as A9

A genuinely under-known visitable place, free, with published hours. Strong candidate.

- **Free admission, Wednesday and Thursday 10.00–12.00 and 15.30–17.00.** Guided visits by
  compulsory booking, groups of at most 30, every Thursday; school visits by booking every
  Wednesday; visits last 1 hour and may be preceded by a 30-minute introduction in the institute's
  teaching room. — `https://acs.cultura.gov.it/scrigno-della-memoria-museo/visita-accesso/` (200)
- **Opened March 2023**, laid out **inside the archive's document stores**, around one of the three
  originals of the **Constitution of the Italian Republic**; five thematic areas; **over 300
  documents and 50 objects and artworks** selected from **160 linear kilometres** of holdings.
  Conceived by Andrea De Pasquale; scientific committee coordinated by Guido Melis.
  — `https://acs.cultura.gov.it/scrigno-della-memoria-museo/percorso-espositivo/` (200)
- Reserved disabled parking inside the institute's car park. — visita-accesso page.
- **Do not copy** the site's "unico esempio" claim (§2.3).

---

### B. Museums and science

**B1. Museo della Civiltà Romana** · kind `museum` · Piazza Giovanni Agnelli 10, 00144

- **CLOSED.** Roma Capitale's own museum site: *"Chiuso temporaneamente per lavori di
  riqualificazione e messa in sicurezza."* — `http://www.museociviltaromana.it/it/informazioni_pratiche/orari_e_indirizzi`
  (200, fetched 2026-09-03). This is an affirmative, sourced `closed` and the prose must match.
- Background, for the record: closed **31 January 2014** after a 2013 ministry inspection; works on
  the annexed planetarium structure ran 2017–2022; the museum's own restoration entered the PNRR at
  **€20.7 m**, with design complete in January 2025 and an announced completion of **June 2026**.
  — it.wikipedia `Museo della civiltà romana` (200). **Treat the June 2026 date as an announcement,
  not a fact**; today is September 2026 and no source I fetched says it has reopened.
- Collections (currently unseeable): plaster casts, models and dioramas of Roman civilisation,
  including the complete cast series of **Trajan's Column** and **Italo Gismondi's 1:250 model of
  imperial Rome**.
- Building: architects **Pietro Aschieri, Domenico Bernardini, Cesare Pascoletti, Gino Peressutti**,
  competition winners for E42; two parallel projecting blocks and a travertine colonnade forming the
  backdrop to the square. — `https://www.planetarioroma.it/it/sede/l_edificio` (200)
- **Verifier's judgement call:** a closed museum with a firmly sourced closure and a dated reopening
  target is publishable as a closed place. It is also the building the planetarium sits inside, so it
  cannot simply be dropped.

**B2. Planetario di Roma / Museo dell'Astronomia** · kind `museum` · **[in-poly]** (two nodes)

- **Piazza Giovanni Agnelli 10, 00144.** *"Il Planetario si trova nello stesso edificio che ospita il
  Museo della Civiltà Romana."*
- **Hours: Tuesday–Sunday 9.30–21.30 (shows at 18.00, 19.00 and 21.30); 24 and 31 December
  10.00–14.00; last entry one hour before closing. Ticket office/bookshop Tue–Sun 9.30–18.00 (winter
  hours). Closed Mondays, 1 January, 1 May, 25 December.** Call centre 060608 daily 9.00–19.00;
  info@planetarioroma.it. — `https://www.planetarioroma.it/it/informazioni_pratiche/orari_e_indirizzi` (200)
- **Back in operation since 22 April 2022** after works on its technology. **Dome 14 m, 98 seats.**
  — `https://www.planetarioroma.it/it/il_museo/planetario` (200). **Do not copy** the two
  superlatives on that page (§2.3).
- Part of the Sistema Musei di Roma Capitale (MIC card applies).

**B3. Museo storico della comunicazione** (ex Museo delle Poste e Telecomunicazioni) · kind `museum`
· **[in-poly]** (`node/2683531122`)

- **CLOSED.** The ministry's own page: *"il Museo Storico della Comunicazione è temporaneamente
  chiuso"*. — `https://portalecultura.mise.gov.it/sede-e-contatti/` (200, fetched 2026-09-03)
- **Visitor entrance in Viale Europa s.n.c., corner of Via Cristoforo Colombo** (Metro B *EUR
  Palasport*); inside the EUR seat of the Ministero delle Imprese e del Made in Italy; office contact
  address Viale America 201. Tel +39 06 5444 3000.
- **c. 4,000 m²** of rooms covering Italian postal and telecommunications history — post boxes (the
  earliest shown, from Borgo Cerreto, dated **1633**), a reconstructed late-19th-century post office,
  pre-unification states, military post, and works connected with **Guglielmo Marconi** and **Antonio
  Meucci**. — it.wikipedia + portalecultura.
- **Do not copy** the "dichiarato di interesse culturale" sentence (§2.2).

---

### C. Parks, water and gardens

EUR is, per its own wiki article, the quartiere laid out with the largest provision of green in
Piacentini's plan; the parks were designed from 1937 and executed after the war under **Raffaele De
Vico** as supervisor. All five EUR S.p.A. parks below have an owner-published page.

**C1. Parco Centrale del Lago** (Parco Lago dell'EUR, "il Laghetto") · kind `park` · **[in-poly]**
(`relation/2426556`; the water body is `relation/2426553` "Laghetto dell'EUR")

- **Total area 165,130 m²** (EUR S.p.A.). it.wikipedia gives ~160,000 m², split roughly evenly
  between planting and water — **the two figures disagree; use the owner's**.
- The basin is about **1 km long**, orthogonal to the axis of the former via Imperiale (today via
  Cristoforo Colombo), **60 to 130 m wide**. Closed at its short ends by the UniCredit building and
  the ENI tower; overlooked from the hill carrying the Palazzo dello Sport, with the cascades at the
  hill's foot forming its scenic backdrop. Park inaugurated **1962** (infobox).
- Entrances given by it.wikipedia: via C. Colombo, piazzale Enrico Mattei, viale America, viale
  Oceania, viale Umberto Tupini.
- Planting: oaks, poplars, magnolias, olives and maples, with rarer laurustinus, ligustrum,
  pittosporum and conifers. — eurspa.it.
- Sources: `https://www.eurspa.it/parchi-giardini/parco-centrale-del-lago/` (200) ·
  `https://it.wikipedia.org/wiki/Parco_Centrale_del_Lago` (200)

**C2. Giardino delle Cascate** · kind `park` · **[in-poly]** (`relation/2426552`)

- Address per Turismo Roma: **Passeggiata del Giappone**. 41.82701, 12.46755.
- **c. 42,000 m²**, by **Raffaele De Vico**, **inaugurated 29 June 1961**. A composition in two
  symmetrical sections about the central cascade axis: an upper part with two hairpin promenades
  leading to two belvederes, and a lower part with two cascades and lateral channels flanked by two
  cypress rotundas. The pumping plant was modernised in **2010**; **on 5 May 2017 the lowest portion
  (c. 5,000 m²), the part directly on the lake, opened to the public for the first time.**
  — `https://www.eurspa.it/parchi-giardini/parco-centrale-del-lago/` (200)
- Turismo Roma adds: the cascades oxygenate the lake and form part of a water system that also
  includes the lifting station on viale Oceania and the main reservoir known as *il Fungo*; and a
  glass-floored footbridge crosses the central cascade, linking the banks.
  — `https://www.turismoroma.it/it/luoghi/giardino-delle-cascate` (200)
- **Do not copy** the "vincolato" sentence (§2.2) or "unicum"/"più pregiata" (§2.3).

**C3. Passeggiata del Giappone** · kind `park` (or a feature of C1)

- Designed by **Raffaele De Vico** as one piece with the circuit of the lake gardens, and completed
  with a mass planting of **flowering prunus (cherries) donated by the city of Tokyo**.
  — `https://www.eurspa.it/parchi-giardini/parco-centrale-del-lago/` (200)
- Probably a paragraph inside C1 rather than its own record. Flagging, not deciding.

**C4. Parco del Ninfeo** · kind `park` · **[in-poly]** (`relation/2433846`)

- **82,000 m².** Named from the **Fontana del Ninfeo, built 1940** (the fountain is separately mapped,
  `node/1931544630`, 41.83710, 12.46783). Separated from the Parco del Turismo by via Romolo Murri,
  itself lined with a double row of plane trees and a clipped ligustrum hedge. Left derelict by the
  war; **De Vico worked on its completion and landscape recovery from 1952, finishing in 1961**.
  — `https://www.eurspa.it/parchi-giardini/parco-del-ninfeo/` (200)

**C5. Parco del Turismo** · kind `park` · **[in-poly]** (`relation/2433847`)

- On the west side of the quartiere, bounded by viale Romolo Murri, via delle Tre Fontane to the
  north and viale di Val Fiorita towards the Magliana metro station. Contains the **stele-fountain
  *La vita dei campi* by Ercole Drei** (it.wikipedia dates the stele **1940**) and bas-reliefs by
  Bellini, both originally destined for the agricultural exhibition, plus a recently restored
  building that served as an **open-air library in the 1960s**.
  — `https://www.eurspa.it/parchi-giardini/parco-del-turismo/` (200)

**C6. Parco degli Eucalipti** · kind `park` · **[in-poly]** (`way/31876038`)

- **91,000 m²**, along via Laurentina. Originally the **eucalyptus wood planted in the nineteenth
  century by the Trappist monks of the Abbazia delle Tre Fontane** to improve the air and to make
  medicinal elixirs. Design began **1938** with the site earmarked for a Museo Coloniale; works
  broke off around **1943**. The present layout — terraces, belvederes, paths and raised walkways —
  is by the architect **Varisco**, head of the Ente EUR parks office; De Vico's post-war proposal was
  never carried out. **About 860 trees**, predominantly eucalyptus, and a dog-friendly area.
  — `https://www.eurspa.it/parchi-giardini/parco-degli-eucalipti/` (200)

**C7. Giardino degli Ulivi (east and west)** · kind `park` · **[in-poly]** (`way/189871639` is a
different, smaller garden; the Ulivi pair are in the eurspa inventory)

- Two spaces, already provided for in the 1940 exposition plan and designed by **Raffaele de Vico**;
  amphitheatre form, "rustic classicism", travertine blocks set in an exedra, olives and tall trees.
  **The eastern garden is the only one of the two that is fenced**, and is used for cultural events.
  — `https://www.eurspa.it/parchi-giardini/giardino-degli-ulivi/` (200)
  ("the only one of the two that is fenced" is a **count over an explicit pair**, not a ranking — I
  read it as publishable, but flagging it for the verifier since it uses the word "only".)

**C8. Giardino Raffaele De Vico** · kind `park` · **[in-poly]** (`relation/2426560`, 41.82878,
12.46829) — mapped, adjacent to the lake, named for the landscape architect of the whole system. No
source beyond OSM was found. **Weak; include only if the verifier wants it.**

**C9. Parco Carlo Ciocci** · kind `park` · **[in-poly]** (`way/44097156`, via Cristoforo Colombo).
OSM only. **Weak.**

---

### D. Churches and shrines

**D1. Basilica dei Santi Pietro e Paolo** · kind `historic-site` · **[in-poly]** (`way/23432370`)
**[nom: E.U.R.]**

- **Piazzale dei Santi Pietro e Paolo 8, 00144.** Tel 06 5926166.
- **Open 7.00–12.00 and 16.00–19.00.** Parish office Monday–Saturday 10.00–12.00.
  — `https://www.santipietroepaoloroma.it/home/contatti/` (200, the parish's own site)
- Architects **Arnaldo Foschini, Alfredo Energici, Vittorio Grassi, Nello Ena, Tullio Rossi,
  Costantino Vetriani**. Design approved **September 1938**; **first stone spring 1939**; work slowed
  in the war and stopped after a 1943 bombardment; **resumed 1953**; **opened for worship July 1955**;
  **parish December 1958**; **cardinalatial title 5 February 1965**; **dedicated June 1966**;
  **minor basilica 1967**. Restored 2007. — it.wikipedia (200).
- Greek-cross plan; central cube and hemispherical **dome 32 m in diameter**; colossal statues of
  Peter and Paul flanking the portico above the monumental stair down to viale Europa; marble
  high-relief *Conversione di Saulo* by **Venanzo Crocetti, 1941**, on the flank; organ built **1960**
  by Libero Rino Pinchi, enlarged 1990 by Carlo Soracco. **Do not copy** the dome-ranking sentence
  (§2.3).
- The parish's own history page adds a fact that anchors the whole quartiere: to build E42, **about
  400 hectares of land belonging to the Trappist monks of the Abbazia delle Tre Fontane were
  expropriated**, and the Ente autonomo E42 was created by **law n. 2174 of 26 December 1936** with
  senator **Vittorio Cini** as Commissario Generale.
  — `https://www.santipietroepaoloroma.it/home/parrocchia/storia-della-basilica/` (200)
- Entrusted to the Frati Minori Conventuali.

**D2. Santuario della Vergine della Rivelazione – Madre della Chiesa** (until April 2025: *Santa
Maria del Terzo Millennio alle Tre Fontane*) · kind `historic-site` · **[in-poly]**
(`way/204999763`) **[nom: E.U.R.]** — **but see the straddler note**

- **Via Laurentina**, 41.83610, 12.48014, postcode 00142.
- The site of the grotto where **Bruno Cornacchiola** said the Madonna appeared to him and his three
  children on **12 April 1947**. **The Catholic Church has not recognised the apparitions.** In
  **1956 Pius XII allowed a chapel of devotion to be built** at the site, its custody entrusted to
  the Frati Minori Conventuali. In **1997 John Paul II changed the sanctuary's name to *Santa Maria
  del Terzo Millennio alle Tre Fontane***. **On 12 April 2025 a decree of Pope Francis raised it to a
  diocesan sanctuary and changed the name to *Vergine della Rivelazione – Madre della Chiesa***;
  rector mons. Renato Tarantelli Baccari. — `https://it.wikipedia.org/wiki/Vergine_della_Rivelazione`
  (action=parse, 200)
- **Write the apparition as a claim, never as an event.** The article is explicit that the Church has
  not recognised it, and that sentence is the one that makes the record honest.
- **Straddler flag:** it stands on via Laurentina, which §1.3 makes the EUR/Ardeatino border, and it
  is part of the wider Tre Fontane devotional complex whose abbey is *outside* EUR (§6.1). OSM
  polygon and Nominatim both put the church itself inside EUR. **Do not resolve this here.**
- No source I fetched gives its opening hours. `santuariotrefontane.it` does not resolve (DNS).

**D3. Chiesa di San Gregorio Barbarigo** · kind `historic-site` · **[in-poly]** (`way/296496866`)

- **Via delle Montagne Rocciose 14**, in the north-eastern area of the quartiere. 41.82785, 12.47841.
- Built **1970–1972** by **Giuseppe Vaccaro** for the parish erected **28 January 1964** by decree
  *Qua celeritate* of cardinal vicar Clemente Micara. Cardinalatial title since **1973**.
- Entirely prefabricated concrete panels, raised on a terrace on pilotis, with a tall iron bell tower
  and forecourt cross; circular plan; light through a red-coloured central skylight and clerestory
  windows; the altarpiece behind the presbytery is a **15 × 5 m** work by **Piero Casentini**,
  2007–08. The old baptistery has been the Blessed Sacrament chapel since **2005**. Organ by
  **Fratelli Ruffatti, 1998**, 14 stops, fully mechanical. Crypt below.
  — `https://it.wikipedia.org/wiki/Chiesa_di_San_Gregorio_Barbarigo` (200). Parish site given as
  sangregoriobarbarigo.it (I did not fetch it).
- Note: OSM's `website` tag on this way points at `accademiadellestelle.org`, which looks like a
  tagging error. Do not use it.

**D4. Chiesa di Santa Maria Immacolata** · kind `historic-site` · **[in-poly]** (`way/231466885`)

- **Via Laurentina**, 41.83326, 12.48041, postcode 00142. Reverse geocode returns
  `"Chiesa di Santa Maria Immacolata, Via Laurentina, E.U.R., Municipio Roma IX"`.
- **I found no other source for it.** No it.wikipedia article surfaced under that name in the
  Q.XXXII church category (which contains only D1 and D3). **Weak candidate; needs a second source
  or it should be dropped.** Same border caveat as D2.

---

### E. Sport, leisure and the post-war landmarks

**E1. Palazzo dello Sport (PalaEur)** · kind `stadium` · **[in-poly]** (`way/23528669`)

- **Piazzale dello Sport 1.** 41.82530, 12.46658.
- **Marcello Piacentini** with structural consultancy from **Pier Luigi Nervi**; designed **1956**,
  built **1958–1960** for the **XVII Olympic Games**, where it held the **basketball and boxing**
  events. Built by Ingg. Nervi & Bartoli S.p.A. Circular plan, shallow dome, exposed reinforced
  concrete. Owned by EUR S.p.A. Modernised **1999–2003**; carried the commercial name
  *PalaLottomatica* until 2018. Home of the Roma basketball club from the 1980s to 2020.
  **Parterre: a circle 46 m in diameter.** EUR S.p.A. began further refurbishment works in **2025**.
  — `https://www.eurspa.it/palazzetto-sport/` (200) · it.wikipedia (200)
- It trades: the owner's page listed a dated concert calendar when I fetched it (Giorgia 24
  September, Bob Dylan 5 November, and others). Do not put a specific concert in the corpus; do note
  that it is an active arena.
- `palazzodellosportroma.it` returned a maintenance page (**"Sito OFFLINE / SITO IN MANUTENZIONE"**)
  on 2026-09-03, so the eurspa page is the operator source.

**E2. Torre piezometrica dell'Eur — "il Fungo"** · kind `historic-site` · **[in-poly]**
(`way/566837609`) **[nom: E.U.R.]**

- **Piazza Pakistan.** 41.82441, 12.46295. **53 m** high.
- Built **1957–58** ahead of the 1960 Games, by architects **Aldo Capozza and Sergio Martinelli**
  with engineers **Roberto Colosimo and Sergio Varisco**. A piezometric water tower supplying the
  quartiere's non-potable water — it feeds the cascade into the artificial lake, irrigates the lawns
  around the basin and supplies fire mains.
- **In 1961 the tenor Mario Del Monaco wanted a restaurant on top, on the fourteenth floor**;
  designed by **Lorenzo Monardo** and **opened 1964**, with a bar at ground level. A political
  bombing in **September 1978** damaged the ground-floor bar and the restaurant stayed shut **until
  1991**. — `https://it.wikipedia.org/wiki/Torre_piezometrica_dell'Eur` (200)
- The restaurant is candidate F1.

**E3. Piscina delle Rose** · kind `attraction` · **[in-poly]** (`relation/2426559`)

- Near the lake. **Designed 1958, completed 1960** for the Olympic Games, as a training pool and
  venue for **water-polo preliminary matches**; **50 × 25 m** basin. Architect **Sergio Buonamico**
  with engineers **Guido Gigli** and **Giorgio Biuso**. Owned by EUR S.p.A. and run by a private
  consortium. **Refurbished 2007**, when an indoor pool and a restaurant were added; it also hosts a
  gym and a rowing/canoe club whose activity takes place on the neighbouring lake.
  — `https://it.wikipedia.org/wiki/Piscina_delle_Rose` (200)
- **Its official site is not usable as a source here:** `https://www.piscinadellerose.it/` and
  `https://www.piscinadellerose.com/` both returned **HTTP 403** to two different user agents. So
  **no hours, no prices**. The prose must simply not offer any.

**E4. Luneur Park** · kind `amusement-park` · **[in-poly]** (`relation/3545457`) **[nom: E.U.R.]**

- **Via delle Tre Fontane 100, 00144.** 41.83651, 12.47627.
- Built **1953** as a temporary attraction inside the agricultural exposition, kept open by demand;
  **open year-round from 1960**, the Olympic year; the name *LunEur* was adopted five years later by
  a referendum among the operators. At its height it had **130 family-run attractions** and one
  closing day a week. After nearly a decade of restoration it **reopened on 27 October 2016** as
  *Luneur Park*, aimed at children up to 12 and their families. — it.wikipedia `Europa (Roma)` and
  `Luneur Park` (200), citing abitarearoma.net for the reopening date.
- **Hours/prices: not obtainable.** `luneurpark.it` is a client-rendered JavaScript application —
  every path I fetched returned the same 2,902-byte shell with an empty `<div id="root">`. Turismo
  Roma's own page for it declines to publish hours too and points at the operator's calendar. So the
  corpus should give the address and say no opening hours are published.
  — `https://www.turismoroma.it/it/luoghi/luneur-park` (200; also confirms area tag "EUR" and the
  Via delle Tre Fontane location).

**E5. Stadio / Complesso sportivo Tre Fontane** · kind `stadium` · **[nom: E.U.R.]**

- **Via delle Tre Fontane.** 41.84124, 12.47009 (`way/1136036727`). Nominatim returns
  `"Tre Fontane, Via delle Tre Fontane, E.U.R., Municipio Roma IX"`.
- Listed by it.wikipedia among the **Olympic structures** of EUR (`Template:Strutture dell'EUR`,
  group "Strutture olimpiche"). I did **not** fetch the article body, so I have no dates, architect
  or current tenant. **Under-researched: flag for the verifier.** It sits close to the northern
  border (via delle Tre Fontane is part of the Ostiense boundary line per §1.3) — a possible
  straddler that I have not resolved.

**E6. Obelisco Novecento** (Arnaldo Pomodoro) · kind `historic-site` · **[in-poly]**
(`way/566825578`, mapped as `artwork`, name "Novecento")

- **Piazzale Pier Luigi Nervi**, at the centre of a circular basin at the fork of via Cristoforo
  Colombo, near the Palazzo dello Sport. 41.82292, 12.46533.
- Bronze, by **Arnaldo Pomodoro**, executed **2000–2002**, commissioned by the Comune di Roma for the
  **Jubilee of 2000** and **inaugurated 23 October 2004**. **21 m long, 7 m wide.** Inspired by
  Egyptian obelisks and depictions of the Tower of Babel.
  — `https://it.wikipedia.org/wiki/Novecento_(scultura)` (200)
- **Photo-wave caution:** Pomodoro died in 2025; the sculpture is firmly in copyright and Italy has
  no freedom of panorama. Prose is fine.

**E7. EurPark (Energy & Adventure)** · kind `amusement-park` · **[in-poly]** (`node/5044675102`)

- **Piazza Pakistan** (OSM). Outdoor adventure-sport park; its own site
  (`https://www.eurpark.it/`, 200) states *"APERTI TUTTI I GIORNI"* and gave a summer closure notice
  (12–20 August) when I fetched it. No fuller hours are published in server-rendered HTML.
- **Marginal.** Include only if the verifier wants a family/outdoor entry beyond Luneur.

**E8. Acquaria / Splash Zone** · **[in-poly]** (`way/670043108`, `way/846563405`) — water-park
features mapped inside the Luneur perimeter. Almost certainly parts of E4, not places. **Reject
unless a source separates them.**

---

### F. Eating, drinking, sleeping — the thin section

**F1. Ristorante Il Fungo** (rooftop) **and Il Fungo Bistrò / Piano Zero** · kind `restaurant`
· **[in-poly]** (`node/560418226`, `node/4107554191`)

- **Piazza Pakistan**, at the top of and at the foot of the water tower (E2). Tel 06 5921980.
- **Hours, from the operator's own site (2026-09-03):** rooftop — closed Sunday and Monday; Tuesday
  to Saturday lunch closed, aperitivo 18.00–20.00, dinner 20.00–23.00. Bistrò — every day Monday to
  Thursday 8.00–21.00, Friday and Saturday 8.00–24.00, closed Sunday (except on Palasport event
  days). Bar — every day from 8.00. A summer closure 11–30 August was posted.
  — `https://www.ristoranteilfungo.it/` and `/contatti/` (200 with a browser user agent; **403 to a
  plain-python agent** — noted only here, never in the corpus).
- The site describes itself as *"NUOVA GESTIONE"*. **Do not publish a founding year**: the 1964
  opening date comes from Wikipedia, not the operator, and an operator's own founding year would be a
  trading-duration claim in any case. The *building's* 1964 restaurant history belongs in E2.

**F2. Palombini** · kind `cafe` · **[in-poly]** (`node/2517197511`) **[nom: E.U.R.]**

- **Piazzale Konrad Adenauer 12, 00144.** 41.83644, 12.46762.
- The one hard, non-operator fact: **EUR S.p.A.'s own page on the Palazzo ex Ristorante Ufficiale
  states that the building "ospita ancora oggi il caffè Palombini"**
  — `https://www.eurspa.it/edifici-storici/palazzo-del-ristorante-ufficiale/` (200). That places a
  named café inside a named 1939 Ettore Rossi building, which is a real guide fact.
- **No hours; no founding year** (both would need the operator's site, which I did not fetch, and a
  founding year would not publish anyway).

**F3. Casina dei Tre Laghi** · kind `restaurant` · **[in-poly]** (`relation/2426551`)

- **Viale Oceania 90**, in the lake park. `casinadeitrelaghi.com` **does not resolve** (DNS failure),
  so OSM is the only source. **Weak — needs a live operator source or drop it.**

**F4. Hilton Rome EUR La Lama** · kind `hotel` · **[in-poly]** (`way/427205750`)

- **Viale Europa 287.** 41.83044, 12.47156.
- Sourced through the architecture rather than the chain: EUR S.p.A. describes *la lama* as **a tower
  55 m high, 15 m wide and 126 m long, housing the four-star hotel "Hilton Rome EUR La Lama",
  directly connected to the congress centre's spaces**.
  — `https://www.eurspa.it/polo-congressuale/roma-convention-center-la-nuvola/` (200)
- Other hotels mapped inside the polygon, all OSM-only and unresearched: **Villa Eur Parco dei Pini**
  (Piazzale Marcellino Champagnat 2, villaeur.com), **American Palace Eur**, **Ibis Styles** (Via
  Massimiliano Massimo 15), **Shangri La Corsetti** (Viale Algeria 141), **Residence Garden**.
  Listed for completeness; I did not research them and I would not ship them without work.

**F5. Restaurants mapped in-polygon that I did NOT research** — Casa Novecento (Piazza Guglielmo
Marconi 32), Tatà (Piazza Guglielmo Marconi 11/A), Mammina (Piazzale Luigi Sturzo 28), The Green
(Viale Europa 287), Vicolo 88 Garden, Ristorante Gattopardo, Daruma, Il Gianfornaio, plus ~20 cafés.
**I am not proposing these.** They are ordinary trade with no published history, and the corpus rules
would let me publish little more than an address. Recorded so a later wave knows the ground was
walked and found thin.

---

### G. Post-war architecture and the modern EUR

These are real, dated, attributed buildings that a Rome architecture guide would treat as sights.
Most are private offices with no public access; the guide's honest register is "you can look at it".

**G1. Nuovo Centro Congressi — "La Nuvola" / Roma Convention Center** · kind `attraction`
· **[in-poly]** (`way/43664624`, `way/263558453`) **[nom: E.U.R.]**

- **Viale Asia 40** (Nominatim; it.wikipedia's infobox says Viale Asia 6 — **the two disagree, flag
  it**). 41.83087, 12.47159. Between via Cristoforo Colombo, viale Europa, viale Shakespeare and
  viale Asia.
- **Massimiliano Fuksas**, winner of a 1998–2000 international competition judged by a jury chaired
  by **Norman Foster** (verdict 16 February 2000). Foundation stone **11 December 2007**; built by
  Condotte d'Acqua from 2008; **inaugurated 2016**. Owned by EUR S.p.A.
- Three elements, from the owner: **la teca**, 40 m high, 70 m wide, 175 m long — 18,000 t of steel,
  42,000 glass panels, 25,000 m² of travertine, 18,000 m² of parquet, 28 lifts; **la nuvola**, a
  curved steel skeleton clad in perforated siliconed glass fibre, containing an **auditorium of 1,748
  seats** faced with 2,306 Nero Alpi panels outside and 4,725 American black-cherry panels inside;
  and **la lama**, the 55 m hotel tower (F4). Over 26,000 m² of usable space; the lower level offers a
  plenary of up to 4,780 places. — `https://www.eurspa.it/polo-congressuale/roma-convention-center-la-nuvola/` (200)
- it.wikipedia adds **RIBA "Best Building Site" 2012** and gives the auditorium as 1,850 seats —
  **again disagreeing with the owner (1,748)**. Prefer the owner; flag the discrepancy.
- **Photo wave:** Fuksas is living. Architectural copyright applies and Italy has no freedom of
  panorama. Not in this wave, but do not let it slip into a later one unexamined.

**G2. Palazzo ENI ("Palazzo di vetro")** · kind `historic-site` · **[nom: E.U.R.]**

- **Piazzale Enrico Mattei 1.** 41.82720, 12.47167. **Built 1959–1962** (it.wikipedia `Europa (Roma)`,
  citing Gangemi, *La costruzione dell'architettura*, 2016, p. 190). Closes the south-east short end
  of the lake. Private headquarters.

**G3. Torri Ligini (Torri delle Finanze)** · kind `historic-site` · **[nom: E.U.R.]**

- 41.82977, 12.47053, mapped by Nominatim as *"ex Ministero delle Finanze"*.
- **Inaugurated 1961**; five buildings, three of them **17-storey towers of identical height, about
  67 m**, linked by a two-level podium. Architect **Cesare Ligini** with **Vittorio Cafiero**, Guido
  Marinucci and Renato Venturi. Offices of the Ministero delle Finanze for about thirty years,
  **disused since the late 1990s**; owned by **Fintecna** (CDP) since 2020; a **€140 m** CDP
  Immobiliare refurbishment is under way. — `https://it.wikipedia.org/wiki/Torri_Ligini` (200)
- **Status:** not visitable, actively a building site. Publishable as a looked-at landmark only, and
  the "Beirut" nickname in the article is journalistic — I would leave it out.

**G4. Edificio delle Poste, Telegrafi e Te.Ti (Ufficio postale Roma EUR)** · kind `historic-site`

- **Viale Beethoven.** Designed by the Milanese studio **BBPR** — Gian Luigi Banfi, Lodovico Barbiano
  di Belgiojoso, Enrico Peressutti, Ernesto Nathan Rogers. Construction ratified **27 July 1938** at
  L. 7,000,000; **works June 1939 to 24 August 1942**, inaugurated September 1942, interior work
  continuing to 10 June 1943.
- The fact that makes it worth a record: **Rogers was forced off the project because he was Jewish,
  under the fascist racial laws**, and with Banfi and Belgiojoso absent for war service **Peressutti
  alone saw the building through**. Occupied by German and then American troops 1943–47 as the postal
  and telephone centre for southern Rome; definitively reopened for the **1953** agricultural
  exposition. It is still a working post office (Roma EUR, frazionario 55977).
  — `https://it.wikipedia.org/wiki/Edificio_delle_Poste_Telegrafi_e_Telefoni` (200)

**G5. Palazzi dell'INA e dell'INPS** · kind `historic-site` · **[in-poly]** (`way/110401793`
"Palazzo dell'INPS", `way/110401776` INPS at Via Ciro il Grande 21)

- E42 buildings by **Giovanni Muzio, Mario Paniconi and Giulio Pediconi**
  (`Template:Strutture dell'EUR`, group "anteguerra"; it.wikipedia `Europa (Roma)`). I did **not**
  fetch the dedicated article — **under-researched**, listed so it is not lost.

**G6. Grattacielo Italia** · kind `historic-site` · **[nom: E.U.R.]** — **Piazza Guglielmo Marconi
25**, 41.83415, 12.46908. In the Q.XXXII wiki category; article not fetched. **Under-researched.**

**G7. Palazzo INAIL** ("torre Alitalia", "torre IBM") — **built 1965** as the flag carrier's
headquarters (search snippet from it.wikipedia). **Under-researched.**

**G8. Auditorium della Tecnica (Confindustria)** · kind `theater` · **[in-poly]**
(`relation/2441352`) — **Viale Umberto Tupini 65**, 41.83564, 12.46396, with a live conference-centre
site (`centrocongressi.confindustria.it`). A real auditorium in a real EUR building. **Not
researched beyond the OSM tags.**

**G9. Grattacielo delle Poste**, **Palazzo Sturzo**, **Centro idrico Eur**, **Palazzo delle Scienze**
(covered under A2), **Istituto Massimiliano Massimo** (Via Massimiliano Massimo 7, **[nom: E.U.R.]**,
a working Jesuit school — not a visitor place), **Ospedale Sant'Eugenio** (Piazzale dell'Umanesimo
10, **[nom: E.U.R.]**, the E42 *Istituto dell'Ortogenesi* converted to a hospital — a working
hospital, not a visitor place). **Listed for completeness; I propose none of them.**

**G10. Velodromo Olimpico — DOES NOT EXIST.** Built for 1960 by Ligini, Ortensi, Ricci, the Schurmann
brothers, Guidi and Giordano; **demolished in 2008**. It appears in the EUR wiki article and in the
navbox and could easily be mistaken for a standing building. **Hard reject.** (Its site is where the
Nuvola's surroundings and later development went.)

---

### H. Streets, squares and transport

**H1. Viale Europa** · kind `attraction` — the quartiere's commercial spine, running down from the
basilica's monumental stair; the Museo storico della comunicazione's entrance and the Hilton La Lama
are on it. it.wikipedia has a short article (`Viale Europa`, in the Q.XXXII category). Nominatim's
top hit for the bare name is a *different* Viale Europa in Formello — **any geocode must be
constrained**, which is itself a small trap.

**H2. Quadrato della Concordia** · kind `attraction` · **[nom: E.U.R.]** (`relation/2439337`,
41.83664, 12.46629) — the square the Palazzo della Civiltà stands in the middle of; Turismo Roma uses
it as that building's address. Better handled as a locator inside A1 than as its own record.

**H3. Via Cristoforo Colombo** — **STRADDLER, and a bad candidate.** The former via Imperiale, cut to
link the historic centre to the coast, runs the length of EUR and far beyond it in both directions.
It belongs to no single zone. **Flag; do not claim.**

**H4. Metro B stations EUR Magliana, EUR Fermi, EUR Palasport** — all in the Q.XXXII wiki category;
EUR Fermi geocodes to **Viale America, E.U.R.** They are useful as locators (ACS's own directions use
EUR Fermi; the communications museum's use EUR Palasport) and poor as places. **I propose none as
records.**

**H5. Ponte della Magliana** — in the EUR navbox as a pre-war Ente EUR structure, and the Magliana
viaduct *is* the northern boundary line with Ostiense (§1.3). **Straddler by construction.** Flag.

---

## 4. Count and shape

| Group | Proposed | Marginal / listed-not-proposed |
|---|---|---|
| A. E42 core | 10 | — |
| B. Museums | 3 | — |
| C. Parks | 7 | 2 (C8, C9) |
| D. Churches | 3 | 1 (D4) |
| E. Sport & leisure | 6 | 2 (E7, E8) |
| F. Food, hotels | 2 | 3 (F3, F4-others, F5) |
| G. Modern architecture | 8 | 6 (G5–G9 partly, G10 reject) |
| H. Streets & transport | 2 | 4 (straddlers/locators) |
| **Total listed** | **41 proposed** | **23 marginal or flagged** |

**64 candidates listed in all.** I expect a healthy fraction to be cut — the G-group especially,
where several entries carry only a navbox mention and a geocode. If most of section G survives
verification, that is a warning sign, not a success.

---

## 5. Straddlers — flagged, NOT resolved

1. **Santuario della Vergine della Rivelazione (D2)** — on via Laurentina, the EUR/Ardeatino border
   line. OSM polygon and Nominatim both say EUR. Part of a devotional complex whose abbey is outside
   EUR. **Ardeatino is not in this wave**, so the practical question is only whether EUR may take it.
2. **Chiesa di Santa Maria Immacolata (D4)** — same border, and only one source. May not survive at
   all.
3. **Stadio / Complesso sportivo Tre Fontane (E5)** — on via delle Tre Fontane, which §1.3 makes part
   of the **Ostiense** boundary line. Nominatim says E.U.R.; the point (41.8412) sits inside the
   polygon's northern bound (41.8430). **Ostiense IS in this wave.** This is the one straddler that
   can actually collide with a sibling zone. **Arbitrator, please rule.**
4. **Parco del Turismo (C5)** — bounded to the north by via delle Tre Fontane and running towards the
   Magliana metro station; same Ostiense border line. OSM puts the polygon inside EUR.
5. **Via Cristoforo Colombo (H3)** and **Ponte della Magliana (H5)** — linear features crossing the
   boundary by definition. My recommendation is that neither becomes a place in any file.
6. **Luneur Park / Parco degli Eucalipti** — both on ground expropriated from the Tre Fontane
   Trappists, both firmly inside the polygon. **Not straddlers**, but a verifier reading "Tre Fontane"
   in the address may think they are. Noted to save that confusion.

---

## 6. Rejects — things a search will surface that are NOT EUR's

**6.1 Abbazia delle Tre Fontane — NOT IN EUR.** Nominatim returns
`"Abbazia delle Tre Fontane, Viale del Martirio di San Paolo, Municipio Roma VIII, Roma, Lazio,
00147, Italia"` (`relation/2766784`, 41.83482, 12.48374). **Municipio VIII, not IX**; east of via
Laurentina; postcode 00147, not 00144. It is the abbey whose monks planted the eucalyptus wood and
whose 400 hectares were expropriated for E42 — so it will keep turning up in EUR sources — but it is
outside the quartiere. **Do not claim it.** Q.XX Ardeatino's ground, on this evidence.

**6.2 Torre Eurosky / Eurosky Business Park / Torre Europarco — NOT IN EUR.** Nominatim:
`"Torre Eurosky, 21, Viale Giorgio Ribotta, Torrino Nord, Torrino, Municipio Roma IX, ..."`
(41.81935, 12.45778). **Torrino**, i.e. Z. XXVII, which §1.3 names as EUR's south-west neighbour
across viale dell'Oceano Pacifico. The it.wikipedia EUR article discusses them as part of the
quartiere's changing skyline — **it is wrong on the boundary, and a writer following it will put a
Torrino tower in EUR.** Hard reject.

**6.3 The "Mediterraneum" aquarium — DO NOT PUBLISH.** it.wikipedia says an aquarium plus a permanent
Expo area "is being completed" and cites `acquariodiroma.com`. Nominatim returns **no result** for
"Acquario di Roma". The wiki text is stale and I could not confirm any current status. **Reject
until a live source exists.**

**6.4 Velodromo Olimpico — demolished 2008.** See G10.

**6.5 EuroMa2 shopping centre** — commonly called "EUR" in listings; it is in Torrino, outside the
polygon. Not researched further. **Reject.**

**6.6 Ostia, Ostia Antica, Cinecittà World, Zoomarine** — Turismo Roma's "you might also like" rail
on the Luneur page pushes all of these. They are other zones or other comuni. Noted so a writer does
not follow the rail.

---

## 7. Photo-wave notes (this wave emits `"photos": []` everywhere)

- **Palazzo della Civiltà Italiana — HARD REJECT until 2043.** Guerrini d. 1972; Italy has no freedom
  of panorama. Also applies, on the same reasoning, to the **Salone delle Fontane mosaics** (A5),
  which are partly Guerrini's.
- **La Nuvola (G1)** — Fuksas living. Architectural copyright. Reject pending analysis.
- **Obelisco Novecento (E6)** — Pomodoro d. 2025. Reject.
- **Possibly clear, worth checking**: the **Depero (d. 1960)** and **Prampolini (d. 1956)** exterior
  mosaics on the museum palazzi; **Dazzi's obelisk (Dazzi d. 1966)**; **Morbiducci (d. 1963)**;
  **Ercole Drei's stele (d. 1973)**. All are still inside 70-year terms as of 2026 except possibly
  none of them — **every one of these needs the death-date arithmetic done properly**, and the
  buildings behind them raise the freedom-of-panorama problem independently. I did not attempt to
  resolve any of it; that is the photo wave's job.
- **Probably safest subjects**: the lake and its planting, the Giardino delle Cascate's water and
  terracing (landscape by De Vico, d. 1976 — still needs checking), and the parks generally.

---

## 8. Source reachability log (this environment, 2026-09-03)

**Worked, raw bytes, used as sources**

| Host | Result | Note |
|---|---|---|
| `it.wikipedia.org/w/api.php` (`action=parse`, `action=query`) | 200 | raw wikitext; category and search endpoints both fine |
| `www.eurspa.it` | 200 | **the key primary source.** WordPress + Yoast; `sitemap_index.xml` works and enumerates `edificio_antico`, `parchi_giardini`, `opere`, `page` |
| `www.museodellecivilta.it` | 200 | address, hours, prices, building history. `page-sitemap.xml` timed out once at 45 s and needed a 90 s retry |
| `museocivilta.cultura.gov.it` | 200 but **useless** | every path, including `/robots.txt`, returns the same 702 kB homepage. Use `museodellecivilta.it` |
| `acs.cultura.gov.it` | 200 | ACS + Lo scrigno della memoria |
| `portalecultura.mise.gov.it` | 200 | Museo storico della comunicazione |
| `www.planetarioroma.it`, `www.museociviltaromana.it`, `museiincomuneroma.it` | 200 | Roma Capitale civic museums |
| `www.santipietroepaoloroma.it` | 200 | parish hours and history |
| `www.turismoroma.it` | 200 | Roma Capitale tourism. Per-place pages exist for **giardino-delle-cascate, palazzo-della-civilta-italiana, luneur-park, museo-della-civilta-romana, planetario-di-roma** and **404 for everything else I tried** |
| `www.ristoranteilfungo.it`, `www.eurpark.it` | 200 | operator hours |
| `nominatim.openstreetmap.org` | 200 | after an initial burst of **429s**; 1.2 s spacing was not enough at first, later fine |
| `overpass-api.de` | 200, then **429**, then **ECONNREFUSED** | see below |

**Failed**

| Host | Result |
|---|---|
| `www.piscinadellerose.it` / `.com` | **403** to both a plain and a browser user agent |
| `www.sanpietroepaolo.it` | SSL certificate verification failure (the working parish domain is `santipietroepaoloroma.it`) |
| `romaconventiongroup.it` | SSL certificate verification failure |
| `www.casinadeitrelaghi.com` | DNS: no such host |
| `www.acs.beniculturali.it` | DNS: no such host (OSM's tag is stale; use `acs.cultura.gov.it`) |
| `palazzodellosportroma.it` | 200 but serves *"Sito OFFLINE / SITO IN MANUTENZIONE"* |
| `www.luneurpark.it` | 200 but a client-rendered SPA: identical 2,902-byte shell on every path |
| `www.turismoroma.it/it/luoghi/eur` | 404 |

**Overpass, and a warning for the next wave.** My first four Overpass queries succeeded
(`overpass-api.de`, including both in-polygon POI queries). After that the endpoint returned **429**
and then **refused the TCP connection outright** for the rest of the session. Mirrors
(`overpass.kumi.systems`, `overpass.private.coffee`) timed out on a regex-heavy query and
`overpass.osm.jp` failed certificate verification. **Budget Overpass queries hard: get the polygon
and the in-area POI dump early, save them to disk, and do everything else against the saved JSON.**
I did save mine (`pois.json`, `pois2.json`) and finished the boundary work with Nominatim, which
stayed available.

**Also note: background/detached shell commands in this environment have no network.** Every
backgrounded fetch returned `ConnectionRefusedError` while the identical foreground command worked.
Anything network-bound must run in the foreground, which means keeping each command under the
two-minute limit.

---

## 9. What I did not do

- **Did not fetch** the dedicated it.wikipedia articles for Palazzi INA/INPS, Palazzo INAIL,
  Grattacielo Italia, Grattacielo delle Poste, Palazzo Sturzo, Stadio Tre Fontane, Viale Europa, or
  Via Cristoforo Colombo. Section G and H entries resting on a navbox mention are marked
  **under-researched** and should be treated as leads, not findings.
- **Did not reach** any Roma Capitale primary source (comune.roma.it, dati.comune.roma.it,
  geoportale) — so the Municipio, the zona urbanistica 12A "Eur", and the toponymic code 232 itself
  rest on the roster, on `docs/rome/scope-quartieri.md`, and on it.wikipedia, not on a fresh fetch.
- **Did not resolve** any straddler, per the brief.
- **Did not attempt** Vincoli in Rete or the Catalogo generale. The evidence ruling makes them
  irrelevant: no page may carry a designation claim regardless of what they say.
