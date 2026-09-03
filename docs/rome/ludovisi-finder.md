# Ludovisi (R. XVI, Roma Capitale toponymic code 116) — FINDER file

Wave 3, Rome programme. **Evidence, not adjudication.** A verifier adjudicates; an arbitrator rules
ownership of straddlers. I do not resolve straddlers here.

Research date: 2026-09-02. Author: finder agent (Ludovisi).

---

## 0. Compliance statement (read before using anything below)

The three binding rulings in `priv/seed_data/rome_roster.json` (`scope_ruling`, `vatican_ruling`,
`evidence_ruling`) were read in full before work began.

1. **NO DESIGNATION CLAIMS.** Nothing in this file asserts that any Ludovisi building is
   *vincolato*, listed, scheduled, declared a monument, or under state protection. I re-tested the
   registers from this network and they remain unreachable (§8.1). Where a fetched page happened to
   touch on protection status I omitted it rather than transcribe it.
2. **VATICAN CITY BELONGS TO NO RIONE.** Ludovisi does not border Vatican City and no Vatican
   property appears here. Ludovisi *does* contain three sets of premises that invite the same class
   of error, and I have written them up explicitly so the corpus does not repeat it:
   **Palazzo Margherita is the United States Embassy — diplomatic premises are NOT foreign
   territory** (§5.1); the **U.S. Mission to the UN Agencies** on via Boncompagni is a second such
   case (§5.2); and the **Embassy of Georgia to the Holy See** and **Embassy of the Dominican
   Republic** etc. on via Toscana / via Ludovisi are ordinary Italian buildings housing missions
   (§5.3). None of these is extraterritorial under Lateran Treaty Art. 15 — that list is a separate
   thing entirely and **contains nothing in Ludovisi**. Do not write "American soil".
3. **NO PHOTOGRAPHS.** Every record carries `"photos": []`. I sourced, named and linked no image
   file. Two photo leads for the later wave are parked as prose only in §9.

Corpus rules observed: no trip durations, no vague proximity, aggregators attributed, every
factual claim carries the URL I actually fetched.

**Reserved-place check.** Nothing on the wave 1/2 reservation list appears as a Ludovisi candidate.
Three reserved neighbours press on Ludovisi's edges and are handled in §6: the **Quirinal Palace**
(wave 2, Trevi) is well clear of the boundary and never came up; **Piazza Barberini / Palazzo
Barberini / the Fontana del Tritone** are Trevi's and are excluded — but the **Fontana delle Api**
is a genuinely separate monument that sits on the Ludovisi/Colonna/Trevi triple point and is flagged
as a straddler, not taken (§4.1). Borgo and Prati are on the far side of the city from here.

---

## 1. Method, and what "I know which rione" means here

**Tooling.** The WebSearch budget was exhausted, so every retrieval ran against URLs named in
advance, fetched with `python3` + `urllib` (never piped `curl`, never `grep`/`find` as a source of
truth). Responses cached at
`<scratchpad>/ludovisi/cache`; scripts at `<scratchpad>/ludovisi/`.

**Network facts worth recording for the next agent.**

| Host | Result |
|---|---|
| `overpass-api.de` | **ECONNREFUSED** on every attempt, both sandboxed and not. Dead from this network. |
| `overpass.kumi.systems` | Works. Used for all Overpass queries. Returned one 504 under load; retry succeeded. |
| `overpass.private.coffee`, `maps.mail.ru/osm/tools/overpass` | Reachable, held as fallbacks. |
| `nominatim.openstreetmap.org` | **Works**, unlike the Borgo run where it 429'd immediately. Rate-limits after ~15 rapid calls; 1.2 s spacing holds. |
| `api.openstreetmap.org` | Works. This is what I used for boundary geometry — more reliable than the Overpass mirrors. |
| `turismoroma.it` | Works. Roma Capitale's official tourism site. Best non-Wikipedia source available. |
| `060608.it` | Reachable but is a JS shell — returns no content to urllib. Unusable. |
| `beniculturali.it`, `vincoliinrete.beniculturali.it`, `catalogo.beniculturali.it` | **Connection timed out**, all three. See §8.1. |
| `it.usembassy.gov`, `usunrome.usmission.gov` | HTTP 403 to urllib. Could not fetch. |

**Boundary method — this is the load-bearing part.** I used **two independent methods and report
both for every candidate**, because they disagree in exactly the places that matter.

*Method A — local point-in-polygon against OSM relation geometry.* Full member geometry pulled
from `https://api.openstreetmap.org/api/0.6/relation/<id>/full.json`, rings assembled and verified
**closed** in Python, ray-cast PIP computed locally:

| Unit | OSM relation | ring nodes | closed |
|---|---|---|---|
| Ludovisi (R. XVI) | `5454323` | 234 | yes |
| Sallustiano (R. XVII) | `5454324` | 136 | yes |
| Campo Marzio (R. IV) | `5452743` | 215 | yes |
| Trevi (R. II) | `5452710` | 242 | yes |
| Castro Pretorio (R. XVIII) | `5454327` | 398 | yes |
| Esquilino (R. XV) | `5454309` | 589 | yes |
| Pinciano (Q. III) | `5459658` | 580 | yes |

Ludovisi's polygon spans lat 41.90417–41.91087, lon 12.48587–12.49822, and computes to
**≈0.326 km²** — consistent with the ~0.32 km² usually quoted, and a useful sanity check that the
ring assembled correctly. **Trap recorded:** the rioni are *not* `admin_level=10` in OSM
(that level is the Municipi) and are *not* named "Rione …". They are `place=quarter` relations
carrying the bare name. A query for `admin_level=10` in central Rome returns the ten Municipi and
nothing else; a name regex on `^Rione` returns **zero**. Both of those are silent wrong answers.

*Method B — Nominatim reverse geocoding.* `/reverse?format=jsonv2&zoom=18&addressdetails=1`.
The rione lands in the **`quarter`** field, as the scoping wave found. Ludovisi points return
`"quarter": "Ludovisi", "suburb": "Municipio Roma I"`.

So when a record below says **"PIP=Ludovisi / NOM=Ludovisi"** it means: that exact coordinate,
tested against the OSM Ludovisi ring locally, falls inside it, *and* Nominatim independently names
Ludovisi for it. Where the two disagree, or where the two available coordinates for one place
disagree, I say so and **flag it for the arbitrator rather than resolving it**.

*Method C — the rione's own documented boundary.* it.wikipedia's `Ludovisi (rione di Roma)`
states the perimeter street-by-street. **Attributed to it.wikipedia, not asserted as Roma Capitale's
line**, but it is what makes the straddlers legible:

> "Mura aureliane fino a Porta Pinciana con il quartiere Pinciano; via di Porta Pinciana-via
> Francesco Crispi con Campo Marzio; via degli Artisti-via di S.Isidoro-via Veneto col rione
> Colonna; via di San Basilio con Trevi; via Friuli-via Lucullo-via Boncompagni-via Calabria fino a
> piazza Fiume (esclusa) con Sallustiano."
> — `https://it.wikipedia.org/wiki/Ludovisi_(rione_di_Roma)` (fetched as raw wikitext via
> `action=parse`)

Read that carefully: **four of Ludovisi's five borders run down the middle of a street, not behind
a building line.** Via degli Artisti, via di Sant'Isidoro, via Veneto (its lower stretch), via di
San Basilio and via Boncompagni are all *boundaries*. That is why this rione produces an unusually
high straddler rate for its size, and it is the single most important thing in this file.

**Boundary discovery worth handing to the arbitrator.** I reverse-geocoded consecutive house
numbers along the Sallustiano border and both methods agree on a clean parity rule:

| Address | NOM | PIP |
|---|---|---|
| Via Boncompagni **2** (U.S. Mission to the UN Agencies) | Ludovisi | Ludovisi |
| Via Boncompagni **4, 6, 10, 14, 16, 18, 25** | Sallustiano | Sallustiano |
| Via Boncompagni **19, 37, 47, 71** | Ludovisi | Ludovisi |

**Odd side of via Boncompagni = Ludovisi; even side = Sallustiano**, with no. 2 the single
exception (it is the corner block at via Veneto, west of where the boundary begins). This is the
rule that decides the Museo Boncompagni Ludovisi question in §6.1 — a museum with "Ludovisi" in its
name that is **not in Ludovisi**.

---

## 2. Honest yield assessment — read this before the list

**This is a guide, not a town-page — but a thin one, and its centre of gravity is one street.**

The finder brief guessed "roughly 20 named entries — this may honestly be a town-page." I found
**42 candidates**, which is above that estimate, so the brief's pessimism was wrong on count. It
was right on character. The honest picture:

- **A hard core of about 12** that a travel guide would write real paragraphs about: via Veneto,
  Santa Maria della Concezione dei Cappuccini and its crypt-and-museum, Palazzo Margherita, the
  Casino dell'Aurora, Villa Maraini / Istituto Svizzero, Porta Pinciana and the Aurelian Walls
  stretch, Palazzo Piacentini, Sant'Isidoro, San Patrizio, the Christuskirche, the Fontana delle
  Api, and the vanished Villa Ludovisi as the historical spine that explains all the rest.
- **A middle band of about 10** — the *villini* (Florio, Folchi, Ferrari, Amero d'Aste Stella), the
  grand hotels (Excelsior, Flora, Eden, Majestic, Ambasciatori), the colossal bust by the walls,
  the Scuola d'Arte Educatrice in Torre XXXIX — that are real, sourced, and honestly minor. Several
  are façade-only: you cannot go in.
- **A tail of about 20** — minor parish and conventual churches on via Sicilia and via Sardegna,
  two deconsecrated churches now used as a conference hall and a Red Cross meeting room, two
  *licei*, a scattering of embassies — that I record for completeness and expect the verifier to
  cut most of.

Two structural facts the verifier should weigh:

1. **Ludovisi is barely 140 years old.** It was laid out on the lottizzazione of Villa Ludovisi
   under an 1886 convention between the Boncompagni heirs, the Comune and the Società Generale
   Immobiliare (it.wikipedia, cited above). Everything except the Aurelian Walls, Porta Pinciana,
   Sant'Isidoro, the Concezione and the Casino dell'Aurora post-dates 1886. The rione is a
   speculative property development, and its own Wikipedia article calls the destruction of the
   villa an object lesson in Savoyard building speculation. That is a *good* story, but it means
   the "ancient Rome" register is unavailable here and the page must not fake it.
2. **A large share of the built fabric is offices, ministries, embassies and hotels that cannot be
   entered.** Palazzo Margherita: Roma Capitale's own page says "Chiuso al pubblico è visibile solo
   dall'esterno." The Casino dell'Aurora is private and its access status is genuinely unresolved
   (§3.5). The villini are offices and law firms. If the page does not say so, readers will turn up
   at locked doors.

**Confirmation rate warning, per the brief.** I expect a *low* confirmation rate on the tail and
that is intentional. If the verifier confirms more than about 25 of these 42, I was not being hard
enough on the minor churches.

---

## 3. Candidates — the core

Format: name · what it is · address · what/when/who · rione evidence (both methods) · sources
actually fetched. `photos: []` throughout.

### 3.1 Via Vittorio Veneto ("via Veneto") — street — **STRADDLER (Ludovisi ↔ Colonna)**

- **What/when.** The rione's spine, running uphill from Piazza Barberini to Porta Pinciana. Roma
  Capitale: laid out after unification as part of the creation of the new Rione Ludovisi and the
  destruction of Villa Ludovisi; "Nel 1894 nasce così via Veneto, inizialmente dedicata alla
  regione omonima, un'ampia 'passeggiata Umbertina'". Renamed for the battle of Vittorio Veneto in
  1919. it.wikipedia gives the renaming instrument precisely — "delibera della Giunta Municipale
  n. 37 del 25 ottobre 1919" — and gives the street's length as "750m circa".
- **Discrepancy to hand the verifier.** Roma Capitale dates the street's birth to **1894**;
  it.wikipedia's rione article says via Veneto "veniva completata" in **1906**. Both may be true
  (started/finished) but the page must not pick one silently.
- **Dolce Vita.** Roma Capitale's page ties the street's international fame to the Dolce Vita and
  states plainly that Fellini **reconstructed the street at Cinecittà** for *La dolce vita* rather
  than filming it here. That correction is worth carrying — it is the single most common false note
  written about this street.
- **Rione.** **Explicit straddler, stated by the source itself.** it.wikipedia's infobox lists the
  street under **both** `R. III Colonna` and `R. XVI Ludovisi`, and the prose says "Nel suo tratto
  iniziale, separa questo rione da quello di Colonna." My two methods split on the lower stretch:
  at 41.90428, 12.48862 **PIP=Ludovisi but NOM=Colonna**. Mid-street at 41.90681, 12.49024 both
  say Ludovisi. **Do not resolve — arbitrator.** My reading is that the carriageway *is* the
  boundary and the two methods are simply picking different sides of it.
- Sources: `https://www.turismoroma.it/it/luoghi/vittorio-veneto` (Roma Capitale);
  `https://it.wikipedia.org/wiki/Via_Vittorio_Veneto` (aggregator, via `action=parse`).
- photos: []

### 3.2 Chiesa di Santa Maria della Concezione dei Cappuccini (Santa Maria Immacolata a via Veneto) — church — Via Vittorio Veneto 27

- **What/when.** Roma Capitale: built near Palazzo Barberini at the instance of the Capuchin
  cardinal **Antonio Barberini**, brother of Urban VIII, who **blessed the first stone on 4 October
  1626**; design by the pontifical architect **Michele da Bergamo** with **Antonio Casoni**.
  it.wikipedia gives construction **1626–1631**. Barberini's tomb is in front of the high altar,
  inscribed *Hic jacet pulvis et cinis et nihil*.
- **Art, per Roma Capitale.** Single nave, five chapels a side, reached by a scissor stair; brick
  façade with white stone pilasters. Named works: Guido Reni's *San Michele Arcangelo*; Pietro da
  Cortona's *Anania che ridà la vista a San Paolo*; Andrea Sacchi's *Sant'Antonio da Padova
  resuscita un morto*; Gherardo delle Notti's *Cristo deriso*; Lanfranco's *Adorazione dei
  Pastori*; Domenichino's *San Francesco d'Assisi sorretto dall'Angelo*; Liborio Coccetti's
  *Assunzione* on the barrel vault (it.wikipedia dates the vault fresco **1796**).
- **Attribution flag.** it.wikipedia says the sacristy-now-museum holds a *San Francesco in
  meditazione* "recentemente attribuito a Caravaggio". **Recently attributed ≠ by.** If this is
  written at all it must be written as a contested attribution.
- **Rione.** Roma Capitale's own coordinate `POINT (12.488253 41.90472)`: **PIP=Ludovisi,
  NOM=Ludovisi.** Clean. Note the church sits on the *west* side of via Veneto at the point where
  the street is still the Colonna boundary, so the clean result is not a foregone conclusion — it
  is evidence.
- Sources: `https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-della-concezione`;
  `https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Immacolata_a_via_Veneto`.
- photos: []

### 3.3 Museo e Cripta dei Cappuccini — museum and ossuary crypt — Via Vittorio Veneto 27

Treated as a separate visitor institution from the church above; same complex, own ticket, own site.

- **What.** The institution's own site: "Museo e Cripta dei Cappuccini", Via Vittorio Veneto 27,
  00187 Roma, tel. 06.88803695, **open every day 09:30–13:30 and 14:30–18:30, last admissions 12:30
  and 17:30**, tickets sold online, described as an AMEI associate museum. It also advertises
  evening visits ("Visite serali") and a documented accessibility page.
- **The crypt.** Roma Capitale: the crypt is the former Capuchin cemetery, "realizzata verso la
  prima metà del XVIII secolo", five chapels decorated with the skulls and bones of **4000 friars**,
  each chapel named for the bones used in its decoration, each said by tradition to contain holy
  earth brought from Palestine or Jerusalem. it.wikipedia adds that the bones were **collected
  between 1528 and 1870** from the order's old cemetery at Santa Croce e San Bonaventura dei
  Lucchesi, and quotes the plaque at the entrance: *"Quello che voi siete noi eravamo; quello che
  noi siamo voi sarete."*
- **Discrepancy to hand the verifier.** Roma Capitale says the crypt was *made* in the first half
  of the 18th century; it.wikipedia says the bones were *gathered* 1528–1870. These are compatible
  but a careless page will collapse them into one wrong date. Also "circa 4000" (it.wiki) vs "4000"
  (Roma Capitale) — write "about 4,000".
- **Rione.** OSM node `6563065029` at 41.90479, 12.48859: **PIP=Ludovisi, NOM=Ludovisi**, and
  Nominatim resolves the display name to "Museo dei Frati Cappuccini e Cripta Ossario, 27, Via
  Vittorio Veneto". Clean.
- Sources: `https://www.museoecriptacappuccini.it/` (the institution's own site — establishes
  identity, address and hours, per the corpus rule, and nothing more);
  `https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-della-concezione`;
  `https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Immacolata_a_via_Veneto`.
- **Note for the verifier:** hours change. Re-fetch before ship.
- photos: []

### 3.4 Palazzo Margherita — palace, now the Embassy of the United States — Via Vittorio Veneto 119/A

- **What/when.** Roma Capitale: built **1890** to **Gaetano Koch**'s design for **Rodolfo
  Boncompagni Ludovisi, Prince of Piombino**, modelled on Palazzo Farnese; ceded to the Savoys in
  **1900** and inhabited by the Queen Mother **Margherita** — whence the name — until her death in
  **1926**. it.wikipedia dates construction **1886–1890** and adds that the prince built it to
  replace Palazzo Piombino on via del Corso, from which he had been expropriated, and that the
  building **incorporates at the rear the Palazzo Grande (1622), the original nucleus of Villa
  Ludovisi**.
- **The garden trees.** Roma Capitale: "Gli alberi del giardino di Palazzo Margherita sono l'ultima
  testimonianza che rimane del parco dell'antica Villa Ludovisi." it.wikipedia says the same but
  adds the Casino dell'Aurora's garden as a second survival. Minor conflict; prefer the fuller
  version and attribute.
- **Discrepancy — flagged, do not resolve.** **Roma Capitale says the Embassy has been here "dalla
  fine della Seconda Guerra Mondiale". it.wikipedia says the palace became the Embassy in 1931 and
  was *bought* by the U.S. Government in 1946.** These are different claims about different events
  and the corpus must not blend them. Neither source is the Embassy itself — `it.usembassy.gov`
  returned HTTP 403 to urllib and I could not fetch the Embassy's own account.
- **Access.** Roma Capitale states outright: **"Chiuso al pubblico è visibile solo dall'esterno."**
  Any page that implies otherwise is wrong.
- **RULING 2 HAZARD — write this correctly.** This building is the diplomatic mission of the United
  States on Italian soil. It is **not** United States territory, it is **not** extraterritorial
  under Lateran Treaty Art. 15 (which concerns Holy See properties and has nothing to do with it),
  and visitors are under Italian law. The premises are inviolable under the Vienna Convention,
  which is a *duty on Italy*, not a transfer of sovereignty. Do not write "American soil".
- **Interior holding, if the page mentions it.** Roma Capitale names the **Giambologna *Venus*
  ("Venere Cesarini"), carved 1583** — describing it as the sculptor's only work in Rome. Attribute
  that superlative to Roma Capitale; do not restate it in the corpus's own voice.
- **Rione.** Roma Capitale coordinate `POINT (12.490272 41.906795)`: PIP=Ludovisi, NOM=Ludovisi.
  OSM relation `7987468` centroid 41.90658, 12.49109: PIP=Ludovisi, NOM=Ludovisi. Clean on both
  coordinates by both methods.
- Sources: `https://www.turismoroma.it/it/luoghi/palazzo-margherita`;
  `https://it.wikipedia.org/wiki/Palazzo_Margherita_(Roma)`.
- photos: []

### 3.5 Casino dell'Aurora (Casino Ludovisi / Villa Aurora) — casino of the vanished Villa Ludovisi — via Lombardia / via Aurora

- **What/when.** it.wikipedia: the **only building of the old Villa Ludovisi to survive intact**.
  Built for **Cardinal Francesco Maria Del Monte in the 16th century**, remodelled for **Ludovico
  Ludovisi between 1621 and 1632**. Named for **Guercino's *Aurora*** (dated 1621 by it.wikipedia's
  disambiguation page) on the vault of the ground-floor salone. Also holds **Caravaggio's *Giove,
  Nettuno e Plutone*, painted c. 1597–1600 for Del Monte** and described by it.wikipedia as
  Caravaggio's only wall painting; and a Guercino/Tassi triptych *Fama, Onore e Virtù* on the
  piano nobile. it.wikipedia notes the *Aurora* subject was probably chosen to compete with the
  Borghese, who had commissioned Guido Reni's *Aurora* seven years earlier for their Quirinal
  residence (now Palazzo Pallavicini Rospigliosi — **a different Casino dell'Aurora, in a different
  rione; the two are routinely confused and it.wikipedia carries a disambiguation page saying so**).
