# Ostiense (Q. X, toponymic code 210) — VERDICTS

Wave 5. Verifier. I did not gather the finder's evidence and I owe it no deference. Every ruling
below is mine, and where I re-fetched a source I read the returned text myself.

**Tally against the finder's 69 numbered candidates plus its research tail:**
**17 PUBLISH · 30 REWRITE · 18 DROP · 4 ESCALATED**, plus three whole groups struck
(nine street-art works, the ten OSM-only parks, the §4.9 research tail).

**SURVIVING PLACES: 47. TIER RULING: FULL GUIDE.** §8.

---

## 0. COLLISION CHECK — re-run, not taken on trust

```
python3 .superpowers/taken_slugs.py            -> 907 places across 21 shipped files
python3 .superpowers/taken_slugs.py paolo      -> 6, none in Ostiense; san-saba owns porta-san-paolo
python3 .superpowers/taken_slugs.py ostiense   -> 2, both San Saba (Museo della Via Ostiense,
                                                  Palazzo delle Poste Roma Ostiense)
python3 .superpowers/taken_slugs.py piramide   -> 1, testaccio piramide-di-caio-cestio
python3 .superpowers/taken_slugs.py mattatoio  -> 1, testaccio mattatoio-di-roma
```

The finder's collision section is accurate in every particular I checked. **Not one surviving
candidate collides with a shipped slug.**

One correction to the brief I was handed rather than to the finder: the brief says twenty-one
shipped files own **786** places. They own **907**. The finder's figure is the right one.

---

## 1. RE-FETCH AUDIT — nine sources, not five

I re-fetched every source the finder leaned on hardest, plus three it had flagged as unresolved or
unfetched, and read the returned text.

| # | source | result |
|---|---|---|
| 1 | `basilicasanpaolo.org/orari/` | **CONFIRMS, with one exception.** «La Basilica è aperta ogni giorno dalle 07:00 alle 18:30, ingresso libero», sacristy 8–12 / 16–18:30, confessions 10–12 / 16–18:30, weekday Masses 07:00 · 10:00 · 17:00 with Vespers 18:00, Sunday 08:00 · 10:00 conventual · 12:00 · Vespers 17:00 · 18:00. Cloister «ogni giorno dalle 8:00 alle 18:00 (ultimo ingresso alle 17:30), ingresso € 4,00 (ridotto € 3,00)». **The page carries no Saturday Mass line.** The finder's "Sat 07:00, 10:00, 18:00" is not on it. |
| 2 | `centralemontemartini.org` orari + biglietti + la-centrale-elettrica | **CONFIRMS ALL.** Via Ostiense 106 · «Dal martedì alla domenica 9.00-19.00» · closed «Lunedì, 1° maggio, 25 dicembre» · full €11.00, reduced €6.50, Capitolini Card 7 days €15.50/€11.50 · «inaugurata nel 1912 per volontà del Sindaco Ernesto Nathan» · «Referendum popolare del 20 settembre 1909» · «Nel 1913 l'impianto fu intitolato alla memoria di Giovanni Montemartini» · «al di fuori della cinta daziale» · «dismessa a metà degli anni '60». **The banned «la prima centrale pubblica di produzione di elettricità a Roma» is on the page, exactly as the finder warned.** Two details the finder missed: the December special hours run **24–31 December** 9–14, not "24 and 31", and 1 January 2026 is 11–20. |
| 3 | `sovraintendenzaroma.it/…/necropoli_di_san_paolo` | **CONFIRMS ALL.** Official name **Sepolcreto della via Ostiense** · «annesso all'area verde del Parco Schuster» · «Grande Giubileo del 2000» · the 1859/1872 vigna Villani finds, the 1897/98 collector trench, the 1917/18 and 1933 widenings · «continuità d'uso dal I sec.a.C. al IV sec.d.C.» · booking obligatory on 060608 9–19, max 25, Rupe courtyard max 10 · €4.00 / €3.00, free for Rome residents with ID and MIC holders · «L'area è accessibile ai disabili» · the Rupe sector, **Wednesday 8 July 2026, 18:00–19:30, last entry 19:00, nine burials**. |
| 4 | `catacombeditalia.va/…/catacomba-di-commodilla.html` | **CONFIRMS.** «Via delle Sette Chiese, 42 - 00145 Roma», visits «su richiesta», +39 064465610 / +39 064467601, protocollo@arcsacra.va, «Santi Felice e Adautto, martirizzati agli inizi del IV secolo», Madonna di Turtura, St Luke, Traditio clavium, «cubicolo di Leone». The two superlatives the finder flagged are on the page. |
| 5 | `vatican.va` Patti Lateranensi | **CONFIRMS VERBATIM.** Art. 13 names «le Basiliche patriarcali di San Giovanni in Laterano, di Santa Maria Maggiore e di San Paolo». Art. 15 carries «benché facenti parte del territorio dello Stato italiano, godranno delle immunità riconosciute dal diritto internazionale alle sedi degli agenti diplomatici di Stati esteri». Art. 16 is the separate list — Gregoriana, Biblico, Orientale, Archeologico, Seminario Russo, Collegio Lombardo, the two Sant'Apollinare palaces, the Casa degli esercizi di San Giovanni e Paolo — with only expropriation and tax exemption. **The finder's Art. 13/15-not-16 distinction is right and must be kept.** |
| 6 | `it.wikipedia` **Ostiense** raw wikitext (`action=parse&prop=wikitext`) | **CONFIRMS the three-Municipi point, and it matters.** The quartiere infobox reads `circoscrizione = [[Municipio Roma I]], [[Municipio Roma VIII]] e [[Municipio Roma IX]]`. A *second* infobox on the same page, for the **zona urbanistica 11A**, reads `Municipio Roma VIII`. A summarising fetch of the same page returns only the second. **DO NOT put a single Municipio on the Ostiense zone page.** |
| 7 | `abbaziasanpaolo.org/giardino-monastico/` | **CONFIRMS.** Via Ostiense 186 at the Spezieria, tel 06 698 80 811, giardino@abbaziasanpaolo.org, «È prevista una quota di partecipazione», two seasons a year, and the decisive «normalmente non accessibile al pubblico». |
| 8 | `vatican.va` JPII homily, 3 December 1978 — **the finder did not fetch this; I did** | **200, and CONFIRMS VERBATIM.** Page title «3 dicembre 1978, Visita alla Parrocchia romana di San Francesco Saverio». Text: «È una grande gioia per me poter visitare come prima parrocchia romana proprio la vostra… negli anni dell'immediato dopoguerra, come studente a Roma, mi recavo quasi ogni domenica proprio alla Garbatella, per aiutare nel servizio pastorale.» |
| 9 | `casadeljazz.com/i-luoghi/` — **the seat-count conflict the finder could not settle** | **SETTLED.** The venue's own page reads «Casa del Jazz ospita un Auditorium di circa 150 posti», and names **Fondazione Musica per Roma** as operator. Publish "about 150 seats". |

**Two further fetches that changed a verdict.**

- `it.wikipedia` **Polo museale dei trasporti** raw wikitext. See V-C19. The source says the opposite
  of what the finder wrote.
- `archidiap.com/opera/mercati-generali/` → **404, exactly as the finder reported.** The finder was
  honest about this and I confirm it.

**Sources that do not say what the finder said: two.** `basilicasanpaolo.org/orari/` (no Saturday
Mass line) and `it.wikipedia` Polo museale dei trasporti (reopening, not closure). Both are handled
below. Everything else held.

---

## 2. THE THREE RULINGS, APPLIED

### 2.1 No designation claims — one live risk

Nothing in the finder's candidate set claims a vincolo, and its banned-phrase register correctly
catches the one designation claim it met («È monumento nazionale italiano», Abbazia delle Tre
Fontane) in a place it is not claiming anyway. Good.

**The one live risk is C45.** "Minor basilica since 1984" is an **ecclesiastical title conferred by
the Holy See**, not an Italian heritage designation, and it is not caught by the ruling. It
publishes **only** phrased as a title — "carries the title of minor basilica, conferred in 1984" —
and never as "protected", "listed" or "declared a monument". Same for "basilica papale" at C01.

