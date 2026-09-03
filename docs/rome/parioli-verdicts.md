# Parioli — verdicts

Adjudication of `docs/rome/parioli-finder.md` (43 candidates). Verifier pass, 2026-09-03.

Unit: **Q. II Parioli**, quartiere, Roma Capitale toponymic code **202**, numeral **Q. II**. Roster
slug `parioli`.

---

## 0. Mechanical collision check — run, not reasoned about

```
$ python3 .superpowers/taken_slugs.py parioli     → 0 matches
$ python3 .superpowers/taken_slugs.py flaminio    → 2 (Obelisco Flaminio / Campo Marzio;
                                                      Palazzetto di Flaminio Ponzio / Sant'Angelo)
$ python3 .superpowers/taken_slugs.py ponte-milvio → 0
$ python3 .superpowers/taken_slugs.py antenne      → 0
$ python3 .superpowers/taken_slugs.py catacomb     → 0
$ python3 .superpowers/taken_slugs.py auditorium   → 1 (Auditorium Conciliazione / Borgo)
$ python3 .superpowers/taken_slugs.py acetosa      → 0
$ python3 .superpowers/taken_slugs.py perenna      → 0
$ python3 .superpowers/taken_slugs.py salario      → 0
$ python3 .superpowers/taken_slugs.py villa        → 18, none in Q. II
```

**907 places already owned across 21 shipped files** — note, not 786; the brief's figure is stale
and the finder repeated it. Nothing in this file collides.

Two near-misses that are name collisions only, not place collisions:

- **Auditorium Conciliazione** is Borgo's, on via della Conciliazione. A different building. Parioli's
  slug must be distinct on its face — `parioli-auditorium-parco-della-musica-rome`, never
  `auditorium-rome`.
- Neither shipped **Flaminio** row is a Q. I Flaminio place; both are people/obelisks named Flaminio.
  The **Stadio Flaminio** is unowned.

One live hazard the finder flagged correctly and I confirm: the **Fonte di Anna Perenna's** finds are
displayed at the **Terme di Diocleziano**, which is **Castro Pretorio's and shipped**. The display is
not a Parioli place. Only the fountain can be, and only if the straddle resolves (§3).

---

## 1. Re-fetches — eight sources, the five the finder leaned on hardest plus three

| # | Source | Verdict |
|---|---|---|
| 1 | Sovrintendenza Capitolina, `villa_ada_savoia` | **Confirms**, with one correction |
| 2 | Sovrintendenza Capitolina, `…villa_romana` | **Confirms — including the Flaminio problem** |
| 3 | `auditorium.com` home page | **Confirms the halls and hours; CONTRADICTS the address** |
| 4 | `auditorium.com/it/museum/museo-aristaios/` | **Confirms verbatim, every figure** |
| 5 | it.wiki `Stadio Flaminio` (action=raw) | **Confirms Parioli; corrects the capacity** |
| 6 | it.wiki `Forte Antenne` (action=raw) | **Confirms — including the banned vincolo sentence** |
| 7 | it.wiki `Fonte di Anna Perenna` (action=raw) | **Confirms, and yields the address the finder said did not exist** |
| 8 | Sovrintendenza Capitolina, `villa_glori` | **Confirms; corrects the date and the artist list** |
| 9 | `sanluigi.roma.it` | **Confirms, and yields an address and mass times the finder did not fetch** |
| 10 | it.wiki `Moschea di Roma` (action=raw) | **Confirms; the architect list is incomplete in the finder** |

### The three that did not say what the finder said

**(a) The Auditorium's street number is 10, not 30.** The finder wrote «Viale Pietro de Coubertin,
**30**, 00196 Roma — the operator's own footer». The footer, re-fetched, reads verbatim
**«Viale Pietro de Coubertin 10 - 00196 Roma»**. The record publishes **10**, because the operator's
own site is what establishes its location. This is the single factual error in the file that would
have shipped as a wrong address.

**(b) Telfener is not described by the Sovrintendenza the way the finder describes him.** The finder
credited to the Sovrintendenza that the 1878 buyer was «**Giuseppe Telfener, administrator of the
royal family's estate**». The page says **«nel 1878 la villa fu venduta al conte di origine svizzera
Tellfner»** — a count of Swiss origin, spelled *Tellfner*, with no estate-administrator role and no
forename. The estate-administrator detail and the "named for his wife Ada" are it.wiki's, not the
Sovrintendenza's. Attribution must be split accordingly (§2, entry 6).

**(c) Villa Glori's clash is the night of 22–23 October, and the artist list is longer.** The
Sovrintendenza page gives the volunteers entrenched on Monte Cacciarello **«durante la notte fra il
22 e il 23 ottobre»**, and lists the 1997–2000 installations as **Dompè, Mattiacci, Mochetti,
Caruso, Castagna, Kounellis, Nunzio, Staccioli (1997), Uncini and Canevari (2000)** — ten names, not
the six the finder printed. Neither is a defect of honesty; both are wording the record must not get
wrong.

### The two the finder asked me to fetch, and what they gave

- **`sanluigi.roma.it`** resolves. Address **Via di Villa Emiliani 15, 00197 Roma**; mass times
  weekdays 07:30 and 19:00, Saturday 09:00 and 19:00, Sundays and holidays 09:00, 10:30, 12:00 and
  19:00. A parish's own site establishes its identity, location and hours, so **all of this
  publishes**. Entry 26 is upgraded, not merely confirmed.
- **it.wiki `Moschea di Roma`** names **four** designers — Paolo Portoghesi, Vittorio Gigliotti,
  **Sami Mousawi** and **Nino Tozzo**. The finder printed two. Mousawi in particular may not be
  dropped from an account of this building. The opening is dated **21 June 1995**, not merely 1995.

