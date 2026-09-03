# Wave 3 — ARBITRATION

Units: **Prati (R. XXII) · Ludovisi (R. XVI) · Sallustiano (R. XVII) · Castro Pretorio (R. XVIII)**.
Ruled 2026-09-02. I read all eight wave-3 files, plus `wave1-arbitration.md` and — because I am the
only agent who can — the Borgo, Monti, Trevi and Colonna verdict files, to see collisions the
verifiers could not.

**Authors follow THIS file, not the verdict files.** Every place where I am stricter than a verifier
is marked **OVERRIDE** and collected at §9. In the Queens wave 6 review every Critical was an author
who followed the looser document. Do not be that author.

---

## 0. WHAT I COULD AND COULD NOT SEE

- **`wave1-arbitration.md` exists and I read it in full.** It rules on Campitelli, Monti, Trastevere
  and Borgo. **It does not rule on a single Prati↔Borgo seam.** I searched it for Prati, piazza del
  Risorgimento, piazza Adriana, lungotevere Castello, Porta Angelica, Ottaviano, the Casa Madre dei
  Mutilati, piazza Capponi, via Stefano Porcari and every Tiber bridge. Line 36 is the only mention
  of Prati and it says only that Prati "owns what is theirs". Prati's verifier reported the same and
  is confirmed. **Those seams were open and I have ruled them below.**
- **`wave2-arbitration.md` does not exist.** I could not see wave 2's rulings on Pigna, Parione,
  Colonna or Trevi. I therefore applied the reservation strictly and, where a wave-3 object touches
  Colonna or Trevi, I read `colonna-verdicts.md` and `trevi-verdicts.md` directly to check for a
  live collision. **Wave 2's arbitrator, when it runs, wins over me on anything involving Colonna,
  Trevi, Pigna or Parione.** The three places where that could bite are named at §3.4.
- I also read `borgo-verdicts.md` and `monti-verdicts.md` for the same reason. Findings are used
  below and flagged as such.

---

## 1. OWNERSHIP — EVERY PLACE CLAIMED, OR CLAIMABLE, BY TWO FILES

Hosting is not containment. A building's address, its host square, its tenant and its category are
four different things and none of them is a rione.

### 1.1 Ludovisi ↔ Sallustiano — the collisions the brief told me to look at hardest

These two were carved from one estate, share one boundary street, and share a family name. Six
objects were at risk. **None ends in two files.**

