# Esquilino (R. XV, code 115) — verifier's verdicts

Adjudicates `docs/rome/esquilino-finder.md`. Every numbered candidate is ruled PUBLISH, REWRITE or
DROP. Nothing here is a shipping instruction for another zone; ownership disputes go to the
arbitrator, listed in §5.

---

## 0. Collision re-check, run mechanically

`python3 .superpowers/taken_slugs.py` now reports **907 places across 21 shipped files**, not the
786 the finder recorded. The corpus grew between the finder's pass and this one, and the finder's
collision table is therefore stale in one place that matters:

| finder said | actually shipped now |
|---|---|
| `laterano` → 3 hits | **6** — adds `monti/battistero-lateranense-rome`, `monti/obelisco-lateranense-rome`, `monti/museo-del-tesoro-lateranense-rome` |

Monti's file also carries `monti/museo-storico-vaticano-rome`, i.e. Monti already publishes a
Lateran-complex extraterritorial property. The Lateran cluster is comprehensively Monti's.

A second sweep over 60 name fragments (`liberazione`, `tasso`, `crocifisso`, `alacoque`, `rutelli`,
`enpam`, `gallien`, `viperesch`, `statilia`, `fanteria`, `zecca`, `altieri`, `wolkonsky`,
`jovinelli`, `freddo`, `cinquecento`, `manfredo`, `dante`, `eusebio`, `bibiana`, `buon aiuto`,
`sessorian`, `minerva medica`, `alchemic`, `scala santa`, `immacolata all`, `sant'elena`, `curri` …)
returns **zero collisions** against any surviving Esquilino candidate. The Scala Santa is unclaimed.
Piazza dei Cinquecento, Termini, Piazza Vittorio and the Arco di Sisto V are unclaimed.

---

## 1. Sources re-fetched

Fourteen sources were re-fetched from scratch, including the five the finder leaned on hardest.

| source | result |
|---|---|
| `vatican.va` extraterritoriality list | **CONFIRMS.** Item 1 reads verbatim «il complesso di S. Giovanni in Laterano (Basilica, Palazzo Apostolico Lateranense con gli edifici annessi **e la Scala Santa**)». Page stamped «Aggiornamento: 03.04.2001». |
| `santacroceroma.it` (home + `/it/orari/`) | **CONFIRMS the placement, CONTRADICTS the closure.** See §3 item 27 — the site's two pages disagree with each other. |
| `museostrumentimusicali.cultura.gov.it` | **CONFIRMS** every hour, price and phone number, to the digit, including «Agevolato € 2,00 (dai 18 ai 25 anni) solo per studenti EU». |
| `palazzomerulana.it` | **CONFIRMS** the hours verbatim, plus «1800 mq, 4 piani espositivi», «90 opere», «Via Merulana, 121 Roma». |
| `gelateriafassi.com` | **CONFIRMS** the address and the two banned superlatives. |
| `scala-santa.com` | **CONFIRMS** «Chiamati nel 1854 da Pio IX», «ventotto gradini», pilgrims on their knees. `/contatti/` **404s** — the house number is unsourced. |
| `ambrajovinelli.org` | **CONTRADICTS the finder's address.** See item 49. |
| `museoninfeo.it` | **CONTRADICTS the finder's address.** See item 4. |
| `sovraintendenzaroma.it` ×4 | **CONFIRMS and improves.** Mecenate and Statilia carry exact access terms the finder did not report. Castrense carries **no** visiting terms. |
| `sanvito-roma.it` | **CONFIRMS** the 1483 Antoniazzo attribution and the reorientation history. |
| `seusebio.weebly.com` | **CONFIRMS** guided visits and the underground archaeological area; gives a proper address. |
| `santissimaconcezione.org` | **DOES NOT SUPPORT** the finder's Viperesche claim; but see item 16 — a different source rescues it. |
| `gov.uk/world/organisations/british-embassy-rome` | **DOES NOT SAY WHAT THE FINDER CLAIMED.** See item 48. |
| `moiroma.it` | **DOES NOT SAY WHAT THE FINDER CLAIMED.** See item 22. |
| 48 it.wikipedia articles via `action=query&rvprop=content` | raw wikitext, checked claim by claim below |

### Sources named as not supporting what was claimed

1. **`gov.uk` British Embassy Rome** — cited by the finder as "the mission's own page" for Villa
   Wolkonsky. The page **does not mention Villa Wolkonsky anywhere**, and the only address it gives
   is a 00187 postcode, which is not the villa. It must not be cited on that record.
2. **`moiroma.it`** — cited for "over 70 installations" and for the address. The homepage carries
   **no address, no hours, and no installation count**; its only number is «oltre 60 Dilemma games»,
   which are shop products.
3. **`santissimaconcezione.org`** — cited as the occupant site for the "Monastero delle Viperesche".
   It never uses that name and says nothing about 1668; it is the site of a women's university
   college at Via di S. Vito 10.
4. **it.wikipedia `Stazione di Roma Termini`** — the finder quoted «la quinta in Europa» from it.
   **That phrase is not in the article.** (Harmless, since the finder quarantined it, but it was
   invented.)
5. **it.wikipedia `Oratorio del Santissimo Sacramento al Laterano`** — the finder placed it in
   Esquilino. Its own lead says **«nel rione Monti»** and it is filed under
   `Categoria:Chiese di Roma (rione Monti)`.

---

## 2. What the finder got wrong

- **The Oratorio del Santissimo Sacramento al Laterano is Monti's**, by its own article and its own
  category, and it dates from 1735–1765, not from Sixtus V's campaign. The finder's 22-metre
  ray-cast was allowed to overrule a source that names the rione outright. DROPPED.
- **Two "no body text was retrieved" verdicts are simply false.** The
  `Oratorio di Santa Maria Immacolata della Concezione` article is 3,616 characters and dates the
  building to 1656; `Cappella di Santa Maria Addolorata all'Esquilino` is 2,974 characters and
  dates it to 1928 with a named convent, a portal inscription and a tomb. Both were recommended
  against shipping on a research failure.
- **The Viperesche were droppable only because the finder looked in the wrong article.** The
  Oratorio article quotes Armellini (1891) for the 1668 foundation by Livia Vipereschi — the
  second, non-OSM source the finder said was missing.
- **The Santa Croce relics-chapel closure is not a clean fact.** The site's homepage notice
  (16.04.2026) and the site's own ORARI page contradict each other. The finder read one and not the
  other, and proposed a `status` on that basis.
- **The Anfiteatro Castrense and the Orto monastico are not freely visitable.** The basilica's own
  site states «Il giardino dell'Anfiteatro Castrense è in concessione alla parrocchia … non è
  consentito l'accesso libero ai visitatori». The finder wrote the amphitheatre as marked visitable
  and the orto as a `park`.