### What I could not improve on

`teatroparioli.it`, `060608.it`'s Villa Ada page and the MUSA page at `santacecilia.it` were left
alone; the finder's account of why they yield nothing is correct in substance, and the consequence —
**no hours for the Teatro Parioli, no hours for Villa Ada, no hours for MUSA** — stands. None of that
reasoning goes on a page.

---

## 2. Rulings, all 43

Counted at record level. **REWRITE** means the place survives and the wording named must change.

### PUBLISH — 12 records

**2. MUSA — Museo degli strumenti musicali dell'Accademia nazionale di Santa Cecilia.** PUBLISH.
Gallery opened February 2008; about 130 instruments and some fifty luthier's accessories; the
Stradivari "Toscano" of 1690 from the quintetto Mediceo, a Tecchler viola, a mandolin from Margherita
di Savoia's collection. **No hours.** Where the page would want them it says: *No source states its
opening hours, so none are given here.*

**3. Museo Aristaios (Collezione Sinopoli).** PUBLISH, every figure confirmed verbatim against the
museum's own page: Sala del Peduncolo, over 300 m², 161 works from the Sinopoli heirs, opened
December 2012, **ingresso gratuito**, Saturdays 11:00–18:00 (11:00–20:00 in summer time), Sundays and
public holidays 10:00–18:00 (10:00–20:00 in summer time), with exhibition spaces liable to close
during particular events. The ceramic sequence and the Alvisi Kirimoto fit-out publish.

**7. Palazzina Reale di Villa Ada.** PUBLISH. 1873–75, Gennaro Petagna with Guglielmo Castelnuovo;
royal residence 1904–1946; acquired by the Arab Republic of Egypt in 1997 and since then the seat of
its embassy. **Status `closed` is correct and defensible** — a working diplomatic mission is an
affirmative, sourced fact, and the prose must say that is why. Visitors see it from the park.

**8. Bunker di Villa Ada Savoia.** PUBLISH. Built 1940–42 into the tufa of the hill "delle Cavalle
Madri", about 350 m in a straight line from the Palazzina, with no underground link to it and a
drive-in entrance; armoured doors, filtration, stores, a second exit by spiral stair from a small
circular structure. No plans or cost schedules survive. Restored and open to visitors since April
2016 under an agreement between the Comune and the Associazione Roma Sotterranea. **No hours, no
prices.** Status `open`, prose stating visits are run by the association.

**12. Catacomba dei Giordani.** PUBLISH. Under Villa Ada; 2nd half of the 3rd century to the 1st half
of the 5th, on inscriptions dated 269 and 436; named for the Giordani; brought to light in 1720 by
Boldetti and Marangoni; the identification settled by the 1966 excavations of the Pontificia
Commissione di Archeologia Sacra on the tomb of the martyr Alexander. On access the page says: *No
source states whether it can be visited, so none is given here.*

**13. Catacomba di Sant'Ilaria.** PUBLISH. Joined to the Giordani around the 18th century by
*corpisantari* through a narrow gallery; visited by Antonio Bosio at the end of the 16th century and
described in his posthumous *Roma sotterranea*; of the arcosolio dell'auriga only the horses' heads
and a running figure survive.

**16. Ipogeo di Villa Glori.** PUBLISH, at honest length — one short paragraph. Found by chance in
1794; rooms used as tombs, some divided into niches; frescoes of Hercules, Bacchus and the Dioscuri;
in the care of the Sovrintendenza capitolina. **Status `closed`, sourced to `Visitabile = No`.**

**17. Fontana dell'Acqua Acetosa.** PUBLISH, whole. Below street level, reached by a stair; the
ferruginous spring; Paul V had the water analysed in 1613 and had Giovanni Vasanzio build a fountain
in 1619; Innocent X restored it; Alexander VII commissioned the present fountain; the Bernini
attribution is probably false, with Andrea Sacchi or Marco Antonio De' Rossi proposed; exedra front
with three niches carrying the Chigi arms; Clement XI's 1712 restoration with Lancisi and Bordoni.
Paul V's epigraph publishes in full. Status `open`; no hours exist and the page says nothing about
them.

**21. Villaggio Olimpico.** PUBLISH **as one place written as part of Parioli**, which is the
correct application of the Garbatella ruling — a zona urbanistica is not a unit of its own. Built
1958–59 by Cafiero, Libera, Luccichenti, Monaco and Moretti on the site of the wartime shanty
settlement called campo Parioli; funded by the state employees' pension fund, the Comune and CONI;
handed to INCIS and allotted by competition; inaugurated 1960 for the XVII Olympiad; cut north–south
by the Corso di Francia viaduct, main axis viale XVII Olimpiade.

**24. Chiesa di San Valentino al Villaggio Olimpico.** PUBLISH. Viale XVII Olimpiade; 1983–86,
Francesco Berarducci; consecrated by Cardinal Ugo Poletti on 23 November 1986; exposed brick with a
steel and glass roof, preceded by an angel reproducing one on Ponte Sant'Angelo; parish constituted
2 May 1962 by *Ludis olimpicis solemniter*; visits by Paul VI on 5 June 1969 and John Paul II on
16 February 1992.

**28. Teatro Parioli–Costanzo.** PUBLISH. Via Giosuè Borsi 20; built 1938 as a cinema; opened as a
theatre on 29 December 1958 with Schnitzler's *Girotondo* by the Calindri–Gioi company; renamed
Teatro Parioli–Costanzo on 20 February 2024; since 2024 also a school for children and young people
directed by Raoul Bova and Rocío Muñoz Morales. **No hours, no programme, no prices** — and the page
does not explain why.

