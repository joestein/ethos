# Ripa (R. XII) — Finder's research file

Rione Ripa, Roma Capitale toponymic code **112**, numeral **R. XII**, Municipio I.
Roster record: `priv/seed_data/rome_roster.json`, zone slug `ripa`.

Finder pass. **Nothing here is a ship decision.** A separate verifier adjudicates each record and
one arbitrator rules ownership across all nine rioni of this wave. Straddlers are flagged, never
resolved here.

Compliance posture for this file:
- **No designation claims.** Vincoli in Rete and the Catalogo generale are unreachable from this
  network. No record below asserts that anything is vincolato, listed, scheduled or protected.
  Where a source used such language I have dropped it rather than paraphrased it.
- **No photographs.** Every record is `"photos": []`. Photo leads are parked in §9 for the image
  wave and are not to be used now.
- **Superlatives are quarantined.** Several official sources are full of them (Turismo Roma calls
  the Circus Maximus *"il più grande edificio per lo spettacolo dell'antichità"*, calls Ponte
  Fabricio *"il ponte romano meglio conservato"*, it.wikipedia calls the Cloaca Massima *"la più
  antica fogna ancora pienamente funzionante al mondo"*, Trattoria Sora Lella's own site says
  *"uno dei posti più belli al mondo"*). **None of these may be published, attributed or not.**
  They are recorded in §8 as a do-not-use list so the verifier can see I saw them and rejected them.
- **No research method in reader-facing text.** Provenance arguments live in this file. Where a
  fact could not be sourced I say so *here*; the page must simply be silent or say "no source
  states its opening hours".

---

## 1. Collision check — run mechanically, not from memory

```
python3 .superpowers/taken_slugs.py            # 450 places across 12 shipped files
python3 .superpowers/taken_slugs.py <fragment>
```

Searched fragments and results (all run against the live script, not a hand list):

