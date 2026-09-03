# Celio (R. XIX, Roma Capitale toponymic code 119) — FINDER research file

Wave 4. Finder pass only. I do not decide what ships; a verifier adjudicates each record and one
arbitrator rules ownership across all nine rioni. Every straddler is flagged, not resolved.

Research window: 2026-09-02. Everything below was fetched by me in this session unless marked
otherwise.

- **Candidates recorded: 63** — 43 confident Celio, 11 straddlers I am explicitly NOT resolving,
  9 commercial.
- **Judgement: GUIDE, comfortably.** Celio is not a San Saba. It holds the Colosseum, a Sovrintendenza
  Capitolina museum complex opened in 2024, four titular basilicas, a public villa, two Aurelian-wall
  monuments and a whole southern archaeological lobe along Via di Porta San Sebastiano. Even after
  the straddlers are stripped out it clears thirty publishable records.
- **Photos: none sourced. `"photos": []` everywhere, per the wave ruling.** Photo leads noted in a
  separate section at the bottom and deliberately not acted on.
- **No designation claims anywhere below.** Vincoli in Rete and the Catalogo generale were not
  consulted and are not reachable; nothing here says any building is vincolato, listed, scheduled
  or protected. Where a source used such language I dropped the sentence rather than paraphrase it.

---

## 0. COLLISION CHECK — run mechanically, not from memory

`python3 .superpowers/taken_slugs.py` reports **450 places across 12 shipped files**. I searched it
for every candidate stem: `colosseo`, `colosseum`, `costantino`, `celio`, `gregorio`, `giovanni`,
`stefano`, `clemente`, `caracalla`, `claudio`, `coronati`, `sisto`, `scipio`, `navicella`,
`domnica`, `mura`, `porta`, `arco`, `obelisc`, `forma`, `hotel`, `trattoria`, `colombario`,
`celimontana`, `hilariana`.

**Only three hits touch my ground, and all three are correctly Monti's, not mine:**

| Shipped slug | Owner | My boundary test |
|---|---|---|
| `basilica-di-santo-stefano-rotondo-al-celio-rome` | monti | 41.885271,12.496698 → **Monti** by polygon. Monti is right. |
| `basilica-di-san-clemente-al-laterano-rome` | monti | 41.889444,12.497500 → **Monti**. Correct. |
| `porta-metronia-rome` | monti | 41.882549,12.498639 → **Monti** by polygon AND Nominatim. Correct. |

Also shipped and correctly outside me: `basilica-di-san-giovanni-in-laterano-rome` (monti),
`parco-del-colle-oppio-rome` (monti), `porta-asinaria-rome` (monti), `obelisco-lateranense-rome`
(monti).

The name "Santo Stefano Rotondo **al Celio**" is a title, not a rione. it.wikipedia's own Celio
article lists Santo Stefano Rotondo only in its *history* prose and pointedly **omits it from the
rione's "Architetture religiose" list**, because Via di Santo Stefano Rotondo is the Monti/Celio
boundary street. **No collision. I claim none of the above.**

**Nothing in my candidate list is already owned by any of the twelve shipped rioni.**

---

## 1. METHOD — how I decided which rione each place is in

Three independent instruments, and I report all three when they disagree.

1. **OSM boundary polygon.** Rione Celio is relation **5454335**, tagged
   `boundary=place`, `place=quarter`, `ref=R. XIX`, `official_name=Rione XIX Celio`,
   `wikidata=Q1052943`. Fetched via Overpass, stitched to a single closed ring of 478 vertices.
   Bounding box lon 12.4892046–12.5035465, lat 41.8734304–41.8912353. I also pulled Monti (5451988),
   Campitelli (5454237), Esquilino (5454309), San Saba (5454343), Ripa (5454276) and Testaccio
   (5454344) so a point can be reported as *outside Celio and inside X*, not merely "outside".
   Where a building has an OSM footprint I tested **every vertex**, not the centroid.
2. **Nominatim reverse geocode**, `zoom=18`, reading the `quarter` field. 32 points, 3 s apart.
3. **Sovrintendenza Capitolina's own `Rione:` field.** Several `sovraintendenzaroma.it` monument
   pages carry an explicit Roma Capitale rione attribution. This is the strongest evidence available
   and it beats both of the above where it exists. It exists for: Colombario di Pomponio Hylas
   (`XIX - Celio`), Tempio di Claudio (`XIX - Celio`), Fontana della Navicella (`Celio`), Fontana in
   via di S. Gregorio (`Celio`), Parco di S. Gregorio al Celio (`Municipio I, Rione XIX - Celio`),
   Parco degli Scipioni (`Municipio I, Rione XIX - Celio`), Villa Celimontana (`Municipio I,
   Rione XIX - Celio`).

**The rione's own written boundary**, from it.wikipedia's Celio article (which reproduces the
1921 delimitation and is corroborated by every polygon test I ran):
- NE with R. I Monti — piazza del Colosseo, via di San Giovanni in Laterano, via Santo Stefano
  Rotondo, via della Navicella to piazza di Porta Metronia.
- SE with Q. IX Appio-Latino — the Aurelian Walls from Porta Metronia to Porta San Sebastiano.
- SW with R. XXI San Saba — via di Porta San Sebastiano, piazzale Numa Pompilio, a short stretch of
  viale delle Terme di Caracalla, via di Valle delle Camene, piazza di Porta Capena.
- W with R. XII Ripa (piazza di Porta Capena) and R. X Campitelli (via di San Gregorio and piazza
  del Colosseo to the start of via dei Fori Imperiali).
Source: `https://it.wikipedia.org/w/api.php?action=parse&page=Celio%20(rione%20di%20Roma)&prop=wikitext`

Note the shape this produces: Celio is **two lobes**. The Caelian hill proper in the north, and a
long southern tongue running down Via di Porta San Sebastiano inside the walls, which carries the
Scipios, the columbaria and the Porta Latina group. Both are Celio. The southern lobe is the part
a lazy pass would miss.

---

## 2. THE COLOSSEUM — I re-tested it rather than inherit wave 1's ruling

**Verdict: the Colosseum is wholly inside Celio. Wave 1 was right. It is unclaimed and it is
Celio's.**

Evidence, mine, this session:

- OSM way **1500762394** (`amenity=theatre`, `name=Colosseo (Anfiteatro Flavio)`,
  `name:en=The Colosseum`, `wikidata=Q10285`, `website=https://colosseo.it/`,
  `addr:street=Piazza del Colosseo`, `addr:postcode=00184`). It is a 20-vertex closed footprint,
  bbox lat 41.889488–41.8909101, lon 12.4912297–12.4934353. **20 of 20 vertices fall inside the
  Celio polygon. Zero fall in Monti. Zero fall in Campitelli.** Centroid 41.890216, 12.492300 →
  Celio.
- Nominatim reverse on five points — centroid, and the north, south, west and east rim —
  returns `quarter = Celio` on every one that answered (four answered; the fifth was rate-limited on
  the first pass and returned `Celio` on the re-run).
- The surrounding roadway is genuinely split: OSM way 6171077 ("Piazza del Colosseo") has 5 vertices
  in Celio and 6 in Monti, way 22979017 has 2 in Monti and 1 in Campitelli, way 22979051 has 2 in
  Celio and 1 in Campitelli. So the *piazza* straddles three rioni — but the amphitheatre itself
  does not straddle anything. The boundary runs around it, not through it.

That the surrounding square splits three ways while the building does not is the whole reason this
needed re-testing, and it is why "Piazza del Colosseo" is filed below as a straddler while the
Colosseum is not.

---

## 3. CONFIDENT CELIO — 43 records

Boundary column: `poly` = OSM polygon vertex test, `nom` = Nominatim `quarter`, `SC` = Sovrintendenza
Capitolina's own `Rione:` field.

### 3.1 The Colosseum group

**1. Colosseo (Anfiteatro Flavio)** — kind: `historic-site` (a `theater` kind exists in the schema
and OSM tags it `amenity=theatre`, but it is an archaeological monument on a ticketed
archaeological-park circuit, not a working theatre; the verifier should rule).
- Address: Piazza del Colosseo, 00184 Roma. Boundary: poly Celio 20/20, nom Celio ×5.
- Official site: `https://colosseo.it/area/colosseo/` — **the domain does not resolve from this
  network**; I read it through the Internet Archive capture of 2026-08-31,
  `http://web.archive.org/web/20260831090730/https://colosseo.it/area/colosseo/`. The archived page
  is the Parco archeologico del Colosseo's own text.
  - "L'edificio, detto Colosseo per via di una colossale statua che sorgeva nelle vicinanze, venne
    edificato nel I secolo d.C. per volere degli imperatori della dinastia flavia."
  - "Nel 438 con l'abolizione dei giochi gladiatori per volere di Valentiniano III l'anfiteatro
    subisce un lento e progressivo declino tanto da essere utilizzato nel Medioevo e nel
    Rinascimento come cava di materiali, utilizzati anche per la costruzione della Basilica di San
    Pietro."
  - **DO NOT USE from this page: "il più grande anfiteatro del mondo."** Superlative. Banned
    regardless of attribution.
- Hours and tickets, official, from
  `https://colosseo.it/orari-e-biglietti/` (same archive route; capture current as of this session):
  "Il Colosseo apre alle 8.30"; "dal 29 marzo al 30 settembre 2026 8.30 – 18.15, ultimo ingresso
  alle 18.15, il PArCo chiude alle 19.15"; "dal 1° ottobre al 24 ottobre 2026 ultimo ingresso alle
  17.30, il PArCo chiude alle 18.30"; "dal 25 ottobre 2026 al 28 febbraio 2027 ultimo ingresso alle
  15.30, il PArCo chiude alle 16.30"; closed 25 December 2026 and 1 January 2027; free entry on the
  first Sunday of the month, 25 April, 2 June, 4 November. Official ticketing at
  `ticketing.colosseo.it`; tickets are nominative and released 30 days ahead. Free official app
  `MyColosseum`, iOS and Android, with Italian and English audioguides.
- Roma Capitale's tourism office adds measurements, which are counts and so publishable:
  `https://www.turismoroma.it/it/luoghi/lanfiteatro-flavio-colosseo` — construction begun 70 AD under
  Vespasian, completed 80 AD under Titus; four superimposed architectural orders, the lower three of
  eighty arcades each; "Lungo 189 metri, largo 156 metri, per un'altezza di oltre 48 metri… si
  estende su una superficie di 24.000 mq e poteva ospitare circa 50mila spettatori"; arena 76 m by
  46 m; the 217 fire destroyed the timber-and-rope hoist machinery in the hypogeum.
  - **DO NOT USE from this page: "il monumento più famoso al mondo", "l'anfiteatro più grande al
    mondo".** Both banned.

**2. Museo del Colosseo** — kind: `museum`. On the second level of the amphitheatre. Same address,
same polygon.
- `https://colosseo.it/area/musei/museo-del-colosseo/` (archive route). "La realizzazione del Museo
  del Colosseo al secondo livello dell'anfiteatro…" Sections on architecture, the working of the
  amphitheatre, the gladiator's trade and the *venationes*, the spectators and the inscribed
  senatorial *loca*, the monument's sculptural apparatus, the medieval Colosseum and its
  Christianisation, the Grand Tour views, the Lucangeli model, and the monument's ideological reuse
  under the regime. Access is included in the "24h – Colosseo, Foro Romano, Palatino" ticket per the
  official ticket page.
- Not in `taken_slugs.py`. Distinct enough from the Colosseum record to stand alone; the verifier
  may prefer to fold it in.

### 3.2 Parco archeologico del Celio and its buildings

The north-west shoulder of the hill facing the Colosseum. OSM relation **1900747**
(`historic=archaeological_site`, `leisure=park`, `fee=no`, `wikidata=Q124309665`): **108 of 108
vertices in Celio**, centroid 41.887818,12.491377 → Celio; nom Celio, road Viale del Parco del Celio.

**3. Parco archeologico del Celio** — kind: `park` (or `historic-site`; verifier's call).
- Sovrintendenza Capitolina, `https://www.sovraintendenzaroma.it/content/parco-archeologico-del-celio`:
  entrances "Viale del Parco del Celio 20, Viale del Parco del Celio 22, Clivo di Scauro 4";
  "Ingresso gratuito"; "Aperto dalle 7.00 alle 17.30 (ora solare) - dalle 7.00 alle 20.00 (ora
  legale). Chiuso 25 dicembre, 1 maggio"; information line 060608, 09.00–19.00 daily;
  "L'area archeologica e il museo sono accessibili a tutti."
