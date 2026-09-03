# Colonna (R. III, code 103) — VERIFIER file

Adjudication of `docs/rome/colonna-finder.md`. Verified **2026-09-02**.
Every source below was **re-fetched by me** with `python3` + `urllib` and an explicit User-Agent.
I did not accept any claim on the finder's report of a fetch.

**Headline: the finder's method is sound and its rione geometry holds up, but it under-fetched
Roma Capitale and over-trusted OSM address tags and it.wikipedia dates. Four substantive factual
errors, one fabricated attribution, and three "unfinished work" gaps that were not gaps at all.**

---

## 0. Summary

| | |
|---|---|
| **PUBLISH** (claim stands as written) | **34** |
| **REWRITE** (fact sound, wording or sourcing overreaches — exact replacement given) | **21** |
| **DROP** | **29** |
| **TIER RULING** | **GUIDE** — 21 places survive with an institutional source and a confirmed rione. Not close to town-page. |
| Straddlers escalated to the arbitrator | **9** |

### Sources I re-fetched (all 200 unless noted)

1. `turismoroma.it/it/luoghi/piazza-colonna` — 200
2. `turismoroma.it/it/luoghi/palazzo-chigi` — 200
3. `turismoroma.it/it/luoghi/palazzo-wedekind` — 200
4. `turismoroma.it/it/luoghi/palazzo-capranica` — 200
5. `turismoroma.it/it/luoghi/chiesa-di-san-macuto` — 200
6. `sovraintendenzaroma.it/…/fontane/fontana_in_piazza_colonna` — 200
7. `vatican.va/…/extraterritoriale_it.html` — 200
8. `turismoroma.it/it/luoghi/orologio-di-augusto`, `…/teatro-sistina`, `…/palazzo-fiano`,
   `…/palazzo-ferrajoli`, `…/basilica-di-santandrea-delle-fratte`, `…/teatro-sala-umberto`,
   `…/fontana-del-pantheon`, `…/obelisco-macuteo` — all 200
9. `sovraintendenzaroma.it/…/musei/musei_in_comune/galleria_d_arte_moderna` — 200
10. `galleriaartemodernaroma.it` — 200
11. it.wikipedia `action=parse&prop=wikitext` — *Galleria Alberto Sordi*, *Piazza di San Silvestro*,
    *Via Frattina*, *Colonna (rione di Roma)*, *Palazzo di Propaganda Fide*, *Cappella dei Re Magi*
12. **Newly found by me, declared missing or non-existent by the finder** —
    `turismoroma.it/it/luoghi/palazzo-della-congregazione-di-propaganda-fide`,
    `…/palazzo-di-montecitorio`, `…/piazza-di-monte-citorio`,
    `…/colonna-di-marco-aurelio-antonina`, `…/obelisco-campense-monte-citorio`,
    `…/galleria-alberto-sordi-già-galleria-colonna` — all 200

**No source the finder leaned on failed to say what was claimed, with one exception: §1.1 below.**

---

## 1. Findings against the finder

### 1.1 FABRICATED ATTRIBUTION — Piazza Colonna, "laid out under Sixtus V". **DROP.**

The finder wrote, citing `turismoroma.it/it/luoghi/piazza-colonna`:

> "laid out toward the end of the 16th century under Sixtus V"

**That sentence is not on that page.** I fetched the page and searched the full de-tagged text for
`Sisto`, `XVI` and `delimitata`. The page's entire opening is:

> "Centro degli affari e della vita politica della città, Piazza Colonna è delimitata da illustri
> palazzi quali: Palazzo Chigi … Palazzo Ferrajoli, già Del Bufalo, Aldobrandini e Niccolini.
> Alla sua destra, la piccola Chiesa dei Santi Bartolomeo e Alessandro dei Bergamaschi … di fronte
> Palazzo Wedekind … e alle spalle il palazzo della Galleria Colonna, oggi nota come Galleria
> Alberto Sordi."

There is no Sixtus V, no 16th century, and no statement about when the piazza was laid out.
**The claim is unsourced. It does not publish.** Everything else the finder took from this page
is confirmed verbatim.

### 1.2 Palazzo Chigi is not at Piazza Colonna 1. **REWRITE.**

The finder took the address from the OSM object's `addr` tags. Roma Capitale's own page gives
**Piazza Colonna, 370**, with `POINT (12.479895 41.901102)`. The institution beats the OSM tag.

### 1.3 Montecitorio did not become the Chamber's seat in 1918. **DROP.**

The finder, from the it.wikipedia rione article, wrote that Montecitorio "became the Chamber's seat
in **1918**". Roma Capitale's own page for Piazza di Monte Citorio says:

> "Il pontefice decise di fare del palazzo la sede della Curia Innocenziana – i tribunali pontifici -
> inaugurata nel 1696. Il palazzo ospitò poi il Governatorato di Roma e la direzione di polizia …
> **Dal 1871, dopo l'unità d'Italia, è sede della Camera dei deputati.**"

**1871, not 1918.** 1918 is when Ernesto Basile's new hemicycle chamber opened, which is a different
fact. Publishing "the Chamber moved in in 1918" would be wrong.

### 1.4 The Montecitorio obelisk is not 30 m tall. **DROP the figure.**

The finder, from it.wikipedia, wrote "**30 m tall**". Roma Capitale's dedicated page
(`obelisco-campense-monte-citorio`) states:

> "Realizzato in granito rosso, ha un'altezza di **21,79 metri**, **33,97 metri** con il basamento
> e il globo."

Neither number is 30. The finder's figure matches nothing and must not ship.

### 1.5 Three declared "gaps" and one declared "unfinished work" were not gaps.

- **"Roma Capitale does not publish a page for [Propaganda Fide]"** (§4) — it does:
  `turismoroma.it/it/luoghi/palazzo-della-congregazione-di-propaganda-fide`. It supplies the street
  number the finder asked a verifier to find: **Via di Propaganda, 1**.
