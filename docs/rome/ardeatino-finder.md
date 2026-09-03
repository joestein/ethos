# Ardeatino (Q. XX, Roma Capitale toponymic code 220) — FINDER

Research file. Nothing here is a shipping decision; a verifier adjudicates and one arbitrator rules
ownership across the nine zones in this wave. Everything below carries the URL I actually fetched.

Research window: 2026-09-03. All fetches by `python3` + `urllib` from this machine.

---

## 0. Duplication check — RUN AND CLEAR

`python3 .superpowers/taken_slugs.py` reports **786 places across 21 shipped rione files**. Searches
run against it:

| query | hits | collision risk for Ardeatino |
|---|---|---|
| `catacomb` | 0 | none. No catacomb is owned by any shipped rione. |
| `ardeatin` | 0 | none |
| `callisto` | 2 — `san-callisto-church-trastevere-rome`, `palazzo-di-san-callisto-trastevere-rome` | **none.** Both are Trastevere buildings named for the same pope. Different places entirely from the Appia catacomb. |
| `sebastiano` | 1 — `san-sebastiano-al-palatino` (Campitelli) | **none.** The it.wikipedia article on the Appia basilica states outright that the *fuori le mura* epithet exists "per distinguerla dalla chiesa di San Sebastiano al Palatino". Two different churches. |
| `appia` | 2 — `chiesa-di-san-cesareo-de-appia-san-saba-rome`, `centro-di-documentazione-dell-appia-sant-angelo-rome` | **none.** San Cesareo is at Via di Porta San Sebastiano 2 (inside the walls, San Saba). The Sant'Angelo "Centro di Documentazione dell'Appia" is at **Via del Teatro di Marcello 5** — checked directly in `priv/seed_data/rome/sant-angelo.json`. It is NOT the Ex Cartiera Latina and NOT the Punto Informativo on the Appia. No clash. |
| `fontane` | 4 — all Quattro Fontane / piazza fountains | none |
| `caracalla` | 2 (San Saba) | none |
| `mura` | 7 — Aurelian Wall segments owned by **Celio, Testaccio, Trastevere** | see §5, Porta Ardeatina |
| `porta` | 16 — incl. `porta-san-paolo-san-saba-rome` | Porta Ardeatina is NOT owned. See §5. |

**Conclusion: the Ardeatino field is clear.** No candidate below duplicates a shipped place.

---

## 1. How I established the boundary, and what it decided

Quartieri are large and OSM coverage of them is thinner than for rioni, so I used three independent
instruments and recorded where they disagree.

