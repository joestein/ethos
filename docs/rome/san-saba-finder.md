# San Saba (R. XXI, Roma Capitale toponymic code 121) — finder file

Finder pass, wave 4. Not a shipping decision: a verifier adjudicates each record and one
arbitrator rules ownership across all nine rioni in this wave.

---

## 0. Collision check against what is already shipped

`python3 .superpowers/taken_slugs.py` reports **450 places across 12 shipped files**
(Campitelli, Monti, Trastevere, Borgo, Pigna, Parione, Colonna, Trevi, Prati, Ludovisi,
Sallustiano, Castro Pretorio).

Searched: `saba`, `caracalla`, `aventin`, `scipio`. **Zero matches on all four.** The twelve
shipped rioni are the historic core and the northern belt; nothing in them reaches south of the
Circus Maximus. **No candidate below collides with a shipped place.**

---

## 1. How the rione boundary was established

Two independent methods, run against every candidate.

**Method A — OSM boundary relation, tested locally.** Nominatim resolves `Rione XXI San Saba` to
**OSM relation 5454343** (`place`, `ref = R. XXI`, `wikidata = Q386273`,
`wikipedia = it:San Saba (rione di Roma)`). Overpass `rel(id:…); out geom;` returns it as a single
closed outer ring of 415 vertices. The same call pulled the neighbours — Ripa (5454276), Celio
(5454335), Testaccio (5454344), Appio-Latino (5459776), Ostiense (5460386), Ardeatino (5473394),
Monti (5451988), Esquilino (5454309) — all of which stitched into single closed rings. Candidates
were then tested by ray-casting against all nine rings at once, so each point reports which unit
actually contains it rather than a yes/no against San Saba alone. A metric distance-to-nearest-edge
was computed alongside, which is what surfaces the straddlers.

**Method B — Nominatim reverse geocoding**, `quarter` field, as used in earlier waves.

Nominatim rate-limited hard on the first two passes (HTTP 429 on nearly every call); the third and
fourth passes at 3 s spacing succeeded. Where B returned a `quarter`, **A and B agree on every
candidate except four**, all listed in §4. Those four are the real straddlers and are not resolved
here.

Bounding box of the rione: lat 41.8732–41.8848, lon 12.4791–12.5015. It is small — the whole rione
fits in roughly 1.3 km east–west.

Source URLs for the boundary work:
- `https://nominatim.openstreetmap.org/lookup?format=json&osm_ids=R5454343&polygon_geojson=1&extratags=1`
- `https://overpass-api.de/api/interpreter` and `https://overpass.kumi.systems/api/interpreter`
  (`rel(id:5454276,5454335,5454343,5454344,5459776,5460386,5473394,5451988,5454309); out geom;`)
- `https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=…&lon=…&zoom=18&addressdetails=1`

**Inventory completeness.** Three Overpass sweeps were run: (a) every `historic`/`tourism`/
`amenity`/`leisure`/`building`/`shop`/`office`/`memorial`/`archaeological_site`/`wikidata` feature
inside the boundary relation; (b) the same tag set over a generous bounding box
(41.8700–41.8870, 12.4770–12.5040) covering the whole Piccolo Aventino, the Porta San Sebastiano
corridor and the Testaccio/Ostiense edge, so nothing on the far side of a boundary was missed by
accident; (c) a catch-all pass for every named feature of any kind inside the ring. Pass (c)
returned **155 distinct named things inside San Saba**, of which about 60 are street names and
about 20 are on-site interpretive panels inside the Baths of Caracalla. That is the floor: there is
nothing else named in this rione.

---

## 2. The three binding rulings, applied

- **No designation claims.** Nothing below records vincolo status. Where a source used the word it
  was dropped. The one thing worth noting: `parcoarcheologicoappiaantica.it` states San Cesareo de
  Appia has been *demanio* (state property) since 1959 and is now a holding of the Parco
  Archeologico dell'Appia Antica. That is an ownership/administration fact from the managing
  institution about its own holding, not a protection designation — but the verifier should decide
  whether "di proprietà demaniale sin dal 1959" is publishable at all.
- **Vatican / extraterritoriality.** No Lateran Treaty property in San Saba. **But there is a
  related trap**: it.wikipedia's *Palazzo FAO* article asserts the building "gode della
  extraterritorialità", cited to a 2008 *La Stampa* piece. FAO is a UN specialised agency under a
  bilateral Italy–FAO headquarters agreement, **not** a Lateran Treaty property, and the
  vatican_ruling does not cover it. FAO's own site gives only the address. **Do not publish any
  extraterritoriality or immunity claim for the FAO building** on the strength of a newspaper
  article. Same caution for the Saudi and Palestinian embassy buildings, which are in the rione and
  which no page should characterise legally.
- **No photographs.** All records emit `"photos": []`. Photograph notes are parked in §7.

---

## 3. Candidates, with sources

`kind` is drawn from the thirteen the schema allows (kind_note in `rome_roster.json`). Rome's
churches are `historic-site`.

### 3.1 Terme di Caracalla
- **kind** historic-site
- **address** Viale delle Terme di Caracalla 52, 00153 Roma
- **what** Imperial bath complex on three descending terraces, with a rectangular outer precinct
  enclosing a central block. The precinct held two symmetrical libraries on the south side,
  latrines east and west, and the cisterns. The central block runs on a single axis —
  *calidarium*, *tepidarium*, *frigidarium*, *natatio* (the one open-air room) — with two
  *palestre* and the changing rooms symmetrically east and west, and an upper floor over the
  *palestre* used for depilation and massage. The main entrances were on the north front, over
  *tabernae* that opened onto the via Nova. Roughly two kilometres of underground service galleries
  survive, carrying the furnaces and boilers, a water plant, a mill, and a Mithraeum with its
  *fossa sanguinis* still legible.
- **built** Begun under Marcus Aurelius Antoninus Bassianus (Caracalla), inaugurated 216 AD; the
  works continued past his death in 217 and were finished under Elagabalus and Alexander Severus.
  Restored repeatedly, notably under Constantine. The baths stopped working in **537 AD**, when
  Vitiges cut the aqueducts during the Gothic siege. Supplied by the *Aqua Antoniniana*, an
  aqueduct branch built for them.
- **admin** Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma. Responsabile Dott.
  Rocco Bochicchio. Ticketed. Tickets are nominative and sold only through the Musei Italiani
  portal, the Musei Italiani app, or the on-site desks and totems; the Soprintendenza states no
  guided-visit or skip-the-line add-ons are offered.
- **hours (as published)** Closed Monday. 1–28 March 9.00–17.30, last admission 16.30. 29 March –
  31 August 9.00–19.15, last admission 18.00. 1–30 September 9.00–19.00, last admission 18.00.
  1–25 October 9.00–18.30, last admission 17.30. (The calendar continues past 25 October; a
  writer should re-read the live page rather than extrapolate.)
- **sources**
  - `https://soprintendenzaspecialeroma.it/luoghi/terme-di-caracalla/` (official; description,
    address, transport, hours, ticketing rules, Domus di Vigna Guidi)
  - `https://it.wikipedia.org/wiki/Terme_di_Caracalla` via `action=parse` (dating to 212–216 from
    brick stamps; managing body; ~130,000 m²; official site pointer to museiitaliani.it)
- **boundary** San Saba by both methods. Centroid and two probe points (NW 41.8810/12.4908, SE
  41.8776/12.4944) all fall inside the ring; Nominatim `quarter = San Saba`, road Via Antonina.
  Wholly contained — not a straddler.
