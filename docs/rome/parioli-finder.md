# Parioli — finder file

**Unit:** Q. II Parioli, quartiere. Roma Capitale toponymic code **202**, numeral **Q. II**.
Roster slug `parioli`. Wave 5.

**Taken-slug check:** run 2026-09-03.

```
$ python3 .superpowers/taken_slugs.py parioli
matches for 'parioli':
0 places already owned across 21 shipped files
```

Nothing in this file is owned by any of the twenty-one shipped rioni. I additionally searched
`villa`, `agnese`, `torlonia`, and eyeballed the full dump: the only villa-named Rome places already
owned are Villa Medici (Campo Marzio), Villa Celimontana and its three sub-records (Celio), Villa
Maraini (Ludovisi), Villa Aldobrandini and Villa Sforza (Monti), Villa Altoviti (Prati), Villa del
Priorato di Malta (Ripa), Villa Paolina Bonaparte (Sallustiano), and Villa Sciarra / Farnesina /
Lante / Spada / Aurelia (Trastevere). None of them is in Q. II.

---

## 0. THE BRIEF'S STARTER LIST IS FOUR-SIXTHS WRONG. Read this first.

My brief named six likely subjects. Two are Parioli's. **Four are not in this quartiere at all**, and
if I had written them the arbitrator would have had four collisions with zones nobody is even
writing this wave.

