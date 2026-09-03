# Ostia Antica (Z. XXXV, code 435) — verifier verdicts

Adjudicating `docs/rome/ostia-antica-finder.md`. Every candidate ruled PUBLISH, REWRITE or DROP.
Unit is a **zona**, not a rione and not a quartiere. Municipio Roma X **may** be stated here: the
finder's justification holds (it.wikipedia's zona infobox `circoscrizione = Municipio Roma X`, plus
zona urbanistica 13E). This is the one unit in the wave where a Municipio is sourced for the unit
itself.

Counts: **PUBLISH 39 · REWRITE 13 · DROP 39 · ESCALATED 2**. Surviving place count **52**.

---

## 0. Collision check — re-run, and the finder's numbers are stale

`python3 .superpowers/taken_slugs.py` reports **907 places across 21 shipped files**, not the 786
the finder wrote in §0. The finder's conclusion survives the correction; its arithmetic does not.
Re-ran the searches myself:

| query | result |
|---|---|
| `ostia` | **0 matches** |
| `necropoli` | **0 matches** |
| `castello` | 1 — `porta-castello-borgo-rome` (Porta Castello, rione Borgo). Unrelated. |
| `aurea` | 1 — `domus-aurea-rome` (Monti). Unrelated to the Basilica di Sant'Aurea. |

**No candidate below collides with a shipped place.** Confirmed, on a corrected denominator.

---

## 1. Sources re-fetched

Fifteen re-fetched, well past the five required. Confirmed as claimed:

1. `ostiaantica.cultura.gov.it/info-visita/scavi-di-ostia-e-museo-ostiense/` — address, seasonal
   hours, €18/€2, 8-day validity, CoopCulture, Museo Ostiense hours. **One correction, below.**
2. `…/info-visita/castello-di-giulio-ii/` — hours, €6/€2, exhibition to 21 Nov 2026. Confirmed.
3. `…/siti-musei/scavi-di-ostia-e-museo-ostiense/la-necropoli-laurentina-3/` — closure verbatim.
4. `it.wikipedia.org/w/api.php?…Categoria:Roma Z. XXXV Ostia Antica` — nine articles, as listed.
5. `…/pannelli-didattici-e-mappe/larea-a-servizio-del-fiume/mura-repubblicane-porta-romana/` —
   mid-1st-century-BC walls, ca. 69 ha, three gates, the Cicero/Clodius inscription. Confirmed.
6. `turismoroma.it/…/il-borgo-di-ostia-antica-e-il-castello-di-giulio-ii` — PIAZZA DELLA ROCCA,
   Gregoriopoli, d'Estouteville's three rows of still-inhabited terraced houses, Pontelli named in
   the courtyard-portal inscription, the 1557 flood. Confirmed.
7. `cultura.gov.it/luogo/parco-archeologico-di-ostia-antica-…` — "Il Museo Ostiense non è aperto al
   pubblico", page updated 2025-08-06. The conflict is real.
8. `…/siti-musei/il-castello-di-giulio-ii-e-il-borgo-di-ostia-antica/` — restoration works verbatim,
   "il Castello rimarrà aperto secondo il consueto orario", the 1556 Duke of Alba siege.
9. `…/pannelli…/museo-casone-del-sale/` — 15th-century name, 1865–67 for Pius IX, neoclassical
   façade, collections at the Castello until the 1930s. All confirmed.
10. `santaurea.org/la-cattedrale`, **which the finder did not fetch** — I fetched it. See §4.
11. `…/larea-del-teatro/teatro/` · 12. `…/terme-del-foro/` · 13. `…/grandi-horrea/` ·
    14. `…/i-quartieri-costieri…/sinagoga/` · 15. `…/larea-a-servizio-del-fiume/terme-di-nettuno/`
    — all confirmed, all four superlatives present exactly as the finder warned.

### Sources that do NOT say what the finder said — four

