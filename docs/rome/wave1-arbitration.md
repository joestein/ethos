# Rome wave 1 — ARBITRATION

Units: **Campitelli (R. X) · Monti (R. I) · Trastevere (R. XIII) · Borgo (R. XIV)**.
Ruled **2026-09-02** on `campitelli|monti|trastevere|borgo`-`finder.md` and `-verdicts.md`, all eight
read in full, plus `priv/seed_data/rome_roster.json`.

**AUTHORS FOLLOW THIS FILE.** Where this file and a verdict file differ, this file wins, without
exception and without argument. §7 lists every place where I am stricter than a verifier; in the
Queens programme every Critical in the final review was an author following the looser document.
Read §7 before you read anything else.

Four verifiers each saw one rione. I am the only reader who has seen all four. Ownership is ruled
here and nowhere else.

---

## 0. THE FOUR PRINCIPLES I RULED BY

Stated up front so the rulings below are checkable rather than merely asserted.

**P1 — Containment, not hosting.** A rione owns what physically stands inside it. A monument a rione
merely fronts, faces, adjoins or is famous for does not belong to it. Piazza Venezia does not become
Campitelli's because the Vittoriano fronts it.

**P2 — An institution's own statement of the rione beats a geometry query.** Where Roma Capitale
(turismoroma.it, sovraintendenzaroma.it, the SISTO street register) or the operating institution
names the unit in its own voice, that governs over OSM, Nominatim and Overpass alike. Trastevere's
verifier established this at V-P63 and it is now programme-wide. It cuts both ways: it gives Monti
the Obelisco Esquilino and it takes Santa Prassede away from Monti (§7.1).

**P3 — Where nothing establishes containment, the place leaves the wave.** It does not get forced
into the nearest neighbour that happens to be in scope. Queens shipped three parks that belonged to
no neighborhood; the equivalent here is §3.

**P4 — A rione not being written in this wave is a real owner.** Celio, Ripa, Sant'Angelo, Esquilino,
Ponte, Regola, Prati, Testaccio, Trevi and Q. XII Gianicolense own what is theirs. "Not this wave" is
a ruling, not a failure.

---

## 1. OWNERSHIP TABLE — every place claimed by two files, assigned to exactly one

I intersected all four finder files mechanically as well as by reading, so this table is not limited
to what the verifiers happened to notice. Real collisions are fewer than the blindness suggested,
because three of the four finders declared their concessions honestly — Campitelli conceded the
Trajanic group to Monti at its §3.10, Borgo conceded the Ospedale Bambino Gesù to Trastevere at its
§5. Those concessions are ratified below rather than reopened.

