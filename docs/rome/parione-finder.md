# Parione (R. VI, code 106) — FINDER file

Wave 2, Rome programme. Research date **2026-09-02**. This is **evidence, not adjudication**.
I am not deciding what ships. A verifier adjudicates; an arbitrator rules ownership of straddlers.

**Rulings observed.**
1. *No designation claims.* No `vincolo`/"listed"/"protected monument"/"national monument" claim
   appears below, in English or Italian. I re-tested both registers this session and both are still
   dead — see §2.4. Wikidata **does** serve a designation property and I hit it; it is quarantined
   in §8.1 and must not be published.
2. *Vatican City belongs to no rione.* No Vatican City place is claimed for Parione. Parione holds
   one Lateran Treaty **Art. 15 extraterritorial** property — the **Palazzo della Cancelleria** —
   and I sourced its status from the treaty's own text rather than a summary. See §4.1.
3. *No photographs.* `"photos": []` everywhere. I named and linked no image. Photo leads are
   quarantined in §9.

---

## 1. Headline numbers

| | |
|---|---|
| Guide-worthy candidate entries found | **144** |
| — named POI candidates (churches, palazzi, fountains, museums, monuments, bookshops…) | 77 |
| — named streets/piazzas/passages not already counted as POIs | 67 |
| **Straddlers — flagged, NOT resolved by me** | **37** |
| Places the brief expected in Parione that are **not** in Parione | 3 (§5) |
| Named POIs harvested in the padded bbox before rione filtering | 894 |

The brief anticipated ~40 named entries. I found 144 guide-worthy ones against a 894-name harvest.
That is **not** a claim that 144 should ship — a large share are minor vicoli, ordinary bars and
gelaterie, and parish-scale churches whose guide-worthiness is thin (§6). Per the brief's warning
that a high confirmation rate is a warning sign, I deliberately over-collected at the edges.

Parione is tiny — its OSM bounding box is about **0.0062° lat × 0.0067° lon** (roughly 690 m × 560 m).
Every one of its four land borders is contested by a neighbouring rione somewhere along its length.

---

## 2. Method

### 2.1 Geometry, not reverse geocoding — and I verified the polygons before trusting them

I used the boundary-geometry method the Trastevere finder recommended the programme standardise on,
because the brief's suggested route (Nominatim `quarter` field) is rate-limited and centroid-only.

1. Pulled boundary relations for **all 22 rioni** from Overpass
   (`rel["boundary"="place"]["place"="quarter"]` over a Rome-centre bbox). All 22 returned.
2. Stitched unordered way fragments into closed rings by endpoint matching. **All 22 resolved to
   exactly one clean closed ring each** — no gaps, no multipolygon ambiguity.
3. Ray-casting point-in-polygon locally: no rate limit, no network per lookup, deterministic.
4. For every way/relation candidate I fetched **full geometry and tested every vertex**, so a
   piazza or a street reports *all* the rioni it crosses, with the share of vertices in each.

Parione boundary relation: **OSM r5452744**, `official_name=Rione VI Parione`, `ref=R. VI`,
`wikidata=Q2052302`, `name=Parione`. https://www.openstreetmap.org/relation/5452744
(Note the `ref` normalisation trap the earlier research flagged still holds: Parione carries
`ref=R. VI` while Trastevere carries bare `ref=XIII`. Any roster join on `ref` must normalise.)

**Sanity check run before trusting the polygon set** — 11 landmarks with independently known rioni:
Piazza Navona→Parione, Pantheon→Pigna, Trevi Fountain→Trevi, Colosseum→Celio, Santa Maria in
Trastevere→Trastevere, Castel Sant'Angelo→Borgo, Largo di Torre Argentina→Pigna,
Palazzo della Cancelleria→Parione, Pasquino→Parione. All correct, and the first five reproduce the
Trastevere finder's results exactly. Two are worth recording:
- **Piazza Venezia → Trevi.** Not Campitelli, not Pigna. Wave 1 should be aware.
- **Largo di Torre Argentina → Pigna**, cleanly; it did not come out on the Parione line at all.
  The brief asked me to watch this one. It is nowhere near Parione and I make no claim on it.

### 2.2 A tooling trap that silently returns nothing

My first Overpass call used `out geom tags;`. The `tags` output mode **suppresses member geometry**,
so all 22 relations came back with `bounds` and `tags` but zero members. Stitching produced 0 rings
for every rione and every point-in-polygon test returned `[]` — a clean, plausible-looking
"nothing is anywhere" result. `out geom;` alone is correct. Anyone repeating this should print ring
counts before trusting a classification run; I caught it only because I printed them.

### 2.3 Second-method verification, as instructed

I re-checked 15 points with **Nominatim reverse geocoding** (`quarter` field), the brief's method.
It worked here — no 429s at this volume — and it **agreed with my polygons on 12 of 15**. The three
disagreements are all real boundary cases and are flagged as straddlers in §3, not silently resolved:

| Point | My geometry | Nominatim `quarter` |
|---|---|---|
| Santa Maria dell'Anima | Ponte (28/28 vertices) | **Parione** |
| Piazza del Fico | Ponte 60% / Parione 40% | **Parione** |
| Piazza Madama | Parione 71% / Sant'Eustachio 29% | **Sant'Eustachio** |

Where a third source exists (it.wikipedia prose naming the rione) I recorded it too. On
**Santa Maria della Pace all three agree on Ponte** — see §5.1.

### 2.4 The state registers are still unreachable — Ruling 1's basis re-confirmed today

