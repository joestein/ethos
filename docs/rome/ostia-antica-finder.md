# Ostia Antica (Z. XXXV, Roma Capitale toponymic code 435) — finder file

Finder pass, wave 4. **Not a shipping decision.** A verifier adjudicates each record and one
arbitrator rules ownership across all nine zones in this wave.

Unit type: **zona**, not rione and not quartiere. `Z. XXXV`. Zona urbanistica **13E**, Municipio
Roma X. `Q. XXXV` is Lido di Castel Fusano and is a different unit; nothing below is claimed for it.

---

## 0. Collision check against what is already shipped

`python3 .superpowers/taken_slugs.py` reports **786 places across 21 shipped files**.

Searched: `ostia`, `castello`, `giulio`. Results:

| query | matches |
|---|---|
| `ostia` | **0** |
| `castello` | 1 — `porta-castello-borgo-rome` (Porta Castello, rione Borgo). Not related. |
| `giulio` | 1 — `regola-per-me-giulio-terrinoni-rome` (a restaurant in Regola). Not related. |

The 21 shipped files are the historic core, the northern belt and San Saba/Testaccio. None of them
reaches beyond the Aurelian Walls, let alone 25 km down the Tiber. **No candidate below collides
with a shipped place.**

---

## 1. How the zona boundary was established

Three independent methods. They agree on every candidate except the four straddlers in §5.

**Method A — OSM boundary relation, tested locally.** Nominatim resolves `Ostia Antica` to three
objects; the one that matters is **OSM relation 5329140**, tagged

```
type=boundary  boundary=place  place=suburb
name="Ostia Antica"
official_name="Zona XXXV Ostia Antica"
ref="Z. XXXV"
wikidata=Q4994918  wikipedia=it:Ostia Antica
```

`rel(id:5329140); out geom;` on Overpass returns 15 members which stitch into **a single closed
outer ring of 204 vertices**. Bounding box: lat 41.74812–41.79803, lon 12.27820–12.33525 — roughly
5.5 km north-to-south and 4.7 km east-to-west, which is why "in Ostia Antica" is a weak locator and
every record below carries a street.

Candidates were ray-cast against that ring and a metric distance-to-nearest-edge computed alongside,
which is what surfaces the straddlers.

The second relation, **15824763**, is the archaeological area itself (`type=multipolygon`,
`historic=archaeological_site`, `archaeological_site=city`, `wikidata=Q1012797`,
`website=https://ostiaantica.cultura.gov.it/`), bbox lat 41.74870–41.75824, lon 12.27925–12.29786.
It sits wholly inside relation 5329140. That is the geometric statement that **the scavi are in
Z. XXXV**, and it is corroborated by prose (Method C).

- `https://nominatim.openstreetmap.org/search?format=jsonv2&q=Ostia+Antica+Roma&extratags=1&limit=15`
- `https://nominatim.openstreetmap.org/lookup?format=json&osm_ids=R5329140,R15824763&extratags=1`
- `https://overpass-api.de/api/interpreter` and `https://overpass.private.coffee/api/interpreter`
  (`rel(id:5329140,15824763); out geom;`)

**Method B — Nominatim reverse geocoding.** For this zona the useful field is not `quarter` (which
is empty everywhere here) but the **place level of `display_name`**, which returns literally
`Ostia Antica` for points inside and `Casal Palocco` / `Lido di Ostia` / `Isola Sacra, Fiumicino`
for points outside. 41 points were tested at 4 s spacing after two rate-limited passes.
B agrees with A on 39 of 41. The two disagreements are §5.1 and §5.4.
`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=…&lon=…&zoom=18&addressdetails=1`

**Method C — Italian Wikipedia's toponymic categories and the boundary prose.** `Categoria:Roma
Z. XXXV Ostia Antica` has nine article members: Ostia Antica, Bagnoletto, Basilica di Sant'Aurea,
Castello di Giulio II, Castrum (Ostia), Ponte della Scafa, Saline di Ostia, Stazione di Ostia
Antica, Strada statale 8 Via del Mare.
`https://it.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Categoria:Roma%20Z.%20XXXV%20Ostia%20Antica&cmlimit=500&format=json`

The boundary prose, from the zona article and from the neighbours' articles, reads:

> La zona confina: a nord-ovest con il comune di Fiumicino (separato dal fiume Tevere, dal ponte
> Tor Boacciana al canale dei Pescatori) · a est con la zona Z. XXXII Acilia Nord · a sud-est con
> la zona Z. XXXIV Casal Palocco (separata dalla via del Mare) · a sud con il quartiere Q. XXXIII
> Lido di Ostia Ponente (separato da via di Tor Boacciana, da via Ostiense al ponte Tor Boacciana).

`https://it.wikipedia.org/w/api.php?action=parse&page=Ostia%20Antica&prop=wikitext&format=json`
and the same call for `Lido di Ostia Ponente`, which states the reciprocal boundary as
"via di Tor Boacciana e via Guido Calza, dal Ponte di Tor Boacciana a via Ostiense".

**Method D — what the site operator itself says.** The Parco archeologico di Ostia antica publishes
its own address as **Viale dei Romagnoli 717, Ostia antica – Roma**, and Roma Capitale's tourist
office publishes the borgo/castle address as **Piazza della Rocca**. Both are inside the ring.
`https://ostiaantica.cultura.gov.it/info-visita/scavi-di-ostia-e-museo-ostiense/` ·
`https://www.turismoroma.it/it/luoghi/il-borgo-di-ostia-antica-e-il-castello-di-giulio-ii`

**Municipio.** Unlike the quartieri in this wave, the Municipio *is* stated for this zona by a
source: it.wikipedia's zona article gives `circoscrizione = Municipio Roma X`, and Roma Capitale's
own zona-urbanistica prose gives 13E in Municipio Roma X. Nominatim independently returns
`Municipio Roma X` as the suburb for every point tested. A page may state Municipio X here.

---

## 2. Inventory completeness — how the candidate list was built

Four sweeps, none of which is a "search for interesting things":

1. **Overpass, every named node plus every named building/historic/tourism/leisure way** in a box
   covering the borgo and the whole excavation (41.7460–41.7700, 12.2740–12.3150). Returned
   **358 named objects**, of which **318 fall inside the zona ring**. Of those 318, roughly 70 are
   on-site interpretive panels (`tourism=information`), 15 are bus-stop platforms and 15 are
   marble-sample display plinths inside the scavi. Everything else is listed or rejected below.
2. **A second Overpass pass** for amenities/shops/tourism over the borgo only, to catch the
   commercial layer (71 objects).
3. **The Parco's own sitemap**, `https://ostiaantica.cultura.gov.it/sitemap.xml`, 392 URLs. This is
   the authoritative monument inventory: the `pannelli-didattici-e-mappe/` tree carries **about 85
   per-monument didactic panels** grouped into nine named districts of the ancient city, plus the
   `siti-musei/` tree with the seven institute sites. Every panel is a fetchable page with dates,
   patrons and function.
4. **it.wikipedia's `Elenco degli edifici di Ostia (città antica)`** and its per-regio children,
   which list every excavated block by its Regio/Insula/number. This is where the ceiling is:
   the article states that as of 1980 the excavation had produced **22 domus and 228 insulae and
   caseggiati**. Nobody writes a guide to 250 apartment blocks. The panel set is the honest filter.

**Yield judgement is in §7.** Short version: this is not a thin outer unit. It is the opposite
problem from the one the brief warned about.

---

## 3. Candidates — the archaeological park

Unless noted, all of these lie **inside the fenced area archeologica**, entered from the ticket
office at **Viale dei Romagnoli 717, 00119 Roma**, and are visitable on the park's own ticket.
Kind for all of them under the thirteen the schema allows: **historic-site**, except where marked.

### 3.0 The park itself

**Parco archeologico di Ostia antica — Scavi di Ostia** · attraction or historic-site
- Address: Viale dei Romagnoli 717, 00119 Roma. Ticket office at 41.75832, 12.29774 (OSM
  `shop=ticket`, `phone=+39 06 5635 8099`).
- What: the excavated remains of the Roman town at the mouth of the Tiber. The park's own text:
  the name is from *ostium*, "mouth"; tradition credits the foundation to Ancus Marcius in 620 BC
  to work the salt pans, but the oldest remains yet known are the tufa-block *castrum* of the
  second half of the 4th century BC. Walls of about the mid 1st century BC enclosed roughly 69 ha
  with three gates. Population estimates around 50,000 in the 2nd century AD. Commerce moved to
  Portus from the mid 3rd century; literary sources describe the town abandoned by the mid 6th.
  The Tiber ran along the north side of the town until the 1557 flood; the coastline is now about
  4 km away.