**31. Ponte Flaminio.** PUBLISH. Carries Corso di Francia over the Tiber between Parioli and Tor di
Quinto; Armando Brasini with the engineer Aristide Giannelli; begun 1938, finished 1951; 254.94 m
long, 27 m wide; planned as a northern entrance to the capital and intended to be called Ponte
XXVIII Ottobre; from 1960 it connects to the Corso di Francia viaduct. Tor di Quinto is out of scope,
so no rival claimant exists; the record says the bridge stands in both quartieri.

### REWRITE — 12 records

**1. Auditorium Parco della Musica "Ennio Morricone".** REWRITE, three changes.

- **Address: "Viale Pietro de Coubertin 10, 00196 Roma."** Not 30. The operator's footer, re-fetched.
- **Halls: print the operator's numbers only** — Sala Santa Cecilia 2,744; Sala Sinopoli 1,133; Sala
  Petrassi 673; Teatro Studio Borgna 300; Cavea 3,000–5,000; Giardini pensili Claudio Abbado
  38,000 m². Do **not** print it.wiki's 2,756 and 308 beside them, and do not narrate the
  discrepancy — a reader does not need to know two sources disagree. Silently prefer the operator.
- **Hours, exactly as printed:** "October to March, 11:00–20:00, and 11:00–20:00 on Sundays and
  holidays; April to October, 11:00–20:00, and 10:00–20:00 on Sundays and holidays. On days with a
  show in the Cavea the Auditorium closes at 16:00."

Everything else publishes: Renzo Piano, 1995–2002, the 55,000 m² site, the opening of 21 April 2002
with the Sala Sinopoli and of 21 December 2002 with the Sala Santa Cecilia under Chung Myung-whun,
the naming for Ennio Morricone by a 2020 council resolution, the lead-clad halls round the open-air
cavea, the Accademia Nazionale di Santa Cecilia season since 2003, the Fondazione Musica per Roma,
and the Festa del Cinema since 2006. The finder's refusal of «il più grande luogo di spettacolo
d'Europa» is **upheld** — an operator's strapline is still a superlative.

**6. Villa Ada Savoia.** REWRITE, four changes.

- **Attribution split on Telfener.** Write: "In 1878 the villa was sold to a count of Swiss origin
  whose name the Sovrintendenza Capitolina gives as Tellfner; it.wikipedia gives the name as Giuseppe
  Telfener and says the estate took the name Ada from his wife." Do **not** put
  "administrator of the royal family's estate" in the Sovrintendenza's mouth.
- **DROP the hours.** "Tutti i giorni dall'alba al tramonto" rests on it.wiki repeating a Roma
  Capitale page that no longer serves it. The page says: *No source states its opening hours, so none
  are given here.* It does **not** say the link is dead.
- **DROP «il quarto più grande parco pubblico di Roma»** — upheld, a size ranking. **160 hectares**
  publishes and carries the same weight.
- **The 25 July 1943 arrest of Mussolini publishes** and should lead the history. So do the
  Pallavicini unification at the end of the 1780s with Saint-Hubert and Bettini, the 1839 Presidenza
  del Censo plan, the 1872 sale to Vittorio Emanuele II, the 1904 repurchase, the royal residence to
  1946, the 1957 demanio acquisition, the named buildings (Casale "La Finanziera", now WWF; the
  Fienile; the Casale delle Cavalle Madri; Villa Polissena; the Scuderie reali; the Villa Reale; the
  Casino Pallavicini; the Tempio di Flora; le Tribune on via Salaria), the Tempio di Flora's
  description with its late-19th-century cast iron fountain, the 80/20 planting split, the umbrella
  pines and the 1940 metasequoia, the fauna, the four-kilometre ring path with panels, and *Roma
  incontra il mondo* at the lake since 1994. Entrances: via Salaria 267, 273 and 275; via di Ponte
  Salario; via di Monte Antenne; via Panama. Located "Municipio II, quartiere Parioli" — confirmed
  verbatim, and this is one of the four sources that let Parioli state a Municipio at all.

**9. Forte Antenne.** REWRITE — one deletion, one date rule.

- **DELETE the vincolo sentence.** Re-fetched and confirmed present: «Il forte è vincolato ai sensi
  del Codice dei beni culturali e del paesaggio con D.M. 6 agosto 2008». Banned outright by the
  evidence ruling, in Italian, in English, and in paraphrase. No "protected", no "listed", no
  "heritage", no decree date. **This is the one place in the file where a shipped page would have
  broken a binding ruling, and the finder caught it. Upheld.**
- **Do not print a single build date.** The infobox says 1880–1884; the body says 1882–1891. Write:
  "One of the fifteen forts built round Rome between 1877 and 1891. Its own article dates the fort
  1880–1884 in the infobox and 1882–1891 in the text."
- Publishes: on Monte Antenne in the north sector of Villa Ada, near the Aniene–Tiber confluence, in
  «il quartiere Q. II Parioli, nel territorio del Municipio Roma II» (confirmed verbatim); 2.5
  hectares; "Prussian" style; strategic role ended 1919; store for the Reggimento Radiotelegrafisti
  to the 1940s; ceded by the demanio to the Comune in 1958 for the 1960 Olympics; abandoned; owner
  Roma Capitale. **Status `closed`, sourced to `Visitabile = no`.**

**10. Antemnae.** REWRITE — **drop the bare "13"**. A number with no unit is not a measurement. Everything
else publishes: the oppidum of Latium vetus on Monte Antenne inside Villa Ada; the Antemnati;
Plutarch, Dionysius, Livy, Virgil and Silius Italicus; Romulus storming the town after the raid that
followed the rape of the Sabine women; identified 1834 by Antonio Nibby, excavated 1878, 1978 and
1986; in the care of the Sovrintendenza capitolina. On the etymology, **use the Sovrintendenza's
form and attribute it**: "the Sovrintendenza Capitolina glosses the name *ante amnem*, before the
river." Do not print both grammars and adjudicate between them on the page.

