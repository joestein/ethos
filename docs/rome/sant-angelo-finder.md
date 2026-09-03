# Sant'Angelo (R. XI, Roma Capitale toponymic code 111) — FINDER file

Wave 4, Rome programme. Research date **2026-09-02**. This is **evidence, not adjudication**.
I am not deciding what ships. A verifier adjudicates; one arbitrator rules ownership of straddlers
across all nine rioni in this wave.

**Rulings observed.**
1. *No designation claims.* Nothing below claims a `vincolo`, a listing, a protection status or a
   "monumento nazionale" predicate, in Italian or English. I did not attempt Vincoli in Rete or the
   Catalogo generale; the ruling makes them irrelevant, and I have no substitute to offer. Where a
   source I fetched used such language I have quarantined it in §11.
2. *Vatican City belongs to no rione.* **Sant'Angelo contains no Vatican City property and no
   Lateran Treaty Art. 15 or Art. 16 property.** It does contain one embassy to the Holy See
   (Brazil, in Palazzo Caetani) and one embassy *of* a sovereign entity to the Holy See (the
   Sovereign Military Order of Malta, in Palazzo Savelli Orsini). Neither is a Lateran Treaty tier.
   See §7 — this is the single most likely place for an author to make ruling-2 mistakes in this
   rione, because two of its palaces are diplomatic premises.
3. *No photographs.* `"photos": []` everywhere. I named and linked no image file. Two photo leads
   are quarantined in §12 and must not be acted on in this wave.

---

## 1. Headline numbers

| | |
|---|---|
| Guide-worthy candidate entries found | **121** |
| — named POI candidates (churches, palazzi, ruins, museums, fountains, businesses) | 88 |
| — named streets / piazzas / largos not already counted as a POI | 33 |
| **Straddlers — flagged, NOT resolved by me** | **19** |
| Places a reader would expect in Sant'Angelo that are **not** in Sant'Angelo | 14 (§6) |
| Named OSM features harvested in the padded bbox before rione filtering | 1,176 |
| Named features whose geometry touches the Sant'Angelo polygon | 185 (163 wholly inside, 22 straddling) |

**Guide, not town page — comfortably.** Sant'Angelo is 0.12 km² and I found 121 candidates in it.
It carries two currently-open ticketed institutions with published hours and prices (the Museo
Ebraico with the Tempio Maggiore; the Fondazione Museo della Shoah at the Casina dei Vallati), a
third that is a national museum currently closed for works (Crypta Balbi), four Roman monuments of
the first rank inside 300 m of each other, ten churches, an entire cohesive quarter with its own
cuisine, and about twenty food businesses of which two are named in Roma Capitale's own rione page
and one is in Roma Capitale's *Negozi Storici di Eccellenza* register. The density is the highest
per km² of any rione researched in the programme so far.

**The honest caveat on that number.** 121 is a harvest, not a recommendation. Perhaps 20 of the
food entries are ordinary bars, opticians and convenience shops with nothing sourced beyond a name
and an address, and the arbitrator should expect to cut them. My instruction was to over-collect at
the edges, and I did: 19 of 121 are straddlers I am handing up rather than resolving, and 14 more
are places the brief or a reader would put here that the geometry puts elsewhere.

---

## 2. Method

### 2.1 Boundary geometry, verified before use

I used the boundary-polygon method the Trastevere finder recommended the programme standardise on,
in preference to the brief's suggested Nominatim `quarter` field, because Nominatim is
centroid-only and — as I found — aggressively rate-limited from this network. I used Nominatim as a
**second, independent** check on the contested cases only.

1. Pulled boundary relations for all 22 rioni from Overpass
   (`rel["boundary"="place"]["place"="quarter"]` over 41.85,12.42,41.95,12.53). **All 22 returned.**
2. Stitched unordered way fragments into rings by endpoint matching. **All 22 resolved to exactly
   one clean closed ring each** — no gaps, no multipolygon ambiguity.
3. Ray-casting point-in-polygon locally: deterministic, no rate limit, no network per lookup.
4. For ways and relations I tested **every vertex**, so a street or piazza reports every rione it
   crosses and the share of vertices in each.

Sant'Angelo boundary relation: **OSM r5454238**, `official_name=Rione XI Sant'Angelo`, `ref=R. XI`,
`name=Sant'Angelo`. https://www.openstreetmap.org/relation/5454238

The `ref` normalisation trap earlier waves flagged still holds: 21 rioni carry `ref=R. <numeral>`
and Trastevere alone carries bare `ref=XIII`. Any roster join on `ref` must normalise.

**Measured extent of the polygon.** Bounding box 41.89066–41.89496 N, 12.47621–12.48055 E — about
**480 m north–south by 360 m east–west**. Shoelace area on an equirectangular projection at the
polygon's own mean latitude: **0.123 km²**. The brief says 0.1 km²; these agree to the precision
either can support, and no page should state an area more precisely than "about a tenth of a square
kilometre" unless a sourced figure is found. I did not find one on a reachable Roma Capitale page.

### 2.2 The polygon set was sanity-checked before I trusted a single result

Eleven landmarks with independently known rioni, tested against the stitched polygons:

| Landmark | PIP result | Expected |
|---|---|---|
| Teatro di Marcello | Sant'Angelo | Sant'Angelo (wave-1 ruling) |
| Portico d'Ottavia | Sant'Angelo | Sant'Angelo |
| Fontana delle Tartarughe | Sant'Angelo | Sant'Angelo |
| Tempio Maggiore (synagogue) | Sant'Angelo | Sant'Angelo |
| Santa Maria in Portico in Campitelli | Sant'Angelo | Sant'Angelo (wave-1 ruling) |
| Pantheon | Pigna | Pigna |
| Piazza del Campidoglio | Campitelli | Campitelli |
| Isola Tiberina | Ripa | Ripa |
| Palazzo Cenci | Regola | Regola |
| Piazza Venezia | Trevi | contested; wave 1 says no source establishes it |
| Colosseum | Celio | Celio |

Ten of eleven land where the programme's prior rulings put them. The eleventh (piazza Venezia) is
the one wave 1 explicitly ruled *unestablished*, so a bare polygon answer there proves nothing and
I make no claim about it.

### 2.3 THE COLOSSEUM — verified independently, ruling upheld

The brief told me to verify rather than inherit. I did, on five points and two methods:

| Point | PIP |
|---|---|
| centroid 41.890210, 12.492231 | **Celio** |
| north 41.891160, 12.492231 | Monti |
| south 41.889260, 12.492231 | **Celio** |
| east 41.890210, 12.493500 | **Celio** |
| west 41.890210, 12.490960 | **Celio** |

Nominatim reverse at the centroid: `quarter = "Celio"`, display name
*"Piazza del Colosseo, Celio, Municipio Roma I, Roma, Lazio, 00184, Italia"*.

**Four of five points and both methods say Celio. The wave-1 ruling stands.** The single Monti
point is the northern perimeter, where the rione line runs — a boundary artefact, not a straddle
worth arguing. The Colosseum is nowhere near Sant'Angelo (2.6 km of city between them) and I make
no claim on it. Recording this only because the brief asked for the check.

### 2.4 Sources — what worked and what did not

Reachable and used (all fetched this session with python3 + urllib):

* **`sovraintendenzaroma.it`** — the strongest source in this rione, because its place pages carry
  an explicit **`Rione:` field**. Portico d'Ottavia, Teatro di Marcello, Templi di Apollo Sosiano e
  Bellona and Templi repubblicani di San Nicola in Carcere all read **"Rione: XI - Sant'Angelo"** in
  terms. This is the same class of evidence the wave-3 arbitrator called "the strongest single
  attribution in the wave" for the Fontana delle Naiadi. It also *excluded* one candidate for me:
  the Area Archeologica di via delle Botteghe Oscure reads **"Rione: Pigna"** (§6.1).
* **`turismoroma.it`** (Roma Capitale, Dipartimento Grandi Eventi, Sport, Turismo e Moda) — has a
  dedicated **`/it/page/rione-xi-santangelo`** page giving the rione's official boundary street
  list, its coat of arms, and named businesses. Place pages give address, decimal coordinates,
  hours and phone.
* **`museoebraico.roma.it`** (Fondazione Museo Ebraico di Roma) — hours, prices, closure calendar,
  the two synagogues, the quarter walk. Official for its own institution.
* **`museodellashoah.it`** (Fondazione Museo della Shoah ETS) — address, hours, phone.
* **`romaebraica.it`** (Comunità Ebraica di Roma).
* **`it.wikipedia.org`** via the `action=query&prop=extracts` API — 60+ articles. **Aggregator: must
  be attributed as it.wikipedia wherever it is the only source.**
* **`santamariainportico.it`** (the parish) — address, phone, Mass times.
* **`culture.roma.it/santarita`** (Roma Capitale, Dipartimento Attività Culturali) — Sala Santa Rita.
* Restaurant and hotel own-sites: giggetto.it, nonnabetta.it, bellacarne.it, latavernadelghetto.com,
  acquamadre.it, hosianum.com.
* **`comune.roma.it`** answered this session. Earlier waves recorded it as unreachable. It did not
  give me anything the turismoroma page did not.

Not reachable this session, and the pages that depended on them:

* **`museonazionaleromano.beniculturali.it`** and **`beniculturali.it`** — connection timeout on
  every attempt. This is the primary authority for **Crypta Balbi**, so its status and hours come
  from Roma Capitale's turismoroma page instead, which is a Roma Capitale source about a state
  museum and **must be attributed as such**, not laundered into the museum's own voice.
* **`bsmc.it`** (Biblioteca di storia moderna e contemporanea) — timeout.
* **`centrostudiamericani.org`** — homepage answered, all interior pages 404.
* **`turismoroma.it/it/luoghi/ditta-leone-limentani`** — Roma Capitale links this from its own
  *Negozi Storici* index and the target returns 404. The shop is a real candidate; Roma Capitale's
  own page for it is dead. Do not write anything about it from the index entry alone.
* **`simartweb.comune.roma.it`** — the Sovrintendenza's catalogue, linked from every place page, is
  a JavaScript single-page app that serves a 1.6 kB shell to urllib. No per-property record obtained.
  (This does not matter for ruling 1: a designation register is off-limits regardless.)

Overpass returned relation members without geometry on the first pass, which silently dropped
**14 named multipolygons including the Great Synagogue itself**. I caught it because the Tempio
Maggiore was missing from a harvest that had found four kosher restaurants around it, and re-queried
relations separately with `out center`. Anyone repeating this method should not trust a single
Overpass pass.

---

## 3. WHAT IS ALREADY TAKEN — checked mechanically

`python3 .superpowers/taken_slugs.py` reports **452 places across 12 shipped rioni**. I ran it as a
substring search against every candidate name below. Results:

| Search | Result |
|---|---|
| `marcello` | 1 hit — `antico-caffe-del-teatro-marcello` (**Campitelli**) |
| `mattei` | 1 hit — `palazzo-mattei-albani-del-drago-rome` (**Castro Pretorio**, via delle Quattro Fontane) |
| `ottavia` | 1 hit — `ottaviano-metro-a-prati-rome` (**Prati**, unrelated) |
| `ghetto`, `sinagoga`, `ebraic`, `tartarughe`, `pescheria`, `cenci`, `colosseo`, `balbo`, `funari`, `costaguti`, `caetani`, `savelli`, `lovatelli`, `paganica`, `publicolis`, `stanislao`, `nicola-in-carcere`, `apollo-sosiano`, `bellona`, `olitorio`, `campitelli`+`portico` | **0 hits each** |

**No collision.** The two near-misses are both instructive and both benign:

* **`antico-caffe-del-teatro-marcello` is Campitelli's** and stays there. Wave 1 ruled explicitly
  that "businesses addressed on via del Teatro di Marcello still publish under Campitelli — a
  street name is not a claim on the monument it is named for." I am not claiming that café, and no
  Sant'Angelo page may describe it.
* **`palazzo-mattei-albani-del-drago-rome` is a different Mattei palace** in Castro Pretorio, on
  via delle Quattro Fontane. it.wikipedia's `Palazzo Mattei` disambiguation lists nine distinct
  buildings of that name in Rome, four of them in Sant'Angelo. **An author matching on the string
  "Palazzo Mattei" will produce a duplicate.** Match on the full qualified name.

Wave 1 already ruled two places **into** Sant'Angelo against its own brief, and I confirm both:

