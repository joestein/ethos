# Monti (R. I, Roma Capitale toponymic code 101) — FINDER file

Rome programme, Wave 1. Research date 2026-09-02.

**This is a finder file. It is evidence, not a decision.** Nothing here is adjudicated. Straddlers are
flagged and deliberately left unresolved for the arbitrator, which will hold all four rione files.

**Ruling compliance, stated up front:**

- **No designation claims.** No entry below says *vincolato*, *listed*, *scheduled*, *declared a
  monument*, *protected*, or any translation. Where a source I fetched made such a claim, I have
  quarantined it in §7.1 rather than carried it. This is the evidence ruling and I am not arguing
  with it.
- **Vatican City.** Nothing in Monti is inside the Vatican state, so ruling 2's exclusion does not
  bite here. What *does* bite is the **third tier**: Monti contains **four Lateran Treaty
  extraterritorial properties**, more than any other rione I am aware of. They are handled in §4 with
  their status stated from the Treaty's own text, which I fetched from vatican.va.
- **No photographs.** Every candidate carries `"photos": []`. I sourced, named and linked no image.
  Photo-wave notes are quarantined in §7.4 and are explicitly not for this wave.
- **No trip durations, no vague proximity.** I have not written one. Note §7.2 — Roma Capitale's own
  tourism copy *does* contain unmeasurable proximity language and superlatives, and those phrases
  must not be lifted even though the source is official.

---

## 1. Headline numbers

| | |
|---|---|
| Candidate records below | **131** |
| Of which flagged straddler / contested rione | **19** |
| Of which Lateran Treaty extraterritorial (third tier) | **4** |
| Of which I recommend REJECT outright (source is dead, hijacked or wrong) | **7** |
| Roma Capitale area figure for Monti | 1,7 km² (Annuario statistico 2022, Tab. 1.3) |
| Wikipedia-category yield measured by the scoping wave | 106 place-like / 128 listed |

The 131 is higher than the scoping wave's ~106 because I swept OSM tags as well as the Wikipedia
category, and the two sets do not coincide — OSM surfaced eleven named places the Italian Wikipedia
category does not carry at all (§5.9), and the Wikipedia category carries dozens of vanished and
deconsecrated churches OSM has no node for (§5.4).

I want to say plainly that **I expect a large fraction of these to be cut.** Several categories below
are deliberately marginal — vanished churches with nothing standing, 34 street shrines, libraries
inside a faculty building. I included them because the brief told me a high confirmation rate is a
warning sign, and because the arbitrator should see the shape of the tail rather than a
pre-filtered list. §5.4 and §5.5 in particular are candidate *sets* I would not defend individually.

---

## 2. Method, and how the boundary work was actually done

Everything was fetched with `python3` + `urllib` writing raw bytes. WebSearch was never used — the
budget was exhausted before I started and I worked only from URLs I could name in advance.

**Three boundary methods, run independently, and they do not fully agree.** That disagreement is the
most important thing in this file and §3 is devoted to it.

**Method A — OSM boundary relation, point-in-polygon, computed locally.**
Overpass `https://overpass-api.de/api/interpreter`, query `rel(id:5451988,5452710,5454309,5454335,5454237,5454327,5454323); out geom;`
pulling Monti (**relation 5451988**, `official_name=Rione I Monti`) plus its six candidate
neighbours Trevi 5452710, Campitelli 5454237, Esquilino 5454309, Ludovisi 5454323, Castro Pretorio
5454327, Celio 5454335. I stitched the member ways into rings — **Monti closed cleanly into a single
561-point outer ring**, as did all six neighbours — and ran ray-casting point-in-polygon myself
rather than trusting a geocoder. Sanity-checked against two control points before use: a point on
via Urbana returned Monti only, a point at piazza Vittorio returned Esquilino only, and the seven
polygons never double-claimed a control point. Coordinates for 138 of the 147 Wikipedia-category
titles came from the MediaWiki `prop=coordinates` API.

**Method B — Nominatim reverse geocoding**, the method the brief named, at
`https://nominatim.openstreetmap.org/reverse?format=jsonv2&zoom=18&addressdetails=1&accept-language=it`,
reading `address.quarter`. **Caution the verifier must know: Nominatim rate-limited me hard.** My
first two batches returned HTTP 429 on nearly every call. My fetch helper returns an error object on
non-200, so **no fabricated `quarter` values entered the data** — the failures are visible as
`FAILED` in the logs — but a less careful pipeline would have silently recorded `quarter: None` as
"not in any rione". I re-ran at 10s intervals with 30s backoff to get clean results. Anyone
re-running this must keep that throttle.

**Method A and B are not independent.** Both are OSM-derived. That they nonetheless *disagree* at the
Lateran (§3.2) is therefore worse news than it looks, not better — it means the disagreement is
inside OSM's own stack, between the boundary relation and the geocoder's ranking.

**Method C — Roma Capitale's own prose boundary description.** This is the one genuinely independent
source and I did not expect to find it. `https://www.turismoroma.it/it/pagina/rione-i-monti`
is an official Roma Capitale editorial page for the rione and it publishes a **complete perimeter
description**, quoted verbatim in §3.1. It is human-readable text, not geometry, but it is the
Comune's own voice and it settles some questions the OSM stack does not.

**Method D — cross-claim detection.** I fetched the raw wikitext of the Celio, Esquilino, Campitelli,
Trevi and Castro Pretorio articles and intersected their outbound links with Monti's, to find places
two rioni both claim. That found five genuine disputes (§3.4).

Corroborating documents fetched:
`https://www.vatican.va/roman_curia/secretariat_state/archivio/documents/rc_seg-st_19290211_patti-lateranensi_it.html`
(Lateran Treaty primary text, 56,861 characters extracted) and
`https://it.wikipedia.org/wiki/Monti_(rione_di_Roma)` via `action=parse&prop=wikitext`.

---

## 3. BOUNDARY WORK — the straddlers and contested places

### 3.1 Roma Capitale's own perimeter for Monti

Verbatim from `https://www.turismoroma.it/it/pagina/rione-i-monti`, under the heading `Confini:`

> «piazza del Colosseo, via dei Fori Imperiali, piazza Madonna di Loreto, vicolo San Bernardo, via
> Magnanapoli, via XXIV Maggio, via del Quirinale, via delle Quattro Fontane, via Agostino Depretis,
> piazza Esquilino; via Esquilino, piazza Santa Maria Maggiore, via Merulana, piazza di San Giovanni
> in Laterano, **complesso del Laterano (entro le mura aureliane)**, via della Ferratella, piazza di
> Porta Metronia, via della Navicella, via Santo Stefano Rotondo, via Oliviero Plunkett, via di San
> Giovanni in Laterano.»

Translation: *"piazza del Colosseo, via dei Fori Imperiali, piazza Madonna di Loreto, vicolo San
Bernardo, via Magnanapoli, via XXIV Maggio, via del Quirinale, via delle Quattro Fontane, via
Agostino Depretis, piazza Esquilino; via Esquilino, piazza Santa Maria Maggiore, via Merulana, piazza
di San Giovanni in Laterano, the Lateran complex (within the Aurelian walls), via della Ferratella,
piazza di Porta Metronia, via della Navicella, via Santo Stefano Rotondo, via Oliviero Plunkett, via
di San Giovanni in Laterano."*

Two things follow that a guide would not guess:

1. **Roma Capitale puts the Lateran complex inside Monti**, explicitly, in words, with the
   qualifier "within the Aurelian walls". San Giovanni in Laterano is a Monti place per the Comune.
2. **The perimeter runs along piazza Esquilino, via Esquilino and piazza Santa Maria Maggiore** —
   i.e. along the basilica of Santa Maria Maggiore's own two piazzas. This is the seam.

Independently, the same site's page for the Esquiline obelisk states the obelisk is
«in piazza dell'Esquilino, dietro l'abside della Basilica di Santa Maria Maggiore, **nel Rione
Monti**» — *"in piazza dell'Esquilino, behind the apse of the Basilica of Santa Maria Maggiore, in
Rione Monti."* (`https://www.turismoroma.it/it/luoghi/obelisco-esquilino`). That places the apse
side of the basilica in Monti in Roma Capitale's own words.

The it.wikipedia Monti article gives a different and less detailed perimeter, framed as a list of
neighbours: Trevi at «via Ventiquattro Maggio, largo Magnanapoli, via del Quirinale»; Castro Pretorio
at «via Quattro Fontane, via Depretis, piazza Esquilino, via Cavour»; Esquilino at «via Merulana,
largo Brancaccio, piazza San Giovanni in Laterano»; Celio at «via di San Giovanni in Laterano […],
via della Navicella, via di Santo Stefano Rotondo, piazza del Colosseo»; Campitelli at «via dei Fori
Imperiali». It agrees with the Comune on the Lateran and on the Celio streets. **Note it names Castro
Pretorio as a Monti neighbour and the Comune's perimeter does not obviously touch it** — I could not
resolve that and flag it in §3.6.

### 3.2 STRADDLER CLUSTER 1 — the Lateran. Three methods, three answers.

This is the single largest unresolved question in Monti and it affects the cathedral of Rome.

| Place | A: OSM polygon PIP | B: Nominatim `quarter` | C: Roma Capitale prose | Nominatim CAP |
|---|---|---|---|---|
| Basilica di San Giovanni in Laterano | **Monti** | **Esquilino** | **Monti** ("complesso del Laterano") | 00184 |
| Palazzo del Laterano | **Monti** | **Esquilino** | **Monti** | 00183 |
| Battistero lateranense | **Monti** | **Esquilino** | **Monti** | 00183 |
| Scala Santa / Sancta Sanctorum | **Esquilino** | **Esquilino** | (not named individually) | 00183 |
| Piazza San Giovanni in Laterano, centre | **Monti** | **Monti** | boundary segment | 00183 |
| Obelisco Lateranense | **Monti** | not probed | boundary-adjacent | — |
| Porta Asinaria | **Monti** | not probed | inside walls → Monti | — |
| Ospedale San Giovanni-Addolorata | **Monti** | not probed | inside walls → Monti | — |

