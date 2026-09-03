# Flaminio (Q. I, Roma Capitale toponymic code 201) — FINDER file

Wave 4, Rome programme. **Evidence, not adjudication.** A verifier adjudicates; an arbitrator rules
ownership of straddlers across all nine zones. I do not resolve straddlers here.

Research date: 2026-09-03. Author: finder agent.

---

## 0. Compliance statement

The three binding rulings in `priv/seed_data/rome_roster.json` (`scope_ruling`, `vatican_ruling`,
`evidence_ruling`, plus `kind_note`) were read in full before work began.

1. **NO DESIGNATION CLAIMS.** Nothing below asserts that any building is *vincolato*, listed,
   scheduled, declared a monument or under state protection. Vincoli in Rete and the Catalogo
   generale were not reachable. Where a source I fetched touched on protection I omitted it.
2. **VATICAN.** Flaminio contains no Vatican City territory and no Lateran Treaty Art. 15 or
   Art. 16 property that I found. Nothing in this file needs the vatican_ruling.
3. **NO PHOTOGRAPHS.** Every record ships `"photos": []`. I sourced, named and linked no image.
   Photo leads for the later wave are prose-only in §8.
   **Flaminio is a heavy photo-reject zone** — see §8 before any image work.
4. `kind` values below are drawn only from the thirteen the schema allows. Churches are
   `historic-site`, not `church`.

Corpus rules observed: no superlatives, no trip durations, no orientation-by-impression, no
research method in reader-facing text. Phrases from sources that would violate those rules are
quarantined in §9 rather than transcribed.

---

## 1. Method, and what "I know which quartiere" means here

**Tooling.** The WebSearch budget was assumed exhausted; every retrieval ran against a URL named in
advance, fetched with `python3` + `urllib`. No piped `curl`, no `grep`/`find` as a source of truth.
Cache and scripts under `<scratchpad>/flaminio/`.

**Network reality, recorded so the next agent does not repeat my dead ends:**

| Endpoint | Result |
|---|---|
| `it.wikipedia.org/w/api.php` (`action=parse`, `list=search`, `list=categorymembers`, `list=geosearch`, `prop=coordinates`) | **HTTP 200 throughout — the backbone of this file** |
| `api.openstreetmap.org/api/0.6/relation/<id>/full.json` | **HTTP 200** |
| `overpass-api.de/api/interpreter` | **Intermittent.** `api/status` 200, then 504 on an `area` query, 200 on two bbox queries, then 429, then connection refused. Mirrors (kumi, private.coffee, osm.jp) did not complete either. Budget your queries. |
| `nominatim.openstreetmap.org/search` | 200 for the first four calls, then **429** and stayed 429 |
| `geoportale.comune.roma.it/sisto/api/...` | **HTTP 500 on every path, including the site root.** SISTO — the per-toponym municipal register the Prati wave found and called its best boundary evidence — was **down for the whole of this session.** This is the single biggest evidential loss in this file; see §3. |
| `www.maxxi.art` | **200** |
| `www.teatroolimpico.it` | **200** |
| `www.mdbr.it` (Explora) | **200** |
| `www.sovraintendenzaroma.it` (Sovrintendenza Capitolina) | **200 — official Roma Capitale, and it has a working `/search/node/<term>` path** |
| `*.cultura.gov.it` museum sites (`museoandersen.`, `direzionemuseistataliroma.`, `museiitaliani.`) | **DNS did not resolve.** `cultura.gov.it` itself returned 500. No state-museum site was reachable. |
| `www.romasegreta.it` | 200, but **it indexes rioni only** — there is no Flaminio page. Useless for a quartiere. |
| `www.turismoroma.it/it/luoghi/<slug>` | 404 on the slugs I guessed |

**Boundary method 1 — OSM point-in-polygon, computed locally.** I pulled full member geometry from
the OSM API and assembled rings in Python. Seven relations, all assembled **closed**:

| relation | unit | ring nodes |
|---|---|---|
| 5459632 | **Flaminio** (Q. I) | 179 |
| 5459647 | Parioli (Q. II) | 481 |
| 5459658 | Pinciano (Q. III) | 580 |
| 5473322 | Della Vittoria (Q. XV) | 657 |
| 5473380 | Tor di Quinto (Q. XVIII) | 286 |
| 5452743 | Campo Marzio (R. IV) | 215 |
| 5454355 | Prati (R. XXII) | 176 |

Flaminio's ring (r5459632, 179 nodes) is the same one the Prati finder tested against, so the two
waves are using an identical polygon. Where a record says **"PIP → X"** it means: the stated
coordinate ray-cast against those rings.

**Caveat that governs half of §4.** Flaminio's eastern boundary *is* via Flaminia, a road, and its
western boundary *is* the Tiber. A building fronting via Flaminia sits within metres of the line.
Wikipedia's `{{Coord}}` values are hand-placed and routinely off by 10–30 m. I therefore also
computed, for each test latitude, the **longitude at which the Flaminio ring itself crosses that
latitude**, so the *margin* is visible rather than just the verdict. Anything inside ~30 m of the
edge I have treated as **undecided** and flagged, not resolved. Margins are given in §4.

**Boundary method 2 — house-number parity on via Flaminia.** Overpass returned 40-odd
`addr:housenumber` objects on via Flaminia in the bbox. Tested against the ring the pattern is
completely clean:

- **odd numbers (1, 3, 5, 9, 13, 17, 21, 23, 25, 27, 33, 69 …) → PIP Flaminio**
- **even numbers (2, 4, 6, 8, 10, 12, 14, 18, 22 … 72) → PIP Pinciano**

This agrees with the quartiere's own article, which places Flaminio *«incuneato tra il **lato
sinistro** della via Flaminia e la sponda sinistra del Tevere»* — wedged between the left-hand side
of via Flaminia and the left bank of the Tiber. Going outward from the city, the left-hand side is
the western side, which is the odd side. **A via Flaminia address with an even number is prima
facie not Flaminio.** This is a rule of thumb derived from OSM, not from Roma Capitale, and the
verifier should treat it as corroborating rather than deciding.

**Boundary method 3 — it.wikipedia category membership.** `Categoria:Roma Q. I Flaminio` and
`Categoria:Chiese di Roma - Q.I Flaminio` were enumerated in full via `list=categorymembers`, as
were the Parioli, Pinciano and Della Vittoria equivalents. This is an aggregator and it **conflicts
with geometry in four places** (§4.2). It is recorded, not obeyed.

**Boundary method 4 — the subject's own article text.** Where an article says in prose «si trova
nel quartiere X» I have quoted it, because that is the strongest thing available in the absence of
SISTO. It settled Stadio Flaminio and the Palazzetto dello Sport against the brief (§5).

**What I could NOT do.** No municipal per-object record was obtainable (SISTO 500). No state-museum
site was obtainable (DNS). Opening hours below therefore come from an operator's own live site
where one was reachable, and are marked **[live]**; otherwise they are marked **[unverified]** and
should not ship as fact.

---

## 2. The quartiere itself

| Fact | Value | Source I fetched |
|---|---|---|
| Designation | **Q. I**, the first of Rome's quartieri by toponymic code | it.wiki `Flaminio (Roma)`, `action=parse` wikitext: «Flaminio è il primo quartiere di Roma, indicato con Q. I» |
| Toponymic code | 201 | `priv/seed_data/rome_roster.json` (Annuario statistico 2022, Tab. 1.3) |
| Named after | the **via Flaminia** | same article |
| Also a *zona urbanistica* | **2C** | same article |
| Created | among the first 15 quartieri conceived in **1911**, officially instituted in **1921** | same article |
| Coat of arms | azure, a flamen's *pileus* argent ornamented or | same article, citing Pietrangeli, *Insegne e stemmi dei rioni di Roma*, 1953 |

