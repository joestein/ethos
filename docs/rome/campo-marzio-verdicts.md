# Campo Marzio (R. IV) — VERIFIER VERDICTS

Wave 4. Written 2026-09-02. Adjudicates `docs/rome/campo-marzio-finder.md`.
I did not gather this evidence. Every ruling below is mine, against the sources, not against the
finder's confidence.

| | |
|---|---|
| Objects adjudicated | **134** (the finder's 126 numbered, plus the Museo dell'Ara Pacis and Piazza Borghese it recorded without numbers, plus the six unnumbered piazze in §6.8) |
| **PUBLISH** | **54** |
| **REWRITE** | **35** |
| **DROP** | **45** |
| **Surviving records** | **89** |
| Tier ruling | **GUIDE**, and not close |
| Straddlers escalated unresolved | **11** |

---

## 0. Collision check, run mechanically

`python3 .superpowers/taken_slugs.py` dumped in full (450 places, 12 rioni) and searched offline
against 120 name fragments drawn from this file. Result: **no candidate in this file is already
owned.** The four already-shipped objects the finder correctly kept out stay out:

- `colonna / basilica-di-san-lorenzo-in-lucina-colonna`
- `colonna / orologio-di-augusto-colonna`
- `colonna / palazzo-di-propaganda-fide-colonna`
- `prati / ponte-regina-margherita-prati-rome`

**Five NAME collisions that are not ownership collisions.** These are the shape the corpus gate
catches. Each Campo Marzio record must carry a disambiguator in name and slug:

| Campo Marzio record | Already shipped elsewhere | Required form |
|---|---|---|
| Fontana della Dea Roma | `campitelli / fontana-della-dea-roma-campidoglio` | must carry "piazza del Popolo" |
| Fontana del Nettuno | `parione / fontana-del-nettuno-piazza-navona-rome` | must carry "piazza del Popolo" |
| Fontana del Mosè (Pincio) | `castro-pretorio / fontana-del-mose-castro-pretorio-rome` | dropped below on other grounds |
| Santa Maria della Concezione in Campo Marzio | `ludovisi / santa-maria-della-concezione-cappuccini-ludovisi-rome` | must carry "in Campo Marzio" |
| Aurelian Walls segment | `trastevere / mura-aureliane-segment-trastevere-rome` | must name the segment |

The Colosseum → Celio and Teatro di Marcello → Sant'Angelo rulings are reproduced in the finder's
own polygon run and neither object appears in this file. Nothing further to do.

---

## 1. Re-fetches — the sources the finder leaned on hardest

I re-fetched sixteen. All were reachable. Fourteen say exactly what the finder claimed. **Two do
not, and both errors run in the same direction: the finder under-read its best source.**

| Source | Verdict |
|---|---|
| turismoroma `/it/page/rione-iv-campo-marzio` | **CONFIRMED.** The `Confini:` ring is quoted verbatim and correctly. |
| sovraintendenzaroma `scalinata_di_trinita_dei_monti` | **CONFIRMED.** 1723–1726, De Sanctis (1693–1740), 1559 idea, Gueffier 1660, Bernini workshop, Clement XI 1717, Benedict XIII 1726, restoration 1995, reopened 22 Sept 2016, walkable 23 Sept 2016. |
| turismoroma `/luoghi/mausoleo-di-augusto` | **CONFIRMED with two corrections.** See §3.2. |
| turismoroma `/luoghi/il-vero-alfredo` | **CONFIRMED on the designation trap; FINDER MISSED THE HOURS.** See §3.1. |
| turismoroma `/luoghi/antico-caffe-greco` + `anticocaffegreco.eu` | **CONFIRMED.** No `Orari` field on the Roma Capitale page at all; the homepage banner and the 16/18 June 2026 Consiglio di Stato releases are there as described. |
| turismoroma `/luoghi/museo-atelier-canova-tadolini` | **CONFIRMED.** "notificato dallo Stato italiano e non è vendibile né movibile" is present and is banned. |
| turismoroma `/luoghi/villa-medici-accademia-di-francia` | **CONFIRMED on the numbers; FINDER MISSED THE HOURS.** See §3.1. |
| turismoroma `/luoghi/casa-di-goethe` | **CONFIRMED**, hours and all. |
| turismoroma `/luoghi/sala-da-babington` | **CONFIRMED**, including both superlatives. |
| turismoroma `/luoghi/colonna-dellimmacolata` | **CONFIRMED**, 8 December 1857. |
| turismoroma `/luoghi/obelisco-flaminio` | **CONFIRMED with one correction.** See §3.3. |
| turismoroma `/luoghi/museo-dellara-pacis` | **CONFIRMED; hours are institutional and shippable.** See §3.1. |
| turismoroma `/it/tag/negozi-storici` | **CONFIRMED.** Eight entries city-wide; three are Campo Marzio's; Antica Farmacia Reale is Via del Gambero 13/a, i.e. Colonna. |
| sovraintendenzaroma `fontana_in_piazza_nicosia` | **CONFIRMED in full**, but see §3.4 on the name. |
| sovraintendenzaroma `passeggiata_del_pincio` | **CONFIRMED and it settles the date conflict.** See §3.5. |
| `allsaintsrome.org` | **CONFIRMED as text, REFUSED as evidence.** See §3.6. |
| `fondazionedechirico.org/casa-museo` | **CONFIRMED**, days, slots, prices, 15-person cap. |
| it.wikipedia (six articles, `action=query&prop=extracts`) | **CONFIRMED verbatim**: Via Sistina split, Via Frattina split, Rome Baptist Church "nel rione Campo Marzio", Palazzo Magistrale 1630/1834/extraterritoriality, Ognissanti "una delle due chiese anglicane romane", Obelisco Sallustiano "nel rione Campo Marzio". |

