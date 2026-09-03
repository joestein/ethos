# Ponte (R. V, code 105) — FINDER file

Wave 4, Rome programme. Research date **2026-09-02**. This is **evidence, not adjudication**.
I am not deciding what ships. A verifier adjudicates; one arbitrator rules ownership of straddlers
across all nine rioni.

**Rulings observed.**
1. *No designation claims.* No `vincolo` / "listed" / "protected monument" / "national monument"
   claim appears anywhere below, in English or Italian. I re-tested both state registers this
   session; both are still dead (§2.6).
2. *Vatican City belongs to no rione.* **Ponte holds no Vatican City property and no Lateran Treaty
   Art. 15 extraterritorial property.** Its river frontage faces Borgo and the Vatican across the
   Tiber but does not reach either. See §2.7 — this is a positive finding, not an omission.
3. *No photographs.* `"photos": []` everywhere. I named and linked no image. Photo leads are
   quarantined in §11.

---

## 1. Headline numbers

| | |
|---|---|
| Guide-worthy candidate entries found | **98** |
| — named POI candidates (churches, palazzi, museums, bridges, towers, fountains, theatres) | 63 |
| — named streets / piazzas / lungoteveri worth a page in their own right | 35 |
| **Straddlers — flagged, NOT resolved by me** | **31 rows, 32 objects** (§7.6) |
| Named things 100 % inside Ponte by vertex test, before guide-worthiness filtering | 448 |
| Named things harvested in the padded bbox | 1,446 |
| Places the brief expected in Ponte that are **not** in Ponte | 2 (§8) |

My judgement: **GUIDE**, comfortably, and not close. Ponte clears the threshold on churches alone —
San Giovanni dei Fiorentini, Santa Maria della Pace, Santa Maria dell'Anima, San Salvatore in
Lauro, Sant'Apollinare, Santi Celso e Giuliano, the Gonfalone — before a single palazzo, museum or
bridge is counted. Strike every one of the 31 straddlers and Ponte still stands at about **fifty**
uncontested entries.

Ponte's OSM bounding box is about **0.0068° lat × 0.0108° lon** (roughly 750 m × 900 m). It is
small, dense, and its landward border with Parione is contested along nearly its whole length.

---

## 2. Method

### 2.1 Four independent methods, not one

Earlier waves standardised on OSM boundary geometry with Nominatim as a check. I ran both, and
added two more, one of which is new to the programme and is the most important thing in this file.

1. **OSM boundary geometry, vertex-tested** (§2.2) — deterministic, no rate limit, reports every
   rione a street or footprint crosses with the share of vertices in each.
2. **Nominatim reverse geocoding** `quarter` field (§2.4) — the brief's method.
3. **Roma Capitale's own published coordinates** (§2.5) — turismoroma.it embeds a `POINT` per
   place; I ran those through the polygons rather than points I had chosen myself.
4. **Roma Capitale's SISTO street register** (§3) — the official per-street rione record. **New.**

### 2.2 Geometry

Pulled boundary relations for **all 22 rioni** from Overpass
(`rel["boundary"="place"]["place"="quarter"]` over a Rome-centre bbox). All 22 returned; all 22
stitched to exactly one clean closed ring each — no gaps, no multipolygon ambiguity. Ray-casting
point-in-polygon locally. For every way/relation candidate I fetched full geometry and tested
**every vertex**.

Ponte boundary relation: **OSM r2529127**, `name=Ponte`, `ref=R. V`.
https://www.openstreetmap.org/relation/2529127

Note that Ponte carries `ref=R. V` while Trastevere carries bare `ref=XIII` — the normalisation
trap earlier waves flagged still holds. Any roster join on `ref` must normalise.

**Sanity check run before trusting the polygon set.** Ten landmarks with independently known
rioni: Piazza Navona→Parione, Pantheon→Pigna, Trevi Fountain→Trevi, Santa Maria in
Trastevere→Trastevere, Castel Sant'Angelo→Borgo, Pasquino→Parione, Palazzo della
Cancelleria→Parione. All correct, and all reproduce wave 1–3 results exactly.

**The Colosseum, tested independently as the brief instructed: → Celio.** I did not inherit the
ruling; I re-ran it on my own freshly fetched polygon set and it reproduces. The Colosseum is not
Ponte's and Ponte makes no claim on it.

### 2.3 The Overpass tooling trap, and a new one

The `out geom tags;` trap the Parione finder documented is real and I avoided it (`out geom;` alone
is correct). **A second trap cost me an hour and is worth recording:** the two main Overpass
endpoints (`overpass-api.de`, `overpass.kumi.systems`) returned 429 and 504 respectively for every
attempt across the whole session. `https://maps.mail.ru/osm/tools/overpass/api/interpreter`
answered on the first try and served every query in this file. Anyone repeating this work should
carry a mirror list, not a single endpoint.

### 2.4 Nominatim — rate-limited, then unanimous

Nominatim hard-429'd my first pass (38 points, all failed). On a slow retry with 30 s backoff it
answered, and **agreed with my polygons on 10 of 10 points tested**, including the two objects
wave 2 recorded as contested:

| Point | My geometry | Nominatim `quarter` |
|---|---|---|
| Santa Maria dell'Anima | Ponte (14/14 vertices) | **Ponte** |
| Santa Maria della Pace | Ponte (28/28) | **Ponte** |
| Chiostro del Bramante | Ponte | **Ponte** |
| Palazzo Altemps | Ponte | **Ponte** |
| San Salvatore in Lauro | Ponte | **Ponte** |
| Palazzo Sacchetti | Ponte | **Ponte** |
| Oratorio del Gonfalone | Ponte | **Ponte** |
| San Giovanni dei Fiorentini | Ponte | **Ponte** |
| Ponte Sant'Angelo (left-bank pt) | Ponte | **Ponte** |
| Basilica di Sant'Apollinare | Ponte | **Ponte** |

**This matters for §7.1.** Wave 2 recorded Nominatim returning *Parione* for Santa Maria dell'Anima
and treated the object as genuinely contested on that basis. **I could not reproduce that
disagreement**, on the church footprint's own coordinates or on Roma Capitale's published point.
I am not asserting wave 2 was wrong — a different test point inside a 14-vertex footprint on a
rione line can legitimately flip, and Nominatim's own data changes. I am recording that the
disagreement did not reproduce today, and leaving the object flagged for the arbitrator anyway,
because §3 turns up a *different* and better reason to keep it flagged.

### 2.4.1 A four-point-per-footprint retest, because one point is not a test

Rather than settle for one pin per building, I re-ran centroid **plus three spread vertices** on
five contested or boundary-critical footprints, testing each point against **both** methods:

| Footprint | Points tested | Geometry | Nominatim |
|---|---|---|---|
| Santa Maria dell'Anima `w52334111` | centroid + v0, v4, v9 | **Ponte 4/4** | **Ponte 4/4** |
| Santa Maria della Pace `w50884075` | centroid + v0, v9, v18 | **Ponte 4/4** | Ponte (1 answered, 3 rate-limited) |
| Sant'Apollinare `w53638757` | centroid + v0, v2, v4 | **Ponte 4/4** | **Ponte 4/4** |
| San Salvatore in Lauro `w111532852` | centroid + v0, v18, v37 | **Ponte 4/4** | **Ponte 4/4** |
| **Ponte Sant'Angelo** `w134399943` | centroid + v0, v18, v36 | **Ponte, Ponte, Borgo, Borgo** | **Ponte, Ponte, Borgo, Borgo** |

Two things follow.

**Santa Maria dell'Anima returns Ponte on eight independent tests** — four points, two methods, no
disagreement anywhere. Wave 2's single *Parione* reading does not survive a spread test. That is
a stronger result than §7.1 originally had, and it moves the Anima from "contested" toward "Ponte,
with one official caveat about its street".

**Ponte Sant'Angelo is a real straddler and the two methods agree on where the line falls** —
both put the left-bank end in Ponte and both put the mid-span and beyond in Borgo, point for point.
That is the cleanest confirmation of a straddle in this file, and it is why §6.1 states the split
rather than arguing for Ponte on geometry.

### 2.5 Roma Capitale's own coordinates, run through the polygons

turismoroma.it — Roma Capitale's official tourism site — publishes a `POINT (lon lat)` on each
place page. Using the city's coordinates rather than mine removes my own pin-dropping from the
chain. Fifteen tested:

| Roma Capitale point | → |
|---|---|
| Museo Nazionale Romano – Palazzo Altemps · Palazzo Altemps | Ponte |
| Chiesa di Santa Maria della Pace | Ponte |
| Chiostro del Bramante | Ponte |
| Santuario di San Salvatore in Lauro | Ponte |
| Complesso Monumentale di San Salvatore in Lauro | Ponte |
| Ponte Sant'Angelo | Ponte |
| Ponte Vittorio Emanuele II | Ponte |
| Basilica di San Giovanni Battista dei Fiorentini | Ponte |
| Basilica dei Santi Celso e Giuliano in Banchi | Ponte |
| Museo Napoleonico · Palazzo Primoli | Ponte |
| Palazzo Sacchetti | Ponte |
| Oratorio del Gonfalone | Ponte |
| **Ponte Principe Amedeo Savoia Aosta** | **Borgo** |

**14 of 15 land in Ponte.** The one that does not is a bridge, and Roma Capitale has simply pinned
it at its right-bank end — see §6.4. Note that this test is only as good as the city's pin: it
confirms, it cannot refute.

### 2.6 The state registers are still unreachable — Ruling 1's basis re-confirmed today

I re-tested rather than assuming:

| Host | Result today |
|---|---|
| `vincoliinrete.beniculturali.it` | `urlopen error timed out` |
| `www.catalogo.beniculturali.it` | `urlopen error timed out` |

Consistent with every earlier wave. **No designation claim is possible and none appears below.**
One trap to flag: the it.wikipedia article on San Salvatore in Lauro cites a
`catalogo.beniculturali.it/detail/HistoricOrArtisticProperty/…` URL. That is a *citation* to a host
we cannot reach; it is not a fetched fact and it establishes nothing. Do not launder it.

### 2.7 Vatican and extraterritorial: a positive nil return

Ponte is the left-bank rione at the Sant'Angelo crossing. Everything on the right bank at that
point is Borgo, and Borgo already owns it. I checked Ponte's 448 in-boundary named objects against
the Art. 15 and Art. 16 lists: **none appear.** The three diplomatic missions physically inside
Ponte — the embassies of Australia, Belize and Lithuania **to the Holy See** — are *Italian*
buildings housing missions accredited to a foreign state. They are ordinary Ponte addresses on
Corso Vittorio Emanuele II. They are **not** extraterritorial Holy See property, they are **not**
"in the Vatican", and their diplomatic status comes from the Vienna Convention, not the Lateran
Treaty. I have not written any of them up as places (§10.3) precisely because the wording risk
outweighs the guide value.

---

## 3. THE SISTO STREET REGISTER — the source wave 2 asked for, and it is live

Wave 2's arbitration listed, as item 5 for the coordinator, "The Roma Capitale SITOWPS / SISTO
street register is the per-street rione source this programme lacks… `comune.roma.it` is
unreachable and its archived snapshot returns a zero-byte body. **Worth one attempt from another
network before wave 3.**"

**It is reachable, on a different host, and it is a JSON API.**

- App: `https://geoportale.comune.roma.it/sisto/`
- Record: `https://geoportale.comune.roma.it/sisto/api/viario/{id}`
- Search: `https://geoportale.comune.roma.it/sisto/api/viario?denominazione.contains=CORONARI`
  (JHipster criteria syntax — `.contains`, `.equals` etc. all work; `?q=` is a decoy that returns
  an unfiltered page and will silently give you the wrong answer)

