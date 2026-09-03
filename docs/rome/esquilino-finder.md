# Esquilino (R. XV, Roma Capitale toponymic code 115) — finder file

Finder pass, wave 5. Not a shipping decision: a verifier adjudicates each record and one
arbitrator rules ownership across all nine zones in this wave.

Esquilino is the only **rione** in this wave. The other eight units are quartieri or a zona, and
the cautions in the brief about municipi and about weak locators do not bind here: Esquilino is a
rione, fixed since 1874, wholly inside **Municipio Roma I**
(it.wikipedia, `Esquilino (rione di Roma)`, infobox `circoscrizione = Municipio Roma I` —
https://it.wikipedia.org/wiki/Esquilino_(rione_di_Roma) ).

---

## 0. Collision check against what is already shipped — run mechanically, twice

`python3 .superpowers/taken_slugs.py` reports **786 places across 21 shipped files**.

Searches run (`python3 .superpowers/taken_slugs.py <fragment>`):

| fragment | hits | consequence for Esquilino |
|---|---|---|
| `maggiore` | 2 — `monti/basilica-di-santa-maria-maggiore-rome`; `sant-angelo/tempio-maggiore` | SMM is Monti's, as wave 1 ruled. Not claimed here. |
| `esquilin` | 1 — `monti/obelisco-esquilino-rome` | The obelisk behind SMM is Monti's. Consistent with §1 (Piazza dell'Esquilino tests **outside** Esquilino). |
| `pudenziana` | **1 — `monti/basilica-di-santa-pudenziana-rome`** | **TAKEN. See §5, ruling conflict.** |
| `brancaccio` | **1 — `monti/palazzo-brancaccio-monti-rome`** | **TAKEN. See §5, ruling conflict.** |
| `prassede` | 0 | unwritten — but tests **outside** Esquilino. See §5. |
| `laterano` | 3 — `monti/basilica-di-san-giovanni-in-laterano-rome`, `monti/palazzo-del-laterano-rome`, `monti/basilica-di-san-clemente-al-laterano-rome` | The Lateran core is Monti's. The Scala Santa is **not** among them, consistent with wave 1's exclusion. |
| `porta` | 16, incl. `monti/porta-asinaria-rome`, `monti/porta-metronia-rome` | No Esquilino gate taken. Porta Esquilina, Porta Maggiore, Porta Tiburtina all free. |
| `termini`, `cinquecento`, `vittorio` (piazza), `trofei`, `magica`, `mecenate`, `bibiana`, `eusebio`, `alfonso`, `merulana`, `acquario`, `gallieno`, `manzoni`, `croce` (in Gerusalemme), `scala` (santa) | **0 relevant hits** | all free |

`vittorio` returns only the Vittoriano (Campitelli), the Biblioteca Nazionale (Castro Pretorio) and
Ponte Vittorio Emanuele II (Ponte). **Piazza Vittorio Emanuele II is unclaimed.**
`croce` returns only `regola/palazzo-santacroce`. **Santa Croce in Gerusalemme is unclaimed.**

**Two collisions with the brief's stated rulings are recorded in §5. Both are places the brief
told me were Esquilino's and that the shipped corpus says are Monti's.**

---

## 1. How the rione boundary was established

**Method A — OSM boundary relation, tested locally by ray-casting.**
Overpass `rel["name"~"Esquilino"]` inside a bbox over the centre returns
**relation 5454309**, tagged `boundary=place`, `place=quarter`, `ref=R. XV`,
`official_name=Rione XV Esquilino`. (The San Saba finder in wave 4 resolved the same id
independently.) Overpass returned 504 on the geometry call from every mirror tried, so the
geometry was pulled instead from the OSM API itself:
`https://api.openstreetmap.org/api/0.6/relation/5454309/full.json`. The member ways stitch into a
**single closed outer ring of 589 vertices**. Every candidate was then ray-cast against that ring,
and a metric distance-to-nearest-edge was computed alongside — the distance is what surfaces the
straddlers, and it is reported for each candidate below.

**Method B — Nominatim reverse geocoding**, `quarter` field. Nominatim rate-limited to HTTP 429
after roughly forty calls and did not recover across two further passes at 3 s spacing, so B
covers only part of the candidate set. **Where B returned a `quarter`, A and B agree on every
single candidate** — including the awkward ones (Scala Santa → `Esquilino`; Santa Prassede →
`Monti`; Piazza dell'Esquilino → `Monti`; Fontana dell'obelisco Lateranense → boundary case, see
§5). Where B returned `suburb = Tuscolano` or `Tiburtino` with no `quarter` (Anfiteatro Castrense,
Santa Croce, the Museo degli strumenti musicali, Porta Tiburtina), the coordinate under test was on
the **outer** face of the Aurelian Walls; re-testing an inner-face point put all four inside. Those
are recorded as straddlers in §5 anyway.

**Method C — Roma Capitale / it.wikipedia's own list.** The rione article's «Monumenti e luoghi
d'interesse» section and the maintained category `Categoria:Roma R. XV Esquilino`
(62 members, pulled via `action=query&list=categorymembers`) were used as an independent
enumeration, not as a boundary test. **A and C disagree on six items**, all in §5.

Declared boundary, from the rione article's own text and footnotes:
north — R. XVIII Castro Pretorio; east — Q. XII Tiburtino (separated by the Aurelian Walls, via di
Porta Tiburtina, from piazzale Sisto V to viale dello Scalo San Lorenzo) and Q. VII
Prenestino-Labicano (separated by piazzale Labicano at Porta Maggiore); south-east — Q. X
Tuscolano (the Aurelian Walls from piazzale Labicano to piazzale Appio); west — R. I Monti.
The Esquilino hill article states the Monti/Esquilino line outright: «I due rioni sono separati da
via Merulana». Source for both: https://it.wikipedia.org/wiki/Esquilino_(rione_di_Roma) and
https://it.wikipedia.org/wiki/Esquilino

Consequence, and it governs a lot below: **Via Merulana's east side is Esquilino, its west side is
Monti.** Palazzo Brancaccio and the Teatro Brancaccio are west. Sant'Alfonso, Sant'Antonio da
Padova, the Auditorium di Mecenate and Palazzo Merulana are east.

Working files: `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/esq/`
(`esq_full.json` = the ring; `pip.py`, `dist.py` = the tests; `wt/` = wikitext; `web/` = fetched sites).

---

## 2. Yield judgement

**This is a guide page, comfortably — not a town page.** 47 candidates below carry a sourced fact
and a sourced address, and the rione holds four distinct clusters that each stand on their own:
the Piazza Vittorio square-and-gardens complex, the Termini forecourt, the Santa Croce in
Gerusalemme / Sessorium corner, and the Servian-wall stub around the Arco di Gallieno. Esquilino
also holds two things no other zone in this wave has: a national state museum with published
opening hours and prices (strumenti musicali) and a Lateran Treaty extraterritorial property
(Scala Santa).