**14. Catacomba di Trasone.** REWRITE — **drop «una delle più profonde catacombe di Roma»**; upheld,
a priority claim. **Five levels is a count and publishes.** So do: on via Salaria at the junction with
via Yser; named for Trasone, a wealthy Roman of Diocletian's time named in the *passio* of St
Susanna; also *Coemeterium Thrasonis ad s. Saturninum* for the martyr Saturninus, whose above-ground
basilica was still visible at the end of the 16th century; entered through a manhole; grown out of a
sandstone quarry; running almost entirely beneath Villa Grazioli and its park, with a light-well in
the courtyard of Villa Ada's Palazzina Reale.

**15. Villa Glori (Parco della Rimembranza).** REWRITE, three changes.

- **The clash is the night of 22–23 October 1867.** The Sovrintendenza says so in terms; the finder's
  instruction to "print the 23 October 1867 date" flattens it. Write: "some seventy volunteers
  crossed into papal territory on 20 October 1867 and entrenched themselves in a vineyard on Monte
  Cacciarello, where the papal zouaves overran them during the night of 22–23 October."
- **DROP "its oldest building is a fortified casale".** That is a priority claim inside the property,
  and the ban does not stop at the city limits. Write: "A fortified casale survives from the period
  when the hill was vineyard and hunting ground rather than a suburban villa."
- **The artist list is ten names, not six:** Dompè, Mattiacci, Mochetti, Caruso, Castagna, Kounellis,
  Nunzio and Staccioli in 1997; Uncini and Canevari in 2000.

Publishes: 25 hectares; entrances piazzale del Parco della Rimembranza and viale Maresciallo
Pilsudski; "Municipio Roma II, quartiere Parioli" verbatim; the vineyard of Vincenzo Glori whose name
the hill kept; Enrico Cairoli's death and Giovanni's; Pascarella's twenty-five Romanesco sonnets of
1886; the 1883 master plan; the 1895 Pietrasanta marble column on a rustic travertine base; the
Comune's repossession of part of the park in 1905 and the resolution of 23 October 1923; Raffaele de
Vico's design in eight months; **the opening on 18 May 1924**; piazzale del Mandorlo with the Cairoli
monument, the brick structure that held the almond branch, and the cippus; viale dei Settanta; the
Nassiriya plaque behind Canevari's *Uomo Erba*; the three 1929 wooden pavilions. Status `open`; no
hours are sourced and the page says so.

**23. Stadio Flaminio.** REWRITE, and **ruled to Parioli**. Two changes.

- **Capacity: 42,000.** The article says «Lo stadio era capace di 42000 posti». "Over 40,000" is
  softer than the source and there is no reason to soften it. **DROP "later cut by more than half"** —
  I did not find that in the re-fetch and it is a reduction claim with no figure behind it.
- **Status.** The article records the FIGC conducting the ground since 26 February 2014 and
  redevelopment proposals under discussion, but **no source states current public access**. Status
  `open`, and the prose says: *No source states whether it can currently be visited.* Do not write a
  `closed`, and do not narrate the redevelopment as a closure.

Publishes: viale Tiziano; Antonio Nervi with structural engineering by Pier Luigi Nervi; inaugurated
19 March 1959 in a live television broadcast; on the site of the Stadio Nazionale; built for the 1960
Olympic football tournament; pitch 105 × 70 m; total area 21,600 m²; cost about 900 million lire of
the day; used from the 1970s by the Italy national rugby team and by Rugby Roma Olimpic, and at times
by Lazio, Roma, Lodigiani and Atletico Roma.

**On the boundary: Parioli, twice.** it.wiki states it in terms — «nonostante il nome lo stadio
appartiene amministrativamente al quartiere Parioli» — and the OSM point test at 41.92800, 12.46990
independently returns Parioli (Q. II). Two methods, one answer. **Flaminio's finder must be told, but
this is not a straddle to escalate; it is a resolved question with a misleading name.**

**25. Chiesa di San Roberto Bellarmino.** REWRITE, two changes.

- **Omit the consecration day.** The body says 20 May 1959 and the infobox says 30 May 1959, in one
  article. Write "consecrated in May 1959" and print neither day. Do not stage the conflict for the
  reader.
- **DROP "the principal Catholic centre for Parioli's residents".** A priority claim, from the
  quartiere's own unfootnoted article. The parish facts carry the point without it.

Publishes: piazza Ungheria; «nel quartiere Parioli, rientrante all'interno dei confini del Municipio
Roma II», sourced to the Diocese of Rome; 1931–33, Clemente Busiri Vici, rationalist; opened for
worship 10 June 1933; dedicated to Robert Bellarmine, canonised 1930; parish erected 13 May 1933 by
Pius XI with *Quae maiori religionis*, entrusted to the Jesuits and passed to diocesan clergy in 2003;
a cardinalatial title since 1969; John Paul II's visit of 2 March 1980. Status `open`; no hours are
sourced and the page says so.

**26. Chiesa di San Luigi Gonzaga.** REWRITE — **upgraded, because I fetched the parish site the
finder did not**.

- **Address: Via di Villa Emiliani 15, 00197 Roma**, from the parish's own site.
- **Mass times publish**, from the same source: weekdays 07:30 and 19:00; Saturday 09:00 and 19:00;
  Sundays and holidays 09:00, 10:30, 12:00 and 19:00. A parish's own site establishes its identity,
  location and hours, and these are hours.