I re-tested rather than assuming:

| Host | Result today |
|---|---|
| `vincoliinrete.beniculturali.it` | `urlopen error timed out` |
| `www.catalogo.beniculturali.it` | `urlopen error timed out` |

Consistent with the earlier ECONNREFUSED/timeout findings. **No designation claim is possible.**

### 2.5 Sources that worked, and one that newly matters

`whc.unesco.org` (200), `vatican.va` (200), `sovraintendenzaroma.it` (200),
`museodiroma.it` (200), `museobarracco.it` (200), `archiviocapitolino.it` (200),
`santagneseinagone.org` (200), `stadiodomiziano.com` (200), `casadelleletterature.it` (200),
it.wikipedia + Wikidata APIs (200, raw wikitext/JSON — not summarised).

Failed: `museiincomune.it` (SSL handshake failure), `vallicelliana.it` (timeout),
`teatrodeisatiri.it` (SSL EOF), `chiesanuova.org` (NXDOMAIN — **does not exist**; do not cite it).

**The Sovrintendenza Capitolina per-monument pages carry eight Parione items** and are Roma
Capitale's own heritage voice. They gave me author, date and material for the fountains and
monuments, and they are the strongest per-property source available given §2.4. Enumerated from
`/i_luoghi/...` index pages: Fontana dei Quattro Fiumi, Fontana della Terrina, Fontana in Campo
de' Fiori, Monumento a Giordano Bruno, Monumento a Pietro Metastasio, Museo Barracco, Museo di
Roma, Stadio di Domiziano.

---

## 3. STRADDLERS — 37, flagged and NOT resolved

Share = percentage of the feature's OSM vertices falling in each rione. **The arbitrator decides.**

### 3.1 The four POI/piazza straddlers that matter

| Place | OSM | Geometry | Centroid says | Note |
|---|---|---|---|---|
| **Campo de' Fiori** (square) | way/4949430 | Parione 60% / Regola 40% | Parione | it.wikipedia: *"ai confini dei rioni Parione e Regola"* — the source itself declares it a straddler. The **street-named** OSM object of the same name is 92% Parione. Two objects, two answers. |
| **Piazza del Fico** | way/27446112 | **Ponte 60%** / Parione 40% | **Parione** | centroid and geometry disagree; Nominatim says Parione |
| **Piazza di Tor Sanguigna** | way/204003769 | **Ponte 52%** / Parione 48% | **Parione** | near-even split; Nominatim says Ponte. This is the piazza the Stadium of Domitian's exposed arcades front onto. |
| **Piazza delle Cinque Lune** | relation/9202416 | Parione 62% / Ponte 23% / Sant'Eustachio 15% | Parione | three-rione junction |

### 3.2 Corso Vittorio Emanuele II — Parione's south edge, exactly as the brief warned

| Object | Geometry |
|---|---|
| relation/17339429 *Corso Vittorio Emanuele II* | Parione 50% / Ponte 27% / Sant'Eustachio 13% / Pigna 10% |
| way set *Corso Vittorio Emanuele Secondo* | Parione 55% / Ponte 34% / Sant'Eustachio 9% / Pigna 2% |

The corso is a 19th-century cut driven through the older fabric; it is a *shared* edge, not a clean
Parione feature. Several Parione addresses (Museo Barracco at **corso Vittorio Emanuele 166/A**,
San Pantaleo, Palazzo Massimo alle Colonne) sit **on** it while their buildings test 100% Parione.
Recommend the corso itself be treated as a shared boundary feature owned by no single rione, and
that buildings fronting it be assigned by building geometry. Not my call.

### 3.3 Straddling streets, piazzas and passages (33)