- **"camera.it … I failed to find its Montecitorio page … the single biggest gap"** (§3.3, §9.1) —
  Roma Capitale publishes `…/palazzo-di-montecitorio` and links the Camera's own visitor site
  `https://visita.camera.it/` and `https://eventi.camera.it/eventionline/`.
- **"governo.it 404 on every Palazzo Chigi path … no hours should be published from this file"**
  (§3.3, §5.1) — Roma Capitale's Chigi page publishes the visit schedule *and* the working
  governo.it booking URL. See §3.4.
- **"turismoroma has no enumerable index … 34 of my 47 guessed slugs 404'd"** (§9.8) —
  `turismoroma.it/it/search/node?keys=<term>` returns `/it/luoghi/` hrefs and is enumerable. It is
  how I found five of the six pages in §0 item 12. **Record this for the whole programme.**

### 1.6 The finder missed a direct institutional rione attestation it already had in hand.

The Sovrintendenza's fountain page carries a field the finder did not report:

> **Rione: Colonna**

That is Roma Capitale stating the rione of an object outright. Given §6.3's argument that vertex
counts on boundary places are weak evidence, this is the strongest single line in the file.

### 1.7 Roma Capitale contradicts itself twice, and once contradicts the finder's framing.

- **Colonna di Marco Aurelio.** The finder flagged a "discrepancy … do not average them" between
  Roma Capitale's *176-192* and it.wikipedia's *180-193*. It is resolved: Roma Capitale's own
  **dedicated monument page** says *"fu realizzata tra il 180 d.C., anno della morte di Marco
  Aurelio, ed il 193 d.C."* The 176-192 appears only on the two *secondary* pages (Piazza Colonna,
  Galleria). Publish 180-193; the dedicated page governs.
- **Giacomo della Porta's dates.** Sovrintendenza: *(1533-1602)*. turismoroma Ferrajoli:
  *(1540-1602)*. **Publish no birth year for della Porta.**
- **Galleria renaming year.** it.wikipedia: renamed on reopening **7 December 2003**. Roma Capitale:
  *"Nel **2009**, la Galleria Colonna di Roma è stata ridenominata Galleria Alberto Sordi."*
  Unreconciled. See §3.10.

### 1.8 Two source errors not to copy.

- Roma Capitale's Propaganda Fide page calls it *"la Congregazione **gesuita** 'De Propaganda
  Fide'"*. Propaganda Fide was never a Jesuit congregation. **Do not repeat "gesuita".**
- it.wikipedia's Propaganda Fide infobox carries `paese = ITA | paese2 = VAT`, i.e. it files the
  building under two countries. That is exactly the ruling-2 error. **Do not follow the infobox.**

### 1.9 Proximity and duration traps sitting inside otherwise-good sources. **DROP on sight.**

The corpus rules bind us even when Roma Capitale writes the sentence:

| Source page | Banned phrasing it contains |
|---|---|
| `…/galleria-alberto-sordi-già-galleria-colonna` | *"a due passi dalla Fontana di Trevi"* |
| `…/basilica-di-santandrea-delle-fratte` | *"Situata tra piazza di Spagna e Fontana di Trevi"* |
| `…/teatro-sistina` | *"A pochi passi da piazza Barberini e da via Veneto"* |
| `…/palazzo-chigi` (hours block) | *"La durata della visita è di circa 40 minuti"* — trip duration |
| `…/palazzo-ferrajoli` | *"nel cuore dello shopping capitolino"* |
| it.wikipedia *San Lorenzo in Lucina* | *"non lontano da Palazzo Montecitorio"* |

The last one matters most: it is the **only** sentence the finder had for San Lorenzo in Lucina.
See §4.2.

### 1.10 Rulings compliance — the finder is clean.

- **Ruling 1.** I searched the finder file for all banned terms in English and Italian. **Zero hits.**
  No designation, protection or listing claim anywhere. Confirmed clean.
- **Ruling 2.** §4 is careful and correct, and its warning about the it.wikipedia lead conflating
  Art. 15 with Art. 16 is verified verbatim. See §3.7.
- **Ruling 3.** `"photos": []` throughout; §10 quarantines leads without using them. Confirmed clean.
- **Wave-1 reservation.** Nothing reserved is taken. §8.5's Piazza Venezia test point returning
  Trevi and §8.6's "I have no dispute to file against wave 1" both stand. Confirmed clean.

---

## 2. Corrections to the brief (finder §2) — all three upheld

| Finder claim | Ruling |
|---|---|
| **§2.1** Palazzo Colonna and the Galleria Colonna picture gallery are **Trevi's**; Colonna has the 1922 *arcade* | **PUBLISH.** Verified. And strengthened: Roma Capitale's own Piazza Colonna page says *"il palazzo della **Galleria Colonna**, oggi nota come **Galleria Alberto Sordi**"*, and Roma Capitale titles its dedicated page *"Galleria Alberto Sordi (già Galleria Colonna)"*. The disambiguation no longer rests on it.wikipedia. **The two-buildings-one-name warning to the Trevi finder stands and should be escalated.** |
| **§2.2** Colonna borders Ludovisi, Trevi, Pigna, Sant'Eustachio, Campo Marzio — no Parione, no Campitelli | **PUBLISH.** I re-fetched the rione wikitext. The five-neighbour list is verbatim as quoted. |
| **§2.3** Propaganda Fide is in Colonna; the Piazza di Spagna address is a geocoding trap | **PUBLISH.** it.wikipedia body twice: *"sito nel rione Colonna con affaccio su piazza di Spagna"* and *"Il palazzo si trova nel rione Colonna ed è compreso tra piazza di Spagna, via di Propaganda, via di Capo le Case e **via dei Due Macelli**."* **REWRITE the block description** — the finder gave three streets; there are four. |

---

## 3. Place-by-place rulings — the survivors

### 3.1 Colonna di Marco Aurelio — **PUBLISH, with one REWRITE**