**Municipio — READ THIS BEFORE WRITING ONE.** The task brief forbids stating a Municipio for a
quartiere unless a source states it *for that quartiere*. Two do, and they agree:
- it.wiki's `{{Quartiere}}` infobox on `Flaminio (Roma)` gives `circoscrizione = Municipio Roma II`;
- Nominatim's own `display_name` for OSM relation 5459632 renders as
  *"Flaminio, **Municipio Roma II**, Roma, Roma Capitale, Lazio, 00196, Italia"*.

Both are aggregators. I reached no Roma Capitale instrument. **My recommendation: the page may say
Municipio II, attributed, or say nothing.** It must not be asserted as a bare fact.

**Stated borders**, from the quartiere's own article, footnote by footnote (each footnote names the
dividing line):

- **north and west** — Q. XV Della Vittoria, *«separato dal fiume Tevere, nel tratto da Ponte
  Matteotti fino a Ponte Milvio»*
- **east** — Q. II Parioli, *«separato da piazzale Cardinal Consalvi (Ponte Milvio) e da via
  Flaminia, fino a viale Maresciallo Pilsudski»*, and Q. III Pinciano, *«separato dalla via
  Flaminia, da viale Maresciallo Pilsudski a piazzale Flaminio (Porta del Popolo)»*
- **south** — R. IV Campo Marzio, *«separato dalle Mura aureliane (via Luisa di Savoia), da
  piazzale Flaminio (Porta del Popolo) al fiume Tevere (Ponte Matteotti)»*

**The consequence the brief got wrong: Flaminio is a LEFT-BANK quartiere only.** Everything across
the Tiber — the Foro Italico, the Stadio dei Marmi, the Stadio Olimpico — is Q. XV Della Vittoria,
which is **not in the roster at all**. See §5.

**History, sourced** (all from `Flaminio (Roma)`, which cites Carpaneto, Manodori, Rendina and
Vittorini's *Dalle armi alle arti*): until the end of the 19th century the straight run of via
Flaminia crossed flat fields periodically flooded by the Tiber. In **1905** the Società Automobili
Roma identified the river bend as a site for its plant. The **1911** Esposizione nazionale fixed the
area's character as a cultural, sporting and leisure pole — the Ippodromo dei Parioli (opened 1911,
closed 1929), the Stadio Nazionale, the Valle Giulia exhibition pavilions. The First World War turned
the Automobili Roma plant into the **Reale Fabbrica di Armi**, with barracks and workshops. The award
of the **1960 Olympics** brought a second transformation, with work by Libera, Cafiero, Moretti,
Monaco, Luccichenti, Vitellozzi and Nervi. The 1994 competition for the Auditorium began a third,
completed by the MAXXI (2010) and the ponte della Musica (2011).

---

## 3. Yield: my honest read

**Flaminio is a real page, but a thin one, and the brief oversold it by roughly a factor of two.**

Mechanical check: I ran `list=geosearch` from eight seed points covering the quartiere,
r = 1000 m, limit 500 each. **235 distinct it.wikipedia articles have coordinates in the area.
Exactly 17 of them PIP inside the Flaminio ring**, and two of those (Villa Almagià, Museo nazionale
delle paste alimentari) are for things that no longer exist there. The Overpass sweep for
`tourism`/`amenity`/`historic`/`leisure`/`building=church` across the same bbox returned 562
objects; **26 named ones PIP inside Flaminio**, and eleven of those are individual *pietre
d'inciampo* memorial studs.

That is the finding. Flaminio's reputation rests on a cluster — MAXXI, the Auditorium, the
Palazzetto, the Stadio, the Foro Italico — of which **only MAXXI is actually in Q. I.** The rest are
Parioli's or Della Vittoria's, and Della Vittoria is not even in the programme.

**Count: 34 candidates carried forward.** 18 I would defend as in-zone (§4.1), 16 flagged
straddlers or contested (§4.2). If the arbitrator gives Flaminio the three bridges whose far bank is
out-of-scope Della Vittoria, this is a **guide** — a short one, five or six strong records and a
tail. If those go elsewhere and the via Flaminia cluster goes to Pinciano, it collapses toward a
**town page**. My judgement: **guide, at the low end.**

---

## 4. Candidates

`kind` in brackets is my suggestion, from the schema's thirteen.

### 4.1 In-zone: PIP inside the Flaminio ring with margin, and no source contradicting

---

**1. MAXXI — Museo nazionale delle arti del XXI secolo** — [museum]
- **Address, from the museum itself:** via Guido Reni, 4/A, 00196 Roma. A second entrance at via
  Guido Reni 8 serves the bookshop and café during their hours.
  https://www.maxxi.art/come-raggiungerci/
- **Opening hours [live], from the museum itself:** Monday closed; Tuesday to Sunday 11–19; the
  ticket desk closes an hour before the museum.
  https://www.maxxi.art/orari-e-biglietteria/
- **What it is:** a national museum of 21st-century art and architecture, run by the Fondazione
  MAXXI under the culture ministry, in two sections, *MAXXI arte* and *MAXXI architettura*.
  it.wiki `MAXXI - Museo nazionale delle arti del XXI secolo`.
- **When and by whom:** international competition announced July 1998 by the Soprintendenza Speciale
  Arte Contemporanea; 273 entries, 15 shortlisted; **Zaha Hadid's** scheme selected end of February
  1999; opened **2010**. Built on the site of the disused **ex caserma Montello**; the long block
  beside the basilica and the via Guido Reni façade of the barracks survive and are incorporated
  into the design. Same article; the site is confirmed as *«nel quartiere Flaminio»* verbatim.
- **Boundary:** PIP → Flaminio. At lat 41.928644 the ring spans lon 12.459612–12.468945 and the
  museum is at 12.466467 — **~205 m inside** the eastern edge. Not marginal.
- **Ticketing note:** MAXXI is in the **Roma Pass** circuit (its own hours page). Audio guides €3.
- **PHOTO: HARD REJECT.** Hadid died 2016; protected to 2087. Writable, not photographable.
- Visitor figures: none published on the site I fetched.

**2. Piazza Alighiero Boetti (the MAXXI forecourt)** — [attraction]
- The museum's own site: *«La Piazza Alighiero Boetti – spazio di architettura e di arte – rimane
  aperta gratuitamente al pubblico per la fruizione delle opere collocate ed esposte al suo interno
  anche al di fuori degli orari di apertura del Museo»* — free, and open outside museum hours.
  https://www.maxxi.art/come-raggiungerci/
- OSM carries it as a named object at 41.928928, 12.466556; PIP → Flaminio.
- **PHOTO: HARD REJECT** — it is part of Hadid's scheme.
- *Verifier note:* this is arguably a sub-place of record 1 rather than its own record. I have
  listed it because it is free and separately open, which is exactly the kind of fact a guide needs.

**3. Museo Hendrik Christian Andersen** — [museum]
- **Address:** via Pasquale Stanislao Mancini 20. Its own article states it verbatim: *«è sito in
  Via Pasquale Stanislao Mancini 20 nel quartiere Flaminio a Roma»*.
  it.wiki `Museo Hendrik Christian Andersen`.
- **What it is:** the state-owned studio-house and sculpture collection of the Norwegian-American
  sculptor and urbanist Hendrik Christian Andersen. Run by the culture ministry — through the Polo
  museale del Lazio from December 2014 and the **Direzione Musei statali di Roma** from December
  2019.
- **When and by whom:** the building was put up **1922–1925** to Andersen's own design, a
  *palazzina* with attached sculpture studio, neo-Renaissance elevations with heads portraying
  members of his family on the via Mancini and via Pisanelli fronts. Andersen died in **1940** and
  left the state the house and his collection; public life began only after Lucia Andersen's death
  in **1978**. The museum opened **19 December 1999** (di Majo, *Museo Hendrik Christian Andersen*,
  Electa 2008, cited in the article).
- **Collection context:** the sculptures were carved for Andersen's *World Centre of Communication*,
  the visionary city he and **Ernest Hébrard** published in 1913 as *Creation of a World Centre of
  Communications*. Same article.
- **Visitors:** 10,803 in 2018, MiC *Visitatori e introiti dei musei* (linked from the article,
  Internet Archive copy).