The thin end is real and is marked. Roughly a dozen entries below are school buildings, a water
cabinet, and two *domus* known only from Wikimapia. **I would not ship those**, and I say so
inline rather than padding the count.

---

## 3. Candidates — confidently inside Esquilino

Distance is to the nearest edge of the OSM ring. Every entry tested INSIDE by Method A.

### 3.1 Piazza Vittorio cluster

**1. Piazza Vittorio Emanuele II** — *attraction* — 352 m inside
Rome's porticoed square, laid out under the 1873 master plan; built from 1880, gardens opened to
the public Sunday 10 July 1889. 325 × 185 m, 60,000 m² including the porticoes. The garden at its
centre is dedicated to Nicola Calipari; it reopened on 31 October 2020 after twenty months of
works. The building between via Emanuele Filiberto and via Conte Verde was rebuilt and
re-inaugurated in 2012 and now houses the Fondazione ENPAM.
https://it.wikipedia.org/wiki/Piazza_Vittorio_Emanuele_II_(Roma)
**Corpus warning:** the same page calls it «la piazza più vasta della Capitale». That is a
superlative and must not be carried. The dimensions are measurements and publish.

**2. Ninfeo di Alessandro, known as the Trofei di Mario** — *historic-site* —
in the northern corner of the Piazza Vittorio garden — 274 m inside
Severan-age monumental fountain, functioning both as a terminal display (*munus*) and as a
distribution tank (*castellum aquae*); trapezoidal plan; 25 m wide, originally about 20 m high,
4,000 m³. The two marble trophies that gave it its medieval name were moved in 1590 by Sixtus V to
the balustrade at the top of the Cordonata on the Campidoglio. Managed by the Sovrintendenza
Capitolina; the infobox gives «visitabile su richiesta (tel. 060608)».
https://it.wikipedia.org/wiki/Ninfeo_di_Alessandro
http://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/trofei_di_mario (fetched, 5,000 chars)

**3. Porta Alchemica, also called Porta Magica** — *historic-site* —
Piazza Vittorio Emanuele II garden — 286 m inside
Built between 1655 and 1681 by Massimiliano Savelli Palombara, marchese di Pietraforte
(1614–1685), in the grounds of his Villa Palombara on the Esquiline, and re-erected in the present
garden. It is the surviving one of the villa's five gates; an inscription on the lost gate opposite
dated that one to 1680. Flanked by two statues of the Egyptian god Bes.
https://it.wikipedia.org/wiki/Porta_Alchemica

**4. Museo Ninfeo — Il giardino degli dèi** — *museum* — Piazza Vittorio Emanuele II 79/a
Museum over an excavated sector of the **Horti Lamiani**, occupied from the 1st c. BC to the 6th c.
AD, found during the rebuilding of the ENPAM palazzo. Opened to the public 6 November 2021 under an
agreement between the Fondazione ENPAM and the Soprintendenza Speciale Archeologia Belle Arti e
Paesaggio di Roma. Booking page on the museum's own site.
https://www.museoninfeo.it/ (fetched)
https://it.wikipedia.org/wiki/Piazza_Vittorio_Emanuele_II_(Roma) (opening date, citing AGCult 15 Oct 2021)
*Photo wave note: heavily photographed, all recent; check licensing.*

**5. Nuovo Mercato Esquilino** — *shop* — via Filippo Turati / via Principe Amedeo — 230 m inside
Covered market built on the block previously occupied by the Centrale del Latte di Roma and the
Caserma Sani (formerly Caserma Pepe). The open-air stalls that had stood on Piazza Vittorio since
the 1890s were cleared in October 2001 and moved here. Two halls, one for food and one for
clothing. OSM carries it as `relation/1404282`, `building=market`, `name=Nuovo Mercato Esquilino`.
https://it.wikipedia.org/wiki/Piazza_Vittorio_Emanuele_II_(Roma)
https://www.mercatidiroma.com/nuovo-mercato-esquilino-ex-piazza-vittorio/esquilino (fetched)
**Corpus warning:** the aggregator page says «Era uno dei mercati più suggestivi della città» —
superlative, do not carry. The 1913 first re-organisation and the October 2001 clearance are dates
and publish.

**6. Chiesa di Sant'Eusebio all'Esquilino** — *historic-site* — corner of Piazza Vittorio Emanuele
II and via Napoleone III — 320 m inside
Titular and parish church, consecrated 1238 on a 13th-century rebuild, wedged among the blocks of
the 1873 master plan. Monastic; parish site carries a visits programme and an archaeological area
under the church.
https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Eusebio_(Roma)
https://seusebio.weebly.com/ (fetched — parish's own site)
**Corpus warning:** the Wikipedia lead calls it «uno dei monumenti cristiani più insigni del
Rione». Superlative. Drop.

### 3.2 Termini and Piazza dei Cinquecento

**7. Stazione di Roma Termini** — *attraction* — Piazza dei Cinquecento — 83 m inside
Opened 1863 as the Stazione Centrale delle Ferrovie Romane, rebuilt 1873, rebuilt again 1950. The
present front block is by Eugenio Montuori and Annibale Vitellozzi (1950); of Angiolo Mazzoni's
1930s scheme only the technical buildings were carried out. Wave 3 ruled Termini **Esquilino's,
not Castro Pretorio's**, on ten test points; Method A here agrees, 83 m inside.
https://it.wikipedia.org/wiki/Stazione_di_Roma_Termini
https://it.wikipedia.org/wiki/Esquilino_(rione_di_Roma) (Montuori/Vitellozzi/Mazzoni attribution)
**Corpus warning:** it.wiki's «la maggiore stazione ferroviaria d'Italia» and «la quinta in Europa»
are ranking claims. Banned. Passenger counts (about 150 million a year, 850 trains a day, cited to
Grandi Stazioni) are counts and publish **with the aggregator attributed**.

**8. Piazza dei Cinquecento** — *attraction* — 95 m inside — **STRADDLER, see §5**
45,000 m², named for the more than five hundred Italian dead of the battle of Dogali. Bounded by
via Giovanni Giolitti, largo di Villa Peretti and via Marsala; the city's main bus terminus.
https://it.wikipedia.org/wiki/Piazza_dei_Cinquecento

**9. Monumento a Giovanni Paolo II** — *attraction* — Piazza dei Cinquecento — 20 m inside
Bronze statue by **Oliviero Rainaldi**. OSM `node/1539350656`, `artist_name=Oliviero Rainaldi`,
`wikidata=Q3862615`.
https://it.wikipedia.org/wiki/Monumento_a_Giovanni_Paolo_II
**Photo wave: REJECT.** Rainaldi is living; Italy has no freedom of panorama. Same class as the
Palazzo della Civiltà Italiana. Writing about it is fine.

### 3.3 Piazza Manfredo Fanti

