# Rome wave 4 — ARBITRATION

Nine rioni, one arbitrator: **Celio · Campo Marzio · Ponte · Regola · Sant'Eustachio · Sant'Angelo ·
Ripa · Testaccio · San Saba.** Ruled 2026-09-02 against all eighteen finder and verdict files, the
wave 1, 2 and 3 arbitrations, `priv/seed_data/rome_roster.json`, and `taken_slugs.py` re-run
mechanically for every contested name.

**The authors follow this file. Where it differs from a verdict file, this file governs.** §9 lists
every place where I am stricter than a verifier; read it twice, because in all three previous waves
the Criticals were authors following the looser document.

---

## 0. THE PRINCIPLES I RULED BY

Wave 1's four, unchanged, plus two the earlier waves established in practice and I state as rules.

- **P1 — Containment, not hosting.** A rione owns what physically stands inside it. Fronting,
  facing, adjoining or being famous for a monument is not owning it.
- **P2 — An institution's own statement of the rione beats a geometry query.** Roma Capitale
  (turismoroma.it, sovraintendenzaroma.it, the SISTO street register), the Soprintendenza Speciale,
  the Parco Archeologico dell'Appia Antica, the Diocese, or the operating institution naming the
  unit in its own voice governs over OSM, Overpass and Nominatim alike. It cuts both ways.
- **P3 — Where nothing establishes containment, the place leaves the wave.** It is not forced into
  the nearest neighbour that happens to be in scope.
- **P4 — A rione not in this wave, or already shipped, is a real owner.** "Campitelli's, and
  Campitelli shipped without it" is a correct outcome, not a failure.
- **P5 — A building is placed by its own footprint, not by the whole length of its street.** Wave
  2's founding case was the Oratorio dei Filippini (46/46 Parione, addressed on a Ponte square).
  Ponte's verifier re-proved it this wave on Palazzo Altemps. An address on a straddling street is
  an address (§4).
- **P6 — A street or square that *is* a boundary is contained by neither side.** It is out as a
  place and usable as an address. Wave 2 applied this to Via Frattina and Via del Seminario; I apply
  it eleven more times in §4.

---

## 1. THE COLOSSEUM — CONFIRMED TO CELIO, AND SAY IT UNMISSABLY

# THE COLOSSEUM IS CELIO'S.

It appears in **`celio.json` and in no other file in this corpus, now or ever.**

I did not inherit wave 1's reservation. Four independent determinations reached me this wave, three
of them from rioni with no stake in the answer:

| Source | Result |
|---|---|
| Celio's verifier, own Overpass pull (overpass.kumi.systems), own stitch of relation 5454335 to a closed 483-vertex ring, own even-odd point-in-polygon on way 1500762394 (`Colosseo (Anfiteatro Flavio)`, `wikidata=Q10285`) | **20/20 vertices Celio. 0/20 Monti. 0/20 Campitelli.** Centroid 41.890216, 12.492300 → Celio, outside both neighbours |
| Ponte's verifier | Re-tested on a freshly fetched polygon set rather than inheriting; reproduced Celio. Ponte makes no claim |
| Sant'Angelo's verifier | Five points, two methods; four of five and both methods Celio, the one dissenter on the Monti perimeter line. No claim |
| San Saba's verifier | Independently saw it.wikipedia's *Celio (rione di Roma)* list the Colosseo among Celio's archaeological sites. No claim |
| Ripa's verifier | Re-tested and confirmed Celio. No claim |