Probe coordinates, so this is reproducible: SGL basilica 41.88591, 12.50616; Palazzo del Laterano
41.88693, 12.50587; Battistero 41.88615, 12.50429; Scala Santa 41.88719, 12.50703; piazza centre
41.88650, 12.50520.

**What I think is happening, labelled as inference and not evidence:** Nominatim is not doing strict
point-in-polygon here; it appears to be ranking a nearby named place object, and the Lateran block
sits close enough to the Esquilino polygon edge that the ranking flips. My own PIP against the raw
relation geometry is the more literal reading of OSM, and it agrees with the Comune's prose on three
of the four buildings. **But I am not resolving this. The arbitrator must.**

**The Scala Santa is the interesting case**: it is the one Lateran building where methods A and B
*agree* on Esquilino, and it is ~120 m from the basilica which both OSM methods and the Comune's text
put on the Monti side. If that holds, **the Lateran complex is itself split between two rioni** — and
the Comune's phrase "complesso del Laterano (entro le mura aureliane)" does not tell us whether the
Scala Santa building is inside the thing it means by *complesso*. Its own official site gives its
address as **Piazza di San Giovanni in Laterano 14, 00184 Roma**
(`https://www.scala-santa.com/dove-siamo/`), a *third* postcode reading — 00184 where Nominatim's
geometry says 00183. Two official-ish sources disagree about the postcode of one building.

### 3.3 STRADDLER 2 — Santa Maria Maggiore. The brief's premise is NOT supported by what I could fetch.

The brief and the roster both state SMM straddles Monti and Esquilino. **I could not reproduce that,
and three methods put it wholly in Monti.** I am reporting this because getting it wrong in either
direction is expensive, not because I think the brief is careless.

| Probe | lat, lon | A: PIP | B: Nominatim | Nominatim road / CAP |
|---|---|---|---|---|
| Facade | 41.89750, 12.49861 | Monti | **Monti** | Piazza di Santa Maria Maggiore / 00184 |
| Apse, piazza Esquilino side | 41.89790, 12.49800 | Monti | **Monti** | Via Liberiana / 00184 |
| Piazza SMM side | 41.89706, 12.49892 | Monti | **Monti** | Piazza di Santa Maria Maggiore 28 / **00185** |
| Piazza dell'Esquilino | 41.89806, 12.49731 | Monti | not probed | — |

Corroborating, and independent of OSM:

- Roma Capitale's Monti perimeter runs *along* piazza Esquilino, via Esquilino and piazza Santa Maria
  Maggiore — i.e. around the basilica block, not through it (§3.1).
- Roma Capitale's Obelisco Esquilino page places piazza dell'Esquilino, behind the apse, "nel Rione
  Monti" (§3.1).
- **it.wikipedia's Esquilino article does not list Santa Maria Maggiore among its
  `Architetture religiose` at all.** I read the whole list. The Monti article does list it.
- The Castro Pretorio article mentions SMM only in historical prose about medieval settlement, not as
  one of its places.

**Against, and the reason this stays open:** the two OSM-recorded postcodes on the same piazza —
00184 on the Liberiana/facade side, **00185** at Piazza di Santa Maria Maggiore 28 — are real
evidence of an administrative seam running through that block, and OSM's own building polygon for the
basilica carries `addr:postcode=00185`, the Esquilino code, while sitting inside the Monti relation.
The building is also physically enormous and the Comune's boundary is described in street names that
touch it on both sides.

**My honest read, offered as opinion and not as evidence:** the "straddle" may be a real-world truth
about the *block and its postcodes* that the OSM polygon simply does not encode, or it may be an
inherited assumption. **Not resolving it.** But the arbitrator should know that the file it was told
to expect a straddle in has three fetched sources saying Monti and one postcode saying otherwise.

### 3.4 STRADDLERS 3–7 — places two rioni both claim in writing

Found by intersecting outbound wikitext links between rione articles.

| Place | Claimed by | Method A PIP | Method B | Note |
|---|---|---|---|---|
| **Basilica di San Clemente al Laterano** | Monti article (monuments list) *and* Celio article (prose) | **Monti** | **Monti** | Celio's own perimeter names via di San Giovanni in Laterano as the divider; Celio does **not** list it in its own monuments. Name says "al Laterano". OSM addr Via Labicana 95, 00184. Both methods agree: Monti. |
| **Basilica di Santo Stefano Rotondo al Celio** | Monti (monuments) *and* Celio (prose) | **Monti** | **Monti** | The name says *al Celio* and it is a trap. Both OSM methods say Monti; via di Santo Stefano Rotondo is itself the boundary per both perimeters. OSM addr Via Santo Stefano Rotondo 7, 00184. |
| **Piazza del Quirinale** | Monti (piazze list) *and* Trevi (piazze list) | **Trevi** | not probed | Trevi's perimeter says the boundary *is* «via del Quirinale, piazza del Quirinale, via Ventiquattro Maggio, largo Magnanapoli». The piazza is the line. Genuine straddle. |
| **Palazzo del Quirinale** | — | centroid **Trevi**, but returned by a Monti-area Overpass query | not probed | OSM relation 2707110. Its footprint crosses the line — the Manica Lunga runs east along via del Quirinale into Monti. Flagging as a physical straddler even though nobody's text claims it for Monti. |
| **Basilica di Santa Prassede** | Monti (monuments) *and* Castro Pretorio (prose) | **Monti** | **Monti** | **But** Roma Capitale's own place page says «Situata nel rione Esquilino» — see §3.5. |
| **Basilica di Santa Pudenziana** | Monti *and* Castro Pretorio (prose) | **Monti** | **Monti** | Castro Pretorio mention is historical prose only. |
| **Porta Metronia** | Monti (Altro) *and* Celio (Porte) | **Monti** | not probed | Celio's own article says it is «compresa nel confine/limite est del rione Monti e il quartiere IX Appio Latino» — Celio concedes it. |

### 3.5 Roma Capitale contradicts itself on three places

This matters for the corpus rule about attributing aggregators: turismoroma is *not* an aggregator,
it is the Comune, and it still disagrees with itself. Its **rione perimeter page** is reliable
geometry-in-words; its **per-place "situated in X" sentences are not**, and should not be cited for
rione assignment.