**10. Acquario Romano — Casa dell'Architettura** — *attraction* — Piazza Manfredo Fanti 47 —
228 m inside
Built 1885–1887 to the design of **Ettore Bernich**, on land the comune granted free of charge in
1882 to the ichthyologist Pietro Garganico for a fish-breeding station and aquarium; laid out on
the model of the Paris *squares*, with a pond and small bridges outside. Owned by Roma Capitale;
restored 1985–2002; since 2002 the seat of the Casa dell'Architettura of the Ordine degli
Architetti di Roma.
https://it.wikipedia.org/wiki/Acquario_Romano
https://www.casadellarchitettura.eu/ (fetched — occupant's own site; the site's "chi siamo" and
"la sede" paths 404, so no hours were obtained from it)

**11. Piazza Manfredo Fanti** — *park* — 194 m inside
Rectangular square, colloquially "piazza dell'Acquario", laid out as a garden around the Acquario
Romano; a stretch of the **agger of the Servian Wall** survives in it.
https://it.wikipedia.org/wiki/Piazza_Manfredo_Fanti

### 3.4 The Servian Wall stub and the Arco di Gallieno

**12. Porta Esquilina, also called the Arco di Gallieno** — *historic-site* — via di San Vito —
118 m inside
Monumental gate in the Servian Walls, of the earliest phase of the city and rebuilt *saxo quadrato*
in 378 BC; now abutted by the church of Santi Vito e Modesto.
https://it.wikipedia.org/wiki/Porta_Esquilina

**13. Chiesa dei Santi Vito e Modesto** — *historic-site* — main door on via di San Vito, rear
façade via Carlo Alberto 47 — 145 m inside
First named as a *diaconia* in the life of Leo III, between the 8th and 9th centuries; wholly
rebuilt by Sixtus IV in 1477; further restored in the 17th century and in the mid-19th by Pietro
Camporese il Giovane. Around 1900 Alfredo Ricci reoriented it with a new façade on via Carlo
Alberto; the 1970s restoration reversed that and returned the main entrance to via di San Vito.
Seat of the parish of Santa Maria Maggiore in San Vito, erected by Leo XII on 1 November 1824 by
the bull *Super universam*. Antoniazzo Romano fresco of 1483 over the altar of Saints Crescentia
and Modestus.
https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Vito_e_Modesto_(Roma)
http://www.sanvito-roma.it/ (fetched — parish's own site; carries the Antoniazzo attribution and an
archaeological area on the Servian Walls)

**14. Chiesa di Sant'Antonio Abate all'Esquilino** — *historic-site* — via Carlo Alberto —
94 m inside
Built 1308 in place of the earlier Sant'Andrea Catabarbara; rebuilt in 1481 by Sixtus IV. Now a
Russian Greek-Catholic church of the Byzantine rite, attached to the Pontificio Istituto Orientale;
the iconostasis is by the Russian painter Gregorio Maltzeff. A hospital for St Anthony's fire stood
beside it from the second half of the 13th century.
https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Antonio_Abate_all%27Esquilino

**15. Macellum Liviae** — *historic-site* — near the Arco di Gallieno — 184 m inside
Remains of the Livian market, on whose site Santi Vito e Modesto later rose. OSM
`way/1530887519`, `historic=archaeological_site`, `wikidata=Q776703`.
https://it.wikipedia.org/wiki/Chiesa_dei_Santi_Vito_e_Modesto_(Roma) (states the church stands on
the Macellum di Livia)
*Thin on its own; better folded into 13.*

**16. Monastero delle Viperesche** — *historic-site* — 69 m inside
OSM `relation/5205195`, `historic=monastery`, `start_date=1668`, `wikidata=Q65047827`, occupant
site https://www.santissimaconcezione.org/ . English Wikipedia article exists; Italian does not.
*Flagged as needing a second, non-OSM source before it ships.*

**17. Oratorio di Santa Maria Immacolata della Concezione** — *historic-site* — via di San Vito
Listed by the rione article and by OSM, beside Santi Vito e Modesto. No Italian Wikipedia body text
was retrieved beyond the list entry. **Thin — recommend not shipping unless a parish source turns up.**
https://it.wikipedia.org/wiki/Esquilino_(rione_di_Roma)

### 3.5 The via Merulana axis (east side)

**18. Chiesa di Sant'Alfonso all'Esquilino** — *historic-site* — via Merulana 26 — 47 m inside
Built 1855–1859 to the design of the Scottish architect **George Wigley**, in neo-Gothic; a rectory
church, held with its convent by the Redemptorists, and dedicated to the Most Holy Redeemer though
known by the name of Alphonsus Liguori. Brick and travertine façade with a portico of three doors,
a polychrome mosaic of the Virgin of Perpetual Succour in the tympanum, a Carrara marble statue of
the Redeemer on the tympanum's cusp, and a rose window. Three naves, six side chapels a side.
https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Alfonso_all%27Esquilino
*The parish domain santalfonsoroma.it did not resolve; no hours are sourced.*

**19. Auditorium di Mecenate** — *historic-site* — largo Leopardi, off via Merulana — 46 m inside
Despite the name a **nymphaeum**, not an auditorium. A large half-sunken rectangular hall,
24.10 × 10.60 m, with an apse at one short end, six niches a side plus five in the apse above seven
curved steps originally faced in cipollino marble; water issued from pipes at the top step. Part of
the **Horti Maecenatis**, dating to the making of the villa around 30 BC; on the via Leopardi side
it was built over a stretch of the Servian Walls, destroying it. Excavated in 1874 by Rodolfo
Lanciani. Managed by the Sovrintendenza Capitolina; the site's own listing gives «visitabile su
prenotazione».
https://it.wikipedia.org/wiki/Auditorium_di_Mecenate
http://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/auditorium_di_mecenate (fetched, 6,709 chars)

**20. Palazzo Merulana — Fondazione Elena e Claudio Cerasi** — *museum* — via Merulana 121 —
16 m inside
1,800 m² over four exhibition floors; a collection of 90 works of the Scuola Romana and Italian
20th century. Its own site gives the hours: collection and exhibition Wednesday–Friday, hourly
entry slots 12:00–20:00 (last entry 19:00); Saturday and Sunday 10:00–20:00 (last entry 19:00);
sculpture hall, CafeCulture and BookCulture Wednesday–Sunday 09:00–20:00, free access.
https://www.palazzomerulana.it/ (fetched — operator's own site: identity, address, hours)
**Boundary caution: 16 m from the Monti line.** Method A puts it inside; OSM's own address node
carries `addr:street=Via Merulana, addr:housenumber=121, addr:postcode=00185`. Flagged in §5.