**UNESCO.** The finder's handling is correct and I adopt it. The inscription publishes as an
inscription, under its own name — *Historic Centre of Rome, the Properties of the Holy See in that
City Enjoying Extraterritorial Rights and San Paolo Fuori le Mura*, inscribed 1980 — and **no Ostiense
record and no Ostiense zone page may say it lies inside the property.**

### 2.2 Vatican — the finder got the hard case right

San Paolo fuori le Mura is Art. 13 property with Art. 15 immunities, on Italian soil, in Q. X
Ostiense. I re-read the treaty text and the finder's reading is exact.

**Mandatory wording for C01–C04.** The basilica and its annexed buildings are the property of the
Holy See under Art. 13 of the Lateran Treaty of 11 February 1929 and, under Art. 15, «benché facenti
parte del territorio dello Stato italiano», enjoy the immunities international law gives to the
premises of a foreign state's diplomatic mission. **BANNED on these four records, in any language:**
"in the Vatican" · "Vatican territory" · "Vatican soil" · "you cross into the Vatican" · "leaving
Italy" · any border, checkpoint or passport figure of speech. **Also banned:** listing San Paolo
among the Art. 16 properties.

### 2.3 Photographs

`"photos": []` on all 47. The finder's high-risk register for the later wave — the street-art
corridor, the Blu façades, Ponte Settimia Spizzichino, Ponte della Scienza, the ex Air Terminal, the
Casa del Jazz interiors and the Bartoli fresco — is sound and I endorse it unchanged.

---

## 3. THE QUARTIERE PROBLEM — binding on the writer