- **DISAMBIGUATION HAZARD.** `https://it.wikipedia.org/wiki/Casino_dell%27Aurora` is a
  **disambiguation page**, not an article. Any agent that fetches that title and writes from it will
  produce a mash of two buildings. The Ludovisi one is covered inside the `Villa Ludovisi` article.
- **Access — genuinely unresolved, and the most important honesty flag in this file.**
  it.wikipedia records: auction announced October 2021 after an inheritance dispute; **every
  auction from January 2022 to January 2023 failed to attract a bidder**; **Princess Rita
  Boncompagni Ludovisi was evicted by court order on 20 April 2023**; in July 2023 the heirs agreed
  to a private sale. Meanwhile the family's own scholarly site, `villaludovisi.org`, still describes
  the Princess as one "who lives in the Casino Aurora in perpetuity" and is "currently engaged in a
  major renovation effort" — **that page is stale relative to the eviction**. I could not establish
  from anything I fetched whether the building can be visited today, by whom, or on what terms.
  **The corpus must not state opening arrangements for this building.** Write it as a private
  building whose recent history is documented and whose access is not.
- **Rione.** OSM way `112973881` ("Casino Ludovisi") at 41.90725, 12.48731: **PIP=Ludovisi,
  NOM=Ludovisi**, Nominatim display name "Casino Ludovisi, Via Aurora, Ludovisi". Clean.
- Sources: `https://it.wikipedia.org/wiki/Villa_Ludovisi`;
  `https://it.wikipedia.org/wiki/Casino_dell%27Aurora` (disambiguation);
  `https://villaludovisi.org/about/` (the Boncompagni Ludovisi family's digital archive — a primary
  holder of the documents, but **not neutral and, on access, out of date**).
- **Photo lead (not acted on, per ruling 3):** noted in §9.
- photos: []

### 3.6 Villa Ludovisi — the vanished 17th-century estate the rione is named for — historical, no visitable site

Not a place a visitor can go. Carried because it is the explanatory spine of every other entry, and
because a guide that omits it cannot explain why the street plan looks like this.

- **What/when.** it.wikipedia: created by **Cardinal Ludovico Ludovisi**, nephew of **Gregory XV**,
  who **bought the Villa Orsini in 1622** and enlarged it with adjoining properties, over the
  ground of the **Horti Sallustiani**. Buildings designed by **Domenichino**, who is also credited
  with at least part of the gardens on the strength of Bellori (1672), Malvasia (1678), Sebastiani
  (1683) and Milizia (1768); later writers instead attribute the gardens to **André Le Nôtre**, on
  the strength of Milizia's own 1781 *Memorie*. **it.wikipedia presents this as a genuine
  scholarly dispute and so must the corpus** — do not pick Le Nôtre because he is the famous name.
- **Size — three different figures, all sourced, all different.** it.wikipedia's `Villa Ludovisi`
  infobox says **30 ettari**; the `Ludovisi (rione)` article says the 1886 convention put **circa
  25 ettari** of park to subdivision; `villaludovisi.org` says the villa in its final form was
  **89.6 acres** (≈36.3 ha). **Do not average these.** Either give one with its source named, or
  say the figure is reported variously.
- **Destruction.** it.wikipedia: subdivision decided 1883, convention with the Comune and the
  Società Generale Immobiliare signed **1886** under Mayor **Leopoldo Torlonia**; gardens, casini
  and palazzo mostly not spared. Survivals: the Casino dell'Aurora, and the façade and staircase of
  the Palazzo Grande, now absorbed into Palazzo Margherita and — it.wikipedia says explicitly —
  **"non visitabili né visibili dalla strada"**.