| # | Object | Claimed by | **RULING** | Evidence that decided it |
|---|---|---|---|---|
| 1 | **Museo Boncompagni Ludovisi** (Villino Boncompagni Ludovisi, via Boncompagni 18) | Sallustiano (claims) / Ludovisi (concedes) | **SALLUSTIANO** | Three independent lines: Sallustiano's PIP on ring `r5454324`; Ludovisi's own verifier reproduced Nominatim `quarter = Sallustiano` at via Boncompagni 18 and found `[[Categoria:Roma R. XVII Sallustiano]]` on the article. A museum carrying Ludovisi's family name, on the boundary street, in the next rione. Both files caught it. Ratified. |
| 2 | **Palazzo Fiat**, via Calabria | Sallustiano (escalated) | **SALLUSTIANO** | PIP inside Sallustiano's ring; Nominatim returns `Ludovisi` because via Calabria *is* the declared border and the geocoder snaps to the street. **Ludovisi's file never claimed it** — no collision exists. It ships inside Sallustiano's grouped villini/palazzine passage, not as its own record. |
| 3 | **Villino Levi**, via Boncompagni 28 | Sallustiano (escalated) | **SALLUSTIANO** | Same shape, weaker: PIP inside, article coordinate reverse-geocodes to Ludovisi. Ludovisi never claimed it. Stays in the grouped passage. |
| 4 | **United States Embassy to the Holy See**, via Sallustiana 49 | Sallustiano (escalated) | **NEITHER — not a place in this corpus.** | PIP puts it in Sallustiano; Nominatim resolves the point into the **Palazzo Margherita compound**, which is Ludovisi's — that is the geocoder conflating two different American missions, not evidence. It is not a visitor place under either owner, both verifiers said not to seed it, and I am converting that into a ruling. **Neither file emits it.** If it is mentioned in prose, ruling 2 applies: Italian soil, Vienna Convention inviolability, not foreign territory. |
| 5 | **Villa Ludovisi** (the destroyed estate) | Ludovisi (intro spine) / Sallustiano (villini passage narrates the same subdivision) | **NOT A PLACE ANYWHERE. Narrative split:** Ludovisi carries the estate's spine — Ludovico Ludovisi, 1622, Domenichino, the 1883 decision and 1886 convention, the destruction. Sallustiano carries only the consequence on its own ground: "the plots north of via Boncompagni were subdivided out of the Villa Ludovisi estate from 1883". | Both are true, neither is a place record, and a shared cause is not a duplicate. |
| 6 | **Trono Ludovisi** | Ludovisi (find-story) / Sallustiano (Horti provenance list) | **Find-story → LUDOVISI** (found 1887 in the destruction of the villa; it is the villa's story). Sallustiano may name it once in the Horti provenance list and no more. | A movable object in a museum in neither rione. Neither file may write the museum holding it as a place. |

**The via Boncompagni parity rule is upheld and is now binding on both authors:** via Boncompagni,
via Calabria, via Lucullo and via Friuli are the Ludovisi↔Sallustiano line. Both rione articles state
it reciprocally. Neither file emits any of those four streets as a place.

### 1.2 Sallustiano ↔ Castro Pretorio

| Object | Claimed by | **RULING** | Why |
|---|---|---|---|
| **Museo Storico dei Bersaglieri** (inside Porta Pia) | Castro Pretorio (4.13, kept) / Sallustiano (recorded, not claimed) | **CASTRO PRETORIO** | Castro Pretorio's finder got PIP = Castro Pretorio **and** Nominatim `quarter = Castro Pretorio, road = Via Venti Settembre` — its own note calls it "cleanest of the three". Sallustiano's PIP puts it outside its ring and its border text excludes Porta Pia. **OVERRIDE of Sallustiano's verifier §3.5**, which wrote that the double it.wikipedia category "will simply fall out of the corpus" because "no wave is writing Castro Pretorio". Castro Pretorio **is** in this wave. It does not fall out; it lands here. |
| **Porta Pia** | Castro Pretorio (4.6) / Sallustiano (ruled outside) | **CASTRO PRETORIO** | Both files agree on the geometry. Turismo Roma and the Sovrintendenza both carry it. Sallustiano's border text excludes Porta Pia in terms. |
| **Breccia di Porta Pia memorial** | Sallustiano (escalated, recommended against) | **NOT A PLACE ANYWHERE.** | Three sources, three answers: Sallustiano's PIP says inside, Nominatim says `suburb = Salario`, the border text hands the wall beyond piazza Fiume to Salario. **The Breccia narrative goes to Castro Pretorio inside the Porta Pia entry**, where Turismo Roma actually documents it ("a qualche decina di metri" from the gate, the 1920 marble monument, the column). Sallustiano keeps exactly one sentence — Roma Capitale's, that the *bersaglieri* found themselves inside Villa Paolina once through the breach — and claims nothing about which rione the breach was in. |
| **Fontana del Mosè** | Castro Pretorio (4.28) | **CASTRO PRETORIO** | Sovrintendenza `Rione: Castro Pretorio`. Sallustiano's PIP puts it outside its own ring and it never claimed it. Trevi's file does not claim it either. Clean. |
| **Chiesa di San Bernardo alle Terme** | Castro Pretorio (4.19) | **CASTRO PRETORIO** | Turismo Roma Location "PIAZZA S. BERNARDO, 105"; independently corroborated by Turismo Roma's Terme di Diocleziano page, which says a circular hall on the Baths' west side "è stata trasformata nella chiesa di San Bernardo alle Terme". Uncontested. |
| **Santa Maria della Vittoria** | Sallustiano (2.1) | **SALLUSTIANO** — see §2. Castro Pretorio's verifier concedes it in terms. |
| **Piazza San Bernardo** and **Largo di Santa Susanna** | — | **NOT PLACES ANYWHERE.** Four churches on two adjoining squares in three rioni. Own the buildings, never the squares. |
| **Via XX Settembre** | filed under Sallustiano, Ludovisi and Castro Pretorio categories | **NOT A PLACE ANYWHERE.** Sallustiano's verifier recommended it; I am ruling it. It is an address and a context sentence in each of the three files and an owned place in none. Three waves would otherwise seed one street. |

### 1.3 Prati ↔ Borgo (wave 1) — open seams, ruled here

Wave 1 did not rule these. Borgo's verifier escalated exactly two of them (its records 47 and 62) and
took neither, so **no Borgo seed record collides with anything I award below.** I checked.

| Object | **RULING** | Why |
|---|---|---|
| **Piazza del Risorgimento** | **NOT A PLACE.** Roma Capitale's own 1954 act reads `R. PRATI E R. BORGO`. A toponym the naming authority records as lying in two rioni is not owned by either. Prati never proposed it as a candidate; it is an address. | |
| **Museo Storico dell'Arma dei Carabinieri**, piazza del Risorgimento | **PRATI** | SISTO's 1885 attribution for the piazza is `R. PRATI`; OSM PIP and Nominatim both put the **building** in Prati, and Nominatim's own record reads "Piazza del Risorgimento, **Prati**". Borgo neither claimed nor escalated it. This is the highest-value object in the Prati file and it survives — with the hours the verifier recovered. |
| **Piazza Adriana** | **NOT A PLACE.** SISTO attributes it to `R.BORGO` twice (1885; `Del.GV n.101`, 1942) and then to both in 1954; OSM PIP says Borgo, Nominatim says Prati, and Nominatim returns three separate Piazza Adriana ways in two rioni. Nobody owns it. | |
| **Casa Madre dei Mutilati ed Invalidi di Guerra** | **PRATI**, published at **Largo dei Mutilati ed Invalidi di Guerra** | This is the ruling that saves the building without touching Borgo. The largo is a *distinct toponym*, created out of lungotevere Castello by `Del.CS n.2444` of 26 Oct 1989, it PIP-tests **Prati**, Nominatim returns `quarter = Prati`, and **Borgo's file does not contain the Casa Madre at all** — I checked its verdicts for "Mutilati" and there is nothing. Prati publishes the building on the largo. **Prati does NOT write "piazza Adriana" as its address** and does not claim the piazza. |
| **Lungotevere Castello** | **NOT A PLACE ANYWHERE. OVERRIDE — this is the one that would have failed the gate.** SISTO says `R.BORGO - R.PRATI`; it.wikipedia's lead says "nei rioni Borgo e Prati"; both waves independently escalated the same street. Borgo's record 47 is unruled by wave 1 and is still live. **Neither Prati nor Borgo seeds this street.** Prati publishes the three lungotevere that are wholly its own — Prati, dei Mellini, Michelangelo — and no fourth. |
| **Porta Angelica** (demolished 1888) | **OUT OF THE WAVE. OVERRIDE of Prati's finder and verifier**, who escalated it with two waves' PIP agreement pointing to Prati. I am refusing it. The only pro-Prati evidence is point-in-polygon on a *reconstructed coordinate for a building that has not existed since 1888*; it.wikipedia files it under `Categoria:Roma R. XIV Borgo`; via di Porta Angelica is Borgo's on both methods and on SISTO; and it was a gate in the **Leonine wall**, which wave 1 has already ruled to Borgo (§5.3 of that file). Geometry on a vanished object does not beat all of that. **Prati may write the two salvaged angels set into the wall at the corner of viale dei Bastioni di Michelangelo and piazza del Risorgimento as a street detail, with no claim on the gate.** The argument for Prati is recorded here for the coordinator; it is not taken. |
| **Santa Maria delle Grazie a Porta Angelica** | **OUT.** Prati's finder states it did not research it. Uphold the verifier's DROP. |
| **Ottaviano (metro A)** and **Lepanto (metro A)** | **PRATI** | Two waves independently PIP-tested Ottaviano to Prati against it.wikipedia's Borgo article claiming it as Borgo's transport. Borgo did not seed it. Record the two-wave agreement in the seed file. |
| **LUMSA** | **OUT.** Main seat via di Porta Castello, Borgo. A university whose principal seat is in another rione is not a Prati place. Uphold the verifier's recommendation as a ruling. |
| **Via Stefano Porcari, piazza Amerigo Capponi** | **NOT PLACES.** SISTO: both rioni. Addresses only. |

### 1.4 The five Tiber bridges — ruled on wave 1's own method

Wave 1 decided bridges on the **centroid**, and sent the bridge out of the wave when the centroid
landed in a unit nobody was writing (Ponte Cestio, Palatino, Sublicio, Garibaldi, PASA). I am
applying the identical rule so the corpus is consistent end to end.

| Bridge | Centroid | **RULING** |
|---|---|---|
| **Ponte Regina Margherita** | Prati | **PRATI** |
| **Ponte Pietro Nenni** | Prati | **PRATI** — and it carries the only surface stretch of metro line A, which is real content |
| **Ponte Giacomo Matteotti** | Prati | **PRATI** |
| **Ponte Umberto I** | Ponte | **OUT** — R. V Ponte is in no wave |
| **Ponte Cavour** | Campo Marzio | **OUT** — R. IV Campo Marzio is in no wave |

Prati writes each of the three with the second unit stated ("Roma Capitale records the bridge as
lying in two rioni"), never as exclusively its own crossing.

### 1.5 Castro Pretorio's boundary escalations

| Object | **RULING** | Why |
|---|---|---|
| **Palazzo Massimo alle Terme** | **CASTRO PRETORIO** — see §2 | |
| **Largo di Villa Peretti** | **NOT A PLACE ANYWHERE** — southern end Castro Pretorio, northern end Esquilino, and Esquilino is in no wave. It survives only as Turismo Roma's published *address* for Palazzo Massimo. An address on a straddling largo does not move a building whose own footprint tests three times in one rione. |
| **Teatro Nazionale** | **CASTRO PRETORIO** | Three determinations for Castro Pretorio on the OSM node. Its address sits on the via Agostino Depretis line with Monti — but **Monti's file does not contain it** (I checked `monti-verdicts.md`) and wave 1 did not rule it. No collision. It publishes on the first-party `operaroma.it/il-teatro/teatro-nazionale/` history the verifier recovered. |
| **Palazzo Giolitti** | **OUT OF THE WAVE** | Uphold the verifier's DROP as a ruling. Its it.wikipedia coordinate 41.899055, 12.497613 is south of the Depretis line and *south of* the point on which the finder itself ruled Palazzo del Viminale out to Monti. No recorded point-in-polygon test at the confirmed coordinate. It is not taken and it is not escalated further; a later Monti or Esquilino pass may propose it. |
| **British Embassy**, via XX Settembre 80/a | **NOT A PLACE.** On the boundary street with Trevi and Sallustiano, one determination only, and by GOV.UK's own statement accessible by appointment only. It is a line of context in Castro Pretorio's prose, with the ruling-2 sentence, and not a record. |
| **Porta Nomentana** | **CASTRO PRETORIO** | Named explicitly, "(murata)", in it.wikipedia's own *Porte* list for the rione. |
| **Porta Praetoriana** | **OUT.** Absent from that same list; Nominatim offers `suburb = Nomentano`. Polygon evidence alone. |
| **Camminamento delle Mura Aureliane, viale Pretoriano** | **OUT.** Access from via dei Frentani and via dei Ramni, San Lorenzo, on the outer face. |
| **Monumento al Bersagliere** | **OUT as a record** — outside every rione polygon. May be named as standing in the piazzale outside Porta Pia, which is what Turismo Roma says. |
| **Monumento ai Caduti di Dògali** | **CASTRO PRETORIO** | The garden holding it tests Castro Pretorio. **Piazza dei Cinquecento, which the monument names, is Esquilino's** — tell the story, never claim the square. The Lion of Judah passage the verifier restored is the best material in the file and must ship. |
| **Le Quattro Fontane junction** | **OUT as a unit** — and note that **Trevi's verifier reached the same answer independently** (its R12: three corners Monti, the Diana corner Trevi, Roma Capitale states no rione). **Palazzo Mattei Albani Del Drago and the Arno figure on its corner are Castro Pretorio's.** Own the palace, not the crossroads. |

---

## 2. THE MARQUEE RULE

Each of these appears in **exactly one seed file across the whole corpus, now and forever.**

| Marquee place | **OWNER** | Why it, and not the other candidate |
|---|---|---|
| **Santa Maria della Vittoria**, with Bernini's *Ecstasy of Saint Teresa* | **SALLUSTIANO** | Roma Capitale publishes the address Via XX Settembre 17 and the point `POINT (12.4943365 41.9045242)`; Sallustiano's verifier re-ran point-in-polygon on its own assembled ring and put **both the building and Roma Capitale's own point inside it**. Castro Pretorio's verifier concedes it in terms at 4.19. Trevi does not claim it. **Uncontested on the evidence and unanimous across three files.** Sallustiano's anchor. |
| **Santa Maria degli Angeli e dei Martiri** | **CASTRO PRETORIO** | Turismo Roma's full page re-fetched and confirmed line by line; the basilica *is* the Baths' frigidarium and cannot be separated from them; the parish's own site supplies the hours. No other wave-3 file mentions it as a candidate. |
| **Terme di Diocleziano** and the **Museo Nazionale Romano** | **CASTRO PRETORIO** | Turismo Roma gives the address Viale Enrico De Nicola 78 and the whole complex. Castro Pretorio carries **three** MNR sites — the Baths, Palazzo Massimo and the Aula Ottagona / Museo dell'Arte Salvata. **The MNR's other sites, Palazzo Altemps and the Crypta Balbi, are in rioni no wave is writing and may not be written by anyone here**, not even as "the museum's other sites are…". |
| **Palazzo Massimo alle Terme** | **CASTRO PRETORIO** | The decisive fact, and it is the finder's, not the verifier's: it re-tested **OSM relation 2705998 at its centre and two corners and got Castro Pretorio on all three**, after recording and correcting its own first-pass error. The published address (Largo di Villa Peretti 1) sits on a straddling largo; the building does not. Publish Turismo Roma's address, own the building. |
| **The Capuchin Crypt at Santa Maria della Concezione** (and the Museo e Cripta dei Cappuccini) | **LUDOVISI** | Roma Capitale's page confirmed in full; `[[Categoria:Chiese di Roma (rione Ludovisi)]]`; the museum's own live site supplies address, telephone and hours, re-fetched to the character by the verifier. Two records — church and museum — one rione, no competitor. |
| **Palazzo di Giustizia** | **PRATI** | The Corte di cassazione's own history page, plus SISTO `PIAZZA DEI TRIBUNALI` id 10744 with the 1885 attribution `R. PRATI`, plus OSM PIP and Nominatim `quarter = Prati`. Nobody else is near it. **The Court's own page situates the palace by reference to Castel Sant'Angelo and piazza Navona — both reserved. That sentence does not travel.** |
| **Piazza della Repubblica** and the **Fontana delle Naiadi** | **CASTRO PRETORIO** | The strongest single attribution in the wave: the Sovrintendenza Capitolina's own record for the fountain has a `Rione:` field and **it literally reads "Castro Pretorio"**. The verifier re-fetched it and confirmed. The piazza publishes with it on Turismo Roma. |
| **Castra Praetoria** | **CASTRO PRETORIO** | It is the rione's name. Published as the verifier rewrote it — the 21–23 AD dating attributed to the `Castra Praetoria` article, not read out of the rione article's sentence about Tiberius constituting the *guard*, and **without Sejanus and without the Constantine dismantling**, whose only corroboration was a site the verifier could not reach. |

---

## 3. RULED OUT OF THE WAVE

"Not this wave" is a correct outcome. Queens shipped three parks that belonged to no neighborhood.

### 3.1 Esquilino (no wave)
Termini station · Piazza dei Cinquecento · Piazza dell'Esquilino · Piazzale Sisto V · **Largo di
Villa Peretti** · the Cappella del Santissimo Crocifisso alla Stazione Termini · the Servian Wall's
monumental Porta Viminalis fragment beside the station (the Sovrintendenza names it and it is **not
ours** — Castro Pretorio publishes only the via Gaeta / via Volturno stretch, and says so).

### 3.2 Pinciano, Salario, Nomentano, Tiburtino, San Lorenzo (no wave)
Porta Pinciana (both published coordinates reverse-geocode to Pinciano; Roma Capitale is internally
inconsistent, publishing a Ludovisi street address against a Pinciano point) · Piazza Fiume, excluded
in terms by **both** the Ludovisi and Sallustiano border texts · Porta Salaria and the tomb of
Sulpicius Maximus · the Breccia memorial · Porta Praetoriana · the viale Pretoriano camminamento.

### 3.3 Della Vittoria, Trionfale, Ponte, Campo Marzio, Flaminio (no wave)
Liceo Terenzio Mamiani · Palazzo INAIL, piazza delle Cinque Giornate · piazza Mazzini and viale
Mazzini with the RAI headquarters · Mercato Trionfale · viale delle Milizie · Ponte Umberto I ·
Ponte Cavour.

### 3.4 Trevi and Colonna — wave 2's, and wave 2 outranks me here
- **Fontana delle Api. OUT.** Roma Capitale's own Location field is `Fontana delle Api, Piazza
  Barberini`; its published coordinate reverse-geocodes to **Colonna** and OSM's to Ludovisi; piazza
  Barberini itself is a Colonna/Ludovisi/Trevi three-way that Trevi's own file escalated (its E4) and
  did not take. **Ludovisi does not emit it.** The verified content — the 1644 Urban VIII
  commission, Pasquino's line, the erased digit, and above all the 1865 dismantling and the Apolloni
  travertine copy of 1915, without which "Bernini's fountain" misleads — travels with the ruling to
  whoever gets it.
- **Sant'Isidoro a Capo le Case → LUDOVISI, with a flag.** Modern evidence is Ludovisi: Nominatim
  reproduced twice, `[[Categoria:Chiese di Roma (rione Ludovisi)]]`. Against it, **Armellini's 1891
  gazetteer files the church under rione Colonna** (the URL anchor is `.../Colonna.html#S.Isidoro`).
  I checked `colonna-verdicts.md`: **Colonna does not claim it.** No live collision, so Ludovisi
  keeps it. If wave 2's arbitrator later awards it to Colonna, that ruling wins and Ludovisi drops it.
- **Santa Susanna alle Terme di Diocleziano. OUT — belongs to no wave, and OVERRIDE.** Castro
  Pretorio's verifier instructs the author to write "Santa Susanna is in Trevi". **Do not write
  that.** Trevi's own verifier calls Santa Susanna "the finder's one confirmed misassignment", found
  that an independent Nominatim lookup returns **Castro Pretorio**, and refused the church (its E12,
  three-way Trevi / Castro Pretorio / Sallustiano). No file may state Santa Susanna's rione. Castro
  Pretorio's guidebook-trap sentence becomes: *"Santa Susanna, on the same square, is not this
  rione's; Santa Maria della Vittoria opposite is in Sallustiano."* Nothing more.
- **Largo di Santa Susanna. NOT A PLACE.** it.wikipedia says "in parte nel rione Sallustiano e in
  parte in quello Trevi" and files it in both categories; Trevi's file lists it among its piazze
  without ruling it. **Palazzo Canevari, however, is SALLUSTIANO'S** — the *building* PIP-tests
  inside Sallustiano's ring and Nominatim returns `quarter: Sallustiano, Largo di Santa Susanna 13,
  Palazzo Canevari`; only Turismo Roma's point, a block off, says Trevi, and the same portal's point
  for Santa Maria della Vittoria is off in the same way. **Trevi's file does not claim Palazzo
  Canevari.** Sallustiano takes it. Coordinator: if wave 2 seeds it, wave 2 wins and Sallustiano's
  count drops from nine to eight, which does not move the tier.

### 3.5 Monti (wave 1)
Palazzo del Viminale · Palazzo Giolitti · the Quattro Fontane junction · Via Nazionale itself, which
**Monti publishes as a place (its record 129)** — Castro Pretorio uses "Via Nazionale 16a" only as
St Paul's Within the Walls' address and must not describe the street as its own.

### 3.6 In no unit at all
The Aurelian Walls as a linear monument. Ludovisi dropped the stretch, Sallustiano escalated it,
Castro Pretorio ruled the wall line "is the rione boundary here; a boundary is not a place inside the
thing it bounds". **All three are right and I am making it a wave ruling: no wave-3 file emits a
stretch of the Aurelian Walls as a place.** Each may use the wall as prose context, and each may own
a *gate* on the evidence above. A single monument crossing four rioni and two quartieri in one
quadrant needs one programme-level ruling, which is the coordinator's, not mine.

---

## 4. TERMINI STATION — RULED EXPLICITLY, AND BINDING ON A LATER ESQUILINO WAVE

**Castro Pretorio may NOT carry Termini station, and may not carry Piazza dei Cinquecento. Both are
Esquilino's.** A later Esquilino wave should read this as its licence to take them.

The reasoning, in the order it decided me:

1. **Ten tested points.** Castro Pretorio's finder tested the station building, the forecourt, the
   Mazzoniana and the metro entrances. Every one returned Esquilino. That is not a marginal call.
2. **The article about the square says so.** `Piazza dei Cinquecento` reads "al confine tra i rioni
   Esquilino e Castro Pretorio" and tags `quartiere = Esquilino / Castro Pretorio` — a stated
   straddle, not a Castro Pretorio possession.
3. **The rione's own boundary prose runs the line *along* piazza dei Cinquecento.** A rione whose
   description uses a square as its edge does not thereby own the square.
4. **The counter-evidence self-destructs, and this is the part a later wave must not re-litigate.**
   it.wikipedia's rione article does list Piazza dei Cinquecento and Largo di Villa Peretti among
   Castro Pretorio's piazzas — but the same list contains **Piazza dell'Esquilino and Piazzale Sisto
   V**, which the finder's own controls put outside the rione, and the companion street list contains
   Via Cavour, Via Gioberti, Via Farini, Via Principe Amedeo and Via Urbana. **That list is
   demonstrably not an inventory of what is inside the rione**; it is a list of what is nearby or on
   the edge. It cannot carry a claim on the largest transport interchange in Italy.
5. **The honest gain from the loss.** Castro Pretorio is the rione you come out of Termini's **Via
   Marsala** side into, and that is a sourced, publishable, and more interesting sentence than an
   annexation. The Via Marsala side, the Sacro Cuore basilica on it, and the Castra Praetoria behind
   it are the rione's, and the intro must say plainly that the station is in Esquilino.

I am ruling **with** Castro Pretorio's verifier here, which closed this against its own finder's
stated doubt. That was the right call and I am ratifying it rather than reopening it.

**Consequence for Palazzo Massimo:** the museum is at Largo di Villa Peretti 1, an address on a
largo whose northern end is Esquilino. It stays **Castro Pretorio's** anyway, on three tested points
of its own footprint. An Esquilino wave may not take Palazzo Massimo on the strength of the address.

---

## 5. THE MUNICIPIO QUESTION — HELD

The roster records two sources disagreeing over whether part of Castro Pretorio falls in Municipio
II. **I checked all four wave-3 files. No file states a municipio for Castro Pretorio. Nothing to
kill.**

Confirmed further:
- it.wikipedia's rione infobox reads `circoscrizione = [[Municipio Roma I]], [[Municipio Roma II]]`.
  The disagreement is real, it is *inside a single source*, and Nominatim reproduces the split on the
  ground. The gag stands through this wave and into any later one.
- **The seat of Municipio Roma II is physically inside the rione at Via Goito 35.** No page may say
  that building "is in Municipio II", and no page may say the rione is in Municipio I. Both are
  designation-shaped statements about an administrative fact we cannot source cleanly.
- The gag is Castro Pretorio's alone. **Prati (Municipio I) and Sallustiano (Municipio I) may state
  theirs** — Prati has SISTO's own instrument on every toponym (`Del.AC n.11`, 11 Mar 2013,
  `ACCORPAMENTO MUNICIPI`, plus `Del.G.Cap. n.392`, 8 Nov 2013), and Sallustiano has it from the
  roster. Cite the roster or the act, never a Wikipedia infobox.

---

## 6. THE RESERVATION — NOTHING TAKEN

I read all four files against the full reserved list. **No reserved place is taken as a place in any
wave-3 file.** Four contacts, all permissible or already handled:

1. **Villa Farnesina**, named in Castro Pretorio 4.11 as the **provenance** of four reconstructed
   fresco rooms held at Palazzo Massimo. **Permissible, and I am ratifying the verifier's ruling and
   generalising it:** naming a reserved place as the source of an object displayed here does not
   create a place entry and cannot collide in a seed file. The Villa Farnesina building stays wave
   1's.
2. **The Capitoline Museums**, named in Prati 2 as the Corte di cassazione's reported holder of the
   Crepereia Tryphaena material, and in Sallustiano 2i as provenance for the *Dying Gaul*. Same rule,
   same permission. **Prati must attribute and not resolve** — the Cassazione says Musei Capitolini,
   Rome Art Lover says Centrale Montemartini, and the page says so and stops.
3. **The Pantheon**, in Turismo Roma's "San Bernardo sembra un Pantheon in miniatura". **Cut**, as
   the verifier ruled. Describe the oculus and the coffered dome directly.
4. **Castel Sant'Angelo and Piazza Navona**, in the Corte di cassazione's sentence siting the
   Palazzo di Giustizia. **Do not import that sentence.** Prati's own coat of arms *is* Castel
   Sant'Angelo (*d'azzurro al mausoleo d'Adriano d'argento*): **the blazon may be described, the
   castle may not be claimed.**

**Arguments that a reserved place really belongs here — recorded, not taken:** none was made. Prati's
files come closest, noting that its arms depict a Borgo building and that its border footnote runs
along Vatican-facing streets. Neither is a claim and neither is taken.

**Ruling 2 (Vatican City) is clean in all four files.** No Vatican City property appears as a place.
The three embassy traps the wave was warned about were all handled, and their mandatory wordings are
carried forward unchanged: **Palazzo Margherita** (United States, Ludovisi — never "American soil",
never "extraterritorial"; Lateran Treaty Art. 15 has nothing to do with it), **Villa Paolina
Bonaparte** (France to the Holy See, Sallustiano — the verifier's verbatim paragraph is mandatory),
**Villino Rudinì** (Japan, Sallustiano), **Villino Vivante** (Czech Republic, Prati — the building
*houses* the embassy), and the **British and Russian** missions in Castro Pretorio. Prati's Palazzo
del Sant'Uffizio note is correct and stays in the working file: it is Borgo's, it is Italian soil
with diplomatic-headquarters immunities under Art. 15, and it is never "in the Vatican".

**Ruling 3 is clean.** `"photos": []` on every record in all four files. Photo leads are prose with
no URLs. Prati's copyright note — Italy has no freedom of panorama and Piacentini (d. 1960), Selva
(d. 1970), Moretti (d. 1973) and Ximenes (d. 1926) may still be in copyright — should go to the
photo wave.

---

## 7. TIER RULINGS

| Rione | Verifier's call | Surviving places after **my** rulings | **MY RULING** |
|---|---|---|---|
| **Prati** | GUIDE (~34) | ~32. Loses lungotevere Castello, Porta Angelica, Santa Maria delle Grazie, LUMSA, piazza Adriana and piazza del Risorgimento as places, and two of five bridges. **Keeps the Carabinieri museum, the Casa Madre and three bridges.** | **GUIDE** |
| **Ludovisi** | GUIDE (10) | **10, unchanged.** Nothing I ruled removes any of the ten. Sant'Isidoro survives §3.4; the four escalations were already excluded from the count. | **GUIDE** |
| **Sallustiano** | GUIDE (8, +Canevari pending) | **9** — the eight plus Palazzo Canevari, which I have granted. | **GUIDE** |
| **Castro Pretorio** | GUIDE (41) | ~40. Gains the Museo dei Bersaglieri outright and Teatro Nazionale; loses Palazzo Giolitti, the British Embassy as a record, and Termini, which it had already refused. | **GUIDE** |

**Four guides, no town-pages, so the town-page link floor is not engaged.** I am still answering the
question, because Sallustiano's verifier explicitly flagged the condition on which its ruling flips:
if the coordinator applies a standard requiring sourced opening hours per place, Sallustiano drops to
three and becomes a town-page.

**If that flip happens, Sallustiano clears the two-outbound-link floor comfortably**, and here are
the links, so it is solved here and not left to the author: `turismoroma.it/it/luoghi/chiesa-di-santa-maria-della-vittoria`,
`carmelitanicentroitalia.it/dove-siamo/conventi-della-provincia/s-maria-della-vittoria-roma`,
`hortisallustiani.it`, `masaf.gov.it`, and `turismoroma.it/it/luoghi/villa-paolina-bonaparte` — five
live, re-fetched, institutional or municipal URLs. **No wave-3 unit is at risk of the link floor.**

On the two tier calls that were argued: Ludovisi's verifier looked hard for the town-page answer and
did not find it — ten places with the rione established by two independent methods each is a guide,
and I agree. Sallustiano's verifier ruled against the brief's stated expectation and showed its
arithmetic on two definitions (five strict, eight loose), both clearing four. That is the right way
to disagree with an expectation and I am upholding it.

---

## 8. DESIGNATION CLAIMS — RULING 1 SWEEP

**I ran the banned vocabulary over all eight files, English and Italian.** *vincolato*, *vincolo
monumentale*, "designated a national monument", "listed", "scheduled", "declared a monument", "under
state protection", "protected monument", "heritage-listed", *bene culturale tutelato*,
*dichiarazione di interesse culturale*. **Every hit is inside a compliance paragraph declaring the
absence of such a claim. Not one survived a verifier. Nothing to kill.**

Both registers were independently re-tested twice this wave — `vincoliinrete.beniculturali.it` and
`catalogo.beniculturali.it` time out at the socket while it.wikipedia, Nominatim, turismoroma.it and
the Sovrintendenza all answer normally on the same network. **The evidence_ruling stands untouched.**

Three near-misses, ruled:

1. **Prati's *negozi storici* page. UPHELD AND EXTENDED.** Turismo Roma's sentence that "some of the
   commercial activities of the city center were recognized as a major part of the city's heritage by
   the local institutions" is **dead**, as the verifier ruled — it names no register and no
   instrument and is a designation once a writer compresses it. **I extend the kill:** no Prati text
   may state or imply that Forno Colapicchioni has traded seventy years or through three generations.
   That is the association's *admission test*, not a sourced fact about the business, and inferring
   it is a trading-duration claim laundered through a trade body. Publish the membership and the
   association's 2008 founding. Nothing else.
2. **Castro Pretorio's `beniculturali.it` "Luoghi della Cultura" link** in the `Castra Praetoria`
   infobox. A ministry *directory* entry. It may not appear as, or be paraphrased into, a protection
   status. Correctly quarantined; I am confirming the quarantine.
3. **The UNESCO inscription of the Historic Centre of Rome, 1980, remains publishable** — as an
   inscription of the Historic Centre, in the intro, and **never as a per-building status.**

---

## 9. WHERE I AM STRICTER THAN A VERIFIER — READ THIS TWICE

Authors: these nine override the verdict file on your desk.

1. **OVERRIDE — Lungotevere Castello is not a place in the Prati file.** Prati's verifier escalated
   it. Borgo's verifier escalated the same street as its record 47 and wave 1 never ruled it, so it
   is still live in Borgo. Two seed files were on course to claim one street. **Neither takes it.**
   Prati publishes lungotevere Prati, dei Mellini and Michelangelo, and stops.
2. **OVERRIDE — Porta Angelica is out.** Both Prati's and Borgo's finders PIP-tested it to Prati and
   both escalated it hopefully. I am refusing it: geometry on a coordinate reconstructed for a
   building demolished in 1888, against an it.wikipedia Borgo category, a Borgo street, and wave 1's
   ownership of the Leonine wall. The salvaged angels on the corner may be described; the gate may
   not be claimed.
3. **OVERRIDE — the Museo Storico dei Bersaglieri is Castro Pretorio's, and Sallustiano's premise was
   wrong.** Sallustiano's verifier recorded the museum's double it.wikipedia category and wrote that
   it "will simply fall out of the corpus" because "no wave is writing Castro Pretorio". **Castro
   Pretorio is in this wave.** It does not fall out. Sallustiano writes nothing about it.
4. **OVERRIDE — no page may state that Santa Susanna is in Trevi.** Castro Pretorio's verifier
   instructs exactly that. Trevi's own verifier calls it that finder's one confirmed misassignment,
   got Castro Pretorio from an independent lookup, and refused the church. Replacement wording is at
   §3.4 and is mandatory.
5. **OVERRIDE — the Breccia di Porta Pia memorial is not a Sallustiano place**, and its narrative
   goes to Castro Pretorio's Porta Pia entry. Sallustiano's verifier recommended against seeding it;
   a recommendation is not a ruling and an author may read past one. This is a ruling.
6. **OVERRIDE — via XX Settembre and Via Vittorio Veneto are places in no file.** Both verifiers
   recommended it, neither ruled it, and both streets are filed under two or three rioni by their own
   sources. Sallustiano, Ludovisi and Castro Pretorio each describe their own stretch in prose. **No
   file emits either street as a record.** Same for piazza del Risorgimento, piazza Adriana, largo di
   Santa Susanna, piazza San Bernardo, largo di Villa Peretti and the Quattro Fontane junction.
7. **OVERRIDE — the US Embassy to the Holy See is emitted by nobody.** Both files stopped at
   "escalate" or "I would not seed it". Converted to a ruling so neither author reaches for it.
8. **STRICTER — Prati's Colapicchioni entry loses the seventy-years inference** (§8.1), on top of the
   verifier's three-part ruling.
9. **STRICTER — the Aurelian Walls are a place in no wave-3 file** (§3.6). Three verifiers reached
   this separately in three different words; it is now one ruling in one place.

Two verifier findings I am **ratifying rather than softening**, because an author might otherwise
think a hard call was negotiable: **Termini is Esquilino's** (§4), closed against its own finder's
doubt; and **Palazzo Massimo is Castro Pretorio's** on three tested points of its own footprint
despite an address on a straddling largo (§2).

---

## 10. NOTE FOR THE COORDINATOR

Three things that outlive this wave.

- **SISTO.** Prati's finder found that Roma Capitale's toponymy register is reachable at
  `geoportale.comune.roma.it/sisto/api/viario` and returns, per named public space, every council act
  that ever named or re-limited it **with a note naming the rione**. Prati's verifier re-derived the
  acts independently and upheld it. It settles boundaries better than anything else in the programme
  and it settles nothing about protection. **Give it to every remaining wave.** Its one limit is
  stated honestly in both files: one representative point per toponym is not a geometry.
- **Hijacked official links.** Two of it.wikipedia's `Sito ufficiale` fields for Prati churches now
  serve gambling sites (`sangioacchino.org`, `santamariadelrosario.net`), and `stpatricksrome.com` is
  a domain-sale listing. **A pipeline that copies it.wikipedia's official-site field into the corpus
  will publish links to gambling sites.** This warning belongs in the programme brief, not in one
  rione file.
- **Read the whole page you already downloaded.** Three finders in this wave declared a fact
  unsourced that was sitting in a document they had already fetched and quoted from: the Carabinieri
  museum's hours, the Museo Boncompagni's hours, and `hortisallustiani.it`, which returns 200 to a
  browser user-agent and answers the exact question its finder said was unanswerable.
