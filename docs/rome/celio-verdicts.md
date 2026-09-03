# Celio (R. XIX, code 119) — VERIFIER verdicts

Adjudicated 2026-09-02 against `docs/rome/celio-finder.md` (63 candidates). I did not gather the
finder's evidence and I owe it nothing. Every ruling below is mine.

## Counts

| Ruling | Count |
|---|---|
| PUBLISH as written | 23 |
| REWRITE (exact wording supplied below; author uses it verbatim) | 19 |
| DROP | 10 |
| ESCALATE to the arbitrator (straddlers — Celio's author writes none of them) | 11 |
| **Total adjudicated** | **63** |

**Surviving Celio records: 41.** (42 survivors minus one, because I merge finder records 31 and 32
into a single record.)

**TIER RULING: GUIDE.** 41 surviving records, of which 36 are institutional and 5 commercial. The
twelve shipped rioni carry 450 places between them, averaging 37.5 each; Celio at 41 sits above that
average. The yield is not padded: it survives after I dropped six of the finder's §3 records and four
of his nine commercial ones. GUIDE is correct and is not close.

---

## 1. COLLISION CHECK — re-run mechanically, not inherited

`python3 .superpowers/taken_slugs.py` → 450 places, 12 files (452 lines incl. headers). I searched
the dump for 58 stems covering every candidate: `colosseo`, `costantino`, `celio`, `gregorio`,
`giovanni`, `stefano`, `clemente`, `claudio`, `coronati`, `sisto`, `scipio`, `navicella`, `domnica`,
`mura`, `porta`, `arco`, `obelis`, `forma`, `hylas`, `celimontana`, `hilariana`, `tommaso`,
`dolabella`, `silvestro`, `latina`, `druso`, `codini`, `capena`, `sebastiano`, `egerio`, `semenzaio`,
`tempulo`, `vignola`, `scauro`, `mattei`, `salvi`, `antiquarium`, `meta`, `uccelliera`, `chiostro`,
`aula`, `case`, `romane`, plus every commercial name.

**No candidate of the finder's collides with any shipped rione.** The three near-misses are Monti's
and correctly Monti's. I re-derived that from geometry rather than from the finder's table (§2).

Also confirmed unclaimed by anybody: `colosseo`, `arco-di-costantino`, `meta-sudans`,
`porta-san-sebastiano`, `porta-latina`, `villa-celimontana`, `santi-quattro-coronati`,
`santa-maria-in-domnica`.

## 2. THE COLOSSEUM — I re-tested it myself. The finder is right.

I did not inherit wave 1's ruling and I did not inherit the finder's. Own Overpass pull
(overpass-api.de refused; served from overpass.kumi.systems), own stitch, own even-odd point-in-polygon:

- Rione Celio relation 5454335 stitched to a closed ring of **483** vertices, 0 segments left over.
  (The finder reports 478. Immaterial — same ring, different day's OSM edits.)
- Colosseum way 1500762394, `name=Colosseo (Anfiteatro Flavio)`, `wikidata=Q10285`, 20 vertices:
  **20/20 inside Celio. 0/20 inside Monti. 0/20 inside Campitelli.** Centroid 41.890216,12.492300 →
  Celio, and outside both neighbours.

**The Colosseum is Celio's.** Ruling confirmed independently, not inherited.

Same run, as controls: Santo Stefano Rotondo → Monti (correctly shipped by Monti). San Clemente →
Monti (correctly shipped). Arco di Costantino centroid → **Campitelli**, outside Celio (see S1).
SS Giovanni e Paolo, Villa Celimontana, SS Quattro Coronati, Sepolcro degli Scipioni, San Sisto
Vecchio, Colombario di Pomponio Hylas and San Giovanni a Porta Latina all → Celio.

## 3. SOURCES RE-FETCHED

Eleven, not five. Every one was fetched by me in this session with python3 + urllib.

| # | Source | Result |
|---|---|---|
| 1 | `aulagoticasantiquattrocoronati.it` | **Confirmed verbatim.** All 16 opening dates for 2026, all nine entry times, `archeocontesti@gmail.com`, and the cloister/oratory 9:30–14:00 and 15:00–17:45 line are exactly as claimed. Two things the finder missed — below. |
| 2 | `sovraintendenzaroma.it/…/colombario_di_pomponio_hylas` | **Confirmed verbatim,** including `Rione: XIX - Celio`, the 01/08/2024 PNRR closure sentence, €4.00/€3.00, max 7, 060608. |
| 3 | `turismoroma.it/it/luoghi/lanfiteatro-flavio-colosseo` | **Confirmed verbatim,** including "Lungo 189 metri, largo 156 metri… 24.000 mq… circa 50mila spettatori", arena 76×46, the 217 fire. Both banned superlatives are present on the page and the finder was right to ban them. |
| 4 | `sangiovanniportalatina.it` | **Confirmed verbatim.** "La Basilica è aperta ogni giorno dalle 06.30 alle 18.00", Rosminiani, Via di Porta Latina 17, tel, email, rector names. |
| 5 | `sovraintendenzaroma.it/…/villa_celimontana` | **Confirmed verbatim:** "Dove si trova: Municipio I, Rione XIX - Celio", "Epoca: XVI-XIX secolo", "Estensione: 110.000 mq", the 1926/1928 sentence. Also surfaces a source conflict the finder missed — see #20. |
| 6 | `sovraintendenzaroma.it/content/parco-archeologico-del-celio` | **Confirmed verbatim:** three entrances, "Ingresso gratuito", 7.00–17.30 / 7.00–20.00, closed 25 Dec and 1 May, 060608, "L'area archeologica e il museo sono accessibili a tutti." |
| 7 | `sovraintendenzaroma.it/content/il-museo-della-forma-urbis` | **Confirmed verbatim:** 150 slabs, 203–211 AD, 18×13 m, 13,550,000 m², c. 1:240, "circa un decimo", c. 200 fragments placed, Nolli 1748, the full hours line. Two unflagged superlatives — see #4. |
| 8 | Lateran Treaty PDF, Wayback `20110813090725if_`, pages 5–8 | **Confirmed verbatim, and the finder's legal reading is exactly right.** Art. 16 names "the Clergy Retreat House of Sts. John and Paul (Attachment III, 1, 1bis, 2, 6, 7, 8)". Art. 15's list — Art. 13's basilicas, Art. 14 ¶1–2, the Dataria, Cancelleria, Propaganda Fide, Holy Office, Convertendi, Vicariate — **does not include it**. |
| 9 | `basilicassgiovanniepaolo.it` | **Confirmed verbatim** for every quoted sentence of the Cenni Storici. But see the caveat below. |
| 10 | `turismoroma.it/…/case-romane-del-celio` | **Confirmed, but the finder's hours are incomplete** and he missed a superlative on the page. See #11. |
| 11 | `turismoroma.it/…/arco-di-dolabella-e-silano` | **Confirmed verbatim,** incl. "4 metri in ampiezza e 6,56 metri in altezza", the consular inscription, "Mons Querquetulanus". The `Rione XIX - Celio` tag is really there. |

**Two sources that do NOT say what the finder implied:**

**(a) `colosseo.it/orari-e-biglietti/` — the provenance claim is wrong.** The finder writes "same
archive route; capture current as of this session". It is not. I queried the Wayback availability
API: the closest capture of `colosseo.it/orari-e-biglietti/` is **20260722122355** — 22 July 2026,
six weeks before the research date — and Wayback then rate-limited me (HTTP 429) so I could not read
it at all. I separately confirmed `colosseo.it` itself times out from this network, so the finder is
right that the live host is unreachable. The `/area/colosseo/` capture at **20260831090730** exists
exactly as cited and is two days old; that one is sound. **The hours page is not.** Ruling at #1.

**(b) `basilicassgiovanniepaolo.it` is a wedding-venue site, not a general parish site.** Its
navigation is "Fotografo Ufficiale della Basilica / Fiorista Ufficiale / Musicista Ufficiale /
Fotografi Accreditati", and most of its body is third-party reviewer copy ("Local Guide") containing
"Una delle più belle basiliche di Roma" and "da non perdere". It is on the basilica's own domain and
its Cenni Storici check out word for word, so it stands as a source for the history — but the author
must take **nothing** from the review blocks, which the finder did not warn about.

---

## 4. §3 — RULINGS ON THE 43 "CONFIDENT CELIO" RECORDS

### PUBLISH as written (21)

2 Museo del Colosseo · 3 Parco archeologico del Celio · 5 Casina del Salvi · 6 Ex Antiquarium
Comunale del Celio · 7 Tempio del Divo Claudio · 13 Chiesa di San Gregorio al Celio · 14 Oratori di
Sant'Andrea, Santa Silvia e Santa Barbara · 15 Parco di San Gregorio al Celio · 16 Fontana di via di
San Gregorio · 18 Palazzetto Mattei / Società Geografica Italiana · 22 Fontana del Fiume ·
23 Basilica di Santa Maria in Domnica · 25 Basilica Hilariana · 27 Chiesa di San Tommaso in Formis ·
33 Sepolcro degli Scipioni · 34 Parco degli Scipioni · 37 Oratorio di San Giovanni in Oleo ·
38 Parco Egerio · 39 Basilica di San Sisto Vecchio · 40 Semenzaio di San Sisto · 41 Complesso
Vignola Mattei.

Applying the finder's own bans, which I confirm are correct in every case. Notes:

- **#6 Ex Antiquarium** and **#40 Semenzaio**: `status` must state closed / not open to the public,
  and the prose must agree. #40 keeps "Visitabile solo in occasione di visite guidate del
  Dipartimento Ambiente."
- **#13 San Gregorio al Celio**: Roma Capitale's hours field says only "Orari delle Sante Messe", so
  **no opening hours may be published.** Do not link `monasterosangregorio.it`; the finder did not
  fetch it.
- **#39 San Sisto Vecchio** ships in Celio. My independent polygon test puts it inside; the finder's
  22/22 footprint result is confirmed. I am escalating the address conflict as a note only (§6).
- **#41 Complesso Vignola Mattei** ships in Celio, escalated as a note only (§6).
- **#25 Basilica Hilariana**: do not link `soprintendenzaspecialeroma.it`; unfetched.
- **#33 Sepolcro degli Scipioni**: Roma Capitale's own geocode falls in San Saba. The footprint
  overrules it — 5/5 vertices Celio, confirmed by my own run. Ships in Celio.

### REWRITE (16) — the exact wording is binding; the author uses it verbatim

**#1 Colosseo — kind and hours.**

*Kind ruling: `historic-site`.* Not `theater`. OSM's `amenity=theatre` is a tagging artefact; the
record's own prose is archaeological and the ticket is an archaeological-park ticket. `historic-site`
it is.

*Hours: DROP the seasonal block entirely.* The only route to it is a six-week-old Wayback capture of
a host that does not answer, which I could not read. Opening hours are the highest-churn field in the
corpus and this one cannot be stood behind. Replace the hours field with:

> No current opening hours are given here. Times and last admission change with the season; the Parco
> archeologico del Colosseo publishes them at colosseo.it, and tickets are sold at ticketing.colosseo.it.

Everything else stands: the Flavian construction, the 438 abolition of the gladiatorial games under
Valentinian III and the medieval and Renaissance quarrying, the 70–80 AD dates, the four orders with
eighty arcades on each of the lower three, 189 × 156 m, over 48 m high, 24,000 m², c. 50,000
spectators, arena 76 × 46 m, the 217 fire. Both superlatives stay banned; the finder is right that
attribution does not save them.

**#4 Museo della Forma Urbis — two superlatives the finder did not flag.** The Sovrintendenza page
also says the marble plan is "uno dei più rari documenti giunto a noi dall'antichità" and gives "un
panorama unico del paesaggio urbano di Roma antica". **Both are banned.** Neither appears in the
finder's do-not-use list, which means an author following his file alone would have shipped them.
Replace with:

> The plan is known from the fragments that survive; they amount to about a tenth of the original.

All figures stand.

**#9 Basilica dei Santi Giovanni e Paolo — add the source's own caveat.** Roma Capitale's hours field
ends with a sentence the finder dropped. The hours line must read:

> Roma Capitale publishes the basilica's hours as 08.30–12.45 and 14.00–17.00, with the note that some
> times may vary during the wedding season.

The rector's receiving hours and the 11.45 Sunday Mass from the first Sunday of September stand.
Nothing may be taken from the site's reviewer testimonials.

**#10 Casa di esercizi per il clero dei Santi Giovanni e Paolo — exact wording.** The finder's legal
reading is correct and I verified it clause by clause against the Treaty PDF. One correction to his
framing: Art. 16 does not cover "a different list" — it covers the buildings of Articles 13, 14 and
15 **as well as** the named Pontifical institutions. The effect for this building is exactly as he
says, because it appears only in the second group. The record's factual content is:

> The Clergy Retreat House of Sts John and Paul stands in Celio, on Italian soil, and is named in
> Article 16 of the 1929 Lateran Treaty. Article 16 provides that the buildings it names will never
> be subject to liens or to expropriation for reasons of public utility save by previous agreement
> with the Holy See, and will be exempt from taxes, whether ordinary or extraordinary. The Treaty's
> Article 15, which grants the immunities of the headquarters of diplomatic agents of foreign States,
> applies to a different list of properties and does not name this one.

It may **not** say extraterritorial, Vatican territory, "in the Vatican", or diplomatic immunity.
No hours, no current use, no bookings — there is no source.

**#11 Case Romane del Celio — hours incomplete, and an unflagged superlative.** The finder gives only
the daily line. Roma Capitale's field continues past where he stopped. Full replacement:

> Roma Capitale publishes the hours as 10.00–16.00 Monday to Sunday and on public holidays, with the
> ticket office closing an hour earlier; closed 1 January and 25 December; 10.00–14.00 on 24 and 31
> December. Booking through Coopculture on 06 39967755.

Roma Capitale republishing a venue's hours is acceptable and must be attributed to Roma Capitale, not
to the venue. Also: the same page calls the domus "uno dei luoghi più affascinanti della Roma
sotterranea" — **banned, and the finder flagged only the superlative on the neighbouring page.** The
twenty frescoed rooms, the first-to-fourth-century dating, the 1887 discovery by Padre Germano di San
Stanislao and the domus→insula→domus→titulus sequence all stand.

**#17 Villa Celimontana — the 1925/1928 conflict is handled correctly; a second conflict is not.**
The finder is right to keep the two dates apart. Ship it as:

> The Sovrintendenza Capitolina records that in 1926 the Palazzina Mattei passed to the Regia Società
> Geografica Italiana and the park was designated public green space, opened to the public in 1928.

The `architect=Pierre Charles L'Enfant` tag stays refused. Everything else stands.

**#20 Obelisco Mattejano — drop the Roman-period location.** The finder took from Roma Capitale that
the obelisk "in Roman times stood in the sanctuary of Isis Capitolina". The Sovrintendenza's own
Villa Celimontana page, which I fetched, says the opposite: "Proviene da Heliopolis e in epoca romana
si trovava presso l'**Iseo in Campo Marzio**." Two official sources, two different Roman locations,
and no way to adjudicate. Replace with:

> The surviving upper section carries hieroglyphs naming Ramesses II and came from Heliopolis. It
> stood on the Campidoglio beside the stair to the convent of Santa Maria in Aracoeli before Ciriaco
> Mattei obtained it from the Comune and set it in his villa, where it stands in the garden.

The uniqueness claim stays banned. The finder's two geocodes for this record differ by 500 m and one
of them is not in the villa at all; use the villa.

**#21 Ninfeo dell'Uccelliera — "one of the few" is a ranking.** The finder reproduced it as "one of
the few surviving elements of the villa's original layout"; the Sovrintendenza page I fetched has
the same phrase in Italian. Banned. Replace with:

> An underground chamber of the late sixteenth century, built during work on the villa's western
> slopes between 1585 and 1590, beneath the aviary that stood to the right of the casino nobile until
> it was destroyed in the eighteenth century.

Hours field "Chiuso al pubblico"; `status` must agree.

**#24 Fontana della Navicella — resolve the protome.** The two official sources disagree; use the
specific one with attribution:

> Roma Capitale describes the protome carved on the prow as a boar's head.

Do not write it unattributed and do not merge the two descriptions.

**#28 Arco di Dolabella e Silano — vague proximity.** The page's opening runs "È qui, **a pochi passi
dalla** Chiesa di Santa Maria in Domnica alla Navicella e l'antico Clivo di Scauro…". Banned
wayfinding. Use the Querquetulanus sentence, which is clean and is a good rione-page opening:

> Roma Capitale records that the Caelian was anciently called Mons Querquetulanus, because it was
> covered in oaks.

The uniqueness claim about the Servian gates stays banned. 4 m wide, 6.56 m high with part of it now
below ground, the consular inscription and the Augustan rebuild all stand.

**#29 Santi Quattro Coronati — a date conflict the finder created, and a seasonal label.** He dates
the Sala Gotica discovery to **1996** from Roma Capitale. The Aula Gotica's own official site, which
I fetched, says the decorations were "scoperte nel **1995**". A dedicated official domain beats an
aggregator. Use:

> The paintings were uncovered in 1995 beneath later layers of colour and brought back by a long
> restoration carried out by the state Soprintendenze.

Drop "seven layers of blue plaster" and "hidden for almost eight hundred years" unless the author
keeps Roma Capitale's sentence intact and attributed; do not blend the two accounts. The 300 m² stands.
The monastery's prayer timetable must be labelled as the site labels it — "the summer timetable
published by the monastery" — because the page says "Nuovi orari per il periodo estivo". All four
superlatives stay banned.

**#30 Aula Gotica — two additions the finder missed on the page he called his best find.** The 2026
calendar, the entry times and the booking email are confirmed exactly. He omitted:

> The same page states that in 2026 the thirteenth-century cloister may also be visited on Wednesday
> and Friday mornings, 9.30–11.45, except on holidays, and that an offering is appreciated for entry.

He also omitted the site's own access notice: roadworks on Via dei Santi Quattro have changed the
vehicle route, and access is via Piazza della Navicella and Via di Santo Stefano Rotondo. That is a
temporary condition — record it in `status` if at all, not in the prose.

**#31 + #32 Oratorio di San Silvestro and Chiostro — MERGE into one record.** The finder listed them
separately "because they have distinct opening arrangements". They do not: both official sources give
them one shared arrangement (the Aula Gotica page opens both together, 9.30–14.00 and 15.00–17.45;
Roma Capitale's oratory line covers the same complex). One record, titled for the cloister and the
Oratorio di San Silvestro. This is where the surviving count loses one.

**#35 Colombario di Pomponio Hylas — resolve the address.** Roma Capitale gives Via di Porta Latina
10; OSM's footprint gives 14. Use Roma Capitale's; OSM is not an address authority in this corpus.
`status` must state the closure, in the Sovrintendenza's own terms:

> The Sovrintendenza Capitolina states that the site has been temporarily closed to the public since
> 1 August 2024 for works under the PNRR.

Tariffs and booking conditions may be published as the conditions for when it reopens, labelled as
such.

**#36 Basilica di San Giovanni a Porta Latina — label the Mass times.** The daily 06.30–18.00 opening
is unqualified on the official site and publishes as-is. The Mass timetable is headed "Orario
Estivo"; it must read "the summer Mass timetable published by the basilica". This is otherwise the
cleanest record in the file — an official site establishing identity, address and hours, exactly as
the wave rule contemplates.

### DROP (6)

- **#8 Cave del Tempio di Claudio.** One sentence of promotional copy ("Enormi gallerie… dei laghetti
  cristallini") plus an access condition is not a record. Nothing here is a fact a page can carry.
- **#12 Clivo di Scauro.** No dedicated source exists; the finder says so himself. Fold the street's
  description into #11, where Roma Capitale actually describes it ("antica strada romana e asse
  principale del Celio, che ha conservato parte del suo tracciato originario"). Not a standalone place.
- **#19 Museo della Società Geografica Italiana.** Its own page says the collection has moved to the
  Museo delle Civiltà and its hours field reads "Chiuso". **There is no museum here.** The finder
  proposed shipping it as a negative record; I refuse. A guide does not carry a page for a museum that
  is somewhere else. Drop entirely.
- **#26 Policlinico Militare Celio.** Sourced only to it.wikipedia, no official page, not visitable.
  Context for #25, not a place.
- **#42 Giardini del Celio.** No source at all. The finder says do not ship without one; there is none.
- **#43 Chiesa di Santa Maria della Pietà al Colosseo.** No fetched source beyond the aggregator.
  The corpus rule is a source you actually fetched for every claim. There is none.

---

## 5. §5 — RULINGS ON THE 9 COMMERCIAL RECORDS

### PUBLISH as written (2)
- **C3 Naumachia.** Thin but clean: identity, cuisine, official site. Publishes.
- **C5 Osteria il Bocconcino.** The finder's bans are exactly right and I add nothing. The whole
  "Riconoscimenti" block — ARSIAL/Slow Food 2008, Lonely Planet, Guide du Routard, Petit Futé, Gambero
  Rosso, Osterie d'Italia — is unusable: an official website does not establish awards. "L'Unica
  Osteria al Colosseo" and "L'unica Osteria di Roma dedicata ai piatti romani di casa" are both
  banned. The named dishes publish.

### REWRITE (3)
- **C1 Hotel Lancelot.** The three-star classification and the address, phone and identity publish
  from the hotel's own site. Drop "Immerso nel verde e nella quiete del Celio" — marketing, and
  "immerso nel verde" is a proximity flourish. The record may say the hotel is in Celio, on Via Capo
  d'Africa, because the site says so.
- **C2 Pizzeria Li Rioni.** Drop "da sempre" from the wood-oven sentence: it is a trading-duration
  claim by inference and an official site does not establish one. Publishable as:
  > The pizzeria says its dough is left to mature for more than eighteen hours and its pizza is baked
  > in a wood-fired oven.
  Address, phone and the Lazio wine list publish. "Accontentati del meglio" stays out.
- **C4 Hostaria i Clementini.** Drop three things, not one. The finder caught "da oltre vent'anni"
  (trading duration — correct). He missed "**a due passi dal** colosseo" (vague proximity, banned)
  and "di fronte alla basilica di san clemente" (a wayfinding claim about a building in another
  rione). "Tra le mura storiche del seicento" is an age claim about the premises that the business's
  own site does not establish — drop it too. What remains is identity, address and cuisine. Publish
  that.

### DROP (4)
- **C6 Trattoria Pizzeria Luzzi.** Official site is a JavaScript shell serving only a menu skeleton.
  The "dal 1945" is a trading-duration claim from an OSM name tag with no source behind it. Nothing
  publishable survives beyond a name and a street number.
- **C7 Coming Out.** No website, identity unsourced beyond OSM. The finder is right that the strip is
  Rome's best-known gay quarter and right that he has no publishable source for saying so; without
  the source there is no record. Drop.
- **C8 Antica Trattoria Pasqualino al Colosseo.** OSM tags only. OSM is not a source for hours under
  this corpus's rules, and it is not a source for identity either when nothing else corroborates.
- **C9 Profumo Maison d'Hotes.** The finder did not read the site. An unread page is not a source.

### The dead-domain hazard is real and I confirmed it
I fetched `https://www.hotelcapodafrica.com/` myself: HTTP 200, and it serves **ALEXISTOGEL**, an
Indonesian online-lottery site, not a hotel. The finder's warning about `shamrockrestaurant.it` is of
the same class. **Neither may be linked, and neither business may be shipped on that source.** This
is the single most useful defensive finding in the finder's file and any later wave harvesting OSM
`website` tags must be handed it.

---

## 6. ESCALATED TO THE ARBITRATOR (11 straddlers, plus 2 notes)

Celio's author writes **none** of these. I add my own reading where I have one.

| # | Place | My reading |
|---|---|---|
| S1 | **Arco di Costantino** | **My own polygon run puts the centroid in Campitelli and outside Celio.** Footprint splits 3 Campitelli / 2 Celio. it.wikipedia's Celio list is the only thing pointing the other way, and it is an aggregator. **I recommend Campitelli.** It must not end up owned by nobody. |
| S2 | Meta Sudans | 17/22 Campitelli. Recommend Campitelli, as the finder does. |
| S3 | Porta San Sebastiano | Genuine three-way on the Aurelian Walls; Nominatim declines to name a quarter. No recommendation. |
| S4 | Museo delle Mura | Follows S3 wherever it goes. **Whoever writes it must not promise the wall-walk**: the museum's own site carries a closure notice dated 12/06/2026 and states "Il Museo non è accessibile". Prefer the museum's own "circa 350 metri" and ten towers over Roma Capitale's "circa 400 metri". Both superlatives banned. |
| S5 | Mura Aureliane, Celio stretch | The wall *is* the boundary. Trastevere's `mura-aureliane-segment-trastevere-rome` is the precedent shape if the arbitrator wants one. |
| S6 | Porta Latina | Sits on the line; OSM node falls in no polygon at all. |
| S7 | **Arco di Druso** | Escalate **and drop regardless of who wins it.** The finder found no official page and neither register nor catalogue lists it. Even if the arbitrator gives it to Celio it cannot ship: there is no source. |
| S8 | Colombari di Vigna Codini | Poly Celio, Nominatim Appio-Latino. Note also that access runs through the Parco Archeologico dell'Appia Antica and the site is inside private property — both point away from Celio as the institutional home. Weak on Celio's side; nobody is arguing the other. |
| S9 | Piazza di Porta Capena | Straddles Celio/San Saba/Ripa. **The Axum obelisk sentence on Roma Capitale's page is stale and must not be published by anyone.** |
| S10 | Piazza del Colosseo | Demonstrably three-way. Majority Celio by vertex count. Note that the amphitheatre itself does not straddle — that ruling is settled (§2) and independent of this one. |
| S11 | Via di San Giovanni in Laterano | Monti/Celio divide. The individual street numbers in §5 each test Celio and ship; the street as a named place does not. |

**Escalation note 1 — a place the finder tested and then never recorded.** Inside S9 he reports that
the **Casina Vignola Boccapaduli**, addressed to Piazza di Porta Capena, "tests Celio on both
instruments" at 41.885019,12.489700. It then appears nowhere in his §3, §4 or §6 — it survives only
as a filename in his photo leads. That is a candidate he proved and lost. Somebody should source it.

**Escalation note 2 — two boundary-address records I am shipping in Celio over their own geocodes.**
#39 San Sisto Vecchio (Piazzale Numa Pompilio) and #41 Complesso Vignola Mattei (Via di Valle delle
Camene) both sit on named boundary features and both have address-level geocodes that land in San
Saba. I ship them in Celio on unanimous footprint evidence — my own run confirms San Sisto Vecchio
inside Celio — but the arbitrator should know I made that call and may move them.

---

## 7. WHAT THE FINDER GOT WRONG

1. **He overstated the freshness of the Colosseum hours source.** "Capture current as of this session"
   is false: the newest Wayback capture of `colosseo.it/orari-e-biglietti/` is 22 July 2026. The
   seasonal hours block is dropped on that basis. His §7 statement that all his archive captures were
   "dated 2026-08-31 and later" is contradicted by his own file.
2. **He missed superlatives on three pages he read carefully.** "Uno dei più rari documenti" and "un
   panorama unico" on the Forma Urbis page; "uno dei luoghi più affascinanti della Roma sotterranea"
   on the Case Romane page; "uno dei pochi elementi sopravvissuti" on the Ninfeo, which he then
   reproduced into his own English summary as "one of the few surviving elements". An author working
   from his file alone would have shipped all four.
3. **He missed vague proximity in a sentence he recommended.** "A pochi passi dalla Chiesa di Santa
   Maria in Domnica" opens the Arco di Dolabella page he praised, and "a due passi dal colosseo" is in
   the i Clementini copy where he flagged only the trading-duration claim.
4. **He truncated two hours fields.** Case Romane loses its four closure dates and its 24/31 December
   short day; SS Giovanni e Paolo loses the source's own "some times may vary during the wedding
   season" caveat.
5. **He created a date conflict and did not notice.** 1996 for the Sala Gotica discovery from Roma
   Capitale against 1995 on the monument's own dedicated official site — and the dedicated site was
   his own showcase source.
6. **He missed a source conflict on the Villa Celimontana obelisk**, where the Sovrintendenza page he
   quoted at length on the same visit says Iseo in Campo Marzio and Roma Capitale says the sanctuary
   of Isis Capitolina.
7. **He missed two published facts on his single best page** — the 2026 Wednesday/Friday cloister
   mornings and the roadworks access notice on the Aula Gotica site.
8. **He did not warn that `basilicassgiovanniepaolo.it` is a wedding-venue site** whose body copy is
   largely third-party reviews containing two superlatives.
9. **He proposed shipping a negative record** (#19, a museum whose collection has moved out of the
   rione) and two structurally duplicate records (#31/#32, one access arrangement between them).
10. **He recorded a candidate he proved and then dropped** — the Casina Vignola Boccapaduli.
11. **Four of his nine commercial records have no usable source**, three of them because he never
    read the site or the site is a JS shell.

**What he got right, and it is most of it.** The Colosseum ruling holds under an independent
polygon run I did from scratch. The southern lobe is real and would have been missed. The collision
check is sound and I could not break it. The Lateran Treaty reading is correct clause by clause
against the primary text — Art. 15 and Art. 16 are properly kept apart, and the record is correctly
refused any extraterritorial or Vatican framing. He asserted no designation anywhere. The dead-domain
hazard is a genuine catch. And he declined to resolve eleven straddlers he could have quietly grabbed.
