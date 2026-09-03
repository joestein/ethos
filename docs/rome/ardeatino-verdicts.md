# Ardeatino (Q. XX, Roma Capitale toponymic code 220) — VERIFIER'S VERDICTS

Adjudication of `docs/rome/ardeatino-finder.md`. Ruled **2026-09-03**.
I did not gather this evidence and I owe it no loyalty. Every ruling below is mine.

**Tally: 23 PUBLISH · 20 REWRITE · 29 DROP** — 72 record-level rulings, plus 17 claim-level
excisions listed in §3. **Surviving discrete place records: 42.** Tier: **GUIDE**.
**Escalated to the arbitrator: 5 items covering 10 records.**

Roster cross-check: `priv/seed_data/rome_roster.json` carries Ardeatino as
`unit: quartiere, code: 220, numeral: "Q. XX"` with **no `municipio` field** — unlike the rione
entries, which all carry one. The finder's refusal to state a Municipio for the quartiere is
correct and is now confirmed against the roster itself, not merely against the brief.

---

## 0. RE-FETCH AUDIT — eleven sources, every one reached

I re-fetched the sources the finder leaned on hardest. Where WebFetch was blocked I refetched with
`python3` + `urllib` and browser headers and read the raw bytes. **All eleven returned content.
All eleven say what the finder says they say.** That is an unusually clean result and the finder
deserves it on the record.

| # | Source | Result | Does it say what the finder says? |
|---|---|---|---|
| 1 | `catacombesancallisto.it/it/orari.php` | 200 | **Yes, verbatim.** 09:00–12:00 / 14:00–17:00, "Tutti i mercoledì" closed, tours every 30 min ≈40 min, minimum two people, "biglietteria chiude alle 16:50", 16:30 Holy Thursday. **The stale year is real**: "Dal 15 gennaio al 12 febbraio **2025**" and "April 20, **2025**" still stand on the page in 2026. Finder's ⚠ upheld. |
| 2 | `parcoarcheologicoappiaantica.it/luoghi/complesso-di-capo-di-bove/` | 200 | **Yes, verbatim.** "Dal **22 giugno 2026** il Complesso di Capo di Bove è temporaneamente chiuso al pubblico per consentire l'avvio dei cantieri di restauro"; "al IV miglio della Via Appia Antica, a circa 500 m di distanza dal Mausoleo di Cecilia Metella"; "un'area verde di circa 8.600 mq"; the 2002 *diritto di prelazione*; "un impianto termale della metà del II secolo d.C. con fasi edilizie fino al IV secolo"; €8/€2/€4, €12/€2, €25. The banned clause is also real and present: "(come sancito anche da un **vincolo** specifico)". |
| 3 | `abbaziatrefontane.it` | 200 | **Yes, verbatim, all four hour sets.** Complex "tutti i giorni dalle 6:30 alle 20:45"; SS. Vincenzo e Anastasio same; Santa Maria Scala Coeli "9:00 alle 12:00 e dalle 15:00 alle 17:30"; San Paolo al Martirio "7:30 alle 20:00"; shop Mon–Sat 8:30–19:30, Sun 9:00–13:30; portineria as given. **Two negatives confirmed**: the abbey's own site does **not** say "monumento nazionale" and does **not** claim to be the only Trappist abbey — both come from it.wikipedia. And it states **no** brewery tour, taproom or public access to the brewery. Finder's §7.3 caution vindicated. |
| 4 | `catacombeditalia.va/…/catacomba-di-domitilla.html` | 200 | **Yes, verbatim.** Via delle Sette Chiese 282 – 00147; "lun / merc-dom 09:00 - 12:00 / 14:00 - 17:00"; rest day "martedì"; ATAC 30, 130, 160, 670, 174, 716. **Stale year real**: "25 Dicembre - 21 Gennaio **2025**". Canonical URL settled: PCAS gives **`www.catacombedomitilla.it`**. The superlative "il più vasto cimitero sotterraneo cristiano di Roma" is present and is correctly banned. |
| 5 | `vatican.va/…/extraterritoriale_it.html` | 200 | **Yes.** Thirteen Roman holdings as the finder lists them, plus Castelgandolfo and Santa Maria di Galeria. **No catacomb, no San Sebastiano fuori le mura, no Tre Fontane, nothing on the Appia or Ardeatina.** The finder's §2 ruling is correct and is the strongest piece of work in the file. |
| 6 | `catacombe.org/it/info?_escaped_fragment_=` | 200 | **Yes** — Via Appia Antica 136, "Dal martedì alla domenica: 09:15 - 17:15", "Ultimo ingresso alle 16:45", Monday closed, €10/€7, in-house guide only, five languages. **And it gives more than the finder reported**: a *current* annual closure, "**dal 7 dicembre al 27 dicembre 2026**". See §4.2. |
| 7 | `mausoleofosseardeatine.it` | 200 | **Yes** — Via Ardeatina 174, 00179 Roma; "Lun.-Ven.: 8:15 – 15:15"; "Sab.-Dom.: 8:15 – 16:45"; ANFIM, info@anfim.org, +39 06 6795629. Adds a WhatsApp line, +39 392 4484043. |
| 8 | `whc.unesco.org/en/list/1708/` | **403 to WebFetch, 200 to urllib** (161,166 B) | **Yes** — "composed of **19 component parts**", "Constructed and developed from 312 BCE to the 4th century CE", "More than 800 kilometres long", and the banned double superlative verbatim. **And it gives the fact the finder omitted**: "Date of Inscription: **2024**", "Criteria: (iii)(iv)(vi)", "Property : 4,950.84 ha". No component is named for the Ardeatino stretch — the finder's warning not to assert one is correct. |
| 9 | `parcoappiaantica.it/…/cartiera-latina/` | 200 | **Substantially yes, one over-read.** Via Appia Antica 42; the 1998 concession; area verde 8.30–17.00 / 8.30–19.00; "lambita per tutta la sua lunghezza dal fiume Almone"; Hortus Urbis as "un'area didattica (anche per le scuole) dedicata alle tradizioni della Campagna Romana". The three superlatives are present as flagged. **But the page says "La fabbrica chiuse nel 1986" — no month.** See §4.9. |
| 10 | `gruppostoricoromano.it` | Reached, empty | **Yes.** Serves only the token "SwiteFrontendNg". Independently confirmed unreadable. DROP. |
| 11 | `parcoarcheologicoappiaantica.it/luoghi/tor-marancia/` | 200 | **Yes, verbatim.** "200 ettari di campagna romana"; three entrances at Piazza Lante, Via Francesco Belloni (both off Via Giulio Aristide Sartorio) and Viale Londra; "**Il sito è di libero accesso**"; Numisia Procula and the lead pipe; Amaranthus. The "quartieri più popolosi" superlative is present and is correctly banned. |