* **Teatro di Marcello → SANT'ANGELO.** Wave 1: *"The wave-1 brief listed it for Campitelli and the
  brief is wrong."* My geometry (26/26 vertices), Nominatim (`quarter = "Sant'Angelo"`) and the
  Sovrintendenza's own `Rione: XI - Sant'Angelo` field all agree. Three methods, no dissent.
* **Piazza di Campitelli and Santa Maria in Portico in Campitelli → SANT'ANGELO.** The church tests
  Sant'Angelo on 30/30 vertices and it.wikipedia opens *"è una chiesa di Roma nel rione
  Sant'Angelo"* and explains why: *"Appartenente originariamente al rione Campitelli, l'edificio
  venne attribuito al rione Sant'Angelo quando i confini di quest'ultimo vennero estesi intorno
  alla metà del novecento, dopo gli sventramenti del ventennio fascista."* **The square is not so
  clean and I am re-flagging it** — see §5.1.

---

## 4. THE CANDIDATES

Every entry states how I know which rione it is in. `PIP` = my point-in-polygon test on OSM
geometry; `Nom` = Nominatim `quarter` field; `Sovr` = the Sovrintendenza page's own `Rione:` field;
`itwiki` = the article says so in terms.

### 4.1 Roman and medieval monuments (12)

**1. Portico d'Ottavia** — *historic-site*. Via del Portico d'Ottavia 29.
Rione: **Sovr `Rione: XI - Sant'Angelo`** · PIP 11/11 · Nom `Sant'Angelo`. Three methods.
Rebuilt by Augustus between 27 and 23 BC in place of the earlier portico of Metellus and dedicated
in his sister Octavia's name; restored and largely rebuilt in 203 by Septimius Severus and
Caracalla after a fire of 191, and most of what stands is that rebuilding. A quadriportico of
119 × 132 m enclosing the temples of Juno Regina and Jupiter Stator, a Greek and a Latin library,
and the Curia Octaviae. The south-eastern corner and the propylaeum survive. Two front columns
were replaced by the surviving brick arch after the earthquake of 442. From about 770 the church of
San Paolo in summo circo — later Sant'Angelo in Pescheria — was built into the propylaeum.
The dedicatory inscription of 203 is still on the architrave; the Italian text of it and the
translation are both on the Sovrintendenza page.
Hours per turismoroma: *"Sempre visitabile."* Accessible by a ramp and a cordonata.
Sources: https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/portico_d_ottavia ·
https://www.turismoroma.it/it/luoghi/portico-d%E2%80%99ottavia ·
https://it.wikipedia.org/wiki/Portico_di_Ottavia

**2. Teatro di Marcello** — *historic-site* (schema has no "monument"; `theater` is arguable and I
flag the kind question for the verifier — the Roman building is a theatre, the thing a visitor sees
is a ruin with a Renaissance palace on top). Via del Teatro di Marcello / via Montanara.
Rione: **Sovr `Rione: XI - Sant'Angelo`** · PIP 26/26 · Nom `Sant'Angelo`.
Begun by Julius Caesar, who expropriated the site and demolished the temple of Pietas for it and was
criticised for doing so; taken up by Augustus, probably complete by 17 BC when it was used for the
ludi saeculares, dedicated in 13 or 11 BC in the name of Marcellus, the emperor's nephew, who had
died at Baiae in 23 BC. Restored by Vespasian and by Alexander Severus. Diameter 130 m; capacity
calculated at 15,000, 20,000 at need. Travertine façade of three orders, of which two survive.
Turned into a fortress by the Pierleoni and the Fabi. In the 1500s Baldassarre Peruzzi raised the
Savelli palace on top of it; the Orsini bought that in 1729. The lower Roman part was acquired by
the Comune di Roma in the 1930s, excavated and restored.
**Hours, verbatim from the Sovrintendenza:** visible from the outside only; open every day; 9.00–19.00
under summer time, 9.00–18.00 under winter time; free entry; closed 1 May.
Sources: https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/teatro_di_marcello ·
https://www.turismoroma.it/it/luoghi/teatro-di-marcello · https://it.wikipedia.org/wiki/Teatro_di_Marcello

**3. Tempio di Apollo Sosiano** — *historic-site*. Beside the Teatro di Marcello.
Rione: **Sovr `Rione: XI - Sant'Angelo`** (the joint Apollo/Bellona page) · PIP 12/12.
Three re-erected columns of the Augustan rebuilding. A cult of Apollo existed on the site by the
mid-5th century BC; the first temple building was dedicated in 431 BC by the consul Gnaeus Julius
after a plague, restored in 353 BC and worked on in 179 BC. Rebuilt from about 34 BC by Gaius
Sosius. The Sovrintendenza page describes the portico found in the late 1930s during the works to
rebuild Santa Rita and the Palazzetto di Flaminio Ponzio, running along the east and north sides of
the temple of Bellona toward the temple of Apollo, its piers part peperino and part brick faced with
stucco imitating column fluting, travertine paving.
Sources: https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/templi_di_apollo_sosiano_e_bellona ·
https://it.wikipedia.org/wiki/Tempio_di_Apollo_Sosiano

**4. Tempio di Bellona** — *historic-site*. Adjoining the above.
Rione: **Sovr (same page)** · PIP 12/12 (way) and relation centre in Sant'Angelo.
Vowed in 296 BC by Appius Claudius Caecus after a victory over the Etruscans. It stood outside the
pomerium and the Senate met in it when the business involved foreigners or serving commanders. The
podium was found in the 1930s clearance around the Teatro di Marcello.
Sources: as above · https://it.wikipedia.org/wiki/Tempio_di_Bellona_(Roma)

**5. Foro Olitorio** — *historic-site*. Via del Foro Olitorio.
Rione: PIP 14/14 · Nom `Sant'Angelo` (road returned: via del Teatro di Marcello).
The ancient vegetable market at the foot of the Capitol, between the Teatro di Marcello and the Foro
Boario, with a sacred area of temples to Janus, Spes and Juno Sospita and a bronze elephant, the
Elephas Herbarius. A fourth temple, built by Manius Acilius Glabrio, consul in 191 BC, stood beside
the temple of Janus and was destroyed in the works for the Teatro di Marcello.
Sources: https://it.wikipedia.org/wiki/Foro_Olitorio · Sovrintendenza San Nicola page below.

**6. Templi repubblicani di San Nicola in Carcere** — *historic-site*, or a section of the church
entry. Rione: **Sovr `Rione: XI - Sant'Angelo`** · PIP 28/28 for the church that contains them.
Three Republican temples, built between the first and second Punic wars, embedded in the church and
its flanks; a fourth was found by excavation nearby. Southern (Doric, possibly Spes, columns visible
in the left wall), central (largest, 30 × 15 m, Ionic, probably Juno Sospita, remains visible in the
crypt), northern (Ionic, 26 × 15 m, probably Janus, best preserved, seven columns on one side and
two on the other). The Sovrintendenza page gives all three in detail.
**Note the attribution conflict:** the Sovrintendenza's own page and it.wikipedia's article assign
the dedications differently. it.wikipedia says outright that *"l'attribuzione dei singoli edifici
non è del tutto certa"*. **Any page must say the identifications are uncertain, and must not pick
one and state it flat.**
Sources: https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/templi_repubblicani_di_san_nicola_in_carcere ·
https://it.wikipedia.org/wiki/Basilica_di_San_Nicola_in_Carcere

**7. Crypta Balbi (the archaeological complex)** — *historic-site*. Between via delle Botteghe
Oscure, via dei Polacchi, via dei Delfini and via Caetani.
Rione: PIP 47/47 · Nom `Sant'Angelo` (via delle Botteghe Oscure 31).
The porticoed courtyard behind the theatre Lucius Cornelius Balbus built and dedicated in 13 BC.
About 7,000 m² acquired by the State in 1981. Successive occupations: the Roman crypta and the
south side of the Porticus Minucia; the early-medieval church-convent of Santa Maria Domine Rose;
the medieval houses of via dei Delfini; a Renaissance convent of Santa Caterina with its
conservatorio; the 18th-century Polish hospice. The rope-makers (*funari*) who gave via dei Funari
its name twisted their rope in the 60-metre porticoed courtyard.
Sources: https://it.wikipedia.org/wiki/Crypta_Balbi ·
https://www.turismoroma.it/it/luoghi/museo-nazionale-romano-crypta-balbi

**8. Teatro di Balbo** — *historic-site*, or a paragraph inside 7. Traces of the lower cavea in
opus quadratum and reticulatum survive. Built in stone by Balbus with the spoils of his victory
over the Garamantes, dedicated 13 BC; burnt under Titus, probably 79; restored, probably by
Domitian. 95 m diameter, 7,700 spectators. Medieval shops in its arcades gave via delle Botteghe
Oscure its name. Source: https://it.wikipedia.org/wiki/Teatro_di_Balbo

**9. Circo Flaminio** — *historic-site*, **weak: nothing is visible.** Laid out by the censor
Gaius Flaminius Nepos in 221 BC, 500 m long at first, reduced by later building to a 300 m piazza
by the 3rd century, abandoned toward the end of the 4th. Augustus took part of it for the Portico
d'Ottavia. it.wikipedia notes it is still debated whether chariot races were actually held there.
**Recommend: a sentence inside the Portico or the rione page, not its own record.**
Source: https://it.wikipedia.org/wiki/Circo_Flaminio

**10. Portico di Filippo** — **weakest in the file. `"Di esso non si conserva nulla."`** Built by
Lucius Marcius Philippus, Augustus's stepfather, in 29 BC around the temple of Hercules of the
Muses. The Sovrintendenza's page on its own headquarters says the convent of Sant'Ambrogio alla
Massima *"sorto sull'area dell'antico Portico di Filippo"*, which is the only reason it is here.
**Recommend: drop, or one clause in the Sant'Ambrogio entry.**
Source: https://it.wikipedia.org/wiki/Portico_di_Filippo

**11. Case medievali e romane a piazza di Monte Savello** — *historic-site*. OSM w111670573,
tagged `historic=archaeological_site`, `tourism=attraction`. PIP 27/27.
**Flag: OSM is the only source I have for this as a named entity.** No Sovrintendenza page, no
it.wikipedia article, no turismoroma page. The underlying facts (medieval houses uncovered in the
1920s–30s clearance) are well sourced generally but not for this specific labelled group.

**12. Monte Savello** — *historic-site* / place. Between the Tiber near ponte Fabricio and the
Capitol. Rione: **itwiki, in terms** — *"posto nel rione Sant'Angelo"* · PIP of the piazza 38/38 ·
Nom `Sant'Angelo`. The rise is the ruins of part of the Teatro di Marcello plus Tiber alluvium.
Known from at least the 12th century as monte Faffo / Fabiorum, later named for the Savelli.
Source: https://it.wikipedia.org/wiki/Monte_Savello

### 4.2 Churches and religious buildings (11)

**13. Chiesa di Sant'Angelo in Pescheria** — *historic-site*. Via della Tribuna di Campitelli 6.
Tel 06 68801819. Rione: **itwiki, in terms** (*"sito nel rione Sant'Angelo"*) · PIP 11/11 · Nom
`Sant'Angelo`. Built in the 8th century inside the propylaeum of the Portico d'Ottavia; three
Corinthian columns of the portico are set into its portal. Pope Stephen II translated the relics of
Symphorosa, Getulius and their seven sons here in 752; the sarcophagus was found in 1610 with its
inscription. In 1110 Paschal II made Saint Berard cardinal deacon of the title. **From here, on
Whit Sunday 1347, Cola di Rienzo set out to seize the Capitol.** Organ by Pietro Pantanella, 1877,
25 stops, one manual and pedal, wholly mechanical action. *Madonna col Bambino e angeli* attributed
to Benozzo Gozzoli (it.wikipedia dates it 1447–1450, turismoroma says 1450). The chapel of
Sant'Andrea was raised in 1571 as the seat of the fishmongers' company; its altarpiece is by
Giorgio Vasari and its vault frescoed by Innocenzo Tacconi.
**Attribution conflict to hand up:** turismoroma credits the vault fresco *Gloria di Sant'Andrea* to
"Innocenzo Sacconi", it.wikipedia to Innocenzo Tacconi. One of Roma Capitale's two spellings is
wrong and I cannot say which. **Attribute or omit.**
Hours: turismoroma says only *"Per gli orari delle messe e le modalità di visita rivolgersi ai
contatti indicati."* **No source states opening hours, so none may be given.**
Sources: https://www.turismoroma.it/it/luoghi/chiesa-di-santangelo-pescheria ·
https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Angelo_in_Pescheria