- **The park's phone number.** The finder printed "Phone 06 39967950". That number is on none of
  the three pages cited. The operator's own info-visita page gives **+39 06 5635801** (daily
  09:00–17:30); MiC gives **+39 06 56358099**. Both are publishable; 06 39967950 is not.
- **Piazzale delle Corporazioni wheelchair access.** The finder wrote "MiC states the Piazzale is
  reachable from the ticket office and is fully passable by wheelchair" and cited the panel URL.
  The panel carries no accessibility statement of any kind. **Unsourced — cut.**
- **Schola del Traiano, "Reopened at the Natale di Roma, 2022."** Not on the cited panel. Cut.
- **Castello, the convicts "with whom Pius VII and Pius IX began the first excavations".**
  it.wikipedia says only that the castle was "utilizzato come prigione per i criminali condannati
  ai lavori forzati" in the 19th century. The excavation link is the finder's, not the source's. Cut.

### One source-versus-source conflict I am ruling on

**Martin V's tower: "1400" is wrong and the operator prints it.** The Parco's own siti-musei page
says "Nel 1400 Papa Martino V fece edificare un torrione". Martin V was elected in 1417. The
it.wikipedia article gives "tra il 1423 e il 1424". **Ruling: publish 1423–24, attributed to
it.wikipedia; never print 1400,** even though the operator does. An operator's own site establishes
its identity, location and hours — it does not license a date its own subject's chronology refutes.

---

## 2. The Museo Ostiense conflict — ruled

MiC's *Luoghi della Cultura* page (updated 2025-08-06) says the museum is not open to the public.
The Parco's own 2026 info-visita page publishes seasonal opening and last-entry times for it.

**Ruling: PUBLISH, `status: open`, hours from the operator.** The Parco is the administering
institute and its page is the more recent and more specific of the two state sources; a `closed`
would be an affirmative claim resting on the staler page. Per the corpus rule the record must not
narrate the conflict — no "sources disagree", no dates of pages. If the writer is uneasy, the
fallback is to publish the record with no hours and the sentence "No source states its opening
hours, so none are given here." Do not publish both hours and a hedge.

---

## 3. The archaeological park — verdicts

### PUBLISH as written (39)

Quattro Tempietti · Foro di Ostia · Capitolium · Tempio di Roma e Augusto · Basilica (Ostia) ·
Cd. Curia · Tempio Rotondo · Tempio di Ercole and the republican sacred area · Horrea Epagathiana
et Epaphroditiana · Casa di Diana · Thermopolium di Via di Diana · Insula di Giove e Ganimede ·
Molino del Silvano · Castrum repubblicano · Terme di Nettuno · Caserma dei Vigili · Terme dei
Cisiarii · Mura repubblicane e Porta Romana · Cd. Macellum e tabernae dei pescivendoli · Cd.
Basilica Cristiana · Caupona di Alexander e Helix · Terme dei Sette Sapienti · Caseggiato degli
Aurighi · Case a Giardino · Serapeo · Terme del Mitra e Mitreo delle Terme del Mitra · Domus di
Amore e Psiche · Campo della Magna Mater · Porta Laurentina · Domus della Fortuna Annonaria ·
Mitreo di Felicissimo · Porta Marina · Terme di Porta Marina (o della Marciana) · Sepolcro di
Cartilio Poplicola · Edificio dell'opus sectile fuori Porta Marina · Necropoli della via Ostiense ·
Tomba degli Archetti · Colombari gemelli · Necropoli Laurentina.

Each carries a date, a patron or a measurement and no ranking. Locators: the ancient street name
plus the park's ticket address, Viale dei Romagnoli 717, 00119 Roma. `kind: historic-site`.

**Necropoli Laurentina** takes `status: closed` — the operator states it verbatim, an affirmative
sourced closure. The prose may say the tomb paintings are in the Musei Vaticani; that is a
statement about where objects are displayed, not a claim that any place here is Vatican territory.