**21. Basilica di Sant'Antonio da Padova all'Esquilino** — *historic-site* — via Merulana 124 —
43 m inside
Also called Sant'Antonio al Laterano. Built 1884–1888 by **Luca Carimini** for Bernardino da
Portogruaro and the Order of Friars Minor, who came here after being expropriated of their convent
at the Ara Coeli for the building of the monument to Victor Emmanuel II. Raised to minor basilica
by Pius XI in July 1931. Metro A Manzoni; metro B Colosseo; tram 3 Manzoni/Merulana.
https://it.wikipedia.org/wiki/Basilica_di_Sant%27Antonio_da_Padova_all%27Esquilino
http://www.basilica-santantonio-roma.org/ (fetched — the friary's own site: address via Merulana
124, telephone, transport)
**Discrepancy to resolve:** the Wikipedia infobox gives consecration 18 December 1888; the body
text says Cardinal Lucido Maria Parocchi consecrated it 4 December 1887. Do not publish either
date until one is corroborated.

**22. Museo delle Illusioni Roma** — *museum* — via Merulana 17 — 14 m inside
Interactive museum, over 70 installations. Operator's own site: https://moiroma.it/ (fetched).
OSM `node/10178773155` carries the address and `opening_hours=Mo-Th 10:00-20:30, Fr-Su …`.
**Boundary caution: 14 m from the Monti line.** Flagged in §5. Low guide value; include only if the
page wants a modern attraction.

### 3.6 The Lateran edge — east side of the piazza

**23. Scala Santa — Pontificio Santuario della Scala Santa e Sancta Sanctorum** — *historic-site* —
Piazza San Giovanni in Laterano 14 — **35 m inside**
The building is the complex Sixtus V had raised at the end of the 16th century as the new
patriarchate, built by **Domenico Fontana in 1589**. It contains the twenty-eight white marble
steps, sheathed in wood, flanked by four further flights; the chapel of San Lorenzo in Palatio,
called the *Sancta Sanctorum*, the popes' private chapel until the early 14th century, which holds
the Lateran Acheropita; the chapel of San Lorenzo; the oratory of San Silvestro in Palatio; and
the chapel of the Crucifix behind the Sancta Sanctorum. Pius IX entrusted the custody of the Scala
Santa in perpetuity to the **Passionists in 1854**, which the community's own site repeats
(«Chiamati nel 1854 da Pio IX»).
https://it.wikipedia.org/wiki/Scala_Santa
https://www.scala-santa.com/ (fetched — the sanctuary's own site: name, custody since 1854, the
twenty-eight steps, pilgrims climb them on their knees)

**Lateran Treaty status — evidence, per the vatican_ruling.** The Holy See's own press-office list
of extraterritorial properties, item 1, reads: «il complesso di S. Giovanni in Laterano (Basilica,
Palazzo Apostolico Lateranense con gli edifici annessi **e la Scala Santa**)».
https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html
(fetched; page states «Aggiornamento: 03.04.2001»). So the Scala Santa is an Art. 15 property with
the immunities of a diplomatic headquarters, **on Italian soil, inside rione Esquilino** — and it
must never be written as "in the Vatican" or as Vatican territory.
**Do NOT carry** the same page's further sentence that all extraterritorial properties are
inscribed on the World Heritage list: under the evidence_ruling no zone may claim to lie inside the
UNESCO property.

**24. Oratorio del Santissimo Sacramento al Laterano** — *historic-site* — 22 m inside
Alt-name in OSM: Oratorio di San Lorenzo alla Scala Santa. `way/200347640`,
`amenity=place_of_worship`, `wikidata=Q3884475`. Adjoins the Scala Santa building, which the
Scala Santa article confirms («affiancano l'edificio l'oratorio del Santissimo Sacramento al
Laterano e il Triclinium Leoninum»).
https://it.wikipedia.org/wiki/Scala_Santa
**Boundary caution at 22 m; and Monti already holds the Lateran core. Flagged in §5.**

**25. Monumento a San Francesco d'Assisi** — *attraction* — viale Carlo Felice, at the edge of
piazza di Porta San Giovanni — 45 m inside
Bronze group by **Giuseppe Tonnini**, 1927: the saint standing with arms raised and palms turned
toward the basilica, on a stepped tufa base, with five further figures below representing the
companions who followed him to Rome to seek Innocent III's recognition of the Rule.
https://it.wikipedia.org/wiki/Statua_di_San_Francesco_(Roma)
https://it.wikipedia.org/wiki/Esquilino_(rione_di_Roma) (rione article lists it, giving 1927)

**26. Teatro Basilica** — *theater* — piazza di Porta San Giovanni — 48 m inside
OSM `node/7056587848`, `amenity=theatre`. **Its own domain did not resolve and no second source
was found. Recommend not shipping without one.**

### 3.7 Santa Croce in Gerusalemme and the Sessorium

**27. Basilica di Santa Croce in Gerusalemme** — *historic-site* — piazza di Santa Croce in
Gerusalemme — 21–22 m inside (façade point)
The basilica's own site places itself: «si trova a Roma, **nel Rione Esquilino**, a ridosso delle
Mura Aureliane e dell'Anfiteatro Castrense, tra la Basilica di San Giovanni in Laterano e Porta
Maggiore», and notes it is one of the Seven Churches of the old pilgrimage circuit.
https://www.santacroceroma.it/ (fetched — the basilica's own site)
https://it.wikipedia.org/wiki/Basilica_di_Santa_Croce_in_Gerusalemme
**Status field caution:** the site carries a notice dated 16.04.2026 that the **Cappella delle
Reliquie is closed** for urgent works, by order of the Vicariate of Rome and the Ministry's
architectural-heritage office. The basilica itself is open; the chapel is not. A record must not
say "closed" for the basilica.
**Not extraterritorial.** It is absent from the vatican.va list of item 1–13. Do not imply otherwise.

**28. Orto monastico di Santa Croce** — *park* — inside the Anfiteatro Castrense oval
Kitchen-and-flower garden of the Cistercian monastery, recreated in **2004** to a design by the
architect **Paolo Pejrone**, on the initiative of the Associazione Amici di Santa Croce in
Gerusalemme. Elliptical space divided by two perpendicular pergola paths meeting at a central
fountain.
https://www.santacroceroma.it/ (fetched)

**29. Anfiteatro castrense** — *historic-site* — piazza di Santa Croce in Gerusalemme — 6–16 m inside
Roman amphitheatre of the early 3rd century, probably built under Elagabalus as part of the
**Sessorium** complex; elliptical, 88 × 75.80 m, area 5,239 m². It stayed in use until the Aurelian
Walls were built, which cut it in half and turned it into a forward bastion by blocking the façade
arches. Managed by the Sovrintendenza Capitolina, which marks it visitable.
https://it.wikipedia.org/wiki/Anfiteatro_castrense
http://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/anfiteatro_castrense (fetched)
**STRADDLER with Q. X Tuscolano at the wall line — see §5.**

**30. Chiesa di Santa Maria del Buon Aiuto** — *historic-site* — piazza di Santa Croce in
Gerusalemme, built against the Aurelian Walls and the Anfiteatro Castrense — 5 m inside
Oratory raised by **Sixtus IV in 1476**, as the inscription over the door records:
*Sixtus IV fundavit MCCCCLXXVI*. It depends on the basilica of Santa Croce.
https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_del_Buon_Aiuto_nell%27Anfiteatro_Castrense
**Only 5 m from the wall line. Flagged in §5.**