- **watch** it.wikipedia calls the baths "uno dei più grandiosi esempi" and "le più imponenti mai
  edificate nell'Impero"; the Soprintendenza's own hero line is "un complesso senza pari
  nell'antichità" and "Una testimonianza unica". **All banned.** The publishable substitutes are
  the dates, the 537 cut-off, the ~2 km of galleries, the room sequence, the 130,000 m².

### 3.2 Domus di Vigna Guidi
- **kind** historic-site (or fold into 3.1 — it is inside the ticketed circuit, not a separate gate)
- **what** A house that predates the baths, on their south-east side, with detached frescoes
  re-displayed since 2022 after restoration. A *sacello* shows the Egyptian deities Anubis, Isis
  and probably Osiris facing Jupiter, Juno and Minerva.
- **found** Discovered between 1858 and 1869 by Giovan Battista Guidi, honorary inspector of
  Antiquities; recovered, re-excavated and studied again from 1970.
- **access** Included in the ordinary Caracalla ticket. The Soprintendenza states it is closed to
  the public on heavily attended days such as the first Sunday of the month, for conservation.
- **sources** `https://soprintendenzaspecialeroma.it/luoghi/terme-di-caracalla/`
- **boundary** San Saba by both methods (Nominatim `quarter = San Saba`, Via Antoniniana). This
  was the single point that resolved cleanly during the rate-limited first pass.
- **watch** The Soprintendenza calls the *sacello* "un unicum". Banned; state what is depicted.

### 3.3 Basilica di San Saba
- **kind** historic-site
- **address** Via di San Saba 19; the church fronts Piazza Gian Lorenzo Bernini, and the parish
  office has a rear entrance at Piazza Gian Lorenzo Bernini 20.
- **what** The church the rione is named for, on the Piccolo Aventino. Twelfth–thirteenth-century
  rebuilding, raised above an earlier church that survives in the closed undercroft. Further work
  in the 15th, 16th and 18th centuries. The medieval fabric was partly reinstated in the
  restorations of 1900–01 and 1943; the original façade is still masked by a structure with an
  18th-century portico and a 15th-century upper loggia.
- **history** Hermits settled in the 7th century on the ruins of what was probably the *statio* of
  the fourth cohort of the *vigiles*. In the 8th century monks from the community founded at
  Jerusalem by St Sabas took the site and founded a monastery; between the 8th and 9th centuries
  the popes used its abbots as envoys to Constantinople. Holdings included the castle of Marino
  (1253) and the Castello di Palo (1330). The community passed to the Benedictines of Montecassino
  around the 10th century, to the Cluniacs in 1144, to the Cistercians in 1503, and from 1573 to
  the Collegio Germanico-Ungarico under the Jesuits, who still hold it. Erected a parish on
  **5 December 1931** by the bull *Incolarum numero* of Pius XI.