Two further fetches I ran that the finder did not, both of which changed a ruling:

| Source | Finding |
|---|---|
| `sansebastianofuorilemura.org` | Hours, office hours, Masses, address and phone all **confirmed verbatim**. **But the page states: "Tra le parrocchie attualmente affidate ai frati francescani, San Sebastiano fuori le mura è la prima a Roma."** That is an operator-sourced priority claim and the finder reproduced it in its own draft prose. See §3.11. |
| `babylunapark.it` | Address and hours confirmed. **The site also carries a founding year — "inaugurato il 29 giugno 1989" — and a superlative, "L'unico parco all'aperto ma tutto coperto".** The finder fetched neither and flagged neither. See §3.16. |

---

## 1. THE DUPLICATION CHECK — RE-RUN, BECAUSE THE FINDER'S WAS STALE

**The finder reports "786 places across 21 shipped rione files". The current figure is 907 across
21 files.** More places have been added to the shipped zones since the finder ran its check, so
every collision search in its §0 was run against a corpus 121 places smaller than the one that will
gate this seed. I re-ran them all.

| query | hits now | ruling |
|---|---|---|
| `catacomb` | 0 | clear |
| `ardeatin` | 0 | clear |
| `marancia` | 0 | clear |
| `priscilla` | 0 | clear |
| `appia` | 2 — `chiesa-di-san-cesareo-de-appia-san-saba-rome`, `centro-di-documentazione-dell-appia-sant-angelo-rome` | clear, as the finder argued |
| `sebastiano` | 1 — `san-sebastiano-al-palatino` (Campitelli) | clear, different church |
| `fontane` | 4 — Quattro Fontane and piazza fountains | clear |
| `mura` | 7 — Aurelian segments in Celio, Testaccio, Trastevere; Servian in Castro Pretorio and Trevi | bears on Porta Ardeatina, §5.5 |

**Conclusion unchanged: the Ardeatino field is clear.** The finder reached the right answer from a
stale number. Every wave from here should re-run `taken_slugs.py` at verification time and not
trust the finder's transcription of it.

---

## 2. PUBLISH — 23 records

Ship as the finder framed them. Where a claim-level excision applies it is named in §3.

**Catacombs and their fabric.** #7 **Catacomba dei Santi Marco e Marcelliano** — the excavation
sequence is dated and attributed throughout (Bosio 1596 / *Roma sotterranea* 1632, de Rossi 1868,
Wilpert 1902–1905 under the Istituto San Tarcisio courtyard, Ferrua 1947, Saint-Roch), and the
record correctly says no visiting arrangements are stated. #8 **Catacomba di Balbina** — publish
**with #35 merged into it**, as one record: the *Depositio episcoporum*, the *Index coemeteriorum
vetus* and the Sabinus inscription, the honest statement that the identification remains uncertain,
and the 3 September 1991 discovery of the circiform basilica **66 m by 27 m**. The uncertainty is
the best sentence and must survive editing.

**San Sebastiano above ground.** #10 **Museo dei Sarcofagi**. The epigraphic museum's closure is a
sourced, affirmative statement by the operator and belongs in this record's prose, not as a second
place.