**31. Palazzo Sessoriano (Sessorium)** — *historic-site* — 140 m inside
Imperial residential complex begun by Septimius Severus and finished under Elagabalus, inside the
**Horti Variani** at the south-east edge of the Augustan Regio V Esquiliae, by the Aqua Claudia;
122,500 m². Under the Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma, with
guided visits by booking; the responsible officer is named as Anna de Santis.
https://it.wikipedia.org/wiki/Palazzo_Sessoriano
*The Soprintendenza's own scheda URL cited by that article now 404s; no hours were obtained.*

**32. Terme Eleniane** — *historic-site* — 172 m inside
Baths of Severan date, on the evidence of the earliest brick stamps and a dedication to Julia
Domna found on the site; named for **Helena**, mother of Constantine, who restored them after a
fire in **323–326** (the dedication is CIL VI 1136, now in the Vatican Museums). What stood was
demolished at the end of the 16th century by Domenico Fontana for Sixtus V, to open the stretch of
the strada Felice in front of Santa Croce — today's via di Santa Croce in Gerusalemme. The plan is
known from Renaissance drawings by Palladio and Giuliano da Sangallo.
https://it.wikipedia.org/wiki/Terme_Eleniane

**33. Carceres del Circo Variano** — *historic-site* — 39 m inside
Starting gates of the Circus Varianus, part of the same Sessorium complex. OSM `way/261041472`,
`access=permissive`, `wikidata=Q1092998`, `wikipedia=it:Circo Variano`.
https://it.wikipedia.org/wiki/Circo_Variano

**34. Museo nazionale degli strumenti musicali** — *museum* — Piazza Santa Croce in Gerusalemme
9/A, in the Palazzina Samoggia, entrance beside the basilica — 75–85 m inside
State museum under the Ministero della Cultura, run since December 2019 through the Direzione
Musei statali della città di Roma. Its own site gives: Tuesday–Sunday 09:30–19:30, last entry
18:30; full €6, reduced €2 (18–25, EU students only), free under 18; free the first Sunday of each
month; in the Roma Pass circuit; telephone +39 06 7014796.
https://museostrumentimusicali.cultura.gov.it/ (fetched — the museum's own site)
https://it.wikipedia.org/wiki/Museo_nazionale_degli_strumenti_musicali (15,770 visitors in 2018,
MiBAC figures)

**35. Museo storico dei granatieri di Sardegna** — *museum* — Piazza Santa Croce in Gerusalemme 7
— 146 m inside
The regimental collections were joined on 5 March 1903 in rooms of the Caserma Ferdinando di
Savoia near Termini; in 1912 a move to the Caserma Umberto I on piazza Santa Croce in Gerusalemme
was proposed, deferred by the First World War, and in 1920 the comune resolved to donate the land.
https://it.wikipedia.org/wiki/Museo_storico_dei_granatieri_di_Sardegna
**The unit's domain https://www.granatieridisardegna.it/ resolves to an unconfigured WordPress
install with default content. No hours are sourced; a record must say none are given rather than
guess.**

**36. Museo storico della fanteria** — *museum* — Piazza Santa Croce in Gerusalemme 9 —
144 m inside
Inaugurated 1959, under the Comando Brigata meccanizzata "Granatieri di Sardegna".
**Status caution:** it.wikipedia states that since 2023 the museum is closed and part of the
spaces are used for art exhibitions, citing la Repubblica (14 Jan 2025) and imuseidiroma.it. If it
ships, the `status` field and the prose must agree — an affirmative "closed" needs one of those
two sources carried explicitly.
https://it.wikipedia.org/wiki/Museo_storico_della_fanteria

**37. Museo della Basilica (Santa Croce in Gerusalemme)** — *museum* — 45 m inside
The basilica's own site has a "Museo della Basilica" section. OSM `node/13296452566` gives
`opening_hours=10:00-12:00, 16:30-18:00`. **Take the hours from the basilica's own site before
shipping, not from OSM.** The detached 13th–14th century frescoes from the oratory of Santa
Margherita are kept here.
https://www.santacroceroma.it/

**38. Oratorio di Santa Margherita** — *historic-site* — viale Carlo Felice — 11 m inside
Deconsecrated chapel set inside the fourth tower of the Aurelian Walls; converted to an oratory in
the Middle Ages, with a 13th–14th century fresco cycle of St Paul and St Margaret of Antioch,
discovered in 1932, detached, and now in the museum of Santa Croce in Gerusalemme. Known also as
the "prison of St Margaret"; a Madonna Bona lived there as a recluse in the 13th century. Restored
by Antonio Muñoz in 1914 and again in 1978.
https://it.wikipedia.org/wiki/Oratorio_di_Santa_Margherita_(Roma)
**11 m from the wall line. Flagged in §5.**

### 3.8 The eastern archaeology, along via Giolitti

**39. Tempio di Minerva Medica** — *historic-site* — via Giovanni Giolitti — 139 m inside
Not a temple: a monumental domed hall inside the precinct of a luxurious suburban residence,
probably of the early 4th century — the *horti* are argued as either the Horti Liciniani or the
Horti Pallantiani. 24 m high today, originally 32 m; 25 m wide; about 470 m². Now wedged between
the railway tracks and the blocks built for the new rione at the end of the 19th century, and
visible from trains into Termini. Under the Soprintendenza Speciale; the article records
«aperture in occasione di eventi straordinari».
https://it.wikipedia.org/wiki/Tempio_di_Minerva_Medica
*The Soprintendenza scheda URL cited by that article now 404s.*

**40. Chiesa di Santa Bibiana** — *historic-site* — via Giovanni Giolitti 154 — 196 m inside
On the site of the Horti Liciniani, near the so-called Tempio di Minerva Medica. Two traditions of
foundation: 363 by the matron Olimpina, or 467 under Simplicius per the *Liber pontificalis*.
Leo II moved the relics of the martyrs Simplicius, Faustinus and Beatrice here from the catacombs
of Generosa. Restored by Honorius III in 1224, who added a women's monastery beside it; Urban VIII
ordered the complete rebuilding in the early 17th century. Holds Bernini's statue of the saint.
https://it.wikipedia.org/wiki/Chiesa_di_Santa_Bibiana
**Website trap:** `santabibiana.it` is a day-care centre for dementia patients in Martina Franca
(Taranto) — nothing to do with the church. The parish site cited by Wikipedia is
`https://www.santabibiana.com/`, fetched but thin.
**Corpus warning:** the façade is often described as Bernini's first architectural work. That is a
sequence claim about an artist's career, not about the building's rank, but it is safer to write
that the façade and the statue of the saint are by Gian Lorenzo Bernini and stop.