- `https://www.turismoroma.it/it/luoghi/parco-archeologico-del-celio` gives the sequence: the
  Cornovaglia family held it as a vineyard from the sixteenth century; under the Napoleonic
  administration the French dumped spoil from the Forum and Colosseum excavations here, producing the
  artificial terrace; in 1835 Gregory XVI turned the resulting garden into a "passeggiata pubblica"
  and Gaspare Salvi laid the avenues and built the Casina; in 1847 both Casina and park passed to the
  Comune by Motu Proprio of Pius IX; the Ex Antiquarium Comunale went up from 1884 in the northern
  part, the Ex Palestra della GIL was completed 1929 in the south; viale del Parco del Celio, carrying
  the post-war tram line, divides the park in two. The garden displays epigraphic and architectural
  finds from the late-nineteenth-century excavations, arranged in thematic groups.
- Page tagged `Rione XIX - Celio` in turismoroma's own related-content block.

**4. Museo della Forma Urbis** — kind: `museum`. Viale del Parco del Celio 20.
- `https://www.sovraintendenzaroma.it/content/il-museo-della-forma-urbis`: housed in the Ex Palestra
  della Gioventù Italiana del Littorio; holds the surviving fragments of a marble city plan
  "incisa su 150 lastre di marmo tra il 203 e il 211 d.C.", originally displayed on the wall of a
  hall in the Temple of Peace later absorbed into the SS. Cosma e Damiano complex; complete it covered
  "una superficie di 18x13m circa" representing "almeno 13.550.000 m2 di città", at an average scale
  of about 1:240; surviving fragments are "circa un decimo della pianta originale"; only about 200
  fragments have been identified and placed on modern topography; found from 1562 onward; the last
  comprehensive arrangement of the originals was in the Palazzo dei Conservatori garden between 1903
  and 1924; the fragments now lie on the museum floors superimposed on Giovanni Battista Nolli's
  Pianta Grande of 1748.
  Hours: "Aperto dal martedì alla domenica; ora solare: dalle 10.00 alle 16.00 (ultimo ingresso alle
  15.00); ora legale: dalle 10.00 alle 19.00 (ultimo ingresso alle 18.00). Chiuso il lunedì, il 25
  dicembre, 1° maggio."
- `https://www.turismoroma.it/it/luoghi/museo-della-forma-urbis` adds: incised under Septimius
  Severus; the 150 slabs were pinned to the wall with iron dowels; the plan entered the Capitoline
  collections in 1742; until 1939 significant groups were visible in the Antiquarium del Celio.
  Tagged `Rione XIX - Celio`. Poly Celio, nom Celio.
- Tickets sold at `https://museiincomuneroma.vivaticket.it/it/tour/museo-della-forma-urbis/3644`.

**5. Casina del Salvi** — kind: `cafe` (it is a working caffetteria and study room) or
`historic-site`. Viale del Parco del Celio 20. Poly Celio, nom Celio.
- `https://www.turismoroma.it/it/luoghi/casina-del-salvi`: built in 1835 against the remains of the
  Temple of the Deified Claudius, at the wish of Gregory XVI (1831–1846), as a caffetteria; named
  for its architect Gaspare Salvi, who took the Pincio coffee-house by Valadier as his model.
  "Dopo un meticoloso restauro, la Casina è tornata alla sua destinazione ottocentesca di punto
  ristoro comprensivo di caffetteria al piano terra e nella terrazza esterna e di un'Aula Studio,
  dotata di wi-fi e allestita con tavoli attrezzati per la ricarica dei dispositivi mobili e spazi
  di relax, negli ambienti al piano superiore."
  Hours: "Caffetteria e Aula Studio aperte tutti i giorni dalle 9.00 alle 16.30 (ora solare), dalle
  9.00 alle 19.00 (ora legale)."
- Sovrintendenza's own Casina del Salvi page,
  `https://www.sovraintendenzaroma.it/content/casina-del-salvi`, is an image gallery only — no prose,
  no hours. Do not cite it for facts.
- it.wikipedia dates the reopening as an aula studio to April 2025 and cites
  `https://www.comune.roma.it/web/it/notizia/casina-del-salvi-aperta-al-pubblico-aprile2025.page`.
  **comune.roma.it does not resolve from this network** (the rome_roster already records this), so I
  could not confirm the reopening date from Roma Capitale directly. Do not publish the date.

**6. Ex Antiquarium Comunale del Celio** — kind: `historic-site`. Closed to the public. Poly Celio.
- `https://www.sovraintendenzaroma.it/content/antiquarium-comunale-del-celio`: conceived from 1882 to
  house finds from the excavations that followed the proclamation of Rome as capital; designed by
  Costantino Sneider as a Museo Urbano e Magazzino Archeologico; the first six rooms of the
  Magazzino Archeologico were inaugurated in 1889; a seventh room was inaugurated in 1906; from 1925
  Antonio Muñoz was given the enlargement, completed 1929, which converted it into a museum of the
  minor arts while the major sculpture went to the Palazzo dei Conservatori; in 1938 Muñoz added
  three superimposed rooms on the east side, completed early 1939; "pochi mesi dopo, i lavori per la
  costruzione della vicina galleria della metropolitana provocarono significativi problemi
  strutturali, portando il 5 dicembre dello stesso anno a una chiusura che si sarebbe rivelata
  definitiva." A PNRR – Caput Mundi recovery project is described on the same page.
- **Status field must say closed**, and the prose must agree.

**7. Tempio del Divo Claudio (resti)** — kind: `historic-site`. Poly Celio; **SC `Rione: XIX -
Celio`**, which settles it.
- `https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/tempio_di_claudio`: temple to
  Claudius, deified after his death in 54 AD, on the western slope of the Caelian; no remains of the
  temple building itself survive and it is known only from a fragment of the Severan marble plan, the
  Forma Urbis; prostyle and hexastyle, fronting north, raised on a rectangular platform "di m.
  180x200" whose substructures survive substantially, notably on the east side along the modern via
  Claudia; Nero built a monumental nymphaeum against that flank as a backdrop to the Domus Aurea and
  destroyed the temple, which Vespasian rebuilt; on the west side "si conservano notevoli strutture,
  costituite da una serie di ambienti a due piani con facciata in travertino, all'interno della
  proprietà della Chiesa e Convento dei Ss. Giovanni e Paolo."
- The Forma Urbis link is a genuinely good page hook: the museum that holds the marble plan stands on
  the platform of the building the plan is the only surviving record of.

**8. Cave del Tempio di Claudio** — kind: `historic-site`. Piazza dei Santi Giovanni e Paolo, 13.
Poly Celio (41.886428,12.492887).
- `https://www.turismoroma.it/it/luoghi/cave-del-tempio-di-claudio`: "Enormi gallerie per
  l'estrazione di tufo che si aprono inaspettatamente sotto un tempio romano, dei laghetti
  cristallini e una serie di pozzi." Hours field: "Visitabile solo con visite guidate."
- Thin. One paragraph of sourced text and an access condition. Verifier may reject for insufficiency;
  I am recording it because it is a real, separately-ticketed underground and a guide would mention
  it.

### 3.3 Santi Giovanni e Paolo and the Clivo di Scauro

**9. Basilica dei Santi Giovanni e Paolo al Celio** — kind: `historic-site`. Piazza dei Santi
Giovanni e Paolo, 13.
- Boundary: OSM way 375936632, **54 of 54 vertices in Celio**, centroid 41.886500,12.491986 → Celio;
  nom Celio, road Clivo di Scauro. Tagged `Rione XIX - Celio` on turismoroma.
- Official parish site `https://basilicassgiovanniepaolo.it/`: "La Basilica dei Santi Giovanni e
  Paolo venne eretta a partire dal 398 dal senatore Bizante o da suo figlio Pammachio sul sito di un
  edificio, databile tra il I e il II secolo, utilizzato prima come domus ecclesiae"; first cited in
  the acts of a synod held by Pope Symmachus in 499 as *Titulus Pammachii* or *Titulus Byzantii*;
  damaged by Alaric's Visigoths in the sack of 410, by an earthquake in 442, sacked by the Normans in
  1084; Paschal II (1099–1118) promoted the restoration and added the campanile and the portico;
  substantial work in 1715 under Cardinal Fabrizio Paolucci; "ha assunto l'attuale fisionomia nel
  1951, quando il cardinale Francis Joseph Spellman ne ha fatto ripristinare la facciata
  paleocristiana." Contact: `basilica.gioepaolo@passiochristi.org` — the Passionists hold it.
  - **DO NOT USE: the site calls it "la chiesa dei lampadari" and Roman shorthand.** Fine as a
    nickname, but don't dress it as a ranking.
- Roma Capitale, `https://www.turismoroma.it/it/luoghi/basilica-dei-santi-giovanni-e-paolo-al-celio`:
  rebuilt from the foundations in the twelfth century, when the portico and the tall campanile were
  added, the campanile "impostato sui resti del Tempio di Claudio"; in 1216 Cardinal Cencio Savelli,
  the future Honorius III, raised the portico to create the gallery above and the Cosmatesque portal
  with an eagle and two lions; the Romanesque façade was reinstated 1950–1952 at Cardinal Spellman's
  wish; coffered ceiling of the sixteenth century; a large Pomarancio fresco in the apse; a slab
  about halfway down the nave marks where the saints were martyred *in aedibus propriis*.
  - **DO NOT USE: "tra i più belli della città" about the campanile.** Superlative.
  - Hours, official, as republished by Roma Capitale from the basilica: "Mattina dalle ore 08.30 alle
    ore 12.45, Pomeriggio dalle ore 14.00 alle ore 17.00"; rector receives Wed, Thu, Sat 09.00–12.00
    and 15.30–17.00; Mass with the people Sundays and feasts 11.45, from the first Sunday of
    September, celebrated in the Cappella di San Paolo della Croce. Tel 3518161314.

**10. Casa di esercizi per il clero dei Santi Giovanni e Paolo — Lateran Treaty Art. 16**
— kind: `historic-site`, and a **tier-3** case, not extraterritorial.
- This is the one Holy See property in Celio and it is on the *wrong* list for the usual story, which
  is exactly why it is worth a page and exactly why it is easy to get wrong.
- **[PRIMARY]** Lateran Treaty, Art. 16, English text, from the Vatican City State's own PDF as
  archived: "The buildings mentioned in the three preceding Articles, as well as those used as
  headquarters of the following Pontifical institutions: the Gregorian University, the Biblical,
  Oriental, and Archaeological Institutes, the Russian Seminary, the Lombard College, the two Palaces
  of St. Apollinaris, and **the Clergy Retreat House of Sts. John and Paul** (Attachment III, 1, 1bis,
  2, 6, 7, 8), will never be subject to liens or to expropriation for reasons of public utility, save
  by previous agreement with the Holy See, and will be exempt from taxes, whether ordinary or
  extraordinary, whether payable to the State or to any other body whatsoever."
  Source: `https://web.archive.org/web/20110813090725if_/http://www.vaticanstate.va/NR/rdonlyres/3F574885-EAD5-47E9-A547-C3717005E861/2528/LateranTreaty.pdf`
  (I downloaded the PDF and read Art. 10 through Art. 17 directly; pages 5–8 of the file.)
- **The distinction the page must carry:** Art. 15 grants *the immunities of the headquarters of
  diplomatic agents of foreign States* to a different and named list — Art. 13's basilicas, the first
  two paragraphs of Art. 14, the Palaces of the Dataria, the Cancelleria, Propaganda Fide in Piazza di
  Spagna, the Holy Office, the Convertendi, the Vicariate. **The Clergy Retreat House of Sts John and
  Paul is not on that list.** Art. 16 gives it tax and expropriation exemption and nothing more. So
  the page may say: it stands in Celio, on Italian soil, named in Art. 16 of the 1929 Treaty as exempt
  from liens, expropriation and taxes. It may **not** say extraterritorial, may not say "in the
  Vatican", may not say diplomatic immunity.
- This aligns with `docs/rome/scope-vatican-and-extraterritorial.md`, which independently records the
  same three-tier reading and the same Art. 16 list.
- Caveat for the verifier: I could not find a working official website for the retreat house itself,
  and the Passionist generalate at the same address does not publish one that resolved for me. If a
  record ships, its factual content is the Treaty text plus its location — nothing about current use,
  hours or bookings, because I have no source for those.