| # | Place | Claimed by | **OWNER** | Evidence, and why the loser loses |
|---|---|---|---|---|
| 1 | **Foro di Nerva / Foro Transitorio** | Campitelli #82, Monti #6 | **CAMPITELLI** | Monti's claim rested on the finder's report that Roma Capitale's `rione-i-monti` page lists it. Monti's own verifier read the whole monument list and it is **not on it** (monti-verdicts §2.2). The Comune's per-place `foro-di-nerva` page names no rione. The polygon puts it south of via dei Fori Imperiali, in Campitelli. Roma Capitale is silent, geometry is not, and Monti's evidence was a misreading. |
| 2 | **Porticus absidata** | Monti #83 | **CAMPITELLI** | A component of #1. The Comune's own Foro di Nerva page places it «alle spalle del tempio di Minerva», inside that forum. **Campitelli's author must pick this up — it is currently in nobody's publish list**, because Monti dropped it and Campitelli never had it. |
| 3 | **Tempio di Minerva (Foro Transitorio)** | Monti #84 | **CAMPITELLI** | Same forum, same reasoning, same instruction: Campitelli inherits it. Fold both into the Foro di Nerva entry rather than standing them up alone. |
| 4 | **Via Alessandrina** | Campitelli #84, Monti #130 (as narrative) | **CAMPITELLI** | Campitelli fetched and its verifier re-verified the Sovrintendenza page verbatim: Bonelli, opened 1584, over 400 metres. Monti mentions the street only as the quarter demolished for via dei Fori Imperiali. Monti **may** keep that narrative sentence inside its via dei Fori Imperiali entry; it may **not** carry Via Alessandrina as a place. Keep Campitelli's past tense — the street was largely destroyed in the 1930s. |
| 5 | **Via dei Fori Imperiali** | Monti #130, Campitelli #97 | **MONTI** | It is the Monti/Campitelli boundary, so neither contains it. Monti gets it because Monti holds the fetched content (opened 1932 as via dell'Impero, the demolished quarter, the late-1990s excavations) and Campitelli's own file lists it merely as a boundary street. **Campitelli may state that the road is its northern boundary and nothing more.** One entry, not two. |
| 6 | **The Fori Imperiali visitor route and its ticketing** | Campitelli #85, implicit in Monti #2/#4 | **CAMPITELLI** | Campitelli fetched the Sovrintendenza page and its verifier re-verified every figure. Use campitelli-verdicts' exact wording for #85: the walkway enters at the Trajan's Column end **in Monti**, passes beneath via dei Fori Imperiali, and leaves at the Foro di Cesare on via Bonella **in Campitelli**. **Monti must not carry a second ticketing record.** The split is stated, never smoothed. |
| 7 | **Piazza del Colosseo** | Campitelli #116, Monti (§5.10) | **NEITHER — Celio.** See §3. | Both finders' own tests return Celio. Campitelli's claim rests on it.wikipedia's rione article listing it among Campitelli's piazze plus a containment primitive that is independently discredited (§2.1). |
| 8 | **Domus Aurea, Ludus Magnus, Foro di Traiano, Colonna Traiana, Mercati di Traiano, Foro di Augusto, Torre delle Milizie, Torre dei Conti, Casa dei Cavalieri di Rodi** | Campitelli §3.10 (conceded), Monti #2–#15 | **MONTI** | Campitelli's finder conceded every one of these in writing before any verifier saw the file. Ratified. Campitelli names none of them as its own. |
| 9 | **Galleria PASA (Principe Amedeo Savoia-Aosta tunnel)** | Borgo #46, Trastevere E-12 | **BORGO** | Its east portal is at Porta Santo Spirito, inside Borgo, and Borgo holds the fetched content (Bazzani, designed from 1930, begun 1938, opened 1940, 0.250 km, 16 m bore, originally the *galleria Gianicolense*). Trastevere's claim is that it.wikipedia calls the tunnel Trastevere's northern boundary — that is a boundary statement, not containment (P1). **Trastevere may cite the tunnel in its one sourced boundary sentence and nowhere else.** The west portal is in Q. XIII Aurelio and neither file may claim that end. |
| 10 | **Pontificia Università Urbaniana** | Trastevere E-12/E-13 | **NOT TRASTEVERE.** See §3. | Trastevere's own re-run puts the centroid in **Borgo**. Borgo has no record for it and fetched no source. It therefore leaves this wave rather than defaulting to the file that happened to find it. |
| 11 | **Pontificio Collegio Americano del Nord** | Trastevere E-10 (also on the Holy See's item-13 list Borgo read) | **TRASTEVERE** | Centroid Trastevere; geometry Aurelio + Trastevere. Borgo never claimed it as a place — it appears in Borgo's file only inside the vatican.va enumeration, which is a **status** list, not a **location** list. That distinction governs the whole Holy See tier and is restated at §5.6. |
| 12 | **Ospedale Pediatrico Bambino Gesù** | Trastevere §5.9, Borgo §5 (conceded) | **TRASTEVERE** | Borgo's finder tested it itself, got Trastevere, and said so. Ratified. Publishes only if someone fetches a source; neither file has one yet. |
| 13 | **Chiesa e Convento di Sant'Onofrio al Gianicolo** | Trastevere V-P55; on the Holy See's item-13 list Borgo read | **TRASTEVERE** | Piazza di Sant'Onofrio 2, on the Janiculum, inside Trastevere. Again: appearing on the extraterritorial enumeration is not a Borgo address. |
| 14 | **Mura leonine / Mura gianicolensi** | Borgo #5 / Trastevere V-P7 | **Different walls — no collision.** | Recorded because a name-intersection flags it and an author will trip on it. The Mura **leonine** (Leo IV, 848–852) are Borgo's, subject to §5.3. The Mura **gianicolensi** (Urban VIII, 1643) are Trastevere's. Neither file may use the other's wall to explain its own. |
| 15 | **Santa Maria Maggiore** | Monti #17, named in passing by Campitelli and Trastevere | **MONTI** | See §4.1. The two passing mentions are correct disclaimers, not claims, and stay. |

---

## 2. THE MARQUEE RULE — one file each, now and forever

Each of the eight appears in **exactly one** seed file across the entire Rome corpus. No second file
may carry it as a place, in any wave, under any name, at any length. A file that does not own one may
name it only where a fetched source forces the name — a boundary quotation, a ticket that spans both,
an address on a street named after it — and never as an entry of its own.

| Marquee | **OWNER** | Why, and what the loser may still say |
|---|---|---|
| **Colosseum** | **NOBODY IN WAVE 1 — reserved to CELIO** | Campitelli tested the centroid and four perimeter points: **Celio every time**, and its verifier independently confirmed it. Monti's own file concedes the amphitheatre. Celio is not in this wave, so the Colosseum is not in this wave. This is the hardest ruling in the file and it is not close on the evidence: the guidebook consensus that puts the Colosseum "in Monti" is exactly the aggregator habit P1 exists to defeat. **Neither Campitelli nor Monti may carry it, describe it as theirs, or build an entry around a view of it.** Monti's Terme di Tito, Domus Aurea and Ludus Magnus entries may state their sourced relation to the amphitheatre's site — the Domus Aurea's lake stood in the valley where it was later built — because that is a fetched historical fact, not a claim of place. |
| **Roman Forum** | **CAMPITELLI** | Campitelli holds the whole enclosure, its verified Sovrintendenza hours and Forum Pass Super tariff, the Curia, the arches, the temples, the Antiquarium Forense and the Palatine above it. No other wave-1 unit claimed a square metre of it. |
| **Capitoline Museums** | **CAMPITELLI** | Uncontested. Piazza del Campidoglio 1, hours and tariffs re-verified verbatim on the museum's own site. |
| **Vittoriano** | **CAMPITELLI** | Uncontested as a building. Note the trap: it fronts Piazza Venezia, whose rione **no source establishes** (§3). The monument is Campitelli's; the square is nobody's. Do not let the second fact quietly transfer to the first — that is P1 in its purest form. |
| **Castel Sant'Angelo** | **BORGO** | Uncontested; Roma Capitale's page confirmed verbatim including address, hours and the Passetto paragraph. It is the anchor of Borgo's guide. See §5.2 for what the Passetto may and may not say, and §7.5 for the 130–139 AD dating. |
| **Santa Maria Maggiore** | **MONTI** | Genuinely contested with Esquilino, ruled at §4.1. Monti carries it once, with the straddle stated. Esquilino may never carry it. |
| **Santa Maria in Trastevere** | **TRASTEVERE** | Uncontested — no other file mentions it once. Publishes as an attributed it.wikipedia record (V-P39) with the evaluative half cut (V-D19), and **without** the "oldest fountain" claim that sits on its square (§7.2). |
| **Trajan's Market (Mercati di Traiano)** | **MONTI** | Conceded in writing by Campitelli's finder before verification. The Museo dei Fori Imperiali is the **same institution** and is one record, not two (monti-verdicts #102). Carry the entrance flag: the Via Quattro Novembre address may sit on the Trevi side of a Monti monument, so publish the address and claim no rione for the doorway. |

---

## 3. RULED OUT OF WAVE 1 — belongs to no rione being written now

These are not failures and they are not to be salvaged. Each is either owned by a rione outside this
wave, or unestablished by anything we hold. **No wave-1 file may carry any of them as a place.** The
right-hand column is the instruction to the author, not a consolation.

### 3.1 Celio owns these
| Place | Ruling |
|---|---|
| **Colosseum** | Celio at the centroid and all four perimeter points, twice independently. §2. |
| **Piazza del Colosseo** | Celio on both methods in both files. |
| **Arco di Costantino** | **OUT.** Overpass `is_in` says Celio; Overpass containment over the same relation says Campitelli; Nominatim says Campitelli. Two verifiers tried to break the tie and both failed on timeouts and 504s. And the containment primitive is the one that was **proved wrong** on via dei Cerchi, where a second determination was obtainable. I will not hand Rome's most photographed arch to a primitive with a known failure. Nothing we hold establishes containment; P3 applies. Re-propose for Celio, or for Campitelli, when someone runs a patient Overpass session at low rate. |
| **Meta Sudans**, **Base del Colosso di Nerone**, **Colosso di Nerone**, **Ninfeo di Nerone** | Same contested strip, same containment-only evidence, same ruling. Monti's verifier had already dropped the last two to Celio; I extend it to the first two, which Campitelli left pending. |
| **Colosseo metro station** | **OUT.** PIP Monti, Nominatim Celio, and the piazza above it is Celio on both. No unit established. Monti publishes **Cavour** only (Via Cavour 197, 00184, Monti on every method). **And no page states that Line C serves Colosseo** — single-sourced to Wikipedia, `metroc.it` does not resolve, explicitly unverified. |

### 3.2 Ripa owns these
| Place | Ruling |
|---|---|
| **The via dei Cerchi block** — 075, Ad Hoc Circo Massimo, Osteria Circo, Art Cafe, Gelateria Artigianale, Easy Bike Rent, **Museo della Cucina** | **OUT.** Campitelli's verifier got the second determination the finder could not: `is_in(41.8862, 12.4838)` returns *Municipio Roma I; Rione XII Ripa*, with Campitelli not returned at all, agreeing with it.wikipedia's naming of via dei Cerchi as the Ripa boundary. Two methods say Ripa, one says Campitelli. Record for Ripa. This was Campitelli's largest low-confidence block and it does not survive. |
| **Piazza della Consolazione** | **OUT** — Ripa. The church on it is Campitelli's; see §4.2. |
| **Isola Tiberina** | **OUT** — Ripa, emphatically. Geometry touches Regola + Ripa + Trastevere and the centroid is Ripa. It must not default to Trastevere on a geometry clip. |
| **Ponte Cestio**, **Ponte Palatino** | **OUT** — Ripa on centroid. Ponte Cestio connects to the Isola, which is Ripa's. |

### 3.3 Other units own these
| Place | Owner | Ruling |
|---|---|---|
| **Piazza di Campitelli**, **Santa Maria in Portico in Campitelli** | Sant'Angelo | The church is settled by two independent determinations — `is_in(41.893127, 12.479498)` returns Rione XI Sant'Angelo, and it.wikipedia's article opens *"è una chiesa di Roma nel rione Sant'Angelo"*. The **square** goes with it: the same encyclopaedia that lists it among Campitelli's five piazze also names it as the Sant'Angelo boundary, one page contradicting itself, which establishes nothing. **Campitelli keeps Palazzo Albertoni Spinola and Palazzo Muti Bussi**, whose own articles state Rione X in terms — but it must not describe the square they stand on as Campitelli's. |
| **Teatro di Marcello** | Sant'Angelo | Tests Sant'Angelo on both Overpass and Nominatim. **The wave-1 brief listed it for Campitelli and the brief is wrong.** Campitelli's finder caught this; I am ratifying it so no author restores it from the brief. Businesses addressed on via del Teatro di Marcello still publish under Campitelli — a street name is not a claim on the monument it is named for. |
| **Scala Santa / Sancta Sanctorum** | Esquilino | Both OSM methods say Esquilino and Roma Capitale does not name it among Monti's monuments. **Carry the finding across:** its extraterritorial basis is now *confirmed*, not inferred — Lateran Treaty **Annex II, Tav. 1** names *"Basilica e Palazzo Apostolico Lateranense ed annessi con la Scala Santa"* in terms. Whoever writes Esquilino inherits that. Its consequence for the Lateran cluster is at §4.3. |
| **Santa Prassede**, **Teatro Brancaccio** | Esquilino | **OUT, and this overrides Monti's verifier — see §7.1.** |
| **Piazza del Quirinale**, **Palazzo del Quirinale**, **Palazzo della Consulta** | Trevi, or unestablished | The piazza is named as the boundary by **both** rioni's own descriptions, so it is a genuine straddle and not an error; the palace footprint crosses the line; the Consulta fronts the piazza and no method places it. Trevi is not in this wave. **OUT** on P3 and P4. Monti keeps **Sant'Andrea al Quirinale** (Via del Quirinale 30, hours re-verified on its own site) and **San Carlo alle Quattro Fontane**, which its verifier placed on two methods each — but neither entry may claim the piazza. **Quattro Fontane** is Trevi and stays dropped. |
| **Porta San Giovanni**, **Piazza di Porta San Giovanni** | Unestablished | The gate sits **in the Aurelian wall itself**; the node falls outside all seven tested polygons and the way centroid falls inside Monti. A structure that is the boundary is not contained by either side. **OUT.** |
| **Pontificia Università Lateranense** | Unestablished | Rione contested and its own site is reachable only past an SSL chain failure. **OUT** — do not cite it until that is resolved. Monti's verifier's refusal to claim Lateran Treaty Art. 16 exemption for it is **upheld**: Art. 16's list was re-read in full and neither the Lateran University nor the Angelicum is on it. |
| **Stazione di Roma Trastevere** | Portuense | **OUT**, and the it.wikipedia article says so itself: *"benché, nonostante il nome, sorga al di fuori di esso"*. The name is a trap and the source disarms it. |
| **Largo Giorgio Roberti** | Q. XII Gianicolense | **OUT** on centroid. |
| **Monteverde / Gianicolense** | Q. XII Gianicolense | **OUT.** Not Trastevere, whatever a visitor calls it. |
| **Ponte Garibaldi** | Regola | **OUT** on centroid (Regola), geometry Regola + Trastevere. But note: it lands in piazza G. G. Belli and the **Belli monument is unambiguously Trastevere's** and stays. The two must not be separated in the reader's mind, and the way to do that is to site the monument precisely, not to annex the bridge. |
| **Ponte Sublicio** | Testaccio or Ripa | **OUT.** Centroid Testaccio; geometry Ripa + Testaccio + Trastevere. Trastevere's claim is the weakest of three and none of the three is in this wave for it. **Also: do not inherit OSM's Wikidata id Q1466700 — it is the ancient *pons Sublicius*, a different structure.** |
| **Ponte Principe Amedeo Savoia Aosta (ponte PASA)** | Unestablished | **OUT.** it.wikipedia's lead says *"nei rioni Ponte, Trastevere e Borgo"* and its own body says *"Collega il rione Borgo con il rione Ponte"* — the article contradicts itself, and Wikipedia's own `{{F}}` and `{{S}}` banners flag it as under-sourced and a stub. A self-contradicting stub establishes nothing. Distinct from the **Galleria** PASA, which is Borgo's (§1 #9). |
| **Pontificia Università Urbaniana** | Borgo, unsourced | **OUT.** §1 #10. Borgo may propose it in a later wave with a fetched source; it may not appear under Trastevere. |
| **Campo Santo Teutonico / Santa Maria della Pietà** | Sovereignty unresolved | **OUT.** §5.5. |
| **Aula Paolo VI** | Sovereignty unresolved | **OUT.** §5.4. |
| **Piazza Venezia** | Unestablished | **OUT as a place.** Four sources, three answers: Campitelli's and Monti's `is_in` say **Trevi**, Nominatim and it.wikipedia's own infobox say **Pigna**, it.wikipedia's Campitelli article says **Campitelli**. **No wave-1 page may state which rione Piazza Venezia is in.** The Vittoriano's address may be given as Piazza Venezia — an address is not a rione claim — and the Vittoriano carries the geography. |
| **The "north side of the Janiculum" Art. 14 ¶2 zone** | Not a place | **OUT as a zone.** The Treaty defines it only by an annexed map (Alleg. II, 12) which nobody has read, and the Trastevere/Borgo line runs through it. Its individually named properties publish under the unit a fetched source puts them in — Sant'Onofrio and the Bambino Gesù in Trastevere, the Urbaniana nowhere this wave. **The zone itself is a legal overlay, not a place**, exactly as `r6474878` is (V-D28). |
| **Mura Aureliane whole-circuit relation; "Mura di Roma" relation** | Not places | **OUT.** A 2,253-vertex object touching thirteen units belongs to none of them. Trastevere publishes only `way/204145793`, the segment re-confirmed wholly inside it. |

---

## 4. STRADDLERS

### 4.1 Santa Maria Maggiore — **MONTI MAY CARRY IT. Ruled: Monti.**

This is the ruling the brief asked for by name and it deserves its reasoning in full, because Monti's
verifier escalated it in a **worse** state than the finder left it.

The evidence, assembled from both documents:

- **For Monti.** The OSM polygon returns Monti on both methods at both tested points — the facade
  (41.89750, 12.49861) and the piazza side (41.89706, 12.49892). Roma Capitale's own `rione-i-monti`
  page names *"la Basilica di Santa Maria Maggiore, una delle quattro basiliche papali di Roma"*
  among the monuments **«qui presenti»** in the rione, in its own editorial voice. And Roma
  Capitale's Obelisco Esquilino page places that obelisk — which stands in piazza dell'Esquilino,
  *behind the basilica's own apse* — **«nel Rione Monti»**, in terms.
- **Against Monti.** The postcodes seam across the block: 00184 on the facade side, **00185** at
  Piazza di Santa Maria Maggiore 28. And the contradiction Monti's verifier found, which the finder
  missed: `rione-i-monti` says the Esquiline **«non ne fa più parte»** — no longer forms part of the
  rione — while the basilica's own page places it **«sulla sommità del colle Esquilino»**.

**Ruling: Monti carries it.** The apparent contradiction dissolves on a distinction both documents
missed. *"The Esquiline no longer forms part of the rione"* and *"the basilica stands on the summit
of the Esquiline hill"* are statements about a **hill**. *"Santa Maria Maggiore is among the
monuments present in Rione Monti"* is a statement about a **rione**. The Esquiline hill and the rione
Esquilino are not the same object — the hill predates the 1874 rione by two and a half millennia, and
the rione's boundary was never drawn along the contour. Only the third sentence is a rione statement,
and under P2 a rione statement in Roma Capitale's own voice governs. The obelisk behind the apse,
placed in Monti by the same publisher, corroborates it independently.

The postcode seam is real and it is why this is a straddler rather than a simple case. It does not
decide the question: Roma Capitale's postal geography is not Roma Capitale's toponymic geography, and
the roster's own source note is built on the toponymic codes.

**Binding on the author, and all five conditions are mandatory:**
1. The entry appears in **Monti and nowhere else, ever.** Esquilino may not carry it in a later wave.
2. The entry **must state the straddle**: that the basilica's block sits on the seam between Monti and
   Esquilino, and that Roma Capitale's own material is not internally consistent about the Esquiline.
   Use monti-verdicts §2.4's replacement wording. **Do not smooth this. Do not pick a side in prose.**
3. It carries the **Lateran Treaty extraterritorial status**, sourced to **Art. 13 and Annex II
   Tav. 2** — *"Basilica di S. Maria Maggiore con gli edifici annessi"* — both of which name it
   explicitly. Not to Wikipedia, and not to Art. 13's «edifici annessi» alone. Use the §5.6 wording.
4. **No hours.** `basilicasantamariamaggiore.va/it/basilica.html` returns 200 — the finder's reported
   403 was a directory-form URL and that finding is dead — but `/it/orari.html` is 404 and
   turismoroma's «Orari» is a link, not inline text. Hours are *not yet fetched*, which is a narrower
   and more honest statement than *refused*, and either way nothing may be published.
5. The **Museo Storico Liberiano / Polo Museale** (#107) follows the basilica into Monti as part of
   the same record, and may now be sourced properly from the basilica's reachable site.

### 4.2 Santa Maria della Consolazione — **CAMPITELLI carries the church; the square is Ripa's.**

Campitelli's finder said *"a page that says 'in piazza della Consolazione, in the rione Campitelli'
would be asserting something no source supports."* Its verifier proved that false: it.wikipedia's
article opens *"situato rione Campitelli nella piazza omonima"*. **I am ruling on the verifier's
corrected evidence, not the finder's, and an author reading only the finder file would rule on a
false premise.**

Three positions sit inside one article set — the body says Campitelli, the infobox gives *viale
Jugario* (which the rione article names as the Ripa border), and Overpass puts the square in Ripa.
**Ruling: the church publishes under Campitelli** — it is the only explicit statement of the church's
own rione anywhere in the evidence. **Piazza della Consolazione publishes under Ripa, in a later
wave.** The entry must say both, in campitelli-verdicts #37's exact wording, and must not resolve
what the sources do not.

### 4.3 The Lateran cluster — **MONTI, minus the Scala Santa.**

Monti's finder reasoned from the «Confini:» perimeter list that Roma Capitale *"puts the Lateran
complex inside Monti, explicitly, in words."* **That sentence is dead** — its own verifier killed it,
correctly, because a perimeter that runs *along* a complex does not put the complex inside it, and
that is precisely the reasoning the same finder used **against** Monti two sections later on Santa
Maria Maggiore. One file, two opposite standards, pushing its two biggest questions in opposite
directions.

But the right answer survives by a better road, and it is the one at P2: the same page's **editorial
prose** names *"la Basilica di San Giovanni in Laterano, la cattedrale di Roma"* among the monuments
present in the rione. That is Roma Capitale's own voice on a rione question.

**Ruled to MONTI:** San Giovanni in Laterano (#18), the Battistero lateranense (#19), Palazzo del
Laterano (#20), the Obelisco Lateranense (#22), the Museo del Tesoro Lateranense (#106) and the
Museo storico vaticano (#108). **Ruled OUT (§3.3):** the Scala Santa and Sancta Sanctorum, and the
Pontificia Università Lateranense.

Three consequences, all binding:
- **The complex is split, so nobody may treat it as indivisible.** The Scala Santa leaving for
  Esquilino is the proof. Roma Capitale's «complesso del Laterano» cannot be read as a single unit by
  any file, in either direction.
- **#106 and #112 are one record.** The Museo del Tesoro Lateranense and the "Museo di San Giovanni
  in Laterano" are the same museum under two names; Monti's verifier suspected it and I am ruling it.
  One entry.
- **#108 is the trap and Ruling 2 does not apply to it.** The *Museo storico vaticano* stands inside
  the Palazzo del Laterano, **on Italian soil**. No draft may treat it as a Vatican-territory place
  or let its name imply one.

### 4.4 The Imperial Fora — split down the middle of the walk, and the split is published

The single most consequential geographic fact in the wave, and every general reader has it wrong.
**Via dei Fori Imperiali is the Monti/Campitelli boundary** and the archaeological strip is cut in
two by it:

- **CAMPITELLI (south side):** Foro di Cesare, Foro di Nerva/Transitorio with the Porticus absidata
  and the Tempio di Minerva, Tempio della Pace, Basilica Argentaria, Tempio di Venere Genitrice, Via
  Alessandrina.
- **MONTI (north side):** Foro di Traiano, Colonna Traiana, Mercati di Traiano with the Museo dei
  Fori Imperiali, Foro di Augusto with the Arco dei Pantani and the Aula del Colosso, Basilica Ulpia
  (folded into the Foro di Traiano, not stood up alone).
- **The route belongs to Campitelli** (§1 #6) and states the crossing in terms.

SS. Cosma e Damiano is **built into** the Tempio della Pace and the Torre dei Conti's cellars
**incorporate one of that forum's four squared-tufa exedrae** — both are physical facts, both stay,
and neither transfers ownership across the road.

### 4.5 The Trastevere bridges and villas

Ratified as the verifier recommended, on centroid plus the institution's own voice where it exists:

- **Ponte Sisto → TRASTEVERE.** Centroid Trastevere; Roma Capitale frames the bridge *from*
  Trastevere. Regola is not in this wave. **Publish both date framings, each attributed, never
  merged** — Roma Capitale's Jubilee-of-1475 framing and it.wikipedia's 1473–1479 — and keep the
  designer unresolved, with the Vasarian Pontelli attribution shown as fallen.
- **Ponte Giuseppe Mazzini → TRASTEVERE**, on centroid, weakly, with no institutional source naming a
  rione. Say nothing more than the geometry supports.
- **Villa Sciarra → TRASTEVERE.** Roma Capitale states *"Municipio I, Rione XIII - Trastevere"*
  outright. This is P2 at its cleanest: one institutional statement beats two weaker ones. Extension
  **63,500 m² per Roma Capitale**; it.wikipedia's "sette ettari e mezzo" is dropped, not averaged.
- **American Academy in Rome → TRASTEVERE.** And **Villa Aurelia is wholly inside Trastevere and is
  not a straddler at all** — do not conflate the two objects as OSM already has, and do not inherit
  Q15852893, which is the Casino Farnese.
- **Pontificio Collegio Americano del Nord → TRASTEVERE**, on centroid (§1 #11).

---

## 5. THE VATICAN BOUNDARY — Borgo specifically

### 5.1 Confirmation: nothing inside Vatican City is claimed by any wave-1 file

I checked this myself across all four files rather than trusting four separate assurances.
**St Peter's Basilica, St Peter's Square, the Vatican Museums and the Sistine Chapel appear in Borgo's
file only on its exclusion list**, and in the other three files not at all. Trastevere's verifier ran
an independent mechanical scan of all 232 candidates for `vatican|vaticano|san pietro|st peter|
sistina|sistine` and the only hits were **San Pietro in Montorio** and its convent, both wholly
inside Trastevere and both fine. Campitelli and Monti are not near the state.

**Sant'Anna dei Palafrenieri is correctly excluded and is the trap** — a parish church with an
Italian-sounding street presence that is inside the state. It stays out.

**Ruling 2 is satisfied.** Borgo's handling is exemplary and the one lapse ran the safe way: the
finder was *too* cautious about the Jesuit Curia (§5.6).

### 5.2 The Passetto di Borgo — the hard case, ruled narrowly

The Passetto runs from the Apostolic Palace to Castel Sant'Angelo and **crosses the border**. It is
therefore partly in Vatican City and partly in Borgo, and the corpus may write only the Borgo part.

**Ruled: BORGO carries it, under these limits, all binding.**
1. Borgo publishes **the stretch that physically stands in Borgo** — the wall running above Borgo
   Sant'Angelo and Borgo Pio to its junction with Castel Sant'Angelo. OSM PIP at 41.903056,
   12.459722 returns Borgo for that stretch.
2. **The entry must state that its western end lies inside Vatican City**, and must state that the
   corpus **does not say where along the corridor the border crosses**. That is not a hedge; it is
   the only defensible position, because the Treaty defines the border by a 1:5000 map with no verbal
   description and the 1932/33 commission's conclusions were never ratified.
3. **No length figure.** it.wikipedia's ~800 m is footnoted to `castelsantangelo.beniculturali.it`,
   which is unreachable. The number is unverifiable and does not ship.
4. **No 2024 reopening claim, and no visiting information of any kind.** Unverified; nobody attempted
   those hosts.
5. 1277 and Nicholas III publish as attributed it.wikipedia facts.

### 5.3 The Mura leonine — same shape, same limits

848–852 under Leo IV, after the 846 Saracen sack, with Lothar I decreeing and part-financing it in
October 846; extended by Paul III and Pius IV to 1565. But **it.wikipedia's own infobox gives the
wall's state as Papal 848–1870 and Vatican from 1929** — most of the surviving circuit **is** the
Vatican's perimeter. Borgo publishes **only the stretch standing in Borgo**, and **no page may
describe the Leonine wall as marking, defining or tracing the Italy–Vatican border.**

### 5.4 Piazza Pio XII is Italian; Piazza San Pietro is not

**Piazza Pio XII → BORGO.** It is Italian territory and Roma Capitale carries a coordinate for it.
**Piazza San Pietro is Vatican City per Lateran Treaty Art. 3 and is excluded**, and no page may cite
the Italian policing there as evidence of Italian territory — the Treaty makes that a concession on
foreign soil.

**The transition between them is where wave 1 is most likely to go wrong**, so:
- **Via della Conciliazione → BORGO.** 420 m circa, CAP 00193, sampietrini, running from Largo
  Giovanni XXIII to Piazza Pio XII, by Piacentini and Spaccarelli, from 1936, completed for the 1950
  Jubilee with two rows of obelisk lampposts. **Largo Giovanni XXIII has no content of its own and
  folds into this entry as the street's stated `inizio`.** Benevolo's *"una delle opere urbanistiche
  più discusse e aspramente criticate del Novecento"* ships **only** as attributed criticism.
- **The travertine line is dead and stays dead.** *"Una sottile linea di travertino romano … delinea
  il confine di Stato tra Italia e Vaticano"* is in the **first paragraph of the most-read article
  about the street**, an author will find it without looking, and it is banned by the roster's own
  words. The Treaty does not describe the border verbally at all; a strip of paving cannot be
  reported as doing what the Treaty declined to do.
- **Keep the ~140 m bracket for the Piazza Pio XII transition and do not narrow it.** Both the finder
  and the verifier refused to narrow it and I am making that refusal binding.
- **Aula Paolo VI: OUT of the corpus this wave.** The border runs through the hall, the Holy See's
  own list does not name it, and OSM is worthless at that edge.

### 5.5 Campo Santo Teutonico / Santa Maria della Pietà — OUT

it.wikipedia calls it extraterritorial on the authority of `globalgeografia.com` alone; en.wikipedia
says two different things on one page; **the Holy See's own enumeration does not list it — Borgo's
verifier read all thirteen Rome items and it is absent**; OSM puts it in Borgo. Sovereignty is
unresolved between three possibilities. **Publish no sovereignty sentence and no place record in
wave 1.**

### 5.6 The third tier — extraterritorial properties, and the rule that governs them

**The Lateran Treaty extraterritorial properties are neither Vatican City nor ordinary Italian
buildings.** Art. 15 grants them the immunities of the headquarters of diplomatic agents, **on
Italian soil**; visitors follow Italian law. They publish under the unit they physically stand in.

**The distinction that decides three ownership questions in §1: the vatican.va enumeration is a
STATUS list, not a LOCATION list.** A property appearing on it tells you what legal regime it enjoys.
It tells you nothing about which rione it stands in, and it is not Borgo's simply because Borgo was
the file that read the list. That is why the Bambino Gesù, Sant'Onofrio and the North American
College are Trastevere's.

**Every extraterritorial status line in the wave uses this wording, verbatim:**

> Under the Lateran Treaty of 11 February 1929, Italy recognises the Holy See's full ownership of
> this property (Art. 13; Annex II). Art. 15 states that the property, «benché facenti parte del
> territorio dello Stato italiano» — although forming part of the territory of the Italian State —
> enjoys the immunities that international law grants to the headquarters of the diplomatic agents of
> foreign States. It is on Italian soil and visitors are subject to Italian law.

Binding riders:
- **No draft may describe any extraterritorial property as "in the Vatican" or as "Vatican
  territory".** Art. 15 says the opposite in its own words, and that sentence is the one to carry.
- **Annex II is in the vatican.va document, above the treaty text.** Monti's finder declared it
  absent and its verifier found it in the first two thousand characters: *Tav. 1* Lateran with the
  Scala Santa, *Tav. 2* Santa Maria Maggiore, *Tav. 3* San Paolo. **Everything anywhere in this
  programme marked "INFERRED" for the Scala Santa or the Lateran is wrong and must be corrected.**
- **Cite no annexe table number for the Palazzo di San Callisto.** The index says *Tav. 8*, Art. 13
  says *(Alleg. II, 9)*, Art. 15's parenthetical lists six palaces against five numbers, and the
  index skips Tav. 11. The primary source is internally inconsistent. Art. 13 names the building in
  words and that is what to cite. **San Callisto → Trastevere**, `way/51368361` wholly inside.
- **The Jesuit Curia Generalizia is named on the Holy See's list in its own right** — Borgo's finder
  truncated item 13 and its verifier restored it. The grant names *Curia Generalizia della Compagnia
  di Gesù* **and, separately**, the adjoining buildings on Borgo Santo Spirito. **It does not name the
  Cappella di San Francesco Borgia inside it, and the entry must say so.** Same for the Collegio
  Internazionale S. Monica: the college's status is primary-sourced, the chapel's is not.
- **Do NOT assume status for the Palazzo delle Sacre Congregazioni Romane.** It appears under no name
  in any list, and Art. 15's forward-looking clause about future dicasteries makes the question
  undecidable from the Treaty text. It publishes **as a building, with no status claim of any kind**,
  under Trastevere.
- **Palazzo dell'Azione Cattolica is NOT extraterritorial.** A Wikipedia category says so; the Holy
  See's list does not name it; the article's only footnote is a hobby site and its category sort key
  was copy-pasted from another palace's page. **The Holy See's list governs.**
- **San Pietro in Borgo:** the Holy See's list names the Palazzo del Sant'Offizio *"ed adiacenze"* and
  does not itemise the oratory. Publish the inference **as Wikipedia's**, never as the Treaty's.
- **Auditorium Conciliazione ships intact and it is the sharpest fact in Borgo's file:** the hall sits
  inside a Holy See extraterritorial palace and is **explicitly excluded from that status by the Holy
  See's own text**. Both verifiers read the exclusion clause.
- **The UNESCO carve-out for this tier is real and publishable, attributed to the Holy See:** its
  Roman extraterritorial properties, the Seminario Romano Minore excepted, are inscribed on the World
  Heritage list following the Holy See's 1982 accession to the 1972 Convention. See §6.2 for the
  limit on every *other* UNESCO sentence in the wave.

### 5.7 The Ricciolo d'Italia control binds the whole programme

Borgo's finder built a control at the *Ricciolo d'Italia* — the 3 m × 60 m curl of Italian territory
behind the north colonnade — and proved that OSM's answer is worthless at that edge. Both its
verifier and I uphold it, and its conclusion is binding on all four files and every later wave:

> **No OSM, Overpass or Nominatim result may found any statement about where the international
> border runs.**

Every "Borgo — OSM PIP" in that file rests on **one** Overpass download and **one** local
point-in-polygon run, with Nominatim rate-limited out. The finder said so plainly. **Two points
tested against the same polygon are one witness, not two**, and no author may present them as
corroboration.

---

## 6. DESIGNATION CLAIMS — Ruling 1 is absolute, and here is what dies

### 6.1 Claims that reached me, and are killed here

| Claim | Where | Ruling |
|---|---|---|
| *"un edificio a Roma **dichiarato di interesse storico-artistico da parte del Governo Italiano**"* | it.wikipedia, **Palazzo Albertoni Spinola**; quarantined by Campitelli's finder, re-fetched and confirmed present by its verifier | **BANNED at any strength, attributed or not.** It is a *dichiarazione di interesse culturale* claim in substance. The palace still publishes: piazza Campitelli 2, Della Porta and Rainaldi, c.1580–c.1616, Baldassarre Paluzzi Albertoni, *"si trova nel Rione X (Campitelli)"* — all from the same article, all clean. |
| The `vincolo` sentence on **Villa Sforza ai Quattro Cantoni** | Monti §7.1; stripped by the finder | **Stripping upheld and it must survive into every draft.** |
| Lateran Treaty **Art. 16**'s *«non saranno mai assoggettati a vincoli»* | Monti §4, Trastevere §4 | **The word `vincoli` stays out of published prose across all four files.** Trastevere's verifier made this binding for one rione; **I extend it to the wave.** The Treaty uses it in the negative and about its own properties, and a reader cannot be asked to parse the inversion. |
| *"in violazione del **vincolo ereditario**"* | villafarnesina.it, in the official history page an author will mine | **Keep it out of prose.** It is an inheritance entail and has nothing to do with heritage protection — but the word must not appear, and it must not be mistaken for a Ruling 1 breach when someone audits the source. |
| **"Monumento Nazionale a Vittorio Emanuele II"** | The Vittoriano's own name; Campitelli's verifier permitted it as a name | **Upheld but hardened — see §7.4.** |

**Nothing else got through.** I searched all eight files for every banned term in both languages.
Campitelli, Monti, Trastevere and Borgo are otherwise clean, and Borgo is clean by deliberate
policy — its finder omitted protection language even where a fetched source offered it, which is the
correct reading of the ruling.

**Standing instruction, and it is the highest-risk text in the wave:** the quarantine sections of the
finder files contain the banned sentences **in quotable form**. Nothing from Campitelli §7, Monti
§7.1, or the §3 claim-level tables of any file may be transcribed into a draft. They exist so no
writer reintroduces the claim from the same page, not as a reservoir.

### 6.2 UNESCO — publishable, but far more narrowly than Campitelli's verifier allowed

The UNESCO inscription is explicitly carved out of Ruling 1 and is the one heritage-status statement
the wave may carry. Both Campitelli's and Trastevere's verifiers extracted the record and they agree
on it: **Historic Centre of Rome, the Properties of the Holy See in that City Enjoying
Extraterritorial Rights and San Paolo Fuori le Mura (ref. 91)**; inscribed **1980**; **significant
boundary modification 1990** extending the property to the walls of Urban VIII, the Holy See's
extraterritorial properties and San Paolo fuori le Mura; **minor modifications 2015 and 2023**;
criteria **(i)(ii)(iii)(iv)(vi)**; property **1,469.7 ha**; buffer zone **7,158.933 ha**. The long
serial title dates from the 1990 extension, **not** from 1980, and a page citing "the 1980
inscription" alone is citing an incomplete record.

**But the two verifiers ruled in opposite directions on the sentence that matters, and I am taking
the stricter one. See §7.3.**

---

## 7. WHERE I AM STRICTER THAN A VERIFIER — READ THIS SECTION TWICE

Authors follow this file, not the verdict files. **Every item below is a case where the verdict file
permits something I am forbidding.** If a verdict file and this section disagree, this section wins.

### 7.1 OVERRIDE — Santa Prassede and Teatro Brancaccio leave Monti entirely

**Monti's verifier ruled:** Santa Prassede **P** for its building-fabric facts, with only the page's
rione sentence dropped; Teatro Brancaccio **P** for every date and the «sala di oltre 1300 posti»,
with only its rione sentence dropped. In both cases the verifier called Roma Capitale's own statement
*"confirmed present and confirmed wrong"* against OSM.

**I rule both OUT of this wave.** Roma Capitale says **«Situata nel rione Esquilino»** of Santa
Prassede and **«Situato nel cosmopolita quartiere Esquilino»** of the Teatro Brancaccio, in its own
voice, on per-place pages. Under **P2 — which that same verifier's own colleague established and
which I have applied in Monti's favour twice, for the Obelisco Esquilino and for Santa Maria
Maggiore — an institution's rione statement governs over OSM.** A principle that only ever runs one
way is not a principle. The verifier kept the facts and discarded the sentence; that is exactly
backwards, because the sentence is the *only* institutional evidence of unit either page contains.

Monti's author: **do not write these two.** Re-propose for Esquilino, where the facts survive intact.

### 7.2 OVERRIDE — every superlative dies, including the institutional ones Trastevere allowed

**Trastevere's verifier ruled** at V-R20 that two Roma Capitale comparatives are *"institutional, not
self-promotional, and both are publishable if attributed"*: that Busiri Vici's fountain was the
**first modern monumental fountain built in the rione** after the Acqua Paola display, and that the
fountain in piazza di Santa Maria in Trastevere is **the oldest in the rione**. It also passed
V-P1's *"thirteenth and **most extensive** rione"* and V-P30's *"**primo ponte edificato in epoca
moderna**"* on attribution.

**Campitelli's verifier ruled the opposite way on identical shapes**, banning *"il museo pubblico più
antico del mondo"* with the reasoning that **an institution's parent body does not establish "the
oldest"**, and banning *"il rione meno popolato di Roma"* even though it was attributed to
it.wikipedia.

**Campitelli's line is right and it is now the wave's line. All four of Trastevere's survive-by-
attribution superlatives are DROPPED:**
- ❌ "the first modern monumental fountain built in the rione" (Roma Capitale, about a fountain it maintains)
- ❌ "the oldest fountain in the rione" (same)
- ❌ "the thirteenth and most extensive rione" (it.wikipedia)
- ❌ "the first bridge built in the modern era" (Roma Capitale, about a bridge it owns)

**The rule, stated once for the wave:** *no superlative and no "first / oldest / largest / most"
claim publishes, from any source — Roma Capitale, the Holy See, an operator, or an aggregator — in
any form, including attributed.* Roma Capitale is the **owner and operator** of these fountains,
bridges and museums; it is the business talking about itself, and the corpus rule that bars a place's
own site from establishing "the oldest" does not stop applying because the owner is a city.

Already dead and staying dead across the wave: *il museo pubblico più antico del mondo* · *il più
piccolo dei colli di Roma* · *nessun altro luogo a Roma è più centrale, elevato o spettacolare* · *il
più importante monumento al primo re d'Italia* · *the longest-serving town hall still in use* · *il
più antico carcere di Roma* · *il più grande tempio conosciuto dell'antica Roma* · *il rione meno
popolato di Roma* · *il primo museo di architettura antica* · *il più grande complesso termale
esistente al mondo* · *la più grande delle palestre gladiatorie di Roma* · *È il più antico
Battistero monumentale* · *uno dei teatri più noti d'Italia* · *il Teatro di Roma* · *L'ospedale più
antico d'Europa* · *la più interessante strada del rione* · *la più grande area pedonale urbana di
Roma* · *la più antica fontana di Roma ancora funzionante* · *one of the most important squares in
Rome* · *the principal church of the rione* · *casa più piccola di Trastevere* · *one of only two
Rome bridges that do not directly join opposite banks* · *one of the few Renaissance buildings in
Borgo to survive*.

**Permitted, and the distinction is worth stating:** *minor basilica*, *papal basilica*, *cathedral
of Rome*, *national church of the Genoese*, *mother church of the Equestrian Order* — these are
canonical or institutional **ranks and roles**, not comparative claims, and none of them is an
Italian heritage designation. They publish, attributed.

### 7.3 OVERRIDE — no rione may place itself inside the UNESCO property

**Campitelli's verifier ruled** that Campitelli may publish *"Campitelli lies within the UNESCO World
Heritage property Historic Centre of Rome…"* and called it the only heritage-status statement a
Campitelli page may carry.

**Trastevere's verifier ruled the opposite and made it binding for its own rione:** **UNESCO's record
never names Trastevere**, the OSM relation whose geometry covers it is crowd-sourced and does not
close the gap, and drawing the inference in prose *"would be exactly the move Ruling 1 exists to
stop."*

**Trastevere's line wins and applies to all four rioni.** UNESCO's record names **no rione at all**,
so **no wave-1 page may assert that its rione lies within the inscribed property.** What may be
published is (a) the UNESCO record itself — title, ref. 91, the four dates, the criteria, the two
areas, and UNESCO's own brief synthesis in UNESCO's words — and (b) the inclusion of a **specific
named property** where UNESCO or the Holy See names it, which is what makes §5.6's Holy See sentence
publishable. The Urban VIII walls connection is suggestive and suggestive is not sourced.

**Campitelli's author: delete the words "Campitelli lies within" from the sentence your verdict file
hands you.** Everything after them survives.

### 7.4 HARDENED — the Vittoriano's name

Campitelli's verifier ruled that *"Monumento Nazionale a Vittorio Emanuele II"* is the monument's
name and may be used as one. **Upheld, with a restriction the verdict file does not carry:** it may
appear **only as the full proper name of the building**, and **never as a predicate**. "The
Vittoriano is a national monument", "was declared a national monument", "has national-monument
status" and VIVE's own *monumento nazionale* framing are all banned. Name, not category. If in doubt,
call it the Vittoriano and move on.

### 7.5 HARDENED — five smaller places where the verdict files leave room I am closing

1. **Castel Sant'Angelo's construction dates.** Its verifier said the 130–139 AD dating is
   aggregator-only and told the author to *"hedge or omit"*. **Omit.** The museum's own authority
   (`*.cultura.gov.it`) is DNS-unreachable and a hedge on an unreachable primary is still a claim.
   The 966,623 visitor figure stays dropped.
2. **Roma Capitale contradicts itself on the 1527 Sack** — the Castel Sant'Angelo page says
   *"i Lanzichenecchi di **Carlo VIII**"*, the Porta Santo Spirito page correctly says **Carlo V**. A
   writer quoting the castle page will publish a thirty-years-dead king sacking Rome. **Use the Porta
   page's version, and cite the Porta page.**
3. **The mid-fourteenth-century earthquake.** turismoroma says **1348** (Torre delle Milizie),
   the Sovrintendenza says **1349** (Torre dei Conti) — two arms of the same municipality. **No bare
   year.** Write "an earthquake in the mid-fourteenth century", or attribute each year to the arm
   that published it.
4. **`cosmadamiano.com` and `divinamisericordia.it`.** Both finders reported reaching them; both
   verifiers got **406** and **403** respectively. I am not calling either fabricated — content
   negotiation and bot-blocking both explain it — but the corpus has **no second witness to a
   volatile fact class**. **No hours, Mass times or opening information from either domain.** Ship
   the church without hours rather than with hours nobody can re-check.
5. **Hours that were on the page all along.** Santa Maria in Traspontina's hours **were** on the
   `/contatti/` page the finder had already fetched — feriale 9.00–19.00, festiva 9.00 / 10.30 /
   12.30 international Mass / 19.00, Rosary daily 18.15, entrance via della Conciliazione 14, tel.
   06 68806451. **All of it publishes.** A place's own site establishes its hours; the handover item
   asking someone to chase this was chasing something already in hand.

---

## 8. STANDING RULES CARRIED INTO EVERY WAVE-1 DRAFT

1. **`"photos": []` everywhere.** No image sourced, named or linked. Ruling 3 is not partially
   satisfiable. Carry forward to the photo wave: Italy has no freedom of panorama and that must be
   **re-analysed by that wave rather than inherited**; the turismoroma images carry `Ph. Turismo Roma`
   credit lines; and Borgo's copyright analysis of the Piacentini/Spaccarelli street frontage is the
   most useful thing anyone has written for it.
2. **No trip durations.** *"In circa due ore"* (Sovrintendenza, the Forum Pass route) and *"nel giro
   di un minuto"* (VIVE, the Vittoriano lifts) are both dead, and so is every softened restatement.
3. **No vague proximity, including from Roma Capitale.** Dead: *"a due passi dal Colosseo"* (Ai Tre
   Scalini), *"a pochi passi dalla Basilica di San Pietro"* (**turismoroma, about Castel Sant'Angelo —
   Roma Capitale wrote it and it is still barred**), *"subito a fianco della Domus Aurea"*, *"situato
   accanto alla grande Basilica"*, *"la vicina piazza di S. Maria in Trastevere"*, Sant'Egidio "near"
   San Lorenzo in Janiculo, Palazzo Corsini "opposite" Villa Farnesina. **Measured and sourced
   distances are fine** — San Clemente's *"circa 300 metri oltre il Colosseo"* publishes, and the way
   to place Palazzo Corsini against the Farnesina is to give both street numbers (via della Lungara
   10 and 230) and let the reader see it.
4. **No trading durations from the business itself.** *"Risalire almeno al 1895"*, *"Urban Market
   Since 2009"* (which the verifier could not even reproduce on the page), the Farinone foundry's
   *"circa 450 anni"*, and the American Academy's 1909 ownership claim except as attributed to
   it.wikipedia. **"Antica" or "Antico" in a business name is not evidence of age and must never be
   glossed as one** — Antica Trattoria Angelino and Antico Caffè del Teatro Marcello publish as name
   and address only.
5. **Attribute every aggregator.** Write what Roma Capitale or the institution says, or name
   it.wikipedia explicitly. **A wrong attribution is worse than a missing one**, because it launders
   an aggregator claim into an institutional one — Trastevere's verifier found this pattern in two of
   the twelve Sovrintendenza citations it checked, and both would have shipped as fabricated
   institutional citations. Any `[SOV]` tag in that file must be re-verified before use.
6. **Publish no number two sources disagree about.** No Trastevere population (OSM 18,834 vs
   it.wikipedia 12,962, absent from the article itself). No Campitelli population (Annuario 515 vs
   it.wikipedia 516). No Palatine height (51 m in a body, 48.2 in its own infobox). No bare
   earthquake year. Where two framings are both sourced — Ponte Sisto's dates, the Cannone di
   Mezzogiorno's 1846/1847, the Vittoriano's 1885–1905 against 1885–1935 — **publish both, each
   attributed, never merged.**
7. **Fold enclosure contents into the enclosure.** The Forum's ~33 mapped features, the Palatine's
   twelve, the Villa Sciarra fountains OSM names but Roma Capitale does not, the eighteen
   fact-free churches, the 34 edicole sacre, the 22 vanished churches, the 25-street residual list.
   **Counting stones in an archaeological park is not yield.** Campitelli's 118 candidates are
   roughly sixty features inside two ticketed enclosures plus about thirty inhabited entries, and the
   guide is built around the enclosures, not their contents.
8. **Never cite or link these domains:** `teatroeliseo.com` (returns 200 — an Indonesian gambling
   site on a hijacked theatre domain), `scalasanta.com` (HugeDomains parking page), `santapudenziana.org`
   (a different church in Umbria), `nuovosacher.com` (does not resolve), `carceremamertino.it` (does
   not resolve), Vincoli in Rete and the Catalogo generale (unreachable, and unusable even if they
   returned). This is the best work in the Monti file and three of the seven were independently
   re-tested.

---

## 9. TIER

**All four units are GUIDE**, and none of the rulings above threatens that. Campitelli and Monti both
clear the four-place floor by better than an order of magnitude; Trastevere carries more than fifty
survivors with institutional or attributed-aggregator sourcing; Borgo counts thirteen places that are
unambiguously inside it, un-straddled, with a location from Roma Capitale or the institution itself,
and passes forty if well-attributed aggregator sourcing counts.

Two honest cautions to carry into drafting, both from the verifiers and both endorsed:

- **Trastevere is a guide about buildings, water and the Risorgimento.** It is emphatically **not** a
  guide to the Trastevere a visitor pictures — the trattorie, the bakeries, the cinema and the Porta
  Portese market all fell for want of a single fetched fact. **The author must not paper over that
  gap with atmosphere.** The tier ruling is not a licence to.
- **Campitelli is two of the greatest archaeological sites on earth plus a very small inhabited
  quarter of about five hundred people with six or seven cafés.** Write that, and do not let the
  candidate count suggest otherwise.