Each record carries `elementoDeliberas[].suddivisionis[]`, entries of `tipologia: "Rione"` with
`descrizione` (`RIONE V`) and `denominazione` (`PONTE`), alongside `zoneDiDecentramento`
(municipio) and the deliberation that set them. I take the rione list from the deliberation with
the latest `definitiva` date.

This is **Roma Capitale stating, for each named street, which rione or rioni it lies in.** It is
exactly the register the programme has been missing, and it is the one source in this file that can
settle a straddler rather than merely describe one. I ran 90-odd searches through it.

**Two cautions for the verifier.**
- The order of rioni within a record is **not** a majority signal. Piazza di Tor Sanguigna lists
  Parione first and Piazza dell'Orologio lists Ponte first; nothing in the data says which has more
  of the street. A SISTO multi-rione record establishes *that* a street is shared, not *how*.
- This is a toponymic register. It is publishable under the roster's "Roma Capitale's toponymic
  codes" carve-out. It says nothing whatever about protection status and must not be made to.

### 3.1 Streets SISTO records as **PONTE alone**

Via dei Coronari (cod. 3113) · Piazza dei Coronari (3112) · Arco della Pace (8079) ·
Vicolo della Pace (8082) · Piazza di S. Salvatore in Lauro (9649) · Via dei Banchi Nuovi (1296) ·
Via dell'Arco de' Banchi (940) · Via del Banco di S. Spirito (1298) ·
Via della Maschera d'Oro (7051) · Via di Monte Giordano (7437) · Via di Panico (8173) ·
Lungotevere Tor di Nona (10600) · Via di Tor di Nona (10601) ·
Lungotevere degli Altoviti (461) · Lungotevere dei Fiorentini (4164) · Largo dei Fiorentini (4163) ·
Via della Mola de' Fiorentini (7291) · Via del Gonfalone (5714) · Via dei Bresciani (1657) ·
Via dei Vecchiarelli (11125) · Arco degli Acquasparta (90) · Via degli Acquasparta (91) ·
Piazza Fiammetta (4063) · Piazza Lancellotti (6120) · Via Lancellotti (6121) ·
Piazza di Montevecchio (7548) · Vicolo di Montevecchio (7549) · Piazza Sforza Cesarini (9998) ·
Via Sforza Cesarini (9999) · Vicolo Sforza Cesarini (10000) · Piazzetta di S. Simeone (10050) ·
Vicolo di S. Simeone (10051) · Via di S. Simone (10056) · Via di S. Apollinare (866) ·
Piazza di Ponte S. Angelo (8845) · Piazza di Ponte Umberto I (8883) · Piazza Pasquale Paoli (8294) ·
Via Giuseppe Zanardelli (5681) · Piazza dell'Oro (7974) · Vicolo dell'Oro (7975) ·
Vicolo del Fico (4068) · Vicolo di Febo (3949) · Via della Vetrina (11205) ·
Via degli Orsini (7985) · Via dei Soldati (10099) · Vicolo dei Soldati (10100) ·
Via dei Gigli d'Oro (5024) · Via dei Tre Archi (10717) · Vicolo della Volpe (11520) ·
Vicolo delle Vacche (10929) · Vicolo Domizio (3439) · Vicolo della Palomba (8145) ·
Via del Mastro (7082) · Via del Pavone (8338) · Via della Rondinella (9510) ·
Via dei Cimatori (2801) · Via del Consolato (3052) · Via Acciaioli (34) · Largo Orbitelli (7946) ·
Vicolo Orbitelli (7947) · Largo Ottavio Tassoni (8065) · Vicolo di S. Celso (2618) ·
Vicolo di S. Giuliano (5397) · Vicolo Sugarelli (10303) · Vicolo del Montonaccio (7589) ·
Vicolo degli Amatriciani (477) · Vicolo dei Marchegiani (6816) · Vicolo del Cefalo (2603) ·
Vicolo del Curato (3245) · Vicolo del Leuto (6259) · Vicolo della Campanella (1848) ·
Vicolo dell'Avila (1233) · Vicolo di S. Trifone (10760) · Via dei Gabrielli (4669) ·
Via dell'Arco della Fontanella (944) · Via dell'Arco di Parma (948) · Vicolo delle Palle (8133) ·
Vicolo degli Osti (8035) · Vicolo Cieco (2788)

My vertex geometry agrees with SISTO on **every one of these**.

### 3.2 Streets SISTO records as **shared** — official straddlers, all flagged

| Street | SISTO rioni (official) | My vertex geometry |
|---|---|---|
| Via Giulia (5389) | **PONTE + REGOLA** | Ponte 7 / Regola 16 on the sampled segment |
| Via dei Banchi Vecchi (1297) | **PONTE + PARIONE + REGOLA** | Ponte 27 (the north stretch) / 1-1 at the Corso end |
| Via del Governo Vecchio (5724) | **PONTE + PARIONE** | Ponte 18 / Parione 1, and 3/0 |
| Via della Pace (8081) | **PONTE + PARIONE** | mixed |
| Via di S. Maria dell'Anima (6878) | **PONTE + PARIONE** | mixed |
| Piazza dell'Orologio (7976) | **PONTE + PARIONE** | Ponte 14 / Parione 5 |
| Piazza di Tor Sanguigna (10676) | **PARIONE + PONTE** | Ponte 11 / Parione 10 |
| Via di Tor Sanguigna (10677) | **PONTE + PARIONE** | — |
| Piazza del Fico (4067) | **PARIONE + PONTE** | Ponte 9 / Parione 6 |
| Largo Febo (3948) | **PARIONE + PONTE** | Ponte 16 / Parione 13 |
| Via di Tor Millina (10598) | **PONTE + PARIONE** | Ponte 2 / Parione 1 |
| Via del Corallo (3077) | **PARIONE + PONTE** | Parione 4 / Ponte 1 |
| Via dei Filippini (4091) | **PONTE + PARIONE** | — |
| Piazza della Chiesa Nuova (2756) | **PARIONE + PONTE** | — |
| Piazza delle Cinque Lune (2822) | **PONTE + SANT'EUSTACHIO + PARIONE** | Parione 16 / Ponte 6 / S.Eust. 4 |
| Piazza di S. Apollinare (865) | **PARIONE + PONTE** | — |
| Via dei Pianellari (8436) | **PONTE + SANT'EUSTACHIO** | S.Eust. 1 / Ponte 1 |
| Via dei Portoghesi (8959) | **CAMPO MARZIO + PONTE + SANT'EUSTACHIO** | — |
| Via dell'Orso (7986) | **CAMPO MARZIO + PONTE** | Ponte 5 / Campo Marzio 1 |
| Via di Monte Brianzo (7367) | **CAMPO MARZIO + PONTE** | Campo Marzio 4 / Ponte 3 |
| Via del Cancello (1919) | **PONTE + CAMPO MARZIO** | — |
| Lungotevere Marzio (7046) | **PONTE + CAMPO MARZIO** | Ponte 3 / Campo Marzio 1 |
| Lungotevere dei Sangallo (9686) | **REGOLA + PONTE** | Ponte 5 / Regola 1 |
| Via delle Carceri (2045) | **PONTE + REGOLA** | 1-1 |
| Via Bravaria (1648) | **REGOLA + PONTE** | Regola 4 / Ponte 2 |
| Corso Vittorio Emanuele II (11489) | **SANT'EUSTACHIO + PARIONE + PIGNA + PONTE** | Ponte-only in its westernmost stretch |

### 3.3 Streets SISTO puts **outside** Ponte, against a plausible assumption

- **Via di Parione** (8272) → PARIONE alone. **Via del Teatro Pace** (10370) → PARIONE alone. Both
  are Ponte-adjacent and my geometry agrees (5/1 and 16/1 Parione). Ponte must not claim either.
- **Vicolo del Governo Vecchio** (5725) → **PARIONE alone**, even though Via del Governo Vecchio is
  shared. The two are separate register entries and must not be conflated.
- **Vicolo dell'Orso** (7987) → **CAMPO MARZIO alone**, though Via dell'Orso is shared.
- **Arco della Chiesa Nuova** (2755), **Via della Chiesa Nuova** (2757), **Piazza di Pasquino**
  (8301), **Via di Pasquino** (8302), **Piazza Navona** (7687) → **PARIONE alone.**
  Piazza Navona being Parione-only in Roma Capitale's own register independently confirms wave 2's
  ruling; I record it because it cost one query and it is the cleanest corroboration in the file.
- **Passetto delle Cinque Lune** (2821) → PARIONE alone, though the Piazza is three-way.

### 3.4 romasegreta.it disagrees with SISTO once, and SISTO wins

`romasegreta.it/ponte/` is a per-rione street index and I used it as a discovery aid. It files
**Via dei Portoghesi** under Ponte; SISTO records that street as Campo Marzio + Ponte +
Sant'Eustachio. It is a hobbyist site with no stated method. **Use it to find candidates, never to
place them.** I have attributed nothing to it below.

---

## 4. RELIGIOUS BUILDINGS — extant

it.wikipedia maintains `Categoria:Chiese di Roma (rione Ponte)`, which is a *third* editorial
source distinct from both article prose and geometry. It contains 25 entries, of which most are
demolished or deconsecrated. The extant ones follow. Every one of these is **historic-site** under
the roster's `kind_note` — there is no `church` kind and three Sallustiano churches were rejected
at seed time for using one.

### 4.1 Basilica di San Giovanni Battista dei Fiorentini
- **Kind:** historic-site. **Rione: Ponte**, four ways — vertex test 20/20 on `w127942183`;
  Nominatim `quarter=Ponte`; Roma Capitale's own point (41.899648, 12.465112) → Ponte;
  it.wikipedia category "Chiese di Roma (rione Ponte)".
- Roma Capitale page: https://www.turismoroma.it/it/luoghi/basilica-di-san-giovanni-battista-dei-fiorentini
- **Hours, from Roma Capitale's page** (winter): Mon–Fri 08.30–11.30 and 17.30–19.00; Sundays and
  feast days 08.30–13.00 and 17.30–19.00. Mass times listed there too. The page itself warns hours
  may vary. **Publish these attributed to turismoroma, and carry the variation caveat.**
- Official parish site: https://sangiovannibattistadeifiorentini.it (fetched, 200). Roma Capitale's
  page also links iubilaeum2025.va's page naming it a 2025 Jubilee church. **Word that as "a
  Jubilee church for 2025", never as "listed"** — the test suite's regex gate does not know that
  "listed" here means "named on a page", and the roster bans the word outright.
- **History** (it.wikipedia, `Basilica di San Giovanni Battista dei Fiorentini`): Julius II opened
  Via Giulia in 1508; Bramante's first project for the Florentine national church dates to the same
  year. Begun in the 16th century, finished in the 18th, at the head of Via Giulia. It is a minor
  basilica and a parish seat. **The long Sangallo/Michelangelo/Maderno/Borromini attribution chain
  in that article is contested in the article's own text — see §10.1 before writing a single
  architect's name.**
- Address: Piazza dell'Oro / Via Acciaioli end of Via Giulia. Piazza dell'Oro (7974), Vicolo
  dell'Oro (7975), Via Acciaioli (34) and Largo dei Fiorentini (4163) are all SISTO-clean Ponte.