Wave 1 (Campitelli's centroid and four perimeter points, twice) and Monti's own written concession
stand behind that. **Six files across four waves have now tested it and every one returned Celio.**

**Celio's author writes it as `historic-site`, not `theater`** — OSM's `amenity=theatre` is a tagging
artefact. **The seasonal hours block is dropped**: its only route was a six-week-old Wayback capture
of a host that does not answer, which Celio's verifier could not read. The hours field reads exactly:

> No current opening hours are given here. Times and last admission change with the season; the
> Parco archeologico del Colosseo publishes them at colosseo.it, and tickets are sold at
> ticketing.colosseo.it.

Everything else stands: Flavian construction, 70–80 AD, the 438 abolition of the gladiatorial games
under Valentinian III, medieval and Renaissance quarrying, four orders with eighty arcades on each of
the lower three, 189 × 156 m, over 48 m high, 24,000 m², c. 50,000 spectators, arena 76 × 46 m, the
217 fire. **Both superlatives on turismoroma's page stay banned; attribution does not save them.**

**Piazza del Colosseo → CELIO** (wave 1: Celio on both methods in both files; Celio's verifier:
majority Celio by vertex count). **The amphitheatre itself does not straddle and that ruling is
independent of the square's.** No Campo Marzio, Ponte, Regola, Sant'Eustachio, Sant'Angelo, Ripa,
Testaccio or San Saba page may carry the Colosseum as a place, describe it as theirs, or build an
entry around a view of it.

---

## 2. THE MARQUEE RULE — one file each, across the whole corpus, forever

| Marquee | **OWNER** | Evidence |
|---|---|---|
| **Colosseum** | **CELIO** | §1 |
| **Arch of Constantine** | **CAMPITELLI — shipped without it. OUT of wave 4.** | §3.1 |
| **Spanish Steps** (Scalinata di Trinità dei Monti) and **Piazza di Spagna** | **CAMPO MARZIO** | Wave 2 ruled Piazza di Spagna Campo Marzio 83/3 and barred Colonna. Sovrintendenza page re-confirmed line by line |
| **Mausoleum of Augustus** | **CAMPO MARZIO** | Uncontested. Status closed, in the source's words: closed since 6 June 2022 while work on piazza Augusto Imperatore goes forward. 300 Roman feet, c. 87 m — never 89 m, never both |
| **Ara Pacis** | **CAMPO MARZIO** | Uncontested. Two records — the altar and the Museo dell'Ara Pacis — on separate Wikidata items, OSM ways and Roma Capitale pages |
| **Palazzo Farnese** | **REGOLA** | Uncontested; the palace's own visits site |
| **Galleria Spada** | **REGOLA** | Uncontested. Palazzo Spada and the Borromini perspective are separate records in the same file |
| **San Luigi dei Francesi** | **SANT'EUSTACHIO** | Roma Capitale, in its own words: *"Situata nel rione Sant'Eustachio"* (P2) |
| **Sant'Ivo alla Sapienza** | **SANT'EUSTACHIO** | Uncontested; the Sapienza complex and the Archivio di Stato with it |
| **Portico d'Ottavia** | **SANT'ANGELO** | Sovrintendenza's own `Rione: XI - Sant'Angelo`, re-fetched (P2) |
| **Great Synagogue / Tempio Maggiore and the Museo Ebraico** | **SANT'ANGELO** | Uncontested; hours and tariffs re-fetched verbatim |
| **Santa Maria in Cosmedin and the Bocca della Verità** | **RIPA** | Uncontested. One record for the basilica, one for the disc, which is in its pronaos |
| **Circus Maximus** | **RIPA** | Ripa on six of seven readings; the NE tip toward piazza di Porta Capena reads Campitelli, which is shipped and owns none of it |
| **Santa Sabina** | **RIPA** | Uncontested; hours read off the basilica's own site |
| **Pyramid of Cestius** | **TESTACCIO** | Testaccio's own test: 5 of 8 footprint vertices and the centroid Testaccio; it.wikipedia categorises `Roma R. XX Testaccio`; **San Saba's verifier independently confirms it against its own interest** (Nominatim both ways Testaccio at the monument, San Saba both ways at Porta San Paolo 60 m away) |
| **Non-Catholic Cemetery** (Cimitero Acattolico) | **TESTACCIO** | The operator's own words: *"Via Caio Cestio, 6 nel Rione di Testaccio"* (P2). The strongest single attribution in the wave |
| **Monte Testaccio** | **TESTACCIO** | Sovrintendenza's own `Rione: XX - Testaccio` (P2) |
| **Baths of Caracalla** | **SAN SABA** | Uncontested; Soprintendenza Speciale, Viale delle Terme di Caracalla 52. The Domus di Vigna Guidi folds in — one gate, one record |

**Teatro di Marcello — SANT'ANGELO.** Re-ratified against wave 1's own brief, on the Sovrintendenza's
`Rione: XI - Sant'Angelo` field re-fetched this wave. Businesses addressed on via del Teatro di
Marcello still publish under Campitelli (wave 1); Campitelli's shipped `antico-caffe-del-teatro-marcello`
is not disturbed.

**Largo di Torre Argentina — the Area Sacra remains PIGNA's** (shipped, six records). The square is
OUT (§4). The **Teatro Argentina is Sant'Eustachio's** (§5b).

---

## 3. OWNERSHIP TABLE — every place claimed, or claimable, by two files

I intersected all nine finder files as well as reading them, so this is not limited to what the
verifiers noticed. **OUT means no file writes it.**

### 3.1 Celio's seams

| Place | Claimed by | **OWNER** | Evidence |
|---|---|---|---|
| **Colosseum** | Celio | **CELIO** | §1 |
| **Piazza del Colosseo** | Celio | **CELIO** | Wave 1 ruled Celio on both methods in both files |
| **Arco di Costantino** | Celio (S1), notionally Campitelli | **CAMPITELLI — OUT of wave 4** | Celio's own verifier ran the polygon and put **the centroid in Campitelli and outside Celio**, with the footprint 3 Campitelli / 2 Celio. That is a concession against interest from the only claimant. Wave 1 had Nominatim and Overpass containment both saying Campitelli against `is_in` saying Celio. Only it.wikipedia's Celio list points the other way, and it is an aggregator (P2 cuts against it). Campitelli is shipped and does not hold it. **Named owner so it can never land in two files; not writable this wave.** Celio is barred |
| **Meta Sudans** | Celio (S2) | **CAMPITELLI — OUT** | 17/22 Campitelli. Same shape, same ruling |
| **Porta Latina** | Celio (S6) | **OUT — unestablished (P3)** | The OSM node falls in **no polygon at all**. Wave 1's Porta San Giovanni precedent governs: a structure that *is* the boundary is contained by neither side. San Giovanni a Porta Latina and the Oratorio di San Giovanni in Oleo are Celio's and unaffected |
| **Porta San Sebastiano** and the **Museo delle Mura** | Celio (S3/S4), San Saba (§3 #4) | **OUT — unestablished (P3)** | Four methods, four answers: ring = Ardeatino / Celio; Nominatim forward = **Appio-Latino** for the gate and Municipio VII for the museum; Nominatim reverse gives no `quarter`; Roma Segreta says San Saba. **And it.wikipedia's Celio article says outright the gate is *"condivisa ad est tra il rione Celio e il rione San Saba"*.** A source that calls it shared is not a source that places it. San Saba's verifier ruled it not San Saba's to take; I extend that to Celio. Whoever writes anything near it must not promise the wall-walk: the museum's own site carries a closure notice dated 12/06/2026 and states *"Il Museo non è accessibile"* |
| **Arco di Druso** | San Saba (dropped), Celio (S7) | **CELIO — and it does not publish this wave** | it.wikipedia's category is `Roma R. XIX Celio`, the Celio article lists it among Celio's archaeological sites, and Nominatim's reverse at the arch's own way returns Celio. San Saba's verifier dropped it from San Saba on exactly that. **But Celio's verifier found no official page for it and neither register is reachable, so there is no source and it cannot ship.** Owner named, record unwritten. `"di fronte alla Porta San Sebastiano"` stays banned as vague proximity |
| **Sepolcro degli Scipioni · Parco degli Scipioni · Colombario di Pomponio Hylas** | Celio, San Saba (negative finding) | **CELIO, all of it** | **The Sovrintendenza Capitolina's own `Parco degli Scipioni` page carries, in a structured field, `Dove si trova: Municipio I, Rione XIX - Celio`.** Roma Capitale in its own voice (P2), re-fetched by San Saba's verifier. It overrules Roma Capitale's own address-level geocode for the Sepolcro, which lands in San Saba — the footprint is 5/5 Celio. **San Saba is barred.** Route to Celio's author: the Parco's 1928–1931, 16,000 m², de Vico's garden completed 1931, entrances at Via di Porta Latina 10 and Via di Porta San Sebastiano (currently closed), hours 7.00 to sunset, the 1614 discovery, the 1780 re-excavation, Campana's 1831 discovery of the Colombario. **Do not carry "consul 298 BC" or "discovered 1780 by the Sassi brothers" — neither is on the page** |
| **Colombari di Vigna Codini** | Celio (S8) | **OUT — unestablished** | Poly Celio, Nominatim Appio-Latino, access through the Parco Archeologico dell'Appia Antica, and the site sits inside private property. Nobody is arguing the other side and nothing establishes this one |
| **San Sisto Vecchio** and **Complesso Vignola Mattei** | Celio | **CELIO** | Both have address-level geocodes landing in San Saba and both test wholly inside Celio on footprint, San Sisto Vecchio 22/22 and confirmed by the verifier's independent run. San Saba does not claim either. P5 |
| **Casina Vignola Boccapaduli**, piazza di Porta Capena | Celio (proved and lost), San Saba (dropped) | **CELIO — needs a source before it ships** | San Saba's verifier confirms it is listed under **Celio's** civil architecture with coordinates 41.884963/12.489668, matching Celio's own test at 41.885019, 12.489700. Celio's finder proved it and then never recorded it. It publishes only if the author fetches a source; an OSM tag is not one |
| **Santa Maria in Tempulo · Parco di San Sebastiano · Oratorio dei Sette Dormienti** | San Saba (dropped) | **CELIO — unwritten this wave** | San Saba dropped all three to Celio, correctly: all stand on Via di Valle delle Camene or Via di Porta San Sebastiano, which the Celio article's own footnote names as the border, and the Celio article lists them. Celio's file has no researched record for any of them |
| **Sepolcro di Servio Sulpicio Galba** | Testaccio (declined) | **CELIO** | Testaccio's V-M04, confirmed verbatim: *"La tomba di Galba, oggi al Parco archeologico del Celio"*, and the Testaccio object is *"un pannello con la storia di questa tomba"*. **Testaccio has an information board and it is not a place; Celio has the tomb.** Celio's file does not know it holds this. Routed here, unwritten this wave |
| **Via di San Giovanni in Laterano** | Celio (S11) | **OUT as a place (P6)** | The Monti/Celio divide, and Monti is shipped. The individual street numbers each test Celio and publish as Celio **addresses** |
| **Mura Aureliane, Celio stretch** | Celio (S5) | **CELIO, as a named segment** | §6 |

### 3.2 Campo Marzio ↔ Ponte ↔ Colonna (shipped)

| Place | **OWNER** | Evidence |
|---|---|---|
| **Piazza di San Lorenzo in Lucina** | **CAMPO MARZIO** | Wave 2 ruled it Campo Marzio (15/9) and it is now in the wave. **Colonna's shipped basilica stands on it and stays Colonna's; Campo Marzio takes the Rome Baptist Church off the same square on its own footprint (P5). Two churches, one square, two files — that is correct, and Campo Marzio's page must not imply its church is *the* church on the square.** Palazzo Fiano stays Colonna's |
| **Ponte Cavour** | **CAMPO MARZIO** | Wave 3 already tested it and named Campo Marzio on the centroid, ruling it OUT only because Campo Marzio was in no wave. Campo Marzio is now in the wave; Prati shipped three bridges and not this one; it.wikipedia's "Campo Marzio e Prati" is satisfied. Geometry Campo Marzio 25 / Ponte 8. **Grant. State that the bridge lies in two rioni, never as exclusively Campo Marzio's crossing** |
| **Lungotevere Marzio** | **CAMPO MARZIO** | Campo Marzio 25 / Ponte 8, and Ponte's file publishes Lungotevere Tor di Nona and not this one. Uncontested. Ships only if the author has a source |
| **Anfiteatro di Statilio Tauro** | **OUT** | Coordinate tests **Ponte**; the building is destroyed and its site disputed; Ponte does not claim it. it.wikipedia files it under Campo Marzio and is wrong |
| **Albergo dell'Orso** | **OUT (P3)** | No vertex count for the building, sitting at the apex of two Campo Marzio + Ponte straddlers, with a near-identical hotel name testing into Campo Marzio. A three-name collision nobody resolved |
| **Sant'Antonio dei Portoghesi · Santa Maria della Concezione in Campo Marzio** | **CAMPO MARZIO** | Both test wholly inside on footprint (P5); their streets are out as places (§4). The Concezione's **name and slug must carry "in Campo Marzio"** against Ludovisi's shipped Concezione dei Cappuccini |
| **Palazzo Magistrale**, Via dei Condotti 68 | **CAMPO MARZIO** | Italian soil, in rione Campo Marzio. §7 governs the wording |
| **The Pincio, Casina Valadier, the busts, the idrocronometro, the Belvedere, the Muro Torto wall** | **CAMPO MARZIO** | Q. III Pinciano is in no wave and nothing competes. This is a **wording** ruling, not an ownership one — §9.6 |

### 3.3 Ponte ↔ Parione (shipped) ↔ Regola

| Place | **OWNER** | Evidence |
|---|---|---|
| **Santa Maria della Pace** and the **Chiostro del Bramante** | **PONTE** | §5a |
| **Santa Maria dell'Anima** | **PONTE** | §5a |
| **Palazzo Altemps** (the museum, carrying the palace's history — one record) | **PONTE** | Roma Capitale's own Locations both read **Via di Sant'Apollinare**, nos. 8 and 46, and its Palazzo Altemps page says *"quello su via di Sant'Apollinare ha l'ingresso principale"*. **Via di Sant'Apollinare is SISTO cod. 866, PONTE ALONE** — Roma Capitale's own street register (P2). Publish `Via di Sant'Apollinare, 46`; never "Piazza di Sant'Apollinare 46", never it.wikipedia's "Piazza di San Apollinare 44". Wave 3's bar on writing Palazzo Altemps is discharged: Ponte is now in the wave |
| **Piazza dell'Orologio** | **PONTE** | Wave 2 named Ponte the owner (Ponte 60–74) and it is now in the wave. SISTO cod. 7976: PONTE + PARIONE; Parione is shipped without it |
| **Ponte Sant'Angelo** | **PONTE** | Borgo is shipped and holds Castel Sant'Angelo and the Passetto only. Geometry 28/27 settles nothing; **the historical argument carries it**: the rione is named for the bridge, its arms depict it (*"Il ponte S. Angelo bianco in campo rosso"*, Pietrangeli), and it.wikipedia states it belonged to the rione until Sixtus V created Borgo. Roma Capitale dates it 136 AD — use that or neither. The 1668 angels publish as Roma Capitale writes them: Bernini designed the figures at Clement IX's commission and entrusted execution to his pupils. **No "Bernini's only" anything** |
| **Ponte Vittorio Emanuele II** | **PONTE** | Same shape; Borgo shipped without it. **First inaugurated 5 giugno 1911**, not 5 May; second inauguration 28 April 1912 |
| **Ponte Umberto I** | **PONTE** | Wave 3 tested it and named Ponte on the centroid, ruling it OUT only because Ponte was in no wave. Prati shipped three bridges and not this one |
| **Ponte Principe Amedeo Savoia Aosta** | **OUT — unestablished (P3)** | Wave 1 ruled it out on a self-contradicting under-sourced stub and nothing has changed. Roma Capitale's own point lands in **Borgo**, which is shipped without it. Ponte's own verifier calls it the weakest of the four. Distinct from the Galleria PASA, which is Borgo's |
| **Palazzo Gambirasi**, Via della Pace 8 | **OUT (P3)** | PONTE + PARIONE by SISTO, and no footprint test exists in any file |
| **Vicolo Cellini** | **OUT as a place (P6)** | SISTO cod. 2614: PARIONE + PONTE |
| **Via Giulia** | **REGOLA writes the street, once** | SISTO cod. 5389: REGOLA + PONTE. Regola holds nine sourced places on it (Falconieri, Cisterna, Carceri Nuove, the Collegio Ghislieri façade, Santa Caterina da Siena, Spirito Santo dei Napoletani, Santa Maria dell'Orazione e Morte, San Filippo Neri, the Mascherone); Ponte holds Palazzo Sacchetti and the north end. **Ponte's file must not carry the street as a place — its own verdicts already drop it — and Ponte's buildings on it publish by footprint (P5).** Mandatory sentence, verbatim: *"Via Giulia was opened in 1508 and runs 950 metres from piazza San Vincenzo Pallotti to piazza dell'Oro. Its southern length lies in Regola; its northern length lies in Rione V Ponte."* |
| **Palazzo Sacchetti · Oratorio del Gonfalone · Museo Criminologico's building** | **PONTE** | Regola's finder reassigned all three to Ponte against its own brief's "likely subjects" list. Ratified. The Museo Criminologico itself drops — `giustizia.it` returns "Pagina non trovata" — and its Palazzo del Gonfalone history may appear inside another Ponte record, attributed to it.wikipedia |
| **Santa Lucia del Gonfalone** | **REGOLA** | 41.897640, 12.467410 tests Regola; Regola is the only claimant; Ponte's file does not contain it. The Arciconfraternita's oratory across the way is Ponte's and that is not a defect — one confraternity, two buildings, two rioni, and neither page may annex the other's |
| **Palazzo dei Tribunali** (Bramante's plinth) | **OUT — unestablished (P3)** | it.wikipedia puts Bramante's site *"tra via del Gonfalone e vicolo del Cefalo"*, which is Ponte's block; the OSM building carrying the name tests Regola; the rusticated plinth plausibly crosses the line. A single-institution split with no determination |
| **D.O.M Hotel**, via Giulia 131 | **REGOLA** | Tests Regola regardless of how the plinth goes. **Drop the five-star statement** — a business's own site does not establish its own grading |
| **Via dei Banchi Vecchi** | **OUT as a place (P6)** | SISTO cod. 1297: **PARIONE + PONTE + REGOLA.** Roma Capitale's own register names three rioni; that beats wave 2's geometric "Ponte 76" (P2) |
| **Corso Vittorio Emanuele II** | **OUT — no rione owns it** | Wave 2 ruled it, and SISTO cod. 11489 confirms PONTE + PARIONE + PIGNA + SANT'EUSTACHIO |

### 3.4 Regola ↔ Sant'Eustachio ↔ Sant'Angelo

| Place | **OWNER** | Evidence |
|---|---|---|
| **Santi Biagio e Carlo ai Catinari** (San Carlo ai Catinari) | **SANT'EUSTACHIO** | **Roma Capitale's own words, re-fetched by two verifiers: *"sorge nel rione Sant'Eustachio"* — and Roma Capitale's Piazza Benedetto Cairoli page separately states that the church was once inside Regola's perimeter and today belongs to Sant'Eustachio.** That is the city describing its own boundary change. P2, decisive. **Regola is barred from the church** — and Regola's page should publish Roma Capitale's sentence, because it is the city speaking about its own line rather than us asserting one. The fourth-largest-dome ranking and *"una delle più belle"* stay banned |
| **Piazza Benedetto Cairoli · Monumento a Federico Seismit-Doda · Roscioli Caffè Pasticceria (no. 16)** | **REGOLA** | All three test Regola; Sant'Eustachio's file claims none of them. **A square can be split where a church on it is not.** The civico 113 fact is cited to the *rione* page, which carries it; the piazza page does not |
| **Basilica di Sant'Andrea della Valle** | **SANT'EUSTACHIO** | Polygon and the one successful Nominatim reverse both Sant'Eustachio; Parione is shipped without it (`andrea` returns only delle Fratte/Colonna and al Quirinale/Monti); Regola does not claim it. **The dome-size ranking is banned in every form** |
| **Basilica di Sant'Agostino · Piazza di Sant'Agostino · Arco di Sant'Agostino · Biblioteca Angelica** | **SANT'EUSTACHIO — one ruling for all four** | The Angelica sits in the convent block and the arch is 0.1 m from the line; the rione's own article lists the basilica under Sant'Eustachio; Roma Capitale's page is headed *Basilica di Sant'Agostino in Campo Marzio* — **a historic toponym, not R. IV**, and Campo Marzio's file does not claim it. Ponte, the rival, does not carry it. **No hours for the Angelica, OSM's included** |
| **Santi Benedetto e Scolastica all'Argentina** | **SANT'EUSTACHIO** | 10.0 m from the Pigna line with its entrance on the via di Torre Argentina front; listed under Sant'Eustachio in the rione article; Pigna is shipped without it |
| **Chiesa di Santa Maria in Publicolis** | **SANT'ANGELO** | Three authorities, three answers, and the geometry is the odd one out: it.wikipedia says *"situato nel rione Sant'Angelo"* in terms **and** categorises it there, while the 8/8 footprint result reads Sant'Eustachio — which **both** boundary lists independently exclude, since Roma Capitale's `Confini` and it.wikipedia both make that street the Sant'Angelo/**Regola** line and neither names Sant'Eustachio. Two textual statements against one geometry that two boundary descriptions contradict. **Sant'Eustachio's own verifier recommends Sant'Angelo and I take it; Regola does not claim it.** The 1835/1858 general-house year **does not publish** — one article, two dates. Publish: *"the church is in the care of the Missionari dei Sacri Cuori di Gesù e Maria, who have their general house here"*, and stop |
| **Piazza delle Cinque Scole** and the **Fontana di piazza delle Cinque Scole** | **OUT — unestablished (P3), both** | **Two verifiers ran point-in-polygon on the same fountain and got opposite rioni** — Regola's returned Regola, Sant'Angelo's returned Sant'Angelo. Nominatim says Regola; the Sovrintendenza's published map coordinate lands inside Sant'Angelo; the Sovrintendenza page carries no `Rione:` field, so P2 is unavailable. Two against two, with at least one polygon assembly demonstrably wrong. That is not a margin, it is a failure of the method. The square itself splits 3 Sant'Angelo / 1 Regola / 3 mixed. **Neither file writes either.** The fountain's content — Della Porta 1591, Pietro Gucci, marble from the Temple of Serapis, the 1587 Acqua Felice branch, the Tartarughe substitution, the 1930 placement — survives only as context inside records whose own rione is settled |
| **Villino Lupi**, piazza Cinque Scole 37 | **SANT'ANGELO** | it.wikipedia says Sant'Angelo in terms and lists it in the rione's architecture list; only Nominatim at hn 37 says Regola, and Regola does not claim it. Publish the address; **claim nothing about the square, which is OUT** |
| **San Tommaso ai Cenci** | **REGOLA** | Built into Palazzo Cenci on Monte de' Cenci. A side exit into piazza delle Cinque Scole does not move a building (P5). **The page must not claim the piazza.** *"l'unica che si conosca in Roma"* about the murra roundel stays banned |
| **Sora Margherita · Al Pompiere · Beppe e i suoi formaggi · the via di Santa Maria del Pianto frontages** | **REGOLA** | All test Regola, and **Sant'Angelo's verifier lists them as Regola's in its own tier ruling** — a concession against interest from the rione that owns the rest of the Ghetto. Sant'Angelo is barred from all four. Sora Margherita's own *"al confine tra i Rioni: La Regola e Sant'Angelo in pescheria"* is a business honestly describing a border and publishes as such |
| **Via dei Giubbonari** | **OUT as a place (P6)** | A named Regola/Parione then Regola/Sant'Eustachio border, and the only content Regola holds for it is Roma Capitale's own **boundary** sentence — a boundary statement is not containment (P1) |
| **Salumeria Roscioli**, via dei Giubbonari 21 | **REGOLA** | Tests Regola; uncontested. Name, address and kind only. **Drop the OSM hours** |
| **Palazzo Barberini ai Giubbonari** | **REGOLA** | Frontage on the border street, body well inside. Not at risk |
| **Ancient Pizzicheria Ruggeri (Campo de' Fiori 1) · the five Pellegrino/Cappellari eateries · Locanda del Gallo's square** | **OUT for Regola** | Campo de' Fiori is Parione's, shipped, with the straddle sentence already mandatory (wave 2 §7.5). **Regola's Locanda del Gallo record publishes the building and must not claim the square** |

### 3.5 Sant'Angelo ↔ Campitelli (shipped) ↔ Pigna (shipped)

| Place | **OWNER** | Evidence |
|---|---|---|
| **Piazza di Campitelli** and **Santa Maria in Portico in Campitelli** | **SANT'ANGELO** | Wave 1 ruled it and I uphold it. The church is settled independently 30/30 and on three sources; it.wikipedia's rione article lists "Piazza Campitelli" among **Sant'Angelo's** piazze while Campitelli's shipped guide calls it a boundary — a boundary named by one side and claimed as a place by the other resolves for the side that contains it. **Campitelli's shipped intro already carries this in published text, so a reversal would have a live consequence; there is no reason to reverse.** Palazzetto di Flaminio Ponzio and Palazzo Clementi ride on the square and go with it |
| **Torre dei Margani** | **CAMPITELLI — shipped without it. OUT** | PIP 5/5 Sant'Angelo against Nominatim Campitelli, both boundary lists making piazza Margana the border, OSM's piazza relation 22/25 Campitelli — **and Campitelli has already shipped three places addressed on that square** (`palazzo-maccarini-odescalchi-margana`, `antica-trattoria-angelino-margana`, `eduardo-ii-vicolo-margana`). The shipped corpus settles the practical question. Sant'Angelo is barred |
| **Centro di Documentazione dell'Appia**, via del Teatro di Marcello 5 | **SANT'ANGELO** | The Sovrintendenza's own map coordinate is inside the Sant'Angelo polygon. **Wave 1's via del Teatro di Marcello rule was about *businesses* and is not disturbed** — Campitelli's shipped caffè stays Campitelli's |
| **Museo Nazionale Romano — Crypta Balbi** | **SANT'ANGELO** | Via delle Botteghe Oscure 31, uncontested. Wave 3's bar is discharged: Sant'Angelo is now in the wave. **One record, not two** — the archaeological complex and the museum are the same walls. `status` closed since 9 January 2023 for the URBS project, **and no reopening date, because none is stated** |
| **Pizza Florida**, via Florida 25 | **OUT (P3)** | Via Florida is the Pigna seam; one way centroid Pigna, one Sant'Angelo; **nobody ran a footprint test on the building.** A guess is not a determination |
| **Palazzo Santacroce (piazza Costaguti)** · **Palazzo Astalli** | **OUT** | Neither building can be identified. it.wikipedia's `Palazzo Santacroce` article is a different building in Regola; the only prose source for Astalli places it at via San Marco 8, **Rione X Campitelli**, with a plan that does not match OSM's polygon. Publishing either would silently transfer a palazzo between two live rioni |
| **Largo Arenula · piazza Margana · Tempio D · the Tiber · lungotevere dei Pierleoni · ponte Fabricio** as Sant'Angelo places | **OUT** | Each carries a plurality elsewhere. **Lungotevere de' Cenci, via della Tribuna di Campitelli, via dei Polacchi, via dei Delfini and via dei Funari carry a plurality here** and are Sant'Angelo's as addresses |

### 3.6 Ripa ↔ Campitelli (shipped) ↔ Trastevere (shipped) ↔ Testaccio ↔ San Saba

| Place | **OWNER** | Evidence |
|---|---|---|
| **Isola Tiberina**, with **San Bartolomeo all'Isola** and the **Oratorio dei Sacconi Rossi** | **RIPA** | Wave 1 ruled it "Ripa, emphatically" and Ripa is now in the wave. it.wikipedia's rione article states *"Appartiene al rione Ripa anche l'Isola Tiberina"*, confirmed verbatim by `action=raw`. **Warning carried up so no later pass is ambushed: a naive centroid test at the island's tips lands in open water and reports Sant'Angelo or Trastevere.** Classify by what stands *on* the island |
| **Sant'Omobono** (church) and the **Area sacra di Sant'Omobono** | **RIPA** | Vico Jugario *is* the Ripa/Campitelli border, and Campitelli is shipped **without** either (`omobono` → 0 hits). Ripa is the only claimant and both test Ripa. **No text may mention a boundary test.** *"documenti di importanza eccezionale"* is banned in Italian and in English translation alike |
| **Circo Massimo · Circo Maximo Experience · Torre della Moletta · Mitreo del Circo Massimo · ex Pastificio Pantanella** | **RIPA** | §2. The NE tip toward piazza di Porta Capena reads Campitelli, which is shipped and owns none of it |
| **Roseto di Roma Capitale · Scatola Archeologica di Piazza Albania** | **RIPA** | The Scatola tests Ripa forward and reverse at its own node (41.88083, 12.48363), at Piazza Albania 35, **and San Saba's verifier concedes it explicitly**. The Roseto and the Experience are uncontested |
| **Piazza Albania** | **SAN SABA** | Nominatim both ways at the square's own OSM way (41.88016, 12.48338). **The square is San Saba's and the Scatola on it is Ripa's — that is P5 working, not a contradiction** |
| **Resti delle Mura Serviane, piazza Albania** | **OUT** | San Saba's verifier dropped it because the fragments "fall in two rioni"; Ripa's ranked it its second-least-settled call; the square they are named for is San Saba's while the stretch tests Ripa. **Neither writes it as a record.** The 6th-century-BC walls get a sentence inside Ripa's Scatola Archeologica record, where the operator's own site describes them, and a sentence inside San Saba's Piazza Albania record, where the Sovrintendenza records the Porta Raudusculana — **neither claiming a rione for the wall.** Note also that Castro Pretorio has shipped a place *named* "Mura Serviane (Servian Wall)" and Trevi one named "Resti delle Mura Serviane, Largo Magnanapoli": a third bare "Mura Serviane" is a name collision under any slug |
| **Arco di San Lazzaro** | **RIPA** | **Testaccio's verifier concedes it in writing** on the Museo diffuso wikitext verbatim: `NB Sebbene questo edificio si trova nel [[Ripa (rione di Roma)|rione Ripa]]`. Via Marmorata is the border and the concession settles it. Thin content, but a textual statement of the rione from the rival file is the best evidence available |
| **Kolbe Hotel Rome**, Via di San Teodoro 48 | **RIPA** | Via di San Teodoro is the Ripa/Campitelli border; Campitelli is shipped without the hotel; Ripa is the only claimant and the building tests Ripa. **Drop "BEST RATES GUARANTEED" and every other marketing line; no hours, no rating, no trading history** |
| **Piazza della Consolazione** | **RIPA — unwritten** | Wave 1: Campitelli carries the church, the square is Ripa's. Campitelli's shipped `santa-maria-della-consolazione-campitelli` stands. Ripa's file has no source for the square, so it does not publish; **Ripa must not describe the church as its own** |
| **Piazza di Porta Capena · Parco di Porta Capena · the two memorials** | **OUT — unestablished (P3)** | **The Celio article's own footnote makes piazza di Porta Capena the boundary of Celio, San Saba *and* Ripa** — a three-way seam declared by the source. Nominatim now returns San Saba for the square and the park where it previously returned Celio. Piazza Venezia is the governing precedent. **And the Axum obelisk sentence on Roma Capitale's page is stale and may not be published by anybody** |
| **Ponte Cestio** | **RIPA, with the Trastevere span stated** | Wave 1 ruled it on the centroid and named Ripa; Trastevere is shipped without it. Ripa's verifier is right that the span and far abutment read Trastevere, so **Ripa states it and does not lead with it. Quote neither 1892 nor 1899** — Turismo Roma's own dates run backwards against each other |
| **Ponte Palatino** | **RIPA, with the straddle stated** | Wave 1 centroid ruling; Trastevere shipped without it; **Turismo Roma itself says *"nei Rioni Ripa e Trastevere"*** — the straddle is in the source. *"uno dei primi esempi di architettura funzionale della città"* is banned |
| **Ponte Rotto / Ponte Emilio** | **RIPA** | Both test points Ripa; uncontested; the least contested of the five |
| **Ponte Fabricio** | **RIPA, with Sant'Angelo named at the left bank** | Midspan and island abutment Ripa; the left-bank abutment lands in Sant'Angelo and Turismo Roma names Sant'Angelo as the rione it reaches. **Sant'Angelo's own verifier lists ponte Fabricio among the objects that "carry a plurality elsewhere and should not be Sant'Angelo's"** — a concession against interest. Centroid rule (waves 1 and 3) → Ripa |
| **Ponte Garibaldi** | **REGOLA** | Wave 1 ruled it on the centroid and named Regola; Regola is now in the wave. Regola's centroid test agrees, Roma Capitale says the bridge joins **Regola** to Trastevere, and Trastevere is shipped without it. **Publish Roma Capitale's own sentence — the city describing its own boundary. The Belli monument on the far side stays Trastevere's** |
| **Ponte Giuseppe Mazzini** | **TRASTEVERE — shipped. OUT** | `taken_slugs.py ponte` returns `ponte-giuseppe-mazzini-rome` under Trastevere. Regola's finder listed it as an unresolved straddler and never searched "ponte" or "mazzini". Regola does not write it |
| **Ponte Sublicio** | **TESTACCIO** | §9.2 — I am **granting** a bridge two verifiers left for dead |
| **Ponte Testaccio** | **OUT** | Q. XI Portuense holds the midpoint and is in no wave. Identical to wave 3's Ponte Umberto I and Ponte Cavour rulings, which is the whole point of a single centroid rule |

### 3.7 San Saba ↔ Testaccio

| Place | **OWNER** | Evidence |
|---|---|---|
| **Porta San Paolo** | **SAN SABA** | **Testaccio's verifier concedes it (V-M01) against its own brief and its own aggregator**, and San Saba's Nominatim returns San Saba forward and reverse at the gate's own node while the Pyramid 60 m away returns Testaccio both ways. *"tra le più maestose e meglio conservate dell'intera cerchia"* is banned even attributed |
| **Museo della Via Ostiense** | **SAN SABA** | Inside the Castelletto of Porta San Paolo, at Via Raffaele Persichetti 3. **The source is inside a page the finder had already fetched**: the Sovrintendenza's Porta San Paolo page names the museum, its operator (Soprintendenza Speciale di Roma) and its holdings. San Saba's verifier overturned its own finder's hold and was right to. No hours |
| **Palazzo delle Poste Roma Ostiense**, Via Marmorata 4 | **SAN SABA** | **Testaccio's verifier concedes it (V-M02) on the Museo diffuso wikitext verbatim:** `NB Sebbene questo edificio si trova nel [[San Saba (rione di Roma)|rione San Saba]]`. it.wikipedia's own article says *"situato in via Marmorata, nel rione San Saba"* and categorises `Roma R. XXI San Saba`. Nominatim is split on the boundary street; two textual statements plus the rival's concession settle it |
| **Piramide di Caio Cestio** | **TESTACCIO** | §2, and San Saba concedes it |
| **Via Marmorata** | **OUT as a place (P6)** | §9.3 — stricter than Testaccio's verifier |
| **Piazzale Ostiense · Piazza di Porta San Paolo · the 1943 plaques · the Piramide/Ostiense transport cluster** | **OUT of Testaccio; San Saba and Q. X Ostiense** | Testaccio's V-M01, upheld. San Saba writes what it has sourced and no more |
| **Casina del Cardinal Bessarione** | **SAN SABA** | San Saba's verifier declined to rule it from inside one file, and this is what an arbitrator is for. **Celio is the only conceivable rival and Celio's file has no record for it, no candidate for it and makes no claim on it.** For San Saba: two aggregators (the rione article's civil-architecture list and Roma Segreta) and the Sovrintendenza's full operational page, against nothing on the other side. Grant. **Publish the street with no number** — the Sovrintendenza page gives none and the OSM housenumber resolves to a point at the far end of the street: *"Via di Porta San Sebastiano, at the ancient fork of the via Appia and the via Latina."* **Bessarione is a hypothesis and must be published as one.** *"un raro esempio di villa rinascimentale extraurbana"* stays banned. This takes San Saba to 18 |

---

## 4. STREETS AND SQUARES THAT ARE BOUNDARIES — OUT AS PLACES, USABLE AS ADDRESSES (P6)

Eleven, plus the four wave 2 already ruled. **No wave-4 file carries any of these as a place. Every
one of them is a legitimate address, and the buildings on them publish by footprint (P5).**

| Out as a place | Split | Note |
|---|---|---|
| **Via del Corso** | Campo Marzio 32 / Colonna 21 / Trevi 20 / Pigna 1 | Wave 2 ruled it OUT for all four rioni. **Campo Marzio has the plurality and may not have it — §9.4** |
| **Via Frattina** | Colonna south / Campo Marzio north | Wave 2 ruled it OUT. **§9.4** |
| **Via Sistina · Via Francesco Crispi · Via Capo le Case** | Colonna / Ludovisi / Trevi / Campo Marzio, all shipped but Campo Marzio | Crispi's centreline tests Colonna 23 / Ludovisi 6 / Trevi 1; Capo le Case did not resolve in OSM at all |
| **Via della Scrofa** | Campo Marzio 11 / Sant'Eustachio 6 | Not in Roma Capitale's ring; no source content established by either file |
| **Via dei Portoghesi · via della Stelletta · piazza Campo Marzio · via degli Uffici del Vicario** | Campo Marzio / Sant'Eustachio | The **buildings** on them are closed for Campo Marzio (§3.2); the streets are not |
| **Via di Campo Marzio** | Colonna 9 / Campo Marzio 4 | The rione's namesake street is mostly in the next rione and carries Colonna's shipped Orologio di Augusto |
| **Piazza del Parlamento** | Campo Marzio / Colonna | Colonna's shipped Montecitorio stands on it. **No Campo Marzio page may imply it faces the Chamber of Deputies** |
| **Corso del Rinascimento · Piazza Madama** | Parione (shipped) / Sant'Eustachio | Sant'Eustachio's own file drops the corso; it.wikipedia assigns it to both R. VI and R. VIII. **Palazzo Madama and Palazzo Baldinotti Carpegna publish in Sant'Eustachio on their footprints** |
| **Via dei Giubbonari** | Regola / Parione / Sant'Eustachio | §3.4 |
| **Via dei Banchi Vecchi** | SISTO: Parione + Ponte + Regola | §3.3 |
| **Via Marmorata** | Testaccio / Ripa / San Saba | §9.3 |
| **Via di San Giovanni in Laterano** | Monti (shipped) / Celio | §3.1 |
| **Piazza di Porta Capena** | Celio / San Saba / Ripa | §3.6 |
| **Piazza delle Cinque Scole** | Regola / Sant'Angelo | §3.4 |
| **Vicolo Cellini** | Parione / Ponte | §3.3 |

Three more, already settled and restated because an author will reach for them:
**Piazza Venezia** (nobody, wave 1 and 2), **Piazza della Rotonda** (nobody, wave 2),
**Corso Vittorio Emanuele II** (nobody, wave 2, and SISTO names four rioni).

---

## 5. THE TWO CASES EARLIER WAVES LEFT OPEN

### 5a. SANTA MARIA DELLA PACE and SANTA MARIA DELL'ANIMA — **BOTH TO PONTE. Settled.**

Wave 2 found them contested, carried them nowhere, and named the result *"the single biggest coverage
hole either wave has produced."* Ponte is in this wave and the hole closes here.

**Santa Maria della Pace and the Chiostro del Bramante — PONTE, and it was never really in doubt.**
Wave 2's own Parione verifier reported **three independent methods all returning Ponte**: 28/28
footprint vertices, Nominatim Ponte, and it.wikipedia *"si trova nell'omonima piazza nel rione
Ponte"*, re-fetched and confirmed verbatim. Wave 2's arbitration listed the owner as **Ponte** in
terms. And this wave adds the piece wave 2 lacked: **Roma Capitale's address for the church is Arco
della Pace 5, and Arco della Pace is SISTO cod. 8079, PONTE ALONE** — Roma Capitale's own street
register, re-run independently by Ponte's verifier (P2). Four methods, one answer, including the
municipal register. The cloister goes with the church.

**Santa Maria dell'Anima — PONTE.** Wave 2 called it "genuinely contested" on 14/14 footprint Ponte
against a Nominatim reverse saying Parione. That was the honest call **on wave 2's evidence**. It is
not the honest call on mine:

- **Eight independent tests place the building in Ponte**, per Ponte's verifier.
- Its street, Via di Santa Maria dell'Anima, is **SISTO cod. 6878: PONTE + PARIONE** — officially
  shared, which means the street cannot place the building either way, and the photographed street
  sign on the Parione side is a sign on a shared street and nothing more.
- **P5 governs**: a building is placed by its footprint, not by the length of its street. That is
  wave 2's own founding rule (the Oratorio dei Filippini) and Ponte's verifier re-proved it this wave
  on Palazzo Altemps, where the same reasoning closed a straddle Ponte had escalated.
- **Parione is shipped and did not take it.** There is no collision and no rival.

Eight tests plus a rule the corpus already relies on, against one geocoder reverse on a street the
municipal register calls shared. **That is enough, and it was not enough in wave 2 only because
wave 2 could not see the SISTO record or run the footprint tests.** Ponte writes both.

**Both records carry the wording their verifier supplied.** For the Pace: the church stands where
Sant'Andrea de Acquarenariis stood, named for the water-sellers; the 1480 stone-throwing story is
published **as tradition or not at all**; **the Cappella Cesi attribution is published from neither
source**, because turismoroma's own page gives it to Antonio da Sangallo the Younger and to
Michelangelo four sentences apart; the Prophets are published as *"the Sibyls and angels on the
chapel arch are Raphael's, 1514, and the four Prophets above were finished to his design by Timoteo
Viti"*, with no death-date sequencing, because the same page has Viti finishing them *"dopo la sua
morte"* in 1514 and Raphael died in 1520. Dome 1524 to Sangallo the Younger's design; convex façade
Pietro da Cortona 1656 for Alexander VII; Maderno's altar 1614. **Banned from that page and not
recoverable by attribution:** *uno dei gioielli rinascimentali e barocchi di Roma* · *una delle opere
più importanti del Rinascimento* · *la bellissima Cappella Chigi* · *gli splendidi marmi* · *Uno
degli elementi più caratteristici*.

### 5b. THE TEATRO ARGENTINA and LARGO DI TORRE ARGENTINA

**Teatro Argentina — SANT'EUSTACHIO. Confirmed, and it lands here.** Wave 2's Pigna verdicts state
it in terms and wave 2's arbitration ratified it (`w125831637`); Sant'Eustachio's polygon agrees;
`taken_slugs.py argentina` returns six Pigna records, **all Area Sacra archaeology, none the
theatre.** Publish the 13 January 1732 opening with Sarro's *Berenice* for Duke Sforza Cesarini,
Paganini in 1827 in the room above the vestibule, *La battaglia di Legnano* in 1849, and the live
2026/2027 season. **The theatre stands in front of the Area Sacra — that is an adjoining physical
fact and is allowed. The Area Sacra itself is Pigna's, shipped, and no Sant'Eustachio page may carry
it or any of its four temples, the Curia di Pompeo or the Torre del Papito.**

**Largo di Torre Argentina, the square — OUT. Nobody.** Wave 2's marquee entry granted Pigna the
**Area Sacra only** and ruled the square out; the geometry is Pigna 20 / Sant'Eustachio 7, so the
plurality sits in a rione that is shipped without it; it.wikipedia names *three* rioni; and
**Sant'Eustachio's own finder declines it in writing — "Do not claim the largo."** A shipped verdict
file's table row appeared to hand it here, but wave 2's arbitration is what binds and it ruled the
square OUT. Confirmed OUT. The *episcopus argentinensis* etymology, which Roma Capitale states on its
own Largo di Torre Argentina page, publishes inside Sant'Eustachio's **Palazzetto del Burcardo**
record, where it is the record's strongest fact.

**Piazza di Santa Chiara — OUT.** Wave 2 ruled it Pigna-majority (15/6) with nothing sourced, and it
"drops as a place". Pigna is shipped without it, Sant'Eustachio's finder never mentions it, and no
wave-4 file researched it. The wave-2 drop is confirmed, not reopened.

---

## 6. THE AURELIAN WALLS — the programme-level ruling, stated once

**The precedent is settled and needed no re-deciding: Trastevere shipped
`mura-aureliane-segment-trastevere-rome`, "Aurelian Walls, Trastevere segment".** Testaccio's
verifier found it with one `taken_slugs.py mura` query and read it correctly.

**RULING: a named stretch per unit. Never "Mura Aureliane" or "Aurelian Walls" unqualified, in name
or in slug.** The whole-circuit relation is a 2,253-vertex object touching thirteen units and belongs
to none of them (wave 1).

- **Celio** — one segment, named for its stretch. The wall there *is* the boundary; the inner face is
  Celio's and the rioni on the other side are quartieri in no wave.
- **Campo Marzio** — one segment, named. Two `historic=citywalls` ways test inside. **Porta del Popolo
  is a distinct named object and is safe either way.**
- **Testaccio** — one segment, and the Museo diffuso names it for us: *"Mura aureliane, site lungo via
  del Campo Boario"*.
- **San Saba** — **no separate record.** Its verifier's preference is the better call here: the wall
  is a sentence inside the ICP garden-quarter record, where Viale Giotto runs along its inside face.
- **Ripa, Regola, Ponte, Sant'Eustachio, Sant'Angelo** — no wall record. None has a segment testing
  wholly inside with content behind it.

Same rule, same reason, for the **Mura Serviane**: Castro Pretorio and Trevi have both shipped
records under that name, so a third bare one is a collision under any slug. §3.6 rules the piazza
Albania fragments out entirely.

---

## 7. VATICAN CITY AND THE LATERAN TREATY — Ruling 2

**Nothing in any of the nine rioni is inside Vatican City.** Confirmed file by file. No wave-4 page
may use "in the Vatican", "Vatican territory", "extraterritorial" or "diplomatic immunity" of
anything it carries.

**One Art. 16 property in the wave, and it is Celio's:** the **Casa di esercizi per il clero dei
Santi Giovanni e Paolo**. Celio's verifier read the Treaty PDF clause by clause and its wording is
binding verbatim — the building is named in **Article 16**, whose list Article 15 does not include;
Art. 16 provides freedom from liens and expropriation save by previous agreement with the Holy See,
and exemption from ordinary and extraordinary taxes; **Art. 15, which grants the immunities of the
headquarters of diplomatic agents of foreign States, applies to a different list and does not name
it.** One correction to the finder's framing that must travel: Art. 16 does not cover "a different
list" — it covers the Art. 13, 14 and 15 buildings **as well as** the named Pontifical institutions.
The effect for this building is unchanged, because it appears only in the second group. No hours, no
current use, no bookings: there is no source.

**THE ORDER OF MALTA IS NOT A LATERAN TREATY PARTY. One rule, three files.** No Art. 15 or Art. 16
language may attach to any SMOM property in Campo Marzio, Sant'Angelo or Ripa.

- **Palazzo Magistrale** (Campo Marzio, Via dei Condotti 68) — publish exactly this and no more:
  *"Via dei Condotti 68 is the principal seat of the Sovereign Military Order of Malta. The Order has
  owned the building since 1630, and since 1834 it has been the residence of the Grand Master and the
  seat of the Order's government."* **Nothing about sovereignty, extraterritoriality or international
  legal personality.**
- **Palazzo Savelli Orsini** (Sant'Angelo) — *"The palace houses the embassy of the Sovereign Military
  Order of Malta to the Holy See."* Full stop.
- **Villa del Priorato di Malta** (Ripa) — the **"tre Stati" framing is dead in every form**, and this
  is the hardest wording case in the wave. it.wikipedia sells the keyhole as a view across three
  sovereignties with the villa's interior "in condizione di extraterritorialità" — precisely the
  construction Ruling 2 forbids. **The 1869 extraterritoriality clause drops** too: it rests on one
  aggregator sentence and no institutional source carries it. What publishes: *"Piazza dei Cavalieri
  di Malta 3–4, on the Aventine. The complex of buildings and garden is the historic seat of the
  Grand Priory of Rome of the Sovereign Military Order of Malta and houses the Order's embassy to the
  Italian State. The hole in the portal at number 3 frames, at the end of an avenue of trees, the
  dome of St Peter's."* The sightline is a fact; the sovereignty is not ours to state.

**Embassies accredited to the Holy See are ordinary addresses.** Palazzo Caetani (Brazil to the Holy
See) publishes as its verifier wrote it; Ponte's three Holy See missions drop; the Saudi and
Palestinian buildings in San Saba may be named or not, with **no legal status characterised** either
way. Their status comes from the Vienna Convention, not the Lateran Treaty.

**Palazzo FAO is a UN specialised agency under a bilateral headquarters agreement.** No immunity, no
extraterritoriality, **no $1 symbolic rent and no *usucapione*** — the last two carry no citation at
all in the source.

**Palazzo Altemps' 1887 is a property history, not a territorial one.** Write: *"In 1887 the palace
became property of the Holy See and housed the Pontifical Spanish College; the Italian State bought
it in 1982."* Never "was Vatican territory".

**Pontifical institutions on Italian soil are not extraterritorial properties.** The Venerabile
Collegio Inglese, Santa Maria in Monserrato and San Tommaso di Canterbury (Regola), the Pontificia
Università della Santa Croce (Ponte, dropped), Sant'Anselmo and the Pontificio Ateneo (Ripa) — none
is on either list and none may be framed as one. **Santa Balbina's "dependent on the Vatican
basilica" is rewritten to "a filial church of the Basilica di San Pietro in Vaticano"**, because the
looser phrase reads as a territorial claim.

**Palazzo di Propaganda Fide is Colonna's, shipped.** A Campo Marzio page describing piazza di Spagna
may not annex it, and if it names the building at all it must say it is a Lateran Treaty
extraterritorial property standing in rione Colonna — never "Vatican territory".

---

## 8. DESIGNATION CLAIMS — Ruling 1 sweep across all nine files

I ran the banned vocabulary, English and Italian, over all eighteen files. **Two live designation
claims reached the verifiers and both were killed; I confirm both kills and close the paraphrase
route on one of them.**

1. **Museo Atelier Canova-Tadolini** (Campo Marzio) — Roma Capitale's *"è stato notificato dallo
   Stato italiano e non è vendibile né movibile"*. **Banned. And the residue the finder proposed —
   "presented as inalienable" — is a paraphrase of a designation claim and is banned too. Say nothing
   about the collection's legal status.**
2. **Il Vero Alfredo** (Campo Marzio) — Roma Capitale's *"oggetto di vincolo e tutela da parte del
   Ministero dei beni e delle attività culturali"*. **Banned outright.**

**Four things that are near the line and are NOT designation claims. Ruled, so nobody re-litigates:**

- **State ownership.** The Parco Archeologico dell'Appia Antica's *"di proprietà demaniale sin dal
  1959"* for San Cesareo de Appia is a statement of **ownership** by the body that owns it, naming no
  instrument and no register. It publishes as ownership, in the Parco's own words, and the record may
  not add that the church is protected, *tutelato*, or that the transfer implies heritage status.
- **Ecclesiastical titles.** "Minor basilica" (Santa Balbina; Santi Celso e Giuliano) is a Church
  rank, not a heritage designation. Attribute it or omit it.
- **Editorial listings.** *Negozi storici* is a Roma Capitale editorial list and publishes as **"Roma
  Capitale lists it among the city's historic shops"** — a fact about a list. *Locali storici
  d'Italia* is a private association and may be named as one. The Cimitero Acattolico's "Tombe
  d'interesse culturale" is a navigation label and **may not be rendered as protection, listing or
  designation.**
- **UNESCO.** The 1980 inscription of the Historic Centre of Rome may be named **as an inscription
  and nothing more. NO RIONE IN THIS WAVE MAY CLAIM TO LIE INSIDE THE PROPERTY.** Two traps, named:
  it.wikipedia's infoboxes for Monte Testaccio, the Pyramid, the Emporium and the Porticus Aemilia
  **all four** carry `Parte di = Centro storico di Roma`, and the Sovrintendenza's buffer-zone pages
  are linked from every Sant'Angelo place page. Four infoboxes agreeing is exactly what the evidence
  ruling anticipates. Do not follow the links and do not inherit the infoboxes.

**Vincoli in Rete and the Catalogo generale were re-tested and remain unreachable.** The
`catalogo.beniculturali.it` citation inside the San Salvatore in Lauro wiki article is a citation to
an unreachable host and establishes nothing.

---

## 9. WHERE I AM STRICTER — OR LOOSER — THAN A VERIFIER. READ THIS TWICE.

**The authors follow this section, not the verdict file.**

### 9.1 OVERRIDE — "the first bridge built in Rome after unification" DIES. Regola's verifier is reversed.

Regola's verifier publishes it and writes, in terms: *"this is a date-and-sequence fact of the kind
the brief explicitly welcomes, not a superlative. It stays."* **It does not stay.**

Ripa's verifier met the identical claim shape — Turismo Roma's "Rome's first masonry bridge" for
Ponte Rotto — **ruled against its own finder**, and wrote: *"it is a ranking across the whole city,
of exactly the form 'the oldest X in Rome', and there is no reachable register to check it against."*
That reasoning is correct and it applies without modification to Ponte Garibaldi. Two verifiers, one
claim shape, two answers; I take the stricter one, as all three previous arbitrators did.

**The line, stated so it stops recurring:** a sequence is publishable when the series is *bounded and
named by the source* — "the first church **on this site**", "the sixth of Rome's rioni by toponymic
code", "the first of the five fountains Lombardi built". A sequence is a banned priority claim when
the series is **the city, the country or the world** — "the first bridge in Rome after X", "the first
modern penitentiary in Rome", "the first large stables ever found", "the first building put up in
Rome for evangelical worship", "the first work of architecture built in Rome's historic centre since
the fall of Fascism", "the first obelisk brought from Egypt to Rome". Every one of those six is in a
wave-4 file. **All six die.** Ponte Garibaldi publishes as 1884–1888, Vescovali, 121 m by 23 m, the
1953–56 Krall rebuilding, the Renella beach — which is better copy than the ranking.

### 9.2 LOOSER — PONTE SUBLICIO IS GRANTED TO TESTACCIO. Two verifiers left it for dead on a factual error.

Ripa's verifier ruled it not Ripa's, correctly, and then wrote: *"Testaccio is in no wave, so like the
Colosseum this may end up unwritten. That is the correct outcome."* **Testaccio is in this wave.**
Ripa's verifier could not see that; I can, and the ruling flips.

The evidence, from three files: **Turismo Roma states in its own voice that *"l'odierno Ponte Sublicio
collega i rioni Trastevere e Testaccio all'altezza di Porta Portese"* (P2)**; wave 1's centroid test
returned Testaccio; Testaccio's own tests put the deck and mid-river in Testaccio; **Trastevere is
shipped and did not take it**, so the western landing is settled by conduct; and Piazza dell'Emporio,
the eastern landing, is Ripa's and stays Ripa's. **Ponte Sublicio → TESTACCIO.** Facts: 1914–1917,
Marcello Piacentini, inaugurated 21 April 1919, three masonry arches, 105 m by 20 m. **Do not inherit
OSM's Wikidata id Q1466700 — that is the ancient *pons Sublicius*, a different structure** (wave 1).

This is the one place in the wave where seeing all nine files at once produces a place rather than
removing one, and it is exactly why the wave was run this way.

### 9.3 STRICTER — Via Marmorata is OUT as a place. Testaccio's verifier is reversed.

Its V-P59 publishes the street with the instruction that "the record must say it is writing about the
Testaccio side." **That instruction is the proof it fails P6.** Via Marmorata is the Testaccio/Ripa
line at one end and the Testaccio/San Saba line at the other, and **both** neighbours are in this
wave: no. 4 is San Saba's Palazzo delle Poste (§3.7) and the Arco di San Lazzaro on it is Ripa's
(§3.6). A street from which two of the three rioni draw a place is not a place in the third.
**OUT, usable as an address.** The marble-landing etymology publishes inside Testaccio's **Emporium**
record, where the port and the marbles actually belong.

### 9.4 STRICTER — Via del Corso and Via Frattina stay OUT. Campo Marzio's verifier leaves both open.

Its escalations read *"Campo Marzio has the plurality and everyone will want it"* for the Corso and
*"Take the sourced split; the arbitrator should say so"* for Frattina. **Wave 2 already ruled both
OUT for every rione, and wave 2 binds.** The Corso is Campo Marzio 32 / Colonna 21 / Trevi 20 /
Pigna 1, with three of the four shipped; Frattina is a P6 case whose geometry contradicts itself
(centreline Colonna 9 / Campo Marzio 0 because it is drawn on the southern kerb, hand points at both
ends Campo Marzio). Neither becomes a place because a fourth rione arrived. **The buildings hanging
off both publish by footprint and always did.**

### 9.5 STRICTER — one sentence for a missing fact, across all nine files.

The verdict files carry three variants: *"No source states its opening hours, so none are given
here"* (Ripa, Testaccio, Sant'Eustachio, Ponte), *"No source **available here** states…"* (Campo
Marzio), *"No source **consulted here** states…"* (Regola). **"Available here" and "consulted here"
are research method wearing a hat** — they tell the reader something about our fetching. **The only
permitted form, everywhere, is:**

> No source states its opening hours, so none are given here.

Substitute the field as needed ("its visiting hours", "its opening time"). **Never a reason, never a
host, never a status code, never "could not be reached", "did not resolve", "during research",
"re-fetched on", "footprint tests wholly inside", "vertex", "boundary method".** Ripa's "strip every
trace of the 404 hunt" and Sant'Eustachio's eight removals are the standard.

Two constructions **are** allowed, because they state what an institution publishes rather than what
we did: San Saba's *"The Soprintendenza Speciale di Roma gives the opening as every Saturday
10.00–12.00. The Diocese of Rome's own record gives Tuesday and Thursday 9.00–12.00. The two
differ."*, and Testaccio's *"The two accounts are not reconciled here."* Use those exact shapes and
add no gloss about why.

### 9.6 STRICTER — "the only urban island of the Tiber" dies. Ripa's verifier is reversed.

Its V-P52 publishes *"Unica isola urbana del Tevere"* on the reasoning that it is "a count of one".
It is not a count; it is a uniqueness claim in the banned form, and "count of one" is the
rationalisation the ban exists to defeat — the same move as "the rione's only" and "Bernini's only",
both of which the corpus already refuses. **Cut it.** The island publishes on its dimensions (about
300 × 90 m), its two bridges (Cestio 46 BC to Trastevere, Fabricio 62 BC), the 509 BC grain legend,
the 291 BC Sibylline embassy to Epidaurus, the architectural shaping as a ship with stern, prow and
an obelisk for a mast, and the continuing medical vocation. That is a better paragraph than the
claim.

### 9.7 STRICTER — a founding year from an operator's own site does not ship. Ruled, and extended programme-wide.

Testaccio's verifier escalated this to me explicitly: *"if 'how long it has traded' is read as
covering durations only and not years, these eight dates come back."*

**RULING: a founding year IS a trading-duration claim. The strict line stands, and it is now the rule
for every wave.** The roster says a place's own website "does NOT establish awards, superlatives, or
how long it has traded", and "founded in 1887" is a statement of how long it has traded wearing a
date. **Dead:** Volpetti 1973 · Linari 1971 · Checchino 1887 · Felice 1936 · Perilli 1911 · Il
Grottino 1936 · L'Alibi 1970 · Lo Scopettaro's eighty years · Sora Lella's "dal 1940" and "DA TRE
GENERAZIONI" · Al Pompiere's "gestito dal 1928" · Sora Margherita's "Dal 1927" · Taverna Cestia's
"dal 1967" and "da più di 50 anni" · Libreria Il Mare's "Fondata nel 1975" and its `<title>`'s "dal
75" · Sant'Eustachio Il Caffè's 1938 · Armando al Pantheon's 1961 · Antico Forno Roscioli's 1824 and
1972 · Antica Trattoria Pasqualino's and Trattoria Luzzi's "dal 1945" · Pizzeria Li Rioni's "da
sempre" · All Saints' "since 1816" and "for over 120 years" · Hostaria i Clementini's "da oltre
vent'anni".

**The trading name itself publishes verbatim**, because naming a business is not asserting a date:
"Checchino dal 1887" and "Felice a Testaccio" are names.

**Two exits, both already demonstrated in the wave.** A year publishes when a **third party** attests
it — Testaccio's Scuola Popolare di Musica, 1975 — or when **Roma Capitale** states it, as
turismoroma does for **Giggetto, 1923**, which Sant'Angelo's verifier correctly allowed on exactly
that ground. **Roma Capitale's centenary sentence for the same business does not publish**, because
that is a duration.

### 9.8 STRICTER — no rione may rank itself.

Sant'Angelo's verifier bans *"il rione più piccolo della città"* even though Roma Capitale and
it.wikipedia both say it. **Correct, and I generalise it: no wave-4 page may call its rione the
smallest, largest, oldest, newest, densest or most anything.** Write the measurement — about 480 m by
360 m, roughly a tenth of a square kilometre — or the position in the official series, which is
welcome: "R. XI, the eleventh of Rome's rioni by toponymic code". San Saba's *"gli ultimi due rioni
dentro le mura"* dies the same way and is replaced by the plain sequence its verifier supplied:
**"San Saba and Testaccio were carved out of Ripa in 1921."**

### 9.9 UPHELD, and named because an author will be tempted

- **Palazzo Farnese's "quattro meraviglie di Roma".** Regola's verifier ruled against its own finder's
  argument that a named historical grouping is not a ranking. **Upheld:** the official page names one
  item and no source the finder fetched carries the other three. Drop the grouping and the list.
- **The Aula Gotica's 1995, not Roma Capitale's 1996** — a dedicated official domain beats an
  aggregator (P2).
- **Musja is disqualified** — `musja.it` serves a Non-AAMS casino affiliate page, Roma Capitale's own
  page contradicts itself on hours, and the venue sits 5.2 m from the Parione line. **OUT.** The
  same class of hazard: `hotelcapodafrica.com` serves an Indonesian lottery site; `casadelleletterature.it`
  is an affiliate farm; `villaggioglobale.roma.it` does not resolve; The Corner Townhouse's OSM
  `website` tag points at a hair salon in Woodhouse Mill, England. **No business ships on a dead or
  hijacked domain, and no OSM `website` tag is a source until someone opens it.**
- **Cite the page you actually read the sentence on.** Three wave-4 files had citations pointing at
  pages that do not contain the claim (Testaccio ×3, Ripa ×3, Regola ×2). Every fact was true and
  every citation was wrong. **This is now a standing instruction for every wave, not an assumption.**

---

## 10. TIER RULINGS

**Nine GUIDEs. No town-pages, so the two-outbound-link floor is not engaged.** Every verifier's call
is confirmed; my rulings move counts but move no tier, which is the right state for a tier ruling.

| Rione | Verifier | After my rulings | **RULING** |
|---|---|---|---|
| **Celio** | GUIDE (41) | **~42.** Gains Piazza del Colosseo, a named walls segment and the Sovrintendenza's Scipioni-park material; loses the Arch of Constantine, Meta Sudans, Porta Latina, Porta San Sebastiano, the Museo delle Mura, Vigna Codini, Porta Capena and Via di San Giovanni in Laterano. **The Colosseum is not at risk and never was** | **GUIDE** |
| **Campo Marzio** | GUIDE (89) | **~87.** Gains Ponte Cavour, Piazza di San Lorenzo in Lucina and Lungotevere Marzio; loses the Corso and Frattina, which its verifier left open. The finder's own "60–70" was depressed by a character-count triage error its verifier corrected | **GUIDE, and not close** |
| **Ponte** | GUIDE (45) | **~48.** Gains Santa Maria della Pace, the Chiostro del Bramante, Santa Maria dell'Anima, Piazza dell'Orologio and three of the four bridges confirmed; loses Ponte PASA, Gambirasi, the Albergo dell'Orso and Via dei Banchi Vecchi. **Strike every escalation and Ponte still stands at 37** | **GUIDE** |
| **Regola** | FULL GUIDE (75, floor 63) | **~71.** Gains Via Giulia, Santa Lucia del Gonfalone, Piazza Cairoli with the Seismit-Doda monument, the D.O.M Hotel, the four Pianto/Ghetto businesses, Salumeria Roscioli and Ponte Garibaldi; loses San Carlo ai Catinari, the Cinque Scole fountain, Via dei Giubbonari as a place and the Palazzo dei Tribunali plinth | **FULL GUIDE** |
| **Sant'Eustachio** | GUIDE (30) | **30.** Every straddle it flagged resolves **in its favour** — Sant'Andrea della Valle, Sant'Agostino with the Angelica, San Carlo ai Catinari, SS Benedetto e Scolastica, the Teatro Argentina. It loses only the corso, which it dropped itself. Its own pessimistic floor was 24 | **GUIDE** |
| **Sant'Angelo** | GUIDE (77) | **~75.** Gains Santa Maria in Publicolis, Villino Lupi, the Centro di Documentazione dell'Appia and Piazza di Campitelli confirmed; loses the Torre dei Margani, Piazza delle Cinque Scole with its fountain, Pizza Florida, Palazzo Santacroce and Palazzo Astalli. **Guide at 69 even if every escalation had gone the other way** | **GUIDE** |
| **Ripa** | GUIDE (47) | **~47.** Gains the Isola confirmed, the Circus Maximus, Sant'Omobono ×2, four bridges, the Kolbe Hotel and the Arco di San Lazzaro; loses the Mura Serviane record, Porta Capena and Piazza della Consolazione as a written place | **GUIDE** |
| **Testaccio** | GUIDE (41) | **~41.** Gains Ponte Sublicio (§9.2) and the Pyramid confirmed; loses Via Marmorata and Ponte Testaccio. Its verifier tested the ruling correctly: strike every contested object and it stands at forty | **GUIDE** |
| **San Saba** | GUIDE (17, 18 with Bessarione) | **18.** I grant the Casina del Cardinal Bessarione (§3.7) and confirm the Palazzo delle Poste. **Its verifier graded it above its own finder and was right to** — three of the finder's holds were wrong, and twelve of the eighteen carry institutional sourcing | **GUIDE** |

**Insurance, since San Saba is the only unit anywhere near the line:** if a later standard flips it to
a town-page, it clears the two-link floor with room to spare. Live, institutional, re-fetched:
`soprintendenzaspecialeroma.it/luoghi/terme-di-caracalla/` · `parrocchiasansaba.it/orari-e-contatti/`
· `diocesidiroma.it` · `parcoarcheologicoappiaantica.it/luoghi/basilica-di-san-cesareo-de-appia/` ·
`sovraintendenzaroma.it/content/porta-san-paolo` · `fao.org/contact-us/en` · `libreriailmare.it`.
**Solved here; not left to the author.**

---

## 11. STANDING RULES FOR EVERY WAVE-4 DRAFT

1. **`"photos": []` on every record in all nine files.** Ruling 3. Image leads stay in the research
   files for the image wave; the Sovrintendenza's permission process is the right door.
2. **`kind` is one of the schema's thirteen.** There is no church, monument, square, bridge or cinema
   kind. Rome's churches, squares, streets, towers, gates, bridges and ruins are **`historic-site`**.
   The Colosseum is `historic-site`, not `theater`. The Teatro di Marcello is `historic-site` — a ruin
   with a Renaissance palace on it, viewable from outside. Antico Caffè Greco is `historic-site`, not
   `cafe`, and **no `status` may say it is open**. Piazza Testaccio is `attraction`, not `park`;
   `park` is for planted ground. The Multisala Greenwich is `theater`.
3. **A `status` field must agree with the record's own prose.** Live cases: Crypta Balbi, the
   Mausoleo di Augusto, Sant'Ivo alla Sapienza, Palazzo Madama, the Colombario di Pomponio Hylas, the
   Mitreo di Santa Prisca, the Museo dell'Ara Pacis's parent square, the Ex Antiquarium and the
   Semenzaio, Palazzo Vidoni, the Scuderie di Augusto, Il Terzo Paradiso's absence.
4. **Attribute aggregators.** Write what Roma Capitale, the Sovrintendenza, the Soprintendenza
   Speciale, the Parco Archeologico or the institution says — not what Wikipedia says. Where an
   institution's dedicated page conflicts with its own rione page, the dedicated page wins.
5. **Where two sources conflict and nothing adjudicates, publish both attributed or publish neither
   — never blend and never silently pick.** Ruled in this wave: the Nereo e Achilleo hours (both,
   attributed), the Emporium's 193 BC against the 1st century AD (both), Palazzo FAO's completion
   year (neither), the Caserma De Jacobis construction span (neither), Ponte Cestio's 1892/1899
   (neither), Santa Maria in Publicolis' 1835/1858 (neither), the Cappella Cesi attribution
   (neither), Sant'Angelo in Pescheria's Sacconi/Tacconi vault fresco (neither), Palazzo Falconieri's
   two foundation dates (both), the Fontana della Barcaccia's attribution (both).
6. **Structural adjacency publishes; wayfinding does not.** "The church built into the propylaeum",
   "the tower set against the Portico", "the palace standing on the theatre", "the disc in the
   pronaos", "the theatre in front of the Area Sacra", "at the corner of viale delle Terme di
   Caracalla" — all fine. **Dead:** *a pochi passi*, *a due passi*, *near*, *beside*, *just around
   the corner*, *at the south end*, *a short distance away in the same square*, *behind the Teatro
   Argentina*, *immerso nel verde*, and the Hosianum's "4 minutes from piazza Venezia".
   **No trip durations.** A venue's own statement of its own product's length is not a trip duration
   and publishes: Palazzo Farnese's 60- and 90-minute tours, the Circo Maximo Experience's "a route
   of about 40 minutes", the Pyramid's 45-minute visits, Caracalla's five-year construction.
7. **OSM is not a source for hours, addresses, dates or identity on its own.** Every `opening_hours`
   string in these files drops unless a first-party page carries it. OSM is not an address authority
   (Colombario di Pomponio Hylas, Rhinoceros, L'Alibi, the Stadio Martellini). Where a business's own
   site and OSM disagree, the site wins — **and the page says nothing about the disagreement.**
8. **Name collisions across shipped files.** Each of these must carry a disambiguator in name *and*
   slug: Fontana della Dea Roma and Fontana del Nettuno (must carry "piazza del Popolo"), Santa Maria
   della Concezione (must carry "in Campo Marzio"), the Oratorio del SS Sacramento (must not read as
   Colonna's basilica), Palazzo Baldinotti Carpegna (never bare "Palazzo Carpegna" — Trevi ships
   Palazzo Carpegna), any wall segment (§6). And **the Giolitti on Via Amerigo Vespucci is a licensee
   and must never be conflated with the Via degli Uffici del Vicario original.**
9. **Do not name a rione a source does not name.** turismoroma calls Testaccio a *quartiere* on one
   page; it is R. XX. The Sovrintendenza's `Rione:` field is the form to follow where it exists — and
   it exists for Monte Testaccio, the Fontana di Pio IX, the Teatro di Marcello, the Portico
   d'Ottavia, the Fontana del Mascherone, the Parco degli Scipioni, the Colombario di Pomponio Hylas,
   Villa Celimontana and the Arco di Dolabella. **That field is the single best evidence in this
   wave and it is under-used.**

---

## 12. FOR THE COORDINATOR

**Places with a named owner that nobody writes this wave, and why. Route them; do not let them rot.**

| Place | Owner | Blocked by |
|---|---|---|
| Arch of Constantine · Meta Sudans · Torre dei Margani | Campitelli | Shipped file; needs an amendment pass |
| Sepolcro di Servio Sulpicio Galba | Celio | Celio's file does not know it holds this. **Tell Celio's author** |
| Casina Vignola Boccapaduli | Celio | Proved by Celio's finder and never recorded; needs one fetched source |
| Santa Maria in Tempulo · Parco di San Sebastiano · Oratorio dei Sette Dormienti | Celio | Dropped to Celio by San Saba; no Celio record exists |
| Arco di Druso | Celio | Owner settled, **no source exists**; both registers unreachable |
| Piazza della Consolazione | Ripa | No fetched source |
| Piazza dei Calcarari | Sant'Angelo | In it.wikipedia's rione list, missed by the harvest; needs a second source |
| Angelo Mai · Mercato di San Saba | San Saba | `angelomai.org` HTTP 500 twice; no market register reachable |
| Museo Criminologico · Centro Ararat · Schola Collegi · the Grimaldi/Righi/Celluprica plaque · Lapide per Aldo Moro | Ponte / Testaccio / Sant'Angelo | Dead or unopened sources. **The Moro plaque marks a murder and does not ship on an OSM tag** |

**Two structural findings for later waves.** First, **`taken_slugs.py` catches slug collisions but a
bare-name collision under a fresh slug is the same defect** — three near-misses this wave (Mura
Serviane, Palazzo Carpegna, Fontana della Dea Roma) and one that only Regola's verifier caught by
running a fragment its own finder never searched. Search names, not just slugs. Second, **wave 2's
coverage hole is closed** — the Pace, the Anima and the Bramante cloister are Ponte's and Ponte
writes them (§5a). **No hole of that shape remains open in the corpus.**
