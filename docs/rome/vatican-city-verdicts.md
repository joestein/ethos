# Vatican City — VERDICTS

Adjudication of `docs/rome/vatican-city-finder.md`. Zone 31 of 31, Rome programme.
Verifier pass, 2026-09-03. Every line below is a ruling, not a comment.

Governing instruments read in full before adjudicating: `priv/seed_data/rome_roster.json` →
`vatican_ruling`, `scope_ruling`, `evidence_ruling`, `kind_note`, `zones[30]`; and the enforcing
regexes in `test/ethos/seeds/rome_seed_data_test.exs`.

---

## A. Re-verification log — what I fetched again, and what it said

The finder's cache was still on disk in the shared scratchpad. **I did not use it.** Every source
below was re-fetched cold into a separate cache (`scratchpad/vc/vcache`) with `python3` + `urllib`,
and the text compared against the finder's transcription character by character.

| # | Source | Status | Verdict on the finder's transcription |
| --- | --- | --- | --- |
| 1 | `museivaticani.va/…/info/orari-musei-vaticani.html` | 200 | **Exact.** 08.00–20.00 Mon–Sat, final entry 18.00; last Sunday 09.00–14.00, final entry 12.30, free; the five excepted feasts; the full closure list; "leave the halls 30 minutes before closing". All confirmed verbatim. |
| 2 | `museivaticani.va/…/organizza-visita/tariffe-e-biglietti.html` | 200 | **Exact.** €20.00 full; €20.00+5.00 Skip the Line; €10.00 reduced; €5.00 schools (+2.00); €10.00 students/pilgrimages/university institutes (+5.00); €5.00 seminaries (+2.00). Free list confirmed, including "certified invalidity of at least 67 %" and the ICOM/ICOMOS line. |
| 3 | `basilicasanpietro.va/en/opening-hours` | 200 | **Exact,** including the defect: *"From june 1st: from 7.00 am to 8:00 pm"* with no end date. Dome and Pétros ení winter/summer ranges, guided-tour hours, Fabbrica archive hours, Reconciliation hours all confirmed. |
| 4 | `vaticanstate.va/…/general-informations/geography.html` | 200 | **Exact.** The "marble strip … marks the confines of the State" sentence is there as quoted. 0.44 km² (44 hectares), five entrances, Viale Vaticano access confirmed. |
| 5 | `vaticanstate.va/…/history/vatican-city-today.html` | 200 | **Exact,** including the publisher's own error *"With a surface area of 0.44 hectares"* and the competing *"the white marble line that joins the two wings of the colonnade"*. Swiss Guard 1506, *L'Osservatore Romano* 1861, radio since 1931 confirmed. |
| 6 | `vatican.va/…/rc_seg-st_19290211_patti-lateranensi_it.html` | 200 | **Exact.** Art. 3 all three paragraphs; Art. 15 including *benché facenti parte del territorio dello Stato italiano*; Art. 16 with its separate institute list and *esenti da tributi*; Art. 18; Art. 24. The Italian is transcribed correctly and the English renderings are faithful. |
| 7 | `whc.unesco.org/en/list/286` | 200 | **Exact.** Date of Inscription 1984; Criteria (i)(ii)(iv)(vi); Property 44 ha; State Party Holy See. |
| 8 | `basilicasanpietro.va/en/san-pietro/the-dome` | 200 | **Exact.** *"The inner dome of the lantern reaches a height of 117 metres, while the cross at the top of the dome is over 133 metres high."* 22 months, 800 labourers, ~3000 m², sixteen compartments, Provenzale 1598–1613 all confirmed. |
| 9 | `basilicasanpietro.va/en/san-pietro/the-square` | 200 | **Exact.** 1667 after eleven years; "oval space with three centres" 196 × 149 m; 284 columns in four rows, 16 m high; 140 statues over three metres. |
| 10 | `basilicasanpietro.va/en/products/the-treasury-museum` | 200 | **Exact.** *"Due to the continuation of work on the new layout, the Treasure Museum will be temporarily closed."* The conflict with `…/san-pietro/the-museum` is real and still live. |
| 11 | `vaticanstate.va/…/general-informations/population.html` | 200 | **Exact.** 673 citizens, 458 inside, 120 Swiss Guard; ~30% non-resident; statistics to 31 Dec 2024 — cardinals 66 (10 inside), residents 882, deaths 6, squares 21, covered roads 30. |
| 12 | `it.wikipedia.org/wiki/Ricciolo_d'Italia` | 200 | **Exact,** and it confirms the finder against the roster: **3 m wide, about 70 m long, under 105 m²**. The roster's "60 m" is unsupported. 1932 non-ratification and the 1:5000 map's imprecision confirmed. |
| 13 | `basilicasanpietro.va/en/san-pietro/the-basilica` | 200 | **Exact.** 18 April 1506, Saturday after Easter; pit of 7.45 metres; Paride de Grassis; twelve medals by Cristoforo Foppa "Caradosso". |
| 14 | `basilicasanpietro.va/en/san-pietro/the-necropolis` | 200 | **Exact.** Three to eleven metres below the nave floor; over 40,000 m³ of earth; 22 tomb buildings; around 1000 burials. |
| 15 | `booking.basilicasanpietro.va` (both dome products) | 200 | **Substantially exact,** one drift: the portal renders the prices as **"17 €"** and **"22 €"**, not "from €17/€22". 231 + 320 = 551 steps confirmed. HIVE s.r.l. footer confirmed. |
| 16 | `basilicasanpietro.va/en/entering-the-basilica` | 200 | **Exact.** Security checks by the Italian State Police, stations in the right hemicycle "looking towards the Basilica". |

**Finding: the finder's transcription accuracy is excellent.** Across sixteen re-fetched sources I
found exactly one numeric drift (item 15) and no invented facts. The problems below are almost all
problems of *overreach in framing*, not of fabrication.

---

## B. THE BOUNDARY — the rulings that matter most

The roster's limit is absolute: the Lateran Treaty defines the border **only** by the 1:5000 plan at
Annex I; there is no verbal description in the instrument; the 1932/33 commission was never
ratified. Re-fetch of the Treaty (source 6) confirms Art. 3 says nothing more than *"I confini di
detta Città sono indicati nella Pianta che costituisce l'Allegato I°."* The corpus may not exceed
that. Nine rulings follow.

**B1. DROP — the Governorate's "marks the confines of the State" sentence, in any form, attributed
or not.** Finder §3(b). The sentence is genuine and I re-read it. But *"the marble strip that joins
the ground to the outer parts of the Colonnade, and marks the confines of the State to the
boundaries of the Square"* **is a verbal description of where the border runs.** Attributing it does
not cure it — the roster bars the corpus from stating the boundary more precisely than the Treaty
does, and the Treaty states it not at all. The Governorate is not a party competent to amend the
Annex by publishing a web page.

**B2. DROP — the Governorate's "Its borders are marked by its walls, and in Saint Peter's Square, by
the white marble line that joins the two wings of the colonnade."** Finder §3(c). Same defect as B1,
and worse: it is a flat declaration of the border in two clauses. It also contradicts B1 from the
same publisher on the shape of the thing. Two mutually inconsistent descriptions from one publisher
are not corroboration; they are evidence that neither should be relied on.