### REWRITE (7 in the park)

**Parco archeologico di Ostia antica — Scavi di Ostia.** Replace the phone with
`+39 06 5635801`. **Cut "273,638 visitors in 2023"** — it.wikipedia's park article carries no
visitor figure and nothing fetchable does; the roster's `draw` field is not a source.
**Cut the European Heritage Label.** The finder recommended leaving it out and I am ruling it out:
it is an award, it reads as a listing, and the awarding body's page was never fetched. Keep the
institute facts — autonomous institute created 23 January 2016, director Alessandro D'Alessio since
30 October 2020 — both confirmed. Keep the ticket, hours and CoopCulture facts as written.

**Museo Ostiense.** `kind: museum`, `status: open`, per §2. The Casone del Sale history is fully
confirmed and may be published as the finder wrote it. Optional addition, now sourced: the 2 November
1934 inauguration. Do not write "works of elevated artistic refinement" — that is the panel's
evaluation, not a fact.

**Teatro romano di Ostia.** `kind: theater`. **Cut "uno dei più antichi in muratura"** in any
rendering. **Cut the €14 festival-ticket promotion** — the park dates it to 31 October 2025 and it
is stale. Keep the festival's own dated run (second edition, 25 June – 18 July 2026, four
productions, Teatro di Roma). "Agrippa, Augustus's son-in-law" — the panel says only Agrippa; either
drop the gloss or source it separately.

**Piazzale delle Corporazioni.** Cut the wheelchair sentence entirely. Everything else confirmed.

**Terme del Foro.** Publish exactly: "Built about 160 AD by Marco Gavio Massimo, praetorian prefect
of Antoninus Pius." Cut "le più grandi della città". The finder's own trap call was correct.

**Grandi Horrea.** The panel carries "il più grande edificio commerciale ostiense". The finder's
write-up already avoids it; keeping the warning here so no writer reintroduces it from the source.

**Schola del Traiano.** Cut "Reopened at the Natale di Roma, 2022." Everything else confirmed.

**Sinagoga di Ostia.** Publish "built about the middle of the 1st century AD for the local Jewish
community and completely rebuilt in the 4th century AD" and stop. Cut "una delle più antiche del
Mediterraneo occidentale".

### DROP (park)

- **Domus di Apuleio** — the finder states the panel was "not fetched in this pass". A source that
  was not fetched is not a source. Drop for this wave; recoverable next.
- **Capanno da birdwatching "Aves ostienses"** — the LIPU agreement, D'Alessio and Polinori, the
  Casetta del Custode n. 4 and the Riserva naturale statale Litorale Romano all confirmed, but the
  page states **no opening hours and no public-access policy** for the hide. Drop as a standalone
  place; it may be one sourced sentence inside the park record. Cut "uno dei siti archeologici più
  importanti al mondo".
- **Grano e pane a Ostia antica** and **Sport e atleti a Ostia antica** — navigation, not places.
  The finder's own ruling, and it is right.

---

## 4. The borgo and the rest of the zona — verdicts

### REWRITE (5)

**Castello di Giulio II** · historic-site · Piazza della Rocca · `status: open`. Hours and prices
confirmed from the operator. Restoration works confirmed verbatim, including that the castle stays
open on its usual hours — publish that, it is exactly the kind of sourced access fact the corpus
wants. Exhibition "IN HOC SIGNO. Testimonianze cristiane tra Ostia e Porto" to 21 November 2026,
confirmed. **Three changes:** the Martin V tower is **1423–24**, not 1400 (§1); the staircase
frescoes — it.wikipedia says "affrescato da Baldassarre Peruzzi", so write "frescoed with the myth
of Hercules, attributed to Baldassarre Peruzzi" rather than "the school of"; and **cut the claim
that Pius VII and Pius IX began the first excavations with the castle's convicts**. Note the
operator gives the castle's postal address as Viale dei Romagnoli 717 while Roma Capitale gives
Piazza della Rocca — both are sourced; Piazza della Rocca is the useful locator in a 5.5 km zona.
The evaluative "alto esempio di architettura militare rinascimentale" stays out, as the finder said.