---

## 2. THE FINDER'S CENTRAL METHODOLOGICAL ERROR

**The finder triaged turismoroma pages by character count without reading the bodies, and
turismoroma pages carry roughly 7,000 characters of navigation chrome before the body starts.**
Every "turismoroma page exists but is only N characters, therefore thin" judgement in §10.4, §10.5
and §6.6 is unsafe. I tested the three the finder rated thinnest:

- **Santa Lucia della Tinta**, called "only 1,788 characters, the thinnest body I pulled". The body
  gives a 10th-century date, the dyers of the ancient **via Trinitatis** (today via dei Condotti)
  that ran to Ponte Sant'Angelo and from whom the church is named, the **1394** dedication to Lucy,
  and a fabric description of façade, campanile, single nave with three niches a side and a
  polychrome coffered wooden ceiling. That is a complete record.
- **Palazzo Rondinini**, called thin on a one-line Wikipedia stub. The body names **Marchese
  Giuseppe Rondinini**, a collector from Faenza; architects **Gabriele Valvassori** (the Doria
  Pamphilj family architect, most of the exterior) and **Alessandro Dori** (the via del Corso
  façade, the courtyard and the interiors); an enlargement of a building that had belonged to the
  **Cavalier d'Arpino**; four years of work finished in **1764** when the collection moved in.
- **Palazzo Cardelli**, called thin at 1,854 characters. The body gives construction from **1592**
  by **Francesco da Volterra**, two courtyards (the main one with the stables, the second with an
  **acqua vergine** well), an entrance hall with stuccoes and niches, coffered ceilings and tempera
  by **Francesco Allegrini**, a roof garden with a stucco **Apollo** by Naldini, the Domus Magna
  façade by **Francesco Capriani da Volterra** then **Gaspare Guerra**, and the rear and the
  staircase by **Francesco Peparelli**, **1630–1639**.

All three are PUBLISH. The one page where the finder's instinct was right is **Piazza Mignanelli**,
which really is a single sentence and that sentence is the Colonna dell'Immacolata's.

**Consequence for the arbitrator: the surviving count is higher than the finder's own estimate of
"roughly 60–70, of which perhaps 25 strong". It is 89.** The finder cut its own case.

---

## 3. Named corrections

### 3.1 Three sets of opening hours the finder declared unsourced and which Roma Capitale states

The finder's §14 lists the Ara Pacis hours as unfinished, and its §10.2/§6.6 treat Il Vero Alfredo
and Villa Medici as hours-free. All three carry an institutional `Orari` field.

- **Museo dell'Ara Pacis** — publish verbatim: *"Open daily 9.30–19.30. On 24 and 31 December
  9.30–14.00. Last admission one hour before closing."*
- **Il Vero Alfredo** — publish verbatim: *"Tuesday to Sunday 12.30–15.30 and 19.30–23.30. Closed
  Monday lunchtime."*
- **Villa Medici** — publish verbatim: *"Open 9.30–19.00. Last admission 18.30. Closed Tuesday."*
  This replaces the same-day homepage banner the finder rightly refused. The banner stays refused.

The finder was correct that **Keats-Shelley** and **Santa Maria del Popolo** hours are unsourced.

### 3.2 Mausoleo di Augusto — two corrections

1. **"Nerva was the last emperor buried in it" overstates the source.** Roma Capitale reads: *"Per
   breve tempo il Mausoleo ospitò le ceneri di Vespasiano e infine di Nerva e, dopo oltre un secolo
   dall'ultima deposizione, si riaprì per ospitare le ceneri di Giulia Domna, moglie dell'imperatore
   Settimio Severo."* The last deposition was **Julia Domna**, not Nerva. Exact replacement wording:
   > *The mausoleum held the ashes of Vespasian and then of Nerva for a short time, and more than a
   > century after the last deposition it was opened again for those of Julia Domna, wife of
   > Septimius Severus.*
   The finder also omitted that **Nero and Julia the Elder were excluded**, which the source states
   and which is better copy than the ranking it reached for.
2. **Roma Capitale contradicts itself on the dimensions.** The monument page says *"diametro di 300
   piedi romani (circa 87 metri)"*; the rione page says *"quarantaquattro metri di altezza e
   ottantanove di diametro"*. Publish the monument page's figure, which carries its own unit
   derivation: **300 Roman feet, about 87 m**. Do not publish 89 m. Do not publish both.

Status ruling stands and is mandatory: `status` closed, wording from the source — *"Closed since 6
June 2022 while work on piazza Augusto Imperatore goes forward."*

### 3.3 Obelisco Flaminio — the 10 BC date attaches to the wrong verb

The finder wrote "brought to Rome in 10 BC and set on the spina of the Circus Maximus". The source
dates the *placement*, not the transport: *"Nel 10 a.C., insieme all'Obelisco Campense … venne
collocato sulla spina del Circo Massimo."* Exact replacement wording:
> *In 10 BC it was set on the spina of the Circus Maximus, together with the Obelisco Campense, to
> mark Octavian Augustus' conquest of Egypt. Three centuries later the Obelisco Lateranense
> followed.*

That sentence also earns two honest cross-references the finder did not spot: the **Obelisco
Campense is Colonna's already-shipped `obelisco-di-montecitorio-colonna`**, and the **Obelisco
Lateranense is Monti's `obelisco-lateranense-rome`**.