| Brief said | Actually in | How I know |
|---|---|---|
| Auditorium Parco della Musica | ✅ **Q. II Parioli** | it.wiki: «Progettato da Renzo Piano, **è situato ai Parioli**». OSM `is_in(41.929075,12.474557)` returns relation 5459647, `name=Parioli`, `official_name=Quartiere II Parioli`, `ref=Q. II`, plus `Municipio Roma II` (admin_level 10). |
| Villa Ada and its park | ✅ **Q. II Parioli** | Sovrintendenza Capitolina's own page: «**Dove si trova: Municipio II, quartiere Parioli**». it.wiki category `Roma Q. II Parioli`. |
| Catacombe di Priscilla | ❌ **Q. XVII Trieste** | it.wiki category is `Roma Q. XVII Trieste`; the entrance is on via Salaria «di fronte a Villa Ada», i.e. on the far side of the street that **is** Parioli's eastern boundary. **OSM `is_in(41.9297126, 12.5086256)` returns `Trieste (Q. XVII)`.** Two independent sources, same answer. |
| Villa Torlonia edge | ❌ **Q. V Nomentano** | its own infobox: «Via Nomentana, 70 - Quartiere **Nomentano**, II Municipio»; category `Roma Q. V Nomentano`. Via Nomentana is nowhere near Q. II. |
| Sant'Agnese fuori le Mura | ❌ **Q. XVII Trieste** | the `Complesso monumentale di Sant'Agnese fuori le mura` article is categorised `Roma Q. XVII Trieste`; coordinates 41.9228, 12.5193, on via Nomentana at the second mile. |
| Mausoleo di Santa Costanza | ❌ **Q. XVII Trieste** | category `Chiese di Roma - Q.XVII Trieste`; coordinates 41.92269, 12.51738; it stands inside the Sant'Agnese complex on via Nomentana. |

**Parioli's eastern boundary is via Salaria, from Ponte Salario to viale Liegi.** Everything on the
far side of via Salaria — Priscilla, Sant'Agnese, Santa Costanza, Villa Torlonia — is Trieste's or
Nomentano's, and neither is in scope this wave. I have written none of them up as Parioli places.

The good news: the quartiere does not need them. Q. II carries a concert complex with three halls
and three museums, a 160-hectare royal park with a fort, an Iron Age oppidum, a wartime bunker and
three catacombs inside it, an Olympic village, two Olympic Nervi venues, a papal spring, and four
20th-century churches. Yield is high without borrowing.

---

## 1. What kind of unit this is, and what may be said about it

Parioli is a **quartiere**, not a rione. The `kind_note` and the scope research both apply:

- it.wiki, verbatim: «**Parioli** è il secondo quartiere di Roma, indicato con **Q. II**. Il toponimo
  indica anche la **zona urbanistica 2B** del Municipio Roma II di Roma Capitale.»
- **Municipio may be stated for this quartiere**, because the source states it for this quartiere:
  the infobox reads `circoscrizione = Municipio Roma II`; the Sovrintendenza Capitolina page for
  Villa Ada reads «Municipio II, quartiere Parioli»; the church of San Roberto Bellarmino's article
  says it is «nel quartiere Parioli, rientrante all'interno dei confini del **Municipio Roma II**»
  citing the Diocese of Rome; and OSM `is_in` at the Auditorium returns `Municipio Roma II` as the
  admin_level 10 relation. Four independent sources, one Municipio. This is not the Castro Pretorio
  situation.
- CAP: **00197 / 00198** per the it.wiki infobox. ⚠️ but the Auditorium's own site prints
  `Viale Pietro de Coubertin, 30 **00196** Roma`, and Corso di Francia's infobox gives 00191. A
  quartiere spans several postcodes; do not use CAP as a boundary argument, and do not print a
  quartiere-wide CAP.
- **Zone urbanistiche lying on Q. II**, per the quartiere's own article: 2B Parioli (only its
  north-east sector — «Gran parte di questa insiste sul quartiere Pinciano»), **2A Villaggio
  Olimpico**, **2Y Villa Ada** (the Villa Ada zona article: «Si estende sul quartiere Q. II
  Parioli»), and the north sector of 2D Salario. ⚠️ the Parioli article contradicts itself on the
  code, writing `2X Villa Ada` in one section and `2Y Villa Ada` in another while also calling 2X
  Villa Borghese. The Villa Ada zona article's own title says **2Y**. Use 2Y; flag the inconsistency.

### Boundaries, verbatim from it.wiki `Parioli`

> Il quartiere confina:
> * a nord con il quartiere Q. XVIII **Tor di Quinto** (separato dal fiume Tevere, da Ponte Milvio
>   fino all'immissione del fiume Aniene) e con la zona Z. I **Val Melaina** (separata dal fiume
>   Aniene, dall'immissione nel fiume Tevere fino a Ponte Salario)
> * a est con il quartiere Q. XVII **Trieste** (separato da via Salaria, da Ponte Salario a viale
>   Liegi)
> * a sud con il quartiere Q. III **Pinciano** (separato dall'intero viale Liegi, dall'intero viale
>   dei Parioli e dall'intero viale Maresciallo Pilsudski fino a via Flaminia)
> * a ovest con il quartiere Q. I **Flaminio** (separato da via Flaminia, da viale Maresciallo
>   Pilsudski a piazzale Cardinal Consalvi / Ponte Milvio)

That is a clean, street-and-river definition, and it decided most of the calls below. Two of Parioli's
four neighbours (Pinciano, Flaminio) are in scope this wave and will be writing at the same time;
two (Tor di Quinto, Val Melaina) and the eastern neighbour Trieste are not in scope at all.

### Method note for the verifier

Boundary evidence used, in descending weight: (1) the institution's own words; (2) Sovrintendenza
Capitolina's `Dove si trova` line; (3) it.wiki's `Roma Q. II Parioli` / `Chiese di Roma - Q.II
Parioli` categories, which are maintained per-quartiere and were right every time I could
cross-check them; (4) OSM `is_in(lat,lon)` via Overpass, which returns relation 5459647
`boundary=place, place=suburb, name=Parioli, official_name=Quartiere II Parioli, ref=Q. II,
wikidata=Q3365096` — i.e. OSM does carry a real Q. II polygon, so point tests work for quartieri
here. Nominatim reverse geocoding was rate-limited to 429 on every attempt and contributed nothing.

⚠️ **OSM point tests for quartieri are usable but not complete, exactly as the brief warned.** Eight
points tested; five returned a quartiere relation and **three returned no place relation at all** —
the Villa romana dell'Auditorium, Villa Balestra and the Grande Moschea. That is a gap in coverage,
not a finding: an empty result is **not** evidence that a place is outside Parioli, and I have not
treated it as such anywhere in this file. Full results:

| point tested | lat, lon | OSM `is_in` result |
|---|---|---|
| Auditorium Parco della Musica | 41.929075, 12.474557 | **Parioli (Q. II)** + Municipio Roma II |
| Stadio Flaminio | 41.92800, 12.46990 | **Parioli (Q. II)** + Municipio Roma II |
| Palazzetto dello Sport (my estimate) | 41.92620, 12.46980 | **Flaminio (Q. I)** + Municipio Roma II |
| Piazza Euclide | 41.92620, 12.48200 | **Pinciano (Q. III)** + Municipio Roma II |
| Catacombe di Priscilla, entrance | 41.9297126, 12.5086256 | **Trieste (Q. XVII)** + Municipio Roma II |
| Villa romana dell'Auditorium | 41.928861, 12.475367 | *(no place relation returned)* |
| Villa Balestra | 41.92330, 12.47800 | *(no place relation returned)* |
| Grande Moschea di Roma | 41.934769, 12.495221 | *(no place relation returned)* |

---

## 2. Candidates

Forty-three entries. Numbered so the verifier can cite them. Each says what I think it is, the
address where a source gives one, and the URL behind each fact. **None of them ships on my say-so.**

### 2.1 The Auditorium complex — 5 records

Renzo Piano is alive, so the complex is a **hard photo reject** in this and every wave. Written
about, never photographed. That covers the Auditorium's own buildings, the MUSA gallery he designed,
and the Aristaios fit-out inside his shell.

---

**1. Auditorium Parco della Musica "Ennio Morricone"** — kind `theater`

- Address: **Viale Pietro de Coubertin, 30, 00196 Roma** — the operator's own footer.
  https://www.auditorium.com/
- Designed by **Renzo Piano**; built 1995–2002; on a site of **55,000 m²** between Villa Glori, the
  Villaggio Olimpico, the Corso di Francia viaduct and viale Maresciallo Pilsudski.
  https://it.wikipedia.org/wiki/Auditorium_Parco_della_Musica
- Opened **21 April 2002** with the Sala Sinopoli; the rest of the complex and the Sala Santa Cecilia
  followed on **21 December 2002**, with a concert by the Orchestra dell'Accademia Nazionale di Santa
  Cecilia conducted by Chung Myung-whun. (same)
- Named for **Ennio Morricone** by a resolution of Rome's city council in 2020.
  https://www.auditorium.com/articolo/l_auditorium_intitolato_ad_ennio_morricone-22687.html (via
  it.wiki's citation) and https://it.wikipedia.org/wiki/Auditorium_Parco_della_Musica
- Halls, from the operator's own site: **Sala Santa Cecilia 2,744 seats; Sala Sinopoli 1,133; Sala
  Petrassi 673; Teatro Studio Borgna 300; Cavea, open air, 3,000–5,000**; **Giardini pensili Claudio
  Abbado, 38,000 m²** of open park. https://www.auditorium.com/
  ⚠️ CONFLICT: it.wiki's infobox gives Sala Santa Cecilia **2,756** and Teatro Studio **308**. Prefer
  the operator; note the discrepancy rather than averaging.
- Three concert halls clad in **lead sheet**, arranged like a scarab around the open-air cavea; a
  walkable terrace runs round the whole. https://it.wikipedia.org/wiki/Auditorium_Parco_della_Musica
- Home since 2003 to the concert season of the **Accademia Nazionale di Santa Cecilia** and to the
  programming of the **Fondazione Musica per Roma**, which manages the site; hosts the **Festa del
  Cinema di Roma** since 2006. (same)
- Opening hours, operator's own footer: **October–March 11:00–20:00, Sundays and holidays
  11:00–20:00; April–October 11:00–20:00, Sundays and holidays 10:00–20:00; on days with a Cavea
  show the Auditorium closes at 16:00.** https://www.auditorium.com/
- Status: **open**.
- ❌ Do NOT repeat the operator's own strapline «Il più grande luogo di spettacolo d'Europa» / "the
  largest entertainment venue in Europe". Superlative, banned even attributed.

**2. MUSA — Museo degli strumenti musicali dell'Accademia nazionale di Santa Cecilia** — kind `museum`

- Inside the Auditorium. Its **present gallery opened in February 2008** and was designed by Renzo
  Piano. https://it.wikipedia.org/wiki/Museo_degli_strumenti_musicali_dell%27Accademia_nazionale_di_Santa_Cecilia
- **About 130 instruments** on show plus some **fifty luthier's accessories**, in a workshop visible
  to visitors where the luthiers responsible for the collection work. (same)
- Named holdings: the **Stradivari violin known as the "Toscano", 1690**, one of five instruments of
  the so-called "quintetto Mediceo" made for Grand Prince Ferdinando de' Medici; a viola by **David
  Tecchler**, a German-born luthier working in Rome in the first half of the 18th century; and a
  mandolin from **Queen Margherita di Savoia's** private collection of instruments, left by her to
  the Accademia. (same)
- Official page: https://santacecilia.it/auditorium/museo-degli-strumenti-musicali/ — reachable,
  but its content is JavaScript-rendered and I could not pull hours or a ticket price from it. Write
  no hours for MUSA.
- Status: **open**.

**3. Museo Aristaios (Collezione Sinopoli)** — kind `museum`

- Inside the Auditorium, in the **Sala del Peduncolo**; **over 300 m²**.
  https://www.auditorium.com/it/museum/museo-aristaios/
- Holds the **161 works** bought by the Ministry from the heirs of **Giuseppe Sinopoli**, conductor
  and collector. **Opened December 2012**, under a valorisation agreement between MiBACT, Roma
  Capitale and the Fondazione Musica per Roma. (same)
- Greek archaic and classical ceramics spanning **Minoan (3200 BC) to Magna Graecia (300 BC)**:
  Minoan, Mycenaean, Geometric, Corinthian, Laconian, East Greek, Attic black- and red-figure,
  Italiote red-figure and indigenous Daunian ware, plus a Cycladic marble vase (3200–2700 BC),
  Etruscan and Magna Graecia bronze vessels, and votive statuettes. Attic pieces include work by
  **Lydos**, the **Lysippides Painter**, the circle of **Nikosthenes**, the **Syleus Painter** and the
  **Eretria Painter**. (same)
- Fit-out by **Alvisi Kirimoto**. (same)
- **Free entry.** Hours, verbatim from the museum's own page: **every Saturday 11:00–18:00 in
  standard time and 11:00–20:00 in summer time; every Sunday and public holiday 10:00–18:00 in
  standard time and 10:00–20:00 in summer time.** The page adds that during particular events the
  exhibition spaces may be closed to the public. (same)
- Status: **open**.

**4. Villa romana dell'Auditorium and its Museo Archeologico** — kind `historic-site` (or `museum`)

- Viale Pietro de Coubertin, under and beside the Auditorium. it.wiki gives coordinates
  **41.928861, 12.475367**. https://it.wikipedia.org/wiki/Parioli
- **Found in 1995** during the excavation for the Auditorium; the discovery forced a substantial
  change to Piano's original design, and the remains are visible from the terrace between the Sala
  Santa Cecilia and the Sala Sinopoli, with the finds shown in a small museum under the cavea.
  https://it.wikipedia.org/wiki/Auditorium_Parco_della_Musica
- Sovrintendenza Capitolina: the excavated area is **about 2,500 m²**, at the foot of the Monti
  Parioli; the structures emerged **four metres down** and survive at foundation level. The site was
  occupied continuously **from the second half of the 6th century BC to the 2nd century AD**, when it
  was abandoned, probably because of the Tiber's floods. A modest 6th-century-BC farm; enlarged in
  the 5th century BC into a rich rural villa round a central court, with a well-preserved **olive
  press**; from the late 4th–early 3rd century BC a roofed court, and an eaves tile decorated with
  the bearded head of a river god identifiable as **Achelous**; between the mid-3rd and the 2nd
  century BC an atrium with impluvium, bedrooms and tablinum; enlarged again in the Augustan age
  behind a heavy reticulate wall.
  https://www.sovraintendenzaroma.it/i_luoghi/musei/altri_musei_e_collezioni/museo_archeologico_della_villa_romana_dell_auditorium_e_del_suo_territorio/villa_romana
- **Ingresso libero** per the Sovrintendenza's museum page.
  https://www.sovraintendenzaroma.it/i_luoghi/musei/altri_musei_e_collezioni/museo_archeologico_della_villa_romana_dell_auditorium_e_del_suo_territorio
- The Auditorium's own museums index calls it "Museo Archeologico — 2.000 mq del VI sec A.C."
  https://www.auditorium.com/it/musei-e-spazi-espositivi/ ⚠️ 2,000 m² vs the Sovrintendenza's
  2,500 m² for the excavated area; these may be measuring different things. Print one, sourced.
- ⚠️⚠️ **STRADDLER — DO NOT RESOLVE.** The Sovrintendenza page opens «**Nel quartiere Flaminio**,
  durante i lavori per la realizzazione dell'Auditorium…», while it.wiki lists the villa under Q. II
  Parioli's `Siti archeologici` and OSM puts the Auditorium 65 m away firmly in Parioli. My reading
  is that the Sovrintendenza is using "Flaminio" loosely for the whole Flaminio–Villaggio Olimpico
  basin, and that the villa follows the Auditorium; but an official Roma Capitale body has said
  Flaminio in print and the arbitrator should be the one to weigh that. My OSM point test at the
  villa's own coordinates returned **no place relation at all** — a hole in OSM's
  coverage, which is not evidence either way.
- ⚠️ Photographs of the excavation are framed by Piano's structure. Treat as photo-restricted.

**5. AuditoriumArte / AuditoriumGarage / Sound Corner** — kind `attraction`, weak

- The Auditorium's own index lists a permanent sound installation (**Sound Corner**), the
  **AuditoriumGarage** exhibition space of **655 m²** and **AuditoriumArte** of **200 m²**.
  https://www.auditorium.com/it/musei-e-spazi-espositivi/
- Probably a paragraph in the Auditorium record rather than three places. Listed so the verifier can
  reject it deliberately.

### 2.2 Villa Ada and everything inside it — 8 records

**6. Villa Ada Savoia** — kind `park`

- **160 hectares.** Entrances: **via Salaria 267, 273 and 275; via di Ponte Salario; via di Monte
  Antenne; via Panama.** Located, verbatim, «**Municipio II, quartiere Parioli**». Epoch XVIII–XX
  century. All four facts from Sovrintendenza Capitolina:
  https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/ville_dei_nobili/villa_ada_savoia
- Managed by **Roma Capitale**; it.wiki's infobox gives opening as «Tutti i giorni dall'alba al
  tramonto» — every day from dawn to dusk — citing 060608.it.
  https://it.wikipedia.org/wiki/Villa_Ada ⚠️ the cited 060608 page now redirects to the portal home,
  so the dawn-to-dusk hours rest on it.wiki repeating a Roma Capitale page I could not re-read. If
  the verifier wants belt and braces, write no hours.
- History: the estate was partly unified by **Prince Luigi Pallavicini** at the end of the 1780s, who
  had it laid out by the French architect **Auguste Chevalle de Saint-Hubert (1755–1798)** with
  **Francesco Bettini (1737–after 1809)**; on the 1839 Presidenza del Censo plan much of the former
  Pallavicini estate appears as Potenziani property, and **in 1872 they sold it to Vittorio Emanuele
  II**, who enlarged it by buying neighbouring vineyards. (Sovrintendenza, as above.)
- **Sold in 1878** at a favourable price to the count **Giuseppe Telfener**, administrator of the
  royal family's estate, who named it for his wife **Ada**; **repurchased by Vittorio Emanuele III in
  1904** and a royal residence until 1946. The part toward via Salaria was acquired by the state
  **demanio in 1957**. https://it.wikipedia.org/wiki/Villa_Ada
- **On 25 July 1943, after the Grandi motion, the king summoned Mussolini to Villa Ada, where he was
  arrested and driven away in an ambulance.** (same) — a genuinely load-bearing fact for a guide.
- Buildings named by the Sovrintendenza: the **Casale detto "La Finanziera"**, on the hill of that
  name, now the seat of **WWF**; the **Fienile**, used as a riding centre by the Cascianese club; the
  **Casale delle Cavalle Madri**, named for its Savoy-era use as a shelter for brood mares from the
  Quirinale stables; **Villa Polissena**; the **Scuderie reali**; the **Villa Reale**; the **Casino
  Pallavicini**; the **Tempio di Flora**; and **le Tribune** along the boundary wall on via Salaria.
- The **Tempio di Flora** is singled out by the Sovrintendenza as an 18th-century coffee-house by the
  Casino Pallavicini, with a neoclassical pronaos and facade concealing an apsed rear that repeats
  the colonnade and looks down on a small amphitheatre-shaped hollow with a **late-19th-century cast
  iron fountain** at its centre.
- Planting: about **80% wooded**, 20% grass and shrub; the dominant species is the **umbrella pine**,
  with holm oak, laurel, olive, elm, maple, poplar and many oaks, and a **metasequoia imported in
  1940**. Fauna includes red squirrels, moles, hedgehogs, wild rabbits, crested porcupines and a
  parrot colony near the former royal villa. https://it.wikipedia.org/wiki/Villa_Ada
- The public area has a **ring path of about four kilometres** with interpretive panels. (same)
- Since **1994** the lake hosts the summer world-music series **Roma incontra il mondo**, run by ARCI
  with the Comune. (same) — no standalone wiki article; use as a line in the park record.
- ❌ it.wiki opens «è il quarto più grande parco pubblico di Roma dopo…». That is a size ranking, not
  a position in an official series. **Banned.** Print the 160 hectares instead.
- Status: **open**.

**7. Palazzina Reale di Villa Ada (Villa Reale / Villa Savoia)** — kind `historic-site`

- Built **1873–1875**; architect **Gennaro Petagna**, engineer **Guglielmo Castelnuovo**; neoclassical.
  https://it.wikipedia.org/wiki/Palazzina_Reale_(Roma)
- Residence of **Vittorio Emanuele III** and his family **from 1904 to 1946**. (same)
- **Acquired by the Arab Republic of Egypt in 1997** and since then the seat of the Egyptian embassy
  in Italy. (same; it.wiki's Villa Ada article adds that Umberto gave it to Egypt in return for the
  hospitality his parents received in exile at Alexandria in 1946–47, and that it houses the embassy
  and consulate.)
- Status: **closed** — it is a working diplomatic mission, which is an affirmative, sourced claim, so
  the "closed" is defensible here. The prose must say why.
- ⚠️ Do not write it as a visitable Savoy palace. Visitors see it from the park.

**8. Bunker di Villa Ada Savoia** — kind `historic-site`

- Built **between 1940 and 1942** as an air-raid shelter for the royal family, cut into the tufa hill
  called **"delle Cavalle Madri"**, about **350 metres in a straight line from the Palazzina**; there
  is **no underground link to the Palazzina**, which is why it was given a drive-in entrance — cars
  could be parked inside. https://it.wikipedia.org/wiki/Bunker_villa_Ada_Savoia
- Armoured doors, air filtration, water and stores, a secondary emergency exit; the main entrance is
  near the first stable, under a large arch of solid red brick, and a small circular structure nearby
  both ventilates the shelter and serves as the second exit, down a spiral stair.
  https://it.wikipedia.org/wiki/Villa_Ada
- **No official record of its construction survives** — no plans, no cost schedules.
  https://it.wikipedia.org/wiki/Bunker_villa_Ada_Savoia
- Abandoned after the war, occupied and heavily graffitied; **restored and open to visitors since
  April 2016** under an agreement between the Comune di Roma and the **Associazione Roma
  Sotterranea**. https://it.wikipedia.org/wiki/Villa_Ada and http://www.bunkervillaada.it/il-bunker.html
  ⚠️ I did not manage to re-read bunkervillaada.it directly; the operator's current visiting
  arrangements are unverified. **Write no hours or prices.** Status `open` with the prose saying
  visits are run by the association.

**9. Forte Antenne** — kind `historic-site`

- **In the north sector of Villa Ada**, on **Monte Antenne**, near the Aniene–Tiber confluence, in
  «il quartiere Q. II Parioli, nel territorio del Municipio Roma II».
  https://it.wikipedia.org/wiki/Forte_Antenne
- One of the **fifteen forts of Rome** built between **1877 and 1891**; area **2.5 hectares**;
  "Prussian" style; strategic role ended 1919. (same)
- ⚠️ **DATE CONFLICT inside the one article.** Infobox: `Inizio costruzione 1880 / Termine costruzione
  1884`. Body: «Fu costruito a partire dal 1882 e terminato nel 1891». Do not print a single build
  date; either give the 1877–1891 programme range for the fifteen forts, or state both and attribute.
- Used as a store by the Reggimento Radiotelegrafisti until the 1940s, then decommissioned; **ceded by
  the demanio to the Comune in 1958** for the 1960 Olympics to be used as a campsite, though the
  campsite was only built in the surrounding park because private dwellings had already gone up
  inside the fort. Condition: **abandoned**; owner Roma Capitale; **`Visitabile = no`**. (same)
- ❌❌ **The article ends «Il forte è vincolato ai sensi del Codice dei beni culturali e del paesaggio
  con D.M. 6 agosto 2008.» This is exactly the class of claim the evidence ruling bans. It must not
  appear on the page in any language or paraphrase.**
- Status: **closed**, sourced to `Visitabile = no`.

**10. Antemnae** — kind `historic-site`

- A fortified *oppidum* of *Latium vetus* whose remains are identified on **Monte Antenne**, today
  inside the park of **Villa Ada**. The name is from Latin *ante amnes*, "before the rivers", for its
  position over the confluence of the Aniene and the Tiber, dominating the **via Salaria** near
  **Ponte Salario**. https://it.wikipedia.org/wiki/Antemnae
- Its people were the **Antemnati**; Plutarch, Dionysius of Halicarnassus, Livy, Virgil and Silius
  Italicus all mention the town; Rome under Romulus stormed and took it after the Antemnates raided
  Roman territory following the rape of the Sabine women. (same)
- Infobox: **discovered 1834**, archaeologist **Antonio Nibby**; excavations **1878, 1978, 1986**;
  in the care of the **Sovrintendenza capitolina ai beni culturali**; surface given as 13 (units
  unstated in the infobox — do not print a bare "13"). (same)
- Sovrintendenza, independently: «Sulla collina oggi in parte occupata dal Forte Antenne… era ubicata
  l'antica città di Antemnae (ante amnem = davanti al fiume), il cui nome diede origine all'attuale
  toponimo.»
  https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/ville_dei_nobili/villa_ada_savoia
- Note the two sources disagree on the etymology's grammar (*ante amnes* vs *ante amnem*). Trivial;
  pick one and attribute.

**11. Monte Antenne** — kind `attraction`, weak-to-medium

- A hill on the north edge of the Monti Parioli, left bank of the Tiber near the mouth of the Aniene,
  in **Municipio Roma II**; **60 m high**; coordinates 41.939131, 12.496366. A green area forming part
  of Villa Ada, crowned by Forte Antenne, with the Mosque at its foot.
  https://it.wikipedia.org/wiki/Monte_Antenne_(colle_di_Roma)
- Probably better as context inside the Villa Ada, Antemnae and Forte Antenne records than as its own
  place. The verifier should decide.

**12. Catacomba dei Giordani** — kind `historic-site`

- «posta sul lato sinistro di via Salaria, **sotto l'odierna villa Ada, nel moderno quartiere
  Parioli**». Category `Roma Q. II Parioli`.
  https://it.wikipedia.org/wiki/Catacomba_dei_Giordani
- Datable **between the second half of the 3rd century and the first half of the 5th**, on
  inscriptions bearing the extreme dates **269** and **436**; named for the **Giordani**, the family
  that owned the ground. (same)
- **Brought to light in 1720** by **Marcantonio Boldetti** and **Giovanni Marangoni**, who took it for
  the catacomb of Trasone; **Giovanni Battista de Rossi** still identified it as Priscilla's in 1873
  and **Raffaele Garrucci** re-asserted Trasone; the identification was settled by the **1966**
  excavations of the **Pontificia Commissione di Archeologia Sacra**, above all by finding the tomb of
  the martyr Alexander, whom several historical sources place *in coemeterio Iordanorum*. (same)
- Ancient sources attest the tombs of the martyrs **Martial, Vitalis and Alexander**, held by
  tradition to be three of the seven sons of **St Felicity**; the *Depositio Martyrum* records their
  burial on the via Salaria on **10 July**. (same)
- In the care of the **Pontificia commissione di archeologia sacra**. The infobox's `Visitabile` field
  is blank and I found no source stating whether it can be visited — say so in that form
  ("No source states whether it can be visited, so none is given here"), never as a research note.
- ⚠️ the article carries a Wikipedia `{{NN}}` unsourced-section banner (August 2025). Weight
  accordingly.

**13. Catacomba di Sant'Ilaria** — kind `historic-site`

- «una piccola catacomba di Roma, posta sul lato sinistro di via Salaria, **sotto l'odierna Villa Ada,
  nel moderno quartiere Parioli**». Category `Roma Q. II Parioli`.
  https://it.wikipedia.org/wiki/Catacomba_di_Sant%27Ilaria
- Joined to the neighbouring **cemetery of the Giordani** in recent times — around the **18th
  century** — by *corpisantari*, relic-hunters, who opened a narrow connecting gallery. (same)
- **Visited by Antonio Bosio at the end of the 16th century**, who described some of its paintings in
  his posthumous *Roma sotterranea*. Little survives: the scene in the so-called **arcosolio
  dell'auriga** is now only the heads of the horses and of a running figure. (same)
- Reached by a modern entrance which leads on, after the visit, to the Giordani. (same)
- In the care of the Pontificia Commissione di Archeologia Sacra.

**14. Catacomba di Trasone** — kind `historic-site`

- «posta sulla via Salaria, **all'incrocio con via Yser, nel quartiere Parioli**». Category
  `Roma Q. II Parioli`. https://it.wikipedia.org/wiki/Catacomba_di_Trasone
- Named for **Trasone**, a wealthy Roman of the time of **Diocletian (284–305)** who converted to
  Christianity and is named in the *passio* of **St Susanna**; in ancient sources also *Coemeterium
  Thrasonis ad s. Saturninum*, for the martyr Saturninus buried there, whose above-ground basilica
  was still visible at the end of the 16th century. (same)
- Entered **through a manhole**; grew out of a sandstone quarry turned to burial, with galleries on
  **five levels**; runs almost entirely **beneath Villa Grazioli and its park**, with a light-well
  visible in the courtyard of Villa Ada's Palazzina Reale. (same)
- ❌ the article calls it «una delle più profonde catacombe di Roma». Superlative-adjacent priority
  claim. **Do not carry it.** Five levels is a count and publishes.
- ⚠️ `{{NN}}` unsourced banner (August 2025).

### 2.3 Villa Glori and the Acqua Acetosa — 6 records

**15. Villa Glori (Parco della Rimembranza)** — kind `park`

- **25 hectares.** Entrances **piazzale del Parco della Rimembranza** and **viale Maresciallo
  Pilsudski**. Located «**Municipio Roma II, quartiere Parioli**». Epoch XIX–XX century.
  https://www.sovraintendenzaroma.it/i_luoghi/ville_e_parchi_storici/passeggiate_parchi_e_giardini/villa_glori
- Occupies a roughly quadrangular bluff falling steeply to the Tiber at the Acqua Acetosa, running on
  above the Villaggio Olimpico and the Auditorium; it forms the north-west end of the Monti Parioli.
  https://it.wikipedia.org/wiki/Villa_Glori
- Unlike Rome's older villas it was never a suburban villa but vineyard and hunting ground; its
  oldest building is a **fortified casale**. (same)
- **On 23 October 1867** the hill was the site of the clash in which **Enrico Cairoli** died and his
  brother **Giovanni**, gravely wounded, died soon after: some seventy volunteers had crossed into
  papal territory on 20 October and entrenched themselves in a vineyard on **Monte Cacciarello**,
  where the papal zouaves overran them. The vineyard belonged to **Vincenzo Glori**, whose name the
  hill kept. (Sovrintendenza page, as above; it.wiki agrees.)
  ⚠️ the two sources give the incursion as 20 October and the fight as the night of 22–23 / the day
  of 23 October. Print the 23 October 1867 date for the clash.
- **Cesare Pascarella** made the episode into twenty-five sonnets, *Villa Gloria*, published **1886**,
  in Romanesco. https://it.wikipedia.org/wiki/Villa_Glori
- The **1883** master plan first proposed a large green space between the Parioli and Ponte Milvio and
  expropriation began; the **monument to the fallen of 1867 was inaugurated in 1895** — an antique
  Pietrasanta marble column on a rustic travertine base; the council resolved on **23 October 1923**
  to make the area a **Parco della Rimembranza** for the dead of the First World War; **Raffaele de
  Vico**, architect of the Servizio Giardini, designed it **in eight months**, and **the park opened on
  18 May 1924**. (Sovrintendenza.)
- At **piazzale del Mandorlo** stand the monument to the Cairoli brothers, the small brick structure
  that held a dry branch of the almond tree under which Enrico Cairoli died, and a cippus to Italian
  servicemen who died in peacetime; the avenues are named for the men of the 1867 fight (viale dei
  Settanta). A plaque to the carabinieri killed at **Nassiriya in 2003** stands behind Paolo
  Canevari's *Uomo Erba*. (Sovrintendenza.)
- **Between 1997 and 2000** the Comune installed works by contemporary artists in the park, among them
  **Uncini, Canevari, Castagna, Dompè, Staccioli and Kounellis**. (Sovrintendenza.)
  ⚠️ **PHOTO CAUTION** for the photo wave: Kounellis died 2017, Staccioli 2018, Uncini 2008 — all
  in copyright, and Italy has no freedom of panorama. Written about freely; photographed never.
- Also on the site, from **1929**, three wooden pavilions built for a summer colony for children of
  precarious health. (Sovrintendenza.)
- Status: **open**. No source gives hours; say so.

**16. Ipogeo di Villa Glori** — kind `historic-site`

- A Roman hypogeum near Villa Glori, **found by chance in 1794** by "professor Albigaard"; several
  rooms used as tombs, some being chamber tombs divided into niches; frescoes of **Hercules, Bacchus
  and the Dioscuri**; in the care of the **Sovrintendenza capitolina**; infobox `Visitabile = No`;
  dated 2nd century by the Parioli article's list. Category `Roma Q. II Parioli`.
  https://it.wikipedia.org/wiki/Ipogeo_di_Villa_Glori and
  http://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/ipogeo_di_villa_glori
- Status: **closed**, sourced.
- ⚠️ stub-tagged article; thin. Honest length is a short paragraph.

**17. Fontana dell'Acqua Acetosa** — kind `historic-site`

- In the flat of the same name, **in the quartiere Parioli**, where the Tiber makes a deep bend; the
  fountain sits **below street level** and is reached by a **stair**. Category `Roma Q. II Parioli`.
  https://it.wikipedia.org/wiki/Fontana_dell%27Acqua_Acetosa
- The name is from the ferruginous spring here, known to 16th-century Romans as *acqua acetosa* — not
  to be confused with the one in the Fonte Ostiense area. (same)
- **In 1613 Paul V had the water analysed**; it was found potable and held good for complaints of the
  kidneys, stomach, spleen and liver, and some bottled it to sell in the city. **In 1619** he had
  **Giovanni Vasanzio** build a fountain, recorded by the plaque still low on the wall; at that date
  the source was simply a wall the water ran from. **Innocent X** had it restored. **Alexander VII**
  commissioned the present fountain. (same)
- Its attribution to **Bernini is probably false**; the designs are supposed to be by **Andrea Sacchi**
  or the architect **Marco Antonio De' Rossi**. (same) — usable, and note that saying "probably not
  Bernini" is not a superlative.
- Form: a stair down to an exedra-shaped front with **three niches**, each carrying the **Chigi arms**
  — six mounts beneath an eight-pointed star — above a small basin fed by a spout; above, a tympanum
  with the papal arms and a plaque. (same)
- **In 1712 Clement XI** ordered a further restoration, recorded on a plaque above the central niche;
  there had been complaints about reduced flow, long queues and worsening water. The commission
  included the papal physician **Giovanni Maria Lancisi** and the architect **Egidio Maria Bordoni**.
  (same)
- Paul V's dedicatory epigraph, in full: *«Renibus et stomacho, spleni corique medetur / Mille malis
  prodest ista salubris aqua»* — "this healthful water is medicine for the kidneys, the stomach, the
  spleen and the heart, and is good for a thousand ills". (same)
- Status: **open** (a street fountain). No hours exist; say nothing.

**18. Fonte di Anna Perenna** — kind `historic-site`

- A **votive fountain of the 4th century BC** dedicated to the goddess **Anna Perenna**, **found in
  1999** and in use until the **6th century AD**. Category `Roma Q. II Parioli`.
  https://it.wikipedia.org/wiki/Fonte_di_Anna_Perenna
- The find fixed with certainty the site of Anna Perenna's **sacred grove**, named by **Ovid** in the
  *Fasti*, and produced an exceptional quantity of evidence for magical practice over many centuries.
  (same)
- Rectangular, in **tufa blocks and brick**, found at a depth of **between 6.2 m and 10.3 m** below
  street level, with an altar. (same)
- The material from the adjoining cistern is displayed at the **Museo nazionale romano, Terme di
  Diocleziano**, in a reconstruction of the magical site. (same) — the display is in Castro Pretorio,
  which is already shipped; the *fountain* is the Parioli place.
- In the care of the **Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma**;
  `Visitabile = Visite guidate su prenotazione` — guided visits by booking.
  http://www.soprintendenzaspecialeroma.it/schede/fonte-di-anna-perenna_2976/
- ⚠️⚠️ **STRADDLER, and the sharpest one in this file.** The Auditorium article's footnote says the
  sacred grove of Anna Perenna «è stato individuato in **piazza Euclide**», and my OSM point test on
  piazza Euclide (41.92620, 12.48200) returns **`Pinciano (Q. III)`**. If the fountain is under piazza
  Euclide it is Pinciano's, not Parioli's, despite the `Roma Q. II Parioli` category. I found no
  street address on any page I reached, and the Soprintendenza Speciale scheda URL in the infobox is
  the only place one might exist. **Flagged, not resolved. This one may well go to Pinciano.**

**19. Centro di preparazione olimpica "Giulio Onesti" (Centro sportivo dell'Acqua Acetosa)** — kind `stadium`

- A federal sports facility of the **CONI**, «in un'area del **quartiere Parioli** nota come Acqua
  Acetosa»; **opened 1960**; total area **220,000 m²**. Category `Roma Q. II Parioli`.
  https://it.wikipedia.org/wiki/Centro_di_preparazione_olimpica_Giulio_Onesti
- Built for training and for competition, and housing a sports-medicine centre and an **anti-doping
  laboratory**. (same)
- Resident clubs listed: Roma Baseball, S.S. Lazio (cricket), Butterfly (field hockey), Rugby Lazio
  1927, Club Scherma Roma (fencing), Roma Softball. (same)
- CONI's own property schedule is cited by the article:
  https://www.coni.it/it/coni/amministrazione-trasparente/beni-immobili-e-gestione-patrimonio/patrimonio-immobiliare.html
- Weakish for a traveller — an athletes' campus, not an attraction. Verifier's call.

**20. Circolo Canottieri Aniene** — kind `attraction`, **probable reject**

- **Lungotevere dell'Acqua Acetosa, 119**; a polisportiva **founded in 1892** by **Alessandro Morani**
  and the Fasoli brothers; began building its present Acqua Acetosa premises in the 1950s; rowing,
  canoe, swimming, tennis, futsal, sailing, diving, padel. https://it.wikipedia.org/wiki/Circolo_Canottieri_Aniene
- A **private members' club**. Not visitable, and its category is `C.C. Aniene`, not a quartiere
  category, so I have no quartiere-level confirmation beyond the Lungotevere address and the Parioli
  article naming it among the Acqua Acetosa facilities. I would reject it; listed for completeness.

### 2.4 The Villaggio Olimpico and the 1960 venues — 4 records

The whole of this group is **photo-restricted**: Adalberto Libera d. 1963 (to 2033), Luigi Moretti
d. 1973 (to 2043), Vittorio Cafiero d. 1983, Vincenzo Monaco d. 1987, Pier Luigi Nervi d. 1979 (to
2049), Annibale Vitellozzi d. 1993 (to 2063), Francesco Berarducci d. 1992 (to 2062). Italy has no
freedom of panorama. **Write, do not photograph.** (Death years are my own arithmetic from the
linked biographies, offered as a warning to the photo wave, not as a corpus claim.)

**21. Villaggio Olimpico** — kind `attraction`

- **Zona urbanistica 2A** of Municipio Roma II; «Si estende sul quartiere Q. II Parioli». Category
  `Roma Q. II Parioli`. https://it.wikipedia.org/wiki/Villaggio_Olimpico_(zona_di_Roma)
- On the flat between the hill of Villa Glori and the Tiber, where a shanty settlement of wartime
  evacuees called **campo Parioli** had grown up in the 1940s; the 1960 Olympics were the occasion to
  clear and demolish it. (same)
- Built **1958–59** to designs by **Vittorio Cafiero, Adalberto Libera, Amedeo Luccichenti, Vincenzo
  Monaco and Luigi Moretti**, funded by the state employees' pension fund, the Comune di Roma and
  **CONI**; the completed buildings were handed to **INCIS** and allotted by competition to state
  employees. (same)
- **Inaugurated in 1960 for the XVII Olympiad.** https://it.wikipedia.org/wiki/Parioli
- Cut north–south by the **Corso di Francia viaduct**; its main axis is **viale XVII Olimpiade**.
  https://it.wikipedia.org/wiki/Villaggio_Olimpico_(zona_di_Roma)
- Boundaries of the zona: north 20D Farnesina and 20A Tor di Quinto; east 2Y Villa Ada; south 2B
  Parioli; west 2C Flaminio. (same)
- ⚠️ Structurally this is a *zona urbanistica* inside the quartiere, like Garbatella inside Ostiense.
  Per the brief's Garbatella ruling it should be **written as part of Parioli**, not as a unit of its
  own. I have written it as one place.

**22. Palazzetto dello Sport (PalaTiziano)** — kind `stadium`

- **Largo Apollodoro**, near **viale Tiziano**, the road parallel to via Flaminia between viale delle
  Belle Arti and Ponte Milvio. https://it.wikipedia.org/wiki/Palazzetto_dello_Sport_(Roma)
- **Conceived and designed in 1956** by the architect **Annibale Vitellozzi** with structural
  engineering by **Pier Luigi Nervi**; **built 1956–57** for events of the XVII Olympiad; contractor
  **Ingg. Nervi e Bartoli Spa**; building surface **2,650 m²**, total **4,800 m²**; refurbished
  **2022–23** at a cost of **€3,200,000**. (same)
- Long used by Pallacanestro Virtus Roma, on and off until 2018, and by several volleyball sides.
  (same)
- ⚠️⚠️ **STRADDLER, CONFLICTING EVIDENCE.** it.wiki says outright «sorge a Roma **nel quartiere
  Parioli**» and carries the `Roma Q. II Parioli` category. But my OSM point test at
  **41.92620, 12.46980** returned **`Flaminio (Q. I)`** plus Municipio Roma II — *not* Parioli. Either
  my coordinate is off by a hundred metres (I estimated it; the article gives none) or the
  Parioli/Flaminio line at viale Tiziano genuinely cuts between the two Nervi venues. **Do not
  resolve. Flaminio's finder will claim this.**

**23. Stadio Flaminio** — kind `stadium`

- **Viale Tiziano.** Designed by the architect **Antonio Nervi** with structural engineering by his
  father **Pier Luigi Nervi**; **built 1957–58**; **inaugurated 19 March 1959**, on the site of the
  **Stadio Nazionale**, demolished in 1957; built for the **1960 Olympic football tournament**; pitch
  **105 × 70 m**, building **181 × 131 m**, total area **21,600 m²**; contractor Ingg. Nervi & Bartoli
  Spa; cost 900,000,000 lire. https://it.wikipedia.org/wiki/Stadio_Flaminio
- Initially held over **40,000** spectators, later cut by more than half to meet safety rules. (same)
- Used from the 1970s by the **Italy national rugby team** and by Rugby Roma Olimpic; also by Lazio,
  Roma, Lodigiani and Atletico Roma at various times. (same)
- ⚠️ **THE NAME LIES, AND THE ARBITRATOR NEEDS TO KNOW IT.** it.wiki, verbatim: «**nonostante il nome
  lo stadio appartiene amministrativamente al quartiere Parioli**, alla cui estremità occidentale esso
  sorge, essendo il citato viale Tiziano adiacente al confine amministrativo con il quartiere
  Flaminio». My OSM point test at **41.92800, 12.46990** independently returned
  **`Parioli (Q. II)` + `Municipio Roma II`**. Two sources, one answer: Parioli. But Flaminio's finder
  will reach for a stadium called "Flaminio", so **flagged**.
- Status: the article describes it as long disused pending a refurbishment. I did not find a current
  official statement of its access. **Write no status claim beyond `open` with the prose saying
  nothing is known**, or let the verifier check.

**24. Chiesa di San Valentino al Villaggio Olimpico** — kind `historic-site`

- **Viale XVII Olimpiade**, at the Villaggio Olimpico, «nel quartiere Parioli». Category
  `Chiese di Roma - Q.II Parioli`. https://it.wikipedia.org/wiki/Chiesa_di_San_Valentino_(Roma)
- Built **1983–1986** to a design by **Francesco Berarducci** and **consecrated by Cardinal Ugo
  Poletti on 23 November 1986**. (same)
- **Exposed brick with a steel and glass roof**, preceded by a **statue of an angel** that reproduces
  one of the statues of **Ponte Sant'Angelo**. (same)
- The parish was constituted **2 May 1962** by the decree *Ludis olimpicis solemniter* of Cardinal
  Vicar **Clemente Micara** and entrusted to the diocesan clergy; before the present building went up
  the parish was visited by **Paul VI on 5 June 1969** and by **John Paul II on 16 February 1992**.
  (same, citing http://parrocchiasanvalentinoroma.org/StoriaDiocesana.html)
- ⚠️ the article carries a `{{C}}` accuracy banner (August 2025) about its bibliography.
- ⚠️ **PHOTO REJECT** — Berarducci d. 1992.

### 2.5 Churches — 2 more

**25. Chiesa di San Roberto Bellarmino** — kind `historic-site`

- **Piazza Ungheria**, «nel quartiere Parioli, rientrante all'interno dei confini del **Municipio Roma
  II**», sourced by the article to the Diocese of Rome. Coordinates 41.923365, 12.492988. Category
  `Chiese di Roma - Q.II Parioli`. https://it.wikipedia.org/wiki/Chiesa_di_San_Roberto_Bellarmino
  and https://www.diocesidiroma.it/phpenti/ente/?ID=73
- Built **1931–1933** to a design by **Clemente Busiri Vici**; **rationalist**. (same)
- **Opened for worship on 10 June 1933** and **consecrated on 20 May 1959**. ⚠️ the infobox of the same
  article gives the consecration as **30 May 1959**. Conflict inside one article: attribute or omit.
- Dedicated to **Robert Bellarmine**, canonised **1930**, a few years before the church was built.
  (same)
- Parish erected **13 May 1933** by **Pius XI** with the apostolic constitution *Quae maiori
  religionis*, entrusted to the **Jesuits**, replaced by diocesan clergy in **2003**; a
  **cardinalatial title since 1969**; visited by **John Paul II on 2 March 1980**. (same)
- The quartiere's article uses the church at piazza Ungheria as its lead image, and calls the parish
  the principal Catholic centre for Parioli's residents. https://it.wikipedia.org/wiki/Parioli
- Status: **open**. No hours sourced; say so.

**26. Chiesa di San Luigi Gonzaga** — kind `historic-site`

- **Via di Villa Emiliani**, «nel quartiere Parioli». Coordinates 41.929353, 12.490107. Category
  `Chiese di Roma - Q.II Parioli`. https://it.wikipedia.org/wiki/Chiesa_di_San_Luigi_Gonzaga_(Roma)
- **Foundation stone laid Thursday 18 July 1929**, at a ceremony led by Cardinal **Basilio Pompilj**,
  vicar general of Pius XI; built by the architect **Enrico Castelli** in **1929** as the church of the
  adjoining Carmelite convent. (same)
- The whole complex was **sold to the Comboni missionaries in 1958**; the church became a **parish on
  7 January 1963** by the decree *Percrescente incolarum numero* of Cardinal Vicar **Clemente Micara**,
  its territory taken from the parishes of San Roberto Bellarmino and Sacro Cuore Immacolato di Maria,
  and was restored inside at that time. (same)
- **John Paul II visited on 6 November 1988**; a **relic of the heart of St Aloysius Gonzaga** was
  enthroned on **13 March 2012**; a side chapel holds a fresco of **St Thomas by Kiko Argüello**,
  **1993**. (same)
- Official parish site: https://www.sanluigi.roma.it/ — establishes identity, location and (if it
  lists them) mass times. I did not fetch it; the verifier should, for hours.
- ⚠️ Kiko Argüello is living: the fresco is a **photo reject**.

### 2.6 The Mosque

**27. Grande Moschea di Roma** — kind `historic-site` (or `attraction`)

- **Viale della Moschea.** Coordinates 41.934769, 12.495221. Category `Roma Q. II Parioli`.
  https://it.wikipedia.org/wiki/Moschea_di_Roma
- Stands at the foot of the **Monti Parioli** and of **Monte Antenne**, next to the Acqua Acetosa
  sports facilities; seat of the **Centro islamico culturale d'Italia**. (same)
- **30,000 m² of ground**; capacity **up to 12,000** worshippers, and on major feasts such as the
  Feast of the Sacrifice **about 30,000–40,000**. (same)
- By the engineer **Vittorio Gigliotti** and the architect **Paolo Portoghesi**; infobox: begun
  **1984**, opened **1995**; the Parioli article dates the building **1984–95**. (same and
  https://it.wikipedia.org/wiki/Parioli)
- Style given as postmodern and Islamic; the article traces the proposal back through Mussolini, the
  Egyptian representative to the Holy See Taher el Omari in the 1950s, and the Aga Khan. (same)
- ❌❌ **it.wiki's first sentence calls it «la più grande moschea d'Europa» and cites Turismo Roma,
  Centro Astalli and Rainews for it. BANNED — a superlative, and attribution does not save it.**
  Publish the 30,000 m² and the 12,000 capacity instead.
- ⚠️ **PHOTO REJECT** — Paolo Portoghesi died 2023; Vittorio Gigliotti died 2019.
- ⚠️ I could not reach an official site for the Centro islamico culturale d'Italia
  (`centroislamico.it` is the **Milan** centre, a different body). **Write no visiting hours.**

### 2.7 Theatres and studios

**28. Teatro Parioli–Costanzo** — kind `theater`

- **Via Giosuè Borsi, 20**, «nel quartiere Parioli». Coordinates 41.926131, 12.488219. Category
  `Roma Q. II Parioli`. https://it.wikipedia.org/wiki/Teatro_Parioli
- **Built in 1938** as a cinema; **opened as a theatre on 29 December 1958**, the first piece being
  Schnitzler's *Girotondo* staged by the **Ernesto Calindri–Vivi Gioi** company. (same, citing
  La Stampa of 30 December 1958)
- Known for hosting the recording of the ***Maurizio Costanzo Show***; **renamed Teatro
  Parioli–Costanzo on 20 February 2024**; since 2024 also a theatre school for children and young
  people directed by **Raoul Bova** and **Rocío Muñoz Morales**. (same)
- ⚠️ https://www.teatroparioli.it/ failed with an SSL error from this network. **No hours, no
  programme, no ticket prices.**

**29. Teatro Piccolo** — **probable reject**

- The puppet theatre of **Carlo Ludovico Bompiani** and **Adriana Muratori**, set up at the end of the
  1940s as the successor of the **"Baracca delle Favole"** founded in **1927** by **Trilussa** with
  **Guglielmo Guasta**, revived in **1946** after Trilussa's death as the "Baracca delle Fate".
  https://it.wikipedia.org/wiki/Teatro_Piccolo_(Roma)
- ⚠️ Categorised **both** `Roma Q. II Parioli` **and** `Roma Q. XV Della Vittoria`. **No address on the
  page. No indication it still exists.** A travel guide cannot honestly send anyone there. Reject
  unless the verifier finds a current address.

**30. Teatro Euclide / Forum Theatre, and Forum Studios (Forum Music Village)** — **RULED OUT of Parioli, flagged**

- The Parioli article lists **Teatro Euclide** under its `Teatro` heading.
  https://it.wikipedia.org/wiki/Parioli
- But the theatre is at **Piazza Euclide, 34**, in the lower rooms of the **Basilica del Sacro Cuore
  Immacolato di Maria**, and both the basilica and the studios beside it are **Pinciano**:
  - the basilica's article is categorised **`Chiese di Roma - Q.III Pinciano`**
    https://it.wikipedia.org/wiki/Basilica_del_Sacro_Cuore_Immacolato_di_Maria
  - the Forum Studios article says outright: «Gli studi sorgono negli ambienti inferiori della
    Basilica del Sacro Cuore Immacolato di Maria **in piazza Euclide, nel quartiere Pinciano**»
    https://it.wikipedia.org/wiki/Forum_Music_Village
- Content, in case the arbitrator sends them to Pinciano and Pinciano's finder wants a head start:
  the three big rooms were built between 1924 and 1956 inside the substructures of Brasini's basilica;
  the **Cinema Euclide** occupied the long underground room mirroring the transept from the late
  1950s; the theatre conversion dates from **1990**; in **October 2020** the neighbouring **Forum
  Studios** bought it. **Forum Studios** itself was founded in **1970** by **Luis Bacalov, Ennio
  Morricone, Piero Piccioni, Armando Trovajoli**, the conductor **Bruno Nicolai**, the engineers
  Sergio Marcotulli and Pino Mastroianni and the manager Enrico De Melis; De André's *Non al denaro,
  non all'amore né al cielo* (1971) and *Storia di un impiegato* (1973) and the Goblin *Roller* (1976)
  were cut there. https://it.wikipedia.org/wiki/Teatro_Euclide and
  https://it.wikipedia.org/wiki/Forum_Music_Village
- **OSM settles the square, if not the theatre: `is_in(41.92620, 12.48200)` — piazza Euclide —
  returns `Pinciano (Q. III)` plus Municipio Roma II. Not Parioli.**
- ⚠️ **CONFLICT for the arbitrator: one it.wiki page puts Teatro Euclide in Parioli; the basilica
  above it, the studios beside it and an OSM point test on the square itself all say Pinciano. I lean
  Pinciano and have not claimed it.**

### 2.8 Bridges and roads that cross Parioli

**31. Ponte Flaminio** — kind `historic-site`

- Carries **Corso di Francia** over the Tiber, «nei quartieri **Parioli** e **Tor di Quinto** e nella
  zona di Vigna Clara». Categories `Roma Q. II Parioli` and `Roma Q. XVIII Tor di Quinto`.
  https://it.wikipedia.org/wiki/Ponte_Flaminio
- Designed by **Armando Brasini** with the engineer **Aristide Giannelli**; **begun 1938, finished
  1951**; **254.94 m long, 27 m wide**, an arch bridge. (same)
- Planned in the 1930s because Ponte Milvio could no longer take the Cassia and Flaminia traffic, and
  as a scenic entrance to the capital from the north; it was to be called **"Ponte XXVIII Ottobre"**
  for the date of the March on Rome. **From 1960** it connects to the Corso di Francia viaduct. (same)
- ⚠️ **STRADDLER with Tor di Quinto**, which is out of scope this wave, so no other finder will claim
  it — but it is genuinely half in another quartiere. Flagged.

**32. Ponte Salario** — kind `historic-site`

- Carries the **via Salaria** over the **Aniene**, «nei quartieri **Parioli** e **Trieste** e nella
  zona **Val Melaina**». Coordinates 41.939853, 12.508621. Categories `Roma Q. II Parioli`,
  `Roma Q. XVII Trieste`, `Roma Z. I Val Melaina`. https://it.wikipedia.org/wiki/Ponte_Salario
- The last bridge the Aniene passes under before it joins the Tiber, and the one Roman bridge over the
  Aniene named by ancient writers; **rebuilt in 1930**. (same)
- **Livy**, *Ab Urbe condita* VII.9, on the Gauls camping «tre miglia da Roma, sulla via Salaria, al di
  là del ponte sull'Aniene»; in **211 BC Hannibal** camped on the plain before it; **Ricimer** halted
  there in **472**, **Witiges** in **537**; it was badly damaged in **544**. (same)
- ⚠️ **THREE-WAY STRADDLER** (Parioli / Trieste / Val Melaina). Trieste and Val Melaina are out of
  scope, so Parioli is the only in-scope claimant, but the arbitrator should say so explicitly.

**33. Corso di Francia** — kind `attraction`, weak

- Runs south–north «tra i quartieri **Parioli** e **Tor di Quinto**», from **viale Maresciallo
  Pilsudski** to **via Cassia Nuova**, crossing via del Foro Italico; **CAP 00191**; built between the
  1930s and the 1960s. Categories `Roma Q. II Parioli`, `Roma Q. XVIII Tor di Quinto`.
  https://it.wikipedia.org/wiki/Corso_di_Francia
- The Parioli article: built for the 1960 Olympics, it ends against the Parioli hill and distributes
  traffic toward piazza Ungheria on one side and the city centre on the other; its **viaduct crosses
  the Villaggio Olimpico**. https://it.wikipedia.org/wiki/Parioli
- A road, not a sight. I would reject it as a place and use it as a locator. Listed for completeness.

**34. Ponte Milvio** — **FLAGGED, NOT CLAIMED**

- Categorised `Roma Q. II Parioli` on it.wiki, and Parioli's western boundary runs «da viale
  Maresciallo Pilsudski a piazzale Cardinal Consalvi (**Ponte Milvio**)» — i.e. the bridge is
  literally the boundary marker. https://it.wikipedia.org/wiki/Parioli
- But `docs/rome/scope-quartieri.md` lists **Ponte Milvio among Q. I Flaminio's** monuments.
- **I have not written it.** Flaminio's finder will want it. Arbitrator's call.

### 2.9 Other parks and gardens

**35. Villa Grazioli (the public garden)** — kind `park`

- A **4,200 m²** garden «nel **Municipio II**, nel quartiere **Parioli**», reached **from via Bruxelles
  and viale di Villa Grazioli**; what survives of the original park after the 1920s subdivision.
  Category `Roma Q. II Parioli`. https://it.wikipedia.org/wiki/Villa_Grazioli_(Roma)
- The area is documented as **"Villa Lecci"** on the 1839 plan and on the **1845–6** plan of the
  *cantoni* of Rome drawn for **Baron von Moltke**; earlier traces are credited to a "Biondi Paolo"
  property. It passed to the **Grazioli Lante della Rovere** family at the end of the 19th century,
  which gave it its name. (same)
- **In 1937 Clemente Busiri Vici** was commissioned to build a villa here to be given to General
  **Pietro Badoglio**; **on the night of 7–8 September 1943 Badoglio met the American general Maxwell
  Taylor there**, the day before the armistice of Cassibile was announced. **The former Badoglio villa
  now houses the embassy of the People's Republic of China.** (same, citing
  https://www.roma2pass.it/villa-badoglio/)
- Note the connection to entry 14: the **Catacomba di Trasone** runs almost entirely beneath this
  villa and its park.

**36. Villa Balestra** — **RULED OUT of Parioli, flagged**

- The Parioli article lists Villa Balestra under `Ville e parchi`.
  https://it.wikipedia.org/wiki/Parioli
- Its own article contradicts that outright: the garden occupies the summit of **Monte San Valentino**,
  the far tip of the Monti Parioli overlooking viale Tiziano, but «**pertiene tuttavia al quartiere
  Pinciano**, come la via Bartolomeo Ammannati da cui vi si accede», and it is categorised
  **`Roma Q. III Pinciano`**. Address **Via Bartolomeo Ammannati, 3**; **15,000 m²**; owner Comune di
  Roma, citing comune.roma.it. https://it.wikipedia.org/wiki/Villa_Balestra
- **I lean Pinciano and have not claimed it. Flagged for the arbitrator, because Pinciano's finder is
  working this wave and will find the same contradiction from the other side.**

### 2.10 Weak, listed so the verifier can reject them on the record

**37. Caserma Scipio Slataper** — viale Romania, **1934–36**; formerly the seat of the **MVSN**, today
the **Comando militare della Capitale**. https://it.wikipedia.org/wiki/Parioli — a working military
headquarters, not visitable. Reject.

**38. Caserma Azolino Hazon** — viale Romania, **1954–56**, raised on the footprint of the former
**Pastrengo** cavalry barracks to house the **Comando generale dell'Arma dei Carabinieri**. (same) —
same objection. Reject.

**39. Luiss Guido Carli, Villa de Heritz campus** — between **viale Romania and via Panama**. The
villino is a **1929 neo-baroque** building by **Giovanni Battista Milani**, dominated by a pronaos,
vestibule and elliptical staircase; it survives from the 2.7-hectare park of Count de Heritz, who had
assembled several suburban villas into one estate in **1878**, subdivided from **1919** when via
Panama, via Lima and via Lisbona were cut; in **1940** the casino and park were bought by the Suore
dell'Assunzione. https://it.wikipedia.org/wiki/Luiss_Guido_Carli
⚠️ **STRADDLER**: the university's main seat is **viale Pola**, in Q. XVII Trieste, and its own
article says the university sits «in mezzo ai quartieri Parioli e Trieste». Also ❌ the same article
carries QS ranking claims — banned superlatives. A private campus, not a visitor place. Reject, but
the villino is a real building.

**40. Istituto per l'Oriente Carlo Alfonso Nallino** — categorised `Roma Q. II Parioli`; a research
institute and specialist library. https://it.wikipedia.org/wiki/Istituto_per_l%27Oriente_Carlo_Alfonso_Nallino
Not a visitor place. Reject unless it has public reading hours, which I did not establish.

**41. Collina Fleming** — **RULE OUT.** Categorised `Roma Q. II Parioli` on it.wiki, but the article's
own text says it is «nel territorio del **municipio Roma XV**», 45 m high, at 41.940833, 12.473889 —
i.e. north of the Parioli boundary. https://it.wikipedia.org/wiki/Collina_Fleming The category is
wrong. Not Parioli's.

**42. Squares and streets usable only as locators** — piazza Ungheria (San Roberto Bellarmino's
square); **piazza delle Muse**, a wide rectangular opening on a ridge with a broad view over the
northern edge of the city; **piazza Grecia**, used for events at the time of the 1960 Games and now
benches and shops; **viale dei Parioli**, the broad tree-lined avenue running from piazza Ungheria
down to Villa Glori and the Acqua Acetosa, laid out on the initiative of the landowners Filonardi and
Giorgi as a "passeggiata di città" with a riding track alongside under the trees; **viale XVII
Olimpiade**, which carries a weekly **Friday market** in its last stretch toward viale Tiziano;
**via degli Olimpionici**; **Salita dei Parioli**; **viale Bruno Buozzi**. All from
https://it.wikipedia.org/wiki/Parioli — one source, the quartiere's own article, unfootnoted. Usable
as locators, not as places. ⚠️ note that "at the north end of the quartiere" and similar are banned;
"on viale dei Parioli" is fine.

**43. Stations of the Roma–Civita Castellana–Viterbo line inside the quartiere** — **Piazza Euclide,
Monte Antenne, Acqua Acetosa, Campi Sportivi**. https://it.wikipedia.org/wiki/Parioli
Piazza Euclide station is probably Pinciano's on the piazza Euclide evidence above. Only `Stazione di
Campi Sportivi` is categorised `Roma Q. II Parioli`. Transport nodes, not places. Reject; use for
access lines.

---

## 3. STRADDLERS — every one, unresolved, for the arbitrator

I have resolved nothing on this list. Ten items.

| # | Place | Competing claims | Evidence each way | My lean |
|---|---|---|---|---|
| 1 | **Villa romana dell'Auditorium** (entry 4) | Parioli / Flaminio | Sovrintendenza Capitolina prints «Nel quartiere **Flaminio**»; it.wiki lists it under Q. II Parioli; the Auditorium 65 m away is Parioli by OSM point test | Parioli, but an official body says otherwise in print |
| 2 | **Palazzetto dello Sport (PalaTiziano)** (22) | Parioli / Flaminio | it.wiki text + category say **Parioli**; my OSM point test at 41.9262, 12.4698 returned **Flaminio (Q. I)** | genuinely unresolved — my coordinate was estimated |
| 3 | **Stadio Flaminio** (23) | Parioli / Flaminio | it.wiki says explicitly Parioli «nonostante il nome»; OSM point test returned **Parioli (Q. II)** | Parioli, twice confirmed — but the *name* will pull Flaminio's finder |
| 4 | **Ponte Milvio** (34) | Parioli / Flaminio | categorised `Roma Q. II Parioli`; but it is the boundary marker itself (piazzale Cardinal Consalvi), and `scope-quartieri.md` gives it to **Flaminio** | Flaminio — not claimed here |
| 5 | **Villa Balestra** (36) | Parioli / Pinciano | Parioli's article lists it; its own article says «pertiene tuttavia al quartiere **Pinciano**» and it is categorised Q. III | Pinciano — not claimed here |
| 6 | **Teatro Euclide / Forum Studios** (30) | Parioli / Pinciano | Parioli's article lists Teatro Euclide; the basilica above them is categorised Q. III **Pinciano**, the Forum Studios article says «in piazza Euclide, nel quartiere **Pinciano**», and OSM `is_in` on piazza Euclide returns **Pinciano (Q. III)** | Pinciano — not claimed here |
| 7 | **Fonte di Anna Perenna** (18) | Parioli / Pinciano | categorised `Roma Q. II Parioli`; but the Auditorium article's footnote places Anna Perenna's grove **«in piazza Euclide»**, and OSM puts piazza Euclide in **Pinciano (Q. III)** | unresolved, leaning Pinciano; I found no street address |
| 8 | **Ponte Flaminio** (31) | Parioli / Tor di Quinto (+ zona Vigna Clara) | dual-categorised; Tor di Quinto is **out of scope**, so no rival claimant | Parioli by default |
| 9 | **Ponte Salario** (32) | Parioli / Trieste / Val Melaina | triple-categorised; both rivals **out of scope** | Parioli by default |
| 10 | **Corso di Francia** (33) | Parioli / Tor di Quinto | dual-categorised; Tor di Quinto out of scope | Parioli by default, if it survives as a place at all |

And, for completeness, **four things the brief told me to write that are not straddlers but simple
misassignments** — Catacombe di Priscilla, Sant'Agnese fuori le mura, Mausoleo di Santa Costanza
(all **Q. XVII Trieste**) and Villa Torlonia (**Q. V Nomentano**). No zone in this wave may take
them. They are not Parioli's, and nobody in scope owns them either. See §0.

---

## 4. Rule compliance — the traps in this particular quartiere

**Superlatives I found and am refusing to carry:**

| Source phrase | Where | Why banned |
|---|---|---|
| «Il più grande luogo di spettacolo d'Europa» / "The largest entertainment venue in Europe" | auditorium.com, the operator's own strapline | superlative; an operator's self-description does not save it |
| «la più grande moschea d'Europa» | it.wiki Moschea di Roma, cited to Turismo Roma, Centro Astalli, Rainews | superlative; attribution does not save a priority claim |
| «il quarto più grande parco pubblico di Roma dopo…» | it.wiki Villa Ada | size ranking, not a position in an official series |
| «una delle più profonde catacombe di Roma» | it.wiki Catacomba di Trasone | priority claim |
| «Sono gli studi di registrazione italiani più importanti in termini di patrimonio e acustica» | it.wiki Forum Music Village | superlative (and Pinciano's problem anyway) |
| «È tra le 25 migliori università al mondo… nella top 100 per Business and Management» | it.wiki Luiss, cited to QS | ranking claim |
| «la più antica fra tutte le consolari romane» (of the via Salaria) | it.wiki Villa Ada | priority claim about a road |

**Designation claims I found and am refusing to carry:** exactly one, and it is a blatant one —
Forte Antenne's «Il forte è **vincolato** ai sensi del Codice dei beni culturali e del paesaggio con
D.M. 6 agosto 2008». Banned outright by the evidence ruling. Nothing else in the Parioli corpus
makes a protection claim.

**UNESCO:** nothing in Q. II may claim to lie inside the Historic Centre property. Parioli is entirely
outside the Aurelian Walls and two kilometres north of them. No page here should mention the 1980
inscription at all.

**Vatican / Lateran Treaty:** **none.** No Art. 15 or Art. 16 property falls in Parioli. This quartiere
raises no version of the San Paolo fuori le Mura problem.

**Photographs — `"photos": []` everywhere this wave.** For the photo wave, Parioli is unusually bad,
because almost everything worth a picture is 20th-century architecture with a living or
recently-dead author and Italy has no freedom of panorama:

- **Hard rejects:** Auditorium Parco della Musica and everything Piano designed inside it, including
  the MUSA gallery (Renzo Piano, living); Grande Moschea di Roma (Portoghesi d. 2023, Gigliotti
  d. 2019); Chiesa di San Valentino (Berarducci d. 1992); Palazzetto dello Sport and Stadio Flaminio
  (P. L. Nervi d. 1979, A. Nervi d. 1979, Vitellozzi d. 1993); the Villaggio Olimpico housing (Libera
  d. 1963, Moretti d. 1973, Cafiero d. 1983, Monaco d. 1987); the contemporary sculpture in Villa
  Glori (Kounellis d. 2017, Staccioli d. 2018, Uncini d. 2008); Kiko Argüello's 1993 fresco in San
  Luigi Gonzaga (living); Ponte Flaminio (Brasini d. 1965 → 2035); San Roberto Bellarmino (Busiri
  Vici d. 1981 → 2051).
- **Probably clear, and worth flagging as the photo wave's short list:** Villa Ada's park, lake and
  18th–19th-century buildings (Tempio di Flora, Scuderie Reali, Torre Gotica, Chalet svizzero);
  Palazzina Reale, 1873–75; Forte Antenne, 1880s; Monte Antenne; the Fontana dell'Acqua Acetosa,
  1619/Alexander VII; Villa Glori's fortified casale and the 1895 column; Ponte Salario as rebuilt
  1930 (the 1930 rebuild's designer is unnamed in the source — check before shooting).
  All death-year arithmetic above is mine, offered as a warning, not as corpus text.

**Research-method language to keep off the page.** Several of my findings *are* method: the 429s from
Nominatim, the SSL failure at teatroparioli.it, the dead 060608 link behind Villa Ada's hours, the
JavaScript-only santacecilia.it page. **None of that goes near a reader.** Where the fact is missing,
the page says the plain thing — "No source states its opening hours, so none are given here" — and
the argument stays in this file.

**"Status" fields.** Affirmative `closed` is defensible for exactly three records, all sourced:
Palazzina Reale (a working embassy), Forte Antenne (`Visitabile = no`), Ipogeo di Villa Glori
(`Visitabile = No`). Fonte di Anna Perenna is `open` with the prose saying visits are by booking
(`Visite guidate su prenotazione`). Everything else defaults to `open` with the prose stating that
nothing is known about access where nothing is.

---

## 5. Honest yield

**43 candidates. My own count of what a travel guide could write honestly: 26 to 30.** That is a
**guide**, not a town page — comfortably. Parioli is not Ostia Lido.

The shape of it:

- **A dense core of 12 that would carry the page on their own**: the Auditorium, MUSA, Museo
  Aristaios, the Villa romana, Villa Ada, the Palazzina Reale, the bunker, Forte Antenne, Antemnae,
  Villa Glori, the Fontana dell'Acqua Acetosa and the Mosque. Every one of these has a date, an
  author or an excavation, and a source I actually fetched.
- **A solid second rank of about 10**: the three Villa Ada catacombs, the Trasone catacomb, the
  Villaggio Olimpico, Stadio Flaminio, the Teatro Parioli, the three churches, Villa Grazioli, the
  Ipogeo di Villa Glori, Ponte Flaminio and Ponte Salario.
- **A tail of about 15 that I expect the verifier to cut**: the barracks, Luiss, the Istituto per
  l'Oriente, the Circolo Canottieri, the Teatro Piccolo, Corso di Francia, the railway stations, the
  streets and squares, and the Auditorium's exhibition spaces as separate records.
- **Four items the brief handed me that belong to zones out of scope**, and **six genuine straddlers
  with Flaminio or Pinciano**, both of which are being written this wave.

**Where the yield is genuinely thin, and I want to say so plainly:** Parioli is a residential
quartiere of the 1920s–1950s, and the guide-shaped things it is famous for locally — the restaurants
and bars of viale dei Parioli and piazza Euclide, the "pariolino" scene, the embassies — are
**unsourceable under these rules**. There is no register of Rome restaurants I could reach; an
operator's own site cannot establish how long it has traded; and the only trading fact I did find
(the it.wiki claim that a Radisson opened on piazza Euclide in 1960) sits on an unfootnoted,
`{{F}}`-tagged page about a different subject, in a square that is probably Pinciano's anyway. **I
have proposed no restaurant, cafe, hotel or shop for Parioli, and I do not think one can be written
honestly this wave.** If the corpus wants Parioli's food, that is a separate sourcing problem.

Similarly, the quartiere's famous residents and film locations (Juan Carlos of Bourbon born here in
1938; *Il sorpasso*; the Villaggio Olimpico as a shooting location) sit on the quartiere article's
unfootnoted `romavisibile.it` narrative, an archived dead link. **Colour, not facts.** I would keep
them out.

---

## 6. Source inventory

Fetched and read in full (all 2026-09-03):

- **it.wikipedia via the `action=parse` API**, raw wikitext: `Parioli`, `Auditorium Parco della
  Musica`, `Villa Ada`, `Villa Glori`, `Villa Balestra`, `Moschea di Roma`, `Villaggio Olimpico (zona
  di Roma)`, `Teatro Parioli`, `Catacombe di Priscilla`, `Mausoleo di Santa Costanza`, `Complesso
  monumentale di Sant'Agnese fuori le mura`, `Villa Torlonia (Roma)`, `Chiesa di San Roberto
  Bellarmino`, `Chiesa di San Luigi Gonzaga (Roma)`, `Chiesa di San Valentino (Roma)`, `Forte
  Antenne`, `Antemnae`, `Catacomba dei Giordani`, `Catacomba di Sant'Ilaria`, `Catacomba di Trasone`,
  `Villa Grazioli (Roma)`, `Museo degli strumenti musicali dell'Accademia nazionale di Santa Cecilia`,
  `Teatro Euclide`, `Palazzetto dello Sport (Roma)`, `Palazzina Reale (Roma)`, `Bunker villa Ada
  Savoia`, `Fontana dell'Acqua Acetosa`, `Centro di preparazione olimpica Giulio Onesti`, `Circolo
  Canottieri Aniene`, `Ipogeo di Villa Glori`, `Fonte di Anna Perenna`, `Monte Antenne (colle di
  Roma)`, `Ponte Flaminio`, `Ponte Salario`, `Basilica del Sacro Cuore Immacolato di Maria`, `Forum
  Music Village`, `Teatro Piccolo (Roma)`, `Corso di Francia`, `Villa Ada (zona di Roma)`, `Stadio
  Flaminio`, `Istituto per l'Oriente Carlo Alfonso Nallino`, `Collina Fleming`, `Luiss Guido Carli`.