| Place | turismoroma per-place page says | Every other method says |
|---|---|---|
| Basilica di Santa Prassede | «Situata nel **rione Esquilino**» | Monti (PIP, Nominatim, it.wiki Monti list, Comune's own perimeter — via Merulana is the line and Santa Prassede is west of it) |
| Teatro Brancaccio | «Situato nel cosmopolita **quartiere Esquilino**» | Monti (PIP; Nominatim `quarter=Monti` at via Merulana). Also calls Esquilino a *quartiere*; it is a **rione**. |
| Obelisco Esquilino | «nel **Rione Monti**» | Monti — this one is right, and it is the page that undercuts the SMM straddle |

Teatro Brancaccio's OSM address is Via Merulana 244, **00185** — the Esquilino postcode again, on a
building Nominatim puts in Monti. Same pattern as SMM.

### 3.6 Open boundary questions I could not close

1. **Does Monti touch Castro Pretorio?** it.wikipedia says yes (via Quattro Fontane, via Depretis,
   piazza Esquilino, via Cavour). Roma Capitale's perimeter names via delle Quattro Fontane and via
   Agostino Depretis but never names Castro Pretorio. My PIP put nothing in Castro Pretorio. Unclosed.
2. **The `quarter` vs `neighbourhood` tagging trap** documented in the scoping wave: for Monti,
   Nominatim returned the rione in `address.quarter` on every successful probe (0 in
   `neighbourhood`), so Monti is not affected by the Testaccio-style failure. Recorded so the next
   rione's finder does not have to re-test it.
3. **Porta San Giovanni** falls *outside* all seven polygons as a node (41.88590, 12.50934) but its
   way centroid falls inside Monti. It sits in the Aurelian wall itself. Genuinely ambiguous.
4. **Invalid postcode in OSM**: San Carlo alle Quattro Fontane returned `postcode=00817` from
   Nominatim. That is not a valid Italian CAP. Do not carry any CAP for that building from OSM.

---

## 4. Lateran Treaty extraterritorial properties in Monti (the THIRD TIER)

Per the vatican_ruling these are **not** Vatican territory, they are on Italian soil with the
immunities of diplomatic headquarters, and they **publish under the unit they physically stand in
with their status stated accurately**. Monti has four. Source is the Treaty's own text, fetched from
`https://www.vatican.va/roman_curia/secretariat_state/archivio/documents/rc_seg-st_19290211_patti-lateranensi_it.html`.

**Art. 13, verbatim:**

> «L'Italia riconosce alla Santa Sede la piena proprietà delle Basiliche patriarcali di San Giovanni
> in Laterano, di Santa Maria Maggiore e di San Paolo, cogli edifici annessi (Alleg. II, 1, 2 e 3).»

Translation: *"Italy recognises the Holy See's full ownership of the patriarchal Basilicas of San
Giovanni in Laterano, Santa Maria Maggiore and San Paolo, together with the annexed buildings."*

**Art. 15, verbatim (the immunities article):**

> «Gli immobili indicati nell'art. 13 […] benché facenti parte del territorio dello Stato italiano,
> godranno delle immunità riconosciute dal diritto internazionale alle sedi degli agenti diplomatici
> di Stati esteri.»

Translation: *"The properties indicated in art. 13 […] although forming part of the territory of the
Italian State, shall enjoy the immunities recognised by international law for the headquarters of
diplomatic agents of foreign States."*

The phrase **«benché facenti parte del territorio dello Stato italiano»** — *although forming part of
the territory of the Italian State* — is the Treaty saying in its own words that these are Italian
soil. That is the sentence a page should carry. It is publishable because it is the Treaty's own text
about its own properties.

| # | Property | Physically in | Treaty basis | Status wording that is safe |
|---|---|---|---|---|
| E1 | **Basilica di San Giovanni in Laterano** | Monti per Comune + PIP; Esquilino per Nominatim — **CONTESTED, §3.2** | Art. 13 named explicitly | Holy See property; Italian territory; Art. 15 immunities |
| E2 | **Palazzo del Laterano** (Palazzo Lateranense) | same contest | Art. 13 «cogli edifici annessi» | as above |
| E3 | **Basilica di Santa Maria Maggiore** | Monti per all three methods — **but see §3.3** | Art. 13 named explicitly | as above |
| E4 | **Scala Santa / Sancta Sanctorum** | **Esquilino** per both OSM methods | **INFERRED**, see caution below | as above, if carried |

**Caution on E4, stated plainly.** Art. 13 does **not** name the Scala Santa. it.wikipedia's Patti
Lateranensi article lists «Basilica e Palazzo Lateranense con la Scala Santa» as one Annex II item
and cites the same vatican.va document, but **the Annex II schedule itself is not in the text I
fetched** — I have Art. 13's reference to "(Alleg. II, 1, 2 e 3)" but not the annex contents. So the
Scala Santa's extraterritorial status here rests on Art. 13's «edifici annessi» plus a Wikipedia
gloss, **not on a clause I read**. A verifier should obtain Annex II before any page states it. And
per §3.2 it may not be a Monti page at all.

**Also note Art. 16**, which I fetched and which says these properties «non saranno mai assoggettati a
vincoli o ad espropriazioni per causa di pubblica utilità, se non previo accordo con la Santa Sede».
**Do not read this as a designation fact in either direction.** It is a restriction on future Italian
action, not a statement about protection status, and the evidence ruling bans the whole category.
I am recording that I noticed it and deliberately did not use it.

**A fifth, non-Treaty ecclesiastical cluster** sits in the same block and must not be confused with
the four above — Pontificia Università Lateranense, Pontificio Istituto Giovanni Paolo II and the
Pontificia Università San Tommaso d'Aquino (Angelicum). Art. 16 lists certain pontifical institutes
(Gregoriana, Biblico, Orientale, Archeologico, Seminario Russo, Collegio Lombardo, the two
Sant'Apollinare palaces, the San Giovanni e Paolo retreat house) as tax-exempt — **the Lateran
University and the Angelicum are not in that list**, so no immunity or exemption claim may be made
for them. Their own sites are reachable (§5.7).

---

## 5. Candidate register

Rione column: **A** = OSM polygon PIP, **B** = Nominatim `quarter`, blank = not separately probed.
Every entry is `"photos": []`.

### 5.1 The marquee subjects

| # | Name | Type | Address (sourced) | What / when / by whom | Rione evidence | Source URL |
|---|---|---|---|---|---|---|
| 1 | **Basilica di San Pietro in Vincoli** | church | Piazza di San Pietro in Vincoli 4/a, 00184 (OSM `addr:*`) | Holds Michelangelo's *Mosè* (OSM carries the statue as a separate `artwork` node, `wikipedia=it:Mosè (Michelangelo)`) | A=Monti; B=Monti, road "Piazza di San Pietro in Vincoli" | Overpass rel 5451988 sweep; Nominatim reverse 41.89387,12.49307 |
| 2 | **Mercati di Traiano — Museo dei Fori Imperiali** | museum + archaeological site | Via Quattro Novembre 94, 00187 (OSM) | Named "Mercati di Traiano" at its **rediscovery of 1926–1934**; built alongside the Forum of Trajan; six levels on the Quirinal slope; conservation and structural restoration **2005–2007**; **Museo dei Fori Imperiali inaugurated autumn 2007** | A=Monti; B=Monti, road Via Biberatica, 00184 | `https://www.turismoroma.it/it/luoghi/mercati-di-traiano-museo-dei-fori-imperiali`; site live at `https://www.mercatiditraiano.it/` |
| 3 | **Colonna Traiana** | monument | Foro Traiano (Nominatim road), 00187 | **Erected 113 AD**; devised by the architect **Apollodorus of Damascus**; ~40 m with base; 17 monolithic drums; internal spiral stair of **185 steps**; Trajan's ashes placed in the base, he died **8 August 117**; **1587** Sixtus V replaced the lost bronze statue with a St Peter | A=Monti; B=Monti | `https://www.turismoroma.it/it/luoghi/colonna-traiana` |
| 4 | **Foro di Traiano** | archaeological site | — | Part of the Fori Imperiali complex, 112 and 113 AD per the Comune's own dating table | A=Monti | `https://www.turismoroma.it/it/luoghi/area-archeologica-dei-fori-imperiali` |
| 5 | **Foro di Augusto** | archaeological site | — | **Inaugurated 2 BC**; Temple of Mars Ultor, white Carrara marble, 8 columns front / 7 sides, three remain on the south-east side; backed by a firewall of peperino, pietra gabina and travertine **up to 33 m high**, built to shield it from the Suburra's fires; the second opening is the **Arco dei Pantani** | A=Monti | `https://www.turismoroma.it/it/luoghi/foro-di-augusto` |
| 6 | **Foro di Nerva (Foro Transitorio)** | archaeological site | — | Built by **Domitian (81–96 AD)**, inaugurated by **Nerva in 97 AD**; occupies the strip the **Argiletum** ran through; two surviving columns known as *"le colonnacce"*; Temple of Minerva; behind it the horseshoe exedra **Porticus absidata** | A=**Campitelli** (41.89305,12.48617) — flagged, see §5.10 | `https://www.turismoroma.it/it/luoghi/foro-di-nerva` |
| 7 | **Domus Aurea** | archaeological site | Viale Serapide (Nominatim), 00184 | Begun by Nero after the **fire of 64 AD**; architects **Severus and Celer**, decorator **Fabullus/Famulus**; pavilions, gardens and an artificial lake in the valley where the Colosseum now stands; the *coenatio rotunda* octagonal hall | A=Monti; B=Monti | `https://www.turismoroma.it/it/luoghi/domus-aurea`. **NOTE: `colosseo.it` and `parcocolosseo.it` both timed out for me and `coopculture.it` returned 403** — no operator-side source obtained |
| 8 | **Terme di Traiano** | archaeological site | Colle Oppio | Designed by **Apollodorus of Damascus**; **dedicated by Trajan 109 AD**; over six hectares; overlies the Esquiline wing of the Domus Aurea and the Terme di Tito; plan reconstructed from remains found during the creation of the **Parco Traiano in the 1930s**, from **Forma Urbis Severiana** fragments and 16th–17th c. drawings | A=Monti; B not probed | `https://www.turismoroma.it/it/luoghi/terme-di-traiano` |
| 9 | **Terme di Tito** | archaeological site | south slope of Colle Oppio | **Dedicated 80 AD**; remains scant, but recorded in **Andrea Palladio's** drawings when still visible in the 1500s | A=Monti | `https://www.turismoroma.it/it/luoghi/terme-di-tito` |
| 10 | **Ludus Magnus** | archaeological site | Via Labicana (Nominatim), 00184 | Gladiatorial training school; named by Roma Capitale among Monti's archaeological areas open to the public (an editorial grouping on its tourism page — **not** a legal status of any kind) | A=Monti; B=Monti | `https://www.turismoroma.it/it/pagina/rione-i-monti` |
| 11 | **Torre delle Milizie** | tower | reached from the Salita del Grillo; Nominatim road Largo Magnanapoli, 00184 | ~50 m; construction «con ogni probabilità agli inizi del XIII secolo» by the **Conti di Segni**; passed to the Annibaldi, the Prefetti di Vico, Boniface VIII Caetani, back to the Conti until the 1600s; absorbed into the monastery of Santa Caterina a Magnanapoli, **isolated after 1910**; the **1348 earthquake** brought down the third storey and started the lean; now entered through the Mercati di Traiano | A=Monti; B=Monti | `https://www.turismoroma.it/it/luoghi/torre-delle-milizie` |
| 12 | **Torre del Grillo** | tower + palazzo | Piazza del Grillo | Also called *"della Miliziola"*; **built 1223** by the **Carboni** family on Trajanic remains; **bought 1675 by the del Grillo family** and absorbed into the left wing of their palazzo; they added the corbelled crown, the corner eagles and the inscription "EX MARCHIONE DE GRILLIS"; passed to the **Nicolis de Robilant** in the 1800s; after WWII housed **Renato Guttuso's** studio, whose hanging garden inspired *La visita della sera* (1980) and *Giardino di Palazzo del Grillo* (1981) | A=Monti | `https://www.turismoroma.it/it/luoghi/torre-del-grillo` |
| 13 | **Torre dei Capocci** | tower | Piazza di San Martino ai Monti | Built by the **Arcioni**, later the **Capocci**; upper brick section original, **late 12th century**, brick taken from the nearby Terme di Traiano; **36 m**, square plan, seven floors plus ground floor and terrace; surrounding houses demolished at the end of the 19th c., leaving the visible colour change at third-floor level; **"di proprietà del Comune di Roma, attualmente non visitabile all'interno"** | A=Monti | `https://www.turismoroma.it/it/luoghi/torre-dei-capocci` |
| 14 | **Torre dei Conti** | tower | Largo Corrado Ricci | Reduced almost to a ruin by the **1348 earthquake** (stated on the Torre delle Milizie page). A Sovrintendenza Capitolina page exists at `https://www.sovraintendenzaroma.it/content/torre-dei-conti` (HTTP 200) but I could not extract its body text past the site chrome | A=Monti | as noted |
| 15 | **Casa dei Cavalieri di Rodi** | historic house | **Piazza del Grillo 1** (OSM `addr:*`) | Named by Roma Capitale as one of Monti's principal monuments | A=Monti | `https://www.turismoroma.it/it/pagina/rione-i-monti`. **No per-place page found**: turismoroma, museiincomuneroma and sovraintendenzaroma all 404'd, and `casadeicavalieridirodi.it` does not resolve |
| 16 | **Suburra** | historic district / toponym | — | The Monti article's own history: in Roman times the low marshy part around the *Argiletum*, corresponding to today's **via Leonina and via Madonna dei Monti**, drained by the Cloaca Massima; the upper part ran to the *Vicus Patricius*, **today via Urbana**. The Forum of Augustus firewall exists specifically to shield the fora from it (§5.1 #5 — that is the Comune's own explanation, not Wikipedia's) | A=Monti (piazza della Suburra 41.89485,12.49385) | `https://it.wikipedia.org/wiki/Monti_(rione_di_Roma)` — **attribute to Wikipedia**; the firewall fact is separately sourced to turismoroma |
| 17 | **Basilica di Santa Maria Maggiore** | church, **Lateran Treaty extraterritorial (E3)** | Piazza di Santa Maria Maggiore, OSM `addr:postcode=00185`; Nominatim gives 00184 on the facade side | Roma Capitale: one of the four papal basilicas; the **5 August** snow-miracle commemoration; Arnolfo di Cambio's *Natività*; the **Sacra Culla** reliquary designed by **Giuseppe Valadier (1802)**; the two great chapels **Sistina and Paolina** raised by Sixtus V and Paul V between the late 16th and early 17th c.; the apse redesigned by **Carlo Rainaldi between 1670 and 1676**; nave mosaics of the **5th century**; ceiling from the time of **Alexander VI Borgia (1492–1503)**; apse-basin mosaic **signed by Iacopo Torriti, late 13th century** | **§3.3 — three methods say Monti; postcode says otherwise. UNRESOLVED.** | `https://www.turismoroma.it/it/luoghi/basilica-di-santa-maria-maggiore`; official site live at `https://www.basilicasantamariamaggiore.va/` (homepage 200; **`/it/basilica/` and `/it/contatti/` returned 403, `/it/orari/` 404** — I could not get hours) |
| 18 | **Basilica di San Giovanni in Laterano** | cathedral of Rome, **extraterritorial (E1)** | Piazza di San Giovanni in Laterano, 00184 (OSM) | Roma Capitale calls it «la cattedrale di Roma, madre di tutte le chiese di Roma e del mondo»; the basilica's own site carries the motto *"Mater et Caput Omnium Ecclesiarum"* | **§3.2 — CONTESTED (Monti vs Esquilino)** | `https://www.turismoroma.it/it/pagina/rione-i-monti`; `https://www.basilicasangiovanni.va/` (200) |
| 19 | **Battistero lateranense (San Giovanni in Fonte)** | baptistery | Piazza di San Giovanni in Laterano | **Built in the 4th c. by Constantine**, with the basilica, over a 1st-c. villa and a 2nd-c. bath building; **external frieze of 1657 with Chigi arms, by Francesco Borromini**; octagonal plan, eight porphyry columns with Corinthian capitals; the old portico **converted in 1054** into the chapels of Rufina & Seconda and Cipriano & Giustina, the latter with a **5th-c. mosaic**; wall paintings after **Andrea Sacchi**, and by **Andrea Camassei, Giacinto Gimignani, Carlo Maratta**; basalt font with bronze cover by **Ciro Ferri (1634–1689)**; bronze deer placed **1967** by the pope | **§3.2 — CONTESTED** | `https://www.turismoroma.it/it/luoghi/battistero-lateranense` |
| 20 | **Palazzo del Laterano** | palace, **extraterritorial (E2)** | Piazza di San Giovanni in Laterano | The building the **Lateran Pacts were signed in, 11 February 1929** — the Pacts «presero il nome del Palazzo di San Giovanni in Laterano in cui furono firmati» | **§3.2 — CONTESTED** | `https://it.wikipedia.org/wiki/Patti_Lateranensi` (attribute); signature date corroborated by the treaty text at vatican.va |
| 21 | **Scala Santa e Sancta Sanctorum** | sanctuary, **extraterritorial (E4, inferred — §4)** | **Piazza di San Giovanni in Laterano 14, 00184** (its own site) | Pontifical sanctuary run by the **Passionists**, «Chiamati nel 1854 da Pio IX» — called there by Pius IX in 1854 | **A=Esquilino, B=Esquilino** — probably NOT a Monti page | `https://www.scala-santa.com/` and `/dove-siamo/` |
| 22 | **Obelisco Lateranense** | obelisk | Piazza di San Giovanni in Laterano | Red Aswan granite; **32.18 m**, **45.70 m** with cross and base; **455 tonnes**; made under **Thutmose III and Thutmose IV, 15th c. BC**; moved by **Constantine** down the Nile to Alexandria, the transport interrupted by his death in **337** | A=Monti | `https://www.turismoroma.it/it/luoghi/obelisco-lateranense`. **The page's superlatives ("il più alto… nel mondo", "il più antico di Roma") are NOT publishable — §7.2** |
| 23 | **Obelisco Esquilino (Liberiano)** | obelisk | Piazza dell'Esquilino | **14.75 m**, **25.53 m** with base; red Aswan granite; uninscribed, so undatable; originally paired with the **Obelisco Quirinale** at the entrance to the **Mausoleum of Augustus**; found in four pieces in the 16th c. near San Rocco on via di Ripetta; **erected 1587** under **Sixtus V** to a design by **Domenico Fontana** | A=Monti; and the page itself says «nel Rione Monti» | `https://www.turismoroma.it/it/luoghi/obelisco-esquilino` |

### 5.2 Civil architecture

| # | Name | Address | Sourced facts | Rione | Source |
|---|---|---|---|---|---|
| 24 | **Palazzo delle Esposizioni** | **Via Nazionale 194, 00184** (OSM + Nominatim `house_number=194`) | Its own site states «Il Palazzo fu inaugurato il **21 gennaio 1883**». Houses a bookshop, a **24-desk** study room, a café and a restaurant, per the same site | A=Monti; B=Monti | `https://www.palazzoesposizioni.it/` (200); `/it/dove-siamo` and `/contatti` return 200 and confirm CAP 00184 |
| 25 | **Palazzo del Viminale** | Piazza del Viminale 1 | Conceived by **Giovanni Giolitti**; **1911** ministerial decree gave the design to **Manfredo Manfredi**; definitive project approved **15 October 1912** by the Ministero dei Lavori Pubblici at a total cost of **8 million**, confirmed **23 October 1912** by the Consiglio di Stato; **inaugurated 9 July 1925**; five storeys. Seat of the **Ministero dell'Interno** (`interno.gov.it` live, 200) | A=Monti; B=Monti | `https://www.turismoroma.it/it/luoghi/palazzo-del-viminale` |
| 26 | **Palazzo della Consulta** | Piazza del Quirinale | Early-16th-c. palace "del cardinale di Vercelli", bought by **Sixtus V (1585–90)** for the Tribunale della Sacra Consulta; **completely rebuilt for Clement XII by Ferdinando Fuga between 1732 and 1734**; construction destroyed the remains of the **Terme di Costantino** | A=Monti per PIP — **but it fronts piazza del Quirinale, which is the Monti/Trevi line (§3.4). FLAG.** | `https://www.turismoroma.it/it/luoghi/palazzo-della-consulta` |
| 27 | **Palazzo Pallavicini Rospigliosi** | **Via Ventiquattro Maggio 43, 00187** (OSM) | Built for **Cardinal Scipione Borghese** in the early 1600s on the site of the **Terme di Costantino**; **Flaminio Ponzio**, then **Carlo Maderno**; garden and nymphaeum by the Fleming **Giovanni Vasanzio**; later Altemps, Bentivoglio, Lante | A=Monti | `https://www.turismoroma.it/it/luoghi/palazzo-pallavicini-rospigliosi` |
| 28 | **Palazzo Koch** | **Via Nazionale 91, 00184** (OSM, via the two Banca d'Italia libraries at that address) | **1882**, architect **Gaetano Koch**; head office of the **Banca d'Italia**, whose site advertises *"Visite a Palazzo Koch"* | A=Monti | it.wikipedia Monti article (attribute); `https://www.bancaditalia.it/` (200) for the bank and the visits |
| 29 | **Palazzo Brancaccio** | Via Merulana; OSM near 286, Nominatim CAP **00185** | **1886–1912**, architect **Luca Carimini**; the Monti article notes it was the former seat of the Museo nazionale d'arte orientale G. Tucci, **now moved to EUR** | A=Monti; B=Monti but with the Esquilino CAP — **FLAG, same pattern as SMM and Brancaccio theatre** | it.wikipedia Monti article (attribute) |
| 30 | **Palazzo del Grillo** | Piazza del Grillo | 17th century | A=Monti | it.wikipedia (attribute); corroborated by the turismoroma Torre del Grillo page |
| 31 | **Villa Aldobrandini** | entered from **via Mazzarino**, by a steep stair | A hanging garden inside retaining walls near via Nazionale and via Quattro Novembre; **1566** Mons. Giulio Vitelli bought a vineyard at Monte Magnanapoli; restoration by **Carlo Lambardi**; **1600** sold to **Clement VIII**, given the following year to his nephew **Cardinal Pietro Aldobrandini**; **Giacomo Della Porta** added stairs, loggias and a continuous garden facade; the art collection was left to the cardinal in **1598** by **Lucrezia d'Este**; the opening of via Nazionale after **1870** drastically cut the grounds | A=Monti; B=Monti | `https://www.turismoroma.it/it/luoghi/villa-aldobrandini` |
| 32 | **Palazzo Cimarra** | via Cimarra | — | A=Monti | it.wiki category |
| 33 | **Palazzo Silvestri-Rivaldi** | near via dei Fori Imperiali | — | A=Monti | it.wiki category |
| 34 | **Palazzo Imperiali Borromeo** | via Merulana area | — | A=Monti | it.wiki category |
| 35 | **Palazzo Giorgioli** | — | — | A=Monti | it.wiki category |
| 36 | **Palazzo Passarini Falletti** | via Panisperna | 17th century | A=Monti | it.wikipedia Monti article |
| 37 | **Palazzo Borgia** | piazza di San Francesco di Paola | — | A=Monti | it.wikipedia Monti article |
| 38 | **Villa Sforza ai Quattro Cantoni** | — | **Built 1620–1634**; now the Lazio/Abruzzo territorial directorate of the **Agenzia delle Dogane e dei Monopoli** | A=Monti | it.wikipedia Monti article. **§7.1 — a designation claim on this building has been stripped** |
| 39 | **Casa Bernini** | — | — | A=Monti | it.wiki category |
| 40 | **Palazzo dell'ISTAT** | **Via Cesare Balbo 16** area | **1931**; seat of ISTAT | A=Monti | it.wikipedia Monti article (attribute); `https://www.istat.it/it/contatti` live (200) |
| 41 | **Istituto Leonardo da Vinci** | via Cavour | **1899** | A=Monti | it.wikipedia Monti article |

### 5.3 Churches — standing and in use

Method A put all of these in Monti unless noted. Where I have no per-place source beyond the
Wikipedia list, I say so; those need a fetch before publication.

| # | Name | Address / note | Sourced facts | Source |
|---|---|---|---|---|
| 42 | **Chiesa di Santa Maria ai Monti** | Via Madonna dei Monti | Built **from 1580** by **Giacomo Della Porta** for **Gregory XIII** on the site of a 13th-c. Clarissan monastery, after a blind woman's cure attributed to an icon found there; facade modelled on **the Gesù**, by the same architect; single nave; vault *Ascensione* by **Cristoforo Casolani** (early 17th c.); stucco angels of **1588** by **Ambrogio Buonvicino**; high-altar Virgin and Child with SS Stephen and Lawrence, **early 15th c.** | `https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-ai-monti` |
| 43 | **Basilica di San Clemente al Laterano** | **Via Labicana 95, 00184** (OSM) | «eretta prima del 385»; two superimposed churches over Republican-era Roman buildings and a **Mithraeum**; lower church wrecked in the **1084** sack by Robert Guiscard; upper church built **1108** by **Paschal II**; restructured under **Clement XI** by **Carlo Fontana**, who made the Baroque facade and reused ancient granite columns in the arcaded portico; bell tower late 17th–early 18th c. | `https://www.turismoroma.it/it/luoghi/basilica-di-san-clemente`. **STRADDLER §3.4.** The scoping wave separately confirmed `basilicasanclemente.com` reachable |
| 44 | **Mitreo di San Clemente** | under #43 | separate it.wiki article and OSM record | it.wiki category; PIP=Monti |
| 45 | **Basilica dei Santi Silvestro e Martino ai Monti** | OSM `addr` **Viale del Monte Oppio 28, 00185** | Title traced to the **4th century**; a first church attributed to a **3rd-century** *Equizio*; entrusted to the **Carmelites by Boniface VIII in 1299** with the adjoining convent, on condition they set up a house of study (the page also says 1229 in its opening line — **the page contradicts itself on the date, 1229 vs 1299; do not carry either without a second source**) | `https://www.turismoroma.it/it/luoghi/basilica-dei-santi-silvestro-e-martino-ai-monti`. **REJECT the website OSM lists for it — §7.3** |
| 46 | **Basilica di Santa Prassede** | protiro on via di San Martino ai Monti | Built in the **9th c. by Paschal I**; open atrium preserving colonnade remains of the palaeochristian basilica; interior originally three naves on **sixteen granite columns**; porphyry disc over a well in the pavement; the **Cappella di San Zenone**, made by Paschal I as a monumental tomb | `https://www.turismoroma.it/it/luoghi/basilica-di-santa-prassede`. **§3.5 — this page misstates the rione as Esquilino** |
| 47 | **Sacello di San Zenone** | inside #46 | separate it.wiki article | it.wiki category; PIP=Monti |
| 48 | **Basilica di Santa Pudenziana** | Via Urbana | — no per-place official source obtained; turismoroma 404 | it.wiki category; PIP=Monti; Nominatim=Monti. **REJECT `santapudenziana.org` — §7.3** |
| 49 | **Basilica di Santo Stefano Rotondo al Celio** | OSM `addr` **Via Santo Stefano Rotondo 7, 00184** | — turismoroma 404 | **STRADDLER §3.4**; A=Monti, B=Monti |
| 50 | **Basilica di San Vitale** (SS Vitale e Compagni Martiri in Fovea) | via Nazionale | — | it.wiki category; OSM node inside Monti. No Wikipedia coordinate available |
| 51 | **Chiesa di Sant'Agata dei Goti** | via Mazzarino | — | PIP via OSM node; Nominatim at 41.89606,12.48930 → `quarter=Monti`, road Via Panisperna. **The site OSM lists (`confrades.com`) resolves but is a one-line Stimmatini page with no address — weak** |
| 52 | **Chiesa di Sant'Andrea al Quirinale** | **Via del Quirinale 30, 00187** (OSM + its own site) | Jesuit church. **Its own site publishes hours: martedì–domenica 9.00–12.00, 15.00–18.00, lunedì chiuso** | `https://santandrea.gesuiti.it/` (200). A=Monti, B=Monti — **but it fronts via del Quirinale, a boundary street. FLAG.** |
| 53 | **Chiesa di San Carlo alle Quattro Fontane ("San Carlino")** | Via del Quirinale | Church and convent given by the **Spanish Trinitarians to Francesco Borromini**, who worked on it **1638–1642**, resumed later and **died in 1667** leaving the front under construction; the concave-convex facade is his last work; **statue of St Charles Borromeo by Antonio Raggi**; oval interior on a giant order of composite columns | `https://www.turismoroma.it/it/luoghi/chiesa-di-san-carlo-alle-quattro-fontane`. A=Monti, B=Monti. **Ignore the 00817 postcode — §3.6** |
| 54 | **Chiostro del Borromini** | with #53 | separate OSM record inside Monti | Overpass sweep |
| 55 | **Cattedrale dei Santi Sergio e Bacco degli Ucraini** | Piazza Madonna dei Monti area (OSM "Santi Sergio e Bacco in Suburra") | Ukrainian Greek Catholic cathedral | it.wiki category; PIP=Monti. **`ukrainianchurch.it` does not resolve** |
| 56 | **Chiesa di San Francesco di Paola** | piazza di San Francesco di Paola | Above it the Loggia Borgia and the Arco della Suburra | it.wikipedia Monti article; PIP=Monti |
| 57 | **Chiesa di Santa Lucia in Selci** | via in Selci | A *diaconia* attested from the **5th century**, with its attached monastery; via in Selci follows the ancient *Vicus Suburranus* | it.wikipedia Monti article |
| 58 | **Chiesa di Santa Caterina a Magnanapoli** | Largo Magnanapoli | Its monastery absorbed the Torre delle Milizie until after 1910 | turismoroma Torre delle Milizie page; PIP=Monti |
| 59 | **Chiesa dei Santi Domenico e Sisto** | Largo Angelicum | Church of the Angelicum complex | it.wiki category; PIP=Monti |
| 60 | **Chiesa dei Santi Quirico e Giulitta** | Via Tor de' Conti | Houses the presepio museum (#84) | it.wikipedia Monti article |
| 61 | **Chiesa di San Bernardino in Panisperna** | via Panisperna | — | it.wiki category; PIP=Monti |
| 62 | **Chiesa di San Lorenzo in Panisperna** | via Panisperna | — | it.wiki category; PIP=Monti |
| 63 | **Chiesa di San Lorenzo in Fonte** | via Urbana | — | it.wiki category; PIP=Monti |
| 64 | **Chiesa di San Salvatore ai Monti** | — | — | it.wiki category; PIP=Monti |
| 65 | **Chiesa di Santa Maria del Buon Consiglio** | OSM `addr` **Via del Buon Consiglio 19, 00184** | — | Overpass sweep; PIP=Monti |
| 66 | **Chiesa di Santa Maria della Neve al Colosseo** | — | — | it.wiki category; PIP=Monti |
| 67 | **Chiesa di Gesù Bambino all'Esquilino** (OSM: "del Bambin Gesù a via Urbana") | via Urbana | Name says Esquilino, PIP says Monti — **minor flag** | it.wiki category; PIP=Monti |
| 68 | **Chiesa di San Giuseppe di Cluny** | — | — | it.wiki category; PIP=Monti |
| 69 | **Chiesa dei Santi Gioacchino e Anna ai Monti** | — | — | it.wiki category; PIP=Monti |
| 70 | **Chiesa dei Santi Marcellino e Pietro al Laterano** | — | — | PIP=Monti; **Lateran-adjacent, see §3.2** |
| 71 | **Chiesa di Sant'Anna al Laterano** | — | — | PIP=Monti; **Lateran-adjacent** |
| 72 | **Chiesa dei Santi Andrea e Bartolomeo** | — | — | PIP=Monti; **Lateran-adjacent** |
| 73 | **Chiesa di San Giovanni Battista dei Cavalieri di Rodi** | with #15, Piazza del Grillo | — | it.wiki category; PIP=Monti |
| 74 | **Chiesa evangelica battista ai Monti** | OSM `addr` **Via Urbana 153, 00184** | The rione's Baptist church — a non-Catholic candidate worth carrying for contrast | Overpass sweep; PIP=Monti |
| 75 | **Cappella di San Benedetto Giuseppe Labre ai Monti** | OSM `addr` **Via dei Serpenti 2, 00184** | — | Overpass sweep; PIP=Monti |
| 76 | **Cappella della Mater Boni Consilii** | — | — | it.wiki category; PIP=Monti |
| 77 | **Oratorio del Preziosissimo Sangue** | — | — | it.wiki category; PIP=Monti |
| 78 | **Convento di Sant'Antonio Abate** | — | — | it.wiki category; PIP=Monti |
| 79 | **Casa provinciale delle Piccole sorelle dei poveri** | — | — | it.wiki category; PIP=Monti |
| 80 | **Chiesa dei Santi Gioacchino e Anna alle Quattro Fontane** | — | **Deconsecrated** | it.wikipedia Monti article, citing `https://www.diocesidiroma.it/phpenti/ente/?ID=934`. diocesidiroma.it is live (200) and has a `Ricerca Enti` and a `Stradario Parrocchie` — **an unexploited per-church source a verifier should mine** |

### 5.4 Deconsecrated and vanished churches — a set I would NOT defend individually

The Wikipedia category and article carry **five deconsecrated** and **seventeen vanished** churches
in Monti. I am listing the set rather than 22 separate rows, because for most of them nothing stands
and I have no source beyond the Wikipedia list.

- **Deconsecrated (5):** Santi Gioacchino e Anna alle Quattro Fontane (#80 above), Oratorio della
  Santissima Vergine Addolorata, Santa Maria in Carinis, San Paolo primo eremita, Santa Maria
  Annunziata delle Turchine.
- **Vanished (17):** San Basilio al Foro di Augusto (the Comune's Foro di Augusto page independently
  confirms this one — «In epoca medievale, il podio del tempio venne occupato dalla chiesa di San
  Basilio, ora scomparsa» — so it has a real source and could carry as a *fact about the Forum*
  rather than as a place), San Bernardo della Compagnia, San Dionisio alle Quattro Fontane,
  Sant'Eufemia al Foro Traiano, Santa Maria delle Lauretane, Santa Maria Maddalena al Quirinale,
  Santa Chiara al Quirinale, Sant'Urbano a Campo Carleo, Santa Maria in Campo Carleo, Santa Maria in
  Macello Martyrum, San Lorenzo ai Monti, San Salvatore ad Tres Images, Santa Maria della Sanità,
  Santa Maria della Concezione ai Monti, Cappella del Santissimo Sacramento delle Zitelle Mendicanti,
  Oratorio di Santa Maria della Concezione dei Sacconi Turchini, Santa Maria della Purificazione in
  Via Merulana.

**San Salvatore ad Tres Images has one durable trace**: piazza della Suburra carries an inscription
recording the *edicola di San Salvatore delle tre immagini ai Monti* (it.wikipedia Monti article,
attributed). That is a legible thing in the street and is the only one of the seventeen I would argue
for.

Counted as **1 candidate slot** in the headline total, not 22.

### 5.5 The street shrines (edicole e immagini sacre) — 34 of them

The Monti article lists **34** Madonna shrines and one Christogram by street and house number, e.g.
«Madonna su via Baccina 51», «Cristogramma su via Urbana 50a», «Madonna su via del Boschetto 125»,
and one «sulla volta della rampa della salita di via di san Francesco di Paola sotto palazzo Borgia».
The Sovrintendenza Capitolina publishes an **Edicole Sacre** category in its Patrimonio menu
(`https://www.sovraintendenzaroma.it/`), which is the right source for these — **but I could not
establish its per-item URL pattern and every path I guessed 404'd**, the same failure the scoping
wave hit.

Counted as **1 candidate slot**. Treating them as 34 pages would be indefensible on current sourcing;
treating them as one guide subject ("the shrines of Monti") is arguable.

### 5.6 Archaeology and antiquities beyond the marquee list

| # | Name | Rione | Source |
|---|---|---|---|
| 81 | **Cisterna delle Sette Sale** | A=Monti | it.wiki category; OSM `ruins` |
| 82 | **Basilica Ulpia** | A=Monti | it.wiki category + OSM `tourism=attraction` |
| 83 | **Porticus absidata** | A=Monti | it.wikipedia; corroborated by the Comune's Foro di Nerva page |
| 84 | **Tempio di Minerva (Foro Transitorio)** | A=Monti | it.wiki category |
| 85 | **Tempio di Iside e Serapide a via Labicana** | A=Monti | it.wiki category |
| 86 | **Colosso di Nerone (site of)** | A=**Celio** — flagged | it.wiki category; PIP 41.89111,12.49139 |
| 87 | **Ninfeo di Nerone** | A=**Celio** — flagged | it.wiki category |
| 88 | **Magazzini di Lucio Nevio Clemente** | A=Monti | it.wiki category |
| 89 | **Colle Oppio** (the hill) | A=Monti | it.wiki category |
| 90 | **Viminale** (the hill) | A=Monti; B=Monti | it.wiki category |
| 91 | **Arco dei Pantani** | A=Monti | turismoroma Foro di Augusto page — named there as the travertine single-span opening in the firewall |
| 92 | **Domus di Lucio Licinio Sura** | A=Monti | OSM-only, `historic=archaeological_site` |
| 93 | **Equus Traiani** | A=Monti | OSM-only, `wikipedia=it:Statua equestre di Traiano` |
| 94 | **Ninfeo degli Annibaldi** | A=Monti | OSM-only |
| 95 | **Acquedotto Neroniano (Monti stretch)** | A=Monti | OSM-only, `historic=ruins` |
| 96 | **Aula del Colosso** (Foro di Augusto) | A=Monti | turismoroma Fori Imperiali page — housed the colossal Genius of Augustus, remains now in the Museo dei Fori Imperiali |
| 97 | **Torre degli Annibaldi** | A=Monti | it.wikipedia Monti article, via del Fagutale |
| 98 | **Torre dei Graziani** | A=Monti | it.wikipedia Monti article, via Giovanni Lanza |
| 99 | **Porta Asinaria** | A=Monti | Full turismoroma page: originally a single-arch gate between two square towers carrying the **Via Asinaria**; monumentalised in the early **5th c. by Honorius (395–423)** with two semicircular towers and a travertine-faced arch, an inner counter-gate and guard court, height nearly doubled to four storeys in the towers; **Belisarius entered by it in 536**, Totila ten years later, and Henry IV during the sack |
| 100 | **Porta Metronia** | A=Monti; Celio concedes it (§3.4) | Full turismoroma page: a plain single unornamented arch cut in the brick curtain, a *posterula* of the third order, never monumentalised unlike the Pinciana or Asinaria; **in 1122 Callixtus II** routed the **Acqua Mariana** through it and it was closed to people and goods, becoming a fortified water gate |
| 101 | **Porta San Giovanni** | **AMBIGUOUS — §3.6** | OSM `historic=city_gate` |

### 5.7 Museums, theatres, institutions

| # | Name | Address | Facts | Source |
|---|---|---|---|---|
| 102 | **Museo dei Fori Imperiali** | Via Quattro Novembre 94, 00187 | see #2 | `mercatiditraiano.it` (200) |
| 103 | **Museo storico della fisica e Centro studi e ricerche "Enrico Fermi" (CREF) / Museo Enrico Fermi** | **Registered office and post: Via Panisperna 89a, 00184. Visitor entrance: piazza del Viminale 1, 00184** — both stated on its own museum site | The building of the *ragazzi di via Panisperna*. The CREF describes itself as having a double nature, research centre and historical museum. **This resolves a real conflict:** the Wikipedia Monti article puts the museum "su piazza del Viminale", OSM puts it at Via Panisperna 89a — **both are right, for different doors**, and only the institution's own site says so | `https://museum.cref.it/`; `https://www.centrofermi.it/` |
| 104 | **Museo tipologico internazionale del presepio "Angelo Stefanucci"** | inside the church of SS Quirico e Giulitta, Via Tor de' Conti | Own site live | `https://www.museopresepioroma.it/` (200) |
| 105 | **Museo Vite di IMI** (Museo degli Internati Militari Italiani) | **Via Labicana 15a, 00184** (OSM) | Own site live: a historical-educational route on the *"resistenza senza armi"* of the Italian Military Internees, **1943–1945**; rooms include *8 settembre*, *La cattura e il viaggio*, *Il campo: l'internamento*, *Il lavoro coatto*, *La liberazione e il rimpatrio*, *Il Cortile della Memoria* | `https://www.museovitediimi.it/` (200). **OSM-only find; not in the Wikipedia category under this name** |
| 106 | **Museo del Tesoro Lateranense** | Lateran complex | Own pages under `basilicasangiovanni.va` | Overpass sweep; **inherits the §3.2 contest** |
| 107 | **Museo Storico Liberiano** / Polo Museale di Santa Maria Maggiore | Santa Maria Maggiore | The basilica's own site has a `Polo Museale` section covering `Museo`, `Scavi Archeologici`, the *Loggia delle Benedizioni*, the facade mosaic and the *Sala Capitolare e "Scala del Bernini"* | `https://www.basilicasantamariamaggiore.va/`; Overpass. **Inherits §3.3** |
| 108 | **Museo storico vaticano** | inside the Palazzo del Laterano | it.wiki category places it in Monti; no coordinate returned by the API | it.wiki category. **Inherits §3.2** |
| 109 | **Museo dell'Istituto centrale per il restauro e la conservazione del patrimonio archivistico e librario** (ex Patologia del libro "Alfonso Gallo") | **Via Milano 76, 00184** (OSM) | — | it.wiki category + Overpass; PIP=Monti |
| 110 | **Museo della Banconota** (Banca d'Italia) | Via Nazionale | Bank site live; museum page 404'd for me | it.wikipedia Monti article |
| 111 | **Museo di idraulica** | Via Eudossiana, DICEA, Sapienza | — | it.wikipedia Monti article |
| 112 | **Museo di San Giovanni in Laterano** | piazza San Giovanni in Laterano | — | it.wikipedia Monti article. **Inherits §3.2** |
| 113 | **Museo Spazio Field** | Palazzo Brancaccio, via Merulana | Successor occupant to the oriental-art museum | it.wikipedia Monti article. **`spaziofield.it` timed out on two attempts and `museospaziofield.it` does not resolve — no official source obtained** |
| 114 | **Museo Leonardo da Vinci** (IIS Leonardo da Vinci) | via Cavour | — | it.wikipedia Monti article |
| 115 | **Museo della casa generalizia delle suore oblate del Bambino Gesù** | via Cavour | — | it.wikipedia Monti article |
| 116 | **Vespa Museum** | 41.89350, 12.48915 | **OSM-only, `tourism=museum`, no address, no website tag.** Included deliberately as a thin-tail case: I could not verify it exists | Overpass sweep only |
| 117 | **Teatro Brancaccio** | **Via Merulana 244, 00185** (OSM) | Built on the terrace of the Palazzo Field-Brancaccio gardens to a design by **Luca Carimini**, executed by **Carlo Sacconi**, **opened early 1916 as the Teatro Morgana**, renamed Brancaccio in the later 1930s; hall of **over 1,300 seats**; housed the **Fondazione dell'Opera di Roma 1985–2000**, then directors **Gigi Proietti to 2007**, **Maurizio Costanzo to 2010**, Stage Entertainment Italia to 2012, **Alessandro Longobardi from September 2012** | `https://www.turismoroma.it/it/luoghi/teatro-brancaccio`. **§3.5 — that page misstates the rione. `teatrobrancaccio.it` returns 403 to me** |
| 118 | **Teatro dei Dioscuri al Quirinale** | 41.89991, 12.48925 | OSM-only; PIP=Monti | Overpass sweep |
| 119 | **Teatro Drammatico Nazionale** | 41.89726, 12.48539 | PIP=**Trevi** — flagged | it.wiki category |
| 120 | **Pontificia Università Lateranense** | Lateran | `pul.va` reachable only past an SSL certificate-chain failure in my environment; the Biblioteca Beato Pio IX is tagged in OSM with `https://www.pul.va/biblioteca/` | Overpass; **inherits §3.2**; **§4 — no Art. 16 exemption claim may be made** |
| 121 | **Pontificia Università San Tommaso d'Aquino (Angelicum)** | Largo Angelicum | Own site live and self-describes as *"Pontifical University of Saint Thomas Aquinas – Angelicum"* with a "Rome Location" page | `https://www.angelicum.it/` (200) |
| 122 | **Pontificio Istituto Teologico Giovanni Paolo II** | — | Own site live, full title *"per le Scienze del Matrimonio e della Famiglia – Sede Centrale"* | `https://www.istitutogp2.it/` (200) |
| 123 | **Complesso ospedaliero San Giovanni-Addolorata** | Lateran area | PIP=Monti | it.wiki category. **`hsangiovanni.roma.it` failed SSL verification for me** |
| 124 | **Ospedale delle Donne** | 41.88739, 12.50378 | PIP=Monti | it.wiki category |
| 125 | **Liceo scientifico statale Camillo Cavour** | — | PIP=Monti | it.wiki category |
| 126 | **Sapienza engineering libraries at San Pietro in Vincoli** | **Via Eudossiana 18** and **Via delle Sette Sale 12b, 00184** (OSM `addr:*` + university URLs) | Four separate libraries tagged in OSM. Marginal as guide subjects; included as tail | Overpass sweep |

### 5.8 Streets, piazze and public space

Roma Capitale's perimeter (§3.1) is the authority for which of these are boundary lines.

| # | Name | Facts | Rione | Source |
|---|---|---|---|---|
| 127 | **Via dei Serpenti**, **Via del Boschetto**, **Via Urbana**, **Via Leonina**, **Via Madonna dei Monti**, **Via Panisperna**, **Via degli Zingari**, **Via Baccina**, **Via in Selci**, **Salita dei Borgia**, **Vicolo delle Carrette**, **Via Magnanapoli**, **Via degli Annibaldi**, **Via Alessandrina** | The article gives real content for several: **via in Selci** follows the *Vicus Suburranus*, its name from the ancient paving stones found during works; **salita dei Borgia** runs partly on what is believed to be the *Vicus sceleratus*; **vicolo delle Carrette** survives from a piazza and street where the carts bringing wine and food from the Castelli waited near the Forum market; **via Magnanapoli** is said to be a corruption of *Balnea Napoli*; **via degli Annibaldi** and its neighbours are named for the families with fortified houses and towers there | A=Monti (probed: via dei Serpenti mid, piazza Madonna dei Monti) | `https://it.wikipedia.org/wiki/Monti_(rione_di_Roma)` — **attribute to Wikipedia** |
| 128 | **Via Cavour** | Opened at the end of the 19th c. to link the Esquiline to piazza Venezia through the Suburra valley | A=Monti; B=Monti (Cavour metro, 41.89500,12.49361, `house_number=197`) | it.wikipedia (attribute) |
| 129 | **Via Nazionale** | «istituita il **30 novembre 1871**», originally joining piazza Venezia to piazza dell'Esedra, **renamed piazza della Repubblica in 1953** | A=Monti | it.wikipedia (attribute). The Villa Aldobrandini page independently confirms via Nazionale was opened after 1870 and cut the villa's grounds |
| 130 | **Via dei Fori Imperiali** | Opened **1932** as via dell'Impero; the entire 16th-century quarter behind it, centred on **via Alessandrina**, was demolished for it; excavations from the late 1990s have brought back both imperial-age construction and the foundations of those demolished buildings | A=Monti | it.wikipedia (attribute) |
| 131 | **Via Merulana**, **Via Labicana**, **Largo Brancaccio** | via Merulana links Santa Maria Maggiore to San Giovanni in Laterano and follows the line of the 16th-c. via Gregoriana; **via Labicana opened 1893**; largo Brancaccio named for the 1896 palazzo | via Merulana is a **boundary street** per §3.1 | it.wikipedia (attribute) |
| — | **Piazze**: Largo Angelicum, Largo Magnanapoli, Piazza del Grillo, Piazza Esquilino, Piazza Iside, Piazza Madonna dei Monti, Piazza della Navicella, Piazza di Porta San Giovanni, Piazza San Clemente, Piazza San Francesco di Paola, Piazza San Giovanni in Laterano, Piazza San Martino ai Monti, Piazza San Pietro in Vincoli, Piazza della Suburra, Piazza del Viminale, Piazza degli Zingari (16) — plus **Piazza del Quirinale**, straddler §3.4 | | | it.wikipedia Monti article |
| — | **Fontana dei Catecumeni**, piazza della Madonna dei Monti; **Fontana di piazza del Viminale**; **Quattro Fontane** (PIP=**Trevi**, flagged) | | | it.wiki category |
| — | **Parco del Colle Oppio** and **Parco di Traiano** | Both tagged `leisure=park` inside Monti. The Comune's Terme di Traiano page dates the *Parco Traiano* works to the 1930s | A=Monti; B=Monti at 41.89267,12.49422 | Overpass sweep; turismoroma |

### 5.9 OSM-only finds the Wikipedia category does not carry

Recorded separately because they are the evidence that a Wikipedia-category-only sweep undercounts:
**Museo Vite di IMI**, **Vespa Museum**, **Museo del Tesoro Lateranense**, **Museo Storico
Liberiano**, **Teatro dei Dioscuri al Quirinale**, **Piccolo Eliseo**, **Chiostro del Borromini**,
**Mercato di Monti**, **Parco di Traiano**, **Domus di Lucio Licinio Sura**, **Ninfeo degli
Annibaldi**, **Acquedotto Neroniano**, **dolceVita Gallery**, plus an unnamed `amenity=marketplace`
tagged **"Mercato riomale"** (sic — misspelling of *rionale*) at 41.89471, 12.48911, which I could
not identify and would not publish.

Also **the Sapienza engineering libraries** and the **Banca d'Italia libraries** (Biblioteca Paolo
Baffi and Biblioteca giuridica Pietro De Vecchis, both Via Nazionale 91, 00184).

### 5.10 Places in the Monti Wikipedia category that my boundary work puts OUTSIDE Monti

**This is the most useful list in the file for the arbitrator.** The Italian Wikipedia category
`Categoria:Roma R. I Monti` over-collects. Every one of these is filed under Monti by Wikipedia and
falls outside the Monti polygon:

| Place | PIP result | Note |
|---|---|---|
| **Villa Celimontana** | Celio | Celio's own article lists it in its own monuments |
| **Celio (zona di Roma)** | Celio | the zone itself |
| **Casino Fini** | Celio | |
| **Colosso di Nerone** | Celio | |
| **Ninfeo di Nerone** | Celio | |
| **Piazza del Colosseo** | Celio | but the **Colosseo metro station** node → Monti by PIP and **Celio** by Nominatim — the two methods split on the station |
| **Foro di Nerva** | Campitelli | and yet Roma Capitale's Monti page and the Monti article both claim it. **Real conflict, #6 above** |
| **Tempio della Pace** | Campitelli | |
| **Via del Teatro di Marcello** | Campitelli | |
| **Zona archeologica (zona di Roma)** | Campitelli | |
| **Piazza del Quirinale** | Trevi | straddler §3.4 |
| **Quattro Fontane** | Trevi | |
| **Via Quattro Novembre** | Trevi | **but the Museo dei Fori Imperiali's OSM address is Via Quattro Novembre 94** — the museum entrance may be on the Trevi side of a Monti monument. **FLAG** |
| **Via delle Quattro Fontane** | Trevi | a boundary street per §3.1 |
| **Teatro Drammatico Nazionale** | Trevi | |
| **Chiesa di San Lorenzo in Palatio ad Sancta Sanctorum** | Esquilino | = the Sancta Sanctorum, §3.2 |
| **Oratorio di San Silvestro in Palatio** | Esquilino | Lateran complex |
| **Oratorio del Santissimo Sacramento al Laterano** | Esquilino | Lateran complex |
| **Chiesa di San Matteo in Merulana** | Esquilino | east side of via Merulana |

Nine further category titles returned **no coordinate** from the MediaWiki API and could not be
tested at all: Basilica di San Vitale, Castra Nova equitum singularium, Chiesa di San Bernardo della
Compagnia, Chiesa di Sant'Agata dei Goti, Domus Aurea (vestibolo e stagno), Museo storico vaticano,
Pontificia università "San Tommaso d'Aquino", Pontificio istituto Giovanni Paolo II, Via Labicana.

### 5.11 Commercial and everyday candidates

Thin by design, and I want to be explicit that I did not go hunting for restaurants — the corpus rule
means a bar's own site establishes its address and nothing else, which makes most of them poor
candidates. Two survived a fetch:

| # | Name | Address from its own site | What the site does and does not establish |
|---|---|---|---|
| 132 | **Mercato Monti Urban Market** | **Via Leonina 46/48, 00184 Roma RM** | Its own homepage carries the strapline *"Urban Market Since 2009"*. **Publishable: name, address. NOT publishable from this source: that it has run since 2009** — that is a "how long it has traded" claim and the corpus rule bars it from a self-published site. Nominatim at that block returns `quarter=Monti`. `https://www.mercatomonti.com/` |
| 133 | **Ai Tre Scalini** | **Via Panisperna 249/251, 00184 Roma** | Site is live and states the address twice, and describes itself as *"Roma – Rione Monti"* — a rare case of a business naming its rione, which the scoping wave found institutional sites never do. **NOT publishable: its own copy about the American vine on the facade is fine as description, but any "authentic", "celebre" framing is the site's marketing.** `https://www.aitrescalini.org/` |

`lacarbonara.it` resolved and confirms a **00184** postcode but I could not extract a street from it.
`fatamorganagelato.it` and `libreriapecoranera.it` do not resolve.

---

## 6. Transport

The Monti article states Line **B** serves **Cavour** and **Colosseo**, and Line **C** serves
**Colosseo**. Nominatim confirms **Cavour → `quarter=Monti`, Via Cavour 197, 00184** and
**Colosseo → `quarter=Celio`**, while my PIP puts the Colosseo station node in Monti. So:

- **Cavour is a Monti station on every method.**
- **Colosseo is contested between Monti and Celio** and should not be claimed by a Monti page without
  the arbitrator's ruling.
- **The Line C claim at Colosseo is single-source (Wikipedia) and I could NOT verify it.**
  `metroc.it` does not resolve; `atac.roma.it` is live (200) but I did not find a line-status page;
  `romamobilita.it` is live. A verifier must confirm Line C service at Colosseo before any page says
  it.

---

## 7. Quarantine, traps and rule-application notes

### 7.1 A designation claim I found and did NOT carry

The it.wikipedia Monti article says of **Villa Sforza ai Quattro Cantoni**:

> «Sottoposta a **vincolo** dalla Soprintendenza Speciale di Roma…»

**This is exactly the banned category and it is not in §5.2 #38.** I have carried only the dating
(1620–1634) and the current occupant. Recording the find here so the verifier knows it exists in the
upstream source and can check that no downstream draft picks it up. I found no other explicit
`vincolo` claim in the Monti material.

Related, and also not used: **Lateran Treaty Art. 16** states the Holy See's properties «non saranno
mai assoggettati a **vincoli** o ad espropriazioni per causa di pubblica utilità». Tempting and
inadmissible — it says nothing about whether any building *is* designated, and the ruling bans the
category, not just the positive claim.

### 7.2 Official-source language that is still not publishable

Roma Capitale's own tourism copy repeatedly breaks two corpus rules, and being official does not
exempt it:

- **Superlatives and "the first/oldest/biggest".** The Mercati di Traiano page calls the museum *"il
  primo museo di architettura antica"*; the Fori Imperiali page calls the complex *"unico al mondo"*;
  the Battistero page opens *"È il più antico Battistero monumentale"*; the Obelisco Lateranense page
  says *"il più alto eretto di origine egiziana nel mondo"* and *"il più antico di Roma"*; the Terme
  di Traiano page says *"il più grande complesso termale esistente al mondo"* at the time. A place's
  own official site does not establish superlatives — and neither does the city's.
- **Unmeasurable proximity.** The Basilica di San Clemente page says the church is *"circa 300 metri
  oltre il Colosseo"*. That one is **measured and sourced**, so it is fine. But the Terme di Tito
  page's *"subito a fianco della Domus Aurea"* and the Scala Santa site's *"situato accanto alla
  grande Basilica"* are impressions and must not be carried.

### 7.3 Dead, hijacked and wrong-place sources — REJECT list

Seven traps, all of which would have produced a wrong or dangerous citation:

1. **`teatroeliseo.com`** — returns HTTP 200 and is a **domain-squatted Indonesian online-gambling
   site** ("GACORSLOT88 # Situs Slot88 Online"). **Must never be cited or linked.**
   `teatroeliseo.it`, which OSM tags on the building at Via Nazionale 183, **does not resolve.** So
   **Teatro Eliseo has no reachable official source at all** and I would not publish it.
2. **`scalasanta.com`** — a **HugeDomains parking page** offering the domain for $3,195. The real
   sanctuary is at **`scala-santa.com`** (with the hyphen). One character apart.
3. **`www.sanmartinoaimonti.it`** — tagged in OSM as the website of the Basilica dei Santi Silvestro
   e Martino ai Monti. It is actually a **French-language Rome travel affiliate site** ("Monti à
   Rome : le quartier alternatif et branché"). Not the parish.
4. **`santapudenziana.org`** — resolves, but it is **Santa Pudenziana di Narni, in Umbria**, a
   different church in a different region.
5. **`dolcevita-gallery.com`** — parked, "This domain may be for sale". The gallery at Via Palermo 41
   may no longer exist.
6. **`museospaziofield.it`** and **`fieldmuseum.it`** — do not resolve; `spaziofield.it` timed out
   twice. **Museo Spazio Field has no working official source.**
7. **`casadeicavalieridirodi.it`**, **`ukrainianchurch.it`**, **`santaprassede.it`**,
   **`fatamorganagelato.it`**, **`libreriapecoranera.it`**, **`teatrodellopera.it`** — none resolve.

Additionally **`teatrobrancaccio.it` returns 403** and **`basilicasantamariamaggiore.va/it/basilica/`
and `/it/contatti/` return 403**, so I have no hours for Santa Maria Maggiore from its own site.
**`parcocolosseo.it` and `colosseo.it` both timed out** and **`coopculture.it` returned 403**, so the
Domus Aurea has no operator-side source in this file.

### 7.4 Photo-wave notes (NOT for this wave)

Per ruling 3 I sourced and linked no image and every candidate carries `"photos": []`. Two things a
future photo wave will need to know, recorded and then dropped:

- The Mercati di Traiano site publishes an **`Autorizzazione riprese fotografiche`** page and the
  Sovrintendenza publishes **`Autorizzazione all'uso di immagini del patrimonio culturale di Roma
  Capitale`** and **`Fotoriproduzioni di opere d'arte dei musei`**. Monti's municipal monuments are
  therefore governed by a written Roma Capitale image-permission regime that needs reading before any
  photograph of them is used.
- Italy has no freedom of panorama, which the roster already flags for EUR. Monti's 20th-century
  buildings — Palazzo del Viminale (Manfredi, completed 1925) and the ISTAT building (1931) — are the
  ones where that will bite, and the architects' death dates were not researched.

### 7.5 Environment failures a verifier must account for

- **Nominatim rate-limiting was severe.** Two full batches were lost to HTTP 429. Any re-run needs
  ≥6s spacing and 30s backoff. My helper fails closed, so no invented `quarter` values are in this
  file, but that is a property of my code and not of the API.
- **The Ministero della Cultura netblock remains unreachable**, exactly as the scoping wave found. I
  did not re-test it; nothing in this file depends on it, by design.
- **Sovrintendenza Capitolina still has no discoverable per-monument URL pattern.** I got HTTP 200 on
  `/content/mercati-di-traiano` and `/content/torre-dei-conti` but 404 on
  `/content/casa-dei-cavalieri-di-rodi`, `/content/villa-aldobrandini` and
  `/content/parco-del-colle-oppio`, and there is no sitemap. The pattern exists but is not
  guessable — **this is the single highest-value unfinished lead for Monti**, because it is the one
  institutional source that could carry dating and attribution for the towers and the municipal
  monuments.
- **`diocesidiroma.it` is live and has `Ricerca Enti` and `Stradario Parrocchie`** — an unmined
  per-church source for the ~40 churches above.
- **The shared scratchpad was being written to by another session mid-run.** My working files were
  moved into a namespaced subdirectory partway through; anything cited above was re-verified after
  the move.

---

## 8. Summary of what the arbitrator must decide

1. **The Lateran cluster** (§3.2) — four buildings, three methods, three answers, one of them the
   cathedral of Rome and three of them Lateran Treaty extraterritorial properties. Roma Capitale's
   own prose says Monti; Nominatim says Esquilino; my PIP splits the complex.
2. **Santa Maria Maggiore** (§3.3) — the brief says straddler, three fetched methods say Monti, one
   postcode says Esquilino. Whichever way it goes, it is an Art. 13 extraterritorial property and its
   status wording comes from §4.
3. **Piazza del Quirinale and Palazzo del Quirinale** (§3.4) — the piazza is the boundary line by
   both rioni's own descriptions; the palace's footprint crosses it.
4. **Foro di Nerva** (§5.10) — claimed by Roma Capitale's Monti page and the Monti article, placed in
   Campitelli by the OSM polygon.
5. **Colosseo metro station** (§6) — Monti by PIP, Celio by Nominatim.
6. Whether §5.4 (22 vanished/deconsecrated churches) and §5.5 (34 street shrines) are one candidate
   each, many, or none.