- **Opening hours [UNVERIFIED — DO NOT SHIP AS FACT]:** the article gives 9.30–19.30, last entry
  18.45, closed Mondays, 1 January, 1 May and 25 December; €6 full, €2 reduced for EU citizens
  18–25, free under 18 and on the first Sunday of the month. Its citations are **archived copies of
  a ministry page from 2007 and 2014**. Every `.cultura.gov.it` host failed DNS for me, so I could
  not confirm these are current. If the verifier cannot re-fetch them either, the honest page says
  no current hours are given.
- **Boundary:** PIP → Flaminio, ~190 m inside the eastern edge (ring spans to 12.474981 at that
  latitude; museum at 12.472649). Solid.

**4. Teatro Olimpico** — [theater]
- **Address, from the theatre itself:** Teatro Olimpico, Piazza Gentile da Fabriano 17, 00196 Roma.
  https://www.teatroolimpico.it/contatti/
- **Box office hours [live]:** Monday to Friday 9.30–13 and 14–18.30; the same page carries a notice
  of a summer closure 25 July to 23 August. https://www.teatroolimpico.it/contatti/
- **What it is:** a 1,410-seat theatre — 966 in the raked stalls, 444 in the horseshoe gallery —
  with a stage about 10 m deep by 12 m wide, a removable timber floor and an orchestra pit. Home to
  most of the events staged by the **Accademia Filarmonica Romana**. it.wiki `Teatro Olimpico (Roma)`.
- **When and by whom:** the whole block was built **1935–36** by the firm *Garbarino, Sciaccaluga e
  Mezzacane* for the Società Generale Immobiliare, which had bought the property from the Banca
  Commerciale Italiana in 1935. It ran as the *Cine-Teatro Olimpico* from **1936**, mainly as a
  cinema with *avanspettacolo* in the intervals. The Accademia Filarmonica leased it after the
  Second World War. *Teatro Olimpico s.p.a.* was formed in **1980** and bought the building; the
  name and the programme became *Teatro Olimpico* in **1981**. A restoration recovered the original
  late-Rationalist architecture; reinforced concrete, travertine plinth and window surrounds.
- **A datable event a guide can use:** the concert of **4 March 1965** conducted by Pierre Boulez,
  the Italian premiere of Stravinsky's *Abraham and Isaac* and the European premiere of his *Elegy
  for J.F.K.* Same article.
- **Boundary:** PIP → Flaminio (41.926381, 12.461861), deep inside — the ring runs out to 12.469
  at that latitude. The theatre's own article says *«sorgevano il quartiere Flaminio e il Foro
  Italico»* in describing the period; its structure section places the block between piazza Gentile
  da Fabriano, lungotevere Flaminio, viale del Vignola and via Giorgio Vasari.
- **Photo lead:** the interior holds surviving stage elements — Corrado Cagli's gilded forms for
  Stravinsky's *Messa* (1975), Giacomo Manzù's backcloth for *Histoire du Soldat* (1966), a Mirko
  sculpture for *Chordination* (1968). All 20th-century and in copyright. Treat as reject.

**5. Basilica di Santa Croce a Via Flaminia** — [historic-site]
- **Address:** via Guido Reni. it.wiki `Basilica di Santa Croce a Via Flaminia`.
- **What it is:** a neo-Romanesque/neo-Byzantine basilica, a parish church, and since **5 February
  1965** the seat of the cardinalatial title *Santa Croce in Via Flaminia*, instituted by Paul VI.
- **When and by whom:** built by the engineer **Aristide Leonori** at the wish of **Pius X** to mark
  the sixteenth centenary of the Edict of Milan (313). Works began **17 October 1912**; the church
  was opened **29 December 1913**; consecrated **21 May 1918** by Giuseppe Palica, titular archbishop
  of Philippi and vicegerent of the diocese of Rome. Raised to **parish** on 19 March 1914 by the
  apostolic constitution *Quod iam pridem* and entrusted to the Stimmatine fathers. Made a **minor
  basilica** by Paul VI in **1964**.
- **Contents:** a modern, embroidered and jewelled reproduction of the Constantinian *labarum*.
- **Adjacency a guide may state:** the MAXXI stands on the ex caserma Montello *«accanto alla
  basilica di Santa Croce a Via Flaminia»* — the two physically adjoin, and the competition brief
  required conserving the two-storey block on the boundary with the parish church.
  it.wiki `MAXXI…`. Two structures that adjoin may be said to adjoin.
- **Boundary:** PIP → Flaminio, ~90 m inside the eastern edge. Solid.
- **Opening hours:** none found on any source I reached.
- OSM also carries a `building=chapel` named *Capella Santi Sposi* at 41.928718, 12.468343, PIP →
  Flaminio, immediately beside the basilica. I found no article and no other source for it.
  **Do not write it up on OSM alone.**

**6. Palazzo Marina** — [historic-site]
- **Address:** two main entrances — one on **piazza della Marina**, off via Flaminia, and one on
  **lungotevere delle Navi**; a service entrance on via Domenico Alberto Azuni. it.wiki
  `Palazzo Marina`, which places it *«nel quartiere Flaminio»* verbatim.
- **What it is:** a state building owned by the Ministry of Defence, seat of the coordinating
  department of the Regia Marina from its opening and today of the Navy; it houses the Navy's
  central library.
- **When and by whom:** commissioned from the architect **Giulio Magni** by the Ministry of the
  Navy; the commission dates to **1912**, which is why the design keeps Roman Liberty,
  *barocchetto* and eclectic elements. **Inaugurated 28 October 1928** — the article notes the date
  was the sixth anniversary of the fascist regime and cites *La Stampa*, 29 October 1928, p. 1, via
  the Archivio La Stampa.
- **Measured facts a guide can use:** site of 31,000 m², of which 11,500 m² built over and 4,580 m²
  courtyards and gardens; 28 m high, 142 m long, six storeys plus an attic, about 750 rooms
  (the article cites the Marina Militare's own page).
- **The detail worth the paragraph:** the main river-front entrance is flanked by the anchors of the
  Austro-Hungarian battleships ***Tegetthoff*** (left) and ***Viribus Unitis*** (right); brick and
  travertine, with reliefs, sculpture and glass on marine themes.
- **Film note:** used for scenes in Orson Welles's *The Trial* (1962) — the article's source is IMDb
  Filming Locations, which is user-contributed. **Attribute or drop.**
- **Boundary:** PIP → Flaminio (41.915324, 12.471622), well inside.
- **Access:** it is a working ministry. **No source I reached states public opening hours.** The
  Sovrintendenza Capitolina ran an educational programme titled *"Palazzo Marina ed il quartiere
  Flaminio"* on 17 October 2018 (sovraintendenzaroma.it `/search/node/Flaminio`), which shows
  organised visits happen but does not establish general access. Default `status: open`, prose says
  nothing is known about access.

**7. Monumento a Giacomo Matteotti — *L'idea, la morte*** — [attraction]
- **Address:** lungotevere Arnaldo da Brescia, 00192. it.wiki `Monumento a Giacomo Matteotti`.
- **What it is:** an abstract bronze by **Iorio Vivarelli**, a tall slender spire over a tangle at
  its base; a plaque facing the road carries words attributed to Matteotti at his death.
- **When:** funded by a private subscription promoted by the Partito Socialista Italiano and
  **unveiled in 1974**, the fiftieth anniversary of the killing. Matteotti, deputy and secretary of
  the Partito Socialista Unitario, was seized by a fascist squad on **10 June 1924** nearby.
- **Where exactly:** on a small semicircular green plot at the top of the **Scalo de Pinedo**.
- **Boundary:** PIP → Flaminio (41.913, 12.47215). The corroborating article
  `Lungotevere Arnaldo da Brescia` says the monument was erected on that lungotevere in 1974.
- **PHOTO: REJECT.** Vivarelli died 2008; Italy has no freedom of panorama.
- **Related, and a straddler — see §4.2:** the *Delitto Matteotti* article carries a coordinate at
  41.913861, 12.471806 which also PIPs Flaminio. The abduction site itself is a historical event,
  not a place; I would not make it a record.

**8. Scalo de Pinedo** — [historic-site]
- **Address:** lungotevere Arnaldo da Brescia, 00192. it.wiki `Scalo de Pinedo`, infobox.
- **What it is:** a disused river port on the Tiber, owned by **Roma Capitale**, `stato = in disuso`.
- **When and why:** built at the end of the **19th century** to replace the **Porto di Ripetta**,
  demolished in the same years to make way for the *muraglioni* flood embankments; the new landing
  reproduced the 18th-century architectural design of the old one by **Alessandro Specchi**. The
  1909 master plan changed the area's designation from industrial-artisanal to residential and the
  landing lost its function within a few years of opening. Article cites
  https://www.romasegreta.it/tevere/scalo-de-pinedo.html — an **aggregator**, attribute it.
- **Boundary:** PIP → Flaminio; OSM's three `Scalo De Pinedo` objects (41.912972–41.913225,
  12.471863–12.472079) all PIP → Flaminio.