**11. Case Romane del Celio** — kind: `museum` or `historic-site`. Clivo di Scauro.
- Boundary: OSM node 2184077390 at 41.886408,12.491875; poly Celio, nom Celio (road Clivo di Scauro).
- `https://www.turismoroma.it/it/luoghi/case-romane-del-celio`: beneath the Basilica dei Santi
  Giovanni e Paolo; access from the Clivo di Scauro, "antica strada romana e asse principale del
  Celio, che ha conservato parte del suo tracciato originario"; the domus were discovered in 1887 by
  Padre Germano di San Stanislao, then rector of the basilica; "venti ambienti ipogei splendidamente
  affrescati, datati tra il I e il IV secolo", developing from a two-level domus with a private
  *balneum* of the early second century, through an insula with street-level *tabernae* of the early
  third century, to a luxurious domus of the late third to early fourth, to a *titulus* of the mid
  fourth century.
  Hours: "Da lunedì a domenica e festivi dalle 10.00 alle 16.00. La biglietteria chiude un'ora prima."
  Booking: Coopculture 06 39967755. Official site given as `www.caseromanedelcelio.it`.
- **`https://www.caseromane.it/` fails TLS certificate validation from this network** and
  `https://www.coopculture.it/it/luoghi/case-romane-del-celio/` renders as an empty JavaScript shell
  with none of the venue's content. So the hours above are Roma Capitale's republication of the
  venue's own, not the venue's site read directly. The verifier should decide whether that is enough
  for an hours field.
  - **DO NOT USE: "uno dei complessi residenziali di età romana meglio conservati giunti fino a noi"**
    from the SS Giovanni e Paolo page. Superlative.

**12. Clivo di Scauro** — kind: `historic-site`. The ancient street, arched over by the basilica's
buttresses, running from Piazza dei Santi Giovanni e Paolo down towards San Gregorio.
- it.wikipedia's Celio article lists it under both "Siti archeologici" and "Odonomastica" as
  reviving the ancient *Clivus Scauri*. Roma Capitale describes it as "antica strada romana e asse
  principale del Celio, che ha conservato parte del suo tracciato originario"
  (`https://www.turismoroma.it/it/luoghi/case-romane-del-celio`). Nominatim returns
  `road = Clivo di Scauro`, `quarter = Celio` for both the basilica and the Case Romane.
- Thin as its own record. I found no dedicated Roma Capitale or Sovrintendenza page for the street.
  Flagging it because it is the physical spine of this whole cluster and a guide would name it; the
  verifier may fold it into the basilica record.

### 3.4 San Gregorio al Celio

**13. Chiesa di San Gregorio al Celio** — kind: `historic-site`. Piazza di San Gregorio, 1.
- Boundary: 41.886007,12.490302 → poly Celio, nom Celio, road Piazza di San Gregorio.
- `https://www.turismoroma.it/it/luoghi/chiesa-di-san-gregorio-al-celio-e-oratori-di-santandrea-santa-silvia-e-santa-barbara`:
  founded 575 AD by Gregory himself, who turned his family house into a monastery; Gregory came from
  the Anicii and had been *Praefectus Urbis*; only the thirteenth-century Cosmatesque pavement
  survives of the medieval building; granted in 1573 to the Camaldolese, who still serve it; the
  staircase and the square in front were rebuilt for the Jubilee of 1600; in 1633 Cardinal Scipione
  Borghese gave Giovanni Battista Soria the atrium and façade, which carry the Borghese eagle and
  dragons; the portico holds the tomb of Sir Edward Carne, sent to Rome by Henry VIII in 1561 over
  the divorce from Catherine of Aragon; interior with three naves on 16 antique columns, baroque
  after Francesco Ferrari's 1725 work; a small chapel off the right aisle holds Gregory's marble
  episcopal seat, of the first century BC; the Cappella Salviati, by Francesco da Volterra and
  completed by Carlo Maderno in 1600, holds the "Madonna con Bambino" fresco.
  Hours field on that page reads only "Orari delle Sante Messe". Tel 06 7008227 (community); site
  given as `www.monasterosangregorio.it` — **I did not fetch that domain; treat it as unverified.**

**14. Oratori di Sant'Andrea, Santa Silvia e Santa Barbara al Celio** — kind: `historic-site`.
Three free-standing chapels in the garden beside the church. OSM ways 134473677, 134473733,
134473679 at 41.886065/41.886173/41.885954, all inside the Celio polygon.
- Same Roma Capitale page: the Cappella di Sant'Andrea in the centre holds frescoes by Domenichino
  and Guido Reni; Reni also painted the apse "Concerto degli Angeli" of the Cappella di Santa Silvia;
  the Cappella di Santa Barbara contains the "Triclinio", the marble table at which Gregory served
  lunch to twelve poor men, "in memoria di questo fatto, ogni Giovedì Santo, fino al 1870, il papa
  serviva qui il pranzo a tredici poveri."

**15. Parco di San Gregorio al Celio** — kind: `park`. Entrance Salita di S. Gregorio 3.
- **SC `Dove si trova: Municipio I, Rione XIX - Celio`** —
  `https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/passeggiate_parchi_e_giardini/parco_di_s_gregorio_al_celio`.
  Also on that page: "Epoca: XX - XXI secolo"; "Estensione: 1,9 ettari"; formed out of the monastery's
  old kitchen garden on the western slope of the Caelian; bounded east by Villa Celimontana, south by
  the Semenzaio Comunale, west by via Valle delle Camene, north by the conventual complex of SS.
  Andrea e Gregorio Magno; reached by a stair from the salita di S. Gregorio lined with olives; the
  original settlement relates to the palace or villa of Gordianus, father of Gregory the Great, which
  Gregory turned into a hermitage around 580; the first monastery had, besides the church and the
  oratory to St Andrew, a library, a guest house, a granary and a stable; passed to Greek Basilian
  monks in the eighth century, back to the Benedictines in the first half of the tenth, and
  definitively to the Camaldolese in 1573; surviving service buildings include a medieval house
  restructured in the late fifteenth century, a small casale near the Cappella Salviati now the park
  keeper's lodge, and an "ex-vaccheria" towards the Semenzaio.
- OSM way 120955577, centroid 41.884331,12.491239, poly Celio.

**16. Fontana di via di San Gregorio** — kind: `historic-site`. Via di San Gregorio.
- **SC `Rione: Celio`** —
  `https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_in_via_di_s_gregorio`:
  "Autore: Antonio Muñoz. Datazione: 1933. Materiali: marmo bianco, serpentino, travertino,
  peperino." Set into the retaining wall of the Antiquarium on the slope of the Caelian, framed by
  two massive brick propylaea; the vertical element is a marble "saracinesca" over which water runs
  as a cascade into a rectangular serpentine basin with recesses on two sides; three travertine
  steps, travertine corner posts; on the back wall two marble tablets originally carrying fasces,
  later chiselled off, and S.P.Q.R. in relief capitals. Part of the wider rearrangement that
  accompanied the reopening of the Antiquarium in 1929 and the widening of the road — then via dei
  Trionfi, now via di S. Gregorio — from the Arch of Constantine to piazzale di Porta Capena, under
  the 1931 master plan.
- Roma Capitale duplicates it at `https://www.turismoroma.it/it/luoghi/fontana-di-di-san-gregorio`,
  poly Celio at 41.887795,12.490268.

### 3.5 Villa Celimontana and Piazza della Navicella

**17. Villa Celimontana** — kind: `park`. Entrances via della Navicella and piazza SS. Giovanni e
Paolo.
- Boundary: OSM relation **1825719** (`alt_name=Villa Mattei`, `wikidata=Q3558489`), **87 of 87
  vertices in Celio**, centroid 41.884876,12.494231 → Celio; nom Celio. **SC `Dove si trova:
  Municipio I, Rione XIX - Celio`.**
- `https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/ville_dei_nobili/villa_celimontana`:
  "Epoca: XVI-XIX secolo"; "Estensione: 110.000 mq"; what remains of the Mattei garden on the
  Caelian, built in the last decades of the sixteenth century; the land, around Santa Maria in
  Domnica, was bought in the mid-1500s by Giacomo Mattei and given in dowry to his daughter Claudia,
  wife and cousin of Ciriaco Mattei, who transformed the vineyard into a garden of statues and
  fountains; work probably began 1572, the casino from after 1577 and probably finished by 1581,
  traditionally begun by Jacopo Del Duca, a pupil of Michelangelo; the hanging garden and the
  "teatro" laid out as an antique circus with a tiered hemicycle, with the Egyptian obelisk granted
  by the Comune's Consiglio Segreto to Ciriaco Mattei as its spina; the villa stayed with the Mattei
  until the male line died out in the early nineteenth century; "nel 1926 la palazzina Mattei venne
  consegnata al suo definitivo assegnatario, la Regia Società Geografica Italiana mentre il parco fu
  destinato a verde pubblico e nel 1928 aperto alla cittadinanza."
- `https://www.turismoroma.it/it/luoghi/villa-celimontana`: the villa covers a Flavian and Trajanic
  site with partly visible enclosure walls; the *castra* of the fifth cohort of the Vigiles stood
  here; excavations of the late 1800s brought up the Basilica Hilariana; the obelisk of Ramesses II
  came from the Temple of the Sun at Heliopolis and in Roman times stood in the sanctuary of Isis
  Capitolina, and was given by the Senate to Ciriaco Mattei in 1582; bought by the state in 1915 and
  ceded in 1925 to the Comune, which opened the park.
  Hours: "Aperta dall'alba al tramonto, approssimativamente: Dal 1 maggio al 31 ottobre dalle 7.00
  alle 18.00; Dal 1 novembre al 30 aprile dalle 7.00 alle 17.00."
- Note a genuine source conflict for the verifier: the Sovrintendenza says the park opened to the
  public in **1928**; Roma Capitale's tourism page says it was ceded to the Comune in **1925** and
  the Comune opened it, without a year. Not contradictory, but don't merge them into one date.
- OSM tags an `architect=Pierre Charles L'Enfant` on the relation. **No source I fetched supports
  that.** Do not publish it.

**18. Palazzetto Mattei in Villa Celimontana / Società Geografica Italiana** — kind: `historic-site`.
Via della Navicella, 12. Poly Celio (41.884490,12.495720).
- `https://www.turismoroma.it/it/luoghi/palazzetto-mattei-villa-celimontana`: built to a design by
  Jacopo Del Duca for Ciriaco Mattei, who commissioned the architect in 1580 for the building and the
  first laying out of the park; has housed the Società Geografica Italiana, founded in Florence in
  1867, since 1926; Ciriaco's son Gian Battista turned the Palazzetto from a home for the collection
  into a private residence and extended the gardens, with Francesco Peparelli finishing the work in
  1623 — the Library frescoes on mythological subjects, by Pietro Sigismondi, Orazio Monaldi and
  Orazio Zecca, date from then; the library holds about 400,000 volumes on geography and allied
  disciplines with a rare-books section from the sixteenth to nineteenth centuries; the Cartoteca
  holds about 200,000 maps, including a collection of Chinese and Japanese maps of the eighteenth and
  nineteenth centuries, mostly manuscript; a Historical Archive of letters, travel notebooks and
  explorers' drawings, and a Photographic Archive of about 400,000 phototypes; a third-century Roman
  mosaic found in front of the building during nineteenth-century restoration is displayed inside.
  - **DO NOT USE: "nel suo genere è la più importante d'Italia e tra le maggiori d'Europa"** about
    the library. Superlative, and attribution does not save it.
- **19. Museo della Società Geografica Italiana** is a *separate* turismoroma record,
  `https://www.turismoroma.it/it/luoghi/museo-della-societ%C3%A0-geografica-italiana`, address Via
  della Navicella 12, poly Celio — but its entire body text reads "La raccolta museale è stata
  collocata presso il Museo delle Civiltà - Museo preistorico etnografico 'Luigi Pigorini'" and its
  hours field reads "Chiuso". **The museum collection has moved out of Celio.** Record it as a
  negative: a guide should not send anyone here for a museum. I recommend against shipping it as a
  place; if it ships, `status` must say the collection is no longer here and the prose must agree.

**20. Obelisco Mattejano (Obelisco Capitolino)** — kind: `historic-site`. In the Villa Celimontana
garden. Poly Celio (41.887964,12.494977 on the turismoroma point; OSM node 260770350 at
41.883389,12.495335 also poly Celio — the two geocodes differ by ~500 m, both inside).
- `https://www.turismoroma.it/it/luoghi/obelisco-mattejano-o-capitolino`: twin of the one in piazza
  della Rotonda; originally 7 m, only the upper ~3 m survives, carrying the titles of Ramesses II;
  the fragment was found near the ruins of the temple of Isis and the lower part was never recovered;
  crowned by a bronze ball said by some to have held the ashes of Octavian; first set beside the
  stair up to the convent of Santa Maria in Aracoeli on the Campidoglio, presumably in the fourteenth
  century, where four lions at the corners of the base supported the shaft; it fell, was carried off
  and forgotten; Ciriaco Mattei rediscovered it at the end of the 1500s, had it given to him by the
  Comune and set it in his villa; his heirs left villa and obelisk neglected and the next owner,
  Manuel de Godoy, formerly Spanish first minister in the Napoleonic period, saw to its conservation.
  - **DO NOT USE: "è l'unico a Roma a non essere collocato in una pubblica piazza."** That is a
    uniqueness claim of exactly the kind the wave bans, and Rome has no reachable register against
    which to check it. Say instead that it stands in the garden of Villa Celimontana.