**Borgo di Ostia Antica (Gregoriopoli)** · historic-site · Piazza della Rocca. Gregory IV (827–844),
d'Estouteville as bishop of Ostia 1461–1483 and his three rows of still-inhabited terraced houses,
the 1556 siege of the Duke of Alba and the 1557 flood: all confirmed on two sources. Same Martin V
correction as above.

**Basilica di Sant'Aurea** · historic-site · Piazza della Rocca 13, 00119 Ostia Antica — the address
comes from the parish's own site, which **I fetched and the finder did not**. It confirms the church
was "ultimata nel 1483", initiated by d'Estouteville and completed under Giuliano della Rovere, and
that the architect was Baccio Pontelli. Prefer "completed in 1483" to the finder's vaguer "rebuilt
at the end of the 15th century". **The parish site publishes no Mass times and no opening hours** —
so the record says: "No source states its opening hours, so none are given here." **Cut** the
parish's "la seconda diocesi più importante dopo quella di Roma" — a ranking claim. "Twelve bishops
of Ostia have been elected pope" is a count and publishes. Keep the Sacchi *Martirio di santa Aurea*
and the Pietro da Cortona attribution as attributions.

**Area archeologico-naturalistica delle Saline — molo e banchine fluviali** · historic-site.
Confirmed verbatim: a tufa-block revetment more than 100 m long and 15 m wide, the republican
dating "non può essere assunta con certezza", almost entirely reburied, reached from viale dei
Romagnoli by via delle Saline. `status: open`, prose says no source states its opening hours.
Do not write the access route as a walking impression — name via delle Saline and stop.

**Parco dei Ravennati** · park. Thin — it.wikipedia only. Publish as a bare park record with its
bounding streets and the dedication to the men who drained Ostia. No history beyond that.

### DROP (borgo and zona)

- **Torre di Martino V** — physically inside the castle. Fold into the castle record. Seeding it
  separately puts one structure in two records.
- **Monumento "Agli eroici figli di Ostia"** — the finder itself says it is not established that the
  OSM monument and the *lapide* in piazza Umberto I are the same object. Identity unresolved.
- **Sacrario dei bonificatori del litorale romano** — no address, no hours, no coordinates, one
  local news report. Not publishable.
- **Giardino Filippo Iaia** — one bare list mention.
- **Antichi Lavatoi** — OSM only, no descriptive source of any kind.
- **Saline di Ostia** and **Bagnoletto** — *aree urbane*, place-names not visitable places. Context
  in the zona page; not records.
- **All fourteen bars and restaurants** — *Allo sbarco di Enea*, *Il monumento*, *Arianna al
  Borghetto*, *L'alimentari*, *Restaurant Piazza Ravenna*, *Coccodè*, *Fraschetta del Borgo*,
  *Gran Caffè in Piazza*, *Baretto*, *Dolce caffè*, *Il Gelataio*, *Pizza da Michele*, *Il
  Glicine*. Not one has a source anyone fetched; an OSM address is not an operator's own site, and
  a founding year from one would not publish anyway. The finder's own recommendation, upheld.

---

## 5. Straddlers — two escalated to the arbitrator, two dropped here

**ESCALATED: Stazione di Ostia Antica** (41.75638, 12.30207). Geometry says OUT — 72–83 m outside
the ring under Method A, and Nominatim returns Casal Palocco. it.wikipedia's category says Z. XXXV
and its text says "nell'omonimo quartiere"; I re-fetched the article and both are confirmed. Two
geometric methods against one categorisation, with the boundary prose siding with the geometry.
**My recommendation is exclude**, but this is the candidate a traveller most expects to find in
Ostia Antica and it is the arbitrator's call, not mine. If awarded here, the 10 August 1924 opening,
the original name *Ostia Scavi*, the wartime destruction and 1950s rebuild, the archeostazione
project and the 2019 accessibility criticism are all confirmed on it.wikipedia and publishable.