Publishes: foundation stone laid Thursday 18 July 1929 at a ceremony led by Cardinal Basilio Pompilj;
built by Enrico Castelli in 1929 as the church of the adjoining Carmelite convent; the complex sold to
the Comboni missionaries in 1958; parish from 7 January 1963 by *Percrescente incolarum numero*, its
territory taken from San Roberto Bellarmino and Sacro Cuore Immacolato di Maria, with an interior
restoration at that time; John Paul II on 6 November 1988; the relic of the heart of St Aloysius
Gonzaga enthroned 13 March 2012; Kiko Argüello's 1993 fresco of St Thomas in a side chapel.

**27. Grande Moschea di Roma.** REWRITE, three changes.

- **DROP «la più grande moschea d'Europa».** Upheld — a superlative, and the citations to Turismo
  Roma, Centro Astalli and Rainews do not save it. The 30,000 m² and the capacity carry the scale.
- **Four designers, not two: Paolo Portoghesi, Vittorio Gigliotti, Sami Mousawi and Nino Tozzo.** The
  finder dropped Mousawi and Tozzo. Mousawi's omission from an account of this building is not a
  rounding error.
- **Opened 21 June 1995**, not "1995". Begun 1984.

Publishes: viale della Moschea; at the foot of the Monti Parioli and Monte Antenne, next to the Acqua
Acetosa sports facilities; seat of the Centro islamico culturale d'Italia; 30,000 m² of ground;
capacity up to 12,000 worshippers, and about 30,000–40,000 on major feasts such as the Feast of the
Sacrifice; postmodern and Islamic in style. **No visiting hours** — `centroislamico.it` is a different
body in Milan, and the page simply gives no hours rather than saying why.

**32. Ponte Salario.** REWRITE — **drop "the one Roman bridge over the Aniene named by ancient
writers"**. That is a uniqueness claim wearing a beard, and Rome has no reachable register of bridges
to check it against. Write instead: "Ancient writers name the bridge repeatedly," and then let the
citations do the work.

Publishes: carries the via Salaria over the Aniene, in the quartieri Parioli and Trieste and the zona
Val Melaina; the last bridge the Aniene passes under before the Tiber; rebuilt 1930; Livy VII.9 on the
Gauls camping three miles from Rome on the via Salaria beyond the bridge over the Aniene; Hannibal's
camp on the plain before it in 211 BC; Ricimer halting there in 472 and Witiges in 537; badly damaged
in 544. **Triple straddle with two out-of-scope units — Parioli is the only in-scope claimant, and the
record states the bridge stands in three units rather than pretending it is wholly Parioli's.**

**35. Villa Grazioli (the public garden).** REWRITE, two changes.

- **Attribute the aggregator.** The Badoglio villa and the Chinese embassy come to it.wiki from
  `roma2pass.it`, which is an aggregator. Write "according to roma2pass.it" or drop the embassy line.
  I would keep it and attribute — it is checkable and consequential.
- **Keep the two buildings apart.** The **place** is the 4,200 m² public garden reached from via
  Bruxelles and viale di Villa Grazioli. The former Badoglio villa is a working embassy and is not
  visitable; the record must not read as though a visitor enters it.

Publishes: «nel Municipio II, nel quartiere Parioli»; what survives of the original park after the
1920s subdivision; documented as "Villa Lecci" on the 1839 plan and on the 1845–6 plan of the *cantoni*
drawn for Baron von Moltke; passed to the Grazioli Lante della Rovere at the end of the 19th century;
Clemente Busiri Vici commissioned in 1937 to build a villa here for General Badoglio; Badoglio's
meeting with the American general Maxwell Taylor on the night of 7–8 September 1943. Cross-reference:
the Catacomba di Trasone runs almost entirely beneath this villa and its park.

### ESCALATE — 3 straddlers, unresolved, for the arbitrator

**4. Villa romana dell'Auditorium and its Museo Archeologico.** **ESCALATED. Parioli / Flaminio.**

I re-fetched the Sovrintendenza page and the finder is right about what it says. The opening words
are verbatim **«Nel quartiere Flaminio, durante i lavori per la realizzazione dell'Auditorium
progettato da Renzo Piano, nel 1995 vennero alla luce i resti di una grande villa suburbana»**, and
the body places the site **«ai piedi dei monti Parioli, non lontana dall'antica via Flaminia e dal
fiume Tevere»** — which is a topographic description of the Parioli hills, not a toponymic
assignment. So an official Roma Capitale body says **Flaminio** in print, in its first four words,
while it.wiki lists the villa under Q. II Parioli's archaeological sites and the Auditorium 65 m away
is Parioli on both a stated source and an OSM point test.

**I do not resolve it, and I decline to let Parioli take it on the strength of the neighbouring
building.** The finder's own instinct — that the Sovrintendenza is using "Flaminio" loosely for the
whole Flaminio–Villaggio Olimpico basin — is probably right and is still an inference against a
printed statement by the body that runs the museum. Flaminio is writing this wave and will meet the
same sentence from the other side. **The arbitrator decides.**

If it comes to Parioli, the material is strong and ready: excavated area about 2,500 m² at the foot
of the Monti Parioli, structures four metres down surviving at foundation level, continuous occupation
from the second half of the 6th century BC to the 2nd century AD and then abandonment probably to the
Tiber's floods; a modest 6th-century-BC farm; a rich 5th-century rural villa round a central court
with a well-preserved olive press whose pressing surface is cut from a squared block of cappellaccio;
a roofed court from the late 4th–early 3rd century and an eaves tile with the bearded head of a river
god identifiable as Achelous; an atrium with impluvium, bedrooms and tablinum between the mid-3rd and
the 2nd century; an Augustan enlargement behind a heavy reticulate wall. **Ingresso libero.** Print
the Sovrintendenza's 2,500 m² for the excavated area and do **not** print the Auditorium index's
2,000 m² beside it — they are measuring different things and the page should not stage the
uncertainty.

