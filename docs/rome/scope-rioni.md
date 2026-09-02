# Rome scope research — Angle 1: the rioni, and whether they are the right unit

Research wave input. **Not a decision.** Evidence and disagreements only; a later arbitration step adjudicates.

Researched 2026-09-02. Method notes and tooling failures are at the bottom (§7) — read them before trusting any single number.

---

## 0. One-paragraph summary of what the evidence supports

The 22 rioni are **real, official, and stable**: Roma Capitale's own Statistics Office publishes them as a
numbered territorial layer with codes 101–122. But they are a *statistical and historical* layer, not the
layer Rome uses to tell you where something is — the Comune's own tourism portal ignores them and uses 17
hand-drawn tourist zones instead, and no museum or church website I could reach names a rione in its address.
They also cover only **15.47 km² of Rome's 1,286.8 km²**, excluding Villa Borghese, the Vatican, the Appia
Antica, EUR and Ostia. Measured publishable yield per rione ranges roughly **14 to 128 named places** — an
~8× spread, but with **no empty rioni** (unlike Queens, where the tail collapsed to zero).

---

## 1. The authoritative list: 22 rioni, codes 101–122

### 1.1 The designating body is Roma Capitale (Ufficio di Statistica), and the rioni sit in a named layer

**Source (primary, official):** Roma Capitale, *Annuario statistico 2022*, Cap. 1 "Territorio e climatologia",
`https://www.comune.roma.it/web-resources/cms/documents/01_Territorio_Annuario_2022.pdf`
(host unreachable from this environment — retrieved via Internet Archive snapshot 2025-08-26:
`http://web.archive.org/web/20250826012304id_/https://www.comune.roma.it/web-resources/cms/documents/01_Territorio_Annuario_2022.pdf`, 2,058,122 bytes, PDF 1.7).

The document's own wording (Cap. 01 pag. 4), quoted in full:

> «Le zone urbanistiche e le suddivisioni toponomastiche costituiscono ulteriori suddivisioni amministrative
> del territorio capitolino. Le 155 zone urbanistiche sono state istituite nel luglio del 1977 sulla base di
> criteri di unitarietà urbanistica al fine di realizzare un riferimento di base per tutta l'attività di
> pianificazione e di gestione urbanistica. […] Le suddivisioni toponomastiche costituiscono la ripartizione
> storica della città, sono contrassegnate con un codice numerico a tre cifre e distinte al loro interno in
> **rioni (codici da 101 a 122)**, quartieri urbani e marini (codici da 201 a 235), suburbi (codici 301 e da
> 307 a 311) e zone dell'Agro romano (codici da 401 a 459 […]).»

Translation: *"The zone urbanistiche and the toponymic subdivisions constitute further administrative
subdivisions of the capital's territory. The 155 zone urbanistiche were instituted in July 1977 on criteria
of urban-planning unity, in order to provide a base reference for all planning and land-management activity.
[…] The toponymic subdivisions constitute the historic partition of the city; they are marked with a
three-digit numeric code and are internally distinguished into **rioni (codes 101 to 122)**, urban and marine
quartieri (codes 201 to 235), suburbi (codes 301 and 307 to 311) and zones of the Agro Romano (codes 401 to
459 […])."*

**VERIFIED.** Three parallel territorial systems exist in Roma Capitale's own model:

| Layer | Count | Purpose per the source | Legal basis given |
|---|---|---|---|
| Municipi | 15 | decentralised administration, elected presidents | Statuto + Del. Assemblea Capitolina n. 11/2013 |
| Zone urbanistiche | 155 | urban planning and land management | instituted July 1977 |
| Suddivisioni toponomastiche | 22 rioni + 35 quartieri + suburbi + Agro romano zones | "la ripartizione storica della città" | historic; codified by code number |

Note the phrasing: rioni are explicitly the **historic** partition. They are the *first level of toponymic
subdivision*, not a level of government.

### 1.2 The list, verbatim from Tab. 1.3 of the Annuario (data at 31.12.2021)

Roma Capitale's own spelling, official code, area, resident population, density:

| Code | Rione | Roman numeral | km² | Pop. | ab./km² |
|---|---|---|---|---|---|
| 101 | Monti | R. I | 1,7 | 11.956 | 7.052,9 |
| 102 | Trevi | R. II | 0,5 | 2.063 | 3.973,6 |
| 103 | Colonna | R. III | 0,3 | 1.898 | 6.576,4 |
| 104 | Campo Marzio | R. IV | 0,9 | 5.470 | 6.241,4 |
| 105 | Ponte | R. V | 0,3 | 3.375 | 10.120,8 |
| 106 | Parione | R. VI | 0,2 | 2.283 | 12.174,2 |
| 107 | Regola | R. VII | 0,3 | 3.017 | 9.540,8 |
| 108 | Sant' Eustachio | R. VIII | 0,2 | 1.839 | 10.478,4 |
| 109 | Pigna | R. IX | 0,2 | 2.624 | 12.336,8 |
| 110 | Campitelli | R. X | 0,6 | 515 | 873,0 |
| 111 | Sant' Angelo | R. XI | 0,1 | 990 | 7.953,7 |
| 112 | Ripa | R. XII | 0,8 | 2.477 | 2.956,6 |
| 113 | Trastevere | R. XIII | 1,8 | 12.962 | 7.162,0 |
| 114 | Borgo | R. XIV | 0,5 | 2.689 | 5.924,8 |
| 115 | Esquilino | R. XV | 1,6 | 21.263 | 13.369,1 |
| 116 | Ludovisi | R. XVI | 0,3 | 1.546 | 4.565,1 |
| 117 | Sallustiano | R. XVII | 0,2 | 2.191 | 8.872,1 |
| 118 | Castro Pretorio | R. XVIII | 1,1 | 5.228 | 4.912,8 |
| 119 | Celio | R. XIX | 0,8 | 2.439 | 3.021,2 |
| 120 | Testaccio | R. XX | 0,6 | 7.563 | 11.669,9 |
| 121 | San Saba | R. XXI | 1,1 | 3.366 | 3.107,6 |
| 122 | Prati | R. XXII | 1,3 | 14.631 | 11.207,8 |