| fragment | hits | consequence for Ripa |
|---|---|---|
| `cosmedin` | 0 | clear |
| `aventin` | 0 | clear |
| `tiberina` | 0 | clear |
| `circo` | 0 | clear |
| `bocca` | 0 | clear |
| `velabro` | 0 | clear |
| `giano` | 0 | clear |
| `pierleoni` | 0 | clear (and it is Campitelli's anyway — see §5) |
| `catena` | 0 | clear (Sant'Angelo's — see §5) |
| `marcello` | 1 — `antico-caffe-del-teatro-marcello` (campitelli) | a **café**, not the theatre. Does not touch Ripa. |
| `tempio` | 9 — all Campitelli / Colonna / Pigna / Prati | none in the Forum Boarium. Tempio di Ercole and Tempio di Portuno are unclaimed. |
| `ponte` | 5 — Prati ×3, Trastevere: `ponte-sisto-rome`, `ponte-giuseppe-mazzini-rome` | **Trastevere owns Ponte Sisto and Ponte Mazzini but neither Cestio, Fabricio, Rotto, Palatino nor Sublicio.** All five are live for this wave, subject to §4. |

**Ripa's entire core is unclaimed.** Twelve shipped rioni own nothing inside R. XII. This is
expected: Ripa was in no previous wave and Trastevere, its only shipped neighbour, stops at the
right bank.

### Inherited rulings — re-tested, not assumed

The brief says two earlier rulings matter here and that I should verify rather than inherit them.
I did, with the method in §2:

- **The Colosseum is Celio's.** My own point-in-polygon test against the OSM `Celio` and `Ripa`
  relations puts it in **Celio**, 628 m outside Ripa. Wave 1's ruling stands. Not a Ripa candidate,
  and I make no claim on it.
- **The Teatro di Marcello is Sant'Angelo's.** My test returns **Sant'Angelo**, 99 m outside Ripa.
  Wave 1's ruling stands. The Portico d'Ottavia (Sant'Angelo, 122 m out) and San Nicola in Carcere
  (Sant'Angelo, 77 m out) fall the same way. Not Ripa candidates.

---

## 2. Boundary method

Nominatim reverse geocoding worked for the first 17 lookups (`address.quarter` returned `Ripa` for
all 17) and then rate-limited hard — 429 on every subsequent call, and the cooldown did not clear.
`overpass-api.de` refuses connections from this network; **`overpass.kumi.systems` works**, as does
`www.openstreetmap.org/api/0.6`. So I built a local classifier instead of hammering a public API:

1. Overpass (kumi mirror) → all 22 rione relations, tagged `place=quarter`, `boundary=place`.
   Ripa is **relation 5454276**. All 22 resolved, so no rione is missing from the comparison set.
2. Fetched `out geom` for all 22, stitched the member ways into closed rings, and ran even-odd
   point-in-polygon locally. Also computed metres-to-nearest-Ripa-edge for every point, so
   "how close to the line is this?" is a number rather than a feeling.
3. Cross-check: the classifier reproduces all 17 Nominatim answers exactly, and independently
   reproduces both Wave 1 rulings above. Two methods, same answers.

Scale note that matters when reading the distances below: Ripa is small and thin at the north end.
A 40 m reading is genuinely near the line; a 200 m reading is comfortably interior.

I also checked the rione's own documentary boundary description. it.wikipedia's `Ripa (rione di
Roma)` article lists the border streets, and they agree with the polygon: Sant'Angelo at piazza di
Monte Savello; Campitelli at via del Teatro di Marcello, vico Jugario, via dei Fienili, via di San
Teodoro, **via dei Cerchi**; Celio at piazza di Porta Capena; San Saba at viale Aventino, piazza
Albania, via e largo Manlio Gelsomini; Testaccio at via Marmorata, piazza dell'Emporio; and the
Tiber at lungotevere Aventino and lungotevere dei Pierleoni.
https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma)

That article also states outright: *"Appartiene al rione Ripa anche l'Isola Tiberina."* See §4.

---

## 3. Candidate register

77 candidates. Grouped by the four physical clusters Ripa actually has. Every factual claim carries
the URL I fetched it from. `kind` values are drawn only from the thirteen the schema allows
(`kind_note` in the roster): there is **no** church/monument/square/bridge kind — Rome's churches,
temples, arches and bridges are `historic-site`.

Rione column = my classifier's verdict. `d` = metres to the nearest Ripa boundary edge.

### 3.1 Forum Boarium, the Velabro and piazza Bocca della Verità

**1. Basilica di Santa Maria in Cosmedin** — `historic-site` — Ripa, d=141 m
Piazza della Bocca della Verità 18. First recorded in the 6th century as *Sancta Maria in Schola
Graeca*, with the rank of diaconia; enlarged in 782 by Pope Hadrian I over the Ara Maxima of
Hercules, whose Aniene-tufa core still stands in the rear half of the church and inside which the
crypt was cut. It took its present form in the 12th century after the damage of Robert Guiscard's
invasion. The portico and the seven-storey Romanesque campanile of bifore and trifore, 34.20 m
tall with a bell of 1289, are the work of Alfano Camerario. Interior of three naves on four piers
and eighteen antique columns under 18 Corinthian capitals, 11 of them Roman. Cosmatesque pavement;
fragments of 8th- and 9th-century frescoes; schola cantorum built under Callixtus II; Gothic-
Florentine ciborium by Deodato, 1294. The name comes from the Constantinople monastery
*Kosmidìon*, invoked by the Greek corporation entrusted with the church — which is also why the
surrounding area was called Schola Graeca and this bank of the Tiber Ripa Graeca.
https://www.turismoroma.it/it/luoghi/basilica-di-santa-maria-cosmedin
Official site (Melkite Greek Catholic basilica, Patriarchal Procura): https://cosmedin.org/
Hours as published by Turismo Roma: the Divine Liturgy on Sundays at 10:30; the basilica is closed
on 1 January. Turismo Roma's Bocca della Verità page gives the visiting hours as "currently every
day 09:30–13:00 and 14:00–17:50" and tells readers to confirm on 06 6787759 or on the basilica's
own site. **OSM carries `Mo-Su 09:30-17:50`, which conflicts with the 13:00–14:00 midday break.**
Do not publish an hours line the two sources disagree on; either quote Turismo Roma's split hours
with its own caveat, or publish none.

**2. Bocca della Verità** — `attraction` — Ripa, d=142 m
In the pronaos of Santa Maria in Cosmedin **since 1632**. Marble disc roughly 1.80 m across,
probably a Roman drain cover from the reign of Tarquinius Superbus, who built the Cloaca Maxima.
Bearded male face — Jupiter, a faun or a river god — with eyes, nose and mouth pierced, flanked by
a scarab, two pincers and two wolf heads. The name dates from **1485** and attaches to the medieval
story that the mouth would bite the hand of a liar. William Wyler's *Roman Holiday* (1953) put it
into the global tourist imagination.
https://www.turismoroma.it/it/luoghi/bocca-della-verit%C3%A0
https://cosmedin.org/la-bocca-della-verita
Adjoins record 1 and shares its hours — the two physically adjoin, so that phrasing is allowed.

**3. Tempio di Ercole Vincitore** — `historic-site` — Ripa, d=95 m
Piazza della Bocca della Verità, in the Forum Boarium. Circular temple, c. **120 BC**, of marble.
Also called Ercole Invitto or Ercole Oleario. A Renaissance misattribution still has it popularly
called the Temple of Vesta, because its round plan resembles the real Temple of Vesta in the Roman
Forum.
https://it.wikipedia.org/wiki/Tempio_di_Ercole_Vincitore
https://www.turismoroma.it/it/luoghi/foro-boario
⚠ it.wikipedia adds a priority claim about it being the earliest surviving marble building in Rome.
**Do not publish it.** The date "c. 120 BC" and the material are publishable; the ranking is not.
⚠ **Identity collision — see record 20.** This building *is* the deconsecrated church of Santa
Maria del Sole. They must not both ship.

**4. Tempio di Portuno** — `historic-site` — Ripa, d=132 m
Via di Ponte Rotto, piazza Bocca della Verità. Small rectangular temple to Portunus, god of river
harbours, also known as the Tempio della Fortuna Virile. Stands in the Forum Boarium beside the
ancient Portus Tiberinus. Datable to the 4th or 3rd century BC, though the present fabric is
probably second half of the 2nd century with 1st-century-BC reworking. High podium with steps faced
in travertine slabs; four Ionic columns on the front; two travertine columns and five Aniene-tufa
half-columns on the cella walls. Byzantine-era frescoes of the life of Mary survive inside. In the
9th century it became a church — first Santa Maria de Gradellis (or de Secundicerio), from the 15th
century **Santa Maria Egiziaca**, a title it kept until **1916**, when the church was deconsecrated
and the ancient temple restored. Turismo Roma: "L'edificio è visibile dall'esterno."
https://www.turismoroma.it/it/luoghi/tempio-di-portuno
⚠ **Identity collision — see record 19.** This building *is* Santa Maria Egiziaca.

**5. Fontana dei Tritoni** — `attraction` — Ripa, d=132 m
Piazza della Bocca della Verità. First stone laid **11 August 1717**; designed by **Carlo Francesco
Bizzaccheri** for **Pope Clement XI Albani**, drawing on Bernini's Triton fountain in piazza
Barberini for both subject and manner. The main basin is an octagon with concave sides, echoing the
eight-pointed star of the Albani arms. Two kneeling tritons carved by **Francesco Moratti** hold an
oyster-shaped shell; two further Albani coats of arms sit on its outer rim. Four mascherone heads
on the basin rim were removed in the 19th century. An adjoining public trough built by the same
pope for citizens and cattle was dismantled in the early 20th century during the Tiber embankment
works and moved to lungotevere Aventino.
https://www.turismoroma.it/it/luoghi/fontana-dei-tritoni
Turismo Roma's own "Piazza Bocca della Verità" page dates the fountain to 1715 rather than 1717.
The dedicated page gives 11 August 1717 for the foundation stone. **Prefer the dedicated page and
publish the foundation-stone date, not a bare year.**

**6. Piazza Bocca della Verità** — `attraction` — Ripa, d=147 m
Occupies the ground of the Forum Boarium's ox market. Archaeological finds of 8th-century-BC Greek
ceramic and Mycenaean fragments confirm the tradition of pre-foundation contact with Greece and
Asia. The square gathers Santa Maria in Cosmedin, the Temple of Hercules, the Temple of Portunus
and the Fontana dei Tritoni. **Capital sentences were carried out here until 1868.**
https://www.turismoroma.it/it/luoghi/piazza-bocca-della-verit%C3%A0
⚠ Turismo Roma opens with "Una delle piazze più belle di Roma". **Banned. Drop it.**

**7. Foro Boario** — `historic-site` — Ripa, d=128 m
Via Luigi Petroselli. The cattle-market district between the Tiber, the Capitoline, the Palatine
and the Aventine. Anciently occupied by the Velabrum marsh, drained by the Etruscan kings in the
6th century BC with the building of the Cloaca Maxima, whose arches are still visible. The Portus
Tiberinus, ascribed to Servius Tullius in the same century, lay where the Anagrafe offices now
stand. Republican-era temples to Portunus and to Hercules Victor face the Tiber. Imperial works
include Trajanic (AD 98–117) warehouses by the river port, the Arch of the Argentarii (AD 204) and
the four-fronted arch of Janus, probably of the time of Constantius II (AD 337–361). Turismo Roma:
"Area aperta al pubblico."
https://www.turismoroma.it/it/luoghi/foro-boario

**8. Arco di Giano** — `historic-site` — Ripa, d=77 m
Via del Velabro. The last monumental building put up in the eastern Forum Boarium. The name is a
16th-century misnomer; the arch is probably the *Arcus Divi Constantini* of the 4th-century
Regionary Catalogues, built by Constantine's sons in his honour after his death. Square four-fronted
plan on four piers under a groin vault carrying a high attic; brick faced with marble, much of it
spoil. Two rows of three niches per pier originally held 48 statues; only the four female figures
on the keystones survive — Roma, Juno, and perhaps Minerva and Ceres. In the Middle Ages the
Frangipane used it as the base of a tower. Partly buried for centuries, it was fully uncovered in
**1827**, when the attic was demolished. Turismo Roma: "Visibile sempre dall'esterno."
https://www.turismoroma.it/it/luoghi/arco-di-giano
⚠ OSM carries `opening_hours=Sa 10:00-14:00` for an enclosure around it. Turismo Roma says
externally visible always. **Unresolved conflict — publish no hours.**

**9. Arco degli Argentari** — `historic-site` — Ripa, d=62 m
Via del Velabro, against the flank of San Giorgio in Velabro. Not an arch but a trabeated gateway,
erected **AD 204**, paid for by the guild of money-changers and cattle merchants (*argentarii et
negotiantes boarii*) and dedicated to Septimius Severus, Julia Domna and Caracalla. The names of
Fulvia Plautilla and Geta were chiselled out of the dedicatory inscription. In the 7th century its
eastern pier was half-swallowed by the wall of San Giorgio. Travertine base; otherwise entirely
faced in white marble; about six metres high. Acanthus scrolls and military standards on the piers,
Victories and eagles on the capitals, sacrifice scenes, soldiers and barbarian prisoners; the
principal reliefs inside show Severus and Julia Domna on one side and Caracalla on the other, with
Geta, Plautilla and probably Plautianus erased under the *damnatio memoriae*. The many drill holes
in the monument are traditionally ascribed to medieval treasure-hunters.
https://www.turismoroma.it/it/luoghi/arco-degli-argentari
Adjoins record 10; "adjoins" is factual here, not proximity hand-waving.

**10. Chiesa di San Giorgio in Velabro** — `historic-site` — Ripa, d=49 m
Via del Velabro. Catholic church in rione Ripa, the result of a 9th-century enlargement of an
earlier diaconal building, much altered since. Stands by the so-called Arch of Janus and
immediately against the Arch of the Argentarii, on the piazzetta della Cloaca Massima. It lies
within the parish of Santa Maria in Portico in Campitelli and is a rectory entrusted to the Order
of the Holy Cross; it is the seat of the diaconate of San Giorgio in Velabro, whose cardinal
deacons have included the future popes Boniface IX (1381–1385) and Martin V (1406–1417), and
St John Henry Newman (1879–1890). Station church of the Thursday after Ash Wednesday, made so by
Pope Gregory II (715–731).
https://it.wikipedia.org/wiki/Chiesa_di_San_Giorgio_in_Velabro
⚠ Turismo Roma links a page for this church from its Foro Boario and Arco degli Argentari pages,
but every slug I tried 404s. No opening hours from an official source. **Publish none.**

**11. Cloaca Massima** — `historic-site` — Ripa, d=57–65 m (outfall and course)
Built at the end of the **6th century BC** under the last kings; Tarquinius Priscus is the king
credited with formalising it. It used Etruscan vaulted-arch engineering. It rises in the Suburra
and runs by the Argiletum, the Forum, the Velabro and the Forum Boarium to discharge into the Tiber
by Ponte Emilio. Turismo Roma's Ponte Palatino page notes it is **still functioning**, on the left
side of that bridge at lungotevere Aventino.
https://it.wikipedia.org/wiki/Cloaca_Massima
https://www.turismoroma.it/it/luoghi/ponte-palatino
⚠ it.wikipedia's "la più antica fogna ancora pienamente funzionante al mondo" is **banned**.
"Still in use" is a fact and is publishable; the ranking is not.

**12. Casa dei Crescenzi** — `historic-site` — Ripa, d=141 m
Via Luigi Petroselli, at the corner with via di Ponte Rotto; Turismo Roma places it explicitly "nel
Rione Ripa", facing the Temple of Portunus. Aristocratic house of the **11th–12th century**. A long
inscription on its side elevation records that it was built "not for vainglory but to renew the
ancient dignity of Rome" by Nicola, son of Crescenzio and Teodora, for his son Davide; the position
let the family watch traffic on the Tiber and across Ponte Emilio, on which they levied a toll. Two
storeys, of which the ground floor and part of the upper survive, incorporating spoil from Roman
buildings — volutes, coffers, putti, sphinxes. Also known as "Tor Crescenzia", as the "Casa di Cola
di Rienzo" and as the "Casa di Pilato". Abandoned in the 15th century and later used as a stable
and hayloft; bought by the papal government in the later 19th century, ceded to the Comune, and
**since 1939** the seat of the Centro di Studi per la Storia dell'Architettura, founded by Gustavo
Giovannoni. The Centro's own site dates the handover precisely: **25 February 1939**, after
restoration by G. Petrignani. Library and archive open **by appointment only**, by email at least a
week ahead. Tel 06 6798075.
https://www.turismoroma.it/it/luoghi/casa-dei-crescenzi
https://www.cssar-casadeicrescenzi.it/storia/
⚠ Turismo Roma calls it "la più antica casa post-antica conservata in città". **Banned.** The
11th–12th-century date is publishable on its own.

**13. Palazzo dell'Anagrafe** — `historic-site` — Ripa, d=77 m
Via Luigi Petroselli 50. Designed by **Ignazio Guidi, Cesare Valle and Vincenzo Fasolo** (Fasolo
working on Valle's drawings) for the Governatorato di Roma, on the site of the hospice of Santa
Galla and its old church. The Forum Boarium quarter, medieval in origin, was demolished in **1936**
and replaced with public-administration buildings.
https://www.turismoroma.it/it/luoghi/palazzo-dellanagrafe
it.wikipedia gives the construction dates as **1936–39** and names the contractor as Impresa Tudini
& Talenti: https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma)
The Casa dei Crescenzi study centre adds that Valle designed the adjoining municipal office
buildings in 1936 with brick elevations chosen to chime with the medieval house:
https://www.cssar-casadeicrescenzi.it/storia/

**14. Chiesa di San Giovanni Decollato** — `historic-site` — Ripa, d=132 m
Via di San Giovanni Decollato. Catholic church of Rome in rione Ripa, on the street of the same
name. Seat of the Arciconfraternita di San Giovanni Decollato, whose members attended the condemned
to the scaffold — the executions of record 6 took place a short distance away in the same square.
https://it.wikipedia.org/wiki/Chiesa_di_San_Giovanni_Decollato_(Roma)
⚠ Thin. it.wikipedia's lead is one sentence and Turismo Roma has no page. Detail beyond the
location and the confraternity is not sourced. Flagged as low-yield — see §7.

**15. Museo della Camera storica** — `museum` — Ripa, d≈60 m
**Via di San Giovanni Decollato 22**, first floor of the archconfraternity's palace beside the
church of San Giovanni Decollato. Holds relics documenting the confraternity's activity.
https://it.wikipedia.org/wiki/Museo_della_Camera_storica
⚠ No opening hours from any source I reached. **Publish none.** it.wikipedia is the only source;
it names a street number, which is a locational fact and publishable, but the museum's own site was
not found. Verifier should decide whether one aggregator sentence carries a museum record.

**16. Chiesa di Sant'Eligio dei Ferrari** — `historic-site` — Ripa, d=74 m
Via di San Giovanni Decollato. Catholic church of the historic centre, in rione Ripa. Church of the
blacksmiths' guild — the "ferrari" of the title.
https://it.wikipedia.org/wiki/Chiesa_di_Sant'Eligio_dei_Ferrari
The rione article also lists a **Museo della confraternita di Sant'Eligio dei Ferrari** attached to
it: https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma)
⚠ Thin, same problem as record 14.

**17. Chiesa di Sant'Omobono** — `historic-site` — Ripa, d=25–30 m ⚠ near the Campitelli line
Vico Jugario, at the foot of the Capitoline, in rione Ripa.
https://it.wikipedia.org/wiki/Chiesa_di_Sant'Omobono_(Roma)
⚠ Vico Jugario is itself the Ripa/Campitelli border (§2). My classifier puts the church body inside
Ripa, but a test point in the middle of vico Jugario returned **Campitelli at 0.3 m from the line**.
This is as close to the boundary as anything in the rione. **Flagged for the arbitrator.**

**18. Area sacra di Sant'Omobono** — `historic-site` — Ripa, d=40–42 m
Archaeological area discovered in **1937** by the church of Sant'Omobono at the foot of the
Capitoline. Its excavation produced evidence of exceptional value for archaic and republican Rome.
It contains **two temples: the temple of Fortuna and the temple of Mater Matuta.**
https://it.wikipedia.org/wiki/Area_di_Sant'Omobono
OSM records it as "Templi dell'Area Sacra di Sant'Omobono" at 41.89064, 12.48128.
⚠ Same boundary proximity as record 17. Flagged together.

**19. Chiesa di Santa Maria Egiziaca (deconsecrated)** — Ripa, d=128 m
Deconsecrated church in rione Ripa, piazza Bocca della Verità.
https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_Egiziaca
🚨 **DUPLICATE OF RECORD 4.** This is the same physical building as the Tempio di Portuno: Turismo
Roma states the temple was the church Santa Maria Egiziaca from the 15th century until 1916, when
it was deconsecrated and the temple restored. Shipping both would put one building in the corpus
twice. **Recommend: ship record 4 (Tempio di Portuno) and carry the church phase as a sentence
inside it. Do not create record 19.**

**20. Chiesa di Santa Maria del Sole (deconsecrated)** — Ripa, d=94 m
"Era una chiesa di Roma, nel rione Ripa, in piazza Bocca della Verità, **ricavata nel tempio di
Ercole Vincitore**. Con il recupero del monumento antico la chiesa è stata sconsacrata."
https://it.wikipedia.org/wiki/Chiesa_di_Santa_Maria_del_Sole_(Roma)
🚨 **DUPLICATE OF RECORD 3**, on the same reasoning. **Recommend: ship record 3 only.**

**21. Insula Volusiana** — `historic-site` — Ripa, d=86 m
Roman apartment-block remains at 41.89025, 12.48145, tagged `historic=archaeological_site` in OSM.
Overpass query against relation 5454276 bbox, node/way tags read 2026-09-02.
⚠ **OSM is my only source.** No official page found. Weakest evidential footing in this file
alongside record 27's address. Flagged in §7.

---

### 3.2 The Circus Maximus and the Valle Murcia

**22. Circo Massimo** — `historic-site` — Ripa, d=63–142 m across the arena
Valle Murcia, the valley between the Palatine and the Aventine. 600 m long by 140 m wide. Under the
Tarquins the valley was used for chariot racing; a masonry circus proper came only with Julius
Caesar. Racing teams ran under colours — green, blue, red, white — and the crowd divided on the
terraces by the colour of their favourites. The space also served triumphs, processions and public
executions. Repeatedly destroyed by fire and rebuilt almost entirely under **Trajan**, to which
phase most of the visible structures belong. Constantius II raised a giant obelisk here in
**AD 357**; it is now at the Lateran. The circus stayed in use into the first decades of the 6th
century, then became farmland, and in the modern period the site of gasworks, warehouses,
manufactories, workshops and housing until the early 1900s and the *passeggiata archeologica*.
Investigations **concluded in 2016** by Roma Capitale and the Sovrintendenza Capitolina, with
technical support from Zetema Progetto Cultura, opened new visitor routes with lighting. Visitors
can explore the galleries that led to the cavea and follow the ancient paving past rooms that held
shops, inns and small offices. 1930s excavations brought up much of the hemicycle and the remains of
the **Arco di Tito** at this end.
https://www.turismoroma.it/it/luoghi/circo-massimo
https://www.turismoroma.it/it/luoghi/la-torre-della-moletta-e-larea-archeologica-del-circo-massimo
https://www.sovraintendenzaroma.it/content/circo-massimo
⚠ Turismo Roma's "il più grande edificio per lo spettacolo dell'antichità e uno dei più grandi di
tutti i tempi" is **banned**. The measured 600 × 140 m is a measurement, not a superlative, and is
publishable.
⚠ **Boundary, and it is not clean.** Seven test points across the arena: NW corner Ripa (d=89),
centre Ripa (d=63), SW corner Ripa (d=133), SE corner by the Torre della Moletta Ripa (d=69),
via dei Cerchi kerb Ripa (d=60), viale Aventino kerb Ripa (d=142), **NE corner Campitelli (d=24)**.
The overwhelming majority of the monument is Ripa's, consistent with the documentary border running
along via dei Cerchi, but the north-eastern tip toward piazza di Porta Capena crosses into
Campitelli. **Flagged for the arbitrator: a Ripa/Campitelli straddler that Ripa should win on
area, but I am not the one to rule it.**

**23. Circo Maximo Experience** — `attraction` — Ripa, d=28 m ⚠ near the San Saba line
Ticket point on viale Aventino at the circus. Augmented- and virtual-reality tour of the circus in
its historical phases, using see-through visors and stereo headsets included in the ticket. Route
of about **40 minutes**, in eight languages — Italian, English, French, German, Spanish, Russian,
Chinese, Japanese — with the voices of **Claudio Santamaria and Iaia Forte**. Eight stops. Tickets:
**full €12.00, reduced €10.00, family €22.00** (two adults plus under-18s, bookable only through
060608 or a Tourist Infopoint). Tickets are also sold on site. Arrival 15 minutes before the booked
slot is advised; no refund or reslotting for latecomers.
https://www.circomaximoexperience.it/
https://www.turismoroma.it/it/luoghi/circo-massimo
⚠ The site's opening-hours block is behind a "vedi info e orari" link I did not resolve to a
concrete timetable. **Publish the prices and the 40-minute route length; publish no hours.**
Note: "40 minutes" is the published length of a guided route, which is a fact about the product,
not a trip duration invented by us. If the verifier reads the no-trip-durations rule as covering
this too, drop it.

**24. Torre della Moletta** — `historic-site` — Ripa, d=67 m
Inside the Circus Maximus archaeological complex. Also called *Turris in Capite Circi* or *Turris
de Arco*. Named for a mill driven by the water of the Fosso di San Giovanni. Property of the
**Frangipane from at least 1145**. Square plan, built of small tufa blocks with chips of limestone
and flint and irregular brick courses; it stood among modest structures and belonged to a system of
fortifications **demolished in 1943**. Turismo Roma dates its construction to the **12th century**
and records that restoration of the ancient masonry and a consolidation project were carried out;
an internal stair now reaches the upper floor, a viewpoint over the archaeological area.
https://www.turismoroma.it/it/luoghi/la-torre-della-moletta-e-larea-archeologica-del-circo-massimo
https://it.wikipedia.org/wiki/Torre_della_Moletta

**25. Mitreo del Circo Massimo** — `historic-site` — Ripa, d=35 m ⚠ near the Campitelli line
Near the Tiber end of the Circus Maximus, on the edge of the Forum Boarium, beneath a building on
**via dell'Ara Massima**. Also called the Mitreo Pantanella, because it came to light during the
1930s demolition and clearance works around the Pantanella plant.
https://it.wikipedia.org/wiki/Mitreo_del_Circo_Massimo
https://it.wikipedia.org/wiki/Ex_Pastificio_Pantanella
⚠ No opening hours from any source I reached. Do not invent them.

**26. Ex Pastificio Pantanella** — `historic-site` — Ripa, d=72 m
Via dei Cerchi, at the north-west end of the Circus Maximus toward the Tiber, in rione Ripa. Built
**1878–1881** on the initiative of **Michelangelo Pantanella**, engineer **Pio Scarselli**, to hold
the offices and ovens of the Società dei Molini e Pastificio Pantanella. At the time the whole
Circus Maximus valley still held industrial plant, including the gasworks. The firm moved to via
Casilina in **1929**. The via dei Cerchi works were then restructured as the *Palazzo dei Musei di
Roma*, housing the Museo dell'Impero romano (opened **9 June 1929**) and the Museo della Città di
Roma (opened **21 April 1930**); the building closed in **1939** and in 1952 the two collections
went to the Museo della civiltà romana at EUR and the Museo di Roma at Palazzo Braschi. **Since
1931** the rear of the building, facing the Circus, has held the costume and scenery stores and some
technical services of the **Teatro dell'Opera di Roma**. It now houses Roma Capitale's Dipartimento
Sviluppo Economico, Attività Produttive e Agricoltura. Restoration and reuse projects are approved
with completion expected in **2026**.
https://it.wikipedia.org/wiki/Ex_Pastificio_Pantanella
⚠ "la prima fabbrica di Roma" appears in the source. **Banned as a priority claim.**

**27. Rhinoceros — Fondazione Alda Fendi** — `museum` — Ripa, d=90 m
**Via del Velabro 9, 00186 Roma** per its own site's contact block and page title. Gallery
"established in Roma by Alda Fendi", with a restaurant and apartments in the same complex.
Gallery +39 340 6430435, gallery@rhinocerosroma.com; apartments +39 06 6784467; restaurant contact
eventi@retro-bottega.com. Operating company Agrippina S.R.L.
https://www.rhinocerosroma.com/
⚠ **Address conflict.** OSM records the same operation at **Via dei Cerchi 19-23**. Both streets are
inside Ripa on my classifier, so the rione is not in doubt, but the street number is. **Publish the
official site's address (via del Velabro 9) and nothing else.** Under the corpus rule, the official
site establishes identity, location and hours — so via del Velabro 9 wins over the aggregator.
⚠ No hours on the site I fetched. Publish none.

**28. Monumento a Giuseppe Mazzini** — `historic-site` — Ripa, d=214 m
Piazzale Ugo La Malfa, on the Aventine slope facing the Circus Maximus. Sculptor **Ettore Ferrari**;
the work spans **1922–1949**, bronze and marble. Proposed to the Chamber of Deputies in **1887** and
again in **1890** under Crispi; the commission went to Ferrari in **1902**; he presented a maquette
in 1905 and in **1911** removed the Doric tempietto that would have crowned it. The revised design
was approved in **1914** with the Aventine slope chosen as its site; the first stone was laid in
**1922**, but work slowed under Fascism's hostility to Freemasonry — Ferrari and Mazzini were both
Masons. At Ferrari's death in **1929** the statues and groups were finished. In **1934** the new via
del Circo Massimo opened with piazzale Romolo e Remo, today **piazzale Ugo La Malfa**, where the
broad travertine-benched exedra around the future monument was built. Work resumed in **1948** under
the sculptor's son Gian Giacomo Ferrari and the sculptor Ettore Guastalla. Inaugurated **2 June
1949**, the centenary of the Roman Republic of 1849. A high quadrangular base carries a continuous
high-relief frieze **27 m** long on three sides; the rear drum bears medallions of Pisacane, Mameli,
Campanella, Saffi, Quadrio, Alberto Mario and Jessie White, Rosolino Pilo and Adriano Lemmi. The
seated bronze Mazzini on top is **5 m** tall. Restored 1999–2000.
https://it.wikipedia.org/wiki/Monumento_a_Giuseppe_Mazzini_(Roma)

**29. Piazzale Ugo La Malfa and the Belvedere Romolo e Remo** — `attraction` — Ripa, d=138–220 m
The terrace laid out in 1934 as piazzale Romolo e Remo (record 28) overlooking the Circus Maximus
and the Palatine. Turismo Roma describes the view from here: the Circus's present garden layout
reads its plan — the grassed slope for the terraces, the beaten earth for the track, the long
central bed for the spina — with the Domus Augustana on the Palatine above.
https://www.turismoroma.it/it/luoghi/aventino
OSM records the viewpoint as "Belvedere Romolo E Remo" at 41.88570, 12.48496.
⚠ Possible merge with record 28; they occupy the same terrace. Verifier's call.

---

### 3.3 The Aventine

**30. Basilica di Santa Sabina all'Aventino** — `historic-site` — Ripa, d=189 m
Piazza Pietro d'Illiria 1. Founded **425** by **Peter, a priest of Illyria**, on an earlier *Titulus
Sabinae*. Restored by Leo III and then Eugene II, who added the schola cantorum. In the 10th century
its command of the river made it a fortified residence, of the Crescenzi and then the Savelli. In
**1219** Honorius III gave the church and part of the palace to **St Dominic**, founder of the
Dominicans, who lived and worked here; the campanile and cloister date from then. In **1587**
Domenico Fontana transformed it for Sixtus V; in the early 20th century **Antonio Muñoz** stripped
the Baroque additions and returned it to its medieval appearance. Arcaded façade behind an atrium
on four antique marble and four granite columns, gathering stone fragments, imperial-era sarcophagi
and remains of ancient screens. The central portal has a classical marble surround and **cypress-
wood doors carved in relief with Old and New Testament scenes**. Interior of three naves on
**twenty-four fluted Corinthian columns**. Of the original 5th-century decoration only a great
mosaic band survives, with an inscription in gold letters on blue naming Peter of Illyria and Pope
Celestine I. To the right of the wooden door a small column marks where St Dominic is said to have
prayed at night, topped by a black basalt stone, probably a Roman weight.
https://www.turismoroma.it/it/luoghi/basilica-di-santa-sabina-allaventino
Official site: https://basilicasantasabina.it/
**Hours, from the basilica's own site** (`/orari/`, read 2026-09-02): Liturgy — Sunday 08.00 Mass,
11.00 Mass, 19.15 Vespers; Monday to Saturday 07.15 Lauds and Mass, 19.15 Office of Readings and
Vespers. Visiting — **Sunday to Monday 12.00–19.00, Tuesday to Saturday 08.00–19.00**, with days of
precept running as Sundays. **Entry is free and no booking is needed.** Visits are not permitted
during liturgical celebrations. **The excavations are not accessible.**
https://basilicasantasabina.it/orari/
⚠ Turismo Roma says the basilica "rappresenta il perfetto esempio di basilica cristiana del V
secolo". That is an evaluative superlative in effect. **Drop it.**
Also on site: the Dominican convent, OSM "Convento Santa Sabina", piazza Pietro d'Illiria 1 — the
order's general curia. Not separately sourced beyond OSM; see §7.

**31. Giardino degli Aranci (Parco Savello)** — `park` — Ripa, d=181–217 m
Piazza Pietro d'Illiria, on the Aventine, in the ground of the **Savelli fortress of the late 13th
century** beside Santa Sabina, itself raised on a 10th-century Crescenzi castle. The medieval walls
of the fortress now enclose the small rectangular garden; the belvedere over the river gives a view
from the Tiber bend to St Peter's. The orange trees that give it its name commemorate St Dominic,
who founded the convent here in the 13th century; the orange tree by which he preached is kept in
the cloister of Santa Sabina and is still visible through a hole in the wall of the church portico.
The park, symmetrical about a central axis aligned on the belvedere, was laid out in **1932** to the
design of the architect **Raffaele De Vico**. The traces of the castle's towers and drawbridge are
legible in the enclosing wall opposite Santa Sabina's flank and apse; the walls also carry marks of
a late-16th-century intervention by **Domenico Fontana** for Sixtus V. Of the 13th-century castle
only some granaries and underground stores remain; the building itself was almost entirely
demolished in **1613**.
https://www.turismoroma.it/it/luoghi/parco-savello-o-giardino-degli-aranci
Area, from it.wikipedia: about **7,800 m²**: https://it.wikipedia.org/wiki/Giardino_degli_Aranci
⚠ No opening hours from an official source. OSM records `07:00-sunset` for the adjoining Salita
delle Pendici dell'Aventino, not for the garden. **Publish no hours** — or, honestly, "No source
states its opening hours, so none are given here."

**32. Basilica dei Santi Bonifacio e Alessio all'Aventino** — `historic-site` — Ripa, d=167–169 m
Piazza di Sant'Alessio. Built **between the 3rd and 4th centuries**, at first dedicated to St
Boniface; in **986** St Alexis was added to the title. Rebuilt in **1217**, when the relics of the
two saints were placed under the high altar. The present appearance comes from works begun before
the **1750** jubilee to the design of **Giovanni Battista Nolli (1701–1756)**, reworked by **Tommaso
De Marchis (1693–1759)**; further work between **1852 and 1860** by the Somaschi Fathers, to whom
Pius IX had given the basilica. De Marchis's façade is neo-cinquecentesco; to its right stands the
**13th-century campanile of five orders with paired bifore**. The cloister has granite columns taken
from ancient buildings. Entry is through a medieval four-sided portico. Three naves on piers with
fluted pilasters and Corinthian capitals. Against the inner façade, in a glass case held by angels
and putti, is the wooden staircase under which St Alexis is said to have lived. Vault of the central
nave painted by **Michele Ottaviani**; apse and crossing pendentives by **Carlo Gavardini**. The
Romanesque crypt holds relics of **St Thomas Becket** and a column said to be the one to which St
Sebastian was bound.
https://www.turismoroma.it/it/luoghi/basilica-dei-santi-bonifacio-e-alessio-allaventino
⚠ No hours sourced. Publish none.

**33. Giardino di Sant'Alessio and Parco di Sant'Alessio** — `park` — Ripa, d=153–167 m
Two adjoining green spaces by the basilica of records 32, OSM `leisure=garden` "Giardino di
Sant'Alessio" (41.88404, 12.47888) and `leisure=park` "Parco di San Alessio" (41.88315, 12.47803).
The rione article lists a "Giardino Storico di sant'Alessio" among Ripa's natural areas:
https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma)
⚠ OSM plus the rione list only. No official Roma Capitale page reached. §7.