**18. Fonte di Anna Perenna.** **ESCALATED. Parioli / Pinciano — and the finder's account is now
out of date.**

The finder wrote «I found no street address on any page I reached». **I found one.** The article,
re-fetched raw, says the fountain was discovered in 1999 during works for a car park **«nel quartiere
Parioli»** and names **via Guidubaldo del Monte e piazza Euclide**. That both sharpens the straddle
and complicates it: the article states Parioli in words *and* is categorised `Roma Q. II Parioli`,
while the location it names touches the square that the finder's OSM test returns as Pinciano (Q. III).
Via Guidubaldo del Monte runs off piazza Euclide, so both readings can be literally true of different
ends of one car park.

**My lean is the opposite of the finder's: the explicit textual statement "nel quartiere Parioli"
outweighs an OSM point test on an adjacent square, and the finder leaned Pinciano only because he had
no address.** But Pinciano is writing this wave, the address is now on the table, and this is exactly
the class of call the arbitrator exists for. **Not claimed here.**

Confirmed for whoever gets it: a votive fountain of the 4th century BC to the goddess Anna Perenna,
found in 1999 and in use to the 6th century AD; rectangular, in tufa blocks and brick, between 6.2 m
and 10.3 m below street level, with an altar; the find fixed the site of the sacred grove Ovid names
in the *Fasti* and produced an exceptional quantity of evidence for magical practice. In the care of
the Soprintendenza Speciale; `Visite guidate su prenotazione`, so **status `open` with the prose
saying visits are by booking**. The material from the adjoining cistern is displayed at the Terme di
Diocleziano — **which is Castro Pretorio's and shipped; a sentence, never a place.**

**22. Palazzetto dello Sport (PalaTiziano).** **ESCALATED. Parioli / Flaminio.**

Genuinely unresolved, and the finder was right not to force it. it.wiki says «sorge a Roma nel
quartiere Parioli» and carries the Q. II category; the OSM point test returns Flaminio (Q. I) — but at
a coordinate the finder **estimated**, because the article gives none. An estimated point that lands in
the neighbouring quartiere is not evidence, and neither is a Wikipedia sentence against a polygon.
**Neither zone may take it on this record.** The arbitrator should either obtain a real coordinate or
give it to Flaminio, whose finder will be arguing the same case with the same two facts.

Held for whoever gets it: largo Apollodoro, near viale Tiziano; conceived and designed in 1956 by
Annibale Vitellozzi with structural engineering by Pier Luigi Nervi; built 1956–57 for the XVII
Olympiad; contractor Ingg. Nervi e Bartoli Spa; building surface 2,650 m², total 4,800 m²; refurbished
2022–23 at a cost of €3,200,000; long used by Pallacanestro Virtus Roma, on and off to 2018.

### DROP — 16 records

**5. AuditoriumArte / AuditoriumGarage / Sound Corner.** DROP as places. Three exhibition rooms and a
sound installation inside a building that is already a record are not three records. **One sentence
inside entry 1**: "The complex also holds the AuditoriumGarage exhibition space of 655 m², the
200 m² AuditoriumArte, and a permanent sound installation, the Sound Corner." The finder asked to be
rejected deliberately on this; he is.

**11. Monte Antenne.** DROP as a standalone place. A 60 m hill inside Villa Ada, crowned by Forte
Antenne, carrying the remains of Antemnae, with the Mosque at its foot — every one of those is already
a record, and a fourth record for the ground they stand on adds a name and no information. **Use as
context inside entries 6, 9, 10 and 27.** The Municipio Roma II attribution and the 60 m height travel
with it.

**19. Centro di preparazione olimpica "Giulio Onesti".** DROP. A CONI athletes' campus with a
sports-medicine centre and an anti-doping laboratory, 220,000 m², opened 1960. **No source states any
public access**, and a travel guide cannot send a reader to a federal training facility on the
strength of a list of resident clubs. The Acqua Acetosa name and the campus's existence are usable as
a locator in entry 27, which stands next to it.

**20. Circolo Canottieri Aniene.** DROP, as the finder recommended. A private members' club; not
visitable; no quartiere-level source beyond a Lungotevere address and a mention in the quartiere's own
list. The 1892 foundation is a trading-duration claim in the shape the ruling names, and the club's
own history is not an independent source for it.

**29. Teatro Piccolo.** DROP. **No address, categorised in two quartieri at once, and nothing on the
page indicating it still exists.** A guide cannot send anyone to a puppet theatre it cannot locate.
The Trilussa "Baracca delle Favole" line is charming and unusable.

**30. Teatro Euclide / Forum Studios (Forum Music Village).** DROP from Parioli. The finder declined
to claim it and was right: the basilica above them is categorised Q. III Pinciano, the Forum Studios
article says outright «in piazza Euclide, nel quartiere Pinciano», and the OSM test on the square
returns Pinciano. One line in Parioli's own quartiere article is the only thing on the other side.
**Referred to Pinciano with the finder's research intact** — the 1924–56 construction inside Brasini's
substructures, the Cinema Euclide, the 1990 theatre conversion, the October 2020 purchase, and the 1970
founding of Forum Studios by Bacalov, Morricone, Piccioni, Trovajoli, Nicolai, Marcotulli, Mastroianni
and De Melis. Pinciano must also refuse «gli studi di registrazione italiani più importanti».

**33. Corso di Francia.** DROP as a place. A road built between the 1930s and the 1960s is a locator,
not a sight, and the finder said so. Its viaduct crossing the Villaggio Olimpico is a good sentence
**inside entry 21**.