**21. Ninfeo dell'Uccelliera di Villa Celimontana** — kind: `historic-site`. **Closed to the public.**
Poly Celio (41.883422,12.496515).
- `https://www.turismoroma.it/it/luoghi/ninfeo-delluccelliera-di-villa-celimontana`: an underground
  chamber of the late sixteenth century, one of the few surviving elements of the villa's original
  layout; it lay beneath the aviary — the *uccelliera* — from which it takes its name, which stood to
  the right of the casino nobile until it was destroyed in the eighteenth century; built during work
  on the western slopes between 1585 and 1590; a stair rises from the avenue between landings paved in
  polychrome mosaic showing an eagle, the Mattei heraldic device; the apsed nymphaeum has a lower band
  faced in "tartari" — marble chips, pumice cubes and calcareous concretions set as mosaic in
  geometric modules — and an upper zone of coloured plaster with multicoloured marble fragments and
  groups of shells; grotesque figures in the central zone; masonry seats faced in peperino run round
  the apse; in 1613 "tale 'Battista scultore'" made a triton on a sea horse for a fountain here,
  removed in the eighteenth century when the nymphaeum became a shaded resting place.
  Hours field: "Chiuso al pubblico." The `status` must match.

**22. Fontana del Fiume a Villa Celimontana** — kind: `historic-site`. Poly Celio (41.884458,
12.495860).
- `https://www.turismoroma.it/it/luoghi/fontana-del-fiume-villa-celimontana`: seventeenth century,
  commissioned by Ciriaco Mattei; an elliptical basin backed by a masonry architectural screen with
  two open niches; surmounted by a semi-reclining marble statue, possibly a personification of the
  river Nera, holding a skin from which the water flows; "La testa della statua, rubata nel 2005, è
  stata recuperata e rimessa al suo posto nel 2007."

**23. Basilica di Santa Maria in Domnica alla Navicella** — kind: `historic-site`. Via della
Navicella, 10.
- Boundary: OSM way 135618144 (`wikidata=Q2060055`), **32 of 32 vertices in Celio**, centroid
  41.884694,12.495413 → Celio; nom Celio.
- `https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-domnica-alla-navicella`: an ancient
  diaconia probably founded in the seventh century on the Roman remains of the barracks of the fifth
  cohort of the Vigiles; the epithet "in Domnica" is of uncertain origin — possibly from the name
  Ciriaca, from *dominicum* for early Christian places of worship, or from the *praedia dominica*;
  its present appearance is largely due to Paschal I, who rebuilt it from the foundations in the
  ninth century and decorated it with the apse mosaics; between 1513 and 1514 the titular cardinal
  Giovanni de' Medici, the future Leo X, had the façade rebuilt to a design by Andrea Sansovino, who
  also designed the five-arched portico on piers and Tuscan pilasters with lion protomes alluding to
  the pope's chosen name; the campanile on the right flank keeps a thirteenth-century bell; basilican
  plan, three naves on 18 antique granite columns with Corinthian capitals; the coffered wooden
  ceiling was made in 1565–1566 for Cardinal Ferdinando de' Medici, with a heraldic frieze below
  designed by Giulio Romano; the apse mosaic commissioned by Paschal I, who appears at the Virgin's
  feet among ranks of angels; the frescoes below the mosaic are seventeenth century.
  - **DO NOT USE: "uno dei migliori esempi della cosiddetta 'rinascenza carolingia' a Roma"** and
    "una delle poche a Roma che sia sfuggita alle ricorrenti rifusioni" about the bell. Both rank.
    The bell fact is publishable as a date — a thirteenth-century bell — without the "one of the few".
- Parish site `https://www.santamariaindomnica.it/`: Mass times "Lun - Ven 19:00; Sab 19:00; Dom.
  11:00 - 19:00". Ceremonies office tel 06 84384209 (per Roma Capitale).

**24. Fontana della Navicella** — kind: `historic-site`. Piazza della Navicella, in front of Santa
Maria in Domnica.
- **SC `Rione: Celio`** —
  `https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_della_navicella`:
  "Autore: Andrea Sansovino (attr.). Datazione: 1931. Materiali: marmo bianco, travertino." The first
  mention of a "navicella" is 1484 (Pomponio Leto) and refers to an earlier sculpture, perhaps Roman;
  the present sculpture was made in 1518–1519 for Cardinal Giovanni de' Medici, presumably by
  Sansovino, who had restored the church for the same cardinal in 1513–1514; "Riadattata a fontana
  nel 1931, in occasione dei lavori per l'allargamento della via, è stato mutato anche il suo
  orientamento… ed è stato realizzato alla base un basso bacino ellittico"; the ship is white marble
  on a marble base carrying the Medici arms on the short faces; an animal protome is carved on the
  prow; the floor of the basin is a river-pebble mosaic with fish and boats. Restored 2003–2004; "Nel
  settembre del 2005 un grave atto vandalico ha provocato il distacco e l'asportazione della protome
  animale"; the recovered pieces were reassembled.
- Roma Capitale, `https://www.turismoroma.it/it/luoghi/fontana-della-navicella`, adds: carved in
  travertine and white marble as a Roman galley, resting on two thole-pins; the deck has a handrail on
  nine corbels alternating with nine hatches; the prow protome is a boar's head; the stern carries the
  castle; from 1931 fed from a secondary branch of the Acqua Felice; a legend has the little ship as
  an ex-voto to Isis from sailors of the nearby *Castra Peregrinorum* or the *Castra Misenantium*, the
  Misenum fleet sailors quartered on the Caelian who worked the Colosseum's *velarium*; the prow now
  faces the historic centre with the sides parallel to the church portico, where it once stood with the
  stern towards the portico.
- Note the two official sources disagree on the protome: Sovrintendenza says only "una protome
  animale", Roma Capitale says a boar's head. Use the more specific one with attribution, or neither.

**25. Basilica Hilariana** — kind: `historic-site`. Largo della Sanità Militare, inside the grounds of
the Policlinico Militare del Celio.
- Boundary: OSM node 2674141008 at 41.885820,12.496624 and turismoroma's point 41.886152,12.495681 —
  poly Celio and nom Celio (road Piazza Celimontana) for both.
- `https://www.turismoroma.it/it/luoghi/basilica-hilariana-al-celio`: mid second century AD;
  discovered at the end of the 1800s and largely excavated in the following century; identified as a
  place of worship of Cybele and Attis and the seat of the religious college of the *dendrophori*;
  an inscription on a statue base and a portrait head found inside show it was built by Manius
  Publicius Hilarus, a wealthy pearl merchant and follower of the cult of Cybele; a central courtyard
  preceded by an entrance vestibule giving on to further rooms, with an upper floor no longer
  standing; the vestibule mosaic shows animals round a human eye pierced by a lance, apotropaic in
  function; in the third century a shrine was built for the pine sacred to Attis, the *Arbor Sancta*;
  from the fourth century some service rooms were given over to production; abandoned between the
  fifth and sixth centuries.
  The page's website field points to `www.soprintendenzaspecialeroma.it` — I did not fetch it.
- **26. Policlinico Militare Celio** is the enclosing military hospital, built 1885–1891 to designs by
  Salvatore Bianchi and Luigi Durand de la Penne per it.wikipedia's Celio article. Poly Celio
  (41.885515,12.496280). I found **no official Ministry of Defence page** for it and no visiting
  arrangements. It is context for the Basilica Hilariana, not a visitable place. **Recommend not
  shipping** as its own record.

### 3.6 San Tommaso in Formis and the Arch of Dolabella

**27. Chiesa di San Tommaso in Formis** — kind: `historic-site`. Via di San Paolo della Croce, 10.
- Boundary: OSM way 202879042 (`wikidata=Q3585386`), **5 of 5 vertices in Celio**, centroid
  41.885387,12.494683 → Celio; nom Celio.
- `https://www.turismoroma.it/it/luoghi/chiesa-di-san-tommaso-formis`: dedicated to St Thomas the
  Apostle; "L'appellativo 'in Formis' deriva dal nome latino dell'Acquedotto Claudio – forma Claudia –
  sulle cui cisterne fu costruita"; bound up with the Order of the Most Holy Trinity and its founder
  John of Matha, who spent his last years probably in the cell behind the little window above the Arch
  of Dolabella and Silanus and died 17 December 1213; his remains were first entombed in a marble
  mausoleum in the church and moved to Spain in 1655; the church was built around the tenth century as
  the abbey church of a Benedictine monastery, though the date cannot be fixed because the written
  record was destroyed; the first attestations are of 1209, when Innocent III gave the existing
  monastery to the Trinitarians, who made it their seat and adapted part as a hospital for the poor,
  the sick, pilgrims and slaves ransomed by the order; around 1380, under Urban VI, the order had to
  leave Rome for supporting the antipope Clement VII, and the Vatican Chapter took the complex, closing
  the hospital; in 1532 the church was restored using material from the neighbouring hospital to save
  money; in 1571 Pius V returned church and remains of hospital and monastery to the Trinitarians, who
  lost them again at his death months later; restoration in 1663 gave the church its façade with a
  portal under a triangular tympanum inscribed "DIVO THOMAE APOST(OLO) D(ICATUM)"; the complex went
  back to the Trinitarians in 1898 and the church reopened for worship in 1926, the hospital by then
  demolished. Order's site given as `www.trinitari.org`; tel 06 35420529 / 06 52725090. Visits and
  Mass times through the Curia Generalizia of the Order.
- The mosaic over the door — Christ between two freed slaves, one white and one black, the Trinitarian
  emblem — is mapped separately in OSM as node 4929711022 "Mosaico del Cristo con due schiavi",
  41.885391,12.495403, poly Celio. I found no dedicated official page for it; it belongs inside the
  church record.

**28. Arco di Dolabella e Silano (Porta Caelimontana)** — kind: `historic-site`. Via di San Paolo
della Croce. Poly Celio (41.885665,12.494900 and OSM way 135618677 at 41.885608,12.495177); nom Celio.
- `https://www.turismoroma.it/it/luoghi/arco-di-dolabella-e-silano`: a gate of the Servian Walls,
  rebuilt by Augustus and identifiable with the Porta Caelimontana; later used to carry Nero's
  aqueduct; built at the start of the first century AD by the consuls Dolabella and Silanus, per the
  inscription on the attic: "P. CORNELIS P. F. DOLABELLA C. IUNIUS C. F. SILANUS FLAMEN MARTIAL(is)
  CO(n)S(ules) EX S(enatus) C(onsulto) FACIUNDUM CURAVERUNT IDEMQUE PROBAVER(unt)"; rebuilt with
  travertine blocks over the original tufa blocks, still visible in the right-hand wall; "l'arco misura
  4 metri in ampiezza e 6,56 metri in altezza, ma una parte è attualmente interrata"; tradition places
  John of Matha in the room above it from 1209 until his death in 1213. The page is tagged
  `Rione XIX - Celio`.
  - **DO NOT USE: "l'unica altra porta che ancora si apre nelle Mura Serviane"** (with the Arch of
    Gallienus). Uniqueness claim; Arco di Gallieno is in Esquilino and not mine to reason about.
  - Also from this page, and safe: "Anticamente, il colle Celio… era chiamato Mons Querquetulanus,
    perché ricoperto interamente di querce." Good rione-page opening.

### 3.7 Santi Quattro Coronati

**29. Basilica e Complesso dei Santi Quattro Coronati** — kind: `historic-site`. Via dei Santi
Quattro, 20.
- Boundary: OSM way 202880841 (`basilica=minor`, `wikidata=Q1536044`), **16 of 16 vertices in Celio**,
  centroid 41.888243,12.498002 → Celio; nom Celio, road Via dei Querceti. it.wikipedia's Celio article
  lists it under the rione's religious architecture.