1. **NO MUNICIPIO ON THE ZONE PAGE.** Confirmed from raw wikitext: I, VIII and IX.
2. **Two buildings, and only two, may state a Municipio**, because a source states it for that
   building: **Forte Ostiense** («nel territorio del Municipio Roma IX») and the **Stazione di Roma
   Porta San Paolo** («nel territorio dell'VIII Municipio»). No other record may carry one.
3. **Garbatella is zona urbanistica 11C inside Q. X Ostiense** and publishes as part of Ostiense.
   Confirmed verbatim from the Garbatella wikitext. It is **not** a unit of its own and must not be
   written as one.
4. **"In Ostiense" is not a locator.** Every one of the 47 carries a street address or a named
   square. Where a candidate had only "in Ostiense" it is dropped or rewritten below.
5. **Anything under the name "Marconi" except the bridge is Portuense.** Endorsed.

---

## 4. STRADDLERS — escalated, not resolved by me

### 4.1 The four river bridges — ESCALATED, and Ostiense must not take all four

| bridge | my ruling |
|---|---|
| **Ponte dell'Industria** (C22) | **ESCALATE.** Its own article says «tra i quartieri Ostiense e Portuense». Ostiense holds the east abutment on via del Porto Fluviale. Genuinely shared. |
| **Ponte San Paolo** (C23) | **ESCALATE.** Categorised in three units, one of which (Testaccio) is already shipped and can no longer take it. Between Ostiense and Portuense. |
| **Ponte Guglielmo Marconi** (C24) | **ESCALATE.** Categorised Ostiense + Portuense. **Whoever gets it: «il ponte più lungo di Roma» is banned and appears twice in the source.** |
| **Ponte della Scienza Rita Levi-Montalcini** (C25) | **ESCALATE.** Article says «nei quartieri Portuense e Ostiense». Its Ostiense landfall is at the Gazometro. |

**My recommendation to the arbitrator: award Ostiense at most two, and Portuense the others.** The
finder's warning — do not let two zones each publish four bridges — is right. **Ponte Settimia
Spizzichino (C21) is not in this group**: it crosses the railway, not the river, is categorised
`Roma Q. X Ostiense` alone, and is Ostiense's outright.

**Separately: the "eccidio del ponte dell'Industria" is DROPPED outright, for whoever gets the
bridge.** The source itself says the episode is «mai confermato da alcun documento e rivelato dal
solo De Simone 50 anni dopo». A corpus does not publish a contested massacre on a single
disavowed account plus an OSM node.

### 4.2 The Piazzale Ostiense cluster — the plaques go with the gate

The finder declined to claim the four 1943 memorial plaques and Piazza di Porta San Paolo, and
flagged that they point in opposite directions. **I rule with the finder's instinct and escalate the
decision: the four plaques belong with Porta San Paolo, which is shipped to San Saba.** A single
memorial group must not be split across two files to satisfy a polygon. Ostiense claims none of
them; the arbitrator should confirm they stay with the gate.

The four transport buildings — **Piramide station, the Roma-Lido terminus, the Polo museale and
Stazione Ostiense** — are Ostiense's, on geometry and on the articles' own prose, and wave 4 already
ruled them out of Testaccio. **No escalation needed.**

### 4.3 Casa del Jazz — ESCALATED, but the evidence is one-sided

Address reads *Viale di Porta Ardeatina*, which will read as Ardeatino. Against that: it.wikipedia
categorises it `Roma Q. X Ostiense`; the Ardeatino relation's western limit is well east of the
villa; and everything outside the Aurelian Walls between Porta San Paolo and Porta Ardeatina is
Ostiense by the quartiere's own boundary text. **Escalated to Ardeatino to concede or contest.
Ostiense should be allowed to write it pending the answer.**

### 4.4 The southern edge — ESCALATED as a group

**Forte Ostiense (C10)**, **Santa Maria Regina degli Apostoli alla Montagnola (C45)** and
**Catacomba di Santa Tecla (C08)** all sit on the strip where the polygon says Ostiense and the
toponyms say Montagnola. All three articles name the quartiere in their own prose, so all three
**publish in Ostiense**, but the arbitrator should be told Ardeatino may contest them as a set.

**The Stadio Tre Fontane / Via delle Tre Fontane strip is DROPPED** and offered to Ardeatino/EUR.
The finder was right not to claim it, and right that the abbey complex is Ardeatino's.

**Circonvallazione Ostiense is DROPPED** — three quartieri, clean for nobody.

---

## 5. RULINGS, CANDIDATE BY CANDIDATE

### 5.1 The San Paolo complex

**V-C01 · Basilica papale di San Paolo fuori le Mura — REWRITE.** Ships.
Piazzale San Paolo 1, 00146 Roma. Hours, sacristy, confessions and Mass times as re-fetched at §1.
- **DROP the Saturday Mass line.** The page carries weekday and Sunday/solemnity schedules only.
  Publish exactly what the page publishes.
- **DROP, all four confirmed present in the source and all banned:** «la più grande dopo quella di
  San Pietro in Vaticano» · «per grandezza la seconda delle quattro basiliche patriarcali» · «la
  ventesima campana più grande presente nella penisola italiana» · «la porta di destra … è la più
  antica».
- **REWRITE the right-hand door**, exact replacement: *"The right-hand door is the 11th-century
  bronze door of 54 panels. It was the main entrance until 1967 and since then has been the inner
  face of the Holy Door."*
- **REWRITE the bell**, exact replacement: *"The great bell, 'Pierpaola', sounds G2, measures two
  metres across and weighs about 5,000 kg."* Measurements publish; the ranking does not.
- **PUBLISH unchanged:** the 1823 fire; Leo XII's *Ad plurimas* of 25 January 1825 and the chirograph
  of 18 September 1825; Belli on a Valadier scheme and Poletti's completion; Gregory XVI's
  dedication of the Confession altar 5 October 1840; the consecration by Pius IX on 10 September
  1854; 131 × 65 × 29.70 m; the quadriportico 1890–1928 by Sacconi and Calderini, Obici's statue,
  Benigni's gates (competition 1913, installed 1926) and the 30 October 2016 earthquake damage; the
  façade mosaics 1854–1874 after Agricola and Consoni; Maraini's 1931 central door 7.48 × 3.35 m;
  Manfrini's Porta Santa 3.71 × 1.82 m; the campanile finished 1860 and the 1959 Marinelli bells with
  the 1653 survivor; five aisles, 80 Montorfano granite columns in four rows of 20; **267 papal
  tondi with 25 medallions still empty**; the 36 frescoes finished 1860; over 1,700 recovered slabs;
  the Galla Placidia arch under Leo I; the apse mosaic under Honorius III (1216–1227); Arnolfo di
  Cambio's ciborium of 1285; the Vassalletto/D'Angelo candelabrum of 1170; the four transept
  chapels and Bregno's triptych of 1494; the twelve columns from Veii; the Sala del Martirologio; the
  Priori/Serassi organ of 1857–58, 36 stops and 2,556 pipes, and the Trice of 1891, 12 stops and 698
  pipes; the burials of Felix III and John XIII; the Nicholas I, Egyptian and Fuad I gifts and the
  1891 Forte Portuense explosion.
- **Art. 15 wording is mandatory.** §2.2.
- The 324 consecration under Silvester I publishes as the traditional date, phrased as such.

**V-C02 · Chiostro e Area Espositiva e Archeologica di San Paolo — REWRITE.** Ships. `museum`.
- **PUBLISH, re-fetched and confirmed:** open daily 08:00–18:00, last entry 17:30; €4.00, reduced
  €3.00; groups over ten €3.00 a head and «la guida del gruppo entra gratis»; the 13th-century
  cloister, the Pinacoteca, the Cappella delle Reliquie and the exhibition gallery; excavation begun
  2007 and lasting about two years; «Il sito, vasto circa mille metri quadrati»; work «sotto la
  Direzione dei Musei Vaticani» with the Pontificio Istituto di Archeologia Cristiana; an oratory
  dedicated to Santo Stefano; the fragments from the old basilica and the sepolcreto finds.
- **DROP — not on the page the finder cited, and not sourced anywhere it fetched:** the opening date
  **1 July 2013** · the **porticus sancti Pauli** · **Johannipolis** · the "8th–15th-century building
  yard" with mortar tanks and lime kiln. If a writer wants them, fetch a second source first.
- **DROP both turismoroma superlatives:** «una delle meraviglie della Roma duecentesca» and «il più
  antico esempio di questo tipo di costruzione conservato a Roma».

**V-C03 · Abbazia benedettina di San Paolo fuori le Mura — REWRITE.** Ships.
- **PUBLISH:** the suppression of the territorial abbacy 7 March 2005; Benedict XVI's motu proprio
  *L'antica e venerabile Basilica* of 31 May 2005; the archpriests with their dates, James Michael
  Harvey since 23 November 2012; Dom Donato Ogliari as abbot; the monks' custody of the tomb.
- **DROP the 1608 motu proprio of Paul V as the library's origin.** It is a founding date for the
  institution taken from that institution's own site. That is the shape the corpus rule bans. The
  library publishes as a monastic library; its origin date does not.

**V-C04 · Giardino monastico e Spezieria monastica — REWRITE, with a corrected status.** Ships.
- **STATUS: closed.** The abbey's own page says «normalmente non accessibile al pubblico», which is
  an affirmative statement of restricted access, and the status field must agree with the prose.
- **Exact replacement prose:** *"The monastic garden is entered at the Spezieria, Via Ostiense 186.
  The abbey states that it is normally not accessible to the public and opens it only for booked
  guided visits in two seasons a year, spring and autumn, for small groups and for a participation
  fee. Booking is on 06 698 80 811 or giardino@abbaziasanpaolo.org. The garden contains an orto dei
  semplici growing the officinal plants used in the herbal preparations sold at the Spezieria."*
- **DROP all three:** «un giardino unico nel suo genere» · «un luogo di straordinaria bellezza» ·
  «una splendida oasi».

### 5.2 Archaeology

**V-C05 · Sepolcreto della via Ostiense — REWRITE, and C06 folds into it.** Ships.
Everything re-fetched at §1 publishes, under the **official name on the Sovrintendenza page**, not
"Necropoli di San Paolo". In Parco Ildefonso Schuster, on via Ostiense.

**V-C06 · Tombe della Rupe di San Paolo — REWRITE, MERGED into V-C05.** Does **not** ship as a
separate place. The Sovrintendenza page presents it as a sector now included in the Sepolcreto visit
as one hour-long route; two records would double-count one ticket.
- **REWRITE the opening**, exact replacement: *"The sector by the Rupe di San Paolo opened to the
  public on Wednesday 8 July 2026, 18:00–19:30, last entry 19:00."* Do not carry «apre al pubblico
  per la prima volta» as a phrase.
- **PUBLISH:** nine burials; the courtyard capped at ten at a time; the change from cremation to
  inhumation in the 2nd century AD; the full-size reproductions of three frescoed lunettes; the new
  lighting and panels.
- **HOLD the PNRR Caput Mundi attribution** until re-fetched. It did not come back in my read of the
  page and no writer should assert a funding programme it has not seen.

**V-C07 · Catacomba di Commodilla — REWRITE.** Ships.
- **Address, contacts and access confirmed verbatim.** **Status: open, with the prose stating the
  access terms** — *"Visits are by request only."* "Closed" would be an affirmative claim the source
  does not make; a by-appointment site is not a closed one.
- **PUBLISH:** the matron etymology as a probability, Felix and Adauctus martyred under Diocletian in
  the early 4th century, the underground basilica arranged under Damasus and Siricius and defined
  under John I, the Madonna di Turtura, the St Luke, the Traditio clavium, the cubiculum of Leo,
  official of the Annona; and from it.wikipedia the three levels, the pozzolana quarry, the end of
  burial after the 4th century, the coins of Gregory IV, Leo IV's gift of the relics, Bosio's
  rediscovery in 1595, de Rossi's identification, and the "a pozzo" shafts of up to 20 stacked loculi.
- **DROP both:** «l'affresco più celebre del complesso» · «uno dei vertici della produzione artistica
  della Roma sotterranea cristiana».

**V-C08 · Catacomba di Santa Tecla — REWRITE.** Ships.
- **DROP "near San Paolo"** — orientation by impression. **Exact replacement locator:** *"On via
  Silvio d'Amico, which follows the line of the old via delle Statue."*
- **PUBLISH:** the 4th-century underground basilica over a 3rd-century cemetery, the three ambulacra
  in an isosceles triangle, the 22 burial chambers, the unresolved identification (Styger for Thecla
  of Iconium, Fasola for a Roman martyr under Diocletian) written as competing accounts, and Fasola's
  excavation.
- The finder's handling of the missing hours is exactly right. **Exact wording:** *"No source states
  opening arrangements, so none are given here."* Never "could not be reached".

**V-C09 · Cisterna della via Colombo — PUBLISH.** Sovrintendenza, same institutional domain that
verified nine-for-nine at C05. Found 1940 under a farmhouse demolished for the cuttings of the via
Imperiale, cleared to 1969, conserved 1991–92; early-2nd-century AD circular cistern in opus
reticulatum; trapezoidal vestibule, annular vaulted corridor in ten intercommunicating bays, a second
undivided concentric corridor, a domed central chamber almost 3 m across, all lined in signino.
**No hours are stated on the page, so the record states none.**

**V-C10 · Forte Ostiense — REWRITE.** Ships. **Status: closed.**
- This is an operating Polizia di Stato facility (Centro Psicotecnico, Servizio Tecnico Logistico).
  A "closed" status is an affirmative claim the source supports, and **the prose must not imply
  visitors may enter or approach.**
- **Municipio IX may be stated here**, because the article states it for this building.
- **PUBLISH:** one of the fifteen forts of Rome of 1877–1891; begun 1882, finished 1884; 8.8 ha; at
  the fourth kilometre of via Ostiense, from which it takes its name; the stand of some eight hundred
  Grenadiers on 10 September 1943; Don Pietro Occelli's surrender; the death of Suor Teresina di
  Sant'Anna (Cesarina D'Angelo) on 8 May 1944.

### 5.3 Industry, museums and transport

**V-C11 · Musei Capitolini Centrale Montemartini — REWRITE.** Ships. Via Ostiense 106, 00154 Roma.
- **PUBLISH all hours and prices as re-fetched**, with the finder's December line corrected:
  **24–31 December 09:00–14:00** (not "24 and 31"), and 1 January 2026 11:00–20:00.
- **PUBLISH the building:** inaugurated 1912 under Ernesto Nathan; the referendum of 20 September
  1909 on municipalising public services, which also created the AEM, today's Acea; named in 1913 for
  Giovanni Montemartini, Nathan's technical assessor, who died during a council session; sited for
  water, rail and road and outside the customs boundary, so exempt from fuel duty; turbines for base
  load and diesels for peaks; decommissioned in the mid-1960s; Acea's late-1980s conversion.