Three superlatives on that one page. The finder caught one. All three go: *"uno dei più importanti
obelischi della città"*, *"il grande architetto Giuseppe Valadier"*, and *"una delle più splendide
sistemazioni di un obelisco in tutto il mondo"*. **"il primo a essere portato dall'Egitto a Roma"
also goes** — it is a priority claim over the whole city's obelisk history with no register behind
it, which is the case the rulings were written for. The **25.90 m / 36.50 m** measurements, the
**c. 1300 BC** carving, **Seti I and Ramesses II**, **1589** and **Valadier 1823** carry the record.

### 3.4 Fontana del Trullo is not the institutional name

The Sovrintendenza page is headed **"Fontana in Piazza Nicosia"** and never uses "Trullo"; that name
comes from it.wikipedia. Roma Capitale is the stronger source and the rule says attribute
aggregators. Name and slug take **Fontana in Piazza Nicosia**; the "del Trullo" nickname and its
piazza-del-Trullo etymology may appear in the prose attributed to it.wikipedia.

### 3.5 The Pincio date conflict is settled, and not in favour of either number the finder had

The Sovrintendenza page resolves all four figures. Exact replacement wording, which is a sequence
and therefore publishable:
> *The promenade was decided on in 1810, when the Napoleonic administration set out to create a
> public walk and Giuseppe Valadier presented a scheme linking piazza del Popolo to the Pincian
> hill. The central government sent the architect Louis Martin Berthault instead, who reworked it
> and proposed the elliptical form of the square. After 1814 the work returned to Valadier, who
> carried it through the Restoration to 1834. The promenade passed to the Municipio in 1848.*

That also independently supports the busts record: **the first 50 busts of illustrious men were
placed in 1849**, commissioned by the republican government — which is where the "a partire dal
1849" in both of the finder's sources comes from.

### 3.6 All Saints' — the church's own site cannot establish how long it has traded

*"An Anglican congregation has been worshipping together in the city of Rome since 1816"* and *"For
over 120 years we have gathered in our church"* are trading-duration claims sourced only to the
institution asserting them. The rule is explicit: an official site establishes identity, location
and hours and nothing else. **Both sentences DROP.** The **service times DO publish** — Sundays Low
Mass 8:30, Sung Mass with choir 10:30, Thursdays midweek Mass 12:45, worship in English — as does
membership of the Church of England's Diocese in Europe. The it.wikipedia facts (Old Catholic
co-use; one of the two Anglican churches in Rome, the other being Castro Pretorio's shipped
**San Paolo dentro le Mura**) publish, attributed.

The same test, applied consistently, is why the six hotels drop and why the finder's own §10.2
reasoning was right.

---

## 4. The three rulings the finder asked for

### 4.1 Designation claims — the finder is upheld, in full, on both

Both sentences are present in Roma Capitale's own words and **both are refused**:

- Il Vero Alfredo: *"oggetto di vincolo e tutela da parte del Ministero dei beni e delle attività
  culturali"* — banned outright.
- Canova-Tadolini: *"è stato notificato dallo Stato italiano e non è vendibile né movibile"* —
  banned outright. The finder's suggested residue, "presented as inalienable", is a paraphrase of a
  designation claim. **Do not use it either.** Say nothing about the collection's legal status.

The finder's handling of the two edge items is correct and I adopt it: *Locali storici d'Italia* is
a private association and may be named as one; the *negozi storici* tag is a Roma Capitale editorial
listing and publishes as **"Roma Capitale lists it among the city's historic shops"** — a fact about
a list. Neither is a designation.

**One the finder missed.** The Museo dell'Ara Pacis page opens *"rappresenta la prima opera di
architettura realizzata nel centro storico di Roma dalla caduta del fascismo ai nostri giorni"* and
calls Meier *"autore di alcuni dei più notevoli musei della seconda metà del Novecento"*. Both go.
The finder also states the museum is "a 2006 building" — **that date is on none of the pages
fetched**. Source it or omit it; the building publishes as *designed by Richard Meier & Partners
Architects* with no year.

### 4.2 Palazzo Magistrale and Palazzo di Spagna — RULED

The finder's recommendation is sound and I adopt it as a ruling, with the wording fixed.

**Neither is a Lateran Treaty property and no page may reach for Art. 15 or Art. 16 language.**
Neither is Vatican City. Both stand on Italian soil in rione Campo Marzio and both publish here.

- **Palazzo Magistrale.** Publish exactly this and no more: *"Via dei Condotti 68 is the principal
  seat of the Sovereign Military Order of Malta. The Order has owned the building since 1630, and
  since 1834 it has been the residence of the Grand Master and the seat of the Order's government."*
  **Say nothing about sovereignty, extraterritoriality or international legal personality.** The
  finder's own source hedges all three ways at once — exempt from civil jurisdiction, not a subject
  of international law, without territory — and a corpus that cannot check a heritage register
  certainly cannot adjudicate that.
- **Palazzo di Spagna.** Publish: *"Palazzo di Spagna houses the Embassy of Spain to the Holy See,
  and piazza di Spagna takes its name from it."* The finder's Spanish MFA source 404'd, so nothing
  rests on it. The **3,589 m² / 11,000 m²** figures and the 17th-century naming come from
  it.wikipedia and publish attributed.

### 4.3 Antico Caffè Greco — RULED: ship as historic-site, no status of "open"

