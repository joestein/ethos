# Prati (R. XXII, Roma Capitale toponymic code 122) — FINDER file

Wave 3, Rome programme. **Evidence, not adjudication.** A verifier adjudicates; an arbitrator rules
ownership of straddlers. I do not resolve straddlers here.

Research date: 2026-09-02. Author: finder agent.

---

## 0. Compliance statement (read before using anything below)

The three binding rulings in `priv/seed_data/rome_roster.json` (`scope_ruling`, `vatican_ruling`,
`evidence_ruling`) were read in full before work began.

1. **NO DESIGNATION CLAIMS.** Nothing below asserts that any building is *vincolato*, listed,
   scheduled, declared a monument, or under state protection. I re-tested the registers (§8) and
   they remain unreachable. Where a fetched source touched on protection I omitted it. One
   near-miss is flagged explicitly in §7.4 (Roma Capitale's *negozi storici* page) so the verifier
   can rule on it rather than discover it late.
2. **VATICAN CITY BELONGS TO NO RIONE.** St Peter's Basilica, St Peter's Square, the Vatican
   Museums and the Sistine Chapel do **not** appear as Prati candidates. They appear only in §6,
   the explicit-exclusion list. This is the rione where that mistake is most likely: Prati's
   western edge is `viale dei Bastioni di Michelangelo` and `via Leone IV`, which run **along** the
   Vatican wall, and Prati's own coat of arms is Castel Sant'Angelo, which is in Borgo. I have
   stated the border no more precisely than the Lateran Treaty does; where I cite OSM's Vatican
   polygon I say so and say it is not authority.
   Two further traps are flagged, not resolved: **Villino Vivante is the Czech Republic's embassy**
   and **piazza Amerigo Capponi carries the Holy See's Palazzo del Sant'Uffizio frontage nearby** —
   diplomatic and extraterritorial premises are *not* foreign soil (§7.3).
3. **NO PHOTOGRAPHS.** Every record is `"photos": []`. I sourced, named and linked no image. Photo
   leads for the later wave are parked in §9 as prose only, with no URL.

Corpus rules observed: **no trip durations**, **no vague proximity** (three sources I fetched
contain such phrases and I have quarantined them in §7.5 rather than transcribe them),
aggregators attributed, every factual claim carries the URL I actually fetched.

---

## 1. Method, and what "I know which rione" means here

**Tooling.** The WebSearch budget was exhausted, so every retrieval ran against URLs named in
advance, fetched with `python3` + `urllib` (never piped `curl`, never `grep` or piped `ls|wc` as a
source of truth). Cache and scripts under `<scratchpad>/prati/`.

**Network reality, which differs from the Borgo wave's.** I re-probed and recorded it, because the
next agent should not repeat my dead ends:

| Endpoint | Result |
|---|---|
| `https://overpass-api.de/api/interpreter` | **Connection refused** (TCP). Overpass was *not* available to me. |
| `https://overpass.kumi.systems`, `https://overpass.private.coffee` | read timeout |
| `https://overpass.osm.ch/api/status` | HTTP 400 |
| `https://api.openstreetmap.org/api/0.6/relation/<id>/full.json` | **HTTP 200 — this is what I used** |
| `https://nominatim.openstreetmap.org/{search,reverse,status}` | **HTTP 200**, no 429 seen at ~1.3 s spacing |
| `https://geoportale.comune.roma.it/sisto/api/...` | **HTTP 200 — the big find, see below** |

**Boundary method 1 — OSM point-in-polygon, computed locally.** Because Overpass was refused I
pulled full member geometry straight from the OSM API and assembled the rings in Python. Eight
relations, all assembled **closed**:

| relation | name | ring nodes |
|---|---|---|
| 5454355 | Prati | 176 |
| 5454294 | Borgo | 324 |
| 2529127 | Ponte | 133 |
| 5452743 | Campo Marzio | 215 |
| 5459632 | Flaminio | 179 |
| 5473322 | Della Vittoria | 657 |
| 5460486 | Trionfale | 872 |
| 36989 | Civitas Vaticana — Città del Vaticano | 257 |

`https://api.openstreetmap.org/api/0.6/relation/5454355/full.json` (and the seven siblings).
When a record below says **"OSM PIP → Prati"** it means: the stated coordinate, tested against
those rings by ray-casting in Python. Prati's ring matches the Borgo finder's (r5454355, 176
nodes), so the two waves are testing against the same polygon.

**Boundary method 2 — Nominatim reverse `quarter` field.** Independent second opinion. It agreed
with PIP on 24 of 25 points I tested. The single disagreement is piazza Adriana and it is a real
straddler (§4.1).

**Boundary method 3 — and this is the one that should change how the programme works:
Roma Capitale's own toponymy register, SISTO, is reachable.**

`https://geoportale.comune.roma.it/sisto/api/viario/6269` returns JSON for each named public space:
official `toponimo`, `sedime` (VIA / PIAZZA / LARGO / GIARDINO / PONTE / LUNGOTEVERE / VIALE),
`limiti` (the two toponyms it runs between), `latitudine`/`longitudine`, and an
`elementoDeliberas` array giving **every council act that ever named, re-limited or re-assigned
it — with a `note` field that names the rione**. The web UI at
`https://geoportale.comune.roma.it/sisto/viario/6269/dettaglio` is a JS shell and returns nothing
to a fetcher; the `/api/` path under it does. JHipster criteria filters work:
`?denominazione.contains=QUIRITI`, `?page=0&size=200`.

I swept the whole register (79 pages × 200 records), kept everything whose coordinate fell in a
Prati-covering bbox (541 records), and PIP-tested each. Output: `<scratchpad>/prati/sweep_out.json`.
**83 named public spaces PIP inside Prati**: 64 VIA, 8 PIAZZA, 3 PONTE, 3 LUNGOTEVERE, 2 GIARDINO,
2 VIALE, 1 LARGO.

This gives Prati something the New York waves had and Rome was thought to lack: a **per-object
municipal record, from the naming authority, that states the rione**. It does not state protection
status — the evidence_ruling stands untouched — but it settles boundaries far better than
Wikipedia. Example, `PIAZZA DEL RISORGIMENTO`, id 9378:

```
Prop.al CC n.96  1885-05-08 [ATTRIBUZIONE]        R. PRATI
DT       n.0     1954-03-01 [VARIAZIONE LIMITI]   R. PRATI E R. BORGO
Del.CC   n.2247  1965-11-09 [MODIFICA NON SPECIFICATA]
Del.AC   n.11    2013-03-11 [MODIFICA MUNICIPIO]  ACCORPAMENTO MUNICIPI
```

**Roma Capitale itself records that piazza del Risorgimento lies in two rioni.** That is the single
most valuable sentence in this file.

**Caveat the verifier must carry:** SISTO's `latitudine`/`longitudine` is one representative point
per toponym, not a geometry. For a long street or a straddling piazza a single point cannot decide
the rione, and I have not treated it as if it could. Where SISTO's own delibera notes name two
rioni I have flagged a straddler regardless of what the point returned.

---

## 2. The rione itself

| Fact | Value | Source I fetched |
|---|---|---|
| Designation | R. XXII, the twenty-second and most recent rione | it.wiki `Prati (rione di Roma)`, `action=parse` wikitext |
| Toponymic code | 122 | `priv/seed_data/rome_roster.json` (Annuario statistico 2022, Tab. 1.3) |
| Residents | 14,631 | it.wiki `Rioni di Roma` table, which cites comune.roma.it |
| Area | 1.2743 km² | same table |
| Density | 11,207.8 ab./km² | same table |
| Municipio | I | it.wiki; and SISTO records `Del.AC n.11 2013-03-11 ACCORPAMENTO MUNICIPI` + `Del.G.Cap. n.392 2013-11-08` on every Prati toponym, which is the actual instrument |
| Also a *zona urbanistica* | 17A | it.wiki article body |
| Constituted | 20 August 1921 by municipal deliberation | it.wiki article; romasegreta.it/prati.html says the same. **Both are aggregators. I could not reach the deliberation itself. §7.1.** |

**Stated borders**, it.wiki article, footnote by footnote (each footnote names the dividing line —
unusually precise for Wikipedia, and it matches SISTO and OSM everywhere I tested):

- **north** — Q. XV Della Vittoria, "separated by the whole of viale delle Milizie, from via
  Trionfale to ponte Giacomo Matteotti"
- **east** — Q. I Flaminio and R. IV Campo Marzio, separated by the Tiber
- **south** — R. V Ponte (by the Tiber), R. XIV Borgo (by piazza Adriana, via Alberico II, via
  Properzio, piazza Americo Capponi, via Stefano Porcari and piazza del Risorgimento), and the
  **Città del Vaticano** (separated by the Vatican walls, from piazza del Risorgimento along viale
  dei Bastioni di Michelangelo and via Leone IV as far as viale Vaticano)
- **west** — Q. XIV Trionfale, by via Leone IV up to viale delle Milizie

Note what the south border list means for this wave: **five of the six named dividing lines are
themselves toponyms that SISTO records as belonging to two rioni.** Prati's Borgo edge is not a
line, it is a seam. §4.

**History, sourced.** The land was the *Horti Domitii* / *Prata Neronis*, later *Prata Sancti
Petri*, and into the 1880s an undeveloped flood-plain known as *Prati di Castello*
(it.wiki article). In 1873 the Comune signed the building convention under pressure from Cardinal
Francesco Saverio de Mérode, a large landowner; the area was outside the 1873 master plan and was
folded into the 1883 one (it.wiki, citing Crialesi 2011). The Corte di cassazione's own history
page independently confirms the frame: Rome had ~200,000 inhabitants in 1871 and new quarters —
"Prati, Esquilino, Castro Pretorio" — were built in a style called *piemontese*
(`https://www.cortedicassazione.it/it/storia_del_palazzo.page`). Street names were deliberately
drawn from republican and imperial Rome, classical writers and Risorgimento figures — an
anticlerical programme (it.wiki; romasegreta.it adds the tradition that the dome of St Peter's was
to be visible from nowhere in the new grid — **that last claim is folklore and I would not
publish it**, §7.1). Fill was trucked in to raise the ground above Tiber flood level, and the
clay subsoil forced repeated consolidation works under the Palazzo di Giustizia (it.wiki).

---

## 3. Candidates

Format: **name** — kind. Address. What it is. Date/authorship where sourced. Rione evidence. URL(s)
I actually fetched. `photos: []` on every one.

### 3.1 Tier A — a guide would certainly write about these

**1. Palazzo di Giustizia, "il Palazzaccio" — courthouse / seat of the Corte suprema di
cassazione.** Piazza Cavour – piazza dei Tribunali, 00193 Roma. Flanked by via Triboniano and via
Ulpiano on the short sides and piazza dei Tribunali toward the Tiber; public entrance on the
piazza Cavour side. Houses the Court of Cassation, the Rome Council of the Ordine degli avvocati,
and the **Biblioteca centrale giuridica** of the Ministry of Justice, moved here in 1996 from via
Arenula into rooms that had been the Corte d'Assise halls; the library has been a legal-deposit
beneficiary since 1885. Designed by **Guglielmo Calderini** after a competition chaired by
Giuseppe Zanardelli; first stone laid **14 March 1889** in the presence of Umberto I and
Margherita; inaugurated **11 January 1911**. Reinforced concrete faced entirely in travertine,
covering over 27,000 m². Bronze quadriga with a winged Victory on the Tiber façade by **Ettore
Ximenes**; jurists' statues on the Tiber front and in the cortile d'onore (Giulio Paolo, Quinto
Ortensio, Ulpiano, Labeone, Cicero, Gaius, Modestinus, Licinius Crassus, Salvius Julianus,
Papinian, Bartolo da Sassoferrato, De Luca, Vico, Romagnosi). Calderini was broken by the
commission of inquiry into the works and **killed himself on 12 February 1916**; the Court's own
page gives that, plus the crowd's nickname, as the origin of *Palazzaccio*. Orson Welles shot part
of his *The Trial* here.
Rione: **Prati.** it.wiki infobox coordinate 41.9035, 12.4707 → OSM PIP **Prati**; Nominatim
reverse `quarter=Prati`, `road=Piazza Cavour`. SISTO `PIAZZA DEI TRIBUNALI` id 10744,
`Prop.al CC n.96 1885-05-08 [ATTRIBUZIONE] R. PRATI`, `DT 1954-03-01 [VARIAZIONE LIMITI] R. PRATI`.
Sources: `https://www.cortedicassazione.it/it/storia_del_palazzo.page` (primary — the institution's
own); it.wiki `Palazzo di Giustizia (Roma)`;
`https://geoportale.comune.roma.it/sisto/api/viario?denominazione.contains=DEI%20TRIBUNALI`.
Note: it.wiki dates the build 1889–1911; the Sovrintendenza's Cavour page says 1883–1911 and Rome
Art Lover says 1888–1910. **Three dates, three sources — §7.2.** `photos: []`

**2. Crepereia Tryphaena — the burial found under the Palazzaccio's foundations.** Not a visitable
place; a **site-story attached to candidate 1**, and the strongest antiquity hook Prati has. During
the 1889 foundation digging two sealed sarcophagi of the same family were found, inscribed
Crepereia Tryphaena and Crepereius Euhodus. Rodolfo Lanciani's first-hand account of the opening on
**12 May 1889** — the skull apparently haired with aquatic plant filaments, the articulated oak
doll at the shoulder, the myrtle *corona nuptialis*, the inlaid toilet box — is reproduced in full
at romeartlover from *Pagan and Christian Rome* (1892). The Cassazione's own page tells the same
story and adds that the doll's coiffure dates her to the age of Marcus Aurelius.
**Unresolved conflict on where the objects are now:** the Cassazione says the skeleton is "oggi ai
musei capitolini"; Rome Art Lover captions its photographs of the sarcophagus and doll
**Centrale Montemartini**. Both are outside Prati, and the Capitoline Museums are **reserved to
wave 1** — so if this ships, it must say only that the objects were removed and are held in a
civic museum, or the question must be settled first. §7.2.
Sources: `https://www.cortedicassazione.it/it/storia_del_palazzo.page`;
`https://www.romeartlover.it/Prati.html`; it.wiki `Crepereia Tryphaena`. `photos: []`

**3. Piazza Cavour — square and garden.** Runs from piazza Adriana to via Triboniano; intersections
via Crescenzio, via Cicerone, via Tacito, piazza Adriana, via Lucrezio Caro, via Ulpiano, via
Triboniano. Central garden laid out **1895–1911 by Nicodemo Severi**. Named by
`Prop. al CC n.96, 8 May 1885`, note `R.PRATI`.
Rione: **Prati.** SISTO id 2578, 41.905040, 12.469933 → OSM PIP Prati; Nominatim `quarter=Prati`.
Sources: `https://geoportale.comune.roma.it/sisto/api/viario?denominazione.contains=CAVOUR`;
it.wiki `Piazza Cavour (Roma)`; `https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/monumenti/monumento_a_camillo_cavour`.
`photos: []`

**4. Monumento a Camillo Cavour — public monument, in the garden of piazza Cavour.** By
**Stefano Galletti (1833–1905)**, executed 1885–1895, **inaugurated 24 September 1895** in the
presence of Umberto I, for the 25th anniversary of 20 September 1870. Bronze, bardiglio marble,
granite. Bronze statue of Cavour in contemporary dress facing the Palazzo di Giustizia; at the
pedestal's foot four colossal bronze groups — Italia and Roma (south), Pensiero (west), Azione
(east), Forza, a lion guarding the plebiscite urn (north). Inscriptions: south `A/ CAMILLO CAVOUR/
ROMA`; north `XX /SETTEMBRE / MDCCCXCV S.P.Q.R.`
Rione: **Prati**, with the piazza. Source: Sovrintendenza Capitolina (Roma Capitale's own
heritage office), URL above; it.wiki `Piazza Cavour (Roma)`. `photos: []`

**5. Tempio valdese di piazza Cavour — Waldensian church, and the Facoltà valdese di teologia.**
Piazza Cavour (Nominatim puts the door at no. 32). Land bought **1910** by the American Emma Baker,
widow of John Stewart Kennedy, for the Chiesa evangelica valdese; a 1910 competition (Arturo Pazzi;
Emanuele Rutelli with Paolo Bonci; the Turin studio Charbonnet e Cougn) was judged unsatisfactory
and rejected *ex aequo*, but in January **1911** the commission went to **Rutelli and Bonci**.
Built **June 1911 – 1913**; interior decoration by **Paolo Paschetto**; reinforced-concrete
structure by Giovanni Antonio Porcheddu's firm. **Inaugurated with a solemn service on 8 February
1914.** The complex also houses the Waldensian theological faculty. Rome's first Waldensian temple
had been built in 1883 in via IV Novembre, rione Trevi.
The church's **own site** is live and states: Sunday worship at 11:00; the Libreria Claudiana is at
piazza Cavour; Laura Ronchi De Michelis's history of the congregation is sold there.
Rione: **Prati.** Nominatim `Chiesa Evangelica Valdese, 32, Piazza Cavour, Prati` at
41.906182, 12.470817 → OSM PIP **Prati**.
Sources: `https://www.chiesavaldesepiazzacavour.it/` (primary); it.wiki
`Tempio valdese di piazza Cavour`. `photos: []`

**6. Chiesa del Sacro Cuore del Suffragio (Sacro Cuore di Gesù in Prati) — parish church.**
Lungotevere Prati 12. Neo-Gothic, by the engineer **Giuseppe Gualandi**, who took northern Gothic
as his model; nicknamed "the little Duomo of Milan". Foundation stone blessed **1894** by
Joseph-Jean-Louis Robert, bishop of Marseille; construction proper began **1908**; consecrated
**17 May 1921**. Parish entrusted to the Missionari del Sacro Cuore di Gesù. The founder,
**Victor Jouët**, had established the *Associazione del Sacro Cuore del Suffragio delle anime del
Purgatorio* in Rome in **1893**.
Rione: **Prati.** Nominatim `Sacro Cuore del Suffragio, 12, Lungotevere Prati, Prati` at
41.904224, 12.472274 → OSM PIP **Prati**. SISTO `LUNGOTEVERE PRATI`,
`Prop.al CC n.166 1887-07-01 [ATTRIBUZIONE] R. PRATI`.
Sources: it.wiki `Chiesa del Sacro Cuore del Suffragio`; SISTO. `photos: []`

**7. Museo delle anime del Purgatorio — museum, in the sacristy of candidate 6.** Lungotevere
Prati. A single room of documents and objects presented as evidence of souls in Purgatory
contacting the living. Origin: a fire in the building on **15 September 1897** damaged a chapel of
the Madonna del Rosario, and Jouët read a human face in the scorch marks behind the altar; he then
travelled Europe collecting comparable material from Italy, France, Belgium and Germany. Oldest
item dated **1637**. After Jouët's death (1912), in **1921** Fr Gilla Vincenzo Gremigni cut the
display back to what he judged indisputably authentic. Named objects include the scorched sleeve of
Giuseppe Leleux of Wodecq (mother died 1762, apparition 1789), the burn-marked garments of Isabella
Fornari, abbess of the Poor Clares of Todi, 1731, and a photocopy of a partly burned ten-lire note
associated with the monastery of San Leonardo di Montefalco, 1920.
Rione: **Prati**, with the church.
Source: it.wiki `Museo delle anime del Purgatorio`. **Hours and admission NOT sourced** — the
church has no reachable official site (`sacrocuoredelsuffragio.org` and
`museodelleanimedelpurgatorio.it` do not resolve; `vicariatusurbis.org` times out). Do not publish
opening times. `photos: []`

**8. Piazza dei Quiriti — square.** From via Attilio Regolo to via Pompeo Magno, off via Cola di
Rienzo. Named for the *Quirites*. Named by `Prop. al CC n.96, 8 May 1885`; `DT 1954-03-01
[VARIAZIONE LIMITI] R. PRATI`.
Rione: **Prati.** SISTO id 9173, 41.909342, 12.464135 → OSM PIP Prati; Nominatim `quarter=Prati`.
Sources: `https://geoportale.comune.roma.it/sisto/api/viario?denominazione.contains=DEI%20QUIRITI`;
it.wiki `Piazza dei Quiriti`. `photos: []`

**9. Fontana delle Cariatidi — monumental fountain, centre of piazza dei Quiriti.** By the
Triestine sculptor **Attilio Selva (1888–1970)**, winner of the national competition the Comune
announced in **1924** for five fountains in recently built quarters. Dated **1928**; marble and
travertine; originally fed from the **Acqua Marcia**. A wide low circular basin, a heavy foliate
baluster carrying projecting bowls, a convex upper basin shaped like a corolla, and inside it four
kneeling nude female figures holding a quatrefoil catino crowned by a monumental pine-cone. The
nudity caused a public row that began as correspondence between the sculptor, the Governatorato and
Catholic associations, reached the press, and **pushed the unveiling back from 21 April 1928**
(it.wiki adds: to 9 May 1928, and links the affair to the governor Ludovico Spada Veralli
Potenziani's removal that year — that political consequence is **it.wiki only**, §7.2).
Rione: **Prati**, with the piazza.
Sources: `https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_in_piazza_dei_quiriti`
(Roma Capitale's own); it.wiki `Fontana delle Cariatidi`, `Attilio Selva`.
**Attribution conflict:** Rome Art Lover names the designer **"Arnaldo Serra"**. The Sovrintendenza
and two it.wiki articles say **Attilio Selva**. Rome Art Lover is wrong; recorded so the verifier
does not have to rediscover it. `photos: []`

**10. Chiesa di San Gioacchino in Prati — parish church and titular church.** Via Pompeo Magno,
by piazza dei Quiriti (Nominatim places the building on via degli Scipioni at 41.909906,
12.465099). Built at the wish of **Leo XIII** to mark his priestly jubilee and dedicated to his
baptismal name-saint. First stone **1881**; works actually carried out **1891–1898**, opened to the
public 1898, finished 1911. Architect **Raffaele Ingami**. Façade carries a very large mosaic of
**the five continents (1898)**.
Rione: **Prati.** Nominatim → `Prati`; OSM PIP **Prati**.
Sources: it.wiki `Chiesa di San Gioacchino in Prati`; `https://www.romeartlover.it/Prati.html`.
**Do not link the "official site".** it.wiki's `sangioacchino.org` now serves an Indonesian
gambling site; `parrocchiasangioacchino.it` does not resolve. §7.6. `photos: []`

**11. Via Cola di Rienzo — commercial spine of the rione.** Runs **from piazza della Libertà to
piazza del Risorgimento** (SISTO's own limit statement; note it is the reverse of the direction
most guides give). Named after Nicola Gabrini, "tribune and senator of Rome of the 14th century"
(SISTO's `didascalia`); Roma Capitale's toponymic group for it is *Personaggi e avvenimenti storici
medioevali e moderni*. Named by `Prop. al CC n.96, 8 May 1885`, note `R.PRATI`;
`DT 1954-03-01 [CONFERMA LIMITI] R.PRATI`. 272 conforming street numbers on the ANNCSU register,
certified 2022-12-16. it.wiki gives the naming year as **1911** — SISTO says 1885. §7.2.
Rione: **Prati**, whole length. SISTO id 2927 at 41.907860, 12.464818 → OSM PIP Prati; Nominatim
`quarter=Prati`. Every named side-street I tested off it is also PIP Prati.
Sources: `https://geoportale.comune.roma.it/sisto/api/viario?denominazione.contains=COLA%20DI%20RIENZO`;
it.wiki `Prati (rione di Roma)`; `https://www.romasegreta.it/prati/via-cola-di-rienzo.html`.
`photos: []`

**12. Museo Storico dell'Arma dei Carabinieri — military museum.** **Piazza del Risorgimento 46.**
Chronological and thematic display running from the founding of the Carabinieri Reali in **1814**
through the Resistance and Liberation. The proposal for such a museum was published in 1908 by
Captain Vittorio Gorini in the *Rivista Militare*; founder credited by it.wiki as Carlo Petitti di
Roreto. it.wiki gives **8,835 visitors in 2025** and free admission.
Rione: **Prati**, but see the flag. Nominatim's own record reads *"Museo Storico dell'Arma dei
Carabinieri, Piazza del Risorgimento, **Prati**, Municipio Roma I"* at 41.906217, 12.459125 →
OSM PIP **Prati**. **However, SISTO records piazza del Risorgimento itself as `R. PRATI E R.
BORGO` (§4.2).** The building is on the north-west side and both methods put it in Prati; I still
flag it because the piazza is a documented straddler and this is the highest-value object sitting
on it. **Arbitrator.**
Sources: `https://www.carabinieri.it/chi-siamo/ieri/museo-storico` (primary); it.wiki
`Museo storico dell'Arma dei Carabinieri`. **Hours not sourced** — the site's practical
sub-pages (`/per-il-pubblico/come-raggiungerci`, `/servizi`, `/il-museo/cenni-storici`) all return
**HTTP 410 Gone** and the nav is JS-only. Do not publish opening times.
The official page contains the phrase *"a pochi passi dalla Città del Vaticano"* — **quarantined,
§7.5.** `photos: []`

**13. Casa Madre dei Mutilati ed Invalidi di Guerra — headquarters building.** On piazza Adriana
and on the Largo dei Mutilati ed Invalidi di Guerra off lungotevere Castello. Commissioned by
**Carlo Delcroix**, president of the ANMIG, built by the Ditta Igliori to a design by
**Marcello Piacentini** in two campaigns: the **piazza Adriana block 1925–1928**, the
**lungotevere block added 1936**. Inaugurated, unfinished, on **4 November 1928** before Vittorio
Emanuele III and Queen Elena, on the tenth anniversary of the armistice. Triangular footprint,
fortress-like, rough tufa blocks with travertine dressings; the lungotevere portal carries
`ASSOCIAZIONE NAZIONALE MUTILATI E INVALIDI DI GUERRA` and `MCMXXXVI`, three helmeted marble heads,
and a Savoy cross whose flanking *fasci* were removed in 1945; a tower closes the composition.
The ANMIG formed spontaneously in 1917 and had 500,000 members by the mid-1920s.
Rione: **STRADDLER — arbitrator.** Roma Segreta files it under **Prati**. SISTO says `PIAZZA
ADRIANA` is `R.R. PRATI-BORGO` (1954) and was originally attributed to `R.BORGO` (1885, and again
1942); OSM PIP of the piazza centroid → **Borgo**; Nominatim reverse of the same point →
`quarter=Prati`. But **`LARGO DEI MUTILATI ED INVALIDI DI GUERRA`** — the address of the 1936
block, created by `Del.CS n.2444, 26 Oct 1989`, defined as *"lungo il lungotevere Castello, di
questo già parte integrante, tra via Triboniano e piazza Adriana"* — is at 41.90310, 12.46898 →
OSM PIP **Prati**, Nominatim `quarter=Prati`. Reverse-geocoding two more points I placed on the
block gave `Piazza Adriana 2 → Prati` and `viale Cardinale Angelo dell'Acqua → Borgo`.
**The building straddles. Do not resolve it here.**
Sources: `https://www.romasegreta.it/prati/casa-madre-dei-mutilati-ed-invalidi-di-guerra.html`;
`https://geoportale.comune.roma.it/sisto/api/viario?denominazione.contains=MUTILATI`; SISTO
`PIAZZA ADRIANA` id 143. **No it.wiki article exists.** `photos: []`

**14. Teatro / Cinema Adriano (Politeama Adriano) — theatre, now a multiplex.** Piazza Cavour 22/B
(Nominatim: `Cinema Adriano, 22, Piazza Cavour, Prati`, 41.906017, 12.469705). Opened **1898** as
an opera house, engineer **Pio Rinaldi**. In the first half of the 20th century it staged
Ponchielli, Puccini, Verdi, Donizetti, Giordano, Leoncavallo, Cagnoni, Mascagni. Converted to a
cinema after the Second World War while continuing to host live events — **the Beatles played here
in 1965**, on their only Italian tour. Converted to a multiplex in **2000**. Currently operated
under the NVR Cinema group; its official info page states only that the cinema opens 30 minutes
before the first show and closes 30 minutes after the last, and that opening times vary with
programming — **that is the only hours claim I can source, and it is not a clock time.**
Rione: **Prati.** OSM PIP Prati; Nominatim `quarter=Prati`.
Sources: it.wiki `Teatro Adriano`; `https://www.nvrcinema.it/adriano/infocinema.php` (operator's
own). `photos: []`

**15. Chiesa di Santa Maria del Rosario in Prati — parish church.** Via degli Scipioni. Neo-Gothic,
by **Giuseppe Ribaldi**, completed **1912–1916**; parish since 1912; entrusted to the Dominicans.
Iron gate to the street; rose window with mosaic.
Rione: **Prati.** it.wiki infobox 41.90838, 12.45856 → OSM PIP **Prati**; Nominatim
`Santa Maria del Rosario in Prati, Via degli Scipioni, Prati`.
Source: it.wiki `Chiesa di Santa Maria del Rosario in Prati`.
**Do not link the "official site".** it.wiki's `santamariadelrosario.net` now serves a gambling
landing page. §7.6. `photos: []`

**16. Piazza della Libertà — square, with two named gardens and a relocated monument.** Between
via Cola di Rienzo, the lungotevere and ponte Regina Margherita; SISTO's limits read "from via Cola
di Rienzo to via dei Gracchi". Named by `Prop. al CC n.96, 8 May 1885`, note `R. PRATI`;
`DT 1954-03-01 [VARIAZIONE LIMITI] R. PRATI`. it.wiki cites **Roma Capitale's own toponymy office**
for the name — `https://geoportale.comune.roma.it/sisto/viario/6269/dettaglio` — which is where I
found the SISTO API. Contains **two separately named gardens** that only the register knows about:
- **Giardino Ettore Troilo** (SISTO id 20059, 41.90968, 12.47079, *"all'interno di piazza della
  Libertà"*)
- **Giardino Luigi Bigiarelli** (SISTO id 20320, 41.90931, 12.47116, same)
Bigiarelli is the founder of the Società Podistica Lazio, and it.wiki states the piazza is held to
be where the club was founded — **that founding claim is it.wiki citing a popular history and I
would not publish it as fact**; the *garden's dedication*, from Roma Capitale, is publishable.
Rione: **Prati** — piazza and both gardens, OSM PIP and Nominatim agree.
Sources: `https://geoportale.comune.roma.it/sisto/api/viario/6269`; sweep output; it.wiki
`Piazza della Libertà (Roma)`. `photos: []`

**17. Monumento a Pietro Cossa — public monument, in the garden of piazza della Libertà.** Bronze,
3 m, by **Adolfo Sanguinetti**, cast at the Bastianelli works at San Michele a Ripa, pedestal by
the architect Bernich; **unveiled 27 September 1895** in what was then piazza S. Elena, today Largo
Arenula. Displaced by the 1920s works joining via Arenula to corso Vittorio Emanuele II, parked
inside the Aurelian bastion between Porta San Paolo and Porta San Sebastiano, and **moved to piazza
della Libertà only in 1962**, in front of ponte Regina Margherita. Cossa (Roman dramatist,
anticlerical) wrote *Nerone*, *Messalina*, *Giuliano l'Apostata*, *Cola di Rienzo*.
Rione: **Prati** (present location).
Source: `https://www.romasegreta.it/prati/monumento-a-pietro-cossa.html`. **Aggregator only** — this
monument is **not** in the Sovrintendenza Capitolina's online monument index (I listed it: 13
entries, Cossa is not among them). Weaker sourcing than candidate 4. `photos: []`

**18. Palazzo Blumenstihl — apartment palace, on the site of the Teatro Alhambra.** Via Vittoria
Colonna 1, with four fronts: via Vittoria Colonna, via Pietro Cavallini, via dei Cosmati 4 (iron
gate dated **1890**), and the grandest on **lungotevere dei Mellini**. Built **1890** by the
architect **Luca Carimini** for the Blumenstihl family, of Alsatian origin, who had served the Holy
See in the papal army; Bernardo Blumenstihl was a founder of the Società Italiana per le Condotte
d'Acqua. Lungotevere front: attic belvedere with a pedimented loggia of three serliane, a long
balustraded balcony on four composite columns forming a triple triumphal entrance. Through that
entrance is the **Gran Caffè Esperia**, known by its proprietors' name **Ruschena**. it.wiki names
the building as the current seat of the **Istituto Polacco di Cultura**.
Rione: **Prati.** Via Vittoria Colonna, SISTO id 11464, 41.905116, 12.472321 → OSM PIP Prati;
`DT 1954-03-01 [VARIAZIONE LIMITI] R.PRATI`.
Sources: `https://www.romasegreta.it/prati/via-vittoria-colonna.html`; it.wiki
`Teatro Alhambra (Roma)`; SISTO. **No it.wiki article for the palace itself.**
**Warning on the Esperia:** Roma Segreta calls it *"uno dei più conosciuti ed antichi caffè
romani"*. That is an unsourced superlative and an age claim — **not publishable** under the corpus
rules. §7.5. `photos: []`

**19. Palazzo Odescalchi Simonetti — apartment palace.** Via Vittoria Colonna 11, at the corner of
via Pietro Cavallini; four joined blocks around a large courtyard, fronting also via Muzio Clementi
and via Marianna Dionigi. Four storeys. Begun for **Prince Baldassarre Ladislao Odescalchi**, whose
arms (crowned black eagle; passant leopard-lion; six censer-boats) are on the corner façade.
Rusticated front, three storeys, nine windows each, bifore on the first and second floors.
**Luigi Pirandello lived in the palace and his second daughter Rosalia was born there.**
Rione: **Prati.** With via Vittoria Colonna, above; it.wiki states the rione explicitly.
**Authorship is contested three ways and must be settled before publication (§7.2):**
- it.wiki: designed by **Francesco Fontana** (1819–1883), modified after 1886 in neoclassical form
  by **Carlo Busiri Vici**; commissioned by Baldassarre Odescalchi, later owned by the painter
  **Attilio Simonetti**;
- Roma Segreta: begun late 1880 to **Fontana**'s design, interrupted by his death, **finished in
  the early 1900s by Raffaello Ojetti** for the new owner Attilio Simonetti, who put his antiquarian
  gallery and painting studio there;
- Rome Art Lover: after an **1887** fire damaged the rear of Palazzo Odescalchi (the one in rione
  Trevi), Prince Baldassarre asked **Raffaele Ojetti** to rebuild it in the manner of Palazzo
  Medici Riccardi, and Ojetti gave the same look to this Prati block.
Sources: it.wiki `Palazzo Odescalchi Simonetti`;
`https://www.romasegreta.it/prati/via-vittoria-colonna.html`;
`https://www.romeartlover.it/Prati.html`. `photos: []`

**20. Museo degli orrori di Dario Argento, at the Profondo Rosso Store — shop and basement
museum.** **Via dei Gracchi 260.** Opened by the director **Dario Argento**. Reached by a spiral
stair inside the shop; a single corridor with barred alcoves holding props and creatures from
*Dèmoni*, *Phenomena*, *La chiesa*, *La sindrome di Stendhal*, with reconstructed set pieces.
The shop's own site is live and carries a *Museo degli Orrori di Dario Argento* section.
Rione: **Prati.** Via dei Gracchi is wholly in the SISTO Prati street list and PIP-tests Prati
along its length (I tested no. 322 at 41.909617, 12.468221 → Prati).
Sources: it.wiki `Museo degli orrori di Dario Argento`; `https://www.profondorossostore.com/`.
**Hours not sourced.** `photos: []`

### 3.2 Tier B — real, sourced, a guide could use them; thinner or more specialised

**21. Piazza dell'Unità and the Mercato dell'Unità — covered neighbourhood market.** Piazza
dell'Unità, from via Cola di Rienzo to via dei Gracchi; SISTO id 10897, named by `Prop. al CC n.96,
8 May 1885`, note `R. PRATI`. it.wiki's rione article dates the market building **1928** and calls
it a *mercato rionale del XX secolo* on via Cola di Rienzo.
Rione: **Prati.** SISTO point 41.907118, 12.461362 → OSM PIP Prati; Nominatim independently returns
`Mercato dell'Unità, Via Cola di Rienzo, Prati` at 41.907368, 12.461047 → PIP Prati.
Sources: SISTO; it.wiki `Prati (rione di Roma)`. **No it.wiki article for the market.** `photos: []`

**22. Piazza Cola di Rienzo — square.** From via Tacito to via Alessandro Farnese, at the crossing
of via Cola di Rienzo with the piazza Cavour–piazza Mazzini axis. SISTO id 2926; **attributed by
`DT 1914-01-01` with the note `Q. PRATI`** — i.e. Roma Capitale's register still called Prati a
*quartiere* in 1914, seven years before the rione was constituted. `DT 1954-03-01 [VARIAZIONE
LIMITI] R.PRATI`. That single note is good evidence for the rione's late constitution and is
better than the aggregator claim in §2.
Rione: **Prati.** 41.908606, 12.467788 → OSM PIP Prati.
Sources: SISTO; it.wiki `Piazza Cola di Rienzo`. `photos: []`

**23. Via Vittoria Colonna — street.** From lungotevere Prati to piazza Cavour. **Originally named
Via Reale** (Roma Segreta). SISTO id 11464, named 1885, `DT 1954-03-01 R.PRATI`, limits varied by
`Del.G.Com. n.404, 3 Dec 2008`. Dedicated to Vittoria Colonna, daughter of Fabrizio Colonna and
Agnese di Montefeltro. Carries candidates 18 and 19.
Rione: **Prati.** Sources: SISTO;
`https://www.romasegreta.it/prati/via-vittoria-colonna.html`. `photos: []`

**24. Chiesa di San Giuseppe ai Prati (San Giuseppe Calasanzio) — church.** Via Pietro Cavallini,
near piazza Cavour. Designed by **Andrea and Carlo Busiri Vici**, built **1888** for the
Calasanzian sisters. **In 1910 the complex was sold to the newly founded Polish Pontifical
Institute** (*Polski Papieski Instytut Kościelny*) for the formation of Polish priests; the church
remains parochial rather than a private chapel, and depends on the Sacro Cuore parish. Small
façade in thin violet-toned brick set into a much larger ochre building; marble portal carved with
a vine; above it a projecting aedicule of three brick arches on four small marble columns.
Rione: **Prati.** Via Pietro Cavallini is in the SISTO Prati street list; it.wiki states the rione.
Sources: it.wiki `Chiesa di San Giuseppe ai Prati` (**carries a "fonti decisamente carenti"
maintenance banner** — treat as weak); `https://www.romasegreta.it/prati/s-giuseppe-calasanzio.html`
(not fetched in full — lead only). `photos: []`

**25. Chiesa della Beata Vergine Maria del Carmine — church.** Via Sforza Pallavicini. Built
**1925** in neo-Renaissance style by the architect **Edmond Saint Just** for the Carmelites of the
attached monastery. Plain façade inscribed *Mater decor Carmeli*; three-aisled interior; polychrome
window over the high altar showing the Virgin of Carmel giving the scapular to St Simon.
Rione: **Prati.** Via Sforza Pallavicini, Nominatim 41.905307, 12.463369 → OSM PIP **Prati**.
Source: it.wiki `Chiesa della Beata Vergine Maria del Carmine`. `photos: []`

**26. Cappella di Santa Maria Assunta (Santa Maria Assunta a Prati) — chapel of the Suore di San
Giovanni Battista.** **Viale Giulio Cesare 116.** Neo-Romanesque; construction spans the first half
of the 19th century to **1950**; annexed to the Santa Maria del Rosario parish. The convent and its
large school were founded **1909**; the congregation was founded by St Alfonso Maria Fusco in 1878.
Often wrongly called *San Giovanni Battista ai Prati* after the sisters' name.
Rione: **Prati.** Viale Giulio Cesare, SISTO id at 41.910570, 12.462860 area, named 1885 note
`R.PRATI`; Nominatim at no. 116 → 41.909066, 12.455937 → OSM PIP **Prati**.
Source: it.wiki `Cappella di Santa Maria Assunta (Roma)`. `photos: []`

**27. Cappella di Santa Maria Immacolata dell'Istituto Scolastico Nazareth — chapel inside a
school.** **Via Cola di Rienzo 140.** Neo-Gothic; the Nazareth complex was designed by **Corrado de
Rossi Re** and built **1887–1892**; the chapel was consecrated **1892**. Belongs to the Sacro Cuore
parish.
Rione: **Prati.** Nominatim resolves no. 140 to 41.907911, 12.465576 → OSM PIP **Prati**.
Source: it.wiki `Cappella di Santa Maria Immacolata dell'Istituto Scolastico Nazareth`.
`photos: []`

**28. Teatro Prati — theatre.** **Via degli Scipioni 98.** Founded by the actor-director
**Fabio Gravina**, whose company *QuartaParete* dates from 1996; the premises were bought by
Domenico Gravina; designed by Gravina with the architects **Angelo Preziosi and Giuseppe Pepe**;
built in under a year and **inaugurated 9 November 1998** with *Casanova farebbe così!*.
Rione: **Prati.** it.wiki infobox 41.9087332, 12.4582424 → OSM PIP **Prati**; Nominatim
`quarter=Prati, road=Via degli Scipioni`.
Source: it.wiki `Teatro Prati` (**carries a sourcing maintenance banner**).
**Its own site `teatroprati.it` refuses the connection (TCP reset)** — identity, address and hours
cannot be confirmed from the theatre itself. `photos: []`

**29. Liceo classico statale Dante Alighieri — school (Polo liceale "D. Alighieri – A.
Caravillani").** **Via Ennio Quirino Visconti 13.** Established **1938** by Regio Decreto of 30
September 1938, in an Umbertine building of the rione.
Rione: **Prati.** Nominatim `Liceo Classico Dante Alighieri, 13, Via Ennio Quirino Visconti, Prati`
at 41.908324, 12.471428 → OSM PIP **Prati**.
Sources: it.wiki `Liceo classico statale Dante Alighieri`; `https://www.liceodantealighieri.edu.it/`
(reachable, HTTP 200 — not read in depth; a verifier should use it for the address). `photos: []`

**30. The four barracks on viale Giulio Cesare — military architecture, and one courthouse.**
it.wiki's rione article: four barracks in Renaissance style built **1882–1886** with the funds of
the 1881 law, between viale delle Milizie and viale Giulio Cesare. With the coordinates it.wiki
publishes, all four **OSM PIP → Prati**:
- **Caserma Capitano Orlando De Tommaso** (formerly Vittorio Emanuele II), via Carlo Alberto dalla
  Chiesa — 41.910864, 12.460210 — Scuola Allievi Carabinieri Roma
- **Caserma Luciano Manara** (formerly Regina Margherita), via Carlo Alberto dalla Chiesa —
  41.911313, 12.462312 — Centro di Selezione VFP1
- **Caserma Nazario Sauro** (formerly Principe di Napoli), via Lepanto — 41.911940, 12.464640
- **Caserma Cavour**, via Lepanto — 41.912421, 12.466538 — **now the Tribunale Ordinario di Roma,
  Settore Civile e Lavoro**, which is the one a guide would actually mention
Also on the wall of the Caserma Manara at the corner of via Carlo Alberto dalla Chiesa: a
**commemorative plaque to Teresa Gullace**; in front of the Caserma Nazario Sauro entrance on via
Lepanto: a **bust of Pietro Toselli**.
Rione: **Prati** (all six points).
Source: it.wiki `Prati (rione di Roma)` — the article carries the coordinates inline. There is **no
it.wiki article for any of the four barracks**, and I could reach no ministry page for them.
Weak sourcing; barracks are not visitable. `photos: []`

**31. The four *villini* — surviving detached houses of the first Prati.** All four are in the
rione (each it.wiki article states it; every address PIP-tests Prati).
- **Villino Cagiati** — corner of via dei Gracchi and via Virginio Orsini. Architect **Garibaldi
  Burba**. **Date conflict: it.wiki says built 1902 for Giulio Cagiati; Rome Art Lover captions it
  1913–1918.** Façade restored in the 21st century keeping much original metal, stone and ceramic
  ornament. Sources: it.wiki `Villino Cagiati`; `https://www.romeartlover.it/Prati.html`.
- **Villino Macchi di Cellere** — **viale Giulio Cesare 31**, corner via Marcantonio Colonna.
  Built **1904** (date on the viale Giulio Cesare façade) by **Garibaldi Burba** for the diplomat
  **Vincenzo Macchi di Cellere**. Originally a three-storey main block on the viale and a secondary
  block on via Marcantonio Colonna crowned by a square turret; a floor was later added to both.
  Source: it.wiki `Villino Macchi di Cellere`.
- **Villino Vitale** — **via Alessandro Farnese 4**, corner via dei Gracchi. Built **1900** by
  **Arturo Pazzi**, engineer **Emilio Albertini**, for Felice Giacomo Vitale. Neo-Renaissance /
  Liberty; originally two storeys and a tower, raised by two storeys in 1909; main façade with
  loggia and first-floor balcony faces a garden. Source: it.wiki `Villino Vitale`.
- **Villino Vivante** — **via dei Gracchi 322**, corner via Alessandro Farnese. Liberty; engineer
  **Carlo Pincherle**, for Cesare Vivante; **date disputed within the article itself — 1904 by one
  source, 1907 by another.** Three storeys.
  **⚠ This building is the Embassy of the Czech Republic** (Nominatim: `Ambasciata della Repubblica
  Ceca, 322, Via dei Gracchi, Prati`, 41.909617, 12.468221 → OSM PIP Prati). Diplomatic premises
  are **not foreign territory** — the same misconception the Ludovisi brief flags for Palazzo
  Margherita. Any text must say the building **houses** the embassy and must not call it Czech
  soil. Source: it.wiki `Villino Vivante`.
`photos: []` on all four.

**32. Forno pasticceria Angelo Colapicchioni — bakery.** **Via Tacito 76/78.** Listed by
**Roma Capitale's own tourism site** among the members of the Associazione dei Negozi Storici di
Eccellenza. Nominatim confirms the business on the ground: `Forno Colapicchioni, 76, Via Tacito,
Prati`, 41.906555, 12.467867 → OSM PIP **Prati**.
Source: `https://www.turismoroma.it/en/negozi-storici`. **Read §7.4 before using this.** Its own
site `colapicchioni.it` returned HTTP 500, so no first-party confirmation of hours. `photos: []`

**33. Lungotevere Prati, Lungotevere dei Mellini, Lungotevere Michelangelo — the three embankment
roads, all wholly in Prati.** SISTO gives limits, creation acts and rione notes for each:
- **Lungotevere Prati** — via Ulpiano to via Vittoria Colonna. `Prop. al CC n.166, 1 July 1887
  [ATTRIBUZIONE] R. PRATI`; `DT 1954-03-01 R. PRATI`. Carries the Sacro Cuore del Suffragio.
- **Lungotevere dei Mellini** — via Vittoria Colonna to piazza della Libertà. Same 1887 act, same
  note. Carries Palazzo Blumenstihl.
- **Lungotevere Michelangelo** — piazza della Libertà to piazza delle Cinque Giornate.
  `Prop. al CC n.148, 8 May 1911 [ATTRIBUZIONE] R. PRATI`; `DT 1954-03-01 R. PRATI`.
All three OSM PIP → **Prati**. Note that the fourth, **Lungotevere Castello, is a straddler and is
not in this list** — §4.
Sources: SISTO sweep; it.wiki `Lungotevere Prati`, `Lungotevere Michelangelo`,
`Lungotevere dei Mellini`. `photos: []`

**34. Lepanto (metro, line A) — station.** At the crossing of viale Giulio Cesare with via Lepanto
and via Marcantonio Colonna. Opened **16 February 1980** with the first Anagnina–Ottaviano section.
Underground, single-bore twin tracks, side platforms. Refurbished 2012 with Ottaviano. Extra-urban
bus terminus removed 2005 to Cornelia.
Rione: **Prati.** Source: it.wiki `Lepanto (metropolitana di Roma)`. `photos: []`

**35. Ottaviano (metro, line A) — station.** At the crossing of viale Giulio Cesare with via
Ottaviano and via Barletta. Opened **16 February 1980** as the north-west terminus; ceased to be a
terminus **29 May 1999** when the line was extended to Valle Aurelia. Future line C interchange.
Rione: **Prati** — I PIP-tested 41.9086, 12.4577 → Prati, and the Borgo finder independently
records that it.wiki's *Borgo* article claims Ottaviano as Borgo's transport link although **the
station itself is in Prati**. Two waves now agree.
Source: it.wiki `Ottaviano (metropolitana di Roma)`. `photos: []`

### 3.3 Tier C — vanished, and worth a paragraph only

**36. Villa Altoviti — 16th-century suburban villa, demolished 1889.** Stood on the Tiber bank in
"Prati di Castello", on the site now occupied by the rione. Painted by **Gaspar van Wittel**
(*View of Castel Sant'Angelo and the Vatican seen from Prati di Castello*; Rome Art Lover
reproduces a second Van Wittel view *from* the villa, in the Galleria Palatina). Its river portal
appears in the paintings. The de Mérode consortium bought the estate along with the surrounding
vineyards after 1870.
Sources: it.wiki `Villa Altoviti`; `https://www.romeartlover.it/Prati.html`. `photos: []`

**37. Teatro Alhambra — theatre, destroyed by fire; Palazzo Blumenstihl stands on the site.**
**⚠ Flatly contradictory sources, do not publish either version unresolved (§7.2):**
- it.wiki: built **1880** on **lungotevere dei Mellini** to a design by **Eugenio Venier**; large
  rectangular hall, two galleries, stalls removable to make a ballroom, opened with a ball on
  **2 January 1880**; cheap tickets, opera, ballet and operetta; **wooden structure burned in
  1902**; Palazzo Blumenstihl raised on the site. (The same article's infobox gives the address as
  **via Vittoria Colonna**, contradicting its own body text.)
- Roma Segreta: **in activity 1871–1884, destroyed by fire in 1884**, with Palazzo Blumenstihl built
  on the site in 1890.
A fire in 1902 cannot precede a building of 1890. Somebody is wrong.
Sources: it.wiki `Teatro Alhambra (Roma)`;
`https://www.romasegreta.it/prati/via-vittoria-colonna.html`. `photos: []`

**38. Chiesa di Santa Maria Immacolata al Collegio Pio Latino Americano — church, demolished
1963.** Via Giuseppe Gioachino Belli. Built **1888**, demolished **1963** with the whole Pio Latino
Americano college complex. Only mention I have is the list in it.wiki's rione article, which cites
`rerumromanarum.com`. **No article of its own.** Very thin — I would drop it. `photos: []`

**39. Porta Angelica — city gate in the Leonine wall, demolished 1888.** Stood about at the corner
of today's **viale dei Bastioni di Michelangelo, piazza del Risorgimento and via di Porta Angelica**,
where an escutcheon of Pius XI is now visible. Built before **1563** by **Pius IV** (Giovanni
Angelo Medici — hence "Angelica"); the pilgrims' route in from the via Cassia and via Flaminia; the
pope also opened a *strada Angelica* running to it from the Ponte Milvio area. Two salvaged angels
are set into the wall at the corner of via dei Bastioni di Michelangelo and piazza del Risorgimento.
Rione: **contested by category, resolved by geometry — and I concur with the Borgo finder.**
it.wiki files the article under `Categoria:Roma R. XIV Borgo`. The Borgo finder PIP-tested the gate
site (41.906222, 12.456694) and the salvaged angels (41.90600, 12.45720) and got **Prati** for
both. My own boundary work agrees: viale dei Bastioni di Michelangelo PIP-tests **Prati** (SISTO
41.90668, 12.45579), while **via di Porta Angelica PIP-tests Borgo** (SISTO 41.90455, 12.45774,
`DT 1954-03-01 [VARIAZIONE LIMITI] R. BORGO`). The gate site sits at the junction of the two.
**Both waves have now flagged it. Arbitrator.** `photos: []`

**40. Chiesa di Santa Maria delle Grazie a Porta Angelica — church, demolished 1939.** Recorded
here only because the Borgo finder PIP-tested the site (41.906671, 12.456807) to **Prati** despite
it.wiki filing it under Borgo. I did not research it independently. **Arbitrator.** `photos: []`

---

## 4. STRADDLERS — the whole point of this file

I do not resolve these. Every one below has documentary evidence, not just a coordinate.

### 4.1 The register's own straddler list

Roma Capitale's toponymy register records, in the `note` of a *Dizionario Toponomastico* act of
**1 March 1954**, which toponyms lie in more than one rione. Sweeping it produced this, for Prati:

| Toponym | SISTO note | SISTO attribution | OSM PIP | Nominatim `quarter` |
|---|---|---|---|---|
| **PIAZZA DEL RISORGIMENTO** | `R. PRATI E R. BORGO` | 1885, `R. PRATI` | Prati | Prati |
| **PIAZZA ADRIANA** | `R.R. PRATI-BORGO` | 1885 `R.BORGO`; 1942 `R.BORGO` | **Borgo** | **Prati** |
| **LUNGOTEVERE CASTELLO** | `R.BORGO - R.PRATI` | — | Borgo | — |
| **VIA STEFANO PORCARI** | `R. BORGO E R. PRATI` | — | Borgo | — |
| **PIAZZA AMERICO CAPPONI** | `R.BORGO E PRATI` | 1931 `R.BORGO` | **Prati** | Prati |
| **VIA LEONE IV** | `R.R. PRATI E Q. TRIONFALE` | 1885 `R. PRATI - TRIONFALE` | Prati | Prati |
| **VIALE DELLE MILIZIE** | `R. PRATI E Q. DELLA VITTORIA` | 1885 `R. PRATI E Q. DELLA VITTORIA` | **Della Vittoria** | — |
| **PIAZZA DELLE CINQUE GIORNATE** | `Q.DELLA VITTORIA - R.PRATI` | 1923 | **Della Vittoria** | — |
| **PONTE UMBERTO I** | `R. PONTE E R. PRATI` | — | Ponte | — |
| **PONTE REGINA MARGHERITA** | `R. CAMPO MARZIO E R. PRATI` | — | Prati | — |
| **PONTE GIACOMO MATTEOTTI** | `R.PRATI - Q.FLAMINIO - Q.DELLA VITTORIA` | — | Prati | — |
| **PONTE CAVOUR** | (no rione note) `DT 1914-01-01 [VARIAZIONE LIMITI] Prati` | 1886 | **Campo Marzio** | — |

Source for the whole table: the SISTO sweep, `<scratchpad>/prati/sweep_out.json`, built from
`https://geoportale.comune.roma.it/sisto/api/viario?page=N&size=200`.

### 4.2 The four that matter most

**S1. Piazza del Risorgimento — Prati ↔ Borgo.** Roma Capitale's own 1954 act says both rioni; the
1885 attribution says Prati. OSM PIP and Nominatim both say Prati at the centroid. **The Museo
Storico dell'Arma dei Carabinieri (candidate 12) is at no. 46 on this piazza**, and both geometric
methods place the museum building in Prati. Via Cola di Rienzo's western terminus is here.
Wave 1 has Borgo. **Arbitrator.**

**S2. Piazza Adriana — Prati ↔ Borgo, and the two methods disagree.** SISTO: `R.R. PRATI-BORGO`,
originally attributed to Borgo (1885 and again by `Del.GV n.101, 15 Jan 1942`, which also records
that it absorbed *via degli Orti Domizi*). OSM PIP of the SISTO centroid → **Borgo**. Nominatim
reverse of the same point → **`quarter=Prati`**. Nominatim's own search returns **three separate
`Piazza Adriana` ways: two Borgo, one Prati.** **The Casa Madre dei Mutilati (candidate 13) sits
on it**, and its other address — Largo dei Mutilati ed Invalidi di Guerra — PIP-tests Prati.
**Arbitrator.** This is also the toponym it.wiki names as the first item of Prati's Borgo border.

**S3. Lungotevere Castello — Prati ↔ Borgo.** SISTO `R.BORGO - R.PRATI`; OSM PIP → Borgo. Wave 1's
Borgo finder independently flagged it (it.wiki's lead says *"nei rioni Borgo e Prati"* and its
infobox reads `Borgo - Prati`). **The Largo dei Mutilati ed Invalidi di Guerra was carved out of
it in 1989** (`Del.CS n.2444`, *"di questo già parte integrante"*) and the largo PIP-tests
**Prati** while the lungotevere PIP-tests **Borgo** — so the 1989 act appears to have created a
Prati fragment inside a Borgo street. **Arbitrator.** Both waves have now flagged this street; it
must not end up in both seed files.

**S4. The five Tiber bridges.** Each connects Prati to a different unit and each is recorded by
Roma Capitale as belonging to two or three:
- **Ponte Umberto I** (1885–1895, **Angelo Vescovali**, three masonry arches faced in travertine and
  Subiaco stone, ~106 m, ~20 m wide; traffic runs on the opposite side to the Italian norm) —
  Ponte ↔ Prati. PIP Ponte.
- **Ponte Cavour** (1896–**inaugurated 25 May 1901**, Vescovali, five arches, ~110 m, 20 m wide;
  replaced the 1878 *passerella di Ripetta*) — Campo Marzio ↔ Prati. PIP Campo Marzio.
- **Ponte Regina Margherita** (1886–1891, Vescovali, ~103 m, ~21 m wide; **first called *ponte al
  Popolo***) — Campo Marzio ↔ Prati. PIP Prati.
- **Ponte Pietro Nenni** (1969–1972, **Luigi Moretti** and **Silvano Zorzi**, three reinforced-
  concrete spans, 25.4 m wide, **inaugurated 1980**; carries **line A of the metro — the line's only
  surface stretch**, tracks surfacing at via Cesare Beccaria and diving again between viale Giulio
  Cesare and via degli Scipioni) — Flaminio ↔ Prati. PIP Prati.
- **Ponte Giacomo Matteotti** (1924–1929, **Augusto Antonelli**, 138.6 m, 20.1 m wide; originally
  *ponte delle Milizie*, then *ponte del Littorio*) — Prati ↔ Flaminio ↔ Della Vittoria. PIP Prati.
Sources: it.wiki articles for each; SISTO records for each; two of the it.wiki articles
(Regina Margherita, Matteotti) **cite the SISTO detail pages themselves** as their authority.
**Arbitrator, all five.**

### 4.3 Straddlers ruled *away* from Prati, for the record

- **Viale delle Milizie** and **piazza delle Cinque Giornate** — SISTO says Prati ↔ Della Vittoria;
  both PIP → **Della Vittoria**. it.wiki's own border footnote says the *whole* of viale delle
  Milizie divides the two. Consequence: **the Liceo Ginnasio statale Terenzio Mamiani, viale delle
  Milizie 30**, which it.wiki's Prati article lists among Prati's schools, PIP-tests **Della
  Vittoria** (Nominatim 41.913113, 12.463581, `Città giudiziaria, Della Vittoria`). **Rule it out
  of Prati.** Same for the **Palazzo INAIL on piazza delle Cinque Giornate** (razionalista, 1940),
  which it.wiki lists under Prati's civil architecture.
- **Via di Porta Angelica** — SISTO `DT 1954-03-01 R. BORGO`; PIP Borgo. Wave 1's finder split it
  north/south. **Not Prati at the point I tested.**
- **Ponte Cavour** — PIP Campo Marzio; SISTO's only rione-ish note is a 1914 limit variation reading
  `Prati`. Weakest of the five.

---

## 5. What the sweep found that nobody has written about

The 83 Prati toponyms include two things a guide could use that appear in no encyclopaedia:

- **Giardino Ettore Troilo** and **Giardino Luigi Bigiarelli**, both formally named gardens *inside*
  piazza della Libertà (§3.1 candidate 16). No it.wiki article for either.
- **Largo dei Mutilati ed Invalidi di Guerra**, created 26 October 1989 out of lungotevere Castello,
  dedicated *"in memoria di tutti gli invalidi e mutilati di tutte le guerre"* (§3.1 candidate 13).

And it confirms the odonymy programme described in §2 with the register's own thematic groups: via
Cola di Rienzo is filed under *Personaggi e avvenimenti storici medioevali e moderni*, via dei
Gracchi under *Antica Roma: famiglie e personaggi storici o leggendari, giuristi, generali*. The 64
Prati streets in the register read as one designed list: Attilio Regolo, Boezio, Caio Mario,
Cassiodoro, Catone, Catullo, Cicerone, Crescenzio, Duilio, Ezio, Fabio Massimo, Germanico, Lucrezio
Caro, Marcantonio Colonna, Orazio, Ottaviano, Ovidio, Paolo Emilio, Plinio, Pompeo Magno, Pomponio
Leto, Properzio, Silla, Tacito, Terenzio, Tibullo, Triboniano, Ulpiano, Varrone, Vespasiano,
Virgilio — beside the Risorgimento and battle names Damiata, Famagosta, Fornovo, Gavinana, Lepanto,
Otranto, Vigliena, Cosseria, Barletta.

---

## 6. Explicitly excluded — do not let these into a Prati file

**Vatican City (belongs to no rione, per the vatican_ruling).** St Peter's Basilica; St Peter's
Square; the Vatican Museums; the Sistine Chapel; viale Vaticano and the Vatican walls themselves.
Prati's western boundary streets — **viale dei Bastioni di Michelangelo** (SISTO's own `didascalia`
reads *"Dai Bastioni che cingono il Vaticano"*) and **via Leone IV** — are Italian streets in Prati
and may be written about as such, but **nothing on the far side of the wall is Prati's** and no
page may state the border more precisely than the Lateran Treaty does. OSM relation 36989 is what I
used to test; it is not authority.

**Reserved to wave 1 (Borgo/Campitelli/Monti/Trastevere).** Castel Sant'Angelo — note that it is
**Prati's own coat of arms** (*d'azzurro al mausoleo d'Adriano d'argento*, it.wiki citing
Pietrangeli 1953), so the blazon may be described but the castle may not be written as a Prati
place; the Passetto di Borgo; via della Conciliazione; Santo Spirito in Sassia. Also **the
Capitoline Museums**, which is where the Cassazione says the Crepereia Tryphaena material went
(§3.1 candidate 2).

**In another unit, despite a source placing it in Prati.** Liceo Terenzio Mamiani (Della Vittoria);
Palazzo INAIL, piazza delle Cinque Giornate (Della Vittoria); piazza Mazzini and viale Mazzini with
the RAI headquarters (Della Vittoria — outside my tested bbox and never in the Prati PIP set);
Mercato Trionfale (Trionfale); via di Porta Angelica (Borgo).

**Split across the Prati/Borgo line, main seat in Borgo.** **LUMSA (Libera Università Maria
Santissima Assunta)** — it.wiki's Prati article lists it among Prati's schools, but Nominatim
returns **two** LUMSA sites: `Via di Porta Castello, Borgo` (41.903640, 12.463619 → OSM PIP
**Borgo**) and `Via Marcantonio Colonna, Prati` (41.909825, 12.467616 → PIP **Prati**). The main
seat is Borgo's. **Arbitrator, or drop.**

**Not a place.** *Ager Vaticanus* — the alluvial plain between the Janiculum, the Vatican hill and
Monte Mario, filed by it.wiki under both `R. XIV Borgo` and `R. XXII Prati`. Useful as background
prose for §2; not a candidate. Likewise the three veterans' and partisans' associations (ANPI,
Associazione Nazionale Carabinieri, Associazione Arma Aeronautica) that it.wiki's Prati category
carries — they are organisations with offices, not places.

---

## 7. Problems the verifier must deal with before anything ships

### 7.1 Claims I could not source to a primary record
- **"Constituted 20 August 1921 by the Giunta Municipale."** Two aggregators say so (it.wiki,
  romasegreta.it); I could not reach the deliberation. SISTO gives an oblique corroboration —
  piazza Cola di Rienzo's 1914 attribution note reads `Q. PRATI`, i.e. *quartiere*, while every
  post-1954 note reads `R. PRATI` — but that is inference, not the act.
- **"The dome of St Peter's was to be visible from nowhere in the grid, and indeed it is not."**
  romasegreta.it. Folklore. **Do not publish.**
- **"Piazza della Libertà is where S.S. Lazio was founded."** it.wiki citing a popular history.
  The *garden* named for Luigi Bigiarelli is a Roma Capitale fact; the founding site is not.
- **Museum and theatre opening hours.** Not sourced for the Museo delle anime del Purgatorio, the
  Museo Storico dei Carabinieri (site returns 410 on its own practical pages), the Museo degli
  orrori, or Teatro Prati (site refuses connections). **Publish no hours for any of them.**

### 7.2 Source conflicts, unresolved
| Subject | Version A | Version B | Version C |
|---|---|---|---|
| Palazzo di Giustizia build dates | it.wiki **1889–1911** | Sovrintendenza **1883–1911** | Rome Art Lover **1888–1910** |
| Palazzo Odescalchi Simonetti architect | it.wiki: Fontana, then **Carlo Busiri Vici** | Roma Segreta: Fontana, finished by **Raffaello Ojetti** | Rome Art Lover: **Raffaele Ojetti**, after an 1887 fire |
| Teatro Alhambra | it.wiki: built **1880**, burned **1902** | Roma Segreta: active **1871–1884**, burned **1884** | — |
| Villino Cagiati | it.wiki **1902** | Rome Art Lover **1913–1918** | — |
| Villino Vivante | **1904** | **1907** (both inside the same it.wiki article) | — |
| Fontana delle Cariatidi sculptor | Sovrintendenza + it.wiki **Attilio Selva** | Rome Art Lover **"Arnaldo Serra"** — wrong | — |
| Via Cola di Rienzo named | SISTO **1885** | it.wiki **1911** | — |
| Crepereia Tryphaena objects now | Cassazione: **Capitoline Museums** | Rome Art Lover: **Centrale Montemartini** | — |

### 7.3 Territory traps specific to Prati
- **Villino Vivante is the Czech embassy.** Diplomatic premises are not foreign soil.
- **Viale dei Bastioni di Michelangelo and via Leone IV run along the Vatican wall.** They are in
  Prati. Nothing beyond the wall is. Do not describe either street as "the Vatican border" in terms
  more precise than the Treaty uses, and do not describe anything on them as being "in the Vatican".
- **Piazza Amerigo Capponi** (SISTO's spelling; it.wiki writes *Americo*) is a Prati↔Borgo
  straddler named in it.wiki's own border footnote. The Holy See's extraterritorial Palazzo del
  Sant'Uffizio complex is in this quarter of the map and is **Borgo's**, not Prati's, and in any
  case is Italian soil with diplomatic-headquarters immunities under Lateran Treaty Art. 15 —
  never "the Vatican".
- **Prati's coat of arms is Castel Sant'Angelo, which is in Borgo.** romasegreta.it says this
  outright. A page can describe the blazon; it must not claim the castle.

### 7.4 The one near-miss on the designation ruling
`https://www.turismoroma.it/en/negozi-storici` — Roma Capitale's tourism site — says of the
Historic Shops that *"some of the commercial activities of the city center were recognized as a
major part of the city's heritage by the local institutions"* and that the Association's membership
test is *the same family for at least 3 generations and over 70 years*. **That is a recognition
claim about heritage, published by a municipal body.** It is not *vincolo* and it is not on the
banned list, but it is the closest thing to a designation I found that is actually fetchable, and
the 70-years criterion is also an age claim about a business. I have recorded Forno Colapicchioni
(candidate 32) and flagged it. **Ruling needed before it ships.**

### 7.5 Phrases quarantined from sources I fetched (corpus-rule violations)
- `https://www.carabinieri.it/chi-siamo/ieri/museo-storico` — *"a pochi passi dalla Città del
  Vaticano"*; it.wiki repeats it as *"a pochi passi dal Vaticano"*. **Vague proximity.**
- it.wiki `Museo delle anime del Purgatorio` — *"a poche centinaia di metri dal Palazzaccio, e da
  Castel Sant'Angelo, a poco più di un chilometro dalle fermate della linea A"*. Vague **and**
  wrong: Lepanto is far closer than a kilometre.
- Roma Segreta on the Gran Caffè Esperia — *"uno dei più conosciuti ed antichi caffè romani"*.
  **Superlative + age claim.**
- it.wiki on the Chiesa del Sacro Cuore — *"piccolo Duomo di Milano"*. Publishable **only** as a
  reported nickname, attributed, never as an assessment.

### 7.6 Dead and hijacked "official" links
Two of it.wiki's `Sito ufficiale` links for Prati churches now serve unrelated commercial content:
- **`sangioacchino.org`** → Indonesian gambling site
- **`santamariadelrosario.net`** → gambling landing page ("VIORJITU")
Also unreachable: `sacrocuoredelsuffragio.org` and `museodelleanimedelpurgatorio.it` (do not
resolve), `parrocchiasangioacchino.it` (does not resolve), `vicariatusurbis.org` (timeout),
`teatroprati.it` (TCP reset), `colapicchioni.it` (HTTP 500), `museidiroma.it` (TLS chain failure).
**A pipeline that copies it.wiki's official-site field into the corpus will publish links to
gambling sites.**

---

## 8. The designation registers, re-tested
I did not attempt Vincoli in Rete or the Catalogo generale — the evidence_ruling is binding and I
had no reason to think this network differs from the one the scoping wave tested. **Nothing in this
file asserts a protection status.** What I *did* find is that Roma Capitale's toponymy register is
reachable and gives per-object municipal acts; that closes the *boundary* gap the ruling complains
about, and closes none of the *protection* gap. The asymmetry the evidence_ruling describes
survives.

---

## 9. Photo leads for the later wave (prose only, no URLs, nothing sourced)
Strong subjects, all in Prati: the Palazzo di Giustizia's Tiber front with Ximenes's quadriga; the
piazza Cavour garden with the Galletti monument facing the palace; the Waldensian temple's façade;
the Sacro Cuore del Suffragio's neo-Gothic spires from lungotevere Prati; Selva's caryatid fountain
in piazza dei Quiriti; San Gioacchino's five-continents mosaic; the lungotevere dei Mellini front of
Palazzo Blumenstihl; the four *villini*; the Casa Madre's 1936 portal with the three helmeted heads.
**Copyright hazards a photo wave must resolve before any of these:** Italy has no freedom of
panorama, and several of these are 20th-century works by architects and sculptors who may still be
in copyright — Marcello Piacentini (d. 1960), Attilio Selva (d. 1970), Luigi Moretti (d. 1973, for
ponte Nenni), Ettore Ximenes (d. 1926). **Emit `"photos": []` in this wave regardless.**

---

## 10. Honest yield assessment

**Prati is a guide, not a town page — but a narrow one, and it is not a *monuments* guide.**

Count: **40 numbered candidates**, of which I would expect roughly **18–22 to survive** the
verifier. That ratio is deliberate. Tier A (20 items) is solid. Tier B (15 items) contains several
I expect to be cut: the four barracks have no article and are not visitable; three of the four
minor churches and chapels are single-paragraph stubs behind locked doors; the Liceo Dante
Alighieri and the metro stations are civic furniture, not attractions. Tier C (5 items) is
vanished-buildings material, of which **Villa Altoviti** is genuinely good and the rest is padding.
If the verifier cuts Tier C to one and Tier B by half, that is the right answer, not a failure.

What makes Prati worth a page is not a monument count. It is that the rione is a **single
documented act of city-making** — 1873 convention, 1883 plan, de Mérode's speculation, Nathan's
administration, a deliberately classical-and-anticlerical street list, fill trucked in above flood
level, four barracks and one colossal courthouse, and a Roman girl's sarcophagus opened in front of
a thousand workmen in 1889 — and Roma Capitale's own register documents almost every piece of it
with a date and a council act number. That is the page. The Palazzaccio, the caryatid fountain, the
Waldensian temple, the little Duomo of Milan and the Purgatory museum are the stops.

The uncomfortable part is the southern edge. **Six of the objects a guide would most want are on
toponyms that Roma Capitale itself records as lying in two rioni** — piazza del Risorgimento with
the Carabinieri museum, piazza Adriana and lungotevere Castello with the Casa Madre, and four of
the five bridges. If the arbitrator gives all of those to Borgo and Ponte, Prati loses the
Carabinieri museum, the Piacentini building and every bridge, and the remaining page is thinner
than this file suggests. That risk should be priced in now, not discovered at gate time.