- **hours (parish's own site)** Basilica Monday–Saturday 08.00–12.00 and 16.00–19.30; Sunday and
  solemnities 09.00–13.00 and 16.00–19.30. Parish office Monday–Friday 10.00–12.00. Rosary daily
  18.00. Mass weekdays 09.00 and 18.30; Sunday and solemnities 10.30, 12.00, 18.30.
- **sources**
  - `https://www.parrocchiasansaba.it/orari-e-contatti/` (official; addresses, hours, Jesuit
    community, phone +39 06 64580140)
  - `https://www.parrocchiasansaba.it/` (site structure: "Storia e arte", "Il Rione")
  - `https://it.wikipedia.org/wiki/Basilica_di_San_Saba` via `action=parse`
- **boundary** San Saba by both methods (Nominatim `quarter = San Saba`, road Piazza Gian Lorenzo
  Bernini). 230 m inside the edge.
- **watch** it.wikipedia says the monastery "nel IX secolo era considerato il più importante della
  città". Banned. The sequence of orders and the 1931 parish date carry the same weight honestly.

### 3.4 Monastero di San Saba
Adjoins the basilica (OSM `historic=monastery`, 41.87850/12.48521, ~30 m from the church). It is
the same complex as 3.3 and the Jesuit community lives there. **Recommend folding into 3.3** rather
than shipping a second record — the parish site treats them as one place and no separate visiting
arrangement was found.

### 3.5 Basilica di Santa Balbina all'Aventino
- **kind** historic-site
- **address** Via di Santa Balbina 8 (OSM + Nominatim). The modern main approach is from Viale
  Guido Baccelli up the **Scalea Padre Simpliciano della Natività** — a named stair, itself mapped.
- **what** A hall church, single space without aisles, with alternating rectangular and
  semicircular side chapels between piers, some frescoed. Ancient Roman mosaics were laid in the
  floor in the 1930s, brought from the Via dei Fori Imperiali excavations. A Cosmatesque episcopal
  cathedra stands in the apse. The apse frescoes (*Gloria di Cristo* with Ss Felicissimo, Balbina,
  Quirinus and a pope) and the triumphal-arch *St Peter* and *St Paul* were painted by **Anastasio
  Fontebuoni in 1600** for Cardinal Pompeo Arrigoni, titular from 1597. Present façade is a
  16th-century remaking.
- **built** The masonry (*opera listata* and brick) suggests 4th century, but the building may have
  begun as part of a rich private *domus* — identified from brick stamps as the house Septimius
  Severus gave to Lucius Fabius Cilo, twice consul and *praefectus urbi*, at the start of the 3rd
  century. First attestation of the *titulus* is the synod of **595**.
- **status** Not a parish; a place of worship dependent on the Vatican basilica. The adjoining
  fortified convent, now dedicated to St Margaret of Cortona, is a hostel run by the Suore
  Francescane dei Sacri Cuori, today for elderly and socially vulnerable residents.
- **sources**
  - `https://it.wikipedia.org/wiki/Basilica_di_Santa_Balbina_all%27Aventino` via `action=parse`
  - `https://www.romasegreta.it/s-saba.html` (Roma Segreta lists S.Balbina under S.Saba; also the
    Domus Cilonis identification)
- **boundary** San Saba by both methods (Nominatim `quarter = San Saba`, Via di Santa Balbina 8).
  327 m inside the edge.
- **gap** **No opening hours found from any source.** A page must say so plainly, e.g. "No source
  states its opening hours, so none are given here" — not that a fetch failed.
- **note** OSM tags the neighbouring convent building "Convento di Santa Dorotea"
  (41.88094/12.48938, `historic=monastery`); Nominatim reverses it to Piazza di Santa Balbina and
  it.wikipedia names the convent for St Margaret of Cortona. **The two names conflict and I could
  not reconcile them.** Recommend not shipping a separate convent record.

### 3.6 Chiesa dei Santi Nereo e Achilleo
- **kind** historic-site
- **address** Viale delle Terme di Caracalla 28, 00153 Roma (Diocese of Rome record)
- **what** Three-nave church with a wooden roof, facing the road across a small forecourt. The
  façade keeps the form given it under Sixtus IV and carries geometric sgraffito decoration by
  **Girolamo Massei**, commissioned by Cardinal Cesare Baronio. The mosaic outside the apsidal arch
  — Annunciation, Transfiguration, Theotokos — survives from the time of Leo III. The two side
  altarpieces are in situ: Durante Alberti's *Madonna adored by angels* on the right, Cristoforo
  Roncalli (il Pomarancio)'s *Ss Nereus, Achilleus and Domitilla* on the left. The relics of the
  martyrs are in an urn under the high altar.
- **history** Founded on the site of the *titulus fasciolae*, instituted under Julius I (337–352);
  recorded under the martyrs' names in a letter of Gregory the Great of 600. A basilica was built
  under Leo III (795–816), abandoned and ruined. Sixtus IV (1471–84) rebuilt it shortly before the
  Holy Year, cut two bays, and raised it to a cardinal's title. Cardinal Cesare Baronio of the
  Roman Oratory had it restored and decorated in **1597**, at Clement VIII's urging, ahead of the
  1600 Jubilee.
- **status** A rectory of the parish of Santa Maria in Vallicella, run by the Congregazione
  dell'Oratorio di Roma.
- **hours — CONFLICT.** The Soprintendenza page says "Ogni sabato dalle 10.00 alle 12.00". The
  Diocese of Rome record says "Chiesa aperta martedì e giovedì dalle 9.00 alle 12.00". **Two
  official sources, two different answers.** The verifier must pick or the page must give neither.
- **sources**
  - `https://soprintendenzaspecialeroma.it/luoghi/basilica-dei-ss-nereo-e-achilleo/` (official)
  - `https://www.diocesidiroma.it/phpenti/ente/?ID=939` (official; address, parish of belonging,
    rector Fr Simone Raponi appointed 01/07/2022, hours)
  - `https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Nereo_e_Achilleo_(Roma)` via `action=parse`
- **boundary** San Saba by both methods (Nominatim `quarter = San Saba`, Viale delle Terme di
  Caracalla). 68 m inside the edge. **Note the source conflict**: it.wikipedia's own article on the
  church places it "nel rione Celio", while it.wikipedia's *San Saba (rione di Roma)* article lists
  it under San Saba, as does Roma Segreta. Both geographic methods say San Saba. This is a
  Wikipedia internal contradiction, not a boundary problem.
- **watch** it.wikipedia says the sgraffito façade "rappresenta un caso unico". Banned.

### 3.7 Chiesa (Basilica) di San Cesareo de Appia
- **kind** historic-site
- **address** Via di Porta San Sebastiano 2, 00153 Roma
- **what** The building has the form given it at the start of the 17th century under Clement VIII
  Aldobrandini. Coffered wooden ceiling and a nave painting cycle attributed to the Cavalier
  d'Arpino; Cosmatesque presbytery furnishings brought from San Giovanni in Laterano; extensive
  mosaic decoration; a plain façade with sparse columns and pilasters and large blind panels. Under
  the church is a 2nd-century AD imperial-age space, probably a bath building, found in the
  mid-1930s, with an extensive marine-motif mosaic floor.
- **admin** Previously under the Direzione musei statali della città di Roma; now a holding of the
  **Parco Archeologico dell'Appia Antica**, which says the transfer follows from its position on
  Via di Porta San Sebastiano along the first mile of the Appia.
- **access** **Visible from the street only.** Restoration works are under way that will allow
  public access. Publish it as a street-front sight, not as a visit.
- **sources**
  - `https://www.parcoarcheologicoappiaantica.it/luoghi/basilica-di-san-cesareo-de-appia/`
    (official; description, address, access status, 1959 state ownership)
  - `https://www.romasegreta.it/s-saba/s-cesareo-de-appia.html` (Roma Segreta files it under S.Saba)
- **boundary** San Saba by both methods (Nominatim `quarter = San Saba`, Via di Porta San
  Sebastiano). 28 m inside the edge — close, but both methods agree and the address is on the
  San Saba side of the street.
- **watch** The Parco says the basilica is "l'unica fabbrica superstite" among the many late-antique
  and medieval churches dedicated to St Caesarius. That is a superlative. Drop it.

### 3.8 Casina del Cardinal Bessarione
- **kind** historic-site
- **address** Via di Porta San Sebastiano 8 (OSM housenumber; the Sovrintendenza page gives the
  street without a number), at the ancient fork of the Appia and the Latina
- **what** A suburban Renaissance villa with an Italianate garden. Present form is 15th century,
  built on medieval fabric that itself encloses Roman structures. Recent excavation below the
  basement found funerary structures of the 1st century BC and a building with at least three
  phases from the early imperial period to the first half of the 2nd century AD, from which survive
  black-and-white mosaic paving and an *opus mixtum* wall embedded in the ground floor's south-west
  masonry. The medieval phase in the south-west relates to a hospital run in the early 14th century
  by the *fratres cruciferi*, later a Benedictine nunnery. The extension towards the street with the
  first-floor loggia, and the conversion into the summer residence of the cardinal titular of
  Tusculum, date to the second half of the 15th century — hence the attribution to Cardinal
  Giovanni Bessarione, titular of Tusculum 1449–68. Arms of Cardinal Giovanni Battista Zeno
  (titular 1479–1501) and Marcello Crescenzi (cardinal from 1542) survive in the fresco decoration
  of some rooms and of the loggia. The *piano nobile* hall frescoes are the set worth naming.
- **later history** Granted by Clement VIII in 1600 to the Collegio Clementino (founded 1594); after
  the college was suppressed in 1870 passed to the Convitto Nazionale; reduced to an inn between the
  late 1800s and early 1900s; ceded by the State to the Comune di Roma in 1926; restored and
  inaugurated **1933**. Now one of the Comune's representative venues.
- **access and price (official)** Groups only on Saturday and Sunday, maximum 15 per visit, booking
  compulsory on 060608 (09.00–19.00). Individual visits also possible by booking on 060608 on a
  published calendar. Full €4.00, reduced €3.00; free for residents of Rome and the metropolitan
  area on production of proof of residence, and free for MIC card holders. Guided tours are not
  included in the entry price. Closed Monday to Friday.
- **sources**
  - `https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/la_casina_del_cardinal_bessarione`
    (official, Sovrintendenza Capitolina)
  - `https://www.romasegreta.it/s-saba/casina-del-cardinal-bessarione.html`
  - it.wikipedia's *San Saba (rione di Roma)* lists it under San Saba's civil architecture
- **boundary** San Saba by both methods (Nominatim `quarter = San Saba`). Sits 1 m inside the ring —
  the closest non-straddler in the file. Both methods agreeing at 1 m is why it is not in §4, but a
  cautious arbitrator may want it double-checked.
- **watch** The Sovrintendenza calls it "un raro esempio di villa rinascimentale extraurbana".
  "Raro esempio" is close enough to a ranking claim that I would not carry it.

### 3.9 Arco di Druso
- **kind** historic-site
- **what** Not a triumphal arch, despite centuries of being taken for one and wrongly identified
  with an arch said to have been raised on the Appia for Drusus the Elder in 9 BC. It is a *fornix*
  of the **Aqua Antoniniana**, the branch of the Aqua Marcia that Caracalla had built to supply his
  baths. What stands is two columns on high plinths framing the outward face, and part of a
  triangular pediment. Under Honorius in the early 5th century it was tied to Porta San Sebastiano
  by two now-vanished walls, for defence.
- **admin** Sovrintendenza Capitolina ai Beni Culturali.
- **sources**
  - `https://it.wikipedia.org/wiki/Arco_di_Druso` via `action=parse`
  - `https://www.romasegreta.it/s-saba/arco-di-druso.html` (Roma Segreta files it under S.Saba)
- **boundary — DISPUTED, see §4.** Ring test: San Saba, 1 m inside. Nominatim: `quarter = San
  Saba`. Roma Segreta: San Saba. **it.wikipedia's *Celio* article lists it under Celio's
  archaeological sites.** Two geographic methods and one aggregator against one aggregator.
  Flagged for the arbitrator; the Celio finder will have seen it too.

### 3.10 Porta San Paolo
- **kind** historic-site
- **address** Piazza di Porta San Paolo / Via Raffaele Persichetti
- **what** A gate of the Aurelian Walls. Originally two gates flanked the Pyramid of Cestius, built
  to ease traffic between the city and the port of Ostia; the western one, running towards the
  granaries of the Marmorata on the Tiber bank, was later closed as the via Portuense took over and
  was **demolished in 1888**. The surviving gate's Roman name was **Porta Ostiensis**, the start of
  the via Ostiense. Renamed for the road out to San Paolo fuori le Mura. Restructured by Honorius
  **between 401 and 403**, who reduced it to a single *fornix*.
- **admin** Sovrintendenza Capitolina.
- **sources** `https://www.sovraintendenzaroma.it/content/porta-san-paolo` (official);
  `https://www.romasegreta.it/s-saba/porta-s-paolo.html`
- **boundary** San Saba by both methods (Nominatim `quarter = San Saba`, road Via Raffaele
  Persichetti 3). 16 m inside the ring. **This will surprise a reader** — the gate reads as
  Testaccio's, and the Pyramid 60 m away *is* Testaccio's (§5). Note the gate and the pyramid are
  in different rioni; this is exactly the sort of thing the arbitrator should confirm.
- **watch** The Sovrintendenza's own opening line is "tra le più maestose e meglio conservate
  dell'intera cerchia". Banned even attributed. The 1888 demolition, the 401–403 rebuild and the
  single fornix are the honest content.

### 3.11 Museo della Via Ostiense
- **kind** museum
- **address** Via Raffaele Persichetti 3, inside Porta San Paolo
- **what** A museum housed in the rooms of Porta San Paolo, on the Ostiense road.
- **sources** OSM `tourism=museum`, `wikidata=Q3329978`, address tag, website tag pointing to
  `http://archeoroma.beniculturali.it/musei/museo-ostiense`;
  `https://nominatim.openstreetmap.org/reverse?…lat=41.876708&lon=12.481442` (Via Raffaele
  Persichetti 3, `quarter = San Saba`)
- **PROBLEM — no institutional source obtained.** The `archeoroma.beniculturali.it` host does not
  resolve; `ostiaantica.beniculturali.it`, `ostiaantica.cultura.gov.it` and `turismoroma.it` search
  all timed out; `060608.it` is a JavaScript application that serves no readable body; `museiitaliani.it`
  likewise. **Nothing was fetched that states its hours, its managing body, or whether it is
  currently open.** Under the evidence rule this cannot ship with any operational claim. Either
  ship a one-line record of what the museum is with no hours and no operator, or hold it. Worth a
  second attempt in the verify pass from a different network path.
- **boundary** San Saba by both methods.

### 3.12 Palazzo delle Poste Roma Ostiense (Via Marmorata)
- **kind** historic-site
- **address** Via Marmorata 4
- **what** A post office building. Symmetrical, on a wide flight of steps, laid out on geometric
  ratios and the golden section; three volumes in a U around a rectangular court; faced in smooth
  white marble; a portico closes the court on the front; the end blocks carry a crossed-diagonal
  motif masking the internal stairs. It houses the "Roma Ostiense" post office (frazionario 55645);
  OSM independently carries `amenity=post_office` for the working office at the same address.
- **built** The 1932 competition, called by the Ministero delle Comunicazioni, was won by
  **Adalberto Libera**; **Mario De Renzi** was later established as co-author (the rules obliged a
  single signature, so De Renzi is often uncredited). Built **1933–35**, inaugurated **28 October
  1935**.
- **sources**
  - `https://it.wikipedia.org/wiki/Edificio_postale_di_Roma_(via_Marmorata)` via `action=parse`
    (which also categorises the building under *Roma R. XXI San Saba*)
  - it.wikipedia's *San Saba (rione di Roma)* lists it, citing
    `http://www.archidiap.com/opera/palazzo-delle-poste-in-via-marmorata/` — I did **not** succeed
    in reading the ArchiDiAP page itself, so the De Renzi attribution rests on it.wikipedia alone.
- **boundary** San Saba by both methods (Nominatim `quarter = San Saba`, Via Marmorata 4), 45 m
  inside the ring. Via Marmorata is the Testaccio boundary, so the *street* is shared; the building
  is on the San Saba side. Worth a sanity check by the arbitrator against the Testaccio file.

### 3.13 Palazzo FAO
- **kind** historic-site
- **address** Viale delle Terme di Caracalla, 00153 Rome (FAO's own contact page). It stands at the
  start of Viale Aventino on the corner with Viale delle Terme di Caracalla.
- **what** The headquarters of the Food and Agriculture Organization of the United Nations.
- **built** Designed by **Vittorio Cafiero and Mario Ridolfi**, begun **1938** as the seat of the
  Ministero dell'Africa Italiana (the former Ministero delle Colonie, abolished 1953); finished
  after the war and completed in **1952**, then given to FAO. it.wikipedia's *San Saba* article
  gives 1951 for the inauguration while the *Palazzo FAO* article gives 1952 and a construction span
  of 1938–52 — **the two dates disagree and I could not settle it**. Give one only if the verifier
  finds a third source.
- **also** Viale Aventino, opened in those years, was originally named Viale Africa; the name later
  moved to a street in EUR (it.wikipedia, *San Saba* article).
- **sources**
  - `https://www.fao.org/contact-us/en` (official; headquarters address)
  - `https://it.wikipedia.org/wiki/Palazzo_FAO` via `action=parse`
  - `https://it.wikipedia.org/wiki/San_Saba_(rione_di_Roma)` via `action=parse`
- **boundary** San Saba by both methods (Nominatim `quarter = San Saba`, Viale Aventino), 98 m
  inside. The OSM building way and the FAO office node both land in San Saba.
- **DO NOT PUBLISH** the extraterritoriality claim (see §2), nor the $1 symbolic rent / *usucapione*
  story, which it.wikipedia carries without a citation.

### 3.14 Piazza Albania and the Monumento a Giorgio Castriota Scanderbeg
- **kind** historic-site (the monument) / attraction (the square)
- **what** An equestrian bronze of the Albanian national figure Giorgio Castriota Scanderbeg
  (1403–1468), on a semi-oval pedestal above a rectangular travertine base. He is shown riding at a
  walk in Albanian dress, with the two-horned helmet.
- **made** it.wikipedia's *San Saba* article gives a bronze of **1939** by the sculptor **Romano
  Romanelli**. The Sovrintendenza page I read describes the work but the description text I
  captured stops before any date; a writer should re-read it for the date rather than lean on
  Wikipedia.
- **sources**
  - `https://www.sovraintendenzaroma.it/content/monumento-giorgio-castriota-scanderbeg-1` (official)
  - `https://www.romasegreta.it/s-saba/piazza-albania.html`
  - `https://it.wikipedia.org/wiki/San_Saba_(rione_di_Roma)` via `action=parse`
- **boundary** The square is San Saba by both methods (Nominatim `quarter = San Saba`, road Piazza
  Albania), 25 m inside; the monument node likewise, 28 m inside. **But the Scatola Archeologica at
  Piazza Albania 35 is Ripa by both methods** — see §4.4. The square straddles the Ripa/San Saba
  line and the two features fall on opposite sides of it.

### 3.15 Parco della Resistenza dell'Otto Settembre, with the Fontana dell'Anfora
- **kind** park
- **what** The green space behind the Palazzo delle Poste, bounded by Piazza Albania, Via della
  Piramide Cestia, Via Marmorata and Viale Manlio Gelsomini. Originally **Parco Cestio**, for the
  nearby Pyramid; renamed for the fighting at Porta San Paolo on 8 September 1943. The name Parco
  Cestio stayed with the smaller patch of green on the far side of Via Marmorata, which is in
  Testaccio. The **Fontana dell'Anfora**, also by de Vico, is a wide circular basin at ground level
  with an octagonal travertine base carrying a bronze amphora with eight raised spouts, a central
  jet, and eight holes in the belly of the vessel.
- **built** Inaugurated **21 April 1939**, to a design by the architect **Raffaele de Vico**.
- **sources** `https://www.romasegreta.it/s-saba/fontana-dellanfora.html` (Roma Segreta, published
  17 September 2025)
- **boundary** San Saba by the ring test (80 m inside for the park, 94 m for the fountain).
  Nominatim was not run on these two points. Single-method — flag as lower-confidence than the rest,
  though 80 m is not marginal.
- **note** Do not confuse with the **Fontana delle Anfore** by Pietro Lombardi, which is a different
  fountain in Testaccio (OSM has it at 41.87955/12.47706, outside the ring).

### 3.16 The ICP garden quarter (Quadrio Pirani)
- **kind** historic-site / attraction — a district, not a building. This is the thing a guide would
  actually walk you through, and it is the subject the brief called "Villaggio Operaio".
- **what** Between 1907 and 1914 the Blocco Popolare administration under mayor **Ernesto Nathan**
  had the **Istituto Case Popolari** build **ten lots** of housing on the Piccolo Aventino, between
  the church and the walls, for the lower-middle salaried class — among the last planned residential
  settlements inside the Aurelian Walls. The area had been zoned as public green by the post-1870
  plan, next to the Passeggiata Archeologica. The quarter was designed, like the ICP housing in
  Testaccio, by the then-young **Quadrio Pirani** (1878–1970), and the streets were named after
  architects: Bernini, Borromini, Baccio Pontelli, Palladio, Pirro Ligorio, Bramante, and so on.
  The buildings are two-family villini each with a small garden, and blocks of no more than four
  floors with courtyards, each faced in brick the colour of the old brickwork of the church and the
  walls. The site is a plateau on a hilltop, so the quarter is crossed by ramps and stairways
  dropping to the walls or to Testaccio below.
- **corroboration in the map data** Via Baccio Pontelli and Via Andrea Palladio are both tagged
  `highway=steps` in OSM — the stairways are literally in the street network. Viale Giotto runs
  along the inside of the Aurelian Walls.
- **the cippus** it.wikipedia's *San Saba* article reproduces an inscription on a *cippo* walled
  into the façade of a 1930 apartment building, recording that Augustus made public the land on
  which the newer part of the rione stands: `ID QVOD INTRA / CIPPOS AD CAMPVM / VERSVS SOLI EST /
  CAESAR AVGVSTVS / REDEMPTVM A PRIVATO / PVBLICAVIT`. A nice detail, but I found **no street
  address for it** and no source beyond the photo caption. Do not publish a location for it.
- **sources**
  - `https://it.wikipedia.org/wiki/San_Saba_(rione_di_Roma)` via `action=parse`
  - `https://it.wikipedia.org/wiki/Quadrio_Pirani` via `action=parse` (ICP career from 1904;
    head of the ICP technical office 1910)
- **boundary** All probe points (Viale Giotto 41.8771/12.4832; Via Bramante 41.8779/12.4869; Via
  Baccio Pontelli 41.8774/12.4857) fall in San Saba by the ring test, 62–106 m inside; Nominatim
  returned `quarter = San Saba`, Viale Giotto 3d.
- **watch** Portoghesi calls Pirani's Testaccio work "la prova più matura della sua carriera" —
  that is about Testaccio, and it is a superlative. Keep it out. Also avoid "the last settlement
  inside the walls"; "among the last planned residential settlements inside the Aurelian Walls" is
  itself close to a ranking claim and I would cut it to the plain dates.

### 3.17 Mercato di San Saba
- **kind** shop
- **what** The rione's neighbourhood market. OSM `amenity=marketplace` at 41.87886/12.48676.
- **sources** OSM only. Nominatim reverses the point to `quarter = San Saba`, road Via Salvator
  Rosa — which is not in it.wikipedia's street list for the rione, so the road attribution is
  probably a nearest-road artefact. **No Roma Capitale market record was obtained**; the
  comune.roma.it search endpoints all returned 404 and 060608.it serves no readable body.
- **verdict** Ship only as a bare "there is a neighbourhood market here" with no hours, no address
  and no stall count, or hold it. I would hold it.
- **boundary** San Saba by both methods, 172 m inside.

### 3.18 Stadio "Nando Martellini" (Terme di Caracalla)
- **kind** stadium
- **address** Largo delle Vittime del Terrorismo 1 (OSM address tag)
- **what** An athletics stadium immediately north of the baths.
- **sources** OSM `leisure=stadium` + address tag; Nominatim `quarter = San Saba`, Viale delle
  Terme di Caracalla. it.wikipedia's *Santa Balbina* article refers to "il moderno Stadio delle
  Terme" as a landmark. **it.wikipedia has no article on it** (`Stadio delle Terme di Caracalla`
  is a 35-byte redirect stub) and no Roma Capitale sports page was reached — `sportecultura.roma.it`
  does not resolve.
- **verdict** Thin. Ship with the name, the kind and the address, or hold. No opening or event
  information should be asserted.
- **boundary** San Saba by both methods, 181 m inside.

### 3.19 The Caracalla Festival (Teatro dell'Opera di Roma)
- **kind** theater
- **what** The Teatro dell'Opera di Roma's summer season staged at the Terme di Caracalla.
- **what I could actually verify** `operaroma.it/stagione/` carries **"Caracalla Festival"** as a
  live genre filter in the current season browser, alongside "Circo Massimo" and "Teatro Nazionale".
  `operaroma.it` also carries a "Partner Caracalla" sponsor section. The theatre's *Come
  raggiungerci* page currently lists directions for the Teatro Costanzi, the Teatro Nazionale, the
  Circo Massimo and the Basilica di Massenzio — **and not Caracalla**; and `operaroma.it/biglietteria/mappe-teatri/`
  offers seating maps only for the Costanzi and the Nazionale. The pages at `operaroma.it/caracalla/`
  and `/en/caracalla/` are a 2015 archive.
- **verdict** The festival is real and the theatre's own site names it, but **nothing I fetched
  establishes a current Caracalla venue address, current dates, or that the 2026 season plays
  there.** Publish it, if at all, as "the Teatro dell'Opera di Roma programmes a Caracalla Festival"
  with the operaroma.it season page as the source, and nothing operational. Do not lift the 2015
  programme.
- **sources** `https://www.operaroma.it/stagione/`,
  `https://www.operaroma.it/biglietteria/informazioni/informazioni-generali/come-raggiungerci/`,
  `https://www.operaroma.it/biglietteria/mappe-teatri/`

### 3.20 Il Terzo Paradiso (Michelangelo Pistoletto), at the Baths
- **kind** attraction
- **what** A Pistoletto *Terzo Paradiso* work inside the Baths precinct. OSM carries it twice —
  `tourism=artwork` at 41.87898/12.49122 and an interpretive panel at 41.87923/12.49117 reading
  "Il Terzo Paradiso di Michelangelo Pistoletto".
- **sources** OSM only. The Soprintendenza's Caracalla page does not mention it in the text I read.
- **verdict** Real and inside the ticketed area, but single-source. Either fold a sentence into 3.1
  or hold. Do not ship as its own record on OSM alone.
- **boundary** San Saba, 270 m inside.

### 3.21 Angelo Mai
- **kind** theater (arts centre)
- **address** Viale delle Terme di Caracalla 55a (OSM address tag; Nominatim confirms the number)
- **what** An independent arts centre, `amenity=arts_centre` in OSM, `website=https://www.angelomai.org/`.
- **PROBLEM** `https://www.angelomai.org/` returned **HTTP 500** on every attempt. No programme,
  no hours, no self-description obtained.
- **verdict** Hold unless the verifier gets the site up. It would be a genuinely good entry for a
  rione this quiet, so it is worth retrying.
- **boundary** San Saba by both methods, 99 m inside.

### 3.22 Libreria Internazionale Il Mare
- **kind** shop
- **address** **Via Leon Battista Alberti 1, Rione San Saba, 00153 Roma** — the shop's own site
  names the rione in its footer, which is unusually good evidence.
- **what** A bookshop specialising in the sea: books, nautical charts, geographic charts, globes,
  prints, instruments. It prints nautical and geographic charts to custom sizes.
- **sources** `https://www.libreriailmare.it/` and `https://www.libreriailmare.it/chi-siamo`
  (trading as Oltremare Srl). OSM `shop=books`, and Nominatim puts the point in San Saba.
- **watch** **Two banned claims on the shop's own front page**: "La prima e più fornita libreria di
  mare al mondo" is a flat superlative; and "Fondata nel 1975 da Giulia D'Angelo" is a
  how-long-it-has-traded claim, which under the corpus rule an official website does **not**
  establish. The "over 30,000 titles" figure is a count, which is fine, but it is the shop's own
  marketing number. Publish the specialism and the chart-printing service; leave the rest.
- **boundary** San Saba, 148 m inside.

### 3.23 Teatro Anfitrione
- **kind** theater
- **what** OSM `amenity=theatre`, 41.87837/12.48467, on the Via di San Saba block.
- **PROBLEM** `https://www.teatroanfitrione.it/` returns HTTP 200 with a body of exactly one word,
  "Anfitrione". No address, no programme, no hours.
- **verdict** Hold. Nothing publishable beyond the name and the fact that it is a theatre in the
  rione.
- **boundary** San Saba, 210 m inside — comfortably interior.

### 3.24 Eating and drinking
All inside San Saba by the ring test. Grouped because none of them individually carries much
sourced content, and a low-yield rione needs a few.

| name | kind | address | source | note |
|---|---|---|---|---|
| Taverna Cestia | restaurant | Viale della Piramide Cestia 67 | `https://www.tavernacestia.com/` | Own site: Roman cooking, pizza "bassa e scrocchiarella". **Its "dal 1967" / "da più di 50 anni" is a trading-duration claim — not publishable from its own site.** |
| Baccio e i gradini | restaurant | Viale della Piramide Cestia 25 | `https://baccioeigradini.it/` | Own site: "Pizza, fritti & birra". Booking by WhatsApp. |
| La Villetta | restaurant | Viale della Piramide Cestia 53 | site `lavillettadal1940.com` returned **HTTP 403** | Domain name asserts 1940; unusable. OSM address only. |
| Ricca Aventino | restaurant | Piazza Albania 3-5 | OSM only | |
| Saba Caffè & Cucina (Ristorante e Pinseria) | restaurant | Via di San Saba 30 | `https://sabaroma.it/` (200, thin) | |
| al callarello | restaurant | — | OSM only | |
| Torcè | cafe (gelato) | Viale Aventino 59 | OSM only | The Roman gelato name; no site fetched. |
| Tram Depot | cafe | Via Marmorata end | `https://www.tramdepot.it/` is a **parked "sito in costruzione" page** | Also only 22 m inside the ring, on the Testaccio line. Hold. |
| Bar Piramide, Verso, Cafè de Parc, Caffè Braccio, Sake Boutique | cafe | various | OSM only | |
| The Corner Townhouse | hotel | Viale Aventino end | **OSM's `website` tag points to a hair salon in Woodhouse Mill, England.** Wrong site. | Do not publish. Illustrates why OSM website tags need checking. |
| BePlace Aventino | bnb/hotel | Via di San Saba 22 | `https://beplace.eu` (not fetched) | |

**Recommendation:** ship at most three or four of these, and only Taverna Cestia, Baccio e i
gradini and Saba Caffè have a working site of their own. The rest are OSM-only and would be
padding.

### 3.25 Smaller things that are real, in San Saba, and probably below the bar
Listed so the verifier can see what was considered and rejected rather than missed.

- **Piazza Gian Lorenzo Bernini** — the church square; the address of both the basilica's rear
  entrance and the Scuola Primaria Leopoldo Franchetti. Could be folded into 3.3.
- **Piazza Remuria**, **Largo Bruno Baldinotti**, **Largo Enzo Fioritto**, **Largo delle Vittime
  del Terrorismo** — named spaces from it.wikipedia's list, all confirmed inside the ring. No
  content found for any of them.
- **Monumento alle Vittime del Terrorismo** (41.88277/12.49065) and **Monumento alle Torri Gemelle**
  (41.88434/12.48935, reversed by Nominatim to Piazza di Porta Capena) — two memorials in the Porta
  Capena area. Both inside the ring; the Torri Gemelle one is 24 m from the edge and Piazza di
  Porta Capena is a straddler (§4.2). **I found no institutional source for either**: the
  Sovrintendenza site search on "torri gemelle" and "vittime del terrorismo" returns only unrelated
  exhibitions. Hold both.
- **Largo Enzo Fioritto / "Enzo Fioritto" war memorial** (41.87982/12.49003) — OSM
  `historic=memorial; memorial=war_memorial`. No source.
- **Mura Aureliane**, the stretch running behind Viale Giotto — real, mapped, and the visual spine
  of the ICP quarter. Best carried as a sentence inside 3.16 rather than as its own record, since
  the walls run through half the rioni in Rome.
- **Mura Serviane** — OSM has a fragment at 41.88052/12.48816 (inside San Saba, near Santa Balbina)
  and another at 41.88024/12.48294 near Piazza Albania that tests **Ripa**. Roma Segreta says the
  Servian circuit crossed here on a line roughly following today's Viale Guido Baccelli. Fragments
  in two rioni — do not ship as a San Saba place.
- **St Stephen's School** (`wikidata=Q7591776`, `https://sssrome.it`), with its volleyball and
  basketball courts — a private international school. Real, in San Saba, and not a visitor place.
- **Scalea Padre Simpliciano della Natività** — the named stair up to Santa Balbina. Fold into 3.5.
- **Parco San Saba** (`leisure=playground`) — a playground, not a park record.
- **Ambasciata dell'Arabia Saudita** and **Ambasciata di Palestina** (Viale Guido Baccelli 10,
  `wikidata=Q29447939`) — both inside the rione. Not visitor places, and §2 says do not
  characterise their legal status.