- **Two addresses are wrong against the operators' own sites** (Museo Ninfeo, Ambra Jovinelli), and
  one is unsourced (Sant'Alfonso "26"; Scala Santa "14").
- **Sant'Antonio Abate's annexe became the Pontificio Collegio Russicum**, not the Pontificio
  Istituto Orientale.
- **it.wikipedia's Termini article contradicts itself on the rione** — body text says
  «nel rione Castro Pretorio», its category says `Roma R. XV Esquilino`. The finder presented Termini
  as unproblematic. The wave-3 ruling still governs, but the page must not cite that article for
  the rione.
- **Four shippable places were missed entirely.** See §6.
- Minor: the finder's "arco delle pere" etymology for the Arco di Sisto V is not what the article
  says; the "1913 first re-organisation" and "two halls" for the market rest on an aggregator and an
  image caption respectively; the "one of the larger air-raid shelters" line at Piazza Dante is a
  superlative («uno dei maggiori») that the finder carried without flagging it.

The finder's compliance work is otherwise good: it caught six superlatives at source, correctly
refused the Fassi founding year, correctly refused the vatican.va UNESCO sentence, and correctly
overturned two of the three rulings in its own brief (§5.1). I uphold all of that.

---

## 3. Per-candidate verdicts

### 3.1 Piazza Vittorio cluster

**1. Piazza Vittorio Emanuele II — PUBLISH.** All facts confirmed against
`it:Piazza Vittorio Emanuele II (Roma)`: 1873 master plan, built from 1880, garden opened to the
public Sunday 10 July 1889, 325 × 185 m, 60,000 m² including the porticoes, garden dedicated to
Nicola Calipari, reopened 31 October 2020 after twenty months, ENPAM building rebuilt and
re-inaugurated 2012.
*Two things must not be carried, not one.* The finder caught «la piazza più vasta della Capitale».
It missed the clause immediately before it, «Con quasi 10.000 metri quadrati in più di piazza San
Pietro», which is the same ranking claim in comparative dress. The rione article's «unica nel suo
genere a Roma» is a third. All three out.

**2. Ninfeo di Alessandro (Trofei di Mario) — PUBLISH.** Infobox confirms every measurement the
finder gave, including the one my first grep missed: `Volume = 4000 m³`, `Larghezza = 25 m`,
`Altezza = in origine 20 m circa`, `Utilizzo = ninfeo, castellum aquae`, trapezoidal plan,
`Visitabile = Su richiesta (tel. 060608)`. Trophies moved 1590 by Sixtus V to the Cordonata,
confirmed. Do not carry «occupa la parte più alta dell'Esquilino».

**3. Porta Alchemica / Porta Magica — PUBLISH.** 1655–1681, Massimiliano Savelli Palombara marchese
di Pietraforte (1614–1685), villa Palombara, the surviving one of five gates, 1680 inscription on
the lost gate opposite, flanked by two statues of Bes. All confirmed.

**4. Museo Ninfeo — REWRITE (address).** The museum's own site footer reads
**«Piazza Vittorio Emanuele II, 78 00185 Roma»**, and the rione article independently says
«Piazza Vittorio Emanuele 78». The finder's "79/a" is unsourced.
Replacement wording: *"Museo Ninfeo, Piazza Vittorio Emanuele II 78. The museum covers an excavated
sector of the Horti Lamiani, a luxurious private residence its own site dates between the 1st
century BC and the 6th century AD, found during the rebuilding of the ENPAM palazzo. It opened to
the public on 6 November 2021 under an agreement between the Fondazione ENPAM and the
Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma."*
Do not carry the site's «uno dei più grandi scavi archeologici della Soprintendenza di Roma», nor
the rione article's «il prestigioso Museo Ninfeo».

**5. Nuovo Mercato Esquilino — REWRITE (locator and two unsourced clauses).** The aggregator page
gives a far better locator than the finder used: the market occupies the ex Caserma Sani with
**four entrances, on via Principe Amedeo, via Mamiani, via Turati and via Lamarmora**, and the
page's own address block reads «via Principe Amedeo 184». The 1913 first re-organisation and the
October 2001 clearance are confirmed on that page and in the Piazza Vittorio article.
Two clauses do not survive: "moved here" (no source says the cleared stalls relocated into the
halls), and "two halls, one for food and one for clothing", which rests on a Wikipedia **image
caption** only — attribute it or drop it. «Era uno dei mercati più suggestivi della città» and
«non lontano dalla stazione Termini» are both out, the first as a superlative and the second as
orientation by impression.

**6. Chiesa di Sant'Eusebio all'Esquilino — REWRITE (address, and one word).** The parish's own site
gives **Piazza Vittorio Emanuele II 12/A, 00185 Roma, tel. 06-44 66 170**, and carries a bookable
guided-visit programme with two itineraries and an underground archaeological area — all better
than the finder's "corner of" locator. it.wikipedia confirms `AnnoConsacr 1238`, consecration by
Gregory IX after a rebuild *a fundamentis*, and «Chiesa titolare e parrocchia, ma non basilica
minore». **Drop "Monastic"** — the Celestines abandoned it in the early 14th century; the article
supports titular and parish, not monastic. Superlative «uno dei monumenti cristiani più insigni del
Rione» confirmed present and stays out.

### 3.2 Termini and Piazza dei Cinquecento

**7. Stazione di Roma Termini — REWRITE (provenance of the rione, not the facts).** Opened 1863,
rebuilt 1873, rebuilt 1950; Montuori and Vitellozzi (1950); only the technical buildings of
Mazzoni's 1930s scheme were carried out — all confirmed.
**The problem the finder did not report:** the article's body text says the station is
«situata sul colle dell'Esquilino **nel rione Castro Pretorio**», while its own category is
`Roma R. XV Esquilino`. it.wikipedia contradicts itself. Wave 3's ten-point ruling governs and
Termini is Esquilino's, but the page **must not cite that article for the rione**.
«la maggiore stazione ferroviaria d'Italia» is banned. «la quinta in Europa» is not in the article
at all. About 150 million visitors a year and 850 trains a day are counts and publish with
Grandi Stazioni attributed, as the finder said.

**8. Piazza dei Cinquecento — REWRITE, and STRADDLER (escalated).** Confirmed: `superficie = 45000
m²` (infobox, cited to artribune), named for «gli oltre 500 caduti italiani della battaglia di
Dogali», bounded by via Giovanni Giolitti, largo di Villa Peretti and via Marsala.
**Drop "the city's main bus terminus"** — «il principale capolinea … della città» is a priority
claim. Replace with the count the same article gives: *"The bus terminus around the square is used
by 25 daytime lines, including trolleybus line 90, and 13 night lines; the tram 5 and 14 terminus
lies between via Cavour and via Daniele Manin."*
**Currency the finder missed:** the main part of the rebuilt square reopened on 14 January 2025 and
the works are programmed to complete in summer 2026. A record written without that will read wrong.

**9. Monumento a Giovanni Paolo II — PUBLISH.** Bronze by Oliviero Rainaldi. Carry only what the
dedicated article states. Photo reject upheld: Rainaldi is living and Italy has no freedom of
panorama.

### 3.3 Piazza Manfredo Fanti

**10. Acquario Romano — Casa dell'Architettura — PUBLISH.** Ettore Bernich, 1885–1887; land granted
in 1882 to the ichthyologist Pietro Garganico for a fish-breeding station and aquarium; restored
1985–2002; seat of the Casa dell'Architettura of the Ordine degli Architetti di Roma since 2002.
All confirmed. `casadellarchitettura.eu` carries no address and no hours on any page that resolves;
the record states none.

**11. Piazza Manfredo Fanti — PUBLISH.** My first grep missed it, so on the record: the article
**does** carry the agger — «Sono anche presenti i resti dell'Agger Tarquinii, un tratto delle Mura
Serviane», plus an image captioned «Resti dell'agger delle mura serviane». The finder is right.
Add the frame the article gives: via Principe Amedeo / via Carlo Cattaneo / via Filippo Turati.
Colloquially «Piazza dell'Acquario», confirmed.

### 3.4 The Servian Wall stub and the Arco di Gallieno

**12. Porta Esquilina / Arco di Gallieno — PUBLISH.** Servian Walls, earliest circuit, rebuilt
*saxo quadrato* in 378 BC, now abutted by Santi Vito e Modesto. Confirmed.

**13. Chiesa dei Santi Vito e Modesto — REWRITE (attribution of the fresco).** Confirmed:
first named as a *diaconia* in the life of Leo III between the 8th and 9th centuries; rebuilt by
Sixtus IV, `FineCostr 1477`; Camporese il Giovane; Alfredo Ricci's reorientation onto via Carlo
Alberto, undone in the 1970s restoration; parish of Santa Maria Maggiore in San Vito erected by
Leo XII on 1 November 1824 by *Super universam*; the church stands on the Macellum Liviae.
The parish's own site gives the address **Via Carlo Alberto 47** and captions the fresco
«Affresco **attribuito** ad Antoniazzo Romano (1483): la Madonna fra Crescenzia e Modesto», while
it.wikipedia attributes the same fresco jointly to **Melozzo da Forlì and Antoniazzo Romano**.
Replacement wording: *"Over the altar of Saints Crescentia and Modestus is a fresco of the Madonna
between them, dated 1483; the parish attributes it to Antoniazzo Romano, and Italian Wikipedia
attributes it to Melozzo da Forlì and Antoniazzo Romano."*
Fold record 15 in here.

**14. Chiesa di Sant'Antonio Abate all'Esquilino — REWRITE (one factual error).** Confirmed: built
1308 in place of Sant'Andrea Catabarbara; `InizioCostr 1481` under Sixtus IV; Russian Greek-Catholic
church of the Byzantine rite; iconostasis by Gregorio Maltzeff; a hospital for St Anthony's fire
beside it from the second half of the 13th century.
**Wrong:** the annexed buildings did not become the Pontificio Istituto Orientale. The article says
that in **1928 the Holy See bought the church and its adjacencies**, the church went to Russian
Catholics of the Byzantine rite, and the annexed buildings were turned into the
**Pontificio Collegio Russicum**, a centre of Russian and oriental studies. Use that.
No status claim of any kind may be attached to the 1928 Holy See purchase. Fold record 53 in here.

**15. Macellum Liviae — FOLD into 13, do not ship as its own record.** It has its own it.wikipedia
article (a commercial complex built on the Esquiline by Augustus and dedicated to Livia), but it is
a topographic entity with nothing standing; the finder's own instinct was right.

**16 + 17. Monastero delle Viperesche and the Oratorio di Santa Maria Immacolata della Concezione —
MERGE, then REWRITE and PUBLISH as one record.** The finder recommended against shipping both. That
was a research failure, not a sourcing problem. `it:Oratorio di Santa Maria Immacolata della
Concezione` places the oratory in via di San Vito, rione Esquilino, `FineCostr 1656`, and quotes
Armellini (1891): the oratory is annexed to the *monastero delle Viperesche*, a house founded by
**Livia Vipereschi in 1668** by the arch of San Vito to take in poor girls, with an annual income of
300 scudi; the lay teachers later took the habit and rule of the Carmelite Oblates under the title
of the Immaculate Conception; the oratory was restored by Pius VII and has three altars, the high
altar carrying an image of the Conception. In 1869 the institution became the "Convitto Vipereschi
della Santissima Concezione"; the 1930 works restored the fronts on via di San Vito and via
Sant'Antonio all'Esquilino. `santissimaconcezione.org` confirms the present use and the address,
**Via di S. Vito 10, 00185 Roma**. That is a second, non-OSM source and a shippable record.

### 3.5 The via Merulana axis (east side)

**18. Chiesa di Sant'Alfonso all'Esquilino — REWRITE (drop the house number).** Confirmed: George
Wigley, 1855–1859, rectory church, Redemptorists, brick and travertine façade with a three-door
portico, polychrome mosaic of the Virgin of Perpetual Succour in the tympanum, Carrara marble
statue of the Redeemer on the cusp, rose window. The article says only **«situato in via
Merulana»** — no number. The parish domain does not resolve. **Write "via Merulana" and stop;**
"26" is unsourced. No hours.

**19. Auditorium di Mecenate — REWRITE (upgrade the access line).** Confirmed against both sources:
a nymphaeum despite the name, 24.10 × 10.60 m, apse at one short end, six niches a side plus five in
the apse above seven curved steps faced in cipollino, part of the Horti Maecenatis, excavated 1874
by Rodolfo Lanciani, Sovrintendenza Capitolina.
The Sovrintendenza's own page is better than "visitabile su prenotazione" and should be used
verbatim: *"The monument stands inside the public garden at Largo Leopardi, off via Merulana. Entry
is allowed to accompanied groups only, a maximum of thirty people per visit, and booking is
obligatory on 060608 between 09:00 and 19:00; individual visits are also possible on a published
calendar, again by booking on the same number."*

**20. Palazzo Merulana — PUBLISH.** The operator's site confirms, verbatim: Via Merulana 121;
1800 mq over 4 exhibition floors; 90 works of the Scuola Romana and the Italian twentieth century;
Wednesday–Friday hourly entry slots 12:00–20:00, last entry 19:00; Saturday and Sunday 10:00–20:00,
last entry 19:00; sculpture hall, CafeCulture and BookCulture Wednesday–Sunday 09:00–20:00 with
free access. Boundary flag at 16 m stands; see §5(i).

**21. Basilica di Sant'Antonio da Padova all'Esquilino — PUBLISH, consecration date omitted.**
Confirmed: Luca Carimini, 1884–1888, for Bernardino da Portogruaro and the Friars Minor after the
expropriation of the Ara Coeli convent; raised to minor basilica by Pius XI in July 1931. The
friary's own site gives via Merulana 124, metro A Manzoni, metro B Colosseo, tram 3
Manzoni/Merulana. The finder's discrepancy is real and confirmed: infobox `AnnoConsacr = 18 dicembre
1888`, body text Cardinal Parocchi on 4 December 1887. **Publish neither date.**

**22. Museo delle Illusioni Roma — DROP.** Its own site, re-fetched, carries **no address, no hours
and no installation count**; its only number, «oltre 60 Dilemma games», is a shop figure. Every fact
the finder gave rests on an OSM node. It is a franchise outlet of the same class as the Venchi
outlet the finder rejected, and it sits 14 m from the Monti line. No.

### 3.6 The Lateran edge

**23. Scala Santa — PUBLISH, minus the house number.** Confirmed against `it:Scala Santa`: the
complex Sixtus V raised at the end of the 16th century as the new patriarchate, built by Domenico
Fontana in 1589; twenty-eight white marble steps sheathed in wood, flanked by four further flights;
the chapel of San Lorenzo in Palatio called the *Sancta Sanctorum*, the popes' private chapel until
the early 14th century, holding the Lateran Acheropita; the chapel of San Lorenzo; the oratory of
San Silvestro in Palatio; the chapel of the Crucifix behind the Sancta Sanctorum. The sanctuary's
own site confirms «Chiamati nel 1854 da Pio IX», the twenty-eight steps and the climb on the knees.
Category `Roma R. XV Esquilino`.
**Lateran Treaty status — upheld exactly as the finder framed it.** vatican.va item 1 names the
Scala Santa. The record states Art. 15 immunities, on Italian soil, inside rione Esquilino, and
never "in the Vatican" or "Vatican territory". The same page's sentence putting all extraterritorial
properties on the World Heritage list **does not publish**, per the evidence_ruling.
**Drop "14"** — the sanctuary's `/contatti/` page 404s and no fetched source gives a house number.
Do not carry the article's «La più celebre e visitata scala santa».

**24. Oratorio del Santissimo Sacramento al Laterano — DROP. It is Monti's.** Its own article opens
«è una chiesa di Roma, **nel rione Monti**, in piazza di San Giovanni in Laterano» and is filed
under `Categoria:Chiese di Roma (rione Monti)`; `InizioCostr 1735`, `FineCostr 1765`. Monti already
ships the basilica, the baptistery, the palace, the obelisk, the treasury museum and the Museo
storico vaticano. A 22-metre ray-cast does not outweigh a source that names the rione. Escalated to
the arbitrator with a recommendation of Monti.

**25. Monumento a San Francesco d'Assisi — REWRITE (locator).** Confirmed: Giuseppe Tonnini, 1927,
bronze, saint standing with arms raised and palms turned toward the basilica, on a stepped tufa
base, with five figures below representing the companions who followed him to Rome to seek Innocent
III's recognition of the Rule. Category `Roma R. XV Esquilino`.
The finder wrote "viale Carlo Felice, at the edge of piazza di Porta San Giovanni". The dedicated
article says **«all'inizio di via Carlo Felice»** and places the group **in front of the basilica of
San Giovanni in Laterano**. Replacement wording: *"at the start of via Carlo Felice, facing the
basilica of San Giovanni in Laterano."*

**26. Teatro Basilica — DROP.** Its domain does not resolve, no second source exists, and the only
evidence is an OSM node with `amenity=theatre`. The finder recommended this itself.

### 3.7 Santa Croce in Gerusalemme and the Sessorium

**27. Basilica di Santa Croce in Gerusalemme — REWRITE. The closure claim does not survive.**
The placement is confirmed word for word on the basilica's own site: «si trova a Roma, nel Rione
Esquilino, a ridosso delle Mura Aureliane e dell'Anfiteatro Castrense, tra la Basilica di San
Giovanni in Laterano e Porta Maggiore», and «Santa Croce fa parte del percorso di visita delle Sette
Chiese». it.wikipedia adds the parish erected by Pius X on 13 March 1910 and Cistercians resident
since the 16th century. Not extraterritorial — absent from the vatican.va list, and no page may
imply otherwise. Upheld.
**But the site contradicts itself on the relics chapel.** The homepage carries a notice dated
16.04.2026, «su disposizione del Vicariato di Roma e del Ministero dei Beni Culturali - Area
Funzionale Patrimonio Architettonico», that the Cappella delle Reliquie is closed for urgent works.
The site's own `/it/orari/` page, fetched the same minute, says «L'ingresso alla Basilica **e alla
cappella delle reliquie** è gratuito e non è necessaria alcuna prenotazione» and gives the chapel's
hours as Monday–Saturday 7:30–17:45, Sunday 7:30–18:30. Two pages of one site, flatly opposed.
**A closure is an affirmative claim and this evidence cannot carry one.** Publish what both pages
agree on and nothing more:
*"The basilica's own site gives its opening hours as 7:30 to 19:00, and states that entry to the
basilica is free and needs no booking. During liturgical celebrations tourist visits are not
permitted."* Status: open. Say nothing about the relics chapel.
The finder's compliance note is right and stands: the Ministry's «Area Funzionale Patrimonio
Architettonico» is a works order, never to be written as a designation.

**28. Orto monastico di Santa Croce — REWRITE. It is not a park and it is not open.** The 2004
recreation to Paolo Pejrone's design, on the initiative of the Associazione Amici di Santa Croce in
Gerusalemme, and the elliptical space divided by two perpendicular pergola paths meeting at a
central fountain, are all confirmed on the basilica's site.
What the finder did not read: **«Il giardino dell'Anfiteatro Castrense è in concessione alla
parrocchia e viene utilizzato per attività prettamente pastorali: non è consentito l'accesso libero
ai visitatori.»** A `park` record with `status: open` would be wrong on both fields.
Replacement wording: *"The kitchen-and-flower garden of the Cistercian monastery was recreated
inside the oval of the Anfiteatro Castrense in 2004, to a design by the architect Paolo Pejrone, on
the initiative of the Associazione Amici di Santa Croce in Gerusalemme. It is an elliptical space
divided by two perpendicular pergola paths that meet at a central fountain. The basilica's own site
states that the garden is held on concession by the parish, is used for pastoral activities, and
that free access by visitors is not allowed."* Kind: historic-site. Status must reflect that.

**29. Anfiteatro castrense — REWRITE, and STRADDLER (escalated).** Confirmed twice over: early 3rd
century, `Epoca 218-222 d.C.`, «con tutta probabilità fu costruito dall'imperatore Eliogabalo … come
anfiteatro di corte annesso alla dimora imperiale sessoriana»; elliptical, 88 × 75.80 m,
`Superficie = 5239`; in use until the Aurelian Walls cut it in half and turned it into a forward
bastion by blocking the façade arches.
**Drop "which marks it visitable".** The Sovrintendenza's own page carries no visiting terms at all,
and the interior is the convent garden the parish states is closed to free access — see 28. The
`Visitabile = Sì` is a Wikipedia infobox field and cannot carry that weight.
Add from the Sovrintendenza page, which the finder fetched but did not use: the elevation was
originally three orders of arcades, entirely in brick, and was **reduced to the first order for
defensive reasons under Paul IV in the 16th century**; the concrete foundations are now exposed
because the surrounding ground level dropped.

**30. Chiesa di Santa Maria del Buon Aiuto — PUBLISH.** `InizioCostr 1476`, raised by Sixtus IV, the
inscription *Sixtus IV fundavit MCCCCLXXVI* over the door, dependent on Santa Croce, in piazza di
Santa Croce in Gerusalemme, rione Esquilino. All confirmed. Straddler at 5 m; see §5(g).

**31. Palazzo Sessoriano — REWRITE (drop the named officer).** Confirmed: begun by Septimius Severus
and finished under Elagabalus, inside the Horti Variani at the south-east edge of the Augustan
Regio V Esquiliae, by the Aqua Claudia; `Superficie = 122,500`. Under the Soprintendenza Speciale.
**Drop "the responsible officer is named as Anna de Santis"** — that is a staffing field, not a
place fact, and it will rot. No hours; the Soprintendenza scheda is unreachable and the record says
nothing about opening.

**32. Terme Eleniane — PUBLISH.** Severan date on the earliest brick stamps and a dedication to
Julia Domna; named for Helena, who restored them after a fire in 323–326 (CIL VI 1136, now in the
Vatican Museums); demolished at the end of the 16th century by Domenico Fontana for Sixtus V to open
the stretch of the strada Felice in front of Santa Croce; plan known from Palladio and Giuliano da
Sangallo. All confirmed.

**33. Carceres del Circo Variano — REWRITE. Publish it as the Circo Variano.** "Carceres" and
"starting gates" are OSM's naming, not the article's. What `it:Circo Variano` supports: named for
Elagabalus (Sesto Vario Avito Bassiano); built in the imperial residential complex called
*Ad Spem Veterem*, which also comprised the Palazzo Sessoriano and the Anfiteatro Castrense; begun
by Septimius Severus (193–211) and completed by Elagabalus (218–222); originally 630 m long and
125 m wide, later reduced to 565 m; the Antinous obelisk stood on its *spina* and is now on the
Pincio; the western, starting side was found inside the walls and the curved eastern side lay at
via Alcamo; the northern side later carried the last stretch of the Acqua Felice; last excavated
1959.
**Banned and present in that article:** «superava il Circo Massimo di almeno 9 m» and «era comunque
uno dei circhi più grandi, più grande del circo di Massenzio». Neither publishes.

**34. Museo nazionale degli strumenti musicali — PUBLISH.** The museum's own site confirms, to the
digit: Piazza Santa Croce in Gerusalemme 9/A, 00185 Roma; Tuesday–Sunday 09:30–19:30, last entry
18:30; Intero €6,00; Agevolato €2,00 for 18–25s, EU students only; free under 18; free the first
Sunday of every month; in the Roma Pass and Roma & Più Pass circuit; tel. +39 06 7014796. The
Palazzina Samoggia and the entrance beside the basilica are confirmed. The 15,770 figure is real —
it is `Visitatori = 15770`, `Anno visitatori = 2018`, cited to the MiBAC visitor-and-receipts table,
and publishes attributed.
Two small corrections: the directorate is now styled **«Direzione Musei nazionali della città di
Roma»** on the museum's own footer, while «Direzione Musei statali di Roma» is Wikipedia's wording
for the December 2019 transfer — use the site's. And «Un museo unico a Roma» is on the site; it
stays out.

**35. Museo storico dei granatieri di Sardegna — PUBLISH.** Collections joined 5 March 1903 in rooms
of the Caserma Ferdinando di Savoia; 1912 proposal to move to the Caserma Umberto I on piazza Santa
Croce in Gerusalemme; deferred by the First World War; 1920 comune resolution to donate the land.
All confirmed. `granatieridisardegna.it` is an unconfigured install; **the record states that no
opening hours are published, and gives none.**

**36. Museo storico della fanteria — PUBLISH, status closed, with the attribution carried.**
it.wikipedia states «Dal 2023 risulta chiuso e parte degli spazi sono utilizzati per delle mostre
d'arte», citing la Repubblica (14 January 2025) and imuseidiroma.it. That is an aggregator claim
about a closure, and the corpus rule is to attribute it, which makes it publishable:
*"Italian Wikipedia records that the museum has been closed since 2023, with part of its spaces used
for art exhibitions, citing la Repubblica of 14 January 2025 and imuseidiroma.it."*
Piazza Santa Croce di Gerusalemme 9, under the Comando Brigata meccanizzata "Granatieri di
Sardegna", confirmed. Use the body's **11 November 1959** inauguration by President Gronchi; the
infobox's 1956 is the year the search for a seat passed to General Bruno and is not an opening date.

**37. Museo della Basilica — REWRITE. The OSM hours are wrong; the real ones are now sourced.** The
basilica's own ORARI page: **«Il Museo della Basilica, con accesso dalla sacrestia, è visitabile
ogni giorno nei seguenti orari: 10,00-12,00 / 16,00-17,30.»** Not OSM's "16:30-18:00". The homepage
adds that the museum was created in 1999 inside the spaces of the Convent of Santa Croce. The
detached 13th–14th century frescoes from the oratory of Santa Margherita are kept here, confirmed
from the Santa Margherita article.

**38. Oratorio di Santa Margherita — PUBLISH.** Deconsecrated, viale Carlo Felice, rione Esquilino;
set inside the fourth tower of the Aurelian Walls; converted to an oratory in the Middle Ages;
13th–14th century fresco cycle of St Paul and St Margaret of Antioch, discovered 1932, detached, now
in the museum of Santa Croce; known as the *prigione di santa Margherita*; a Madonna Bona lived
there as a recluse in the 13th century; still officiated in the 17th century when Clement IX granted
indulgences; restored by Antonio Muñoz in 1914 and again in 1978. All confirmed. Worth adding: a
recovery project is under way with the aim of returning the frescoes *in loco*.

### 3.8 The eastern archaeology, along via Giolitti

**39. Tempio di Minerva Medica — PUBLISH.** Not a temple but a monumental hall inside the precinct
of a luxurious suburban residence, the *horti* argued as either Liciniani or Pallantiani;
`Epoca = inizio IV secolo`; `Altezza = 24 m; in origine 32 m`; `Larghezza = 25 m`;
`Superficie = ~470`; in via Giolitti, rione Esquilino. All confirmed. The Soprintendenza scheda is
unreachable and the record says nothing that depends on it.

**40. Chiesa di Santa Bibiana — PUBLISH.** Via Giovanni Giolitti 154, on the site of the Horti
Liciniani; the two foundation traditions, 363 by the matron Olimpina and 467 under Simplicius per
the *Liber pontificalis*; Leo II's translation of the relics of Simplicius, Faustinus and Beatrice;
Honorius III's restoration of 1224 with a women's monastery beside it; Urban VIII's complete
rebuilding. Confirmed. The finder's own safe wording is the right one: **write that the façade and
the statue of the saint are by Gian Lorenzo Bernini and stop** — «prima opera architettonica» is not
in the article and is a priority claim in any case. Note for whoever writes it: `santabibiana.it`
is a dementia day-care centre in Martina Franca and has nothing to do with the church.

**41. Sepolcri repubblicani di via Statilia — REWRITE (upgrade; the finder gave one line).** The
Sovrintendenza's own page, which the finder fetched and did not use, gives all of this: at the
corner of **via Statilia and via di Santa Croce in Gerusalemme**; found in **1916**; dating to about
100 BC and buried in the following century; originally aligned along the ancient road also called
the *via Celimontana*, running from the Porta Maggiore area toward the Celio; the most recent tomb,
about the middle of the 1st century BC, is in the form of an ancient altar in blocks of tufa and
peperino; immediately opposite is a small underground area with the remains of two ancient water
conduits in hollowed, interlocking tufa blocks. Access: **accompanied groups only, maximum fifteen
per visit, booking obligatory on 060608 between 09:00 and 19:00**; individual visits also possible
by booking, on a published calendar.

**42. Ipogeo degli Aureli — PUBLISH.** Privately-held catacomb on the ancient via Labicana, found in
1919 at the junction of viale Manzoni and via Luzzatti; two levels; a fresco cycle whose reading
remains open; `Ente = Pontificia commissione di archeologia sacra`; `Visitabile = a richiesta`. All
confirmed.

**43. Arco di Sisto V (arco Felice) — REWRITE (etymology).** Confirmed: «realizzato nel 1585»,
in the first year of Sixtus V's pontificate, celebrating the completion of the Acqua Felice, at the
crossing of the two roads that led to Santa Maria Maggiore and to Santa Croce; rione Esquilino by
the article's own lead.
**The finder's etymology is wrong.** The article says it is known as the *arco Felice* **«dal nome
di battesimo del papa committente, Felice Peretti»** — from the pope's baptismal name. The "arco
delle pere" derivation from the pears in his arms is not in the fetched text. Write the sourced one.
The romasegreta "Castro Pretorio" filing is a claim about that site's URL path which I did not
fetch; treat it as unverified. Recommend Esquilino; §5(k).

### 3.9 Umbertine and 20th-century civic buildings

**44. Villa Altieri — PUBLISH.** Viale Manzoni 47; commissioned in the 1670s by Paluzzo Paluzzi
Altieri degli Albertoni, cardinal-nephew of Clement X, from Giovanni Antonio De Rossi, converting an
old farm building; sold 1857, bought about 1862 by Cardinal Francesco Saverio de Mérode; leased
after the breach of Porta Pia to the Italian state, which ran **a women's penal institution there
until 1897**, then to the Dorotee, who ran a girls' boarding school to 1933, and to the Figlie di
Nostra Signora al Monte Calvario; bought by the Provincia di Roma in 1975; restored 2009–2010 as the
Palazzo della cultura e memoria storica; now a small museum with the library and historical archive
of the Città metropolitana di Roma Capitale. All confirmed. No hours are sourced; state none.

**45. Palazzo della Zecca di Stato — PUBLISH, attributed.** Via Principe Umberto; 1908–1911 to the
design of the engineer Carlo Mongini; inaugurated by Victor Emmanuel III on 27 December 1911 as the
first State Mint of the Kingdom of Italy; housed the Museo numismatico della Zecca Italiana until
1962; coin production ceased in 1999; still holds the Scuola dell'Arte della Medaglia. Confirmed in
the rione article, which cites `ipzs.it`. "The first State Mint of the Kingdom of Italy" is a
position in a dated sequence rather than a ranking, and it publishes — but attribute it to the
rione article citing the Istituto Poligrafico e Zecca dello Stato, rather than asserting it flat.

**46. Palazzo Dante — DROP as a record.** I uphold the finder's own recommendation and add a second
reason. First: it is a working intelligence headquarters, no fetched page states a public access
policy, `open` would be false and `closed` is an affirmative claim with no source — the field cannot
be honestly set either way. Second: the construction dates are irreconcilable across three fetched
pages — `periodo costruzione = 1907-1912`, «i lavori iniziarono nel 1911», and the Piazza Dante
article's «costruito nel 1914». Name the building in passing inside record 47, which is where the
DIS seat since May 2019 (sicurezzanazionale.gov.it) belongs.

**47. Piazza Dante — REWRITE. The finder carried a superlative here without flagging it.**
Confirmed: between via Alfieri and via Giusti, rione Esquilino; dedicated to Dante; a monument to
the poet was designed for it and never built.
**«uno dei maggiori rifugi sotterranei» is "one of the larger" and is banned.** Replacement wording:
*"During the Second World War the square held an underground public air-raid shelter; in the 1980s
the underground rooms were taken over by an Enel substation."*
Three sourced facts the finder missed and which improve the record: the square was named Piazza
Leonardo da Vinci until 1945, because Dante was to be given an avenue in the E42 that was never
built; the gardens at its centre are dedicated to Mary and Hasib Begum, who died in a fire in nearby
via Buonarroti on 13 January 2007; the gardens reopened at the beginning of 2021.

**48. Villa Wolkonsky — REWRITE. Remove the gov.uk citation entirely.** The British Embassy Rome
page on gov.uk **does not mention Villa Wolkonsky** and gives an unrelated 00187 address. It is not
evidence for anything on this record and must not appear on it.
What it.wikipedia does support: the official residence of the British Ambassador to Italy, on a
property covering nearly five hectares of the Esquiline hill, just inside the Aurelian Walls; the
grounds contain **thirty-six arches of the aqueduct of Nero**, built by the emperor as a spur off
the Aqua Claudia of AD 52 to bring water from Subiaco to the Domus Aurea and to the nymphaeum by the
temple of the Divine Claudius; Roman tombs are also present.
Write **"the aqueduct of Nero"**, not "Aqua Neroniana" — the latter is the finder's coinage. Do not
carry «non lontano dalla Basilica di San Giovanni in Laterano», which is orientation by impression.
No source states an access policy: say what the place is, and that no visiting arrangements are
published.

**49. Teatro Ambra Jovinelli — REWRITE (address).** Confirmed: built for Giuseppe Jovinelli; after
schemes by Pietro Chiodelli and Giacomo Radiconcini, construction began in 1906 and «l'anno
seguente» — 1907 — Ulderico Bencivenga took over as designer; opened **3 March 1909**; horseshoe
hall with two galleries.
**The address conflicts.** it.wikipedia's infobox gives «via Guglielmo Pepe, 43/47»; the theatre's
own site footer gives **«Via Guglielmo Pepe, 45 – Roma»**. A place's own official site establishes
its location, so **write 45**. The site confirms a current season (2026-27) and a box office; keep
the artistic director out unless the site names them on a page that resolves.

**50. Palazzo del Freddo Giovanni Fassi — REWRITE. The finder's reading of the rule is correct and I
uphold it, with a second reason.** Address confirmed on the operator's site: Via Principe Eugenio
65/67, 00185 Roma. The *sanpietrino* and *caterinetta* semifreddi are confirmed there and the
sanpietrino also in it.wikipedia.
**The 1880 does not publish.** It is a trading-duration claim taken from the operator's own site
(«Dal 1880 il gelato più amato di Roma»), which the rule bans outright — the rule bans the claim,
not the source, so a third-party citation does not rescue it. And on the evidence it would be a bad
fact anyway: it.wikipedia's own infobox reads `data fondazione = 1880 (1928)`, and the rione article
says «Gelateria attiva dal **1928**». The sources disagree with each other.
Both superlatives are confirmed present and both stay out: «il gelato più amato di Roma» (operator)
and «È una tra le gelaterie più antiche d'Italia» (Wikipedia). The site's «un luogo unico» is a
third. Ship the address, the products, and the liberty-style building — attributing the building
description to it.wikipedia, which identifies it as the ex villino liberty Calderai-Torlonia. Kind
`cafe` is right.

### 3.10 Other churches inside the ring

**51. Chiesa di Santa Maria Immacolata all'Esquilino — PUBLISH.** Via Emanuele Filiberto 129; built
for the Frati della Carità (Padri Bigi) from 1901 to 1914 to the design of Antonio Curri, with the
engineer Luigi Cortesi directing; first mass 8 December 1914; consecrated by Cardinal Luigi Traglia
on 21 April 1942. Neo-Gothic gabled façade with two flanking towers, **twenty-one metres wide** —
confirmed as «È larga ventuno metri», and the article adds that it is a little over twenty-two
metres high at the tip of the cross, which is worth carrying alongside it.

**52. Cappella di Sant'Elena all'Esquilino — PUBLISH.** Via Machiavelli; 1898–1899 to the design of
Ettore Genuini, as the church of the convent of the Franciscan Missionaries of Mary when their
convent was enlarged; dedicated to St Helen after the foundress's name, Hélène de Chappotin de
Neuville, as the inscription over the portal states; neo-Gothic; single nave with polychrome glass
and a screen dividing the nuns' part of the hall from the faithful's. All confirmed. The article
adds that a primary school was annexed to it after the war.

**53. Chiesa di Sant'Andrea Catabarbara — FOLD into 14, with one clause removed.** Nothing survives
in place, so the finder is right that it is a paragraph, not a record. Confirmed: made in the second
half of the 5th century under Simplicius out of a hall of the Basilica di Giunio Basso, the *domus*
of Junius Annius Bassus, consul of 331, given by the Gothic general Valila; demolished in 1930 for
the Seminario Pontificio di Studi Orientali in via Napoleone III; parts incorporated into
Sant'Antonio Abate.
**Drop «la prima chiesa devozionale dedicata ad Andrea apostolo nel territorio urbano di Roma».**
"The first church of X in Rome" is the same shape as "the oldest X in Rome" and there is no
reachable register to check it against.

**54. Cappella di Santa Maria Addolorata all'Esquilino — REWRITE, and ship it.** The finder said
"no body text was retrieved — recommend not shipping". The article is 2,974 characters and says:
in **via di San Quintino**, rione Esquilino; richly decorated; **built in 1928 and renewed in
2001**; belonging to the annexed convent of the Figlie di Nostra Signora al Monte Calvario; over the
entrance portal the phrase *Virgini perdolenti*, surmounted by a coat of arms carrying the three
crosses of Calvary; the interior divided in two by a screen separating the nuns' part of the
liturgical hall from the faithful's; on the left as one enters, the tomb of Sister Maria Teresina
Zonfrilli, who died in the convent on 20 January 1934 and whose cause was introduced by Pius XII in
1957. That is a record.

---

## 4. Section 4 exclusions — all upheld

Every deliberate non-carry in the finder's §4 is confirmed and none should be revisited:
Santa Maria Maggiore, the Obelisco Esquilino and Piazza dell'Esquilino are Monti's and the first two
are shipped there; `it:Sepolcro di Eurisace` states outright «nel quartiere Q. VII
Prenestino-Labicano» and does not carry an Esquilino category; `it:Basilica sotterranea di Porta
Maggiore` places itself in Prenestino-Labicano and the rione article's own footnote concedes it; the
Domus Aurea, Terme di Traiano, Terme di Tito, Colle Oppio and Portico di Livia are all shipped in
Monti; Terme di Diocleziano, Santa Maria degli Angeli and Palazzo Massimo are all shipped in Castro
Pretorio; the four school buildings and the ACEA water cabinet are not places a traveller visits;
the two *domus* rest on Wikimapia; Venchi is a chain outlet; the metro stations are access lines;
the *horti* are topographic entities.

---

## 5. Straddlers and conflicts escalated to the arbitrator

**(a) Santa Pudenziana — the brief's ruling is wrong and I confirm the finder.** `it:Basilica di
Santa Pudenziana` places it «in via Urbana … nel rione Monti», it is shipped as
`monti/basilica-di-santa-pudenziana-rome`, and it carries no Esquilino category. Esquilino does not
take it. The brief's line that wave 1 ruled it out of Monti should be corrected in the brief.

**(b) Teatro Brancaccio and Palazzo Brancaccio — the brief's ruling is wrong and I confirm the
finder.** `it:Teatro Brancaccio` gives `Indirizzo = via Merulana 244` and is filed under
`Categoria:Roma R. I Monti`. The palazzo is shipped as `monti/palazzo-brancaccio-monti-rome`. Both
stand on the **west** side of via Merulana, which the Esquilino hill article makes the Monti line.
Esquilino claims neither.

**(c) Santa Prassede — unwritten, and every test says Monti.** `it:Basilica di Santa Prassede` opens
by placing it in rione Monti and carries no Esquilino category; `taken_slugs.py prassede` returns
zero. **Escalated.** My recommendation is Monti and that it stay unwritten this wave unless the
arbitrator reinstates wave 1's ruling explicitly.

**(d) Porta Maggiore — a genuine straddler, and the article says so itself.** `it:Porta Maggiore`
carries **both** `[[Categoria:Roma R. XV Esquilino]]` **and**
`[[Categoria:Roma Q. VII Prenestino-Labicano]]`. The rione article claims it «fra piazzale Labicano
e piazza di Porta Maggiore» while its own boundary footnote makes the gate the boundary. Q. VII is
out of scope this wave. **Escalated.** Esquilino is the only claimant in scope; I lean the same way
the finder does, by default of scope, and say so as a preference.

**(e) Piazza dei Cinquecento — a genuine straddler.** The infobox names both rioni and the lead says
«al confine tra i rioni Esquilino e Castro Pretorio». Castro Pretorio is shipped with 40 places and
did not take it — I re-read that file to confirm. **Escalated;** Esquilino is the only claimant.

**(f) Piazza di Santa Maria Maggiore and its fountain — escalated, and it is closer than the finder
made it sound.** `it:Fontana di piazza Santa Maria Maggiore` carries
`[[Categoria:Roma R. XV Esquilino]]`, so it.wikipedia files the fountain in **Esquilino**, not
Monti. Monti holds the basilica and the obelisk. I agree with the finder's instinct — do not split a
square between two files — and recommend the whole square to Monti, but the arbitrator should know
that the recommendation runs against the fountain's own category.

**(g) The Aurelian Wall line at Santa Croce — escalated, recommend Esquilino for all five.**
Anfiteatro Castrense, Santa Maria del Buon Aiuto, the Oratorio di Santa Margherita, the Santa Croce
façade and the Museo degli strumenti musicali. The basilica's own site says «nel Rione Esquilino»;
the Buon Aiuto, Santa Margherita and Santa Croce articles all carry Esquilino rione categories; the
rione article lists all five. Q. X Tuscolano is out of scope and cannot argue back, which is
precisely why this is flagged rather than assumed.

**(h) Porta Tiburtina / Porta San Lorenzo — escalated, and it should have been a candidate.**
`it:Porta Tiburtina` carries `[[Categoria:Roma R. XV Esquilino]]`, `Ente = Sovrintendenza Capitolina
ai Beni Culturali`, an Augustan arch of 5 BC and the Aurelian construction of 275 AD. The finder
flagged it as a straddler in §5 and then never wrote it up in §3. See §6.

**(i) The via Merulana frontage — resolved except for the boundary itself.** Sant'Alfonso and
Sant'Antonio da Padova are placed in rione Esquilino by their own articles, so those two are safe on
a source rather than on a ray-cast. Palazzo Merulana rests on `Via Merulana, 121` from the
operator's own site, on the east frontage; at 16 m it stays flagged, but the street number is a
sourced locator and I would let it stand. The Museo delle Illusioni is dropped on other grounds and
the 14 m question is moot.

**(j) The Lateran fringe — one reversal.** Scala Santa and the Monumento a San Francesco both carry
`Roma R. XV Esquilino` categories and are Esquilino's. **The Oratorio del Santissimo Sacramento al
Laterano is Monti's** by its own lead and its own category — see item 24 — and I overturn the
finder there. The Triclinium Leoninum has an article («Nicchione del Laterano», 9th century) but no
rione category; it physically adjoins the Lateran palace, which is Monti's. **Nobody should claim
it this wave.**

**(k) Arco di Sisto V — escalated, low risk.** The article's own lead says «situato nel rione
Esquilino di Roma». The romasegreta counter-filing under Castro Pretorio is a claim about that
site's URL path that I did not fetch and cannot confirm. Castro Pretorio is shipped and did not take
it. Recommend Esquilino.

---

## 6. Shippable places the finder missed

Four candidates, all unclaimed by any shipped file, all placed in Esquilino by their own sources.
The first is the most serious omission in the file.

1. **Museo storico della Liberazione** — `Indirizzo = Via Tasso, 145 - Rione Esquilino` in its own
   infobox; `[[Categoria:Roma R. XV Esquilino]]`; also `[[Categoria:Carceri del passato di Roma]]`.
   Listed by the rione article under *Musei*. A museum of the Nazi-Fascist occupation of Rome housed
   in the former SS prison cells. `taken_slugs.py` returns zero for both `liberazione` and `tasso`.
   This is a real museum in the rione and the finder did not mention it once.
2. **Chiesa di Santa Margherita Maria Alacoque** — in via Germano Sommeiller, rione Esquilino;
   `InizioCostr 1922`, `FineCostr 1925`, `AnnoConsacr 1950`;
   `Categoria:Chiese di Roma (rione Esquilino)`. Listed by the rione article. Unclaimed.
3. **Porta Tiburtina (Porta San Lorenzo)** — see §5(h). Unclaimed.
4. **Fontana di piazza Vittorio, by Mario Rutelli (1911)**, known as «il fritto misto», restored
   2020 — carried in the Piazza Vittorio article's own infobox and image captions. Either its own
   record or a paragraph inside record 1.

Also listed by the rione article and not researched by anyone: the **Chiesa del Santissimo Crocifisso
alla Stazione Termini** (no it.wikipedia article — the title is missing) and the **Cappella della
Sacra Famiglia di Nazareth all'Esquilino**. Neither is shippable on present evidence.

---

## 7. Tier ruling

Of the finder's 54 numbered candidates: **22 PUBLISH, 25 REWRITE, 4 DROP, 3 folded into another
record.** That leaves **47 surviving records**, before the four recoveries in §6, which take the
available pool to **51**.

Three of the 47 sit on escalations that could go against Esquilino — Piazza dei Cinquecento, Porta
Maggiore and, if the arbitrator disturbs wave 3, Termini. The honest floor is therefore **44**.

**Ruling: a full guide page, not a town page — comfortably, and the finder's own judgement is
upheld.** The count is not the reason. The reason is that 47 records is well past the threshold and
the composition is unusually strong for this wave: a national state museum with published hours,
prices, a phone number and a visitor figure (strumenti musicali); a private museum with hours
published to the entry slot (Merulana); a museum with a sourced closure and named citations
(fanteria); a museum with sourced daily hours from the institution that runs it (Museo della
Basilica); two Sovrintendenza sites with exact group sizes and a booking number (Mecenate, Statilia);
a Lateran Treaty Art. 15 property named in the Holy See's own list (Scala Santa); and four clusters
that each stand alone — Piazza Vittorio, the Termini forecourt, the Santa Croce/Sessorium corner and
the Servian stub at the Arco di Gallieno.

The thin end the finder marked is real and I have cut it: the illusions franchise, the unsourced
theatre, the intelligence headquarters, an oratory that belongs to Monti, and three entries folded
into their neighbours. What replaced them is better — two chapels the finder wrongly wrote off, a
monastery record its own second source rescued, and four places it never found.