**14. Basilica di San Nicola in Carcere** — *historic-site*. Via del Foro Olitorio.
Rione: **itwiki, in terms** (*"situato nel rione Sant'Angelo"*) · PIP 28/28 · Nom `Sant'Angelo`
(postcode 00153, the only Sant'Angelo point that is not 00186 — a useful check on any address join).
Built over the three temples. A first church here in the 6th century; a 10th-century inscription on
the column by the entrance; the first reference to the church is a plaque on the façade of 1128.
"In carcere" from a prison on the site — Byzantine, the *Carcer ad Elephantum*, which from the 13th
century tradition confused with the Tullianum. Rebuilt in 1599, the façade by Giacomo della Porta,
keeping the medieval campanile, itself a converted Pierleoni tower. **One of the bells is the one
Pandolfo Savelli commissioned in 1289.** Organ by Nicola Morettini, 1908, 9 stops. The basilica now
stands isolated because the surrounding medieval quarter was demolished in the mid-1920s.
Sources: https://it.wikipedia.org/wiki/Basilica_di_San_Nicola_in_Carcere ·
https://www.turismoroma.it/it/luoghi/basilica-di-san-nicola-carcere

**15. Chiesa di Santa Maria in Portico in Campitelli** — *historic-site*. Piazza di Campitelli 9.
Tel 06 68803978 (parish), 06 6874285 (community).
Rione: **itwiki, in terms** + wave-1 ruling · PIP 30/30 · Nom `Sant'Angelo`.
Rebuilding on the present site began 29 September 1661, to Carlo Rainaldi, commissioned by Alexander
VII to mark the end of the plague of 1656 and to house the Marian icon. Clement VIII gave the older
church to St John Leonardi and the Clerks Regular of the Mother of God on 4 August 1601.
**Mass times from the parish's own site: festive 10.00 and 18.30; weekdays 7.30 and 18.30.**
Sources: https://www.santamariainportico.it/contatti/ ·
https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-portico-campitelli ·
https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_in_Portico_in_Campitelli

**16. Chiesa di Santa Caterina dei Funari** — *historic-site*. Via dei Funari.
Rione: **itwiki, in terms** · PIP 21/21 · Nom `Sant'Angelo` (road returned: via Michelangelo
Caetani). Attested in a bull of Celestine III of 1192 as Sancta Maria dominae Rosae and Sancta Maria
in castro aureo — the second name from the ruins of Balbus's theatre, called the *castrum aureum* in
the Middle Ages. Named for the rope-makers of the quarter, who still give the street its name.
In 1536 Paul III gave the church to Ignatius of Loyola, who founded a house for poor girls in the
monastery; in 1560 Loyola suggested to Cardinal Federico Cesi, who paid for it, that it be rebuilt
and rededicated to Catherine of Alexandria; **Guidetto Guidetti, a pupil of Michelangelo, took
charge and the work finished in 1564.** OSM carries `start_date=1564` and a note that the church
has reopened to the public.
Source: https://it.wikipedia.org/wiki/Chiesa_di_Santa_Caterina_dei_Funari
**No hours source found.** OSM's reopening note cites romatoday, a newspaper; I did not fetch it and
it should not be used for hours.

**17. Chiesa di Sant'Ambrogio della Massima** (with the Convento) — *historic-site*.
Via di Sant'Ambrogio. Rione: **itwiki, in terms** · PIP 12/12 (church), relation centre in
Sant'Angelo (convent). In the oldest catalogues as Sancta Maria de Maxima. By tradition built on
the site of Ambrose's father's house; Roman rooms are still visible in the basement. The monastery
was founded, again by tradition, in 353 by Marcellina, elder sister of Ambrose and Satyrus. In 1876,
after the *Cessione dell'asse ecclesiastico*, the monastic complex was divided between the Comune di
Roma and the Cassinese Benedictines who serve the church.
Sources: https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Ambrogio_della_Massima ·
https://www.turismoroma.it/it/luoghi/chiesa-di-santambrogio-della-massima ·
https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/sovrintendenza_capitolina

**18. Chiesa di San Gregorio della Divina Pietà** — *historic-site*. At the head of ponte Fabricio.
Also San Gregorio al Ponte Quattro Capi, San Gregorietto ai Quattro Capi.
Rione: **itwiki, in terms** (*"si trova nel Rione Sant'Angelo"*) · PIP 20/20.
First certain notice 1403. Restored in 1729 to designs by Filippo Barigioni for Benedict XIII and
given to the Congregazione degli Operai della Divina Pietà, from which the name; the original alms
box survives on the right side. Restored again in 1858, when the bilingual Hebrew and Latin
inscription with a passage of scripture was set on the façade. **The forced sermons imposed on the
Jews of the ghetto under papal rule were preached here**, and the double inscription records the
practice.
Source: https://it.wikipedia.org/wiki/Chiesa_di_San_Gregorio_della_Divina_Piet%C3%A0

**19. Chiesa di Santo Stanislao dei Polacchi** — *historic-site*. Via delle Botteghe Oscure.
Rione: **itwiki, in terms** · PIP 19/19 · Nom `Sant'Angelo`.
The national church of Poles in Rome. Descends from San Salvatore in pensilis de Sorraca, a medieval
church recorded in documents of 1174 and 1209, built on the remains of the Circo Flaminio. An
epigraph records a rebuilding of 27 October 1285; it is all that survives of the medieval church.
Gregory XIII gave the church to the Polish cardinal Stanislaus Hosius, who had it wholly rebuilt in
1580 as the Polish national church.
Source: https://it.wikipedia.org/wiki/Chiesa_di_Santo_Stanislao_dei_Polacchi

**20. Cappella di Santa Maria del Carmine e del Monte Libano** (tempietto del Carmelo) —
*historic-site*, deconsecrated. Piazza Costaguti.
Rione: **itwiki, in terms** · PIP 12/12. Built in 1759 by the devout of the neighbourhood, restored
in 1825 (inscription on the architrave), again by the faithful in 1862 and in 1876; profaned, then
restored to worship in 1892. Occupied for much of the 20th century by a cobbler, then abandoned;
recovered and conservatively restored in 2005 to a project by Arianna Cajano. A monumental aedicule
on a half-oval plan, half-dome on six columns and two half-columns.
**Forced sermons to the Jews of the neighbouring ghetto were preached in the open square in front of
it in the early evening** — a second such site in the rione, distinct from San Gregorio.
Source: https://it.wikipedia.org/wiki/Cappella_di_Santa_Maria_del_Carmine_e_del_Monte_Libano

**21. Oratorio di Sant'Andrea dei pescivendoli** — *historic-site*, deconsecrated.
Via del Foro Piscario. Rione: **itwiki, in terms** · adjoins Sant'Angelo in Pescheria.
Consecrated in 1689 as the oratory of the fishmongers' guild — *Locus orationis venditorum piscium*
still reads above the portal. High relief of Saint Andrew with a fish over the door, by Michel
Maille with Lorenzo Ottoni. Owned by the Comune di Roma; **now in commercial use**, which is the
honest thing to say about it and the reason it may not merit its own record.
Source: https://it.wikipedia.org/wiki/Oratorio_di_Sant%27Andrea_dei_pescivendoli

**22. Sala Santa Rita** (ex chiesa di Santa Rita da Cascia in Campitelli) — *attraction* /
exhibition space. Via Montanara 8.
Rione: **itwiki, in terms** · PIP 9/9 · Sovrintendenza map places it in Sant'Angelo.
Built about 1650–1665 by Carlo Fontana over the 11th-century San Biagio de Mercato, at the foot of
the Aracoeli steps. **Dismantled stone by stone in 1928 and re-erected on the present site in
1937–1940.** Octagonal interior with a small atrium; Fontana designed the façade for a diagonal
rather than a frontal view because of the narrow street it faced. Returned to the Comune in 1990,
comprehensively restored around 2000, **reopened to the public with a new programme from April
2024**, run by the Dipartimento Attività Culturali of Roma Capitale.
Hours per turismoroma: *"Spazio espositivo aperto in occasione di mostre in corso."*
**Contradiction between two Roma Capitale pages, unresolved:** turismoroma says the church was moved
for what is *"oggi via del Teatro di Marcello"*; culture.roma.it says for what is *"oggi via
Petroselli"*. These are two different streets. **Do not state which; say it was moved for the
opening of the via del Mare, which both agree on.**
Sources: https://www.turismoroma.it/it/luoghi/sala-santa-rita · https://culture.roma.it/santarita/ ·
https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/sala_s_rita_gia_chiesa_di_s_rita_da_cascia ·
https://it.wikipedia.org/wiki/Chiesa_di_Santa_Rita_da_Cascia_in_Campitelli

**23. Chiesa di Santa Maria in Publicolis** — **STRADDLER, see §5.4.** Via in Publicolis.
it.wikipedia says *"situato nel rione Sant'Angelo"*; **my PIP puts all 8 footprint vertices in
Sant'Eustachio.** Rebuilt 1642–1643 by Giovanni Antonio De Rossi for Cardinal Marcello Santacroce;
since 1835 the general house of the Missionari dei Sacri Cuori di Gesù e Maria.
Source: https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_in_Publicolis

### 4.3 The Jewish quarter (11)

This is what the rione is known for and it is where the strongest institutional sourcing sits.

**24. Tempio Maggiore di Roma (the Great Synagogue)** — *historic-site*. Lungotevere de' Cenci /
via Catalana. OSM relation r1840091, `building=synagogue`, architects Osvaldo Armanni and Vincenzo
Costa, height 26 m.
Rione: PIP (relation centre) · Nom `Sant'Angelo`, road Largo Stefano Gaj Tachè.
**Built 1901–1904** on one of the four lots created by demolishing the most decayed parts of the
ghetto. The Comunità Ebraica's own museum site: after 1870 the Jewish communities of Europe could
build monumental synagogues for the first time in centuries, and Rome's was deliberately put in the
quarter the Jews had been shut into. In 1888 the Università ebraica contracted with the Comune for a
site; the agreement was rescinded in 1896. The first competition was held in 1889, calling for a
building of *"carattere monumentale e severo"*. Armanni and Costa won. **Inaugurated 1904**, with a
square-based dome clad in aluminium and an interior richly decorated in art nouveau, the bimah not
exactly in the Roman-rite position.
**The Tempio Spagnolo** is in the same building: an oratory for the Spanish rite, placed there in
1932 and furnished in 1948 with the marble fittings of the Cinque Scole.
Visited through the Museo Ebraico ticket, which includes a guided visit to the Tempio Maggiore.
Sources: https://www.museoebraico.roma.it/le-sinagoghe/ · https://www.museoebraico.roma.it/tariffe/ ·
https://it.wikipedia.org/wiki/Tempio_Maggiore_di_Roma
**Do not write "the largest synagogue in Rome" or any comparative.** The museum's own page says
*"la sinagoga più imponente della città"*; that is a superlative and it is banned even attributed.

**25. Museo Ebraico di Roma** — *museum*. In the Tempio Maggiore complex; the museum's own site
gives its address as **Via Catalana (Sinagoga), Roma**; OSM and Nominatim place the entrance on
Largo Stefano Gaj Tachè. Tel +39 06 68400661.
Rione: PIP · Nom `Sant'Angelo`.
**Opened 1960**, to hold the Roman community's collections, with a contribution from the Libyan
Jewish community that arrived in 1967. Seven rooms: Renaissance velvets and baroque embroidery
(about 900 textiles, some in cases and some still in use in the city's synagogues); casts of
inscriptions from the Roman catacombs and the Ostia Antica synagogue, medieval manuscripts and city
plans; the Jewish year and life cycle; **the treasures of the Cinque Scole** — silver, textiles and
polychrome marble from the Scola del Tempio, Scola Nova, Scola Siciliana, Scola Castigliana and
Scola Catalana.
**Hours, verbatim from the museum, 2026 season:**
*Winter* — 1–26 Oct, Sun–Thu 10.00–17.00 (last admission 16.15), Fri 9.00–14.00 (last admission
13.15); 27 Oct–9 Nov and 12 Jan–8 Feb, Sun–Thu 10.00–16.30 (last admission 15.45), Fri 9.00–14.00;
10 Nov–11 Jan, Sun–Thu 10.00–16.00 (last admission 15.15), Fri 9.00–14.00; 9 Feb–31 Mar, Sun–Thu
10.00–17.00, Fri 9.00–14.00. *Summer* — 1 Apr–30 Sep, Sun–Thu 10.00–18.00 (last admission 17.15),
Fri 10.00–16.00 (last admission 15.15).
**Closed Saturdays and on Jewish holidays**; the site publishes a dated 2026 closure calendar.
**Prices, verbatim:** full €12.00; students to 25 with proof €6.00; agreement rate €10.00; free for
children under 10, for visitors with certified disability above 74% (and a companion where needed),
ICOM and ICOMOS card holders, police and armed forces, accredited journalists. €1.00 service
commission on online transactions.
Guided tours: museum + Tempio Maggiore + Tempio Spagnolo, €100 for families and adult groups to 25
plus admission. Jewish-quarter walking tours, €100 for 1–4 people, €150 for 5–15, €10 a head for
16–35. Online booking required, minimum five days ahead.
Sources: https://www.museoebraico.roma.it/info/ · https://www.museoebraico.roma.it/tariffe/ ·
https://www.museoebraico.roma.it/le-sale/ · https://it.wikipedia.org/wiki/Museo_ebraico_(Roma)

**26. Fondazione Museo della Shoah — Casina dei Vallati** — *museum*.
**Via del Portico d'Ottavia 29, 00186 Roma. Tel +39 06 68139598 (museum), +39 06 68805806 (office).
Open Sunday to Thursday 10.00–18.00; Friday 10.00–13.00, excluding Jewish holidays; closed
Saturday.** Founding members: Associazione figli della Shoah, Comunità Ebraica di Roma, Regione
Lazio, Roma Capitale, UCEI.
Rione: PIP 12/12 (the Casina) · Nom `Sant'Angelo` · **Sovrintendenza page says the Casina is named
for the Vallati, owners of much property "in questa zona del rione S.Angelo".**
**Building:** the Casina dei Vallati was uncovered in the clearances begun in the 1920s to free the
Teatro di Marcello; substantial medieval fabric was found in the block being demolished and kept.
Restored 1929–1932 to a project by Paolo Fidenzoni, who directed the Teatro di Marcello recovery,
after part of it had already collapsed. Renaissance character on the corner toward the Portico
d'Ottavia and via del Foro Piscario, where the original 16th-century marble portal survives and
travertine window surrounds salvaged from another demolished palace were re-set; 13th-century
character in the rest — first-floor loggia, ground-floor portico, tufelli and brick facing.
**CONFLICT, must be handled:** the Sovrintendenza page ends *"Dal 1933 l'edificio è sede degli
Uffici della Ripartizione Antichità e Belle Arti del Comune di Roma, oggi Sovraintendenza ai Beni
Culturali."* The Fondazione's own site says the Casina dei Vallati is the Fondazione's seat and
gives visiting hours for a museum there. **The Sovrintendenza page is stale. Write the building's
history from the Sovrintendenza and its present use and hours from the Fondazione, and do not let
the two sentences sit next to each other unreconciled.**
Sources: https://www.museodellashoah.it/contatti/ · https://www.museodellashoah.it/casina-dei-vallati/ ·
https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/casina_dei_vallati

**27. The Ghetto / Antico quartiere ebraico** — *historic-site* / area record.
Rione: turismoroma states it in terms — *"Situato all'interno del Rione XI - Sant'Angelo"*.
**Instituted 14 July 1555 by the bull *Cum nimis absurdum* of Paul IV**, which revoked the
community's rights and enclosed it behind a wall. Two gates, opened at dawn and shut an hour after
sunset between November and Easter, two hours after in the rest of the year. Trapezoidal;
piazza Giudea, the only important square, was cut in two by the wall. Christian owners of buildings
inside kept them but under the *jus gazzagà* could neither evict tenants nor raise rents.
About 2,000 Jews lived in Rome at the start of the 15th century, 1,200 of them in Sant'Angelo.
In the plague of 1656, 800 of about 4,000 inhabitants died. The gates were opened in 1798 under the
Roman Republic and a tree of liberty planted in piazza Giudea; Napoleon's fall undid it. **Pius IX
ordered the wall demolished in 1847** and it had to be done at night against Roman resistance. Only
after 20 September 1870 did Roman Jews stop being second-class citizens. **The whole quarter was
demolished in 1885** and new building went up around the new synagogue. **Via della Reginella is
the one stretch that still gives an idea of the old ghetto**, and it was only taken into the
enclosure at the beginning of the 19th century.
The museum's own definition of the present quarter: four blocks, crossed lengthwise by via Catalana
which meets via del Tempio, bounded inside by via del Portico d'Ottavia and running to the Tiber.
**Rankings to avoid.** turismoroma calls it *"tra i più antichi al mondo – è secondo solo a quello
di Venezia (1516)"*, and the rione page repeats *"il secondo più antico al mondo"*. **That is a
priority claim and it is banned even attributed.** The dates 1516 and 1555 are facts and publish;
the ranking does not.
Sources: https://www.turismoroma.it/it/luoghi/antico-quartiere-ebraico ·
https://www.turismoroma.it/it/page/rione-xi-santangelo ·
https://www.museoebraico.roma.it/il-quartiere-ebraico/ · https://it.wikipedia.org/wiki/Ghetto_di_Roma ·
https://it.wikipedia.org/wiki/Sant%27Angelo_(rione_di_Roma)

**28. Casa di Lorenzo Manilio (Casa dei Manili)** — *historic-site*.
Via del Portico d'Ottavia 1 and 2. Rione: PIP 12/12 · Nom `Sant'Angelo`.
**Built 1468.** Roma Capitale's rione page carries the full Latin inscription across the marble band
of the façade and an Italian translation: Lorenzo Manilio built the house from the foundations on
piazza Giudea, for himself and his descendants, *"nell'anno 2221 dalla fondazione di Roma, all'età
di 50 anni, 3 mesi e 2 giorni"*, on the eleventh day before the calends of August. His name is
repeated three times in Latin and once in Greek on the architraves, the motto *Ave Roma* is cut on
the windows, and ancient fragments are set into the plaster of the base.
Source: https://www.turismoroma.it/it/page/rione-xi-santangelo (no it.wikipedia article exists under
either spelling I tried, Manilio or Manili)

**29. Largo 16 Ottobre 1943** — *historic-site* / square. OSM w123530490, PIP 17/17,
Nom `Sant'Angelo`. Named for the round-up. **On 16 October 1943, after the community had been made
to pay 50 kg of gold to the SS to avoid deportation, 2,091 Roman Jews were deported.** Many more
were killed at the Fosse Ardeatine on 24 March 1944.
Sources: https://it.wikipedia.org/wiki/Sant%27Angelo_(rione_di_Roma) ·
https://it.wikipedia.org/wiki/Rastrellamento_del_ghetto_di_Roma
**Handle with care.** The number 2,091 is it.wikipedia's; the dedicated article gives a fuller and
partly different account. **A verifier must reconcile the two before any figure is published, and
if they cannot be reconciled, publish neither.**

**30. Largo Stefano Gaj Tachè** — *historic-site* / square. OSM relation r1838320 and way
w125374929; PIP; Nominatim returns this as the road for both the synagogue and the museum.
Named for the two-year-old child killed in the 1982 attack on the synagogue.
Source: https://it.wikipedia.org/wiki/Attentato_alla_sinagoga_di_Roma
**I fetched but did not fully read that article. A verifier must read it before a word is written
here.** This is a memorial to a murdered child and the tone bar is absolute.

**31. Pietre d'inciampo / Memorie d'inciampo** — a feature of the quarter, probably a paragraph
rather than a record. turismoroma describes them in the quarter's own page: a sampietrino covered
with a brass plate carrying the name of a person deported and never returned.
Source: https://www.turismoroma.it/it/luoghi/antico-quartiere-ebraico ·
https://it.wikipedia.org/wiki/Pietra_d%27inciampo
**I did not establish how many stand in Sant'Angelo, or where. Do not state a count.**

**32. Via del Portico d'Ottavia** — street. PIP 6/6 and 16/16 on the two ways. The spine of the
quarter: the fishmongers sold on marble slabs rented at high prices from noble families; the copy of
the marble slab that fixed the maximum length of fish that could be sold whole is still on the wall
by the Portico, **the original being in the Musei Capitolini**. Full inscription and translation on
Roma Capitale's rione page.

**33. Via della Reginella** — street. PIP 7/7 and 3/3. See 27: the surviving stretch of old ghetto
fabric, added to the enclosure only in the early 19th century.

**34. Via Catalana** and **35. Via del Tempio** — streets. PIP 6/6 and 3/3, 2/2 and 3/3. Named on
the museum's own definition of the quarter.

### 4.4 Palazzi, towers and houses (17)

**36. Isola Mattei (Insula Mattei)** — *historic-site*, a complex rather than one building.
Rione: **itwiki, in terms** — *"situato nel rione Sant'Angelo"*.
Occupies the whole block between via delle Botteghe Oscure, via Michelangelo Caetani, via dei
Funari, piazza Mattei, via Paganica and piazza della Enciclopedia Italiana. Built by the Mattei
between the 15th and 17th centuries on the remains of the theatre of Balbus. In the Middle Ages the
site was the *Castrum Aureum*, nominally the property of the convent of Santa Maria Dominae Rosae
(now Santa Caterina dei Funari); from the 13th century it held the houses of the Crescenzi,
Piermattei degli Albertoni, Saragona, Coccia, Mellini, de Ambrosinis and Malabranca; at the end of
the 14th century it was broken up and sold.
Source: https://it.wikipedia.org/wiki/Isola_Mattei
**This is the frame that makes four separate palazzo records legible. Recommend the guide carry the
Isola as one record and cross-reference the four palaces, rather than four unrelated entries.**

**37. Palazzo Mattei di Giove** (Antici Mattei, Mattei ai Funari) — *historic-site*.
Between via Michelangelo Caetani and via dei Funari; Nominatim returns via dei Funari 23.
Rione: **itwiki, in terms** · PIP 12/12 · Nom `Sant'Angelo`.
Built for Asdrubale Mattei, duke of Giove; **begun 1598 to a design by Carlo Maderno, the linking
wing begun 1613, finished 1618.** The male Mattei di Giove line died out at the start of the 19th
century and the palace passed to Marianna Mattei, wife of Carlo Teodoro Antici.
**Now houses four institutions**: the Biblioteca di storia moderna e contemporanea and the Istituto
Centrale per i Beni Sonori e Audiovisivi (ex Discoteca di Stato), both MiC; the Centro Studi
Americani; and the Istituto storico italiano per l'età moderna e contemporanea.
Source: https://it.wikipedia.org/wiki/Palazzo_Mattei_di_Giove

**38. Palazzo Caetani** (Mattei Caetani, Mattei alle Botteghe Oscure) — *historic-site*.
Via delle Botteghe Oscure 32 per it.wikipedia's street article; Nominatim reverse returns 33 at the
building centroid. Rione: **itwiki, in terms** · PIP 20/20 · Nom `Sant'Angelo`.
**Built for Alessandro Mattei between 1545 and 1564**; acquired by the Caetani in 1776, whence the
present name. it.wikipedia is explicit that the architect is unsettled — Ammannati is often given
and recently doubted, Claudio Lippi has been proposed with little support, Baglione mentions a
contribution by Vignola without making clear whether he designed it. **Say the architect is not
settled; do not pick one.**
**Now the seat of the embassy of Brazil to the Holy See**, the Fondazione Camillo Caetani (there
since 1963 per the street article), offices of the Fondazione Roffredo Caetani, and the FAI Rome
delegation. See §7 on the embassy.
Sources: https://it.wikipedia.org/wiki/Palazzo_Caetani_(Roma) ·
https://it.wikipedia.org/wiki/Via_delle_Botteghe_Oscure

**39. Palazzo Mattei di Paganica** — *historic-site*. Piazza dell'Enciclopedia Italiana (formerly
piazza Paganica). Rione: PIP 32/32 · **Nom `Sant'Angelo`, road "Piazza dell'Enciclopedia Italiana"**.
**Seat of the Istituto della Enciclopedia Italiana (Treccani)**, founded in Rome 18 February 1925 by
Giovanni Treccani and Giovanni Gentile. No it.wikipedia article for the palace itself.
**Flag: I could not get Treccani's own site to state the address.** `treccani.it/istituto/contatti/`
redirects to the portal homepage. The location rests on OSM plus Nominatim's street name plus the
square's own name. **Either find a Treccani page that states it or write the square, not the number.**
Source: https://it.wikipedia.org/wiki/Istituto_dell%27Enciclopedia_Italiana

**40. Palazzo di Giacomo Mattei** — *historic-site*. Piazza Mattei. OSM relation r1705997,
`building=palace`, centre in Sant'Angelo. Named in it.wikipedia's `Palazzo Mattei` disambiguation
as "edificio storico di Roma in piazza Mattei". turismoroma's piazza Mattei page describes *"le
basse facciate disadorne dei due più antichi palazzi Mattei costruiti l'uno, alla fine del
Quattrocento, l'altro nella prima metà del Cinquecento, probabilmente da Nanni di Baccio Bigio per
i figli di Mattei."*
Sources: https://www.turismoroma.it/it/luoghi/piazza-mattei · https://it.wikipedia.org/wiki/Palazzo_Mattei

**41. Palazzo Costaguti** (Patrizi Costaguti) — *historic-site*. Corner of piazza Mattei and via
della Reginella; also runs along via dei Falegnami with rear façades on piazza Costaguti.
Rione: **itwiki, in terms** · PIP 20/20 · turismoroma has its own page.
Built in the first half of the 16th century for Monsignor Costanzo Patrizi, treasurer to Paul III,
on the site of the demolished church of San Leonardo de Albis. **Sold in 1578, on Patrizi's death,
to Ascanio and Prospero Costaguti, Genoese bankers, for 26,000 scudi.** Renovated for the Costaguti
by Carlo Lambardi, 1597–1619. Ceilings frescoed by Guercino, Domenichino and Lanfranco among others
(turismoroma). **Currently the seat of Universitas Mercatorum**, a telematic university.
Sources: https://it.wikipedia.org/wiki/Palazzo_Costaguti ·
https://www.turismoroma.it/it/luoghi/palazzo-costaguti · https://www.turismoroma.it/it/luoghi/piazza-mattei
**The frescoed interiors are not stated by any source I fetched to be open to visitors. Do not imply
they are.**

**42. Palazzo Guglielmi Chiablese** — *historic-site*. Corner of piazza della Enciclopedia Italiana
with via Paganica. Rione: **itwiki, in terms**.
**Built 1776 for Benedetto di Savoia, duke of Chiablese.** Sold to the Guglielmi, who rebuilt it
entirely around 1880 into its present form; the wing facing the square was added after the old
church of Santi Sebastiano e Valentino dei Mercanti in the middle of the square was demolished.
**Seat of the Biblioteca dell'Istituto dell'Enciclopedia Italiana**, founded with the Institute in
1925; in 1926 Giovanni Gentile endowed it with the private collection of 18th- and 19th-century
encyclopaedias and lexicons of the engineer Aldo Santi, the puzzle-setter known as "Duca Borso".
Sources: https://it.wikipedia.org/wiki/Palazzo_Guglielmi_Chiablese ·
https://it.wikipedia.org/wiki/Biblioteca_dell%27Istituto_dell%27Enciclopedia_Italiana

**43. Palazzo Savelli Orsini (Palazzo Orsini)** — *historic-site*. On top of the Teatro di Marcello,
Monte Savello. Rione: **itwiki** — *"a Monte Savello presso il rione romano Sant'Angelo"** (note the
hedging word *presso*, "near") — · PIP (relation centre) · the Sovrintendenza's Teatro di Marcello
page places the palace on the theatre and the theatre in Rione XI.
Raised in the 1500s by Baldassarre Peruzzi for the Savelli on the ruins of the theatre, itself
already a medieval fortress of the Pierleoni and the Fabi. **Bought in 1729 for 29,000 scudi by
Ferdinando Bernualdo Filippo Orsini d'Aragona of the dukes of Gravina**, whom Benedict XIII, of the
same family, had legitimated to the Roman Orsini succession. The new owners moved the family archive
there from the palazzo di Monte Giordano and added three ranges around the garden, entered from the
square through a gate between piers carrying the family's heraldic bears. **The painter Giacomo
Zoboli lived there from 1760 until his death in 1767.**
**Now the seat of the embassy of the Sovereign Military Order of Malta to the Holy See.** See §7.
Sources: https://it.wikipedia.org/wiki/Palazzo_Savelli_Orsini · https://it.wikipedia.org/wiki/Monte_Savello

**44. Palazzo Lovatelli (Gaetani Lovatelli, formerly Serlupi)** — *historic-site*. Piazza Lovatelli.
OSM carries two ways of this name (w123530469 with `architect=Giacomo Della Porta (?)`, w123530473);
both PIP wholly in Sant'Angelo. The Sovrintendenza's page on its own headquarters says the square
was formerly piazza Serlupi, from the family that built its residence there in 1580. it.wikipedia's
piazza di Campitelli article says the medieval church of S. Maria in Campitello stood where the
palazzo Gaetani Lovatelli now is.
**No it.wikipedia article for the palace itself. OSM's Della Porta attribution carries a question
mark in the data and must not be published.**

**45. Sovrintendenza Capitolina ai Beni Culturali (the palace)** — *historic-site* and the working
seat of the body that authored half this file. **Piazza Lovatelli 35 — stated in the site's own
footer.** Tel 06 6710 3238 / 3887. PIP · Sovrintendenza's own map places it in Sant'Angelo.
Two buildings, 16th and 17th century, replacing and partly absorbing medieval units on the square.
Restored in the 1990s to a project by a team led by Paolo Marconi. **The façade was restructured in
1764 on a survey by Luigi Vanvitelli**, who gave it the flat rustication; on the via di Sant'Angelo
in Pescheria flank the original look survives, with false rustication incised in the plaster.
Two rooms retain frescoes and stucco; the altana and the main portal on the square survive.
Historically tied to the convent of Sant'Ambrogio alla Massima, which stood on the site of the
Portico di Filippo and from the 17th century owned both buildings.
Source: https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/sovrintendenza_capitolina

**46. Palazzo Clementi** — *historic-site*. Piazza di Campitelli. OSM relation r1705009, centre in
Sant'Angelo. it.wikipedia's piazza di Campitelli article: it stands where the tower called del
Merangolo or Citrangolo was absorbed into the house of Fabrizio de Massimi, and it is **"ora sede
della Soprintendenza ai Beni Ambientali e Architettonici del Lazio"**.
**No dedicated article; the institutional occupant is stated only by the piazza article and is
likely to have been renamed since (the body is now a Soprintendenza ABAP). Verify or omit the
occupant.** Source: https://it.wikipedia.org/wiki/Piazza_di_Campitelli

**47. Palazzetto di Flaminio Ponzio** — *historic-site*. **Piazza di Campitelli 6.**
Rione: PIP 13/13 · Sovrintendenza map places it in Sant'Angelo.
A subtle one worth getting right: **the building is a 1950s block, and only the façade is Ponzio's.**
Flaminio Ponzio (1559/60 – Rome 1613) built the original in 1600 on via Alessandrina, **in rione
Monti**, and it was demolished in 1933 for the opening of via dei Fori Imperiali. The architectural
elements of the front were dismantled and kept, and re-erected here twenty-odd years later, closing
the short east end of the square. The mascaron of the central window was re-carved in the 1950s work
on the model of the original. Seat of the Comune's Dipartimento IV.
Source: https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/beni_architettonici/palazzetto_di_flaminio_ponzio

**48. Albergo della Catena** — *historic-site*. Via della Tribuna di Campitelli.
Rione: Sovrintendenza map places it in Sant'Angelo · PIP.
**Built between the 12th and 14th centuries as an inn**, against the temple of Apollo. Named for a
chain that barred the alley then called "della Catena di Pescheria" — the Sovrintendenza explains
the practice: chains marked a property, or kept carts out near hospitals and hospices, or, by a
noble palace, showed when taut that the owner was away. Bought by the Comune in 1929 for the
widening of the via del Mare and slated for demolition; not demolished, but restructured in
1929–1930, isolating the medieval part. Three merged units on an L plan; the alley disappeared in
1933. **It was formerly the institutional seat of the Sovrintendenza Capitolina.**
Source: https://www.sovraintendenzaroma.it/content/albergo-della-catena-0

**49. Torre dei Grassi** — *historic-site*. Between via Sant'Angelo in Pescheria, via della Tribuna
di Campitelli and via del Portico d'Ottavia. Rione: **itwiki, in terms** · PIP 8/8.
Medieval, built in phases from perhaps the 12th century, set against the Portico d'Ottavia. Called
*Fornicata* for its shape and *dei Grassi* for the family **who bought it from the Orsini in 1369**;
**bought in 1481 by the Ospedale di Santa Maria della Consolazione.**
Source: https://it.wikipedia.org/wiki/Torre_dei_Grassi

**50. Case dei Fabi** — *historic-site*. OSM w123530496 (11/11) and relation r1689643 (centre in
Sant'Angelo), via del Portico d'Ottavia.
The rione's own article: the baronial families of the Fabi and later the Savelli nested inside the
ruins of the theatre of Marcellus. **OSM is my only source for this named building group.** No
article, no Sovrintendenza page. **Weak; recommend folding into Monte Savello or dropping.**

**51. Villino Lupi** — **STRADDLER, see §5.3.** Piazza Cinque Scole 37, corner of via Catalana.
it.wikipedia: *"nel rione Sant'Angelo"*; **Nominatim reverse at piazza delle Cinque Scole 37
returns `quarter = "Regola"`.** Part of the 1885 clearance of the ghetto; slowed by the building
crisis of 1888 and the failure of the Banca Tiberina; the plot was divided in 1909 and the building
**finished in 1910 to a design by Romolo Gui**; in 1925 Salvatore Rebecchini submitted a scheme to
add a storey and a Guelph crenellation to the attic.
Source: https://it.wikipedia.org/wiki/Villino_Lupi

**52. Palazzo Santacroce (piazza Costaguti)** — **LOW CONFIDENCE, see §9.** OSM w125374966, PIP
12/12; Nominatim reverse returns `quarter = "Regola"`, road via di Santa Maria del Pianto.
it.wikipedia's `Palazzo Santacroce` article describes a **different** building, in **rione Regola**
between piazza Benedetto Cairoli, via degli Specchi and vicolo de' Catinari. But it.wikipedia's
Santa Maria in Publicolis article refers to *"Palazzo Santacroce a Sant'Angelo"*, so a second
Santacroce palace here does appear to exist. **I could not establish which building OSM's polygon
is. Do not write this until someone does.**

**53. Palazzo Astalli** — **STRADDLER / LOW CONFIDENCE, see §9.** OSM w125226034 and relation
r1689641-adjacent block near piazza Margana; PIP 20/20 Sant'Angelo; Nominatim `quarter =
"Sant'Angelo"`, road via delle Botteghe Oscure 4. **But it.wikipedia's article opens: "Il Palazzo
Astalli è un edificio sito in Roma, Via San Marco n. 8 (Rione X Campitelli)"** and describes a
sub-triangular plan between via San Marco, vicolo degli Astalli and via dell'Aracoeli — which is
several hundred metres north-east of the OSM polygon. Built for Monsignor Fulvio Astalli and his
brother Cardinal Camillo from 1642 by Giovanni Antonio De Rossi.
**Either OSM has mislabelled a building or there are two. Both methods say Sant'Angelo and the only
prose source says Campitelli. Unresolved.**

**54. Torre dei Margani (Torre Margana)** — **STRADDLER, see §5.2.** 14th century, part of the
Margani family's holdings, adjoining piazza Margana; later absorbed into a 16th-century palace.
PIP 5/5 Sant'Angelo; **Nominatim `quarter = "Campitelli"`, road piazza Margana 37**; and
**both** it.wikipedia's rione article **and Roma Capitale's official boundary list** name piazza
Margana as a Sant'Angelo *boundary*. Source: https://it.wikipedia.org/wiki/Torre_dei_Margani

**55. Convento di Sant'Ambrogio alla Massima** — see 17. OSM relation r1705011, centre in
Sant'Angelo. Extended its holdings over most of the block between via di Sant'Ambrogio, piazza
Lovatelli and via di Sant'Angelo in Pescheria.

### 4.5 Fountains, plaques and street furniture (4)

**56. Fontana delle Tartarughe** — *historic-site*. Piazza Mattei.
Rione: **itwiki, in terms** · PIP 9/9 · Nom `Sant'Angelo`, house number 7/8 ·
Sovrintendenza map places it in Sant'Angelo.
**Made 1581–1588** to a design by Giacomo della Porta (1533–1602) with sculpture by the Florentine
Taddeo Landini (1550–1596). Materials, from the Sovrintendenza: africano, pavonazzetto, white and
bigio marble; travertine; bronze. Original supply: the Acqua Vergine. Four bronze ephebes playing
with dolphins on shell basins. **A fountain had been decided for the nearby piazza Giudea in 1570;
the nobleman Muzio Mattei prevailed on the administration to move it to the square his own house
faced, in exchange for undertaking "a far mattonare la piazza a sue spese e tener netta la fonte".**
Four of the eight intended dolphins were never installed because the water pressure would not lift
them; they went to the Fontana della Terrina. **The four turtles on the rim of the upper basin,
traditionally attributed to Bernini, were added in the restoration of 1658–59** under Alexander VII,
recorded on the four marble cartouches. Restored 2005–2006 with new water treatment, and in 2025
under the PNRR – Caput Mundi programme.
turismoroma adds: the turtles were stolen repeatedly — 1906, 1944, and 1981 — and **the ones in
place now are copies, three surviving originals being in the Musei Capitolini.**
Sources: https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_delle_tartarughe ·
https://www.turismoroma.it/it/luoghi/piazza-mattei · https://www.turismoroma.it/it/luoghi/fontana-delle-tartarughe ·
https://it.wikipedia.org/wiki/Fontana_delle_Tartarughe
**Two superlatives to cut.** turismoroma calls it *"una delle fontane più belle di Roma"* and *"una
delle più belle fontane di Roma"* on two different pages. **Banned. The turtle theft and the Bernini
attribution are far better copy than a ranking anyway.**

**57. Fontana in piazza delle Cinque Scole (Fontana del Pianto)** — **STRADDLER, see §5.3.**
Rione: PIP Sant'Angelo (and the Sovrintendenza's own map coordinate lands inside the polygon);
**Nominatim `quarter = "Regola"`**; and both boundary lists name piazza delle Cinque Scole as a
Sant'Angelo *boundary*.
Designed by Giacomo della Porta with the stonecutter Pietro Gucci for piazza Giudea, at one of the
five gates of the ghetto, after the Acqua Felice was completed in 1587. **The arms of the
Conservatori and the Prior of the Caporioni on the basin rim date it to the third quarter of 1593.**
Dismantled in the demolition of the ghetto at the end of the 19th century; **re-erected in 1930**,
on the initiative of the Governor of Rome Francesco Boncompagni Ludovisi, in via del Progresso, now
piazza delle Cinque Scole, on axis with the portal of palazzo Cenci.
it.wikipedia adds the reason the Acqua Felice branch was run this way at all: the ghetto, instituted
1555, had no water source, the nearest fountain being across the river in piazza Santa Maria in
Trastevere.
Sources: https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_in_piazza_delle_cinque_scole ·
https://it.wikipedia.org/wiki/Fontana_di_piazza_delle_Cinque_Scole

**58. Edicola sacra della Madonna Annunciata, via delle Botteghe Oscure 34 (palazzetto dell'Olmo)**
— *historic-site*, small. Rione: PIP · Nominatim forward-geocode of "Via delle Botteghe Oscure 34"
returns `quarter = "Sant'Angelo"`. **The Sovrintendenza's page does not carry a `Rione:` field for
edicole**, so this is the one Sovrintendenza record here without its own attribution.
On a 15th-century building that belonged to the Mattei, though the Sovrintendenza says written and
oral testimony puts the shrine originally between piazza Mattei and piazza Paganica, in what was
historically the contrada dell'Olmo. Painting under glass in a gilt stucco frame with a tympanum and
the dove of the Holy Spirit; lilies and a cartouche reading *Mater Providine*. Known both as
Madonna della Provvidenza and Madonna dell'Annunciata. **In restoration in the 1970s the signature
of Vincenzo Milone was found, dating the work to 1788**; a record of an 1898 restoration was found
in the same work. Three marble epigraphs below refer to the miraculous movement of the Virgin's eyes
in the summer of 1796, during the French invasion; the Sovrintendenza says about twenty-five images
in Rome were officially recognised by cardinalatial decree as subject to such events.
Source: https://www.sovraintendenzaroma.it/content/edicola-sacra-di-delle-botteghe-oscure-34-palazzetto-dell%E2%80%99olmo
(OSM has this as node n12595779119 "Madonna Annunciata", `start_date=C18`, PIP Sant'Angelo.)

**59. Lapide per Aldo Moro** — memorial plaque, via Michelangelo Caetani. OSM n4375903692,
`historic=memorial`, `memorial=plaque`, PIP Sant'Angelo.
**I have OSM only for the plaque itself.** The event it marks is documented at length in
it.wikipedia's Aldo Moro article, which I fetched but did not read for this purpose.
**A verifier must source this properly before a word is written. It marks a murder.**

### 4.6 Museums, libraries and cultural institutions (7)

**60. Museo Nazionale Romano — Crypta Balbi** — *museum*. **Via delle Botteghe Oscure 31.**
Rione: PIP 7/7 on the museum building · **Nominatim `quarter = "Sant'Angelo"`, road via delle
Botteghe Oscure, house number 31** — I checked this specifically because the street is the Pigna
boundary and the entrance could have fallen on the wrong side. It does not.
**CRITICAL AND CURRENT: the site is closed to the public.** Roma Capitale, verbatim:
*"A partire dal 9 gennaio 2023 la sede di Crypta Balbi è chiusa al pubblico per i lavori legati alla
realizzazione del grande progetto URBS: dalla città alla campagna romana."*
One of the four seats of the Museo Nazionale Romano with Palazzo Massimo, Palazzo Altemps and the
Terme di Diocleziano. Display on three levels — ground floor the archaeology of the Balbus complex
and the neighbouring Porticus; first floor the buildings raised against the Crypta after the fire of
80 AD and abandoned in the 7th century; second floor the changes from late antiquity to the Middle
Ages. The museum rooms are in the 17th-century dormitory of the convent of Santa Caterina.
Email mn-rm@cultura.gov.it.
**Attribution is mandatory here.** The museum's own domain was unreachable, so every fact above is
Roma Capitale's account of a state museum, not the state museum's own. **Attribute to Roma Capitale
and do not state a reopening date — none is given.**
Sources: https://www.turismoroma.it/it/luoghi/museo-nazionale-romano-crypta-balbi ·
https://www.turismoroma.it/it/luoghi/crypta-balbi · https://it.wikipedia.org/wiki/Crypta_Balbi
**One number to drop.** it.wikipedia says the Museo Nazionale Romano circuit had 247,795 visitors in
2013 and was the 21st most-visited state site in Italy. **The ranking is a superlative and banned;
the visitor figure is for the whole four-site circuit, not for Crypta Balbi, and would mislead.
Drop both.**

**61. Biblioteca di storia moderna e contemporanea** — *museum* (a public library; the schema has
no library kind, and the verifier must decide whether it ships at all). In Palazzo Mattei di Giove.
A state public library, a peripheral organ of the Ministero della cultura. Its collections began at
the end of the 19th century as the Risorgimento section of the Biblioteca nazionale Vittorio
Emanuele II; the institute was renamed Biblioteca Museo Archivio del Risorgimento between 1921 and
1923; in Gentile's 1934 reorganisation the museum and part of the archive went to the Istituto per
la storia del Risorgimento italiano in the Vittoriano, and the books and part of the manuscripts to
the Istituto storico italiano per l'età moderna e contemporanea, **taking the present name in 1937
and moving to Palazzo Mattei di Giove.**
**`bsmc.it` timed out. No hours, no admission terms. Do not invent them.**
Source: https://it.wikipedia.org/wiki/Biblioteca_di_storia_moderna_e_contemporanea

**62. Istituto della Enciclopedia Italiana (Treccani)** — in Palazzo Mattei di Paganica; see 39.
Founded in Rome **18 February 1925** by Giovanni Treccani and Giovanni Gentile as the Istituto
Giovanni Treccani. **Not a visitor attraction** on any evidence I have. Recommend it appear as the
occupant of the palace, not as its own record.

**63. Biblioteca dell'Istituto dell'Enciclopedia Italiana** — in Palazzo Guglielmi Chiablese;
see 42. Same recommendation.

**64. Spazio Treccani Arte** — *museum* / gallery. Piazza dell'Enciclopedia Italiana.
OSM n11233802634, `tourism=gallery`, `operator=Istituto della Enciclopedia Italiana`,
**`start_date=2023-10-03`**. PIP Sant'Angelo.
**OSM is my only source. I could not confirm it on treccani.it. Verify or drop.**

**65. Centro Studi Americani** — in Palazzo Mattei di Giove. it.wikipedia has an article; the
organisation's homepage answered but every interior page 404s.
**No hours, no address confirmed from the organisation itself.** Recommend a clause inside 37.

**66. Associazione nazionale per gli interessi del Mezzogiorno d'Italia (ANIMI)** — carried by
it.wikipedia in the `Roma R. XI Sant'Angelo` category. **I fetched the article but did not verify
its address independently, and it is an association rather than a visitable place.
Recommend: out.**

**67. Universitas Mercatorum** — telematic university, occupant of Palazzo Costaguti; see 41.
Occupant note only, not a record.

### 4.7 Squares and streets (14 carried, beyond those already listed)

All PIP-tested. Share notation is *vertices in Sant'Angelo / total tested*.

| # | Name | PIP | Note |
|---|---|---|---|
| 68 | **Piazza Mattei** | 7/7 and 2/2; relation r1422947 centre inside | turismoroma has its own page. The Fontana delle Tartarughe, Palazzo Costaguti and two early Mattei palaces face it. |
| 69 | **Piazza di Monte Savello** | 38/38 (square), 10/10, 6/7 on one service way | Nom `Sant'Angelo` |
| 70 | **Piazza Lovatelli** | 2/2; relation r2736132 centre inside | Formerly piazza Serlupi |
| 71 | **Piazza Costaguti** | 8/8 and 16/16 | |
| 72 | **Piazza Paganica** | 15/15 | |
| 73 | **Piazza dell'Enciclopedia Italiana** | 17/17 and 4/4 | Formerly piazza Paganica; the church of Santi Sebastiano e Valentino stood in the middle of it |
| 74 | **Piazza Gerusalemme** | 6/6 and 17/17 | |
| 75 | **Via dei Funari** | 20/20 (square-tagged way), 10/10, 3/3, 4/5 | Named for the rope-makers |
| 76 | **Via di Sant'Ambrogio** | 5/5 and 7/7 | |
| 77 | **Via di Sant'Angelo in Pescheria** | 8/8 and 2/2 | |
| 78 | **Via del Foro Piscario** | 6/6 | The Oratorio di Sant'Andrea stands on it |
| 79 | **Via Michelangelo Caetani** | 4/4 | Carries the Moro plaque |
| 80 | **Vicolo Costaguti** | 5/5 plus four footway fragments | |
| 81 | **Via Elio Toaff** | 7/7 | Named for the chief rabbi; **I fetched the Toaff article but did not verify the naming.** |

Straddling streets are in §5.5, not here.

### 4.8 Eating, shopping and staying (22 in Sant'Angelo proper)

Kind, address and — where the business or Roma Capitale states them — hours. **All PIP wholly inside
Sant'Angelo unless noted.** Under the ruling, a business's own site establishes identity, location
and hours and nothing else; every "since 19xx" below is flagged where it is the business's own claim.

**82. Pasticceria Boccione / Forno Boccione** — *cafe* or *shop*. Via del Portico d'Ottavia 1.
Tel 06 6878637. **Named by Roma Capitale's own rione page**: *"un'ottima torta di visciole e ricotta
nella famosa pasticceria Boccione"*. OSM carries two nodes for it (n1987682661 `amenity=restaurant`,
n4060482821 `shop=bakery`, operator "Il Boccione S.A.S"), with slightly different hours
— Su–Th 08:00–19:30, Fr 08:00–15:30 on one; Mo–Fr 08:00–19:30, Su 08:00–15:00 on the other.
**The two OSM records disagree. Publish no hours until one is confirmed from the business.**
Source: https://www.turismoroma.it/it/page/rione-xi-santangelo

**83. Antico Forno Urbani** — *shop* (bakery). Piazza Costaguti 31.
**Named by Roma Capitale's rione page**: *"un appetitoso trancio di pizza nell'antico forno Urbani"*.
OSM hours (checked 2024-01-29): Mo–Fr 07:40–14:30 and 17:00–19:45; Sa 08:30–13:30; Su 09:30–13:00.
**"Antico" in the name is not evidence of age** — wave 1 ruled this explicitly and it applies here.
Source: https://www.turismoroma.it/it/page/rione-xi-santangelo

**84. Trattoria Giggetto al Portico d'Ottavia** — *restaurant*. **Via del Portico d'Ottavia 21/A–22.**
Tel 06 6861105. **In Roma Capitale's *Negozi Storici di Eccellenza* register, with its own page.**
**Hours, from Roma Capitale:** Tuesday to Sunday 12.30–15.00 and 19.30–23.00; closed Monday.
Roma Capitale's account: Luigi Ceccarelli, called Giggetto, founded the osteria with his wife Ines
in 1923; their son Franco and his wife Lidia carried it on; it is now with Claudio and Marco
Ceccarelli in the third generation. The 1923 founding date is stated by **both** Roma Capitale and
the restaurant's own site, which is as good as this class of fact gets.
Sources: https://www.turismoroma.it/it/luoghi/trattoria-giggetto-al-portico-dottavia · https://www.giggetto.it/

**85. Nonna Betta** — *restaurant*. **Via del Portico d'Ottavia 16.** Tel 06 6880 6263.
**Hours from the restaurant's own site:** Monday to Sunday 12.15–15.00 and 18.30–22.00, closed
Tuesday. **Their site claims "1° ristorante kosher style a Roma" — a priority claim. Banned.**
Source: https://www.nonnabetta.it/

**86. BellaCarne** — *restaurant*, kosher. Via del Portico d'Ottavia 51. Tel +39 06 6833104.
OSM hours: Mo–Th 12:00–15:30 and 18:30–00:00; Fr 12:00–15:30; Sa 21:30–00:00; Su 12:00–15:30 and
16:30–00:00. Source: https://www.bellacarne.it/

**87. La Taverna del Ghetto** — *restaurant*. Via del Portico d'Ottavia 8.
Runs a cooking class. Source: https://www.latavernadelghetto.com/

**88. Ba'Ghetto** — *restaurant*, kosher, via del Portico d'Ottavia 57, tel 06 68892868; and
**89. Ba'Ghetto Milky** — *restaurant*, dairy, via del Portico d'Ottavia 2. kosherinrome.it.

**90. Renato al Ghetto** — *restaurant*. Via del Portico d'Ottavia 5. OSM hours: Mo–Th, Su
12:00–22:00; Fr 12:00–15:00; Sa closed.

**91. La Reginella d'Italia** — *restaurant*. Via del Portico d'Ottavia 65. lareginella.it.

**92. Il Giardino Romano** — *restaurant*. Via del Portico d'Ottavia 18.

**93. La Dolceroma** — *shop* (pastry), Austrian. Via del Portico d'Ottavia 20.
turismoroma's quarter page mentions *"l'unica austriaca di Roma"* among the pasticcerie —
**a uniqueness claim, banned, and it does not name the shop anyway.**

**94. Kosher Delight** — *shop*. Via del Portico d'Ottavia 11. kosherdelight.it.

**95. Ditta Leone Limentani** — *shop* (housewares). **In Roma Capitale's *Negozi Storici di
Eccellenza* index — and Roma Capitale's own page for it 404s.** No working official page found;
the shop's likely own domains did not resolve. **Real candidate, no usable source. Do not write it
on the strength of an index entry alone.**

**96. Le Tartarughe** — *cafe*. Piazza Mattei 7/8. OSM hours 07:30–24:00.
**97. Bar Totó** — *cafe*, via del Portico d'Ottavia area.
**98. Grezzo** — *shop* (raw chocolate / ice cream). Piazza Mattei 14. grezzorawchocolate.com.
OSM hours: Su–Mo, Th 12:00–20:00; Fr–Sa 12:00–23:00.
**99. Gelateria Steccolecco** — *shop*. Via del Portico d'Ottavia 6. steccolecco.com. OSM: daily
11:00–00:00.
**100. Pizza Florida** — *restaurant* / bakery. Via Florida 25. OSM: Mo–Sa 10:00–22:00.
**Flag: via Florida is a boundary street with Pigna** (§5.5) — the address needs a footprint check.
**101. Peperita** — *shop*. Via Reginella 30. peperita.it. OSM: 10:30–20:00.
**102. ALEFBET — the hebrew letters art gallery** — *shop* / gallery. Via della Reginella 25.
gabrielelevy.com.
**103. F.A.D. room** — gallery. Via della Reginella 12. fadroom.it.
**104. Bottega Tredici** — *restaurant*. Via dei Falegnami 14.
**105. Osteria Pane Vino e San Daniele** — *restaurant*. Near piazza Mattei.
**106. Ristorante Il Fantino** — *restaurant*. Via di Sant'Angelo in Pescheria 14.
ristoranteilfantino.it.
**107. Tribuna Campitelli** — *restaurant*. Via della Tribuna di Campitelli area. OSM checked
2026-08-09.
**108. AquaMadre Hammam** — an unusual and genuinely guide-worthy entry, though the schema has no
kind for it. Via di Sant'Ambrogio 17. Tel +39 06 6864272. acquamadre.it. OSM hours: We, Fr
11:00–21:00; Tu 14:00–21:00; Th, Sa–Su 11:00–21:00. Their own site describes a Roman-model sequence
of rooms — apodyterium, tepidarium at 34°, calidarium at 45° and 100% humidity.
**109. Thompson Rome** — *hotel*. Via delle Botteghe Oscure 4. Hyatt. PIP 24/24; Nominatim at the
building returned `quarter = "Sant'Angelo"` at via delle Botteghe Oscure 4. **hyatt.com returned
HTTP 403 to urllib, so I have no first-party source. Verify or drop.**
**110. Hosianum Palace** — *hotel*. Via dei Polacchi 23. Tel +39 06 697191. hosianum.com. Their own
site: a historic residence in a 16th-century building, 28 rooms.
**Their site sites itself by walking time from piazza Venezia and the Capitoline Hill. Trip
durations are banned — do not import those sentences.**
**111. Rialto (Circolo culturale Arci)** — arts centre. Via di Sant'Ambrogio 4. OSM only.

**Also present and probably not guide-worthy, listed so the arbitrator can see the tail:** Alice
(pizza chain, Portico d'Ottavia 7), Oriental Fonzie (via di Santa Maria del Pianto 65), Panepiú
Bistrot and Bar Amore and Marcus Shoes and Sciunnacche (via Florida), Dispensa (via Paganica 8),
Enzo Bar (via dei Funari 23), two Pam Local convenience stores, Mini Market and Self Service Laundry
(via dei Falegnami), two opticians, a lawyer's office, two segway/tour operators.

### 4.9 Other (2)

**112. Scuola Elementare Vittorio Polacco** — the Jewish school, via del Tempio 5, with a secondary
school at via del Portico d'Ottavia 73. OSM only. **A working school with children in it. Not a
visitor attraction and I recommend it stay out of the corpus entirely**, notwithstanding that a
guide could honestly mention that the quarter still has its own school.

**113. Centro di Documentazione dell'Appia** — Sovrintendenza documentation centre,
**via del Teatro di Marcello 5**. Its coordinate on the Sovrintendenza's own map PIPs inside
Sant'Angelo. **Note the wave-1 rule cuts the other way here: the address is on via del Teatro di
Marcello, which wave 1 said routes businesses to Campitelli. This is not a business and the
coordinate is inside the polygon. Flagged for the arbitrator rather than resolved.**
Source: https://www.sovraintendenzaroma.it/i_luoghi/mappa_dei_luoghi

---

## 5. STRADDLERS — flagged, NOT resolved

Nineteen. Sant'Angelo is 480 m across and **every one of its six land borders runs down the middle
of a named street or square**, which is why the count is so high for so small a unit. The two
official boundary lists I have differ from each other, which is itself a finding.

**The two boundary lists, side by side.** Both are usable sources; they are not identical.

*Roma Capitale (turismoroma, rione XI page), "Confini":* largo Arenula, via Florida, via delle
Botteghe Oscure, via dell'Aracoeli, **via Margana, piazza Margana**, via dei Delfini, **via dei
Cavalletti**, via della Tribuna di Campitelli, via del Teatro di Marcello, via del Foro Olitorio,
lungotevere de' Cenci, via del Progresso, piazza delle Cinque Scole, via Santa Maria del Pianto,
via in Publicolis, via di Sant'Elena.

*it.wikipedia, rione article:* Pigna — via Florida, via delle Botteghe Oscure. Campitelli — via
dell'Aracoeli, vicolo e piazza Margana, via dei Delfini, via Cavalletti, via della Tribuna di
Campitelli, **via Montanara**, via del Teatro di Marcello. Ripa — via del Foro Olitorio, via di
Monte Savello. Tiber — lungotevere dei Cenci. Regola — via del Progresso, piazza delle Cinque Scole,
via di santa Maria del Pianto, via in Publicolis. Sant'Eustachio — **via dei Falegnami**, via di
Sant'Elena, largo Arenula.

Differences that matter: it.wikipedia adds **via di Monte Savello** and **via Montanara** and
**via dei Falegnami** as boundaries; Roma Capitale does not. Sala Santa Rita is *on* via Montanara.
**Neither list is decisive against a footprint test, and the arbitrator should not treat either as
one.**

### 5.1 Piazza di Campitelli — re-flagged despite the wave-1 ruling

| Method | Result |
|---|---|
| PIP, relation r7827800 centre | **Sant'Angelo** |
| PIP, way w27312606 (roadway), 3 vertices | **Campitelli** (3/3) |
| Nominatim reverse at the relation centre | **`quarter = "Campitelli"`** |
| it.wikipedia | *"prende nome dal rione omonimo"* — names it for Campitelli, states no rione |
| Roma Capitale boundary list | does not name it either way |

**Wave 1 ruled it Sant'Angelo**, reasoning that the church settles it and the square goes with the
church. **I am flagging that two of my four determinations now say Campitelli, and one of them is
the method the brief named.** The church itself is unambiguous (30/30, three sources). The square
is not. **I am not overturning anything — the arbitrator should decide whether the wave-1 ruling
survives this evidence, and the answer may well be yes.**

Note what hangs on it: **Santa Maria in Portico (piazza di Campitelli 9), the Palazzetto di Flaminio
Ponzio (piazza di Campitelli 6), Palazzo Clementi and the Dipartimento Attività Culturali office
(piazza di Campitelli 7) all address on this square.** The church is settled independently. The
other three are not.

### 5.2 Torre dei Margani — geometry and Nominatim disagree, boundary lists say seam

PIP 5/5 Sant'Angelo; **Nominatim `quarter = "Campitelli"`, piazza Margana 37**; both boundary lists
name piazza Margana as the border; OSM's piazza Margana relation is 22/25 Campitelli.
**My reading is that this is Campitelli's, but the vote is 1–1 and I am not calling it.**

### 5.3 The Regola seam — piazza delle Cinque Scole and everything on it

Four entries, one seam. Both boundary lists name piazza delle Cinque Scole as the Sant'Angelo–Regola
border, and OSM's roadway ways for it split: three ways 5/5, 3/3 and 5/5 Sant'Angelo, one way 7/7
**Regola**, three more ways 7/1, 4/1 and 1/1 mixed, and the relation centre Sant'Angelo.

| Entry | PIP | Nominatim |
|---|---|---|
| **Piazza delle Cinque Scole** itself | mixed, relation centre Sant'Angelo | **Regola** |
| **Fontana in piazza delle Cinque Scole** (Fontana del Pianto) | Sant'Angelo, and the Sovrintendenza's own map coordinate is inside the polygon | **Regola** |
| **Villino Lupi**, Cinque Scole 37 | it.wikipedia says Sant'Angelo in terms | **Regola** at hn 37 |
| **Palazzo Santacroce** (piazza Costaguti / via S. Maria del Pianto) | 12/12 Sant'Angelo | **Regola** |

**Also on this seam and clearly Regola, so recorded in §6 not here:** Palazzo Cenci, Arco dei Cenci,
piazza dei Cenci, via Beatrice Cenci, Santa Maria del Pianto ai Catinari, and the five best-known
"Ghetto" restaurants (§6.3).

### 5.4 Santa Maria in Publicolis — the sharpest single disagreement in the file

**it.wikipedia: *"situato nel rione Sant'Angelo, in via in Publicolis"*.
My PIP: 8 of 8 footprint vertices in Sant'Eustachio.**
Via in Publicolis itself splits 4 Sant'Angelo / 1 Sant'Eustachio and its centroid is Sant'Eustachio;
vicolo in Publicolis is 2/2 Sant'Angelo. Both boundary lists name via in Publicolis as the
Sant'Angelo–Regola border, and neither mentions Sant'Eustachio there at all — so **all three
authorities disagree about which pair of rioni meet on this street.**
I did not get a Nominatim reading for the church. **Unresolved and important: this is a whole
church, not a street corner.**

### 5.5 Boundary streets — vertex shares as measured

| Street | Sant'Angelo share | Other |
|---|---|---|
| **Lungotevere De' Cenci** (w22880293) | 21 | Regola 6 — centroid Sant'Angelo |
| **Largo Arenula** (relation w125374941 + w210676300) | 7 and 1 | Sant'Eustachio 22 and 13 — **plurality elsewhere** |
| **Via Florida** (w165913043, w210676302) | 5 and 3 | one centroid Pigna, one Sant'Angelo |
| **Via delle Botteghe Oscure** (w28867489, w232765095) | 8 and 2 | Campitelli 1; one centroid Pigna |
| **Via di Santa Maria del Pianto** (w22894027) | 1 | Sant'Eustachio 4, Regola 2 — **centroid Regola**; a second way (w125374933) is 4/4 Sant'Angelo |
| **Via in Publicolis** (w27312862) | 4 | Sant'Eustachio 1 — centroid Sant'Eustachio |
| **Via dei Falegnami** (w366694006) | 1 | Sant'Eustachio 1 — a second way is 3/3 Sant'Angelo |
| **Via di S. Elena** (w28867561) | 4 | centroid Sant'Eustachio |
| **Via della Tribuna di Campitelli** (w47454135) | 10 | Campitelli 1 |
| **Via dei Polacchi** (w41156431) | 10 | Campitelli 1 |
| **Via dei Delfini** (w41156427) | 5 | Campitelli 1 |
| **Via dei Funari** (w27312613) | 4 | Campitelli 1 |
| **Piazza di Monte Savello** (w97165981) | 6 | Ripa 1 |
| **Lungotevere dei Pierleoni** (w122229669, w49074919) | 6 and 8 | Ripa — **both centroids Ripa** |
| **Ponte di Quattro Capi / Ponte Fabricio** (w23609592) | 1 | Ripa 2 — **centroid Ripa** |
| **Piazza Margana** (w125225995) | 3 | Campitelli 22 |
| **Tempio D**, largo Argentina (w125566969) | 2 | Pigna 3 |
| **Tevere** (w366694000) | 4 | Ripa 11, Regola 5 |

**My reading, offered and not taken:** largo Arenula, piazza Margana, Tempio D, the Tiber, the
Pierleoni embankment and ponte Fabricio all sit with a plurality elsewhere. Lungotevere de' Cenci,
via della Tribuna di Campitelli, via dei Polacchi, via dei Delfini and via dei Funari sit with a
plurality in Sant'Angelo. **The programme has previously ruled that a street four rioni share is
owned by none (wave 2 on via del Corso and corso Vittorio Emanuele II), and largo Arenula and the
Tiber both look like that case.**

---

## 6. NOT IN SANT'ANGELO — fourteen a reader or a brief would put here

Recorded so no author restores them.

### 6.1 Area Archeologica di via delle Botteghe Oscure → PIGNA
**The Sovrintendenza's own page ends "Rione: Pigna."** This is the temple and quadriportico found in
1938 when the street was widened, variously identified as the Porticus Minucia Vetus or Frumentaria.
**It is directly across the street from Crypta Balbi and an author will assume it belongs with it.
It does not.** Groups only, max 16, booking on 060608; full €4.00, reduced €3.00, free for residents
of Rome and the metropolitan area and for MIC card holders; not accessible to disabled visitors;
restored in 2025 under PNRR – Caput Mundi.
Source: https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/aree_archeologiche/area_archeologica_di_via_delle_botteghe_oscure

### 6.2 Ripa's
**Isola Tiberina** (PIP Ripa), **Ponte Fabricio / ponte dei Quattro Capi** (centroid Ripa),
**Ponte Cestio**, **lungotevere dei Pierleoni**. Ponte Fabricio is the harder case — it lands the
Jewish quarter on the island, is called the *Pons Judaeorum*, appears in turismoroma's Jewish-quarter
page and in it.wikipedia's Sant'Angelo category, and the church of San Gregorio at its head is
Sant'Angelo's beyond doubt. **The bridge is still Ripa's on the only test I ran, and wave 1 already
sent ponte Cestio and ponte Palatino to Ripa on the same reasoning.**

### 6.3 Regola's — including the restaurants everyone calls "the Ghetto"
**Ristorante Piperno** (Monte de' Cenci 9), **Sora Margherita** (piazza delle Cinque Scole 30),
**Ristorante Al Pompiere** (via di Santa Maria de' Calderari 38 and piazza delle Cinque Scole 28),
**Beppe e i suoi formaggi** (via di Santa Maria del Pianto 9a–11), **Sheva**. All PIP Regola.
**This is the most consequential §6 entry for a guide writer.** Five of the restaurants a visitor
would name if asked to name the Ghetto's restaurants are across the line. Sant'Angelo still has
Giggetto, Nonna Betta, Ba'Ghetto, BellaCarne, La Taverna del Ghetto, Renato and the Boccione bakery,
so the guide does not go hungry — but **"the Ghetto's restaurants" is not a set that maps onto one
rione and no page should imply it does.**
Also Regola's: **Palazzo Cenci**, **Arco dei Cenci**, **piazza dei Cenci**, **via Beatrice Cenci**,
**Santa Maria del Pianto ai Catinari**, **Monte Cenci** (hotel).

### 6.4 Campitelli's
**Piazza Margana**, **Fontana di piazza dell'Aracoeli**, **Palazzo Albertoni**, **Palazzo
Capizucchi**, **Palazzo Cavalletti**, **Palazzo Muti Bussi**, **Monastero di Tor de' Specchi**,
**Palazzo Clementino**, and the whole Capitoline group. Wave 1 kept Palazzo Albertoni Spinola and
Palazzo Muti Bussi for Campitelli while giving the square they stand on to Sant'Angelo, and that
asymmetry is deliberate — it is the same principle in reverse here.
**And `antico-caffe-del-teatro-marcello`, already shipped by Campitelli.**

### 6.5 Pigna's, Sant'Eustachio's, Celio's
**Largo di Torre Argentina and the Area Sacra**, **Tempio D**, **Palazzo Cenci Bolognetti**,
**Fontana della Pigna** — Pigna. **Basilica di Sant'Andrea della Valle**, **Palazzo Vidoni**,
**Teatro Valle**, **Palazzetto del Burcardo** — Sant'Eustachio.
**The Colosseum — Celio**, verified at §2.3.

### 6.6 The Portico di Filippo
Nothing survives (§4.1 no. 10). Not a place.

---

## 7. RULING 2 — no Vatican property here, but two diplomatic traps

**Sant'Angelo contains no Vatican City territory and no Lateran Treaty property of either tier.**
The rione is 1.5 km from the Vatican and nothing in the Treaty's annexes touches it.

**Two buildings in the rione are diplomatic premises and neither is a Lateran Treaty case:**

1. **Palazzo Caetani, via delle Botteghe Oscure — embassy of Brazil to the Holy See.** A foreign
   state's mission accredited to the Holy See, standing on Italian soil in Rome. It is diplomatic
   premises under the Vienna Convention, which is an entirely different instrument from the Lateran
   Treaty. **It is not "in the Vatican" and not "Vatican territory". Say what it is or say nothing.**
2. **Palazzo Savelli Orsini, Monte Savello — embassy of the Sovereign Military Order of Malta to the
   Holy See.** OSM tags this `office=diplomatic`, "Ambasciata del Sovrano Militare Ordine di Malta
   presso la Santa Sede", via di Monte Savello 30; it.wikipedia's Monte Savello article states it in
   terms. **The SMOM is a sovereign entity that is not a state and holds no territory in Rome; its
   Roman properties have extraterritorial-style privileges under an Italian arrangement that is
   NOT the Lateran Treaty.** Do not describe it as Vatican, as Holy See property, or as Art. 15.
   **The safest page says the palace houses the Order's embassy to the Holy See and stops.**

**A third near-miss:** Santo Stanislao dei Polacchi is the Polish national church in Rome and the
Hosianum Palace hotel is named for Cardinal Hosius, who rebuilt it. National churches are not
extraterritorial and neither is a hotel named after a cardinal.

---

## 8. RULING 1 — every designation-adjacent phrase I met, and where it came from

I found **no** per-property protection statement in anything I fetched, because the only registers
that carry them were not consulted. What I did meet, and did not carry forward:

* it.wikipedia's article for the whole historic centre and the OSM relation **r14651598 "Centro
  storico di Roma, le proprietà extraterritoriali della Santa Sede e la basilica di San Paolo fuori
  le mura"**, whose centroid falls in Campitelli. This is the **UNESCO inscription**, and under the
  ruling the 1980 inscription is publishable *as an inscription* — **but no rione may claim to lie
  inside the property.** Sant'Angelo must not say it is in the World Heritage Site. The relation
  exists in the data and an author working from OSM will trip over it.
* The Sovrintendenza's `i_luoghi/sito_unesco/` section, linked from every place page, including a
  buffer-zone page. **Not fetched, not used, and it must not become a designation claim by the back
  door.**
* OSM's `heritage` and `ref:vincoli` keys: **I queried for them across the rione and found none set
  on any Sant'Angelo feature.** Nothing to quarantine.

---

## 9. THE THREE I AM LEAST CONFIDENT ABOUT

**1. Palazzo Santacroce (the one OSM draws on piazza Costaguti).** it.wikipedia's `Palazzo
Santacroce` article is about a different building, in Regola. it.wikipedia's Santa Maria in
Publicolis article refers in passing to "Palazzo Santacroce a Sant'Angelo", so a second one appears
to exist — but I have no article, no Sovrintendenza page and no turismoroma page for it, my PIP says
Sant'Angelo and Nominatim says Regola. **I cannot tell you what building this is.**

**2. Palazzo Astalli.** Both my geometric methods put OSM's polygon in Sant'Angelo; the only prose
source says via San Marco 8, Rione X Campitelli, and describes a plan that does not match the
polygon's position. Either OSM is mislabelled or there are two Astalli buildings. **Do not publish
until this is resolved, and note that a wrong answer here silently transfers a palazzo between two
rioni that are both live.**

**3. Chiesa di Santa Maria in Publicolis (§5.4).** it.wikipedia says Sant'Angelo in terms; all eight
footprint vertices test Sant'Eustachio; the two official boundary lists both say the street divides
Sant'Angelo from *Regola*, naming a third rione that neither of my other two answers mentions.
**Three sources, three answers.**

Runners-up, less consequential but recorded: **Spazio Treccani Arte** (OSM only, unconfirmed on
treccani.it); **Thompson Rome** (hyatt.com returned 403, no first-party source); **the Casina dei
Vallati's present occupant** (two official bodies each claim the building, one of them stale);
**Ditta Leone Limentani** (in Roma Capitale's register, and Roma Capitale's page for it 404s).

---

## 10. WHAT I DID NOT DO

* **I did not resolve a single straddler.** All 19 go up.
* **I did not settle the piazza di Campitelli question** that wave 1 ruled and my evidence
  partly contradicts. That is the arbitrator's, and the wave-1 ruling may well be right.
* **I did not read the Stefano Gaj Taché, Aldo Moro or 16 October 1943 material properly.** I fetched
  all three articles and skimmed them. Three of this rione's records commemorate murders, and I am
  handing the sources up rather than paraphrasing them at speed.
* **I did not count the pietre d'inciampo** in the rione or locate them.
* **I did not reach the Museo Nazionale Romano's own domain**, so Crypta Balbi is written entirely
  from Roma Capitale.
* **I did not reach the Biblioteca di storia moderna e contemporanea's own site**, so it has no hours.
* **I did not establish the rione's population or a sourced area figure** from Roma Capitale.
* **I did not check whether Regola, Ripa, Sant'Eustachio, Pigna or Celio are in this wave.** Several
  of my §6 exclusions land in rioni that may be being written right now, and the arbitrator will
  see both sides where I only saw one.

---

## 11. QUARANTINE — phrases from sources I fetched that must not be published

Superlatives and priority claims, all from sources that are otherwise good:

* *"il rione più piccolo della città"* / *"il più piccolo fra i rioni romani"* — **Roma Capitale and
  it.wikipedia both say it and it is still banned.** The measurable substitute: the polygon is about
  480 m by 360 m and encloses roughly a tenth of a square kilometre.
* *"il secondo più antico al mondo, dopo quello di Venezia"* and *"Considerato tra i più antichi al
  mondo – è secondo solo a quello di Venezia (1516)"* — turismoroma, about the ghetto. **The dates
  1516 and 1555 publish; the ranking does not.**
* *"la sinagoga più imponente della città"* — the Museo Ebraico's own site.
* *"una delle fontane più belle di Roma"* and *"una delle più belle fontane di Roma"* — turismoroma,
  two pages, about the Fontana delle Tartarughe.
* *"il primo edificio sacro costruito interamente in marmo a Roma"* (temple of Jupiter Stator) and
  *"il primo a Roma integralmente di marmo"* — it.wikipedia and turismoroma. **A first-in-Rome claim.**
* *"la prima statua femminile esposta in pubblico a Roma"* (the bronze Cornelia) — it.wikipedia.
* *"uno dei tre teatri di Roma antica, il più piccolo ma anche il più elaborato"* (theatre of
  Balbus) — it.wikipedia.
* *"il più antico della capitale a conservarsi ancora nella sua conformazione originaria"*
  (ponte Fabricio) — it.wikipedia. Not ours anyway.
* *"la massima impresa editoriale italiana in ambito culturale"* (the Enciclopedia Italiana) —
  it.wikipedia.
* *"1° ristorante kosher style a Roma"* — Nonna Betta's own site.
* *"l'unica austriaca di Roma"* — turismoroma, about an unnamed pasticceria.
* *"uno dei tesori nascosti della Capitale"* — turismoroma, about the Jewish quarter.
* *"il ventunesimo sito statale italiano più visitato"* — it.wikipedia, Museo Nazionale Romano.
* *"probabilmente servì da modello per la costruzione del Colosseo"* and *"il primo teatro di Roma
  dedicato alla poesia e alla musica"* — **turismoroma's rione page, about the Teatro di Marcello.**
  The second is a priority claim. The first is not a superlative but it is a speculative causal
  claim carrying "probabilmente", and **it is also a reference to the Colosseum, which is Celio's.**
  Cut both.

Proximity, wayfinding and durations:

* *"posta non lontano dal Campidoglio"* (it.wikipedia, piazza di Campitelli); *"nei pressi della
  scalinata dell'Aracoeli e del Teatro di Marcello"* (turismoroma, Sala Santa Rita); *"vicino alla
  Sinagoga"* (it.wikipedia, San Gregorio); *"Situata tra piazza Venezia e largo di Torre Argentina"*
  (turismoroma, Crypta Balbi); *"nel cuore del ghetto ebraico"* (turismoroma, Giggetto);
  *"il vicino Teatro di Marcello"* (turismoroma, Portico d'Ottavia).
* **"Piazza Venezia — 4 minutes from Hosianum Palace Hotel"** and **"Capitoline Hill — 6 minutes"**
  — the hotel's own site. **Trip durations. Dead.**
* **Physically adjoining is still allowed and is the right tool here:** Sant'Angelo in Pescheria is
  built into the propylaeum of the Portico d'Ottavia and three of its columns are in the church's
  portal; the Torre dei Grassi is set against the Portico; Palazzo Savelli Orsini stands on the
  Teatro di Marcello; the three Republican temples are inside the walls of San Nicola in Carcere;
  the Museo Ebraico is inside the Tempio Maggiore complex. **All of those are structural facts, not
  proximity, and all publish.**

Research method that must never appear in reader-facing text: every timeout, 404, 403 and 429 in
this file; "Nominatim"; "point-in-polygon"; "vertices"; "the Sovrintendenza's page says Rione XI";
"re-fetched"; "could not be reached". **§2.4 exists so that none of it needs to travel.**

---

## 12. PHOTO LEADS — quarantined, wave 3 ruling, no action

Not to be acted on. Recorded so the image wave does not start from zero.

* **Italy has no freedom of panorama.** Everything in this rione that is out of copyright by age is
  fine as a subject; **the Fontana delle Tartarughe's visible turtles are modern copies**, which is
  a question for the photo wave and not for me.
* OSM carries `wikimedia_commons` category pointers for: Santa Maria in Campitelli, Santa Maria del
  Pianto, the Fontana di piazza delle Cinque Scole, Marforio, the Fontana di piazza dell'Aracoeli,
  Palazzo Guglielmi Chiablese, the Teatro di Balbo and the Portico di Ottavia.
* The Sovrintendenza runs a **"Galleria"** block on every place page and a formal
  **"Autorizzazione all'uso di immagini del patrimonio culturale di Roma Capitale"** procedure,
  linked in its own top menu at `/servizi_al_cittadino/`. **That is a permissions regime, not a
  licence, and the photo wave must read it before assuming anything.**
* The Museo Ebraico publishes a **virtual tour**. Its terms were not examined.
* **No image file is named or linked anywhere in this document, and `"photos": []` everywhere.**

---

## 13. RECOMMENDATION IN ONE PARAGRAPH

Ship Sant'Angelo as a **guide**. Its spine is four things a visitor can stand in front of today —
the Portico d'Ottavia, the Teatro di Marcello, the Fontana delle Tartarughe and the Tempio Maggiore
— plus two open museums with published hours and prices and one closed one, all inside 480 metres.
Its second layer is ten churches, the Isola Mattei with its four palaces, and a quarter whose
history is documented in official Italian sources at a level of detail no other rione in the
programme has matched. Its third layer is food, and the honest thing to say about the food is that
the famous names split across the Regola line and the page must not pretend otherwise. Cut the tail
of opticians and convenience stores, resolve the nineteen straddlers upstairs, and this is a strong
guide from the smallest unit in the city.
