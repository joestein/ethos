# Colonna (R. III, Roma Capitale toponymic code 103) — FINDER file

Wave 2, Rome programme. Research date **2026-09-02**. This is **evidence, not adjudication.**
I am not deciding what ships. A verifier adjudicates the facts; an arbitrator rules ownership of
straddlers with all four wave-2 files in front of it.

**Rulings observed.**
- *No designation claims.* Nothing below says `vincolato`, `vincolo`, "listed", "protected
  monument", "national monument", "declared a monument", "bene culturale tutelato" or
  "dichiarazione di interesse culturale", in English or Italian. I did not attempt Vincoli in Rete
  or the Catalogo generale — the scope research already recorded them as socket-refused, and
  re-testing them would only re-establish a fact the programme has ruled on.
- *Vatican.* No Vatican City place is claimed for Colonna, and none is near it. Colonna **does**
  hold one Lateran Treaty **Art. 15** extraterritorial property — the Palazzo di Propaganda Fide —
  and §4 states its status in the exact terms the ruling requires, with the primary text quoted and
  the Art. 15 / Art. 16 distinction kept apart.
- *No photographs.* `"photos": []` everywhere. I sourced, named and linked no image. Photo leads
  are quarantined in §10 for the later wave.
- *Wave-1 reservation.* Nothing on the reserved list appears below as a Colonna place. Colonna does
  not border Campitelli, Monti, Trastevere or Borgo, so the reservation barely bites here; §8.6
  records the one place where it could have.

---

## 1. Headline numbers

| | |
|---|---|
| Distinct OSM objects whose geometry touches Colonna (boundary relations and metro lines excluded) | **246** |
| Of those, named | 229 (**217 unique names** — 12 duplicate-name groups) |
| Unnamed (memorial plaques, shrines, two fountains, one archaeological polygon) | 17 |
| **Geometric straddlers — flagged, NOT resolved by me** | **15 objects / 12 distinct places** |
| **Source-conflict straddlers** (geometry says one rione, a cited source says another) | **8** — §6.2, and these are the dangerous ones |
| Guide-worthy candidates I would actually put in front of a verifier | **~78** (§4 and §5) |
| Candidates that are food-and-drink or lodging noise | ~150 (§7 — collected deliberately, not filtered out) |

The brief named seven likely subjects. Two of them are **wrong**, and finding that out is the single
most useful thing in this file — see §2.1. The rest expanded to roughly 78 defensible candidates.

---

## 2. Corrections to the brief, up front

### 2.1 "Galleria Colonna and Palazzo Colonna" is a name trap. Neither is in rione Colonna.

The brief lists, among Colonna's likely subjects, "the Galleria Colonna and Palazzo Colonna". Tested
against OSM boundary geometry, vertex by vertex:

| Object | OSM | Vertices by rione |
|---|---|---|
| **Palazzo Colonna** (Piazza dei Santi Apostoli) | `way`/`rel` named *Palazzo Colonna* | **Trevi 94 / 94** |
| **Galleria Colonna** (the Colonna family picture gallery, inside that palazzo) | node named *Galleria Colonna* | **Trevi 1 / 1** |
| **Galleria Alberto Sordi**, *già* Galleria Colonna (the 1922 shopping arcade on Piazza Colonna) | `relation/325554` | **Colonna 76 / 76** |