- **Aikido Dojo Shinkokyu** (Piazza Gian Lorenzo Bernini 22), **Farmacia Cestia**, **Farmacia
  Piramide**, **Todis**, **Maury's**, two estate agents, a photographer, a petrol station, a bank —
  ordinary neighbourhood commerce. Named in the map, out of scope for a guide.

---

## 4. Straddlers — NOT resolved here

Every case where the two methods disagree, or where a reputable source disagrees with both.
The arbitrator sees all nine files; I do not.

### 4.1 Santa Maria in Tempulo — San Saba vs Celio
Deconsecrated church on Via di Valle delle Camene, `wikidata=Q3674146`. Ring test: **San Saba**,
16 m inside the edge. Nominatim reverse at 41.88212/12.49372 returned **`quarter = Celio`**; a
second Nominatim probe 10 m away at 41.88220/12.49365 returned **`quarter = San Saba`**.
it.wikipedia lists it under **Celio** ("Sconsacrate"). One building, three answers. It sits
essentially on the line.

### 4.2 Piazza di Porta Capena and the Parco di Porta Capena — San Saba vs Celio
- **Porta Capena** node (41.88394/12.49050): ring **San Saba** 40 m inside; Nominatim
  **`quarter = San Saba`**.
- **Piazza di Porta Capena** probe (41.88400/12.48990): ring **San Saba**, 67 m inside. Roma Segreta
  files *Piazza di Porta Capena* under S.Saba. it.wikipedia's *Celio* article ALSO lists Piazza di
  Porta Capena among Celio's squares, and it.wikipedia's *San Saba* article lists it among San
  Saba's squares — **both rione articles claim the same square.**