Confirmed against Roma Capitale's dedicated page. Publishable: erected between 180 and 193, the
works completed by Commodus; inspired by Trajan's Column; 100 Roman feet; base of 12 m whose
honorific inscription is lost and whose reliefs were lost in the 1589 restoration commissioned by
Sixtus V, when a bronze statue of **St Paul** was placed at the summit; Carrara white marble
reliefs narrating the campaigns against the Germani (172-173) and Sarmatians (174-175), separated
by a Victory, the narrative beginning with the crossing of the Danube on a bridge of boats; an
internal spiral staircase lit by slit windows. Address: **Piazza Colonna** (no number).

**REWRITE — dates.** Replace the finder's "Erected between 180 and 193 … *Discrepancy: Roma
Capitale dates the column 176-192*" with, verbatim:

> Roma Capitale dates the column to between 180, the year of Marcus Aurelius's death, and 193, and
> records that the work was completed under Commodus, his son and successor.

**PUBLISH — new, and the best fact in the rione, which the finder missed entirely:**

> Roma Capitale records that the inscription on the base wrongly attributes the column to Antoninus
> Pius, which is why it has also long been known as the Colonna Antonina.

**DROP** the finder's "**still on its original site**" — it.wikipedia only, and it is the kind of
superlative-adjacent claim the corpus rule exists for.

### 3.2 Piazza Colonna — **PUBLISH**, minus §1.1

Publishable, Roma Capitale verbatim: *"Centro degli affari e della vita politica della città"*;
bounded by Palazzo Chigi, Palazzo Ferrajoli (*già* Del Bufalo, Aldobrandini and Niccolini), the
church of Ss Bartolomeo e Alessandro dei Bergamaschi, Palazzo Wedekind and the Galleria; the
fountain and the column at its centre. `POINT (12.4803635 41.9009203)`.
**DROP** the Sixtus V sentence (§1.1).

### 3.3 Fontana di Piazza Colonna — **PUBLISH**, with one REWRITE and a large addition

Sovrintendenza Capitolina, confirmed verbatim: made between **1575 and 1577** to a design by
**Giacomo della Porta**, sculpted by **Leonardo Sormani**; white marble, portasanta and travertine;
**Rione: Colonna**.

**REWRITE — the aqueduct, not the fountain, was restored.** The finder wrote "originally fed by the
Acquedotto Vergine, restored under Gregory XIII (1572-1585)", which reads as though the fountain
was restored. Replace with, verbatim:

> Its original supply was the Acqua Vergine. The Sovrintendenza Capitolina records that the fountain
> stands near the aqueduct's main conduit, which was definitively brought back into service under
> Gregory XIII, feeding the whole Campo Marzio through branches running down from the slopes of the
> Pincio by way of Via Condotti.

**PUBLISH — additions the finder left on the page:** della Porta first intended to reuse the
first-century river-god statue known as **Marforio** against a rockwork backdrop beside the column's
base; in the final design the statue was dropped and the fountain moved away from the column and set
parallel to Via del Corso, as an oval portasanta basin with lion-head pilasters in white marble; in
**1830** **Achille Stocchi** altered it during the repaving of Via del Corso, replacing the central
basin and substituting two groups of paired dolphins with intertwined tails inside a shell for the
four original water-spouting blocks; restored in **1991**, further maintained in **1999**.

**DROP** the finder's della Porta birth year — see §1.7.

### 3.4 Palazzo Chigi — **PUBLISH**, with an address REWRITE and hours restored