### 4.2 Chiesa di Santa Maria della Pace, with the Chiostro del Bramante
- **Kind:** historic-site (the church); the cloister is a separate object, see §5.1.
- **Rione: Ponte, on five independent methods.** Vertex test **28/28** on `w50884075`; Nominatim
  `quarter=Ponte`; Roma Capitale's point (41.900232, 12.471313) → Ponte; it.wikipedia prose
  *"si trova nell'omonima piazza nel rione Ponte"*; it.wikipedia category. **And now a sixth:**
  SISTO records **Arco della Pace (cod. 8079)** and **Vicolo della Pace (8082)** as **PONTE alone**.
  The Chiostro's published address is **Arco della Pace 5**.
- **Wave 2 carried this nowhere and said so explicitly: "The brief listed it as a Parione subject
  and the brief is wrong. Parione has not taken it and must not."** `taken_slugs.py` confirms
  Parione did not. It is unclaimed and it is Ponte's.
- Roma Capitale page: https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-della-pace
  — gives phone 06 68804038 and states that for mass times and visiting arrangements one should
  contact the church. **That is the honest hours line: no source states fixed opening hours, so
  none should be given.**
- **History** (it.wikipedia `Chiesa di Santa Maria della Pace (Roma)`): built from **1482** on a
  vow of Sixtus IV, over an earlier chapel of Sant'Andrea de Aquaricariis; the architect of that
  campaign is not established (Baccio Pontelli and Meo del Caprino are both proposed). Tribune and
  high altar rebuilt 1611 at the Rivaldi family's expense. **1656–1667**, Alexander VII had
  **Pietro da Cortona** rebuild it: the Baroque façade with its semicircular Tuscan-columned pronaos
  between concave wings, and the small trapezoidal piazza he cleared houses to create.
- **Inside**, all from the same article: Carlo Maderno's high altar (**1614**); the Chigi chapel,
  architecture attributed to **Raphael**, who painted the **Sibyls and angels, 1514**, on its arch —
  the four Prophets above were finished by Timoteo Viti to Raphael's design after his death; the
  Cesi chapel by Antonio da Sangallo the Younger with Simone Mosca's carving and two Rosso
  Fiorentino frescoes; the Ponzetti chapel with **Baldassarre Peruzzi**'s altar fresco of **1516**
  and two Ponzetti tombs of 1505 and 1509; Orazio Gentileschi's *Baptism of Christ* (1607);
  Carlo Maratta's *Visitation* (1655); Peruzzi's *Presentation in the Temple* (1524); Filippo
  Lauri's lunette (1657); Francesco Albani's vault (1612–14). Sangallo designed the octagonal
  tribune, stuccoed to Pietro da Cortona's design.

### 4.3 Chiesa di Santa Maria dell'Anima
- **Kind:** historic-site. **Rione: contested — flagged, see §7.1.** Vertex test **14/14 Ponte** on
  `w52334111`; Nominatim `quarter=Ponte` today; it.wikipedia category "Chiese di Roma (rione
  Ponte)". **But SISTO records its own street, Via di S. Maria dell'Anima (cod. 6878), as
  PONTE + PARIONE**, and its street sign is photographed on the Parione side in the it.wikipedia
  rione article. Address: Via di Santa Maria dell'Anima 66.
- The German-speaking Catholic community's national church in Rome
  (*Kirche der deutschsprachigen katholischen Gemeinde in Rom*). Official site of the Pontifical
  Institute: **https://www.pisma.it** (fetched, 200; German-language,
  "Päpstliches Institut Santa Maria dell'Anima").
- **History** (it.wikipedia): founded in the 14th century as the oratory of the German hospice;
  rebuilding decided for the **Jubilee of 1500**, consecrated **1542**. Johannes Burckardt, a member
  of the confraternity from 1489 and later its provost, wanted a northern-European plan with side
  aisles the same height as the nave. Façade by **Andrea Sansovino**, completed by **Giuliano da
  Sangallo**; the campanile is attributed to Bramante. Funerary monument of **Pope Adrian VI**, by
  Angelo di Mariano ("Michelangelo Senese") to a design by Baldassarre Peruzzi, 1524–27,
  commissioned by Cardinal Willem Enckenwoirt. Sacked under the Napoleonic occupation and the
  sacristy used as a stable; seminary instituted 1859.
- **No hours source.** turismoroma has no page for it. Write "No source states its opening hours,
  so none are given here."

### 4.4 Chiesa di San Salvatore in Lauro
- **Kind:** historic-site. **Rione: Ponte**, cleanly — vertex test **56/56** on `w111532852`;
  Nominatim; Roma Capitale point (41.901054, 12.469646) → Ponte; it.wikipedia prose *"situato
  nell'omonima piazza nel rione Ponte"*; and SISTO records **Piazza di S. Salvatore in Lauro
  (cod. 9649)** as **PONTE alone**. Address: Piazza di San Salvatore in Lauro 15.
- Roma Capitale page: https://www.turismoroma.it/it/luoghi/santuario-di-san-salvatore-lauro
  — official site https://sansalvatoreinlauro.org (fetched, 200), phone 066875187. Roma Capitale
  says to consult the official site or phone for mass and service times. The parish site states
  the sanctuary is open every day; it gives no clock times I could extract, so **do not invent
  any**.
- **History** (it.wikipedia): the name is traditionally from a laurel grove; recorded as
  *Salvatori de Lauro* in the **Catalogo di Cencio Camerario, 1192**, with a presbyteral income of
  six denarii. Cardinal Latino Orsini had a convent of San Giorgio built alongside in the 15th
  century, given to the Canons Regular of San Giorgio in Alga. It is the national church of the
  Marchigiani in Rome and the seat of the diaconate of the same name.

### 4.5 Basilica di Sant'Apollinare
- **Kind:** historic-site. **Rione: Ponte** — vertex test 7/7 on `w53638757`; Nominatim
  `quarter=Ponte`; it.wikipedia prose *"situato nel rione Ponte, tra Piazza Navona e Palazzo
  Altemps"*; category. **Flag anyway:** SISTO records **Piazza di S. Apollinare (cod. 865)** as
  **PARIONE + PONTE**, while **Via di S. Apollinare (866)** is Ponte alone. The church footprint
  tests wholly Ponte; the square it faces is officially shared. See §7.3.