- **Parco di Porta Capena** (41.88269/12.49255): ring **San Saba** 20 m inside, but Nominatim
  returned **`quarter = Celio`**, road Via di Valle delle Camene 5. **Methods disagree.**
- **Casina Vignola Boccapaduli** (41.88496/12.48967), the 1538 building moved to its present site
  in 1911 and reopened in December 2025 as a public information point: ring **Celio**, 31 m outside
  San Saba. Roma Segreta discusses it under its *Piazza di Porta Capena* page, which it files under
  S.Saba. **The building is Celio's by geometry; the square it stands on is contested.**

The whole Porta Capena basin is the San Saba / Celio / Ripa triple point and needs one ruling
covering the square, the park, the two memorials in §3.25 and the Casina.

### 4.3 Parco di San Sebastiano — San Saba vs Celio
Ring test: **San Saba**, 59–72 m inside, at both the OSM centroid and an interior probe.
Nominatim: **`quarter = Celio`**, road Via di Porta San Sebastiano. OSM's website tag points at
`sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/…` but the specific page 404s. **Methods
disagree.**

### 4.4 Piazza Albania — the square is San Saba, the Scatola Archeologica on it is Ripa
The square and the Scanderbeg monument test **San Saba** by both methods (25 m and 28 m inside).
The **Scatola Archeologica di piazza Albania all'Aventino** — a Soprintendenza Speciale site whose
own page gives the address as **Piazza Albania 35** — tests **Ripa** by both methods (49 m outside
the San Saba ring; Nominatim `quarter = Ripa`, road Piazza Albania). Source:
`https://soprintendenzaspecialeroma.it/luoghi/scatola-archeologica-di-piazza-albania-allaventino/`
(preventive excavation found a block wall read as a military work, and a massive construction wall
marking a shift from collective defence to private residence; six superimposed floor levels were
detached and re-set in a suspended architectural box, with video mapping by Paco Lanciano and
narration by Piero Angela). Same square, two rioni.

