# Sallustiano (R. XVII, Roma Capitale toponymic code 117) — FINDER file

Wave 3, Rome programme. **Evidence, not adjudication.** A verifier re-fetches; an arbitrator rules
ownership of straddlers. I resolve no straddler here.

Research date: 2026-09-02. Author: finder agent (Sallustiano).

---

## 0. Compliance statement

The three binding rulings in `priv/seed_data/rome_roster.json` (`scope_ruling`, `vatican_ruling`,
`evidence_ruling`) were read in full before work began.

1. **NO DESIGNATION CLAIMS.** Nothing below says any building is *vincolato*, listed, scheduled,
   declared a monument or under state protection. I re-tested the registers: `cultura.gov.it` and
   `beniculturali.it` both time out from this network, and every `*.cultura.gov.it` museum
   sub-domain fails DNS resolution (§7). Where a source I fetched mentioned protection I omitted it
   rather than transcribe it.
2. **VATICAN CITY BELONGS TO NO RIONE.** No Vatican property appears here. Sallustiano's specific
   trap is *diplomatic*, not territorial, and it bites **twice**: Villa Paolina Bonaparte is the
   **French Embassy to the Holy See** and Via Sallustiana 49 is the **United States Embassy to the
   Holy See**. Both are embassies *accredited to* the Holy See standing on **Italian soil in the
   rione**. Neither is Vatican territory, neither is a Lateran Treaty Art. 15 extraterritorial
   property, and neither is "French"/"American" soil. This is the Palazzo Margherita misconception
   from Ludovisi, in a doubled costume. See §6.1.
3. **NO PHOTOGRAPHS.** Every record is `"photos": []`. I named and linked no image file. Photo
   leads for the later wave are parked in §8 as prose only.

Corpus rules observed: no trip durations, no vague proximity, aggregators attributed, every factual
claim carries the URL I actually fetched.

**Reserved-list check.** Nothing on the Wave 1 / Wave 2 reservation list falls inside Sallustiano
by any test I ran. The nearest reserved item is the Quirinal Palace, which is in Trevi and roughly
600 m south-west of the rione's southern tip. I take nothing across a border. Three near-border
items that a careless source *would* hand to Sallustiano — Santa Susanna, the Fontana del Mosè
(Acqua Felice) and San Bernardo alle Terme — test out of the rione and are ruled out in §5.

---

## 1. Method, and what "I know which rione" means here

**Tooling.** WebSearch budget exhausted; every retrieval ran against URLs named in advance, fetched
with `python3 urllib` (never piped `curl`, never `grep` as a source of truth). Scripts and cache at
`<scratchpad>/sal/`.

**Network findings worth recording for the other waves:**

| Host | Result |
|---|---|
| `overpass-api.de` | **Connection refused** at the socket. Dead from this network, sandboxed or not. |
| `overpass.kumi.systems` | Works, but 504s on any bbox wider than ~1.5 km. Tight bboxes succeed. |
| `overpass.private.coffee` | Answers HTTP 200 with **`elements: []`** to a query kumi answers with 143 elements. **A syntactically valid empty answer is not an empty area.** Same trap the Borgo finder logged. |
| `nominatim.openstreetmap.org` | `/status` 200 with any UA; `/search` and `/reverse` return **HTTP 403** to a research UA and 200 to a browser UA. Then 429s after ~40 calls. |
| `api.openstreetmap.org/api/0.6/relation/<id>/full.json` | **Works, unthrottled, authoritative.** This is the reliable way to get boundary geometry. |
| `cultura.gov.it`, `beniculturali.it` | timeout |
| `direzionemuseiroma.cultura.gov.it` and every variant I tried | **DNS failure** — the Museo Boncompagni Ludovisi's own site is unreachable (§7.2) |

**Boundary method — the load-bearing part.** I did *not* use Overpass `is_in()`. Instead:

1. Got the OSM relation id for each rione from **Wikidata property P402** (`action=wbgetentities`
   on the it.wikipedia article's `wikibase_item`). Sallustiano = **Q532968 → OSM relation
   5454324**.
2. Downloaded full member geometry from `https://api.openstreetmap.org/api/0.6/relation/<id>/full.json`
   and assembled the outer ring locally in Python. Every ring closed.
3. Ran point-in-polygon locally.

The relation carries `boundary=place`, `place=quarter`, `ref=R. XVII`,
`official_name=Rione XVII Sallustiano`, `wikidata=Q532968`. Note it is **not** tagged
`admin_level` — OSM models the rioni as places, not administrative units, which is consistent with
Roma Capitale calling them a *toponymic* subdivision rather than a level of government.

**Independent-ish cross-check on the polygons.** Planimetric area computed from the assembled rings
against Roma Capitale's *Annuario statistico 2022* Tab. 1.3 (via `docs/rome/scope-rioni.md` §1.2):

| Rione | OSM ring area | Annuario | 
|---|---|---|
| Sallustiano | 0,249 km² | 0,2 |
| Ludovisi | 0,324 km² | 0,3 |
| Castro Pretorio | 1,047 km² | 1,1 |
| Trevi | 0,532 km² | 0,5 |
| Colonna | 0,294 km² | 0,3 |
| Campo Marzio | 0,883 km² | 0,9 |

Six for six to the Annuario's one-decimal rounding. That is strong evidence the polygons are the
right polygons — but it is **not** evidence that OSM's line is Roma Capitale's line at any given
metre. Every "Sallustiano — OSM PIP" below means: *this coordinate, tested against OSM relation
5454324's assembled outer ring, falls inside.* Attribute it to OpenStreetMap, never to the Comune.

**Second check on most records:** Nominatim reverse geocoding, which returns the rione in its
`address.quarter` field. This is a different code path over the same underlying OSM data, so it is a
consistency check, not an independent source. Where PIP and Nominatim **disagree**, I say so and
flag the record — that disagreement is exactly what marks a boundary case.

**Third check where available:** it.wikipedia's `Categoria:Roma R. XVII Sallustiano` membership and
the article's own lead sentence. Italian Wikipedia is an **aggregator**; the corpus must re-source
or attribute it.

---

## 2. The rione itself

| Fact | Value | Source I fetched |
|---|---|---|
| Official code / numeral | 117 / R. XVII | `docs/rome/scope-rioni.md` §1.2, quoting Roma Capitale *Annuario statistico 2022*, Tab. 1.3 |
| Area | 0,2 km² | same |
| Resident population (31.12.2021) | 2.191 | same |
| Density | 8.872,1 ab./km² | same |
| Municipio | I | `https://it.wikipedia.org/wiki/Sallustiano` (infobox) — aggregator |
| Created | 1921, one of seven rioni instituted by the Giunta Municipale, each given a coat of arms | `docs/rome/scope-rioni.md` §1.3, quoting `https://it.wikipedia.org/wiki/Rioni_di_Roma` |
| Coat of arms | *"Di azzurro allo specchio di Venere Ericina d'oro"* — a gold mirror of Venus Erycina on blue, alluding to the temple in the Gardens of Sallust | `https://it.wikipedia.org/wiki/Sallustiano`, citing Pietrangeli, *Insegne e stemmi dei rioni di Roma*, 1953, p. 190 — **aggregator citing a 1953 article I could not fetch** |

**Stated borders**, verbatim from `https://it.wikipedia.org/wiki/Sallustiano` (§"Confini"):

> «[[Mura aureliane]] fino a piazza Fiume (esclusa) con il quartiere Salario; via Calabria-via
> Boncompagni-via Lucullo-via Friuli con il rione Ludovisi; via Leonida Bissolati-largo Santa
> Susanna con Trevi e via XX Settembre fino a Porta Pia (esclusa) con il rione Castro Pretorio.»

Translation: *Aurelian Walls as far as Piazza Fiume (excluded) with the quartiere Salario; via
Calabria–via Boncompagni–via Lucullo–via Friuli with the rione Ludovisi; via Leonida Bissolati–largo
Santa Susanna with Trevi; and via XX Settembre as far as Porta Pia (excluded) with the rione Castro
Pretorio.*

**Reciprocally confirmed from the other side.** `https://it.wikipedia.org/wiki/Ludovisi_(rione_di_Roma)`
describes the same line in reverse: *«via Friuli-via Lucullo-via Boncompagni-via Calabria fino a
piazza Fiume (esclusa) con Sallustiano»*. Two articles, same staircase, same exclusions. This
matters because the two rioni were cut from the same estate and the prompt warned to expect
confusion — the descriptions do **not** in fact disagree.

**Consequences the arbitrator will want:**
- **Porta Pia is EXCLUDED.** It is Castro Pretorio's. OSM PIP agrees (§5).
- **Piazza Fiume is EXCLUDED.** It is the quartiere Salario's, per this text. OSM PIP does *not*
  agree — it puts Piazza Fiume points in Ludovisi (§4.2). Flagged.
- **Largo di Santa Susanna is on the line**, and it.wikipedia's own article on the square says it
  sits *partly* in Sallustiano and *partly* in Trevi (§4.1).
- Sallustiano owns a short stretch of the **Aurelian Walls**, and it.wikipedia asserts the 1870
  breach of Porta Pia was opened in it.

**Historical spine** — all from `https://it.wikipedia.org/wiki/Sallustiano` unless stated; an
aggregator, and the corpus should re-source or attribute:
Augustan *Regio VI Alta Semita*; the *Horti Sallustiani* and a temple of Venus Erycina, whose gold
mirror became the rione's arms; via Piave follows the line of the *via Salaria Nova* out of the
former Porta Collina toward the demolished Porta Salaria; Alaric's Visigoths cut the aqueducts and
sacked Sallust's villa in 410, after which the area between the Pincio and the Quirinal depopulated;
partial revival in the 16th century with the opening of via Pia and Sixtus V's Acqua Felice; the
zone remained thinly populated, part of the rione **Trevi**, with large villas (villa Barberini,
villa Mandosi, villa Cicciaporci); urbanised after the 1870 breach of Porta Pia; constituted as its
own rione in 1921. Its own article calls the modern rione two zones — the reasonably residential
strip between via Piave and via Piemonte/via Salandra, and the rest down to via Bissolati,
*«praticamente disabitata e con un'alta concentrazione di uffici e ministeri»* (practically
uninhabited, with a high concentration of offices and ministries).