**Fosse Ardeatine.** #14 **Mausoleo delle Fosse Ardeatine** — the strongest record in the zone and
the one that needs no help: 335 shot on 24 March 1944; the competition sequence (commission 10 June
1944; notice approved 15 January 1945; eleven entries by 10 April 1945, anonymous and identified by
motto; two winners *ex aequo* on 2 September 1946); ground broken 22 November 1947; inaugurated
24 March 1949; the 6-metre Basaldella gate of 1951; Coccia's *Le tre età*; the sacrario at
26.65 × 48.5 × 3.55 m, about 1,300 m², on six supports; 335 sacelli plus one to the Martiri
d'Italia, 328 identified and seven unknown; 70 of the 335 Jewish. **Use "Mario Fiorentino"** — the
article body and difesa.it agree against a single infobox. #15 **Museo dei cimeli**.

**Tre Fontane** (all four subject to §5.6). #18 **SS. Vincenzo e Anastasio**, #19 **Santa Maria
Scala Coeli**, #20 **San Paolo alle Tre Fontane**, #21 **Negozio monastico** — every hour set
verbatim from the abbey's own site, which is exactly what an official site is allowed to establish.
Note for the writer: the abbey's own site calls #20 "**San Paolo al Martirio**"; give both names.

**The Appia.** #31 **Complesso di Capo di Bove**, `status: closed` — this is the textbook case for
an affirmative closure, and the prose must carry both the reason and the date of 22 June 2026, plus
the honest statement that no reopening date has been announced. The combined ticket may be described
as covering the Mausoleo di Cecilia Metella **without implying the mausoleum is in this quartiere**.
#33 **Sepolcro di Priscilla** (subject to §5.4) — Statius *Silvae* V, the 13 niches, the *torre
Petro* from the 11th century, the Ferrara slab of 1773 arriving 1779, the cheese-ageing chamber, and
"È visitabile solo in occasioni particolari" as the access line. #34 **The tombs of the IV mile as
one record** — I endorse the finder's editorial call without reservation. Twelve near-identical
tombs inside 400 m cannot carry twelve honest records; name the individually identifiable ones
inside one. #36 **Villa di Tor Carbone** — carried by a real bibliographic citation (De Franceschini,
*Ville dell'Agro romano*, L'Erma di Bretschneider, 2005, ch. 78, pp. 217–219), which is more than
most of the tail has.

**Tor Marancia.** #39 **Museo Condominiale di Tor Marancia** — 22 murals on 11 blocks, estate of
1947, conceived 2013, executed 2014–2015 by 999Contemporary, funding 55/25/20, 70 working days,
765 litres of paint, 974 spray cans, opened 9 March 2015, Venice Architecture Biennale 2016, ICOM
institution no. M124582. All counts and dates, no superlative needed. **Photos rejected.**

**Forts.** #47 **Forte Ardeatino** — 1879–1882, 11.2 ha, decommissioned 1961, to the Comune 1982,
and the sentence that matters: **in May 2006 the park outside the fort opened to the public and the
interior remains inaccessible.** `Parco di Forte Ardeatino` is the better `park` record and may be
folded in or split at the writer's discretion. Municipio Roma VIII publishes **for this fort**,
sourced per-place, and must not be generalised to the quartiere.

**Churches.** #49 **Chiesa dell'Annunziatella** (Honorius III inscription of 12 August 1220;
Filippo Neri's temporary addition to the Seven Churches, making nine; Cardinal Francesco Barberini's
reduction in 1640; the apse fresco), #50 **SS. Annunziata a Via Ardeatina** (1987, Breccia
Fratadocchi), #51 **Santa Francesca Romana** (1936, Zander; parish 23 May 1959), #52 **San Vigilio**
(1990, Passarelli; parish 22 May 1968), #53 **SS. Martiri dell'Uganda** (1971; parish 4 September
1970), #54 **Gesù Buon Pastore** (1950–57), #55 **Nostra Signora di Lourdes a Tor Marancia** (1957),
#56 **San Josemaría Escrivá** (1996). Each carries a date, an architect or a decree of erection —
"a date or sequence" is expressly welcome, and none of these needs an adjective. They are tail, and
§7 says so plainly.

---

## 3. REWRITE — 20 records, with the exact replacement wording

**The author uses the wording below verbatim.** These are not suggestions.

**3.1 #1 Catacombe di San Callisto — strike the annual closure.** The operator's page still
advertises 15 January – 12 February 2025 and Easter 2025. Publishing a 2025 date in 2026 is
publishing a falsehood.
> *"The catacombs are closed every Wednesday, on 1 January and on 25 December, and for an annual
> winter closure. The dates published for that closure have not been updated, so none are given
> here."*

**3.2 #2 Catacombe di San Sebastiano — two changes.** First, the finder's own framing, "the site
that gave every other Roman cemetery its name", is a priority claim in superlative clothing. The
etymology is the fact; the ranking is not.
> *"The place was known in antiquity as* in catacumbas*, from the Greek* katà kymbe*, 'by the
> hollows' — a dip in the ground beside the Appia is still visible, and the area was worked for
> pozzolana before it was a cemetery. The word 'catacomb' descends from this toponym."*

Second, **add the annual closure the finder missed**, which is current and therefore publishes:
> *"Closed on Mondays, on 25 December, 1 January and Easter Day, and from 7 to 27 December 2026."*