- **PUBLISH the museum:** 1997 transfer during the Capitoline restoration; *Le macchine e gli dei*,
  October 1997; permanent museum 2001; November 2016 room for the three carriages of the train of
  Pius IX, of 1858; the named works and the Sala Macchine fittings.
- **DROP, all three confirmed on the museum's own page and all banned:** «la prima centrale pubblica
  di produzione di elettricità a Roma» · «il primo impianto pubblico di Roma» · «uno straordinario
  esempio di riconversione». Also drop turismoroma's «uno dei primi ambienti industriali romani».
  **Attribution does not save any of them.**

**V-C12 · Gazometro di Roma — REWRITE.** Ships. Via del Commercio. **Status: closed.**
- **The prose must state plainly that this is a working private industrial estate and not a visitor
  site**, and must not imply entry. **Exact replacement:** *"The site is a working private industrial
  estate. The frame is seen from via del Commercio, from the Ponte della Scienza and from the Riva
  Ostiense."*
- **PUBLISH:** the 1909 design for Nathan's gas plant; three smaller holders by Samuel Cuttler & Sons
  of London, 1910–1912, two of 25,000 m³ and one of 60,000 m³; the great frame by Ansaldo of Genoa
  with Klönne of Dortmund, 1935–1937, for the Società Anglo-Romana per l'Illuminazione di Roma col
  Gas; **89.10 m high, 63 m in diameter, 200,000 m³**, 1,551 piles totalling 36 km; the bell removed
  and only the frame standing; the reuse of the three smaller holders; Eni's ownership since 1967 via
  Italgas and Snam; over 12 hectares; the 2006 Luxometro; Joule from 2020, ZERO from 2021, Eni 2050
  Lab from 2022; ROAD inaugurated 17 May 2023 with the seven named partners; Maker Faire in 2021 and
  2022.
- **DROP:** «è stato il gasometro più grande d'Italia» and **the Guardian "coolest neighbourhoods"
  ranking**. A newspaper ranking is a ranking; attribution does not save it.

**V-C13 · Ex Mercati Generali — REWRITE, and it ships without a date.** I read the raw wikitext.
The article gives «Mercati Generali all'Ostiense, 1908-1916» in an uncited architecture list **and**
«i Mercati Generali inaugurati … nel 1921» cited to a **blogspot**. `archidiap.com/opera/mercati-generali/`
is **404**, which I confirmed myself.
- **PUBLISH:** on via Ostiense opposite Centrale Montemartini; designed by **Francesco La Grassa** and
  **Emilio Saffi**; closed, and the subject of a long-running redevelopment of the whole ex-markets
  area.
- **DROP both dates.** Neither 1908–1916 nor 1921 has a source this corpus accepts, and the article
  carries them three paragraphs apart without reconciling them.
- **DROP** «quello dei Mercati Generali è stato il più caratteristico», which is in the same article.
- If the writer cannot make an honest record without a construction date, **hold the record.** That
  is a legitimate outcome and it costs the tier nothing.

**V-C14 · Edificio d'ingresso ai Magazzini del Consorzio Agrario — PUBLISH.** Thin but dated (1925),
addressed (via del Porto Fluviale) and coordinated. Ships as a short record.

**V-C15 · Ex caserma dell'Aeronautica, Via del Porto Fluviale 10 — REWRITE.** Ships.
- **Exact naming:** the record is the **former Aeronautica barracks at Via del Porto Fluviale 10**,
  and the murals are described within it. Do not title it "the Blu murals" as though that were the
  building's name.
- **PUBLISH:** two entire painted façades by the street artist **Blu**, begun **2013**, on an occupied
  building (CSOA Fronte del Porto). This is the **only** street-art subject in the finder's set with a
  second source, which is why it survives and §4.7 does not.
- **Photo wave: highest risk in the zone.** Living artist, whole-subject frame, no Italian freedom of
  panorama.

**V-C16 · Stazione di Roma Ostiense — REWRITE.** Ships. Piazzale dei Partigiani.
- **DROP** «Terzo scalo della capitale per numero di passeggeri». A ranking.
- **PUBLISH:** stop opened 1 May 1911, raised to a station 21 October 1922; the temporary monumental
  station thrown up in 45 days for Hitler's visit of 6 May 1938, in Innocenti tubing faced with wood
  and stucco imitating travertine, to Roberto Narducci's designs; the permanent building by the same
  designer for the 1942 Exposition, inaugurated 28 October 1940; the renaming of via and piazzale A.
  Hitler to viale delle Cave Ardeatine and piazzale dei Partigiani; the travertine façade and pillared
  portico; Francesco Nagni's 1940 Bellerophon and Pegasus relief; the 1957 sea-horse fountain; the
  black-and-white floor mosaics by Giulio Rosso and Maria Immacolata Zaffuto; Narducci's forecourt
  fountain removed for the 1990 works and never restored, and its appearance in *Un sacco bello*.

**V-C17 · Stazione di Roma Porta San Paolo — REWRITE.** Ships. **Municipio VIII may be stated here.**
- **DROP the 2026 service note** — "weekdays 09–13 and 16–20 February, 11:00–16:00" is a transient
  works notice that will be stale before the page is read, and a guide that publishes it is wrong the
  week after.
- **PUBLISH:** work begun 1919 to Marcello Piacentini's designs, twin of his Marina di Ostia terminus;
  inaugurated 10 August 1924 with the first train to the Lido; undamaged in the war; modernised from
  9 September 1989 to 1996, with the terminus falling back to EUR Magliana meanwhile; the wide booking
  hall with marine-themed frescoes by Giulio Rosso.

**V-C18 · Piramide (stazione della linea B) — REWRITE.** Ships.
- **DROP** «caso unico in tutta la rete romana».
- **REWRITE the platforms**, exact replacement: *"Its platforms sit in an open cutting."*
- **PUBLISH:** Piacentini's design; the plain geometry roofed in white travertine slabs; the entrance
  steps onto piazzale di Porta San Paolo; the 1989 refurbishment; the 1990 subway to Roma Ostiense
  with a second entrance and hall on via delle Cave Ardeatine; Roma-Lido stock sheltered in the
  unfinished station during the 1943 bombing.
- **The chapel of San Filippo Neri on the Rebibbia/Jonio platform stays inside this record** as one
  clause. It does not ship as its own place on a single clause of sourcing.

**V-C19 · Polo museale dei trasporti — REWRITE. THE FINDER'S WORST ERROR.** Ships.
The finder wrote **"CLOSED TO THE PUBLIC SINCE 2020 … A 'closed' status here is an affirmative claim
the source supports."** I fetched the raw wikitext of the very article it cited. It reads:

> «A partire dal 2020 il museo è stato chiuso al pubblico, prima a causa delle misure per il
> contrasto alla pandemia di COVID-19, poi per la necessità di portare avanti lavori di manutenzione
> non ancora finanziati dalla Regione Lazio, in attesa del passaggio della gestione della ferrovia
> Roma-Lido dall'azienda municipale ATAC alle regionali COTRAL e ASTRAL, divenuto effettivo dal 1º
> luglio 2022. **Il museo ha riaperto il 14 ottobre 2022.**»

**The source says it reopened.** A "closed" status here would have shipped an affirmative falsehood
about a museum's access, which is the single worst class of error this corpus can make.
- **STATUS: open.**
- **Exact replacement prose:** *"The museum was closed to the public from 2020, first under COVID-19
  measures and then for maintenance pending funding from the Regione Lazio and the transfer of the
  Roma-Lido from ATAC to COTRAL and ASTRAL, effective 1 July 2022. It reopened on 14 October 2022.
  No source states its current opening hours, so none are given here."*
- **PUBLISH:** Via Bartolomeo Bossi 7; opened by Met.Ro. on 18 September 2004 on an idea of the
  engineer Angelo Curci, during Rome's second notte bianca, in the old goods yard of the Roma-Lido
  terminus; part open-air with restored rolling stock, part indoors with models, instruments and the
  model of the stazione di Osilo; stock built 1907–1945, including the Breda-AEG locomotive of 1915
  (STEFER no. 01), the Carminati & Toselli-TIBB of 1922 (STEFER no. 05), the Stanga-TIBB ECD railcar
  of 1931 (SRFN no. 21) and STFER tram no. 404 of 1941.