- *Note for the writer:* the old port stood **about one kilometre downstream on the same bank** —
  that is a sourced measurement plus a bank, not an impression, so it publishes.

**9. Piazza Perin del Vaga and the Case ICP Flaminio II** — [attraction]
- **Address:** piazza Perin del Vaga, 00196, running between piazza Melozzo da Forlì and the
  junction of via Girolamo Muziano with via Masolino da Panicale. it.wiki `Piazza Perin del Vaga`,
  which gives `quartiere = Flaminio` and `circoscrizione = Municipio Roma II`.
- **What it is:** an elliptical square, now a pedestrian island, ringed by neo-Renaissance
  residential blocks, with two travertine dolphin fountains at its sides.
- **When and by whom:** laid out in the 1920s as part of the **ICP Flaminio II** public housing
  scheme, already provided for in Rome's **1909** master plan. Lots by **Mario De Renzi** (lot I)
  and **Alessandro Limongelli** (lots II and III); the outer buildings by **Giuseppe Wittinch** and
  **Tito Bruner**. The quartiere article dates the Case ICP Flaminio II to **1925–27** and places
  them on piazza Perin del Vaga at 41.924874, 12.464779 — which PIPs Flaminio.
  Sources: ArchiDiAP https://archidiap.com/opera/case-icp-flaminio-ii/ and
  https://www.rerumromanarum.com/2022/11/icp-flaminio-ii.html (both **aggregators**).
- **A municipal fact:** the square's name already appears in the 1935 *Dizionario toponomastico*;
  the article cites SISTO record 8377,
  https://geoportale.comune.roma.it/sisto/viario/8377/dettaglio — **which returned 500 for me and
  which I therefore could not confirm.**
- **When it became pedestrian:** the requalification as a pedestrian island was inaugurated in
  **2019**, run by Roma Servizi per la Mobilità. Roma Capitale news item, 12 July 2019:
  https://www.comune.roma.it/web/it/notizia.page?contentId=NWS376651 (not fetched by me; carried
  from the article's citation — the verifier should fetch it before it ships).
- **Boundary:** PIP → Flaminio, comfortably.
- **PHOTO:** De Renzi d. 1967, Limongelli d. 1932, Wittinch d. 1955, Bruner d. 1976. Bruner's
  buildings are in copyright to 2046. Flag for the photo wave.

**10–12. The three left-bank lungoteveri that are wholly Flaminio's** — [attraction]

Each has its own article giving `quartiere = Flaminio` in the infobox and in prose, each citing
Rendina–Paradisi, *Le strade di Roma*, 2004.

| Name | Runs | Sourced detail | PIP |
|---|---|---|---|
| **Lungotevere Flaminio** | piazzale delle Belle Arti → ponte Duca d'Aosta | period *palazzine* and riverside sports clubs, including the **Cavalieri di Colombo** foundation's, designed by **Bruno Ernesto Lapadula in 1934** | Flaminio (41.92508, 12.462425) |
| **Lungotevere delle Navi** | ponte Giacomo Matteotti → piazzale delle Belle Arti | named for the Navy, whose ministry building stands on it; **instituted by a governor's deliberation of 7 May 1928** | Flaminio (41.916195, 12.47151) |
| **Lungotevere Grande Ammiraglio Thaon di Revel** | ponte Duca d'Aosta → via Flaminia | official form *"lungotevere Grande A.glio Thaon di Revel"*; named for **Paolo Thaon di Revel**, chief of naval staff in the First World War | Flaminio (41.932637, 12.464011) |

The fourth, **lungotevere Arnaldo da Brescia**, is a straddler — §4.2.

**13. Circolo Canottieri Roma** — [attraction]
- **Address:** lungotevere Flaminio 39. it.wiki `Circolo Canottieri Roma`, infobox.
- Founded **1919**; awarded the CONI *stella d'oro al merito sportivo* in **1971** and the
  *collare d'oro* in **2019**. Own site: https://www.canottieriroma.it/
- **Boundary:** lungotevere Flaminio is wholly in Q. I (record 10).
- *Verifier note:* **a private members' club.** I would not ship it as a visitor place. It is here
  because the lungotevere Flaminio article names the riverside clubs as the street's defining
  feature, and a guide may want one sentence on them without a record of its own.