### 4.5 Arco di Druso — see §3.9
Ring **San Saba** at 1 m; Nominatim **`quarter = San Saba`**; Roma Segreta **San Saba**;
it.wikipedia **Celio**.

### 4.6 Oratorio dei Sette Dormienti
Probe at 41.87829/12.49763: ring **San Saba**, 10 m inside. it.wikipedia lists it under **Celio**
("Sconsacrate", su via di Porta S. Sebastiano). Not separately reverse-geocoded. Low value either
way, but flagging it because it is on the same contested street as San Cesareo and the Casina.

### 4.7 Porta San Sebastiano and the Museo delle Mura — San Saba vs Celio vs Ardeatino
- **Porta San Sebastiano** (`wikidata=Q1234193`, Via di Porta San Sebastiano 18): ring test returns
  **Ardeatino**, 2 m outside the San Saba ring — the gate is *in* the wall line, which is the
  boundary. Nominatim returned **no `quarter` at all** for it, twice.
- **Museo delle Mura** (`wikidata=Q3868150`, same address): ring **Celio**, 10 m outside San Saba;
  Nominatim again returned no `quarter`.
- **Roma Segreta files Porta S.Sebastiano under S.Saba.** it.wikipedia's *Celio* article lists it
  under Celio's gates with the explicit gloss "**condivisa ad est tra il rione Celio e il rione San
  Saba**" — i.e. Wikipedia itself says the gate is shared.