**V-C20 · Ex Air Terminal Ostiense and Eataly Roma Ostiense — REWRITE HARD.** Ships as one record.
I read the Garbatella wikitext, the only textual source the finder actually held for this. It says
only that the Air Terminal with its attached shopping centre and camper area was built for Italia '90
on the far side of Stazione Ostiense, and that **«Nel 2012 all'interno dell'Air Terminal è stata
aperta la sede di Roma di Eataly»**. Nothing more.
- **DROP, every one of them unsourced in anything the finder fetched:** the designers **Julio Lafuente
  and Giulio Sanrocchi** · the **four escalator flights and two travelators** · **"it never worked"** ·
  the **RFI sale of 15 June 2009 to Geal s.r.l. for €10,820,000** · the exact date **21 June 2012**
  (the article's only anchor is a *Sole 24 Ore* piece of 21 June 2017 on a fifth anniversary, which is
  an inference, not a source).
- **DROP** «il più grande luogo al mondo dedicato alle eccellenze agroalimentari italiane».
- **PUBLISH:** Piazzale XII Ottobre 1492; built as an air terminal with an attached shopping centre for
  the 1990 World Cup, on the far side of Stazione Ostiense; **Eataly's Rome store opened inside in
  2012**; Eataly's own store directory lists "Roma Ostiense". **No hours** — the store page is
  JS-rendered and none were obtained. The record says nothing about hours rather than inventing them.
- **C62 is this same place and is DROPPED as a duplicate.**

**V-C21 · Ponte Settimia Spizzichino — PUBLISH.** The one clean bridge, categorised `Roma Q. X
Ostiense` alone. Executive design by Solidus s.r.l. (Francesco Del Tosto), built by Cimolai SpA; steel
space-frame tied arch on three supports carrying a double deck on steel cables; 160 m overall, 126 m
central suspended span, 42 m rise, two 16.5 m carriageways of three lanes each, a 1.5 m cycle lane in
the central strip; lighting by Francesco Bianchi; three years on site; inaugurated 20 June 2012 at
about €15.4 million; named on the Municipio VIII giunta's proposal for Settimia Spizzichino, who
survived the round-up of the Roman Ghetto on 16 October 1943 and deportation to Auschwitz.

**V-C22 to V-C25 · The four river bridges — ESCALATED.** §4.1. Not ruled by me, facts preserved, and
the Marconi superlative and the Industria eccidio dropped for whoever gets them.

### 5.4 Garbatella (zona urbanistica 11C, inside Q. X Ostiense)

**V-C26 · Piazza Benedetto Brin and the 1920 foundation inscription — REWRITE.** Ships.
- **PUBLISH:** Victor Emmanuel III laid the first stone on 18 February 1920, Ash Wednesday, with
  Adolfo Apolloni as mayor; the inscription quoted verbatim as the finder has it.
- **DROP "the oldest surviving lots are around this square."** A priority claim. **Exact replacement:**
  *"The lots around the square date from the foundation of 1920."*

**V-C27 · Piazza Damiano Sauli — PUBLISH.** Defined by the school, the church of San Francesco Saverio
and a housing-and-shops block on the north side with three central archways through to piazza Nicola
Longobardi; rebuilt in the 1990s under Rome's "100 Piazze" programme. A side of a named square is a
usable locator, so the archway description publishes as written.

**V-C28 · Scuola "Cesare Battisti", piazza Damiano Sauli 3 — PUBLISH.** Angelo Brunetta, 1931, raised
a storey in 1937; two C-shaped wings, originally three storeys and now four over a basement, joined by
a two-storey block crowned with a tower; a double-height gymnasium; reinforced-concrete piers and
floors, large glazing, iron crown; originally named for Michele Bianchi at Mussolini's wish; a
location in Moretti's *Bianca* and in *I Cesaroni*. **It is a working school; the prose must not imply
visitors may enter.**

**V-C29 · Chiesa di San Francesco Saverio alla Garbatella — REWRITE, and the finder's flag is
answered: the John Paul II sequence PUBLISHES.** Ships.
I fetched the homily myself. It returns 200 at the URL the finder gave, it is titled «3 dicembre 1978,
Visita alla Parrocchia romana di San Francesco Saverio», and the sentence is verbatim.
- **This is not a ranking.** It is a **date plus a sequence, in the speaker's own words about his own
  itinerary**, which the corpus rules admit explicitly. **Exact publishable wording:** *"John Paul II
  came to the parish on 3 December 1978 and told the congregation: «È una grande gioia per me poter
  visitare come prima parrocchia romana proprio la vostra … negli anni dell'immediato dopoguerra, come
  studente a Roma, mi recavo quasi ogni domenica proprio alla Garbatella, per aiutare nel servizio
  pastorale.»"* **Do not paraphrase it into "the first parish he ever visited"** — the quotation is
  what carries it.
- **PUBLISH:** Piazza Damiano Sauli; Alberto Calza Bini, built 1931–1933 per ArchiDiAP; erected a
  parish 1 May 1933 by Pius XI, constitution *Quo omnes sacrorum*; the brick and travertine façade,
  central portal under a large lunette window, the arms of Pius XI, the high dome; three aisles on
  Ionic columns and a transept; the apse canvas; the *Madonna del Divino Amore succouring Rome after
  the 1943 bombing*; the *Christ in glory with angels*; the bronze *Crucifixion* and *Madonna*.

**V-C30 · Teatro Palladium — PUBLISH.** `theater`. Piazza Bartolomeo Romano 8, 00154 Roma, tel +39 06
57332772, from its own site, which establishes identity, location and contact. Innocenzo Sabbatini,
built 1927–28 as the Cinema Teatro "Garbatella", ICP lot 12, building 6, with private flats on six
floors above; horseshoe auditorium, no pit; owned and run by Università Roma Tre through the
Fondazione Roma Tre Teatro Palladium; programmes theatre, cinema, music and dance. **The 1927–28 date
comes from it.wikipedia, not from the operator, so it is not a trading-duration claim and it ships.**

**V-C31 · Bagni Pubblici di piazza Bartolomeo Romano — DROP.** One clause inside another building's
article, an architect and nothing else. **Fold the sentence into V-C30** if the writer wants it: *"On
the same square stands the Bagni Pubblici, also by Sabbatini."*

**V-C32 · Albergo Rosso and the Alberghi Suburbani — PUBLISH.** Piazza Eugenio Biffi. ArchiDiAP:
Innocenzo Sabbatini, 1927–1928. The four Alberghi — Rosso, Bianco, Giallo, Beige — built from 1927 for
the Istituto Case Popolari under Alberto Calza Bini, who called them «Alberghi di transito» for
families evicted by the sventramenti of the late 1920s; canteen, crèche and school, chapel, laundries
and ironing rooms, kitchens, shared washrooms, day rooms, outdoor play space and stores; Sabbatini
resigned from the ICP on 7 March 1929 over changes made during construction; the Albergo Rosso is
identified by its clock tower, its render colour and a slight setting-out shift.

**V-C33 · Lotto 24, the "casette modello" — REWRITE.** Ships. Between via delle Sette Chiese, via De
Jacobis and via Borri. Thirteen villini built for the **XII International Congress of Housing and Town
Planning of 1929**; marble plaques at the entrances name the architects; the competition was won by
the corner building at via delle Sette Chiese/via Borri, by **Mario De Renzi**.
**DROP** «tra i più belli e interessanti».

**V-C34 · Fontana della Carlotta and the Scala degli Innamorati — REWRITE.** Ships.
Piazza Ricoldo da Montecroce. The fountain and its stair, with the *Carlotta* of the etymological
legend named as one of the competing accounts, never as settled.
- **DROP both plaques from this record and as places.** The **Alvaro Amici** plaque at lot 31 and the
  **Iole Zedde** plaque at lot 28, via Guglielmo Massaia 22, are separate subjects at separate
  addresses, each resting on a single clause of a general article plus an OSM node. They are not
  fountain facts and they are not, on this sourcing, places.