**41. Sepolcri repubblicani di Via Statilia** — *historic-site* — 263 m inside
Republican tombs. OSM `way/254528627`, `wikidata=Q65174611`, sourced by the mapper to 060608.it.
http://www.sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/sepolcri_repubblicani_di_via_statilia (fetched, 5,252 chars — Sovrintendenza Capitolina's own page)

**42. Ipogeo degli Aureli** — *historic-site* — via Luigi Luzzatti — 392 m inside
Privately-held catacomb on the ancient via Labicana, found in **1919** at the junction of viale
Manzoni and via Luzzatti during work on a garage; two levels, with a fresco cycle whose reading is
still open. It is mentioned in no ancient source. Under the Pontificia commissione di archeologia
sacra; the article marks it «visitabile a richiesta».
https://it.wikipedia.org/wiki/Ipogeo_degli_Aureli

**43. Arco di Sisto V (arco Felice)** — *historic-site* — piazzale Sisto V — 31 m inside
Commemorative arch of **1585**, in the first year of Sixtus V's pontificate, marking the completion
of the **Acqua Felice** aqueduct, and built into the aqueduct itself where its final stretch runs
over the Aurelian Walls. Known also as the "arco delle pere", from the pears in Sixtus V's arms cut
in travertine beside the two smaller openings.
https://it.wikipedia.org/wiki/Arco_di_Sisto_V
**Attribution conflict:** romasegreta.it files this arch under **Castro Pretorio**
(http://www.romasegreta.it/castro-pretorio/arco-di-sisto-v.html, cited by that article), while
it.wikipedia's category and Method A both put it in Esquilino, 31 m inside. Flagged in §5.

### 3.9 Umbertine and 20th-century civic buildings

**44. Villa Altieri** — *museum* — viale Manzoni 47 — 442 m inside
Commissioned in the 1670s by Cardinal Paluzzo Paluzzi Altieri degli Albertoni, nephew of Clement X,
from the family architect **Giovanni Antonio De Rossi**, converting an old farm building into a
suburban residence. Sold 1857; bought about 1862 by Cardinal Francesco Saverio de Mérode; leased
after 1870 to the Italian state, which ran a women's prison there until 1897, then to the Dorotee
and the Figlie di Nostra Signora al Monte Calvario. Bought by the Provincia di Roma in 1975;
restored 2009–2010 as the Palazzo della cultura e memoria storica. Now houses a small museum, the
library and the historical archive of the **Città metropolitana di Roma Capitale**.
https://it.wikipedia.org/wiki/Villa_Altieri
*The Città metropolitana pages cited by that article 404 from this network; no hours are sourced.*

**45. Palazzo della Zecca di Stato** — *historic-site* — via Principe Umberto — 404 m inside
Built 1908–1911 to the design of the engineer Carlo Mongini; inaugurated by Victor Emmanuel III on
**27 December 1911** as the first State Mint of the Kingdom of Italy. It housed the Museo
numismatico della Zecca Italiana until 1962; coin production ceased in 1999; it still holds the
Scuola dell'Arte della Medaglia.
https://it.wikipedia.org/wiki/Esquilino_(rione_di_Roma), citing
https://www.ipzs.it/ext/chisiamo_zecca.html

**46. Palazzo Dante (until 2021 Palazzo delle Casse di Risparmio Postali)** — *historic-site* —
piazza Dante 25 — 163 m inside
Designed by **Luigi Rolland**; works began 1911 under the special office of the genio civile,
directed by the engineer Amerigo Pullini; inaugurated 1912 by the under-secretary for posts Augusto
Battaglieri, and enlarged after the First World War. Owned by Cassa depositi e prestiti. **Since
2019 it is the unified seat of the Italian intelligence services (DIS).**
https://it.wikipedia.org/wiki/Palazzo_Dante
https://www.sicurezzanazionale.gov.it/sisr.nsf/sede-unitaria-intelligence.html (cited by that
article and by the rione article for the May 2019 move)
**Recommend caution.** It is a working intelligence headquarters, closed to visitors, and a guide
entry that reads as an invitation is a bad idea. If shipped, `status` must not be "open" and the
prose must say plainly that it is a government building and not visitable — but note that "closed"
is an affirmative claim needing a source, and none of the fetched pages states a public access
policy. My recommendation is **do not ship**; write piazza Dante instead and name the building in
passing.

**47. Piazza Dante** — *attraction* — between via Alfieri and via Giusti — 159 m inside
Named for Dante; a monument to the poet was designed for it and never built. During the Second
World War it held one of the larger underground public air-raid shelters.
https://it.wikipedia.org/wiki/Piazza_Dante_(Roma)

**48. Villa Wolkonsky** — *historic-site* — via Ludovico di Savoia — 244 m inside
Official residence of the British Ambassador to Italy, on nearly five hectares of the Esquiline
just inside the Aurelian Walls. The grounds contain **thirty-six arches of the Aqua Neroniana**,
built by Nero as a spur off the Aqua Claudia of AD 52 to serve the Domus Aurea and the nymphaeum by
the temple of the Divine Claudius, and Roman tombs.
https://it.wikipedia.org/wiki/Villa_Wolkonsky
https://www.gov.uk/world/organisations/british-embassy-rome (fetched — the mission's own page)
**Not open to the public. Same caution as 46: no fetched source states an access policy, so the
prose should say what the place is and that no visiting arrangements are published.**

**49. Teatro Ambra Jovinelli** — *theater* — via Guglielmo Pepe 43/47 — 271 m inside
Built for the impresario Giuseppe Jovinelli; after schemes by Pietro Chiodelli and Giacomo
Radiconcini, construction began in **1906**, with **Ulderico Bencivenga** taking over as designer
in 1907; **opened 3 March 1909**. Horseshoe hall with two galleries. Ettore Petrolini got his first
important engagement here from Jovinelli in 1910. Currently programming under artistic director
Fabrizia Pompilio.
https://it.wikipedia.org/wiki/Teatro_Ambra_Jovinelli
https://www.ambrajovinelli.org/ and https://www.ambrajovinelli.org/storia/ (both fetched — the
theatre's own site; carries the current season and box-office pages)

**50. Palazzo del Freddo Giovanni Fassi** — *cafe* — via Principe Eugenio 65/67 — 380 m inside
Gelateria in a liberty-style building. The operator's own site brands itself «Dal 1880 il gelato più
amato di Roma» and carries the address, the shop pages and the *sanpietrino* and *caterinetta*
semifreddi.
https://www.gelateriafassi.com/ (fetched)
https://it.wikipedia.org/wiki/Palazzo_del_Freddo_Giovanni_Fassi
**Two corpus problems, both fatal to the obvious sentence.** (a) «il gelato più amato di Roma» and
Wikipedia's «una tra le gelaterie più antiche d'Italia» are superlatives — banned, attributed or
not. (b) **The 1880 founding year is a trading-duration claim taken from the operator's own site**
and does not publish under the rule. Wikipedia's independent citations for 1880 are Il Giornale
(2010) and the Associazione Negozi Storici di Eccellenza; a verifier should decide whether a
third-party citation rescues it. My reading is that it does not — the rule bans the claim, not the
source. Ship the address, the products and the liberty-style building; leave the year out.

