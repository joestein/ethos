# Rome wave 2 — ARBITRATION

Units: **Pigna (R. IX) · Parione (R. VI) · Colonna (R. III) · Trevi (R. II)**.
Ruled **2026-09-02** on `pigna|parione|colonna|trevi`-`finder.md` and `-verdicts.md`, all eight read,
plus `priv/seed_data/rome_roster.json` and **`docs/rome/wave1-arbitration.md`, which exists and which
I have read in full.**

**AUTHORS FOLLOW THIS FILE.** Where this file and a verdict file differ, this file wins, without
exception and without argument. **§7 lists every place where I am stricter than a verifier. Read §7
first.** In the Queens wave-6 review every Critical was an author following the looser document.

**Wave 1 binds me.** Its rulings on anything touching Campitelli, Monti, Trastevere or Borgo are
final and I have applied them rather than re-opened them. Its four principles — **P1 containment not
hosting · P2 an institution's own rione statement beats a geometry query · P3 where nothing
establishes containment the place leaves the wave · P4 a rione not in this wave is a real owner** —
are the principles I have ruled by, plus one wave-2 addition:

**P5 — A STREET ADDRESS IS NEVER A RIONE CLAIM.** Four of this wave's boundaries are streets, and
OSM draws a boundary way along one kerb, so the street object lands wholly inside whichever side the
mapper chose. Buildings are assigned by **building footprint**; the street they address from is
assigned separately or not at all. Both Parione's and Colonna's verifiers asked for this rule and
neither could make it. It is now programme-wide.

**P6 — A 100 % vertex score on an object a text source names AS A BOUNDARY is weak evidence.**
Colonna's finder §6.3 established this and its verifier endorsed it; I adopt it. A 100 % score on a
**building footprint** remains strong.

---

## 1. OWNERSHIP TABLE — every place claimed twice, assigned to exactly one

I intersected all four finder files as well as reading them, so this is not limited to what the
verifiers noticed. "OUT" means **no file in this wave writes it** — a real and correct outcome (P3).