**V-C35 · Il ponticello medievale di piazza Eugenio Biffi — DROP.** One clause, no date, no architect,
no independent source, no description. There is no honest record here.

**V-C36 · Chiesa dei Santi Isidoro e Eurosia, "la Chiesoletta" — REWRITE.** Ships. Via delle Sette
Chiese.
- **Keep every hedge the sources carry.** Exact wording: *"The entrance pronaos is attributed to
  Giuseppe Valadier"* and *"the portico holds three plaster relief bozzetti held to be by Antonio
  Canova"*. Do not harden either into a flat attribution.
- **PUBLISH:** the external plaque recording its building in 1818 by Monsignor Nicola Maria Nicolai,
  whose family held the neighbouring tenuta dei 12 cancelli; the 19th-century ruin and the restoration
  by the Oratorian Generoso Calenzio; the three bozzetti subjects; the single nave, the central
  polychrome marble altar, four side windows and cantoria; the annexation to the parish of San Filippo
  Neri in Eurosia under the Oratorian Confederation; the 1818 dedicatory inscription; its position on
  the via delle Sette Chiese pilgrimage route.

**V-C37 · Chiesa di San Filippo Neri in Eurosia — PUBLISH.** Via delle Sette Chiese. Built 1952–1955
to designs by Pier Luigi Maruffi, at the suggestion of Giovanni Battista Montini, with the benefactors
Tommaso and Irene Bradley; parish erected 20 December 1952 by the decree *Mirabili sollicitudine* of
Cardinal Vicar Clemente Micara; entrusted to and owned by the Oratorian Congregation; cardinalatial
title created by Paul VI on 7 June 1967; visited by Paul VI on 19 February 1967 and John Paul II on
23 February 1982; brick exterior with portico and side campanile; the two inscriptions quoted; three
aisles on stone columns; the fibreglass statue flanked by portraits of Cesare Baronio and John Henry
Newman; the 1996 mural of Filippo Neri on the flank.

**V-C38 · Via delle Sette Chiese — DROP as a place.** Wave 4 struck Via Marmorata under P6 and the
same reasoning binds here: this is a route, not a place, and it runs well beyond the quartiere. It
publishes as **context** on the zone page and inside V-C36 and V-C07, which sit on it.

**V-C39 · Parco di Commodilla — DROP as a separate place, FOLD into V-C07.** Its entire sourced
content is that the catacomb's entrance is in it.

**V-C40 · The Garbatella name — not a place, and the finder was right to say so.** Zone-page
background only, written as **three competing accounts** — the obliging innkeeper, the pleasantness of
the place, the *a garbata* vine-training on the tenuta dei 12 cancelli — with Guidoni's 2019
Clementina Eusebi / Maddalena Garbata proposal given as a proposal. **Never as settled.** The 1920s
debate over *Concordia* and *Remuria* publishes as a dated fact.

**V-C41 · Palazzo della Regione Lazio — REWRITE.** Ships.
- **DROP "presso il quartiere Garbatella" as the locator.** **Exact replacement:** *"On via Cristoforo
  Colombo, with entrances on piazza Odorico da Pordenone, in the Garbatella zona urbanistica of
  quartiere Q. X Ostiense."*
- **This is a working seat of regional government; the prose must not imply visitor access.**
- **PUBLISH:** the rationalist building put up as the national headquarters of INAM; its passage in
  1980 to the Lazio regional giunta and purchase by the Regione Lazio in 2009; palazzine A, B and C
  and their uses; its role as the Megaditta in *Fantozzi* (1975) and the resulting nickname *Palazzo
  di Fantozzi*.

### 5.5 The other churches

**V-C42 · Chiesa di San Benedetto — PUBLISH.** Via del Gazometro. Everything the finder gathered is
dated, attributed and specific: Pius X's 1912 decision, Benedict XV's start and the dedication that
remembers him, the 1916 hut, the completion under Pius XI, the parish erected 3 June 1926 by *Nostri
pastoralis officii*, the Society of the Divine Word, the atrium motto, the oval window, the arms of
Pius XII, the four left-hand chapels with Baldinelli, Consadori (1951), Filocamo (1953), Ferrazzi and
Santagata, and the plaques for John Paul II's visit of 14 February 1988 and the deaconry of 28 June
1988. Ships as written.

**V-C43 · Chiesa di Santa Galla — PUBLISH.** Circonvallazione Ostiense. Tullio Rossi, 1940; parish
erected 13 December 1940 by *Templum in honorem*; consecrated by Cardinal Ugo Poletti on 15 December
1990; visits of Paul VI 13 March 1966 and John Paul II 25 January 1981; the travertine colonnade, the
brick façade a salienti, the arms of Pius XII, three bells in E3 cast in 1940 by Cobalchini of Padua;
three aisles on red marble columns, trussed timber ceiling, fourteen clear windows, semicircular apse;
the works from the old Santa Galla demolished in 1935 for the widening of via del Teatro Marcello.
**The Flavian funerary altar is the strongest single object in this record** and publishes in full:
reused as a Christian reliquary in the 11th century, from Santa Maria in Portico (demolished 1932),
briefly in San Giorgio in Velabro, in Santa Galla since 20 September 1988; the two incised
inscriptions recording Gregory VII's consecration of Santa Maria in Portico and the altar's own
consecration on 8 July 1073, with the relic list; the four carved fronts. The Formentelli organ,
developed to 2003 from a 1967 core, fully mechanical, 94 stops, over 5,000 pipes, four 58-note manuals
and a 30-note pedalboard — counts and measurements, all publishable.

**V-C44 · Teatro in Portico — DROP.** One line in a list of another article, plus an OSM node. No own
site was fetched. It may return in a later wave with its own source.

**V-C45 · Basilica di Santa Maria Regina degli Apostoli alla Montagnola — REWRITE.** Ships, and
escalated as part of the southern-edge group. Via Antonino Pio. The article names the quartiere and
the street outright and the category is `Chiese di Roma - Q.X Ostiense`, which beats a toponym.
- **REWRITE the 1984 status**, exact replacement: *"It carries the title of minor basilica, conferred
  in 1984."* Not "designated", not "declared", not "protected". §2.1.
- **PUBLISH:** the Società San Paolo; Don Giacomo Alberione's wish for a shrine to Mary Queen of
  Apostles and the 1943 decision after a bombing on the site caused no casualties; the post-war build
  to Leone Favini's design, finished 1954; the cardinalatial title from 1965 and the parish from 1976
  by will of Paul VI; the central plan under a large dome; the Marian frescoes by Antonio Giuseppe
  Santagata; the remains of Alberione, Tecla Merlo and Giuseppe Timoteo Giaccardo; Gabriele Amorth's
  funeral there on 19 September 2016.

**V-C46 · Chiesa di Santa Marcella — REWRITE.** Ships. Piazza Nicoloso da Recco.
- **DROP "non lontano dal monastero di San Cosimato e dalla stazione Ostiense."** Orientation by
  impression, and it publishes nothing the address does not.
- **PUBLISH:** Leonardo Del Bufalo; parish instituted 13 May 1958 by *Qua celeritate*; hexagonal plan
  with a matroneum along the side walls and counter-façade; the tall reinforced-concrete campanile;
  two altarpieces by Marcello Ercole, exhibited at the IX Quadriennale in 1965; the counter-façade
  fresco by Dilvo Lotti; the Mascioni organ *opus 962* of 1973.

**V-C47 · Chiesa di San Leonardo Murialdo — DROP for this wave.** The finder states plainly that it
did not fetch the article, and gathered no facts. **A record with no gathered facts is not a
candidate.** The finder was right to hand it on rather than pretend; the right disposition of an
unresearched subject is not to ship it. It returns when someone fetches
*Chiesa di San Leonardo Murialdo (Roma)*.

### 5.6 Culture, university, parks

**V-C48 · Casa del Jazz (Villa Osio) — REWRITE, and the seat conflict is settled.** Ships. `theater`.
Viale di Porta Ardeatina 55, 00154 Roma, tel 06 80241281. Escalated as a straddler per §4.3; the
evidence is one-sided and Ostiense should write it.
- **The finder said "publish neither, or publish 'about 150' only if the verifier can pin one page."
  I pinned it.** The venue's own current page reads «Casa del Jazz ospita un Auditorium di circa 150
  posti». **Exact publishable wording:** *"The auditorium seats about 150."* The 134 figure is dropped.