The rest — three levels of galleries, the first of four original levels almost entirely destroyed,
the *piazzola* and its three mausolea, the *triclia* with more than 600 graffiti invoking Peter and
Paul, the *Depositio martyrum* and the *Martirologio Geronimiano* under the consuls Tuscus and
Bassus in 258 — is structural, dated and publishes as written.

**3.3 #3 Catacombe di Domitilla — three changes.** Drop "il più vasto cimitero sotterraneo cristiano
di Roma" and domitilla.info's "best preserved and one of the most extensive". Drop the 2025 annual
closure exactly as in §3.1. Use **`www.catacombedomitilla.it`** as the canonical URL, on PCAS's
authority; `domitilla.info` may be cited for the address block only, never for hours — its landing
page is still announcing a reopening of 15 July 2020. The substance survives untouched: the
*praedium Domitillae*, Nereus and Achilleus, the Siricius-era basilica (384–399) with narthex and
three aisles on reused capitals, the *ipogeo dei Flavi*, the cubicolo di Veneranda, the arcosolium
of the Apostoli Piccoli, the cubicolo of the fossor Diogenes, and the coexistence of Christian and
pagan burial.

**3.4–3.6 #4 Museo di Domitilla e Regione dei Fornai, #5 Museo della Torretta e Cripte di Lucina,
#6 Catacomba di Vigna Chiaraviglio — the status field is wrong.** The finder is right that "open"
misdescribes these. It is also true that "closed" is an affirmative claim these sources do not
support. Use `status: open` with prose that carries the actual arrangement, which is sourced:
> *"This catacomb is not on the public visiting list. The Pontificia Commissione di Archeologia
> Sacra opens it on written request to protocollo@arcsacra.va, for groups of no more than fifteen,
> at €250, accompanied by a* fossore *for custody and an archaeologist."*

**3.7 #9 Basilica di San Sebastiano fuori le mura — one clause out, and it is the finder's own.**
"Today the first Franciscan parish in Rome" is a priority claim. I confirmed the parish site does
assert it — "San Sebastiano fuori le mura è la prima a Roma" — which makes it precisely the
operator-sourced ranking the rules exclude. An official site establishes identity, location and
hours; it does not establish a ranking.
> *"The basilica is a Franciscan parish."*

Everything else stands and is confirmed: Scipione Borghese's commission of 1608, Flaminio Ponzio's
design continued by Giovanni Vasanzio with Guido Reni as artistic director, the façade dated 1612,
Annibale Durante's carved ceiling of 1612, the 1933 rebuilding of the aisles on the 4th-century
ambulatory, the relics removed to St Peter's in 826, Nicholas I's rebuilding, the parish erected
18 April 1714 by bull of Clement XI, the cardinalatial title created by John XXIII in 1960,
membership of the seven-church pilgrimage, the Damasus *carmen* to Eutychius in Filocalian letters,
Giorgetti's recumbent statue, the Cappella Albani of 1706, and the Cappella delle Reliquie of 1625
holding **the "Quo Vadis?" footprint stone**. Hours verbatim from the parish: October–March
08:15–18:00, April–September 08:15–19:00.

**The footprint stone is the best line in the zone and the finder found it.** The legend belongs to
a church in Appio-Latino; the object is here, and both sides say so. Lead with it.

**3.8 #11 Salvator Mundi — not a place. Prose inside #9.** And it must be written as a scholarly
identification, not a fact:
> *"A marble bust of the blessing Christ in the convent adjoining the basilica was identified in
> 2001, in research for the Clement XI exhibition, as the* Salvator Mundi *carved by Gian Lorenzo
> Bernini in 1679. The identification was argued by Francesco Petrucci in the* Bollettino d'Arte
> *and rests on the scale and on the Sicilian jasper of the pedestal; versions at the Chrysler
> Museum in Norfolk and at Sées cathedral have also been proposed for the same work."*

Never "Bernini's last work" and never "Bernini's only" — both trip the rule independently of the
attribution dispute.

**3.9 #16 Monumento ai caduti della Montagnola — attribute to what was actually read.** The Roma
Capitale page behind this is unreachable; it.wikipedia is not, and carries the claim. Attribute to
it.wikipedia, keep the 10 September 1943 fighting after the armistice and the piazzale dei Caduti
della Montagnola location, and say nothing about research.

**3.10 #17 Abbazia delle Tre Fontane — two excisions, nothing else.** Strike "**è monumento
nazionale italiano**" (designation claim) and "**l'unica abbazia trappista di Roma**" (superlative).
Neither is on the abbey's own site; both are it.wikipedia's.
> *"The abbey is Trappist — Cistercians of the Strict Observance."*

The whole dated sequence publishes: the synod of Martin I in 649, the Cluniacs c. 1080, Innocent II
and the Cistercians in 1140, the document of 1161 naming all three churches, completion in 1306, the
relics of Vincent of Saragossa in 1370, the commenda of 1408, French suppression in 1808, Pius IX's
restoration for the 1867 jubilee, the bull of 1868, the 450 hectares in emphyteusis and the 125,000
eucalypts, and the suppression of the territorial abbacy on 25 March 1981 by *Abbatia SS. Vincentii
et Anastasii*. The complex is open every day 06:30–20:45.