### 3.10 Other churches inside the ring

**51. Chiesa di Santa Maria Immacolata all'Esquilino** — *historic-site* — via Emanuele
Filiberto 129 — 280 m inside
Built for the Frati della Carità (Padri Bigi) — works began 28 March 1901 and ran to 1914 — to the
design of the Neapolitan architect **Antonio Curri**, with the engineer Luigi Cortesi directing.
First mass 8 December 1914; consecrated by Cardinal Luigi Traglia only on **21 April 1942**, as a
plaque at the entrance records. Neo-Gothic gabled façade, twenty-one metres wide, with two flanking
towers.
https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Immacolata_all%27Esquilino

**52. Cappella di Sant'Elena all'Esquilino** — *historic-site* — via Machiavelli — 106 m inside
Built 1898–1899 to the design of **Ettore Genuini** as the church of the convent of the Franciscan
Missionaries of Mary, when their convent was enlarged, and dedicated to St Helen after the
foundress's name, Hélène de Chappotin de Neuville — as the inscription over the portal states.
Neo-Gothic; single nave with polychrome glass and a screen dividing the nuns' part of the hall
from the faithful's.
https://it.wikipedia.org/wiki/Cappella_di_Sant%27Elena

**53. Chiesa di Sant'Andrea Catabarbara** — *historic-site (vanished)* — 94 m inside
The first devotional church of St Andrew in the city, made in the second half of the 5th century
under Simplicius out of a hall of the **Basilica di Giunio Basso**, the *domus* of Junius Annius
Bassus, consul of 331, given by the Gothic general Valila. **Demolished in 1930** for the building
of the Seminario Pontificio di Studi Orientali in via Napoleone III 3; parts were incorporated into
Sant'Antonio Abate all'Esquilino.
https://it.wikipedia.org/wiki/Chiesa_di_Sant%27Andrea_Catabarbara
*Nothing survives in place. Recommend using it as a paragraph inside 14, not as a record.*

**54. Cappella di Santa Maria Addolorata all'Esquilino** — *historic-site* — 321 m inside
Listed by the rione article and carries coordinates; no body text was retrieved.
**Thin — recommend not shipping.**

---

## 4. Deliberately not carried, with the reason

- **Basilica di Santa Maria Maggiore, the Obelisco Esquilino, Piazza dell'Esquilino** — Monti's.
  Wave 1 ruled the basilica; Method A puts piazza dell'Esquilino 169 m *outside* the ring and the
  obelisk is already shipped as `monti/obelisco-esquilino-rome`.
- **Sepolcro di Eurisace** — 6 m **outside**, and it.wikipedia's own article states it stands
  «esternamente alla Porta Maggiore a Roma, **nel quartiere Q. VII Prenestino-Labicano**», even
  though the rione article lists it. Two sources against one; it is not Esquilino's.
  https://it.wikipedia.org/wiki/Sepolcro_di_Eurisace
- **Basilica sotterranea di Porta Maggiore** — 83 m outside. Its own article says
  «nel quartiere Prenestino-Labicano», and the rione article's own footnote concedes
  «Si trova nel quartiere Prenestino-Labicano». Not Esquilino's.
  https://it.wikipedia.org/wiki/Basilica_sotterranea_di_Porta_Maggiore
- **Domus Aurea, Terme di Traiano, Terme di Tito, Colle Oppio, Portico di Livia** — all 350 m+
  outside; the hill's south-west sector is Monti, as the Esquilino hill article states.
- **Terme di Diocleziano, Santa Maria degli Angeli, Palazzo Massimo** — the hill article assigns
  them to the Esquiline *hill*; they are in Castro Pretorio and already shipped there.
- **Fontana dell'obelisco Lateranense, piazza di San Giovanni in Laterano** — 21 m **outside**;
  see §5.
- **ITIS Galileo Galilei (via Conte Verde, Marcello Piacentini, 1919–22); Istituto Di Donato
  (via Nino Bixio, Augusto Antonelli, 1924–27); Liceo Pilo Albertelli (via Daniele Manin, 1879);
  Cabina idrica ACEA (via Eleniana, Stoelcker and De Vico, 1934)** — all inside the ring, all
  sourced to the rione article, none of them places a traveller visits. **Recommend not shipping.**
- **Domus di Aufidia Cornelia; Domus Romana detta dei Ritratti** — inside the ring, but OSM's only
  source for both is wikimapia. **Not shippable on that evidence.**
- **Venchi Cioccolato (Termini)** — a chain outlet. No.
- **Metro stations Vittorio Emanuele and Manzoni; Roma Laziali** — transport nodes, better as
  access lines on other records than as places.
- **Horti Lamiani, Lolliani, Maiani, Pallantiani, Tauriani, Torquatiani, Liciniani, Calyclani,
  Epaphroditiani, Spei Veteris; Necropoli dell'Esquilino; Lacus Orphei; Hercules Sullanus** — the
  Esquilino category is full of these. They are topographic entities with nothing standing and
  nothing to visit, except where a museum or a monument represents them (see 4, 39, 42).

---

## 5. Straddlers and conflicts — NOT resolved here

### 5.1 Two direct conflicts with the rulings in my brief

**(a) Santa Pudenziana.** My brief says wave 1 ruled it out of Monti as Esquilino's.
**`taken_slugs.py pudenziana` returns `monti/basilica-di-santa-pudenziana-rome` — it is shipped in
Monti.** Method A puts it **340 m outside** the Esquilino ring (via Cesare Balbo 27, well west of
via Merulana); Nominatim's `quarter` returns **Monti**; it.wikipedia does not carry it in
`Categoria:Chiese di Roma (rione Esquilino)`. Four signals to zero. **Esquilino must not take it,
and the brief's ruling should be corrected.**

**(b) Teatro Brancaccio / Palazzo Brancaccio.** My brief says the theatre was ruled out of Monti as
Esquilino's. **`taken_slugs.py brancaccio` returns `monti/palazzo-brancaccio-monti-rome`.** The
theatre is inside the palazzo complex on the **west** side of via Merulana; Method A puts the
theatre **41 m outside** and the palazzo **49 m outside**. The Esquilino hill article states the
Monti/Esquilino line *is* via Merulana. **Esquilino should not claim either. Arbitrator to rule.**

**(c) Santa Prassede.** My brief says wave 1 ruled it out of Monti as Esquilino's. It is
**unwritten** — `taken_slugs.py prassede` returns zero — but every test I can run says Monti:
Method A puts it **77 m outside** the ring (via di Santa Prassede 9/a); Nominatim's `quarter`
returns **Monti**; it.wikipedia lists it under the *hill* article, not in the rione's church
category. **I flag it rather than claim it.** If the arbitrator holds wave 1's ruling, Esquilino
can take it and the boundary note must say the ruling overrides OSM; if not, it belongs to Monti
and stays unwritten this wave.