- **History** (it.wikipedia `Basilica di Sant'Apollinare (Roma)`): founded by **Pope Hadrian I
  around 780** on Roman remains, first recorded in his *Liber pontificalis* life and again in the
  10th-century chronicle of Benedetto del Soratte. It has the dignity of a minor basilica. OSM
  carries `start_date=1748` for the surviving fabric (Ferdinando Fuga's rebuilding).
- It adjoins the Pontificia Università della Santa Croce (§5.6) — the two physically adjoin, which
  the corpus rules permit describing.

### 4.6 Chiesa dei Santi Celso e Giuliano in Banchi
- **Kind:** historic-site. **Rione: Ponte** — vertex test 21/21 on `w128244545`; Roma Capitale point
  (41.900570, 12.466882) → Ponte; it.wikipedia prose *"È situata nel rione Ponte, nel quartiere dei
  Banchi"*; category. Address: Via del Banco di Santo Spirito — **SISTO cod. 1298, PONTE alone.**
- Roma Capitale page: https://www.turismoroma.it/it/luoghi/basilica-dei-santi-celso-e-giuliano-banchi
- **Hours, from Roma Capitale's page:** weekdays 07.00–12.00 and 15.00–19.00; feast days 08.00–13.30
  and 15.00–19.45. The page warns hours may vary and points to the church's site.
- Held by the Institute of Christ the King Sovereign Priest; its site `icrss.it/roma` returned
  **HTTP 403** to me, so I have taken nothing from it. Roma Capitale gives the contact
  italia@icrsp.org.
- **History** (it.wikipedia `Chiesa dei Santi Celso e Giuliano`): the first church on the site was
  consecrated in **432** by Pope Celestine I and enlarged in the 9th century; **1198**, Innocent III
  declared it a papal chapel; demolished and rebuilt in the 16th century, restored in the 19th.
  Minor basilica. **"The first church on the site, consecrated in 432" is a date-and-sequence
  statement, which the rules expressly permit; "the oldest church in the rione" would not be.**

### 4.7 Oratorio del Gonfalone (Santa Maria Annunziata del Gonfalone)
- **Kind:** historic-site. **Rione: Ponte** — vertex test 10/10 on `w127942179`; Nominatim; Roma
  Capitale point (41.897517, 12.466381) → Ponte; it.wikipedia prose *"nel rione Ponte, situata in
  via del Gonfalone"*. Via del Gonfalone is **SISTO cod. 5714, PONTE alone.** Address: Via del
  Gonfalone 32a.
- Roma Capitale page: https://www.turismoroma.it/it/luoghi/oratorio-del-gonfalone — phone
  06 6875952, contacts direzioneartistica@oratoriogonfalone.eu and info@oratoriogonfalone.eu.
  Roma Capitale states that for visiting arrangements one should use the contacts given.
- Official site https://www.oratoriogonfalone.eu (fetched, 200). It advertises concerts with the
  box office opening at 19.30 and performances from 19.30. **That is a concert-night time, not an
  opening time — do not present it as opening hours.**
- **History** (it.wikipedia `Oratorio del Gonfalone (Roma)`): built about the middle of the 16th
  century over the ruins of the old church of Santa Lucia, as the oratory of the Arciconfraternita
  del Gonfalone, whose seat was the adjoining palace; dedicated to the Annunciation and to the
  apostles Peter and Paul. A rectory church. Home of the Coro polifonico romano **since 1960**,
  which gives concerts there.

### 4.8 Chiesa di Santa Maria del Suffragio
- **Kind:** historic-site. **Rione: Ponte** — vertex test 10/10 on `w127942185`; it.wikipedia prose
  *"si trova in via Giulia, nel rione Ponte"*; category. **On Via Giulia, which SISTO records as
  PONTE + REGOLA — flag, §7.2.**
- **History** (it.wikipedia): the "del Suffragio" confraternity was founded in **1592** at San
  Biagio della Pagnotta to pray for the dead; approved by Clement VIII in **1594**, raised to an
  arciconfraternita by Paul V in **1620**. From **1607** it acquired part of the site originally
  meant for Bramante's Palazzo dei Tribunali. 17th-century church.
- Its site `santamariadelsuffragio.com` **did not resolve** for me. No hours source: say so in the
  page's own terms, not in research terms.

### 4.9 Chiesa di San Biagio degli Armeni (San Biagio della Pagnotta)
- **Kind:** historic-site. **Rione: Ponte** — vertex test 6/6 on `w127942184`; it.wikipedia prose
  *"nel rione Ponte, situata in via Giulia, presso il Palazzo Sacchetti"*; category. OSM address
  **Via Giulia 63**. Via Giulia is a SISTO straddler; the footprint is not. §7.2.
- The Armenian Catholic church in Rome. The nickname *della Pagnotta* is from the small blessed
  loaves distributed on St Blaise's day, **3 February**, per it.wikipedia. Medieval documents give
  a string of variant names traceable to *de cantu secuta*.
- No hours source found. Say so honestly.

### 4.10 Chiesa dei Santi Simone e Giuda — deconsecrated
- **Kind:** historic-site. **Rione: Ponte** — it.wikipedia prose *"nel rione Ponte, in cima a una
  scalinata appartenente alla via di San Simone"*; Via di S. Simone is **SISTO cod. 10056, PONTE
  alone.**
- 12th century; consecrated by Paschal II (1099–1118) and again by **Innocent II in 1143**, whose
  inscription survives in the building. Originally *Santa Maria in Monticellis*, after Monte
  Giordano; the apostles' dedication only from the mid-16th century. **Deconsecrated in 1902.**
  Subsequently divided into housing, the "Alcazar" cinema, a restaurant, and finally a theatre —
  the Teatro dei Coronari (§5.9).
- **Weak but honest.** A deconsecrated church you cannot enter is a thin page on its own; it is
  strong as part of a Via dei Coronari entry.

### 4.11 Chiesa di San Simeone Profeta — **CONTRADICTION, do not write until resolved**
it.wikipedia has an article saying it *is* a church of Rome in the rione Ponte, in piazza
Lancellotti — medieval origins, first recorded in the Regestum Farfense on **23 January 1017** as
*San Simeone de Ponte*, in Cencio Camerario's 1192 catalogue as *sancto Symeoni de Pusterula*,
restored **1610** for Cardinal Orazio Lancellotti. **The it.wikipedia article on the rione lists it
under "Scomparse" — vanished.** Both pages are from the same source and they contradict each other.
I could not settle it. **Flagged in §9.2. Do not publish either state.**

### 4.12 Chiesa evangelica metodista di Ponte Sant'Angelo
Named in the it.wikipedia rione article's list of religious buildings and **not present in my OSM
harvest under any name** — a real gap in OSM coverage, not in reality. A working Methodist church
on Via del Banco di Santo Spirito (SISTO: PONTE alone). **I did not fetch a source that establishes
its address, hours or history, so I am recording it as a lead, not a candidate.** Worth one fetch
by the verifier: every other place of worship I found in Ponte is Catholic, so this one would add
something the rest of the file does not have. **Do not write that as a "the only…" claim on the
page** — that is a banned superlative form even when true of our own corpus.

### 4.13 Demolished and deconsecrated — leads, not candidates
From `Categoria:Chiese di Roma (rione Ponte)` and the rione article: Sant'Angelo de Miccinellis ·
San Celsino · Santa Maria in Posterula · Santa Maria della Purificazione in Banchi · San Pantaleo
iuxta Flumen · San Salvatore de Inversis · San Salvatore in Primicerio · Cappella dei Santi
Innocenti · Cappella di Santa Maria Maddalena · Cappella di San Giovanni Decollato a Ponte
Sant'Angelo · Oratorio dei Santi Cosma e Damiano in Banchi.

Two are worth naming inside other pages because their demolition is the story of the rione's
19th-century transformation:
- **Chiesa di Sant'Anna dei Bresciani** (formerly Santi Faustino e Giovita), the Brescian national
  church, at the end of Via dei Bresciani off Via Giulia. **Demolished around 1888** during the
  opening of Lungotevere dei Sangallo (it.wikipedia).
- **Chiesa di Sant'Orsola della Pietà**, the Florentine oratory, which stood where the western end
  of Corso Vittorio Emanuele II now runs (it.wikipedia). Its rooms are named in the San Giovanni
  de' Fiorentini museum's own account of its origins.

**None of these should be a place record.** A vanished building has no address, no hours and
nothing to visit.

---

## 5. MUSEUMS, PALAZZI AND INSTITUTIONS

### 5.1 Chiostro del Bramante
- **Kind: museum.** **Rione: Ponte** — Nominatim; Roma Capitale point (41.899752, 12.471447) →
  Ponte; **address Arco della Pace 5, SISTO cod. 8079, PONTE alone.** OSM `n1674754682`,
  wikidata Q25100007.
- Roma Capitale page: https://www.turismoroma.it/it/luoghi/chiostro-del-bramante — official site
  www.chiostrodelbramante.it (fetched, 200), phone 06 68809035,
  info@chiostrodelbramante.it / infomostra@chiostrodelbramante.it.
- **Hours:** Roma Capitale states the exhibition ticket office is open every day and closes one hour
  before the venue, and directs readers to the official site for current times. **That is the whole
  of what is establishable. Publish exactly that; do not invent a clock time.** (An exhibition venue
  whose hours change per show is precisely the case the "last admission 18.30" carve-out does *not*
  cover.)
- **History** (it.wikipedia `Chiostro del Bramante` and `Chiesa di Santa Maria della Pace (Roma)`):
  commissioned by Cardinal **Oliviero Carafa** around 1500 and designed by **Donato Bramante**;
  built **1500–1504** as the cloister of Santa Maria della Pace. Square plan generated by repeating
  a module equal to the portico's width, giving a 4×4 central void and a 2×4 refectory; sixteen
  piers form a continuous cross-vaulted portico; two orders in elevation, proportioned to the
  Vitruvian rule. Lunettes on the back wall frescoed with Stories of the Life of the Virgin. It
  became an exhibition space and cultural centre in **1996**, run by DART – Chiostro del Bramante.
- From the first floor there is a view of Raphael's Sibyls in the adjoining church — **the two
  buildings physically adjoin, which the corpus rules permit stating.** The venue also runs a
  caffetteria at the same address (OSM, with the chiostrodelbramante.it URL).

### 5.2 Museo Nazionale Romano — Palazzo Altemps
- **Kind: museum.** **Rione: Ponte** — Nominatim; Roma Capitale point (41.901002, 12.473265) →
  Ponte; it.wikipedia prose *"È sito nel rione Ponte in Piazza di San Apollinare"*. OSM
  `n677476578`, wikidata Q1816007.
- Roma Capitale page: https://www.turismoroma.it/it/luoghi/museo-nazionale-romano-palazzo-altemps
- **Address conflict, resolve before publishing.** Roma Capitale gives **Piazza di Sant'Apollinare
  46**; the it.wikipedia infobox gives *Via Sant'Apollinare 46*; the it.wikipedia body gives
  *Piazza di San Apollinare 44*. **Publish Roma Capitale's.** (Wave 2's Propaganda Fide finding —
  publish the institution's official address, never it.wikipedia's — applies exactly.)
- **Hours, from Roma Capitale:** Tuesday to Sunday **09.30–19.00, last admission 18.00, closed
  Monday**. Phone 06 684851, mn-rm@cultura.gov.it. A "last admission 18.00" line is expressly
  permitted by the corpus rules.
- The official museum site is cited by Roma Capitale as
  `museonazionaleromano.beniculturali.it/it/171/palazzo-altemps`. **That host timed out for me and
  the `cultura.gov.it` variants did not resolve.** Take the hours from Roma Capitale, which did
  answer, and attribute them there.
- **The building** (it.wikipedia `Palazzo Altemps`): formerly Palazzo Riario, designed in the 15th
  century by Melozzo da Forlì; state property since **1982**; one of the four sites of the Museo
  Nazionale Romano. The article records that from Augustus' time the area 160 m upstream of the
  Pons Aelius held one of Rome's two marble ports and the *statio rationis marmorum*, the imperial
  quarry-monopoly office; the landing was **found in 1891**, recorded, and destroyed during the
  building of the Tiber embankment walls.
- **This is one place or two.** Roma Capitale runs separate pages for the museum and for the
  building (`/it/luoghi/palazzo-altemps`), the latter saying only "for any information see the
  museum's record". **My recommendation: one record, the museum, with the palace's history in it.**
  Two records would duplicate an address and a set of hours for no reader benefit. The verifier
  should rule.

### 5.3 Museo Napoleonico, and Palazzo Primoli
- **Kind: museum.** **Rione: Ponte** — Roma Capitale point (41.901913, 12.471862) → Ponte. Address
  Via Zanardelli 1 (it.wikipedia) / Piazza di Ponte Umberto I 1 (OSM `n1938346422`). **Via Giuseppe
  Zanardelli is SISTO cod. 5681, PONTE alone; Piazza di Ponte Umberto I is cod. 8883, PONTE alone.**
  Either address lands in Ponte.
- Roma Capitale page: https://www.turismoroma.it/it/luoghi/museo-napoleonico —
  **hours: Tuesday to Sunday 10.00–18.00, last entry 17.15; 24 and 31 December 10.00–14.00.**
  Phone 060608, museonapoleonico@comune.roma.it. Official site www.museonapoleonico.it
  (fetched, 200). It is a Musei Civici / Roma Capitale museum.
- **Collection** (it.wikipedia `Museo napoleonico di Roma`): Napoleonic relics, chiefly from the
  collection of **Count Giuseppe Primoli (1851–1927)**, son of Carlotta Bonaparte and so a Bonaparte
  descendant, **given to the city of Rome in 1927**.