**3.11 #22 Caffè Tre Fontane — publish thin and say so.** Address is the abbey's own,
Via di Acque Salvie 1; the abbey's menu names it. No hours anywhere reachable.
> *"No source states its opening hours, so none are given here."*

**3.12 #26 Via Appia Antica, the Ardeatino stretch — rewrite the UNESCO paragraph, and add the year
the finder dropped.** Escalated at §5.8 as well.
> *"The Via Appia was inscribed on the UNESCO World Heritage List in 2024 as* Via Appia. Regina
> Viarum*, a serial property of nineteen component parts inscribed under criteria (iii), (iv) and
> (vi). The road was constructed and developed from 312 BCE to the 4th century CE and runs more
> than 800 kilometres."*

**The page must not say that Ardeatino, or anything in it, lies inside the inscribed property**, and
must not name a component part — no source reachable here identifies which component covers this
stretch. The mile framing (II, III and IV miles) is a position in a series and publishes.

**3.13 #27 Parco Regionale dell'Appia Antica — drop "Ardeatino sector" as a place name.** A sector
of a regional park is not a place with an address. Publish the **Ente Regionale Parco dell'Appia
Antica at Via Appia Antica 42, 00179 Roma**, which is a real, addressed institution inside the
quartiere, and say the park extends beyond it. Escalated at §5.8.

**3.14 #28 Ex Cartiera Latina — three superlatives out, and one date corrected.** Strike "uno dei
più grandi stabilimenti di produzione di carta del Centro Sud", "tra i pochi impianti industriali
sopravvissuti nella città di Roma" and "una struttura unica nel suo genere". **And the page says
"La fabbrica chiuse nel 1986" — it does not say June.**
> *"The factory closed in 1986."*

The rest is a chain of dates and functions and is the best industrial-history record in the wave:
the *valca* of 1081, Capuchin use from the 1600s, vallonea in December 1804, myrtle in 1823,
ceramic pigments in 1875, the 1919 conversion with a steam boiler and three electric motors totalling
67 amperes, the *Cartiera Appia* company of September 1923 becoming *Cartiera Latina* in January
1931, cotton-rag publishing paper in the 1930s, the switch to recycled stock in the late 1940s once
the Almone was polluted, and the 1998 concession to the regional park. Machinery halls: *Sala
macchine*, *Sala della macchina continua*, *Sala Nagasawa*, *Sala Appia*. Green area and car park
08:30–17:00 winter, 08:30–19:00 summer. The Almone runs the length of the site.

**3.15 #29 Hortus Urbis — publish with the park's own words, not the finder's gloss.**
> *"Hortus Urbis is a teaching garden at the Cartiera Latina, described by the park authority as an
> educational area, also for schools, dedicated to the traditions of the Campagna Romana."*

**3.16 #32 Archivio e Biblioteca di Antonio Cederna — the park's own description is a superlative.**
"Il padre del movimento ambientalista in Italia" is a priority claim and the finder passed it
through unflagged. It is banned attributed or not.
> *"The archive and library of Antonio Cederna, a campaigner for the protection of the Via Appia
> Antica, are housed in the main building at Capo di Bove. The complex has been closed to the public
> since 22 June 2026."*

**3.17 #38 Tenuta di Tor Marancia — one excision.** Strike "in uno dei quartieri più popolosi di
Roma". Everything else confirmed verbatim: 200 hectares, Middle Palaeolithic traces
(70,000–35,000 BC), the Villa dei Numisii of Numisia Procula identified from a stamped lead pipe,
the Amaranthus etymology, the Torre Marancia gone by the 1660 Catasto Alessandrino, the 2002
resolutions creating the park, the three entrances, and "**Il sito è di libero accesso**".

**3.18 #40–#44 The casali — one record, not five.** Publish a single record, *the casali of the
Ardeatino countryside*, naming Casale de Merode on via delle Sette Chiese, Casale della Vignacce
(17th c., vicolo di Tor Carbone), Casale di Vigna Viola (18th c., via Ardeatina), Casale Torlonia
(17th c., III mile of via Appia Antica) and Casale Caribelli (18th c., viale Pico della Mirandola).
**Do not publish a century for Casale de Merode** — it.wikipedia's "VII secolo" is almost certainly
a slip for XVII and one source is not enough to print either. Five stubs with a coordinate each are
not five places.

**3.19 #48 Forte Appia Antica — strike the vincolo sentence.** "Il forte è vincolato ai sensi del
Codice dei Beni Culturali con D.M. 06/08/2008" is banned in Italian, in English and in paraphrase.
Publish: one of the fifteen forts of Rome built between 1877 and 1891; this one begun 1877, finished
1880, over 16.5 hectares, at the fourth kilometre of via Appia Antica; the Corpo Aeronautico's
Artillery Directorate until the 1910s; the Aeronautica Militare data-processing centre in the
1980s–90s, still partly a store. **No public access is stated, so the page says so.**