- Institute: an autonomous institute of the Ministero della cultura created 23 January 2016;
  director Alessandro D'Alessio since 30 October 2020.
- Hours (operator's own page, fetched): open Tue–Sun and public holidays, opening 08:30; closing
  16:30 (25 Oct–end Feb), 17:15 (1–31 Mar), 19:00 (1 Apr–30 Sep), 18:30 (1–24 Oct). Last entry one
  hour before closing; ticket office closes one hour before. Closed Mondays and 25 December.
  Phone 06 39967950.
- Tickets: integrated ticket **€18** full, **€2** reduced (EU 18–25), valid 8 consecutive days
  across all the institute's sites; free first Sunday of the month. Audioguide €7 long route,
  €5 short, €5 kids. Guided visits are run by the concessionaire CoopCulture.
- Sources: `https://ostiaantica.cultura.gov.it/siti-musei/scavi-di-ostia-e-museo-ostiense/` ·
  `https://ostiaantica.cultura.gov.it/info-visita/scavi-di-ostia-e-museo-ostiense/` ·
  `https://cultura.gov.it/luogo/parco-archeologico-di-ostia-antica-area-archeologica-di-ostia-antica`
  (MiC: address, `Viale dei Romagnoli 717 – 00119`, tel +39 06 56358099, mail pa-oant@cultura.gov.it) ·
  `https://it.wikipedia.org/wiki/Parco_archeologico_di_Ostia_antica`
- **Do NOT publish** the "273,638 visitors in 2023" figure from the brief unless the verifier finds
  a source. `statistica.cultura.gov.it` serves only a JS dashboard; no fetchable table carries it.

**Museo Ostiense** · **museum**
- Inside the excavation, in the **Casone del Sale**, 41.75555, 12.28771 (OSM names the building
  `Antiquarium di Ostia Antica`, `wikidata=Q3867725`).
- What: a 16th-century building tied to the papal salt monopoly, known as the Casone del Sale from
  the 15th century. Restored 1865–67 for Pius IX to serve as a museum, which is when the neoclassical
  façade was built. The Ostian collections were displayed in the Castello di Giulio II until the
  1930s; the museum was inaugurated 2 November 1934 under excavation director Guido Calza. Partial
  extension 1952, major redisplay 1962. Re-presented in **12 rooms** on **7 themes**: origins and
  the republican age, imperial power, civic spaces, the people, religions and cults, the necropoleis,
  ways of living. Named exhibits with sourced attributions: the Vittoria Alata from the attic of
  Porta Romana; the statue of Cartilio Poplicola; fragments of the *Fasti Ostienses*; the Mithras
  Tauroctonos from the Mitreo delle Terme del Mitra, signed by the Athenian artist **Kriton**; the
  statue of Trajan from the Schola del Traiano; the Erma of Themistocles; the statue of Iulia
  Procula and the Sarcofago delle Muse.
- Hours (operator): open Tue–Sun; opens 09:30 (1 Apr–24 Oct) or 10:30 (25 Oct–31 Mar); last entry
  15:00/15:45/17:30/17:00 by season. Always closed on the free first Sunday of the month and on the
  other MiC free days (25 April, 2 June, 4 November).
- Sources: `https://ostiaantica.cultura.gov.it/siti-musei/scavi-di-ostia-e-museo-ostiense/il-museo-ostiense/` ·
  `https://ostiaantica.cultura.gov.it/pannelli-didattici-e-mappe/larea-centrale-e-i-complessi-di-rappresentanza/museo-casone-del-sale/` ·
  hours from the info-visita page above.
- **Source conflict, flagged:** the MiC *Luoghi della Cultura* page for the area archeologica says
  flatly "Il Museo Ostiense non è aperto al pubblico" (page last updated 2025-08-06), while the
  Parco's own 2026 pages publish museum opening hours. The operator's own site should win, but the
  verifier should decide, and the record must not narrate the conflict.

### 3.1 The theatre district

**Teatro romano di Ostia** · **theater** — 41.75582, 12.29139, `wikidata=Q3982370`
- Built in the last years of the 1st century BC, attested by an inscription naming **Agrippa**,
  Augustus's son-in-law; enlarged at the end of the 2nd century AD to hold **4,000** spectators.
  An arch in honour of Caracalla was thrown across the Decumanus at the entrance in **216 AD**.
  A marble parapet was later built to isolate the cavea from the orchestra during water shows.
- Still in use: the **Teatro Ostia antica Festival — Il senso del passato**, run by the Teatro di
  Roma; second edition 25 June – 18 July 2026, four productions (Terzopoulos, Peltekis, Preljocaj,
  Dini). Holders of a festival ticket got park entry at €14 instead of €18 (that promotion is dated
  to 31 October 2025 on the park's page — check currency before publishing).
- `https://ostiaantica.cultura.gov.it/pannelli-didattici-e-mappe/larea-del-teatro/teatro/` ·
  `https://ostiaantica.cultura.gov.it/teatro-ostia-antica-festival-il-senso-del-passato-il-teatro-di-roma-torna-in-scena-a-ostia-antica/` ·
  `https://www.turismoroma.it/it/luoghi/teatro-romano-di-ostia-antica`

**Piazzale delle Corporazioni** — 41.75636, 12.29102, `wikidata=Q392878`
- Laid out with the theatre in the Augustan age, given porticoes only under Claudius (mid 1st
  century AD). A high-podium temple with two Corinthian columns was raised at the centre towards
  the end of the 1st century AD; the dedicatee is not identified. The portico was doubled and the
  first floor mosaics laid in the first half of the 2nd century AD, later remade as the space was
  divided into *stationes*. The mosaics carry trading motifs and inscriptions naming Ostian and
  foreign guilds of merchants and shipowners.
- `https://ostiaantica.cultura.gov.it/pannelli-didattici-e-mappe/larea-del-teatro/piazzale-delle-corporazioni/`
- Access note worth publishing: MiC states the Piazzale is reachable from the ticket office and is
  fully passable by wheelchair.

**Grandi Horrea** — 41.75544, 12.28939
- Traditionally dated to Claudius (41–54 AD), with recent work proposing a first phase in the 1st
  century BC. Colonnaded tufa courtyard with *cellae* on three sides; wholly rebuilt in brick
  between the end of the 2nd and start of the 3rd century AD, when two further rows of *cellae*
  were added in the courtyard, a first floor built, and all the floors raised on *suspensurae* to
  keep the grain dry.
- `https://ostiaantica.cultura.gov.it/pannelli-didattici-e-mappe/larea-del-teatro/grandi-horrea/`

**Quattro Tempietti** — 41.75570, 12.29066
- Four near-identical temples on one platform, probably built about the middle of the 1st century
  BC by the magistrate **Publio Lucilio Gamala**; an inscription found at Portus names them as the
  temples of Venus, Fortuna, Ceres and Spes. A mosaic inscription in the westernmost names the
  duovir **Caio Cartilio Poplicola** (late 1st century BC).
- `https://ostiaantica.cultura.gov.it/pannelli-didattici-e-mappe/larea-del-teatro/quattro-tempietti/`

**Domus di Apuleio** — 41.75583, 12.29076, `wikidata=Q116221293`. Panel exists under
`larea-del-teatro/domus-di-apuleio/` (not fetched in this pass).

### 3.2 The forum and the civic centre

**Foro di Ostia** — the crossing of cardo and decumanus at the centre of the old *castrum*. Laid
out under Augustus, transformed under Hadrian; long and narrow, flanked by porticoes.
`https://ostiaantica.cultura.gov.it/pannelli-didattici-e-mappe/larea-centrale-e-i-complessi-di-rappresentanza/`

**Capitolium** — 41.75446, 12.28799, `wikidata=Q1728612`
- The town's principal temple, to the Capitoline triad, raised under Hadrian **about 120 AD** on
  the north side of the Forum, over an earlier 1st-century-BC cult building.
- `…/larea-centrale-e-i-complessi-di-rappresentanza/capitolium/`

**Tempio di Roma e Augusto** — south side of the Forum, in axis with the Capitolium. Perhaps built
while Augustus was still alive (early 1st century AD). Substructures survive plus marble
architectural elements, including the rear pediment and a flying Victory, re-mounted on a modern
wall beside the building. `…/larea-centrale-e-i-complessi-di-rappresentanza/tempio-di-roma-e-augusto/`

**Basilica (Ostia)** — built between the end of the 1st and the start of the 2nd century AD for
justice and business; monumental entrance from the Decumanus, marble columns and floor, the judges'
podium still visible at the far end; linked to the Forum by a double portico with a frieze of
cupids and festoons. `…/larea-centrale-e-i-complessi-di-rappresentanza/basilica/`

**Cd. Curia** — brick, late 1st / early 2nd century AD, six-column pronaos and a cella. Traditionally
the meeting hall of the decurions; the panel says the finding of fragments of the lists of the
*Seviri Augustales* in or beside it makes the college of the Seviri more probable. One list is
dated 228 AD. `…/larea-centrale-e-i-complessi-di-rappresentanza/cd-curia/`

**Terme del Foro** — 41.75384, 12.28950, `wikidata=Q16253542`
- Built **about 160 AD** by **Marco Gavio Massimo**, praetorian prefect of Antoninus Pius. Major
  4th- and 5th-century remodelling including a monumental entrance on Via della Forica. Octagonal
  *heliocaminus*, *laconicum*, warm and hot rooms all turned south for the sun.
- Adjacent **latrina (forica)** and **palestra** have their own panels.
- `…/larea-centrale-e-i-complessi-di-rappresentanza/terme-del-foro/`
- **Trap:** the panel calls these "le più grandi della città". That is a superlative and is banned
  even attributed. Publish "built about 160 AD by Marco Gavio Massimo" and stop.

**Tempio Rotondo** — 41.75399 area, first half of the 3rd century AD, on a site previously occupied
by a square reached from the Basilica. Niched precinct, domed cella, two spiral stairs one of which
is well preserved. Colossal heads of Severan emperors found nearby suggest imperial cult; portraits
of Gordian III and Severus Alexander went to the Museo Nazionale Romano.
`…/larea-centrale-e-i-complessi-di-rappresentanza/tempio-rotondo/`

**Tempio di Ercole and the republican sacred area** — 41.75377, 12.28617, `wikidata=Q107081445`
- Raised between the end of the 2nd and the start of the 1st century BC on a high podium with a
  six-column pronaos. A copy of the votive statue of Cartilio Poplicola stands in the pronaos. A
  marble relief dedicated by a *haruspex* shows a statue of Hercules recovered from the sea and a
  divinatory scene; restorations are documented into the 4th century AD. The remains were identified
  in **1794**. The same precinct holds the Tempio tetrastilo, the Aula delle Are and the Tempio
  dell'Ara rotonda. `…/larea-centrale-e-i-complessi-di-rappresentanza/tempio-di-ercole/`

**Horrea Epagathiana et Epaphroditiana** — 41.75448, 12.28700
- Brick warehouse of about the mid 2nd century AD. The surviving doorway inscription names the
  owners **Epagathus and Epaphroditus**, probably two freedmen of Greek origin. Yellow-and-red brick
  portal, mosaic-paved colonnaded court with two aediculae for statuettes of Fortuna and Venus,
  sixteen rooms, at least two storeys, and a double entrance door which has been read as evidence
  it stored valuable goods.
  `…/larea-centrale-e-i-complessi-di-rappresentanza/horrea-epagathiana-et-epaphrodithiana/`

**Casa di Diana** — 41.75493, 12.28879, `wikidata=Q106813831`
- Hadrianic apartment block (first half of the 2nd century AD), perhaps originally five storeys,
  with shops on the street and a porticoed central courtyard. Black-and-white geometric mosaics
  from the first phase; a marble fountain added to the courtyard in the second half of the 2nd
  century; the surviving wall paintings at the end of that century; floors raised and re-mosaiced
  through the 3rd century; a **mithraeum** installed in the inner rooms in the late phase.
  `…/larea-centrale-e-i-complessi-di-rappresentanza/casa-di-diana/`

**Thermopolium di Via di Diana** — 41.75461, 12.28853
- A tavern-with-wine-counter carved in the 3rd century AD out of a Hadrianic block. Three street
  entrances with seats under segmental-arched balconies on corbels; a marble serving counter with
  shelves and washing basins; still-life paintings above the shelves advertising what was served; a
  kitchen with a *dolium* sunk in the floor to keep food cool; a rear courtyard with a small
  fountain and masonry benches for eating outside.
  `…/larea-centrale-e-i-complessi-di-rappresentanza/thermopolium-di-via-di-diana/`

**Insula di Giove e Ganimede** (in the Caseggiato dei Dipinti) — Hadrianic (117–138 AD), remodelled
at the end of the 2nd century AD when the reception room was raised through two storeys and painted.
A graffito in one room dates to Commodus (180–192 AD).
`…/larea-centrale-e-i-complessi-di-rappresentanza/insula-di-giove-e-ganimede/`

**Molino del Silvano** — 41.75513, 12.28894. A bakery built about 120 AD and destroyed by fire at
the end of the 3rd century AD: six shop fronts, basalt-paved milling and kneading rooms with lava
querns and stone basins, a corner oven, and — in a rear passage converted in the 3rd century — a
shrine of Silvanus. Directly across the street from the Grandi Horrea.
`…/larea-centrale-e-i-complessi-di-rappresentanza/molino-del-silvano/`

**Castrum repubblicano** — the 4th-century-BC fortified nucleus, tufa-block walls and four gates at
the ends of cardo and decumanus. `…/larea-centrale-e-i-complessi-di-rappresentanza/castrum-repubblicano/`
it.wikipedia has a standalone article, `Castrum (Ostia)`, and that article is one of the nine
members of `Categoria:Roma Z. XXXV Ostia Antica`.

**Also panelled here, lower priority:** Piccolo Mercato, Caseggiato dei Dolii, Caseggiato del
Larario, Caseggiato dei Triclini e Foro della Statua Eroica, Terme di Buticoso, Area sacra
repubblicana, Cd. Sacellum dei Lares Augusti, Mensola della Sinagoga.

### 3.3 The river-service quarter

**Terme di Nettuno** — 41.75648, 12.29244
- Created at the end of the 1st century AD, rebuilt by Hadrian (117–138) and completed in **139 AD**
  by Antoninus Pius. Two rooms with figured mosaics, then the vaulted *frigidarium* with basins and
  mosaic floor, two *tepidaria* and a *calidarium*; a colonnaded palestra on the west; flats with
  their own entrances on the upper floors. Restored into the 4th century AD.
- `https://ostiaantica.cultura.gov.it/pannelli-didattici-e-mappe/larea-a-servizio-del-fiume/terme-di-nettuno/`
  and a separate mosaics panel at `…/terme-di-nettuno-i-mosaici/`

**Caserma dei Vigili** — 41.75699, 12.29204, `wikidata=Q3661716`
- Built at the end of the 1st century AD when a standing cohort of *vigiles* was stationed at
  Ostia; the visible layout is the Hadrianic rebuild. At least two storeys around a porticoed
  courtyard with fountain-troughs; a chapel of the imperial cult on the far side, monumentalised in
  the early 3rd century AD; a corner latrine with an aedicula of Fortuna.
- `…/larea-a-servizio-del-fiume/caserma-dei-vigili/`

**Terme dei Cisiarii** — 41.75756, 12.29498, `wikidata=Q114639153`. First half of the 2nd century
AD, probably the guild baths of the *cisiarii* (cart drivers). The *frigidarium* keeps its original
mosaic showing two circuits of city walls with marine scenes and scenes of carters' life inside;
a wooden *noria* raised groundwater for the baths. `…/larea-a-servizio-del-fiume/terme-dei-cisiarii/`

**Mura repubblicane and Porta Romana** — 41.75739, 12.29575, `wikidata=Q107085780`
- The walls were built about the middle of the 1st century BC on three sides of the town, enclosing
  about **69 hectares**, with three gates flanked by square towers. Porta Romana, the entrance from
  the Via Ostiense, had two bays; marble facing survives in part. The attic inscription — recorded
  on both faces — records that the Senate and People of Rome decreed the walls of the Ostian colony,
  that **M. Tullius Cicero** began and let the contract, and that **P. Clodius Pulcher**, tribune of
  the plebs, completed and approved it. The flanking Minerva-Victory statues: one original in the
  Museo Ostiense, a copy in the piazzale.
- `…/larea-a-servizio-del-fiume/mura-repubblicane-porta-romana/`

**Also panelled here:** Horrea di Ortensio e dell'Artemide, Insula del Soffitto dipinto, Terme delle
Province, Cippi di Caninio, Magazzini Repubblicani e Caseggiato del Cane Monnus, Fontana di via
della Fontana.

### 3.4 The market quarter

**Schola del Traiano** — 41.75240, 12.28696, `wikidata=Q114637664`
- Read as the seat of the *collegium* of the *fabri navales* (shipbuilders). Traditionally dated to
  the 2nd century AD; recent work proposes the 3rd. Columned exedra front, vestibule with niched
  side rooms, one of which held the statue of **Trajan** now in the Museo Ostiense; a large
  colonnaded court with a central basin; a banqueting hall and reception rooms inserted later with
  marble-inlay floors and painted marble-imitation walls. It sits over earlier houses, the oldest —
  the **Domus dei Bucrani** — of the 1st century BC. Reopened at the Natale di Roma, 2022.
- `https://ostiaantica.cultura.gov.it/pannelli-didattici-e-mappe/il-quartiere-dei-mercati/schola-del-traiano/`

**Cd. Macellum e tabernae dei pescivendoli** — 41.75344, 12.28708
- Read traditionally as a meat market, though the panel says recent work has reopened the question.
  Walls mostly of the mid 2nd century AD; the floor and central basin, the colonnaded podium and
  the niched front are 4th century, in reused marble. Two shops with sales counters and marble tanks
  were carved beside the entrance in the first half of the 3rd century AD; the left one keeps a
  mosaic of a dolphin biting a fish with the inscription **INBIDE TE CALCO** ("envious one, I tread
  on you"). `…/il-quartiere-dei-mercati/cd-macellum-e-tabernae-dei-pescivendoli/`

**Cd. Basilica Cristiana** — 41.75297, 12.28642, `wikidata=Q810067`
- Traditionally read as a Christian cult building because of the chi-rho on an inscribed architrave;
  the panel says it is probably a *domus* of the late 4th century AD, perhaps of the Tigriniani
  family, built over an earlier shop range, an alley and a bath. Two long aisles divided by a
  colonnade, both ending in apsed rooms.
  `…/il-quartiere-dei-mercati/cd-basilica-cristiana/`

**Caupona di Alexander e Helix** — 41.75110, 12.28561. Occupies one of the two towers of Porta
Marina after the gate fell out of use. `…/il-quartiere-dei-mercati/caupona-di-alexander-e-helix/`

**Also panelled here:** Tempio dei Fabri Navales, Fontana con lucerna.

### 3.5 The middle- and upper-class residential quarters

**Terme dei Sette Sapienti** — 41.75321, 12.28515, `wikidata=Q2419840`
- Probably Hadrianic (117–138 AD). Named from a painting of the Seven Sages decorating a room that
  was probably a tavern before it was absorbed as a changing room. Circular domed *frigidarium* with
  a hunting mosaic; a second *frigidarium* keeps a painted Venus Anadyomene of the early 3rd century
  AD. `…/i-quartieri-residenziali-della-classe-medio-alta/terme-dei-sette-sapienti/`

**Caseggiato degli Aurighi** — 41.75301, 12.28505, `wikidata=Q107095409`
- Built about **140 AD**, slightly later than the rest of its block. Named from paintings of two
  charioteers on bigae with palm and victory crown in the corridor linking it to the Terme dei
  Sette Sapienti. Double portico on Via degli Aurighi; rental flats and service rooms on several
  floors round a large courtyard; painted decoration from more than one phase survives.
  `…/i-quartieri-residenziali-della-classe-medio-alta/caseggiato-degli-aurighi/`

**Case a Giardino** — 41.75197, 12.28466
- Built about **130 AD** in one planned operation: an outer quadrilateral and two symmetrical
  central blocks separated by a garden with **six fountains**. At least three storeys, external
  stairs to the upper flats, which were generally let.
  `…/i-quartieri-residenziali-della-classe-medio-alta/case-a-giardino/`

**Serapeo** — 41.75330, 12.28378
- Built at the expense of the freedman **Caltilius** and inaugurated **24 January 127 AD**, on
  Hadrian's birthday. Colonnaded entrance added later in the 2nd century, paved with a mosaic of
  the Apis bull; a porticoed court with a central altar and a Nilotic mosaic; the temple itself on a
  podium with a four-column pronaos and coloured-marble paving; the inscription *IOVI SERAPI* kept
  in the courtyard. `…/i-quartieri-residenziali-della-classe-medio-alta/serapeo/`

**Terme del Mitra and the Mitreo delle Terme del Mitra** — 41.75410, 12.28536 / 41.75425, 12.28512,
`wikidata=Q1939738`
- Private baths of the Hadrianic age (117–138 AD). Mosaic of Ulysses and the Sirens in the
  *frigidarium*; a service room held the *noria* that raised groundwater. An outside stair leads to
  a basement service space in which a **mithraeum** was installed: the *podia* survive, and the cast
  of the Mithras-slaying-the-bull group stands where the original — now in the Museo Ostiense —
  stood. `…/i-quartieri-residenziali-della-classe-medio-alta/terme-del-mitra/`

**Cd. Palazzo Imperiale** — 41.75387, 12.28147, `wikidata=Q104876336`
- North-west sector, near the Tiber. Visible fabric of the Antonine and Severan period, main phases
  **145–150** and **190–200 AD**, over earlier structures. The panel says the reading as an imperial
  residence is now excluded, but a lead *fistula* bearing the name of **Matidia**, Trajan's niece,
  and the richness of the decoration point to a direct link with the imperial family. Its own
  mithraeum produced the bases and statues of Cautes and Cautopates.
- **Straddler-adjacent, see §5.4.**
- `…/i-quartieri-residenziali-della-classe-medio-alta/cd-palazzo-imperiale/`

**Domus di Amore e Psiche** — 41.75405, 12.28608, `wikidata=Q249991`
- A grand house of the **4th century AD** over an earlier commercial building; two storeys, arcaded
  corridor onto an open garden with a marble nymphaeum on one side; the main hall with polychrome
  marble inlay on walls and floor; a room off the corridor held the Amore e Psiche group, of which a
  cast is in place and the original in the Museo Ostiense.
  `…/i-quartieri-residenziali-della-classe-medio-alta/domus-di-amore-e-psiche/`

**Also panelled here:** Caseggiato del Serapide, Caseggiato di Bacco e Arianna, Terme della
Trinacria, Casette Tipo, Insula delle Ierodule, Insula delle Pareti Gialle, Insula delle Volte
Dipinte, Insula delle Muse, Domus dei Dioscuri, Domus del Ninfeo, Complesso dei Mensores.

### 3.6 The eastern quarter — oriental cults and Porta Laurentina

**Campo della Magna Mater** — 41.75255, 12.29083, `wikidata=Q106603820`
- A large triangular precinct in the angle between the cardo and the walls, holding the temple of
  Cybele/Magna Mater, the shrine of Attis, the temple of Bellona and the seat of the *hastiferi*.
  The cult of Cybele reached Ostia in the 1st century AD; the sanctuary was laid out during the
  2nd. The *taurobolia* were performed in the open space.
  `…/larea-dei-culti-orientali-e-il-quartiere-residenziale-di-porta-laurentina/campo-della-magna-mater/`

**Porta Laurentina** — 41.75267, 12.29162, `wikidata=Q112057514`. Panel at
`…/larea-dei-culti-orientali-…/porta-laurentina/`

**Domus della Fortuna Annonaria** — 41.75400, 12.29052, `wikidata=Q1238778`
- An aristocratic house whose present form is **4th century AD**, over a mid-2nd-century house whose
  peristyle it kept. Columned *protiro*, vestibule, courtyard with the cast of a female statue
  identified as Fortuna Annonaria or as the personification of Ostia; apsed main hall for a
  semicircular *stibadium*; a private room converted to a heated hall with a mythological mosaic.
  `…/larea-dei-culti-orientali-…/domus-della-fortuna-annonaria/`

**Mitreo di Felicissimo** — 41.75433, 12.29164, `wikidata=Q123469072`
- Installed in the second half of the 3rd century AD in an earlier building. Mosaic floor with a
  krater and a flaming altar, two Phrygian caps, and a corridor mosaic in **seven** panels alluding
  to the grades of initiation and their planets; the eighth carries the inscription naming
  **Felicissimus**, who built it. `…/larea-dei-culti-orientali-…/mitreo-di-felicissimo/`

**Also panelled here:** Domus dei Pesci, Ninfeo degli Eroti, Mitreo dei Serpenti, Complesso delle
Terme del Filosofo, Domus del Protiro, Domus del Pozzo, Fullonica su via degli Augustali, Cd. Sede
degli Augustali, Terme del Nuotatore, Santuario della Bona Dea, Tempio collegiale dei Fabri
Tignuarii.

### 3.7 The coastal quarter, outside Porta Marina

These are the southernmost points inside the ring; the nearest is **16 m** from the boundary. All
tested IN under both A and B, but the verifier should know how tight it is.

**Porta Marina** — 41.75108, 12.28550, `wikidata=Q107084485`. Part of the mid-1st-century-BC
republican circuit; the remains lie lower than the present Decumanus. Two projecting square towers,
reinforced with tufa blocks because the seaward side was the exposed one.
`https://ostiaantica.cultura.gov.it/pannelli-didattici-e-mappe/i-quartieri-costieri-e-le-domus-marittime/porta-marina/`

**Sinagoga di Ostia** — 41.74885, 12.28858, `wikidata=Q123433`, on Via Guido Calza per Nominatim.
- Built about the middle of the **1st century AD** for the local Jewish community and completely
  rebuilt in the **4th century AD**. Vestibule, colonnaded entrance, prayer hall with a raised
  *bimah* at the far end oriented towards Jerusalem, an aedicula for the Torah scrolls surmounted by
  corbels carved with the seven-branched *menorah*; a large adjoining hall with benches, and a room
  with an oven and counter read as a place to make unleavened bread.
- `…/i-quartieri-costieri-e-le-domus-marittime/sinagoga/`
- **Trap:** the official panel says "è una delle più antiche del Mediterraneo occidentale". That is
  a superlative and cannot be published even with attribution. Publish "built about the middle of
  the 1st century AD and rebuilt in the 4th" and stop.

**Terme di Porta Marina (o della Marciana)** — 41.74989, 12.28644, `wikidata=Q114639407`
- Built in the Trajanic age, **about 110 AD**, the date of the portrait of **Marciana**, Trajan's
  sister, found inside. Colonnaded palestra court; *apodyterium* with a black-and-white athlete
  mosaic; polychrome-mosaic *frigidarium* to which a large apsed pool was added in the 3rd century;
  part of the south wing became an independent bath in the 4th, connected to the Via Severiana.
  Restored down to the time of Theodoric (493–526 AD).
  `…/i-quartieri-costieri-e-le-domus-marittime/terme-di-porta-marina-o-della-marciana/`

**Sepolcro di Cartilio Poplicola** — 41.75036, 12.28544, `wikidata=Q55096569`
- A mausoleum of about **20 BC** on a tomb road outside Porta Marina. Travertine-faced square base;
  marble on the façade, travertine and tufa elsewhere; pilasters with capitals at the corners. The
  façade inscription records Gaius Cartilius, so popular he earned the cognomen *Poplicola*; the
  figured frieze of soldiers and a trireme probably records a naval victory under his command.
  `…/i-quartieri-costieri-e-le-domus-marittime/sepolcro-di-cartilio-poplicola/`

**Edificio dell'opus sectile fuori Porta Marina** — a 4th-century AD transformation of a
2nd-century building at the end of the Decumanus, built over an early-imperial sea dyke. Its main
hall produced a collapsed wall revetment in *opus sectile*, now in the Museo delle Civiltà; the
portrait of a bearded, haloed man with raised right hand has prompted readings as either a
Christian building or the seat of a pagan philosophical sect.
`…/i-quartieri-costieri-e-le-domus-marittime/edificio-dellopus-sectile-fuori-porta-marina/`

**Also panelled here:** Terme marittime.

### 3.8 The necropoleis

**Necropoli della via Ostiense** — 41.75757, 12.29657, `wikidata=Q109923783`, on Via delle Tombe
just outside Porta Romana. Two monuments have their own panels:
- **Tomba degli Archetti**, `wikidata=Q131358224` — built at the start of the 1st century AD as a
  reticulate-work funerary enclosure; the north façade has brick architectural members under arches,
  the lunettes inlaid with yellow and red brick alternating with tufa and pumice. Converted to a
  columbarium in the second half of the 1st century AD; larger *arcosolia* added from the 2nd.
  `…/la-necropoli-della-via-ostiense/tomba-degli-archetti/`
- **Colombari gemelli** — two independent tombs of the first half of the 1st century AD on the same
  plan, each with an open vestibule and a covered chamber with urn niches, and terrace roofs reached
  by stairs for funerary banquets; the *ustrinum* lay in the space between them.
  `…/la-necropoli-della-via-ostiense/colombari-gemelli/`

**Necropoli Laurentina** — 41.75202, 12.29472
- Excavated from **1804**, sporadically through the 19th century; the four painted tombs found in
  **1865** are the "Tombe dei Claudii", whose detached paintings are in the Musei Vaticani.
  Excavation resumed in **1934** and brought up about **50** burials. Tomb 18, the "Sacerdotessa
  Isiaca", holds an Augustan stucco cycle; tomb 32, "Orfeo agli inferi", a well-preserved painted
  cycle of birds and fruit on yellow and red.
- **Status: closed.** The operator's page states "La necropoli è attualmente chiusa al pubblico per
  interventi di manutenzione e restauro." This is an affirmative, sourced closure and the record's
  `status` may say closed.
- `https://ostiaantica.cultura.gov.it/siti-musei/scavi-di-ostia-e-museo-ostiense/la-necropoli-laurentina-3/`

### 3.9 A live, non-archaeological thing inside the scavi

**Capanno da birdwatching "Aves ostienses"** · attraction — on **via della Foce** inside the
excavation. Opened under a three-year agreement between the Parco and **LIPU/BirdLife Italia**
(signed by director Alessandro D'Alessio and LIPU president Alessandro Polinori); LIPU has technical
and operational management of the hide and of the neighbouring "Casetta del Custode n. 4", and runs
bird censuses inside the site. The excavation lies within the **Riserva naturale statale Litorale
Romano**.
`https://ostiaantica.cultura.gov.it/capanno-da-birdwatching-aves-ostienses-una-finestra-sulla-natura-degli-scavi/`
**Trap:** the same page calls the scavi "uno dei siti archeologici più importanti al mondo". Banned.

### 3.10 Themed routes, not places

The Parco publishes two thematic itineraries — **Grano e pane a Ostia antica** and **Sport e atleti
a Ostia antica** — each a set of pages pointing at monuments already listed above. They are
navigation, not places, and should not be seeded as records.
`https://ostiaantica.cultura.gov.it/percorsi/grano-e-pane-a-ostia-antica/` ·
`https://ostiaantica.cultura.gov.it/percorsi/sport-e-atleti-a-ostia-antica/`

---

## 4. Candidates — the medieval and Renaissance borgo, and the rest of the zona

### 4.1 The borgo

**Borgo di Ostia Antica (Gregoriopoli)** · historic-site — Piazza della Rocca, 00119 Roma
- On Viale dei Romagnoli, facing the archaeological area. From late antiquity (4th–5th century AD)
  the area held the Christian community's cemetery, on the site where tradition placed the tombs of
  martyrs, among them **Santa Aurea**. **Pope Gregory IV (827–844)** turned the settlement into a
  fortified citadel called **Gregoriopoli**. In 1400 **Martin V** had a round tower with a moat
  built to guard the Tiber. Cardinal **Guillaume d'Estouteville**, bishop of Ostia 1461–1483,
  restored the Gregoriopoli walls and built **three rows of terraced houses inside them, still
  lived in**. The 1556 siege by the Duke of Alba, the 1557 flood that diverted the Tiber, and the
  malarial marshes that followed emptied the borgo. Rocca and borgo were restored in stages during
  the 20th century.
- `https://ostiaantica.cultura.gov.it/siti-musei/il-castello-di-giulio-ii-e-il-borgo-di-ostia-antica/` ·
  `https://www.turismoroma.it/it/luoghi/il-borgo-di-ostia-antica-e-il-castello-di-giulio-ii`
  (Roma Capitale, which gives the address as PIAZZA DELLA ROCCA) ·
  `https://it.wikipedia.org/wiki/Ostia_Antica`

**Castello di Giulio II (Rocca di Ostia)** · historic-site — Piazza della Rocca; 41.75935, 12.30121,
`wikidata=Q3939487`
- Construction began **1483** at the expense of Cardinal **Giuliano della Rovere**, later
  **Julius II**, on a design by the Florentine architect **Baccio Pontelli** (named in the
  inscription on the courtyard portal, per Roma Capitale; Vasari attributed it to Giuliano da
  Sangallo, and other historians have proposed Francesco di Giorgio Martini). Completed 1486. It
  absorbed **Martin V's tower of 1423–24**. Triangular plan, three corner towers — two round, one
  larger and polygonal, the Martin V tower — joined by a single wall-walk; a perimeter circuit of
  casemates, a *rivellino*, and a wide moat once fed from the Tiber. Brick walls, low, thick and
  battered. The monumental staircase was frescoed with the myth of Hercules, attributed to the
  school of **Baldassarre Peruzzi**. Its customs role passed to Tor Boacciana in 1562 and then to
  Tor San Michele in 1568. In the 19th century it housed the convicts with whom Pius VII and Pius IX
  began the first excavations of Ostia.
- Hours (operator): open Tue–Sun. 1 Nov–end Feb 10:30–16:30; 1 Mar–15 Jun 10:30–19:30; 16 Jun–31 Oct
  13:30–19:30; last entry 30 min before closing. Closed Mondays, 25 December, 1 January.
- Tickets: **€6** full, **€2** reduced (EU 18–25); covered by the €18 integrated ticket.
- Currently hosting the exhibition **"IN HOC SIGNO. Testimonianze cristiane tra Ostia e Porto"**
  until **21 November 2026**. Restoration, consolidation and enhancement works are under way; the
  operator states the castle stays open on its usual hours during them, with panels on the work.
- `https://ostiaantica.cultura.gov.it/info-visita/castello-di-giulio-ii/` ·
  `https://ostiaantica.cultura.gov.it/siti-musei/il-castello-di-giulio-ii-e-il-borgo-di-ostia-antica/` ·
  `https://it.wikipedia.org/wiki/Castello_di_Giulio_II`
- **Trap:** it.wikipedia and Roma Capitale both call it "alto esempio di architettura militare
  rinascimentale". Not a superlative in the banned sense, but it is an evaluative flourish; prefer
  the dated facts. OSM's `opening_hours` tag on this object is stale and contradicts the operator —
  use the operator.

**Torre di Martino V** — 41.75949, 12.30119, tagged separately in OSM as `historic=tower`. It is
physically inside the castle and is the tower of **1423–24**. Recommend folding into the castle
record rather than seeding separately; flagged for the verifier.

**Basilica di Sant'Aurea** · historic-site — Piazza della Rocca; 41.75936, 12.30184,
`wikidata=Q2887127`
- The cathedral of the suburbicarian **diocese of Ostia**, entrusted since **1966** to the vicar of
  the diocese of Rome. First mentioned in connection with restorations ordered by **Pope Sergius II**
  in the middle of the 8th century. Rebuilt at the end of the **15th century** at the wish of
  Cardinal **Guillaume d'Estouteville** and completed by Giuliano della Rovere; the work went to
  **Baccio Pontelli**, who also built the adjoining fortress and who reversed the church's
  orientation. Single nave with a trussed ceiling, lit by a rose window and 15th-century mullioned
  windows. On the right, the chapel of Santa Monica, with a funerary inscription found near the
  church in **1945** recording the ancient cult of the body of the saint, and a canvas *Estasi di
  santa Monica* attributed to **Pietro da Cortona**. The apse arch is built of spoliated marble and
  decorated with 16th-century frescoes; the modern altar carries two 15th-century reliefs; the three
  altarpieces are 17th century, the oval *Martirio di santa Aurea* by **Andrea Sacchi**. Seat of a
  cardinalatial title held since the 12th century by the Dean of the College of Cardinals. Tradition
  places St Monica's burial on the site and St Aurea's nearby.
- `https://it.wikipedia.org/wiki/Basilica_di_Sant%27Aurea` (article carries
  `Categoria:Roma Z. XXXV Ostia Antica`) · the parish's own site is cited there as
  `https://www.santaurea.org/la-cattedrale` — **not fetched in this pass; verifier should fetch it
  for hours and Mass times, which no source below gives.**

**Parco dei Ravennati** · **park** — 41.75901, 12.30184, between via dei Martiri Ostiensi, via della
Gente Salinatoria, via del Mare, viale dei Romagnoli, via Gesualdo and via Gloriano; dedicated to
the men who drained Ostia. `https://it.wikipedia.org/wiki/Ostia_Antica`

**Monumento "Agli eroici figli di Ostia"** — 41.76021, 12.30185, viale dei Romagnoli. Related and
better sourced: the Parco's own page on the church of Sant'Ercolano records that an ossuary there
holds the remains of Romagnol and above all **Ravennate** labourers who came in **1884** to drain
the Ostia, Fiumicino and Maccarese marshes, "come ricorda la lapide in piazza Umberto I a Ostia
Antica". Whether the OSM monument and that *lapide* are the same object is **not established** —
flagged.
`https://ostiaantica.cultura.gov.it/siti-musei/scavi-di-ostia-e-museo-ostiense/chiesa-di-s-ercolano/`

**Sacrario dei bonificatori del litorale romano** — listed by it.wikipedia among the borgo's civil
architecture; the only supporting source is a local news report of the 140th-anniversary ceremony
on 24 November 2024. No address, no hours, no coordinates found. **Low confidence, flagged.**
`https://www.ostiatv.it/140-anniversario-della-bonifica-del-litorale-romano-omaggio-al-sacrario-dei-bonificatori-a-ostia-antica.html`

**Giardino Filippo Iaia** — inside Piazza Gregoriopoli, 41.76021, 12.30262. it.wikipedia lists it;
nothing else found. Thin.

**Antichi Lavatoi (area espositiva)** — 41.76032, 12.30391, Via Cardinal Cybo per Nominatim. **OSM
only. No descriptive source of any kind was found.** Flagged; probably not publishable.

### 4.2 The rest of the zona

**Area archeologico-naturalistica delle Saline — molo e banchine fluviali** · historic-site
- Reached from viale dei Romagnoli via **via delle Saline**, outside the fenced excavation. It
  preserves the largest surviving structure of Ostia's river harbour, the so-called **molo
  repubblicano** — a tufa-block revetment **over 100 m long and 15 m wide**, its western end shaped
  as a mole head, with orthogonal reticulate-work walls linking quay to shore. The operator says the
  republican dating cannot be taken as certain. The area is almost entirely reburied.
- `https://ostiaantica.cultura.gov.it/siti-musei/scavi-di-ostia-e-museo-ostiense/molo-e-banchine-fluviali-di-ostia-antica/`
- **Access unresolved:** the page carries the generic "Informazioni per la visita" button but no
  hours of its own. Under the corpus rule, default `status: open` with the prose saying no source
  states its opening hours.

**Saline di Ostia** — an *area urbana* of Municipio X, zona "O" 40, situated inside Z. XXXV;
centroid 41.762093, 12.291813 (IN, 642 m from the edge). Named from two natural salt pans at the
Tiber mouth. This is a place-name, not a visitable place; useful as context in the zona page, not
as a record. `https://it.wikipedia.org/wiki/Saline_di_Ostia`

**Bagnoletto** — the other *area urbana* inside the zona, also a member of the Z. XXXV category.
Same treatment.

**The borgo's food and drink.** OSM records, all inside the ring, all in or immediately around the
borgo: *Allo sbarco di Enea* (Viale dei Romagnoli 675), *Il monumento* (Piazza Ravenna per
Nominatim, Piazza Umberto I in local usage), *Arianna al Borghetto* (Via del Forno 11),
*L'alimentari* (Piazza Umberto I 6), *Restaurant Piazza Ravenna*, *Coccodè*, *Fraschetta del Borgo*
(Viale dei Romagnoli 761), *Gran Caffè in Piazza* (Piazza Gregoriopoli 2, tel +39 06 56352823),
*Baretto, il bar del borghetto* (Viale dei Romagnoli 737), *Dolce caffè* (Viale dei Romagnoli 756),
*Il Gelataio* (Viale dei Romagnoli 752), *Pizza da Michele* (Viale dei Romagnoli 786,
`opening_hours=Mo,Tu,Th-Su 08:00-21:30`), and *Il Glicine – Iniziative Nautiche* on Vicolo di Tor
Boacciana by the river.
**Sourcing problem, stated plainly:** only one of these carries a website tag in OSM
(`http://www.piazzaravenna.it`) and **that host does not resolve from this network**. Four further
plausible domains were probed and none resolved. Under the corpus rule that every claim needs a
source you actually fetched, and that an operator's own site is what establishes identity, location
and hours, **none of these can currently ship with more than an OSM-derived address**. The verifier
should either fetch official sites from a network that can reach them or drop the category.
Recommend: **do not seed restaurants in this wave.**

**Stazione di Ostia Antica** — see §5.1. Straddler.

---

## 5. Straddlers — flagged, not resolved here

### 5.1 Stazione di Ostia Antica (Roma–Lido / Metromare) — 41.75638, 12.30207, `wikidata=Q3970367`
- **Method A: OUT**, 72–83 m outside the Z. XXXV ring.
- **Method B: OUT** — Nominatim returns `Ostia Antica, Via della Stazione di Ostia Antica,
  **Casal Palocco**, Municipio Roma X, Stagni di Ostia, Roma`.
- **Method C: IN** — it.wikipedia's article is a member of `Categoria:Roma Z. XXXV Ostia Antica`
  and says the station stands "nell'omonimo quartiere".
- The boundary prose supports A and B: Q. XXXIII's article makes **via Ostiense** the divider from
  Z. XXXIV Casal Palocco, and the station lies east of via Ostiense.
- Facts if it is awarded to this zona: opened **10 August 1924** as one of the first stations on the
  Roma–Lido line, originally named *Ostia Scavi*; the original station building was destroyed in the
  Second World War and rebuilt in the 1950s. Reconstruction works began in 2026 to turn it into an
  "archeostazione", with the present building demolished and replaced, commercial space, and a
  cycle-and-foot route to the excavations. Criticised in 2019 for inaccessibility to people with
  mobility impairments.
- `https://it.wikipedia.org/wiki/Stazione_di_Ostia_Antica` ·
  `https://www.astralspa.it/roma-lido-al-via-i-lavori-di-riqualificazione-della-stazione-di-ostia-antica/`
  (cited there; not fetched in this pass)
- **Recommendation: exclude from Ostia Antica** unless the arbitrator prefers Wikipedia's category
  over two geometric methods. It is the one candidate most travellers would expect to find here.

### 5.2 Ponte della Scafa (Ponte di Tor Boacciana) — 41.753914, 12.278162
- **Method A: OUT by 21 m.** **Method C: contradictory** — the article carries
  `Categoria:Roma Z. XXXV Ostia Antica`, but its own text says it is the only road link between
  **Lido di Ostia Ponente (Q. XXXIII)** and Isola Sacra (Fiumicino), and both the Z. XXXV and
  Q. XXXIII boundary descriptions use "il ponte Tor Boacciana" as the point where their shared
  boundary meets the Tiber — i.e. the bridge is the corner, not the interior.
- Facts: designed by **Vito Camiz**, opened **2 December 1950**; 150 m long, 12 m wide, one
  carriageway of two lanes. Named from *la scafa*, the ferry run by the restaurateur Tancredi
  Chiaraluce before 1916, when two iron beam bridges built by Paolo Orlando from the demolished
  Ponte degli Alari replaced it; those were destroyed by German troops in 1943.
- `https://it.wikipedia.org/wiki/Ponte_della_Scafa`
- **Recommendation: exclude.** A boundary corner shared with a different comune is not this zona's.

### 5.3 Tor Boacciana — 41.75266, 12.27775, `wikidata=Q3993549`
- **Method A: OUT by 106 m. Method B: OUT** (`Via del Ponte di Tor Boacciana, Municipio Roma X,
  Lido di Ostia`). **Method C: OUT** — the it.wikipedia article carries
  `Categoria:Roma Q. XXXIII Lido di Ostia Ponente`.
- **But it is administered by the Parco archeologico di Ostia antica and published on the Parco's
  own site under "Scavi di Ostia e Museo Ostiense"**, which is why a guide writer will reach for it.
  All three methods say it belongs to Q. XXXIII.
- Facts, for whichever unit gets it: the base is probably what remains of a lighthouse or watchtower
  of the Trajanic age (2nd century AD), on brick-stamp evidence; the upper part is roughly 12th
  century, possibly the *turris pulcherrima sed solitaria* of the chronicles of Richard the
  Lionheart's landing during the Third Crusade (1190). Partly restored **1406** under Innocent VII
  and rebuilt to its present form under Martin V; papal customs house from **1562**, replacing the
  Castello di Giulio II, until **1568** when the customs moved to Tor San Michele. A store from the
  early 1800s, then Aldobrandini property, let to Tancredi Chiaraluce who lived there and ran a
  refreshment stop for hunters.
- `https://ostiaantica.cultura.gov.it/siti-musei/scavi-di-ostia-e-museo-ostiense/tor-boacciana-e-complessi-limitrofi/` ·
  `https://it.wikipedia.org/wiki/Tor_Boacciana`
- **Recommendation: not Ostia Antica's.** Flag to the arbitrator because the operator's grouping
  cuts the other way.

### 5.4 Cd. Palazzo Imperiale — 41.75387, 12.28147, `wikidata=Q104876336`
- **Method A: IN by 127 m.** **Method B: OUT** — Nominatim returns
  `Palazzo imperiale, Via Col del Rosso, **Isola Sacra, Fiumicino**`.
- This is almost certainly a geocoder artifact: the building is on the north-west edge of the
  excavation near the Tiber, and Nominatim appears to have attached it to the nearest addressable
  street, which is across the river in the comune of Fiumicino. Method A puts it comfortably inside
  the Z. XXXV ring, and the Parco publishes it as part of the scavi.
- **Recommendation: treat as Ostia Antica's**, but the verifier should re-check with a second
  geocoder before it ships. If the disagreement cannot be settled, drop it — there are eighty other
  monuments.

### 5.5 The Porta Marina fringe — noted, not a straddler
Five records lie within 65 m of the southern boundary with Q. XXXIII: Terme del scheletro (16 m),
Caseggiato delle Due Scale (26 m), Sinagoga di Ostia (30 m), Terme del Sileno (33 m), Caupona del
Dio Pan (44 m), Necropoli Laurentina (46 m), Terme di Porta Marina (63 m). All test **IN** under
both A and B, and all lie inside the fenced excavation, whose own OSM multipolygon is wholly inside
the zona ring. Recording the margin so nobody has to redo the work.

---

## 6. Rejects, with the reason

**Fiumicino — out of Rome entirely, per the brief and per the institute's own site.** The Parco
administers them; they are not in Roma Capitale and must not be written here.
- Museo delle Navi di Fiumicino · Necropoli di Porto all'Isola Sacra · Area archeologica dei Porti
  Imperiali di Claudio e Traiano (and the Monte Giulio area) · Complesso della basilica di
  Sant'Ippolito · Area dell'Iseo Portuense · the tombs in the ex-O.N.C. area.
  `https://ostiaantica.cultura.gov.it/siti-musei/` lists all of them.

**Inside Rome but outside Z. XXXV:**
- **Basilica e necropoli di Pianabella** — A: OUT by 57 m; B: `Via Ostiense, **Casal Palocco**`.
  A Parco site, reached from the Ostia Antica cemetery along via di Pianabella. The basilica was
  excavated in 1976 and reburied.
  `https://ostiaantica.cultura.gov.it/siti-musei/scavi-di-ostia-e-museo-ostiense/necropoli-e-basilica-di-pianabella-3/`
- **Chiesa di Sant'Ercolano** — A: OUT by 237 m; B: `Via di Piana Bella, **Casal Palocco**`. A Parco
  site, at the modern Ostia cemetery, reached from a side road off via di Castel Fusano. Apsed hall
  in *opus vittatum* over 1st–2nd-century AD burials; the outer enclosure holds the graves of Dante
  Vaglieri (1865–1913), Guido Calza (1888–1946), Giovanni Becatti (1912–1973), Italo Gismondi
  (1887–1974) and Raissa Gourevitch (1894–1979).
  `https://ostiaantica.cultura.gov.it/siti-musei/scavi-di-ostia-e-museo-ostiense/chiesa-di-s-ercolano/`
- **Cimitero di Ostia Antica** — A: OUT by 261 m; B: Casal Palocco; and it.wikipedia's own zona
  article puts it "su via di Piana Bella (**zona Casal Palocco**)".
- **Ville costiere di Procoio** — a Parco site reached along via di Pianabella, on the strip parallel
  to the ancient shoreline. Not tested against the ring for want of coordinates, but the access
  route is the Pianabella one, which is outside. **Flagged as almost certainly outside; verifier
  should confirm before anyone writes it.**
  `https://ostiaantica.cultura.gov.it/siti-musei/scavi-di-ostia-e-museo-ostiense/ville-costiere-di-procoio/`
- **Cineland** — A: OUT by 288 m; Viale dei Romagnoli 515; it.wikipedia lists it under **Q. XXXIII
  Lido di Ostia Ponente**.
- **Ecomuseo del litorale romano — Polo Ostiense** — run by the Cooperativa Ricerca sul Territorio.
  MiC gives the address as **Via del Fosso di Dragoncello**, which is not an Ostia Antica street
  (the zona's own odonymy is archaeologists, Veneto and Lombardy towns, and local names). The
  operator's site `https://www.crtecomuseo.it/` is entirely JS-rendered and served no text at all,
  so nothing could be confirmed from it. MiC's hours table shows the museum closed every day of the
  week (page last updated 2020). **Excluded as not established to be in this zona and not sourceable.**
  `https://cultura.gov.it/luogo/ecomuseo-del-litorale-romano-polo-ostiense`
- Everything in Lido di Ostia — the beach, the Borghetto dei Pescatori, the Porto turistico, the
  Idroscalo, Tor San Michele, the Colonia marina, the Teatro del Lido. Different quartieri.

**Not places:** the roughly 70 `tourism=information` panels inside the scavi, the 15 marble-sample
plinths on the Via dei Marmi, the bus-stop platforms along viale dei Romagnoli, the town's shops
(Todis, CRAI, DOC, GrandVision, a hairdresser, two car-parts shops), the schools, the post office,
the pharmacy, the football pitch (A.S.D. Ostiantica Calcio 1926), and the roughly 250 numbered
insulae and caseggiati that carry no panel and no article.

---

## 7. Yield judgement — guide, and a large one

The brief asked me to be honest if there were only four things worth writing about. **There are
not.** This is the opposite case in this wave.

- The Parco's own didactic-panel tree is **about 85 per-monument pages**, each with dates, patrons,
  function and named finds, all fetchable and all inside the zona ring.
- Roughly **35–45** of those are things a general travel guide would actually name: the theatre, the
  Piazzale delle Corporazioni, the Capitolium and Forum group, the Terme di Nettuno and Terme del
  Foro, the Thermopolium, the Casa di Diana, the Horrea Epagathiana, the Grandi Horrea, the Caserma
  dei Vigili, the Schola del Traiano, the Serapeum, the synagogue, the mithraea, the Case a Giardino,
  the great late-antique domus, the three gates and the republican walls, the two necropoleis.
- The borgo adds a genuinely separate second cluster: a **1483–86 fortress by Baccio Pontelli with
  frescoes attributed to the school of Peruzzi**, a **15th-century cathedral by the same architect**
  with an Andrea Sacchi altarpiece and a Pietro da Cortona attribution, three rows of **still-inhabited
  15th-century terraced houses**, and a park.
- Everything material has **hours and a price from the operator's own site**, which is the strongest
  evidential position of any unit I have seen in these files.

**Recommendation to the arbitrator: a full guide, not a town page.** The realistic shipping shape is
one park record, one museum record, one castle record, one basilica record, one borgo record, and
somewhere between 25 and 40 monument records inside the scavi. My own confirmation rate on the
scavi monuments should be high, and that is not a warning sign here because the filter was the
operator's published panel set rather than my judgement — but the verifier should still cut hard,
because a guide with 45 ruined buildings in one fenced field is a catalogue, not a guide.

Where the yield really is thin: **the commercial layer**. The borgo has perhaps a dozen bars and
restaurants and not one of them has a website this network can reach. Say four are worth writing
about and none can be sourced — so none should ship this wave.

---

## 8. Traps for the writer

1. **Superlatives, including from official sources.** The Parco's own text supplies at least four:
   the synagogue "una delle più antiche del Mediterraneo occidentale"; the Terme del Foro "le più
   grandi della città"; the Grandi Horrea "il più grande edificio commerciale ostiense"; the scavi
   "uno dei siti archeologici più importanti al mondo"; the Pianabella basilica "probabilmente il
   più importante monumento del suburbio ostiense"; and it.wikipedia's "uno dei siti archeologici
   più grandi d'Europa" and "il teatro, uno dei più antichi in muratura". **All banned**, attributed
   or not. Every one of them can be replaced with a date, a patron or a measurement that is already
   in the same source.
2. **No designation claims.** The archaeological area holds the **European Heritage Label**, awarded
   in 2019 — this appears in OSM (`heritage:operator=ehl`, `ehl:inscription_date=2019`), on
   it.wikipedia, and on the Parco's own projects page. It is an EU cultural label, not an Italian
   protection status, but it sits close enough to the banned category that **I recommend leaving it
   out** unless the arbitrator rules otherwise; the EC page itself was not fetched in this pass.
   Nothing here may be called *vincolato*, listed, protected or a declared monument. Note also that
   **the Historic Centre of Rome UNESCO property is 25 km away and this zona is nowhere near it** —
   no page here may mention it.
3. **No research method in reader-facing text.** Not "the operator's site could not be reached", not
   "reverse geocoding disagreed", not "the ring test". If the Basilica di Sant'Aurea's hours cannot
   be sourced, write: "No source states its opening hours, so none are given here."
4. **Locators.** The zona is about 5.5 km by 4.7 km. "In Ostia Antica" locates nothing. Use
   Viale dei Romagnoli 717 for the park, Piazza della Rocca for the castle and the basilica, and
   the ancient street name for monuments inside the scavi (Nominatim returns them: Decumano Massimo,
   Cardo Massimo, Via di Diana, Via del Tempio d'Ercole, Via degli Horrea Epagathiana, Via della
   Fortuna Annonaria, Via delle Tombe, Via Guido Calza, Via della Marciana).
5. **Two different Ostias.** `Ostia Antica` the zona (Z. XXXV) and `Ostia (città antica)` the Roman
   town are different Wikipedia articles and different things; `Lido di Castel Fusano` is Q. XXXV
   and is not this. `Ostia (Roma)` is the seaside frazione.
6. **Status fields.** Necropoli Laurentina: `closed`, sourced. Castello di Giulio II: `open`,
   with restoration works under way and the operator explicitly saying it stays open. Everything
   else with no access statement: `open`, and the prose says nothing is known.
7. **The visitor figure.** 273,638 for 2023 is in the brief and I could not source it. Do not print
   it without a fetched source.

---

## 9. Photographs

Per the wave ruling, **`"photos": []` everywhere.** Notes for the photo wave:

- Nothing in this zona is in architectural copyright. The newest structures of any interest are the
  1950s station building (about to be demolished) and the birdwatching hide. Italy has no freedom of
  panorama, but every monument here is either ancient or 15th-century, so the constraint that bites
  EUR, Flaminio and Parioli does not bite here.
- The Parco publishes a regulation on reproduction of cultural property, television filming and use
  of spaces at
  `https://ostiaantica.cultura.gov.it/regolamenti-su-riproduzione-beni-culturali-riprese-televisive-e-uso-di-spazi/`.
  **The photo wave must read it before sourcing any image of the scavi, the Museo Ostiense
  interiors or the Castello.** Museum interiors were flagged as the highest-risk class in earlier
  waves and the Museo Ostiense is a state museum.
- Wikimedia Commons carries a category `Ostia Antica` and specific files already referenced by
  it.wikipedia (`Castello di giulio II.JPG`, `Basilica di Sant'Aurea.JPG`,
  `Panoramica Teatro di Ostia.jpg`, `Capitolium Ostia Antica.JPG`,
  `Caseggiato del Termopolio Ostia Antica 2006-09-08 n1.jpg`,
  `Ostia, horrea epagathiana 01.JPG`, `Domus di Amore e Psiche Ostia Antica 2006-09-08 n1.jpg`).
  Licences not checked in this pass.