Parione-majority: Via del Teatro Pace 94% · Piazza dei Satiri 91% · Via dei Baullari 88% ·
Via di Parione 83% · Via del Corallo 80% · Via del Paradiso 75% · Via San Giuseppe Calasanzio 75% ·
Via dei Canestrari 75% · Largo dei Librari 77% · Largo del Pallaro 65% (rest Sant'Eustachio) ·
Via dei Giubbonari 56% (Sant'Eustachio 38%, Regola 6%) · Corso Vittorio (§3.2).

Even split: Via dei Balestrari **Regola 50% / Parione 50%**.

Parione-minority (majority elsewhere — likely another rione's, flagged for completeness):
**Via del Governo Vecchio (Ponte 54% / Parione 46%)** · Piazza di Tor Sanguigna 49% ·
Largo Febo 47% · Piazza del Fico 38% · Largo dei Chiavari 38% (Sant'Eustachio 62%) ·
Via dei Banchi Vecchi 24% (Ponte 76%) · Piazza dell'Orologio 40% (Ponte 60%) ·
Via della Corda 25% · Vicolo del Malpasso 25% · Via di Montoro 25% · Via dei Pompieri 33% ·
Via della Pietà 33% · Vicolo delle Grotte 11% · Vicolo della Moretta 14% · Via di Tor Millina 10% ·
Vicolo della Pace 9% · Via dell'Arco del Monte 9% · Via di Monserrato 2%.

### 3.4 An address/geometry split worth the arbitrator's attention

The **Archivio Storico Capitolino** and the **Casa delle Letterature** both give their official
address as **Piazza dell'Orologio 4 / 3** (archiviocapitolino.it; bibliotechediroma.it). Piazza
dell'Orologio tests **Ponte 60–74%**. But both institutions occupy the **Oratorio dei Filippini**
(relation/326130), whose geometry is **100% Parione** (46/46 vertices), as is the **Torre
dell'Orologio** (way/1434861924, 9/9). So the building is Parione and the piazza it addresses from
is mostly Ponte. Do not resolve this from the postal address alone.

---

## 4. The extraterritorial property — sourced from the treaty itself

### 4.1 Palazzo della Cancelleria — Lateran Treaty **Art. 15**

- **Geometry: 100% Parione** (relation/1709797, 31/31 vertices). Nominatim: `quarter=Parione`.
  Piazza della Cancelleria (way/121034574) is likewise 100% Parione.
- I fetched the **primary treaty text** from the Holy See rather than a summary:
  https://www.vatican.va/roman_curia/secretariat_state/archivio/documents/rc_seg-st_19290211_patti-lateranensi_it.html
- Art. 15 names *"i palazzi della Datarìa, **della Cancelleria**, di Propaganda Fide in Piazza di
  Spagna…"* and states they — **"benché facenti parte del territorio dello Stato italiano"**
  (*although forming part of the territory of the Italian State*) — *"godranno delle immunità
  riconosciute dal diritto internazionale alle sedi degli agenti diplomatici di Stati esteri."*

  **The treaty's own words say it is Italian territory.** That is the sentence that licenses the
  accurate framing Ruling 2 demands. Write: a building on Italian soil holding the immunities of a
  diplomatic headquarters. Do **not** write "in the Vatican", "Vatican territory" or "a border".
- **Art. 16 is a different list** (Università Gregoriana, Istituto Biblico, Orientale, Archeologico,
  Seminario Russo, Collegio Lombardo, the two Sant'Apollinare palaces, the Casa degli esercizi of
  San Giovanni e Paolo) granted only exemption from expropriation and taxes. **The Cancelleria is
  Art. 15, not Art. 16.** I checked specifically because the brief warned against conflating them.
- it.wikipedia independently: *"è a tutt'oggi di proprietà esclusiva della Sede Apostolica e pertanto
  gode delle immunità riconosciute alle Ambasciate estere in quanto zona extraterritoriale della
  Santa Sede"*, and that it houses the Penitenzieria Apostolica, the Segnatura Apostolica and the
  Rota Romana. https://it.wikipedia.org/wiki/Palazzo_della_Cancelleria
- Built c. **1486–1496** per it.wikipedia; Wikidata gives inception **1513** and architect **Donato
  Bramante** (Q7793). **These conflict** and the Bramante attribution is long contested in the
  literature. Flagged as low-confidence in §7.
- The basilica of **San Lorenzo in Damaso** is *incorporated into* the palazzo, its main entrance set
  in the right-hand section of the palace façade (it.wikipedia). Geometry: 100% Parione.
  If the Cancelleria is treated as extraterritorial, the verifier should decide whether the basilica
  inside it inherits that status — I did not assume either way.

### 4.2 UNESCO — publishable under Ruling 1

From https://whc.unesco.org/en/list/91/ (fetched, raw HTML):
- Site name: **"Historic Centre of Rome, the Properties of the Holy See in that City Enjoying
  Extraterritorial Rights and San Paolo Fuori le Mura"**, ref **91**.
- **Date of Inscription: 1980.** Significant boundary modification **1990**; minor modifications
  2015 and 2023. Criteria **(i)(ii)(iii)(iv)(vi)**. Property 1,469.7 ha.
- UNESCO's own text: the property *"encompasses the whole historic centre of Rome, first inscribed
  … in 1980 and extended in 1990 to the walls of Urban VIII, to the Holy See's extraterritorial
  properties, and to the Basilica of Saint Paul's Outside the Walls."*
- **Caution:** the page does **not** name the Cancelleria individually. All of Parione lies inside
  the historic centre, so site-level statements are safe; a claim that *this particular building* is
  a named UNESCO component is **not** sourced and I do not make it.

---

## 5. Places the brief expected in Parione that are NOT in Parione

These are the most consequential findings in this file.

### 5.1 Santa Maria della Pace — Ponte, on three independent methods

The brief lists it among Parione's "likely subjects". It is not Parione:

| Method | Result |
|---|---|
| OSM full geometry (way/50884075) | **Ponte, 28/28 vertices** |
| Nominatim reverse geocode | `quarter=` **Ponte** |
| it.wikipedia prose | *"si trova nell'omonima piazza nel **rione Ponte**, non distante da piazza Navona"* |

Not a straddler — it is wholly outside. **I have not taken it.** Ponte is in neither wave, so this
needs the coordinator: the church (and Bramante's cloister attached to it) would otherwise fall
through the gap between waves entirely. Same for **Santa Maria dell'Anima** (way/52334111, 14/14
vertices Ponte) — though Nominatim says Parione for it, so it is genuinely contested (§2.3).

### 5.2 Via del Governo Vecchio — majority Ponte

Also named by the brief. Geometry: **Ponte 54% / Parione 46%.** A near-even split on which the
*majority* is the other rione. Flagged in §3.3; the arbitrator should rule. Note also that
it.wikipedia has **no article** for Via del Governo Vecchio, Via dei Cappellari, Via del Pellegrino
or Palazzo Nardini (confirmed absent, not merely unfetched), so their sourcing is weak regardless
of who gets them.

### 5.3 Reserved wave-1 places: no conflict

I tested for them. **None of the 18 reserved places falls in Parione**, and none appeared in my
harvest as a Parione candidate. Parione does not touch Campitelli, Monti, Trastevere or Borgo at
any point. I make no claim on any reserved place and I have no argument to refer.

---

## 6. The candidate register

Geometry column = share of OSM vertices in Parione. "100%" means every vertex tested inside.

### 6.1 Piazza Navona and its set pieces

| # | Name | Kind | OSM / geometry | Sourced facts | Source |
|---|---|---|---|---|---|
| 1 | **Piazza Navona** | piazza | way/4247138 — **100% Parione** (109 vertices) | Shaped as an ancient stadium; monumentalised for Innocent X (Giovanni Battista Pamphilj). Wikidata architects: Bernini, Borromini. | it.wikipedia *Piazza Navona*; Wikidata Q463400 |
| 2 | **Fontana dei Quattro Fiumi** | fountain | way/52332687 — 100% | **Author: Gian Lorenzo Bernini. Dated 1648–1651.** Travertine, marble, granite, bronze; originally fed by the *acqua Vergine*. Commissioned by Innocent X; replaced a trough installed with the two side fountains in the 1570s. In 1647 Innocent X gave Borromini the new conduit bringing 180 *once* of Acqua Vergine to the piazza, and moved in the obelisk. Bernini won the commission having presented a silver model. | **sovraintendenzaroma.it** `/fontane/fontana_dei_quattro_fiumi_in_piazza_navona` (Roma Capitale's own page) |
| 3 | **Obelisco Agonale** | obelisk | way/525728185 — 100% | 1st-century obelisk (Roman copy of Domitianic date) surmounting the Quattro Fiumi; it had lain in pieces in the area of the Circus of Maxentius on the Via Appia Antica before Innocent X moved it. | Sovrintendenza (as #2); it.wikipedia *Obelisco Agonale* |
| 4 | **Fontana del Moro** | fountain | way/262032514 — 100% | Basin by Giacomo della Porta, 1575–76; Moor figure to a Bernini design, executed by Giovanni Antonio Mari; funded by Olimpia Maidalchini. | it.wikipedia; Wikidata Q1435824 (inception 1575) |
| 5 | **Fontana del Nettuno** | fountain | relation/5150432 — 100% | At the north end of Piazza Navona. Wikidata: inception 1574, architect Giacomo della Porta. | it.wikipedia; Wikidata Q1759793 |
| 6 | **Sant'Agnese in Agone** | church | way/52333460 — 100% | On Piazza Navona, dedicated to St Agnes on the traditional site of her martyrdom. Wikidata: inception 1650; architects **Carlo Rainaldi** and **Francesco Borromini**. Parish website live (orari d'apertura, functions, and a crypt with its own restoration programme). | it.wikipedia; Wikidata Q1192577; https://www.santagneseinagone.org/ |
| 7 | **Palazzo Pamphilj** | palazzo | relation/413459 — 100% | On Piazza Navona. Wikidata architect **Girolamo Rainaldi**. Now the Brazilian embassy (see #8). | it.wikipedia; Wikidata Q2047593 |
| 8 | Ambasciata del Brasile | embassy | node/6525093274 — Piazza Navona 14 | Brazil's mission to Italy, also accredited to Malta and San Marino. | it.wikipedia; Wikidata Q103243310 |
| 9 | **Stadio di Domiziano** | archaeological site / museum | node/2296913458 — Via di Tor Sanguigna 3 | The *Circus Agonalis*. **265 × 106 m**, circus-shaped, differing from a circus by smaller size and absence of *spina* and obelisk; exterior of two tiers of arcades on piers, Ionic below, Corinthian above, an entrance on each side; travertine block and brick-faced construction, interior walls in soberly decorated stucco. Walls re-emerged **in 1936** during demolition/rebuilding on the *emiciclo*; after full excavation the remains were incorporated into the **Palazzo dell'INA**. Ground level is c. **5 m** below the modern surface, visible from the arcades onto Tor Sanguigna. | **sovraintendenzaroma.it** `/roma_antica/monumenti/stadio_di_domiziano`; it.wikipedia |
| 10 | Chiesa di Nostra Signora del Sacro Cuore | church | way/52333244 — 100% | Between corso del Rinascimento (front façade) and Piazza Navona (rear façade). | it.wikipedia; Wikidata Q1649784 |
| 11 | Palazzo De Torres–Lancellotti | palazzo | relation/1710627 — 100% | Main front on the south side of Piazza Navona; other sides on via della Cuccagna (named for the greasy-pole *albero della cuccagna*), via della Posta Vecchia (with two old post boxes, larger for Rome, smaller for abroad), vicolo della Cuccagna and piazza de' Massimi. | it.wikipedia *Palazzo De Torres - Lancellotti*; Wikidata Q1787553 |
| 12 | San Nicola dei Lorenesi | church | way/220589071 — 100% | In **Largo Febo** (itself a straddler, §3.3). After Lorraine's 1766 annexation to France, integrated into the *Pieux Établissements de la France à Rome et Lorette*; one of the five French Catholic churches in Rome. Wikidata inception 1632. | it.wikipedia; Wikidata Q3583327 |
| 13 | Corsia Agonale / Via Agonale | street | 100% Parione | short links off the piazza | OSM |

### 6.2 Pasquino and Palazzo Braschi

| # | Name | Kind | OSM / geometry | Sourced facts | Source |
|---|---|---|---|---|---|
| 14 | **Pasquino** | talking statue | node/301361919 — 100% Parione; Nominatim `quarter=Parione` | Rome's most celebrated *statua parlante*, a characteristic figure of the city between the 16th and 19th centuries. Wikidata inception c. AD 150. Sovrintendenza, on the Stadium page: the statue is **traditionally referred to the Stadium's decoration**, was **found in Piazza Navona at the corner with Via della Cuccagna**, and represents the **Patroclus and Menelaus** group — but the same page cautions that comparable finds came from other excavations, so the attribution is explicitly hedged at source. | it.wikipedia *Pasquino*; **sovraintendenzaroma.it** stadio page; Wikidata Q958448 |
| 15 | **Piazza di Pasquino** | piazza | way/125988144 — 100% (39 street vertices) | the square the statue stands in | OSM; Wikidata Q57710200 |
| 16 | **Palazzo Braschi** | palazzo | relation/1709796 — **100%** (27 vertices) | it.wikipedia locates it explicitly *"nel **R. VI Parione**"*, between piazza San Pantaleo, via San Pantaleo, via della Cuccagna, via di Pasquino and piazza Navona. Wikidata: inception **1804**, architect **Cosimo Morelli**. Sovrintendenza calls it *"il settecentesco Palazzo Braschi"* (18th-century) — **note the tension with 1804**; §7. | it.wikipedia; Wikidata Q1090910; sovraintendenzaroma.it |
| 17 | **Museo di Roma** | museum | node/656829698 | **Official addresses: Piazza San Pantaleo 10 and Piazza Navona 2** (two entrances). Housed in Palazzo Braschi. Sovrintendenza: *tipologia moderno*; "the most significant institution for the social history and artistic activity of Rome from the Middle Ages to the early 20th century"; free entry for MIC-card holders (separate ticketing for the exhibition space); info/booking tel. 060608, 9.00–19.00. | **museodiroma.it**; sovraintendenzaroma.it `/musei/musei_in_comune/museo_di_roma` |
| 18 | Chiesa della Natività di Gesù | church | way/128244658 — 100% | Faces piazza Pasquino. **National church of the Democratic Republic of the Congo.** Wikidata inception 1862. | it.wikipedia; Wikidata Q3580184 |

### 6.3 The Cancelleria / Campo de' Fiori quarter

| # | Name | Kind | OSM / geometry | Sourced facts | Source |
|---|---|---|---|---|---|
| 19 | **Palazzo della Cancelleria** | palazzo, Art. 15 extraterritorial | relation/1709797 — **100%** | See §4.1 in full. Houses the Penitenzieria Apostolica, Segnatura Apostolica and Rota Romana. | vatican.va treaty text; it.wikipedia |
| 20 | **San Lorenzo in Damaso** | basilica | way/125915784 — 100% | *"nel rione Parione, incorporata nel palazzo della Cancelleria"*; main entrance set into the right-hand part of the palace's main façade. | it.wikipedia; Wikidata Q1886229 |
| 21 | Piazza della Cancelleria | piazza | way/121034574 — 100% (16 street vertices) | | OSM |
| 22 | **Campo de' Fiori** | piazza + market | way/4949430 — **STRADDLER, Parione 60% / Regola 40%** (§3.1) | it.wikipedia: *"tra via dei Giubbonari e piazza della Cancelleria, ai confini dei rioni Parione e Regola"*. Historic city market (Sovrintendenza: *"sede di uno storico mercato cittadino"*). | it.wikipedia; sovraintendenzaroma.it |
| 23 | **Monumento a Giordano Bruno** | monument | way/662011220 — 100% | **Author: Ettore Ferrari (1845–1929). Dated 1889.** Bronze and Baveno granite. Erected in Campo de' Fiori **9 June 1889** on the site of the burning, which took place **17 February 1600**. Two international university committees (1876, 1884) raised the funds; the Comune di Roma raised no objection to the site in 1877 and gave a modest contribution; by 1887, with a clerical majority on the Campidoglio, the siting became a political battle for liberal and anticlerical opinion. Ferrari's first 1879 version (Bruno defiant before the Inquisition) was rejected; the 1887 proposal, Bruno as a philosopher drawn into himself with hands crossed on his book, was built. | **sovraintendenzaroma.it** `/monumenti/monumento_a_giordano_bruno` |
| 24 | **Fontana di Campo de' Fiori** | fountain | way/662011034 — 100% | A **19th-century copy** of Giacomo della Porta's basin of 1590. Placed **1898** during the repaving, on ground occupied by buildings until 1858, on the side toward via dei Cappellari, via del Pellegrino and piazza della Cancelleria. Fed by the *acqua Paola*; reproduces Della Porta's basin in size and proportion but without the 17th-century lid, raised on a die above an oval outer basin of regular Baveno granite blocks; water rises from a tall central bronze nozzle shaped as a closed bud. | **sovraintendenzaroma.it** `/fontane/fontana_in_campo_de_fiori` |
| 25 | **Palazzo Orsini Pio Righetti** | palazzo | way/127586144 — 100% | Also known as Palazzo Pio. Wikidata inception 1450. Built over the Theatre of Pompey's substructures. | it.wikipedia; Wikidata Q7127002 |
| 26 | **Teatro di Pompeo** | archaeological remains | node/6404538385, Largo del Pallaro — see §3.3, largo is 65% Parione | Rome's **first masonry theatre** (*theatrum marmoreum*). it.wikipedia: it stood in the Campo Marzio area and *"oggi appartiene al rione di Parione"*. Wikidata inception 55 BC. Its curved corridor survives in the street plan. | it.wikipedia; Wikidata Q944814 |
| 27 | **Santa Maria in Grottapinta** | deconsecrated church | way/128570599 — 100% | On the piazza of the same name; **built on the foundations of the inner corridor of the Theatre of Pompey**. Wikidata inception 1834. | it.wikipedia; Wikidata Q3674126 |
| 28 | Piazza del Teatro di Pompeo / Via di Grotta Pinta | piazza + street | way/128570572, way — 100% | Via di Grotta Pinta preserves the theatre's curve in its street line. | OSM |
| 29 | **Museo Barracco** (Museo di scultura antica Giovanni Barracco) | museum | node/10074889581 | **Official address: corso Vittorio Emanuele 166/A, 00186 Roma.** Collection of ancient sculpture **donated by Giovanni Barracco to the Comune in 1904**; classical and Ancient Near Eastern works. Sovrintendenza: *tipologia archeologico*; free entry for MIC-card holders; info/booking tel. 060608, 9.00–19.00. it.wikipedia places it *"nel rione Parione, vicino a Campo de' Fiori"*. | **museobarracco.it**; sovraintendenzaroma.it `/musei/musei_in_comune/museo_barracco`; Wikidata Q2729588 |
| 30 | **Farnesina ai Baullari / Palazzetto Le Roy** | palazzo | way/117745049 — 100% | The building housing the Museo Barracco. **NAME-COLLISION WARNING: this is _not_ the Villa Farnesina, which is reserved to wave 1 and stands in Trastevere across the river. Different building, different rione, confusingly similar name.** I am claiming only the Parione palazzetto. | Wikidata Q55951568 |
| 31 | **Santa Barbara dei Librai** | church | way/127586110 — 100% | Also *Santa Barbara alla Regola* — it.wikipedia notes the name comes **from the rione it anciently belonged to**, a documented historical rione change. Stands in **Largo dei Librari** (77% Parione, §3.3). | it.wikipedia; Wikidata Q2222773 |
| 32 | **Arco degli Acetari** | archway + courtyard | way/620599002 — 100% | it.wikipedia states it plainly: *"nel **Rione Parione**, lungo Via del Pellegrino"*. Leads to an inner courtyard ringed by buildings of medieval origin; described as one of the best-preserved examples of historic popular building fabric in the centre. | it.wikipedia *Arco degli Acetari* |
| 33 | **Palazzo Massimo alle Colonne** | palazzo | way/125915788 — 100% | On corso Vittorio Emanuele II. Wikidata: inception **1532**, architect **Baldassare Peruzzi**. it.wikipedia notes the site faced the *Via Sacra* or *Papale* from the 12th century. | it.wikipedia; Wikidata Q1521924 |
| 34 | Piazza dei Massimi | piazza | way/833336783 — 100% | | OSM |
| 35 | **San Pantaleo** | church | way/60615619 — 100% | *"nel rione Parione"*, facing its piazza along corso Vittorio Emanuele II. Wikidata: inception 1689, architect **Giuseppe Valadier**. | it.wikipedia; Wikidata Q3585371 |
| 36 | Piazza San Pantaleo | piazza | way/717942666 — 100% | address of the Museo di Roma | OSM |
| 37 | Cinema Farnese | cinema | node/257352141 | on Campo de' Fiori | Wikidata Q37000354 |
| 38 | Passetto del Biscione / Piazza del Biscione | passage + piazza | 100% | covered passage off Campo de' Fiori | OSM |
| 39 | Piazza Pollarola / Piazza del Paradiso / Piazza dei Satiri (91%) | piazzas | 100% except as noted | | OSM |

### 6.4 The Chiesa Nuova / Oratorio complex

| # | Name | Kind | OSM / geometry | Sourced facts | Source |
|---|---|---|---|---|---|
| 40 | **Chiesa Nuova (Santa Maria in Vallicella)** | church | way/29181216 — **100% Parione by geometry (21/21)** | **But it.wikipedia declares it a straddler**: *"nella piazza omonima del rione Parione, **sulla linea di confine con il rione Ponte, in cui ricade parte dell'edificio**"* — part of the building falls in Ponte. Source and geometry disagree; **flagged, not resolved**. 16th-century church, called "new" after its rebuilding. Wikidata inception 1575. | it.wikipedia; Wikidata Q2031901 |
| 41 | **Oratorio dei Filippini** | oratory / civic complex | relation/326130 — **100%** (46/46) | Built by **Francesco Borromini between 1637 and 1667**, commissioned by the Congregation of the Oratory of St Philip Neri. Address side is Piazza dell'Orologio (§3.4). | it.wikipedia; Wikidata Q266212 |
| 42 | **Torre dell'Orologio** | tower | way/1434861924 — 100% | Borromini's clock tower on the Oratory complex. | Wikidata Q3661261 |
| 43 | **Biblioteca Vallicelliana** | library | node/4604602043 | *"in piazza della Chiesa Nuova nel rione Parione, a fianco della chiesa di Santa Maria in Vallicella, al secondo piano dell'Oratorio dei Filippini"*; the 17th-century Borromini building, 1637–1667. Wikidata inception 1581. **Own site `vallicelliana.it` timed out** — cite it.wikipedia, not the site. | it.wikipedia; Wikidata Q2901320 |
| 44 | **Archivio Storico Capitolino** | archive | node/6938542203 | **Piazza dell'Orologio 4** (§3.4). Holds the documentation produced by the comune di Roma; administratively a unit of the **Sovrintendenza Capitolina ai Beni Culturali**; **housed in the Oratorio dei Filippini**. Its site publishes access hours and rules, and warns that for building research it holds only files of projects built in Rome (scope caveat). | **archiviocapitolino.it**; it.wikipedia; Wikidata Q3621643 |
| 45 | **Casa delle Letterature** | cultural centre | node/1398590272 | Piazza dell'Orologio 3 (§3.4). A Roma Capitale centre for 20th- and 21st-century Italian and foreign literature, in the former Oratorio dei Filippini complex; **founded May 2000**, the first such "Casa" in the city's cultural system. | casadelleletterature.it; bibliotechediroma.it; it.wikipedia |
| 46 | **Monumento a Pietro Metastasio** | monument | node/13188762613 — 100% | **Author: Emilio Gallori. Dated 1886, moved 1910.** Marble. Promoted by a committee of artists formed in **1873** under Francesco Podesti, director of the Accademia di S. Luca, for the centenary of the poet's death. Comune granted the site of piazza S. Silvestro and a contribution; competition held 1882, won by Gallori; **inaugurated in piazza S. Silvestro 21 April 1886**; **moved to piazza della Chiesa Nuova in 1910** during the works along corso Vittorio Emanuele II under the new Piano Regolatore — near the poet's **birthplace at via dei Cappellari 30**, and opposite the Oratory where sacred melodramas were performed. | **sovraintendenzaroma.it** `/monumenti/monumento_a_pietro_metastasio` |
| 47 | **Fontana della Terrina** | fountain | way/1434861175 — 100% Parione | **Author: Giacomo della Porta. Sovrintendenza dating: 1581–1595; 1622, 1924.** Originally at the centre of Campo de' Fiori; oval marble basin in a low sunken outer basin because Acqua Vergine pressure on the square was poor. In **1622** a large travertine "lid" was set over it, inscribed *"Ama dio e non fallire, fa del bene e lassa dire. MDCXXII"* — whence the nickname "Terrina". **Dismantled 1889** for the Giordano Bruno monument; **rebuilt 1924 in front of the Chiesa Nuova**, on the corso Vittorio axis. **See §7 — a live conflict over its present location.** | **sovraintendenzaroma.it** `/fontane/fontana_della_terrina` |
| 48 | Piazza della Chiesa Nuova | piazza | way/548367672 — 100% | | OSM |
| 49 | **Chiesa di San Tommaso in Parione** | church | way/128244544 — 100% | Modest in appearance and size; **national church of the Eritrean Catholic community, Alexandrian rite**. | it.wikipedia; Wikidata Q3502906 |
| 50 | **École Française de Rome** | research institute | relation/1710629 — 100% | French institute for historical, archaeological and social-science research. Wikidata inception 1873. (Its principal seat is Palazzo Farnese in Regola; this Parione geometry should be checked against which building is meant — flagged.) | it.wikipedia; Wikidata Q273542 |
| 51 | Ambasciata di Guatemala presso la Santa Sede | embassy | node/8223174268 — Corso del Rinascimento 49 | Guatemala's embassy **to the Holy See** — note: accredited to the Holy See, an ordinary embassy on Italian soil, **not** an extraterritorial property. | Wikidata Q56338586 |
| 52 | Consolato Generale del Brasile | consulate | node/14118870335 — Piazza di Pasquino 8 | | OSM |

### 6.5 Streets, and the bookshop/artisan character of the rione

Wholly-in-Parione streets and passages worth a guide's attention (48 tested 100%; selection):
**Via del Pellegrino** (50 vertices — the longest wholly-Parione street; Arco degli Acetari opens
off it), **Via dei Cappellari** (18; Metastasio's birthplace at no. 30, per Sovrintendenza),
**Via dei Leutari**, **Via dei Cartari**, **Via dei Filippini**, **Via Sora**, **Via della Fossa**,
**Via di Grotta Pinta** (the Theatre of Pompey's curve), **Vicolo Savelli**, **Vicolo dei Granari**,
**Vicolo dell'Aquila**, **Vicolo del Bollo**, **Vicolo della Cancelleria**, **Vicolo Cellini**,
**Vicolo De Cupis**, **Arco della Chiesa Nuova**, **Arco di Santa Margherita**,
**Passetto delle Cinque Lune**, **Via Larga**, **Via della Cuccagna**, **Via della Posta Vecchia**.

**Bookshops** (`shop=books`), a genuine local character and all Parione-centroid — Libreria del
Viaggiatore, Antica Libreria Cascianelli, Altroquando, Libreria Tara, Libreria Farenheit 451,
ONEROOM Books. **Caution:** OSM gives me name and location only. Under the corpus rules I have **no
source** for "oldest", "best", how long any has traded, or any superlative, and I assert none.
A verifier wanting to ship these needs each shop's own site.

**Named food and drink** — 25 cafés, 98 restaurants, 12 gelaterie, 3 bars carry names in Parione.
Recognisable ones with their own websites: Tre Scalini (Piazza Navona 33), Bar del Fico, Cul de Sac
(Piazza di Pasquino), Da Francesco, Il Baffetto (Via del Governo Vecchio — **straddler street**),
Ditirambo and Hosteria Grappolo d'Oro (Piazza della Cancelleria), Barnum Cafe (Via del Pellegrino),
Jerry Thomas Speakeasy (Vicolo Cellini), Frigidarium (Via del Governo Vecchio). I list these as
*located here*, sourced to OSM plus their own sites. **No claim of quality, age or fame is sourced**
and none is made. Most should probably not ship; they are here so the verifier can choose.

---

## 7. What I am least confident about

1. **Fontana della Terrina's present location — a live source conflict.** it.wikipedia says it was
   *"nuovamente spostata nella sede attuale nel **2026**"*, placing it in **Piazza dell'Orologio**
   (which is 60–74% **Ponte**). But **Roma Capitale's own Sovrintendenza page** gives its dating as
   "1581-1595; 1622, 1924" and describes it as rebuilt in 1924 **in front of the Chiesa Nuova**,
   with no mention of any later move. OSM places the fountain way wholly in Parione. A 2026 date on
   Wikipedia is recent enough to be an unverified edit. **Which rione this fountain is in depends
   entirely on which account is right, and I could not settle it.** Do not ship a location for it
   without a fresh check.
2. **Chiesa Nuova's rione.** My geometry says 100% Parione on 21 vertices; it.wikipedia says part of
   the building falls in Ponte. A 21-vertex outline may simply be coarser than the real footprint.
   I would not bet on either. Same class of doubt, weaker, for **Santa Maria dell'Anima**, where
   Nominatim (Parione) and OSM geometry (Ponte, 14/14) flatly disagree.
3. **Palazzo della Cancelleria's build date and architect.** it.wikipedia says "probably designed
   and partly completed between 1486 and 1496"; Wikidata says inception 1513 and architect Bramante.
   The Bramante attribution is contested in the scholarly literature and Wikidata's single-value
   claim hides that. Similarly **Palazzo Braschi**: Wikidata inception **1804** vs Sovrintendenza
   calling it *settecentesco* (18th-century). Prefer the hedged prose; do not ship a bare date.
4. **Piazza Madama** (Parione 71% by geometry, Sant'Eustachio by Nominatim). Palazzo Madama — the
   Senate — is conventionally Sant'Eustachio, which makes me distrust my own 71% here; the piazza
   polygon may extend past the palace. I did not claim it as a Parione entry.
5. **École Française de Rome** returns Parione geometry, but the institution's main seat is Palazzo
   Farnese in **Regola**. The OSM relation may be a secondary building or mis-tagged.

---

## 8. Quarantined — must NOT be published

### 8.1 Designation data I encountered and am not using (Ruling 1)
Wikidata property **P1435 "heritage designation"** returned **Q26971668 = "Italian national
heritage" (cultural property of Italy)** for **20** candidates in my Parione set: San Lorenzo in
Damaso, Biblioteca Vallicelliana, Chiesa Nuova, Natività di Gesù, Nostra Signora del Sacro Cuore,
San Nicola dei Lorenesi, San Pantaleo, San Tommaso in Parione, Sant'Agnese in Agone, Santa Barbara
dei Librai, Santa Maria dell'Anima, Santa Maria della Pace, Santa Maria in Grottapinta, Fontana dei
Quattro Fiumi, Museo Barracco, Museo di Roma a Palazzo Braschi, Palazzo Braschi, Palazzo Massimo
alle Colonne, Palazzo Pamphilj, Palazzo della Cancelleria.

**This is exactly the banned claim and I have used none of it.** Recording it here so a later
researcher does not "discover" it and think it is publishable. It is an aggregator's unsourced
assertion of precisely the legal status Ruling 1 says no reachable source establishes. The
Cancelleria additionally carries **Q43113623 "part of UNESCO World Heritage Site"**, which I also
did not publish per-building — see the caution in §4.2.

### 8.2 A Wikidata error, for the record
Wikidata gives **San Nicola dei Lorenesi**'s architect (P84) as **Q5493239 = "François Desjardins,
Canadian banker (1970–)"**. This is plainly a bad statement. Do not propagate it. It is a good
argument for resolving every Wikidata Q-id to a label before trusting a claim.

### 8.3 Banned phrasings I specifically avoided
No entry above says *vincolato*, *vincolo monumentale*, *listed*, *scheduled*, *designated*,
*declared a monument*, *protected monument*, *heritage-listed*, *bene culturale tutelato* or
*dichiarazione di interesse culturale*. No entry gives a trip duration or a vague proximity
("a short walk", "a stone's throw", "nearby"). Where it.wikipedia wrote *"a breve distanza da Campo
de' Fiori"* for the Arco degli Acetari and *"non distante da piazza Navona"* for Santa Maria della
Pace, **I dropped the phrase** rather than translating it — those are exactly the unmeasurable
impressions the corpus rules ban, even though the source states them.

---

## 9. Photo leads — quarantined for the later wave (Ruling 3)

`"photos": []` on everything. I sourced, named and linked **no image file**. For the photo wave:
the Sovrintendenza per-monument pages each carry a "Galleria" block, and Wikidata entities for the
Parione set carry P18 claims I deliberately did not fetch. Licensing is unexamined — the
`scope-image-licensing.md` research governs, not this file.

---

## 10. Open questions for the coordinator

1. **Santa Maria della Pace and Santa Maria dell'Anima fall in Ponte, which is in neither wave.**
   Two significant Baroque churches (plus Bramante's cloister at the Pace) will fall through the gap
   between waves. Does Ponte get scheduled, or does one of the current rioni adopt them?
2. **Via del Governo Vecchio** is 54% Ponte. The brief assigned it to Parione as a likely subject.
   If Ponte is not being written, a majority-Ponte street has no home either.
3. **Corso Vittorio Emanuele II** is a four-rione shared edge (§3.2). Recommend a programme-level
   rule for boundary streets before four finders each claim a share of it.
4. **Campo de' Fiori** splits 60/40 Parione/Regola, and its two OSM objects (square vs street) give
   different answers. Regola is in neither wave; if Parione does not take it, Rome's best-known
   market square is unwritten.
5. The `ref` tag normalisation trap (§2.1) will break any roster join done naively.