**3.20 #58 Baby Luna Park — three excisions, and two of them the finder never saw.** First, the
finder's own line, "the one genuinely family-shaped attraction in the quartiere", uses the brief's
banned construction verbatim. Second and third, from the operator's site, which the finder did not
fetch: "**L'unico parco all'aperto ma tutto coperto**" is a superlative, and "**inaugurato il
29 giugno 1989**" is a founding year from the operator's own site — a trading-duration claim that
does not publish however precisely it is dated.
> *"Baby Luna Park is a covered amusement park and playground at Via di Grotta Perfetta 555, 00142
> Roma. It is open on Saturdays, Sundays and public holidays, 10:00–20:00."*

---

## 4. DROP — 29 records

**Sourced to OSM alone, with no second source and often no address** — an OSM tag is a coordinate,
not a place record: **#12 Chiesa di San Tarcisio** (the finder itself found no article and no site);
**#13 Istituto Salesiano San Tarcisio** (no street number, no source); **#25 Libreria Paoline**;
**#45 Murale dedicato a Ennio Morricone**; **Museo delle Macchine Agricole** (no address, no site,
no article); **Vickers V.798D Viscount**; **Epigrafe geodetica napoleonica**. The last two are
genuinely interesting and belong in a note for a future wave, not in this seed.

**#23 Birra Tre Fontane as a place.** The abbey's own site — which I re-read for exactly this —
states no taproom, no brewery tour and no public access. The kind `brewery` promises somewhere a
visitor can go. **Ruling on the question the finder escalated to me: "Authentic Trappist Product" is
a certification mark of the International Trappist Association, a private trade body. It is not a
state heritage designation and it is outside the designation ban.** It may be stated inside the
abbey or shop record. The brewery is not a place.

**#24 Frantoio, uliveto, apiario, azienda agricola.** Four menu headings on the abbey's site with no
hours and no separate address. One sentence inside #17.

**#30 Punto Informativo / Noleggio Bici.** The finder asked me to resolve the address between
Via Appia Antica 42 and 60. **I could not**: the bike-hire page returns no address, hours or prices,
and the number 60 rests on an OSM tag alone. A visitor-services record whose defining fact is where
it is cannot ship without one. Fold a sentence into #13/#27 — the park authority runs bike hire —
with no address attached.

**#35 Basilica paleocristiana circiforme.** Not dropped as false — dropped as a duplicate. It is the
same 66 × 27 m structure as #8 and merges into it. Two records for one basilica is the defect the
corpus gate exists to catch.

**#37 Villa romana presso il casale della Vignacce.** A name and a coordinate in a wiki list. No
description, no address, no visitor material.

**#46 Murale *La cascata*.** The finder did not fetch rerumromanarum.com; it cited it.wikipedia
citing it. Every factual claim needs a source actually fetched, and this one has none.

**#57 Cappella della Madonna di Fatima.** A subsidiary chapel attached to a religious institute,
"20th century", nothing more. Thin past the point of honesty.

**Hotels — all four.** Hotel Tre Fontane, Adoro Otium Hotel, Precise House Mantegna Roma, Casa per
ferie Seraphicum. OSM nodes with URLs the finder did not open. Not verified, not published.

**Restaurants — all six.** Trattoria Priscilla, Garden Risto', Giardino di Giulia e Fratelli, Qui
nun se more mai, Hostaria Antica Roma, da Riccardo. Same defect, and the finder says so itself: each
needs its own site fetched for identity, address and hours, and none was. **A founding year from an
operator's site does not publish** — that warning stands for whoever revisits these.

**Gruppo Storico Romano.** I reached the site independently and got the same single token,
"SwiteFrontendNg". The finder called this its least confident find and was right to. An OSM node
is not enough for a ticketed visitor operation.

**Villa Trebazia.** A private events venue.

**Porta Ardeatina and any Aurelian Wall segment.** §5.5 is correct and I adopt it. The wall is the
boundary; Celio, Testaccio and Trastevere already hold segments and San Saba holds
`porta-san-paolo-san-saba-rome` on the same circuit; all four are shipped and cannot be amended.
One gate is not worth putting the same masonry in two files.

**Chiesa del Domine Quo Vadis.** The finder contradicted its own brief here and was right to.
it.wikipedia places it "nel quartiere Appio-Latino" and files it under `Categoria:Chiese di Roma -
Q.IX Appio-Latino`; its coordinates fall in Appio-Latino. **Ardeatino must not take it.** The
compensation is real and already banked at §3.7 — the footprint stone itself is in San Sebastiano.

**Colonna di Pio IX.** DROP, and the reason is internal to the source: the Ardeatino article says
the column stands "sul lato opposto di via Appia Antica" from the basilica, and the same article's
boundary prose makes the road itself the line with Appio-Latino from Porta San Sebastiano to via
Cecilia Metella. The article names the column and simultaneously supplies the rule that excludes it.
Recorded at §5.2 for the arbitrator, but I do not think it is a close call.

---

## 5. STRADDLERS — five escalations covering ten records