| # | Place | Claimed by | **OWNER** | Evidence, and why the loser loses |
|---|---|---|---|---|
| 1 | **Palazzo Venezia** | Pigna #31 (escalated), notionally Campitelli | **PIGNA** | `w140186882` is **35/35 vertices in Pigna, zero Campitelli, zero Trevi**; two it.wikipedia articles place it in Pigna, one in its opening sentence. **Decisive and new: Campitelli's own finder conceded it in writing before any verifier saw the file** — `campitelli-finder.md:133` reads `\| Palazzo Venezia \| Pigna \|`. Wave-1 arbitration never claimed it and its marquee list does not contain it. Pigna's verifier made the grant conditional on the coordinator confirming this; **I am the coordinator on this point and I confirm it. The condition is discharged. Pigna writes it.** |
| 2 | **Basilica di San Marco Evangelista al Campidoglio** | Pigna #20, notionally Campitelli | **PIGNA** | 15/15 Pigna, and `campitelli-finder.md:134` concedes it in the same table: *"The Campitelli churches' parent parish, but not in the rione."* The "al Campidoglio" in the name is a dedication, not a rione. Campitelli's rione description names *via e piazza San Marco* as its **Pigna border** — a boundary, not containment (P1). |
| 3 | **Palazzetto Venezia · Museo Nazionale del Palazzo di Venezia · BiASA** | Pigna | **PIGNA** | Same complex, same evidence (13/13; Piazza Venezia 1; Piazza Venezia 3). The Palazzetto drops as a standalone per Pigna's verifier; the museum and the library publish. |
| 4 | **Piazza Venezia** | Pigna §4.2, Trevi E1, Campitelli (wave 1) | **OUT — NOBODY, IN EITHER WAVE** | Polygon returns three rioni with no majority (Pigna 12 / Campitelli 8 / Trevi 8). Nominatim returns **two different answers on the same OSM way** from two endpoints (Pigna, Trevi). Wave 1 ruled: *"No wave-1 page may state which rione Piazza Venezia is in."* **I extend that verbatim to wave 2. No Pigna, Trevi or Colonna page may state its rione either.** Addresses on it publish as addresses (P5). |
| 5 | **Fontana del Pantheon** and **Obelisco Macuteo** | Colonna §6.2 (declined, recommended to Pigna), Pigna (declined) | **OUT — NEITHER** | **See §7.1. I am stricter than Colonna's verifier here.** |
| 6 | **Piazza della Rotonda** | Colonna §6.4, Pigna §4.4 | **OUT — NEITHER** | Colonna 30 / Pigna 5 and **no Sant'Eustachio vertices at all**, against it.wikipedia citing Roma Capitale's own SISTO street register for a **three-rione** square. The geometry and the only institutional-provenance source disagree about how many rioni are even involved. Both files declined it. Ratified as OUT. Pigna writes the **Pantheon** (38/38); Colonna keeps **Piazza Colonna** and loses nothing. |
| 7 | **Chiesa di Sant'Ignazio di Loyola** (the church) | Pigna #19 | **PIGNA** | `w23840659`, **28/28 Pigna**, uncontested — Colonna's own finder concedes *"the church of Sant'Ignazio is Pigna"*. The site's *"quartiere Campo Marzio"* strapline is the ancient Campus Martius, not R. IV. |
| 8 | **Piazza di Sant'Ignazio** (the square) | Colonna §6.1, Pigna #68 | **COLONNA** | Colonna 79 / Pigna 5 — 94 %, and Raguzzini's square is a designed set-piece that belongs with the fabric it is 94 % inside. **Pigna is barred from it.** But no file fetched a source for the square: it is Colonna's to own and, on today's evidence, **drops for want of a source**. Colonna may re-propose it with one. |
| 9 | **Piazza di San Macuto** | Pigna #66, Colonna §6.1 | **PIGNA** (13 / 5) — and drops, nothing sourced | Neither file has a source. The ownership is settled so it cannot land twice; the record does not publish. |
| 10 | **Chiesa di San Macuto** | Colonna §3.9 | **COLONNA** | Footprint 11/11 Colonna **and Roma Capitale says in words** *"si trova sulla piazza omonima a Roma, nel rione Colonna"* (P2). Roma Capitale's own `POINT` for it tests **Pigna** and is the outlier. **This is the governing precedent for #5 — see §7.1.** |
| 11 | **Palazzo San Macuto** | Pigna #39 | **PIGNA**, and drops | 15/15 Pigna. The Chamber-of-Deputies use is unsourceable (`camera.it/leg19/1120` 404s, re-tested). Nothing left to publish. |
| 12 | **Largo Chigi** | Colonna §6.1, Trevi E6 | **COLONNA** | Colonna 12 / Trevi 3; named in Colonna's own boundary list; Trevi's verifier concedes *"Likely Colonna's."* Nothing sourced attaches to it, so it publishes only as an address. |
| 13 | **Piazza di San Claudio** | Colonna §6.1, Trevi E5 | **OUT — NEITHER** | **Colonna 11 / Trevi 11. Dead even; no tie-break exists in the geometry and no text source was fetched.** P3. The **church** of San Claudio tests wholly Trevi and is Trevi's if Trevi sources it; the square is nobody's. |
| 14 | **Piazza Barberini** | Colonna §6.1, Trevi E4 | **TREVI** | Trevi 12 / Colonna 5 / Ludovisi 2. Colonna's own finder: *"Trevi's on the numbers"*, and Colonna's rione article names the piazza as its **Trevi boundary** — a boundary statement from the losing side (P1). Ludovisi is not in this wave and may claim it later. **Trevi must state the three-rione straddle.** The **Fontana del Tritone** in it tests wholly Trevi on all three methods → Trevi. |
| 15 | **Piazza di San Silvestro** | Colonna §5.3, Trevi D13 | **OUT — NEITHER** | **See §7.4. Stricter than Colonna's verifier.** |
| 16 | **Via del Nazareno · Largo del Nazareno** | Colonna §6.1, Trevi E10 | **OUT — NEITHER** | Trevi 1 / Colonna 2. Slivers on the line, nothing sourced, not places. |
| 17 | **Palazzo del Bufalo alle Fratte** | Trevi §3.16 | **OUT** | Its own it.wikipedia article says *nel rione Trevi*; the geometry says Colonna; neither file holds a second source and neither verifier published it. P3. |
| 18 | **The Aqua Virgo arches at via del Nazareno** | Trevi E7 | **TREVI** | **Roma Capitale states `Rione: II - Trevi` in its own voice** and no source contradicts it. The "source conflict" the finder built §3.10 on **does not exist** — his it.wikipedia caption is a Commons filename (Trevi D3). The Nominatim split across thirty metres is a boundary artefact. P2, cleanly. |
| 19 | **Via del Corso** | all four (Campo Marzio 32 / Trevi 23 / Colonna 21 / Pigna 2) | **OUT — NO RIONE OWNS IT** | Four-way, with the plurality in a rione not in this wave. Buildings fronting it go by **footprint** (P5): Palazzo Doria Pamphilj (83/83), Palazzo De Carolis, Santa Maria in Via Lata → **Pigna**; San Marcello al Corso, Palazzo Mancini → **Trevi**; Palazzo Fiano, Palazzo Ferrajoli, Galleria Alberto Sordi → **Colonna**. An address-to-rione join misfiles all of them. |
| 20 | **Corso Vittorio Emanuele II** | Parione §3.2 (Parione 50 / Ponte 27 / Sant'Eustachio 13 / Pigna 10) | **OUT — NO RIONE OWNS IT** | Same ruling, same reason. Museo Barracco (corso Vittorio Emanuele 166/A), San Pantaleo and Palazzo Massimo alle Colonne publish under **Parione on building footprint**. |
| 21 | **Palazzo Colonna · Galleria Colonna** | Trevi §4.10 | **TREVI** | **Colonna's own finder §2.1 disclaims both in writing: neither is in rione Colonna.** A name trap, ratified so no author restores it from the rione's name. |
| 22 | **Galleria Alberto Sordi (già Galleria Colonna)** | Colonna §3.10, Trevi D13 | **COLONNA** | 76/76 footprint; Trevi dropped it itself. Publish Roma Capitale's current text, **minus** its *"a due passi dalla Fontana di Trevi"* (vague proximity, already killed by Colonna's verifier at §1.9). |
| 23 | **Palazzo del Quirinale** | Trevi E3, Monti (wave 1) | **TREVI** | Wave 1 ruled it out of wave 1 and named the owner: *"Trevi, or unestablished… Trevi is not in this wave."* **Trevi is in this wave.** Both Trevi methods and its verifier's independent lookup return Trevi; Monti's own article claims the Consulta and Sant'Andrea on that square but **not** the palace. **Monti is barred by wave 1 and may never carry it.** |
| 24 | **Piazza del Quirinale** | Trevi E2, Monti (wave 1) | **TREVI, with the straddle stated** | Same wave-1 ruling. it.wikipedia states the Monti/Trevi straddle outright and Trevi's verifier confirmed the sentence and its citation. **Trevi must state it.** The **Fontana dei Dioscuri** (Roma Capitale: `Rione: Trevi`) and the **Obelisco del Quirinale** stand in it and are Trevi's on P2. **Palazzo della Consulta stays OUT** — wave 1 found no method places it, and nothing in wave 2 changes that. |
| 25 | **Le Quattro Fontane** | Trevi R12, Monti (wave 1) | **TREVI** | Wave 1: *"Quattro Fontane is Trevi and stays dropped"*; Monti's own verifier dropped it (PIP Trevi). **Trevi carries the crossroads once and must state that three of the four corner fountains stand on the Monti side, the Diana corner in Trevi.** Roma Capitale states no rione, so that split sentence is the whole of what may be said about unit. |
| 26 | **Resti di Mura Serviane, Largo Magnanapoli** | Trevi E11 | **TREVI** | Clean Trevi on all three methods; **no wave-1 file claims it** (I checked Monti's and Campitelli's verdicts). Largo Magnanapoli is named in both articles as the boundary, so P6 applies — Trevi may state the location and must not build a Monti cross-reference on it. **Do not confuse it with the `node/12701919771` "Resti di Mura Serviane" inside Colonna, which Colonna's verifier correctly dropped as an OSM data defect: the Servian Wall does not run through Colonna.** |
| 27 | **The Trajan's-Forum edge group** — Santa Maria di Loreto, Santissimo Nome di Maria al Foro Traiano, Palazzo Valentini + Domus Romane, Auditoria di Adriano | Trevi E13 | **TREVI, all four** | Trevi's verifier flagged this as *"the highest collision risk in the file after Piazza Venezia and the arbitrator must look for it explicitly."* **I looked. No wave-1 file claims any of the four** — Monti's and Campitelli's verdicts and wave-1 arbitration are silent on all of them. All four test wholly Trevi on three methods. **Binding rider: none of the four may be described as part of, inside, adjoining or a view over Trajan's Forum, Column or Market — those are reserved to wave 1. `addr:street=Foro Traiano` is an address (P5) and nothing more.** |
| 28 | **Piazza della Madonna di Loreto** | Trevi (its own article lists it) | **OUT** | Campitelli's rione description names it as the **Campitelli/Trevi border**; Trevi's article lists it among **Trevi's** piazze. A boundary named by one side and claimed as a place by the other establishes nothing, and it stands against the reserved Column. Santa Maria di Loreto's address may name it. |
| 29 | **Campo de' Fiori** (square, market, Monumento a Giordano Bruno) | Parione #22 | **PARIONE, with the straddle stated in words** | Parione 60 / Regola 40; **it.wikipedia declares the straddle itself** (*"ai confini dei rioni Parione e Regola"*) and both rione categories are on the article. Regola is in neither wave, so no duplicate can arise (P4 cuts this way here). **Ratified — and hardened at §7.5: the straddle sentence is mandatory, not optional.** First entry to re-adjudicate when Regola is scheduled. |
| 30 | **Chiesa Nuova (Santa Maria in Vallicella)** | Parione #33 | **PARIONE, with the straddle stated** | 21/21 Parione by geometry; the source says part of the building falls in Ponte. Publish with the straddle; flag for Ponte's wave. |
| 31 | **Oratorio dei Filippini · Torre dell'Orologio · Archivio Storico Capitolino** | Parione §3.4 | **PARIONE, on building footprint** | The building is `relation/326130`, **46/46 Parione**; the Piazza dell'Orologio it addresses from is **60–74 % Ponte**. This is P5's founding case. The **Casa delle Letterature** in the same building dies regardless — `casadelleletterature.it` is a lapsed domain now serving an affiliate content farm (Parione §2.1). |
| 32 | **Palazzo Capranica** | Colonna §3.8 | **COLONNA** | Roma Capitale states the rione outright — *"all'interno del territorio del rione Colonna"* — and both its addresses test Colonna (P2). The OSM object named "Palazzo Capranica" whose 10 vertices sit in Sant'Eustachio is either a mistag or a second building of the name: **record it as a data defect and cite it for nothing.** |
| 33 | **Orologio di Augusto** | Colonna §5.9 | **COLONNA, with both addresses published** | Roma Capitale publishes **two addresses in two rioni for one buried monument**: Via In Lucina 16/a (Colonna) and Via di Campo Marzio 48 (Campo Marzio). Campo Marzio is not in this wave (P4), so Colonna may carry it — **on condition it states both addresses and says the monument spans the rione line.** It may not claim the Campo Marzio half, and per its own verifier it **must not present the recovered pavement as Augustan.** |