- Two other Rome rowing clubs turned up in the same search and are **not** in Flaminio:
  Circolo Canottieri Aniene (lungotevere dell'Acqua Acetosa 119) and Reale Circolo Canottieri
  Tevere Remo (lungotevere in Augusta 28 — Campo Marzio, and lungotevere in Augusta is already
  Campo Marzio's).

**14. Biblioteca Flaminia** — [attraction]
- **Address:** via Cesare Fracassini 9. OSM `amenity=library`, 41.9234312, 12.470938, PIP →
  Flaminio, with `website=https://www.bibliotechediroma.it/…`
- Part of the **Biblioteche di Roma** municipal network. The network's page for the branch is a
  JavaScript shell and returned no content to a fetcher, so **no hours are sourced.**
- Low priority. Include only if the page needs a civic layer.

**15. Cinema Tiziano** — [theater]
- **Address:** via Guido Reni 2. OSM `amenity=cinema`, 41.929071, 12.4679184, PIP → Flaminio.
- **No it.wikipedia article, and the only contact OSM carries is a Facebook page.** I did not
  establish that it is currently trading. **Do not ship without a live operator source.**

**16. PalaLuiss** — [stadium]
- **Address:** via Martino Longhi 2. OSM `leisure=sports_centre`, 41.932092, 12.4644322, PIP →
  Flaminio; `website=https://palaluiss.luiss.it` (not fetched by me).
- The quartiere article's Sport section notes that *Luiss Roma* played in Serie B basketball in
  2019-20, citing the Lega Pallacanestro. Weak. A sports hall, not a sight.

**17. Circolo Tennis della Stampa** — [attraction]
- Piazza Antonio Mancini 19. OSM, 41.9308783, 12.4632417, PIP → Flaminio;
  `website=https://www.circolotennisdellastampa.it/`. Private club. Same treatment as record 13.

**18. Two small public gardens** — [park]
- **Giardino Italiani nel Mondo**, OSM `leisure=garden`, 41.9268929, 12.4615403, PIP → Flaminio.
- **Giardini Viale Pinturicchio**, OSM `leisure=park`, 41.9299405, 12.4629763, PIP → Flaminio.
- Named in OSM only. No article, no municipal page reached. **Thin — include only if the page needs
  green space, and say only what a name and a location support.**

---

### 4.2 STRADDLERS AND CONTESTED — flagged, not resolved

**This is the important half of this file.** Flaminio's two long boundaries are a road and a river,
and almost everything with a name sits on one of them.

#### (a) The via Flaminia cluster — Wikipedia says Flaminio, geometry says Pinciano

Four objects are filed by it.wikipedia under `Categoria:Roma Q. I Flaminio` (three of them under
`Categoria:Chiese di Roma - Q.I Flaminio`) **and two of them say «quartiere Flaminio» in their own
opening sentence** — yet every one of them PIPs *outside* the Flaminio ring, by a margin small
enough that a hand-placed Wikipedia coordinate could account for it. **I cannot settle these and I
am not going to pretend to.**

| Subject | Coordinate | Flaminio ring's east edge at that latitude | Outside by | PIP |
|---|---|---|---|---|
| **Chiesa di Sant'Andrea del Vignola** | 41.921191, 12.472031 | 12.471988 | **~4 m** | Pinciano |
| **Fontana di papa Giulio III** | 41.918316, 12.473309 | 12.473221 | **~7 m** | Pinciano |
| **Oratorio di Sant'Andrea a Ponte Milvio** | 41.9337, 12.4676 | 12.467368 | **~19 m** | Parioli |
| **Arcosolio (Abbeveratoio) di Benedetto XIV** | *no coordinate on the article* | — | — | undetermined |

What each one actually is, since the arbitrator will need it:

- **Chiesa di Sant'Andrea del Vignola** (also *Sant'Andrea a via Flaminia*) — [historic-site].
  Built about **1553** to a design by **Jacopo Barozzi da Vignola** for **Julius III**, inside the
  grounds of his suburban villa (Villa Giulia), as a votive chapel marking his escape from Rome on
  30 November — St Andrew's day — during the 1527 Sack. Brick parallelepiped, peperino façade with
  pilasters and a triangular pediment, an oval half-dome on an internal oval cornice, rectangular
  hall and rectangular apse. Partly restored 1826–30 with **Giuseppe Valadier** involved; the
  polychrome floor restored in 1950 under the architect Zander; the dome re-clad in lead in 1977 and
  returned to *coccio pesto* in the 1990s. A subsidiary place of worship of the parish of
  **Sant'Eugenio**. it.wiki `Chiesa di Sant'Andrea del Vignola`, whose first line is
  *«si trova a Roma nel quartiere Flaminio»*.
  **Complication the arbitrator must weigh:** the church was built *inside the Villa Giulia
  complex*, and Villa Giulia is unambiguously Pinciano (`Categoria:Roma Q. III Pinciano`).
- **Fontana di papa Giulio III** — [attraction]. At the junction of via Flaminia and via di Villa
  Giulia, set against the chamfered corner of the *palazzetto di Pio IV*. Erected **1552** by
  **Julius III** for the public use of travellers, fed by a secondary conduit of the **Aqua Virgo**
  dug for his villa; **Bartolomeo Ammannati** was the architect charged with the nymphaeum and the
  fountain and left a memoir describing the excavation. it.wiki `Fontana di papa Giulio III`.
  **Same complication:** via di Villa Giulia runs east off via Flaminia into Pinciano.
- **Arcosolio di Benedetto XIV**, also *Abbeveratoio di Benedetto XIV* — [attraction]. A drinking
  trough fountain now standing on via Flaminia **between numbers 94 and 96**, moved there after a
  long history of substitutions, rebuildings, demolitions and transfers; its story tangles with at
  least three other fountains. Originally a plain horse trough set opposite the Julius III fountain
  across the villa's access road: an oval granite basin of Roman bath origin with relief handles,
  fed by a mascaron in a shell valve. it.wiki `Arcosolio di Benedetto XIV`.
  **The article carries no coordinate.** By the parity rule of §1, **94 and 96 are even numbers,
  and every even number on via Flaminia that OSM records PIPs Pinciano.** That is the best evidence
  I have and it points away from Flaminio.
- **Oratorio di Sant'Andrea a Ponte Milvio** (*Sant'Andrea a Ponte Molle*) — [historic-site]. On via
  Flaminia shortly before the road reaches ponte Milvio. A rectangular **15th-century** oratory
  built beside an aedicule put up by **Pius II** to commemorate **11 April 1462**, when the pope went
  out to meet Cardinal Bessarione carrying the head of the apostle Andrew — a relic saved by Thomas
  Palaiologos, despot of Patras, brought to Ancona, then overland to Narni and down the Tiber to
  ponte Milvio. The Piccolomini arms are over the door. **Pius V** granted it to the archconfraternity
  of the Trinità dei Pellegrini in **1566**. A small cemetery for foreigners who died on pilgrimage
  surrounds it; some wall tablets and an ossuary survive, the ossuary's entrance at the centre of
  the little garden. The aedicule — travertine base, four alabaster colonnettes with Ionic capitals
  and Attic bases, a small dome — is attributed to Francesco del Borgo; the statue of St Andrew
  beneath it was carved by **Paolo Taccone in 1463** (Manodori), though Armellini gives Varrone and
  Niccolò of Florence, pupils of Filarete. Today a subsidiary place of worship of the parish of
  **Santa Croce a via Flaminia** — which *is* in Flaminio. it.wiki
  `Oratorio di Sant'Andrea a Ponte Milvio`, first line: *«si trova nel quartiere Flaminio»*.
  **19 m outside the ring, on the Parioli side.**

**My recommendation to the arbitrator on this cluster:** these four either all belong to Flaminio or
all belong to Pinciano/Parioli, and the evidence is split — text and category say Flaminio, geometry
and house-number parity say the other side. If SISTO comes back up, `via Flaminia`'s delibera notes
will settle it in one fetch. **Until then I would not ship any of the four in any zone.**

#### (b) Piazzale Flaminio — sourced, explicit, two-way

- it.wiki `Piazzale Flaminio` states it outright: *«è un ampio piazzale carrabile di Roma, **diviso
  tra i quartieri Pinciano e Flaminio** nel Municipio II»*, citing a Roma Capitale
  `dettaglioAreaCircolazione` record (codiceVia 4184) that the article itself marks `urlmorto=sì`.
  Its infobox lists `quartiere = Pinciano / Flaminio`. It sits in `Categoria:Roma Q. I Flaminio`.
- PIP at 41.911811, 12.476048 → **Pinciano**, and the ring's edge at that latitude is 12.475883 —
  **14 m.** Consistent with a genuinely split square.
- **Porta del Popolo is IN THIS SQUARE AND IS ALREADY CAMPO MARZIO'S** (slug
  `porta-del-popolo-campo-marzio-rome`). Flaminio's own article lists Porta del Popolo under
  *Altro*. **It may not be taken again.** Nor may Piazza del Popolo, the Fontana del Nettuno, the
  Fontana della Dea Roma, the Fontana dei Leoni, the fontane sarcofago, the Obelisco Flaminio or
  Santa Maria del Popolo — all seven are Campo Marzio's, all seven were checked mechanically.
- The square also contains the **propylaea of the monumental Villa Borghese entrance** on viale
  Giorgio Washington, and Villa Borghese is Pinciano's.
- Two transport nodes sit in it and inherit the same problem:
  - **Flaminio (metropolitana di Roma)**, line A, opened **16 February 1980** as part of the first
    Anagnina–Ottaviano section; renamed *Flaminio-Piazza del Popolo* in 2005. It is a member of
    **both** `Categoria:Roma Q. I Flaminio` **and** `Categoria:Roma Q. III Pinciano`. PIP at
    41.912744, 12.476464 → Pinciano. Nominatim's own record for the station node reads
    *"Flaminio, Viale Giorgio Washington, **Pinciano**, Municipio Roma II…"*.
  - **Stazione di Piazzale Flaminio**, terminus of the Roma–Civita Castellana–Viterbo railway, run
    by ASTRAL; **opened 28 October 1932** with the Roma–Civita Castellana section, the urban
    approach bored in tunnel under the Parioli; rebuilding of a new station began in 2015.
    it.wiki `Stazione di Piazzale Flaminio`.

#### (c) The bridges — every one of them is a straddler by construction

Flaminio's article lists six under *Ponti*. Here is the true position of each:

| Bridge | Other bank | In scope? | Already owned? | Verdict needed |
|---|---|---|---|---|
| **Ponte Milvio** | Della Vittoria **and** Tor di Quinto; left-bank landing shared with **Parioli** | Parioli **is** in the roster | no | **CONTESTED between two in-scope zones** |
| **Ponte Duca d'Aosta** | Q. XV Della Vittoria | Della Vittoria is **not** in the roster | no | Flaminio is the only in-scope claimant |
| **Ponte della Musica-Armando Trovajoli** | Q. XV Della Vittoria | not in roster | no | same |
| **Ponte del Risorgimento** | Q. XV Della Vittoria | not in roster | no | same |
| **Ponte Giacomo Matteotti** | Prati | — | **YES — Prati's** (`ponte-giacomo-matteotti-prati-rome`) | **do not take** |
| **Ponte Pietro Nenni** | Prati | — | **YES — Prati's** (`ponte-pietro-nenni-prati-rome`) | **do not take** |

- **Ponte Milvio** — [historic-site]. Its own article is unusually precise and is the reason this is
  a four-way problem: *«collega **piazzale Cardinal Consalvi, diviso tra il quartiere Flaminio e il
  quartiere Parioli**, a piazzale di Ponte Milvio, diviso tra il quartiere Della Vittoria e il
  quartiere Tor di Quinto»*. Its categories are `Roma Q. II Parioli` and `Roma Q. XVIII Tor di
  Quinto` — **Q. I Flaminio is not among them**, even though the Flaminio article lists the bridge.
  PIP of the midpoint (41.935556, 12.466944) → **Parioli**. Of the twenty `Piazzale Cardinal
  Consalvi` objects Overpass returned, **17 PIP Parioli and 3 PIP Flaminio** — the square really is
  cut by the line.
  *Facts, if it is awarded:* first mentioned by Livy in relation to **207 BC**, when it was still
  timber and attributable to a *Molvius*; rebuilt in masonry by the censor **Marcus Aemilius
  Scaurus in 110–109 BC**. Site of Volturcius's arrest and, in **312**, of the battle between
  Constantine and Maxentius. Sovrintendenza Capitolina, official: six arches, the inner ones taller,
  the outer smaller and tied to the embankments; the northern of the central arches was blown by
  Garibaldians in **1849** and restored by Pius IX; five piers with triangular cutwaters and arched
  openings for flood flow; core of Grotta Oscura tuff, facing of *pietra sperone* and travertine;
  in **27 BC** an arch with a statue honouring Augustus stood on it, since lost; medieval
  superstructures with corbels and small arches survive on the east side of the southern head;
  the two outer arches, replaced by timber walkways, were rebuilt in masonry by **Valadier in
  1805** under Pius VII; on the right bank a timber tower called the *Tripizone* was replaced by
  Callixtus III with a square tower still partly standing, altered under Pius VII, with a marble
  plaque bearing the arms of Callixtus III and his nephews Rodrigo and Pierluigi Borgia; the
  statues of St John Nepomuk and the Immaculate on the southern head date from the same period.
  http://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/ponte_milvio — the page ends
  *«Informazioni e prenotazioni: Accessibile al pubblico»*, which is a usable access statement.
  it.wiki adds: **Francesco Mochi's** *Baptism of Christ* stood at the southern approach from the
  17th century and is now replaced by a copy, the original in the atrium of the **Museo di Roma at
  Palazzo Braschi**; the Immaculate is by **Domenico Pigiani**, added in the 1850 restoration.
  Vehicle traffic was cut sharply from **1951** when ponte Flaminio opened and stopped entirely in
  **1978**; the bridge is now pedestrian.
  *The love-locks story, dated:* the habit came from the film ***Ho voglia di te*** and spread from
  the central lamp-post; in **July 2007** a lamp-post broke under the weight and the Comune
  installed posts and chains; **the locks were removed for good in September 2012** (Corriere della
  Sera Roma and la Repubblica, both 10 September 2012, cited in the article). Written as a dated
  sequence this is publishable; written as "famous for" it is not.
- **Ponte Duca d'Aosta** — [historic-site]. it.wiki: connects the quartieri **Flaminio and Della
  Vittoria**. Foreseen from Del Debbio's **1927** Foro Mussolini scheme as its scenographic entrance
  from Flaminio. Competition tendered by the Ministry of Public Works in **1935**, 18 entries
  including Ballio Morpurgo, Aschieri, Vaccaro and Del Debbio; won by **Vincenzo Fasolo** with the
  structural engineer Aurelio Aureli. Begun **21 June 1936**, inaugurated **26 March 1939**.
  Reinforced concrete faced entirely in Tivoli travertine, **222.3 m long, 30 m wide**, of which
  21 m carriageway and two 4 m footways; three segmental arches. PIP of the OSM way centre
  (41.9311435, 12.4608557) → Flaminio; PIP of the Wikipedia coordinate (41.931252, 12.460603) →
  Della Vittoria. **A bridge has two ends; that is the whole point.**
- **Ponte della Musica-Armando Trovajoli** — [historic-site]. it.wiki: crosses the Tiber **between
  the quartieri Della Vittoria and Flaminio**, slung between lungotevere Flaminio and lungotevere
  Maresciallo Cadorna. Steel and reinforced concrete, **22 m wide**, cycle, pedestrian and public
  transport only. A bridge here was already in the **1929** master plan; an international competition
  in **2000** was won by **Buro Happold** with the engineer Davood Liaghat and **Kit
  Powell-Williams Architects**; built **2008–2011**; **inaugurated May 2011** as *ponte della
  Musica* and renamed for **Armando Trovajoli on 30 May 2013**. Roma Capitale's own news items are
  cited for both dates. PIP of the OSM way centre → Flaminio; of the Wikipedia coordinate → Della
  Vittoria.
  **PHOTO: REJECT.** Kit Powell-Williams and Buro Happold, 2011 — firmly in copyright.
- **Ponte del Risorgimento** — [historic-site]. it.wiki: joins piazzale delle Belle Arti to piazza
  Monte Grappa, **in the quartieri Flaminio and Della Vittoria**. **159.10 m long, 20.95 m wide**;
  a single very flat arch of about 10 m rise. Built **1909–1911** by **Giovanni Antonio Porcheddu**,
  then sole Italian licensee of **François Hennebique's** patent, with the engineers Chiera, Giaj
  and Parvopassu and Hennebique himself supervising. **Inaugurated 11 May 1911 by mayor Ernesto
  Nathan**, in the celebrations for the fiftieth anniversary of Rome as capital. Four inscriptions
  are cast into the parapets and can be quoted verbatim; the north side reads *«Ponte in cemento
  armato ad un'unica arcata di 100 metri di corda con freccia di 10 metri»* and *«Costruito con
  sistema Hennebique dalla Società Porcheddu Ing. G.A.»*; the south side *«Inaugurato l'11 maggio
  del 1911 nel cinquantenario della proclamazione di Roma Capitale d'Italia»* and *«Dall'amministrazione
  popolare cittadina al Risorgimento Italiano»*. **The claim about the span's world ranking is
  quarantined in §9 — do not carry it.**

#### (d) Lungotevere Arnaldo da Brescia — rione and quartiere

- Its own article: *«è il tratto di lungotevere che collega via Ferdinando di Savoia al ponte
  Matteotti, a Roma, **nel rione Campo Marzio e nel quartiere Flaminio**»*, citing Rendina–Paradisi.
  The infobox literally carries `distretto = Campo Marzio` and `quartiere = Flaminio`.
- **Campo Marzio is shipped** and already owns `lungotevere-in-augusta-campo-marzio-rome`; it did
  **not** take Arnaldo da Brescia. PIP at 41.911129, 12.472496 → Flaminio.
- Both the Monumento a Matteotti (record 7) and the Scalo de Pinedo (record 8) are addressed to this
  lungotevere and both PIP Flaminio comfortably, so the *objects* are safe even if the *street* is
  split. Flagged for the arbitrator all the same.

#### (e) Via Flaminia itself

- The road is the boundary, and it is a member of `Roma Q. I Flaminio`, `Roma Q. II Parioli` and
  `Roma Q. III Pinciano` simultaneously. The quartiere article says the road delimits Flaminio *«per
  l'intera lunghezza del suo confine orientale»*.