**ESCALATED: Cd. Palazzo Imperiale** (41.75387, 12.28147). Method A puts it 127 m inside; Nominatim
returns *Isola Sacra, Fiumicino* — a different comune. The finder asked the verifier to settle it
with a second geocoder and I did not obtain one. I will not publish a place into Rome on one method
when the other names a different municipality: **escalate, and drop if unresolved.** The finder's
own fallback applies — there are eighty other monuments here.

**DROP: Ponte della Scafa.** Out by 21 m, and both boundary descriptions use the bridge as the
*corner* where the shared boundary meets the Tiber. A boundary corner shared with Fiumicino is not
this zona's.

**DROP: Tor Boacciana.** All three methods put it in Q. XXXIII Lido di Ostia Ponente. That the
Parco administers it and publishes it under "Scavi di Ostia" is an operator's grouping, not a
toponymic boundary. Flagged to the arbitrator for Ostia Lido's benefit, but it is not ours.

**Porta Marina fringe — noted, not escalated.** Seven records lie 16–63 m inside the southern
boundary. All test IN under both methods and all lie inside the excavation's own OSM multipolygon,
which is wholly inside the zona ring. Recorded so nobody redoes it.

---

## 6. Rejects confirmed

All of §6 stands. The six Fiumicino sites (Museo delle Navi, Necropoli di Porto all'Isola Sacra,
Porti Imperiali, Sant'Ippolito, Iseo Portuense, ex-O.N.C. tombs) are administered by the Parco but
are **not in Roma Capitale** and must not be written in any Rome file. Pianabella, Sant'Ercolano,
the Cimitero di Ostia Antica and Cineland are inside Rome but outside Z. XXXV. **Ville costiere di
Procoio** — untested for want of coordinates; do not write it until someone tests it. **Ecomuseo
del litorale romano** — the operator's site served no text and MiC's address is not a street of this
zona; correctly excluded.

---

## 7. Tier ruling — against the surviving count

**52 places survive.** Thirty-nine ship as written, thirteen ship with the wording fixed above.
That is a **full guide**, not a town page, and it is the largest honest yield in this wave.

The evidential position is genuinely the strongest of the nine units: the park's own didactic-panel
tree gives a dated, patron-named, function-stated page per monument, and I re-fetched eight of them
at random with an eight-for-eight confirmation rate. Hours and prices come from the operator's own
site for the park, the museum and the castle. The borgo supplies a second, non-archaeological
cluster — a 1483–86 fortress, a church completed in 1483 by the same architect, three rows of
still-inhabited 15th-century terraced houses.

**But cut further before writing.** Fifty-two records of which thirty-nine are ruined buildings in
one fenced field is a catalogue. The finder said so itself and then listed forty-five anyway. My
recommendation to the writer: keep all five borgo-and-zona records, the park, the museum, and
**twenty to twenty-five** scavi monuments chosen so that each district of the ancient city is
represented — theatre, forum, baths, warehouses, housing, the cults, the gates and walls, the two
necropoleis. The rest are a list, and the panel set will still be there for a later wave.

**Photographs: `"photos": []` on all 52.** Nothing here is in architectural copyright. Before any
photo wave touches the scavi, the Museo Ostiense interiors or the Castello, read the Parco's
reproduction regulation, which the finder correctly located.

**Banned throughout:** no designation, protection or listing claim; no European Heritage Label; no
mention of the Historic Centre of Rome UNESCO property, which is 25 km away; no superlative from
any source, including the six the Parco and it.wikipedia supply; no research method in reader-facing
text; no trip durations and no orientation by impression. "In Ostia Antica" locates nothing across
5.5 km — every record carries a street.