**34. Piazza dei Cavalieri di Malta** — `attraction` — Ripa, d=157–166 m
Laid out by **Giovanni Battista Piranesi in 1765** — engraver, archaeologist and architect — who
also designed the piazza in front of the priory. Turismo Roma's Aventine page starts its panorama
walk here.
https://www.turismoroma.it/it/luoghi/aventino
https://www.turismoroma.it/it/luoghi/parco-savello-o-giardino-degli-aranci

**35. Villa del Priorato di Malta and the keyhole** — `attraction` — Ripa, d=117–166 m
Piazza dei Cavalieri di Malta 3–4. Complex of buildings and garden on the Aventine; historic seat
of the Grand Priory of Rome of the Knights of Malta, today the Sovereign Military Order of Malta.
Institutional seat of the Order and of the Grand Prior of Rome, and home to the Order's **embassy
to the Italian State**. it.wikipedia records that it **"gode del diritto di extraterritorialità dal
1869."** The hole in the portal at **number 3** — the celebrated keyhole — frames, at the end of an
avenue of trees, the dome of **St Peter's**.
https://it.wikipedia.org/wiki/Villa_del_Priorato_di_Malta
https://www.turismoroma.it/it/luoghi/aventino
https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-del-priorato
Visitor contact given by Turismo Roma: 06 67581398, visitorscentre@orderofmalta.int, and
https://www.ordinedimaltaitalia.org/gran-priorato-di-roma
🚨 **LEGAL-STATUS FLAG for the verifier.** This is **not** a Lateran Treaty property, and ruling 2's
Art. 15 / Art. 16 machinery does not apply to it. The SMOM is a separate sovereign subject and its
extraterritoriality here is a **19th-century Italian concession, from 1869**, not the 1929 treaty.
The record must therefore:
  • say the villa **stands on the Aventine in rione Ripa** — it does, on my classifier, 117–166 m
    inside the line, and Turismo Roma routes its Aventine walk through it;
  • state its status **as its own sources state it** — seat of the Grand Priory, the Order's embassy
    to Italy, holding extraterritorial right since 1869;
  • **never** describe it as "in the Vatican", "Vatican territory", or as a Lateran Treaty property.