I have ruled where the evidence lets me and escalated where it does not. **I have not resolved
anything unilaterally that touches another live zone in this wave.**

**5.1 ESCALATE — Chiesa di San Nicola a Capo di Bove.** The genuine conflict. Its own article says
"nel quartiere Ardeatino" and it is filed under `Categoria:Chiese di Roma - Q.XX Ardeatino`; the
`Ardeatino` article lists it at the III mile. Against that: its coordinates fall in Appio-Latino, as
do Cecilia Metella and the Castrum Caetani, and the **Parco archeologico dell'Appia antica markets
all three as a single site**. I lean to Appio-Latino — the institutional packaging is decisive and
the church physically stands inside the Caetani castle courtyard — but the finder is right that this
needs a general rule, and it has asked the right question: **when an it.wikipedia article's stated
quartiere conflicts with the boundary polygon, which wins?** This wave will hit it again. Note that
the answer must be applied consistently, and applying "the article's stated quartiere wins" would
also drag Cecilia Metella somewhere it plainly does not belong. **1 record.**

**5.2 ESCALATE — Sepolcro di Priscilla (#33).** Fifty metres decide it. The boundary is the road
itself; the tomb sits against it; the addressed OSM node at Via Appia Antica 64 falls in Ardeatino
and a point forty metres away does not. If it comes to us, its own article's locator — "opposite the
church of the Domine quo vadis" — remains publishable, because the far side of a named road is a
factual position and not an impression. **1 record.**

**5.3 ESCALATE — the Tre Fontane block, contested with EUR (#17–#22).** The polygon and the boundary
prose both say Ardeatino: the line with Q. XXXII Europa is via Laurentina and the abbey is east of
it. Against that, the abbey's own article says it gives its name to the *zona urbanistica* Tre
Fontane "in prossimità dell'EUR", and travellers arrive from EUR. **I endorse Ardeatino** — the zona
urbanistica is a different layer from the quartiere and the roster's `out_of_scope_note` warns
against exactly this confusion. **The six records must move together or not at all**, and losing
them is the only outcome that materially dents this zone. **6 records.**

**5.4 ESCALATE — Catacombe di Domitilla, contested with Ostiense (#3 and #4).** Three sources say
Ardeatino: the polygon, the catacomb's own article ("nel moderno quartiere Ardeatino"), and both
PCAS and the operator placing it on the via Ardeatina. Against: the postcode 00147, which is the
Ostiense/Garbatella range on a street that crosses both quartieri. **I endorse Ardeatino**; a
postcode is a postal-delivery artefact and the weakest of the four instruments. **2 records.**

**5.5 ESCALATE — the Via Appia and the regional park as places (#26, #27).** Neither is confined to
this quartiere and both will be claimed by other zones. The road runs through Appio-Latino and
Torricola; the regional park is larger still. Someone must decide whether the road publishes once,
somewhere, or as a per-zone stretch — and if the latter, the UNESCO paragraph will be duplicated
across zones, which is its own problem. The park authority's **headquarters at Via Appia Antica 42
is unambiguously in Ardeatino** and publishes regardless of how the road is handled. **2 records.**

**5.6 Handed on, not claimed.** **Catacomba di Commodilla** (Via delle Sette Chiese 42, 00145) and
**Catacomba di S. Tecla** (via Silvio D'Amico 42, 00145) sit west of the Ardeatino line and belong
to Ostiense. The finder did not test them and neither did I; **Ostiense should be told they exist**,
because they are on PCAS's "aperte su richiesta" list and Ostiense may not know it.

**5.7 An instrument I could not re-run, and the honest note about it.** The finder's point-in-polygon
test rests on Overpass data I did not re-fetch, so I have confirmed its *conclusions* only where a
source names the quartiere in words. **Three of its westernmost results sit closest to the via
Laurentina / via Cristoforo Colombo line and should be re-tested before shipping**: San Vigilio
(12.492576), SS. Martiri dell'Uganda (12.489790) and Casale Caribelli (12.485256). All three are
tail records; none of them moves the tier. I flag them rather than pretend I verified them.

---

## 6. WHAT THE FINDER GOT WRONG

Recorded plainly, because the file is unusually good and the errors are worth separating from it.

1. **The corpus count is stale.** 786 is now 907 across the same 21 files. Every collision search
   was run against a smaller corpus than the one that will gate this seed. I re-ran them and the
   conclusions hold, but the method was unsound and the next wave must re-run rather than transcribe.
2. **It let two banned priority claims through in its own draft prose.** "Today the first Franciscan
   parish in Rome" (#9) — and the parish's own site does assert it, which makes it the exact
   operator-sourced ranking the rules exclude. And "the one genuinely family-shaped attraction in the
   quartiere" (#58), which is the brief's banned construction word for word. A file that catalogues
   ten banned claims in §3 and then commits two of its own has a proofreading problem, not a
   research problem.
3. **It passed through a third superlative unflagged**: the park's description of Cederna as "il
   padre del movimento ambientalista in Italia" (#32).
4. **It did not fetch babylunapark.it**, and so missed both a superlative and a founding year on a
   record it recommended for a fetch.
5. **It over-read the Cartiera Latina page**: "closed in June 1986" where the source says only
   "La fabbrica chiuse nel 1986".
6. **It under-reported two publishable facts on pages it had already opened.** The UNESCO page gives
   the inscription year — **2024** — and the criteria, which is the single most publishable thing on
   it and the finder quoted everything around it. And catacombe.org gives a **current** annual
   closure, 7–27 December 2026, while the finder reported only the stale closures elsewhere and left
   this one as "an annual closure period is stated on the page".
7. **It left the bike-hire address unresolved and recommended the record anyway.** I could not
   resolve it either, which is why the record drops.

**What it got right, and it is most of the file.** The §2 analysis of catacomb legal status is
excellent and I adopt it whole: I re-read the Holy See's own extraterritorial list and no catacomb,
no Appia basilica and nothing on the Ardeatina appears on it. The correct formulation is the third
tier the finder describes — Italian soil, the Holy See retaining *disponibilità* with the burden of
custody under art. 33 of the 1929 Concordat and art. 12 of the 1984 Accordo, PCAS governing, APSA
owning the callistian complex, Salesians running visits since 1930 — and the prose must not slide
into "Vatican territory" or into art. 15 extraterritoriality. The finder also contradicted its own
brief on the Domine Quo Vadis and was right; found the footprint stone, which is the best fact in
the zone; caught two stale closure years that would have shipped as lies; and correctly refused a
Municipio for the quartiere, which the roster independently confirms by carrying no `municipio`
field for Ardeatino at all.

---

## 7. TIER RULING

**GUIDE. Surviving count 42.**

23 PUBLISH plus 20 REWRITE is 43, less #11 (Salvator Mundi), which folds into #9 as prose rather
than standing as a place. **42 discrete place records.**

I have tested it the way wave 2 said a tier ruling should be tested: **strike everything contested
and it does not move.** Give EUR the whole Tre Fontane block, give Ostiense Domitilla and its
museum, give Appio-Latino the Sepolcro di Priscilla, and rule the Via Appia and the regional park
out as multi-zone — the worst realistic arbitration outcome — and Ardeatino still stands at **31**.
The four-place floor is not in play by a factor of nearly eight, and no part of the tier rests on
anything I escalated.

Nor does it rest on the tail. Remove all eight modern parish churches, the combined casali record,
Hortus Urbis and the Caffè, and the zone is still at **31**. What carries it is a short list of
things a visitor crosses a city for: three of the seven publicly open Roman catacombs with published
hours and prices, a Constantinian basilica of the seven-church pilgrimage holding the Quo Vadis
stone, the Fosse Ardeatine memorial with a fully documented competition history and a
state-published description, a Trappist abbey of three churches with hours from its own porter's
lodge, the state park's Capo di Bove complex, the regional park's headquarters and industrial museum
in a paper mill with a documented chain of use back to 1081, a 200-hectare estate of open
countryside, a 22-mural ICOM-registered museum, two forts of 1877–1882 and a sequence of IV-mile
tombs.

**I looked for the town-page answer and it is not here, and the finder's own §6 says so first.**
The reason is not the material, which would carry it. It is the locators. A quartiere of this size
makes "in Ardeatino" nearly useless as a position, and a large fraction of these sites sit on
unnumbered stretches of ancient road where the only honest locator is a Roman milestone. That is
survivable for a guide, where "at the IV mile of the via Appia Antica" is a position in a series and
publishes cleanly. It is not survivable for a town page, which needs to describe how the parts sit
against each other — and the moment a writer tries, they will reach for "a short walk from the
catacombs" and the gate will catch them. **GUIDE is the right shape and the honest one.**

---

## 8. STANDING INSTRUCTIONS TO THE WRITER

- **`"photos": []` on every record.** No exceptions in this wave. The finder's §8 photo-rejection
  list is correct and should be carried forward intact to the photo wave — the Fosse Ardeatine
  complex in its entirety, all 22 Tor Marancia murals, San Vigilio, SS. Annunziata a Via Ardeatina
  and Santa Francesca Romana are all in copyright, and Italy has no freedom of panorama. Catacomb
  interiors are governed by the PCAS *Regolamento*, which nobody has read yet; do not source them
  until somebody has.
- **No Municipio on the zone page.** Ardeatino straddles Municipio I and Municipio VIII, the roster
  carries no municipio for it, and the brief forbids inferring one. Municipio Roma VIII publishes on
  three *individual* records only — Forte Appia Antica, Forte Ardeatino and the Tor Marancia mural
  museum — because a source states it for each of those.
- **Nothing here is extraterritorial and nothing here is in the Vatican.** See §6.
- **No designation claims**, in English or Italian. The two live traps are the Forte Appia Antica
  D.M. and the Capo di Bove *vincolo* clause, and both sit inside pages the writer will otherwise
  quote heavily.
- **Where a source failed, the page says what is not known** — never that anyone failed to reach it.
  This applies to the Caffè Tre Fontane's hours, the bike-hire address, and both stale annual
  closures.