- `https://www.turismoroma.it/it/luoghi/basilica-e-complesso-dei-santi-quattro-coronati`: founded in
  the mid fifth century AD on the remains of a Roman domus; named from the tradition of the martyrdom
  of four Roman soldiers and five stonemasons; entirely rebuilt after the fire that devastated the city
  in 1084; at the start of the thirteenth century the monks' cells, the cloister and the fortified
  cardinal's palace were added, its entrance dominated by the Torre Maggiore; decline set in with the
  move of the papacy to Avignon and lasted until 1564, when Pius IV turned the complex into the
  Conservatorio delle Zitelle, a girls' orphanage, for the enclosed Augustinian nuns "che vi abitano
  da oltre 450 anni"; interior of three naves under matronea on columns from imperial monuments;
  original Cosmatesque pavement of large marble and porphyry discs and polychrome mosaic; the apse
  spans all three naves, covering the width of the first basilica's nave, frescoed by Giovanni da San
  Giovanni with the story of the Coronati; from the Stanza del Calendario, the antechamber to the nuns'
  parlour with a thirteenth-century fresco, one reaches the Cappella di San Silvestro, the cardinal's
  palace oratory, with the Stories of Pope Sylvester including the Donation of Constantine; "Nel 1996,
  durante un intervento di routine venne alla luce… Nascosti da quasi ottocento anni sotto sette strati
  di intonaco azzurro, si mostrarono allo sguardo dei restauratori 300 metri quadrati di straordinari
  affreschi che rivestivano le pareti e le volte della Sala Gotica, forse l'aula di giustizia di un
  tribunale ecclesiastico"; the profane scenes are by the Terzo Maestro di Anagni.
  - **DO NOT USE: "uno dei monumenti più imponenti", "una delle basiliche più importanti della Roma
    carolingia", "Unico esempio a Roma" of the apse, "il più raro esempio di arte gotica a Roma".**
    Four separate superlatives on one page. The 1996 discovery, the 800 years, the seven layers of
    blue plaster and the 300 m² are all counts and all publishable.
  - Hours: "L'ORATORIO di SAN SILVESTRO è visitabile dal lunedì al sabato dalle ore 09.30 alle ore
    12.00. L'APERTURA POMERIDIANA dal lunedì alla domenica dalle ore 16:00 alle ore 17:30 NON È
    GARANTITA." Tel 06 70475427.
- Monastery's own site `https://monacheagostinianesantiquattrocoronati.it/`: address "Monastero
  Agostiniano via dei Santi Quattro, 20 00184 ROMA"; summer prayer timetable — weekdays 07.45 Lauds,
  08.30 Terce, 18.30 Vespers, 19.00 Mass; Saturday 07.45 Mass with Lauds, 18.00 Rosary and Vespers;
  Sundays and solemnities 08.00 Lauds, 08.45 Terce, 10.45 Sext, 11.00 Mass, 18.00 Vespers and
  Eucharistic Adoration. Note this is explicitly "Nuovi orari per il periodo estivo" — seasonal, and
  a record that publishes it must say so.

**30. Aula Gotica dei Santi Quattro Coronati** — kind: `historic-site` (or `attraction`; OSM tags it
`tourism=attraction`, node 12484449287 at 41.888401,12.498561, poly Celio).
- Dedicated official site `https://www.aulagoticasantiquattrocoronati.it/` publishes the 2026 opening
  dates and the booking arrangement in full: open Fri 23 and Sat 24 January; Fri 6 and Sat 7 February;
  Fri 24 and Sat 25 April; Tue 12 and Wed 13 May; Fri 12 and Sat 13 June; Fri 18 and Sat 19 September;
  Fri 23 and Sat 24 October; Fri 13 and Sat 14 November 2026. Entry times on each of those days:
  09:00, 10:00, 11:00, 12:00, 13:00, 15:00, 16:00, 17:00, 18:00. Booking by email to
  `archeocontesti@gmail.com`, leaving a phone contact. "Vi ricordiamo che durante le aperture al
  pubblico dell'Aula Gotica sarà possibile visitare il Chiostro duecentesco e l'Oratorio di San
  Silvestro con orario 9:30 – 14:00 e 15:00-17:45. Per l'accesso è gradito il pagamento di
  un'offerta."
- This is the best-documented opening schedule of anything in the rione and a real find — the hours
  are on a dedicated official domain, not an aggregator.

**31. Oratorio di San Silvestro** and **32. Chiostro dei Santi Quattro Coronati** — kind:
`historic-site`. Both inside the complex; OSM node 13240961337 ("Cappella di San Silvestro")
41.888295,12.498596, poly Celio. Sourced by the two pages above. The verifier may prefer one
combined complex record; I am listing them because they have distinct opening arrangements.

### 3.8 The southern lobe — Via di Porta San Sebastiano and Porta Latina

This is the part of Celio a first pass misses. The rione runs south inside the Aurelian Walls along
the urban stretch of the Appian Way.

**33. Sepolcro degli Scipioni** — kind: `historic-site`. Via di Porta San Sebastiano, 9.
- Boundary: OSM way 254710670 (`wikidata=Q1540716`), **5 of 5 vertices in Celio**, centroid
  41.875958,12.500490 → Celio; nom Celio, road "Via di Porta San Sebastiano 9". (Roma Capitale's
  own geocode for this record, 41.877593,12.498670, falls in San Saba — it is a street-level
  approximation, not the monument. Trust the footprint.)
- `https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/sepolcro_degli_scipioni`: the
  archaeological area lies along the urban stretch of the via Appia Antica, inside the Aurelian
  Walls, before Porta S. Sebastiano; the first notice of discovery is 1614, the real discovery 1780,
  when the Sassi brothers, priests who owned the vineyard above, found an entrance while enlarging
  their cellar; everything inscribed or figured went to the Vatican Museums; between 1926 and 1929
  the Comune ran a campaign of excavation, restoration and arrangement to open the area, including
  laying out the Parco degli Scipioni behind it towards the via Latina; the monumental tomb was built
  in the first decades of the third century BC by Lucius Cornelius Scipio Barbatus, consul of 298 BC,
  whose sarcophagus stood facing the entrance; the via Appia had been inaugurated in 312 BC.
- `https://www.turismoroma.it/it/luoghi/area-archeologica-del-sepolcro-degli-scipioni` adds the
  structure — quadrangular plan, a monumental entrance now almost entirely gone, six galleries cut in
  the tufa with sarcophagi along the walls or in niches, each with an inscription — and the access
  rules: "L'ingresso al monumento è consentito a gruppi e associazioni, con guida propria, che devono
  provvedere alla prenotazione allo 060608 (tutti i giorni, ore 9.00-19.00). Max 12 persone a visita."
  Individual visits by booking on 060608 to a published calendar.

**34. Parco degli Scipioni** — kind: `park`. Entrances via di Porta Latina 10 and via di Porta San
Sebastiano (the latter closed).
- Boundary: OSM relation **13502366**, **22 of 22 vertices in Celio**, centroid 41.876404,12.501361 →
  Celio; nom Celio. **SC `Dove si trova: Municipio I, Rione XIX - Celio`.**
- `https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/passeggiate_parchi_e_giardini/parco_degli_scipioni`:
  "Epoca: 1928-1931"; "Estensione: 16.000 mq"; "Ingressi: via di Porta Latina 10, via di Porta San
  Sebastiano (attualmente chiuso)"; the area lies between the ancient via Latina and via Appia (now
  via di Porta San Sebastiano) inside the Aurelian circuit; the result of an archaeological
  arrangement recovering the Colombario di Pomponio Hylas and the Sepolcro degli Scipioni; a long
  central avenue from the via di Porta Latina entrance crosses the park; tall pines and cypresses and
  Mediterranean planting — holm oak, laurel, myrtle — flank the remains; the garden was designed by
  Raffaele de Vico, who finished in 1931; from the seventeenth century the area was vineyards and
  kitchen gardens; in 1831 Pietro Campana discovered the Colombario di Pomponio Hylas; from 1840
  three columbaria were uncovered in the adjoining Vigna Codini; the Comune bought the archaeological
  zone after unification and the X Ripartizione Antichità e Belle Arti began the full restoration of
  the Sepolcro in 1926.
  Hours per Roma Capitale: "Aperto dall'alba al tramonto."