Confirmed verbatim: seat of the Italian government since **1961**; history begins in the mid-16th
century when the **Aldobrandini** commissioned **Matteo Bartolini da Città di Castello**, with
Giacomo Della Porta and Maderno reported on site but their contribution *"non è stato chiarito"*;
sold unfinished in **1659** to **Mario and Agostino Chigi**, brother and nephew of Alexander VII;
completed by **Felice Della Greca** (courtyard, Scalone d'onore); attic added in the late 1600s;
the Piazza Colonna portal, the courtyard fountain with the Chigi emblem of six hills beneath a star,
and the interior decoration are 18th-century; the **Salone d'oro** was gilded in the 18th century
for the marriage of Prince Sigismondo Chigi to Maria Flaminia Odescalchi, its ceiling carrying
**Giovan Battista Gaulli (il Baciccia)**'s *Endimione spiato da Diana* of **1668**; bought by the
State in **1916**; Foreign Ministry from **1922 until 1961**, when that ministry moved to the
Farnesina.

**REWRITE — address.** Not "Piazza Colonna 1". Publish **Piazza Colonna, 370**.

**REWRITE — hours. The finder was wrong to forbid them.** Publish, verbatim:

> Roma Capitale states that guided visits to Palazzo Chigi are held by prior booking, one Saturday a
> month from October to June, 9.30 to 13.00, in groups of 35 with entry every thirty minutes.
> Booking and the calendar are published by the Presidency of the Council at
> governo.it/visitare-i-palazzi-istituzionali/visitare-palazzo-chigi/palazzo-chigi-prenotazioni-e-calendario

**DROP** the "circa 40 minuti" visit length — trip duration.
**PUBLISH — addition:** earlier a private residence and then seat of the Spanish and afterwards the
Austro-Hungarian embassy to the Quirinal, from which its nickname *"mole Austro-vaticana"* dates.

### 3.5 Palazzo Montecitorio — **PUBLISH**, promoted from Wikipedia-only to institutional

Roma Capitale's page, confirmed: begun **1653**, when **Innocent X** commissioned **Gian Lorenzo
Bernini** to build a residence for the **Ludovisi**; interrupted in **1655** at the pope's death for
want of funds; resumed over thirty years later under **Innocent XII**, with **Carlo Fontana**
modifying Bernini's design while keeping its **convex façade** and adding the **campanile a vela**;
Innocent XII made it the seat of the **Curia Innocenziana**, the papal tribunals, **inaugurated in
1696**; it then housed the Governatorato di Roma and the police directorate; **seat of the Camera
dei deputati from 1871**. Early in the 20th century **Ernesto Basile** built a new block behind the
old one, reduced the courtyard, demolished the rear wings and built the *floreale* front on Piazza
del Parlamento, containing the **hemicycle chamber** lit by **Giovanni Beltrami**'s stained-glass
*Velario* over **Giulio Aristide Sartorio**'s allegorical frieze on the history of the Italian
people; the corridor beside the chamber is called the **Transatlantico**; the **Sala della Lupa** is
tied to the referendum of **2 June 1946**. The great bell, which now rings only on the election of
the President of the Republic, once signalled the start of audiences.
Address **Piazza di Monte Citorio, 1**. Visits: `https://visita.camera.it/`.

**DROP** "became the Chamber's seat in 1918" (§1.3).
**REWRITE** the finder's "inaugurated in 1696 as the seat of the papal courts, the **customs** and
the police" — Roma Capitale says the papal tribunals, and afterwards the **Governatorato di Roma**
and the police directorate. There is no customs house on the page.

### 3.6 Obelisco di Montecitorio (Obelisco Campense) — **PUBLISH**, with the height dropped

Roma Capitale, confirmed: of the **Saitic (XXVI) Dynasty**, 672-525 BC, erected at **Heliopolis** on
the order of **Psammetichus II**; red granite; **21.79 m**, **33.97 m** with base and globe; brought
to Rome under Augustus and set up in the Campus Martius on a pedestal bearing the dedication
*"…AEGYPTO IN POTESTATEM POPULI ROMANI REDACTA SOLI DONUM DEDIT"*; it probably served as the
**gnomon** of the sundial, the area at its foot paved with a representation of the zodiac; it stood
until the 10th or 11th century, then fell, was progressively buried and forgotten; found in **1748**
broken in five pieces and fire-damaged, recovered under **Benedict XIV**; **re-erected in its
present position in 1792**; restored **1965**; in **1998** the piazza was relaid, recreating the
zodiacal elements and guide lines that restore its meridian function.

**DROP** "30 m tall" (§1.4). **DROP** "one of Rome's thirteen ancient obelisks" — it.wikipedia only,
and a countable-superlative shape.
**Note to the author:** a page that says "brought to Rome by Augustus" without saying it lay buried
and was re-erected in 1792 is materially misleading. The 1792 fact is not optional.

### 3.7 Palazzo di Propaganda Fide — **PUBLISH**, the ruling-2 wording upheld verbatim

**The finder's §4 status wording is correct and I adopt it unchanged.** I re-fetched vatican.va.
Entry 5 of 13 reads exactly *"il Palazzo di Propaganda Fide, sede della Congregazione per
l'Evangelizzazione dei Popoli"*, inside a list introduced as properties which *"godono del
privilegio della extraterritorialità e sono esenti da espropriazione e da tributi."* Confirmed.

The conflation warning is confirmed verbatim too — it.wikipedia's lead reads *"è uno dei possedimenti
extraterritoriali della Santa Sede ed è esente da espropriazioni e tributi"*, running Art. 15 and
Art. 16 into one sentence. **The corpus must not copy it, and must not copy the infobox's
`paese2 = VAT` either.**

**Publishable:** it stands on Italian soil, in the rione of Colonna, in the Comune di Roma; it holds
the immunities international law grants the headquarters of a diplomatic mission; a visitor there is
under Italian law.
**NOT publishable:** "in the Vatican", "Vatican territory", "part of Vatican City", or any border.

**REWRITE — address.** The finder said a verifier should find a street number. Roma Capitale gives
**Via di Propaganda, 1**, `POINT (12.483038 41.904467)`. Publish that. Do **not** publish
it.wikipedia's infobox "Piazza di Spagna, 48" — the finder's own §2.3 shows why an address on that
piazza is the trap.

**REWRITE — architecture, now sourced.** The finder asked for a second source before publishing the
Bernini/Borromini attribution. Roma Capitale supplies it. Publish, verbatim:

> Roma Capitale records that the core of the building dates to 1586 and that it has been the seat of
> the Congregation *De Propaganda Fide*, founded by Gregory XV in 1622, since 1633. Between 1642 and
> 1644 Bernini designed and built the façade towards the piazza for Urban VIII. The façade on Via di
> Propaganda is Borromini's. In 1666 Borromini built the Oratorio dei Re Magi inside, having
> demolished the small elliptical church Bernini had built there.

**DROP "la Congregazione gesuita"** (§1.8) and drop the finder's "known since the 2022 Curia reform
as the Dicastero per l'evangelizzazione" **unless** the author sources the 2022 reform separately —
it.wikipedia's infobox is the only support in the file. The safe form is to state both names as the
two sources give them, as the finder already advised.

**Cappella dei Re Magi — REWRITE.** it.wikipedia dates Borromini's rebuild **1662-1664**, decoration
over the two following years, consecration **18 April 1729**; Roma Capitale dates the oratory
**1666**. Publish only: *"the Cappella dei Re Magi inside the palazzo is Borromini's, built after he
demolished an earlier elliptical church by Bernini."* **Do not publish a construction year.**

**Museo Missionario di Propaganda Fide — REWRITE, and the finder's "do not publish hours" is now
partly wrong.** Roma Capitale publishes an access status. Publish, verbatim and dated:

> As at 2 September 2026 Roma Capitale states that entry is temporarily closed for urgent
> conservation work. Museum contact: museopropagandafide.va, tel. 06 69880266.

The finder recorded `propagandafide.va` as NXDOMAIN; the working domain is **museopropagandafide.va**.

### 3.8 Palazzo Capranica — **PUBLISH**

Roma Capitale states the rione outright — *"Il palazzo, sito nell'omonima piazza, all'interno del
territorio del rione Colonna, è un edificio del XV secolo"* — confirmed verbatim, together with:
the portal inscription dating construction to **1451** for Cardinal **Domenico Capranica**; first a
Capranica residence, from **1457** a college for clerics; a square corner tower whose top storey
opens as a loggia; the two marble portals reading **COLLEGIUM CAPRANICENSE** and **TEATRO
CAPRANICA**, the latter also bearing the date 1451; on the first floor three Gothic and three
Renaissance windows, with traces of the Capranica arms on the Gothic capitals. Two addresses, both
testing Colonna: **Via del Collegio Capranica, 36-43** and **Piazza Capranica, 101**.

**REWRITE — one addition, with attribution required:** Roma Capitale calls it *"unico esemplare in
città dello stile architettonico romanzo capitolino"*. Publishable only as *"Roma Capitale describes
it as the city's only example of the Capitoline Romanesque style"* — never in the corpus's own voice.

**The OSM conflict (finder §6.2 case 4) stands unresolved and is escalated** — see §5.

### 3.9 Chiesa di San Macuto — **PUBLISH**

Roma Capitale, in words, *"si trova sulla piazza omonima a Roma, nel rione Colonna"* — confirmed
verbatim, as is the whole chain the finder gave: only church in Italy dedicated to the Breton bishop;
adjoining the Collegio San Roberto Bellarmino, formerly Palazzo Gabrielli-Borromeo; first mentioned
**1192**; under San Marcello al Corso in the later 13th century, then the Dominicans of Santa Maria
sopra Minerva (confirmed by Nicholas III, 1279); a parish church by **1422**; in **1516** Leo X
united the parish to the Chapter of St Peter's, **which ceded it to the Confraternita dei Bergamaschi
in 1539**; new façade c. **1560** by **Giovanni Alberto de Galvani**; partly rebuilt **1577-1585** to
**Francesco Capriani da Volterra**'s design; parish suppressed **1588**; the Bergamaschi left for
Santa Maria della Pietà in **1725-26** and the Jesuits took it back under the San Macuto title;
part of the Collegio Bellarmino since **1942**. The finder's 1539 is right — the 1516 is a separate
event, and the two must not be merged.

The finder's §6.2 case 2 is confirmed: the page's own `POINT (12.478788 41.899055)` tests Pigna
while its prose says Colonna. **The prose and the 11/11 footprint agree; the pin is the outlier.**
Publish as Colonna.

### 3.10 Galleria Alberto Sordi (già Galleria Colonna) — **PUBLISH, but the finder's version is stale**

Roma Capitale has a dedicated page under the exact disambiguating name. Publishable from it:
Liberty architecture; designed by the Livornese architect **Dario Carbone**; **inaugurated in
October 1922**, in the period of Rome's transformation into the capital; conceived as a
multifunctional block for offices and commerce; it takes its name, as Piazza Colonna does, from the
Column of Marcus Aurelius. From it.wikipedia, attributed: one of the seats of the Presidency of the
Council of Ministers; on the site stood the 17th-century palazzo Spada al Corso, then known as
palazzo Piombino; **completed only in 1940 under Giorgio Calza Bini**; reopened 7 December 2003
after restructuring.

**REWRITE — currency. This is the most important correction in this section.** Roma Capitale states:

> "Chiusa al pubblico per circa un anno, la Galleria ha riaperto nel **2024** al termine di un lungo
> progetto di riqualificazione e restyling."

**DROP** the finder's "fifteen shops inside" — that is it.wikipedia describing the pre-2024 arcade
and is now stale. Replace with, verbatim:

> Roma Capitale records that the Galleria closed to the public for about a year and reopened in 2024
> after a restoration that removed the external glazing and renewed the lighting.

**DROP the renaming year entirely.** it.wikipedia says renamed on the 2003 reopening for Alberto
Sordi, who had died that 24 February; Roma Capitale says 2009. Two institutional-grade sources, two
years, no tie-break. Publish only: *"the arcade carried the name Galleria Colonna and was later
renamed for the actor Alberto Sordi."* **Do not publish a year.**

**PUBLISH — the finder's §2.1 escalation to the Trevi finder, upheld and strengthened** (§2 above).
**DROP** the source's *"a due passi dalla Fontana di Trevi"* (§1.9).

### 3.11 Piazza di Monte Citorio — **PUBLISH**

Roma Capitale states the rione outright: *"La solenne piazza di Monte Citorio si trova nel Rione
Colonna"*. Also publishable: it stands on an artificial rise which some sources attribute to the
accumulated rubble of a Roman monument; the name's origin is uncertain, variously derived from
*Citatorius* or *Saeptorius* — citizens having been summoned nearby to the *Saepta* to elect
magistrates since the time of Servius Tullius — or from *mons acceptorius*, or from a corruption of
*Monte di Toro*. The finder had this square as a bare geometry row; it is a full entry.

### 3.12 Basilica di Sant'Andrea delle Fratte — **PUBLISH**

Roma Capitale, all confirmed verbatim: recorded from the 12th century as Sant'Andrea *"infra
hortos"*, later rendered *"delle Fratte"*; entrusted by **Sixtus V** to the **Order of Minims of St
Francis of Paola in 1585**, who began the rebuilding; funded by the Marchese **Ottavio del Bufalo**,
whose buffalo-head arms appear on the portal pediment and the campanile; work dragged for over a
century for want of funds; the general design and the façade are **Gaspare Guerra**'s, who worked
there **1604 to 1612**; in **1653** the commission passed to **Borromini**, who designed the apse,
the campanile and the dome drum, the dome left unfinished at his death; **Mattia de Rossi** finished
the work in **1691**; the campanile is nicknamed **"ballerino"** because the structure sways alarmingly
when the great bell rings; the tiburio's diagonal buttresses make the form of St Andrew's cross.
**Address: Via di Sant'Andrea delle Fratte, 1.** Official site: **madonnadelmiracolo.it**.

**DROP** Roma Capitale's opening *"Situata tra piazza di Spagna e Fontana di Trevi"* (§1.9).
**PUBLISH** the it.wikipedia additions with attribution — minor basilica from 25 April 1942, the
*santuario della Madonna del Miracolo* title after the Ratisbonne apparition of 20 January 1842,
Maximilian Kolbe's first Mass on 29 April 1918 — the Marian title now corroborated by the official
domain Roma Capitale itself lists.
**Publish no hours:** the page says only to contact the church.

### 3.13 Palazzo Wedekind — **PUBLISH** in full

Confirmed verbatim, including the address **Piazza Colonna, 366**: also "Palazzo del Tempo"; built
from the second half of the 1600s; present appearance from the 19th-century restorations of **Pietro
Camporese** and **Giovanni Battista Giovenale**, commissioned first by **Gregory XVI** and then by
the **Wedekind family**; Camporese's portico of **sixteen columns, twelve from the excavations of
the Etruscan city of Veio**, as the Latin frieze inscription records; papal postal office, then
briefly Education Ministry of the Kingdom of Italy; bought in **1879** by the banker **Karl
Wedekind**; to **INPS in 1925**; official seat of the Fascist Party from **1943 to the liberation of
Rome**; later home of *Il Tempo*. **PUBLISH — additions:** the Sala Giovenale with decorated ceilings
and Renaissance-inspired mosaic floors designed by Giovenale in 1881; a second salone with a
17th-century tapestry from the Sciarra Collection; a collection of about ninety 20th-century works.

### 3.14 Palazzo Ferrajoli — **PUBLISH**, and the finder's identification problem is solved

Confirmed verbatim: built over the old houses of the **Del Bufalo-Cancellieri**; in the 1500s the
façades were partly frescoed; modernised in **1561** by **Giacomo Della Porta**; restructured in
**1626** by **Francesco Peparelli**, giving it its present appearance, for the marriage of Paolo Del
Bufalo to a Santacroce; to the **Niccolini** in **1728**; Cardinal **Joseph Fesch**, Napoleon's uncle
and French ambassador to Rome, installed under the Empire; bought in **1850** by Marchese **Giuseppe
Ferrajoli**; the Piazza Colonna façade of four storeys divided into three by four rusticated
vertical bands.

**REWRITE — address.** The finder recorded no address and could not find the footprint, attaching a
*Palazzo Verospi* node instead. Roma Capitale gives **Piazza Colonna, 355**,
`POINT (12.480128 41.900641)`, tel. 06 69200497.
**PUBLISH — access, which the finder did not have:** *"Roma Capitale states that the palazzo can be
visited only on the occasion of receptions, conferences and exhibitions."*
**DROP** *"nel cuore dello shopping capitolino"* (§1.9).

### 3.15 Palazzo Fiano al Corso — **PUBLISH**

Confirmed verbatim, address included: 13th-century core, wholly rebuilt in the 1400s as the
residence of the titular cardinals of San Lorenzo in Lucina; **the first remains of the Ara Pacis
were found here during the excavation works of 1568**; to the **Peretti**, Sixtus V's family, around
the mid-1600s; to the **Dukes Ottoboni di Fiano** in the 1800s, whence the name; sold in **1898** to
**Edoardo Almagià**; seat of the *Circolo degli scacchi* **1923-1990**; the salone frescoed in the
mid-1600s by **Giovan Francesco Grimaldi** and **François Perrier**, with an adjoining Sala degli
Specchi. **Address: Piazza di San Lorenzo in Lucina, 4.** The finder's caution that the piazza is a
straddler while the palazzo is not is correct and should be carried.

### 3.16 Teatro Sistina — **PUBLISH**

Confirmed verbatim: **inaugurated in 1949** as a cinema-theatre to a design by **Marcello
Piacentini**; its popularity owed above all to **Garinei e Giovannini**, whose works were staged in
over 45 countries and translated into 16 languages; recognised as **Teatro stabile della Commedia
Musicale Italiana** by the culture ministry in **March 2003**; directed by **Massimo Romeo Piparo
since July 2013**, succeeding Gianmario Longoni. **Via Sistina, 129.**
**DROP** the source's *"A pochi passi da piazza Barberini e da via Veneto"* and its *"uno dei più
importanti e rappresentativi teatri italiani"* — unfalsifiable puffery even from Roma Capitale.
**Publish no hours** — the page says to contact the venue. The finder was right.

### 3.17 Teatro Sala Umberto — **PUBLISH** in full

Every date confirmed verbatim, address included: designed by **Andrea Busiri Vici** with decoration
by the scenographer **Alessandro Bazzani**, opened **1882** as a concert hall named **Teatro della
Piccola Borsa**; enlarged to **650 seats** in **1890** by **Giulio Podesti**; renamed around **1900**;
also used as a *Cinemofono* from **1906**; **Petrolini** debuted **25 May 1911**; refitted by
**Attilio Spaccarelli** and **Arnaldo Foschini** for the Universal Exposition marking fifty years of
Italian unity, finished in **1913**; rebuilt **1928** with a 12 m proscenium and modern projection
equipment; a temple of variety and revue between the 1910s and the 1940s. **Via della Mercede, 50.**
**REWRITE** the finder's flat "refitted 1913 by Spaccarelli and Foschini" to name the Exposition
occasion, which is what the source says.

### 3.18 Galleria d'Arte Moderna di Roma Capitale — **PUBLISH**, with a small REWRITE

Sovrintendenza Capitolina confirmed verbatim: *"Nata nel 1925, la collezione custodita nella
Galleria di Via Crispi documenta l'ambiente artistico romano tra la seconda metà dell'Ottocento e il
secondo dopoguerra"*; free entry for **MIC card** holders; information and booking on **060608, 9.00
to 19.00**. Address confirmed independently from the museum's own site footer: **Via Francesco
Crispi 24, 00187 Roma**.
**REWRITE** "part of the Musei in Comune system" → *"part of Roma Capitale's Sistema Musei Civici"*,
which is the label the Sovrintendenza's own breadcrumb now uses.
The finder's note that Via Francesco Crispi is shared (Colonna 23 / Ludovisi 6 / Trevi 1) but that
no. 24 falls in the Colonna stretch is sound and should be carried as a caution, not as prose.

### 3.19 Chiesa dei Ss Bartolomeo e Alessandro dei Bergamaschi (Santa Maria della Pietà) — **PUBLISH**

Roma Capitale, from the Piazza Colonna page, confirmed verbatim: *"fondata nel 1561 come cappella
dell'annesso Ospedale dei Pazzi"*. The San Macuto page independently confirms that the Bergamaschi
moved here in 1725-26 and that the title changed to Ss Bartolomeo e Alessandro. The it.wikipedia
"national church of the Bergamaschi in Rome" is publishable with attribution.

### 3.20 Orologio di Augusto — **PUBLISH the facts, ESCALATE the rione**

Roma Capitale confirmed verbatim: a great trapezoidal travertine pavement marking hours, seasons,
months and zodiac signs in gilt bronze letters, in the area running **from Palazzo Montecitorio to
the church of San Lorenzo in Lucina**; built in **10 BC**, as the inscription at the base of the
Montecitorio obelisk — its **gnomon** — records; positioned so that the gnomon's shadow fell towards
the **Ara Pacis** on Augustus's birthday, **23 September**; excavation in a cellar on **Via di Campo
Marzio** recovered part of the pavement, **perhaps of a later Domitianic phase**, with four zodiac
names legible in Greek (Virgo, Leo, Taurus, Aries) and the start of Summer.
**REWRITE** — the finder omitted the Domitianic qualification, which Roma Capitale states; the corpus
must not present the recovered pavement as Augustan.
Two addresses and two POINTs confirmed: **Via In Lucina, 16/a** and **Via di Campo Marzio, 48**.
**Escalated — see §5.**

---

## 4. Rulings — the places that do not survive

### 4.1 DROP for the wave-1 reservation
None. Nothing reserved appears. The finder's §8.5 and §8.6 are correct: Piazza Venezia tests Trevi
and is ~350 m outside Colonna, and there is no dispute to file against wave 1. **Upheld.**

### 4.2 DROP or hold — insufficient source

| Place | Ruling |
|---|---|
| **Basilica di San Lorenzo in Lucina** | **REWRITE to identity only.** Its single sourced sentence contains *"non lontano da Palazzo Montecitorio"* — banned vague proximity. Publish only: *"a basilica in the rione Colonna, on the piazza of the same name."* Nothing more, until a real source is found. Roma Capitale has no page under the obvious slug. |
| **Chiesa di San Silvestro in Capite**, **Santa Maria Maddalena**, **Santa Maria in Aquiro**, **San Giuseppe a Capo le Case**, **Ss Ildefonso e Tommaso da Villanova**, **Santa Maria Odigitria** | **PUBLISH identity and location only**, attributed to it.wikipedia, on the finder's footprint geometry. No turismoroma page exists for any of them (I probed; 404). The Maddalena rococo interior, the remains of St Camillus de Lellis, the Grassia *Adorazione* of 1670 and the Abruzzese/Sicilian national-church roles are attributable single-source facts — the author may carry them **only** with "it.wikipedia records that…". |
| **Reliquia di San Giovanni Battista** (`node/2423068386`) | **DROP.** OSM tag only. The finder said so; upheld. |
| **Museo Parigino** (`node/4711620949`) | **DROP.** No wikidata, no source. |
| **"Resti di Mura Serviane"** (`node/12701919771`) | **DROP.** The finder's reasoning is right — the Servian Wall does not run through Colonna. Record as a data defect. |
| **Unnamed `historic=archaeological_site`** `way/732381` | **DROP.** Nothing is known about it. |
| **Gagosian**, **Nuovo Olimpia**, **Palazzo Verospi**, **Palazzo Theodoli-Bianchelli**, **Palazzo Cipolla**, **Salone Margherita** | **DROP for this wave.** All six are OSM/Wikidata/Wikipedia stubs whose own sites the finder did not extract. Real places, insufficient evidence. |
| **Palazzo Dotti, Perucchi, Serlupi Crescenzi, dei Gruppi, ex Banco di Napoli** | **DROP.** OSM name tags only. The finder recommended not publishing them; upheld. |
| **Palazzo Toni, Palazzo Ferrini Cini, Casa Vaca** | **DROP.** Red-linked or empty articles. The d'Azeglio and Böcklin studios at Palazzo Toni are single-source and uncorroborated. |
| **Palazzo Macchi di Cellere**, **Palazzo Marignoli**, **Palazzo Bocconi**, **Palazzo delle Poste**, **Palazzo Chauvet**, **Palazzo Gabrielli-Borromeo**, **Collegio dei Bergamaschi** | **PUBLISH identity, rione and street only**, attributed. Each has an it.wikipedia article stating the rione in words. **DROP** Palazzo Bocconi's dates — "built 1886-1889" and "inaugurated 11 December 1887" cannot both anchor a sentence, and ArchiDiAP is an aggregator the finder did not fetch as a primary. **DROP** "since 2010 Zara's main Rome store" — commercial tenancy, unverified, and `zara.com` returned 403. |
| **Tempio di Adriano (Hadrianeum)** | **PUBLISH identity only.** I re-probed three turismoroma slugs and the site search: **no institutional page exists.** The finder's gap is real. Publish the eleven surviving columns embedded in a later building, in Piazza di Pietra, and the later use as the Borsa di Roma, attributed to it.wikipedia. **PUBLISH the finder's warning** that it.wikipedia's *"sito nel Campo Marzio"* means the ancient Campus Martius, not the modern rione — that trap is real and the same trap sits in OSM's name for Santa Maria Maddalena. |
| **Tempio del Sole**, **Santa Maria Maddalena delle Convertite**, the seven other demolished churches, **Via Lata**, **Caffè Aragno** | **DROP as places; history only.** Upheld — a guide may not send a visitor to a building that is gone. Note an internal Wikipedia inconsistency the finder did not catch: the *Tempio del Sole* article gives **275**, the *Piazza di San Silvestro* article gives **273**. Publish neither year. |
| **Palazzo Piombino** | **DROP as a place.** Upheld and now corroborated: it.wikipedia's Galleria article confirms the palazzo on that site was demolished for the arcade. |
| **Barberini metro station**, **"the seat of the Italian government has no metro stop"** | **DROP.** The station is Trevi's; the no-metro claim is OSM-only, as the finder said. |
| **Giolitti**, **Tazza d'Oro**, **Salotto 42**, **Cartoleria Pantheon dal 1910**, **Corinthia Rome**, the 67 restaurants / 40 hotels / 21 cafés / 10 bars / 9 gelaterie | **DROP.** OSM `addr` tags are not a source for a guide entry, and the *dal 1910* in a shop's name is not a source for a founding date. |
| Any *negozio storico*, "historic", "oldest" or "trading since" claim | **DROP.** The finder's §7.1 reasoning is correct and I adopt it: the register is unreachable, and the corpus rule forbids the claim regardless. |
| **17 unnamed objects**, **Fontana del Bufalo**, **ISIA Roma**, the three bookshops | **DROP for this wave.** OSM-only. |

### 4.3 DROP — designation claims
**None found.** Ruling 1 compliance is clean (§1.10).

### 4.4 DROP — extraterritorial property misdescribed as Vatican
**None found.** Ruling 2 compliance is clean (§1.10, §3.7). The finder correctly refused the
conflation its own sources commit.

---

## 5. Straddlers escalated to the arbitrator

I am not resolving these. Each is flagged with what I think the strongest evidence is.

1. **Fontana del Pantheon and Obelisco Macuteo.** Confirmed: both Roma Capitale pages carry the
   identical `POINT (12.476993 41.898996)`, which tests Pigna, and both give the address **Piazza
   della Rotonda**, against OSM footprints of 54/54 and 5/5 in Colonna.
   **I agree with the finder's recommendation: they go to Pigna, with the Pantheon.** Colonna should
   not take them and I do not take them.
2. **Piazza della Rotonda.** Do not make it a Colonna place. Colonna has its own piazza and loses
   nothing. The three-rione meeting point inside it is the sharpest boundary in the wave.
3. **Piazza di San Silvestro.** Sharper than the finder had it. it.wikipedia's **body** says
   *"nei rioni Trevi e Colonna"*, citing Rendina-Paradisi — but its **infobox** says
   `circoscrizione = Rione II`, i.e. Trevi alone. OSM says 50/50 Colonna. **Three readings, three
   answers.** Palazzo Marignoli and the Palazzo delle Poste are both addressed to it.
4. **Piazza di Sant'Ignazio** (Colonna 79 / Pigna 5) — the church is Pigna's, the piazza is not.
5. **Piazza di San Claudio** (Trevi 11 / Colonna 11) — dead even; no geometric tie-break exists.
6. **Piazza di San Lorenzo in Lucina** (Campo Marzio 15 / Colonna 9) — Palazzo Fiano is addressed
   here and is itself not a straddler.
7. **Piazza di San Macuto** (Pigna 13 / Colonna 5) — the church is not a straddler.
8. **Piazza della Maddalena** (Sant'Eustachio 8 / Colonna 6), **Largo Chigi** (Colonna 12 / Trevi 3),
   **Piazza Barberini** (Trevi's on the numbers), **Piazza di Spagna** (Campo Marzio's,
   overwhelmingly — Colonna must not take it), **Via Gregoriana**, **Via del Nazareno**.
9. **Orologio di Augusto** — the genuine case. Roma Capitale itself publishes **two** addresses in
   **two** rioni for one buried monument. This is not a mapping artefact; the monument spans the
   line. Needs a ruling, not a coin toss.

**Via del Corso** (Campo Marzio 32 / Colonna 21 / Trevi 23 / Pigna 2) is four-way and Roma Capitale
publishes a page for it. Escalated with the rest.

**The finder's §6.3 argument is the most valuable thing in the file and I endorse it:** where a
rione boundary is defined as "the street", OSM draws the boundary along one kerb, so a 100 % vertex
score on a place a text source names *as the boundary* is weak evidence, not strong. Piazza Colonna,
Piazza della Rotonda, Piazza di Sant'Ignazio, Piazza di San Macuto, Via del Corso, Via del Seminario
and Via Frattina are contested by construction whatever the counts say. A 100 % score on a
**building** footprint is strong. Both halves of that are correct.

I re-fetched and confirmed the two text-versus-geometry cases:
- **Via Frattina** — it.wikipedia: *"condivisa fra i rioni Colonna a sud e Campo Marzio a nord."*
  Geometry: 9/9 Colonna. Confirmed conflict.
- **Colonna's five neighbours** — confirmed verbatim, and it does name piazza Colonna and via del
  Corso as boundaries, exactly as §6.3 predicts.

---

## 6. Tier ruling

**GUIDE.**

Twenty-one places survive with an institutional source and a rione that is either stated in words by
Roma Capitale or established by a building footprint:

Colonna di Marco Aurelio · Piazza Colonna · Fontana di Piazza Colonna · Palazzo Chigi ·
Palazzo Montecitorio · Piazza di Monte Citorio · Obelisco di Montecitorio · Galleria Alberto Sordi ·
Palazzo di Propaganda Fide · Museo Missionario di Propaganda Fide · Palazzo Capranica ·
Chiesa di San Macuto · Basilica di Sant'Andrea delle Fratte · Palazzo Wedekind · Palazzo Ferrajoli ·
Palazzo Fiano · Teatro Sistina · Teatro Sala Umberto · Galleria d'Arte Moderna ·
Ss Bartolomeo e Alessandro dei Bergamaschi · Orologio di Augusto (pending §5.9)

Five of these — Propaganda Fide, Montecitorio, Piazza di Monte Citorio, the column and the obelisk —
were **materially weaker in the finder file than the evidence actually allows**, because the
institutional pages existed and were not found. This is not a thin rione. Colonna clears the guide
threshold more than fivefold and needs no padding; the tier holds even if the arbitrator takes the
Orologio, San Silvestro and every §5 straddler away.

---

## 7. Work still open after this pass

1. **The Hadrianeum has no institutional source.** Confirmed by me across three slugs and the site
   search. Real gap, and the most conspicuous one left.
2. **The Galleria renaming year** (2003 vs 2009) and **the Tempio del Sole year** (273 vs 275) are
   both unreconciled source conflicts. Publish neither year.
3. **The four Overpass filter chunks that never completed** (colleges, rail/metro entrances,
   department stores and pasticcerie, clocks). The finder's own known gap; still open.
4. **`turismoroma.it/it/search/node?keys=` is enumerable** (§1.5). Every rione file in the programme
   should be re-swept through it before publication. It is the single highest-yield finding here.