**(a) Roma Capitale / it.wikipedia's own boundary prose.** The `Ardeatino` article
(https://it.wikipedia.org/w/index.php?title=Ardeatino&action=raw) gives the perimeter verbatim:

> «a est con i quartieri Q. IX Appio-Latino [ref: *Separato da via Appia Antica, nel tratto dalle
> Mura Aureliane (Porta San Sebastiano) a via Cecilia Metella*] e Q. XXVI Appio-Pignatelli … a ovest
> con i quartieri Q. XXXII Europa e Q. X Ostiense [ref: *Separato da via Laurentina, nel tratto da
> viale dell'Atletica a via Cristoforo Colombo, e da via Cristoforo Colombo, nel tratto da via
> Laurentina a via di Porta Ardeatina*] … a nord con i rioni R. XXI San Saba e R. XIX Celio»

Two consequences the brief did not anticipate:
1. **Via Appia Antica is itself the line** from Porta San Sebastiano to via Cecilia Metella. Ardeatino
   holds the WEST side of the road on that stretch; Appio-Latino holds the EAST side. Past via Cecilia
   Metella the line moves and Ardeatino picks up both sides (which is why the IV-mile tombs are ours).
2. Everything east of via Cristoforo Colombo / via Laurentina is Ardeatino, which is what puts the
   Abbazia delle Tre Fontane inside this quartiere and not in EUR.

**(b) OSM point-in-polygon.** I pulled the boundary relation and did the test locally rather than
hammering Nominatim (which returned HTTP 429 on every request for the whole session):

```
rel 5473394  name=Ardeatino  official_name="Quartiere XX Ardeatino"  ref="Q. XX"
             boundary=place  place=suburb  wikidata=Q2571007  wikipedia=it:Ardeatino
```
Fetched via Overpass (`overpass.kumi.systems` mirror; `overpass-api.de` was refusing connections)
together with the polygons of Q. IX Appio-Latino, Q. X Ostiense, Q. XXVI Appio-Pignatelli,
Q. XXXI Giuliano-Dalmata, Q. XXXII Europa, R. XIX Celio, R. XXI San Saba, Z. XXI Torricola,
Z. XXII Cecchignola. Rings stitched from the outer ways, ray-cast point-in-polygon.

**(c) The institution's own statement.** For each major site I read what the site or its governing
body says about where it is. Verbatim examples:
- Catacombe di San Sebastiano: «sono un cimitero ipogeo di Roma, posto lungo la via Appia Antica,
  **nel quartiere Ardeatino**» (it.wikipedia).
- Basilica di San Sebastiano fuori le mura: «è un luogo di culto cattolico di Roma, **nel quartiere
  Ardeatino**, sulla via Appia Antica al numero 136».
- Catacomba di Domitilla: «posta sulla via Ardeatina, nei pressi delle catacombe di San Callisto,
  **nel moderno quartiere Ardeatino**».
- Catacomba di Balbina and Catacomba dei SS. Marco e Marcelliano: both «**nel moderno quartiere
  Ardeatino**», both categorised `Roma Q. XX Ardeatino`.
- Forte Appia Antica and Forte Ardeatina: «Si trova nel quartiere Q. XX Ardeatino, **nel territorio
  del Municipio Roma VIII**».

Point-in-polygon results (lat, lon → unit):

| point | verdict |
|---|---|
| San Callisto entrance 41.85834 / 12.51045 | **Q. XX Ardeatino** |
| San Sebastiano basilica + catacomb 41.85566 / 12.51616 | **Q. XX Ardeatino** |
| Domitilla entrance 41.85805 / 12.50158 | **Q. XX Ardeatino** |
| Fosse Ardeatine, Via Ardeatina 174 | **Q. XX Ardeatino** |
| Abbazia delle Tre Fontane 41.83444 / 12.48333 | **Q. XX Ardeatino** |
| SS. Vincenzo e Anastasio / S. M. Scala Coeli / S. Paolo alle Tre Fontane | **all Q. XX Ardeatino** |
| Ex Cartiera Latina, V. Appia Antica 42 | **Q. XX Ardeatino** |
| Capo di Bove, V. Appia Antica 222 | **Q. XX Ardeatino** |
| Sepolcro di Priscilla, V. Appia Antica 64 (OSM addr node) | **Q. XX Ardeatino** |
| Tombs of the IV mile (Rabiri 41.835865/12.538787, fregio dorico, Licini, Hilarus Fuscus 41.83802/12.53634, Sant'Urbano 41.83920/12.53497) | **all Q. XX Ardeatino** |
| Forte Appia Antica 41.84148 / 12.52955; Forte Ardeatina 41.83871 / 12.50420 | **both Q. XX Ardeatino** |
| Modern parish churches (S. Francesca Romana, S. Vigilio, SS. Martiri dell'Uganda, S. Josemaría Escrivá, SS. Annunziata a via Ardeatina) | **all Q. XX Ardeatino** |
| Casali (de Merode, Torlonia, Vignacce, Vigna Viola, Caribelli), Tenuta di Tor Marancia, Villa di Tor Carbone | **all Q. XX Ardeatino** |
| — | — |
| **Chiesa del Domine quo vadis** 41.866389 / 12.503611 | **Q. IX Appio-Latino** — see §5.1 |
| **Colonna di Pio IX** 41.856117 / 12.516303 | **Q. IX Appio-Latino** — see §5.2 |
| **Chiesa di San Nicola a Capo di Bove** 41.852222 / 12.520833 | **Q. IX Appio-Latino** — see §5.3 |
| Mausoleo di Cecilia Metella; Castrum Caetani; Circo di Massenzio; Villa di Massenzio | **Q. IX Appio-Latino** — not ours |
| Catacombe di Pretestato (V. Appia Pignatelli 11) | **Q. IX Appio-Latino** — not ours |
| Villa dei Quintili | **Z. XXI Torricola** — not ours |

**No Municipio for the quartiere.** The it.wikipedia infobox says «Municipio Roma I e Municipio Roma
VIII», i.e. the quartiere straddles two. Per the brief, do NOT put a Municipio on the Ardeatino zone
page. Two *individual* places do carry a sourced Municipio — Forte Appia Antica and Forte Ardeatina,
both "nel territorio del Municipio Roma VIII" in their own articles — and the Tor Marancia mural
museum was «patrocinato da Municipio Roma VIII». Those are per-place facts and are safe.

---

## 2. THE LEGAL STATUS OF THE CATACOMBS — read before writing a word

This is Ardeatino's equivalent of Ostiense's San Paolo problem, and it resolves **differently**.

**They are NOT extraterritorial.** I fetched the Holy See's own list —
https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html
(Sala Stampa, "Zone extraterritoriali vaticane", update 03.04.2001). It enumerates thirteen Roman
holdings: the Lateran complex, S. Maria Maggiore, S. Paolo fuori le Mura, Cancelleria, Propaganda
Fide, Palazzo di S. Callisto in Trastevere, Sant'Offizio, Convertendi, Palazzo Maffei/Vicariato,
Congregazioni ai Propilei, Palazzo Pio, Seminario Romano Minore, and the Gianicolo block.
**No catacomb and no Appia basilica appears.** Nothing in Ardeatino may be called extraterritorial,
"in the Vatican", or "Vatican territory".

**What is true instead** — sourced from the Pontificia Commissione di Archeologia Sacra's own page,
https://www.catacombeditalia.va/content/archeologiasacra/it/la-commissione.html:

> «Per i Patti Lateranensi (art. 33 del Concordato) ebbe estesa la sua autorità e sfera d'azione e di
> studio a tutte le catacombe esistenti sul territorio italiano. Il nuovo Concordato del 1984
> (art. 12) ha confermato questo stato di cose per le catacombe cristiane.»
>
> «La Santa Sede conserva la disponibilità delle catacombe cristiane di Roma e delle altre parti del
> territorio italiano con l'onere conseguente della custodia, della manutenzione, della
> conservazione.»

And from the San Callisto operator's own site (https://www.catacombesancallisto.it/it/index.php):

> «Il complesso callistiano è proprietà dell'A.P.S.A. — Amministrazione del Patrimonio della Sede
> Apostolica. Il governo, la custodia e la conservazione sono affidate alla P.C.A.S. — Pontificia
> Commissione di Archeologia Sacra, organismo della Santa Sede. Dal 1930 l'accoglienza dei pellegrini
> e la visita guidata alle catacombe aperte al pubblico sono affidate ai Salesiani di Don Bosco.»

**Safe formulation for the corpus:** the catacombs stand on Italian soil in the quartiere; the Holy
See retains their *disponibilità* with the burden of custody, maintenance and conservation under
art. 33 of the 1929 Concordat, confirmed by art. 12 of the 1984 Accordo; the Pontificia Commissione
di Archeologia Sacra governs them; the San Callisto complex is APSA property and the Salesians have
run visits there since 1930. That is a **third tier again** — neither Vatican City nor Lateran
art. 15 extraterritoriality — and the prose must not slide into either.

**PCAS is a per-site register that actually resolves.** Unlike Vincoli in Rete, `catacombeditalia.va`
is reachable and states, per catacomb, address / hours / weekly rest day / annual closure / bus
lines. It is the single best source in this zone.

---

## 3. THE BANNED-CLAIM TRAPS I HIT. Do not let these through.

Every one of these is in a source I fetched. Each is a corpus violation.

1. **UNESCO, Via Appia.** https://whc.unesco.org/en/list/1708/ — "Via Appia. Regina Viarum",
   a property of 19 component parts. The English blurb reads *"the oldest and most important of the
   great roads built by the Ancient Romans"*. That is a **double superlative** and is banned even
   attributed. The inscription itself is a fact of record and may be stated AS AN INSCRIPTION; per the
   ruling, **no zone may claim to lie inside the property.** Safe: "the Via Appia was inscribed on the
   UNESCO World Heritage List as *Via Appia. Regina Viarum*, a property of nineteen component parts";
   the road was "constructed and developed from 312 BCE to the 4th century CE" and runs more than
   800 km. Flagging for the verifier: I did not find a source naming which of the nineteen components
   covers the Ardeatino stretch, so do not assert one.
2. **Forte Appia Antica.** it.wikipedia: «Il forte è vincolato ai sensi del Codice dei Beni Culturali
   con D.M. 06/08/2008.» **BANNED.** Do not repeat, do not paraphrase, do not say "protected".
3. **Complesso di Capo di Bove.** parcoarcheologicoappiaantica.it: «dato l'interesse archeologico
   dell'area (come sancito anche da un vincolo specifico)». **BANNED.** The purchase-by-pre-emption
   fact is fine; the vincolo clause is not. The same site runs a feature literally called
   "Il vincolo del giorno" — stay out of it.
4. **Abbazia delle Tre Fontane.** it.wikipedia: «È monumento nazionale italiano». **BANNED.**
   Same article: «l'unica abbazia trappista di Roma» — **superlative, banned.** Say instead that it is
   a Trappist abbey (Cistercians of the Strict Observance), which its own site states.
5. **Catacombe di San Callisto.** The de Rossi epigraph the operator quotes — «Le catacombe per
   eccellenza, il primo Cimitero ufficiale della Comunità di Roma, il glorioso sepolcreto dei Papi
   del III secolo» — is a stack of superlatives with an attribution. **Banned.** The operator's own
   marketing line, "uno dei più grandi e importanti cimiteri sotterranei di Roma", is banned too.
   Publishable substitutes are all counts and dates: sixteen popes and dozens of martyrs buried
   there; the Cripta dei Papi carries the original Greek inscriptions of Pontian, Anterus, Fabian,
   Lucius I and Eutychian; the complex covers about 30 hectares between via Appia Antica, via
   Ardeatina and via delle Sette Chiese; the galleries run about twenty kilometres.
6. **Catacomba di Domitilla.** PCAS calls it «il più vasto cimitero sotterraneo cristiano di Roma»;
   domitilla.info's English page says "the best preserved and one of the most extensive". **Both
   banned.**
7. **Catacombe di San Sebastiano.** it.wikipedia: «uno dei pochissimi cimiteri cristiani rimasti
   sempre accessibili». Treat as a superlative-shaped priority claim and drop it. The sourced,
   publishable version is structural: of the four original levels the first is almost entirely
   destroyed; there are three levels of galleries.
8. **Ex Cartiera Latina.** parcoappiaantica.it: «uno dei più grandi stabilimenti di produzione di
   carta del Centro Sud», «tra i pochi impianti industriali sopravvissuti nella città di Roma»,
   «una struttura unica nel suo genere». **All three banned.** Dates and function survive.
9. **Tenuta di Tor Marancia.** parcoarcheologicoappiaantica.it: «in uno dei quartieri più popolosi di
   Roma». **Banned.** "200 ettari" is a measurement and publishes.
10. **Trading duration.** The Trappist shop, the Caffè Tre Fontane and the Appia trattorie: an
    operator's own founding year does not publish. Identity, address and hours do.

**Research-method language to keep out of reader-facing text:** Nominatim 429s, Overpass mirrors,
`?_escaped_fragment_=`, point-in-polygon, "the boundary test put it in", "the official site could not
be read". Where a fact is missing, the page says nothing is stated rather than saying I failed.

---

## 4. CANDIDATES

Fifty-eight. Kind is from the thirteen the schema allows (`historic-site`, `museum`, `park`, `shop`,
`cafe`, `restaurant`, `hotel`, `brewery`, `amusement-park`, `attraction`, …). "photos": [] everywhere.

### 4.1 The catacombs (Pontificia Commissione di Archeologia Sacra)

**1. Catacombe di San Callisto** — `historic-site`
- **Via Appia Antica, 110 — 00179 Roma RM.** Tel +39 06 5130151 / 06 51301580.
  Source: https://www.catacombesancallisto.it/it/index.php (footer) and
  https://www.catacombeditalia.va/content/archeologiasacra/it/visita-catacombe/per-regione/roma/catacomba-di-s-callisto.html
- What: part of the *complesso callistiano*, «un'area di circa 30 ettari compresa tra la via Appia
  Antica, la via Ardeatina e la via delle Sette Chiese». Sixteen popes and more than fifty martyrs;
  fifteen hectares of cemetery, galleries running to nearly twenty kilometres. Cripta dei Papi with
  the original Greek inscriptions of Pontian, Anterus, Fabian, Lucius I, Eutychian and the tomb of
  Sixtus II, plus the metric inscription of Damasus cut in the lettering devised by the calligrapher
  Furius Dionysius Filocalus. Adjoining crypt of St Cecilia — her relics removed by Paschal I in 821;
  frescoes of the early 9th century. Cubicoli dei Sacramenti, gallery of the late 2nd century.
  Above ground two apsed funerary buildings survive, the eastern and western *tricòre*.
  Source: https://it.wikipedia.org/wiki/Catacombe_di_San_Callisto (raw wikitext) + the PCAS page above.
- Excavated 1849–1854 by Giovan Battista De Rossi (infobox, it.wikipedia). Named for the deacon
  Callistus, put in charge of the cemetery by Pope Zephyrinus (199–217) and later pope himself
  (217–222).
- Hours, from the operator: **Mon, Tue, Thu, Fri, Sat, Sun 09:00–12:00 and 14:00–17:00; closed every
  Wednesday.** Last morning tour starts 12:00, last afternoon tour 17:00 (16:30 on Maundy Thursday);
  ticket desk shuts 16:50. Visits only in groups of at least two with a guide; tours start every
  30 minutes and last about 40 minutes. Also closed 1 January, Easter, 25 December, and an annual
  winter closure. Source: https://www.catacombesancallisto.it/it/orari.php
  ⚠ The annual-closure line on both the operator page and the PCAS page still reads "15 gennaio –
  12 febbraio **2025**". The year is stale in the source; do not publish it as a current date.
- Tickets: full €10, reduced €7 (7–16s, school groups, students of archaeology/architecture/art
  history/heritage under 25 with certification, clergy and religious with certification); free for
  under-7s, disabled visitors over 74% and any prescribed companion, PIAC students, Salesians and
  Daughters of Mary Help of Christians, one accompanying teacher per 15 paying visitors, two free
  entries for groups of 35+ buying full price, licensed tourist guides. Online sale delegated by PCAS
  to Opera Romana Pellegrinaggi. Source: https://www.catacombesancallisto.it/it/biglietti.php
- Getting there: ATAC 118, 218 (PCAS page).

**2. Catacombe di San Sebastiano** — `historic-site`
- **Via Appia Antica, 136 — 00179 Roma.** Source: https://catacombe.org/it/info?_escaped_fragment_=
  (the official site is JS-rendered and only serves its text at that URL) and the PCAS page
  https://www.catacombeditalia.va/content/archeologiasacra/it/visita-catacombe/per-regione/roma/catacomba-di-s-sebastiano.html
- What: the site that gave every other Roman cemetery its name. Antiquity knew it as *in catacumbas*,
  from Greek *katà kymbe*, "by the hollows" — there is still a marked dip in the ground along the
  Appia beside it, and the area was pozzolana quarries before it was a cemetery. From the 3rd century
  it was called *in memoria apostolorum*: the *Depositio martyrum* of the mid-4th century records
  Peter *in catacumbas* on 29 June, and the *Martirologio Geronimiano* adds *utrumque in catacumbas,
  Tusco et Basso consulibus* — i.e. in 258. Three levels of galleries; of four original levels the
  first is almost entirely destroyed. The *piazzola*, a former open-cast quarry, holds three mausolea
  cut into its walls, one of them the *mausoleo degli Innocentiores*. Above the infilled piazzola:
  the *triclia*, a roofed colonnaded hall for funerary banquets whose walls carry **more than 600
  graffiti** invoking Peter and Paul, and a marble-lined edicola. Three martyrs are documented here —
  Sebastian, Quirinus (a Pannonian bishop) and Eutychius. Source: it.wikipedia raw wikitext.
- Hours from the operator: **Tuesday to Sunday 09:15–17:15, last entry 16:45, closed Mondays.**
  Fixed closures 25 December, 1 January, Easter Day; an annual closure period is stated on the page.
  Visits are guided-only by an in-house guide, in Italian, English, French, Spanish and German;
  booking always advised. Tickets full €10, reduced €7 (same categories as San Callisto); free
  categories likewise. Mass may be celebrated in the catacomb for groups up to 20, mornings 09:00–10:00
  only; larger groups can request the basilica above, 09:00–16:00.
  Source: https://catacombe.org/it/info?_escaped_fragment_=
- Getting there, from the operator: ATAC 660 from Metro A Arco di Travertino, stop *Catacombe di San
  Sebastiano*; ATAC 118 from Metro B Colosseo or Circo Massimo, same stop; ATAC 218 from Metro A San
  Giovanni, alight at *Fosse Ardeatine* then 300 m along Vicolo delle Sette Chiese.

**3. Catacombe di Domitilla** — `historic-site`
- **Via delle Sette Chiese, 282 — 00147 Roma RM.** Tel +39 06 5110342 / 06 5133956.
  Source: https://www.catacombeditalia.va/content/archeologiasacra/it/visita-catacombe/per-regione/roma/catacomba-di-domitilla.html
  and the operator https://www.domitilla.info/
- What: on the ancient via Ardeatina, on the *praedium Domitillae*, the estate of Flavia Domitilla,
  a relative of the consul of 95 Flavius Clemens. Principal martyrs Nereus and Achilleus, probably
  victims of the persecution of 304, buried in the basilica — a large apsed hall of the time of Pope
  Siricius (384–399), preceded by a narthex and divided into three aisles by columns with reused
  capitals. Also the *ipogeo dei Flavi*, begun as a private pagan hypogeum at the end of the 2nd
  century and taking Christian burials through the 3rd; the cubicolo di Veneranda; the arcosolium of
  the Apostoli Piccoli; the cubicolo of the fossor Diogenes. Christian and pagan burials coexist here.
  Sources: PCAS page above; https://it.wikipedia.org/wiki/Catacombe_di_Domitilla
- Hours from PCAS: **Monday and Wednesday to Sunday 09:00–12:00 and 14:00–17:00; weekly rest day
  Tuesday.** ATAC 30, 130, 160, 670, 174, 716.
  ⚠ PCAS gives an annual closure "25 Dicembre – 21 Gennaio **2025**" — stale year again.
  ⚠⚠ **domitilla.info is badly out of date**: its landing page is still announcing the post-Covid
  reopening of 15 July 2020. Its address block (Via delle Sette Chiese 282, 00147 Roma,
  info@domitilla.info) agrees with PCAS and is safe; **do not take hours from it.** PCAS also cites
  the site as `www.catacombedomitilla.it`, and OSM tags the same URL; `catacombedidomitilla.it` does
  not resolve. Verifier should pick one canonical URL.

**4. Museo di Domitilla e Regione dei Fornai** — `museum` — Via delle Sette Chiese, 282.
**5. Museo della Torretta e Cripte di Lucina** — `museum` — Via Appia Antica, 110.
**6. Catacomba di Vigna Chiaraviglio** — `historic-site` — Via Appia Antica, 126.
- All three are on PCAS's **"aperte su richiesta"** list, i.e. normally closed and openable only by
  written request to protocollo@arcsacra.va, groups of no more than 15, **€250,00**, with a *fossore*
  for custody and an archaeologist to explain the monument.
  Source: https://www.catacombeditalia.va/content/archeologiasacra/it/visita-catacombe/aperte-su-richiesta.html
- These three are the only Ardeatino entries on that list. (Catacomba di Commodilla, Via delle Sette
  Chiese 42, 00145, and Catacomba di S. Tecla, via Silvio D'Amico 42, 00145, are on the same list but
  sit west of the Ardeatino line — hand to Ostiense; I did not point-test them and the verifier
  should.)
- Status field: "open" is wrong for these. The honest wording is that they are opened by request.

**7. Catacomba dei Santi Marco e Marcelliano** — `historic-site`
- Between via Appia Antica and via Ardeatina, «nel moderno quartiere Ardeatino», part of the
  callistian complex. Anciently *cimitero di Basileo ad sanctum Marcum et Marcellianum*, after the
  landowner and then the martyrs. A second above-ground basilica held the tomb Damasus chose for
  himself, his mother Lorenza and his sister Irene; nothing of the above-ground structures survives.
  Explored by Antonio Bosio in 1596 (published posthumously in *Roma sotterranea*, 1632), re-explored
  by G. B. de Rossi in 1868, identified by Joseph Wilpert in systematic digs of 1902–1905 beneath the
  courtyard of the Istituto San Tarcisio on via Appia Antica — where he found apsed structures and the
  *cripta delle quattro colonne*. Further digging by Antonio Ferrua in 1947; topography studied by
  Mons. Patrick Saint-Roch. Source: https://it.wikipedia.org/wiki/Catacomba_dei_Santi_Marco_e_Marcelliano
- Not on either PCAS visit list. No access source. Prose should say no visiting arrangements are
  stated.

**8. Catacomba di Balbina** — `historic-site`
- Between via Appia antica and via Ardeatina, «nel moderno quartiere Ardeatino»; the third funerary
  area of the callistian complex. Named in the *Depositio episcoporum* (burial of Pope Mark,
  January–October 336, above ground *in Balbinae*), the *Index coemeteriorum vetus* (*cymiterium
  Balbinae ad sanctum Marcum*) and an inscription of one Sabinus (*in cymiteriu Balbinae in cripta
  noba*). **The identification is still uncertain** — say so, it is the interesting part.
  On **3 September 1991** the Salesian Tarcisio Gazzola spotted, in a field of lucerne, marks tracing
  the plan of a circiform basilica **66 m long and 27 m wide**, identified with the Marcian basilica
  of the sources. Source: https://it.wikipedia.org/wiki/Catacomba_di_Balbina
- The remains of that circiform basilica are separately mapped on via Ardeatina (see §4.5 #35).

### 4.2 San Sebastiano above ground

**9. Basilica di San Sebastiano fuori le mura** — `historic-site`
- **Via Appia Antica, 136 — 00179 Roma.** Parish office tel +39 06 45430260.
  Source: https://www.sansebastianofuorilemura.org/
- Built in the 4th century with the title of Saints Peter and Paul, on the spot where their relics
  were moved in 258; Constantine's circiform basilica, three aisles with a large quadrangular atrium,
  the same model as Sant'Agnese on the Nomentana and San Lorenzo on the Tiburtina. The 17th-century
  rebuilding occupied the old central nave. Ordered by Cardinal **Scipione Borghese** in 1608, to a
  design by **Flaminio Ponzio**, continued by **Giovanni Vasanzio**, with **Guido Reni** as artistic
  director; the **façade is dated 1612** and is Ponzio's. Carved wooden ceiling by **Annibale Durante**
  to a design traditionally given to Vasanzio, 1612. In 1933 the aisles were rebuilt using the
  ambulatory of the 4th-century church. Relics of Sebastian moved to St Peter's in 826 for fear of a
  Saracen raid — which came, destroying the church; rebuilt by Pope Nicholas I (858–867), the martyr's
  altar reconsecrated by Honorius III at the Cistercians' request. Parish erected 18 April 1714 by
  bull of Clement XI; cardinalatial title *San Sebastiano alle Catacombe* created by John XXIII in 1960.
  It is one of the seven churches of the pilgrimage. Today the first Franciscan parish in Rome.
  Sources: https://it.wikipedia.org/wiki/Basilica_di_San_Sebastiano_fuori_le_mura ;
  https://catacombe.org/it/basilica-san-sebastiano?_escaped_fragment_= ;
  https://www.sansebastianofuorilemura.org/
- Inside, per the operator: on the left wall at the entrance, the near-intact carmen dedicated by Pope
  Damasus to the martyr Eutychius, in Filocalian lettering. The altar with the urn holding Sebastian's
  remains and the recumbent statue pierced by arrows, carved by **Giuseppe Giorgetti**. The **Cappella
  Albani**, raised by Clement XI for his family in **1706**, faced in polychrome marbles, decorated for
  the martyr-pope Fabian (236–250). The **Cappella delle Reliquie**, commissioned by Maximilian, Duke
  of Bavaria, in **1625**, holding an arrow of the martyrdom and the column he was bound to — and at
  its centre **the stone of the "Quo Vadis?" episode, with the footprints impressed in it**.
- Opening hours from the parish: **October–March 08:15–18:00; April–September 08:15–19:00.** Parish
  office Tue and Thu 15:30–17:30, Wed and Sat 10:00–12:00; July reduced; August and feast days closed.
  Masses: Sat 18:00 (Oct–Mar) / 18:30 (Apr–Sep); Sun 08:30, 10:00 (not July or August), 12:15 (not
  August), 18:00 / 18:30.

**10. Museo dei Sarcofagi** — `museum` — inside the basilica, the room on the right of the modern
church that also gives access to the catacomb; "una ricca raccolta di sarcofagi locali, nota come
*Museo dei Sarcofagi*". The room on the left holds the Cappella del Crocifisso and the epigraphic
museum, **which the operator states is under restoration and closed to the public**. That is a sourced
"closed" for the epigraphic museum specifically.
Source: https://catacombe.org/it/basilica-san-sebastiano?_escaped_fragment_=

**11. Salvator Mundi of Gian Lorenzo Bernini** — probably a fact inside record #9 rather than its own
place; flagging because it is the strongest single art draw in the quartiere.
- The operator's own long article: the bust of the blessing Christ was carved by the octogenarian
  Bernini in **1679**; on his death in 1680 it went to Queen Christina of Sweden, who left it to
  Innocent XI Odescalchi, whose family held it until the end of the 18th century, after which it was
  lost. In **2001**, during research for the Clement XI exhibition (Urbino–Rome), a bust of the
  "Salvatore" was reported in the convent adjoining the basilica, until then unknown to the literature.
  Petrucci argues it matches the early descriptions in scale ("mezza figura maggiore del naturale") and
  in the Sicilian jasper of the pedestal, and that before 1960 it stood in the sacristy of the Cappella
  Albani. Source: https://catacombe.org/it/salvator-mundi-bernini?_escaped_fragment_= (an extract of
  Francesco Petrucci, *Bollettino d'Arte* fasc. 124).
- ⚠ **Attribution is a scholarly argument, not a settled fact, and the versions at the Chrysler Museum
  (Norfolk) and Sées cathedral have both been proposed.** Write it as an identification argued in 2001
  and published in the *Bollettino d'Arte*, not as "Bernini's last work" (which would also trip the
  superlative rule) and not as "Bernini's only …".

**12. Chiesa di San Tarcisio** — `historic-site` — Via Appia Antica, 102 (OSM `amenity=place_of_worship`,
node in Ardeatino). Salesian; the Istituto San Tarcisio courtyard is where Wilpert dug the SS. Marco
e Marcelliano basilicas. Thin: I found no article and no site. Low priority.

**13. Istituto Salesiano San Tarcisio** — `hotel` (pilgrim hostel) — OSM `tourism=hostel`, in
Ardeatino, no street number captured. Needs its own source before it publishes.

### 4.3 Fosse Ardeatine

**14. Mausoleo delle Fosse Ardeatine** — `historic-site`
- **Via Ardeatina, 174 — 00179 Roma.** Sources:
  https://www.mausoleofosseardeatine.it/ ;
  https://www.difesa.it/il-ministro/ufficio-per-la-tutela-della-cultura-e-della-memoria-della-difesa/lazio/mausoleo-delle-fosse-ardeatine/49663.html ;
  https://it.wikipedia.org/wiki/Mausoleo_delle_Fosse_Ardeatine
- The pozzolana quarries on via Ardeatina where the German occupation forces shot 335 people on
  24 March 1944 in reprisal for the partisan attack in via Rasella.
- Competition history, all sourced: the Commissione per le Cave Ardeatine was set up 10 June 1944
  under the American colonel Charles Poletti; the city council approved the competition notice on
  15 January 1945 with a 50-day deadline; **eleven** projects were submitted by 10 April 1945 and shown
  at the Casa dei Cavalieri di Rodi; entries were anonymous, identified by motto. On 2 September 1946
  the second-stage competition ended with **two winners ex aequo**: *Risorgere* (Nello Aprile, Cino
  Calcaprina, Aldo Cardelli, Mario Fiorentino and the sculptor Francesco Coccia) and *U.G.A.*
  (Giuseppe Perugini with Uga de Plaisant), later joined by the sculptor **Mirko Basaldella**. The
  Ministry of Public Works allocated 70 million lire, then a further 130 million. Building began
  **22 November 1947** (Impresa Eugenio Morandi) and the complex was **inaugurated 24 March 1949**, the
  fifth anniversary.
  ⚠ The it.wikipedia infobox names the architects "Giuseppe Perugini, Nello Aprile e Mario **Fiorentini**"
  while the article body and difesa.it both say Mario **Fiorentino**. Fiorentino is the correct form —
  two independent sources against one infobox — but flag it.
- Description, all sourced: entry on via Ardeatina through a **bronze gate about 6 metres long** by
  Basaldella, finished **1951**, with two smaller versions inside. Just inside, Coccia's travertine
  group ***Le tre età*** — a young man, an adult and an old man — on a base of stone-tuff from Monte
  Compatri. The entrance forecourt is dedicated to the dead of the Marzabotto massacre and carries a
  Christian cross and a Star of David. Inside the galleries, two chasms opened by the explosives the
  SS set to hide the bodies. The sacrario is a hollow reinforced-concrete monolith on a rectangular
  plan, **26.65 × 48.5 × 3.55 m**, sunk 2 m into the ground, leaving a thin slit of light between base
  and cover; about **1,300 m²**, carried on six supports along the long edges. Inside, **335 granite
  sacelli** plus one more dedicated to all the "Martiri d'Italia", in seven double rows in the order
  the bodies were exhumed; **328** are identified, **seven** unknown. **70 of the 335 were Jews.**
  A votive lamp given by Paul VI stands at the end of the gallery.
- Management: the **Ufficio per la tutela della cultura e della memoria della difesa** of the Ministry
  of Defence, working with **ANFIM** (Associazione nazionale tra le famiglie italiane dei martiri
  caduti per la libertà della Patria), which also runs the guided visits.
- **Hours: Mon–Fri 08:15–15:15; Sat–Sun 08:15–16:45.** Guided visits and bookings via ANFIM,
  info@anfim.org, tel +39 06 6795629. Source: mausoleofosseardeatine.it footer.
- 📸 **PHOTO REJECT, and a hard one.** Basaldella died 1969 (→2039), Coccia died 1982 (→2052),
  Fiorentino died 1982, Perugini died 1995, Aprile died 2010. Italy has no freedom of panorama. The
  gate, the sculpture group and the sacrario itself are all in architectural/artistic copyright.
  Note this for the photo wave; do not source an image.

**15. Museo dei cimeli** — `museum` — inside the mausoleum complex, behind the monumental slab;
documents, relics and photographs reconstructing the historical context. Sources: difesa.it page;
https://www.mausoleofosseardeatine.it/mausoleo/museo_cimeli/ (cited by it.wikipedia).

**16. Monumento ai caduti della Montagnola** — `historic-site` — piazzale dei Caduti della Montagnola.
Raised after the war in the square of the Montagnola, surrounded by a public park, for the dead of
**10 September 1943**, when the quartiere — like other areas south of the city — saw fighting between
the resisting population and the nazifascists after the armistice. Source: it.wikipedia `Ardeatino`,
citing a Roma Capitale page (comune.roma.it, not reachable from here — cite the wiki, or drop the claim).

### 4.4 Tre Fontane

**17. Abbazia delle Tre Fontane** — `historic-site`
- **Via di Acque Salvie 1**, off via Laurentina. Portineria +39 06 5401655.
  Sources: https://www.abbaziatrefontane.it/ ; https://it.wikipedia.org/wiki/Abbazia_delle_Tre_Fontane
- Trappist (Cistercians of the Strict Observance). The name comes from the tradition that St Paul was
  beheaded here and that his head bounced three times, striking a spring from the ground at each
  bounce. The valley, crossed by the ancient via Laurentina, has been called *Aquae Salviae* since at
  least the 6th century.
- Dated sequence, all sourced from it.wikipedia: a Greek-Armenian monastery attested at the synod of
  Martin I in **649** ("venerabile abate Giorgio, del monastero di Cilicia che sorge alle Acque Salvie
  della nostra città"); the emperor Heraclius sent the head of the Persian martyr Anastasius. Monastery
  and church burned at the end of the 8th century and were restored. Gregory VII gave it to the
  **Cluniacs around 1080**; Innocent II took it from them in **1140** and gave it to the **Cistercians** —
  the abbey church and the monastery as they now stand date from that period, and a document of
  **1161** names all three churches for the first time. The first Cistercian abbot became Pope
  Eugene III. The monastery was completed in **1306**; in **1370** it acquired the relics of St Vincent
  of Saragossa, who became co-titular. Turned into a commenda by Martin V in **1408**. **Suppressed by
  the French in 1808**; sacked, its books and archives moved to the Vatican and Casanatense libraries,
  the site left malarial and ruined. **Pius IX** found funds for restoration for the 1867 jubilee, and
  a papal bull of **1868** re-established a resident community of at least fourteen and handed the
  abbey to Trappist monks; after the liquidation of ecclesiastical property they took 450 hectares of
  the Acque Salvie in perpetual emphyteusis on condition of planting **125,000 eucalypts** to drain it.
  On **25 March 1981**, by the bull *Abbatia SS. Vincentii et Anastasii*, John Paul II suppressed the
  territorial abbacy and the abbey passed to the diocese of Rome (bull text at
  http://www.vatican.va/archive/aas/documents/AAS-73-1981-ocr.pdf, AAS 73 (1981) pp. 474–476).
- **Hours, from the abbey's own site: the complex is open every day 06:30–20:45.** Portineria Mon–Sat
  08:30–12:30 and 15:00–18:00; Sunday 08:30–09:30, 11:00–12:30 and 15:30–18:00.
- The entrance arch is called the **Arco di Carlo Magno** (it.wikipedia image caption). The abbey has
  the character of a fortified monastery.
- ⚠ Do not write "monumento nazionale", do not write "the only Trappist abbey in Rome".

**18. Chiesa dei Santi Vincenzo e Anastasio alle Tre Fontane** — `historic-site` — the abbey church.
**Open every day 06:30–20:45** (abbey site). 7th-century foundation in origin; the fabric belongs to
the Cistercian rebuilding after 1140. Medieval fresco cycle — the abbey's own site hosts a video about
it ("Il ciclo di affreschi medievali presso l'Abbazia delle Tre Fontane a Roma").
Article fetched: https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Vincenzo_e_Anastasio_alle_Tre_Fontane

**19. Chiesa di Santa Maria Scala Coeli** — `historic-site` — **open every day 09:00–12:00 and
15:00–17:30** (abbey site). Its foundation goes back to the Greek-Armenian monastery, dedicated to the
Virgin; the present building is of the 16th century (it.wikipedia `Ardeatino`, "Chiesa del XVI secolo").
Article fetched: https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Scala_Coeli — verifier should pull
the architect and date from it rather than from me; I read only the head.

**20. Chiesa di San Paolo alle Tre Fontane** (chiesa del Martirio di San Paolo) — `historic-site` —
**open every day 07:30–20:00** (abbey site, which also announces «La chiesa del Martirio di San Paolo
è riaperta»). 16th century per it.wikipedia `Ardeatino`.
Article fetched: https://it.wikipedia.org/wiki/Chiesa_di_San_Paolo_alle_Tre_Fontane

**21. Negozio monastico dell'Abbazia** — `shop` — **Mon–Sat 08:30–19:30 continuous; Sunday
09:00–13:30** (abbey site). Sells the abbey's own produce.

**22. Caffè Tre Fontane** — `cafe` — OSM node `amenity=cafe`, **Via di Acque Salvie 1**, inside the
abbey grounds; the abbey's own menu carries "☕ Caffé Tre Fontane". Hours not stated anywhere I could
reach — say so rather than guessing.

**23. Birra Tre Fontane (Trappist brewery)** — `brewery` — the abbey brews and its site has a
dedicated "🍺 La birra trappista" section and a news item, "Rinnovo ATP per la Birra Tre Fontane"
(29 October, hosting Dom Isaac, abbot, for the renewal). ⚠ **Two cautions.** (a) I could not establish
that there is any public taproom or brewery visit — the beer reaches visitors through the monastic
shop. If nothing states public access to the brewery itself, this should either fold into the shop
record or say plainly that no visiting arrangement is stated. (b) "Authentic Trappist Product" is a
certification by the International Trappist Association, **not** a heritage designation — it is
probably outside the designation ban, but it is close enough to the line that the verifier should
rule on it rather than me.

**24. Frantoio / uliveto / apiario / azienda agricola** — the abbey site lists an oil mill, olive
grove, apiary and farm ("🚜 L'azienda agricola", "🛢️ Il frantoio"). No hours, no separate address.
Probably one sentence inside the abbey record, not four places.

**25. Libreria Paoline (Roma Tre Fontane)** — `shop` — OSM `shop=books`, website
https://www.paoline.it/librerie/lazio/roma-tre-fontane- . Unverified beyond OSM.

### 4.5 The Appia through Ardeatino: road, park, tombs

**26. Via Appia Antica, the Ardeatino stretch** — `historic-site`
- The quartiere holds the **II, III and IV miles** of the ancient road: it.wikipedia's `Ardeatino`
  article organises its tomb list exactly that way (`Sull'antica via Appia, II miglio`, `III miglio`,
  `IV miglio`).
- UNESCO: inscribed as *Via Appia. Regina Viarum*, a property of **19 component parts**; the road was
  "constructed and developed from 312 BCE to the 4th century CE" and runs "more than 800 kilometres".
  Source: https://whc.unesco.org/en/list/1708/ . See §3.1 for what may not be said.
- The state body is the **Parco archeologico dell'Appia antica** (Ministero della cultura),
  https://www.parcoarcheologicoappiaantica.it/luoghi/via-appia-antica/ — distinct from the regional
  park below, and both operate in the quartiere. Do not conflate them.

**27. Parco Regionale dell'Appia Antica, Ardeatino sector** — `park`
- it.wikipedia `Ardeatino` places the "settore compreso fra la via Appia Antica e via Ardeatina" in
  the quartiere. Ente Regionale Parco dell'Appia Antica, **Via Appia Antica 42, 00179 Roma**,
  +39 06 512 6314. Source: https://www.parcoappiaantica.it/

**28. Ex Cartiera Latina** — `museum` (Museo multimediale) — **Via Appia Antica, 42 — 00179 Roma**
- Sources: https://www.parcoappiaantica.it/visitare-il-parco/cartiera-latina/ and
  https://www.parcoappiaantica.it/visitare-il-parco/museo-cartiera-latina/
- In **1998** the site of the Cartiera Latina paper mill was granted to the regional park as its
  headquarters and a multi-purpose visitor centre. Production history on the spot goes back to **1081**
  (a fulling mill for wool cloth, the *valca*); used from the 1600s by the Capuchins; in December
  **1804** it ground vallonea for tanning, in **1823** myrtle for medicines, in **1875** pigments for
  ceramics; in **1919** the mill became an industrial paper works with a steam boiler and three
  electric motors totalling 67 amperes; the *Società anonima per azioni "Cartiera Appia"* was formed
  in September **1923** and became *Società Anonima Cartiera Latina* in January **1931**; in the 1930s
  it made quality paper for publishing from cotton rags, and from the late 1940s — the Almone having
  become polluted — switched to recycled stock. **The factory closed in June 1986.**
- The **Museo multimediale della Ex Cartiera Latina** occupies the halls that still hold the original
  machinery: the *Sala macchine*, the *Sala della macchina continua*, the *Sala Nagasawa* and the
  *Sala Appia*. An audioguide and QR-code route funded by Regione Lazio runs through them. The other
  pavilions hold the park authority's offices, the **Biblioteca della Cartiera Latina "Fabrizio
  Giucca"**, the **sala conferenze "Antonio Cederna"**, a meeting room and teaching labs. Paper-making
  workshops by booking.
- Outdoors: two exhibition rooms for hire, a park info point with bookshop run by *Dì Natura*, and a
  teaching kitchen-garden, **Hortus Urbis**. **Green area and car park open every day 08:30–17:00
  (winter) / 08:30–19:00 (summer).** Tables and benches are free to use; no reserving them and no
  events without authorisation.
- ⚠ The Almone runs the length of the site — a sourced physical fact, and the river is why the
  quartiere's Appia edge has an artisanal history at all.

**29. Hortus Urbis** — `park`/`attraction` — the teaching garden at the Cartiera Latina, OSM
`leisure=garden`, in Ardeatino. Dedicated to the traditions of the Campagna Romana.

**30. Punto Informativo Parco Appia Antica** — `attraction` — **Via Appia Antica, 60** (OSM
`tourism=information`, website https://www.parcoappiaantica.it). The regional park also runs
**Noleggio Bici Appia Antica**
(https://www.parcoappiaantica.it/visitare-il-parco/noleggio-bici-appia-antica/) — bike hire is the
practical reason most visitors stop here. Verifier should confirm which address the hire operates from
before it publishes; I have the info point at 60 and the HQ at 42.

**31. Complesso di Capo di Bove** — `historic-site` — **Via Appia Antica, 222 — Roma**
- Source: https://www.parcoarcheologicoappiaantica.it/luoghi/complesso-di-capo-di-bove/
- At the **IV mile**, about **500 m** from the Mausoleo di Cecilia Metella. A green plot of about
  **8,600 m²** with a main three-storey building and a smaller one. When the property came up for sale
  in **2002** the Soprintendenza and the ministry bought it by exercising the right of pre-emption
  (⚠ the page's *vincolo* clause is banned; the purchase is not). Excavation of the garden uncovered a
  **bath complex of the mid-2nd century AD** with building phases to the 4th and traces of late-antique
  agricultural use, when the area formed part of the *Patrimonium Appiae*: dozens of rooms, mosaic and
  coloured-marble floors, water tanks, terracotta tubuli, the drainage system, and stretches of marble
  revetment and painted plaster. The main building stands on the Roman cistern that fed the baths and
  has a curtain wall of reused ancient material built in the 1950s.
- **STATUS: CLOSED.** «Dal 22 giugno 2026 il Complesso di Capo di Bove è temporaneamente chiuso al
  pubblico per consentire l'avvio dei cantieri di restauro e valorizzazione della struttura di
  accoglienza, dei giardini e dell'area delle terme. La data di riapertura sarà comunicata sui canali
  ufficiali del Parco non appena disponibile.» This is an affirmative, sourced, dated closure —
  exactly the case where `status: closed` is correct and the prose must carry the reason and the date.
- Tickets when open: combined Mausoleo di Cecilia Metella + Capo di Bove, full €8 / reduced €2 /
  Roma Pass €4 / free, valid same day. Parco ticket full €12 / reduced €2, valid seven days across
  Antiquarium di Lucrezia Romana, Mausoleo di Cecilia Metella, Capo di Bove, Villa dei Quintili–Santa
  Maria Nova, Tombe della via Latina, Villa di Sette Bassi, by booking. "La Mia Appia Card" €25, one
  calendar year. Access by Metro A Arco di Travertino + bus 660, Metro A Colli Albani + bus 663, or
  bus 118 from the historic centre.
- ⚠ The combined ticket pairs Capo di Bove with **Cecilia Metella, which is Appio-Latino.** Say the
  ticket covers both without implying the mausoleum is in this quartiere.

**32. Archivio e Biblioteca di Antonio Cederna** — `museum`/`attraction` — housed in the main building
at Capo di Bove; the Parco archeologico gives it its own page,
https://www.parcoarcheologicoappiaantica.it/luoghi/archivio-cederna/ . Cederna is described by the
park as "il padre del movimento ambientalista in Italia che tanto si è battuto per la tutela della Via
Appia Antica". Currently inside a closed site (see #31).

**33. Sepolcro di Priscilla** — `historic-site` — **Via Appia Antica, 64** (OSM address node; OSM also
carries https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/... which I did not fetch)
- 1st century, at the II mile, opposite the church of the Domine quo vadis. Priscilla was the wife of
  **Titus Flavius Abascantus**, freedman of Domitian and secretary *ab epistulis*. Over a quadrangular
  travertine-faced base rose two superimposed cylindrical drums in *opus reticulatum*, the upper one
  with **13 niches** for statues of the deified dead woman. The barrel-vaulted burial chamber is
  reached by a corridor now entered from the cellars of one of the farmhouses built against the
  monument. Identified from **Statius, *Silvae* V, "Epicedion in Priscillam Abascanti Uxorem"** —
  Statius records that she was embalmed rather than cremated. In **1773** a marble slab was found by
  the mausoleum, set up for the young slave Aphrodisius by T. Flavius Epaphroditus, custodian of the
  tomb for Abascantus and Priscilla; it is now in the civic lapidary of **Ferrara**, where it arrived
  in **1779** by gift of Cardinal Gian Maria Riminaldi. Reused from the **11th century** as a
  fortification — a cylindrical tower ("torre Petro") built on the upper drum; held by the counts of
  Tusculum, then the Caetani. In the 18th century wrongly believed to be the tomb of the Scipios;
  Piranesi drew it. Two farmhouses were later built against it, one the *osteria dell'Acquataccio*, and
  the burial chamber was used to age cheese. **"È visitabile solo in occasioni particolari."**
  Source: https://it.wikipedia.org/wiki/Sepolcro_di_Priscilla
- ⚠ Boundary knife-edge — see §5.4.

**34. The tombs of the IV mile** — `historic-site`, and my recommendation is **one record, not twelve**
- All listed under Ardeatino by it.wikipedia's `Ardeatino` article and all confirmed inside the
  polygon: **Mausoleo di Sant'Urbano martire** (2nd c., 41.83920/12.53497), **Tomba dei Licini**
  (41.838400/12.535899), **Tomba del fregio dorico** (a Sullan-era altar-tomb, 41.838344/12.535973 —
  OSM calls it *Sepolcro Dorico*), **Sepolcro di Hilarus Fuscus** (41.83802/12.53634), **Tomba di
  Tiberio Claudio Secondino** (41.837247/12.537199), a **Colombario** (41.837590/12.536748), **Tomba di
  Quinto Apuleio** (41.837252/12.537193), a **sepolcro a tempietto rettangolare** (41.836258/12.538247),
  **Tomba dei Rabiri** (1st c., 41.835865/12.538787), a **sepolcro a torre con porta ad arco**
  (41.835385/12.539269), **Tomba dei Festoni** (41.835074/12.539647), **Tomba del frontespizio**
  (41.835024/12.539698). OSM adds **Tomba di Marco Servilio Quarto**.
- Twelve near-identical roadside tombs within 400 m of each other will not carry twelve honest
  records. One record for the IV-mile tomb sequence, naming the individually identifiable ones, is the
  editorial call I would make. Per-tomb secondary pages exist at viaappiaantica.com (e.g.
  http://www.viaappiaantica.com/2014/04/09/tomba-dei-rabirii/) — an aggregator, attribute it if used.
- Also at the II mile: **Sepolcro di Priscilla** (#33). At the III mile: an **altorilievo marmoreo**
  with a figure in heroic nudity (41.866641/12.502990).

**35. Basilica paleocristiana circiforme, via Ardeatina** — `historic-site` — 41.861428/12.505883,
listed in `Ardeatino`'s `Siti archeologici`; OSM maps it as **Basilica di San Marco**
(`historic=archaeological_site`). This is the 66 × 27 m circiform basilica found in 1991 (see #8).
The two records should be cross-checked and probably merged.

**36. Villa di Tor Carbone (*Domus marmeniae*)** — `historic-site` — at the IV mile of via Appia
Antica, 41.838465/12.534035, 1st century. Sourced in `Ardeatino` to Marina De Franceschini, *Ville
dell'Agro romano*, L'Erma di Bretschneider, 2005, ch. 78, pp. 217–219.

**37. Villa romana presso il casale della Vignacce** — `historic-site` — 41.835675/12.521106.

### 4.6 Tor Marancia

**38. Tenuta di Tor Marancia** — `park`
- Source: https://www.parcoarcheologicoappiaantica.it/luoghi/tor-marancia/
- **200 hectares** of Roman countryside; bounded west by the natural edge of the Marrana
  dell'Annunziatella, north and east by Via delle Sette Chiese, Via Ardeatina and Vicolo
  dell'Annunziatella. Human traces from the Middle Palaeolithic (70,000–35,000 BC); farmed from Roman
  times to the present. The most monumental Roman building here was the **Villa dei Numisii**, a rich
  mid-2nd-century house belonging to **Numisia Procula**, named on a lead pipe stamp found on the
  estate — now destroyed by quarrying on the right of the via Ardeatina. The name Tor Marancia
  probably comes from **Amaranthus**, the freedman who managed the Numisii villa. The **Torre
  Marancia** itself stood on via delle Sette Chiese near the Domitilla catacombs, and had gone by the
  1660 Catasto Alessandrino. Basolate roads, funerary monuments and necropoleis along the Ardeatina
  and Laurentina — one of the largest along Via di Grotta Perfetta near the Chiesa dell'Annunziatella.
  Residential development inside the GRA was planned from the 1990s and blocked after public campaigns;
  in **2002** the city council and *giunta* resolved to create the Parco di Tor Marancia as part of the
  Appia Antica park.
- **Three entrances: two off Via Giulio Aristide Sartorio, at Piazza Lante and nearby Via Francesco
  Belloni; a third from Viale Londra (Grotta Perfetta / Roma 70 side). "Il sito è di libero accesso."**
- OSM also carries a **Tor Marancia** tower node (`historic=tower`) and a **Tor Marancia Bike
  Playground**.

**39. Museo Condominiale di Tor Marancia** ("Big City Life") — `museum`
- **Viale di Tor Marancia, 63.** Site: https://www.museotormarancia.it
  Article: https://it.wikipedia.org/wiki/Museo_condominiale_di_Tor_Marancia
- **22 monumental murals on 11 blocks** of the ATER public-housing estate Lotto 1, the estate dating
  from **1947**. Conceived in **2013** by **Stefano Antonelli** with **Gianluca Marziani** consulting;
  made **2014–2015** by the association **999Contemporary** through the *Big City Life* project.
  Funded 999Contemporary **55%**, Fondazione Roma **25%**, Roma Capitale **20%** through the Roma
  Creativa public call; under a protocol with ATER, sponsored by Municipio Roma VIII, with ATAC,
  Sikkens and Pescerosso. **70 working days, 765 litres of paint, 974 spray cans.** Officially opened
  **9 March 2015**. In 2016 the project represented Italy in the Italian Pavilion at the 15th Venice
  Architecture Biennale ("Taking Care — Progettare per il bene comune"). Recognised by ICOM as museum
  institution no. M124582; run by the Museo Condominiale di Tor Marancia association chaired by
  Antonelli, directed by Marziani.
- Named works with artist, year, medium and dimensions are all in the article — e.g. Alberonero,
  *A Carlo Alberto, 93 colori*, 2015, acrylic, 10 × 14.5 m; Caratoes, *Welcome to Shangay*, 2015,
  5 × 5.3 m; Mr. Klevra, *Nostra Signora di Shanghai*; Diamond, *Hic sunt adamantes*; Gaia,
  *Spettacolo, Rinnovamento, Maturità*; Domenico Romeo, *Alme sol invictus*; Danilo Bucchi, *Assolo*;
  Best Ever, *Piramide*; Clemens Behr, untitled.
- 📸 **PHOTO REJECT.** Every muralist is living or recently working; these are 2015 artworks in
  copyright and Italy has no freedom of panorama. Note for the photo wave.

**40. Casale de Merode (o di Tor Marancia)** — `historic-site` — su via delle Sette Chiese,
41.857844/12.507428. ⚠ it.wikipedia calls it "Casale del **VII** secolo", which is almost certainly a
typo for XVII given the four other casali in the same list are XVII–XVIII. **Do not publish the
century** until a second source confirms it.

**41–44. Casale della Vignacce** (17th c., vicolo di Tor Carbone, tenuta Muracci dell'Ospedaletto,
41.839088/12.524514); **Casale di Vigna Viola** (18th c., via Ardeatina, tenuta Zampa di Bove,
41.845978/12.519190); **Casale Torlonia** (17th c., III mile of via Appia Antica,
41.845055/12.528417); **Casale Caribelli** (18th c., viale Pico della Mirandola,
41.846721/12.485256). All `historic-site`, all from `Ardeatino`'s `Architetture civili`, all inside
the polygon. Thin — a single "the casali of the Ardeatino countryside" record may serve better than
four stubs. **Tenuta Zampa di Bove** (41.846873/12.520081) is separately listed as a natural area.

**45. Murale dedicato a Ennio Morricone** — `attraction` — OSM `tourism=artwork`, in Ardeatino, no
address captured. Unsourced beyond OSM; needs a second source.

**46. Murale *La cascata*, via di Vigna Murata** — `attraction` — made in **2013** by Alessandro
Sabong in spray paint with the Fondazione Insieme per Roma. Source: `Ardeatino` article citing
https://www.rerumromanarum.com/2018/01/la-cascata-di-via-di-vigna-murata.html (an aggregator —
attribute it).

### 4.7 The forts

**47. Forte Ardeatino** — `historic-site` — **via di Grotta Perfetta**, 41.83871/12.50420
- One of the **fifteen forts of Rome** built between **1877 and 1891**; "nel quartiere Q. XX
  Ardeatino, nel territorio del **Municipio Roma VIII**". Built **1879–1882** over **11.2 ha**, at the
  fourth kilometre of via Ardeatina, from which it takes its name. Prussian type, part of the *Campo
  trincerato di Roma*. Used from the 1920s as a military commissariat and health-service store;
  decommissioned **1961**; assigned in concession to the Ente Assistenza Cancerosi Poveri, a plan that
  came to nothing; handed to the Comune di Roma in **1982**, with an expropriation never completed.
  Now owned by Roma Capitale. **In May 2006, after restoration work, the park outside the fort was
  opened to the public; the interior of the fort is still not accessible.** That last sentence is the
  whole visitor story and it is sourced.
  Source: https://it.wikipedia.org/wiki/Forte_Ardeatina
- OSM separately maps **Parco di Forte Ardeatino** (`leisure=park`) — that is the accessible part and
  may be the better `park` record.

**48. Forte Appia Antica** — `historic-site` — **at the fourth kilometre of via Appia Antica**,
41.84148/12.52955
- Also one of the fifteen forts; "nel quartiere Q. XX Ardeatino, nel territorio del Municipio Roma
  VIII". Built from **1877**, finished **1880**, over **16.5 ha**. Until the 1910s it housed the
  Artillery Directorate of the Corpo Aeronautico; between the 1980s and 1990s it was the data-processing
  centre of the Aeronautica Militare's Reparto Sistemi Informativi Automatizzati, which still uses part
  of it as a store. No public access stated. Source: https://it.wikipedia.org/wiki/Forte_Appia_Antica
- ⚠ **Do not repeat the D.M. 06/08/2008 vincolo sentence.**

### 4.8 Churches of the modern quartiere

All from `Ardeatino`'s `Architetture religiose` unless noted; all confirmed inside the polygon.

**49. Chiesa dell'Annunziatella** — `historic-site` — vicolo dell'Annunziatella, between via Ardeatina
and via di Grotta Perfetta. An internal inscription of **Honorius III dated 12 August 1220** lists it
among the Roman churches named for Maria Annunziata — hence the popular diminutive. For a short period
**Filippo Neri added it, with San Paolo alle Tre Fontane, to the Seven Churches itinerary**, which
thereby became nine; it had a hospice for the pilgrims who came. **In 1640 Cardinal Francesco
Barberini**, protector of the Confraternita del Gonfalone to which the church was entrusted, reduced it
to its present form, and the tradition of distributing food to the poor on 25 March began. Single nave;
a 19th-century wooden Crucifix; a tripartite fresco in the apse conch — *Annunciation* at the centre,
*Madonna among the souls in purgatory* and *Nativity* at the sides.
Source: https://it.wikipedia.org/wiki/Chiesa_dell%27Annunziatella_(Roma) ; the article cites
https://www.diocesidiroma.it/phpenti/ente/?ID=82 for the 1220 inscription.

**50. Chiesa della Santissima Annunziata a Via Ardeatina** — `historic-site` — via di Grotta Perfetta,
**1987**, by the engineer **Ignazio Breccia Fratadocchi**. Ancient artefacts came to light during the
excavation for it. 📸 photo caution: Breccia Fratadocchi died 2011 → 2081.

**51. Chiesa di Santa Francesca Romana** — `historic-site` — via Augusto Franzoi, 41.862305/12.501927.
**1936**, rationalist, by the architect **Giuseppe Zander**; parish erected **23 May 1959** by decree
*Supremam in Ecclesia* of Cardinal Vicar Clemente Micara. 📸 Zander died 1990 → 2060.

**52. Chiesa di San Vigilio** — `historic-site` — via Paolo di Dono, 41.829812/12.492576. **1990**,
modernist, by the architect **Lucio Passarelli**; parish erected **22 May 1968** by decree *Quotidianis
curis* of Cardinal Vicar Angelo Dell'Acqua. 📸 Passarelli died 2017 → 2087. **Photo reject.**

**53. Chiesa dei Santi Martiri dell'Uganda** — `historic-site` — largo Santi Martiri dell'Uganda,
41.845203/12.489790. **1971**; parish erected **4 September 1970** by decree *Pervigili cura* of
Cardinal Vicar Angelo Dell'Acqua.

**54. Chiesa di Gesù Buon Pastore** — `historic-site` — piazzale dei Caduti della Montagnola,
**1950–57**. Article fetched: https://it.wikipedia.org/wiki/Chiesa_di_Ges%C3%B9_Buon_Pastore_(Roma)

**55. Chiesa di Nostra Signora di Lourdes a Tor Marancia** — `historic-site` — via Andrea Mantegna,
**1957**. Article fetched.

**56. Chiesa di San Josemaría Escrivá** — `historic-site` — largo Josemaría Escrivá de Balaguer,
**1996**, 41.83784/12.49156. Article fetched.

**57. Cappella della Madonna di Fatima** — `historic-site` — via Giuseppe Cerbara,
41.854425/12.502694. 20th century; attached to a religious institute and a subsidiary place of worship
of the Nostra Signora di Lourdes parish. Thin.

### 4.9 Everything else OSM turned up inside the polygon

**58. Baby Luna Park** — `amusement-park` — **Via di Grotta Perfetta, 555**,
https://www.babylunapark.it/ . OSM `leisure=playground;tourism=theme_park`. The one genuinely
family-shaped attraction in the quartiere; worth a fetch by the verifier.

**Hotels** (`hotel`, all OSM, all inside the polygon, none independently verified by me):
Hotel Tre Fontane, Via del Serafico 51, http://www.hoteltrefontane.it/ · Adoro Otium Hotel,
Via delle Sette Chiese 280, https://www.adorohotel.it/ · Precise House Mantegna Roma,
Via Andrea Mantegna 130, https://www.precisehotels.com/precise-house-mantegna-roma · Casa per ferie
Seraphicum, Via del Serafico.

**Restaurants on the Appia** (`restaurant`, OSM addresses, none independently verified):
Trattoria Priscilla, Via Appia Antica 68 · Garden Risto', Via Appia Antica 172 · Giardino di Giulia e
Fratelli, Via Appia Antica 176 (https://www.facebook.com/ilgiardinodigiuliaefratelli/) ·
Qui nun se more mai, Via Appia Antica 198 · Hostaria Antica Roma (no number captured) ·
da Riccardo, Vicolo dell'Annunziatella 60. There are ~100 more eating places inside the polygon
(Grotta Perfetta, Montagnola, Tor Marancia, Serafico) — an ordinary residential inventory, not
guide material. If the page wants two or three restaurants, the Appia frontage is where they belong,
and each needs its own site fetched for identity, address and hours. **A founding year from an
operator's site does not publish.**

**Gruppo Storico Romano** — `museum` — OSM `tourism=museum`, https://www.gruppostoricoromano.it/ ,
inside the polygon. **I could not read the site** — it serves only the string "SwiteFrontendNg" to a
plain fetch and I could not find a static fallback. This is the gladiator-school/museum operation
associated with the Appia; it is a real visitor draw if it can be sourced. **Least confident item in
this file.** See §7.

**Museo delle Macchine Agricole** — `museum` — OSM `tourism=museum`, inside the polygon, no address,
no site, no article. Unverified.

**Vickers V.798D Viscount** — OSM `historic=aircraft;tourism=attraction`, inside the polygon. An
aircraft on display somewhere in the quartiere. Unverified; curious enough to be worth ten minutes.

**Villa Trebazia** — Via Appia Antica 230, https://www.villa-trebazia.com/ — OSM `tourism=attraction`;
reads as a private events venue. Probably out.

**Epigrafe geodetica napoleonica** — OSM `tourism=information`, inside the polygon. A Napoleonic
geodetic marker. Unverified, but a genuinely unusual small thing.

**Porta Ardeatina** — `historic-site` — OSM `historic=city_gate`, inside the polygon. **See §5.5.**

---

## 5. STRADDLERS — flagged, not resolved. The arbitrator decides all of these.

### 5.1 Chiesa del Domine Quo Vadis — the brief is wrong; this is Appio-Latino
My brief lists it as a likely Ardeatino subject. **Both instruments say otherwise.**
- it.wikipedia, verbatim: «un piccolo luogo di culto cattolico che si trova a Roma, al bivio tra
  l'Appia Antica e la via Ardeatina, **nel quartiere Appio-Latino**», and the page is filed under
  `Categoria:Chiese di Roma - Q.IX Appio-Latino`. Its bibliography is A. Manodori, *Quartiere IX.
  Appio Latino*.
- Its own coordinates, 41.866389 / 12.503611, fall in **Q. IX Appio-Latino** in the polygon test.
- Appio-Latino is not a zone in this wave, so the church goes unwritten. **Ardeatino must not take it.**
- ⚠ But note the compensation: **the original of the "Quo Vadis" footprint stone is in the Cappella
  delle Reliquie of San Sebastiano fuori le mura, which IS ours** — it.wikipedia says the slab in the
  Quo Vadis church is a «copia di un rilievo conservato nella vicina basilica di San Sebastiano fuori
  le mura», and catacombe.org says the same from the other side. The legend belongs to Appio-Latino;
  the object belongs to Ardeatino. That is a clean, sourced, non-superlative fact and it is the best
  single line in the zone.

### 5.2 Colonna di Pio IX — the two instruments disagree
- `Ardeatino`'s own article lists it under `Altro`: «Colonna di Pio IX, su via Appia Antica. Memoriale
  del XIX secolo (1851) … Fu commissionata da Pio IX e posta di fronte alla basilica di San Sebastiano
  fuori le mura, **sul lato opposto di via Appia Antica**.»
- Its stated coordinates, 41.856117 / 12.516303, fall in **Q. IX Appio-Latino**.
- These are consistent with each other, not contradictory: the article says the column is on the far
  side of the road from the basilica, and the far side of the road *is* Appio-Latino on this stretch.
  The Ardeatino article lists it anyway, presumably as a neighbourhood landmark.
- **Recommendation: do not claim it.** The boundary rule the article itself supplies puts it out.
  Arbitrator's call.

### 5.3 Chiesa di San Nicola a Capo di Bove — a real conflict
- Its own article says «una chiesa sconsacrata di Roma, **nel quartiere Ardeatino**, sulla via Appia
  antica, **di fronte al mausoleo di Cecilia Metella**» and it is filed under `Categoria:Chiese di
  Roma - Q.XX Ardeatino`. `Ardeatino` lists it too, at the III mile.
- Its stated coordinates, 41.852222 / 12.520833, fall in **Q. IX Appio-Latino**, as do Cecilia Metella
  (41.85222/12.52222) and the Castrum Caetani.
- The **Parco archeologico dell'Appia antica** markets it as one site with the other two:
  https://www.parcoarcheologicoappiaantica.it/luoghi/mausoleo-di-cecilia-metella-e-castrum-caetani/ —
  "Mausoleo di Cecilia Metella, Castrum Caetani e Chiesa di San Nicola". The church was built inside
  the Caetani castle courtyard at the start of the **14th century** by the Neapolitan architect
  **Masuccio II** for the Caetani, who received the mausoleum from **Boniface VIII in 1299**; it is a
  rare piece of sacred Gothic in Rome, a single rectangular hall, plain façade, a bellcote on the left,
  pointed single-light windows, projecting apse, no roof.
- **Recommendation: do not claim it.** It is physically and institutionally part of the Cecilia
  Metella complex, which is Appio-Latino. Two Ardeatino sources against three Appio-Latino indicators.
  Arbitrator's call.
- Note this does NOT touch **Complesso di Capo di Bove** at Via Appia Antica 222, ~500 m further out,
  which the polygon puts in **Ardeatino** and which is a separate ticketed site.

### 5.4 Sepolcro di Priscilla — 50 metres decide it
- `Ardeatino` lists it at the II mile. Its own article says it is «di fronte alla chiesa del Domine quo
  vadis», which is Appio-Latino.
- OSM's addressed node, **Via Appia Antica 64**, falls in **Ardeatino** (41.86583/12.50444 → Ardeatino;
  41.8663/12.5047 → Appio-Latino). The boundary is the road itself and the tomb sits right beside it.
- **Flagged. Do not resolve unilaterally.** If it goes to Ardeatino, its own article's "opposite the
  Domine quo vadis church" is still a legitimate locator, because the far side of a named road is a
  factual position, not an impression.

### 5.5 Porta Ardeatina and the Aurelian Wall — contested with San Saba, which has already shipped
- OSM maps `Porta Ardeatina` inside the Ardeatino polygon, and `Ardeatino` says the quartiere sits
  «a ridosso delle Mura aureliane» with San Saba and Celio to the north.
- But the **wall is the boundary**, three shipped rioni already own wall segments
  (`celio-mura-aureliane-segment-rome`, `mura-aureliane-segment-testaccio-rome`,
  `mura-aureliane-segment-trastevere-rome`), and San Saba owns `porta-san-paolo-san-saba-rome` on the
  same stretch. San Saba is shipped and cannot be amended in this wave.
- **Recommendation: leave Porta Ardeatina and any Aurelian Wall segment alone.** The upside is one
  gate; the downside is putting the same masonry in two files.

### 5.6 Abbazia delle Tre Fontane — contested with EUR
- The polygon and the boundary prose both put it in **Ardeatino**: the line with Q. XXXII Europa is via
  Laurentina, and the abbey is east of it, on via di Acque Salvie.
- **But** it.wikipedia's abbey article says it «dà il nome alla zona urbanistica Tre Fontane, **in
  prossimità dell'EUR**», and travellers reach it from EUR. Expect the EUR finder to want it.
- **Recommendation: Ardeatino.** The zona urbanistica *Tre Fontane* is a different layer from the
  quartiere, exactly the trap §2.4 of `scope-quartieri.md` warns about. Arbitrator's call, and the
  four Tre Fontane records (#17–#22) must move together, not split.

### 5.7 Catacombe di Domitilla — contested with Ostiense
- Address **Via delle Sette Chiese 282, postcode 00147**, which is the Ostiense/Garbatella postal
  range; via delle Sette Chiese runs from San Paolo across both quartieri.
- The polygon puts the entrance (41.85805/12.50158) in **Ardeatino**, and the catacomb's own article
  says «nel moderno quartiere Ardeatino». PCAS and the operator both place it "sulla via Ardeatina" /
  "lungo l'antica via Ardeatina", which is the Ardeatino side.
- **Recommendation: Ardeatino**, on three sources. Flagged because Ostiense may claim it on the
  postcode. The **Catacomba di Commodilla** (Via delle Sette Chiese 42, 00145) and **Catacomba di
  S. Tecla** (via Silvio D'Amico 42, 00145) are the ones that should go to Ostiense; I did not test
  them and I am not claiming them.

### 5.8 Also not ours, tested and clear
Mausoleo di Cecilia Metella · Castrum Caetani · Circo di Massenzio and the Villa di Massenzio ·
Catacombe di Pretestato (Via Appia Pignatelli 11 → Q. IX / Q. XXVI) · Villa dei Quintili (Z. XXI
Torricola) · Parco della Caffarella and the Valle della Caffarella (Appio-Latino; OSM has information
boards about them physically inside our polygon, which is a signpost, not a place) · Villa Casali,
Cappella di Reginald Pole, Sant'Urbano alla Caffarella, Casale della Vaccareccia (all Appio-Latino per
`scope-quartieri.md` §3.1).

---

## 6. YIELD — honest assessment

**This is a guide page, not a town page, and it is not close.**

Ardeatino has three of Rome's seven publicly open catacombs (San Callisto, San Sebastiano, Domitilla —
out of the seven PCAS lists as open in Rome: S. Pancrazio, Priscilla, S. Sebastiano, Domitilla,
S. Agnese, S. Callisto, SS. Marcellino e Pietro), a Constantinian basilica of the seven-church
pilgrimage with published opening hours, the Fosse Ardeatine memorial with a full documented
competition history and a state-published description, a Trappist abbey of three churches with
published hours and a shop, the state Appia archaeological park's Capo di Bove complex, the regional
park's headquarters and industrial museum, a 200-hectare estate, a 22-mural ICOM-registered museum, two
1870s forts, and a IV-mile tomb sequence. Six or seven of those are things a visitor would cross Rome
for. Fifty-eight candidates, and I would expect a low confirmation rate on the tail — the casali, the
minor modern parish churches, the OSM-only items (Museo delle Macchine Agricole, the Viscount, the
Napoleonic marker) and the restaurant/hotel inventory should mostly fall, which is the correct shape.

The zone's weakness is **locators**, not material. A quartiere this size makes "in Ardeatino" nearly
useless, and half the sites sit on unnumbered stretches of ancient road. Where I have a street number
I have given it; where the honest locator is a Roman milestone ("at the IV mile of the via Appia
Antica") that is what the source says and it is a position in a series, not an impression. Do not let
a writer patch the gap with "a short walk from the catacombs".

The zone's second weakness is **stale hours**. San Callisto and Domitilla both still publish 2025
annual-closure dates in 2026, and domitilla.info is frozen in July 2020. Weekly hours are consistent
across operator and PCAS and are safe; annual closures are not.

---

## 7. My three least confident finds

1. **Gruppo Storico Romano.** OSM puts a `tourism=museum` node inside the polygon with the URL
   https://www.gruppostoricoromano.it/ , and a plain fetch of that site returns the single token
   "SwiteFrontendNg" — it is a JS shell with no static fallback I could find, and unlike catacombe.org
   it has no `?_escaped_fragment_=` route and no useful sitemap. I have no address, no hours, no
   confirmation of what it operates. It is the kind of thing (gladiator school and small museum on the
   Appia) that a guide would genuinely want. **Treat as unverified.** If the verifier can render it,
   it may be a real entry; if not, it should not ship on an OSM node alone.

2. **Colonna di Pio IX and Chiesa di San Nicola a Capo di Bove.** Both are listed by name in
   `Ardeatino`'s own article, and both fail the polygon test into Appio-Latino — and in San Nicola's
   case the state park treats it as one site with Cecilia Metella, which is unambiguously Appio-Latino.
   I have argued against claiming either, but I am arguing against a source that names the quartiere
   explicitly, which is uncomfortable. If the arbitrator prefers the article's own attribution over the
   OSM polygon, both come back in, and the rule has to be applied consistently to Cecilia Metella too —
   which would be wrong. **Someone above me should settle whether the OSM polygon or the article's
   stated quartiere wins when they conflict**, because this wave will hit it again.

3. **Birra Tre Fontane as a visitable place.** The abbey brews a Trappist beer, sells it in the
   monastic shop, and posts about its ATP renewal — all on its own site. What I could **not** establish
   is that any brewery or taproom is open to visitors, or that the beer's certification is safe to
   state under the designation ban. Kind `brewery` implies somewhere you can go. Unless a source states
   public access, this should be a sentence inside the abbey or shop record, not a place.

---

## 8. Photo-wave notes (no photographs in this wave; "photos": [] everywhere)

- **REJECT — Mausoleo delle Fosse Ardeatine** in its entirety. Mirko Basaldella d. 1969 (→2039),
  Francesco Coccia d. 1982 (→2052), Mario Fiorentino d. 1982, Giuseppe Perugini d. 1995, Nello Aprile
  d. 2010. No freedom of panorama in Italy.
- **REJECT — Museo Condominiale di Tor Marancia.** 22 murals, all 2015, all living or recent artists.
- **REJECT — Chiesa di San Vigilio** (Lucio Passarelli d. 2017 → 2087); **Chiesa della Santissima
  Annunziata a Via Ardeatina** (Ignazio Breccia Fratadocchi d. 2011 → 2081); **Chiesa di Santa
  Francesca Romana** (Giuseppe Zander d. 1990 → 2060) — all still in architectural copyright.
- **Likely clear** (pre-1900 fabric, exterior): Basilica di San Sebastiano fuori le mura and its 1612
  façade; the three Tre Fontane churches and the Arco di Carlo Magno; Chiesa dell'Annunziatella;
  Sepolcro di Priscilla and the IV-mile tombs; the two forts (1877–1882); the Ex Cartiera Latina
  fabric; the Capo di Bove baths.
- **Catacomb interiors are the highest-risk class after state museums** — photography inside is
  governed by the PCAS *Regolamento*, which the visit pages link
  (https://www.catacombeditalia.va/content/archeologiasacra/it/la-commissione/regolamenti.html).
  I did not read it. Do not source catacomb interiors without reading it first.
- The it.wikipedia `Ardeatino` article's own lead image is `Roma-fosseardeatine6.jpg` — do not reuse it
  on the strength of that; see the reject above.

---

## 9. Sources fetched, complete list

**Roma Capitale / toponymy**
- https://it.wikipedia.org/w/index.php?title=Ardeatino&action=raw (via MediaWiki `action=parse`)
- `docs/rome/scope-quartieri.md` §2.3, §2.4, §3.1, §3.2 (in-repo)
- `priv/seed_data/rome_roster.json` — scope_ruling, vatican_ruling, evidence_ruling, kind_note
- OSM relation 5473394 and the nine neighbouring boundary relations, Overpass API

**Holy See / catacombs**
- https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html
- https://www.catacombeditalia.va/content/archeologiasacra/it.html
- https://www.catacombeditalia.va/content/archeologiasacra/it/la-commissione.html
- https://www.catacombeditalia.va/content/archeologiasacra/it/visita-catacombe/aperte-al-pubblico.html
- https://www.catacombeditalia.va/content/archeologiasacra/it/visita-catacombe/aperte-su-richiesta.html
- https://www.catacombeditalia.va/content/archeologiasacra/it/visita-catacombe/per-regione/roma/catacomba-di-s-callisto.html
- https://www.catacombeditalia.va/content/archeologiasacra/it/visita-catacombe/per-regione/roma/catacomba-di-domitilla.html
- https://www.catacombesancallisto.it/it/index.php · /it/orari.php · /it/biglietti.php
- https://catacombe.org/it/info?_escaped_fragment_= · /it/basilica-san-sebastiano?_escaped_fragment_=
  · /it/salvator-mundi-bernini?_escaped_fragment_= · https://catacombe.org/sitemap_pages.xml
- https://www.domitilla.info/
- https://www.sansebastianofuorilemura.org/

**State / regional bodies**
- https://www.difesa.it/il-ministro/ufficio-per-la-tutela-della-cultura-e-della-memoria-della-difesa/lazio/mausoleo-delle-fosse-ardeatine/49663.html
- https://www.mausoleofosseardeatine.it/
- https://www.parcoappiaantica.it/ · /visitare-il-parco/cartiera-latina/ · /visitare-il-parco/museo-cartiera-latina/
- https://www.parcoarcheologicoappiaantica.it/luoghi/ · /luoghi/complesso-di-capo-di-bove/ · /luoghi/tor-marancia/
- https://whc.unesco.org/en/list/1708/
- https://www.abbaziatrefontane.it/

**it.wikipedia raw wikitext (MediaWiki `action=parse&prop=wikitext`)**
Ardeatino · Catacombe di San Callisto · Catacombe di San Sebastiano · Basilica di San Sebastiano fuori
le mura · Catacombe di Domitilla · Catacomba di Balbina · Catacomba dei Santi Marco e Marcelliano ·
Sepolcro di Priscilla · Abbazia delle Tre Fontane · Chiesa dei Santi Vincenzo e Anastasio alle Tre
Fontane · Chiesa di San Paolo alle Tre Fontane · Chiesa di Santa Maria Scala Coeli · Mausoleo delle
Fosse Ardeatine · Eccidio delle Fosse Ardeatine · Chiesa del Domine quo vadis · Chiesa di San Nicola a
Capo di Bove · Forte Appia Antica · Forte Ardeatina · Chiesa dell'Annunziatella (Roma) · Chiesa di
Gesù Buon Pastore (Roma) · Chiesa di Nostra Signora di Lourdes a Tor Marancia · Chiesa della
Santissima Annunziata a Via Ardeatina · Chiesa di San Josemaría Escrivá · Museo condominiale di Tor
Marancia · Tor Marancia · Parco regionale dell'Appia antica · Patti Lateranensi · Zone extraterritoriali
della Santa Sede in Italia

**Failed / unusable**
- Nominatim reverse geocoding — HTTP 429 on every request for the entire session; replaced by local
  point-in-polygon against OSM boundary relations. (Do not put this in reader-facing text.)
- https://www.turismoroma.it/it/luoghi/fosse-ardeatine — 404
- https://www.gruppostoricoromano.it/ — JS shell, no static content
- comune.roma.it — not attempted; the roster already records it as unreachable
- www.catacombedidomitilla.it — does not resolve