Three methods, three answers, and one of the sources says it is shared. **This needs the
arbitrator.** Note the museum is the Sovrintendenza Capitolina's *Museo delle Mura*, one of the
Musei in Comune (`https://www.sovraintendenzaroma.it/i_luoghi/musei/musei_in_comune/museo_delle_mura`).

---

## 5. Things the brief expected in San Saba that are NOT in San Saba

The brief named "the Parco degli Scipioni and the Tomb of the Scipios" as likely San Saba subjects.
**They are not.** This is the strongest negative finding in the file and it is well evidenced.

- **Parco degli Scipioni** — the Sovrintendenza Capitolina's own page states, in a structured
  field: **"Dove si trova: Municipio I, Rione XIX - Celio"**. It also gives the dates 1928–1931,
  16,000 m², entrances at Via di Porta Latina 10 and Via di Porta San Sebastiano (the latter
  currently closed), and the garden design by **Raffaele de Vico**, completed 1931.
  `https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/passeggiate_parchi_e_giardini/parco_degli_scipioni`
  Ring test: **Celio**. Nominatim: **`quarter = Celio`**. Roma Capitale, OSM geometry and Nominatim
  all agree, and it.wikipedia lists it under Celio's *Aree naturali*.
- **Sepolcro degli Scipioni** — Via di Porta San Sebastiano 9. Ring test **Celio**, 23 m outside
  San Saba; Nominatim **`quarter = Celio`**; it.wikipedia lists it under Celio. Official page:
  `https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/sepolcro_degli_scipioni`
  (first notice 1614; real discovery 1780 by the Sassi brothers enlarging a cellar; finds taken to
  the Vatican Museums; municipal excavation, restoration and opening campaign 1926–29; tomb built
  in the first decades of the 3rd century BC for Lucius Cornelius Scipio Barbatus, consul 298 BC).
  **All of this belongs in the Celio file.**
- **Colombario di Pomponio Hylas** — Via di Porta Latina 14. Ring **Celio**; Nominatim
  **`quarter = Celio`**; discovered 1831 by the marchese Pietro Campana, 1st century AD.
- **Piramide di Caio Cestio** — ring **Testaccio**, 28 m outside San Saba; Nominatim returns
  `neighbourhood = Testaccio`, road Via Raffaele Persichetti. It is a Soprintendenza Speciale site
  (`https://soprintendenzaspecialeroma.it/luoghi/piramide-di-caio-cestio/`). **Testaccio's.** Note
  the oddity that the pyramid is Testaccio's while Porta San Paolo 60 m away is San Saba's (§3.10).
- **Casa del Jazz** — Viale di Porta Ardeatina 55, ring **Ostiense**, 66 m outside.
- **Circo Massimo** — ring **Ripa**. (The Circus is 327 m outside the San Saba ring; the OSM
  relation whose centre falls near the boundary is a different, mis-centred element.)
- **Piazzale Ostiense** — ring **Ostiense**.
- **Museo Storico dei Vigili del Fuoco** (Via Marmorata) and the **Cimitero acattolico** — ring
  **Testaccio**.