Three names, two buildings, two rioni. The palace and its picture gallery belong to **Trevi** and
are that finder's business. What Colonna has is the *arcade*, which carried the name "Galleria
Colonna" until 2003 — it.wikipedia's own lead: *"La galleria Alberto Sordi (già galleria Colonna) è
un edificio di Roma, situato in piazza Colonna, inaugurato il 20 ottobre 1922"*
(https://it.wikipedia.org/wiki/Galleria_Alberto_Sordi).

**If the Trevi finder and I both take a "Galleria Colonna", we will have shipped two different
buildings under one name.** Flagging for the arbitrator explicitly.

### 2.2 Colonna does not border Parione, and Largo di Torre Argentina is nowhere near it

The brief's watch-list ("the Corso Vittorio Emanuele II line at Parione's south edge … Largo di
Torre Argentina, which is on Pigna's boundary") is a wave-wide list, not a Colonna list.
it.wikipedia's rione article states Colonna's five neighbours street by street:

> Il rione confina con: **Ludovisi** — via degli Artisti, via di Sant'Isidoro, via Veneto;
> **Trevi** — piazza Barberini, via del Tritone, largo Chigi, piazza Colonna, via del Corso;
> **Pigna** — via del Caravita, piazza sant'Ignazio, piazza San Macuto, via del Seminario;
> **Sant'Eustachio** — piazza della Rotonda, via del Pantheon, piazza e via della Maddalena;
> **Campo Marzio** — via di Campo Marzio.
> — https://it.wikipedia.org/wiki/Colonna_(rione_di_Roma)

Ludovisi, Trevi, Pigna, Sant'Eustachio, Campo Marzio. **No Parione, no Campitelli, no Piazza
Venezia.** Note also what that list *means*: Colonna's boundary is not "near" Piazza Colonna and Via
del Corso — **it runs down them.** Every one of Colonna's five borders is a named public space, so
almost every contested object in this file is a piazza or a street rather than a building.

### 2.3 The Palazzo di Propaganda Fide is cleanly inside Colonna — but a plausible pin says otherwise

I first tested Propaganda Fide with a hand-picked coordinate off Piazza di Spagna and got **Campo
Marzio**. That was my error, not the data's: the pin was in the piazza, not on the building. The
actual footprint is unambiguous — `relation/37216`, `wikidata=Q1473122`, **55 of 55 vertices in
Colonna**. it.wikipedia agrees: *"sito nel rione Colonna con affaccio su piazza di Spagna"*.

The trap is real and worth writing down for the programme: **the palazzo fronts a piazza that is in
a different rione.** Piazza di Spagna itself is Campo Marzio (83 / 86 vertices; the 3 in Colonna are
its southern kerb). Anyone geocoding "Palazzo di Propaganda Fide, Piazza di Spagna" by address
string rather than by footprint will assign it to Campo Marzio.

---

## 3. Method

### 3.1 Geometry, not reverse geocoding

I used the method the Trastevere finder recommended the programme standardise on, and it held up.

1. Pulled boundary geometry for **all 22 rioni** from Overpass:
   `rel["boundary"="place"]["place"="quarter"](41.85,12.42,41.95,12.55); out geom;`
2. Stitched unordered way fragments into closed rings by endpoint matching. **All 22 units resolved
   to exactly one clean closed ring each** — no gaps, no multipolygon ambiguity. Colonna's ring is
   156 points.
3. Ray-casting point-in-polygon locally. No per-lookup network, no rate limit, deterministic.
4. For ways and relations I fetched full geometry and tested **every vertex**, so a street or a
   piazza reports *all* the rioni it crosses rather than just the one its centroid lands in.

**Colonna's boundary relation:** OSM `relation/5452709`, `official_name=Rione III Colonna`,
`ref=R. III`, `wikidata=Q1110986`, `wikipedia=it:Colonna (rione di Roma)`,
`wikimedia_commons=Category:Rione III - Colonna`.
https://www.openstreetmap.org/relation/5452709
Bounding box 41.8989971–41.9055833 N, 12.4764842–12.4887383 E — about 730 m by 1010 m.

**The `ref` normalisation trap is confirmed again.** 21 rioni carry `ref=R. <numeral>`; Trastevere
alone carries the bare `ref=XIII`. Any roster join on `ref` must normalise or it will drop exactly
one row.

**Polygon sanity check**, run before I trusted anything (8 landmarks with independently known
rioni): Column of Marcus Aurelius→Colonna, Palazzo Chigi→Colonna, Montecitorio obelisk→Colonna,
Sant'Andrea delle Fratte→Colonna, Trevi Fountain→Trevi, Pantheon→Pigna, Piazza Navona→Parione,
Spanish Steps→Campo Marzio. 8/8.

### 3.2 Two Overpass gotchas that cost me time — record them for the next finder

- **`out geom tags;` silently returns no members.** The relation comes back with `bounds` and `tags`
  and an empty member list, so every rione "resolves to zero rings" and every point tests as being
  in no rione at all. `out geom;` is correct and returns tags anyway. A finder who did not print
  ring counts would have concluded that Rome has no boundaries.
- **`overpass-api.de` degrades from 504 to outright `ECONNREFUSED` under a corpus-sized workload.**
  Mine did, mid-run. I added mirror fallback (`overpass.kumi.systems`, `overpass.private.coffee`,
  `overpass.osm.jp`) and finished on the mirrors. 9 of 11 planned filter chunks completed before the
  ban; the two that did not are `amenity=college|university`, `railway=station|subway_entrance`,
  `shop=department_store|confectionery|pastry` and `amenity=clock`. **Known gap** — one college
  (ISIA, §5) came through on another filter, but a pasticceria or a department store in Colonna
  could be missing from my count. This is the one incompleteness I know about.

### 3.3 Sources actually reached, in the order I would trust them

| Source | Status | What it is good for |
|---|---|---|
| **OpenStreetMap / Overpass** | 200 (with the caveat above) | Geometry. Nothing else. |
| **turismoroma.it** — Roma Capitale, Dipartimento Grandi Eventi, Sport, Turismo e Moda | 200 | Roma Capitale's own tourism voice. Per-place pages with a `POINT(lon lat)`, a street address and substantial prose on architects and dates. **The strongest institutional source I found for Colonna.** 13 of 47 slugs I guessed resolved; the rest 404. No enumerable index — `sitemap.xml` is ~50 URLs and does not list the `luoghi` corpus. |
| **sovraintendenzaroma.it** | 200 | Roma Capitale's heritage voice. The per-monument URL pattern the Trastevere finder discovered still works. `fontane/fontana_in_piazza_colonna` and `musei/musei_in_comune/galleria_d_arte_moderna` are the two Colonna hits. |
| **vatican.va** *Zone extraterritoriali vaticane* | 200 | Primary, for §4. |
| **it.wikipedia (`action=parse` / `action=query`, raw wikitext and extracts)** | 200 | Enumeration and leads. **Attribute it or replace it** — the corpus rule says write what the institution says, not what Wikipedia says. |
| **camera.it** | 200 but useless | The Montecitorio institutional page I wanted returned a broken organ-listing stub. **Unfinished work** — the Camera's own description of its building is the right source for Palazzo Montecitorio and I did not find it. |
| **governo.it** | 404 on every Palazzo Chigi path I guessed | Same problem: turismoroma is currently carrying Palazzo Chigi, and the Presidency's own page would be better. **Unfinished work.** |
| `comune.roma.it` / `dati.comune.roma.it` | not retried | Recorded unreachable by the scope research. The Roma Capitale **negozi storici** register lives there, which is why §7.1 cannot support a single "historic shop" claim. |

**Shell warning, confirmed.** Everything above was fetched with `python3` + `urllib` and an explicit
User-Agent (a bare urllib request gets **HTTP 406** from Overpass). I did not use piped `curl`,
`grep` or `find` for anything load-bearing.

---

## 4. The Lateran Treaty property — Palazzo di Propaganda Fide

**Kind:** palace; seat of a Roman Curia dicastery; Lateran Treaty Art. 15 extraterritorial property.
**Address:** the block between Piazza di Spagna, Via di Propaganda and Via Capo le Case. Roma
Capitale does not publish a page for it; it.wikipedia gives "piazza di Spagna". Its own OSM object
carries no `addr:*` tags. **A verifier should source a street number before one is published.**
**Rione:** Colonna. `relation/37216`, `wikidata=Q1473122`, **55/55 vertices**. Not a straddler.
**What it is:** the headquarters of the Holy See's missionary dicastery, known since the 2022 Curia
reform as the **Dicastero per l'evangelizzazione**; vatican.va's own 2001 list still calls it *"sede
della Congregazione per l'Evangelizzazione dei Popoli"*. Both names are sourced; the corpus should
carry the current one and not present the 2001 wording as current.
**Architecture:** the Piazza di Spagna front is Bernini's; the Via di Propaganda front and the
interior **Cappella dei Re Magi** are Borromini's. it.wikipedia on the chapel: *"Si trova
all'interno del Palazzo di Propaganda Fide ed è opera di Francesco Borromini"*
(https://it.wikipedia.org/wiki/Cappella_dei_Re_Magi). **Not verified by me against a non-Wikipedia
source** — treat the Bernini/Borromini attribution as needing a second source before publishing.

### Status wording — this is the part the ruling constrains

**[PRIMARY]** vatican.va, *Zone extraterritoriali vaticane* (updated 03.04.2001), lists as entry 5
of 13 Rome properties: *"il Palazzo di Propaganda Fide, sede della Congregazione per
l'Evangelizzazione dei Popoli"*, within a list introduced as buildings which *"godono del privilegio
della extraterritorialità e sono esenti da espropriazione e da tributi."*
https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html

**[PRIMARY]** Lateran Treaty **Art. 15** grants these properties, *"even if such edifices form part
of the territory of the Italian State … the immunities granted by International Law to the
headquarters of the diplomatic agents of foreign States."* Art. 16 covers a **different** list
(Gregorian University, the Biblical/Oriental/Archaeological Institutes, the Russian Seminary, the
Lombard College, the two palaces of Sant'Apollinare, the Sts John and Paul clergy retreat house) and
grants only exemption from expropriation and tax, **with no immunity clause**. Text as quoted in
`docs/rome/scope-vatican-and-extraterritorial.md` from
`https://web.archive.org/web/20110813090725if_/http://www.vaticanstate.va/NR/rdonlyres/3F574885-EAD5-47E9-A547-C3717005E861/2528/LateranTreaty.pdf`

**Publishable:** it stands on Italian soil, in the rione of Colonna, in the Comune di Roma; it holds
the immunities international law gives a diplomatic mission's headquarters; a visitor there is under
Italian law.
**NOT publishable:** that it is "in the Vatican", "Vatican territory", "part of Vatican City", or
that crossing its threshold is crossing a border. It is not, and it is not.
**Also not publishable:** the Art. 16 exemption language as though it were the Art. 15 grant.
it.wikipedia's lead conflates them — *"è uno dei possedimenti extraterritoriali della Santa Sede ed
è esente da espropriazioni e tributi"* runs the two articles together in one sentence. vatican.va's
own framing does the same. **The corpus must not copy either.**

**Related, same block, separate candidate:** *Museo Missionario di Propaganda Fide*, OSM
`node/13256178943`, 41.9041682 / 12.4833858, Colonna. I found no institutional page confirming
current opening; `propagandafide.va` did not resolve, `evangelization.va` returned 200 but I did not
find a museum page on it. **Do not publish hours.**

---

## 5. Candidates, cleanly inside Colonna

Every entry's rione is established by full-geometry point-in-polygon against `relation/5452709`
unless the row says otherwise. "v" = vertices inside Colonna / vertices total.

### 5.1 The rione's namesake and the political core

**Colonna di Marco Aurelio** — ancient honorific column · `way/201735339`, `wikidata=Q265384`, v 20/20
· Piazza Colonna · Erected between 180 and 193 to celebrate Marcus Aurelius's victories over the
Marcomanni, Sarmatians and Quadi; shaft 29.617 m (100 Roman feet), 42 m with the base; **still on
its original site**, and it is what gave the piazza and then the rione their name.
https://it.wikipedia.org/wiki/Colonna_di_Marco_Aurelio
Roma Capitale adds: base originally 12 m and decorated with reliefs lost in the 1589 restoration,
when Marcus Aurelius's bronze statue was replaced at the summit by one of **St Paul**; an internal
spiral staircase lit by slit windows; the frieze narrates the wars against the Germani (172–173) and
the Sarmatians (174–175). https://www.turismoroma.it/it/luoghi/piazza-colonna
*Discrepancy for the verifier:* Roma Capitale dates the column "(176-192 d.C.)"; it.wikipedia says
180–193. Both are sourced and they do not agree. Do not average them.

**Piazza Colonna** — square · `way/724033212` `wikidata=Q63785` v 26/26; a second polygon
`way/370495506` v 3/3 · Roma Capitale: *"Centro degli affari e della vita politica della città"*,
bounded by Palazzo Chigi, Palazzo Ferrajoli, the Bergamaschi church, Palazzo Wedekind and the
Galleria; laid out toward the end of the 16th century under Sixtus V.
https://www.turismoroma.it/it/luoghi/piazza-colonna
**Boundary note:** it.wikipedia names *piazza Colonna* itself as part of the Colonna/Trevi line. The
polygon nevertheless sits wholly inside Colonna — see §6.3 on why that is expected and why it is not
proof.

**Fontana di Piazza Colonna** — fountain · `way/201735344` `wikidata=Q3747429` v 73/73 ·
Sovrintendenza Capitolina: *"realizzata tra il 1575 e il 1577 su disegno di Giacomo della Porta
(1533-1602) ed è stata scolpita da Leonardo Sormani (c.1540-1602)"*; materials white marble,
portasanta and travertine; originally fed by the **Acquedotto Vergine**, restored under Gregory XIII
(1572–1585).
https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_in_piazza_colonna

**Palazzo Chigi** — palace; seat of the President of the Council of Ministers · `relation/325553`
`wikidata=Q2047548` v 17/17 · `addr` on the object: **Piazza Colonna 1** · Roma Capitale: begun
mid-16th century for the **Aldobrandini**, built by **Matteo Bartolini da Città di Castello** (a
role for Giacomo Della Porta and Maderno is reported but "non è stato chiarito"); sold unfinished in
**1659** to Mario and Agostino Chigi, brother and nephew of Alexander VII; completed by **Felice
Della Greca** (courtyard, Scalone d'onore); attic added in the late 1600s; the Piazza Colonna
portal, the courtyard fountain and the interior decoration are 18th-century; the **Salone d'oro**
carries a Baciccia canvas of 1668; bought by the State in **1916**, Foreign Ministry from **1922**,
seat of the Presidency of the Council since **1961**.
https://www.turismoroma.it/it/luoghi/palazzo-chigi
Roma Capitale also states guided visits happen — **I did not capture the schedule and no hours
should be published from this file.** The Presidency's own site would be the right source and I
could not find a working URL (§3.3).

**Palazzo Montecitorio** — palace; seat of the Camera dei deputati · `relation/2766788`
`wikidata=Q781417` v **166/166** (the largest footprint in the rione) · fronts Piazza del Parlamento
on one side and Piazza di Monte Citorio on the other; seat of the Chamber of Deputies and of
Parliament in joint session. https://it.wikipedia.org/wiki/Palazzo_Montecitorio
The rione article adds that it was inaugurated in **1696** as the seat of the papal courts, the
customs and the police, and became the Chamber's seat in **1918**.
https://it.wikipedia.org/wiki/Colonna_(rione_di_Roma)
**Unfinished work:** both facts are Wikipedia-only. camera.it is reachable and is the correct
source; I failed to find its Montecitorio page.

**Obelisco di Montecitorio** — ancient Egyptian obelisk · `way/629809742` `wikidata=Q740755` v 5/5 ·
Piazza di Monte Citorio · 30 m tall; one of Rome's thirteen ancient obelisks; **brought to Rome by
Augustus in 10 BC**. https://it.wikipedia.org/wiki/Obelisco_di_Montecitorio

**Piazza di Monte Citorio** — square · `way/28160275` and `way/624656554`, `wikidata=Q2579746`,
v 29/29 and 22/22 · between Piazza Colonna and Via degli Uffici del Vicario.
https://it.wikipedia.org/wiki/Piazza_di_Monte_Citorio
*Data hygiene note:* `Q2579746` is attached in OSM both to Piazza di Monte Citorio and to one of the
two Piazza Colonna polygons. One of those two tags is wrong. Do not key anything on it.

**Piazza del Parlamento** — square · `way/28157922` v 26/26 · the Montecitorio building's other
front. No `wikidata`, no it.wikipedia article, no turismoroma page. Thin.

**Camera dei deputati** (`node/5429217410`, `wikidata=Q841424`) and **Presidenza del Consiglio dei
ministri** (`node/5429217409`, `wikidata=Q1740905`) exist as separate institution nodes inside their
buildings. These are **institutions, not places** — they should not become their own records.

### 5.2 Piazza di Pietra and the Hadrianeum

**Tempio di Adriano (Hadrianeum)** — Roman temple, eleven surviving columns embedded in a later
building · `relation/2794129` `wikidata=Q431062` v 27/27 · Piazza di Pietra · it.wikipedia describes
it as an ancient temple *"sito nel Campo Marzio"* — that is the **ancient** Campus Martius, not the
modern rione Campo Marzio, and the corpus must not let the two collide.
https://it.wikipedia.org/wiki/Tempio_di_Adriano
The rione article names it as one of Colonna's surviving antiquities, "in piazza di Pietra", and
notes the building later served as the **Borsa di Roma** (Rome stock exchange).
https://it.wikipedia.org/wiki/Colonna_(rione_di_Roma)
**Unfinished work:** I found no institutional page (turismoroma 404s on both `tempio-di-adriano` and
`hadrianeum`). For a temple this prominent that is a gap worth closing.

**Piazza di Pietra** — square · `way/25632011` `wikidata=Q60840884` v 18/18 ·
https://it.wikipedia.org/wiki/Piazza_di_Pietra

**Collegio dei Bergamaschi** — palace · at the corner of Via di Pietra and Via dei Bergamaschi,
facing Piazza di Pietra · it.wikipedia places it explicitly *"nel rione Colonna di Roma"*; Wikipedia
coordinate 41.900171 / 12.479913 tests **Colonna**.
https://it.wikipedia.org/wiki/Collegio_dei_Bergamaschi

### 5.3 Churches

All are inside Colonna by footprint geometry.

| Church | OSM | v | Sourced facts |
|---|---|---|---|
| **Basilica di Sant'Andrea delle Fratte** | `way/202339987` Q1809794 | 31/31 | Roma Capitale: recorded from the 12th c. as Sant'Andrea *infra hortos*; entrusted by Sixtus V to the Minims in **1585**; general design and façade by **Gaspare Guerra**, 1604–1612; **Borromini** from **1653** (apse, campanile, dome drum); finished by **Mattia de Rossi** in **1691**; campanile nicknamed *"ballerino"*. https://www.turismoroma.it/it/luoghi/basilica-di-santandrea-delle-fratte · it.wikipedia adds: minor basilica by Pius XII on **25 April 1942**; parish of the Order of Minims; also called *santuario della Madonna del Miracolo* after the Ratisbonne apparition of **20 January 1842**; Maximilian Kolbe said his first Mass here on **29 April 1918**. https://it.wikipedia.org/wiki/Basilica_di_Sant%27Andrea_delle_Fratte |
| **Basilica di San Lorenzo in Lucina** | `way/80220852` Q1515316 | 19/19 | it.wikipedia: *"una basilica di Roma sita nel Rione Colonna, non lontano da Palazzo Montecitorio."* https://it.wikipedia.org/wiki/Basilica_di_San_Lorenzo_in_Lucina — **thin.** No turismoroma page; the parish domain did not resolve. Needs work before publishing anything beyond identity. |
| **Chiesa di San Silvestro in Capite** | `relation/449593` Q1625428 | 15/15 | it.wikipedia: *"situato in Piazza di San Silvestro, nel rione Colonna."* https://it.wikipedia.org/wiki/Chiesa_di_San_Silvestro_in_Capite · A separate OSM node, *Reliquia di San Giovanni Battista* (`node/2423068386`, 41.9030259 / 12.4805246, Colonna), marks the relic the church is named for. **Unsourced beyond OSM — do not publish the relic claim on an OSM tag alone.** |
| **Chiesa di Santa Maria Maddalena** | `way/89985320` Q1817386 (OSM name *Santa Maria Maddalena in Campo Marzio*) | 11/11 | it.wikipedia: *"nel rione Colonna, che si affaccia sulla piazza omonima"*; one of the few **rococo** interiors in Rome; holds the remains of **St Camillus de Lellis**; regional church of the Abruzzesi in Rome. https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Maddalena_(Roma) · **Name trap:** OSM's "in Campo Marzio" is the church's historic ecclesiastical epithet (the ancient Campus Martius), not the modern rione. |
| **Chiesa di Santa Maria in Aquiro** | `way/130920755` Q1552500 | 27/27 | it.wikipedia: in **piazza Capranica**. https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_in_Aquiro · Historically important to the rione's identity: the medieval third rione was *Regio Columpne et sancte Marie in Aquiro*. https://it.wikipedia.org/wiki/Colonna_(rione_di_Roma) |
| **Chiesa di San Macuto** | `way/130920751` Q676902 | 11/11 | Roma Capitale: the only church in Italy dedicated to the Breton bishop; *"si trova sulla piazza omonima a Roma, **nel rione Colonna**"*, adjoining the Collegio San Roberto Bellarmino (formerly Palazzo Gabrielli-Borromeo); first mentioned **1192**; parish church by **1422**; ceded to the Confraternita dei Bergamaschi in **1539**, new façade c. **1560** by **Giovanni Alberto de Galvani**, partly rebuilt **1577–1585** to **Francesco Capriani da Volterra**'s design; parish suppressed **1588**; the Bergamaschi left for Santa Maria della Pietà in **1725–26** and the Jesuits took it back under the San Macuto title. https://www.turismoroma.it/it/luoghi/chiesa-di-san-macuto · **But that page's own POINT tests into Pigna — see §6.2.** |
| **Chiesa dei Santi Bartolomeo e Alessandro dei Bergamaschi** (Santa Maria della Pietà) | `way/130920774` Q1106186 | 12/12 | it.wikipedia: *"nel rione Colonna, che si affaccia su Piazza Colonna"*; national church of the Bergamaschi in Rome. https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Bartolomeo_e_Alessandro_dei_Bergamaschi · Roma Capitale: *"fondata nel 1561 come cappella dell'annesso Ospedale dei Pazzi."* https://www.turismoroma.it/it/luoghi/piazza-colonna |
| **Chiesa di San Giuseppe a Capo le Case** | `way/202309914` Q3670675 | 15/15 | it.wikipedia: *"nel rione Colonna."* https://it.wikipedia.org/wiki/Chiesa_di_San_Giuseppe_a_Capo_le_Case — thin. |
| **Chiesa dei Santi Ildefonso e Tommaso da Villanova** | `way/202313171` Q3668224, OSM addr **Via Sistina 11** | 20/20 | it.wikipedia: *"nel rione Colonna, in via Sistina"*; holds an *Adorazione dei pastori* by **Francesco Grassia**, **1670**. https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Ildefonso_e_Tommaso_da_Villanova |
| **Chiesa di Santa Maria Odigitria** (dell'Itria) | `way/202304431` Q2223154, OSM name *Santa Maria d'Itria* | 8/8 | it.wikipedia: *"nel rione Colonna, al civico **82 di via del Tritone**."* https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Odigitria_(Roma) · **Watch this one:** Via del Tritone is the Colonna/Trevi line and tests **Trevi 57 / Colonna 4**. The church's own footprint is Colonna, but its street is overwhelmingly Trevi. |
| **Cappella dei Re Magi** | inside `relation/37216` | — | Borromini, inside Propaganda Fide. §4. |

**Also in the rione article's church list but demolished or vanished** — record as history, never as
places to visit: Santo Stefano del Trullo, Santa Croce a Montecitorio, Santissima Trinità della
Missione, Sant'Andrea della Colonna, San Paolo alla Colonna, Santa Maria Maddalena delle Convertite,
Oratorio dei Santi Andrea e Francesco da Paola delle Fratte, Santa Francesca Romana a Strada Felice.
https://it.wikipedia.org/wiki/Colonna_(rione_di_Roma)
*Santa Maria Maddalena delle Convertite* has its own article and a coordinate that tests Colonna
(41.902306 / 12.480472) — it stood on Via del Corso where Palazzo Marignoli's block now is. It is
**gone**; a guide may not send anyone to it.

**Chiesa evangelica battista in piazza San Lorenzo in Lucina** is listed by the rione article as a
Colonna church. I did not verify it and the piazza it names is itself a straddler (§6.1). Flagged,
not researched.

### 5.4 Palazzi

| Palace | OSM | v | Sourced facts |
|---|---|---|---|
| **Palazzo Wedekind** | `relation/6048274` Q1056799 | 20/20 | Roma Capitale: also *"Palazzo del Tempo"*; built from the second half of the 1600s, present appearance from 19th-c. restorations by **Pietro Camporese** and **Giovanni Battista Giovenale** for Gregory XVI and then the Wedekind family; Camporese's portico has **sixteen columns, twelve of them from the excavations at Veio**, as the Latin frieze inscription records; papal postal office, then briefly Education Ministry of the Kingdom; bought **1879** by the banker **Karl Wedekind**; to **INPS in 1925**; Fascist Party HQ 1943 to the liberation of Rome; postwar home of *Il Tempo*. Address given as **Piazza Colonna 366**. https://www.turismoroma.it/it/luoghi/palazzo-wedekind |
| **Palazzo Ferrajoli** | on Piazza Colonna, at Via del Corso | node `13431481912` v 1/1 for *Palazzo Verospi*; Ferrajoli's own footprint not separately tagged | Roma Capitale: built over the Del Bufalo-Cancellieri houses; modernised **1561** by **Giacomo Della Porta**; restructured **1626** by **Francesco Peparelli**, giving it its present look; to the Niccolini in **1728**; Cardinal **Joseph Fesch**, Napoleon's uncle, installed here under the Empire; bought **1850** by Marchese **Giuseppe Ferrajoli**. https://www.turismoroma.it/it/luoghi/palazzo-ferrajoli |
| **Palazzo Capranica** | `way/25631813` is *Piazza Capranica* (Q103919598, v 20/20); the palace's own footprint is inside it | — | Roma Capitale, stating the rione outright: *"Il palazzo, sito nell'omonima piazza, **all'interno del territorio del rione Colonna**, è un edificio del XV secolo"*; portal inscription dates construction to **1451** for Cardinal **Domenico Capranica**; a Capranica residence first, then from **1457** a college for clerics; square corner tower; two marble portals reading `COLLEGIUM CAPRANICENSE` and `TEATRO CAPRANICA`. Two addresses given: **Via del Collegio Capranica 36-43** and **Piazza Capranica 101**, both testing Colonna. https://www.turismoroma.it/it/luoghi/palazzo-capranica · **Conflict with OSM — see §6.2.** |
| **Palazzo Fiano al Corso** | `way/80220845` Q54863408 | 8/8 | Roma Capitale: 13th-c. core, wholly rebuilt in the 1400s as the residence of the titular cardinals of San Lorenzo in Lucina; **the first fragments of the Ara Pacis were found here in the 1568 excavations**; to the Peretti (Sixtus V's family) mid-1600s; to the Dukes Ottoboni di Fiano in the 1800s, whence the name; sold **1898** to **Edoardo Almagià**; home of the *Circolo degli scacchi* **1923–1990**; salone frescoed mid-1600s by **Giovan Francesco Grimaldi** and **François Perrier**. Address **Piazza di San Lorenzo in Lucina 4**. https://www.turismoroma.it/it/luoghi/palazzo-fiano · **Address caution:** that piazza is itself a straddler (§6.1) even though the palazzo's footprint is not. |
| **Palazzo Gabrielli-Borromeo** | `way/130920810` Q3360871 | 27/27 | Adjoins San Macuto; now the Jesuits' Collegio San Roberto Bellarmino. https://www.turismoroma.it/it/luoghi/chiesa-di-san-macuto · it.wikipedia's own article is a one-line stub. https://it.wikipedia.org/wiki/Palazzo_Gabrielli-Borromeo |
| **Palazzo Macchi di Cellere** | not separately in my sweep; Wikipedia coord 41.900278 tests Colonna | — | it.wikipedia: *"Palazzo Capranica Macchi di Cellere … si trova a Piazza di Montecitorio, nel rione Colonna."* https://it.wikipedia.org/wiki/Palazzo_Macchi_di_Cellere |
| **Palazzo Bocconi** (ex La Rinascente) | Wikipedia coord 41.901708 → Colonna | — | it.wikipedia: eclectic palace in **largo Chigi**, *"nel rione Colonna"*, at **Via del Corso 189**, next to the Galleria Alberto Sordi; built **1886–1889**; since **2010** Zara's main Rome store. https://it.wikipedia.org/wiki/Palazzo_Bocconi · The rione article, citing ArchiDiAP, dates the opening precisely: designed by architect **Giulio de Angelis** and engineer **Sante Bucciarelli**, inaugurated **11 December 1887** in the presence of **King Umberto I** as the *Grandi Magazzini "Alle città d'Italia"*. https://www.archidiap.com/opera/palazzo-bocconi-ex-la-rinascente/ · **Two dates that need reconciling:** "built 1886–1889" vs "inaugurated 11 December 1887". |
| **Palazzo Marignoli** | `relation/1764085` | 41/41 | it.wikipedia: eclectic palace filling the block between **piazza di San Silvestro** and **Via del Corso 180**, bounded by via delle Convertite and via di San Claudio, *"nel rione Colonna."* https://it.wikipedia.org/wiki/Palazzo_Marignoli |
| **Palazzo delle Poste a Piazza di San Silvestro** | `relation/422752` Q56732950 (OSM: *Poste Centrali di Roma*) | 16/16 | it.wikipedia: *"in piazza di San Silvestro … nel rione Colonna"*; 19th century; same block as San Silvestro in Capite, bounded by via del Moretto, via della Vite and via del Gambero; houses post office Roma V.R. (frazionario 55001). https://it.wikipedia.org/wiki/Palazzo_delle_Poste_a_Piazza_di_San_Silvestro |
| **Palazzo Chauvet** | Wikipedia coord 41.903051 → Colonna | — | it.wikipedia: eclectic palace *"in via dei Due Macelli, nel rione Colonna."* https://it.wikipedia.org/wiki/Palazzo_Chauvet · Via dei Due Macelli tests **Colonna 6 / Campo Marzio 4 / Trevi 1** — the building is fine, the street is shared. |
| **Palazzo Theodoli-Bianchelli** | `way/89985441` Q28224734 | 11/11 | OSM + Wikidata only. Not researched. |
| **Palazzo Cipolla** | `relation/1761265` and `node/4616142689` Q131862330, addr **Via del Corso 320** | 19/19 | Exhibition venue of the Fondazione Roma. `fondazioneroma.it` returned 200 but I did not extract a venue page. **Unfinished.** |
| **Palazzo Verospi** | `node/13431481912` (a `tourism=information` marker) | 1/1 | On Via del Corso. No it.wikipedia article. Unresearched. |
| **Palazzo Dotti**, **Palazzo Perucchi** (Via Sistina 121), **Palazzo Serlupi Crescenzi**, **Palazzo dei Gruppi**, **Palazzo ex Banco di Napoli** | `way/337484152` v10, `relation/4772793` v20, `way/130920753` v13, `relation/13412220` v50, `relation/1145237` v10 | all pure Colonna | **OSM-only finds with no article and no institutional page.** They are real buildings inside the rione and I am recording them so the verifier can decide; I would not publish any of them on an OSM name tag alone. |
| **Palazzo Toni** (Via Capo le Case), **Palazzo Ferrini Cini** (Piazza di Pietra), **Casa Vaca** (Via in Lucina) | — | — | Named in the rione article's civil-architecture list; **all three have red-linked or empty Wikipedia articles** and no other source I could reach. The article's own gloss on Palazzo Toni: Romans call it *"dei pupazzi"* for the herms on the piano nobile, and **Massimo d'Azeglio** and **Arnold Böcklin** had studios there. Single-source, uncorroborated. https://it.wikipedia.org/wiki/Colonna_(rione_di_Roma) |
| **Palazzo Piombino** | — | — | **DO NOT PUBLISH AS A PLACE.** The it.wikipedia coordinate (41.901, Piazza Colonna) tests Colonna, but the building there was demolished to make way for the Galleria; the surviving *Palazzo Piombino Margherita* on Via Veneto tests **Ludovisi 17/17**. Two buildings, one name, one of them gone. Historical mention only. |

### 5.5 Shopping arcade, theatres, museums, cinema

**Galleria Alberto Sordi** (già Galleria Colonna) — shopping arcade · `relation/325554`
`wikidata=Q1608940` v **76/76**, plus `way/131235422` v 3/3 and `way/201351056` v 7/7 · Piazza
Colonna · it.wikipedia: inaugurated **20 October 1922**; one of the seats of the Presidency of the
Council of Ministers; fifteen shops inside; reopened **7 December 2003** after restructuring and
renamed for **Alberto Sordi**, who had died that **24 February 2003**.
https://it.wikipedia.org/wiki/Galleria_Alberto_Sordi
The rione article dates construction **1911–1922** and notes the renaming took effect in 2003.
https://it.wikipedia.org/wiki/Colonna_(rione_di_Roma)
**Two sourced dates in tension** (1922 inauguration vs 1911–1922 construction) — compatible, but a
writer must not compress them into "built in 1922". `galleriaalbertosordi.it` did not resolve.
**See §2.1 before writing this one.**

**Teatro Sistina** — theatre · `node/3039065548` `wikidata=Q3516773`, **Via Sistina 129** · v 1/1;
Roma Capitale's own POINT (12.486247 / 41.904437) also tests Colonna · Roma Capitale: inaugurated
**1949** as a cinema-theatre to a design by **Marcello Piacentini**; its reputation rests on the work
of **Garinei e Giovannini**; recognised as *Teatro stabile della Commedia Musicale Italiana* by the
culture ministry in **March 2003**; directed by **Massimo Romeo Piparo** since **July 2013**.
https://www.turismoroma.it/it/luoghi/teatro-sistina
*(`teatrosistina.it` timed out; `sistina.it` returned a 6.8 KB stub. No hours captured — publish
none.)*

**Teatro Sala Umberto** — theatre · `node/4711620948` `wikidata=Q3982125`, **Via della Mercede 50** ·
v 1/1 · Roma Capitale: designed by **Andrea Busiri Vici** with decoration by **Alessandro Bazzani**,
opened **1882** as a concert hall named *Teatro della Piccola Borsa*; enlarged to 650 seats in
**1890** by **Giulio Podesti**; renamed around **1900**; a *Cinemofono* from **1906**; Petrolini
debuted **25 May 1911**; refitted 1913 by **Attilio Spaccarelli** and **Arnaldo Foschini**;
rebuilt 1928 with a 12 m proscenium; cinema through the 1950s–70s; theatre again from **1981**;
cinema d'essai 1991–2001; theatre again from **September 2002**.
https://www.turismoroma.it/it/luoghi/teatro-sala-umberto *(`teatrosalaumberto.com` returned 500.)*

**Teatro Capranica** — historic theatre · `way/89985437` `wikidata=Q3981921` v 9/9 · inside Palazzo
Capranica, and the `TEATRO CAPRANICA` inscription over the right-hand portal is Roma Capitale's own
evidence for it. it.wikipedia uses the **past tense**: *"è stato un teatro di Roma attivo
soprattutto dal XVII al XIX secolo"*. https://it.wikipedia.org/wiki/Teatro_Capranica
**Do not present it as a working theatre.** What it is today needs sourcing.

**Salone Margherita** — café-chantant theatre · Wikipedia coord 41.90445 / 12.483653 → Colonna ·
it.wikipedia: built **1898** to be the capital's principal café-chantant; one of the major examples
of **Liberty** style in Rome. https://it.wikipedia.org/wiki/Salone_Margherita_(Roma) ·
`salonemargherita.com` returned 200; I did not extract from it. **Unfinished.**

**Galleria d'Arte Moderna di Roma Capitale** — civic museum · `node/6497917970` `wikidata=Q3757712`
v 1/1 · **Via Francesco Crispi 24, 00187 Roma** — from the museum's own site footer,
https://www.galleriaartemodernaroma.it/ · Sovrintendenza Capitolina, which runs it: *"Nata nel 1925,
la collezione custodita nella Galleria di Via Crispi documenta l'ambiente artistico romano tra la
seconda metà dell'Ottocento e il secondo dopoguerra"*; part of the **Musei in Comune** system;
free entry for MIC card holders; info line 060608.
https://www.sovraintendenzaroma.it/i_luoghi/musei/musei_in_comune/galleria_d_arte_moderna
**The one unambiguous museum in Colonna.** Note Via Francesco Crispi tests **Colonna 23 / Ludovisi 6
/ Trevi 1** — number 24 is in the Colonna stretch, but the street is shared.

**Nuovo Olimpia** — cinema · `node/1257246656` `wikidata=Q37000496` v 1/1 · 41.9028706 / 12.4789734
(off Via del Corso, by Via in Lucina). Wikidata-only. Unresearched; a working cinema's own site
would settle identity and address.

**Museo Missionario di Propaganda Fide** — §4. **Museo Parigino** — `node/4711620949`, 41.9025331 /
12.481927, Colonna: an OSM `tourism=museum` node with no wikidata and no reachable source. Almost
certainly needs to be dropped, but recording it rather than silently deleting it.

**Gagosian** — commercial gallery · `node/12009401566`, **Via Francesco Crispi 16**, v 1/1. Its own
Rome location page 404'd on the URL I tried. A commercial gallery is a legitimate guide subject;
this one is unsourced beyond OSM.

### 5.6 Antiquity beneath the rione

**Orologio di Augusto** (the Solarium/Horologium Augusti) — Roman monument, largely buried ·
Roma Capitale: a great trapezoidal travertine pavement marking hours, seasons, months and zodiac in
gilt bronze letters, running **from Palazzo Montecitorio to the church of San Lorenzo in Lucina**;
built in **10 BC**, as the inscription on the base of the Montecitorio obelisk — originally its
**gnomon** — records; aligned so the gnomon's shadow fell toward the Ara Pacis on Augustus's
birthday, **23 September**; excavation in a cellar on **Via di Campo Marzio** recovered pavement
with four zodiac names in Greek. **Roma Capitale gives it two addresses: Via in Lucina 16/a and
Via di Campo Marzio 48.** https://www.turismoroma.it/it/luoghi/orologio-di-augusto
**This is a straddler by Roma Capitale's own record — §6.1.**

**Tempio del Sole** — vanished Roman temple · it.wikipedia: dedicated by Aurelian to **Sol
Invictus** in **275**, in regio VII *Via Lata*, in the Campus Agrippae; *"La localizzazione coincide
con l'attuale piazza di San Silvestro, presso la chiesa di San Silvestro in Capite."*
https://it.wikipedia.org/wiki/Tempio_del_Sole_(Roma) · Gone. History, not a place.

**"Resti di Mura Serviane"** — `node/12701919771`, 41.9031022 / 12.4845114, Colonna. **I believe this
OSM node is wrong.** The Servian Wall runs nowhere near Colonna — its known stretches are around
Termini, the Aventine and the Esquiline, kilometres east and south. Recording it as a *finding about
the data*, and recommending it be dropped rather than researched.

**Unnamed `historic=archaeological_site`** — `way/732381`, inside Colonna. Untagged with any name or
wikidata. Someone should look at what it is.

### 5.7 Streets, as places in their own right

Colonna is small enough that its streets carry the guide weight. Full-geometry vertex splits:

| Street | Colonna | Elsewhere |
|---|---|---|
| Via di Capo le Case | 14 | — |
| Via dei Pastini | 10 | — |
| Via di San Claudio | 10 | — |
| Via della Mercede | 9 | — |
| Via Frattina | 9 | — (**but see §6.2**) |
| Via di Campo Marzio | 9 | Campo Marzio 4 |
| Via delle Convertite | 8 | — |
| Via in Lucina | 8 | — |
| Via degli Uffici del Vicario | 7 | Campo Marzio 2 |
| Via delle Colonnelle | 7 | — |
| Via della Vite | 6 | — |
| Via di Pietra | 6 | — |
| Via della Maddalena | 6 | Campo Marzio 1 |
| Via dei Due Macelli | 6 | Campo Marzio 4, Trevi 1 |
| Via del Gambero | 5 | — |
| Via del Pantheon | 5 | — |
| Via degli Orfani | 4 | — |
| Via di Propaganda | 4 | — |
| Via della Colonna Antonina | 2 | — |
| **Via Francesco Crispi** | 23 | Ludovisi 6, Trevi 1 |
| **Via Sistina** | 8 | Campo Marzio 4, Trevi 1 |
| **Via del Tritone** | 4 | **Trevi 57** |
| **Via del Corso** | 21 | **Campo Marzio 32, Trevi 23, Pigna 2** |

**Via del Corso** (`relation/6890532`, `wikidata=Q958299`) is the rione's spine and belongs to four
rioni at once. The rione article: the Corso divides Colonna into a flat western half (part of the
ancient Campus Martius) and a hilly eastern half rising toward the Pincio, where the *domus* of the
wealthy stood. https://it.wikipedia.org/wiki/Colonna_(rione_di_Roma)
**Via Sistina**, per it.wikipedia, *"appartiene al rione Campo Marzio fino all'incrocio con via
Francesco Crispi; in seguito è parte del rione Colonna fino a piazza Barberini"* — a rare case where
a text source describes the split and the geometry agrees with it.
https://it.wikipedia.org/wiki/Via_Sistina

---

## 6. Straddlers — flagged, NOT resolved

### 6.1 Geometric straddlers (multiple rioni contain vertices of the same object)

| Place | OSM | Vertex split | Whose call |
|---|---|---|---|
| **Via del Corso** | `relation/6890532` | Campo Marzio 32 · **Colonna 21** · Trevi 23 · Pigna 2 | four-way; the Pigna 2 is at the Piazza Venezia end and abuts wave-1 territory |
| **Piazza della Rotonda** | `way/1295329514`, `relation/10031734` | **Colonna 30–33** · Pigna 5 | **Colonna / Pigna / Sant'Eustachio.** The single biggest call in this file — see §6.4 |
| **Piazza di Sant'Ignazio** | `way/130807531` Q1120890 | **Colonna 79** · Pigna 5 | Colonna / Pigna. The *church* of Sant'Ignazio is Pigna; the *piazza* is 94 % Colonna |
| **Piazza di San Claudio** | `relation/11497565` | Trevi 11 · **Colonna 11** | **dead even.** No tie-break exists in the geometry |
| **Piazza di San Lorenzo in Lucina** | `way/50017047` Q69800603 | Campo Marzio 15 · **Colonna 9** | Campo Marzio / Colonna. *Palazzo Fiano is addressed to it and Palazzo Fiano is not a straddler* |
| **Piazza di San Macuto** | `way/28677769` | Pigna 13 · **Colonna 5** | Pigna / Colonna. *The church of San Macuto is not a straddler — 11/11 Colonna* |
| **Piazza della Maddalena** | `way/38916785` | Sant'Eustachio 8 · **Colonna 6** | Sant'Eustachio / Colonna |
| **Largo Chigi** | `way/724036186` | **Colonna 12** · Trevi 3 | Colonna / Trevi. Palazzo Bocconi is addressed here |
| **Piazza Barberini** | `way/1371637706` Q947037 | Trevi 12 · **Colonna 5** · Ludovisi 2 | three-way; Trevi's on the numbers |
| **Piazza di Spagna** | `relation/13474926` Q15124814 | Campo Marzio 83 · **Colonna 3** | Campo Marzio's, overwhelmingly. **Colonna should not take it** — but Propaganda Fide fronts it |
| **Via Gregoriana** | `way/192076282` | Campo Marzio 5 · **Colonna 1** | Campo Marzio's |
| **Via del Nazareno** | `way/366692688` | Trevi 1 · **Colonna 2** | tiny; both slivers |
| **Orologio di Augusto** | not an OSM object | Roma Capitale gives **Via in Lucina 16/a → Colonna** and **Via di Campo Marzio 48 → Campo Marzio** | Colonna / Campo Marzio, **on the institution's own two addresses.** A buried monument that genuinely spans the line |

### 6.2 Source-conflict straddlers — geometry and a citable source disagree

These are more dangerous than §6.1, because each one looks settled from whichever side you read
first.

1. **Obelisco Macuteo and the Fontana del Pantheon.** OSM puts both cleanly in **Colonna** — the
   obelisk `way/128740184` (Q3348569) 5/5, the fountain `relation/1737642` (Q3747445) **54/54**.
   Roma Capitale's own pages for both give `POINT (12.476993 41.898996)`, which tests **Pigna**.
   Same two objects, two institutional sources, two rioni.
   https://www.turismoroma.it/it/luoghi/fontana-del-pantheon ·
   https://www.turismoroma.it/it/luoghi/obelisco-macuteo
2. **Chiesa di San Macuto.** Roma Capitale's page **says in words** *"nel rione Colonna"* while its
   own `POINT (12.478788 41.899055)` tests **Pigna**. The building footprint is 11/11 Colonna. The
   prose and the geometry agree; the institution's own coordinate is the outlier.
3. **Piazza di San Silvestro.** it.wikipedia: *"a Roma, nei rioni **Trevi e Colonna**"*
   (https://it.wikipedia.org/wiki/Piazza_di_San_Silvestro). OSM `relation/5457473` (Q3902472):
   **50/50 in Colonna**, no Trevi vertices at all. A text source claims a split the geometry denies.
4. **Palazzo Capranica.** Roma Capitale states the rione explicitly — *"all'interno del territorio
   del rione Colonna"* — and both its addresses test Colonna. But **OSM has an object named "Palazzo
   Capranica" whose 10 vertices are entirely in Sant'Eustachio.** Either OSM has mistagged a
   different building, or there are two palazzi of that name. **Do not resolve this by picking the
   source you like.**
5. **Via Frattina.** it.wikipedia: *"condivisa fra i rioni Colonna a sud e Campo Marzio a nord"*
   (https://it.wikipedia.org/wiki/Via_Frattina). Geometry: **9/9 Colonna.**
6. **Via del Seminario.** The rione article names it as part of the Colonna/Pigna border. Geometry:
   **9/9 Pigna.**
7. **Piazza Colonna.** The rione article names it as part of the Colonna/Trevi border. Geometry:
   26/26 Colonna.
8. **Piazza della Rotonda.** The rione article names it as part of the Colonna/Sant'Eustachio
   border. Geometry: Colonna 30 / Pigna 5, **and no Sant'Eustachio vertices at all.**

### 6.3 Why 5–8 above happen, and why the geometry is not the last word

When a boundary is defined as *"the street"*, OSM's boundary way is drawn along **one kerb**, not
the centreline. A street that **is** the border therefore lands wholly inside whichever rione's kerb
the mapper drew it against. That is exactly the pattern in cases 5–8: every one of them is a place
the rione article names *as a boundary*, and every one of them tests as 100 % inside one rione.

So: **a 100 % vertex score on a place that a text source names as the boundary is weak evidence, not
strong evidence.** It may only mean OSM chose a kerb. The arbitrator should treat Piazza Colonna,
Piazza della Rotonda, Piazza di Sant'Ignazio, Piazza di San Macuto, Via del Corso, Via del Seminario
and Via Frattina as *contested by construction*, whatever the counts say.

Conversely, a 100 % score on a **building** — Propaganda Fide 55/55, Montecitorio 166/166, the
Galleria 76/76, San Macuto 11/11 — is strong, because a building footprint is not a boundary
artefact.

### 6.4 The Piazza della Rotonda problem, isolated

The Pantheon itself is **not contested**: `relation/3374342`, **38/38 vertices in Pigna**. It is
Pigna's, and I do not claim it.

But the piazza in front of it is not Pigna's on this geometry, and the **fountain and obelisk
standing in that piazza test as Colonna's** while Roma Capitale's own pin puts them in Pigna. Every
guidebook in existence treats the Fontana del Pantheon as part of the Pantheon experience. If
Colonna publishes it and Pigna publishes it, the corpus gate fails.

**I am not taking it.** My recommendation to the arbitrator, stated as a recommendation and not a
decision: the fountain and obelisk go wherever the Pantheon goes, i.e. **Pigna**, on the ground that
a visitor cannot experience them separately — and that Colonna's better-evidenced claim to the
*northern* half of Piazza della Rotonda be handled by simply not making Piazza della Rotonda a
Colonna place at all. Colonna loses nothing it needs; it already has its own piazza.

The three-way meeting point of Colonna, Pigna and Sant'Eustachio sits inside this piazza. It is the
sharpest boundary in the whole wave.

---

## 7. Deliberate over-collection — the weak edge

Per the brief's warning that a high confirmation rate is a failure signal, I collected the whole
commercial layer rather than pre-filtering it. **I am not arguing these should ship.**

- **67 restaurants**, **40 hotels**, **21 cafés**, **10 bars**, **9 gelaterie**, all pure-Colonna by
  point-in-polygon. Concentrated on Via della Vite, Via Sistina, Via dei Pastini, Via di
  Sant'Andrea delle Fratte and around the Pantheon's north side.
- The only ones with any independent claim to a guide entry:
  - **Giolitti**, `node/32631124`, Via degli Uffici del Vicario 40 (per OSM `addr`), 41.9010573 /
    12.4772481 — Colonna.
  - **La Casa del Caffè Tazza d'Oro**, `node/261859476` and `node/6124042638`, **Via degli Orfani
    84** — Colonna.
  - **Cartoleria Pantheon dal 1910**, `node/8676288855` — Colonna. The name asserts a founding date;
    **OSM name tags are not a source for founding dates.**
  - **Salotto 42**, `node/2296865963`, Piazza di Pietra 42 — Colonna.
  - **Caffè Aragno**, Via del Corso — **closed.** it.wikipedia: one of Rome's most famous artistic
    meeting places, open **1886 to 1955**, then "Caffè Alemagna", later absorbed into Autogrill as
    "Roma Corso". https://it.wikipedia.org/wiki/Caff%C3%A8_Aragno · History only.
  - **Corinthia Rome**, `node/14079664969`, Piazza del Parlamento 18 — Colonna. Recent, unsourced
    beyond OSM.

### 7.1 Why none of these can carry a "historic shop" claim

Roma Capitale maintains a **negozi storici** register, and `turismoroma.it/it/negozi-storici` exists
— but it surfaced only **six** places city-wide to a static fetch (Colapicchioni, Sala da Babington,
Tebro, plus three non-shops), **none of them in Colonna**. The real register lives on
`comune.roma.it`, which the scope research recorded as unreachable.

**Consequence, and it is the same shape as the designation ruling:** no page may say a Colonna
business is a *negozio storico*, is "historic", "the oldest", or has "been trading since". The
corpus rule already forbids it — an establishment's own website does not establish awards,
superlatives or trading longevity — but here there is no register to appeal to either. Giolitti and
Tazza d'Oro will tempt every writer who touches this rione. Both of their own websites returned 200
but are JavaScript-rendered and yielded **no address and no date** to a raw fetch.

### 7.2 Also collected, also weak

- **17 unnamed objects** inside Colonna: 6 `historic=memorial` nodes (commemorative plaques), 3
  `historic=wayside_shrine` (two named — *Madonna Delle Grazie*, *Madonna con Gesù bambino*), 2
  unnamed fountains, 3 unnamed `historic=yes` polygons, 1 unnamed `historic=archaeological_site`
  (§5.6), 2 unnamed apartments. Rome's *edicole sacre* are a genuine guide subject and the
  Sovrintendenza has an `edicole_sacre` index — which the Trastevere finder recorded as returning
  200 with **zero child links**. Unresolved.
- **ISIA Roma** (Istituto superiore per le industrie artistiche), `node/3883978750`, Q50379463,
  **Piazza della Maddalena 53** — Colonna by geometry, though its piazza is a straddler (§6.1).
- **Fontana del Bufalo**, `node/495048559`, Q108554369, 41.9030148 / 12.4832907 — Colonna. Tagged
  `amenity=drinking_water`; likely a *nasone* or small wall fountain. Not on the Sovrintendenza's
  44-item `fontane` index.
- **Anglo American Bookshop** (Via della Vite 102/103), **Libreria Antiquaria Borromini al Pantheon**
  (Via degli Orfani 91), **Libreria Cicerone** (Largo Chigi 1a) — bookshops, all Colonna.

---

## 8. Things I looked for and did *not* find in Colonna

Recording these so nobody repeats the search.

1. **No park, garden or villa.** Zero `leisure=park` or `leisure=garden` objects inside the rione,
   and Colonna appears on none of the Sovrintendenza's three *ville e parchi storici* indexes. It is
   completely built.
2. **No Sovrintendenza `monumenti` or `beni_architettonici` entry.** All 13 + 11 items on those two
   indexes are elsewhere. Colonna's only two Sovrintendenza pages are the Piazza Colonna fountain
   and the Galleria d'Arte Moderna.
3. **The Trevi Fountain is Trevi's** (12.48326 / 41.90099 → Trevi), despite Colonna reaching within
   ~200 m of it.
4. **Palazzo Barberini is Trevi's** (53/53). The `Palazzo Barberini` node inside Colonna
   (`node/13096046189`) is a `tourism=information` signboard, not the palace. Two more such
   signboards exist — *Palazzo Verospi*, *Palazzo di Montecittorio* [sic]. **Interpretive signs are
   not places.**
5. **Piazza Venezia is not Colonna's, or anyone's near-miss here.** A test point (12.48278 /
   41.89614) returns **Trevi**. It is ~350 m south of Colonna's nearest edge. Recording the value
   only because the brief asked me to watch for it — it is **not** a Colonna finding and I take
   nothing there.
6. **Nothing on the wave-1 reserved list falls inside Colonna.** The nearest reserved item is the
   Vittoriano, and Colonna does not reach it. **I have no dispute to file against wave 1.**
7. **Via Lata** — in the it.wikipedia Colonna category, no coordinate. This is the ancient name of
   the Via del Corso stretch and the name of a Roman *regio*, not a modern street. History only.
8. **Barberini (Metro A station)** — in the Colonna category, but the station tests **Trevi** and its
   name is *Barberini–Fontana di Trevi*. Not Colonna's. **No metro station lies inside Colonna** —
   the Metro A tunnel clips the rione (1–2 vertices) but surfaces nowhere in it. That is a genuine,
   publishable characteristic of the rione if a non-OSM source can be found for it: *the seat of the
   Italian government has no metro stop.* I could not source it beyond OSM. **Do not publish on OSM
   alone.**

---

## 9. What is unfinished, ranked by how much it matters

1. **camera.it's own page on Palazzo Montecitorio** and **the Presidency's own page on Palazzo
   Chigi.** The two most important buildings in the rione are currently carried by Roma Capitale's
   tourism office and by Wikipedia. Both institutions publish about their own buildings; I did not
   find the URLs. **This is the single biggest gap.**
2. **The Hadrianeum has no institutional source.** turismoroma 404s on both obvious slugs.
3. **The four Overpass filters that never completed** (§3.2) — colleges, rail/metro entrances,
   department stores, pasticcerie, clocks. A Colonna pasticceria or historic department store could
   be missing.
4. **Bernini/Borromini at Propaganda Fide** is Wikipedia-only and should not ship on that alone.
5. **Palazzo Cipolla / Fondazione Roma**, **Salone Margherita**, **Nuovo Olimpia**, **Gagosian** —
   all four have live sites that returned 200 or would with a better path, and all four are
   currently Wikidata/OSM stubs in this file.
6. **Six OSM-only palazzi** (§5.4, last rows) exist as footprints with names and nothing else.
7. **Sant'Andrea delle Fratte's own parish site** (`santandreadellefratte.it`) returned 200 and I did
   not mine it. San Lorenzo in Lucina's did not resolve; another domain may exist.
8. **turismoroma has no enumerable index.** 34 of my 47 guessed slugs 404'd. There is almost
   certainly more Colonna material on that site than I found by guessing. Whoever finds the index
   improves every rione file in the programme, not just this one.

---

## 10. Photo leads — quarantined for the later wave, NOT used

`"photos": []` throughout. Noted and deliberately not pursued:

- The it.wikipedia rione article embeds `Rinascente 900.jpg` (Palazzo Bocconi, 1910),
  `LARGOCHIGI29072021 064A.jpg`, `FRATTINAPIOGGIA04022026 089A.jpg` (Via Frattina, 2026),
  `Colonna - via capo le case - palazzo Toni 1020688.JPG`, and a gallery of Via Capo le Case (1991),
  Via Sistina (2018), Via della Vite (1993) and Piazza di San Lorenzo in Lucina (1991).
- `wikimedia_commons=Category:Rione III - Colonna` is on the boundary relation.
- turismoroma credits several of its own images "ph. Turismo Roma" — **Roma Capitale runs a formal
  image-authorisation process** (its Sovrintendenza publishes *"Autorizzazione all'uso di immagini
  del patrimonio culturale di Roma Capitale"* and *"Fotoriproduzioni di opere d'arte dei musei"*).
  That is a licensing gate the photo wave must clear, not a free source.
- **Italy has no freedom of panorama** — already flagged in the roster for EUR and MAXXI. It bites
  here for the **Teatro Sistina** (Piacentini d. 1960) and any 20th-century interior.

---

## 11. Provenance of every fetch behind this file

All via `python3` + `urllib`, explicit User-Agent, responses cached to disk.

- Overpass API (`overpass-api.de`, then mirrors `overpass.kumi.systems`, `overpass.private.coffee`,
  `overpass.osm.jp`) — boundaries for 22 rioni; ~1,577 objects over a
  41.8955–41.9095 N / 12.4720–12.4925 E bounding box across 9 completed filter chunks; targeted
  name and ID queries.
- `it.wikipedia.org/w/api.php` — `action=parse&prop=wikitext` (rione article, raw), and
  `action=query` with `prop=coordinates|extracts|info` and `list=categorymembers` for
  `Categoria:Roma R. III Colonna` (47 members) and `Categoria:Chiese di Roma (rione Colonna)`
  (19 members). **Raw JSON and raw wikitext — never a WebFetch summary**, per the fact-fidelity
  finding in `scope-sources.md`.
- `turismoroma.it` — 47 slug probes, 13 hits, 6 full page bodies extracted.
- `sovraintendenzaroma.it` — 7 index pages, 2 item pages.
- `vatican.va` — the extraterritorial-zones list, quoted in §4.
- `galleriaartemodernaroma.it` — address, from the site's own footer.
- Probed and failed, recorded so nobody re-probes: `governo.it` (404 on 2 paths),
  `teatrosistina.it` (timeout), `sanlorenzoinlucina.it` (NXDOMAIN), `santamariaddalena.it`
  (NXDOMAIN), `sansilvestroincapite.com` (NXDOMAIN), `galleriaalbertosordi.it` (NXDOMAIN),
  `propagandafide.va` (NXDOMAIN), `teatrosalaumberto.com` (500), `gagosian.com` Rome page (404),
  `zara.com` (403), `camera.it/leg19/1102` (200 but a broken stub).