The finder's first option is correct. Three sources imply three states, Roma Capitale carries **no
`Orari` field at all**, and the business's own homepage currently reads *"IL CAFFÈ GRECO STA PER
ESSERE DISTRUTTO"*. Ship it as **kind: historic-site**, on the **1760** foundation by **Nicola di
Madalena**, the **Sala Omnibus** and its medallions, the **300+ works**, the Gruppo dei Romanisti's
first-Wednesday meetings and the *Strenna dei Romanisti* published each 21 April since 1940.

- **No `status` may say open.** No hours. No sentence that implies a reader can buy a coffee there.
- The superlative *"la più grande galleria d'arte privata aperta al pubblico del mondo"* goes, from
  both sources that carry it.
- The finder did not flag that the same page opens *"Via dei Condotti, la via più elegante ed
  esclusiva di Roma"*. That superlative must not migrate into the **via dei Condotti** record.

---

## 5. Verdicts

### 5.1 PUBLISH — 54

Sourced, correctly represented, no rule violation. Ship as the finder wrote them.

Porta del Popolo · Obelisco Sallustiano · Obelisco del Pincio (Antinoo) · Piazza di Spagna ·
Scalinata di Trinità dei Monti · Casa Museo Giorgio de Chirico · Piazza del Popolo · Fontana dei
Leoni · Fontane sarcofago di piazza del Popolo · Chiesa di Santa Maria dei Miracoli · Basilica di
Santa Maria in Montesanto · Chiesa e Convento della Trinità dei Monti · Basilica dei Santi Ambrogio
e Carlo al Corso · Chiesa di Sant'Antonio dei Portoghesi · Chiesa di San Girolamo dei Croati ·
Chiesa di San Rocco all'Augusteo · Chiesa dei Santi Nomi di Gesù e Maria · Chiesa di San Giacomo in
Augusta · Chiesa di Sant'Ivo dei Bretoni · Chiesa di Santa Maria Portae Paradisi · Chiesa della
Santissima Trinità degli Spagnoli · Chiesa di San Nicola dei Prefetti · Chiesa di Santa Lucia della
Tinta · Chiesa di San Gregorio dei Muratori · Chiesa dei Santi Giorgio e Martiri inglesi · Cappella
di San Giovanni Battista de La Salle · Rome Baptist Church · Busti del Pincio · Idrocronometro del
Pincio · Monumento ai fratelli Cairoli · Monumento a Enrico Toti · Statue dei viali del Pincio ·
Fontana della Vasca del Pincio · Convento di Santa Rita al Pincio · Palazzo Firenze · Palazzo
Núñez-Torlonia · Palazzi dell'INPS a Piazza Augusto Imperatore · Palazzo dell'ex Unione Militare ·
Palazzo Rondinini · Palazzo Nainer · Palazzo Aragona Gonzaga · Palazzo Capilupi · Palazzo Della
Porta Negroni Caffarelli · Palazzo Corrodi · Palazzo Cardelli · Via del Babuino · Via Margutta · Via
della Croce · Via Borgognona · Via di Ripetta · Via Gregoriana · Lungotevere in Augusta · Piazza
Borghese · Museo dell'Ara Pacis.

Notes attaching to four of them:

- **Idrocronometro** — keep Roma Capitale's own hedge, *generalmente attribuito* to Giovanni
  Battista Embriaco. Do not harden it. Do not write "in Villa Borghese".
- **Rome Baptist Church** — publishes here on both geometry and it.wikipedia's explicit "nel rione
  Campo Marzio". The square it stands on is escalated (§6). The page must not imply it is the
  church on the square, since Colonna owns the basilica.
- **Museo dell'Ara Pacis** — a separate record from the altar, per §2.4, which I uphold: separate
  Wikidata items, separate OSM ways, separate Roma Capitale pages. Hours as §3.1. No 2006 date.
- **Piazza Borghese** — the finder buried this in an unnumbered list. Roma Capitale gives it a real
  body: Borghese settlement from the 16th century, Paul V (1605–1621) and Cardinal Scipione
  Borghese's expansion between via di Ripetta and San Girolamo degli Schiavoni, a private space
  attached to the palace until the 19th century, closed on the via di Ripetta side **1923–1928** by
  what is now a Sapienza Architecture faculty building.

### 5.2 REWRITE — 35

Fact sound, wording overreaches. Replacement wording is exact; the author uses it verbatim.