- **Operator: Fondazione Musica per Roma**, from the venue's own site. it.wikipedia's Palaexpo is
  stale and is dropped.
- **PUBLISH:** the villa built 1936–1939 on the ruins of a 17th-century casale for Arturo Osio,
  co-founder of the Banca Nazionale del Lavoro, by the engineer Cesare Pascoletti, with the park by
  Pietro Porcinai; the 1980s purchase from the Vicariate by Enrico Nicoletti of the Banda della
  Magliana and his unauthorised alterations; the seizure of 14 November 1996, the definitive
  confiscation of 20 February 2001 and the assignment to the Comune di Roma on 26 September 2001 under
  law 109/1996; the opening of Casa del Jazz in April 2005; the stele at the park gate made with
  Libera carrying 683 names of mafia victims from 1893 to 2005; the Sala concerti "Armando Trovajoli",
  the rehearsal and recording rooms, the guest house, the restaurant; Amerigo Bartoli's fresco of
  Piazza Navona in the ground-floor former dining room; Villa Osio at 2,500 m² in a park of 25,240 m²;
  the box office opening on performance days from 19:00 until 40 minutes after the start, and
  ticketing through TicketOne.
- **One record, not two.** The park is the venue's park and is described inside it.

**V-C49 · Università degli Studi Roma Tre — Ostiense campus — REWRITE.** Ships as **one campus
record**, `attraction`.
- **HARD EXCLUSION, and it is a collision risk:** the **Dipartimento di Architettura at Largo G. B.
  Marzi 10 is in the shipped `mattatoio-di-roma-testaccio-rome`.** It must not appear in this record,
  by name, by address or by implication.
- **REWRITE the 1992 line**, exact replacement: *"The university has had premises in the quartiere
  since 1992."* A date, not a duration boast, and it is from it.wikipedia rather than the operator.
- **PUBLISH the addresses:** Via Ostiense 133 (rectorate), 123 (student registry), 139 (ex Tommaseo,
  DAMS); Largo San Leonardo Murialdo and Via della Vasca Navale 79/84 (science and engineering); Via
  Gabriello Chiabrera 199; Via Silvio D'Amico 77. The ex Vasca Navale recovery and the Palladium
  ownership publish; the "vecchie vetrerie" line publishes as the Garbatella article has it.

**V-C50 · Caffè Letterario — PUBLISH.** `cafe`. Via Ostiense 95, from its own site, which establishes
identity and address. The Bibliocaffè library publishes as a named feature. **No founding year, no
awards, no "a fixture since".** **C69 is this same place and is DROPPED as a duplicate.**

**V-C51 · Officine Fotografiche — DROP as sourced.** OSM plus a bare domain. The finder itself says it
"needs the operator's own address page" and did not get one. **It returns the moment someone fetches
that page** — the subject is real, the evidence is not yet there.

**V-C52 · The Via Libetta club strip — DROP as a cluster and as individual records.** Vinile,
Rashomon, Neo, Goa and Saponeria rest on OSM plus, in two cases, a bare domain. The corpus rule that
kills this group is the finder's own: an operator's site gives identity, address and hours **and
nothing else**, and a nightclub page is almost entirely the "else" — the founding year, the scene, the
reputation. Nothing survives the strip.
- **Muccassassina's start near the ex-gasworks on via Ostiense in the 1990s** is a dated fact and
  publishes as **zone-page context**, not as a place.
- **Arcigay, the Circolo di cultura omosessuale Mario Mieli and Di' Gay Project** are organisations,
  not visitor places, on this evidence. Mario Mieli may return as a place if someone fetches an address
  from `mariomieli.org`.

**V-C53 · Parco Ildefonso Schuster and the Monumento ai Caduti di Nassiriya — PUBLISH as one record.**
The park is **not** OSM-only: the Sovrintendenza page names it («annesso all'area verde del Parco
Schuster»), which is what saves it where the other parks fall. On via Ostiense; it contains the
Sepolcreto (V-C05). The monument was inaugurated on 30 March 2008 for the victims of the attack of
12 November 2003 on the Italian base at Nasiriyah, by the sculptor Giuseppe Spagnulo.

**V-C54 · Parco Giovannipoli — PUBLISH. The rest of the green space — DROP.**
- **Parco Giovannipoli ships**, because it has a second source and a fact: the quartiere article
  records that the name preserves the 9th-century fortified **Giovannipoli** founded by **John VIII**
  around the basilica.
- **DROP, OSM-only, no fact beyond a name and a polygon:** Parco Garbatella · Parco Marcella e Maurizio
  Ferrara · Parco Tashunka Witko Cavallo Pazzo · Parco dei Caduti del Mare · Giardino Zen · Orti urbani
  Garbatella · Parco Donatella Colasanti · Parco Enrico Maria Salerno · Parco Gino Strada.
  The finder asked for exactly this cut and it is the right one.
- **Tiberis** — the seasonal river beach is a Roma Capitale facility and is the one worth re-sourcing.
  **HOLD, not dropped on the merits:** it returns with a Roma Capitale page giving its season and
  hours. On OSM alone it does not ship.

### 5.7 Street art — the whole group DROPS

**§4.7, nine works — DROP.** *Hunting Pollution*, *Wall of Fame*, *Pianeta Terra*, *Outside In*, *Il
sorriso dell'universo*, *Quel che di più Caro*, *Scienza (è) Vita*, the *Murale Alberto Sordi*, *Tutti
Potenziali Bersagli*. Every attribution rests on an OSM `artist_name` tag. **An OSM tag is not a
source for an artwork's authorship**, and the finder said as much itself: "the artist attributions
above come from OSM tags and need a second source before any of them publishes as a place." I hold it
to its own standard. *Outside In* has a project page at yourban2030.org and is the likeliest to
return; it does not return on a tag.

**The Blu façades survive, and only they**, inside V-C15, because it.wikipedia's Blu article names the
artist, the building, the street and the year independently of OSM.

### 5.8 Food, drink and markets — cut to six

**PUBLISH, identity and address from the operator's own site, nothing else:**
- **V-C55 Porto Fluviale** — `restaurant`, Via del Porto Fluviale 22.
- **V-C59 Pasticceria Andreotti** — `cafe`, Via Ostiense 54b.
- **V-C60 Romeow Cat Bistrot** — `restaurant`, Via Francesco Negri 15.
- **V-C61 Hopside** — `brewery`, Via Francesco Negri 39/41.
- **V-C65 Tre de Tutto** — `restaurant`, Via Giustino de Jacobis 19.
- **V-C58 Al Biondo Tevere — REWRITE**, `restaurant`, Via Ostiense 178. Identity and address ship.
  **DROP the Pasolini claim entirely.** "The last place he ate" is exactly the kind of assertion this
  corpus cannot make on an operator's own page, and no independent source was fetched. **DROP any
  founding year**, whatever the site says.

**DROP:**
- **V-C56 Trattoria Pennestri**, **V-C57 Trattoria Zampagna**, **V-C63 Al Ristoro degli Angeli** — OSM
  only.
- **V-C64 Trecca** — OSM plus Facebook. Facebook is not an operator's own site for this purpose.
- **V-C66 Mercato Circonvallazione Ostiense**, **V-C67 Mercato Ostiense** — OSM only. A market with no
  sourced days or hours is a polygon.
- **V-C68 Lana Mixology & Rooftop bar** — the only hook is that the *address* was used in Özpetek's
  *Le fate ignoranti* (2001), which is a fact about the building and not about the bar. Strip that and
  what remains is a rooftop bar with a website. **The film fact publishes as zone-page context against
  the address on via del Porto Fluviale.**
- **V-C62 Eataly**, **V-C69 Caffè Letterario** — duplicates of V-C20 and V-C50.

The finder counted **355 named food, drink and lodging features** in the polygon and put nineteen
forward. **Six survive.** That is the honest number and the writer must not pad it back up.

### 5.9 The research tail (§4.9)