- **Piazzale Numa Pompilio** — ring **Celio**, though it.wikipedia's *San Saba* article lists it
  among San Saba's squares (and it.wikipedia's *Celio* article lists it too). Another shared name.
- **Colonna viaria di San Cesareo de Appia** — ring **Celio**, 17 m outside, despite being named
  for a San Saba church.
- **Porta Latina**, **Parco Egerio**, **Basilica di San Sisto Vecchio**, **Chiesa di San Giovanni a
  Porta Latina**, **Oratorio di San Giovanni in Oleo**, **Parco Lineare delle Mura** — all outside,
  in Celio or Appio-Latino.

---

## 6. Yield judgement

**Guide, but a thin one — and closer to a town-page than the brief's floor implied.**

Counting only records that (a) sit unambiguously in San Saba by both methods and (b) have at least
one fetched source beyond OSM:

**Firm (9):** Terme di Caracalla · Basilica di San Saba · Basilica di Santa Balbina · Santi Nereo e
Achilleo · San Cesareo de Appia · Casina del Cardinal Bessarione · Porta San Paolo · Palazzo delle
Poste Roma Ostiense · Palazzo FAO.

**Firm but geographically contested (3):** Arco di Druso · Piazza Albania with the Scanderbeg
monument · Parco della Resistenza dell'Otto Settembre with the Fontana dell'Anfora.

**Real but under-sourced, ship-or-hold calls for the verifier (6):** Domus di Vigna Guidi (fold into
Caracalla) · the ICP / Quadrio Pirani garden quarter · Museo della Via Ostiense · Stadio Nando
Martellini · the Caracalla Festival · Angelo Mai.

**Commerce worth at most three or four lines (3–4 of):** Taverna Cestia · Baccio e i gradini · Saba
Caffè & Cucina · Libreria Il Mare.

That is **21 candidates offered, of which I expect 12 to 15 to survive.** The brief predicted
"roughly 14 named entries" and that is about right — but the composition is not what the brief
expected. The Scipios material, which was a third of the brief's named subjects, belongs to Celio
by Roma Capitale's own statement. What replaces it is the ICP garden quarter, the two Aurelian
gates, the four churches, and the two Novecento buildings on the rione's west and north edges.

The honest shape of a San Saba page: **one very large site (the Baths), four churches, one
Renaissance villa, one gate, two Novecento landmarks, and a quiet brick garden-suburb you walk
through.** That is a real guide page. It is not a town-page.

**Where I was not looking hard enough, and know it:** the commercial layer. The rione has ~20
restaurants and cafés in the map and I obtained working first-party sources for three. Someone
prepared to work the Roma Capitale *botteghe storiche* register — which I could not reach — would
probably find two or three more entries with real provenance.

---

## 7. Photographs — noted and NOT sourced (ruling 3)

`"photos": []` everywhere. For the later image wave, these were noticed in passing and are recorded
only so the wave does not start cold:

- The Baths of Caracalla are open-air Roman ruins with no living architect — the cleanest
  freedom-of-panorama case in the rione.
- **Do not assume the same for the Palazzo FAO.** Vittorio Cafiero died 1983 and Mario Ridolfi died
  1984; Italy has no freedom of panorama. The building is a photo problem until the 2050s on the
  same logic the roster already applied to the Palazzo della Civiltà Italiana.
- **Palazzo delle Poste, Via Marmorata**: Adalberto Libera died 1963, Mario De Renzi died 1967.
  Same problem, later expiry than FAO but still live.
- **Il Terzo Paradiso**: Michelangelo Pistoletto is living. Photo reject.
- The Scatola Archeologica at Piazza Albania is a recent architectural installation — treat as
  protected, and it is Ripa's anyway.
- Commons carries `Category:Rione XXI - San Saba` (from the OSM relation's `wikimedia_commons` tag),
  which is where the wave should start for the churches and the ICP streets.

---

## 8. Sources fetched, consolidated

**Official / institutional**
- `https://soprintendenzaspecialeroma.it/luoghi/terme-di-caracalla/`
- `https://soprintendenzaspecialeroma.it/luoghi/basilica-dei-ss-nereo-e-achilleo/`
- `https://soprintendenzaspecialeroma.it/luoghi/scatola-archeologica-di-piazza-albania-allaventino/`
- `https://soprintendenzaspecialeroma.it/luoghi-della-cultura/`
- `https://www.parcoarcheologicoappiaantica.it/luoghi/basilica-di-san-cesareo-de-appia/`
- `https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/la_casina_del_cardinal_bessarione`
- `https://www.sovraintendenzaroma.it/content/porta-san-paolo`
- `https://www.sovraintendenzaroma.it/content/monumento-giorgio-castriota-scanderbeg-1`
- `https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/passeggiate_parchi_e_giardini/parco_degli_scipioni` *(states Rione XIX Celio)*
- `https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/sepolcro_degli_scipioni`
- `https://www.diocesidiroma.it/phpenti/ente/?ID=939`
- `https://www.parrocchiasansaba.it/orari-e-contatti/`
- `https://www.fao.org/contact-us/en`
- `https://www.operaroma.it/stagione/` and `/biglietteria/mappe-teatri/` and
  `/biglietteria/informazioni/informazioni-generali/come-raggiungerci/`

**First-party business**
- `https://www.libreriailmare.it/` and `/chi-siamo`
- `https://www.tavernacestia.com/`
- `https://baccioeigradini.it/`
- `https://sabaroma.it/`

**Aggregators (attributed as aggregators, never as the institution)**
- `https://www.romasegreta.it/s-saba.html` and its sub-pages for Arco di Druso, Casina del Cardinal
  Bessarione, Fontana dell'Anfora, Piazza Albania, Piazza di Porta Capena, Porta S.Paolo,
  S.Cesareo de Appia
- it.wikipedia via `action=parse`: *San Saba (rione di Roma)*, *Celio (rione di Roma)*,
  *Ripa (rione di Roma)*, *Testaccio*, *Basilica di San Saba*, *Terme di Caracalla*,
  *Basilica di Santa Balbina all'Aventino*, *Chiesa dei Santi Nereo e Achilleo (Roma)*,
  *Chiesa di San Cesareo de Appia*, *Arco di Druso*, *Palazzo FAO*,
  *Edificio postale di Roma (via Marmorata)*, *Quadrio Pirani*, *Porta San Paolo*,
  *Casina del Cardinal Bessarione*, *Chiesa di Santa Maria in Tempulo*

**Geographic**
- OpenStreetMap via Overpass (`overpass-api.de`, `overpass.kumi.systems`) and Nominatim
  (`/lookup`, `/reverse`), as detailed in §1

**Reached but unusable**
- `angelomai.org` (HTTP 500) · `lavillettadal1940.com` (HTTP 403) · `tramdepot.it` (parked) ·
  `thecornertownhouse.com` (wrong business entirely) · `teatroanfitrione.it` (one-word body) ·
  `archeoroma.beniculturali.it` (host does not resolve) · `ostiaantica.beniculturali.it`,
  `ostiaantica.cultura.gov.it`, `turismoroma.it` search, `sportecultura.roma.it` (timeouts / no
  such host) · `060608.it` and `museiitaliani.it` (JavaScript applications, no server-rendered body)
  · `coopculture.it` (JavaScript application) · comune.roma.it search endpoints (404)

None of the above may appear in reader-facing prose. Where a fact is missing because a source could
not be read, the page says what it can honestly say and stops.