**B3. DROP — "in travertine" (it.wikipedia) and "marble" (Governorate) as the line's material.** The
finder already recommends not picking a material. I make it a ruling: the sources conflict, no
primary instrument speaks, and the material is only ever interesting *because* it is being offered
as the border. Name no material.

**B4. REWRITE — any mention of the line at all.** The finder's fallback ("you may say, attributed,
that a line is marked on the ground across the square between the arms of the colonnade") is close
but still leaks, because a reader meets it in a page about a sovereign state and reads "border".
If the page wants the line, the **only** admissible wording is a bare physical description with no
border function, no material and no attribution to a boundary claim:

> Exact replacement: *"A curved line is set into the paving of St Peter's Square between the arms of
> the colonnade."*

Nothing may follow that sentence about what it separates. My recommendation, echoing the finder's:
**write nothing about the line.** The page loses a sentence and sheds the entire risk.

**B5. DROP — the Ricciolo d'Italia's geography: "begins near Porta Angelica", "runs behind the right
arm of the colonnade", "insinuates itself into Vatican territory and separates it into two parts",
"the extreme tip is near the Apostolic Palace".** Finder §3.1. This is the trap the brief predicted,
and the finder walked into it while explicitly warning against it. Every one of those clauses tells
a reader **where Vatican territory begins and ends**, in more detail than the Treaty does, on the
authority of an aggregator. That the roster permits *stating the Ricciolo's existence* does not
license mapping it. Cut the route description entirely.

**B6. DROP — every Ricciolo dimension: the roster's "3m by 60m", the source's "about 70 metres",
"3 metres wide", "under 105 m²".** The finder recommended publishing neither length but was willing
to publish the width. I go further and drop the width and the area too. A width and a length of a
strip of foreign territory *is* a boundary description with numbers on it — it is the most precise
form the prohibited claim can take. The roster's own "60 m" is additionally unsupported by the only
source that exists; re-fetch confirms the source says ~70 m.

**B7. REWRITE — the Ricciolo's existence.** The roster permits stating it if sourced. Sourced it is.
Reduce it to existence and nothing else, and carry the source's own caveat that its status is
disputed in practice, since the source says the strip is *commonly and erroneously* treated as
Vatican territory including by the police and Swiss Guards standing on it:

> Exact replacement: *"A small strip of Italian territory known as the Ricciolo d'Italia lies beside
> St Peter's Square. Its extent is not described in the Lateran Treaty, and in practice it is often
> treated as Vatican ground."*

If the writer is not confident holding that line, omit the Ricciolo. It is not load-bearing for a
traveller.

**B8. PUBLISH — "St Peter's Square forms part of Vatican City", attributed to Lateran Treaty Art. 3.**
Re-fetched and confirmed: *"la piazza di San Pietro, pur facendo parte della Città del Vaticano"*.
This is the one territorial statement the Treaty itself makes in words, and it is the one the page
most needs, because it is the fact a traveller will otherwise get wrong. It states membership, not a
line, so it does not exceed the instrument.

**B9. DROP — "Italian policing there is a concession on foreign soil", "this is the practical face of
the Art. 3 policing concession", and every variant.** Finder §2.2 and record 2's "legal note", and
record 1's gloss on the security checks. This is the roster's *reasoning*, addressed to researchers
so they do not mistake Italian police for Italian territory. It is not reader-facing copy: it is a
characterisation of jurisdiction, and Vatican jurisdiction was never researched. Publish B8, publish
the operational security-check fact (D1.7), and let the reader draw no legal conclusion because the
page offers none.

**Boundary summary: 6 DROP, 2 REWRITE, 1 PUBLISH.** Nothing survives that tells a reader where
Vatican territory begins.

---

## C. The state's own facts (finder §4)

| # | Claim | Verdict | Reason |
| --- | --- | --- | --- |
| C1 | Area 0.44 km² (44 hectares) | **PUBLISH** | Governorate Geography page, corroborated by UNESCO's 44 ha. Re-verified. |
| C2 | "0.44 hectares" from the Vatican City Today page | **DROP** | The publisher's own arithmetic error, confirmed still live on re-fetch. The finder caught it and was right to. |
| C3 | Treaty signed 11 Feb 1929, ratifications exchanged 7 June 1929 | **PUBLISH** | Two independent primary sources (Treaty Art. 27 + Governorate). Re-verified. |
| C4 | 673 citizens, 458 inside the walls, 120 Swiss Guard | **PUBLISH** | Governorate Population page, verbatim. |
| C5 | ~30% of citizens resident outside the State | **PUBLISH** | Same page, verbatim. |
| C6 | Statistics to 31 Dec 2024: 66 cardinal-citizens (10 inside), 882 residents, 6 deaths, 21 squares, 30 covered roads | **PUBLISH** | Same page, verbatim, with the "to 31 December 2024" basis attached. |
| C7 | Putting 673 and 882 in one sentence | **REWRITE** | Different populations. Replacement: *"The Governorate records 673 citizens of the State, and, in statistics to 31 December 2024, 882 residents counting citizens and non-citizens."* |
| C8 | Five entrances, guarded by Swiss Guard and Gendarmerie; Museums access from Viale Vaticano | **PUBLISH** | Geography page, verbatim. Operational, not jurisdictional. |
| C9 | Gardens c. 22 ha, about half the territory | **PUBLISH** | Two sources agree (Museums, Governorate). |
| C10 | Swiss Guard founded 1506; uniforms "according to tradition" designed by Michelangelo | **PUBLISH** | With the hedge kept, exactly as the finder insists. Dropping "according to tradition" would convert a tradition into a fact. |
| C11 | *L'Osservatore Romano* founded 1861; radio since 1931 | **PUBLISH** | Vatican City Today page, verbatim. Institutional, not a trading duration. |
| C12 | Vehicle codes SCV and CV | **PUBLISH** | Governorate. |
| C13 | "The International Code is V" | **DROP** | The finder is right that this is the vehicle code, not ISO 3166-1. Records emit **VA**. Publishing "V" as a country code would be false. |
| C14 | Postcode 00120 Città del Vaticano | **PUBLISH** | Library footer + Nominatim. |
| C15 | Museums' published address "Viale Vaticano, 00165 Rome" | **PUBLISH** | Re-verified on the Museums' own page. Quote it as they write it; the `state`/`county` fields carry the ruling regardless. |
| C16 | **"The entire territory is under the 1954 Hague Convention for the Protection of Cultural Property"** | **DROP** | **Finder error.** The `evidence_ruling` says *no page may claim a designation, protection status or listing date* — this is a protection status, applied to the whole territory, and it is simultaneously a statement about what legal regime governs the state. Both bars catch it. The finder listed it as publishable in §4 and again in §7.5. It is not. |
| C17 | UNESCO: property "Vatican City", State Party Holy See, inscribed **1984**, criteria (i)(ii)(iv)(vi), 44 ha, dossier 286 | **PUBLISH** | Re-verified. This is the one designation-shaped fact permitted, because it is property-level and the property is the whole state. |
| C18 | Pushing the inscription onto the basilica, the Sistine Chapel or the Museums | **DROP** | Correctly pre-empted by the finder. Holds. |
| C19 | UNESCO's *"The property is safeguarded by the law for the protection of the cultural heritage (no. 355, 25/07/2001)"* | **DROP** | **Finder miss.** The finder mined this page for the inscription and its superlatives but did not quarantine this line. It is a citation of **Vatican law by number and date** — squarely inside §8.3's prohibition, and the finder never listed it. Add it to the quarantine. |