The keyhole itself is publicly viewable from the piazza and carries no such difficulty.

**36. Chiesa di Santa Maria del Priorato** — `historic-site` — Ripa, d=126 m
Piazza dei Cavalieri di Malta 4. Belongs to the Sovereign Order of Malta. In **1761** Piranesi
dedicated his treatise *Della Magnificenza ed Architettura dei Romani* to the Rezzonico; in **1764**
Cardinal **Giovanni Battista Rezzonico**, formerly Grand Prior of the Order, commissioned him to
renew the church, the villa gardens and the piazza in front. In **1765** Piranesi made it one of the
earliest works in the neoclassical manner, original in the whole and in its decorative detail. He
recast the church as a funerary chamber honouring the Grand Priors and Grand Masters of the Order,
mixing Egyptian, Etruscan and Roman iconography — sarcophagus, serpent, skull, inverted torches,
with the crowned double-headed eagle of the Rezzonico arms. Single-order façade of four fluted
pilasters with rich capitals, portal under an oculus and triangular tympanum; Latin-cross interior
with side niches and apse under a stuccoed vault. **Restoration in 2017** recovered the original
colour — white stuccoes, a soft ochre — by removing dust, deposits and candle soot.
https://www.turismoroma.it/it/luoghi/chiesa-di-santa-maria-del-priorato
⚠ Turismo Roma calls the keyhole view "la più famosa e suggestiva vista di San Pietro". **Banned.**

**37. Chiesa di Sant'Anselmo all'Aventino and the Badia Primaziale** — `historic-site` — Ripa,
d=96–111 m
Piazza dei Cavalieri di Malta. Church of Rome in rione Ripa; with the attached monastery it forms
the **Badia Primaziale** of the Benedictine order.
https://it.wikipedia.org/wiki/Chiesa_di_Sant'Anselmo_all'Aventino
The Collegio's own site: Sant'Anselmo is the **seat of the Benedictine Confederation** and holds the
**Curia of the Abbot Primate**; about **90 monks and religious from over 30 countries** live here,
studying at the Ateneo or other Roman universities. The basilica "si trova sul Colle Aventino,
accanto alla Piazza dei Cavalieri di Malta" and offers a quiet place of prayer, liturgical
celebration and chant. Divine Office in Latin with traditional Gregorian chant, daily Mass, monthly
adoration.
https://www.collegiosantanselmo.com/

**38. Pontificio Ateneo Sant'Anselmo** — `historic-site` — Ripa, d≈95–111 m
Catholic university institution in Rome, dependent on the Holy See, at the Badia Primaziale di
Sant'Anselmo, **built between 1892 and 1900**.
https://it.wikipedia.org/wiki/Pontificio_ateneo_Sant'Anselmo
⚠ This is a Holy See institution standing on Italian soil in Ripa. It is **not** an extraterritorial
Lateran property on any source I read, and the record must not imply it is. If the verifier wants
the point settled, `scope-vatican-and-extraterritorial.md` holds the wave's list; I did not find
Sant'Anselmo on it and did not go looking beyond that.
⚠ Probably merges into record 37. Verifier's call.