- If any zone writes it up, the page must not imply the street is inside one quartiere.
- Note for the writer: the road is far older than the quartiere — **220–219 BC**, built by **Gaius
  Flaminius Nepos**, running from the **Porta Flaminia** to *Ariminum* (Rimini). it.wiki
  `Via Flaminia`. Porta Flaminia is Porta del Popolo, **which is Campo Marzio's**.

#### (f) Accademia Filarmonica Romana / Sala Casella

- The Accademia was founded in Rome in **1821** by amateur musicians led by Raffaele Muti Papazzurri,
  became an official institution of the Papal States in **1824**, and is a non-profit body under a
  presidential decree of 7 February 1969. it.wiki `Accademia Filarmonica Romana`, whose lead image
  caption places its seat *«in via Flaminia»*.
- **Its seat is on via Flaminia at an even number and is therefore on the Pinciano side by the
  parity rule.** Its *performances* are overwhelmingly at the Teatro Olimpico, which is
  unambiguously Flaminio. **Write the Accademia into the Teatro Olimpico record as the resident
  institution; do not give its own building a Flaminio record.** Flagged.

---

## 5. EXPLICIT EXCLUSIONS — the brief's likely subjects that are NOT in Flaminio

The task brief named "the Ponte Milvio, the Foro Italico and the Stadio dei Marmi, the Palazzetto
dello Sport, Villa Glori". **Four of those five are not Flaminio's, and I checked each mechanically.**