**34. Ponte Milvio.** DROP from Parioli. `scope-quartieri.md` gives it to **Q. I Flaminio**, and the
bridge is Parioli's own western boundary marker at piazzale Cardinal Consalvi — a boundary marker
belongs to the unit the scope document assigns it to, not to both. The `Roma Q. II Parioli` category is
the weakest kind of evidence here. **Not Parioli's. Flaminio's finder should have it, and the
arbitrator should say so in terms so it is not lost between two files.**

**36. Villa Balestra.** DROP from Parioli. Its own article says «pertiene tuttavia al quartiere
Pinciano, come la via Bartolomeo Ammannati da cui vi si accede» and it is categorised Q. III. A
place's own article, contradicting a list in a neighbour's article, wins. **Pinciano's**, with the
address via Bartolomeo Ammannati 3 and 15,000 m². The finder's OSM test returning nothing there is
correctly treated as no evidence at all.

**37. Caserma Scipio Slataper.** DROP. A working military headquarters — Comando militare della
Capitale — is not a visitor place at any date.

**38. Caserma Azolino Hazon.** DROP. Same objection; the Comando generale dell'Arma dei Carabinieri.

**39. Luiss Guido Carli, Villa de Heritz campus.** DROP. A private university campus, straddling
Parioli and Q. XVII Trieste with its main seat at viale Pola in Trieste. The QS ranking claims in the
same article are banned outright. The 1929 Milani villino is a real building and does not become a
visitable one.

**40. Istituto per l'Oriente Carlo Alfonso Nallino.** DROP. A research institute and specialist
library with no established public reading hours.

**41. Collina Fleming.** DROP, and the finder's reasoning is right: the article's own text puts it in
Municipio Roma XV, north of Parioli's boundary. **The `Roma Q. II Parioli` category is simply wrong**,
and this is the clearest demonstration in the file that a Wikipedia category is not a source. Nobody
in this wave takes it.

**42. Squares and streets.** DROP as places — piazza Ungheria, piazza delle Muse, piazza Grecia, viale
dei Parioli, viale XVII Olimpiade, via degli Olimpionici, Salita dei Parioli, viale Bruno Buozzi. One
unfootnoted source, and a street is a locator. **Usable in that role**, and "on viale dei Parioli" or
"on piazza Ungheria" publishes. Note also that "a wide rectangular opening on a ridge with a broad
view over the northern edge of the city" is orientation by impression and does not publish even as a
locator gloss.

**43. Railway stations of the Roma–Civita Castellana–Viterbo line.** DROP as places — Piazza Euclide,
Monte Antenne, Acqua Acetosa, Campi Sportivi. Transport nodes. **Usable in access lines**, and only
Campi Sportivi is categorised Q. II; Piazza Euclide station falls with the piazza Euclide question.

### The four the brief handed the finder that are not Parioli's — DROP, confirmed

Catacombe di Priscilla, Sant'Agnese fuori le Mura and the Mausoleo di Santa Costanza are **Q. XVII
Trieste's**; Villa Torlonia is **Q. V Nomentano's**. None is in scope this wave and no zone may take
them. **The finder wrote none of them up, which is the single best decision in this file** — the brief
told him to write four places that are not in his quartiere, he tested them against categories,
coordinates and an OSM point test, and he refused all four. Parioli's eastern boundary is via Salaria
from Ponte Salario to viale Liegi, and all four lie beyond it.

---

## 3. Counts

| Ruling | Records |
|---|---|
| **PUBLISH** | **12** |
| **REWRITE** | **12** |
| **ESCALATE (straddler)** | **3** |
| **DROP** | **16** |
| Total | 43 |

**Surviving places: 24 firm.** Up to **27** if the arbitrator sends all three straddlers to Parioli.

---

## 4. Tier ruling

**GUIDE. Twenty-four surviving records, against a guide threshold of four.**

The spine is not thin and did not need stretching:

Auditorium Parco della Musica · MUSA · Museo Aristaios · Villa Ada Savoia · Palazzina Reale · Bunker
di Villa Ada · Forte Antenne · Antemnae · Catacomba dei Giordani · Catacomba di Sant'Ilaria ·
Catacomba di Trasone · Villa Glori · Ipogeo di Villa Glori · Fontana dell'Acqua Acetosa · Villaggio
Olimpico · Stadio Flaminio · Chiesa di San Valentino · Chiesa di San Roberto Bellarmino · Chiesa di
San Luigi Gonzaga · Grande Moschea di Roma · Teatro Parioli–Costanzo · Villa Grazioli · Ponte
Flaminio · Ponte Salario.

Twelve of those carry a date, a named author and an institutional source I or the finder fetched
directly. Four carry hours: the Auditorium and the Museo Aristaios from the operator, San Luigi
Gonzaga from the parish, and the Museo Aristaios's free entry. Three carry a defensible affirmative
`closed` — the Palazzina Reale as a working embassy, Forte Antenne and the Ipogeo di Villa Glori on
`Visitabile = no`.

**The finder's own estimate was 26 to 30. That was two to six records optimistic**, because it counted
the Villa romana and the Palazzetto as Parioli's before the straddles were resolved, and counted Monte
Antenne and the Centro Giulio Onesti as places. Twenty-four is the honest number, and it is a guide
several times over.

**Where the guide is genuinely thin, and the finder said so first and correctly: Parioli has no food,
no bars, no hotels and no shops in this corpus.** There is no reachable register of Rome restaurants;
an operator's own site cannot establish how long it has traded; and a founding year from an operator
is banned outright. The residential quartiere that is locally famous for exactly those things
publishes here as parks, catacombs, churches, a concert hall and two Olympic stadiums. That is an
honest guide and an incomplete portrait, and the gap is a sourcing problem for a later wave, not a
failure of this one.