**35. Colombario di Pomponio Hylas** — kind: `historic-site`. Via di Porta Latina, 14 (Roma Capitale
gives 10; OSM's `addr:housenumber` on the footprint gives 14 — flag the discrepancy).
- Boundary: OSM way 254710624 (`wikidata=Q2984560`), **5 of 5 vertices in Celio**, centroid
  41.876400,12.502142 → Celio; nom Celio, road "Via di Porta Latina 14".
  **SC `Rione: XIX - Celio`.** Three-way agreement.
- `https://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/colombario_di_pomponio_hylas`:
  on a side road off the ancient via Latina, discovered in 1831 by the Marchese Pietro Campana;
  named from the freedman Pomponius Hylas, whose funerary inscription — a tablet in glass-paste
  mosaic — is above the stair down to the burial chamber; other inscriptions place the construction
  "tra il principato di Tiberio e quello di Claudio (14-51 d.C.)", with continued use in the Flavian
  period (69–96), when the Hylas mosaic and some decorative changes are dated, down to the Antonine
  age (138–161); a steep stair leads into a rectangular room under a vault finely decorated with
  plant motifs; niches for the ash-jars sit in small aedicular structures with colonnettes and
  tympana, painted and stuccoed; in the central aedicule of the end wall two figures are painted,
  probably the tomb's founders, named on the marble tablet below as Granius Nestor and Vinileia
  Hedone; the figurative programme centres on Orpheus.
  - **Access status: "A partire dal 01/08/2024 il sito sarà temporaneamente chiuso al pubblico per
    l'avvio delle lavorazioni previste dal PNRR."** Roma Capitale's page repeats it: "Sito
    temporaneamente chiuso al pubblico per le lavorazioni previste dal PNRR." A shipping record must
    say it is closed, and `status` must agree.
  - Tariffs published on the same page for when it reopens: "Intero: € 4,00; Ridotto: € 3,00";
    free for residents of Rome and the metropolitan area on production of proof of residence, and for
    MIC card holders; groups accompanied, max 7 per visit, booking obligatory on 060608, 09.00–19.00.

**36. Basilica di San Giovanni a Porta Latina** — kind: `historic-site`. Via di Porta Latina, 17.
- Boundary: OSM way 27030110 (`wikidata=Q592799`), **18 of 18 vertices in Celio**, centroid
  41.877195,12.502001 → Celio; nom Celio.
- `https://www.turismoroma.it/it/luoghi/basilica-di-san-giovanni-porta-latina`: preceded by a
  forecourt shaded by a large cedar; probably founded in the fifth century, as roof tiles with
  Theodoric-period stamps seem to attest; rebuilt at the end of the eighth century and restored in
  1191; dedicated to John the Evangelist, who by tradition survived the attempted martyrdom in
  boiling oil near the Porta Latina; five-arched portico, inside which the original Borrominian
  finial of San Giovanni in Oleo is kept; twelfth-century Romanesque campanile on the left, square,
  of five orders, with triple-light openings on colonnettes in the upper three; a ninth-century
  well in the courtyard flanked by two columns with fourth-century capitals, inscribed round the mouth
  with the baptismal formula and "EGO STEFANUS"; interior of three naves on two rows of five columns
  of differing marble; "Il ciclo di affreschi del XII secolo che decorano la navata centrale,
  rinvenuti durante il restauro del 1940, raffigura 46 differenti scene del Vecchio e del Nuovo
  Testamento."
  - **DO NOT USE: "uno degli esempi più interessanti di pittura medievale a Roma."** Ranking.
- Official parish site `https://www.sangiovanniportalatina.it/`: "La Basilica è affidata alla cura
  pastorale dell'Istituto della Carità (Padri Rosminiani). La Basilica è aperta ogni giorno dalle
  06.30 alle 18.00." Summer Mass timetable: weekdays 07.30 in the college chapel; Saturday 07.30;
  Sundays and holy days of obligation 11.30. Address "Via di Porta Latina 17, Roma 00179"; tel
  0039 06.70475938; email `portalatina17@gmail.com`. Rector p. Laiju Francis, vice-rector
  p. Yesudasan Mariyan. The parish of record is SS. Salvatore e Santi Giovanni Battista ed Evangelista
  in Laterano.
  - This is a clean case: an official site establishes identity, address and opening hours. Publish
    from it. It establishes nothing about the frescoes; those come from Roma Capitale.

**37. Oratorio di San Giovanni in Oleo** — kind: `historic-site`. Via di Porta Latina, 77 (Roma
Capitale) — note OSM has no house number and it stands beside no. 17.
- Boundary: OSM way 205000678 (`wikidata=Q1814304`), **13 of 13 vertices in Celio**, centroid
  41.876609,12.502136 → Celio; nom Celio.
- `https://www.turismoroma.it/it/luoghi/chiesa-di-san-giovanni-oleo`: a small octagonal oratory built
  at the start of the sixteenth century, perhaps over an ancient pagan mausoleum whose circular form
  it echoes; the design is attributed variously to Bramante, Antonio da Sangallo the Younger or
  Baldassarre Peruzzi; built at the expense of the French prelate Benedetto Adam, recorded on one of
  the two doors with the motto "Au plaisir de Dieu"; in 1658 Cardinal Francesco Paolucci had it
  restored along with San Giovanni a Porta Latina, of which he was titular, and the work went to
  Francesco Borromini, who altered the covering with a drum, a tall stucco frieze and a conical roof
  ending in a sheaf of leaves under a globe decorated with roses, alluding to the Paolucci arms;
  "Nel 1967 la cuspide fu sostituita da un calco in gesso mentre l'originale fu posto sotto il portico
  della chiesa di San Giovanni a Porta Latina dove tuttora si trova"; the walls were decorated at the
  same time with stuccoes and frescoes attributed to Lazzaro Baldi.
  Access: "Visitabile su richiesta. Rivolgersi alla Chiesa di San Giovanni a Porta Latina."

**38. Parco Egerio** — kind: `park`. Piazzale Numa Pompilio / Largo Aurelia Sordi.
- Boundary: OSM way 190239965, **27 of 27 vertices in Celio**, centroid 41.880007,12.497945 → Celio;
  nom Celio.
- `https://www.turismoroma.it/it/luoghi/parco-egerio`: named because the legendary *lucus camenarum*,
  the Grove of the Camenae, stood on the Caelian slopes just outside the walls, with a spring in a
  grotto where by legend the nymph Egeria met Numa Pompilius; classical sources say that in the
  imperial period the grotto was given a monumental marble facing, to the scandal of contemporaries
  who missed the old grass and tufa; the present planting of lawns, tall trees and shrubs maintains
  the green backdrop of the hill as seen from the Appia Antica.

**39. Basilica di San Sisto Vecchio** — kind: `historic-site`. Piazzale Numa Pompilio, 8.
- Boundary: **this is the one I most expected to be San Saba and it is not.** OSM relation
  **13004277**, **22 of 22 vertices in Celio**, centroid 41.880651,12.495707 → Celio; nom Celio
  (road Viale delle Terme di Caracalla). The adjoining Chiostro di San Sisto Vecchio, OSM way
  202932390, is **6 of 6 in Celio**. Roma Capitale's own point for the church, 41.880039,12.494440,
  falls in San Saba — that is a piazzale-level geocode of an address on the boundary square, and the
  footprint overrules it. it.wikipedia's Celio article lists the basilica under the rione.
  **Still flagging it in §4 because the address is on the boundary piazzale and two of my three
  instruments' address-level geocodes disagree with the footprint.**
- `https://www.turismoroma.it/it/luoghi/chiesa-di-san-sisto-vecchio-appia`: the dedication to Pope
  Sixtus II, martyred in 258 near the catacombs of San Callisto, appears in a sixth-century document
  but the church had been built in the previous century; renewed under Innocent III and then entrusted
  to Dominic de Guzmán, who founded his first Roman convent here; the Dominicans left after two years,
  moving in 1220 to Santa Sabina, and Dominic used the monastery for his new order of enclosed
  Dominican nuns, largely drawn from the Tempoline of the nearby monastery of Santa Maria in Tempulo;
  church and monastery were restored again under Sixtus IV; at the end of the sixteenth century, the
  area being malarial, the nuns obtained a move to a new church in Rione Monti, and from then San
  Sisto was called Vecchio to distinguish it from Santi Domenico e Sisto, called Sisto Nuovo; in the
  eighteenth century Benedict XIII had the ruinous complex rebuilt by Filippo Raguzzini, who put up
  the present façade and a new cloister; since the end of the 1800s the complex has been run by the
  Congregation of Dominican Sisters founded by Suor Maria Antonia Lalia and houses a private school;
  the interior, once of three naves, is now a single nave decorated in stucco, keeping remains of a
  late-thirteenth-century fresco cycle between the thirteenth-century apse and the narrower
  fifteenth-century one; twelfth-century campanile; the cloister galleries are painted with Stories
  of the Life of St Dominic by Andrea Casale in the eighteenth century.
  - **DO NOT USE: "tra i più eleganti della città" about the campanile, and "Assolutamente da non
    perdere".** Ranking and instruction.
  - Hours: "La chiesa è aperta tutti i giorni dalle ore 9.00 alle ore 12.00 e il pomeriggio dalle ore
    16.00 alle ore 18.00. Gli orari possono essere soggetti a variazioni, pertanto si consiglia di
    contattare sempre la basilica." Tel 06 77205177. Site given as
    `https://www.casadelpellegrinosansisto.it/` — I did not fetch it.

**40. Semenzaio di San Sisto** — kind: `park` (not open to the public; see caveat). Via Druso, 2.
- Boundary: 41.881934,12.497450 → poly Celio, nom Celio, road Via Druso.
- `https://www.turismoroma.it/it/luoghi/semenzaio-di-san-sisto`: today the seat of the Servizio
  Giardini of Roma Capitale; the story begins in the early 1800s when Camille de Tournon was made
  prefect of Rome after the French occupation and had the idea of a *pépinière*, a nursery to grow
  the plants for Rome's new avenues and public parks, on the land of the monastery of San Sisto where
  enclosed Dominican nuns had lived since 1222; a watercourse entering Rome at Porta Metronia fed two
  water mills, the Mola di San Sisto Vecchio and the Molella, whose structures survive in part; when
  the French left in 1814 the papal government inherited 30,000 trees ready for transplanting; the
  nursery was restored in 1926 by the landscape architect Raffaele De Vico, who designed the iron and
  glass greenhouses and the Aranciera with its neoclassical façade; the azaleas that dress the Spanish
  Steps each April and May are grown here, along with orchids and carnivorous plants.
  - **Access: "Il Semenzaio non è aperto al pubblico. Visitabile solo in occasione di visite guidate
    del Dipartimento Ambiente."** Status must agree.
  - **DO NOT USE: "una delle città più verdi d'Europa"** about Rome. Superlative, and about the city
    not the place.

**41. Complesso Vignola Mattei (ex Santa Maria in Tempulo)** — kind: `historic-site`. Via di Valle
delle Camene.
- Boundary: 41.882481,12.493367 → poly Celio, nom Celio, road Via di Valle delle Camene. **But Via di
  Valle delle Camene is the Celio/San Saba boundary street, so this is flagged in §4 as well.**
- `https://www.turismoroma.it/it/luoghi/complesso-vignola-mattei-ex-santa-maria-tempulo`: owned by the
  Comune di Roma; a deconsecrated church where civil weddings are now celebrated; via Valle delle
  Camene follows the initial course of the ancient via Appia and takes its name from the spring sacred
  to the Camenae from which the Vestals drew water for their rites; a small oratory to St Agatha was
  built here by a Greek religious community probably by the end of the sixth century; at the start of
  the ninth the church is linked to a *monasterium Tempuli* holding a venerated Marian icon;
  the church under its present dedication and the attached Benedictine nunnery are unambiguously
  mentioned for the first time in 1155, from which the campanile — its remains now embedded in the
  external wall — dates; in 1222 Dominic moved the Tempoline nuns to San Sisto Vecchio, taking the
  icon (now at Santa Maria del Rosario a Monte Mario); the complex became a private house until in the
  seventeenth century it was absorbed into the Mattei estate of Villa Celimontana and presumably
  turned into a nymphaeum; described as a hay barn on Nolli's eighteenth-century plans; saved from
  demolition when the Parco di Porta Capena passeggiata archeologica was created at the start of the
  twentieth century, and then given rent-free until the 1980s to sculptors including Michele La Spina,
  Francesco Sansone and Ugo Quaglieri.
  Hours: "Aperta in occasione di celebrazione di matrimoni."

**42. Giardini del Celio** — kind: `park`. OSM way 217543434, **7 of 7 vertices in Celio**, centroid
41.886469,12.495329. A small public garden between Villa Celimontana and the Policlinico. **I found
no official Roma Capitale or Sovrintendenza page for it under this name.** Recording it as a lead
only; do not ship without a source.

**43. Chiesa di Santa Maria della Pietà al Colosseo** — kind: `historic-site`. Inside the Colosseum.
it.wikipedia's Celio article lists it among the rione's religious architecture ("interna al
Colosseo"). **I found no official page for it** — it does not appear in Roma Capitale's tourism
catalogue or on the archived colosseo.it monument pages I read. Recording it because it is a real
oddity a guide would enjoy, but it has **no fetched source beyond the aggregator** and I recommend the
verifier reject it unless someone finds a primary page.

---

## 4. STRADDLERS — 11 records. I am NOT resolving these.

The arbitrator sees all nine files; I do not. For each I give what each instrument said and stop.

**S1. Arco di Costantino** — Celio / **Campitelli**.
- OSM way 23590989 (`building=triumphal_arch`, `height=21`, full inscription in the tags): footprint
  is tiny, 5 vertices, bbox lat 41.8897062–41.8898183, lon 12.4905081–12.4908255. **3 vertices in
  Campitelli, 2 in Celio. Centroid 41.889773,12.490639 → Campitelli.**
- Nominatim on the centroid: `quarter = Campitelli`, road "Piazza dell'Arco di Costantino".
- Nominatim on the south face, 41.889706,12.490826 — a point my polygon puts **in Celio** —
  returns `quarter = Campitelli`. The two instruments disagree at the metre scale.
- it.wikipedia's Celio article lists the Arch under Celio's "Siti archeologici". Roma Capitale's
  address for it is "Via di San Gregorio", and via di San Gregorio is the Celio/Campitelli boundary.
- **Not in `taken_slugs.py`. Campitelli shipped 100+ places and did not take it.** So it is
  genuinely unclaimed and someone must decide.
- Facts if it lands in Celio, from the Parco archeologico del Colosseo's own page
  `https://colosseo.it/area/arco-di-costantino-e-meta-sudans/` (read through
  `http://web.archive.org/web/*/https://colosseo.it/area/arco-di-costantino-e-meta-sudans/`): the arch
  celebrates Constantine's triumph over Maxentius, "avvenuto il 28 ottobre del 312 d.C. a seguito
  della battaglia di ponte Milvio"; "L'iscrizione sul fornice centrale narra che il monumento fu
  solennemente dedicato dal Senato all'imperatore… in occasione dei decennalia dell'impero
  all'inizio del decimo anno di regno, il 25 luglio del 315 d.C."; the relief decoration was conceived
  as a single Constantinian programme largely reusing spolia, with reliefs of the ages of Trajan,
  Hadrian and Marcus Aurelius alternating with Constantinian work in the lower zone; all the emperors'
  faces in the reliefs were recut to Constantine's likeness, with the nimbus for imperial majesty.
  "Orari: Accesso libero." Address "Roma, Piazza del Colosseo"; Metro line B, Colosseo; buses 51, 75,
  81, 85, 87, 118; tram 3.
  `https://www.turismoroma.it/it/luoghi/arco-di-costantino` adds "alto circa 25 metri", three
  *fornici*, eight Dacian statues in the attic from the Forum of Trajan, and inclusion in the
  Frangipane fortress in the mid twelfth century, with restorations from the late 1400s through the
  1500s and again in 1733.
  - **DO NOT USE from either page: "il più grande arco onorario giunto fino a noi", "È il più grande
    dei tre archi trionfali ancora conservati a Roma."** Both banned.

**S2. Meta Sudans** — **Campitelli** / Celio.
- OSM relation **1835448** (`ruins=yes`, `wikidata=Q1924755`): **17 of 22 vertices in Campitelli, 5
  in Celio**; centroid 41.890074,12.490673 → Campitelli. Nominatim on the centroid: `Campitelli`.
- it.wikipedia's Celio article does not list it; the Parco archeologico del Colosseo files it with the
  Arch of Constantine as one area. **My reading: this is Campitelli's, not mine.** Recording it so the
  arbitrator sees that both wave-4 finders have it in view and neither has claimed it.
- Facts, same colosseo.it page: "Resti della cosiddetta Meta Sudans, una fontana monumentale edificata
  in età flavia"; in use until the fifth century AD, when the silting of the Colosseum valley began to
  block the outflow channels; "I ruderi furono poi demoliti in epoca fascista per la creazione di via
  dei Trionfi"; coin images, late-nineteenth-century photographs and drawings made at demolition allow
  the original form to be reconstructed as a marble-faced cylindrical base, perhaps with niches, and a
  conical upper element crowned by a flower or a sphere; "meta" from the conical form recalling the
  turning posts of the circus, "sudans" for the water that seeped from it; Augustus had already put a
  smaller fountain on the same site, recorded in the sources and found in recent excavation.

**S3. Porta San Sebastiano (Porta Appia)** — Celio / San Saba / Appio-Latino.
- OSM way 27519297 (`historic=city_gate`, `old_name=Porta Appia`, `addr:street=Via di Porta San
  Sebastiano`, `addr:housenumber=18`, `wikidata=Q1234193`): **5 vertices in Celio, 4 in San Saba, 7
  in none of my seven polygons** — the gate sits astride the Aurelian Walls, which is where three
  units meet. Centroid 41.873497,12.501534 → **Celio**.
- Nominatim on the centroid returns no `quarter` at all, only `Municipio Roma VII`.
- it.wikipedia's Celio article lists it under the rione's "Porte", with the note that the Appia Antica
  begins here and is "condivisa ad est tra il rione Celio e il rione San Saba".
- Facts: `https://www.turismoroma.it/it/luoghi/porta-san-sebastiano`: originally Porta Appia; two twin
  arched entrances flanked by semicircular towers; the towers were later enlarged and raised a storey
  and a fortified courtyard created inside; probably under Honorius (395–423) the two entrances were
  reduced to the single present opening and the towers set into two large square marble-faced bases;
  in the right-hand jamb, seen from outside, the figure of the Archangel Michael and a medieval
  inscription recalling the Roman people's victory over Robert of Anjou near the gate in 1327; the
  interiors were much altered in 1942–43, when the building became the residence of Ettore Muti.
  - **DO NOT USE: "la più grande porta tra quelle aperte nelle Mura Aureliane"** and, from the
    Sovrintendenza's Museo delle Mura page, "una delle più grandi e meglio conservate delle Mura
    Aureliane." Both rank.

**S4. Museo delle Mura** — same footprint as S3; **it is inside Porta San Sebastiano**.
- Boundary: OSM node 13264779030 at 41.873533,12.501648 → poly **Celio**; Nominatim returns only
  `Municipio Roma VII`. Roma Capitale's own point, 41.873729,12.501403, falls in San Saba.
  This one moves with whatever the arbitrator decides for the gate.
- Facts, `https://www.sovraintendenzaroma.it/i_luoghi/musei/musei_in_comune/museo_delle_mura`:
  "Tipologia: archeologico"; sited in Porta San Sebastiano; the route traces the city's fortifications
  from the regal and republican periods to Aurelian's of the third century AD; "Ingresso gratuito";
  information 060608, 09.00–19.00.
- `https://www.turismoroma.it/it/luoghi/museo-delle-mura` gives the room-by-room layout — Sala I,
  the teaching room in the west tower, with a three-colour travertine floor mosaic of 1940–43 showing
  two deer and a crouching tiger; Sala II over the entrance arch linking the two great towers, with
  plaster casts of the crosses incised over the arches of some gates and of palmette and sunburst
  decoration of the early fifth century, when the walls were doubled in height, and the travertine
  corbels in which ran the ropes working the portcullis; Sala III in the east tower with four models of
  the regal, republican and Aurelian circuits; Sala IV on Porta San Sebastiano's architecture from the
  third to the fifth century; Sala V in the west tower with a model of the stretch between Porta
  Asinaria and the Amphitheatrum Castrense. Hours: "Dal martedì alla domenica ore 10.00-16.00. Ultimo
  ingresso un'ora prima della chiusura." Tel 060608. Panoramic terrace between the crenellated towers,
  and the wall-walk "percorribile per un tratto di circa 400 metri fino ai fornici di via Cristoforo
  Colombo".
- **Conflict on the length of the wall-walk, and a closure.** The museum's own site,
  `https://www.museodellemuraroma.it/it`, says "un lungo tratto, circa 350 metri, di cammino di ronda
  sulle mura… una galleria coperta intervallata da dieci torri", while Roma Capitale says about 400 m.
  The museum's own site also carries a notice dated 12/06/2026: "Per consentire la realizzazione di
  opere impiantistiche il camminamento delle Mura Aureliane presso Porta San Sebastiano rimarrà chiuso
  a partire dal prossimo 15 g…" (truncated in the feed). Its accessibility line reads "Il Museo non è
  accessibile." **A record must reconcile the two lengths (prefer the museum's own 350 m and ten
  towers) and must not promise the wall-walk.**

**S5. Mura Aureliane, Celio stretch** — Celio / San Saba / Appio-Latino, by definition: the wall *is*
the boundary for the whole south-east side.
- Precedent exists: Trastevere already ships `mura-aureliane-segment-trastevere-rome`
  ("Aurelian Walls, Trastevere segment"), so a per-rione segment record is an accepted shape.
- Facts, `https://www.turismoroma.it/it/luoghi/mura-aureliane`: built between 270 and 275 AD at the
  wish of Aurelian; the works, begun in 271, were completed by Probus (276–282); brick; total length
  about 19 km; a square tower every thirty metres — a hundred Roman feet; height about 6 m, thickness
  3.5 m; in 401–402 under Honorius and Arcadius the height was doubled and the old wall-walk replaced
  by covered corridors, with a new open crenellated walk above; further sixth-century restoration under
  Belisarius; large existing buildings were absorbed into the circuit, including the Praetorian camp,
  the Amphitheatrum Castrense, the Pyramid of Cestius, the Muro Torto and stretches of aqueduct; in
  2020 the Comune and Acea installed new lighting, 78 recessed projectors and 47 step-markers, on the
  stretch from piazzale Metronio to via Numidia.
  - **DO NOT USE: "tra le cinte murarie antiche più lunghe e meglio conservate al mondo."** Banned.
- The piazzale Metronio–via Numidia lighting stretch runs along the Celio/Appio-Latino line, which is
  another reason to hand this to the arbitrator rather than write it.

**S6. Porta Latina** — sits exactly on the line.
- OSM node 365322259 at 41.876519,12.502488 falls in **none** of my seven rione polygons; Roma
  Capitale's point 41.876966,12.502410 falls in **Celio**; Nominatim returns only
  `Municipio Roma VII`, no quarter. it.wikipedia lists it under Celio's "Porte".
- Facts, `https://www.turismoroma.it/it/luoghi/porta-latina`: named from the road that passed through
  it; a single arch with two semicircular brick towers at the sides; inside the *fornix* the groove for
  the portcullis is visible, lowered by ropes from the manoeuvring chamber above, which has five arched
  windows.

**S7. Arco di Druso** — **San Saba** / Celio, and my two instruments flatly disagree.
- OSM way 234894452 (`wikidata=Q1107952`): **3 vertices San Saba, 4 Celio**; centroid
  41.873777,12.501431 → **San Saba**. Nominatim on the same centroid → **`quarter = Celio`**, road
  Via di Porta San Sebastiano. it.wikipedia's Celio article lists it under the rione's
  "Siti archeologici".
- One of the two clearest coin-flips in the rione. I have no basis to resolve it and I am not trying.
- I found **no dedicated official page** — it does not appear in the Sovrintendenza's
  archi-porte-e-ponti list nor in Roma Capitale's tourism catalogue under that name. If it ships, it
  needs a source I did not find.

**S8. Colombari di Vigna Codini** — Celio / **Appio-Latino**.
- Roma Capitale's point 41.875470,12.501938 → poly **Celio**; Nominatim on the same point →
  `quarter = Appio-Latino`, road Viale delle Mura Latine. The Sovrintendenza has no page for them.
- Roma Capitale's own text puts them inside: "I Colombari si trovano all'interno della Vigna Codini,
  tra il Parco degli Scipioni e le Mura Aureliane, nei pressi della Porta San Sebastiano"
  (`https://www.turismoroma.it/it/luoghi/colombari-di-vigna-codini`) — between the park and the walls,
  therefore inside the circuit, therefore Celio's side. But Nominatim disagrees and Appio-Latino is a
  quartiere with no wave-4 finder, so nobody is arguing the other side. Flagging it precisely because
  no one else will.
- Facts, same page: discovered around the mid nineteenth century by the Marchese Giampiero Campana;
  built between the Augustan and Tiberian ages and used until the second century AD; three distinct
  funerary buildings; the first quadrangular with about 500 arched loculi, each walling in two *ollae*,
  with painted name-tablets above, and four panels of mythological scenes; the second with niches
  under small marble slabs, many left uninscribed, and ornamental painting on the walls, the columbarium
  late Augustan and the paintings later; the third on a U plan with three communicating arms and larger
  loculi, part of the vault frescoed, the source of cippi, small urns and a small sarcophagus now in the
  Museo Nazionale Romano, its inscriptions carrying many names of imperial slaves and freedmen.
  Access: "Situati all'interno di una proprietà privata, vi si può accedere facendone richiesta al
  Parco Archeologico dell'Appia Antica." Tel 06 477881.

**S9. Piazza di Porta Capena** — Celio / San Saba / Ripa. it.wikipedia's boundary text puts this square
on the Celio/Ripa **and** Celio/San Saba lines simultaneously.
- Roma Capitale's point 41.884266,12.489517 → poly **San Saba**, Nominatim **San Saba**.
- But the **Casina Vignola Boccapaduli, addressed to this square, tests Celio on both instruments**
  (41.885019,12.489700 → poly Celio, nom Celio, road Piazza di Porta Capena). So the square straddles
  and the building on its Caelian side does not.
- Facts, `https://www.turismoroma.it/it/luoghi/piazza-di-porta-capena`: "una vasta area spianata tra le
  propaggini del Celio, del Palatino e dell'Aventino"; named from the ancient gate that led to the via
  Appia; facing it the building designed by Vittorio Cafiero as the Ministry of Italian Africa and
  inaugurated in 1951, now the FAO and the Ministry of Posts and Telecommunications.
  - Careful: the same page says the Axum obelisk stands at the centre of the square. **It was returned
    to Ethiopia in 2005 and the page is stale.** Do not publish that sentence. (I did not find a
    source for the return in this session; I am flagging the staleness, not asserting the replacement
    fact.)

**S10. Piazza del Colosseo** — Celio / Monti / Campitelli, demonstrably.
- Vertex counts on the OSM ways carrying the name: 6171077 → 5 Celio / 6 Monti; 22885682 → 7 Celio /
  1 Monti; 22885698 → 8 Celio; 22979017 → 2 Monti / 1 Campitelli; 22979051 → 2 Celio / 1 Campitelli;
  22979056 → 5 Monti; 23591644 → 14 Celio; 23591645 → 8 Celio; 23591646 → 10 Celio; 32758333 → 8 Monti;
  122109227 → 17 Monti.
- Majority Celio across the whole name, but genuinely three-way. Also **Monti already ships
  `parco-del-colle-oppio-rome` and the Lateran group**, so Monti has standing here.

**S11. Via di San Giovanni in Laterano** — Celio / Monti. It.wikipedia's boundary text names this
street as the Monti/Celio divide. Roma calls it "lo stradone di San Giovanni". Restaurants and
hotels addressed to it therefore need per-number adjudication: I tested each individually and every
one I list in §5 tests Celio, but the street as a named place is not mine to claim.

---

## 5. COMMERCIAL — 9 records, all polygon-tested individually

Every coordinate below tests inside the Celio polygon. I checked the official websites; where the site
is dead or hijacked I say so, because the OSM `website` tag is stale and a later wave will otherwise
publish a link to a casino.

**C1. Hotel Lancelot** — kind: `hotel`. Via Capo d'Africa 47, 00184 Roma. 41.888261,12.497136 → Celio.
- Official site `https://www.lancelothotel.com/`: "HOTEL LANCELOT – Via Capo D'Africa 47 – 00184 Rome,
  ITALY - Tel: (+39) 0670450615"; "un grazioso ed accogliente tre stelle"; "Immerso nel verde e nella
  quiete del Celio". The site has a section literally called "TESORI DEL RIONE". A hotel that names
  its own rione is a clean identity/location source.

**C2. Pizzeria Li Rioni** — kind: `restaurant`. Via dei Santi Quattro 24-24a. 41.888688,12.497833 →
Celio.
- `http://lirioni.it/`: "+39.0670450605, info@lirioni.it"; "Il nostro impasto viene lasciato maturare
  per più di 18 ore"; "La nostra pizza è da sempre cotta nel forno a legna"; a Lazio wine list.
  Identity, contact and method: publishable. **Do not publish "Accontentati del meglio" as a claim.**

**C3. Naumachia** — kind: `restaurant`. Via Celimontana 7. 41.889094,12.496572 → Celio.
- `https://www.naumachiaroma.com/`: Roman and Tuscan cooking; carbonara, cacio e pepe, ribollita.
  Multilingual site (it/de/es/fr/en/pt/zh).

**C4. Hostaria i Clementini** — kind: `restaurant`. Via di San Giovanni in Laterano 106.
41.889069,12.497430 → Celio.
- `https://www.iclementini.it/`: "a due passi dal colosseo e di fronte alla basilica di san clemente";
  "tra le mura storiche del seicento". **Its "da oltre vent'anni" is a trading-duration claim, which
  an official website does not establish under this wave's rule. Do not publish it.**

**C5. Osteria il Bocconcino** — kind: `restaurant`. Via Ostilia 23. 41.888706,12.494958 → Celio.
- `https://www.ilbocconcino.com/`: Roman home cooking, named dishes — zucchine ripiene, tagliolini
  con ragù d'anatra, fettuccine alla Messisbugo, polpette ebraiche, tordo matto.
  **The site's whole "Riconoscimenti" block — the 2008 ARSIAL/Slow Food award, the Lonely Planet,
  Guide du Routard, Petit Futé, Gambero Rosso and Osterie d'Italia listings — is unusable.** An
  official website does not establish awards. It also calls itself "L'Unica Osteria al Colosseo" and
  "L'unica Osteria di Roma dedicata ai piatti romani di casa": both banned.

**C6. Trattoria Pizzeria Luzzi** — kind: `restaurant`. Via di San Giovanni in Laterano 88.
41.889293,12.496624 → Celio. Official site `https://trattorialuzzi.it/` resolves but is almost entirely
JavaScript; the served HTML gives only the menu structure and a sibling venue "4e4'otto by Luzzi"
(Via San Giovanni in Laterano 88, `https://www.trattorialuzzi.it/4e4otto-by-luzzi/`).
**The "dal 1945" in the OSM name is a trading-duration claim I could not source. Do not publish it.**

**C7. Coming Out** — kind: `restaurant` (OSM `amenity=restaurant`; in practice a bar). Via di San
Giovanni in Laterano 8. 41.890013,12.494412 → Celio. **No website in OSM and I found none. Identity
unsourced beyond OSM.** Recording it because the strip of Via di San Giovanni in Laterano below the
Colosseum is Rome's best-known gay quarter and a guide would say so — but I have no publishable
source for that characterisation and I am not asserting it.

**C8. Antica Trattoria Pasqualino al Colosseo** — kind: `restaurant`. Via dei Santi Quattro 66.
41.889343,12.495148 → Celio. OSM carries `opening_hours=Mo-Su 11:00-00:00`, `phone=+39 06 700 45 76`,
`email=pasqualinoalcolosseo@gmail.it`. **No official website found; OSM is not a source for hours
under this corpus's rules.** Lead only.

**C9. Profumo Maison d'Hotes** — kind: `bnb` or `hotel`. Via di San Giovanni in Laterano 108.
41.889061,12.497476 → Celio. `https://www.profumomaisonroma.com/` resolves (35 kB of content); I did
not read it in depth. Lead.

**TWO DEAD DOMAINS — flag hard for any later wave.** Both are tagged as `website` in OSM and both now
serve unrelated gambling content, not the business:
- `https://www.hotelcapodafrica.com/` (OSM node 3052495269, "Hotel Capo d'Africa", Via Capo d'Africa
  54) now serves an Indonesian online-lottery site. **Do not link. Do not ship the hotel on this
  source.**
- `https://www.shamrockrestaurant.it/` (OSM node 8917220218, Via dei Santi Quattro 93) now serves an
  Indonesian slots site. **Same.**
This is a live corpus hazard: any wave that harvests `website` tags from OSM without fetching them
will publish these links.

---

## 6. RULED OUT — tested, and they belong to somebody else

Recording these so no one re-tests them and so the arbitrator can see I checked the edges.

| Place | Test | Owner |
|---|---|---|
| Basilica di Santo Stefano Rotondo al Celio | 41.885271,12.496698 → poly Monti | Monti, **already shipped** |
| Mitreo di Santo Stefano Rotondo | 41.885271,12.495837 → poly Monti | Monti; **unclaimed and unshipped — Monti's finder missed it** |
| Basilica di San Clemente al Laterano | 41.889444,12.497500 → poly Monti | Monti, already shipped |
| Basilica di San Giovanni in Laterano | — | Monti, already shipped |
| Il Ludus Magnus | 41.890324,12.495008 → poly Monti | Monti; unclaimed. Sovrintendenza calls it Domitian's gladiatorial school east of the Colosseum, currently closed for PNRR works |
| Domus Aurea / Parco del Colle Oppio | 41.891200,12.495300 and 41.892000,12.496000 → poly Monti | Monti (Colle Oppio shipped) |
| Porta Metronia | 41.882549,12.498639 → poly Monti, nom Monti | Monti, already shipped |
| Ninfeo di via Amba Aradam | 41.885317,12.502496 → poly Monti | Monti; unclaimed |
| Fontana Sarcofago al Colosseo | 41.891412,12.491179 → poly Monti | Monti; unclaimed |
| Terme di Caracalla | 41.879000,12.492500 → poly San Saba | San Saba |
| Parco Caracalla | 41.874945,12.495600 → poly San Saba | San Saba |
| Chiesa di San Cesareo de Appia | 41.876596,12.499647 → poly San Saba | San Saba (Roma Capitale files it with the Parco archeologico dell'Appia Antica) |
| Oratorio dei Sette Dormienti | 41.878391,12.497596 → poly San Saba, **nom San Saba** | San Saba. Both instruments agree; not mine |
| Parco di San Sebastiano | 41.877446,12.496639 → poly San Saba | San Saba |
| Parco di Porta Capena – Passeggiata Archeologica | 41.883053,12.491648 → poly San Saba | San Saba (but see S9) |
| Stazione-Museo Metro C Porta Metronia | 41.882778,12.502902 → poly NONE (outside all seven) | Outside Celio; Via Ipponio is beyond the walls |
| Parco delle Mura Latine | 41.876560,12.502481 → poly Celio, but Roma Capitale's own page says "Parco delle Mura Latine - **Municipio VII**" | Almost certainly Appio-Latino; Celio is Municipio I. Ruled out on the page's own municipio |
| Giardino di Via Celio Caldo | 41.872165,12.614806 → poly NONE | Nothing to do with the Caelian; 13 km east. A name trap |
| Acquedotti Claudio e Anio Novus | relation centroid 41.924719,12.693157 | Outside Rome's centre entirely. The Celio has *stretches* of the Claudian aqueduct — San Tommaso in Formis sits on its cisterns — but the OSM relation is the Campagna line |

---

## 7. THINGS I COULD NOT SOURCE, stated plainly

These are the honest gaps, not padding.

- **`colosseo.it` and `parcocolosseo.it` do not resolve from this network** by urllib or WebFetch
  (`ECONNREFUSED`, then repeated timeouts). Everything I have from the Parco archeologico del Colosseo
  came through the Internet Archive, at captures dated 2026-08-31 and later. The content is the
  institution's own; the route is not. A verifier who can reach the live host should re-check the
  hours, which are seasonal and change.
- **`comune.roma.it` does not resolve**, which the rome_roster already records. That cost me the
  official Roma Capitale notices for the Casina del Salvi reopening (April 2025) and the Casina
  Vignola Boccapaduli reopening (December 2025). Both dates are in it.wikipedia citing comune.roma.it;
  neither is publishable on that basis.
- **`caseromane.it` fails TLS certificate validation**; **`coopculture.it`** serves an empty JS shell.
  So Case Romane del Celio's hours are Roma Capitale's republication, not the venue's own page.
- **`archeoroma.beniculturali.it` does not resolve** (DNS). That was the Basilica Hilariana link in
  OSM.
- **No official page found** for: Arco di Druso, Giardini del Celio, Chiesa di Santa Maria della Pietà
  al Colosseo, Clivo di Scauro as a place in its own right, the Casa di esercizi per il clero
  (beyond the Treaty text), or the Policlinico Militare Celio.
- **Vincoli in Rete and the Catalogo generale were not consulted.** They are unreachable and, per the
  wave ruling, nothing here may claim a designation. I checked no register and I assert no protection
  status for any of the 63 records.
- The **Nominatim pass hit HTTP 429** on a first run at 1.1 s spacing; I re-ran the critical 32 points
  at 3.0 s and every one answered. The numbers in this file are from the clean run.

---

## 8. PHOTO LEADS — noted and NOT acted on, per the wave ruling

`"photos": []` on every record. For whoever runs the image wave:
- OSM's Celio infobox image on it.wikipedia is `Rom (IT), Kolosseum -- 2024 -- 0610.jpg` on Commons.
- The rione boundary relation carries `wikimedia_commons=Category:Rione XIX - Celio`.
- Per-monument Commons categories are on the OSM footprints: `Category:Santi Quattro Coronati (Rome)`,
  `Category:San Tommaso in Formis`, `Category:Santa Maria in Domnica`,
  `Category:Basilica dei santi Giovanni e Paolo al Celio`, `Category:Porta San Sebastiano (Rome)`,
  `Category:Columbarium of Pomponius Hylas`, `Category:Grave of Lucius Cornelius Scipio Barbatus`,
  `Category:Arch of Drusus (Rome)`, `Category:San Giovanni a Porta Latina (Rome)`,
  `Category:San Giovanni in Oleo`, `Category:Meta sudans (Rome)`, `Category:Villa Celimontana`.
- it.wikipedia's Celio article names four photographs of buildings I could otherwise barely source:
  `Casina del Vignola Boccapaduli 21 12 2019.jpg`, `Casino Salvi - 22-22-2019.jpg`,
  `Ex Caserma Vigili - 22-11-2019.jpg`, `Ex GIL - 22-11-2019.jpg`.
- **Italy has no freedom of panorama.** The Ex Palestra della GIL is by Enrico Del Debbio (d. 1982),
  so the building's architectural copyright runs a long way yet; that is the same class of problem the
  roster already flags for the Palazzo della Civiltà Italiana. The image wave will need to rule on it
  before publishing an exterior of the Museo della Forma Urbis' building.

---

## 9. HONEST YIELD

Celio is a guide, not a town page, and it is not close. But the shape of the yield matters:

- **The north lobe is dense and well-sourced.** The Colosseum, the Parco archeologico del Celio with
  its museum and Casina, the SS Giovanni e Paolo / Case Romane / Clivo di Scauro cluster, San Gregorio
  with its three oratories and park, Villa Celimontana with five separately-documented features inside
  it, Santa Maria in Domnica and its fountain, San Tommaso in Formis with the Arch of Dolabella, and
  Santi Quattro Coronati with the best-published opening calendar in the rione. That alone is a
  strong page.
- **The south lobe is real and would have been missed.** Sepolcro degli Scipioni, Parco degli
  Scipioni, Colombario di Pomponio Hylas, San Giovanni a Porta Latina, San Giovanni in Oleo, Parco
  Egerio, San Sisto Vecchio, the Semenzaio. Eight records that a finder working only from "the Caelian
  hill" would never reach, because the rione runs a kilometre and a half further south than the hill
  does.
- **The straddler count is high and that is a property of this rione, not a failure.** Celio is a
  1921 carve-out of Campitelli, its south-east edge *is* the Aurelian Walls, and its west edge *is*
  via di San Gregorio. Eleven straddlers out of 63 is what that geometry produces. Two of them —
  the Arch of Constantine and the Arch of Drusus — are genuine coin-flips where my two instruments
  disagree at the metre scale, and I have said so rather than picked.

**The three I am least confident about, in order:**

1. **Arco di Costantino.** Centroid Campitelli on both instruments; two of five footprint vertices in
   Celio; it.wikipedia lists it under Celio; Campitelli shipped 100-plus places and left it. I think
   the honest answer is Campitelli and I would not fight for it, but it.wikipedia's Celio list and the
   fact that Campitelli's finder passed on it both point the other way. Somebody has to own the most
   photographed arch in Rome and it should not be nobody.
2. **Porta San Sebastiano and the Museo delle Mura.** The gate footprint splits 5 Celio / 4 San Saba
   / 7 on the line, the centroid is Celio, and Nominatim declines to name a quarter at all. The museum
   inside it follows the gate. If the arbitrator gives the gate to San Saba, Celio loses a museum; if
   to Celio, San Saba loses one. It genuinely straddles and I would not bet either way.
3. **Colombari di Vigna Codini.** Poly Celio, Nominatim Appio-Latino, no Sovrintendenza page, and the
   only positional evidence is Roma Capitale's prose putting them between the Parco degli Scipioni and
   the walls. Appio-Latino has no finder in this wave, so if I am wrong nobody catches it. Treat my
   Celio reading as weak.

Runner-up on the same list: **San Sisto Vecchio**, where the footprint is 22/22 Celio and Nominatim
agrees, but the postal address is Piazzale Numa Pompilio — the boundary square named in the rione's
own delimitation text — and Roma Capitale's address-level geocode lands in San Saba. I have put it in
§3 rather than §4 because the footprint evidence is unanimous, but I have flagged it in §4 as well and
I would not object if the arbitrator moves it.