- **Palazzo Primoli** has its own Roma Capitale page
  (https://www.turismoroma.it/it/luoghi/palazzo-primoli) and its own it.wikipedia article: built in
  the 16th century; about 1500 it belonged to the Gottifredi, around 1600 to their heirs, a century
  later to the Filonardi; the first floor bought by Count Luigi Primoli in **1820**. **The Tiber
  embankment works and the opening of Via Zanardelli forced a radical rebuilding, carried out by
  the Roman architect Raffaello Ojetti** (Fondazione Primoli, https://www.fondazioneprimoli.it —
  fetched, 200). Since **1927** owned by the Fondazione Primoli and the Comune di Roma.
- **Three institutions share this one building** — Museo Napoleonico, Fondazione Primoli, Museo
  Mario Praz. See §9.3 on how many records that should be.

### 5.4 Museo Mario Praz
- **Kind: museum.** **Rione: Ponte** — third floor of Palazzo Primoli, Via Zanardelli 1, so it
  inherits §5.3's four-way agreement.
- A house-museum of **more than 1,200 objects** collected by the anglicist and critic **Mario Praz
  (1896–1982)**, who lived in the flat **from 1964**, having moved there from Palazzo Ricci in Via
  Giulia. State-owned; run by the Polo museale del Lazio from December 2014 to December 2019 and
  by the Direzione Musei statali di Roma since 2019 (it.wikipedia `Museo Mario Praz`).
- Roma Capitale's Palazzo Primoli page links `direzionemuseiroma.cultura.gov.it/museo-praz/`.
  **That host did not resolve for me and neither did `museopraz.beniculturali.it`.** No hours are
  establishable. Say so in the page's own terms. **Low confidence — see §9.5.**

### 5.5 Complesso Monumentale di San Salvatore in Lauro / Pio Sodalizio dei Piceni
- **Kind: museum.** **Rione: Ponte** — Roma Capitale point (41.900865, 12.469236) → Ponte; the
  square is SISTO-clean Ponte.
- Roma Capitale page:
  https://www.turismoroma.it/it/luoghi/complesso-monumentale-di-san-salvatore-lauro —
  **hours: Tuesday to Saturday 10.00–13.00 and 16.00–19.00.** Phone 06 6875608,
  info@piosodaliziodeipiceni.it, site www.piosodaliziodeipiceni.it/museidisansalvatoreinlauro/
  (fetched, 200).
- The Pio Sodalizio dei Piceni is the Marchigiani institution that holds the complex. It grew from
  an association formed at the start of the 17th century at the instance of Cardinal **Gianbattista
  Pallotta of Caldarola**, made the **Confraternita della Santa Casa di Loreto by Urban VIII in
  1633**; the feast of the Piceni is kept in Rome on **10 December** each year, the anniversary of
  the translation of the Holy House (it.wikipedia `Pio Sodalizio dei Piceni`).
- **Note the near-collision with §4.4.** The *church* and the *monumental complex* are separate
  Roma Capitale records with separate hours, separate phones and coordinates 30 m apart. They are
  genuinely two things: a working sanctuary and a museum complex. I recommend two records; the
  verifier should confirm that does not read as duplication.

### 5.6 Pontificia Università della Santa Croce
- **Kind:** attraction is wrong and museum is wrong; the schema has no "university" kind. **This
  may not be publishable as a place at all** — see §10.2. OSM `n2144627661`, wikidata Q548435,
  Piazza di Sant'Apollinare 49. Vertex test: Ponte. Official site https://www.pusc.it
  (fetched, 200).
- It occupies Palazzo Apollinare adjoining the basilica (§4.5). **A working university with no
  public visiting is a poor guide entry.** I record it because it is a real, large, named
  institution inside Ponte and the verifier should decide rather than have me silently drop it.

### 5.7 Museo Criminologico
- **Kind: museum.** **Rione: Ponte** — vertex test on OSM `n4258490090` (wikidata Q3867843) is
  Ponte; **address Via del Gonfalone 29, SISTO cod. 5714, PONTE alone.**
- In the **Palazzo del Gonfalone, the former juvenile prison established by Leo XII in 1827**,
  between Via del Gonfalone and Via Giulia. **Opened in 1931** at the instance of the Guardasigilli
  Alfredo Rocco; originally in three sections (it.wikipedia `Museo criminologico`). Run by the
  Ministry of Justice.
- **Warning.** I could not confirm from any fetched source that it is currently open to visitors;
  `giustizia.it` answered (200) but I did not isolate a hours statement, and turismoroma has no
  page. **Low confidence — §9.5.** Do not publish hours. Do not publish "open" or "closed" as a
  status: the roster requires the `status` field to agree with the record's own prose, and I have
  no prose to support either.

### 5.8 Museo di arte sacra San Giovanni de' Fiorentini
- **Kind: museum.** Via Acciaioli 2 — **SISTO cod. 34, PONTE alone.** it.wikipedia
  `Museo San Giovanni de' Fiorentini`: a museum of sacred art holding works the basilica acquired
  over the centuries; the church gathered around it an oratory (Sant'Orsola della Pietà) and the
  Ospedale della Natione.
- **No hours, no official site fetched.** A thin record on its own; strong as a paragraph inside
  §4.1. Verifier's call.

### 5.9 Theatres
- **Teatro Tordinona**, Via degli Acquasparta 16 (it.wikipedia infobox) — **SISTO cod. 91, PONTE
  alone.** Also called Sala Pirandello. It carries the name of the **Teatro Apollo-Tordinona,
  demolished in 1888**, which arose in **1670** at the wish of **Christina of Sweden**, who asked
  her secretary Count Giacomo d'Alibert to obtain from Clement IX a building formerly Orsini
  property, on what is now Lungotevere Tor di Nona, used as a prison until 1657. **Kind: theater.**
  I fetched no current programme or hours; do not claim any.
- **L'Arciliuto**, Piazza di Montevecchio 5 (OSM `n5264705021`, `amenity=theatre`, site
  https://www.arciliuto.it, fetched 200). **SISTO cod. 7548, PONTE alone.** Housed in Palazzo
  Montevecchio Chiovenda (§5.10). **Kind: theater.**
- **Teatro dei Coronari**, Via di San Simone 66 — **closed since 2006** (it.wikipedia
  `Teatro dei Coronari`). It occupied the southern part of Santi Simone e Giuda (§4.10). **Not a
  place record: it does not operate.** Good material inside a Via dei Coronari entry.

### 5.10 Palazzi — all SISTO-confirmed Ponte unless noted

Each has an it.wikipedia article; I give the address, the SISTO ruling on that address's street,
and the sourced construction facts. **None of these is open to the public except where stated, and
none may carry hours.**

| Palazzo | Address | Street per SISTO | Sourced facts (it.wikipedia unless noted) |
|---|---|---|---|
| **Palazzo Sacchetti** (già Ricci) | Via Giulia 66 | Via Giulia = **PONTE + REGOLA**, flag §7.2. Roma Capitale's own point (41.898534, 12.466019) → **Ponte** | Late Renaissance. Designed **and owned** by **Antonio da Sangallo the Younger**; completed by Nanni di Baccio Bigio or his son Annibale Lippi. Later the Ricci, Ceoli and Sacchetti. Interior cycle of the **Stories of David by Francesco Salviati**. Roma Capitale page: https://www.turismoroma.it/it/luoghi/palazzo-sacchetti, which gives www.fondazionegiulioegiovannasacchetti.it |
| **Palazzo Taverna** (Orsini Taverna, già Gabrielli) | Via di Monte Giordano | cod. 7437, **PONTE** | Built for **Cardinal Giordano Orsini** on his fortress on Monte Giordano. Later let to Cardinal Ippolito II d'Este, who hosted **Torquato Tasso**, and to Cardinal Maurizio of Savoy. **To the Gabrielli in 1688**, who hosted members of the Bonaparte family including the Empress Eugénie and Cardinal Luciano-Luigi, who died there |
| **Palazzo del Banco di Santo Spirito** (già Zecca Vecchia) | Via del Banco di Santo Spirito | cod. 1298, **PONTE** | **Julius II ordered a monetary reform in 1504** and gave **Bramante** the job of adapting an existing building as the papal mint. The silver *giulii*, worth a tenth of the gold ducat, were struck here, along with coins and medals some of which were **Benvenuto Cellini**'s work. **Leo X** had **Antonio da Sangallo the Younger** build the façade, **completed 1524**, whose slightly concave form drew comment |
| **Palazzo Alberini** (poi Cicciaporci) | Via del Banco di Santo Spirito 12 | cod. 1298, **PONTE** | Built for Giulio Alberini **between 1515 and 1519**; the article attributes the design to **Raphael**, notes **Vasari** says Giulio Romano designed it for him, and attributes the ground floor to Bramante, possibly 1512. Completed **1521** by Pietro Rosselli. **The present façade is 19th-century.** — a genuinely disputed attribution, §10.1 |
| **Palazzo Lancellotti** | Via Lancellotti 18 | cod. 6121, **PONTE** | Begun **1591** to **Francesco da Volterra**'s design for Cardinal Scipione Lancellotti; completed for Cardinal Orazio Lancellotti by **Carlo Maderno in 1610**. Frescoes finished later under **Agostino Tassi**, including the Sala dei Palafrenieri. Portal by **Domenichino**. The Circolo San Pietro's first seat, founded 1869 |
| **Palazzo Cesi-Gaddi** | cnr Via della Maschera d'Oro / Via degli Acquasparta | cods. 7051 & 91, both **PONTE** | Built by the **Gaddi**, Florentine merchants, early 16th c.; sold to the Rossi di San Secondo; **1567** to **Angelo Cesi**; **1570** let to Ugo Boncompagni, **Gregory XIII from 1572**, then back to the Cesi. **Federico Cesi, duke of Acquasparta**, lived here |
| **Palazzo Milesi** | Via della Maschera d'Oro 9 | cod. 7051, **PONTE** | 15th c., built by the **Milesi**, a Bergamo family; Giovanni Giuseppe Milesi moved to Rome in **1480** and had it built in the early 1500s, possibly by joining three separate houses. **The street is named from a 16th-century golden-mask fresco once at the centre of its façade, now lost** |
| **Palazzo Montevecchio Chiovenda** | Piazza di Montevecchio 5-7 | cod. 7548, **PONTE** | Renaissance. Probably for the counts, later dukes, of **Montevecchio**, a branch of the Gabrielli of Gubbio. Design **attributed without documentary certainty to Baldassarre Peruzzi**; finished **around 1515**. Houses the Arciliuto (§5.9). **The tradition that Raphael first lodged here is presented as tradition in the source — write it as tradition or not at all** |
| **Palazzo Boncompagni Corcos** (Scarinci) | Via del Governo Vecchio, cnr Via degli Orsini, facing Piazza dell'Orologio | Via del Governo Vecchio = **PONTE + PARIONE**, flag §7.4; Via degli Orsini cod. 7985 = **PONTE** | Mannerist. **In 1582 Salomon Corcos**, educated by the Oratorians, converted and took the name of the reigning pope, **Ugo Boncompagni / Gregory XIII**; the family was then able to build this palace in the 17th century. Later the Scarinci and the Camerata |
| **Palazzo Capponi Stampa** (Orsini Capponi Stampa Pediconi) | cnr Via dei Banchi Nuovi / Via degli Orsini, on Piazza dell'Orologio | cods. 1296 & 7985, both **PONTE**; the piazza is shared, §7.4 | Built in the early 1600s for **Cosimo Orsini**; **sold in 1672** to Monsignor Capponi, bishop of Mileto; to the **Stampa** in the 18th century |
| **Palazzo Gambirasi** | Via della Pace 8 | Via della Pace = **PONTE + PARIONE**, flag | **1659**: the Arciconfraternita di San Giacomo degli Spagnoli commissioned **Giovanni Antonio De Rossi** to build a new palace incorporating existing buildings. De Rossi aligned the façade to **Pietro da Cortona**'s scheme for the piazza in front of Santa Maria della Pace. Sold during construction to Monsignor Donato Gambirasi of Bergamo, who completed it and put up his arms |
| **Casa di Fiammetta** | Piazza Fiammetta, cnr Via della Maschera d'Oro and Via degli Acquasparta | cods. 4063, 7051, 91 — all **PONTE** | Renaissance house of **Fiammetta Michaelis**, the Florentine courtesan, favourite of the humanist Cardinal Giacomo Ammannati Piccolomini, whose estate she inherited on his death in **1479** — a bequest **Sixtus IV** blocked, appointing a commission |
| **Albergo dell'Orso** | apex of the triangle of Via di Monte Brianzo, Via dei Soldati and Via dell'Orso | Via dei Soldati cod. 10099 = **PONTE**; the other two are **CAMPO MARZIO + PONTE**, flag §7.5 | Medieval building. **Now houses the Hostaria dell'Orso restaurant.** A marble relief survives at no. 87 |
| **Palazzo Sforza Cesarini** | Piazza Sforza Cesarini | cods. 9998/9999/10000, all **PONTE** | it.wikipedia's `Palazzo Sforza Cesarini` is a **disambiguation page** — there is no Rome article. The Via dei Banchi Vecchi article calls it *"già palazzo della Zecca poi della Cancelleria (vecchia)"*. **Under-sourced: §9.5** |

Named in the it.wikipedia rione article but with **no article of their own and no source I
fetched** — recorded as leads only, not candidates: **Palazzo Bassi** (Corso Vittorio Emanuele II),
**Palazzo del Drago** (Via dei Coronari), **Palazzo Vecchiarelli**, **Casa-studio di Marcello
Piacentini** (Via di Tor di Nona), **Torre della Scimmia** (Via dei Portoghesi — and that street is
a **three-way** SISTO straddler, so even with a source it would be flagged), and the so-called
**"Casa di Raffaello"** at Via dei Coronari 124 / Via di Panico 68. On the last, note that the same
article says **the painter never lived there** — it was bought under his will to endow the upkeep
of his tomb in the Pantheon. **Any page that calls it "Raphael's house" without that sentence is
misleading.**

---

## 5-bis. STREETS, SQUARES, TOWERS AND STREET FURNITURE

### 5-bis.1 Via dei Coronari — the brief's headline street, and it is clean
- **Kind:** historic-site. **Rione: Ponte, uncontested on three methods.** **SISTO cod. 3113: PONTE
  alone**, "DA PIAZZA DI TOR SANGUIGNA A PIAZZA DEI CORONARI". Vertex geometry: Ponte on every
  segment. it.wikipedia: *"termina a Piazza di Tor Sanguigna nel rione Ponte"*. OSM `w204003771`
  carries wikidata Q1032187.
- **This is the one major Ponte street with no straddle at all**, which makes it the safest
  street-as-place record in the file. **Piazza dei Coronari (cod. 3112) is likewise PONTE alone.**
- **About 500 m long** (it.wikipedia — a measurement, expressly permitted).
- **History** (it.wikipedia `Via dei Coronari`): medieval in origin, then called **Via Recta**,
  because it was one of the few regularly aligned streets in Rome at the time, and the quickest way
  to St Peter's from the Porto di Ripetta. Heavily used by pilgrims and so by the sellers of
  *corone* — rosaries — and holy images who set up their shops there, and who give the street its
  name. From the early 16th century the street and its surroundings were lived in by some of the
  city's higher-ranking courtesans, which is the same thread as the Casa di Fiammetta (§5.10).
- **Trap:** the source calls it *"una famosa strada"* and notes it appears in numerous Italian
  films. **"Famous" is a superlative form and must not be carried.** The film appearances are a fact
  but I did not fetch a source naming a specific film reliably, so I record none.
- The street's frontage today is antique dealers and small shops. **Do not characterise the trade
  in ranking terms**; if a page wants to say what is on the street, say what the shops sell.

### 5-bis.2 Other streets and squares that could carry a page
All SISTO-clean Ponte unless flagged. Each has real content; none has an article of its own except
where noted.

- **Via Giulia** — the brief's other headline street. **STRADDLER, §7.2.** it.wikipedia has a
  substantial article (`Via Giulia`) describing it as important for historical and architectural
  reasons; it was **opened by Julius II in 1508** as a straight run from the heart of the city
  toward the Vatican (per the San Giovanni dei Fiorentini article, which dates the project
  precisely). **Ponte holds its northern end and four buildings on it; it does not hold the street.**
- **Via dei Banchi Nuovi** (cod. 1296, PONTE) and **Via del Banco di Santo Spirito** (1298, PONTE) —
  the *Banchi*, the papal banking quarter that gives Santi Celso e Giuliano "in Banchi" its name
  (§4.6) and the Banco di Santo Spirito palace its address (§5.10). **Via dei Banchi Vecchi is a
  three-rione straddler and is not Ponte's** (§7.6 #6) — the New and Old Banks streets fall on
  opposite sides of the ruling, which is a trap worth stating plainly.
- **Piazza di Ponte Sant'Angelo** (cod. 8845, PONTE) — the left-bank square at the bridgehead. The
  it.wikipedia rione article records that condemned prisoners were led here in procession and that
  **a gallows stood in this square.** That is the rione's own dark history and it is sourced; it is
  also the reason the Carceri di Tor di Nona (§5-bis.4) and this square belong in one narrative.
  **The square is Ponte's even though the bridge is shared** — SISTO is explicit on both.
- **Piazza di San Salvatore in Lauro** (9649, PONTE) · **Piazza Lancellotti** (6120, PONTE) ·
  **Piazza Fiammetta** (4063, PONTE) · **Piazza di Montevecchio** (7548, PONTE) ·
  **Piazza Sforza Cesarini** (9998, PONTE) · **Piazza dell'Oro** (7974, PONTE) ·
  **Piazza Pasquale Paoli** (8294, PONTE) — all clean, all with a named building on them already
  covered above. **Recommend these appear as addresses inside those building records rather than as
  separate squares**, except San Salvatore in Lauro and Ponte Sant'Angelo, which carry enough on
  their own.
- **Via della Maschera d'Oro** (7051, PONTE) — named from a 16th-century golden-mask fresco once at
  the centre of Palazzo Milesi's façade, **now lost** (§5.10). Palazzo Milesi, Palazzo Cesi-Gaddi
  and the Casa di Fiammetta all stand on or at the corner of it. A genuine painted-façade street.
- **Via di Monte Giordano** (7437, PONTE) and **Via di Panico** (8173, PONTE) — the approach to
  Monte Giordano (§5-bis.3). The it.wikipedia rione article's own lead photograph is of Via di Panico.
- **Piazza dell'Orologio** — **STRADDLER, §7.4**, but the richest square in the rione by content.

### 5-bis.3 Monte Giordano and Tor Sanguigna — the medieval layer

- **Monte Giordano.** **Kind:** historic-site. it.wikipedia `Monte Giordano`, coordinates
  41.900037, 12.468871; **vertex geometry and SISTO both put its street in PONTE alone.**
  A **small rise in the centre of Rome**, in the Regio formerly called *Scorteclaria*, probably
  formed by the accumulation of debris from the nearby ancient river landing, the *statio marmorum*
  at Tor di Nona. Known from the mid-12th century as a fortified holding of Johannes Roncionis;
  a bull of **Alexander III in 1177** attests the church of Santa Maria in Monticello there,
  belonging to the monastery of Sant'Elia di Falleri. In the next century it belonged to Stefano
  Petri de Monte, of the Stefaneschi, who held the *Turris Maior* on it. **The Orsini took
  possession progressively between 1242 and 1262**, and it is from an Orsini Giordano that it is
  named. Palazzo Taverna (§5.10) stands on it.
  **A hill you cannot really see is a hard page to write. It is excellent material inside the
  Palazzo Taverna and Via dei Coronari records.**
- **Tor Sanguigna.** **Kind:** historic-site. it.wikipedia `Tor Sanguigna`: **one of Rome's medieval
  towers**, in the rione Ponte, and what survives of the stronghold of the **Sanguigni** family,
  who lived there until at least the 15th century and died out in the 18th. Possibly descended from
  a first tower built by the Gemini family before the 11th century. In the Middle Ages the toponym
  covered the whole area between what is now Via Zanardelli, Via dei Coronari and Sant'Agostino.
  **Riccardo Sanguigni was beheaded here in 1406** by Paolo Orsini for siding with the Colonna.
  **CAUTION: the tower is Ponte's but the square in front of it is not** — **Piazza di Tor
  Sanguigna is SISTO PARIONE + PONTE** (§7.6 #12), and **Via di Tor Sanguigna is PONTE + PARIONE**.
  The tower, the square and the street are three objects with three different answers. Do not
  collapse them.

### 5-bis.4 Carceri di Tor di Nona — vanished, but the reason a street is named
it.wikipedia `Carceri di Tor di Nona` calls them *"le principali prigioni di Roma"* from the start
of the 15th century. **"Principal prisons of Rome" is a ranking claim and attribution does not save
it — do not carry it.** What is safely publishable is the rest: from the early 15th century these
and the prisons of Corte Savella were together called the *presone dello papa*, a name they kept
until 1657.
They stood near what is now the lungotevere of the same name, in a tower that passed to the
hospital of the Compagnia del Salvatore in **1395** under the will of Giovanni di Jacobello Orsini.
The name is probably from its being the ninth tower coming from Porta Flaminia; it was anciently
part of the city's defensive wall.
**Not a place record — nothing survives.** It is the connective tissue between Lungotevere Tor di
Nona, the Teatro Tordinona (§5.9, built on the site of the prison building) and Piazza di Ponte
Sant'Angelo's gallows (§5-bis.2).

### 5-bis.5 Fountains and street furniture
- **Fontana di piazza San Simeone.** OSM `w551345102`, wikidata Q3747435, **vertex test 20/20
  Ponte**; Piazzetta di S. Simeone is SISTO cod. 10050, **PONTE alone.** it.wikipedia
  `Fontana di piazza San Simeone`: 16th-century in origin, from the works that branched the Acqua
  Felice conduit; **definitively placed in this square in 1973.** It stood originally in Piazza
  Montanara, in front of the Theatre of Marcellus — **which is Sant'Angelo's per wave 1, so do not
  let a sentence about its origin read as a claim on that site.** Roma Capitale's own
  sovraintendenzaroma.it carries a page for it (linked from it.wikipedia; I did not fetch the leaf).
  **A good, small, clean record.**
- **Fontana della Terrina** — **suspended, §7.4.** Do not write it.
- **Arco dei Banchi.** OSM `n9676942017`, `tourism=attraction`, addressed to Via dell'Arco de'
  Banchi — **SISTO cod. 940, PONTE alone.** it.wikipedia has **no article** (I checked; the title is
  missing). **Under-sourced: I have a name, a kind and a clean rione, and nothing else.** Lead only.
- **Monumento a Terenzio Mamiani della Rovere**, OSM `n685957631`, `historic=memorial`,
  `start_date=1892`, vertex test Ponte, on Corso Vittorio Emanuele II. **The Corso is a four-rione
  straddler**, so even a monument standing on it needs the flag. romasegreta files it under Ponte
  (§3.4 — discovery only).
- **Monumento a Nicola Spedalieri**, OSM `w662075333`, `historic=memorial`, vertex test 5/5 Ponte.
  On Piazza Sforza Cesarini, which is **SISTO cod. 9998, PONTE alone.** Cleaner than the Mamiani.
- **Acqua Vergine** drinking fountain (`n1429382773`, wikidata Q76958894) and a **Fontanella per
  cani** (`n1168549494`, `historic=fountain`, wikidata Q76953668), both vertex-tested Ponte.
  **Nasoni and a dog fountain are not places.** Recorded so nobody mistakes the wikidata IDs for
  significance.

---

## 6. BRIDGES, THE RIVER FRONT, AND THE ANCIENT CROSSING

**Every bridge here is a straddler and I resolve none of them.** SISTO and my geometry agree on all
four, which makes them clean straddlers rather than doubtful ones.

### 6.1 Ponte Sant'Angelo — **STRADDLER: PONTE + BORGO**
- **SISTO cod. 591: BORGO + PONTE**, "DA PIAZZA DI PONTE S. ANGELO A LUNGOTEVERE VATICANO".
- My vertex test on OSM `w134399943` (wikidata Q870476): **Ponte 28 / Borgo 27** — as even a split
  as this programme has produced. it.wikipedia: *"nei rioni Ponte e Borgo"*.
- Roma Capitale point (41.901193, 12.466507) → Ponte; Nominatim at that point → Ponte. **Both are
  left-bank pins and prove only that the left half is Ponte's.**
- **Geometry and Nominatim agree point for point across the span** (§2.4.1): both return Ponte at
  the left-bank end and Borgo at mid-span and beyond. Four sources — SISTO, vertex geometry,
  Nominatim and it.wikipedia — all say the same thing, which is that **this bridge belongs to two
  rioni and to neither alone.**
- **The rione is named after it, and its coat of arms is the bridge — white on red** (it.wikipedia
  `Ponte (rione di Roma)`). The same article records that the bridge **belonged to the rione until
  Sixtus V created the rione Borgo in the 16th century.** That is the strongest argument for Ponte
  in the file and it is a historical one, not a geometric one. **The arbitrator should have it.**
- Built in **135** by Hadrian as the **pons Aelius**, to link his mausoleum to the city. Peperino
  faced with travertine, three arches, approached by ramps carried on three minor arches on the
  left bank and two on the right; **the right-bank ramp arches were destroyed in 1893** for the
  embankment works and replaced with modern ones. Used in **July 472** by Ricimer's Gothic troops.
- Roma Capitale page: https://www.turismoroma.it/it/luoghi/ponte-santangelo
- **The Bernini angels.** OSM carries four as separate objects, all inside Ponte:
  *Angelo con i flagelli* (`n1987645793`), *Angelo con il sudario* (`n1987645829`),
  *Angelo con la colonna* (`n1987645824`), *Angelo con la corona di spine* (`n1987645828`).
  **Do not write these up as ten separate places, and do not call any of them "Bernini's only"
  anything** — that is a banned superlative form. **Also do not claim any of the bridge statues is
  by Bernini's own hand without a source that says so of that specific statue**: the two he carved
  himself are in Sant'Andrea delle Fratte, which is Colonna's, and the bridge carries copies. I did
  not fetch a source that settles which is which. §9.4.

### 6.2 Ponte Vittorio Emanuele II — **STRADDLER: PONTE + BORGO**
- **SISTO cod. 11491: PONTE + BORGO**, "DA PIAZZA PASQUALE PAOLI A LUNGOTEVERE VATICANO".
- Vertex test on `r5657672` (wikidata Q770949): **Ponte 27 / Borgo 26.** it.wikipedia: connects
  Piazza Pasquale Paoli, in the rione Ponte, to Lungotevere Vaticano (Borgo). Roma Capitale point
  (41.900279, 12.464385) → Ponte.
- Designed by **Ennio De Rossi, 1886**; named before it was built; work interrupted, resumed
  **1908**; **first inaugurated 5 May 1911** for the fiftieth anniversary of Italian unification and
  **again on 28 April 1912** when the sculptural groups were finally placed. Officially
  **Ponte Vittorio Emanuele Secondo since 2015** (it.wikipedia) — and SISTO's own `denominazione`
  is "VITTORIO EMANUELE II" while OSM uses "Secondo", which is a real naming trap.
- Roma Capitale page: https://www.turismoroma.it/it/luoghi/ponte-vittorio-emanuele-ii, which links
  sovraintendenzaroma.it.
- Its winged Victories are in OSM as *Vittoria Alata* (`r5657674`, `r5657675`) and the reliefs as
  *Proclamazione dell'Unità d'Italia* (`w128817406`, start_date 1911) and *Fedeltà allo statuto*
  (`w128817407`, start_date 1911), all inside Ponte. **Sub-parts of the bridge, not places.**

### 6.3 Ponte Umberto I — **STRADDLER: PONTE + PRATI**
- **SISTO cod. 10897: PRATI + PONTE**, "DA PIAZZA DI PONTE UMBERTO I A PIAZZA DEI TRIBUNALI".
- Vertex test on `r5679034` (wikidata Q2785646): **Ponte 7 / Prati 4.** it.wikipedia: *"nei rioni
  Ponte e Prati"*.
- Designed by **Angelo Vescovali**, built **1885–1895**, dedicated to Umberto I, who inaugurated it
  with Queen Margherita. **Three masonry arches faced in travertine and Subiaco stone; about 106 m
  long** (it.wikipedia). Measurements are expressly permitted by the corpus rules.
- **Prati already ships three bridges** — Regina Margherita, Pietro Nenni, Giacomo Matteotti — and
  **does not have this one.** The arbitrator should note the pattern: Prati's file drew its bridge
  line somewhere, and Umberto I fell outside it.
- OSM also carries *Punto panoramico di Ponte Umberto I* (`n4978038129`, `tourism=viewpoint`),
  inside Ponte. A viewpoint on a straddling bridge; flag with the bridge.

### 6.4 Ponte Principe Amedeo Savoia Aosta — **STRADDLER: THREE RIONI**
- **SISTO cod. 9060: TRASTEVERE + BORGO + PONTE.** it.wikipedia agrees: *"nei rioni Ponte,
  Trastevere e Borgo"*. Vertex test on `r5678999` (wikidata Q3908014): Ponte 14 / Borgo 11.
- **Roma Capitale's own published point (41.899803, 12.463413) lands in BORGO** — the only one of
  fifteen that does not land in Ponte. It is pinned at the right-bank end. This is the clearest
  demonstration in the file that a single official coordinate cannot settle a linear feature.
- Dedicated to **Amedeo of Savoy-Aosta**. Built to a Comune di Roma design, executed by **Rodolfo
  Stoelcker**, **completed 1942 in 34 months** despite repeated interruptions. Three masonry arches.
- **Borgo already ships the Galleria Principe Amedeo di Savoia-Aosta**, which SISTO records
  (cod. 9059) as **BORGO + TRASTEVERE** — no Ponte at all. The gallery and the bridge are
  different objects with different rione sets and must not be conflated.

### 6.5 Ponte Neroniano — remains
- OSM `w226257804`, `historic=archaeological_site`, wikidata Q1902995. **Vertex test: 9/9 Ponte.**
  it.wikipedia coordinates 41.90084, 12.46437.
- The Neronian or Triumphal bridge, which carried the ancient Via Triumphalis across the Tiber.
  **Built under Nero in the 1st century** to improve links with his property on the right bank,
  including his mother Agrippina's villa; an attribution to Caligula has also been argued. The date
  of its destruction is unknown; it may have gone out of use when the Aurelian Walls were built.
  A pier stub survives.
- **Genuinely good, genuinely fragile.** Visible only at low water. **Do not give directions to it
  and do not say it is "visible from" anything** — that is vague-proximity wayfinding. State what it
  is and where it stood.

### 6.6 The Lungoteveri
All four are SISTO records in their own right and three are Ponte alone:
**Lungotevere degli Altoviti** (cod. 461, PONTE, "DA PONTE S. ANGELO A PIAZZA PASQUALE PAOLI") ·
**Lungotevere dei Fiorentini** (4164, PONTE, "DA PIAZZA PASQUALE PAOLI A VIA ACCIAIOLI") ·
**Lungotevere Tor di Nona** (10600, PONTE, "DA PIAZZA SANT'ANGELO A PIAZZA DI PONTE UMBERTO I",
instituted by deliberation of **20 July 1887** per it.wikipedia) ·
**Lungotevere Marzio** (7046, **PONTE + CAMPO MARZIO**, flag) ·
**Lungotevere dei Sangallo** (9686, **REGOLA + PONTE**, flag).

These are the embankment roads built after 1870. The it.wikipedia rione article is explicit that
their construction **erased every lane that used to run down to the river**, and that the rione's
character survives further inland. That is the honest frame for all five.

---

## 7. THE CONTESTED EDGE WITH PARIONE — the heart of this wave's problem

### 7.1 Santa Maria dell'Anima — **evidence now leans hard to Ponte; still flagged**
- **Geometry 14/14 Ponte** on `w52334111`, and **4/4 Ponte** on the centroid-plus-three-vertices
  retest (§2.4.1).
- **Nominatim 4/4 Ponte** on the same four points. **Wave 2's single *Parione* reading does not
  reproduce** at any point inside the footprint.
- it.wikipedia files it in `Categoria:Chiese di Roma (rione Ponte)`.
- The it.wikipedia rione article lists it under Ponte's religious buildings.

**Against, and the reason it stays flagged:** SISTO records its own street, **Via di S. Maria
dell'Anima (cod. 6878), as PONTE + PARIONE**, and the it.wikipedia rione article carries a
photograph captioned *"Targa viaria di 'Via di Santa Maria dell'Anima', sul lato del rione
Parione"* — the street sign photographed on the Parione side. Address: Via di Santa Maria
dell'Anima 66.

So: **the building tests Ponte on every method and every point; the street it is addressed to is
officially shared.** That is the same shape as Palazzo Altemps on Piazza di Sant'Apollinare (§7.3),
and it should probably be ruled the same way. **I am not calling it.** But the arbitrator should
know that the specific ground on which wave 2 called this contested — a Nominatim disagreement —
did not survive an eight-test retest.

### 7.2 Via Giulia — **FLAG: PONTE + REGOLA (SISTO cod. 5389)**
The brief asked for "Via Giulia north end". **The north end is Ponte's and the street is not.**
Everything on it that I found — Palazzo Sacchetti (66), San Biagio degli Armeni (63), Santa Maria
del Suffragio, the Museo Criminologico behind it on Via del Gonfalone — footprint-tests wholly in
Ponte, and Roma Capitale's own point for Palazzo Sacchetti lands in Ponte. **The buildings are
Ponte's; the street is shared and Ponte may not own it as a place.** Wave 2's Via Frattina
precedent (P6: out as a place, usable as an address) is the closest analogue.
Note also that **Regola is in this wave**, so this one can actually be settled now.

### 7.3 Piazza di Sant'Apollinare — **FLAG: PARIONE + PONTE (SISTO cod. 865)**
Palazzo Altemps's published address. The **building** tests wholly Ponte on three methods; the
**square** is officially shared. Precisely the split wave 2 drew for the Area Sacra (clean) versus
Largo di Torre Argentina (shared). **Recommend: the palace and museum are Ponte's; the square is
nobody's until the arbitrator says otherwise.**

### 7.4 The Governo Vecchio / Orologio group — **FLAG, all of it**
- **Piazza dell'Orologio** — SISTO **PONTE + PARIONE**; geometry Ponte 14 / Parione 5;
  it.wikipedia prose *"a Roma nel rione Ponte"*. Named from the clock on the Filippini convent
  tower, **built by Francesco Borromini in 1648**, with a **Pietro da Cortona** mosaic of the
  Madonna della Vallicella below the dial. **Palazzo Bennicelli** on the square was begun **1660**
  to Borromini's design for Monsignor Virginio Spada, for the Banco di Santo Spirito.
- **Via del Governo Vecchio** — SISTO **PONTE + PARIONE**; geometry Ponte 18 / Parione 1. Wave 2
  ruled Parione may not claim addresses on it "while it is Ponte's". **SISTO says it is not purely
  Ponte's either.** This changes the basis of that ruling and the arbitrator should see it.
- **Fontana della Terrina** — it.wikipedia says it now stands in Piazza dell'Orologio and calls
  that square **"nel rione Parione"**, directly contradicting its own Piazza dell'Orologio article
  and SISTO. It was in Campo de' Fiori until 1899, in store for a quarter-century, moved to Piazza
  della Chiesa Nuova in 1924, and moved again to its present place in 2026. **Wave 2 suspended it.
  I uphold the suspension and add that the contradiction is now internal to one source.**
- **Piazza della Chiesa Nuova** — SISTO **PARIONE + PONTE.** Parione's shipped file does not have
  it and neither should Ponte without a ruling.

### 7.5 The Campo Marzio edge
**Via dell'Orso** (CAMPO MARZIO + PONTE) and **Via di Monte Brianzo** (CAMPO MARZIO + PONTE) both
straddle, and the **Albergo dell'Orso** sits at the apex of the triangle they form with Via dei
Soldati (Ponte alone). Its footprint is not in my harvest as a distinct object, so I have no vertex
count for the building itself. **Flag.** Note also **Vicolo dell'Orso** is **Campo Marzio alone**
while Via dell'Orso is shared, and **Antica Dimora dell'Orso**, a hotel, vertex-tests into **Campo
Marzio** — three near-identical names across a rione line, which is a collision waiting to happen.

### 7.6 The full straddler list — 31 rows, 32 objects, none resolved by me

| # | Object | Rioni |
|---|---|---|
| 1 | Ponte Sant'Angelo | Ponte + Borgo |
| 2 | Ponte Vittorio Emanuele II | Ponte + Borgo |
| 3 | Ponte Umberto I | Ponte + Prati |
| 4 | Ponte Principe Amedeo Savoia Aosta | Ponte + Borgo + Trastevere |
| 5 | Via Giulia | Ponte + Regola |
| 6 | Via dei Banchi Vecchi | Ponte + Parione + Regola |
| 7 | Via del Governo Vecchio | Ponte + Parione |
| 8 | Piazza dell'Orologio | Ponte + Parione |
| 9 | Via della Pace | Ponte + Parione |
| 10 | Via di Santa Maria dell'Anima | Ponte + Parione |
| 11 | Chiesa di Santa Maria dell'Anima — building tests Ponte 8/8; its street is shared | Ponte-leaning |
| 12 | Piazza di Tor Sanguigna | Parione + Ponte |
| 13 | Via di Tor Sanguigna | Ponte + Parione |
| 14 | Piazza del Fico | Parione + Ponte |
| 15 | Largo Febo | Parione + Ponte |
| 16 | Via di Tor Millina | Ponte + Parione |
| 17 | Via del Corallo | Parione + Ponte |
| 18 | Via dei Filippini | Ponte + Parione |
| 19 | Piazza della Chiesa Nuova | Parione + Ponte |
| 20 | Piazza delle Cinque Lune | Ponte + Sant'Eustachio + Parione |
| 21 | Piazza di Sant'Apollinare | Parione + Ponte |
| 22 | Via dei Pianellari | Ponte + Sant'Eustachio |
| 23 | Piazza di Sant'Agostino | Sant'Eustachio 9 / Ponte 2 (geometry) |
| 24 | Via dei Portoghesi | Campo Marzio + Ponte + Sant'Eustachio |
| 25 | Via dell'Orso | Campo Marzio + Ponte |
| 26 | Via di Monte Brianzo | Campo Marzio + Ponte |
| 27 | Via del Cancello | Ponte + Campo Marzio |
| 28 | Lungotevere Marzio | Ponte + Campo Marzio |
| 29 | Lungotevere dei Sangallo | Regola + Ponte |
| 30 | Via delle Carceri · Via Bravaria | Ponte + Regola |
| 31 | Corso Vittorio Emanuele II | Sant'Eustachio + Parione + Pigna + Ponte |

**Wave 2 already ruled Corso Vittorio Emanuele II a shared edge owned by no rione.** SISTO's
four-rione record is independent confirmation. **Ponte must not take it**, notwithstanding that its
westernmost stretch and about thirty shopfronts on it test Ponte-only.

---

## 8. WHAT THE BRIEF EXPECTED THAT IS NOT HERE

- **"Palazzo Altemps and its branch of the Museo Nazionale Romano"** — present and Ponte's, but the
  brief's implied single record is two Roma Capitale records with an address conflict. §5.2.
- **"Via Giulia north end"** — the *end* is Ponte's; the *street* is officially Ponte + Regola and
  cannot be Ponte's place. §7.2.
- The brief's guess that the Pace and the Anima might be settled by this wave: **the Pace can be and
  should be** — six methods agree and wave 2's arbitrator formally disclaimed it for Parione.
  **The Anima I decline to settle**, but the ground has shifted: the Nominatim disagreement wave 2
  relied on does not reproduce at any of four points, and what remains against Ponte is one shared
  street record and one photographed street sign. §7.1. Both are now decidable by the arbitrator on
  better evidence than existed before this wave, which is what the brief asked for.

---

## 9. WHAT I AM LEAST SURE ABOUT

### 9.1 Whether SISTO's multi-rione records mean what I think they mean
This is the largest single risk in the file. I am reading `suddivisionis[]` of `tipologia: "Rione"`
on the latest-dated deliberation as "the rioni this street lies in". That reading is strongly
supported — Piazza Navona comes back Parione alone, Via di Parione comes back Parione alone, and
every one of the ~78 single-rione results matches my independent geometry. **But I did not find
documentation of the field, and the register is a toponymic instrument whose purpose is street
naming, not boundary definition.** An alternative reading — that these are the rioni consulted or
notified when the street was named — would not change any single-rione result but would weaken
every multi-rione one. **The verifier should try to find SISTO's own documentation before this
file's straddler list is treated as authoritative.**

### 9.2 Chiesa di San Simeone Profeta — extant or vanished?
§4.11. One source contradicts itself. Unresolvable with what I have.

### 9.3 How many records Palazzo Primoli should be
One building, three institutions (Museo Napoleonico, Fondazione Primoli, Museo Mario Praz), two
Roma Capitale pages, two published addresses. **I lean two records — Museo Napoleonico, with hours,
and Museo Mario Praz, without — and the palace's history distributed between them.** I am not
confident. The same shape recurs at San Salvatore in Lauro (§5.5) and Palazzo Altemps (§5.2), and
the verifier should rule the pattern once rather than three times.

### 9.4 The Ponte Sant'Angelo angels
I have four OSM objects, no source establishing which statues on the bridge are by Bernini's hand
and which are workshop or copies, and a live trap: the widely repeated claim about the two
originals concerns statues in *another rione's* church. **I did not resolve this and the page must
not guess.** §6.1.

### 9.5 Three thin records
- **Museo Criminologico** — real, sourced history, but I could not confirm it is currently open,
  and a museum page with no hours and no status is close to useless. §5.7.
- **Museo Mario Praz** — both of its official hosts failed to resolve. §5.4.
- **Palazzo Sforza Cesarini** — it.wikipedia has only a disambiguation page for the name; my only
  description of the Rome building is one clause inside another article. §5.10.

---

## 10. WORDING TRAPS FOR WHOEVER WRITES THE FILE

### 10.1 Disputed attributions — do not flatten them
Three buildings here have attributions the sources themselves present as contested:
**Palazzo Alberini** (Raphael vs Giulio Romano vs Bramante's ground floor), **Palazzo Montevecchio
Chiovenda** (Peruzzi, "without documentary certainty"), and **Santa Maria della Pace**'s first
campaign (Baccio Pontelli or Meo del Caprino "or both"). **San Giovanni dei Fiorentini's** design
history runs through several hands across two centuries and the article does not settle it.
Writing "by Raphael" or "by Peruzzi" flat converts a hedged source into a false certainty. Write
the hedge or write nothing.

### 10.2 Kinds
Per the roster's `kind_note`, the only permitted kinds are museum, theater, restaurant, cafe,
brewery, hotel, bnb, park, historic-site, amusement-park, shop, stadium, attraction. **Every church,
palazzo, bridge, tower and street here is `historic-site`.** There is no church, monument, square,
bridge or university kind. The Pontificia Università (§5.6) has no honest kind and may not be
publishable at all.

### 10.3 The three Holy See embassies
See §2.7. If anyone writes these up, the sentence "embassy to the Holy See, in Rome" is correct and
"embassy in the Vatican" is false. **My recommendation is to omit all three**: the guide value is
low and the wording risk is high.

### 10.4 Superlatives already present in my sources — all excluded from the facts above
The Italian sources are full of them: *"una delle opere più importanti del Rinascimento"* (the
cloister), *"la famosa facciata barocca"*, *"tra le più antiche istituzioni marchigiane"* (the Pio
Sodalizio), *"una famosa strada"* (Via dei Coronari), *"uno dei più importanti teatri romani"*
(the Apollo), *"importante esempio di palazzo civile rinascimentale"* (Alberini). **Attribution
does not save any of these.** I have stripped them from every fact I recorded; do not put them back.

### 10.5 Research method must not surface
Nothing in §2, §3 or §9 belongs in reader-facing text. No "did not resolve", no HTTP status, no
"vertex", no "SISTO records". The *fact* goes on the page; the *provenance* stays here.

---

## 11. PHOTO LEADS — QUARANTINED PER RULING 3

`"photos": []` everywhere. I named and linked no image and this wave sources none. Recorded only so
the image wave does not have to rediscover them: it.wikipedia articles for Santa Maria della Pace,
Palazzo Altemps, Ponte Sant'Angelo, Via dei Coronari, Piazza dell'Orologio, Casa di Fiammetta,
Tor Sanguigna, Palazzo Milesi and the four bridges all carry Commons images; several are Giuseppe
Vasi and Giovanni Battista Falda engravings of the 17th–18th centuries, which is the cleanest
licensing class in the file. **The Chiostro del Bramante's exhibition interiors are the highest-risk
class here** and should not be assumed available.

---

## 12. SOURCES THAT ANSWERED, AND THE ONE THAT MATTERS

**Answered (HTTP 200):** `geoportale.comune.roma.it/sisto/api/` · `turismoroma.it` ·
`it.wikipedia.org/w/api.php` · `nominatim.openstreetmap.org` (on backoff) ·
`maps.mail.ru/osm/tools/overpass/api/interpreter` · `romasegreta.it` · `info.roma.it` ·
`sovraintendenzaroma.it` · `chiostrodelbramante.it` · `sansalvatoreinlauro.org` ·
`piosodaliziodeipiceni.it` · `museonapoleonico.it` · `oratoriogonfalone.eu` · `pusc.it` ·
`pisma.it` · `sangiovannibattistadeifiorentini.it` · `fondazioneprimoli.it` · `arciliuto.it` ·
`giustizia.it`

**Did not answer:** `vincoliinrete.beniculturali.it` (timeout) · `catalogo.beniculturali.it`
(timeout) · `museonazionaleromano.beniculturali.it` (timeout) · `museonazionaleromano.cultura.gov.it`
(DNS) · `direzionemuseiroma.cultura.gov.it` (DNS) · `museopraz.beniculturali.it` (DNS) ·
`santamariadelsuffragio.com` (DNS) · `santamariadellanima.org` (DNS) · `santacroce.it` (refused) ·
`icrss.it` (403) · `guide.michelin.com` (returned a zero-byte body — **do not treat as reachable**) ·
`overpass-api.de` (429 throughout) · `overpass.kumi.systems` (504 throughout)

**For the coordinator, and it is the only item that matters:**

> **SISTO is live and it is a JSON API.** `https://geoportale.comune.roma.it/sisto/api/viario?denominazione.contains=<NAME>`
> then `…/api/viario/{id}`, reading `elementoDeliberas[].suddivisionis[]` where `tipologia == "Rione"`.
> Wave 2's arbitration named this as the single highest-value fetch outstanding in the programme and
> said one attempt from another network was worth making. **The attempt succeeded.** It settles
> Piazza della Rotonda, Piazza Venezia, Piazza di San Silvestro, Via Frattina, Via del Seminario and
> every other street-level question the previous three waves suspended, and it should be re-run
> across all twelve shipped files before any of them is treated as final. §3, and read §9.1 first.

---

## 13. LEADS DELIBERATELY NOT DEVELOPED

Ponte holds roughly 120 restaurants, cafés, bars, gelaterie, hotels and shops that test 100 % inside
its boundary. **I did not research any of them**, because none is establishable beyond identity,
address and hours from its own site, and the roster forbids using an official site for awards or
trading history — which is the only thing that would make most of them guide-worthy. The handful a
guide would plausibly want, recorded here as leads and nothing more:

Il Pagliaccio (Via dei Banchi Vecchi 129a) · Il Convivio Troiani (Vicolo dei Soldati 31) ·
Gelateria del Teatro (Via dei Coronari 65/66) · Odradek, a bookshop (Via dei Banchi Vecchi 57) ·
Etabli (Vicolo delle Vacche 9) · Hostaria dell'Orso, in the Albergo dell'Orso (§5.10) ·
Antico Caffè della Pace · Raphael Hotel · Hotel Genio (Via Zanardelli 28) ·
Taverna Giulia (Vicolo dell'Oro 23) · Coromandel (Via di Monte Giordano 60/61).

**`guide.michelin.com` returned a zero-byte body**, so no star or rating is establishable for any of
them and none may be claimed. Every street named above is SISTO-clean Ponte except Via dei Banchi
Vecchi, which is a three-rione straddler — so **Il Pagliaccio and Odradek would need flagging even
as leads.**

Also deliberately not developed: about 60 further vicoli and passages that are SISTO-clean Ponte
(§3.1) but carry no content beyond a name and an etymology. **A rione with fifty solid entries does
not need to pad with alleys**, and the corpus is better for their absence.