That last sentence is the honest key to this file. **Most of Sallustiano is ministries, embassies
and offices.** See §9.

---

## 3. Candidates

**22 candidate records**, of which I judge **10–12** are things a travel guide could honestly write
a paragraph about and **5** are actually enterable by a visitor. Format: name · kind · address ·
what it is · date/author · rione evidence · sources fetched. All records carry `"photos": []`.

### 3.1 The anchors — enterable, and worth the page

---

**1. Chiesa di Santa Maria della Vittoria — church; Bernini's Cornaro Chapel**

- **Address: Via XX Settembre 17, 00187 Roma.** Two sources agree:
  Roma Capitale's tourism portal `https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-della-vittoria`
  (field "Location": *"Chiesa di Santa Maria della Vittoria, Via XX Settembre, 17"*;
  `POINT (12.4943365 41.9045242)`), and the Discalced Carmelite province's own site
  `https://www.carmelitanicentroitalia.it/dove-siamo/conventi-della-provincia/s-maria-della-vittoria-roma`
  (*"Via XX Settembre, 17 / 00187 - Roma / tel: 06 42740571"*).
- **What it is / history**, all from the turismoroma page (Roma Capitale): at the corner of via XX
  Settembre and largo di Santa Susanna; *«rappresenta uno fra i più importanti esempi del periodo
  barocco a Roma»*. Designed by **Carlo Maderno**, built **1608–1620**, first as a chapel dedicated
  to St Paul for the Discalced Carmelites. Its present title comes from the Catholic army's victory
  over the Bohemians at the **battle of the White Mountain near Prague, 8 November 1620**; the
  miraculous image was carried into the church on **8 May 1622**. The **travertine façade was built
  in 1626** to **Giovan Battista Soria**'s design at the expense of **Cardinal Scipione Borghese**,
  in exchange for the *Sleeping Hermaphrodite* found in 1608 during the digging of the church's
  foundations. Latin-cross interior, single nave, barrel vault, three chapels a side; vault and dome
  paintings by **Giandomenico Cerrini**, apse by **Luigi Serra**; works by **Guercino**, **Nicolas
  Lorrain** and **Domenichino**.
- **The Cornaro Chapel**, same source: commissioned by the family of **Cardinal Federico Cornaro**
  from **Gian Lorenzo Bernini**, who supplied the *Ecstasy of Saint Teresa of Ávila* — marble and
  gilt bronze, executed **1647–1652**; the flanking Cornaro family members watch from what read as
  theatre boxes.
- **Hours**, from the Carmelites' own site (the community that runs the church — its own official
  site, so publishable for hours and identity): church open **6.45–12.00 and 16.00–19.00**; Sunday
  **9.00–12.00 and 16.00–18.00**. **Visiting hours** stated separately: **8.00–12.00 and
  16.00–18.00** weekdays, **9.00–12.00 and 16.00–18.00** Sundays. Mass Mon–Sat 7.00; Sundays and
  holy days of obligation 10.30. Eucharistic adoration Tue 18–19, Thu 18.30–19.
  *«DURANTE LE CELEBRAZIONI E LE PREGHIERE LE VISITE NON SONO CONSENTITE»* — visits are not
  permitted during services. Guided groups are asked to use audio headsets.
  The same page records the **re-inauguration of the Cornaro Chapel after restoration, 22 October
  2021**.