- **The sculpture.** it.wikipedia: the cardinal's collection ran to over 450 antique sculptures; a
  hundred or so were **bought by the Italian state in 1910** and are **now in Palazzo Altemps**
  (rione Sant'Eustachio — *not* Ludovisi; the corpus must not place them here). The **Trono
  Ludovisi** was **not** part of the collection but was **found in 1887 during the destruction of
  the villa**. Writers who admired the villa before it went, per it.wikipedia: Goethe, Stendhal,
  Henry James (quoted, 1883), with protests from D'Annunzio and Rodolfo Lanciani and a passage from
  Herman Grimm's *La distruzione di Roma*.
- Sources: `https://it.wikipedia.org/wiki/Villa_Ludovisi`;
  `https://it.wikipedia.org/wiki/Ludovisi_(rione_di_Roma)`; `https://villaludovisi.org/about/`.
- photos: []

### 3.7 Porta Pinciana — gate in the Aurelian Walls — **STRADDLER (Ludovisi ↔ Q. III Pinciano)**

- **What/when.** Roma Capitale: a travertine arch flanked by towers, "una delle poche porte di Roma
  ad aver conservato inalterato nel tempo il proprio aspetto originale", excepting the side
  openings cut in modern times for traffic. Built at the end of the 3rd century as a mere
  **posterula**, a third-order pedestrian passage, in Aurelian's wall; raised to a proper gate with
  two round towers under **Honorius**. it.wikipedia dates the Honorian rebuilding to **403** and
  notes the original travertine arch survives, that the two round towers are oddly asymmetrical,
  and that the gate was **walled up again in 1808 and reopened in 1887**.
- **Names.** Both sources: *Pinciana* from the **gens Pincia**; also *Porta Salaria Vetus*, because
  the oldest Salt Road left by it; *Porta Turata*, because repeatedly walled up. The medieval
  popular name **Porta Belisaria** attaches to Belisarius's defence of this wall stretch against
  Vitiges in **537–538**, and to the legend that the blinded general begged at the gate under a
  graffito *"date obolum Belisario"*. **it.wikipedia states flatly that the story is false** —
  Belisarius died rich, and in Constantinople. Roma Capitale tells the legend without that
  correction. **The corpus must carry the correction.**
- **Christo.** Roma Capitale: in **January 1974** Christo and Jeanne-Claude wrapped both faces of
  the wall here in nylon and orange rope, over four days, and the work stood for **forty days**.
- **Rione — a real conflict between two official numbers.** Roma Capitale gives the address as
  **"Porta Pinciana, Via Vittorio Veneto, 196"**, a Ludovisi street, but publishes the coordinate
  `POINT (12.488240996983 41.909800723485)`, which **both my methods put in Pinciano** (PIP=Pinciano,
  NOM=Pinciano, "Piazzale Brasile, Pinciano, Municipio Roma II"). The OSM node `3450997579` at
  41.90947, 12.48838 splits the two methods: **PIP=Ludovisi but NOM=Pinciano**. And it.wikipedia's
  boundary text makes the walls *up to Porta Pinciana* the Ludovisi/Pinciano border, i.e. the gate
  is the terminus of the boundary itself. **Do not resolve — arbitrator.** Note this is not a
  rione-vs-rione question: **Pinciano is a *quartiere* in Municipio II**, so a wrong call here puts
  the gate in the wrong administrative tier as well as the wrong unit.
- Sources: `https://www.turismoroma.it/it/luoghi/porta-pinciana`;
  `https://it.wikipedia.org/wiki/Porta_Pinciana`.
- photos: []

### 3.8 Aurelian Walls — Ludovisi stretch, Porta Pinciana to piazza Fiume — **LINEAR STRADDLER**

- **What.** The northern edge of the rione is the wall itself. OSM carries the segments as
  `Mura Aureliane` ways `1006455125`, `102677834`, `44639638`, `44639639`; the first three PIP
  inside Ludovisi, and adjacent ways of the same wall PIP into Pinciano and Sallustiano. **The wall
  is a single monument crossing at least four units in this quadrant alone.** It is not a Ludovisi
  possession and the corpus should treat any Ludovisi mention of it as a stretch, named as such.
  **Do not resolve — arbitrator**, and note this is a programme-wide question, not a Ludovisi one.
- **The wall walk.** Roma Capitale: from the late 19th century the walkway along the walls **from
  Porta Pinciana to Porta Salaria** housed artists' studios and dwellings — it names **Ettore
  Ferrari**, sculptor of the Giordano Bruno monument in Campo de' Fiori — and states the walkway was
  **"riaperto al pubblico nel 2021"**. That is a live visitor fact and worth verifying before ship.
- **Two things embedded in this stretch, both inside Ludovisi on both methods:**
  - **The colossal marble bust** in a niche near the gate, which Roma Capitale says was perhaps
    dedicated to **Belisarius or to Alexander the Great**, and which before via Veneto was cut
    "faceva da sfondo a uno degli ampi viali alberati della spettacolare Villa Ludovisi". OSM node
    `5383085694`, labelled "Busto di Alessandro Magno", 41.90952, 12.48978 —
    **PIP=Ludovisi, NOM=Ludovisi**. *The identification is uncertain in the source; write it as
    uncertain.*
  - **The Scuola d'Arte Educatrice in Torre XXXIX**, via Campania. Roma Capitale: the ceramicist
    **Francesco Randone** opened it in the tower **in 1890** as a school "gratuita per le bambine e
    i bambini dai sei anni ai quindici, senza distinzione di ceto, di religione, di cultura",
    **"ancora oggi in attività"**. OSM node `5383183092` ("Prima Scvola di Arte Edvcatrice"),
    41.91076, 12.49454 — **PIP=Ludovisi, NOM=Ludovisi**. I could not reach a school website
    (`scuoladarteeducatrice.it` does not resolve), so "still active" rests on Roma Capitale alone.
    **Verifier: re-check that it is still active before writing it in the present tense.**
- Sources: `https://www.turismoroma.it/it/luoghi/porta-pinciana`;
  `https://www.turismoroma.it/it/luoghi/mura-aureliane`;
  `https://www.sovraintendenzaroma.it/content/mura-urbane` (Sovrintendenza Capitolina — reachable,
  but the page body is a navigation shell; it establishes custodianship and little else).
- photos: []

### 3.9 Villa Maraini / Istituto Svizzero — villa, now a cultural institute — Via Ludovisi 48

- **What/when.** Roma Capitale: built **1903–1905** by the Ticinese architect **Otto Maraini** for
  his brother **Emilio**, the industrialist who introduced beet-sugar production to Italy; eclectic
  with neo-Baroque elements, on an **artificial hill** made from the spoil of the excavation of via
  Ludovisi, with a garden and a grotto nymphaeum. Its **Torre Belvedere is 26 m high**. it.wikipedia
  gives the build date as **1905** flat, and the architect as Otto Maraini — consistent.
- **The gift.** Both sources: the widow **Countess Carolina Maraini-Sommaruga** gave the villa to
  the **Swiss Confederation in 1946**, on the condition that it be "perpetuamente al servizio della
  cultura, nel segno della collaborazione tra la Svizzera e l'Italia"; **since 1948 it has housed
  the Istituto Svizzero**.
- **Date conflict to flag.** Roma Capitale's *Istituto Svizzero* page says the institute has been
  "Attivo dal **1947**"; its *Villa Maraini* page and it.wikipedia both say the institute took up
  residence in **1948**. Founding year and occupancy year, probably — but say which.
- **Access.** Roma Capitale: "L'Istituto organizza regolarmente visite guidate all'interno della
  villa", contact `visite@istitutosvizzero.it`, and for hours "consultare il sito ufficiale". The
  institute's own site is live. **Do not state hours from Roma Capitale; point at the institute.**
- **Rione.** Roma Capitale coordinate `POINT (12.487714 41.906773)`: **PIP=Ludovisi, NOM=Ludovisi**,
  Nominatim display name "Villa Maraini, 48, Via Ludovisi, Ludovisi". Clean.
- **Naming note.** it.wikipedia files this under **Villa Maraini** with **Villino Maraini** as a
  redirect; the rione article calls it "Villino Maraini"; Roma Capitale calls it Villa Maraini. Pick
  one and note the other.
- Sources: `https://www.turismoroma.it/it/luoghi/villa-maraini`;
  `https://www.turismoroma.it/it/luoghi/istituto-svizzero`;
  `https://it.wikipedia.org/wiki/Villa_Maraini`; `https://www.istitutosvizzero.it/` (own site —
  identity and hours only).
- photos: []

### 3.10 Palazzo Piacentini — ministry building — Via Veneto 33 / Via Molise 2

- **What/when.** Roma Capitale: by **Marcello Piacentini and Giuseppe Vaccaro**, **inaugurated
  1932**, built as the **Palazzo delle Corporazioni**, now the Ministero delle Imprese e del Made in
  Italy. it.wikipedia dates construction **1928–1932**, says it was raised on the ground formerly
  occupied by the **convent and vegetable garden of the Capuchins of Santa Maria della Concezione**
  (which ties it directly to §3.2 — it.wikipedia's church article says the old convent was
  demolished to make room for the ministry and rebuilt beside the church in **1925**), and that it
  was first conceived for the Confederazione nazionale delle corporazioni sindacali before being
  assigned to the new Ministero delle corporazioni after talks between **Giuseppe Bottai** and
  Piacentini. Cost given as ~32 million lire plus 1.5 million for artworks.
- **Interior, per Roma Capitale.** **Mario Sironi**'s polychrome window *Carta del Lavoro*;
  **Ferruccio Ferrazzi**'s tapestries in the salone d'onore; **Enrico Prampolini**'s *Madonna
  dell'Aria*; **Fortunato Depero**'s *Sintesi Veneziana*; **Giovanni Prini**'s bronze doors on via
  Veneto; **Carlo Pini**'s atrium sculptures; and the **Parlamentino**, a hemicycle room still in
  use. it.wikipedia adds Antonio Maraini and Ercole Drei.
- **Access — unusually well documented, and worth carrying.** Roma Capitale: **"Visitabile solo su
  prenotazione con visita guidata gratuita"**, through the ministry's Polo culturale, Via Molise 2,
  with the group list to be sent at least **15 days** in advance and a **maximum of 25–30 people**.
  Free, but not walk-in.
- **Address conflict.** Roma Capitale gives **Via Molise 2**; it.wikipedia's infobox gives **via
  Veneto 33**. Corner building; give both or give the one that matches the door you mean.
- **Do not confuse.** it.wikipedia warns explicitly that this is not the Palazzo Piacentini in via
  Arenula (Ministero della Giustizia), which is by **Pio** Piacentini, 1913–1920.
- **Rione.** Roma Capitale coordinate `POINT (12.48854 41.90558)`: PIP=Ludovisi, NOM=Ludovisi. Clean.
- Sources: `https://www.turismoroma.it/it/luoghi/palazzo-piacentini`;
  `https://it.wikipedia.org/wiki/Palazzo_Piacentini_(via_Veneto)`. (The ministry's own page,
  `mimit.gov.it/it/ministero/palazzo-piacentini`, **404s** — the URL Roma Capitale prints is the
  old `mise.gov.it` one. Verifier: find the live ministry URL before ship.)
- photos: []

### 3.11 Chiesa di Sant'Isidoro a Capo le Case, with the Irish Franciscan convent — church and convent — via degli Artisti / piazza Sant'Isidoro — **WATCH: on the Colonna boundary**

- **What/when.** it.wikipedia: founded on the munificence of **Ottaviano Vestri di Barbiano**, per a
  bull of **Urban VIII of 1625**, built for the **1622 canonisation by Gregory XV** of five saints
  including the Spaniard **Isidore the Farmer**; Spanish Discalced Franciscans came to Rome that
  year to found a house and raised the church. **After two years church and convent passed to the
  Irish Franciscans, who own them still.** Infobox: **1622–1672**.
- **Fabric.** Begun by **Antonio Felice Casoni**, continued by **Domenico Castelli**; the façade
  with portico and double flight of steps is by **Carlo Francesco Bizzaccheri, 1704–1705**. Works
  by **Carlo Maratta**, including an *Immacolata Concezione* in the **De Sylva chapel** whose
  picture frame was designed by **Bernini**; the De Sylva chapel itself was remodelled to Bernini's
  design, with funerary monuments by his son **Paolo Valentino Bernini**. High altar: **Andrea
  Sacchi**, *Sant'Isidoro e la Vergine Maria col Bambino*. Two cloisters, the small one by Casoni
  (**1626**), the other named for **Luke Wadding**.
- **Why the street is called via degli Artisti.** it.wikipedia: the convent housed the
  **Nazarenes**, the proto-Romantic mostly-German painters, some resident **between 1810 and Pius
  VII's return in 1814**, and the street name comes from that.
- **Rione — watch this one.** it.wikipedia files the church under Ludovisi and gives coordinates
  41.90602, 12.48706 — **PIP=Ludovisi, NOM=Ludovisi** (Nominatim: "Sant'Isidoro a Capo le Case,
  Piazza San Isidoro, Ludovisi"), and the convent relation `2713700` at 41.90609, 12.48677 is also
  Ludovisi on both. **But it.wikipedia's own boundary text makes via degli Artisti and via di
  Sant'Isidoro the Colonna line**, and Nominatim puts **Via degli Artisti 18 in Colonna**. So the
  church is on the Ludovisi side of a street that *is* the border. Both methods agree on Ludovisi
  and I would expect it to survive, but **flag it — the arbitrator should see that it sits on the
  line**, not be told it is comfortably interior.
- **SOURCE TRAP — recorded loudly.** `https://www.santisidoro.org/` is **not this church.** It is
  the website of an "Associazione culturale d'ispirazione cristiana" in **Marano di Napoli**, whose
  content is talks at the Parrocchia San Castrese. I fetched it and read it. Any agent that cites
  santisidoro.org for this church is citing a different organisation in a different region.
  `www.stisidoresrome.com` returns an aaPanel "the website has been stopped" placeholder.
  `sanisidoro.net` returns HTTP 403. **I could not reach an official site for this church.**
- Sources: `https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Isidoro_a_Capo_le_Case`.
- photos: []

### 3.12 Chiesa di San Patrizio a Villa Ludovisi — church — via Boncompagni / via Abruzzi

- **What/when.** it.wikipedia: built **1908** to the design of **Aristide Leonori**, neo-Renaissance
  with Romanesque-Byzantine motifs on the façade; three naves, coffered ceiling; apse mosaic *San
  Patrizio che predica alle folle* by **Rodolfo Villani, 1929**; apse inscription *"Ut cristiani ita
  et romani sitis"*; the 16th-century *Madonna delle grazie* over the high altar came from the
  now-vanished Chiesa di Santa Maria in Posterula.
- **The 2017 handover — a live, checkable fact.** it.wikipedia: until 2017 the church belonged to
  the **Irish Augustinian** college; from **1 August 2017** it passed to the **Paulist Fathers**,
  who moved here from **Santa Susanna** (their seat since 1922), and from that date it became the
  **national parish of Americans resident in Rome**, in place of Santa Susanna. All Masses in
  English. The parish's own site is live and confirms the identity: "St. Patrick's Catholic American
  Parish in Rome", with menu entries for Mass Times, Paulist Fathers, and "History & Centennial".
- **SOURCE TRAP — recorded.** `https://www.stpatricksrome.com/` is a **parked domain for sale** on
  a GoDaddy/Afternic listing page ("Premium domain · For sale, $195"). It is **not** the parish. The
  real site is `https://stpatricksamericanrome.org/`. I fetched both.
- **Rione.** OSM way `203996025` at 41.90859, 12.49293: **PIP=Ludovisi, NOM=Ludovisi**. Clean — and
  worth noting, because the church's postal street, via Boncompagni, is the Sallustiano boundary;
  the church stands on the odd/Ludovisi side.
- Sources: `https://it.wikipedia.org/wiki/Chiesa_di_San_Patrizio_a_Villa_Ludovisi`;
  `https://stpatricksamericanrome.org/` (own site — identity only).
- photos: []

### 3.13 Chiesa evangelica luterana (Christuskirche) — church — Via Sicilia 70

- **What/when.** Roma Capitale: built **1910–1922**, opened to the public in 1922, to the design of
  **Franz Heinrich Schwechten**, court architect to Wilhelm II and architect of Berlin's
  Kaiser-Wilhelm-Gedächtniskirche. During construction, at 2.40 m depth, **the paving of a 4 m-wide
  Roman road** was found. Roma Capitale also notes that a few metres away, in the 19th century, a
  **13 m Roman obelisk belonging to the Villa of Sallust (the Horti Sallustiani)** was found, now
  standing before Trinità dei Monti.
- **Papal visits — three, dated.** Roma Capitale: **John Paul II, 11 December 1983; Benedict XVI,
  14 March 2010; Francis, 15 November 2015.**
- **Fabric, per Roma Capitale.** Gabled façade on via Sicilia in squared stone between two square
  bell towers; three marble statues over the portico — Christ centre, St Peter left, St Paul right;
  three naves with matronei; apse mosaic of the Tree of Life with Christ Pantocrator in a mandorla;
  font modelled on that of the Dómkirkjan in Reykjavík; **Steinmeyer organ opus 1515, built 1930**,
  35 stops, two 61-note manuals and a 30-note pedalboard.
- **Rione.** Roma Capitale coordinate `POINT (12.4916857 41.9088264)`: PIP=Ludovisi, NOM=Ludovisi
  (Nominatim resolves to "Chiesa evangelica luterana, Via Toscana, Ludovisi"). OSM way `52509644`
  agrees. Clean.
- **Address note.** Roma Capitale says Via Sicilia 70 and says the façade gives onto via Sicilia;
  Nominatim resolves the building to via Toscana. Corner site; both are defensible.
- Sources: `https://www.turismoroma.it/it/luoghi/chiesa-evangelica-luterana`;
  `https://it.wikipedia.org/wiki/Chiesa_evangelica_luterana_(Roma)`;
  `https://www.ev-luth-gemeinde-rom.org/` (the congregation's own site — reachable, bilingual
  German/Italian, establishes identity; Roma Capitale prints a different URL,
  `chiesaluterana.it/roma`, which is also live).
- photos: []

### 3.14 Chiesa di San Marone — Maronite national church of Lebanon — via Aurora

- **What/when.** it.wikipedia: built **1890** to the design of **Andrea Busiri Vici**, with an
  attached Maronite monastery **converted into a hotel in 1936**; dedicated to the 5th-century
  Syrian hermit founder of the Maronite Church; served by Maronites of Lebanon in the **Antiochene
  rite in Arabic**; the **national church of Lebanon**.
- **Rione.** OSM way `337871342` at 41.90787, 12.48719: **PIP=Ludovisi, NOM=Ludovisi** (Nominatim:
  "Chiesa di San Marone, Via Aurora, Ludovisi"). Clean.
- **Thin.** This is a five-line article and I found no official site. Honest candidate, honestly
  minor. Note it makes Ludovisi hold **three national churches** — Irish (Sant'Isidoro, by
  ownership), American (San Patrizio, since 2017) and Lebanese (San Marone) — which is a genuine
  through-line for a page and better than listing them separately.
- Sources: `https://it.wikipedia.org/wiki/Chiesa_di_San_Marone`.
- photos: []

### 3.15 Fontana delle Api — fountain — Piazza Barberini, at the foot of via Veneto — **STRADDLER (Ludovisi ↔ Colonna ↔ Trevi)**

- **What/when.** Roma Capitale: commissioned **1644** by **Urban VIII** from **Gian Lorenzo
  Bernini** as a *"beveratore delli cavalli"*, a service fountain collecting the return water of the
  nearby **Fontana del Tritone** (Bernini's, 1642–1643). Bernini shaped it as an open shell, the
  lower valve the basin, the upper fitted to the corner of the building it originally stood
  against, between **via Felice — today's via Sistina** — and the palazzetto of **Nicolò Soderini**;
  three bees pour the water.
- **The inscription joke, told by Roma Capitale.** The original inscription dated the fountain to
  the **22nd year** of Urban's pontificate, two months early; Pasquino's comment —
  *"Havendo li Barberini succhiato tutto il mondo, ora volevano succhiare anche il tempo"* — led the
  pope's nephew to erase the last digit, which made matters worse. **Urban VIII died on 29 July,
  eight days before the 22nd year would have begun.**
- **It is not the original stone.** Roma Capitale: **dismantled in 1865** for traffic and stored;
  when reassembly was decided in **1915** most of the pieces could not be found, so a copy was
  commissioned from **Adolfo Apolloni** and executed **in travertine instead of Luni marble**. The
  lower valve, once at street level, was raised on a course of blocks, and the upper valve no longer
  rests against a building. **A page that calls this "Bernini's fountain" without that paragraph is
  misleading.**
- **Rione — three-way, and the two available coordinates disagree.** Roma Capitale gives the address
  as "Fontana delle Api, **Piazza Barberini**" with coordinate `POINT (12.488431 41.903868)`, which
  falls **outside every rione ring I tested** and which Nominatim resolves to **"11, Piazza
  Barberini, Colonna"**. The OSM node `1326896537` at 41.90430, 12.48877 is **PIP=Ludovisi,
  NOM=Ludovisi**. Separately, my sweep put the **Piazza Barberini** way itself and the **Fontana del
  Tritone** in **Trevi**. So the fountain sits at or beside the point where Ludovisi, Colonna and
  Trevi meet, and the two published coordinates for it land on opposite sides.
  **Do not resolve — arbitrator.** And note the reservation: **Piazza Barberini, Palazzo Barberini
  and the Fontana del Tritone are Trevi's and are not being claimed here.**
- Sources: `https://www.turismoroma.it/it/luoghi/fontana-delle-api`;
  `https://it.wikipedia.org/wiki/Fontana_delle_Api`.
- photos: []

---

## 4. Candidates — the middle band

### 4.1 Villino Florio — house — via Abruzzi 2 (pedestrian) / 4 (carriage), corner via Sardegna

it.wikipedia: **1902**, built by the engineer **Carlo Pincherle** to a design by **Ernesto Basile**
for **Ignazio Florio junior**; Liberty, with a tower and *altana* over the via Abruzzi front,
Florentine fortified-palazzetto massing under Art Nouveau ornament; the garden gate jambs on both
via Abruzzi and via Sardegna are noted as Liberty stonework. **PIP=Ludovisi, NOM=Ludovisi**
(OSM ways `204016576`, `337971629`). Source:
`https://it.wikipedia.org/wiki/Villino_Florio_(Roma)`. Private residence — no access claimed.
photos: []

### 4.2 Villino Folchi — house, now offices — via Marche, block between via Sicilia and via Boncompagni

it.wikipedia: eclectic, built by **Giovanni Battista Giovenale** for **Monsignor Enrico Folchi**;
ground-floor rooms decorated by **Giovanni Capranesi** and **Gioacchino Pagliei**; **now the offices
of the law firm Hogan Lovells**. **DATE CONFLICT INSIDE ONE ARTICLE:** the infobox says
*"anni 1880"*, the prose says *"negli anni 1890"*. Do not pick one silently. **PIP=Ludovisi,
NOM=Ludovisi** at 41.90887, 12.48997. Source: `https://it.wikipedia.org/wiki/Villino_Folchi`.
photos: []

### 4.3 Villino Ferrari — house, now the FIEG — via Piemonte 64

it.wikipedia: built **1901** by **Carlo Pincherle** for the painter **Giuseppe Ferrari**; Florentine
Renaissance revival, rusticated ground floor; passed to a notary in the 1930s and later to the
**Federazione Italiana Editori Giornali**. One oddity worth a line: **in 1957 an opening was cut
through the Aurelian Walls at this villino's garden**. Sourced by it.wikipedia to
`info.roma.it` — a hobbyist gazetteer, not an authority; **attribute or drop**. Source:
`https://it.wikipedia.org/wiki/Villino_Ferrari`. photos: []

### 4.4 Villino Amero d'Aste Stella — house — via Abruzzi 6, corner via Sardegna

it.wikipedia: built for **Admiral Marcello Amero d'Aste Stella** by the engineer **Orazio Orengo**;
three storeys, entrance portico with an arch carrying a balustraded balcony, the D'Aste Stella arms
over the arch. **No construction date given by the source.** The whole article rests on a single
citation to `rerumromanarum.com`, a blog — **weak evidence, attribute or drop.**
Source: `https://it.wikipedia.org/wiki/Villino_Amero_D%27Aste_Stella`. photos: []

### 4.5 Hotel Excelsior (Westin Excelsior) — Via Vittorio Veneto 125

it.wikipedia: corner of via Veneto and via Boncompagni, by the Swiss **Otto Maraini** (the same
architect as Villa Maraini, §3.9) and **Emil Vogt**, French Baroque, **inaugurated 1906**; CIGA
Hotels 1923–1996, then Sheraton, then Starwood from 1998 as the Westin Excelsior. Roma Capitale
independently dates the opening to **1906** and names **Baron von Pfyffer**, owner of the Grand
Hotel. Scenes of *La dolce vita* were shot here per it.wikipedia. **PIP=Ludovisi, NOM=Ludovisi.**
Sources: `https://it.wikipedia.org/wiki/Hotel_Excelsior`;
`https://www.turismoroma.it/it/luoghi/vittorio-veneto`. photos: []

### 4.6 Hotel Flora (Marriott Grand Flora) — Via Vittorio Veneto 191

it.wikipedia: an apartment block of the late 19th century by **Filippo Galassi**, Borghese property,
bought by the Russo-German impresario Krumbügel and remodelled as a Liberty *pensione* by **Andrea
Busiri Vici in 1895**; **opened as a hotel in 1907**; raised a storey by **Giovanni Battista
Milani** in the 1910s. **From September 1943 to January 1944 the second floor was the Gestapo
command**, and on **19 December 1943** GAP partisans **Maria Teresa Regard, Franco Calamandrei and
Ernesto Borghesi**, in an action decided by **Antonello Trombadori**, bombed it. On **8 October
1981** an explosive device planted under a bed killed the PLO official **Majed Abu Sharar**.
**Heavy, sourced, and the most substantial single hotel story on the street.** Note the article's
sourcing is mixed — a *Corriere* piece and a *Repubblica* piece alongside `dagospia.com`; **the
1981 attribution to Mossad rests on the weaker citations and should be written as reported, not as
fact.** **PIP=Ludovisi, NOM=Ludovisi** at 41.90910, 12.48892.
Source: `https://it.wikipedia.org/wiki/Hotel_Flora`. photos: []

### 4.7 Hotel Majestic — Via Vittorio Veneto 50/54 — **CLOSED; DO NOT WRITE AS OPEN**

it.wikipedia: built **1899** as the *Hotel (des) Suisses* by **Giovanni Fecini** — the article
explicitly corrects an earlier attribution to **Gaetano Koch** — and calls it the first hotel built
on via Veneto; concave terrace following the avenue's curve; frescoes by **Domenico Bruschi**;
renamed *Albergo Maestoso* under Fascism; a *La dolce vita* location. **Closed in 2020 in the
pandemic; bought in 2022 by Boscalt Hospitality.** The infobox states `stato = chiuso`.
**INTERNAL CONFLICT:** the infobox says `inaugurazione = 1889`, the prose says **1899**. OSM still
carries the node with a live-looking website; **OSM is stale here and must not be trusted for
status.** **PIP=Ludovisi, NOM=Ludovisi.**
Source: `https://it.wikipedia.org/wiki/Hotel_Majestic_(Roma)`. photos: []

### 4.8 Hotel Eden — Via Ludovisi 49 · 4.9 Grand Hotel Palace / Ambasciatori — Via Veneto 62–70

Both PIP=Ludovisi, NOM=Ludovisi (Eden at 41.90663, 12.48630; Ambasciatori at 41.90628, 12.48953).
it.wikipedia's rione article dates the **Hotel Ambasciatori** to the 1925–1935 building phase
alongside the INA building and the Ministry of Corporations. I fetched `it:Hotel Palace` but it is a
stub. **Weak evidence; carried for the verifier to cut.**
Sources: `https://it.wikipedia.org/wiki/Ludovisi_(rione_di_Roma)`;
`https://it.wikipedia.org/wiki/Hotel_Palace`. photos: []

### 4.10 Harry's Bar — Via Vittorio Veneto 150

OSM tags it `historic=monument` with an en.wikipedia link, and it.wikipedia's via Veneto article
names it first among the Dolce Vita cafés, alongside the **Café de Paris (closed 2008)** and the
**Doney**. **PIP=Ludovisi, NOM=Ludovisi** at 41.90908, 12.48832.
**Corpus rule applies hard here:** its own site may establish that it exists and where, but **not**
that it is the oldest, the most famous, or how long it has traded. **Café de Paris and Doney are
gone** — a page must not send readers to either. Sources:
`https://it.wikipedia.org/wiki/Via_Vittorio_Veneto`; OSM node `766869078`. photos: []

---

## 5. Candidates — the tail (recorded for completeness; expect most to be cut)

All of the following are **PIP=Ludovisi and NOM=Ludovisi** — the boundary work is done; it is the
*interest* that is thin.

**5.1 Ministero del Lavoro (Palazzo "Marco Biagi"), via Veneto 56** — named in it.wikipedia's via
Veneto monument list; via Veneto 56 tests PIP=Ludovisi, NOM=Ludovisi. No article of its own.

**5.2 U.S. Mission to the UN Agencies in Rome, via Boncompagni 2** — OSM way `52510551`,
en.wikipedia-linked, PIP/NOM=Ludovisi. **Same ruling-2 hazard as §3.4: not U.S. territory.**
`usunrome.usmission.gov` returned HTTP 403; I could not fetch it.

**5.3 Embassies inside the rione** — Georgia to the Holy See (via Toscana 48), Indonesia (via
Campania 55), Cyprus (via Ludovisi 35), Dominican Republic (via Ludovisi 16), Uruguay (via Veneto
183). All PIP/NOM=Ludovisi, all from OSM tags only. **Ordinary Italian buildings.** Probably not
guide material; recorded because a page about via Veneto will be asked "what are all these flags".

**5.4 Chiesa di Santa Maria Regina dei Cuori, via Sardegna at via Romagna** — it.wikipedia:
**1903–1913**, **Tullio Passarelli**, neo-Romanesque, with the Montfortian Fathers' convent; marble
group over the high altar by **Paolo Bartolini**; a plaque recording **John XXIII's visit of 10
March 1962** at the start of the rione's Lenten station.
`https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Regina_dei_Cuori`

**5.5 Chiesa del Santissimo Redentore e Santa Francesca Saverio Cabrini, via Sicilia** —
it.wikipedia: founded **1906**, architect given only as "Cucco", for the **Missionarie del Sacro
Cuore di Gesù**; paintings of Cabrini's miracles by G. Ciotti, **1952**.
`https://it.wikipedia.org/wiki/Chiesa_del_Santissimo_Redentore_e_Santa_Francesca_Saverio_Cabrini`

**5.6 Chiesa del Corpus Christi, via Sardegna** — it.wikipedia: **1904**, **Luigi Senigallia**, with
a Capuchin nuns' enclosed monastery; **in 1954 the complex passed to the Friars Minor Capuchin as
their generalate curia**. `https://it.wikipedia.org/wiki/Chiesa_del_Corpus_Christi`

**5.7 ex Chiesa di San Lorenzo da Brindisi, via Sicilia — DECONSECRATED** — it.wikipedia: **1912**,
**Giovanni Battista Milani**, for the Capuchins, with their generalate curia and an international
college attached; **in 1968 the Capuchins left, sold the complex to a property company and moved to
the Chiesa del Corpus Christi** (§5.6). Exterior intact; **the interior is now a conference hall.**
`https://it.wikipedia.org/wiki/Chiesa_di_San_Lorenzo_da_Brindisi`

**5.8 ex Chiesa di San Giuseppe Calasanzio, via Sicilia — DECONSECRATED** — it.wikipedia: land
bought from **Rodolfo Boncompagni in 1890** by three **Piarist** priests displaced from San
Pantaleo by the suppression of religious orders; deconsecrated **c. 1918**; around 1917 sold to the
**Croce Rossa Italiana** and **now absorbed into the Italian Red Cross building as a meeting room**,
its façade lettered *"Comitato centrale della Croce Rossa Italiana"*. Armellini described it in 1891
as still under construction. Altarpieces dispersed to Frascati and San Pantaleo.
`https://it.wikipedia.org/wiki/Chiesa_di_San_Giuseppe_Calasanzio_(Roma)`

**5.9 Cappella di Sant'Andrea di Grecia, via Sardegna** — listed by it.wikipedia's rione article,
present in OSM as way `338700519`, **no article of its own**. Thinnest entry in the file.

**5.10 Liceo Ginnasio Torquato Tasso, via Sicilia 168; Liceo Scientifico Augusto Righi, via Campania
63; Scuola media Michelangelo Buonarroti and Scuola primaria Regina Elena, via Puglie** — all listed
by it.wikipedia's rione article under "Architetture scolastiche"; Tasso and Righi have their own
articles and both test PIP/NOM=Ludovisi. **Schools are not visitor destinations**; recorded only
because the Tasso has a notable-alumni article and a guide might reach for it.

**5.11 Fontana del Tritone di Palazzo Margherita** (OSM way `322582073`, PIP/NOM=Ludovisi) —
**inside the Embassy grounds, therefore not visitable**; and confusingly named, since Bernini's
famous Fontana del Tritone is a different fountain in Piazza Barberini, in **Trevi**. Recorded
mainly as a naming hazard.

**5.12 Largo Federico Fellini** — the open space at the top of via Veneto by Porta Pinciana;
PIP/NOM=Ludovisi (OSM way `337987716`). it.wikipedia's via Veneto article notes a plaque to Fellini.

**5.13 Unverified leads from it.wikipedia's via Veneto monument list.** The article lists
**Palazzo Coppedé**, the **Fontana del cane**, the **Hotel Balestra**, the **Jumeirah Grand Hotel**
and the **Villino Piombino** (an annexe of Palazzo Margherita). **All five are red links — no
it.wikipedia article exists for any of them** and I found no other source. **Do not write these up
from the list alone.** Recorded so the verifier does not waste a fetch discovering the same.

---

## 6. Ruled OUT of Ludovisi — with the evidence, so nobody re-litigates it

### 6.1 The Sallustiano line — and the trap the brief predicted

The brief warned that Ludovisi and Sallustiano were carved from the same estate and would confuse.
It does, and here is the specific form it takes:

**The Museo Boncompagni Ludovisi per le arti decorative is NOT in Ludovisi.** It is at **Via
Boncompagni 18**, in the **Villino Boncompagni Ludovisi**, and both my methods put it in
**SALLUSTIANO**: PIP=Sallustiano, NOM=Sallustiano, Nominatim display name "Museo Boncompagni
Ludovisi per le arti decorative, 18, Via Boncompagni, **Sallustiano**". This is consistent with the
odd/even parity rule in §1 and with it.wikipedia's boundary text, which runs the border down via
Boncompagni. **A museum carrying the rione's own family name, on the rione's own boundary street,
belonging to the other rione.** Anything written about Ludovisi that claims this museum will be
wrong, and it is the single most likely error a careless source will hand the corpus.

Also **Sallustiano, not Ludovisi**, on both methods: **Villino Rattazzi** (via Boncompagni 10),
**Villino Rasponi** (via Boncompagni 14), **Villino Pignatelli**, **Villino Levi**, **Villino di
Rudinì** (via Quintino Sella 60), the **Horti Sallustiani** archaeological site, the **Palazzo
dell'Agricoltura**, **Santa Maria della Vittoria**, **San Camillo de Lellis**, the **Sacro Cuore di
Gesù**, the **Japanese Embassy**, the **U.S. Embassy to the Holy See** (via Sallustiana 49 — a
*third* American mission in this quadrant, and a different building from §3.4 and §5.2), and the
**Sepolcro di Quinto Sulpicio Massimo**.

**Piazza Fiume is out.** it.wikipedia's boundary text says the Sallustiano border runs "fino a
piazza Fiume **(esclusa)**" — excluded — yet the *same article* lists Piazza Fiume under the rione's
"Piazze". **The article contradicts itself.** My methods agree with the boundary text: a point on
the west side of piazza Fiume tests PIP=Sallustiano, NOM=Sallustiano. **Recorded for the arbitrator;
I have not taken it.**

### 6.2 The Trevi and Colonna lines

**Trevi, on both methods** (and reserved to wave 2 in the case of Piazza Barberini): **Piazza
Barberini**, **Palazzo Barberini**, the **Fontana del Tritone**, **Cinema Barberini**, the
**Barberini metro station**, **San Nicola da Tolentino**, **Santa Susanna alle Terme di
Diocleziano**, **San Basilio agli Orti Sallustiani**, the **Collegium Germanicum et Hungaricum**,
the **Pontificio Collegio Armeno**, the **Mitreo Barberini**, **Villa Savorgnan di Brazzà** and the
Servian Wall remains on via Salandra.

**Colonna / Campo Marzio, on both methods:** **Teatro Sistina**, the **Galleria d'Arte Moderna di
Roma Capitale** (via Francesco Crispi 24), **San Giuseppe a Capo le Case**, **Sant'Ildefonso in Via
Sistina**, and the hotels on via Sistina and via degli Artisti.

### 6.3 The Pinciano line

**Pinciano (Q. III, Municipio II), on both methods:** **Villa Borghese**, the **Casa del Cinema**,
the **Teatro all'aperto Ettore Scola**, the **Basilica di Santa Teresa d'Avila** (Corso d'Italia
37), **Porta Salaria**, the **Sepolcro di Cornelia**, and the 1870 cannonball hole in the walls at
41.91087, 12.49463. **Porta Pinciana itself is the contested case and is flagged, not taken** —
see §3.7.

### 6.4 Nothing to report on the wave-1/wave-2 reservation list

No reserved place is claimed, and none of them is even adjacent to Ludovisi except through Trevi
and Colonna, both handled above. **I am not asking the coordinator to rule on any reserved place.**

---

## 7. Straddler summary — the three the arbitrator must actually decide

| # | Place | Contest | Why it is genuinely unresolved |
|---|---|---|---|
| 1 | **Porta Pinciana** | Ludovisi ↔ **Q. III Pinciano** | Roma Capitale publishes a **Ludovisi street address** (Via Vittorio Veneto 196) with a **coordinate that lands in Pinciano** on both methods. The OSM node splits the methods (PIP=Ludovisi, NOM=Pinciano). it.wikipedia makes the walls *up to* the gate the border, i.e. the gate is the terminus of the boundary itself. Crosses a **unit-type** line as well: Pinciano is a *quartiere* in Municipio II. |
| 2 | **Fontana delle Api** | Ludovisi ↔ Colonna ↔ **Trevi** | The two published coordinates land on **opposite sides**: Roma Capitale's → Colonna (and outside every ring I tested), OSM's → Ludovisi. Piazza Barberini and the Fontana del Tritone next to it are **Trevi's and reserved**. Triple point. |
| 3 | **Via Vittorio Veneto (lower stretch)** | Ludovisi ↔ Colonna | it.wikipedia's infobox files the street under **both rioni** and the prose says the initial stretch *separates* them. My methods split at 41.90428, 12.48862 (PIP=Ludovisi, NOM=Colonna). The carriageway is the boundary; the street cannot be wholly either. |

**Watch-list, agreeing on both methods but sitting on a boundary street** — flagged so the
arbitrator sees the risk rather than being told they are safe: **Sant'Isidoro a Capo le Case**
(on via degli Artisti / via di Sant'Isidoro, the Colonna line); **San Patrizio a Villa Ludovisi**
and the **U.S. Mission at via Boncompagni 2** (on the Sallustiano line); and the **Aurelian Walls**,
which are a linear straddler across at least four units in this quadrant and are a programme-wide
question, not a Ludovisi one.

---

## 8. Evidence hygiene

### 8.1 Ruling 1 re-tested and confirmed

I attempted all three designation registers from this network on 2026-09-02:

- `https://www.beniculturali.it/` — **connection timed out**
- `https://vincoliinrete.beniculturali.it/vir/main/loginMain.jsp` — **connection timed out**
- `https://catalogo.beniculturali.it/` — **connection timed out**

All three time out at the socket, not at HTTP. **The evidence_ruling holds unchanged: no page in
this rione may claim a designation, protection status or listing date.** Note that this is the same
network on which `it.wikipedia.org`, `nominatim.openstreetmap.org`, `api.openstreetmap.org`,
`turismoroma.it` and `sovraintendenzaroma.it` all answered normally, so the failure is specific to
the beniculturali estate, not general.

### 8.2 Source traps found in this rione — worth propagating

1. **`santisidoro.org` is a different organisation** in Marano di Napoli, not the Roman church
   (§3.11). A plausible-looking domain for the wrong body.
2. **`stpatricksrome.com` is a parked domain for sale**, not the parish (§3.12). The real site is
   `stpatricksamericanrome.org`.
3. **`it:Casino dell'Aurora` is a disambiguation page** covering two different buildings in two
   different rioni (§3.5).
4. **`villaludovisi.org` is stale on access** — it still describes the Princess as living in the
   Casino "in perpetuity" after a documented 2023 eviction (§3.5). Excellent on documents; unusable
   on visiting.
5. **OSM is stale on the Hotel Majestic**, carrying a live website for a hotel closed since 2020
   (§4.7). OSM tags are not a status source.
6. **The rioni are not `admin_level=10` in OSM and are not named "Rione …"** (§1). Both natural
   queries return confidently wrong empty answers.
7. **`060608.it` renders nothing to a non-JS fetch** — it looks reachable and returns 117 KB of
   navigation chrome with no content.
8. Several it.wikipedia articles here rest on **`rerumromanarum.com` and `info.roma.it`**, which are
   enthusiast gazetteers, not authorities (§4.3, §4.4). Attribute or drop.

### 8.3 Internal contradictions carried forward, not resolved

- Via Veneto born **1894** (Roma Capitale) vs completed **1906** (it.wikipedia) — §3.1.
- U.S. Embassy here since **1931** (it.wikipedia) vs **"end of WWII"** (Roma Capitale) — §3.4.
- Villa Ludovisi **30 ha** vs **25 ha** vs **89.6 acres** — §3.6.
- Istituto Svizzero active from **1947** vs resident from **1948** — §3.9.
- Palazzo Piacentini at **via Veneto 33** vs **via Molise 2** — §3.10.
- Villino Folchi **1880s** vs **1890s**, *within one article* — §4.2.
- Hotel Majestic **1889** vs **1899**, *within one article* — §4.7.
- Piazza Fiume "esclusa" from the rione vs listed among its piazze, *within one article* — §6.1.

---

## 9. Photo leads for the later wave (prose only, no URLs, no files — ruling 3)

Two, both noted and **not acted on**. First, the Casino dell'Aurora's Guercino ceiling and the
Caravaggio wall painting are the most photographically valuable things in the rione and are also
the most legally fraught — a private building, an unresolved sale, and interior works. Second, the
Aurelian Walls walkway from Porta Pinciana toward Porta Salaria, which Roma Capitale says reopened
to the public in 2021, is an exterior subject on public infrastructure and is likely the easiest
clean shot in Ludovisi. Both should go to whoever runs the photo wave with the access questions
answered first. **Every record above emits `"photos": []`.**