---

## 2. THE MARQUEE RULE — one file each, now and forever

Each appears in **exactly one** seed file across the entire Rome corpus, in any wave, under any name,
at any length. A file that does not own one may name it only where a fetched source forces the name,
and never as an entry of its own.

| Marquee | **OWNER** | Why |
|---|---|---|
| **Pantheon** | **PIGNA** | `r3374342`, **38/38 vertices in Pigna**. Uncontested: all four wave-2 finders' independent sanity checks returned Pigna, and Colonna's finder states *"It is Pigna's, and I do not claim it."* Every fact re-fetched at `pantheonroma.com` by Pigna's verifier. **The square it stands on is not Pigna's and is nobody's (§1 #6).** |
| **Piazza Navona** | **PARIONE** | `way/4247138`, **100 % Parione on 109 vertices**; every other finder's sanity check returned Parione. **And UNESCO's own record names Piazza Navona by name** — the one place-specific UNESCO sentence anybody in this wave found (Parione's verifier caught it; the finder read the page and missed it). |
| **Trevi Fountain** | **TREVI** | **Roma Capitale states `Rione: Trevi`** on its own page (P2), and all three wave-2 cross-checks returned Trevi. Colonna's finder positively confirmed it out of Colonna. Publish R2's visiting régime verbatim — the €2 inner perimeter, the 400-person cap, free after 22:00 — **minus the superlatives (§7.2).** |
| **Quirinal Palace** | **TREVI** | §1 #23. Wave 1 barred Monti and named Trevi; Trevi is now in the wave. The largest object adjudicated in either wave. |
| **Santa Maria sopra Minerva** | **PIGNA** | `w25400176`, 38/38. **The rione rests on the geometry and on nothing else** — the "official site" the finder leaned on is a word-for-word it.wikipedia mirror wearing an official domain (Pigna §2.3). **No page may present the basilica as having attested its own rione**, and *"nelle vicinanze del Pantheon"* is banned vague proximity whoever wrote it. |
| **Sant'Ignazio di Loyola** | **PIGNA** | §1 #7. The church, 28/28. **The piazza is Colonna's and is a different object (§1 #8).** |
| **Largo di Torre Argentina** | **PIGNA — as the AREA SACRA only** | The **archaeological area** `w23955329` is **39/39 Pigna, clean**, with a full Sovrintendenza Capitolina source. **The square** `w125374921` is Pigna 20 / Sant'Eustachio 7 and is **OUT of this wave** (§3), and the **Teatro Argentina standing on it is Sant'Eustachio's and is OUT.** Only vertex testing separates these two objects; a centroid method would have shipped the square as clean Pigna. |
| **Column of Marcus Aurelius** | **COLONNA** | `way/201735339`, 20/20, in the rione's namesake square, with a Roma Capitale page. Uncontested — nobody else's file mentions it as a candidate. |
| **Palazzo della Cancelleria** | **PARIONE** | `relation/1709797`, **31/31**, Nominatim `quarter=Parione`, and the treaty text naming it fetched from the Holy See's own domain. Uncontested. |
| **Palazzo di Propaganda Fide** | **COLONNA** | `relation/37216`, **55/55**, and it.wikipedia twice in its body: *"sito nel rione Colonna con affaccio su piazza di Spagna"* and *"si trova nel rione Colonna."* The **Piazza di Spagna address is a geocoding trap** — Colonna's finder proved a plausible Piazza di Spagna pin returns Campo Marzio. **Publish Roma Capitale's address, Via di Propaganda 1. Never it.wikipedia's "Piazza di Spagna, 48".** |

---

## 3. RULED OUT OF WAVE 2 — belongs to no rione being written now

Not failures, not to be salvaged. **No wave-2 file may carry any of these as a place.**

### 3.1 Owned by a rione not in this wave (P4)
| Place | Owner | Note |
|---|---|---|
| **Santa Maria della Pace** (and Bramante's cloister) | **Ponte** | Three independent methods: 28/28 Ponte, Nominatim Ponte, it.wikipedia *"si trova nell'omonima piazza nel rione Ponte"* — re-fetched and confirmed verbatim by Parione's verifier. The brief listed it as a Parione subject and **the brief is wrong.** Parione has not taken it and must not. |
| **Santa Maria dell'Anima** | **Ponte**, contested | 14/14 Ponte, but Nominatim says Parione. Genuinely contested → OUT on P3 as well as P4. |
| **Teatro Argentina** | Sant'Eustachio | `w125831637`. Goes with the square. |
| **Largo di Torre Argentina** (the square) | shared, Sant'Eustachio party | Pigna 20 / Sant'Eustachio 7; it.wikipedia names *three* rioni. The Area Sacra is separate and clean (§2). |
| **Piazza di Santa Chiara** | Pigna-majority (15/6) but nothing sourced | Ownership settled so it cannot land twice; **drops as a place.** |
| **Piazza di Spagna** | **Campo Marzio** | 83/3, overwhelmingly. **Colonna must not take it**, notwithstanding that Propaganda Fide fronts it. |
| **Piazza di San Lorenzo in Lucina** | **Campo Marzio** (15/9) | Palazzo Fiano is addressed to it, is not a straddler, and stays Colonna's (P5). |
| **Piazza della Maddalena** | **Sant'Eustachio** (8/6) | The church of Santa Maria Maddalena stays Colonna's on its footprint. |
| **Piazza del Fico** (Ponte 60), **Piazza di Tor Sanguigna** (Ponte 52), **Piazza dell'Orologio** (Ponte 60–74), **Via del Governo Vecchio** (Ponte 54), **Via dei Banchi Vecchi** (Ponte 76), **Largo dei Chiavari** (Sant'Eustachio 62) | Ponte / Sant'Eustachio | **Parione may not claim addresses on Via del Governo Vecchio** while it is Ponte's — which kills Il Baffetto and Frigidarium a second time. |
| **Via dei Balestrari** | Regola 50 / Parione 50 | Dead even. OUT. |
| **Santa Susanna alle Terme di Diocleziano** | Castro Pretorio / Sallustiano | Trevi's D1 — the finder's one confirmed misassignment. An independent endpoint returns Castro Pretorio. Neither unit is in this wave. |
| **Via Rasella** | — | Trevi D18, upheld. |
| **Barberini metro station** | Trevi's, if anyone's | Colonna dropped it correctly; **no metro station lies inside Colonna.** Not in Trevi's surviving twenty either. |

### 3.2 Unestablished — nothing we hold establishes containment (P3)
- **Piazza Venezia** (§1 #4) · **Fontana del Pantheon** and **Obelisco Macuteo** (§7.1) ·
  **Piazza della Rotonda** (§1 #6) · **Piazza di San Claudio** (§1 #13) ·
  **Piazza di San Silvestro** (§7.4) · **Palazzo del Bufalo alle Fratte** (§1 #17) ·
  **Piazza della Madonna di Loreto** (§1 #28) · **Palazzo della Consulta** (wave 1, upheld).
- **Via del Corso**, **Corso Vittorio Emanuele II** — shared edges owned by no rione (§1 #19, #20).
- **Via Frattina** (it.wikipedia: shared Colonna/Campo Marzio; geometry 9/9 Colonna) and
  **Via del Seminario** (named as the Colonna/Pigna border; geometry 9/9 Pigna): **P6 cases. OUT as
  places**, usable as addresses.
- **Fontana della Terrina** — may now stand in Piazza dell'Orologio, carries both rione categories,
  needs a physical check. Parione's verifier's suspension is upheld.
- **Palazzo Bonaparte** — **see §7.6. Stricter than Pigna's verifier.**

### 3.3 Falling through the gap between waves — for the coordinator, not for salvage
**Santa Maria della Pace, Santa Maria dell'Anima and Bramante's cloister** — two major Baroque
churches and a Bramante cloister — now belong to **Ponte, which is in neither wave and is not
scheduled.** Parione's finder and verifier both flagged this and both were right to refuse them.
**Ponte and Sant'Eustachio need scheduling**; between them they hold the Teatro Argentina, the north
half of Piazza della Rotonda's three-rione junction, and the Pace/Anima group. **This is the single
biggest coverage hole either wave has produced.** It is not fixed by forcing anything into Parione.

---

## 4. THE WAVE-1 RESERVATION — confirmed clean

**I checked all eight wave-2 files against all eighteen reserved places. Nothing reserved has been
taken.** Positively confirmed out by wave-2 geometry, and not claimed: Vittoriano/Altare della Patria
(→ Campitelli), Santa Maria in Aracoeli, Capitoline Museums and Piazza del Campidoglio, Roman Forum
(→ Campitelli), Trajan's Forum, Column and Market and the Imperial Fora (→ Monti), Colosseum
(→ Celio), San Pietro in Vincoli, Santa Maria Maggiore, Castel Sant'Angelo, the Passetto, Santo
Spirito in Sassia, Via della Conciliazione, Santa Maria in Trastevere, Santa Cecilia, Villa
Farnesina, Theatre of Marcellus.

**No agent argued that a reserved place belongs to a wave-2 rione. There is no argument to refer.**
Pigna's finder states it explicitly; Trevi's verifier enumerated all eighteen and found none.

Four residues, all handled:
1. **Piazza Venezia** is not itself reserved but the reserved Vittoriano stands on it. Ruled OUT in
   both waves (§1 #4). Pigna and Trevi both declined it unprompted; both were right.
2. **The Trajan's-Forum edge group** abuts reserved ground and is Trevi's, under the binding rider at
   §1 #27. This was the collision Trevi's verifier told me to hunt for, and it is not a collision.
3. **Basilica di San Marco's spolia sentence** — Pigna's verifier already cut *"travertine taken from
   the Colosseum and the Theatre of Marcellus"*. **Upheld and hardened: it is not merely unnecessary,
   it is a cross-reference to two reserved places built out of an aggregator and it stays cut.**
4. **Farnesina ai Baullari / Palazzetto Le Roy** (Parione) is **not** the reserved Villa Farnesina.
   Parione's finder caught the name collision and its verifier told the author to carry the warning
   into the seed file. **Do so.** A later editor will otherwise "fix" it into the reserved name.

---

## 5. THE EXTRATERRITORIAL PROPERTIES

**First, a correction to my own brief.** The brief says three rioni hold one and names *"Palazzo
Maffei and the Vicariato in Pigna"* as two. **They are one building** — Art. 15's *"il Palazzo Maffei
o del Vicariato"* is Palazzo Maffei Marescotti, on the corner of via dei Cestari and via della Pigna,
29/29 in Pigna. And **the count is four rioni, not three: Trevi holds the Palazzo della Dataria**,
which Art. 15 names in terms. The brief's expectation that Trevi holds none is wrong, Trevi's finder
proved it from the treaty text, and its verifier called it the best work in the file.

| Property | Rione | Status, as it may be stated |
|---|---|---|
| **Palazzo della Cancelleria** | Parione | Art. 15, from the Holy See's own copy of the treaty text. 31/31. |
| **Palazzo di Propaganda Fide** | Colonna | Named on vatican.va's current list, entry 5 of 13. 55/55. |
| **Palazzo Maffei Marescotti** | Pigna | **Named on vatican.va's list as item 9 — and NO article number and NO date (§5.2).** |
| **Palazzo della Dataria** | Trevi | Art. 15 names it. **Present status unestablished (§5.3).** |

### 5.1 The status sentence — every wave-2 draft uses this shape
> The palazzo stands in [rione], on Italian soil. Article 15 of the Lateran Treaty of 11 February
> 1929 provides that this building, «benché facenti parte del territorio dello Stato italiano» —
> although forming part of the territory of the Italian State — enjoys the immunities that
> international law recognises for the seats of the diplomatic agents of foreign States. It is not
> part of Vatican City, it is not Vatican territory, it is not a border, and a visitor there is
> subject to Italian law.

**Confirmed compliant.** Parione §4.1, Colonna §3.7 and Trevi's PUBLISH #29 all already say this, in
these terms, and all three verifiers checked it. **Colonna's verifier's wording is adopted unchanged.
Not one wave-2 file describes an extraterritorial property as Vatican territory.**

**Binding riders.**
- **Never "in the Vatican", never "Vatican territory", never a border.** Art. 15 says the opposite in
  its own words and that is the sentence to carry.
- **Do NOT copy it.wikipedia's Propaganda Fide lead**, *"è uno dei possedimenti extraterritoriali
  della Santa Sede ed è esente da espropriazioni e tributi"* — it runs Art. 15 and Art. 16 into one
  sentence. **Do NOT copy its infobox `paese2 = VAT`**, which files the building under a second
  country. Both confirmed present by Colonna's verifier.
- **Vatican City itself belongs to no rione** and none of these four rioni touches it. No wave-2 file
  claims St Peter's, the Square, the Museums or the Sistine Chapel. Confirmed clean.
- **Fontana della Pigna, Piazza San Marco:** the *fountain* is a Pigna place. The **ancient bronze
  pine cone now in the Vatican's Cortile della Pigna is NOT**, and the sentence explaining the
  fountain must not read as though Pigna reaches into the Vatican.

### 5.2 The Art. 15 / Art. 16 conflation — the rule, stated once
**The brief's phrasing ("Art. 16 covers a DIFFERENT list") is a useful warning but is not what the
treaty says, and two verifiers caught it independently.** Art. 16 opens *"Gli immobili indicati nei
tre articoli precedenti, **nonché** quelli adibiti a sedi dei seguenti istituti pontifici…"* — it
covers the Art. 13–15 properties **as well as** a further institute list. So:

- **BANNED: "the Cancelleria is Art. 15, not Art. 16."** Parione's finder wrote it; its verifier
  corrected it; Trevi's R6 corroborates from the same text. It is false and no draft may carry it.
- **The correct statement:** *Art. 16 adds a further list of properties that receive only the tax and
  encumbrance exemption, and those are not extraterritorial.* That is what Ruling 2 actually guards.
- **The Art. 16-only properties in this wave are the Università Gregoriana and the Istituto Biblico,
  both in Trevi.** Neither is extraterritorial, neither is in Vatican City, and any sentence calling
  them so is wrong on the face of the treaty, not merely unsourced.
- **There is a THIRD tier and Trevi holds it too:** Art. 14's third *alinea* transfers the
  ex-conventual buildings annexed to the **Basilica dei Santi XII Apostoli**. Art. 15 reaches only
  *"gli immobili indicati nell'art. 13 e negli alinea primo e secondo dell'art. 14"* — **the Santi
  XII Apostoli buildings are therefore outside Art. 15.** Trevi's finder established this from the
  text and it is correct. Do not promote them.
- **`VINCOLI` — the highest-risk word in the wave.** Art. 16's operative verb is *«non saranno mai
  assoggettati a vincoli»*, where *vincoli* means **civil encumbrances**, not heritage protection.
  Wave 1 ruled the word out of published prose across its four files; **I extend that to wave 2, and
  I extend it to every English rendering.** Never "protection", "listing", "constraint", "designated"
  or "vincolo". If Art. 16 must be paraphrased at all, say **"encumbrances"** and nothing else.
  Quoting the treaty is the single easiest way to breach Ruling 1 while holding a primary source.
- **San Lorenzo in Damaso does NOT inherit the Cancelleria's status.** Parione's finder asked and
  nobody answered; **I answer.** The basilica is incorporated into the palazzo, but nothing we hold
  says the Art. 15 grant extends to it. **It publishes as a basilica, with no status claim of any
  kind** — the same shape as wave 1's ruling on the Cappella di San Francesco Borgia and the Palazzo
  delle Sacre Congregazioni.

### 5.3 Palazzo Maffei Marescotti — Pigna's stricter rule stands, and I extend it
Pigna's verifier fetched the Holy See's own list (`vatican.va/…/extraterritoriale_it.html`, stamped
*Aggiornamento 03.04.2001*) and found item 9: *"il Palazzo Maffei o del Vicariato (già sede della
Curia diocesana di Roma, che vi ha tuttora alcuni uffici)."* Three consequences, all upheld:

1. **The grant still attaches.** The list is prefaced *"i beni extraterritoriali della Santa Sede in
   Roma sono attualmente"*. The finder's open question is closed in the finder's favour.
2. **But the article number is NOT sourced for this building.** The same preface says the list takes
   account of later agreements, not only 1929. **No Pigna page may cite Art. 15 for Palazzo Maffei,
   or give 1929, or give April 2014. Cite vatican.va's list and stop.** This is the one property in
   the wave that does **not** use §5.1's sentence.
3. **The Vicariate has not gone — it is no longer the seat.** Pigna's finder over-corrected
   ("wrong by sixty-two years"); the Holy See says the diocesan Curia still has offices there. The
   accurate statement is *no longer the seat*. **No present-tense claim that the Vicariate is seated
   here, and no claim that it has left entirely.**
4. **Not extraterritorial, and must not be implied to be:** the **Pontificia Accademia Ecclesiastica**
   (Piazza della Minerva 74, in Palazzo Severoli), the **Pontificio Seminario Francese**, the
   **Camere di Sant'Ignazio**. Pigna's verifier confirmed all three absent from vatican.va's list.

### 5.4 Palazzo della Dataria — a cross-file finding neither verifier could see
Trevi's R5 rules the Dataria's present status *"not established by any source we could reach"*, on an
article that calls the palace an appurtenance of the Italian presidential palace **and** reports a
1973 sale to ANSA sourced to a personal website. **I am the only reader who has seen that Pigna's
finder, working the same vatican.va list, recorded that the Dataria is no longer Holy See property
and was swapped for the Palazzo Pio in 1979.** That is a lead, not a verified fact — Pigna's verifier
fetched the list for item 9 and did not report on the Dataria.

**Ruling: Trevi publishes R5's replacement text unchanged and adds nothing.** It states what Art. 15
says and states plainly that the present status is unresolved. **No draft may say the Dataria "is"
extraterritorial in the present tense.** The coordinator should re-read vatican.va's list for the
Dataria before this record ships; if it is absent, Trevi's entry becomes a purely historical one.

---

## 6. DESIGNATION CLAIMS — Ruling 1

**I swept all eight wave-2 files for every banned term in both languages: `vincolo`/`vincolato`,
`dichiarazione di interesse culturale`, `bene culturale tutelato`, "listed", "scheduled",
"designated", "declared a monument", "national monument", "protected monument", "heritage-listed",
"under state protection".**

**Nothing survived a verifier. There is no designation claim to kill.** Every hit is a file declaring
its own compliance, a reachability log for `vincoliinrete.beniculturali.it` (still timing out from
this network in both Parione's and Trevi's re-tests, so Ruling 1's factual basis is re-confirmed
today), or a verifier warning about the treaty's `vincoli` (§5.2). Ruling 1 compliance across all
four rioni is clean, and Colonna's and Parione's verifiers each state it in terms.

**Two quarantines that must hold.**
1. **Parione §8.1 — twenty Parione entities carry Wikidata P1435 "Italian national heritage".**
   The finder quarantined all twenty and refused Q43113623 "part of UNESCO World Heritage Site"
   per-building. **Quarantine upheld. Not one word of it ships**, and Wikidata is not a route around
   Ruling 1 merely because it is machine-readable.
2. **The quarantine sections themselves are the highest-risk text in the wave**, because they contain
   the banned sentences in quotable form. Wave 1 made this a standing instruction and **I repeat it:
   nothing from a finder's quarantine section may be transcribed into a draft.**

**UNESCO — what publishes.** The record itself: *Historic Centre of Rome, the Properties of the Holy
See in that City Enjoying Extraterritorial Rights and San Paolo Fuori le Mura*, **ref. 91**, inscribed
**1980**, significant boundary modification **1990**, minor modifications **2015** and **2023**,
criteria **(i)(ii)(iii)(iv)(vi)**, property **1,469.7 ha**. Parione's finder and verifier both
fetched and confirmed this verbatim.

**Wave 1 §7.3 binds wave 2: no rione may assert that it lies within the inscribed property.** UNESCO's
record names no rione. What may be published is the record itself and **the inclusion of a
specifically named property where UNESCO names it** — which is exactly why **Parione may write that
UNESCO names Piazza Navona**, and why **no file may write that the Cancelleria is a named UNESCO
component**, since the page does not name it (the finder checked and was right).

---

## 7. WHERE I AM STRICTER THAN A VERIFIER — READ THIS SECTION TWICE

**Every item below is something a verdict file permits and I am forbidding. Authors follow this
section, not the verdict file.**

### 7.1 OVERRIDE — the Fontana del Pantheon and the Obelisco Macuteo leave the wave entirely
**Colonna's verifier ruled:** *"I agree with the finder's recommendation: they go to Pigna, with the
Pantheon."* **Pigna's verifier ruled the opposite:** *"The fountain and the Macuteo obelisk in front
of the Pantheon must not appear on a Pigna page."* Neither file took them. **I rule them OUT: neither
Pigna nor Colonna writes them, and no page states their rione.**

The evidence is a genuine two-source conflict and it does not resolve:
- **OSM footprints put both cleanly in Colonna** — the fountain `relation/1737642` at **54/54**, the
  obelisk `way/128740184` at 5/5. Under P6 these are monument footprints, not boundary artefacts, so
  they are strong evidence.
- **Roma Capitale's own pages for both carry `POINT (12.476993 41.898996)`, which tests Pigna.**
- **But that pin is a demonstrated-unreliable witness.** On the one object in this wave where Roma
  Capitale's pin can be tested against Roma Capitale's own prose — the **Chiesa di San Macuto**, §1
  #10 — the prose says *"nel rione Colonna"*, the footprint says 11/11 Colonna, and **the pin says
  Pigna and is wrong.** A witness class that fails its only available control cannot outweigh 54/54.
- **And a 54/54 Colonna score cannot found a Colonna record either**, because the object stands
  inside Piazza della Rotonda, which every text source calls a three-rione junction and which is
  itself ruled unestablished (§1 #6). The third party, Sant'Eustachio, is not in this wave to argue.

This is the **Arco di Costantino** shape wave 1 ruled OUT, and I rule it the same way. Ruling 1's
parent logic applies: excluded for want of provenance, not for being false.

**The resolution path exists and nobody walked it.** Parione's verifier discovered that Sovrintendenza
Capitolina's per-place pages carry a **`Rione:` field** — Roma Capitale's own rione attribution, in
its own voice, better than any polygon — and Trevi's verifier used exactly that field to settle the
Acquedotto Vergine (`Rione: II - Trevi`) and the Fontana dei Dioscuri (`Rione: Trevi`). **Nobody
checked the Sovrintendenza fountain pages for the Fontana del Pantheon.** Fetch that field and this
ruling reverses in one query. Until then: out.

### 7.2 OVERRIDE — three institutional superlatives that survived their verifiers, killed here
Wave 1 §7.2 made this the programme's line and it is not negotiable: **no superlative and no
"first / oldest / largest / only / most" claim publishes, from any source — Roma Capitale, the Holy
See, an operator or an aggregator — in any form, including attributed.** Roma Capitale is the owner
and operator of these fountains and aqueducts; it is the business talking about itself.

Three got through wave 2, all in the *permitted* column of a verdict file:

1. **❌ TREVI, PUBLISH item 9 — the Acqua Vergine.** *"Roma Capitale: it is **the only one** of the
   eleven principal aqueducts of ancient Rome to have remained continuously in operation to the
   present day."* This is on Trevi's **✔ PUBLISH** list. It is an "only" claim about an aqueduct Roma
   Capitale itself operates. **Cut the clause.** Everything after it — that it feeds the monumental
   fountains of the Baroque city, among them the Fontana di Trevi, which is its terminal *mostra* —
   survives intact and is the better sentence anyway.
2. **❌ PARIONE, candidate 26 — the Theatre of Pompey.** Parione's verifier permitted *"it.wikipedia
   describes the Theatre of Pompey as **the first theatre in Rome built in masonry**"* on the ground
   that it is attributed. **Attribution does not save a priority claim.** Cut it. The rest of the
   replacement text — the *theatrum marmoreum*, the rione, and the cavea surviving in the line of the
   houses along Via di Grotta Pinta — publishes, and the cavea is the fact worth having.
3. **❌ COLONNA, §3.8 — Palazzo Capranica.** Its verifier permitted *"Roma Capitale describes it as
   the city's **only example** of the Capitoline Romanesque style"*, "never in the corpus's own
   voice". **Cut it entirely.** Same shape, same owner-operator, same ban. The 1451 portal
   inscription, Cardinal Domenico Capranica, the 1457 college, the corner tower and loggia, the two
   marble portals and the Gothic and Renaissance windows are all untouched and are plenty.

Already dead and staying dead in wave 2: *la più grande e la prima completamente nuova costruita a
Roma fin dal Sacco del 1527* (the Gesù, its own site) · *la più antica colonia felina della città* ·
*Rome's most celebrated statua parlante* · *the most significant institution for the social history
and artistic activity of Rome* · *one of the best-preserved examples of historic popular building
fabric in the centre* · *la più grande fontana barocca di Roma e una delle fontane più famose al
mondo* · every *negozio storico* / "historic" / "oldest" / "trading since" claim.

### 7.3 OVERRIDE — vague proximity, including Roma Capitale's own
Wave 1 §8.3 is carried in. Dead in wave 2, and two of these sit inside otherwise-good sources an
author will mine: **❌** *"a due passi dalla Fontana di Trevi"* (Roma Capitale, Galleria Alberto
Sordi) · **❌** *"Situata tra piazza di Spagna e Fontana di Trevi"* (Roma Capitale, Sant'Andrea delle
Fratte) · **❌** *"non lontano da Palazzo Montecitorio"* (San Lorenzo in Lucina) · **❌** *"molto
vicina alla Fontana di Trevi"* (Galleria Sciarra) · **❌** *"nelle vicinanze del Pantheon"* (Santa
Maria sopra Minerva) · **❌** *"near the poet's birthplace"* and *"vicino a Campo de' Fiori"*
(Parione, which **survived the finder's own §8.3 clean-sweep declaration** — do not trust that
section as a guarantee). **Measured, sourced distances are fine. Impressions are not. No trip
durations anywhere.**

### 7.4 OVERRIDE — Piazza di San Silvestro leaves the wave
**Colonna's verifier escalated it as "sharper than the finder had it"; Trevi dropped it at D13.**
Neither ruled it out. **I rule it OUT, and I forbid both files from stating its rione.** Three
readings give three answers: it.wikipedia's **body** says *"nei rioni Trevi e Colonna"* citing
Rendina-Paradisi; its **infobox** says `circoscrizione = Rione II`, Trevi alone; **OSM says 50/50
Colonna with no Trevi vertices at all.** P3. Palazzo Marignoli and the Palazzo delle Poste are
addressed to it and publish under Colonna on their footprints (P5), **with no sentence about the
square's rione.**

### 7.5 HARDENED — Campo de' Fiori's straddle sentence is mandatory
Parione's verifier permits Parione to publish it "with the straddle stated". **I am making the
straddle sentence a condition of publication, not a recommendation.** Parione 60 / Regola 40, with
two OSM objects giving different answers and the source declaring the boundary itself. The entry
**must** say that Campo de' Fiori lies on the boundary of Parione and Regola. The market and the
Monumento a Giordano Bruno publish under Parione within that frame; **neither may be described as
wholly Parione's.** Same condition, same wording discipline, for **Chiesa Nuova** (part in Ponte).

### 7.6 HARDENED — Palazzo Bonaparte drops
Pigna's verifier ruled **R** with a condition: *"the finder tested a point node, not the building
footprint… If the footprint has not been tested before drafting, drop this rather than guess."*
**The footprint has not been tested, and the palazzo fronts Piazza Venezia, which I have just ruled
unestablished in both waves.** A conditional in a verdict file is exactly the document an author
follows loosely. **I am converting it: Palazzo Bonaparte is OUT of wave 2.** Re-propose it when
someone tests the building footprint.

### 7.7 HARDENED — four smaller places where the verdict files leave room I am closing
1. **The BiASA closure claim.** Pigna's finder asserted in bold that VIVE announced the Palazzo
   Venezia site closing **7 September 2026**. Its verifier enumerated every "BIASA" occurrence on
   VIVE's news index and found **the opposite** — a *reopening* on 28 April 2025 — with the "7
   settembre" string belonging to an unrelated Altare della Patria item. **No page may say the
   Palazzo Venezia site of the BiASA is closing.** This is the most dangerous single error either
   wave produced and it must not be reconstructed from the finder file.
2. **`casanatense.it` and `casadelleletterature.it` are both lapsed institutional domains now serving
   affiliate content farms** — a casino affiliate and a content farm respectively, found independently
   by Pigna's and Parione's finders. **Neither may be cited for anything. The Biblioteca Casanatense
   and the Casa delle Letterature both drop.** **Programme-level instruction: sweep every collected
   source URL in every wave for this pattern before anything ships.** A lapsed heritage domain still
   looks correct in a bibliography and passes any check that does not fetch.
3. **Roma Capitale's `POINT` fields are not rione evidence.** §7.1 and §1 #10. Use the prose, the
   Sovrintendenza `Rione:` field, or a building footprint. **Never the pin alone.**
4. **it.wikipedia infoboxes are not rione evidence either.** The Piazza Sant'Ignazio infobox says
   `quartiere = Rione Campo Marzio`, which is simply wrong; the Piazza di San Silvestro infobox
   contradicts its own body; the Propaganda Fide infobox files the building under a second country.
   **Prose leads and category tags have held; infoboxes have not.**

---

## 8. STANDING RULES CARRIED INTO EVERY WAVE-2 DRAFT

1. **`"photos": []` everywhere.** Ruling 3 is not partially satisfiable. **All four files are clean:**
   no image is named, sourced or linked in any of the eight documents. Photo leads are quarantined in
   the finder files and stay there — the Sovrintendenza's image-licensing route and VIVE's three
   policy pages are for the photo wave, which must re-analyse Italy's lack of freedom of panorama
   rather than inherit anyone's assumption about it.
2. **No trip durations. No vague proximity (§7.3). No superlatives (§7.2). No designation claims (§6).**
3. **No trading durations from a business's own name or site.** *"Ditta G. Poggi – Belle Arti dal
   1825"* prints as a **name**; it does not establish that the shop has traded since 1825. *"Cartoleria
   Pantheon dal 1910"* likewise. Gammarelli makes **no** papal-tailor claim on its own page and the
   corpus makes none for it.
4. **Attribute aggregators by name.** Write what Roma Capitale, the Sovrintendenza, VIVE, the Holy See
   or the institution says. "it.wikipedia records that…" is the required form, and it does not launder
   a superlative or a priority claim.
5. **Every factual claim needs a source someone actually fetched.** Two-thirds of Pigna's candidates,
   five-sixths of Trevi's and all of Parione's §6.5 died on this rule. That is the confirmation-rate
   signal working as intended, not a shortfall.
6. **Where two Roma Capitale arms disagree, publish no bare figure.** In this wave: the Minerva
   obelisk's date (it.wikipedia 4th c. BC vs turismoroma VI sec. a.C. — **drop the date**), the Trevi
   competition (Roma Capitale 1732 vs it.wikipedia 1731 — **attribute both**), the Tempio del Sole
   (273 vs 275 — **publish neither**), the Galleria renaming (2003 vs 2009 — **publish neither**),
   the Cappella dei Re Magi (1662–64 vs 1666 — **publish no year**).

---

## 9. TIER

All four verifiers ruled **GUIDE** and all four hold after this arbitration.

- **Pigna** — 21 PUBLISH / 22 REWRITE. Loses nothing material here: it keeps the Pantheon, the Area
  Sacra with its temples and the Torre del Papito, the Gesù, Sant'Ignazio, the Minerva, Doria
  Pamphilj, the Collegio Romano, **and gains Palazzo Venezia and San Marco unconditionally.**
- **Parione** — 14 PUBLISH / 21 REWRITE. Keeps Piazza Navona, the Cancelleria, Pasquino, Palazzo
  Braschi and the Museo di Roma, Campo de' Fiori with its straddle. Loses the Pace/Anima group, which
  was never its to lose.
- **Colonna** — 21 survivors. Loses the Fontana del Pantheon and the Macuteo obelisk (which it had
  already declined), Piazza di San Silvestro and Piazza di Spagna. Keeps the column, Piazza Colonna,
  Chigi, Montecitorio, Propaganda Fide, the Galleria Alberto Sordi, Capranica, San Macuto and the
  Orologio di Augusto. Clears the threshold more than fivefold.
- **Trevi** — 20 survivors, and it **gains** the Quirinal palace and square, Le Quattro Fontane,
  Piazza Barberini and the four-strong Trajan's-Forum edge group by ruling. Its verifier's own test
  holds: strike every escalated straddler and Trevi still stands at about sixteen.

No tier in this wave depends on a contested object, which is the property a tier ruling should have.

---

## 10. FOR THE COORDINATOR

1. **Schedule Ponte and Sant'Eustachio.** §3.3. They hold Santa Maria della Pace, Santa Maria
   dell'Anima, Bramante's cloister and the Teatro Argentina, and their absence is why three squares
   in this wave could not be adjudicated at all.
2. **Fetch the Sovrintendenza `Rione:` field for the Fontana del Pantheon and the Obelisco Macuteo.**
   One query reverses §7.1. It is the highest-value single fetch outstanding in the programme, and
   the field was discovered too late for three of the four finders to use it.
3. **Re-read vatican.va's extraterritorial list for the Palazzo della Dataria.** §5.4.
4. **Sweep every collected source URL in every wave for lapsed-domain hijacks.** §7.7.2. Two were
   found by accident in this wave alone.
5. **The Roma Capitale SITOWPS / SISTO street register** is the per-street rione source this
   programme lacks and would settle Piazza della Rotonda, Piazza Venezia and Piazza di San Silvestro
   at a stroke. `comune.roma.it` is unreachable and its archived snapshot returns a zero-byte body.
   **Worth one attempt from another network before wave 3.**
6. **`turismoroma.it/it/search/node?keys=` is enumerable.** Colonna's verifier found five major
   institutional pages the finder had declared non-existent. Every rione file in the programme should
   be re-swept through it before publication.