| # | Place | What goes, and what replaces it |
|---|---|---|
| 1 | **Ara Pacis Augustae** | Drop *"uno degli esempi più alti dell'arte classica"*. Keep: voted by the Senate **13 BC**, inaugurated **9 BC**, on Augustus' return from Gaul and Spain; built on the via Flaminia at the edge of the northern Campo Marzio; silting from Tiber floods buried it and memory of it was lost; reconstruction decided for the **1937/8** bimillenary, entrusted to **Giuseppe Moretti**, carried out in the summer of **1938** in a pavilion on via di Ripetta by **Ballio Morpurgo**; **one Roman mile (1,472 m)** from the pomerium. |
| 2 | **Mausoleo di Augusto** | Drop *"il più grande sepolcro circolare che si conosca"*. Apply §3.2 in full: the Julia Domna sentence, and 87 m only. Status closed, wording from §3.2. |
| 3 | **Obelisco Flaminio** | Apply §3.3: three superlatives out, the priority claim out, the 10 BC sentence replaced. |
| 4 | **Muro Torto** | Publish the wall, not the road. Say what it is — a stretch of ancient substructure wall behind the Pincio that gives viale del Muro Torto its name — and stop. Do not write that it is "at the boundary with Villa Borghese" as a location for the reader; Roma Capitale's ring lists viale del Muro Torto as the rione edge and that is the publishable form. Subject to the §6 walls ruling. |
| 5 | **Porto di Ripetta** | Drop "the three great 18th-century Roman urban works" — the source says *altre importanti realizzazioni urbane del secolo*, which is not a ranking. Replacement: *"The Sovrintendenza names the port alongside the Spanish Steps and the Trevi Fountain as urban works of the same century."* Keep: a river landing in front of San Girolamo dei Croati, **demolished at the end of the 19th century**, its site later covered by Ponte Cavour (1902). The record must read as a lost place with a surviving fountain. |
| 6 | **Fontana della Barcaccia** | Resolve the attribution rather than shipping both. Replacement: *"Built 1626–29. Roma Capitale attributes it to Pietro Bernini, father of Gian Lorenzo; it.wikipedia gives it to Pietro Bernini and his son."* Keep the boat form, the identical bow and stern, the low gunwales, the two Urban VIII arms with three bees and the mock gunports. |
| 7 | **Colonna dell'Immacolata** | Take Roma Capitale's date — **inaugurated 8 December 1857** — and do not mention the it.wikipedia 8 September variant. Everything else confirmed: 1777 discovery at the Benedictine convent of Santa Maria in Campo Marzio, c. eighty years by Palazzo Montecitorio, 1854 decision by Pius IX, funded by Ferdinand II after the lapse of the Chinea, Luigi Poletti, c. 12 m cipollino, bronze Virgin 4 m by Giuseppe Obici, raised by 220 firemen, wreath each 8 December. |
| 8 | **Keats-Shelley Memorial House** | Hours line, verbatim and with no reason given: *"No source available here states its opening hours, so none are given."* Never why. Keep: the house where **John Keats died in 1821**, first opened to the public in **1909**, letters, manuscripts, portraits and relics, two terraces, bookshop, screening room. |
| 9 | **Babingtons** | Drop *"la prima sala da tè di Roma e d'Italia"* and *"uno dei luoghi più famosi ed ambiti al mondo"*. Keep: founded **1893** by **Anna Maria Babington and Isabel Cargill**, run today by Isabel's great-grandchildren **Chiara and Rory**; **Monday to Sunday 10.00–21.15**; Piazza di Spagna 23. |
| 10 | **Palazzo di Spagna** | Wording fixed by §4.2. |
| 11 | **Fontana del Nettuno (piazza del Popolo)** | Name and slug must carry *piazza del Popolo* — Parione owns a Fontana del Nettuno. Facts confirmed: completed **1823**, **Valadier and Giovanni Ceccarini (c. 1790–1861)**, travertine semicircular basin and shell, Neptune with trident, two tritons on dolphins. |
| 12 | **Fontana della Dea Roma (piazza del Popolo)** | Same treatment — Campitelli owns `fontana-della-dea-roma-campidoglio`, and the Sovrintendenza itself keeps two separate pages. Facts confirmed. |
| 13 | **Basilica di Santa Maria del Popolo** | Drop *"uno degli edifici più significativi del Rinascimento romano"*. Hours: *"No source available here states its visiting hours, so none are given."* Keep the Chigi, Cerasi and della Rovere chapels as the finder has them, and the **sette chiese** substitution for San Sebastiano fuori le Mura, which is a sequence fact from Roma Capitale. |
| 14 | **Fontana in Piazza Nicosia** | Renamed per §3.4. The five-location history is confirmed word for word and is one of the best records in the file. |
| 15 | **Chiesa di Ognissanti / All Saints'** | Apply §3.6: the 1816 and "over 120 years" sentences go; the service times stay. |
| 16 | **Chiesa di Sant'Atanasio dei Greci** | Omit the street number — Wikidata says 151, it.wikipedia says 149, and nothing resolves it. **Do not cite turismoroma `/it/luoghi/chiesa-di-santatanasio`**; the finder is right that it is a different church 5 km east. Keep the Byzantine rite and the 1957 reassembly of the Babuino fountain beside it. |
| 17 | **Santa Maria della Concezione in Campo Marzio** | Name and slug must carry *in Campo Marzio* against Ludovisi's shipped Concezione dei Cappuccini. Keep the Syro-Antiochene rectory. |
| 18 | **Oratorio del SS Sacramento di San Lorenzo in Lucina** | Slug must not read as Colonna's shipped basilica. Keep: built **1578** for the confraternity of the Santissimo Sacramento of San Lorenzo in Lucina, late-16th-century painted wooden panels, baroque concerts from the late 19th century, **deconsecrated in 1970 and now commercial premises**. |
| 19 | **Pincio — Terrazza e Passeggiata** | Date sequence replaced verbatim by §3.5. Keep the three *prospettive*, the 1830 Igea niches, the *Fama* relief and winged lions, the three-arched loggia carrying the Belvedere, and the **1936 nymphaeum by Raffaele De Vico** as a mostra of the Acqua Vergine. |
| 20 | **Piazzale Napoleone I / Belvedere** | Drop every reach: *"uno dei più celebri panorami"*, *"indimenticabili tramonti"*. Write the enumerated sightlines instead, which are facts: piazza del Popolo below, the dome of St Peter's on the horizon, Monte Mario to the right, the Quirinale to the left, the Garibaldi monument on the Janiculum in the distance. |
| 21 | **Casina Valadier** | Drop *"situata nel punto più alto e panoramico del Pincio"* and the rione page's *"punto più alto di Villa Borghese"*. Resolve the date to the building's own page: **1816–1837**; do not also give 1813. **No hours** — the official site states none. Keep the exedra and Ionic colonnade, the Casino del Cardinale Della Rota and Roman cistern beneath, the Pompeian interiors, and the sequence bistro → garden store under Pius IX → post-1918 café → officers' club → early-2000s restoration. |
| 22 | **Villa Medici** | Drop *"una delle più grandi biblioteche di arti decorative di Roma"*; **37,000 volumes** carries it. Hours from §3.1. Keep Nanni di Baccio Bigio, Cardinal Ricci, the 1576 purchase by Ferdinando de' Medici, the Académie founded **1666** by Colbert, the sixteen square beds, **over 7 hectares**, the 1803 Suvée library and the **460 fellows, 1798–1936**. |
| 23 | **Palazzo Borghese** | Drop *"una delle meraviglie di Roma"* even attributed. Keep "il cembalo", the 1560 Vignola commission for Tommaso del Giglio, Martino Longhi il Vecchio for Pedro Deza, the 1596 Camillo Borghese purchase, Ponzio → Maderno → Vasanzio → Rainaldi after 1670, the **96 Doric and Ionic columns** and the Bagno di Venere. |
| 24 | **Palazzo Ruspoli** | Drop *"una delle quattro meraviglie di Roma"*. The **staircase of over a hundred steps** by Martino Longhi il Giovane is the publishable form. Everything else confirmed. `fondazionememmo.it` is a splash page — no hours. |
| 25 | **Palazzo Magistrale** | Wording fixed by §4.2. |
| 26 | **Palazzetto Zuccari / Bibliotheca Hertziana** | **RULED: one record, two identities.** One front door, one building. Name it for the building, note that it houses the Max Planck Society's Bibliotheca Hertziana. Palazzo Stroganoff drops into it. Keep Federico Zuccari and the "casa dei mostri" surrounds on via Gregoriana. |
| 27 | **Palazzo Incontro** | *"owned by the Provincia di Roma"* is stale — that body no longer exists. Replacement: *"it.wikipedia records it as owned by the Provincia di Roma, which restored it between 2004 and 2007."* Keep Giovanni Paolo Burij and **1765**. |
| 28 | **Il Babuino / Fontana del Babuino** | The Sovrintendenza's *"la sua bruttezza"* is the source editorialising — attribute it or cut it; do not adopt it in the corpus voice. Everything else confirmed, including the c. 1576 *semipubblica* fountain paid for by **Alessandro Grandi**, the 1738 move, the 1877 dismemberment, the **1957** reassembly, and the street renamed from via Clementina. The five-way *statue parlanti* cross-reference to Campitelli's **Marforio** and Parione's **Pasquino** is honest and worth making. |
| 29 | **Via dei Condotti** | Drop *"la via più elegante ed esclusiva di Roma"*. Publish: it links via del Corso to Piazza di Spagna, and it was the ancient **via Trinitatis**, named for the dyers, running to Ponte Sant'Angelo — which the Santa Lucia della Tinta page sources and which the finder never connected. |
| 30 | **Accademia di Belle Arti di Roma** | Drop *"una fra le più importanti e antiche"*. **Also drop "la prima legalmente riconosciuta"** — the finder recommended this and is right; it is a priority claim resting on Wikipedia with no register behind it. Keep the **via di Ripetta 222** address, **07:30–19:15 Monday to Saturday** from the Academy's own contacts page, the via del Corso 476 succursale, and the AFAM sector under Legge 508/1999. |
| 31 | **Casa di Goethe** | Drop *"l'unico museo tedesco all'estero"* — a uniqueness claim, and attribution does not save it. Keep **Goethe 1786–1788** with Tischbein, Schütz and Bury; **opened 1997**; Warhol's **1982** portrait after Tischbein; the Deutscher Künstlerverein library and c. **8,500 volumes**; **Tuesday to Sunday 10.00–18.00, closed Monday, last admission half an hour before closing**. |
| 32 | **Museo Atelier Canova-Tadolini** | The *notificato* sentence is banned, and so is any paraphrase (§4.1). Keep: **January 1818** Canova guarantees the lease of his *studio di uso di cultura* for **Adamo Tadolini**, with leave to reproduce some of his works; Tadolini property **1818 to the late 1960s** across four generations — Adamo, Giulio, Scipione, Enrico — **over 500 works** made; bought by the Galleria Antiquaria Benucci; reopened **2003**; about **400 works** shown. Hours from the atelier's own site. |
| 33 | **Antico Caffè Greco** | Ruled at §4.3. Kind changes to historic-site. |
| 34 | **Il Vero Alfredo** | The *vincolo e tutela* sentence is banned (§4.1). Hours restored (§3.1). Keep the 1908 Piazza Rosa origin, the 1914 move to via della Scrofa, Pickford and Fairbanks' two gold serving pieces, the post-war restart in Piazza Augusto Imperatore under Armando, and the **450 photographs**. Note the source names **Alfredo III** alongside Ines Di Lelio, which the finder dropped. |
| 35 | **Grand Hotel Plaza** | The Federalberghi framing is a fact about the **Comitato Alberghi Storici** (hotels founded before 1950, 40+ members), not about this hotel — write it that way or not at all. The only hotel-specific claim Roma Capitale makes is that it *"nasce come locanda nell'ultimo decennio della Roma pontificia"*, which publishes attributed and vaguely, as the source has it. Nothing about how long it has traded beyond that. |