- **Quartiere INA-Casa / IACP di Valco San Paolo, the four star-plan towers — PUBLISH, and the finder
  was wrong to leave it unnumbered.** ArchiDiAP plus the quartiere article, both with the architects
  — Mario De Renzi, Saverio Muratori, Eugenio Montuori, Mario Paniconi, Giulio Pediconi, Fernando
  Puccioni — the dates 1949–50, the location between via Valco di San Paolo, via Corinto, via Efeso
  and via Filomene, and hard counts: 8,000 m², 440 dwellings, 2,600 rooms, four towers of eight
  storeys, three flats a floor, 24 flats each. `historic-site`. **A housing estate passes the kind
  test — the corpus already ships the Garbatella lots and the Alberghi.**
  **DROP** «sono il prototipo delle torri romane a impianto stellare, usate qui per la prima volta».
  **This is the one place where I promote what the finder held back.**
- **DROP:** Teatro Mongiovino · Teatro Garbatella · Teatro dei Conciatori · Teatro Spazio 18B — four
  theatres on OSM nodes and unfetched domains.
- **DROP: ACEA Heritage** — the finder cannot say whether it is a museum or an office. Neither can I.
- **DROP: Monumento alla Resistenza** — OSM way, nothing else.
- **DROP: Darsene di Pietra Papa** — the finder did not establish which bank it is on and it may be
  Portuense. **Do not publish a place whose side of the river is unknown.**
- **DROP: Stadio Tre Fontane and the Via delle Tre Fontane strip** — §4.4, offered to Ardeatino/EUR.
- **DROP: Circonvallazione Ostiense** — three quartieri.
- **FOLDED: the Cappella di San Filippo Neri** into V-C18.

---

## 6. WHAT THE FINDER GOT WRONG

**1. It reversed a museum's access. V-C19.** It wrote that the Polo museale dei trasporti has been
closed since 2020 and that "a 'closed' status here is an affirmative claim the source supports". The
article it cited says «Il museo ha riaperto il 14 ottobre 2022». A reader sent to a locked gate by a
guide is the worst failure this corpus has. **This is the single error that most justifies the
verifier step existing.**

**2. It attributed to sources facts those sources do not carry.** At **C02**, the 1 July 2013 opening,
the *porticus sancti Pauli*, *Johannipolis* and the 8th–15th-century building yard are not on
`basilicasanpaolo.org/chiostro-e-area-archeologica/`. At **C20**, the designers, the escalator count,
"it never worked", the RFI sale of 15 June 2009 to Geal s.r.l. for €10,820,000 and the date 21 June
2012 are in **none** of the three sources it lists for that candidate. At **C01**, the Saturday Mass
schedule is not on the hours page. Each of these reads as sourced and is not.

**3. It over-collected and then asked me to do the cutting.** Sixty-nine numbered candidates with
nineteen restaurants, ten street-art works sourced to OSM tags, ten parks sourced to OSM polygons and
four theatres sourced to domain names it never opened. It knew — "a verifier should cut this list
hard", "a verifier may well cut it", "cut the OSM-only records ruthlessly" — and produced them anyway.
Flagging a weak record does not make it a candidate. **Twenty-two of my eighteen drops plus three
struck groups are things the finder itself said were probably uncuttable.**

**4. It listed one candidate it had not researched at all.** C47. The honesty is admirable; the
listing is not. An unresearched subject belongs in the tail, not in the numbered set.

**5. It duplicated two places.** C20/C62 and C50/C69. In a corpus whose gate fails on the same place
appearing twice, a finder that submits its own duplicates has handed the gate a live round.

**Now what it got right, because most of it is.** The boundary work is the best in this wave — six
relations stitched and ray-cast, cross-checked against the quartiere's own boundary prose and against
two prior waves' findings, with four-for-four agreement on Testaccio's handover list. The Municipio
trap was found and disarmed with a raw-wikitext read that a summarising fetch gets wrong. The Vatican
case was reasoned from the treaty's own articles and the Art. 13/15 versus Art. 16 distinction is
exactly right. The banned-phrase register at §5 is twenty entries long, and **every one I checked was
genuinely present in the source and genuinely banned** — including the three on the museum's own page
that a careless writer would have copied verbatim. It refused four bridges it could have grabbed,
refused the Pyramid and the walls, refused the plaques, refused Tre Fontane and refused Marconi. And
its flag on the John Paul II sequence was the right call to escalate and, on the evidence, right on
the merits. **A finder that flags its own weaknesses honestly is worth more than one that ships a
tidier file.**

---

## 7. STRADDLERS ESCALATED — the list for the arbitrator

1. **Ponte dell'Industria** — Ostiense / Portuense.
2. **Ponte San Paolo** — Ostiense / Portuense, with Testaccio shipped and out.
3. **Ponte Guglielmo Marconi** — Ostiense / Portuense.
4. **Ponte della Scienza Rita Levi-Montalcini** — Ostiense / Portuense.
   *Recommendation: award Ostiense at most two of the four.*
5. **The four 1943 memorial plaques at Porta San Paolo** — should stay with the gate, in shipped
   San Saba. Ostiense claims none.
6. **Casa del Jazz** — Ardeatino to concede or contest; the evidence is one-sided for Ostiense.
7. **The southern-edge group: Forte Ostiense, Santa Maria Regina degli Apostoli alla Montagnola,
   Catacomba di Santa Tecla** — all three name the quartiere in their own prose and publish here;
   Ardeatino may contest them as a set.
8. **The Stadio Tre Fontane / Via delle Tre Fontane strip** — Ostiense does not want it; offered.
9. **The 12A Eur overlap** — EUR should be told the quartiere contains the northern part of zona 12A.
   Nothing surviving here sits in it.

---

## 8. TIER RULING

**FULL GUIDE. 47 places survive** — 17 ruled PUBLISH and 30 ruled REWRITE, all of which ship with the
wording supplied above. Not a town page: the finder said as much and I agree, though for a different
reason than density. Ostiense has the material for a town page and has the geography of a quartiere,
and a town page implies a coherent walkable place. This is 47 records spread over four kilometres of
via Ostiense.

**I tested the ruling the way wave 2 said a tier ruling must be tested: strike every contested object
and see whether it moves.** Remove all four escalated bridges, the whole southern-edge group — Forte
Ostiense, the Montagnola basilica, Santa Tecla — and Casa del Jazz as well, and **43 remain.** The
four-place floor is not remotely in play and no part of this tier rests on anything I escalated.

**What actually carries it.** Six records with hours or prices from an official or operator source I
re-fetched myself — the basilica, the cloister and archaeological area, the monastic garden, the
Sepolcreto with its Rupe sector, Centrale Montemartini, and Commodilla's by-request terms. Four
independent clusters that do not lean on each other: **the San Paolo complex** (four records, a papal
basilica with a ticketed museum), **industrial archaeology and transport** (nine records — the
Gazometro frame, the ex Mercati Generali, the Consorzio Agrario entrance, the Porto Fluviale barracks,
two stations, a metro station, a transport museum and the ex Air Terminal), **Garbatella** (twelve
records with a dated foundation stone, named architects and a verbatim 1920 inscription), and **the
churches** (seven records, all with an architect and a dated erection decree). Plus archaeology —
a necropolis, two catacombs and a cistern — and a bridge that is Ostiense's alone.

**Three warnings the writer must carry from this ruling.**

**First, the failure mode here is looseness, not thinness, and the finder named it correctly.** A
quartiere straddling three Municipi cannot use "in Ostiense" as a locator. Every one of the 47 carries
a street address or a named square; if a draft record loses its address, that record is not ready.

**Second, the food section will feel thin and must stay thin.** Three hundred and fifty-five named
food and drink features in the polygon, nineteen put forward, **six shipping**. A reader arriving on
via Ostiense expecting the nightlife will get six doors and no clubs, because the Libetta strip is
sourced to map tags and domain names. That is the honest answer and it must not be inflated with
atmosphere — and after the operator-founding-year rule, it cannot even lean on how long anyone has
traded.

**Third, this zone carries the corpus's hardest legal record and it must be written exactly once and
exactly right.** San Paolo fuori le Mura is Italian soil with Art. 15 diplomatic-premises immunities.
Not the Vatican. Not a border. Not Art. 16. The wording at §2.2 is not a suggestion.