**39. Il Negozio Benedettino** — `shop` — Ripa, d=135 m
Monastery shop at Sant'Anselmo, 41.88266, 12.47819. OSM `shop=gift`, `opening_hours=Tu-Sa
09:00-19:00; Su 18...` (the Sunday value is truncated in the OSM tag itself).
⚠ **OSM only; no official site found; the hours string is malformed at source.** Do not publish the
hours. §7.

**40. Chiesa di Santa Prisca** — `historic-site` — Ripa, d=208–210 m
**Via di Santa Prisca 11.** Stands where tradition puts the earliest Christian worship on the
Aventine: the *titulus Aquilae et Priscillae*, the parents of St Prisca, baptised by St Peter at
thirteen and a 1st-century martyr; the same tradition places both Peter and Paul here. In the 3rd
century, under Pope Eutychian, her body was found and the site dedicated to her. The hagiography has
her imprisoned under Claudius for refusing to venerate Apollo, scourged, and condemned to the beasts
**in the Circus Maximus**, where the lions lay at her feet; thrown on a pyre and unharmed, she was
finally beheaded at the tenth milestone of the via Ostiense. After several restorations, one
following the devastation by Robert Guiscard's Normans in **1084**, it took its present form in
**1599**.
Mass times published by Turismo Roma — winter: weekdays 08:00 and 18:00, Sundays and feasts 08:00,
10:30, 12:00, 18:00; summer: weekdays 08:00 and 19:00, Sundays and feasts 08:00, 10:30, 19:00.
Tel 06 5743798. Parish site: https://www.santaprisca.it/
https://www.turismoroma.it/it/luoghi/chiesa-di-santa-prisca

**41. Mitreo di Santa Prisca** — `historic-site` — Ripa, d≈208 m
**Via di Santa Prisca 8**, beneath the church. Found by chance in **1934** by the Augustinian
Fathers. Built into the walls of two earlier buildings, one of the late 1st century AD and one of
the 2nd with two aisles, over which the church was later raised. The mithraeum itself dates to the
**3rd century AD**: a long rectangular main room for the ritual banquet, preceded by two niches
that held Cautes and Cautopates, the mithraic genii of dawn and dusk — only the marble Cautes with
raised torch survives. In the end wall a large niche holds Mithras killing the bull and a reclining
Saturn built of amphora fragments faced in gilded stucco. **An inscription shows the mithraeum was
already in use in AD 202.** The side walls are frescoed with the sacred procession of the cult's
servants bearing offerings; another niche in the end wall is decorated with seven concentric circles
for the planetary spheres. It was violently destroyed around **AD 400**, probably by Christians,
before the church was built.
https://www.turismoroma.it/it/luoghi/mitreo-di-santa-prisca
Turismo Roma's status line: **"Visite temporaneamente sospese. Verificare il sito ufficiale."**
Official: https://cultura.gov.it/luogo/mitreo-di-santa-prisca
🚨 **`status` field must agree with the prose.** If this ships, the record's own text must say
visits are suspended and the status field must match. Do not publish an open/hours line.
⚠ cultura.gov.it was not reachable from this network in my pass (the beniculturali.it root timed
out). The suspension line is quoted from Turismo Roma, which I did fetch.

**42. Chiesa di San Vincenzo de Paoli all'Aventino** — `historic-site` — Ripa, d=123 m
Via di Santa Maria in Cosmedin. Church of Rome in rione Ripa.
https://it.wikipedia.org/wiki/Chiesa_di_San_Vincenzo_de_Paoli_all'Aventino
⚠ Thin — one sourced sentence. §7.

**43. Roseto di Roma Capitale** — `park` — Ripa, d=248–290 m
**Via di Valle Murcia 6**, on the Aventine slope above the Circus Maximus. Ground given to flowers
since the 3rd century BC — Tacitus in the *Annales* records a temple of the goddess **Flora**, whose
*floralia* were held in spring in the Circus Maximus. Under gardens and vineyards through the 16th
century; in **1645** it became the **Orto degli Ebrei**, with a small cemetery for the Jewish
community. From **1934**, when that cemetery was moved to the Verano, the city plan designated the
area a park; it lay uncultivated until **1950**, when it became the new municipal rose garden. In
thanks to the Jewish community for allowing the garden on a sacred site, a stele recording the
earlier use was placed at the entrance, and the paths dividing the beds in the collection area were
laid out **in the shape of the menorah**. About **1,100 species** of rose from around the world,
including China and Mongolia — among them *Rosa chinensis viridiflora* with green petals, *Rosa
chinensis mutabilis*, which changes colour over days, and the ill-smelling *Rosa foetida*. The lower
and smaller section holds the roses entered for the **Premio Roma** and the collection of past
winners since the prize's first edition in **1933** on the Colle Oppio.
https://www.turismoroma.it/it/luoghi/roseto-comunale
**Opening**, per Turismo Roma: the Roseto generally opens for the spring flowering from late April
to May and again in the autumn in October; the calendar is set each year. **Publish it as a seasonal
opening pattern, not as fixed hours.** OSM carries a stale 2023-dated hours tag — ignore it.
⚠ Turismo Roma opens with "Uno straordinario spettacolo…" and calls the Premio "prestigiosa".
**Drop both.**

**44. Scatola Archeologica di Piazza Albania** — `museum` — Ripa, d=50 m ⚠ near the San Saba line
Piazza Albania, on the Aventine. Its own site: the earliest evidence on the site goes back to the
foundation of Rome in the **8th century BC**; between the 6th and 3rd centuries BC a tufa-block wall
was built, read as a **watchtower inside the fortifications** whose monumental remains are visible
today at piazza Albania and in via di Sant'Anselmo. A late-3rd-century-BC intervention raised the
ground level with earth and debris that yielded a great deal of contemporary ceramic. By the mid-2nd
century BC a **domus** began to develop inside a massive *opus incertum* wall, turning the area from
military to residential use. Living quarters, food-storage rooms and water-disposal systems have
been identified; **six superimposed floor levels** from the 1st century BC to the 2nd century AD
record successive owners, perhaps merchants engaged in the Tiber Emporium trade. Some of the
rebuilding appears linked to unstable subsoil, cut through by quarries for tufa and pozzolana.
Visits by booking ("Prenota la tua visita").
https://www.scatolaarcheologica.it/
⚠ No concrete opening hours on the page I fetched, only a booking call to action. **Publish none.**

**45. Mura Serviane at piazza Albania** — `historic-site` — Ripa, d=16 m ⚠ **hard against the San
Saba line**
The Servian Wall, Rome's first walls, of the **6th century BC**, traditionally begun under Tarquinius
Priscus and extended with a wide ditch by his successor Servius Tullius, from whom they take their
name.
https://it.wikipedia.org/wiki/Mura_serviane
The Aventine stretch is described by the Scatola Archeologica as visible **at piazza Albania and in
via di Sant'Anselmo**: https://www.scatolaarcheologica.it/
OSM `historic=ruins` "Mura Serviane" at 41.88024, 12.48294.
⚠ **16 m from the boundary is the tightest reading in this file besides vico Jugario.** Piazza
Albania is named in the rione article as the Ripa/San Saba border itself. **Flagged: the wall
stretch may cross the line, and the piazza is the line.** Arbitrator's call, not mine.

**46. Terme Deciane and the Casale Torlonia** — `historic-site` — Ripa, d=224–265 m
Baths complex of ancient Rome built on the Aventine by the emperor **Decius in AD 249**, from whom
they are named. They now lie **beneath piazza del Tempio di Diana and beneath the Casale Torlonia**,
which incorporates some of the remains. They served the wealthy clientele of the Aventine, unlike
the nearby Baths of Caracalla, grander but for mass use by the people of the XII regio.
https://it.wikipedia.org/wiki/Terme_Deciane
⚠ Note the ancient *regio* XII named in that source is the Augustan region, not this rione's modern
toponymic code 112. Do not conflate them in prose. Both of my test points — piazza del Tempio di
Diana and the remains at 41.8828, 12.4833 — return Ripa, comfortably interior.

**47. Arco di San Lazzaro** — `historic-site` — Ripa, d=16 m ⚠ **hard against the Testaccio line**
Roman-era arch on **via Marmorata**, in rione Ripa.
https://it.wikipedia.org/wiki/Arco_di_San_Lazzaro_(Roma)
⚠ Via Marmorata is named in the rione article as the Ripa/Testaccio border. **Flagged.** The rione
article also lists a vanished *Cappella di San Lazzaro alla Marmorata* among Ripa's lost churches.

**48. Clivo di Rocca Savella** — `attraction` — Ripa, d=105 m
The stepped lane climbing the Aventine from lungotevere Aventino to the Savelli fortress ground of
record 31. Named from the *Rocca Savella*, the fortified stronghold the rione article names among
the baronial castles that were almost the only habitation on the upper part of the rione through
the Middle Ages.
https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma)
⚠ Street/route rather than a building. Verifier should decide whether the corpus wants it. No
proximity language may be used to place it; it runs between two named points, which is factual.

**49. Salita delle Pendici dell'Aventino** — `park` — Ripa, d=110 m
OSM `leisure=garden`, `opening_hours=07:00-sunset`, 41.88497, 12.47901. The planted slope between
lungotevere Aventino and the Aventine crest.
⚠ **OSM only.** §7.

**50. Giardino Antonio Maccanico** — `park` — Ripa, d=172 m
OSM `leisure=park`, 41.88638, 12.48302. ⚠ OSM only. §7.

**51. Giardino Piero Piccioni** — `park` — Ripa, d=352 m — the most interior point in this file
OSM `leisure=park`, 41.88419, 12.48190. ⚠ OSM only. §7.

---

### 3.4 The Isola Tiberina

**Ownership of the island as a whole.** it.wikipedia's rione article states flatly: *"Appartiene al
rione Ripa anche l'Isola Tiberina."*
https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma)
I tested that mechanically rather than taking it. Overpass returned 182 building and highway
features in the island's bounding box; I classified every one. Of the features **actually on the
island** — piazza di San Bartolomeo all'Isola, via di Ponte Quattro Capi, San Giovanni Calibita,
Torre Caetani, the hospital — **all resolve to Ripa**. The non-Ripa hits in that box are all on the
**mainland banks**: piazza Gerusalemme, piazza di Monte Savello and San Gregorio della Divina Pietà
on the Sant'Angelo side; lungotevere degli Anguillara, lungotevere degli Alberteschi and piazza
della Gensola on the Trastevere side. The OSM rione boundaries run down the river channel, so bare
centroid tests at the island's extreme tips fall in open water and mis-report; feature-level testing
does not. **Conclusion: the island is Ripa's, and the earlier tip readings were an artefact.**

**52. Isola Tiberina** — `attraction` — Ripa
About **300 m long and 90 m wide**, the Tiber's only urban island, joined to the banks by two
bridges: ponte Cestio to Trastevere, of **46 BC**, and ponte Fabricio toward the Ghetto, of **62
BC**, also called ponte Quattro Capi for the Roman herms on its parapets. Legend has it forming in
**509 BC** when the people, having deposed Tarquinius Superbus, threw the king's grain store into
the river in such quantity that it made an islet. Geologically it rests on a compact tufa bank akin
to the Capitoline's, on which the current's sands settled. Another legend: in **291 BC**, during a
plague, priests consulted the Sibylline books and sent a delegation to Epidaurus, cult site of
Asclepius; the envoys returned with a serpent, which leapt ashore at the island, and a temple to
Aesculapius was raised where it took refuge — after which the island was built up architecturally
**as a ship, with stern and prow and an obelisk amidships for the mast**. The church of San
Bartolomeo all'Isola later rose on the Roman temple's remains. The island's medical vocation
continues with the "Fatebenefratelli" hospital, **founded 1584**, and the Ospedale Israelitico.
https://www.turismoroma.it/it/luoghi/isola-tiberina
⚠ Turismo Roma calls it "unica isola urbana del Tevere" — that is a **count of one**, factual, and
is publishable. It is not a ranking.

**53. Basilica di San Bartolomeo all'Isola** — `historic-site` — Ripa, d=62–64 m
Piazza di San Bartolomeo all'Isola. Built at the end of the **10th century** at the will of the
emperor **Otto III** over an ancient temple of Aesculapius. First dedicated to St Adalbert; much
restored between the 11th and 12th centuries. Irreparably damaged by a Tiber flood in **1557** and
rebuilt in the 17th century by the architect **Orazio Torriani**. Two-storey Baroque façade with a
portico; interior of three naves on antique columns. It holds the remains of the apostle **St
Bartholomew** in a **red porphyry sarcophagus** under the high altar, and those of **St Adalbert**,
bishop of Prague, killed in **997**. Among the works inside, the *Flagellation of Christ* by
**Antonio Carracci (1589–1618)**, nephew of Annibale. Seat of the "Veneranda confraternita de'
devoti di Gesù Cristo al Calvario e di Maria Santissima Addolorata", formed in **1760**, which
obtained permission from **Pius VI** to make a cemetery for its dead in the basement; its members
wore a red hooded cloak, hence the popular name **Sacconi Rossi**. From the outset they recovered
bodies found in the Tiber, whose bones were laid in the crypt. Turismo Roma also records a
**Romanesque campanile of the 12th century** and a hollowed column used as a wellhead.
https://www.turismoroma.it/it/luoghi/chiesa-di-san-bartolomeo-allisola
https://www.turismoroma.it/it/luoghi/isola-tiberina
Official site, run by the Comunità di Sant'Egidio, which presents it as the **Santuario dei nuovi
martiri del XX e XXI secolo** with a Memoriale dei Nuovi Martiri: https://www.sanbartolomeo.org/
**Hours of the Memoriale dei Nuovi Martiri**, per Turismo Roma: **Saturday 09:30–13:30 and
15:30–17:30**, and otherwise by booking through the basilica's contact form.
⚠ Turismo Roma's page says the church stands "tra il Rione Trastevere e il quartiere ebraico" — a
locational gloss, **not** a rione attribution, and it is contradicted by the rione article and by my
feature-level test. Do not let it into the record.

**54. Chiesa di San Giovanni Calibita** — `historic-site` — Ripa, d=39–40 m
On the Isola Tiberina, in rione Ripa, attached to the Fatebenefratelli hospital of the same name.
https://it.wikipedia.org/wiki/Chiesa_di_San_Giovanni_Calibita

**55. Ospedale Isola Tiberina – Gemelli Isola (Fatebenefratelli)** — `historic-site` — Ripa,
d=59–68 m
**Via di Ponte Quattro Capi 39**, on the Isola Tiberina. Founded by the Hospitaller Order of St John
of God, whose friars are called **Fatebenefratelli** — the name by which Romans know the hospital.
It stands on the site of the ancient temple to Aesculapius, whose cult was introduced to Rome in
**292 BC**. Turismo Roma dates the hospital's foundation to **1584**. Since **1 September 2022** it
carries the name **Ospedale Isola Tiberina – Gemelli Isola**, after purchase by Gemelli Isola –
Società Benefit S.p.A., created by the Fondazione Policlinico Universitario Agostino Gemelli IRCCS.
https://it.wikipedia.org/wiki/Ospedale_Fatebenefratelli_Isola_Tiberina_-_Gemelli_Isola
https://www.turismoroma.it/it/luoghi/isola-tiberina
https://www.fatebenefratelli-isolatiberina.it/
https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma)
⚠ A working hospital. Guide-worthy as a historic institution, not as a visitor attraction. The
record must not read as an invitation to visit. Verifier may prefer to fold it into record 52.
⚠ it.wikipedia gives 292 BC for the Aesculapius cult; Turismo Roma's Isola Tiberina page gives 291
BC for the plague legend. **Two different events, two different sources — do not average them, and
do not publish both as if one date.**

**56. Oratorio di Gesù al Calvario e di Maria (Sacconi Rossi)** — `historic-site` — Ripa, d=46 m
On the Isola Tiberina, in rione Ripa; **deconsecrated since 1988**. Also called Santa Maria
Addolorata dei Sacconi Rossi. It was the oratory of the old Franciscan monastery north of San
Bartolomeo all'Isola, dedicated to Jesus at Calvary and Our Lady of Sorrows, and a subsidiary church
of the parish of Santa Maria in Portico in Campitelli. **Every All Saints' Day the Sacconi Rossi
went to the point of the island facing Ponte Rotto and cast a wreath into the river in memory of the
drowned whose bodies were never found**; the custom is now carried on by the Fatebenefratelli and
the confraternity of Santa Maria dell'Orto.
https://it.wikipedia.org/wiki/Oratorio_di_Gesù_al_Calvario_e_di_Maria

**57. Torre Caetani** — `historic-site` — Ripa, d≈53 m
Medieval tower on the Isola Tiberina, 41.890784, 12.478004, OSM-named "Torre Caetani".
⚠ **OSM only for the name and position.** Trattoria Sora Lella's own site says the restaurant is
"dentro una torre del 1200" — a 13th-century tower — which is consistent but is a restaurant's claim
about its premises, not an architectural source. §7.

**58. Guglia di Pio IX** — `historic-site` — Ripa, d≈65 m
Marble spire in piazza San Bartolomeo on the Isola Tiberina, by **Ignazio Jacometti, 1869**.
https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma)
⚠ Single source, the rione article's "Altro" list. §7.

**59. Statua dei quattro santi** — `historic-site` — Ripa, d≈62 m
OSM `tourism=artwork` "Statua dei quattro santi", 41.89049, 12.47788, on the island.
⚠ **OSM only.** Likely the same object as record 58 seen from a different tagging. §7.

**60. Rilievo di Asclepio** — `historic-site` — Ripa, d≈67 m
OSM `historic=ruins` "rilievo di Asclepio", 41.89008, 12.47878 — the travertine relief on the
surviving ship's-prow revetment at the island's downstream end. Turismo Roma describes the island
being "sistemata architettonicamente come una nave con poppa e prua".
https://www.turismoroma.it/it/luoghi/isola-tiberina
⚠ The relief itself is OSM-only; the ship-shaping is sourced. §7.

**61. Ospedale Israelitico** — `historic-site` — Ripa
Named by Turismo Roma alongside the Fatebenefratelli as continuing the island's medical vocation.
https://www.turismoroma.it/it/luoghi/isola-tiberina
⚠ One clause in one source. No address, no dates, no site reached. §7 — probably not shippable
alone; may belong as a sentence in record 52.

---

### 3.5 Bridges — all five are straddlers, see §4

**62. Ponte Fabricio** — `historic-site` — Ripa, d=5–9 m; **left-bank abutment Sant'Angelo**
Links the Isola Tiberina to the left bank. Built **62 BC** to replace an earlier timber bridge
already standing in 192 BC per Livy. Four large inscriptions on the arches name the builder,
**Lucius Fabricius**, then *curator viarum*. A smaller inscription records repairs by Marcus Lollius
and Quintus Lepidus in the 1st century BC after two Tiber floods. Horace remembers it as a place
from which the desperate threw themselves. Restored in **1447** by Eugene IV, who paved it in
travertine slabs, and again in **1679** under Innocent XI, who consolidated the structure and
remade the parapets. Two large slightly depressed arches on a central pier, pierced by a relieving
arch to reduce flood pressure. Built of *cementizio* and squared Gabine stone and tufa, faced over
much of its length in travertine; the brickwork belongs to the 17th-century repairs. The parapet
carries **four-fronted marble herms**, whence the modern name **Ponte dei Quattro Capi**, attested
by the early 16th century. Popular legend makes the herms four architects commissioned by Sixtus V
to restore the bridge, who quarrelled and were beheaded on the spot at the end of the works. When
the Jewish community occupied the area on the left bank the bridge was also called dei Giudei.
https://www.turismoroma.it/it/luoghi/ponte-fabricio
⚠ "il ponte romano meglio conservato e, insieme a Ponte Milvio, il più antico ancora in uso" is
**banned**. The 62 BC date and "still in use" are publishable.
⚠ OSM also tags a short way "Ponte di Quattro Capi" at 41.891320, 12.478524 → Ripa.

**63. Ponte Cestio** — `historic-site` — **Trastevere by span, Ripa at the island abutment**
Built around **46 BC**, linking the Isola Tiberina to Trastevere; probably by Lucius Cestius, left
by Caesar to govern Rome during the Spanish war. Nearly contemporary with ponte Fabricio, which
joins the island to the opposite bank and to **rione Sant'Angelo** — Turismo Roma says so in as many
words. Repeatedly repaired against the current. In **365** rebuilt by Valentinian, Valens and
Gratian as one great arch flanked by two smaller. In **AD 370** called "di Graziano", per the
inscription in the upstream parapet; later "San Bartolomeo" from the island's principal church;
later still "ferrato", from the iron chains needed to anchor floating mills on barges — a technique
that became essential to Rome's flour supply after **537**, when Vitiges cut the aqueducts driving
the Tiber mills. Damaged in the French invasion of **1849** but little changed in appearance; in
**1899** the widening of the riverbed for the new embankments required dismantling the structure and
its facing. Per the inscription on the marble parapets, it was rebuilt in **1892** as three large
arches faced in the **original travertine**, taking the official name Ponte Cestio.
https://www.turismoroma.it/it/luoghi/ponte-cestio
⚠ The 1892/1899 dates in Turismo Roma's own text run backwards against each other. **Quote at most
one, or neither.**

**64. Ponte Rotto / Ponte Emilio** — `historic-site` — Ripa, d=43–88 m
The Pons Aemilius, Rome's first masonry bridge, crossing the Tiber a little north of the ancient
Pons Sublicius. Only a single mid-stream pier survives.
https://it.wikipedia.org/wiki/Ponte_Rotto
Turismo Roma's Ponte Palatino page: "l'antichissimo Ponte Emilio (Ponte Rotto) i cui resti si
ergono, ancora oggi, custodi millenari di una storia travagliata fatta di innumerevoli crolli e
ricostruzioni." https://www.turismoroma.it/it/luoghi/ponte-palatino
Casa dei Crescenzi source records the Crescenzi levying a toll on its traffic, and that the bridge
was earlier called Ponte di S. Maria or Senatorio:
https://www.turismoroma.it/it/luoghi/casa-dei-crescenzi ; https://www.cssar-casadeicrescenzi.it/storia/
⚠ "il primo ponte in muratura di Roma" is a **sequence claim about a first**, which the brief
explicitly welcomes as *not* a superlative ("a date or sequence"). I read it as publishable, but
flag it for the verifier since it sits close to the line.
⚠ Both my test points — the surviving pier and the Ripa-side stub — return Ripa. Of the five
bridges this is the least contested.

**65. Ponte Palatino** — `historic-site` — **Ripa by span, Trastevere at the far abutment**
Built **1886–1890** to the design of the engineer **Angelo Vescovali**, with a Belgian firm
specialising in iron bridges and the Officina dell'Impresa Industriale Italiana for the metalwork,
to serve the crossing the Pons Aemilius had once carried. Plain structure without the great arches
of most Roman bridges and without heavy ornament apart from the metal lattice with lozenge elements
joining its sections. **Just over 155 m long and about 19 m wide.** Turismo Roma states it "unisce
Lungotevere Ripa con Lungotevere Aventino, nei **Rioni Ripa e Trastevere**" — the straddle is in the
source itself. Five spans on four massive masonry piers faced in travertine bossage, carrying a
metal deck that lands at each end in the embankment walls raised after the flood of 1870. The Cloaca
Maxima, still working, discharges on the left side at lungotevere Aventino. Romans once held the
*partita a rocci* or *sassaiola* — mass stone-throwing between the men of Testaccio and Trastevere —
on this bridge.
https://www.turismoroma.it/it/luoghi/ponte-palatino
⚠ "uno dei primi esempi di architettura funzionale della città" — a soft priority claim. **Drop it.**

**66. Ponte Sublicio** — `historic-site` — **Testaccio by span; Ripa only at the left-bank
abutment, d=12–14 m**
🚨 **This one probably is not Ripa's, despite it.wikipedia listing it under Ripa's bridges.**
Turismo Roma states outright that the present bridge "collega i rioni **Trastevere e Testaccio**
all'altezza di Porta Portese". My classifier agrees: midspan and the far abutment both fall in
Testaccio; only the north kerb of the left-bank abutment reads Ripa, 12–14 m from the line.
https://www.turismoroma.it/it/luoghi/ponte-sublicio
https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma)
Content, if the arbitrator gives it to someone: also called ponte Aventino or ponte Marmoreo. It
stands downstream of the ancient **Pons Sublicius**, ascribed to king **Ancus Marcius, 642–617 BC**
per Livy and Dionysius of Halicarnassus, which crossed a little below the Isola Tiberina and took
its name from the *sublicae*, the Volscian word for the wooden planks it was built of, removable in
an attack — as happened when Porsenna attacked and Horatius Cocles held the far end while his
fellow-citizens broke the bridge behind him. The Pons Sublicius was held sacred and was the setting
of the rite of the **Argei** each 15 May during the Lemuria, when twenty-four wicker figures were
bound and thrown into the river. Restored by Antoninus Pius, Trajan, Marcus Aurelius and Septimius
Severus, who rebuilt the piers in masonry and travertine; it appears on imperial coinage. Under
Sixtus IV it was wholly demolished and its travertine facing made into **400 large cannonballs**.
The last visible traces went in **1890** with the raising of the embankments.
**Recommendation to the arbitrator: this is Testaccio's, on the strength of the official tourist
board's own sentence plus the polygon. Ripa should not claim it. I raise it because it.wikipedia's
rione article does list it, and a finder who quietly dropped it would be hiding a live conflict.**

---

### 3.6 Eating, drinking and sleeping

Ripa's commerce is genuinely thin — the Aventine is residential and institutional, the Forum
Boarium is an archaeological zone, the island is a hospital. My Overpass sweep of the whole rione
returned **98 named POIs** across all categories and only **three shops** of any kind, two of them
supermarkets. That is the honest shape of the place, and §7 says so.

**67. Trattoria Sora Lella** — `restaurant` — Ripa, d=37 m
**Via di Ponte Quattro Capi 16**, on the Isola Tiberina. Its own site carries the line "Autentica
Cucina Tradizionale Romana **dal 1940**" and says the trattoria is inside a 13th-century tower on
the bridge of 56 BC. **Hours from the official site:** lunch Monday–Saturday **12:30–14:50**; dinner
Monday–Saturday **19:20–22:50**; **closed Sunday**. Telephone bookings; a dress code is stated.
https://www.trattoriasoralella.it/it/
⚠ Under the corpus rule, a place's own site establishes identity, location and hours — those are
publishable. It does **not** establish how long it has traded, so **"dal 1940" is not publishable
from this source.** The site's "uno dei posti più belli al mondo" is **banned**.
⚠ The site's own dating is also internally inconsistent with Turismo Roma: it says "il primo ponte
di Roma del 56 a.C."; Turismo Roma dates ponte Fabricio to 62 BC. **Do not repeat the 56 BC figure.**

**68. Ristorante Tiberino** — `restaurant` — Ripa, d=40 m
Via di Ponte Quattro Capi 17–18, Isola Tiberina. https://www.tiberinoroma.it/
⚠ Site not fetched in this pass. Address from OSM. Needs one official-site check before shipping.

**69. Consolini** — `restaurant` — Ripa, d=21 m ⚠ near the Testaccio line
Via Marmorata 28. OSM `amenity=restaurant`, 41.88195, 12.47714. ⚠ Via Marmorata is the border. OSM
only; no site. §7.

**70. Apicio16** — `restaurant` — Ripa, d=122 m
Via del Velabro 16. https://apicio16.it/ — OSM-sourced address and site; page not fetched. §7.

**71. Anima Mundi** — `bar` — Ripa, d=15 m ⚠ near the Campitelli line
Via del Velabro 1. OSM `opening_hours=Mo-Su 10:00-02:00`; https://www.animamundiroma.it/
⚠ Hours from OSM, not from the venue. Do not publish until confirmed on its own site.

**72. Normale** — `restaurant` — Ripa, d=35 m
Via di San Giovanni Decollato 6. OSM only. §7.

**73. Vimi Aventino** — `restaurant` — Ripa, d=25 m ⚠ near the San Saba line
Viale Aventino 14. OSM `opening_hours=09:00-24:00`; https://www.vimiaventino.it/ . §7.

**74. Hotel San Anselmo** — `hotel` — Ripa, d=200 m
**Piazza di Sant'Anselmo 2.** Part of the Aventino San Anselmo Hotels group, which also runs Hotel
Villa San Pio and Hotel Aventino on the same hill. Official site: https://www.aventinohotels.com/
⚠ The group site is a booking front end; I could not extract per-property addresses or descriptions
beyond the group listing. Address for San Anselmo is from OSM. Needs one more pass before shipping.

**75. Hotel Villa San Pio** — `hotel` — Ripa, d=258 m
Aventine; same group as record 74. OSM 41.88197, 12.48081. https://www.aventinohotels.com/

**76. Hotel Aventino** — `hotel` — Ripa (Aventine)
Third property of the same group, named on the group's own site.
https://www.aventinohotels.com/
⚠ **No coordinates captured, so no classifier verdict.** Do not ship until located. §7.

**77. Kolbe Hotel Rome** — `hotel` — Ripa, d=9 m ⚠ **hard against the Campitelli line**
**Via di San Teodoro 48.** Official site: https://www.kolbehotelrome.com/
⚠ Via di San Teodoro is named in the rione article as the Ripa/Campitelli border. **9 m is the
tightest reading of any building in this file.** Flagged for the arbitrator.

Also swept and recorded but not proposed: 47 Boutique Hotel (via Luigi Petroselli 47, d=139 m);
Fauno Urban Resort (via della Fonte di Fauno 31, d=98 m); Hotel Sourire (d=175 m); Foresteria Santa
Scolastica (Clivo dei Publicii 2, d=376 m); Gelateria Maximo, Bar Circo Massimo, Gusto Massimo,
Santeo, Yellow Bar, Manioka, Max Roma, Giulietta, Dulcis in Fundo, InRoma Restaurant; Emme Più
Aventino and Supermercato Affare Fatto. All OSM-only, all inside Ripa, none with a fetched official
source. I list them so the verifier can see the tail exists and judge it uniformly rather than
having me cherry-pick.

---

## 4. Straddlers — flagged, not resolved

Per the brief I do not resolve these. One arbitrator sees all nine files.

| # | Place | Reading | Note |
|---|---|---|---|
| 22 | **Circo Massimo** | 6 of 7 test points Ripa; **NE corner Campitelli at 24 m** | Ripa on area and on the documentary via dei Cerchi border; the Porta Capena tip crosses. |
| 62 | **Ponte Fabricio** | midspan Ripa (9 m), island abutment Ripa (22 m), **left-bank abutment Sant'Angelo (40 m)** | Turismo Roma names ponte Fabricio as joining the island to **rione Sant'Angelo**. Genuine Ripa/Sant'Angelo split. |
| 63 | **Ponte Cestio** | island abutment Ripa (33 m), **midspan and Trastevere abutment Trastevere** | Trastevere already owns two bridges; it does not own this one. Ripa/Trastevere split. |
| 65 | **Ponte Palatino** | left-bank abutment and midspan Ripa, **Trastevere abutment Trastevere** | The source itself says "nei Rioni Ripa e Trastevere". |
| 66 | **Ponte Sublicio** | **midspan and far abutment Testaccio**; only the left-bank kerb Ripa (12 m) | Turismo Roma says Trastevere–Testaccio. **My recommendation: not Ripa's.** Testaccio is in no wave, so it may end up unwritten, as the Colosseum did. |
| 17, 18 | **Sant'Omobono church and sacred area** | Ripa at 25–42 m; **a point in vico Jugario returns Campitelli at 0.3 m** | Vico Jugario *is* the border. |
| 45 | **Mura Serviane, piazza Albania** | Ripa at 16 m; **piazza Albania is the Ripa/San Saba border** | The wall stretch may cross into San Saba. |
| 47 | **Arco di San Lazzaro** | Ripa at 16 m; **via Marmorata is the Ripa/Testaccio border** | |
| 77 | **Kolbe Hotel Rome** | Ripa at **9 m**; via di San Teodoro is the Ripa/Campitelli border | Tightest building reading in the file. |
| 23, 43, 44, 73 | **Circo Maximo Experience, Roseto, Scatola Archeologica, Vimi Aventino** | Ripa at 25–50 m from the **San Saba** line (viale Aventino / piazza Albania) | A cluster, not four independent coincidences. |
| 71 | **Anima Mundi** | Ripa at 15 m from the Campitelli line | |
| 69 | **Consolini** | Ripa at 21 m from the Testaccio line | |
| 52 | **Isola Tiberina** | Ripa on feature-level testing; **naive tip centroids mis-report as Sant'Angelo / Trastevere** | Recorded so the arbitrator is not surprised by a contrary centroid test. it.wikipedia's rione article settles it in Ripa's favour. |

---

## 5. Ruled OUT of Ripa — near misses another rione's finder should have

Every one of these was tested, not assumed. Distances are metres outside the Ripa boundary.

**Celio** — Colosseo (629 m); Piazza di Porta Capena (106 m).
**Sant'Angelo** — Teatro di Marcello (99 m); Portico d'Ottavia (122 m); San Nicola in Carcere (77 m);
Tempio di Apollo Sosiano (119 m); **Albergo della Catena (139 m)**; site of piazza Montanara (114 m);
Sinagoga di Roma (99 m); San Gregorio della Divina Pietà; piazza Gerusalemme; piazza di Monte
Savello; lungotevere de' Cenci.
**Campitelli** — **Casina dei Pierleoni (43 m)**; **Piazza della Consolazione (72 m)** and **Santa
Maria della Consolazione (96 m)**.
⚠ **Note against it.wikipedia.** The Ripa rione article lists "piazza della Consolazione" among
Ripa's squares. **It is wrong, or at least the OSM boundary disagrees**, and Campitelli has already
shipped `santa-maria-della-consolazione-campitelli`. **Ripa must not claim the square.** Flagged so
the arbitrator sees the conflict rather than a silent omission.
**San Saba** — Terme di Caracalla (535 m); Basilica di Santa Balbina (328 m); Basilica di San Saba
(242 m); Porta San Paolo (287 m); **FAO headquarters, viale delle Terme di Caracalla (138 m)**;
**Circo Massimo metro station (59 m)**; Piramide metro (265 m).
**Testaccio** — Piramide Cestia (294 m); Cimitero acattolico (266 m); the Emporium quay (130 m);
and see record 66.
**Trastevere** — **Porto di Ripa Grande (212 m)** and the ex Ospizio Apostolico di San Michele a
Ripa Grande (187 m).
🚨 **The Ripa Grande port is the trap in this rione and I want it in writing.** The rione takes its
modern name from it — the it.wikipedia article says so, and the rione's arms are a white ship's
wheel on red in memory of the river landing. **But the port itself was on the right bank and is in
Trastevere.** Turismo Roma's Aventine page describes looking across at it from the Giardino degli
Aranci. Any Ripa page that says the port is *in* Ripa is wrong. The **name** and the **arms** are
Ripa's; the **place** is not.
https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma) ; https://www.turismoroma.it/it/luoghi/aventino

Sources for the arms: white rudder wheel on a red field, "a ricordare lo scalo fluviale", cited in
the rione article to Carlo Pietrangeli, *Insegne e stemmi dei rioni di Roma*, Capitolium XXVIII.6,
1953. Useful for a rione-level page; **not** a designation claim of any kind.

---

## 6. Rione-level facts safe to publish

- Ripa is the **twelfth** rione of Rome, **R. XII**, Roma Capitale toponymic code **112**, in
  Municipio I. (`priv/seed_data/rome_roster.json`; the roster's own note explains the Roman numeral
  is inferred from ordering, so prefer the code.) A position in an official series is explicitly
  **not** a superlative under the brief.
- The rione was much larger **until 1921**, when Testaccio and San Saba were separated from it; it
  ran from the left bank inside the Aurelian Walls from the Velabrum valley to the slopes of the
  Capitoline as far as Porta San Sebastiano. In antiquity it covered *regiones* XI–XIII — Circus
  Maximus, Piscina Publica and Aventinus.
- Its stretch of the Tiber was called **Ripa Graeca**, for the Greek community — the *Schola
  Graeca* — settled there from the **4th century**, thickened in the **8th century** by Greek-Latins
  fleeing the iconoclasm of Leo the Isaurian.
- Through the Middle Ages the upper part of the rione was effectively uninhabited but for fortified
  monasteries and baronial castles such as the **Rocca Savella**.
All from https://it.wikipedia.org/wiki/Ripa_(rione_di_Roma) — attribute as it.wikipedia's rione
article, not as "Wikipedia says".
- Turismo Roma, Roma Capitale's official tourist site, groups this ground as the itinerary
  **"Aventino – Terme di Caracalla – Circo Massimo"**, which is a useful honest framing for a
  neighbourhood page. https://www.turismoroma.it/it/luoghi/circo-massimo
- **UNESCO.** The Historic Centre of Rome was **inscribed in 1980**. Under ruling 1 this may be
  stated as an inscription, **but no Ripa page may claim the rione lies inside the property.** I did
  not fetch the UNESCO record in this pass and did not need to; if a page wants the sentence, fetch
  whc.unesco.org first.

---

## 7. Honest assessment of yield

**Ripa is a guide, comfortably — not a town page.** 77 candidates, and unlike San Saba or
Sant'Angelo the strength is not borrowed. It has four independent clusters, any one of which would
carry a small rione on its own: the Forum Boarium (a Republican temple pair, two late-antique
arches, a 12th-century basilica and the Bocca della Verità inside 200 m), the Circus Maximus and its
valley, the Aventine (Santa Sabina, the Giardino degli Aranci, the Malta keyhole, two mithraea in
the rione counting record 25), and the Isola Tiberina.

But the brief warns that a high confirmation rate is a warning sign, so let me be blunt about where
this file is weak:

**Weakest — I expect these to fall, and they should.**
- **Records 19 and 20 are not places, they are duplicates.** Santa Maria Egiziaca *is* the Temple of
  Portunus; Santa Maria del Sole *is* the Temple of Hercules. Shipping four records for two
  buildings is exactly the corpus-gate failure the collision check exists to prevent. I have written
  them up rather than deleting them so the verifier can see the trap and confirm the merge.
- **The OSM-only tail: records 21, 33, 39, 49, 50, 51, 57, 59, 60, and most of §3.6.** OSM is not an
  official source and I could not find one for any of them. A garden named for Piero Piccioni is a
  real municipal garden; it is not a thing a travel guide can honestly write a paragraph about from
  a single tag. I would drop the three unnamed-provenance gardens (49, 50, 51) and Insula Volusiana
  (21) unless someone can reach a Roma Capitale page for them.
- **Records 14, 16, 42, 61 are one-sentence records.** San Giovanni Decollato, Sant'Eligio dei
  Ferrari, San Vincenzo de Paoli and the Ospedale Israelitico each have exactly one sourced fact
  beyond their location. That is a stub, not a guide entry.
- **Record 76 (Hotel Aventino) has no coordinates**, so it has no boundary verdict. It must not ship
  in that state.

**The three I am least confident about, in order:**

1. **Record 66, Ponte Sublicio.** it.wikipedia's rione article lists it under Ripa's bridges;
   Turismo Roma says it joins Trastevere and Testaccio; my polygon says Testaccio for everything but
   the kerb. Two of three say not-Ripa. I have recommended against claiming it and I think that is
   right, but I am flagging it as my least-settled call because the rione's own reference work
   disagrees with me.
2. **Record 45, the Mura Serviane at piazza Albania.** 16 m from a boundary that *is* piazza Albania
   is not a margin. The wall stretch is described as running through piazza Albania **and** via di
   Sant'Anselmo — two streets, one of which is the border. It may genuinely lie in both rioni, and
   San Saba is in this wave.
3. **Records 17 and 18, Sant'Omobono.** A test point in the middle of vico Jugario came back
   Campitelli at **0.3 m**. The church and the sacred area read Ripa at 25–42 m, which I believe,
   but this is the single tightest boundary in the rione and Campitelli is already shipped with 450
   places behind it. If anything in Ripa is going to collide with live data, it is here.

**Runners-up on the same anxiety:** record 77 (Kolbe Hotel, 9 m from the Campitelli line — the
tightest building in the file), record 27 (Rhinoceros, where the official site and OSM give
different streets), and record 41 (Mitreo di Santa Prisca, where the only status I have is Turismo
Roma quoting a suspension and the ministry's own page was unreachable).

**Coverage gaps I know about and could not close:**
- `cultura.gov.it`, `beniculturali.it` and `vicariatusurbis.org` all timed out from this network, so
  every church record here rests on Turismo Roma or it.wikipedia rather than on the diocese or the
  ministry. Opening hours are the casualty: I have official hours for **Santa Sabina** and
  **Trattoria Sora Lella** only, plus Turismo Roma's for Cosmedin, Santa Prisca and San Bartolomeo.
  Everything else should say no source states them.
- Turismo Roma has no reachable page for **San Giorgio in Velabro**, though its own other pages link
  one. Every slug I tried 404s.
- I did not check Roma Capitale's *Negozi Storici* register for Ripa entries. Given that the whole
  rione returned three shops, I doubt there is anything there, but it is an unswept corner.

---

## 8. Superlative and method quarantine — do not publish any of these

Recorded so the verifier can confirm I saw them and rejected them rather than never having met them.

From **Turismo Roma** (Roma Capitale's own tourist board — attribution does **not** save these):
"il più grande edificio per lo spettacolo dell'antichità e uno dei più grandi di tutti i tempi"
(Circo Massimo) · "È uno degli edifici meglio conservati dell'Antica Roma" and "il primo edificio in
marmo costruito in città" (Tempio di Portuno / Tempio di Ercole) · "È il ponte romano meglio
conservato e, insieme a Ponte Milvio, il più antico ancora in uso" (Ponte Fabricio) · "Una delle
piazze più belle di Roma" (piazza Bocca della Verità) · "la più antica casa post-antica conservata
in città" (Casa dei Crescenzi) · "uno dei simboli più celebri di Roma" (Bocca della Verità) · "la
più famosa e suggestiva vista di San Pietro" (the keyhole) · "rappresenta il perfetto esempio di
basilica cristiana del V secolo" (Santa Sabina) · "uno dei primi esempi di architettura funzionale
della città" (Ponte Palatino) · "una delle più antiche condotte fognarie" · "uno dei più importanti
centri cristiani" (domus Priscae) · "prestigiosa manifestazione" (Premio Roma) · "Uno straordinario
spettacolo di profumi e colori" (Roseto).

From **it.wikipedia**: "la più antica fogna ancora pienamente funzionante al mondo" (Cloaca Massima)
· "si tratta del più antico edificio di Roma di marmo conservatosi" (Tempio di Ercole) · "che è stata
la prima fabbrica di Roma" (Pantanella) · "documenti di importanza eccezionale" (area di
Sant'Omobono).

From **venues' own sites**: "SIAMO IN UNO DEI POSTI PIÙ BELLI AL MONDO" and "dal 1940" (Trattoria
Sora Lella — the site establishes hours and address but **not** trading history) · "MIGLIOR PREZZO
GARANTITO" (Aventino Hotels) · "BEST RATES GUARANTEED" (Kolbe Hotel) — marketing claims, not facts.

**Not superlatives, and welcome:** 600 × 140 m (Circus Maximus) · 34.20 m campanile with a bell of
1289 (Cosmedin) · 24 fluted Corinthian columns (Santa Sabina) · 7,800 m² (Giardino degli Aranci) ·
about 1,100 rose species (Roseto) · 155 m by 19 m (Ponte Palatino) · about 300 × 90 m (Isola
Tiberina) · a 27 m frieze and a 5 m bronze (Mazzini) · six superimposed floor levels (Scatola
Archeologica) · €12.00 / €10.00 / €22.00 (Circo Maximo Experience) · "the twelfth rione, code 112".

**Method language that must never reach a page:** everything in §2 and §4 — 429s, Overpass mirrors,
point-in-polygon, metres-to-edge, "could not be reached", "404s", "re-fetched". If a fact failed to
source, the page says what it can honestly say and nothing about why.

---

## 9. Photograph leads — parked, NOT for this wave

Ruling 3: `"photos": []` everywhere in this wave. Noting these only so the image wave is not
starting cold. **No licence has been checked and none of these may be used now.**
- Turismo Roma captions several of its own images "Foto Turismo Roma" / "Foto: Redazione Turismo
  Roma" on the Tempio di Portuno, Foro Boario, Arco degli Argentari and Palazzo dell'Anagrafe pages —
  a single rights-holder covering four subjects, worth one licence enquiry rather than four.
- The Mitreo di Santa Prisca page credits "Foto: Sovrintendenza Speciale di Roma".
- it.wikipedia carries file names for the rione arms (`Rome rione XII ripa (logo).svg`), the Pantanella
  (`Ex Pantanella (2) - 22-11-2019.jpg`), the Mazzini monument (`Statua Giuseppe Mazzini
  aventino.jpg`, `Ripa - monumento a Mazzini 01322.JPG`), San Vincenzo de Paoli (`Ripa - s Vincenzo
  de Paoli 4230055.JPG`) and the Anagrafe (`Anagrafe Roma.jpg`). Commons licences unverified.

---

## 10. Reproducing this

Working files, all under the session scratchpad
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/ripa/`:

| file | what it does |
|---|---|
| `op.py` | Overpass POST against `overpass.kumi.systems` (the `.de` host refuses connections here) |
| `q_ids.ql`, `q_geom.ql` | fetch all 22 rione relations, then their geometry |
| `rione.py` | stitches relation members into rings; even-odd point-in-polygon; metres-to-edge. `python3 rione.py points.json` |
| `coords.json`, `edge.json`, `edge2.json`, `edge3.json` | the four point batches tested — 130 points in total |
| `q_poi.ql`, `poi.py` | POI sweep over the Ripa bbox, filtered locally through `rione.py` — 794 raw elements, 98 named and inside Ripa |
| `q_isl.ql`, `isl.py` | the Isola Tiberina feature-level test — 182 features classified |
| `fetch.py`, `batch.py` | cached HTML fetch and text extraction; `after`/`grep` modes strip Turismo Roma's very large nav |
| `wt.py`, `extracts.py`, `coords.py` | MediaWiki `action=parse` wikitext, `prop=extracts`, and `prop=coordinates` |

Network notes for whoever comes next: Nominatim rate-limits to uselessness after ~17 reverse
lookups and the cooldown is long — build a local classifier instead. `overpass-api.de` and
`z.overpass-api.de` refuse connections; `overpass.kumi.systems` works. `parcocolosseo.it`,
`vicariatusurbis.org`, `beniculturali.it` and `cultura.gov.it` all time out.
`sovraintendenzaroma.it/i_luoghi/...` returns 403 but `sovraintendenzaroma.it/content/<slug>` works.
`turismoroma.it/it/luoghi/<slug>` is the single most productive source for this rione by a wide
margin.