### 5.3 DROP — 45

**No source beyond an OSM tag (15).** A record that can only say "this is a fountain and it is here"
does not ship. Museo Da Vinci · Teatro dei burattini San Carlino · Fontana della Ciociara · Fontana
di Corot · Fontana degli Artisti · Fontana del Bottino · Fontana Torlonia · Palazzo Vitelli ·
Palazzo Stroganoff · the via Margutta fig-tree and gallery cluster · Esposizione permanente Fausto
delle Chiaie (also a living artist) · Casa Caravaggio (also an attribution swamp) · Segni delle
inondazioni del Tevere (the marker itself is unsourced; the muraglioni and the naming of Lungotevere
in Augusta and Lungotevere Marzio belong in those records) · Temple University Rome · Accademia
Nazionale dei Sartori (also on a straddling boundary street).

**Geometry only, no source content (10 streets).** Via Vittoria · Via Bocca di Leone · Via Tomacelli
· Via delle Carrozze · Via Belsiana · the nine quiet Tridente cross-streets as a group · Viale della
Trinità dei Monti · Via di San Sebastianello · Lungotevere Arnaldo da Brescia. A vertex count is not
a fact about a street.

**Six unnumbered squares with no body (6).** Piazza di Firenze · Piazza Bucarest · Piazza del Ferro
di Cavallo · Largo San Rocco · Largo Amleto Cataldi · Giardini Emiciclo di Nettuno.