---

## 5. Escalations to the arbitrator, in one list

1. **Villa romana dell'Auditorium** — Parioli / Flaminio. Sovrintendenza Capitolina prints «Nel
   quartiere Flaminio» in its first four words; it.wiki lists it under Q. II. **Confirmed by
   re-fetch. Unresolved.**
2. **Fonte di Anna Perenna** — Parioli / Pinciano. it.wiki says «nel quartiere Parioli» and gives the
   location as **via Guidubaldo del Monte e piazza Euclide** — an address the finder reported did not
   exist. OSM puts piazza Euclide in Pinciano. **I lean Parioli; the finder leaned Pinciano. Unresolved.**
3. **Palazzetto dello Sport (PalaTiziano)** — Parioli / Flaminio. it.wiki text and category say
   Parioli; an **estimated** OSM point returns Flaminio. **Unresolved, and the coordinate needs
   finding before anyone rules.**
4. **Ponte Milvio** — ruled **out of Parioli**, to Flaminio per `scope-quartieri.md`. Flagged so it is
   not dropped by both files.
5. **Villa Balestra** and **Teatro Euclide / Forum Studios** — ruled **out of Parioli**, to Pinciano.
   Flagged for the same reason.
6. **Stadio Flaminio** — **ruled to Parioli**, not escalated. Two independent methods agree. Flaminio's
   finder will reach for it because of the name and must be told no.
7. **Ponte Flaminio** (with Tor di Quinto) and **Ponte Salario** (with Trieste and Val Melaina) —
   **ruled to Parioli by default**, both rivals out of scope, each record stating the bridge stands in
   more than one unit.

---

## 6. Rule compliance — what I struck, and what I let stand

**Struck as designation claims — 1.** Forte Antenne's «Il forte è vincolato ai sensi del Codice dei
beni culturali e del paesaggio con D.M. 6 agosto 2008», re-fetched and confirmed present in the
source. Nothing else in the quartiere makes a protection claim.

**Struck as superlatives — 9.** The finder caught seven; I added two he carried without noticing.

| Phrase | Where | Caught by |
|---|---|---|
| «Il più grande luogo di spettacolo d'Europa» | auditorium.com | finder |
| «la più grande moschea d'Europa» | it.wiki Moschea di Roma | finder |
| «il quarto più grande parco pubblico di Roma» | it.wiki Villa Ada | finder |
| «una delle più profonde catacombe di Roma» | it.wiki Catacomba di Trasone | finder |
| «gli studi di registrazione italiani più importanti» | it.wiki Forum Music Village | finder |
| «tra le 25 migliori università al mondo» | it.wiki Luiss | finder |
| «la più antica fra tutte le consolari romane» | it.wiki Villa Ada, of the via Salaria | finder |
| **"its oldest building is a fortified casale"** | finder's own entry 15 | **verifier** |
| **"the one Roman bridge over the Aniene named by ancient writers"** | finder's own entry 32 | **verifier** |
| **"the principal Catholic centre for Parioli's residents"** | finder's entry 25, from it.wiki | **verifier** |

That is three the finder wrote himself while refusing seven from his sources. The ban is on the
claim, not on the quotation marks.

**Research method — kept off every page.** The Nominatim 429s, the SSL failure at teatroparioli.it,
the dead 060608 link behind Villa Ada's hours, the JavaScript-only MUSA page, the OSM coverage holes,
and my own re-fetches all stay in this file and the finder's. Where a fact is missing the page says
the plain thing and stops. **The finder understood this and his §4 is correct; I found no
method language leaking into any proposed record text.**

**Municipio.** Parioli **may** state Municipio Roma II. Four sources state it for this quartiere: the
Sovrintendenza's Villa Ada page («Municipio II, quartiere Parioli») and its Villa Glori page
(«Municipio Roma II, quartiere Parioli»), both re-fetched and confirmed verbatim; the Forte Antenne
article («nel territorio del Municipio Roma II»), re-fetched; and San Roberto Bellarmino citing the
Diocese of Rome. This is not the Castro Pretorio situation and the finder's reasoning is sound.

**CAP.** No quartiere-wide postcode on any page. Per-record postcodes only where a source prints one:
00196 for the Auditorium, 00197 for San Luigi Gonzaga.

**Zone urbanistiche.** The Villa Ada zona is **2Y**, per the zona article's own title. The Parioli
article's internal 2X/2Y contradiction stays in the research file. **Do not print the code at all
unless a record needs it** — a toponymic code is publishable but a contested one is not worth the
sentence.

**UNESCO.** Nothing in Q. II mentions the 1980 inscription. Parioli is outside the Aurelian Walls and
no page may claim to lie inside the Historic Centre property.

**Vatican / Lateran Treaty.** None. No Art. 15 or Art. 16 property falls in Parioli.

**Photographs.** `"photos": []` on all 24 records, per the wave ruling. For the photo wave, the
finder's list of hard rejects is the most useful thing in his file and I endorse it: the Auditorium
and everything Piano designed inside it, the Grande Moschea, San Valentino, the Palazzetto and the
Stadio Flaminio, the Villaggio Olimpico housing, the contemporary sculpture in Villa Glori, Argüello's
fresco, Ponte Flaminio and San Roberto Bellarmino. His short list of probable clears — Villa Ada's
park and 18th–19th-century buildings, the Palazzina Reale, Forte Antenne, the Fontana dell'Acqua
Acetosa, Villa Glori's casale and 1895 column — is the right place for that wave to start. All of it
is his arithmetic and none of it is corpus text.