- **it.wikipedia `action=query&list=categorymembers`** for `Roma Q. II Parioli` (43 members),
  `Chiese di Roma - Q.II Parioli` (3 members), `Villa Ada (Roma)` (4 members). This is what caught
  Trasone, Anna Perenna, Collina Fleming and Ponte Milvio, none of which the quartiere article lists.
- **Sovrintendenza Capitolina ai Beni Culturali** — `villa_ada_savoia`, `villa_glori`,
  `museo_archeologico_della_villa_romana_dell_auditorium_e_del_suo_territorio` and its `villa_romana`
  sub-page. All four returned HTTP 200 and are the strongest non-Wikipedia evidence in this file.
- **auditorium.com** — home page (address, hall capacities, hours), `musei-e-spazi-espositivi`,
  `museum/museo-aristaios`. HTTP 200.
- **OpenStreetMap via Overpass** — `is_in()` point tests. Relation **5459647** is Parioli:
  `boundary=place, place=suburb, name=Parioli, official_name=Quartiere II Parioli, ref=Q. II,
  wikidata=Q3365096, wikipedia=it:Parioli`. Confirmed the Auditorium and the Stadio Flaminio as
  Parioli; returned Flaminio for my estimated PalaTiziano point.

Attempted and failed, so nothing in this file rests on them: Nominatim reverse geocoding (HTTP 429 on
every point, every attempt); `teatroparioli.it` (SSL EOF); `060608.it`'s Villa Ada page (redirects to
the portal home); `santacecilia.it`'s MUSA page (loads, but content is JavaScript-rendered);
`turismoroma.it` (same); `catacombepriscilla.com` (not fetched — Priscilla is Trieste's, not ours).