### 5.2 Genuine boundary straddlers

**(d) Porta Maggiore.** The single hardest case. The gate sits **exactly on the line**: the
Wikipedia point tests 0 m *outside*, the OSM building relation's centroid 3 m *inside*. The rione
article claims it («fra piazzale Labicano e piazza di Porta Maggiore») while its own boundary
footnote says the rione is «separato da piazzale Labicano (Porta Maggiore)» from Q. VII
Prenestino-Labicano — i.e. the gate *is* the boundary. Q. VII is out of scope in this wave, so
nobody else can take it. **Arbitrator to rule; I lean to Esquilino by default of scope, but say so
as a preference, not a finding.**
https://it.wikipedia.org/wiki/Porta_Maggiore

**(e) Piazza dei Cinquecento.** it.wikipedia's own infobox lists the *quartiere* as
«Esquilino / Castro Pretorio» and the lead says it lies «al confine tra i rioni Esquilino e Castro
Pretorio». Method A puts the centre 95 m inside Esquilino and the station forecourt 104 m inside.
**Castro Pretorio is already shipped with 40 places and did not take it.** Recommend Esquilino,
but it is a straddler and the arbitrator should say so.

**(f) Piazza di Santa Maria Maggiore and its fountain.** The ring runs *through the square*: the
piazza's address point tests 6 m outside, the fountain point 6 m inside. Monti holds the basilica
and the obelisk. **Recommend the whole square to Monti for coherence; do not split a square between
two files.**
https://it.wikipedia.org/wiki/Fontana_di_piazza_Santa_Maria_Maggiore

**(g) The Aurelian Wall line at Santa Croce.** Anfiteatro Castrense (6–16 m), Santa Maria del Buon
Aiuto (5 m), Oratorio di Santa Margherita (11 m), Santa Croce façade (21 m) and the Museo degli
strumenti musicali (75 m) all sit against or inside the wall. Nominatim, tested on *outer*-face
coordinates, returned `suburb = Tuscolano` with no `quarter` for the first, second and fifth of
those. Inner-face points are unambiguously Esquilino, the rione article lists all five, and the
basilica's own site says «nel Rione Esquilino». **Recommend Esquilino for all five; flagged because
Q. X Tuscolano is not in this wave and cannot argue back.**

**(h) Porta Tiburtina / Porta San Lorenzo.** Nominatim on the outer face returned
`suburb = Tiburtino`; Method A on the inner face is 3–22 m inside. The rione article's own footnote
makes the walls here the Esquilino/Q. XII Tiburtino line. Same structure as (d). **Flag.**

**(i) The via Merulana frontage: Palazzo Merulana (16 m), Museo delle Illusioni (14 m),
Sant'Alfonso (47 m), Sant'Antonio da Padova (43 m).** All four are inside by Method A and all four
are within a street's width of Monti. Nominatim on the road centreline at via Merulana 253 returned
`quarter = Monti`, which is consistent with a boundary that follows the carriageway. The four
buildings are on the east frontage and should be Esquilino's, but a verifier should sanity-check
Palazzo Merulana and the Museo delle Illusioni against a street-number source, since 16 m and 14 m
is inside the error bar of an OSM ring.

**(j) The Lateran fringe.** Scala Santa (35 m inside), Oratorio del Santissimo Sacramento (22 m
inside) and the Monumento a San Francesco (45 m inside) all test Esquilino, while the Fontana
dell'obelisco Lateranense (21 m outside) and the piazza's obelisk test **Monti** — and Monti
already holds the basilica and the Lateran palace. **Wave 1 excluded the Scala Santa from Monti's
Lateran cluster and Method A independently agrees.** The Triclinio Leoniano, which the Scala Santa
article names as adjoining the building, was **not tested** — no coordinates were retrievable —
and needs a test before anyone claims it.

**(k) Arco di Sisto V.** Method A and it.wikipedia's category say Esquilino (31 m inside);
romasegreta.it files it under Castro Pretorio. Castro Pretorio is shipped and did not take it.
**Recommend Esquilino; flagged.**

---

## 6. Compliance notes for whoever writes the records

- **No designation claims anywhere.** Vincoli in Rete and the Catalogo generale were not reachable
  and nothing below asserts protection status. Note that the Santa Croce notice names the
  Ministry's «Area Funzionale Patrimonio Architettonico» as ordering the chapel closure — that is a
  works order, not a designation, and must not be written as one.
- **UNESCO.** The vatican.va extraterritoriality page asserts that all the Holy See's Roman
  extraterritorial properties are on the World Heritage list. Under the evidence_ruling **no zone
  may claim to lie inside the property**, so that sentence does not publish for the Scala Santa or
  for anything else here.
- **Superlatives found and quarantined:** «la piazza più vasta della Capitale» (Piazza Vittorio);
  «la maggiore stazione ferroviaria d'Italia», «la quinta in Europa» (Termini); «uno dei monumenti
  cristiani più insigni del Rione» (Sant'Eusebio); «uno dei mercati più suggestivi della città»
  (mercato); «il gelato più amato di Roma», «una tra le gelaterie più antiche d'Italia» (Fassi);
  «Un museo unico a Roma» (strumenti musicali). None of these may be carried, attributed or not.
- **Trading-duration:** Fassi's «Dal 1880», from the operator's own site — see 50.
- **Status fields to watch:** Museo storico della fanteria (closed since 2023 per la Repubblica);
  Cappella delle Reliquie at Santa Croce (closed per the basilica's own notice of 16.04.2026);
  Palazzo Dante and Villa Wolkonsky (working government/diplomatic buildings, no published access
  policy — say nothing is published rather than assert "closed").
- **Photographs: none this wave, `"photos": []` everywhere.** One outright photo reject noted for
  the later wave: the **Monumento a Giovanni Paolo II**, Oliviero Rainaldi, living artist. Good
  photographic subjects noted for the photo wave: the Trofei di Mario and the Porta Magica in the
  Piazza Vittorio garden, the Arco di Gallieno with Santi Vito e Modesto behind it, the Tempio di
  Minerva Medica from the Giolitti side, and the Anfiteatro Castrense from viale Castrense.
- **Sources that did not resolve from this network**, recorded here and nowhere near reader-facing
  text: 060608.it (renders client-side, no content in the HTML); santalfonsoroma.it,
  santantonioallesquilino.it, teatrobasilica.it, mercatoesquilino.it, museodellafanteria.it (DNS);
  several soprintendenzaspecialeroma.it and cittametropolitanaroma.it schede (404);
  granatieridisardegna.it (unconfigured WordPress). Where hours or a founding fact would have come
  from one of these, the record must simply not state it.