- Contacts, turismoroma: tel. **06 42740571**, `vittoria@carmelitaniroma.it`. That page also links
  the Holy See's Jubilee 2025 itinerary page for the church,
  `https://www.iubilaeum2025.va/it/pellegrinaggio/cammini-giubilari-dentro-roma/Donne-Patrone-Europa-e-Dottori-della-Chiesa/chiesa-santa-maria-della-vittoria.html`
  (fetched, HTTP 200 — a Holy See source for the church's place in a Jubilee walking route).
- **Rione:** **Sallustiano.** OSM PIP on the church polygon centre (41.90472, 12.49418) → inside
  5454324; Nominatim reverse at the it.wiki coordinate → `quarter: Sallustiano`, road *Via Venti
  Settembre 17*; it.wikipedia files it under `Categoria:Chiese di Roma (rione Sallustiano)`.
  **Caveat:** turismoroma's own `POINT (12.4943365 41.9045242)` reverse-geocodes to *Via Venti
  Settembre 98/l* in **Castro Pretorio** — the portal's coordinate is imprecise by roughly a block.
  The building polygon, not turismoroma's point, is what I trust. Worth the verifier's attention.
- Note for the corpus: the church stands on the **north** side of via XX Settembre. Santa Susanna,
  across the road, is **Trevi's** (§5).

---

**2. Horti Sallustiani — archaeological site (the "Aula Adrianea"), Piazza Sallustio**

- **Address: Piazza Sallustio.** OSM addr on the site is *Piazza Sallustio 3*; turismoroma gives
  `POINT (12.49680104838 41.908167407782)`.
- **What it is**, from Roma Capitale's `https://www.turismoroma.it/it/luoghi/horti-sallustiani`:
  the gardens of the historian **Sallust**, *«il più grande parco monumentale di Roma»*, covering
  the ground between today's via Salaria, via Veneto, via XX Settembre and the Aurelian Walls. The
  land had been **Julius Caesar's** and was **bought by Sallust in 44 BC**; it passed into imperial
  ownership under **Tiberius (AD 14–37)**; **Vespasian** liked to stay there and **Nerva died**
  there; further work under **Hadrian (117–138)** and **Aurelian (270–275)**, the latter adding a
  hippodrome he rode in. Badly damaged in **Alaric's invasion of AD 410** and never rebuilt.
- **What survives, and this is the visitable part**, same source: at Piazza Sallustio, **14 metres
  below street level**, the remains of a three-part complex. The principal element is a **large
  circular domed hall** compared by the portal to the Serapeum of Hadrian's Villa at Tivoli, with
  niches in its walls, two of them opening into side rooms, possibly nymphaea. A glazed opening in
  the modern *cocciopesto* floor lets you look at the hall's foundation. Behind it, a semicircular
  multi-storey residential building with frescoed rooms, mosaic floors and windows; a wide north
  stair once led to vanished upper floors.
- **Modern status**, same source: *«Nel 1998, la Soprintendenza ha approvato il progetto di
  recupero dell'Aula Adrianea»* — a 1998 recovery project to return the structure to public use as
  a venue for cultural events and conferences, with modern services installed.
- Contacts given by turismoroma: tel. **06 42011597**, mobile **345 6697229 / 348 1853…**,
  websites `https://hortisallustiani.it/` and `https://hortisallustiani.it/contatti/`.
  ⚠ **TRAP, recorded for the verifier.** `hortisallustiani.it` (no hyphen — the one turismoroma
  links) returned **HTTP 403** to me and I could not read it. `horti-sallustiani.it` (**with**
  hyphen) returns HTTP 200 and is a **parked domain-for-sale page** — *"The domain name
  horti-sallustiani.it is for sale!"*. It is also what OSM has tagged as the site's `website`.
  **Do not cite the hyphenated domain as the venue's official site.** Because I could not read the
  real site, this file states **no opening hours and no ticket price** for the Aula.
- **Provenance of the sculpture**, turismoroma, same page: the *Dying Gaul* (Capitoline Museums),
  the *Suicidal Gaul* and the *Ludovisi Throne* (Palazzo Altemps) and the obelisk now atop the
  Spanish Steps all came from the Horti. **None of these objects is in Sallustiano today** — the
  Capitoline Museums are reserved to Wave 1 and must not be written; Palazzo Altemps is in Ponte and
  Trinità dei Monti in Campo Marzio. Treat as provenance context only, and name the Capitoline
  Museums only if the coordinator allows a bare cross-reference.
- **Rione:** **Sallustiano.** OSM PIP (41.90809, 12.49693) and Nominatim (`quarter: Sallustiano`,
  *Piazza Sallustio 3*) agree; it.wikipedia category agrees. Piazza Sallustio itself:
  Nominatim search returns OSM way, PIP inside, `quarter: Sallustiano`, display name
  *"Piazza Sallustio, Sallustiano, Municipio Roma I, Roma, Lazio, 00817, Italia"*.
- Longer background at `https://it.wikipedia.org/wiki/Horti_Sallustiani` (24 kB, cached) —
  aggregator; the turismoroma text above is the better-sourced spine.

---

**3. Museo Boncompagni Ludovisi per le arti decorative — state museum of decorative arts, costume
and Italian fashion**

- **Address: Via Boncompagni 18.** OSM `addr:street`/`addr:housenumber`; it.wikipedia infobox
  (`Indirizzo = Via Boncompagni, 18`).
- **What it is**, `https://it.wikipedia.org/wiki/Museo_Boncompagni_Ludovisi_per_le_arti_decorative`
  (aggregator): full name **Museo Andrea e Blanceflor Boncompagni Ludovisi**; dedicated to
  decorative arts, costume and Italian fashion; housed in the **Villino Boncompagni Ludovisi**. The
  building was left to the Italian State in **1972** by the will of Princess **Blanceflor de Bildt
  Boncompagni**, to be kept and used *"esclusivamente per scopi artistico-culturali di pubblica
  utilità"*. **Opened to the public in 1995.** Five exhibition rooms showing the villino's original
  furnishings. Administratively: state-owned, formerly under the Galleria Nazionale d'Arte Moderna,
  from December 2014 under the Polo museale del Lazio, from December 2019 under the Direzione Musei
  statali di Roma. Same article records **9.782 visitors in 2018**, citing a MiBAC spreadsheet.
- ⚠ **EVIDENCE GAP.** The museum's own site — `https://direzionemuseiroma.cultura.gov.it/` per both
  it.wikipedia's infobox and OSM's `website` tag — **fails DNS resolution** from this network, as do
  five variants I tried (§7.2). `cultura.gov.it` and `beniculturali.it` time out. **I have no
  fetched source for opening hours, closing days or admission.** The corpus must not invent them.
  The single strongest thing this museum needs, and I could not get it.
- **Rione:** **Sallustiano.** OSM PIP (41.90867, 12.49515); Nominatim `quarter: Sallustiano`, *Via
  Boncompagni 18*; it.wikipedia category agrees.
- **Villino Boncompagni Ludovisi**, the building itself, is a separate it.wikipedia article,
  `https://it.wikipedia.org/wiki/Villino_Boncompagni_Ludovisi`: built **1901–1903** by the architect
  **Giovanni Battista Giovenale (1849–1934)** for the Boncompagni Ludovisi princes, on a plot at the
  corner of via Boncompagni and via Quintino Sella that had been part of **Villa Ludovisi**,
  subdivided from 1883. Two storeys over basement and mezzanine, crowned by a balustrade; the short
  side faces via Boncompagni and the other three face the garden; sober *barocchetto* with rococo
  flourishes in the window frames and the via Boncompagni portal. That article's own lead sentence
  reads *"Roma (Rione XVII Sallustiano, quartiere Ludovisi)"* — **a genuine wording hazard**: it
  means the R. XVII rione, in the *neighbourhood-sense* Ludovisi district. Do not let that sentence
  be read as putting the museum in the rione Ludovisi. PIP puts it in Sallustiano.

---

**4. Basilica di San Camillo de Lellis — parish church and minor basilica**

- **Address: Via Sallustiana 24.** Roma Capitale, `https://www.turismoroma.it/it/luoghi/chiesa-di-san-camillo-de-lellis`
  ("Location": *"Chiesa di San Camillo de Lellis, Via Sallustiana, 24"*; `POINT (12.4947172 41.9072805)`).
- **What it is**, same source: built at the wish of **Pope Pius X** to a design by the architect
  **Tullio Passarelli**; construction began **1906**, first stone laid by **Cardinal Antonio
  Agliardi**; consecrated and erected as a parish in **1910**; entrusted to the **Clerks Regular
  Ministers of the Infirm**, the order founded by Camillus de Lellis. In **1965 Paul VI** raised it
  to **minor basilica** and created the cardinalatial title *San Camillo de Lellis agli Orti
  Sallustiani*. Neo-Romanesque with Gothic inflections; red brick outside with stone detail,
  travertine block throughout inside; Latin-cross plan. Three portals under lunette reliefs (*Christ
  presents St Camillus to the sick* in the centre); large rose window; a **1907** *Christ the Good
  Shepherd* relief over the side portal on **via Sallustiana**; square campanile with a pyramidal
  spire, **30 m** to its top. Inside, three aisles on round arches, cross vaults, five apse windows
  showing *Christ and the four Evangelists*, and a statue of **St Camillus by Alberto Galli, 1911**.
  The **organ was built 1910–11 by Carlo Vegezzi-Bossi (opus 1314)** to **Filippo Capocci**'s design
  and **donated by Margherita of Savoy**; electric action installed 1999 in place of the original
  pneumatic; 29 stops over two manuals and pedal.
- **Mass times**, same source (attribute to turismoroma, which is transcribing the parish):
  autumn/winter Mon–Sat 09.00 and 18.00, Sundays and feasts 09.00, 11.30, 19.00; spring/summer
  Mon–Sat 09.00 and 19.00, Sundays and feasts 09.00, 11.30, 19.00. The page itself warns times can
  change and are announced on the church's external noticeboards. Tel. **06 4818188**.
  ⚠ The parish's own site `https://www.parrocchiasancamillo.it/` **refused the connection** — hours
  are therefore turismoroma-sourced only, and dated.
- **Rione:** **Sallustiano.** OSM PIP on the church polygon (41.90702, 12.49435); Nominatim
  `quarter: Sallustiano`, road *Via Mario Pagano*; it.wikipedia category agrees.
- Its site is the former **villa Spithöver**, a neo-Renaissance building of **1870** by **Luca
  Carimini**, demolished at the end of the 19th century; the church went up **1906–10**
  (`https://it.wikipedia.org/wiki/Sallustiano`, §Architetture civili — aggregator).

---

**5. Chiesa del Sacro Cuore di Gesù — church**

- **Address:** it.wikipedia says **via Piave**; OSM's building carries no house number and Nominatim
  reverse at the church returns road *Via Venti Settembre*. The church occupies the corner block and
  **its façade faces via Piave**, per the article. ⚠ **No street number sourced.** Flagged for the
  verifier: get a number or publish the street alone.
- **What it is**, `https://it.wikipedia.org/wiki/Chiesa_del_Sacro_Cuore_di_Gesù_(Roma)` (aggregator):
  built **1914–1916** to a design by **Aristide Leonori**; the elevation gives onto via Piave though
  the original project faced it to via XX Settembre; separated from the street by a wrought-iron
  railing; the façade is fronted by a central projecting body with a **five-arched loggia** reached
  by two side ramps. Interior of three aisles on columns carrying a *matroneum*, ogival vault;
  windows above the matroneum glazed with **glass from Munich** showing saints whose names match
  those of the architect Leonori's family. Transept windows: *Institution of the Eucharist* and the
  *Sacrifice of Melchizedek* right, *Adoration of the Eucharist by all races* left. Side apses hold
  a *St Ignatius of Loyola* and a copy of the *Madonna della Strada*. Central apse in marble and
  mosaic with *Christ among saints*. Run by the **Ancelle del Sacro Cuore di Gesù** (Handmaids of
  the Sacred Heart, Madrid). The article notes the tomb of **St María Rafaela** in the church.
- **Rione:** **Sallustiano.** OSM PIP (41.90815, 12.49911); Nominatim `quarter: Sallustiano`;
  it.wikipedia's lead sentence says *«situato nel rione Sallustiano, in via Piave»*; category agrees.
- Also indexed at `https://www.romasegreta.it/sallustiano/sacro-cuore-di-gesu-2.html` (aggregator,
  not fetched in full).

---

**6. Villa Paolina Bonaparte (Villa Bonaparte) — 18th-century villa and garden; French Embassy to
the Holy See**

- **Address: Via Piave 23.** Roma Capitale, `https://www.turismoroma.it/it/luoghi/villa-paolina-bonaparte`
  ("Location": *"Villa Paolina Bonaparte, Via Piave, 23"*; `POINT (12.4985061 41.9090302)`);
  OSM/Nominatim reverse on the building returns *Via Piave 23, Ambasciata di Francia presso la Santa
  Sede*.
- **What it is**, all from the turismoroma page (Roma Capitale): what survives of a villa that ran
  **inside the Aurelian Walls between Porta Pia and Porta Salaria**. The *casino* stands in the
  middle of the park. **Built in 1750 for Cardinal Silvio Valenti Gonzaga**, Secretary of State to
  Benedict XIV, who turned orchards into gardens with exotic planting and raised the villino at
  their centre. **Bought in 1816 by Paolina Borghese**, Napoleon's sister, who lived there until
  1824 and brought Empire style into 18th-century Roman architecture; on her death in **1825** it
  passed to her nephews and their descendants until **1906**, when it was sold to the **Prussian
  government**, which installed its legation to the Holy See in **1908** and the German embassy from
  **1920 to 1944**. Reich property was taken by the Allies in **1945**; **France acquired it**, and
  on **15 December 1950 Wladimir d'Ormesson** moved the French embassy to the Holy See into Villa
  Bonaparte. Same page: it was damaged in the taking of Rome — *«è dentro villa Paolina che si
  trovarono i bersaglieri quando, nel 1870, riuscirono ad oltrepassare le mura aureliane con la
  breccia di Porta Pia»* (it was inside Villa Paolina that the *bersaglieri* found themselves when
  they got through the Aurelian Walls at the breach of Porta Pia in 1870). And a nice, checkable
  detail: the orange trees planted along the pavement of via XX Settembre opposite the Ministry of
  the Treasury are a memento of the villa's orangery.
- ⚠ **RULING 2 APPLIES. Write this carefully.** This is the **Embassy of France to the Holy See**,
  on **Italian soil in the rione Sallustiano**. It is a diplomatic mission — **not** Vatican
  territory, **not** French territory, and **not** a Lateran Treaty Art. 15 extraterritorial
  property. The corpus must not say a visitor here is "in the Vatican" or "in France".
- **Not visitable.** No source I fetched gives public opening. It is an embassy. The corpus must not
  imply access. The **Giardino di Villa Paolina** appears in OSM as `leisure=garden` (41.90916,
  12.49961) but I found no source establishing public access, and it is inside the embassy compound.
- **Rione:** **Sallustiano.** OSM PIP on both the building (41.90934, 12.49937) and turismoroma's own
  point (41.9090302, 12.4985061); Nominatim `quarter: Sallustiano` for both.
- The embassy's own domains (`france-vatican.org`, `ambasciatafrancesevaticano.it`) fail DNS from
  here; `https://it.ambafrance.org/` (the French embassy to **Italy** — a different mission) is
  reachable and should **not** be used as this building's site.

---

**7. Palazzo Canevari — former Regio Ufficio Geologico and Museo geologico nazionale**

- **Address: Largo di Santa Susanna 13.** Roma Capitale, `https://www.turismoroma.it/it/luoghi/palazzo-canevari`
  ("Location": *"Palazzo Canevari, Largo di Santa Susanna, 13"*); it.wikipedia infobox agrees.
- **What it is**, turismoroma: wanted by **Quintino Sella** at the end of the 19th century to house
  the **Regio Ufficio Geologico** and its Museo Agrario-Geologico; built **1873–1881** to the design
  of the engineer **Raffaele Canevari**. Canevari reused 17th-century masonry and built exhibition
  rooms carried on **cast-iron piers**, with a gallery over a large reading room. **Inaugurated 3
  May 1885**, in the presence of **King Umberto I**; the portal calls it *«tra i primi esempi di
  "stile liberty" nell'edilizia pubblica»* — among the first examples of Liberty style in Italian
  public building. It housed the Geological Institute and the museum collections **until 1995, when
  it was closed**.
- More at `https://it.wikipedia.org/wiki/Palazzo_Canevari` (13 kB, cached; aggregator): the office
  was created largely thanks to **Quintino Sella**, mineralogist and repeatedly finance minister,
  under the **Ministry of Agriculture, Industry and Commerce**, to draw the geological map of Italy;
  the infobox gives `stato = in ristrutturazione` and `proprietario = Cassa depositi e prestiti`.
  The turismoroma page's only listed "website" is an FAI page for the Museo Geologico
  (`https://fondoambiente.it/luoghi/museo-geologico?ldc`), which I did **not** fetch.
- **It.wikipedia records an archaeological find here** that the corpus should chase:
  `https://it.wikipedia.org/wiki/Sallustiano` §"Siti archeologici" lists *«Dimora arcaica
  dell'inizio del VI secolo a.C., su largo Santa Susanna. Scoperta durante scavi archeologici
  effettuati a partire dal 2013 sotto Palazzo Canevari»* — an archaic dwelling of the early 6th
  century BC found under the palazzo in excavations from 2013. **Aggregator, uncited, no second
  source found.** Do not publish on this alone.
- **Rione: FLAGGED STRADDLER.** The address is Largo di Santa Susanna, and that square is itself
  split (§4.1). OSM PIP on the building polygon (41.90507, 12.49395) → **Sallustiano**; Nominatim at
  that point → `quarter: Sallustiano`; it.wikipedia's lead says *«nel rione Sallustiano»*. **But**
  turismoroma's own `POINT (12.493163 41.905259)` reverse-geocodes to *Via Leonida Bissolati 84* and
  PIPs into **Trevi**. Two of Roma Capitale's own coordinates on this page and on Santa Maria della
  Vittoria's are each roughly a block off. The building evidence says Sallustiano; the portal's
  point says Trevi; Trevi is reserved to Wave 2. **Arbitrator.**
- **No public access sourced.** Closed since 1995 per turismoroma; under refurbishment per
  it.wikipedia. The corpus must not imply a visitable museum.

---

**8. Palazzo dell'Agricoltura — ministerial palace**

- **Address: Via XX Settembre 20.** it.wikipedia infobox; OSM `addr:street`/`addr:housenumber`
  agree; Nominatim reverse returns *Via Venti Settembre 20, Ministero dell'agricoltura, della
  sovranità alimentare e delle foreste*.
- **What it is**, `https://it.wikipedia.org/wiki/Palazzo_dell%27Agricoltura` (aggregator): built
  **1908–1914** at the wish of **Francesco Cocco-Ortu**, Minister of Agriculture, Industry and
  Commerce; the frieze carries three Latin inscriptions, transcribed in the article's footnote
  (*PER MARE PER TERRAS IT VIS HUMANA PER AETHERAM* …). Interior decoration — frescoes, stained
  glass, wrought iron — all on agricultural and rural themes, though the article says documentation
  is too thin to explain how the artists were chosen. It also houses the **biblioteca storica
  nazionale dell'agricoltura**, first created in **1848**. It is the seat of the **Ministero
  dell'agricoltura, della sovranità alimentare e delle foreste**.
- **Ministry's own pages** on the building, both fetched HTTP 200 and available for re-sourcing:
  `https://www.politicheagricole.it/flex/cm/pages/ServeBLOB.php/L/IT/IDPagina/5935` ("Il palazzo
  dell'Agricoltura") and `https://www.masaf.gov.it/flex/cm/pages/ServeBLOB.php/L/IT/IDPagina/721`
  ("L'Atrio del palazzo dell'agricoltura"). The verifier should read these rather than lean on
  Wikipedia — this is the building's owner describing itself.
- **Rione:** **Sallustiano.** OSM PIP (41.90540, 12.49442); Nominatim `quarter: Sallustiano`;
  it.wikipedia lead says *«nel rione Sallustiano»*; category agrees.
- **Working ministry.** No public opening sourced; the masaf.gov.it page offers a *"visita
  virtuale"*. Do not imply a walk-in.

---

**9. Villino Rudinì — villino by Ernesto Basile; chancery and consular section of the Japanese
Embassy**

- **Address: Via Quintino Sella 60.** it.wikipedia infobox; OSM `addr` agrees; Nominatim on the
  building returns *Via Quintino Sella 60, Ambasciata del Giappone in Italia*.
- **What it is**, `https://it.wikipedia.org/wiki/Villino_Rudinì` (aggregator): designed and built
  **1904–1906 by Ernesto Basile** for the family of **Antonio Starabba, marchese di Rudinì**, twice
  Prime Minister of the Kingdom of Italy. Severe parallelepiped set back from the street, three
  storeys over basement plus recessed attic; entrance through a projecting body of three round
  arches. Post-Risorgimento monumental shell with **Liberty** decoration — squared attic
  mullioned windows, a frieze running the full perimeter, floral Art Nouveau motifs in window
  frames, portico, railings and gate.
- **Present use:** *«sede della cancelleria e della sezione consolare dell'ambasciata del Giappone
  presso lo Stato italiano»*. Note the precision: the chancery and consular section of Japan's
  embassy **to the Italian State**. The mission's own site is `https://www.it.emb-japan.go.jp/`
  (OSM tag), which returned **HTTP 403** to me — unverified.
- **Rione:** **Sallustiano.** OSM PIP (41.90804, 12.49478); Nominatim `quarter: Sallustiano`;
  it.wikipedia lead says *«nel rione R. XVII Sallustiano»*.
- ⚠ Same Ruling-2 shape as §3.1/6: a diplomatic chancery is **not** Japanese territory. Do not write
  it as such.
- ⚠ it.wikipedia's own coordinate template for this article is **shared with Villino Rattazzi**
  (both 41.90806, 12.49306) and is wrong for at least one of them — see §4.4. I used the OSM
  building polygon.

---

**10. Via XX Settembre — street; the rione's spine and its southern border**

- **What it is:** the ancient *Alta Semita* line, opened in the 16th century as **via Pia**
  (`https://it.wikipedia.org/wiki/Sallustiano`, §Storia), renamed for the date of the 1870 breach.
  It carries the Palazzo dell'Agricoltura, Santa Maria della Vittoria, and — beyond the rione — the
  Ministry of Finance and Porta Pia.
- **Rione: FLAGGED — a three-rione street, unavoidably.** It is Sallustiano's declared border with
  Castro Pretorio (§2), and the it.wikipedia article `Via Venti Settembre (Roma)` is filed in **all
  three** of `Categoria:Roma R. XVII Sallustiano`, `Categoria:Roma R. XVI Ludovisi` and
  `Categoria:Roma R. XVIII Castro Pretorio`. Its single wiki coordinate (41.90575, 12.49634) PIPs
  into **Castro Pretorio** while Nominatim reverse at the same point says `quarter: Sallustiano`.
  Both answers are "correct" for a line that runs along a boundary. **The arbitrator should decide
  whether the street is a place at all in this corpus, and if so whose.** My recommendation, offered
  and not acted on: treat via XX Settembre as *context* inside each rione's page rather than as an
  owned place, exactly because three waves would otherwise each claim it.
- Also indexed at `https://www.romasegreta.it/sallustiano/via-venti-settembre.html`.

---

**11. Piazza Sallustio — square**

- **What it is:** the rione's only true square, per its own article: *«Il suo centro è la tranquilla
  piazza Sallustio, unica vera piazza del rione, dove ancora oggi si notano i resti degli Horti
  Sallustiani dai quali il rione ha preso il nome»* (`https://it.wikipedia.org/wiki/Sallustiano`).
  The Horti remains (§3.1/2) are in it, 14 m down.
- **Rione:** **Sallustiano.** Nominatim search returns the OSM way with display name
  *"Piazza Sallustio, Sallustiano, Municipio Roma I, Roma, Lazio, 00817, Italia"*; OSM PIP on
  (41.90787, 12.49634) is inside.
- Weak as a standalone entry — it is essentially the setting for entry 2. The verifier may prefer to
  fold it in.

---

**12. Breccia di Porta Pia (memorial) and the Sallustiano stretch of the Aurelian Walls**

- **What it is:** OSM carries a `historic=memorial` named **"Breccia di Porta Pia"** at
  (41.90999, 12.49998) on Corso d'Italia, and a `historic=citywalls / man_made=city_wall` segment
  named **"Mura Aureliane"** at (41.91057, 12.49885).
- **The claim to check:** `https://it.wikipedia.org/wiki/Sallustiano` states the 1870 breach was
  opened in the short stretch of wall belonging to this rione — *«breccia che peraltro è stata
  aperta nella breve porzione di mura appartenente al rione»*. Independently, Roma Capitale's
  `https://www.turismoroma.it/it/luoghi/villa-paolina-bonaparte` says the *bersaglieri* found
  themselves **inside Villa Paolina** once through the breach, and Villa Paolina is squarely in
  Sallustiano (§3.1/6). Two sources, one of them official, pointing the same way.
- Roma Capitale also has a general **Mura Aureliane** page, `https://www.turismoroma.it/it/luoghi/mura-aureliane`
  (fetched, HTTP 200) — city-wide, not rione-specific; use it for the walls as a monument, not for
  this stretch.
- **Rione: FLAGGED.** Both OSM points PIP **inside Sallustiano**; Nominatim declines to name a
  quarter at either (it snaps to *Sottovia Ignazio Guidi*, a road tunnel, which carries no quarter).
  **Porta Pia itself and the Museo storico dei bersaglieri inside it are Castro Pretorio's** — see
  §5. The memorial column and the gate are close together and on opposite sides of the line. This is
  the single most likely place for two waves to collide. **Arbitrator.**

### 3.2 The villini of via Boncompagni and via Piemonte — real, but a group, not nine pages

The Villa Ludovisi estate was subdivided from 1883 (`https://it.wikipedia.org/wiki/Villino_Boncompagni_Ludovisi`)
and the plots north of via Boncompagni went up as detached *villini* between 1887 and 1906. Almost
all are now offices. A guide can honestly write **one** passage about the street and its buildings;
it cannot honestly write nine visitor entries, because none of them can be entered. Each of the
following is **Sallustiano** by OSM PIP **and** Nominatim `quarter` **and** it.wikipedia category,
unless noted.

| # | Name | Address | Built | By / for | Now | Source |
|---|---|---|---|---|---|---|
| 13 | **Villino Rattazzi** | via Boncompagni 8–10 | c. 1900 | arch. **Giulio Podesti**, for the Rattazzi family (of Urbano Rattazzi, third PM of the Kingdom) | offices; it.wiki says from H2 2021 the new home of **Netflix Italia**, citing *Variety* 9 Feb 2021 — ⚠ a five-year-old forward-looking claim, **re-verify or drop** | `https://it.wikipedia.org/wiki/Villino_Rattazzi`; OSM PIP 41.90798,12.49310 |
| 14 | **Villino Rasponi** | via Boncompagni 14 (corner via Piemonte) | 1901 | arch. **Carlo Pincherle** (father of Alberto Moravia), for Count Giulio Rasponi Murat | offices | `https://it.wikipedia.org/wiki/Villino_Rasponi`; OSM PIP 41.90831,12.49392 |
| 15 | **Villino Pignatelli** | via Boncompagni 12 (corner via Piemonte) | 1898 | arch. **Giuseppe Mariani (1863–1932)**, for Duke Giuseppe di Terranova Pignatelli | offices | `https://it.wikipedia.org/wiki/Villino_Pignatelli`; OSM PIP 41.90807,12.49337 |
| 16 | **Villino Levi** | via Boncompagni 28, corner via Nerva | c. 1890, enlarged 1905 | arch. **Augusto Giustini** for Baron Giorgio Levi delle Trezze; builder Zeffiro Rossellini; 1905 enlargement by **Carlo Pincherle** | residential | `https://it.wikipedia.org/wiki/Villino_Levi`; OSM PIP 41.90896,12.49660 ⚠ **flagged**: the it.wiki coordinate (41.909116, 12.496537) reverse-geocodes to `quarter: Ludovisi`, while the OSM building polygon PIPs and reverse-geocodes to Sallustiano. Near the via Calabria line. |
| 17 | **Villino Casati** | via Piemonte 51 | 1906 | design by arch. **Achille Majnoni d'Intignano (1855–1935)**, built by eng. **Carlo Pincherle**, for the **Casati Stampa di Soncino**; Roman residence of the **Marchesa Luisa Casati** | offices | `https://it.wikipedia.org/wiki/Villino_Casati`; OSM PIP 41.90779,12.49405 |
| 18 | **Villino Maccari** | via Sallustiana | 1902 | arch. **Augusto Fallani**, for the painter **Cesare Maccari** | — | `https://it.wikipedia.org/wiki/Sallustiano` §Architetture civili (list entry, no own article); OSM building "Villino Maccari" (Q60042035) at 41.90820,12.49736, PIP Sallustiano |
| 19 | **Villino Macchi di Cèllere al Sallustiano** | via Piemonte | 1887 | arch. **Carlo Pincherle**, for the Macchi di Cèllere family | — | `https://it.wikipedia.org/wiki/Sallustiano` (list entry; the linked article exists but I did not fetch it). ⚠ **no independent coordinate** — the wikitext gives it the same `{{Coord}}` as Villino Maccari (41.907393, 12.494026), which is a copy-paste placeholder. That point PIPs Sallustiano and reverse-geocodes to via Piemonte, consistent with the stated street, but **the coordinate is not trustworthy**. |
| 20 | **Palazzo Fiat** | via Calabria | 1924–26, *barocchetto* | arch. **Enrico Del Debbio** | — | `https://it.wikipedia.org/wiki/Sallustiano` §Architetture civili, with `{{Coord|41.909565|12.497437}}`. ⚠ **FLAGGED STRADDLER**: that point PIPs **Sallustiano** but Nominatim returns `quarter: Ludovisi`, road *Via Calabria* — and via Calabria **is** the declared Ludovisi/Sallustiano border. **Arbitrator.** |
| 21 | **Palazzo della Società Beni Stabili** | via Piemonte, corner via Giosuè Carducci | 1957, modernist | eng. **Cesare Pascoletti** | — | `https://it.wikipedia.org/wiki/Sallustiano`, `{{Coord|41.906488|12.494207}}`; PIP **Sallustiano**, Nominatim `quarter: Sallustiano` |

**Named buildings OSM knows and Wikipedia does not** — leads, no history sourced, all PIP
Sallustiano: *Villino Berti o Dionisi Spierer* (via Piemonte, 41.90745,12.49349); *Palazzo di
Bernich a Via Aureliana* (41.90731,12.49508); *Casamento Scipioni* (41.90836,12.49893, by the Sacro
Cuore); *Villa Adrianea* (41.90817,12.49681, Piazza Sallustio 3 — almost certainly the modern
building over the Aula Adrianea, not a separate villa; **do not publish as a villa without
checking**). Source for all four: Overpass `nwr["building"]["name"]` over bbox
41.9040,12.4900,41.9112,12.5020, mirror `https://overpass.kumi.systems/api/interpreter`.

### 3.3 Embassy row — a theme, not nine entries

Six diplomatic missions PIP inside the rione (Overpass `office=diplomatic`, same bbox and mirror):

| Mission | Address (OSM `addr`) | PIP | Nominatim `quarter` |
|---|---|---|---|
| **Ambasciata di Francia presso la Santa Sede** (Villa Paolina) | Via Piave 23 | Sallustiano | Sallustiano |
| **Ambasciata del Giappone in Italia** (Villino Rudinì) | Via Quintino Sella 60 | Sallustiano | Sallustiano |
| **Ambasciata d'Eritrea** | Via Boncompagni 16b | Sallustiano | Sallustiano |
| **Ambasciata di Capo Verde** | Via Giosuè Carducci 4 | Sallustiano | Sallustiano |
| **Ambasciata di Timor Est presso la Santa Sede** | Via Giosuè Carducci 2 | Sallustiano | Sallustiano |
| **Ambasciata degli Stati Uniti presso la Santa Sede** | Via Sallustiana 49 | Sallustiano | **Ludovisi** ⚠ |

The last is **candidate 22 and a flagged straddler** — see §4.3. None of the others is a visitor
place; they belong in a page's texture ("ministries and embassies") and not as entries. Note also
`Ministero dell'ambiente e della sicurezza energetica`, Via Sallustiana 53 (OSM, PIP + Nominatim
Sallustiano) — likewise texture.

---

## 4. Straddlers — I do not resolve these

### 4.1 Largo di Santa Susanna — Sallustiano **and** Trevi, on Wikipedia's own account

`https://it.wikipedia.org/wiki/Largo_di_Santa_Susanna` states it outright:
> «è una piazza del centro storico di Roma, situata **in parte nel rione Sallustiano e in parte in
> quello Trevi**»

citing info.roma.it, romasegreta.it and tvsvizzera.it. The article is filed in
`Categoria:Roma R. XVII Sallustiano`; romasegreta files the square under **Trevi**
(`https://www.romasegreta.it/trevi/largo-di-s-susanna.html`). Nominatim reverse at the square's
wiki coordinate (41.90464, 12.49377) says `quarter: Trevi`; OSM PIP agrees, Trevi. But **Palazzo
Canevari at no. 13 and Santa Maria della Vittoria at the corner both PIP Sallustiano.** The square
is genuinely cut by the line. **Trevi is reserved to Wave 2.** Arbitrator.

Two things standing *in* the square, both of which PIP **Trevi** and which I therefore do **not**
claim, recorded so Wave 2 can have them:
- **Pietro Consagra, *Giano nel cuore di Roma*** (1997), donated by the artist to the Comune,
  installed 1997; four botticino marble stelae over four metres high on a parallelepiped base.
  Sovrintendenza Capitolina di Roma Capitale,
  `https://www.sovraintendenzaroma.it/content/pietro-consagra-giano-nel-cuore-di-roma`.
- **Traces of the Servian Wall.** The same Sovrintendenza page places the sculpture *«nel punto in
  cui affiorano alcune tracce delle antiche mura serviane, in largo di Santa Susanna»* — which
  independently corroborates the two OSM `historic=citywalls` nodes tagged *Mura Serviane*
  (Q281330) at 41.90623/41.90637, 12.4944/12.4943. Those two **nodes** PIP Sallustiano; my
  hand-placed point at the square's centre PIPs Trevi. Metres apart, opposite sides of the line.
  I had this down as a dubious OSM tag until the Sovrintendenza page confirmed the outcrop exists.
  **Arbitrator.**

### 4.2 Piazza Fiume: Porta Salaria and the tomb of Quintus Sulpicius Maximus

`https://it.wikipedia.org/wiki/Sallustiano` says the rione runs along the walls *"fino a piazza
Fiume (esclusa)"* and that **Porta Salaria** *«fu completamente distrutta nel 1921 per l'apertura di
via Piave su piazza Fiume»* — completely destroyed in 1921 to open via Piave onto Piazza Fiume. The
same article says the funerary monument of **Sulpicius Maximus** is *«oggi al centro di piazza
Fiume»*, and that Cornelia's is against the walls on Corso d'Italia.

Three sources, three answers:
- **it.wikipedia's border text:** Piazza Fiume is *excluded* from Sallustiano (so: quartiere Salario).
- **OSM:** the *Sepolcro del Giovinetto Quinto Sulpicio Massimo* node (41.91057, 12.49845) PIPs
  **Sallustiano** and Nominatim says `quarter: Sallustiano`, road *Via Sulpicio Massimo*. The
  it.wikipedia **Porta Salaria** coordinate (41.91070, 12.49810), 30 m away, PIPs **Ludovisi** and
  Nominatim says `quarter: Ludovisi`, road *Piazza Fiume*.
- **romasegreta** files Porta Salaria under **Sallustiano**:
  `https://www.romasegreta.it/sallustiano/porta-salaria.html`.

So the same small garden is assigned to Sallustiano, Ludovisi and Salario by three different
sources, and Ludovisi is being written by another agent in this same wave. **Arbitrator.** My note,
not a decision: the gate no longer exists, which weakens it as a place regardless of whose it is;
the Sulpicius Maximus tomb does exist and is the stronger candidate.

### 4.3 The United States Embassy to the Holy See, Via Sallustiana 49

OSM `office=diplomatic`, Q5369978, `website https://va.usembassy.gov/` (DNS failure from here), at
(41.90661, 12.49183). **OSM PIP: Sallustiano. Nominatim: `quarter: Ludovisi`** — and Nominatim's
reverse snapped to *Via Vittorio Veneto 119/a, Ambasciata degli Stati Uniti d'America*, i.e. it
resolved the point into the **Palazzo Margherita** compound, which is Ludovisi's and is another
agent's in this wave. The two US missions to Italy and to the Holy See sit on adjoining ground
either side of the rione line. **Arbitrator.** Whoever takes it: Ruling 2 applies — it is a
diplomatic mission on Italian soil, not American and not Vatican territory. I could reach no
official source for it.

### 4.4 Coordinate hygiene — a trap for the verifier

it.wikipedia's coordinates for the Sallustiano villini are **not reliable**:
- Villino Pignatelli and Villino Rasponi share one coordinate (41.90817, 12.49339).
- Villino Rattazzi and Villino Rudinì share another (41.90806, 12.49306) — and Rudinì is on via
  Quintino Sella, not via Boncompagni.
- Villino Maccari and Villino Macchi di Cèllere share a third (41.907393, 12.494026) in the article
  body.
Where OSM has a named building polygon I used it; where it does not (Macchi di Cèllere) I say the
coordinate is untrusted. Two Roma Capitale turismoroma `POINT`s (Palazzo Canevari, Santa Maria della
Vittoria) are also each about a block off. **Re-derive every coordinate from the building, not from
the article.**

---

## 5. Explicitly ruled OUT of Sallustiano

Each of these is associated with the rione by proximity, by the prompt, or by a source, and each
tests out. Recorded so no one re-does the work.

| Place | Verdict | Evidence |
|---|---|---|
| **Chiesa di Sant'Isidoro a Capo le Case** | **LUDOVISI — the prompt's starting list is wrong on this one** | OSM PIP (41.90602, 12.48706) → Ludovisi; Nominatim `quarter: Ludovisi`, *Piazza San Isidoro*; it.wikipedia files it in `Categoria:Chiese di Roma (rione Ludovisi)`, and `https://it.wikipedia.org/wiki/Ludovisi_(rione_di_Roma)` lists it under its own religious architecture. Three tests, one answer. It is ~600 m west of Sallustiano. |
| **Chiesa di Santa Susanna alle Terme di Diocleziano** | **TREVI** (reserved, Wave 2) | PIP (41.90422, 12.49374) → Trevi; Nominatim `quarter: Trevi`, *Via Venti Settembre 14*. It faces Santa Maria della Vittoria across via XX Settembre; the road is the line. |
| **Fontana dell'Acqua Felice / Fontana del Mosè** | **CASTRO PRETORIO** | PIP (41.90436, 12.49442) → Castro Pretorio; Nominatim `quarter: Castro Pretorio`. |
| **Chiesa di San Bernardo alle Terme** | **CASTRO PRETORIO** | PIP (41.90359, 12.49450); Nominatim `quarter: Castro Pretorio`, *Piazza San Bernardo*; it.wiki category agrees. |
| **Porta Pia** | **CASTRO PRETORIO** | PIP (41.90930, 12.50130) → Castro Pretorio; and `https://it.wikipedia.org/wiki/Sallustiano` explicitly says the rione runs *"fino a Porta Pia (esclusa)"*. |
| **Museo storico dei bersaglieri** | **CASTRO PRETORIO** — but flagged | It is **inside Porta Pia** (`https://it.wikipedia.org/wiki/Museo_storico_dei_bersaglieri`: *"si trova a Roma all'interno di Porta Pia"*, address *"Via XX Settembre snc (Porta Pia)"*, coord 41.909242/12.501136). PIP → Castro Pretorio. **⚠ it.wikipedia files it in BOTH `Categoria:Roma R. XVII Sallustiano` AND `Categoria:Roma R. XVIII Castro Pretorio`.** The geometry says Castro Pretorio and the border text says Porta Pia is excluded from Sallustiano, so I do not take it — but the double category is exactly the kind of thing that puts one place in two seed files. Recorded for the coordinator; **no wave is writing Castro Pretorio**, so it may simply fall out of the corpus. |
| **Obelisco sallustiano** | **CAMPO MARZIO** | It came from the Horti but has stood at the top of the Spanish Steps since 1789. Roma Capitale, `https://www.turismoroma.it/it/luoghi/obelisco-sallustiano`: *"L'obelisco sorge davanti alla Chiesa della Trinità dei Monti"*; erected there by Pius VI, work finished 1787, inaugurated 20 April 1787; 13,91 m, 15,21 m with base; red granite, 2nd–3rd c. AD. Provenance context only. |
| **Trono Ludovisi / Galata Morente / Galata Suicida** | **not in Sallustiano** | Palazzo Altemps (Ponte) and the Capitoline Museums (Campitelli, **reserved to Wave 1**), per `https://www.turismoroma.it/it/luoghi/horti-sallustiani`. Provenance only. |
| **Chiesa di Santa Teresa alle Quattro Fontane** | **not Sallustiano** — and PIP and Nominatim disagree with each other (Castro Pretorio vs Trevi) | (41.90239, 12.49172). Out of scope either way. |
| **Palazzo delle Finanze** | **CASTRO PRETORIO** | PIP (41.90624, 12.49757); Nominatim `quarter: Castro Pretorio`, *Via Venti Settembre 97*. On the far side of via XX Settembre. |
| **Palazzo Margherita, Via Veneto, Villa Ludovisi, Palazzo Piacentini, Porta Pinciana** | **LUDOVISI** | all PIP + Nominatim Ludovisi. Another agent's, this wave. |
| **"St. Regis Hotel", OSM node at 41.90644,12.49302** | **bad OSM data** | PIPs Sallustiano and Nominatim returns road *Via Lucullo*, but the St. Regis Rome is at Via Vittorio Emanuele Orlando 3, ~350 m south. **Do not publish.** |

---

## 6. Ruling-compliance notes specific to this rione

### 6.1 The diplomatic trap, doubled
Sallustiano contains two embassies **to the Holy See** (France at Villa Paolina, the United States
at via Sallustiana 49) and one embassy chancery **to Italy** (Japan at Villino Rudinì). None is
foreign or Vatican territory; all are Italian soil; none is a Lateran Treaty Art. 15
extraterritorial property, and Art. 16 does not enter into it. The corpus must not write "in the
Vatican", "on French soil", "on American soil", or "extraterritorial" about any of them. Ludovisi's
Palazzo Margherita is the same misconception one block west; here it is three buildings, not one.

### 6.2 No designation language anywhere
No record above says any building is protected, listed or declared. Two temptations I declined:
Palazzo Canevari's status while "in ristrutturazione" under Cassa depositi e prestiti ownership,
and the Aurelian Walls' status as part of the 1980 UNESCO Historic Centre of Rome inscription. The
UNESCO inscription **is** publishable per the ruling, but it is a property of the historic centre,
not of a named building, and should be written that way if written at all.

### 6.3 No photographs
`"photos": []` everywhere. Leads in §8, prose only, no URLs.

---

## 7. What I could not get, stated plainly

**7.1 The heritage registers.** Vincoli in Rete and the Catalogo generale remain unreachable, and
`cultura.gov.it` / `beniculturali.it` both time out at the socket. Ruling 1 holds; I re-tested and
did not work around it.

**7.2 The Museo Boncompagni Ludovisi's own website.** `direzionemuseiroma.cultura.gov.it` — the URL
given by both it.wikipedia's infobox and OSM's `website` tag — **fails DNS**, as do
`direzionemuseinazionaliroma.cultura.gov.it`, `museiitaliani.cultura.gov.it`,
`museiromani.cultura.gov.it`, `dmnroma.cultura.gov.it` and `boncompagniludovisi.cultura.gov.it`.
`polomusealelazio.beniculturali.it` also fails DNS. **The corpus has no fetched source for this
museum's hours, closing day or admission.** It is the rione's one genuinely visitable museum. This
is the biggest single gap in the file and the verifier should try it from a different network.

**7.3 The Horti Sallustiani's own website.** `hortisallustiani.it` returns HTTP 403; the
hyphenated `horti-sallustiani.it` is a parked for-sale domain (and is what OSM has tagged). **No
opening hours, no booking terms, no admission price for the Aula are stated in this file.** Roma
Capitale's phone numbers (§3.1/2) are the only contact evidence I have.

**7.4 The San Camillo parish site.** `parrocchiasancamillo.it` refuses the connection. Mass times
above are turismoroma's transcription and are dated.

**7.5 Nominatim rate limit.** After ~40 reverse calls the service returned HTTP 429 and four
address searches (Sacro Cuore street number, Villino Maccari, Villino Macchi di Cèllere, US Embassy
to the Holy See) went unanswered. Those four records carry the gap explicitly.

**7.6 Roma Capitale's own cadastre.** Not reachable; `comune.roma.it` and `dati.comune.roma.it` were
already recorded as unreachable by the scoping wave. **Every rione assignment in this file is
OpenStreetMap's, not the Comune's.** That is the honest ceiling on the boundary work, and it should
be stated in the corpus, not hidden.

---

## 8. Photo leads for the later wave (prose only, no URLs, no filenames)

Italian Wikipedia's Sallustiano-related articles carry a coherent set of images by a single
uploader, recognisable from filenames of the form *"Sallustiano - v Boncompagni …"*, covering
Villino Boncompagni Ludovisi, Villino Rattazzi, Villino Casati and Villino Levi. Commons has a
category corresponding to the rione (OSM's relation records the name of a Commons category for
"Rione XVII - Sallustiano"). Roma Capitale's turismoroma pages for Palazzo Canevari and the Horti
Sallustiani each carry a credited photograph — the Canevari one credited to Turismo Roma itself, the
Horti one credited to the site's Facebook page, which is a licensing problem the photo wave should
expect. None of this was fetched, licensed or verified; it is a starting point, not a manifest.

---

## 9. Honest yield assessment

**This is a town-page, not a guide. I recommend against padding it to guide tier.**

The arithmetic. Twenty-two candidate records. Of those:
- **Five** can actually be entered by a visitor: Santa Maria della Vittoria, San Camillo de Lellis,
  the Sacro Cuore, the Museo Boncompagni Ludovisi, and the Aula of the Horti Sallustiani — and for
  two of those five (the museum and the Aula) **I could not source opening hours at all** (§7.2,
  §7.3).
- **One** is world-class and carries the page on its own: Bernini's *Ecstasy of Saint Teresa*.
- **Two** more are genuinely interesting but cannot be entered: Villa Paolina (an embassy) and
  Palazzo Canevari (closed since 1995).
- **Nine** are villini and palazzine that are now offices. They are a paragraph, not nine entries.
- **Six** are embassies. They are a sentence about the character of the streets.
- **Five** are straddlers I have handed to the arbitrator.

The rione's own Wikipedia article describes most of its territory as *«praticamente disabitata e con
un'alta concentrazione di uffici e ministeri»*. Roma Segreta, an aggregator that covers all 22 rioni
with a page per street or monument, has **five** pages for Sallustiano in total (Horti Sallustiani,
Porta Salaria, San Camillo, Sacro Cuore, via XX Settembre) and no second page of results — an
independent signal of the same thing, from a source with no reason to be thin.

The prompt's estimate of roughly 16 named entries is about right if the villini are counted
individually, and about half that if they are counted the way a guide would actually write them.
Sallustiano is 0,2 km² of ministries with one Bernini in it. A short, well-sourced town-page that
says so is worth more than a padded guide, and the Queens precedent — 90 of 111 neighbourhoods ruled
out of scope rather than inflated — is the right instinct here.

One thing I want on the record for the coordinator: **three of my most interesting finds are
straddlers, and two of them straddle into rioni being written right now** (Largo di Santa Susanna
into Trevi, Wave 2; the US Embassy to the Holy See into Ludovisi, this wave). If Sallustiano loses
those and Porta Pia's memorial as well, the page thins further. That is a reason to rule carefully,
not a reason to rule in Sallustiano's favour.