| Subject | Actually in | Evidence |
|---|---|---|
| **Foro Italico** | **Q. XV Della Vittoria** | `Categoria:Roma Q. XV Della Vittoria`. PIP (41.932492, 12.457357) → Della Vittoria. Right bank; Flaminio's own article confines it to the **left** bank. |
| **Stadio dei Marmi Pietro Mennea** | **Q. XV Della Vittoria** | same category; PIP → Della Vittoria |
| **Stadio Olimpico**, Stadio Centrale del Tennis, Stadio Nicola Pietrangeli, Complesso natatorio del Foro Italico, Accademia di scherma, Palazzo H, Casa Balla, Palazzo della Farnesina, Villa Madama, Monte Mario | **Q. XV Della Vittoria** | all in that category; PIP of Stadio Olimpico → Della Vittoria |
| **Palazzetto dello Sport (PalaTiziano)** | **Q. II Parioli** | its own article: *«sorge a Roma nel quartiere Parioli»*. PIP (41.929617, 12.470732) → Parioli, **~180 m outside** the ring. Vitellozzi + Nervi, designed 1956, built 1956–57 for the 1960 Games. |
| **Stadio Flaminio** | **Q. II Parioli** | its own article, verbatim and unusually direct: *«**nonostante il nome lo stadio appartiene amministrativamente al quartiere Parioli**, alla cui estremità occidentale esso sorge, essendo il citato viale Tiziano adiacente al confine amministrativo con il quartiere Flaminio»*. PIP → Parioli, **~213 m outside**. Antonio Nervi with Pier Luigi Nervi, 1957–58, opened 19 March 1959, on the site of the demolished Stadio Nazionale. |
| **Villa Glori** (Parco della Rimembranza) and the **Ipogeo di Villa Glori** | **Q. II Parioli** | own article: *«un parco di 25 ettari nella città di Roma (Municipio II), nel quartiere Parioli»*. PIP → Parioli. |
| **Auditorium Parco della Musica "Ennio Morricone"** | **Q. II Parioli** | already ruled in the roster; PIP → Parioli. Renzo Piano living — photo reject. |
| **Villa romana dell'Auditorium / Museo Archeologico dell'Auditorium** | **Q. II Parioli** | Sovrintendenza Capitolina's own listings call it *«la villa romana dell'Auditorium Flaminio»* but it is physically under the Auditorium, which is Parioli's. **A trap: the word "Flaminio" in its name is not a location claim.** |
| **Villaggio Olimpico** (zona urbanistica 2A) | **Q. II Parioli** | in the Parioli category; Parioli's article says the Villaggio, opened 1960, is part of it |
| **Piazza Mancini** and its bus terminus | **Q. II Parioli** | PIP → Parioli |
| **Explora – Il museo dei bambini di Roma** | **Q. III Pinciano** on my evidence | its own site gives **Via Flaminia, 80/86 – 00196 Roma** (https://www.mdbr.it/). Even numbers → east side. OSM's Explora node (41.915095, 12.474666) PIPs Pinciano, 11 m outside the ring. **Close, and worth a second opinion, but it is not Flaminio on anything I have.** |
| **Ponte Flaminio** (ponte dei Ministeri) | **Q. XVIII Tor di Quinto** | PIP (41.936309, 12.471575) → Tor di Quinto. Opened 1951 (per the Ponte Milvio article). Neither Tor di Quinto nor Della Vittoria is in the roster. |
| **Porta del Popolo, Piazza del Popolo and everything in it** | **R. IV Campo Marzio — SHIPPED** | verified with `taken_slugs.py`: seven objects already owned |
| **Ponte Giacomo Matteotti, Ponte Pietro Nenni** | **R. XXII Prati — SHIPPED** | verified with `taken_slugs.py` |

**Three things in Flaminio's own category that no longer exist and should not become records:**

- **Villa Almagià** (villa Almagià-Bondi), lungotevere Arnaldo da Brescia — Giulio Magni, 1910, for
  Edoardo Almagià; the Matteotti abduction is said to have happened in front of it in 1924;
  **demolished in 1961** and replaced by three Toro Assicurazioni blocks and later a *palazzina* by
  Bruno Zevi. it.wiki `Villa Almagià (Roma)`.
- **Teatro Tenda**, piazza Antonio Mancini — a 40 × 30 m tensile structure, **active 1976 to 1986**,
  begun as *Teatro Tenda sotto casa* by the impresario Carlo Molfese in the decentralisation debate
  of the 1970s. it.wiki `Teatro Tenda`. Gone.
- **Osteria Fratelli Menghi**, *via Flaminia 57* — the painters' osteria, a meeting place for
  painters, actors, musicians and writers mainly between 1940 and 1970; **closed 1997**; the
  *Caffè dei Pittori* occupies the site. it.wiki `Osteria Fratelli Menghi`. Number 57 is odd and so
  is on the Flaminio side, but **the business is closed** and the successor café is unresearched.

**One OSM error to ignore:** OSM carries a node named *"Muzeo nazionale delle paste alimentari"* at
41.9184727, 12.4728583, inside the Flaminio ring, and it.wikipedia's `geosearch` returns the article
with a coordinate in Flaminio too. **The museum was at Palazzo Scanderbeg, piazza Scanderbeg
(rione Trevi), and has been closed to the public since 2007.** it.wiki
`Museo nazionale delle paste alimentari`. Both coordinates are wrong. Do not write it.

**One article to leave alone:** `Delitto Matteotti` PIPs Flaminio. It is a historical event, not a
place. The Monumento a Matteotti (record 7) is the place.

---

## 6. Kind assignments I would defend

`museum` — MAXXI, Museo Hendrik Christian Andersen.
`theater` — Teatro Olimpico; Cinema Tiziano only if trading is confirmed.
`historic-site` — Basilica di Santa Croce a Via Flaminia, Palazzo Marina, Scalo de Pinedo, and any
bridge awarded (there is no `bridge` kind).
`attraction` — Monumento a Giacomo Matteotti, Piazza Alighiero Boetti, Piazza Perin del Vaga, the
three lungoteveri, the Arcosolio and the Fontana di papa Giulio III if they are ever awarded.
`park` — Giardino Italiani nel Mondo, Giardini Viale Pinturicchio.
`stadium` — PalaLuiss, if it is worth a record at all. **Note that the two obvious `stadium`
candidates, Stadio Flaminio and the Palazzetto dello Sport, are Parioli's.**

No `church`, no `monument`, no `square`, no `bridge` — those are not in the schema.

---

## 7. Status fields

Everything in §4.1 defaults to `status: open` except where noted. Two need care:

- **Palazzo Marina** — a working ministry. `open` with prose saying no source states public opening
  hours. Not `closed`: that would be an affirmative claim I cannot make.
- **Scalo de Pinedo** — its own infobox says `stato = in disuso`, disused. That is a sourced
  statement about the *port function*, not about whether the quayside is reachable. I would keep
  `open` and let the prose say it is disused, which is what the source actually supports.

Villa Almagià, Teatro Tenda, the Osteria Fratelli Menghi and the Museo delle paste alimentari should
not be records at all rather than `closed` records.

---

## 8. Photo leads for the later wave — READ THIS FIRST, FLAMINIO IS MOSTLY REJECT

Flaminio is a 20th- and 21st-century quartiere. Italy has **no freedom of panorama**, so the
architect's copyright bites even on exteriors from the street.

**HARD REJECTS:**
- **MAXXI** and **Piazza Alighiero Boetti** — Zaha Hadid d. 2016, protected to **2087**.
- **Ponte della Musica-Armando Trovajoli** — Powell-Williams / Buro Happold, 2011.
- **Monumento a Giacomo Matteotti** — Iorio Vivarelli d. 2008.
- **Teatro Olimpico interiors** — Cagli, Manzù, Mirko stage pieces, all 20th century.
- **Scuola superiore di polizia** — the Mario Ceroli works in its chapel, sacrarium and refectory;
  Ceroli is living.
- **Case ICP Flaminio II** — Tito Bruner d. 1976, so to 2046.
- Off-zone but adjacent and easy to stray into: **Auditorium Parco della Musica** (Renzo Piano,
  living), **Palazzo della Civiltà Italiana** (EUR), the **Foro Italico** ensemble (Del Debbio
  d. 1985; Moretti d. 1973), **Stadio Flaminio** and **Palazzetto dello Sport** (Pier Luigi Nervi
  d. 1979, Annibale Vitellozzi d. 1993, Antonio Nervi d. 1979).

**PLAUSIBLE:**
- **Ponte Milvio** — Roman fabric plus Valadier's 1805 tower. Out of copyright.
- **Basilica di Santa Croce a Via Flaminia** — Aristide Leonori d. 1928; 1913 building.
- **Palazzo Marina** — Giulio Magni d. **1930**; Italian architectural copyright runs 70 years from
  the author's death, so 1930 + 70 = **2000**. Should be clear. Verify before relying on it.
- **Chiesa di Sant'Andrea del Vignola**, **Fontana di papa Giulio III**, **Arcosolio di Benedetto
  XIV**, **Oratorio di Sant'Andrea a Ponte Milvio** — all pre-modern, all photographically clean.
  **But their zone is unresolved (§4.2a), so do not source images for them until ownership is ruled.**
- **Ponte del Risorgimento** — Porcheddu d. 1937, Hennebique d. 1921. 1937 + 70 = 2007. Likely clear.
- **Ponte Duca d'Aosta** — Vincenzo Fasolo d. **1969**, so protected to **2039**. Reject.
- **Scalo de Pinedo** — late-19th-century, designer of the original Specchi d. 1729. Clear.

I named, linked and sourced **no image**, per the ruling.

---

## 9. QUARANTINE — text from sources that must not reach the page

Recorded so the verifier can see I met them and rejected them, not so they can be used.

**Superlatives and priority claims (BANNED, attribution does not save them):**
- Sovrintendenza Capitolina on Ponte Milvio: *«uno dei più antichi di Roma»* — "one of the oldest in
  Rome". Official source, still banned. **Write the dates instead: first mentioned in relation to
  207 BC, rebuilt in masonry 110–109 BC.**
- it.wiki on Ponte del Risorgimento: *«la sua luce è di oltre 100 metri, all'epoca della
  realizzazione **la più ampia del mondo** completata con tale tecnologia»*. **Banned.** The
  parapet inscription giving 100 m of chord and 10 m of rise is a measurement and publishes; the
  world ranking does not.
- it.wiki on Teatro Olimpico: *«**uno dei più importanti** teatri storici di Roma»*, and *«risulta
  il **secondo teatro di Roma** e il settimo d'Italia per afflusso di spettatori»* (AGIS, 2009/10).
  **Both banned.** The seat counts — 1,410 / 966 / 444 — are counts and publish.
- it.wiki on Stadio Flaminio: *«secondo stadio della Capitale per capacità, ma **il più capiente**
  tra quelli privi di pista d'atletica»*. Banned, and it is Parioli's anyway.
- it.wiki on Villa Glori: *«neanche tra i più belli»* of the Roman *casali*. Banned, and Parioli's.

**Proximity and impression (BANNED):**
- it.wiki on the Osteria Fratelli Menghi: *«a 300 metri da Piazza del Popolo»*. A measurement to
  another place is still orientation by proximity in the corpus's terms; and Piazza del Popolo is
  another zone's. Drop.
- it.wiki on Sant'Andrea del Vignola: *«Nelle vicinanze, verso il ponte c'è anche una cappella…»*.
- it.wiki on the Oratorio: *«poco prima che la strada arrivi a ponte Milvio»*.
- it.wiki on Teatro Olimpico: *«La zona è centrale e ben collegata … è inoltre circondata da ampie
  strade in gran parte alberate»*.
- it.wiki on Ponte Milvio: *«oggi è largamente circondato da abitazioni civili»*.

**Boosterism flagged on Wikipedia itself:** the MAXXI article carries a `{{P|Toni celebrativi da
ufficio stampa}}` maintenance banner — Wikipedia's own editors marked it as press-release tone. Take
dates, names and the address from it; take no adjectives.

**Promotional / unverifiable:**
- The quartiere article's *«il valore degli immobili è aumentato a tal punto da parificare la zona
  al centro storico»* — unsourced property-value claim. Drop.
- The Scuola superiore di polizia article's *«sul nuovo Miglio delle Arti»* and *«eccezionale
  collezione»* — promotional, and "Miglio delle Arti" is a branding phrase, not a toponym.
- Palazzo Marina's film-location claim is sourced only to **IMDb**, which is user-contributed.

**Designation-adjacent:** nothing I fetched asserted a *vincolo* on any Flaminio building, so
nothing had to be stripped under the evidence_ruling. The nearest miss is the Sovrintendenza
Capitolina's *«Accessibile al pubblico»* line on Ponte Milvio, which is an **access** statement, not
a protection statement, and is safe to use as such.

---

## 10. What the next agent should do first

1. **Retry SISTO.** `https://geoportale.comune.roma.it/sisto/api/viario?denominazione.contains=FLAMINIA`
   and `…contains=PERIN%20DEL%20VAGA`. If it answers, the `elementoDeliberas[].note` field settles
   §4.2(a) — the four via Flaminia objects — and probably piazzale Flaminio too, in one session.
   It was HTTP 500 on every path including the site root for the whole of mine.
2. **Retry the `.cultura.gov.it` museum hosts** for the Museo Hendrik Christian Andersen's current
   hours and ticket prices. DNS failed for me on three different subdomains. Until then the hours in
   record 3 are **[unverified]** and must not ship.
3. **Get a live source for Cinema Tiziano** or drop it.
4. **Finish the commercial sweep.** My Overpass query for
   `tourism=hotel|guest_house|hostel` + `amenity=restaurant|cafe|bar` + selected `shop` values over
   the Flaminio bbox never completed — the API went from 200 to 429 to connection-refused inside
   twenty minutes. Flaminio is a residential quartiere with a real neighbourhood high street on the
   odd side of via Flaminia and around piazza Melozzo da Forlì, and none of it is in this file.
   Remember the rule: **a founding year from an operator's own site is a trading-duration claim and
   does not publish.**
5. **Do not re-litigate §5.** Stadio Flaminio and the Palazzetto dello Sport are Parioli's on their
   own articles' explicit words, and the Foro Italico is Della Vittoria's, which is not in the
   roster at all. Those three are the brief's errors, and they are settled.