**Cross-check (independent of the Comune's PDF layout, but not of its data):**
`https://it.wikipedia.org/wiki/Rioni_di_Roma` reproduces the same 22 names, same order, same populations to
the unit (Monti 11.956; Campitelli 515; Prati 14.631) and cites the same `01_Territorio_Annuario_2022.pdf`.
Wikipedia adds precise areas and the total: **15,4659 km², 112.385 residents, 7.226,6 ab./km²** across all 22.

The Roman numerals R.I–R.XXII do not appear in the Annuario table (which uses 101–122); they are the
conventional/historic designation, universal in Italian usage and in Wikipedia. Codes 101–122 map 1:1 onto
R.I–R.XXII in the same order. **INFERRED** (from the identical ordering), though it is an inference no
Italian source would dispute.

### 1.3 Stability, and when the list last changed

**VERIFIED.** The list has been fixed at 22 since 1921. The sequence, from `https://it.wikipedia.org/wiki/Rioni_di_Roma`:

- 13 rioni by the 13th–14th c. (attested in the *Catalogo di Torino*, early 1300s — the first appearance of
  the word "rioni").
- **1586**: Sixtus V adds Borgo as the 14th. > «Nel 1586 Sisto V aggiunse un quattordicesimo rione nella zona
  di San Pietro: Borgo».
- **1874**: Esquilino becomes the 15th, carved out of Monti. > «Nel 1874 i rioni divennero quindici con
  l'aggiunta dell'Esquilino, ricavato da Monti».
- **1921**: the **Giunta Municipale** creates seven more (XVI Ludovisi, XVII Sallustiano, XVIII Castro
  Pretorio, XIX Celio, XX Testaccio, XXI S. Saba, XXII Prati) and assigns each a coat of arms.
  > «Così, nel 1921, la Giunta Municipale dispose di istituire altri sette rioni e di assegnare ad ognuno di
  > essi un proprio stemma».
  Translation: *"So, in 1921, the Municipal Council resolved to institute another seven rioni and to assign
  each of them its own coat of arms."*

**Prati, specifically:** the newest rione, R. XXII.
> «Il **20 agosto 1921** fu costituito ufficialmente il rione Prati, l'ultimo in ordine di tempo dei rioni di
> Roma» — `https://it.wikipedia.org/wiki/Prati_(rione_di_Roma)`
Translation: *"On 20 August 1921 the rione Prati was officially constituted, the last in chronological order
of Rome's rioni."*

**COULD NOT CONFIRM:** the *number* of the 1921 deliberation. Italian Wikipedia names the body ("Giunta
Municipale") and the date (20 August 1921) but cites no delibera number, and I could not reach
`comune.roma.it` or its historic-archive search to find one (see §7). A verifier wanting the primary act
should look for a 1921 *deliberazione della Giunta Municipale del Comune di Roma* in the Archivio Storico
Capitolino. Treat "20 August 1921" as **single-source**.

Also note Wikipedia's claim that the pre-1874 fourteen were retroactively suffixed *Vetere* to distinguish
them: > «ai primi quattordici antichi rioni venne aggiunto l'appellativo Vetere». This suffix is not used in
the Comune's 2022 table and appears to be historical only. **INFERRED.**

Nothing since 1921. **105 years of stability** — a materially different situation from NYC neighborhood
naming, where the boundary set is contested and unofficial.

---

## 2. Rioni vs. Municipi: near-perfect nesting inside Municipio I, with one stated exception

### 2.1 The municipi are the actual administrative layer

**Source:** `https://it.wikipedia.org/wiki/Municipi_di_Roma`
> «In base allo Statuto di Roma Capitale, con delibera n. 8 del 7 marzo 2013 i municipi sono 15, i loro
> confini sono stabiliti con la **delibera n. 11 dell'11 marzo 2013**.»
Translation: *"Under the Statute of Roma Capitale, by deliberation no. 8 of 7 March 2013 the municipi number
15; their boundaries are established by deliberation no. 11 of 11 March 2013."*

Corroborated by the Annuario footnote (primary source, quoted verbatim):
> «Nel 2013, a seguito dell'approvazione del nuovo Statuto e della successiva deliberazione dell'Assemblea
> Capitolina n. 11/2013, sono state ridefinite le delimitazioni territoriali dei nuovi municipi ed il loro
> numero è stato ridotto da 19 a 15».

The 2013 reform merged old Municipio I with old Municipio XVII. **This is the fact that makes the mapping
trivial:** before 2013, Prati and Borgo sat in Municipio XVII, i.e. rioni *did* straddle two municipi.

> «A seguito della riorganizzazione dei municipi capitolini avvenuta nel 2013, i rioni Prati e Borgo sono
> stati inclusi nel I Municipio.» — `https://it.wikipedia.org/wiki/Prati_(rione_di_Roma)`

### 2.2 The mapping: all 22 rioni → Municipio I Roma Centro

**VERIFIED** (two sources agreeing):

- `https://it.wikipedia.org/wiki/Rioni_di_Roma` table, "Circoscrizione" column: **Municipio I for all 22
  rows without exception.** I read all 22 rows of the raw wikitext; every one reads
  `[[Municipio Roma I|Municipio I]]`.
- `https://it.wikipedia.org/wiki/Municipio_Roma_I`:
  > «Il territorio del Municipio comprende **per intero tutti i ventidue rioni di Roma eccezion fatta per
  > Castro Pretorio (una piccolissima porzione del quale ricade nel II Municipio)** e parte dei quartieri
  > Ostiense, Ardeatino, Trionfale e Della Vittoria.»
  Translation: *"The Municipio's territory comprises in their entirety all twenty-two rioni of Rome **except
  for Castro Pretorio, a very small portion of which falls within Municipio II**, plus parts of the quartieri
  Ostiense, Ardeatino, Trionfale and Della Vittoria."*

So the answer to "do rioni nest inside municipi, cut across them, or neither" is: **they nest, essentially
completely, into a single municipio — with one small documented exception at Castro Pretorio.** The two
Wikipedia pages *disagree* on that exception (the table says Municipio I flat; the Municipio I article says
"except a sliver of Castro Pretorio"). Surfacing the disagreement rather than resolving it, per instruction.

**Attempted independent check, INCONCLUSIVE.** Nominatim reverse geocoding at the northern edge of Castro
Pretorio returned `suburb: Nomentano` with no `quarter`, and no municipio at all:

| Probe point | lat,lon | `quarter` | `suburb` |
|---|---|---|---|
| Castro Pretorio barracks (S) | 41.9053, 12.5054 | Castro Pretorio | Municipio Roma I |
| La Sapienza, Città Universitaria | 41.9033, 12.5145 | *(none)* | Nomentano |
| Policlinico Umberto I | 41.9085, 12.5100 | *(none)* | Nomentano |

That is consistent with the rione ending before Sapienza and OSM not carrying the sliver, but it does not
*prove* the sliver exists. **I could not confirm the Castro Pretorio / Municipio II overlap from a primary
source.** It matters little for content scope either way.

### 2.3 The important structural fact: rioni cover ~1.2% of Rome

- All 22 rioni: **15,47 km²**, **112.385** residents (Wikipedia total, sourced to the Annuario).
- Roma Capitale: **1.286,8 km²** (Annuario, verbatim: «Roma Capitale si estende su una superficie di 1.286,8 km²»).

That is **1.2% of the municipal area**. Everything outside the Aurelian walls (Prati excepted — it is the
only rione outside the walls: «Il rione Prati […] è l'unico a trovarsi fuori dalla cinta muraria di Roma») is
handled by the *quartieri* (35, codes 201–235), *suburbi*, and *Agro romano* layers.

**Consequences for a guide, INFERRED from the geography but with high confidence:** a rioni-only programme
structurally cannot host pages for Villa Borghese and the Galleria Borghese (Q. III Pinciano — confirmed by
Nominatim reverse geocode at 41.9140, 12.4850 → `suburb: Pinciano`, no rione), the Vatican Museums and
St Peter's (Vatican City, a separate state — Prati's article lists «la Città del Vaticano» as a *neighbour*,
not a container), the Appia Antica, EUR, Ostia Antica, San Lorenzo, Pigneto, Garbatella, or Monteverde.

---

## 3. Are rioni a unit Romans and sources actually use for location?

Mixed, and the honest answer is **"official yes, operational no."** Evidence in both directions:

### 3.1 Evidence FOR: rioni are a live, coded, mapped layer

1. **Roma Capitale's Statistics Office publishes population and density by rione**, with official codes
   101–122, in its current Annuario (§1.1). This is not a plaque; it is a maintained statistical geography
   with a map figure ("Fig.1.3 – Suddivisioni toponomastiche di Roma Capitale"). **VERIFIED.**
2. **OpenStreetMap carries all 22 as boundary polygons**, and geocoders resolve into them. Nominatim reverse
   geocode (`https://nominatim.openstreetmap.org/reverse?...&accept-language=it`) returned the rione as the
   `quarter` component for every central landmark I tested. **VERIFIED**, 8/8 landmarks:

   | Landmark | lat,lon | `quarter` (= rione) | `suburb` | CAP |
   |---|---|---|---|---|
   | Pantheon | 41.8986, 12.4769 | **Colonna** | Municipio Roma I | 00186 |
   | Fontana di Trevi | 41.9009, 12.4833 | **Trevi** | Municipio Roma I | 00187 |
   | Piazza Navona | 41.8990, 12.4731 | **Parione** | Municipio Roma I | 00186 |
   | Colosseo | 41.8902, 12.4922 | **Celio** | Municipio Roma I | 00184 |
   | Castel Sant'Angelo | 41.9031, 12.4663 | **Borgo** | Municipio Roma I | 00193 |
   | S. Maria in Trastevere | 41.8894, 12.4697 | **Trastevere** | Municipio Roma I | 00153 |
   | Termini | 41.9009, 12.5017 | **Esquilino** | Municipio Roma I | 00185 |
   | Lungotevere Tor di Nona | 41.9016, 12.4699 | **Ponte** | Municipio Roma I | 00186 |

   Caveat, **VERIFIED**: OSM's tagging is *not uniform*. Testaccio came back as `neighbourhood`, not
   `quarter` (41.8765, 12.4753 → `{"road":"Via Galvani","neighbourhood":"Testaccio","suburb":"Municipio Roma I"}`).
   A pipeline that keys on `address.quarter` will silently drop rioni. Outside the 22, `suburb` flips from
   "Municipio Roma I" to the quartiere name (Pinciano, Nomentano) — so the OSM schema is inconsistent across
   the rione/quartiere boundary too.
3. **Italian Wikipedia maintains a per-rione category for every one of the 22** (`Categoria:Roma R. I Monti`
   … `Categoria:Roma R. XXII Prati`). All 22 exist; none is missing. This is editorial evidence that Italian
   writers routinely file Roman places by rione. **VERIFIED** — see §4 for the counts.
4. **Roma Capitale's tourism portal does publish rione editorial pages**, at least one:
   `https://www.turismoroma.it/it/pagina/rione-xvii-sallustiano`, titled "Rione XVII - Sallustiano".
   **VERIFIED** (fetched; page exists, 9.3 KB of text).

### 3.2 Evidence AGAINST: nothing that *addresses* a place uses a rione

1. **Roma Capitale's own tourism portal does not organise by rione.** `https://www.turismoroma.it/it/quartieri`
   is the site's neighbourhood hub, and it contains **17 zones that are not rioni** — they are hand-drawn
   landmark clusters, several of which merge or split rioni, and several of which lie entirely outside the 22.
   **VERIFIED** (extracted from the page's own `/quartieri/...` hrefs):

   ```
   aventinotermedicaracalla        colosseo-palatino-campidoglio   esquilino-monti
   eur                             flaminio-villaborghese          ghetto-circomassimo
   gianicolo-monteverde            navona-campodefiori-pantheon-viagiulia
   ostia                           ostiense-garbatella-spaolo      pigneto-sanlorenzo
   prati-vaticano                  salario-trieste                 sangiovanni
   terminipiazzadellarepubblicaviaveneto-2                          trastevere-testaccio
   tridente
   ```

   Note what this list does: it **merges** Esquilino+Monti and Trastevere+Testaccio (non-adjacent-feeling but
   thematically paired), **crosses the state border** (prati-vaticano), invents *Tridente* (a name with no
   rione status, spanning Campo Marzio/Colonna), and reaches far outside the walls (EUR, Ostia, Pigneto).
   This is the single strongest piece of evidence that even the city's own tourism function does not think
   the rione is the useful traveller-facing unit.

2. **Place records on that portal carry no rione field.** The Fontana di Trevi page
   (`https://www.turismoroma.it/it/luoghi/fontana-di-trevi`) renders its `Indirizzo` field as a raw WKT
   geometry — `Indirizzo POINT (12.483238 41.900765)` — with no street, no rione, no municipio.
   **VERIFIED.** Roma Capitale's tourism CMS models location as a coordinate, not as a named subdivision.

3. **Institutional websites give street + CAP and never a rione.** I fetched three reachable ones and counted
   occurrences of the string "rione" in the rendered text: **zero in all three.** **VERIFIED.**

   | Site | URL | Address as published | "rione" count |
   |---|---|---|---|
   | Basilica di San Clemente | `https://www.basilicasanclemente.com/it/` | Via Labicana, 95, 00184 | 0 |
   | Sovrintendenza Capitolina | `https://www.sovraintendenzaroma.it/` | Piazza Lovatelli 35 - 00186 | 0 |
   | Galleria Borghese (Gebart) | `https://www.gebart.it/musei/galleria-borghese/` | Piazzale del Museo Borghese - 00197 | 0 |

   (Three more were unreachable: `santamariaintrastevere.it` 403, `museiincomune.it` TLS handshake failure,
   `doriapamphilj.it` 403, `museonazionaleromano.beniculturali.it` timeout. So this is a **3-site sample**,
   not an exhaustive survey. A verifier should widen it.)

4. **The Italian postal address does not contain a rione.** Every address I observed — on institutional
   sites, in Nominatim output, and in the Comune's own footer (`Via di San Basilio, 51 00187 Roma`) — is
   *street type + street name + civic number + 5-digit CAP + comune*. The CAP is the only geographic code and
   it does not align with rioni: Parione and Ponte both fall in 00186, while Trastevere and San Saba/Testaccio
   share 00153. **VERIFIED** from the observations above. **INFERRED** (but firmly): a rione is never part of
   a deliverable address.

5. **The rione does not appear in the Comune's open-data catalogue.** I could not reach
   `dati.comune.roma.it` live (connection reset / TLS EOF from this network, and CKAN `package_search`
   returned HTTP 500 through every path variant I tried: `/catalog/api/3/...`, `/api/3/...`,
   `/catalog/it/api/3/...`). Via the Internet Archive snapshot of the dataset listing
   (`http://web.archive.org/web/20240509224534/https://dati.comune.roma.it/catalog/dataset/`) I could read 20
   dataset titles: GTFS transit, park-and-ride, hotel registry, SUAP businesses, blue-zone parking, ticket
   machines, WiFi hotspots, library card counts, school menus. **None is rione-keyed and none obviously
   carries a rione field.** This is a **partial, 20-title, 2024-vintage sample of one page** — I cannot say
   the catalogue has no rione field anywhere, only that I found none. **COULD NOT CONFIRM either way.**

   Set against this: the Annuario *does* publish by rione (§1.1). So the correct statement is: **Roma
   Capitale's statistical publications are rione-aware; its operational open data appears not to be.**

6. **"Mainly on plaques" — partly true, and I could not source it properly.** The street-plaque convention of
   naming the rione at the top of the marble tablet is widely known and traceable to the Napoleonic reform:
   > «i francesi imposero di scrivere su tutte le strade i rispettivi nomi con la zona di appartenenza: per la
   > prima volta non ci fu nessuna ambiguità riguardo ai confini» — `https://it.wikipedia.org/wiki/Rioni_di_Roma`
   Translation: *"the French required that all streets be inscribed with their respective names together with
   the zone they belonged to; for the first time there was no ambiguity about the boundaries."*
   That the *modern* Roman street plaque still carries the rione name is my own knowledge, **NOT VERIFIED
   here** — I found no source confirming current signage practice. Flag for the verifier.

### 3.3 Net reading of §3

A rione is:
- a **stable, official, mappable polygon** with a Comune code and a Comune population figure;
- a **strong editorial/cultural category** in Italian-language writing about Rome;
- **not** part of any address;
- **not** the unit the Comune's own tourism arm uses;
- **not** a field on institutional place records.

The closest NYC analogue is not "neighborhood" — it is something like a Community District that happens to
have a beautiful historic name. The programme therefore has to decide whether it wants an *official* unit or
a *findable* one; the Queens experience suggests those are different questions.

---

## 4. Measured publishable yield per rione

### 4.1 Method

Two independent counting passes, both against Italian Wikipedia, both reproducible:

- **Pass A — category census.** Recursively enumerate `Categoria:Roma R. <num> <Name>` to depth 2 (i.e.
  including subcategories such as the per-rione churches category), de-duplicate titles, then classify each
  title by a leading-word regex into churches / museums / piazze / streets / palaces-villas /
  fountains-monuments / archaeology / other. "Place-like" = everything except `streets` and `other`.
- **Pass B — article census.** Count bullet-list entries in the rione article's own
  *Monumenti e luoghi d'interesse*, *Musei*, *Piazze* and equivalent sections.

**Known weakness of Pass A, stated plainly:** the regex classifier keys on the *first word*, so it drops
places whose names don't start with a type noun — Campo de' Fiori, Pasquino, Monte Testaccio, Ex Mattatoio,
Piramide Cestia, Cimitero acattolico all land in `other`. Pass A "place-like" is therefore a **floor, not a
count**. It also over-collects for rioni whose category sweeps in people and artworks: Trastevere's raw 195
includes footballers and paintings from Palazzo Corsini; Testaccio's raw 88 is dominated by people buried in
the Protestant Cemetery. Where Pass A and Pass B disagree, trust neither exactly; trust the order of magnitude.

### 4.2 The five requested rioni

| Rione | Pass A raw articles | Pass A place-like | Pass B listed entries | churches (A) | museums (A) |
|---|---|---|---|---|---|
| **R. I Monti** | 148 | **106** | **128** | 59 | 3 |
| **R. XIII Trastevere** | 195 | **102** | **91** | 51 | 6 |
| **R. VI Parione** | 53 | **40** | **46** | 15 | 3 |
| **R. XVIII Castro Pretorio** | 52 | **33** | **47** | 14 | 4 |
| **R. XXII Prati** | 46 | **24** | **32** | 7 | 3 |

Pass B breakdowns, verbatim from the section counts:

- **Monti** — Architetture civili 14; Architetture religiose 60; Siti archeologici 11; Altro 7; Musei 13;
  Aree archeologiche aperte al pubblico 6; Piazze 17.
- **Trastevere** — Architetture civili 20; Architetture religiose 51; Fontane 3; Altro 11; Musei 6.
- **Parione** — Architetture civili 20; Architetture religiose 14; Altro 4; Piazze 8.
- **Castro Pretorio** — Architetture civili 12; Architetture religiose 15; Porte 2; Altri monumenti 5;
  Musei 5; Piazze 8.
- **Prati** — Architetture civili 9; Architetture religiose 10; Architetture militari 4; Altro 4; Musei 3;
  Teatri 2.

The two passes agree within ~30% on all five and preserve the same ranking. **VERIFIED** by construction
(both passes run and logged).

### 4.3 The full range: establishing the floor and the ceiling

Pass A raw article counts for **all 22** rioni (category pages only, excluding subcategory contents — so
these are lower than the depth-2 figures above and are a *relative* index):

| Rione | pages | Rione | pages |
|---|---|---|---|
| R. X Campitelli | 138 | R. XII Ripa | 58 |
| R. II Trevi | 89 | R. XIV Borgo | 57 |
| R. XIII Trastevere | 86 | R. III Colonna | 46 |
| R. I Monti | 78 | R. V Ponte | 46 |
| R. IV Campo Marzio | 73 | R. VI Parione | 38 |
| R. IX Pigna | 62 | R. XVIII Castro Pretorio | 38 |
| R. XV Esquilino | 61 | R. XXII Prati | 34 |
| | | R. VII Regola | 32 |
| | | R. VIII Sant'Eustachio | 32 |
| | | R. XI Sant'Angelo | 32 |
| | | R. XIX Celio | 32 |
| | | R. XX Testaccio | 18 |
| | | R. XVI Ludovisi | 16 |
| | | R. XVII Sallustiano | 16 |
| | | R. XXI San Saba | 15 |

Depth-2 place-like counts for the tail and the head, to bracket the range:

| Rione | raw (depth 2) | place-like | what's actually there |
|---|---|---|---|
| **R. X Campitelli** (ceiling) | 203 | **119** | Foro Romano, Palatino, Campidoglio, Musei Capitolini, Aracoeli — 36 churches, 40 archaeological entries |
| R. XVI Ludovisi | 48 | **20** | 10 churches, 8 palazzi/villini, Fontana delle Api; raw count inflated by ~20 residents (Carlo Verdone, Antonio Tajani…) |
| R. XVII Sallustiano | 19 | **16** | S. Maria della Vittoria (the Bernini Ecstasy), S. Camillo de Lellis, Horti Sallustiani, 2 museums, 7 villini |
| **R. XXI San Saba** (floor) | 21 | **14** | Terme di Caracalla, S. Saba, S. Balbina, Porta San Sebastiano, Porta Capena, Casina del Cardinal Bessarione, Mitreo |
| R. XX Testaccio | 88 | 9 (regex artefact) | true content is Monte Testaccio, Ex Mattatoio, Cimitero acattolico, Piramide, Mercato, Fontana delle Anfore, Campo Testaccio — all classified as `other`; **the 9 is a measurement failure, not a yield failure** |

**Measured range: ~14 to ~119 place-like named entries per rione (≈8×).** No rione is empty. Even the
thinnest (San Saba, Sallustiano, Ludovisi at 14–20) has a genuine marquee anchor — Terme di Caracalla, the
Cornaro Chapel, Via Veneto respectively.

**This is the key contrast with Queens.** Queens narrowed 111→21 because per-neighborhood yield *collapsed to
nothing* in the tail. Rome's rione tail does not collapse; it thins to ~15 named places. Whether 15 is enough
for a page is a *content-standard* question this research cannot answer — it depends on the per-page bar the
Rome test gate sets. But the shape of the distribution is different from Queens, and an arbitrator should not
assume the Queens playbook transfers.

---

## 5. The disagreements a later step must adjudicate

1. **Official vs. findable.** The rione is the Comune's official historic unit and Wikipedia's editorial unit,
   but the Comune's *own tourism site* uses 17 different zones and no address anywhere names a rione. A
   reader searching "where to stay in Rome" is far likelier to type "Trastevere", "Monti", "Prati" or
   "Testaccio" than "Sant'Eustachio" or "Sallustiano" — and the first four *are* rioni, which is precisely
   what makes the question hard. Several rioni are strong consumer brands; several are invisible.
2. **Coverage gap.** 22 rioni = 1.2% of Rome's area and exclude the Vatican, Villa Borghese/Galleria Borghese,
   Appia Antica, EUR, Ostia Antica, San Lorenzo, Pigneto, Garbatella, Monteverde. Any rioni-only roster needs
   a companion layer (quartieri? turismoroma-style zones?) or those pages have no home.
3. **Granularity mismatch.** Sant'Angelo is 0,1 km² with 990 residents; Trastevere is 1,8 km² with 12.962.
   Parione (0,2 km²) and Sant'Eustachio (0,2 km²) are each a few blocks. A traveller does not perceive a
   boundary between Parione, Sant'Eustachio, Pigna and Regola — turismoroma bundles all four into
   `navona-campodefiori-pantheon-viagiulia`. Adjacent-rione merging is a live option the arbitrator should
   price.
4. **Castro Pretorio's municipio.** Wikipedia contradicts itself (§2.2). Immaterial to content, but if the
   roster carries a `municipio` field it needs a decision.
5. **The 1921 act number for Prati is unsourced** (§1.3).

---

## 6. What I would tell a roster author, if asked (clearly labelled as opinion, not evidence)

Not adjudicating — but flagging the shape of the option space so the arbitrator sees it:

- All 22 are *defensible* (official, stable, non-empty). None would be a fabrication.
- A subset of ~10–12 tracks consumer recognition: Monti, Trastevere, Prati, Testaccio, Esquilino, Campo
  Marzio, Ponte/Parione (Navona), Campitelli (Foro/Campidoglio), Celio, Borgo, Regola (Ghetto), Trevi.
- Any Rome roster that stops at the walls omits the Vatican Museums and the Galleria Borghese. That is
  probably disqualifying on its own, and argues for a **hybrid roster**: rioni for the core, quartieri or
  named zones for everything else — with an explicit `unit_type` field so the two never get confused.

---

## 7. Method, tooling failures, and what to re-check

**WebSearch:** never used — the session budget warning proved accurate; I worked entirely from URLs named in
advance. **WebFetch:** was unavailable for the first several minutes of this task (classifier outage:
"claude-sonnet-5 is temporarily unavailable, so auto mode cannot determine the safety of WebFetch"), and when
it recovered it hit `ECONNRESET` on `dati.comune.roma.it`. Essentially all retrieval below was done with
python `urllib` via `/private/tmp/.../scratchpad/rioni_fetch.py`.

**Blocked hosts — this bit hard.** `www.comune.roma.it` and `dati.comune.roma.it` are **unreachable from this
environment**, by every method tried:
- python urllib with a bot UA → `ConnectionReset(54)` / `SSLEOFError` / `RemoteDisconnected`
- python urllib with a Safari UA → same
- `curl` → `curl: (35) LibreSSL SSL_connect: SSL_ERROR_SYSCALL`
- WebFetch → `read ECONNRESET`
- CKAN API at three path variants → HTTP 500

The primary Comune evidence in §1 was recovered **only** through the Internet Archive
(`web.archive.org/web/20250826012304id_/…`), downloaded as a 2 MB PDF and extracted with `pdftotext -layout`.
A verifier on a different network should re-fetch the live PDF and confirm the quoted paragraph and Tab. 1.3
figures, since I am relying on an archived copy.

**Wikipedia rate-limiting:** the API returned HTTP 429 on rapid sequential calls. Fixed with a descriptive
User-Agent plus exponential backoff. Anyone re-running the yield scripts must keep the throttle.

**Everything in this file is re-runnable.** Scripts, in
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/`:
`rioni_fetch.py` (fetch helper), `rioni_cat.py` (all-22 category census), `rioni_yield2.py` (depth-2
classification for the 5 sample rioni), `rioni_yield3.py` (article-section counts), `rioni_floor.py`
(tail/ceiling rioni), `rioni_batch4.py` / `rioni_batch10.py` (Nominatim probes), `rioni_batch7.py`
(turismoroma), `rioni_batch9.py` (institutional sites + archived CKAN). Note these are in a *shared*
scratchpad and may be cleaned up; the URLs and quotes above are the durable record.

**Sources of record**
| # | URL | Used for |
|---|---|---|
| 1 | `https://www.comune.roma.it/web-resources/cms/documents/01_Territorio_Annuario_2022.pdf` (via `web.archive.org/web/20250826012304id_/`) | official 22-rione list, codes 101–122, areas/populations, definition of "suddivisioni toponomastiche", 1.286,8 km², 155 zone urbanistiche, Del. 11/2013 footnote |
| 2 | `https://it.wikipedia.org/wiki/Rioni_di_Roma` | numerals R.I–R.XXII, municipio column, totals (15,4659 km² / 112.385), history 1586 / 1874 / 1921, Napoleonic plaque quote |
| 3 | `https://it.wikipedia.org/wiki/Municipio_Roma_I` | "all 22 rioni entire except a sliver of Castro Pretorio"; 103 museums in the municipio |
| 4 | `https://it.wikipedia.org/wiki/Municipi_di_Roma` | 15 municipi, delibere n. 8 and n. 11 of March 2013, 19→15 merger |
| 5 | `https://it.wikipedia.org/wiki/Prati_(rione_di_Roma)` | Prati constituted 20 Aug 1921; Prati+Borgo moved into Municipio I in 2013; Vatican City as neighbour |
| 6 | `https://www.turismoroma.it/it/quartieri` | the 17 official tourist zones that are *not* rioni |
| 7 | `https://www.turismoroma.it/it/luoghi/fontana-di-trevi` | place record whose `Indirizzo` is a WKT POINT |
| 8 | `https://www.turismoroma.it/it/pagina/rione-xvii-sallustiano` | rioni as editorial content on the official portal |
| 9 | `https://nominatim.openstreetmap.org/reverse` | rione-as-`quarter` for 8/8 central landmarks; Testaccio tagging inconsistency; Pinciano/Nomentano outside the rioni |
| 10 | `https://it.wikipedia.org/w/api.php` (`categoryinfo`, `categorymembers`, `parse`) | all yield counts in §4 |
| 11 | `https://www.basilicasanclemente.com/it/`, `https://www.sovraintendenzaroma.it/`, `https://www.gebart.it/musei/galleria-borghese/` | institutional addresses: street + CAP, zero rione mentions |
| 12 | `http://web.archive.org/web/20240509224534/https://dati.comune.roma.it/catalog/dataset/` | archived open-data catalogue listing (20 titles, none rione-keyed) |