**One sourced sentence and nothing else (7).** Palazzo Gabrielli-Mignanelli · Chiesa di San Gregorio
Nazianzeno · Chiesa di Santa Maria del Divino Amore · Chiesa della Resurrezione · Chiesa dei Santi
Giuseppe e Orsola · Palazzo Boncompagni Cerasi (its content is really the Babuino fountain's) ·
Piazza Mignanelli (its one sentence is the Colonna dell'Immacolata's). I checked the three
turismoroma bodies before applying this test — see §2 — and these seven survive it.

**Folds into another record (4).** Piazza Nicosia → the fountain · Cappella di San Gaetano → Villa
Medici · Fontana del Mosè (Pincio) → the Pincio statues record, and its name would collide with
Castro Pretorio's shipped Fontana del Mose · Hotel Palazzo Nainer → Palazzo Nainer.

**Official site establishes identity, location and hours and nothing else (4).** Hotel
d'Inghilterra · Hotel Hassler · Hotel de Russie · Hotel de la Ville. Each would be "a hotel, at this
address". The finder reached this conclusion itself and I uphold it.

**Not in this rione (1).** Anfiteatro di Statilio Tauro — the coordinate tests **Ponte**, the
building is destroyed and its site disputed. it.wikipedia files it under Campo Marzio and is wrong.

**Sub-places, not records (2).** Cappella di Mater Admirabilis and Casa per ferie San Giuseppe fold
into the Trinità dei Monti record, as the finder proposed.

---

## 6. Straddlers escalated to the arbitrator — 11

I resolve nothing here. Two of the finder's thirteen I close instead of escalating:

- **8.1 Palazzo di Propaganda Fide** is not a straddler. Colonna shipped it in wave 2 and
  it.wikipedia agrees it is in Colonna. **Closed.** The Campo Marzio page may describe piazza di
  Spagna but must not annex the building. If the page names it at all, it must say it is a Lateran
  Treaty extraterritorial property standing in rione Colonna — never "Vatican territory".
- **8.6 buildings on the Sant'Eustachio line.** Sant'Antonio dei Portoghesi and Santa Maria della
  Concezione in Campo Marzio both test wholly inside. **They publish here.** The streets escalate.

Escalated:

1. **Piazza San Lorenzo in Lucina** — 15/9 to Campo Marzio, but Colonna shipped the basilica off it
   and Campo Marzio takes the Baptist church off it. Two churches, one square, two files. Correct,
   and it needs the arbitrator to say so out loud.
2. **Via Frattina** — it.wikipedia gives an explicit sourced split (Colonna south, Campo Marzio
   north); the OSM centreline returns Colonna 9 / Campo Marzio 0 because it is drawn on the southern
   kerb; hand points at both ends return Campo Marzio. Geometry disagrees with itself. Take the
   sourced split; the arbitrator should say so.
3. **Via Sistina** — a documented split point at via Francesco Crispi, geometry agreeing. Whoever
   writes it must write the split.
4. **Via Francesco Crispi and via Capo le Case** — Roma Capitale lists both as the rione border, but
   the Crispi centreline tests Colonna 23 / Ludovisi 6 / Trevi 1 and Capo le Case did not resolve in
   OSM at all.
5. **Via della Scrofa** — Campo Marzio 11 / Sant'Eustachio 6, and not in Roma Capitale's ring.
6. **Via dei Portoghesi, via della Stelletta, piazza Campo Marzio, via degli Uffici del Vicario** —
   the streets, not the buildings on them.
7. **Via di Campo Marzio** — Colonna 9 / Campo Marzio 4. The rione's namesake street is mostly in
   the next rione, and it carries Colonna's shipped Orologio di Augusto.
8. **Piazza del Parlamento** — genuinely cut in two, with Colonna's shipped Montecitorio on it. No
   Campo Marzio page may imply it faces the Chamber of Deputies.
9. **Via del Corso** — Campo Marzio 32 / Colonna 21 / Trevi 20 / Pigna 1. Campo Marzio has the
   plurality and everyone will want it. The buildings hanging off it are not straddlers; only the
   street is.
10. **Lungotevere Marzio and Ponte Cavour** — Campo Marzio 25 / Ponte 8. **Ponte Cavour is unclaimed
    and it.wikipedia puts it in "Campo Marzio e Prati"**; Prati is shipped and did not take it. A
    live, unresolved bridge.
11. **The Pincio / Villa Borghese seam.** Nothing competes for these objects — Q. III Pinciano is
    not in this wave — so this is a *wording* escalation, not an ownership one, and it is the one a
    careless author will get wrong. Roma Capitale's own rione page calls the Casina Valadier *"nel
    punto più alto di Villa Borghese"*, it.wikipedia puts both the Casina and the idrocronometro
    *"all'interno di Villa Borghese"*, and a point on viale del Muro Torto tests **outside all 22
    rioni**. **The park name is not a unit name.** No page may write "in Villa Borghese" as if it
    settled which unit an object belongs to.

**Plus one structural ruling the arbitrator must make, not a straddler: the Aurelian Walls.**
Trastevere shipped `mura-aureliane-segment-trastevere-rome`. Campo Marzio holds two more
`historic=citywalls` ways testing inside, and Ludovisi, Sallustiano and Castro Pretorio sit on the
same circuit. **The corpus has already committed to per-rione segments.** Either Campo Marzio ships
a segment record with the segment named, or the arbitrator consolidates city-wide — but "Mura
Aureliane" twice with different slugs and no qualifier is exactly the collision shape the gate
catches. **Porta del Popolo is a distinct named object and is safe either way.**

---

## 7. TIER RULING

**GUIDE.** Not marginal.

**89 surviving records**, of which I count **31 that are strong on Roma Capitale prose alone**: the
Ara Pacis and its museum, the Mausoleum, Porta del Popolo, the Flaminio and Pincio obelisks, piazza
del Popolo with its five fountains, Santa Maria del Popolo, the twin churches, the Fontana in Piazza
Nicosia, piazza di Spagna, the Spanish Steps, the Barcaccia, the Colonna dell'Immacolata,
Keats-Shelley, Casa de Chirico, Babingtons, the Pincio and its Belvedere, the busts, the
idrocronometro, Casina Valadier, Villa Medici, Trinità dei Monti, Palazzo Borghese, Palazzo Ruspoli,
Palazzo Firenze, Casa di Goethe, Canova-Tadolini and the Caffè Greco.

Twenty-two religious buildings survive with sourced substance. Six streets survive as places in
their own right rather than as boundary lines. The rione carries **four museums**, a **hill with a
designed 19th-century public park**, and a **UNESCO-adjacent square** — and note the one thing that
may **not** be said: no page may claim the rione lies inside the Historic Centre of Rome property.
The **1980 inscription of the Historic Centre of Rome** may be stated as an inscription and nothing
more.

The finder's own estimate — "roughly 60–70, of which perhaps 25 strong" — was depressed by the
character-count triage error in §2. The honest floor is 89.

**Photos: `"photos": []` on every one of the 89.** Ruling 3. I checked: the finder sourced none and
used none, and its §12 quarantine correctly rejects Meier, the Fuksases and Koolhaas as living, and
correctly notes that Morpurgo dying in 1966 does not clear a façade shot in a country without
freedom of panorama. The Sovrintendenza's image-permission process is the right door for the image
wave.

---

## 8. What the finder got wrong, in order of consequence

1. **It triaged its best source by character count and cut good records.** turismoroma pages carry
   ~7,000 characters of chrome. Santa Lucia della Tinta, Palazzo Rondinini and Palazzo Cardelli were
   all called thin and all three are complete records. §2.
2. **It declared three sets of opening hours unsourced that Roma Capitale states plainly** — Ara
   Pacis, Il Vero Alfredo, Villa Medici — including on pages it had already fetched and quoted from.
   §3.1.
3. **It let a ranking through as a sequence.** "Nerva was the last emperor buried in it" is not what
   the Mausoleum page says; the last deposition was Julia Domna. §3.2.
4. **It missed three superlatives on the Obelisco Flaminio page and one uniqueness claim, plus a
   priority claim, on the Ara Pacis museum page** — including "the first work of architecture built
   in Rome's historic centre since the fall of Fascism". §3.3, §4.1.
5. **It published a trading-duration claim from a business's own website** — All Saints' "since
   1816" and "for over 120 years" — the one evidential rule it otherwise applied rigorously to six
   hotels. §3.6.
6. **It attached 10 BC to the wrong verb** on the Obelisco Flaminio, and missed the two cross-file
   links (Colonna's Montecitorio obelisk, Monti's Lateran obelisk) sitting in the same sentence.
7. **It took it.wikipedia's name over Roma Capitale's** for the Fontana in Piazza Nicosia. §3.4.
8. **It left the Pincio date conflict open** when the Sovrintendenza page it had already fetched
   resolves all four numbers in one paragraph. §3.5.
9. **It asserted the Ara Pacis museum is "a 2006 building"** with no source in the file for the
   year.

**What it got right, and these are not small.** The two designation traps are real, correctly
quoted, and correctly refused. The Caffè Greco status problem is real and its recommendation is the
right one. The Sant'Atanasio poisoned turismoroma hit is a genuine catch that would have put a
church 5 km away into this file. The `sanrocco.info` warning is correct. The distinction between the
Ara Pacis and its museum is correct. Its refusal to inherit the Colosseum and Teatro di Marcello
rulings, and its independent reproduction of both, is exactly right. Its escalation discipline on
the thirteen straddlers is the best in the wave so far: it resolved none of them, and it was right
not to.