---

## D. The six records the zone may claim (finder §5.A)

First, a correction to the finder's premise. Finder §1 and §10 state that **the gate reserves all six
names**. It does not. `@vatican_needles` in `test/ethos/seeds/rome_seed_data_test.exs` covers four
name families only — St Peter's Basilica, St Peter's Square, Vatican Museums, Sistine Chapel — with
`@not_vatican_qualifiers` excluding Montorio/in-Borgo/in-Vincoli/in-Carcere. **The Vatican Gardens
and the Vatican Necropolis are not in the needle list and the gate asserts nothing about them.**

This does not change the outcome. I re-ran `python3 .superpowers/taken_slugs.py` (1,252 rows,
**30 shipped zones**, Vatican City the 31st) and searched it for every relevant stem: `pietro`,
`peter`, `sistin`, `vatican`, `giardin`, `necropol`, `colonnat`, `obelisc`, `cupola`, `aula`. The
only near-hits are `teatro-sistina-colonna` (Teatro Sistina, Via Sistina, rione Colonna — unrelated),
`museo-storico-vaticano-rome` (Monti, correctly the Lateran Palace's), and nine `san pietro`
dedications elsewhere in Rome, all carrying their own qualifier. **All six names are free.** The
finder's conclusion is right; its stated reason is not.

**D1. St Peter's Basilica — historic-site**

| Claim | Verdict | Reason |
| --- | --- | --- |
| D1.1 Coords 41.9021569, 12.4537105, cited to Nominatim | **PUBLISH** | Aggregator, cited as such, used only for a point. |
| D1.2 First stone 18 April 1506, Saturday after Easter, by Julius II, at the site of the present south-west pillar of St Veronica | **PUBLISH** | Fabbrica, re-verified verbatim. |
| D1.3 Foundation pit 7.45 metres; Paride de Grassis; twelve medals modelled by Cristoforo Foppa "Caradosso" | **PUBLISH** | Fabbrica, re-verified verbatim. A measurement and named attribution — exactly the sentence that publishes. |
| D1.4 The nine architects with dates; Maderno's façade 1608–1612 | **PUBLISH** | Fabbrica's own list. |
| D1.5 Hours *"From june 1st: from 7.00 am to 8:00 pm"* | **REWRITE** | True and re-verified, but unusable raw: no end date, lower-case month, and it will read as a live year-round hour. Replacement: *"The Fabbrica di San Pietro publishes basilica opening hours of 7.00 am to 8.00 pm from 1 June."* Do not invent a winter regime. |
| D1.6 Entry free, no reservation, from the ordinary entrance in St Peter's Square | **PUBLISH** | Re-verified on the Treasury products page. High-value traveller fact. |
| D1.7 Security checks by the Italian State Police, stations in the right hemicycle looking towards the basilica | **PUBLISH** | Fabbrica's own operational description, re-verified. Publishable **only** as the practical instruction it is. |
| D1.8 "…this is the practical face of the Art. 3 policing concession" | **DROP** | See B9. Jurisdictional gloss. |
| D1.9 Dedication dated to 1626 by back-calculation from a 2026 "400th anniversary" lecture cycle | **DROP** | Arithmetic on a news item is not a source for a date. The finder itself hedged. Either the Fabbrica states the dedication date or the page does not carry it. |
| D1.10 "the Fabbrica marked the fourth centenary of the Dedication in 2026" | **REWRITE** | Admissible as an event, not as a date derivation. Replacement: *"In 2026 the Fabbrica di San Pietro held a lecture cycle for the fourth centenary of the basilica's dedication."* |
| D1.11 `photos: []` | **PUBLISH** | Mandatory. |

**D2. St Peter's Square — attraction**

| Claim | Verdict | Reason |
| --- | --- | --- |
| D2.1 Coords 41.9022351, 12.4573573 | **PUBLISH** | Nominatim, cited. |
| D2.2 Bernini for Alexander VII, completed 1667 after eleven years | **PUBLISH** | Re-verified verbatim. |
| D2.3 "oval space with three centres", 196 × 149 metres | **PUBLISH** | Re-verified verbatim. |
| D2.4 284 columns in four rows, 16 metres high; 140 statues over three metres | **PUBLISH** | Re-verified verbatim. The measurements that replace the rankings. |
| D2.5 "a trapezoidal area whose **longest** side is the façade" | **REWRITE** | The source says "the largest side consisting of the façade"; the finder softened it to "longest". Both read as ranking tokens and the second is a silent edit of a quotation. Replacement: *"…enclosing a trapezoidal area bounded on one side by the façade."* |
| D2.6 Vatican obelisk at the centre, from the circus of Caligula and Nero | **PUBLISH** | Re-verified. |
| D2.7 Mosaic copy of the fifteenth-century *Mater Ecclesiae* icon; original venerated in the Chapel of Our Lady of the Column | **PUBLISH** | Re-verified. |
| D2.8 The record's "legal note" on Italian police powers | **DROP** | See B9. Keep B8's Art. 3 membership fact; drop the analysis. |
| D2.9 Any statement of where the square's edge falls | **DROP** | Section B. |

**D3. Vatican Museums — museum**

| Claim | Verdict | Reason |
| --- | --- | --- |
| D3.1 Coords 41.9062438, 12.4527428 | **PUBLISH** | Nominatim, cited. |
| D3.2 Address "Viale Vaticano, 00165 Rome" with `state`/`county` = Vatican City | **PUBLISH** | See C15. The finder's §7.4 handling of the colliding address systems is correct and should be carried. |
| D3.3 Hours Mon–Sat 08:00–20:00, final entry 18:00 | **PUBLISH** | Re-verified verbatim. |
| D3.4 Last Sunday 09:00–14:00, final entry 12:30, free, guided tours on reservation, with the five excepted feasts | **PUBLISH** | Re-verified verbatim, including the exception list. |
| D3.5 Leave the halls 30 minutes before closing | **PUBLISH** | Re-verified. |
| D3.6 Full closure list (Sundays; 1 and 6 Jan; 11 Feb; 19 Mar; 6 Apr; 1 May; 29 Jun; 14–15 Aug; 1 Nov; 8, 25, 26 Dec) | **PUBLISH** | Re-verified verbatim. |
| D3.7 The six price tiers with their Skip-the-Line supplements | **PUBLISH** | Re-verified verbatim, every figure. |
| D3.8 Free-entry categories incl. under-7s, museum directors, certified invalidity of at least 67 %, ICOM/ICOMOS, university teachers on written request | **PUBLISH** | Re-verified verbatim. |
| D3.9 "with priority entry" for disabled visitors | **REWRITE** | The page says *"guaranteed priority Skip the line entry (without queuing in line)"*; the finder compressed it. Replacement: *"…and are guaranteed priority entry without queuing."* Also add the European Disability Card, which the page names and the finder omitted. |
| D3.10 Only official ticket site is `tickets.museivaticani.va`, with the lookalike-domain warning | **PUBLISH** | Re-verified verbatim. Genuinely protective of the reader. |
| D3.11 Ticket valid only on the day of issue; non-refundable | **PUBLISH** | Re-verified. |
| D3.12 Phone numbers and `@scv.va` addresses | **PUBLISH** | Museums' own contact block. |
| D3.13 Getting there: Metro A Ottaviano/Cipro; buses 49, 32, 81, 982, 492, 990; tram 19; taxi rank | **PUBLISH** | Museums' own page. |
| D3.14 Dress code (no sleeveless, no low-cut, no shorts above the knee, no miniskirts, no hats) | **PUBLISH** | Conduct rule, operational. |
| D3.15 Cloakroom, prohibited items, no alcohol, no eating in halls, animals, laser pointers, refreshment and rest areas, Vatican Post branch | **PUBLISH** | All conduct/service, all operational. |
| D3.16 The Museums' **photography policy** | **DROP** | Quarantined by the finder and correctly so. Permissions topic; Vatican law unresearched. |
| D3.17 The Museums' **drawing-permission** paragraph | **DROP** | Same. |

**D4. Sistine Chapel — historic-site**

| Claim | Verdict | Reason |
| --- | --- | --- |
| D4.1 Coords 41.9029338, 12.4544043; inside the Museums itinerary, covered by the Museums ticket | **PUBLISH** | Access inherits from D3 correctly. |
| D4.2 Named for Sixtus IV della Rovere (1471–1484), who had the Cappella Magna restored 1477–1480 | **PUBLISH** | Re-verified verbatim. |
| D4.3 Fifteenth-century scheme: false drapes, Stories of Moses, Stories of Christ, portraits of the popes; Perugino, Botticelli, Ghirlandaio, Rosselli; Biagio di Antonio, Bartolomeo della Gatta, Signorelli; Pier Matteo d'Amelia's starry sky | **PUBLISH** | Re-verified verbatim. |
| D4.4 Frescoes begun 1481, concluded 1482; screen, choir stalls, pontifical arms same date | **PUBLISH** | Re-verified verbatim. |
| D4.5 Consecrated by Sixtus IV on 15 August 1483, dedicated to Our Lady of the Assumption | **PUBLISH** | Re-verified verbatim. |
| D4.6 Ceiling entrusted to Michelangelo 1508; finished October 1512; inaugurated 1 November 1512 | **PUBLISH** | Re-verified verbatim. |
| D4.7 Nine Genesis panels; five Sibyls, seven Prophets; four corner pendentives; Ancestors of Christ | **PUBLISH** | Re-verified verbatim. |
| D4.8 *Last Judgement*: commissioned late 1533 by Clement VII; begun 1536 under Paul III; completed autumn 1541; destroyed Perugino's altarpiece and the first two episodes of both cycles | **PUBLISH** | Re-verified verbatim. |
| D4.9 Entrance wall: van den Broeck over Ghirlandaio; Matteo da Lecce over Signorelli, damaged when the door collapsed in 1522 | **PUBLISH** | Re-verified verbatim. |
| D4.10 Complete restoration 1979–1999, including cantoria, screen and arms of Sixtus IV | **PUBLISH** | Re-verified verbatim. |
| D4.11 The Conclave is held in the Chapel | **PUBLISH** | Museums' own sentence, re-verified. A fact about use, not about law. |
| D4.12 Absolute silence; commentary given to groups before entry at touch-screen totems outside; panels in the Courtyard of the Pinecone and Square Garden | **PUBLISH** | Conduct/operational. |
| D4.13 "forms of incomparable beauty" (JPII homily) | **DROP** | Superlative. Correctly flagged. |
| D4.14 *"the primary importance of the Sistine Chapel in the life of the Church"* | **DROP** | **Finder miss.** Same page, same homily block, a ranking in the Museums' own linking prose. Not in §8.1. |
| D4.15 *"Using his extraordinary artistic capacities"* | **DROP** | **Finder miss.** Same paragraph. Ranking/framing. |
| D4.16 The JPII homily quotation as a whole | **DROP** | Every usable fragment of it is either ranking (D4.13–D4.15) or theology. Nothing in it is a traveller fact. |

**D5. Vatican Gardens — park**

| Claim | Verdict | Reason |
| --- | --- | --- |
| D5.1 Coordinate resolving only to the greenhouses (41.9056662, 12.4508644) | **DROP** | The finder flagged it as an imperfect centroid and asked the verifier to improve or drop. I cannot improve it without a source, and a park centroid that silently points at a service building is worse than none. Drop the coordinate; keep the record. |
| D5.2 c. 22 hectares, about half the territory | **PUBLISH** | Two sources. |
| D5.3 Origin 1279 / Nicholas III (1277–1280); pomerium, pratellum, viridarium on Mons Saccorum | **PUBLISH** | Museums/Governorate. |
| D5.4 The Nicholas III inscription now in the Sala dei Capitani, Palazzo dei Conservatori | **REWRITE** | The building is Campitelli's (`palazzo-dei-conservatori-campidoglio`, verified present in the slug list). Mentioning where an inscription went is not claiming the room — but it must not read as an entry. Replacement: *"The Governorate records that the stone inscription of this planting is now on the Capitol."* Name no room and create no record. |
| D5.5 Itinerary features: Italian Garden, Fountain of the Eagle, Fountain of the Zitella, Casina of Pius IV, Our Lady of the Watch, Lourdes Grotto, Saint John's Tower, Jubilee 2000 Bell, bronze St Peter, Square Garden | **PUBLISH** | Museums' own itinerary. |
| D5.6 The long dynastic history (Innocent VIII, Bramante, Ligorio/Pius IV by 1565, Pius V with Mercati and Aldrovandi, Trajan's aqueduct, Napoleonic plunder, Gregory XVI, Moroni, Dupré 1887, Boutellier 1887–88, Momo and Nicolini after 1929) | **PUBLISH** | All from the Museums' and Governorate's own pages, all named and dated. |
| D5.7 Access by booked tour only, sold as a separate Museums ticket category | **PUBLISH** | Confirmed — "Vatican Gardens" appears as its own line in the Museums' Tickets menu on re-fetch. |
| D5.8 A price for the Gardens tour | **DROP** | The finder got none; the price lives behind an SPA. Publish none. Correct call, upheld. |
| D5.9 Dress code applies | **PUBLISH** | Museums state it covers the Gardens. |

**D6. Vatican Necropolis — historic-site**

| Claim | Verdict | Reason |
| --- | --- | --- |
| D6.1 Coords 41.9021730, 12.4536689 | **PUBLISH** | Nominatim resolved it cleanly to a Vatican City address. |
| D6.2 Below the Vatican Grottoes, between three and eleven metres below the nave floor | **PUBLISH** | Re-verified verbatim. |
| D6.3 Explorations begun in the early years of Pius XII (1939–1958); excavations 1939–1949 | **PUBLISH** | Fabbrica. |
| D6.4 Second-century brick tombs became fourth-century foundations; over 40,000 m³ of earth moved | **PUBLISH** | Re-verified verbatim. |
| D6.5 Constantinian basilica: five naves, 88 columns, floor level with the Trophy of Gaius | **PUBLISH** | Fabbrica. |
| D6.6 22 tomb buildings, around 1000 burials, freedmen-family names in the inscriptions | **PUBLISH** | Re-verified verbatim. |
| D6.7 Trophy of Gaius in the Niche of the Pallia; plaster fragment 3.2 × 5.8 cm with PETR[…] ENI[…], read *Pétros enì* / *Pétros en i[réne]* | **PUBLISH** | Fabbrica. Measurement plus a stated reading, correctly hedged as a reading. |
| D6.8 "the largest basilica in the west" (of Constantine's) | **DROP** | Superlative. Correctly flagged. |
| D6.9 *"the most significant historical and archaeological evidence"* | **DROP** | **Finder miss.** Opening line of the same page the finder mined for D6.2. Not in §8.1. |
| D6.10 Access by request only; `scavi.va` now serves the Fabbrica page | **REWRITE** | The access fact publishes. The URL-behaviour observation is research method. Replacement: *"The Vatican Necropolis is visited by request, arranged through the Fabbrica di San Pietro."* |

---

## E. The basilica complex (finder §5.B, records 7–17)

| # | Claim | Verdict | Reason |
| --- | --- | --- | --- |
| E1 | **Dome** — conceived and built to the drum by Michelangelo; completed by Giacomo della Porta with Domenico Fontana 1588–1590 | **PUBLISH** | Re-verified verbatim. |
| E2 | "raising the dome in just 22 months thanks to the tireless work of 800 labourers" | **REWRITE** | The numbers publish; "just" and "tireless" are the Fabbrica's admiration. Replacement: *"the dome was raised in 22 months, with 800 labourers."* |
| E3 | Double-shelled with a cavity, ogival, slenderer than the initial design | **PUBLISH** | Fabbrica. |
| E4 | 18 November 1593, gilded bronze sphere and cross by Sebastiano Torrigiani on the lantern spire | **PUBLISH** | Fabbrica. |
| E5 | Lantern-ring inscription and the dome-base mosaic frieze, transcribed | **PUBLISH** | Quoted inscriptions, verbatim. |
| E6 | Mosaics under Marcello Provenzale 1598–1613; ~3,000 m²; sixteen wedge-shaped compartments | **PUBLISH** | Re-verified verbatim. |
| E7 | "Michelangelo's **superb** dome" | **DROP** | **Finder miss.** The Fabbrica's word, on the page the finder quoted for E6. Not in §8.1. |
| E8 | Heights: inner dome of the lantern 117 metres; cross over 133 metres | **PUBLISH** | Re-verified verbatim, attributed to the Fabbrica. |
| E9 | **136.57 metres** | **DROP** | No primary source. The finder was right to refuse it — and note this is the very figure the brief offered as its example of a publishable measurement. It is not sourceable from the Fabbrica and must not ship. |
| E10 | Any "tallest dome" ranking | **DROP** | Superlative. |
| E11 | 231 steps to the terrace, 320 more to the top, 551 total; with lift, 320 remain | **PUBLISH** | Re-verified on both booking pages. |
| E12 | Dome hours: winter (26 Oct 2025 – 28 Mar) 07:30–17:00; summer (29 Mar 2026 – 25 Oct 2026) 07:00–18:00 | **PUBLISH** | Re-verified verbatim, **with the dates attached** as the finder insists, so staleness is visible. |
| E13 | Prices "**from** €17" / "**from** €22" | **REWRITE** | The portal renders "17 €" and "22 €". Replacement: *"The Fabbrica's booking portal lists the dome with stairs, including the basilica, at €17, and the dome with lift at €22."* |
| E14 | Recommended from age 6; under-18s accompanied; not wheelchair accessible; no animals; stroller drop-off under the portico; no cloakroom service at present | **PUBLISH** | Re-verified verbatim. Practical and material. |
| E15 | Non-refundable, non-transferable, non-modifiable; full refund only where the Holy See cancels for a liturgical celebration or event | **PUBLISH** | Re-verified verbatim. |
| E16 | HIVE s.r.l. company details and "Licenza n. 32657 del 26.01.2023" | **DROP** | Operator identity and licence date from the operator's own footer. Trading-duration bar. It belongs in the finder as a provenance note, which is where the finder put it — it must not reach the page. |
| E17 | The portal's "About the area" marketing block, "spectacular view", "unique perspective", "unmissable" | **DROP** | Superlatives; also re-verified live ("a unique panorama of the Eternal City", "a truly unmissable experience"). |
| E18 | **Vatican Grottoes** — no coordinate | **REWRITE** | Do not inherit the basilica's coordinate silently; that would assert a location the record does not have. Ship without a coordinate, or fold the Grottoes into D1. |
| E19 | Grottoes: vaults built 1590–1591; descent from Sangallo the Younger's variation presented to Leo X after Raphael's death in 1520 | **PUBLISH** | Fabbrica. |
| E20 | 1592 Clementine crypt; 1616–1617 Paul V's corridors and three chapels frescoed by Ricci da Novara; Urban VIII's four oratories by Bernini with Ciampelli and Abbatini; national chapels 1954–1992; Pius XII's tomb 1958; exits to Largo Braschi and Largo San Gregorio l'Illuminatore; 1979 archway | **PUBLISH** | Fabbrica, all named and dated. |
| E21 | **Treasury Museum** status conflict | **REWRITE — and this one is mandatory.** | Re-verified: `…/products/the-treasury-museum` still says *"the Treasure Museum will be temporarily closed"* while `…/san-pietro/the-museum` still says it is open during basilica hours. Ship `status: temporarily-closed` with prose that says so, sourced to the products page. The test's `closed_to_visitors` / `@sub_part` guard will fire on an `open` status carrying closure prose. Do not ship the pair inconsistently. |
| E22 | Treasury history: born with the basilica; dispersals 410, 455, 545, 830, 846, 1084, 1527; Jacobin requisition 1798–1799; Chapter custody since the eleventh century; first arrangement 1909 in two rooms; Minissi's transformation from 1949 for the 1975 Jubilee, on the "protagonism of the objects" | **PUBLISH** | Fabbrica, all dated. |
| E23 | Treasury products-page framing: "shining for their beauty", "priceless treasures" | **DROP** | **Finder miss.** Re-verified live on the page the finder cited for E21. Not in §8.1. |
| E24 | **Pétros ení** in the Octagonal Halls, inside a dome pillar, restored by the Fabbrica's artisans | **PUBLISH** | Fabbrica. |
| E25 | "opened to the public for the first time" for this exhibition | **REWRITE** | A priority claim. Replacement: *"The Octagonal Halls were restored and opened for the exhibition."* |
| E26 | Two narrative paths; 3D digitisation from over 400,000 photographs; partners Microsoft, Iconem, DADADA studio & Processoffice; Orphéo, Chalmin, Kalve; Zander, Occhetta, Stoia | **PUBLISH** | Fabbrica, all named. |
| E27 | Pétros ení hours, same dated ranges as the dome | **PUBLISH** | Re-verified verbatim. |
| E28 | "the world's largest Christian basilica" | **DROP** | Superlative. Correctly flagged. |
| E29 | **Altar of the Confessio / Tomb of St Peter** — the Confessio, and the altars of Gregory the Great (590–604), Callistus II (1123), Clement VIII (1594) under Bernini's canopy | **PUBLISH** | Fabbrica. |
| E30 | Shipping E29 as a **separate record** from D1 | **DROP** | It is the basilica's high altar. A standalone record duplicates D1's coordinate and access and invites the banned "is a separate record" framing. Fold into D1. |
| E31 | **Cathedra of Saint Peter** as a standalone record | **DROP** | The finder calls it slim and it is: one sentence of object description, no coordinate, no independent access. Fold into D1 or omit. |
| E32 | Cathedra content: ancient wooden throne, ivory plaques of the labours of Hercules, Carolingian ninth-century friezes | **PUBLISH** | As a line inside D1. |
| E33 | **Pietà** sculpted 1498, Michelangelo aged twenty-three, commissioned by Cardinal Jean de Bilhères Lagraulas for his tomb in the Chapel of the King of France, a chapel no longer standing, on the southern flank of the old basilica | **PUBLISH** | Fabbrica, as a line inside D1. |
| E34 | "A sculpture of superhuman beauty and perfection" | **DROP** | Superlative. Correctly flagged. |
| E35 | Pietà as a standalone `historic-site` record | **DROP** | A sculpture inside the basilica is not a place with its own access. Fold into D1. |
| E36 | **Vatican Mosaic Studio** as a place record | **DROP** | The finder could not establish it is publicly visitable. A place record for something a reader cannot enter, with no hours and no access statement, fails the status/prose agreement rule the moment anyone writes a status. Carry as a line in D1. |
| E37 | Mosaic Studio content: from the early sixteenth century, Gregory XIII entrusting Muziano with the Gregorian Chapel dome mosaics 1578–1580 | **PUBLISH** | As a line inside D1. |
| E38 | **Historical Archive of the Fabbrica**: open 15 September to 15 July; study room Mon–Fri 08:30–12:30 | **PUBLISH** | Re-verified verbatim. Ship as research access, with prose that matches — a reader must not read it as a visitable site. |
| E39 | **Bernini's Colonnade** as a standalone record | **DROP** | Its every figure is already D2.4, and D2 is the colonnade's place. A second record splits one thing in two. Fold into D2. |
| E40 | **Vatican Obelisk** as a standalone record | **DROP** | Same: D2.6 carries it. Fold into D2. |
| E41 | Supplying an obelisk height from memory | **DROP** | The finder explicitly refused. Upheld — the Fabbrica gives none. |

---

## F. The Museums' collections (finder §5.C, records 18–35)

**F0. Shape ruling (finder §9.4).** The finder left this open. I rule: **records 18–33 ship as
`museum` records inheriting D3's hours, prices and access**, because each has its own published page,
its own history and its own named holdings, and a reader looking for the Pinacoteca wants to find
the Pinacoteca. Records 34 and 35 are treated separately below. Every one of them must carry D3's
access by inheritance and must not restate it as if independently sourced.

| # | Claim | Verdict | Reason |
| --- | --- | --- | --- |
| F1 | The dated, named substance of records 18–33 — Pinacoteca (Beltrami, inaugurated 27 Oct 1932, 118 paintings under Pius VI c. 1790, Tolentino 1797, gallery idea 1817, present 460 paintings in eighteen rooms); Raphael's Rooms (1508–1524); Borgia Apartment (Pinturicchio, autumn 1492 – early 1494, the 29 March 1493 letter, Leo XIII's opening); Modern and Contemporary Art (inaugurated 23 June 1973, the 7 May 1964 address, ~8,000 works, Matisse room 2011, Vence works 1980); Gregorian Egyptian (1839, nine rooms, Ungarelli); Gregorian Etruscan (inaugurated 2 Feb 1837, the four named acquisitions, Bramante's staircase begun 1512, Barocci/Zuccari 1563, Santi di Tito/Circignani 1564); Pio Clementino (Julius II's Cortile delle Statue, Dori/Simonetti/Camporese, Tolentino 1797, Vienna 1815, Canova); Gallery of Maps (120 × 6 m, forty representations, 1578–1580, Mascherino, Muziano, Nebbia, Danti, 32 + 8 maps, 51 ceiling panels); Anima Mundi (the full 1924–2024 chronology as given); Chiaramonti/Braccio Nuovo/Lapidary; Gregoriano Profano (16 May 1844); Pio Cristiano (1854); Jewish Lapidarium; Tapestries (1788–1789); Carriage Pavilion (19 Apr 1973, Grand Gala Berlin 1826, the vehicle list); Niccoline Chapel (Nicholas V, Fra Angelico, payments Feb and Mar 1448, St Stephen and St Lawrence, restored 1995–1996) | **PUBLISH** | All from the Museums' own collection pages, all named, dated and countable. This is the bulk of the page's substance and it is sound. |
| F2 | "some masterpieces of the greatest artists of the history of Italian painting" (Pinacoteca) | **DROP** | Superlative; keep the artist list. |
| F3 | "one of the most important Vatican collections of ancient inscriptions" (Jewish Lapidarium) | **DROP** | Trips `\bone of the (?:most\|best\|finest\|largest\|oldest\|greatest\|richest)\b` literally, and is banned regardless. |
| F4 | "one of the great works of fifteenth-century Italy" / "probably the peak" (Niccoline) | **DROP** | Superlative. |
| F5 | "revolutionary … for the first time" (Gallery of Maps) | **DROP** | Priority claim; the finder was right to treat it as a superlative. |
| F6 | Chiaramonti / Braccio Nuovo / Lapidary Gallery beyond the index abstracts | **REWRITE** | The finder read abstracts, not the full pages, and said so. Publish only what the abstracts support — the loggia siting, the Pius VII naming, the post-Napoleonic re-ordering, and the five named highlights — or fetch the full pages first. Do not extrapolate. |
| F7 | The finder's own note that it "read the index abstracts, not the full Read All pages" | **DROP** | Research method. Belongs in this file, never on the page. |
| F8 | Nominatim returning empty for Anima Mundi; "inherit record 3's coordinate" | **REWRITE** | Ship Anima Mundi without a coordinate rather than borrowing D3's. Inheriting access is correct; inheriting a *point* asserts a location. |
| F9 | **Necropolis of the Via Triumphalis** (record 34) as its own record, distinct from D6 | **PUBLISH** | The finder is right and the distinction matters: different necropolis, different part of the state, run by the Museums, sold as a separate ticket category. Confirmed as its own line in the Museums' Tickets menu. |
| F10 | Via Triumphalis substance: terraced slopes beside the road nearest the city, bordering the Vatican Hill; collective and individual tombs; inscribed stelae; middle and lower ranks of imperial society | **PUBLISH** | Museums' own page. |
| F11 | Via Triumphalis seasonal closure **15 July – 3 September** | **PUBLISH** | From the Museums' "Temporary and extraordinary closures" table. Must be reflected in the record, and the `status` must agree with it. |
| F12 | "an outstanding example" / "a unique archaeological site" | **DROP** | Superlatives. Correctly flagged. |
| F13 | **Bramante's double-helix staircase** (record 35) as a standalone `attraction` | **DROP** | The finder calls it slim and probably a note on record 23. Agreed: it has no independent access and is visible from inside the Gregorian Etruscan Museum. Fold into that record. |

---

## G. State institutions (finder §5.D, records 36–41)

| # | Claim | Verdict | Reason |
| --- | --- | --- | --- |
| G1 | **Library** coords, address (Cortile Belvedere, 00120), contact `bav@vatlib.it` | **PUBLISH** | Library's own pages. |
| G2 | Holdings: ~180,000 manuscripts and archival documents; ~2,000,000 printed books; ~8,300 incunabula; ~300,000 coins and medals; 100,000+ graphic works; 150,000+ photographs | **PUBLISH** | Library's own About page. Counts, not rankings. |
| G3 | Mission statement and *"open to qualified scholars and researchers, regardless of religion, origin, or cultural background"* | **PUBLISH** | Library's own words. |
| G4 | Reading rooms Mon–Fri 09:00–17:20; the four admission categories | **PUBLISH** | Library's own pages. |
| G5 | *"The Library does not offer regular public visits. However, access to its historic and monumental spaces may be granted on an occasional basis in conjunction with special events and institutional initiatives."* | **PUBLISH** | The finder is right that this is the record's reason to exist — it is the honest answer to "can I go in?", from the Library. The `status` must agree with it; do not ship `open`. |
| G6 | Foundation "In 1475, Sixtus IV founded the Vatican Library", attributed to UNESCO | **REWRITE** | Attributing an institution's founding to a third party when the institution publishes its own history pages is weak sourcing. Fetch `vaticanlibrary.va/…/history-of-BAV.html` and cite the Library, or omit the year. |
| G7 | The Library's photographic-reproduction ordering system and copyright notice | **DROP** | Quarantined. Permissions. |
| G8 | **Archive** — no coordinate; located along the braccio di Pio IV of the Apostolic Palace, adjacent to the Salone Sistino, on the Piano Nobile | **PUBLISH** | Ship the siting prose, ship no coordinate. Do not borrow one. |
| G9 | Archive timeline: 1611 *Novum Archivum*; 31 Jan 1612 Ansidei; 1613–1614 move; 23 July 1630 autonomy; 1646 first use of *Archivio Segreto Vaticano*; 1660 Alexander VII; 1798 Castel Sant'Angelo transfer; 1810 Napoleon, ~3,239 crates; 1881 Leo XIII opens it; 22 Oct 2019 *L'esperienza storica* renames it Archivio Apostolico Vaticano | **PUBLISH** | Archive's own timeline, all dated. |
| G10 | The Passetto di Borgo named as the 1798 route | **REWRITE** | The Passetto is Borgo's (`passetto-di-borgo-rome`, verified present) and Borgo's finder flagged it as a straddler. Name the route in passing without creating a record: *"…moved in from Castel Sant'Angelo in 1798."* Simplest safe course: drop the Passetto clause. |
| G11 | The Bunker depositories: "18 October" with no year; two floors; 31,000 m³; 43 linear km of shelving | **REWRITE** | Publish the capacity figures; publish no date at all, since the finder captured a day and month without a year and a partial date is worse than none. |
| G12 | Holdings: 600+ fondi; 75+ diplomatic representations; the named family archives; Vatican I and II complete, much of Trent | **PUBLISH** | Archive's own patrimony page. |
| G13 | Access free and open to qualified scholars with a *laurea magistrale* or equivalent; **consultation permitted to the end of the pontificate of Pius XII (October 1958)** | **PUBLISH** | The Archive's own access statement. This is an access rule the Archive publishes about itself, not a statement of Vatican law. |
| G14 | Hours Mon–Tue 08:00–16:15, Wed–Fri 08:00–12:45; admission cards Mon–Tue 08:00–12:00, Wed–Fri 08:00–10:30 | **PUBLISH** | Archive's own page. |
| G15 | Study-room conduct rules (no bags, no pens, no cameras or wearable recording tech, no food, phones outdoors only, sober dress, silence) | **PUBLISH** | The finder's distinction is correct: these are conduct rules, not a reproduction policy. |
| G16 | The Archive's *Fotoriproduzioni* page | **DROP** | Quarantined, unopened. Correct. |
| G17 | **Palace of the Governorate** as a place record | **DROP** | Not established as publicly visitable, and once the legal material is stripped — which it must be — almost nothing publishable remains but a coordinate. The finder itself offered this as the better course. |
| G18 | Governorate's constituting law, enumerated powers, form of government, Law No. CCLXXIV of 25 November 2018 | **DROP** | Vatican law. Quarantined by the finder, correctly and emphatically. |
| G19 | The institutional fact that the Directorate of Museums and Cultural Heritage sits under the Governorate | **PUBLISH** | Institutional, not juridical. Carry it as zone context, not as a place record. |
| G20 | **Casina Pio IV** as a standalone record | **DROP** | Already an itinerary stop in D5.5, and a standalone record needs its own visitor evidence, which the finder did not find. |
| G21 | Casina content: Pirro Ligorio (1512/13–1583) for Pius IV, by 1565 | **PUBLISH** | As a line inside D5. |
| G22 | The Casina's present occupant (Pontifical Academy of Sciences) | **DROP** | Unsourced by anything the finder fetched. The finder refused it; upheld. |
| G23 | **Vatican Pharmacy** record | **DROP** | A coordinate and a passing news mention. No hours, no access, no statement that visitors may use it. The finder said do not ship without more; there is no more. |
| G24 | **Vatican Post** as a standalone record | **DROP** | Nominatim empty for the square office. Keep the branch inside the Museums as a service line on D3 (already D3.15). |

---

## H. Non-place records (finder §5.E)

| # | Claim | Verdict | Reason |
| --- | --- | --- | --- |
| H1 | Tickets for General Audiences and papal liturgical celebrations are **always free of charge**; lay faithful request via the Prefecture of the Papal Household, clergy via the Office for Liturgical Celebrations | **PUBLISH** | Holy See's own page. Makes no territorial or legal claim. |
| H2 | The day, time or venue of the general audience | **DROP** | Unsourced. The finder explicitly refused to supply "Wednesday morning" from general knowledge and that refusal is the single best judgement call in the file. Upheld absolutely. |
| H3 | Masses in St Peter's Basilica, weekday and holiday schedules as listed | **PUBLISH** | Fabbrica's Holy Masses page. |
| H4 | Reconciliation hours Mon–Sat 07:00–12:30 and 16:00–19:00; Sun 07:00–13:00 and 16:00–19:00; continuous Adoration from the end of the 08:30 Mass to Benediction | **PUBLISH** | Re-verified verbatim. |
| H5 | Guided tours Mon–Sat 09:30–17:30 (last registration 17:00); Sundays and Vatican holidays 13:30–15:30 (last registration 15:00); the "Bernini and the Barberini" themed tour | **PUBLISH** | Re-verified verbatim. |
| H6 | Dedicated access for worshippers and celebrants | **PUBLISH** | Re-verified verbatim. Operational. |
| H7 | Castel Gandolfo Papal Palace and Secret Garden, €12.00, family tariff, on-site purchase, `polomusealecastelgandolfo@scv.va` | **DROP** | Out of scope: Alban Hills, not Rome, not Vatican City, not one of the thirty-one zones. The finder sourced it and correctly excluded it. Re-verified as a live Museums ticket line — and still not this page's. |
| H8 | Cardinal Mauro Gambetti appointed Vicar General for Vatican City State on 20 February 2021, and Archpriest of the Vatican Basilica | **REWRITE** | The finder offers this as the one safely institutional fact from a page that is otherwise pure jurisdiction. It is — but "Vicar General **for Vatican City State**" is a jurisdictional office and the surrounding page quotes *Ex Lateranensi pacto* and a 1991 chirograph on jurisdiction. Safest replacement, if the page wants it at all: *"Cardinal Mauro Gambetti OFM Conv. is Archpriest of the Vatican Basilica."* Drop the Vicar General title and the date. |

---

## I. Exclusions (finder §6) — all upheld, all verified

I re-ran `taken_slugs.py` and confirmed **every slug in the finder's §6.1 table exists** in the
shipped corpus, under the zone the finder names. All fourteen checked, all present.

| # | Claim | Verdict | Reason |
| --- | --- | --- | --- |
| I1 | Art. 15 properties are a third legal tier, on Italian soil, not part of the state | **PUBLISH** | Treaty Art. 15 re-verified verbatim: *benché facenti parte del territorio dello Stato italiano*. The finder's five-word pivot is exactly right and is the strongest piece of reasoning in the file. |
| I2 | San Giovanni in Laterano, Palazzo del Laterano, Museo storico vaticano, Santa Maria Maggiore (Monti); San Paolo fuori le Mura (Ostiense); Cancelleria (Parione); Propaganda Fide palace and museum (Colonna); Sant'Uffizio and Convertendi (Borgo) — **not this page's** | **PUBLISH** | Every slug verified present in the shipped corpus. |
| I3 | Describing any of them as "in the Vatican" | **DROP** | Would contradict Art. 15's own words. |
| I4 | Art. 16 is a **different list with a different grant** — Gregorian University, Biblical, Oriental and Archaeological Institutes, Russian Seminary, Lombard College, the two Sant'Apollinare palaces, the Santi Giovanni e Paolo retreat house — tax exemption and protection from expropriation only | **PUBLISH** | Re-verified verbatim. The finder keeps Art. 15 and Art. 16 rigorously apart; this is precisely what the brief demanded and it did not slip once. |
| I5 | Calling any Art. 16 building "extraterritorial" | **DROP** | Conflation of two grants the Treaty kept apart. |
| I6 | Castel Gandolfo, Papal Villas, Vatican Observatory | **DROP** | Outside Rome and outside the thirty-one zones. |
| I7 | Piazza Pio XII, Via della Conciliazione (Borgo); Piazza San Callisto (Trastevere) | **DROP** | Already published elsewhere; slugs verified. |
| I8 | Sala dei Capitani, Palazzo dei Conservatori | **DROP** as a record | Campitelli's; slug verified. See D5.4 for the permissible mention. |
| I9 | Passetto di Borgo | **DROP** | Borgo's; slug verified. See G10. |
| I10 | **Aula Paolo VI** | **DROP** | Upheld emphatically. OSM places it in rione Borgo; OSM has no authority over territory; the only authority is the unreadable Annex I plan; and deciding it would require stating where the border runs. The finder's refusal is correct and is the right instinct applied to the hardest case in the file. |
| I11 | The audience *material* in H1, which makes no territorial claim | **PUBLISH** | Correct: booking routes are not a territory claim. |

---

## J. Superlatives and framing the finder MISSED

The finder's §8.1 table is good and it caught the loud ones. Re-fetching turned up **six more** on
pages it quoted, none of them in the table. Each is a DROP already counted in its section above;
they are gathered here so the writer can recognise them on sight.

| Phrase | Page the finder used it from | Ruling |
| --- | --- | --- |
| "the most significant historical and archaeological evidence" | Fabbrica, `…/san-pietro/the-necropolis`, opening line | D6.9 DROP |
| "Michelangelo's **superb** dome" | Fabbrica, `…/san-pietro/the-dome` | E7 DROP |
| "shining for their beauty" / "priceless treasures" | Fabbrica, `…/products/the-treasury-museum` | E23 DROP |
| "the primary importance of the Sistine Chapel in the life of the Church" | Museums, Sistine Chapel history page | D4.14 DROP |
| "his extraordinary artistic capacities" | Museums, Sistine Chapel history page | D4.15 DROP |
| "an unprecedented artistic and spiritual adventure" / "the majestic building" | Fabbrica, `…/san-pietro/the-basilica` | Framing — cut, publish D1.2–D1.4 instead |
| "a unique collection of artistic and architectural masterpieces" | UNESCO short description | DROP — same page as C17 |

Note also that the test's superlative regex
`(?:only|first|oldest|largest|…)\s+(?:\w+\s+){0,2}(?:in|of|on)\s+(?:the\s+)?(?:rione|Rome|Italy|…)`
**does not list "the world"**. So "the largest religious building in the world" and "the smallest
independent State in the world" would sail past the gate untouched. They are still banned by the
corpus rule. **The regex is a floor, not a ceiling, and on this page more than any other the writer
cannot lean on it.**

---

## K. What the finder got wrong

Six things, in descending order of seriousness.

1. **It mapped the Ricciolo d'Italia.** §3.1 warns, correctly and at length, against using the
   Ricciolo to explain the border — and then gives a four-clause route description of it: where it
   begins (Porta Angelica), which arm it runs behind, that it separates Vatican territory into two
   parts, and where its tip is. That is the prohibited claim, written out. B5 kills it.
2. **It was willing to publish boundary dimensions.** §3.1 recommends publishing "about three metres
   wide". A width for a strip of foreign territory beside the square is a boundary statement with a
   number attached. B6 kills the width and the area along with the length.
3. **It cleared the Hague Convention for publication** (§4, §7.5). That is a protection status over
   the whole territory and a claim about the legal regime governing the state. The `evidence_ruling`
   and the Vatican-law bar both catch it. C16.
4. **It missed a Vatican law citation on a page it mined.** UNESCO's own text cites "the law for the
   protection of the cultural heritage (no. 355, 25/07/2001)". The finder harvested that page for the
   inscription and its superlatives and never quarantined this. C19.
5. **It misstated what the gate asserts.** §1 and §10 claim the gate reserves all six names. It
   reserves four; the Gardens and the Necropolis are not in `@vatican_needles`. The conclusion
   survives — I verified all six are free against the 1,252-row slug list — but the reason given is
   wrong, and a later wave reading this file would inherit a false belief about the test.
6. **It left six superlatives on the table** (§J), all on pages it quoted from directly.

**What it got right, and should be said plainly:** the Art. 15 / Art. 16 separation is handled
flawlessly; the refusal to supply "Wednesday morning" for the general audience from general
knowledge is exactly the discipline this programme needs; the refusal of 136.57 m — a figure the
*brief itself* offered as a model measurement — is a better call than the brief; the Aula Paolo VI
refusal is correct; the quarantine of the photography, drawing and reproduction policies is complete;
and the transcription accuracy across sixteen re-fetched sources is the best I have seen in this
programme. `photos: []` is carried on every record and no image is named, sourced or linked anywhere
in the file.

---

## L. Counts

| Verdict | Count |
| --- | --- |
| **PUBLISH** | 113 |
| **REWRITE** | 20 |
| **DROP** | 64 |
| **Total adjudicated** | 197 |

Of the 64 DROPs, **10 are boundary or jurisdiction kills** — B1, B2, B3, B5, B6, B9, D1.8, D2.8,
D2.9, I10 — with B4 and B7 the two boundary REWRITEs. **17 are superlatives or priority claims**
(D4.13–D4.16, D6.8, D6.9, E7, E10, E17, E23, E28, E34, F2–F5, F12), six of which the finder had not
identified.

Nothing that survives tells a reader where Vatican territory begins.
