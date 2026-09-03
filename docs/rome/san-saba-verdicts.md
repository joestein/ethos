# San Saba (R. XXI, code 121) — verifier's verdicts

Adjudicates `docs/rome/san-saba-finder.md`. I did not gather the finder's evidence and owe it no
loyalty. Every ruling below is mine. Where I say REWRITE, the wording in the box is the wording the
author uses verbatim.

---

## 0. Collision check — run mechanically, not inherited

`python3 .superpowers/taken_slugs.py` over the 12 shipped files (450 places) for each of:
`saba · caracalla · balbina · nereo · cesareo · bessarione · druso · paolo · ostiense · poste ·
fao · albania · scanderbeg · anfora · pirani · martellini · mare · aventino · piramide · capena ·
sebastiano · tempulo · scipio · marmorata · terme · resistenza · angelo mai · anfitrione · cestia ·
villetta · ricca · torce · tram depot · corner · beplace · mura · colosse · colise · flavio`.

**Zero collisions with any San Saba candidate.** The hits that came back are all unrelated
(`terme-di-diocleziano`, `palazzo-delle-poste-piazza-di-san-silvestro-colonna`,
`san-sebastiano-al-palatino`, `chiesa-di-san-paolo-dentro-le-mura-rome`). The finder's §0 stands.

One precedent worth the author's attention: `mura-aureliane-segment-trastevere-rome` and
`mura-serviane-castro-pretorio-rome` are already shipped, so **per-rione wall segments are an
accepted record shape**. The finder's advice to fold the Aurelian Walls into the ICP entry is still
the better call here — but it is a preference, not a rule.

---

## 1. Sources re-fetched

Ten fetched cold by me (`python3` + `urllib`), not taken on trust:

| source | status | verdict |
|---|---|---|
| `soprintendenzaspecialeroma.it/luoghi/terme-di-caracalla/` | 200 | says what the finder claims, **and more** |
| `parrocchiasansaba.it/orari-e-contatti/` | 200 | hours confirmed, **address inverted by the finder** |
| `diocesidiroma.it/phpenti/ente/?ID=939` | 200 | confirmed verbatim |
| `soprintendenzaspecialeroma.it/luoghi/basilica-dei-ss-nereo-e-achilleo/` | 200 | confirmed; hours conflict is real |
| `parcoarcheologicoappiaantica.it/luoghi/basilica-di-san-cesareo-de-appia/` | 200 | confirmed verbatim |
| `sovraintendenzaroma.it/…/la_casina_del_cardinal_bessarione` | 200 | confirmed; **no street number on the page** |
| `sovraintendenzaroma.it/content/porta-san-paolo` | 200 | confirmed, **and it solves §3.11** |
| `sovraintendenzaroma.it/…/parco_degli_scipioni` | 200 | **"Dove si trova: Municipio I, Rione XIX - Celio" — confirmed verbatim** |
| `sovraintendenzaroma.it/content/monumento-giorgio-castriota-scanderbeg-1` | 200 | **does NOT say what the finder said** |
| `libreriailmare.it` | 200 | confirmed, **plus a third banned claim the finder missed** |

Second batch: `fao.org/contact-us/en` (200), `romasegreta.it/s-saba/fontana-dellanfora.html` (200),
`romasegreta.it/s-saba.html` (200), `operaroma.it/stagione/` (200),
`soprintendenzaspecialeroma.it/luoghi-della-cultura/` (200), `tavernacestia.com` (200).
`angelomai.org` **still HTTP 500** — the finder's report reproduces exactly.
`soprintendenzaspecialeroma.it/luoghi/museo-della-via-ostiense/` **404** — that institution has no
page for it, confirming the finder; the operator fact comes from the Capitoline page instead.

it.wikipedia wikitext via `action=parse`: *San Saba (rione di Roma)*, *Palazzo FAO*, *Edificio
postale di Roma (via Marmorata)*, *Basilica di Santa Balbina all'Aventino*, *Chiesa dei Santi Nereo
e Achilleo (Roma)*, *Arco di Druso*, *Quadrio Pirani*, *Celio (rione di Roma)*.

Geography re-run independently: 30 Nominatim reverse probes, then 31 forward lookups with a reverse
at each returned coordinate, so every contested point was tested at the feature's **own** OSM
coordinate rather than at a guessed one.

### Sources that do NOT say what the finder said — named, as required

1. **`sovraintendenzaroma.it/content/monumento-giorgio-castriota-scanderbeg-1`.** The finder wrote
   "the description text I captured stops before any date". It does not. The page states:
   *"Il monumento venne inaugurato in piazza Albania da Benito Mussolini il 27 ottobre 1940"*, and
   gives the square's former name, the reason for the renaming, and the 1968 epigraph. The finder's
   fetch was truncated and it reported the absence as a property of the page. This is the single
   worst error in the file: it pushed a good official date out and a weaker Wikipedia date in.
2. **`parrocchiasansaba.it/orari-e-contatti/`.** The finder gives the church address as "Via di San
   Saba 19" with "a rear entrance at Piazza Gian Lorenzo Bernini 20" while also saying the church
   *fronts* Piazza Gian Lorenzo Bernini — internally contradictory. The page says the parish office
   is reached from Via di San Saba and *also* "dall'accesso posteriore, sito in Piazza Gian Lorenzo
   Bernini, 20"; civico 19 on Via di San Saba is given only as the **Caritas food-distribution
   entrance**; and the parish's own postal address is Piazza Gian Lorenzo Bernini 20. The page's
   sentence naming the basilica's main-access street is broken mid-sentence in the source itself
   ("L'accesso principale alla Basilica è da via" — nothing follows), so no source I fetched states
   it. it.wikipedia and OSM both put the basilica on Piazza Gian Lorenzo Bernini.
3. **it.wikipedia on SS. Nereo e Achilleo.** The finder says the contradiction is between the
   church's article (Celio) and the *Celio* rione article (San Saba). Wrong mechanism: the *Celio*
   article **never mentions the church at all** — I grepped its full wikitext. The contradiction is
   *inside the church's own article*, whose lead says "situato nel rione Celio" while its own
   category is `Chiese di Roma (rione San Saba)`. Conclusion unchanged, reasoning wrong.
4. **Nominatim on the Arco di Druso.** The finder reports `quarter = San Saba`. At the arch's own
   OSM way (41.87377/12.50144) the **reverse returns `quarter = Celio`**, while the forward
   display_name says San Saba. Nominatim contradicts itself. The finder's method B does not
   reproduce, and the arch is weaker for San Saba than presented.
5. **Nominatim on the Palazzo delle Poste.** The finder reports "San Saba by both methods". The
   forward lookup of Via Marmorata 4 returns *"Palazzo delle Poste Roma Ostiense, 4, Via Marmorata,
   **Testaccio**"*; the reverse at that same coordinate returns `quarter = San Saba`. Split inside
   one service, on the boundary street. Not "both methods".
6. **The Stadio's address.** The finder gives "Largo delle Vittime del Terrorismo 1 (OSM address
   tag)". The OSM address tag, as returned by Nominatim's forward lookup, is
   ***"1, Viale Guido Baccelli"***. The finder misread its own map data.

### The one thing the finder did not look for, and it is the most important source in the file

it.wikipedia's ***Celio (rione di Roma)*** carries a **verbal description of the Celio/San Saba
boundary** in a footnote to its border list:

> a sud-ovest con il rione R. XXI San Saba — *Separato da via di Porta San Sebastiano, piazzale
> Numa Pompilio, breve tratto di viale delle Terme di Caracalla, via di Valle delle Camene e piazza
> di Porta Capena.*
> a ovest con i rioni R. XII Ripa — *Separato da piazza di Porta Capena.*

This reframes half of §4. **Via di Porta San Sebastiano, Via di Valle delle Camene, Piazzale Numa
Pompilio and Piazza di Porta Capena are not places inside San Saba — they are the dividing line.**
That is why the finder's ring test kept returning 1 m and 28 m for San Cesareo, the Casina and the
Arco di Druso, and why both rione articles list Piazza di Porta Capena and Piazzale Numa Pompilio:
not a Wikipedia bug, a shared border. The finder read those small distances as "close but inside".
They are "on the line". The arbitrator needs this footnote.

---

## 2. Rulings, record by record

### 2.1 Terme di Caracalla — **PUBLISH**

Everything the finder claims is on the Soprintendenza page verbatim: Marcus Aurelius Antoninus
Bassianus called Caracalla, inaugurated 216 AD, works past his death in 217 finished under
Elagabalus and Alexander Severus, restored above all under Constantine, ceased working in 537 AD
when Vitiges cut the aqueducts in the Gothic siege, the *Aqua Antoniniana* built for it, the room
sequence, the two *palestre* and the upper floor for depilation and massage, the north-front
entrances over *tabernae* on the via Nova, about two kilometres of galleries with the furnaces and
boilers, a water plant, a mill and the Mithraeum with its *fossa sanguinis*. Address Viale delle
Terme di Caracalla 52. Responsabile Dott. Rocco Bochicchio. Ticketing rules exactly as stated.

Four corrections:

- **REWRITE — the hours are complete on the page; the finder stopped four fifths of the way
  through.** Publish the whole calendar:

  > Closed Monday. 1–28 March 9.00–17.30, last admission 16.30. 29 March – 31 August 9.00–19.15,
  > last admission 18.00. 1–30 September 9.00–19.00, last admission 18.00. 1–25 October
  > 9.00–18.30, last admission 17.30. 26 October – 28 February 9.00–16.30, last admission 15.30.

- **DROP — the 130,000 m² figure.** It is not on the Soprintendenza page. It is a Wikipedia number,
  and a bare measurement lifted off an aggregator is exactly what the "attribute aggregators" rule
  exists to catch. The two-kilometre galleries figure is official and does the same work.
- **DROP — "un complesso senza pari nell'antichità", "Una testimonianza unica", "uno degli edifici
  imperiali meglio conservati", "uno dei più grandi mitrei conservati nella città di Roma".** All
  four are on the official page. All four are banned. The finder caught the first two; the second
  two are on the same page and must not slip in.
- **PUBLISH** two things the finder left on the table: the Soprintendenza states the baths were
  built *in five years* (a construction duration, not a trip duration — allowed), and the site
  contact number 348 7964477.

Ticketing wording, verbatim:

> Tickets are nominative and are sold only through the Musei Italiani portal, the Musei Italiani
> app, or the ticket desks and automatic totems on site. The Soprintendenza states that additional
> services such as guided visits or skip-the-line are not offered.

### 2.2 Domus di Vigna Guidi — **REWRITE: fold into 2.1, do not ship separately**

The finder's own instinct was right and the source settles it: the Soprintendenza describes it
inside the Caracalla page, it is on the ordinary ticket, and it has no separate gate. A second
record would put one gate in two places.

- **REWRITE** "honorary inspector of Antiquities" → the page says *ispettore onorario dei Monumenti
  Antichi*:
  > Discovered between 1858 and 1869 by Giovan Battista Guidi, honorary inspector of Ancient
  > Monuments, on the south-east side of the bath complex. Covered over, then excavated and studied
  > again from 1970, and returned to display in 2022 after restoration.
- **PUBLISH** the *sacello* content as description, never as ranking:
  > A *sacello* shows the Egyptian deities Anubis, Isis and probably Osiris, facing Jupiter, Juno
  > and Minerva.
- **PUBLISH** the access caveat:
  > It is included in the ordinary ticket. The Soprintendenza states it is closed to the public on
  > particularly crowded days, such as the first Sunday of the month, to protect the frescoes.
- **DROP** "costituisce un unicum".

### 2.3 Basilica di San Saba — **PUBLISH, with the address rewritten**

Hours confirmed verbatim from the parish site: basilica Monday–Saturday 08.00–12.00 and
16.00–19.30; Sunday and solemnities 09.00–13.00 and 16.00–19.30; parish office Monday–Friday
10.00–12.00; Rosary daily 18.00; Mass weekdays 09.00 and 18.30, Sunday and solemnities 10.30, 12.00
and 18.30. Phone +39 06 64580140. Jesuit community confirmed (`sansaba@gesuiti.it`; legal
representative Padre Sergio Cavicchia).

- **REWRITE — address.** The finder's version contradicts itself and rests civico 19 on the wrong
  door. Use:
  > Parrocchia San Saba, Piazza Gian Lorenzo Bernini 20, 00153 Roma. The parish office is inside the
  > basilica, through the door at the end of the right-hand nave, with an entrance on Via di San
  > Saba; it can also be reached from the rear entrance at Piazza Gian Lorenzo Bernini 20.

  Do not state which street the basilica's main door is on: the parish's own sentence breaks off
  before naming it, and no other source I fetched supplies it. it.wikipedia and OSM both place the
  church on Piazza Gian Lorenzo Bernini, which the address above already carries.
- **DROP** "nel IX secolo era considerato il più importante della città". Correctly flagged.
- **REWRITE — history.** The rione article confirms the hermits on the ruins of the *statio* of the
  fourth cohort of the *vigiles*, the eighth-century arrival of monks from the community founded at
  Jerusalem by St Sabas, the castles of Marino and Palo, the passage Benedictines → Cluniacs →
  Cistercians → from 1573 the Collegio Germanico-Ungarico under the Jesuits, who hold it today. It
  does **not** carry the finder's dates (Montecassino c. 10th century, Cluniacs 1144, Cistercians
  1503, Marino 1253, Palo 1330) or the 1931 parish bull *Incolarum numero*. Those come from the
  *Basilica di San Saba* article, which I did not re-fetch. **The author must re-read that article
  and keep only the dates it actually states.** The undated sequence is publishable as it stands.
- **PUBLISH** two facts the finder skipped, both from the rione article: San Saba is popularly
  called *il piccolo Aventino*, and its arms are azure, a silver crescent in chief and Diana's
  silver bow in base, alluding to Diana Aventina (Pietrangeli, *Insegne e stemmi dei rioni di Roma*,
  1953 — a published, citable source).

### 2.4 Monastero di San Saba — **DROP as a separate record.** Fold into 2.3. The finder's own
recommendation, and correct: same complex, same community, no separate visiting arrangement.

### 2.5 Basilica di Santa Balbina all'Aventino — **PUBLISH**

Every substantive claim confirmed against the article: *opera listata* and brick suggesting the 4th
century; possibly part of a rich *domus*, identified from brick stamps as the house Septimius
Severus gave to Lucius Fabius Cilo, twice consul and Prefect of Rome, at the start of the 3rd
century; first attestation of the *titulus* at the synod of 595; hall church, single space without
aisles, alternating rectangular and semicircular side chapels between piers, some frescoed; ancient
Roman mosaics from the via dei Fori Imperiali excavations laid in the floor in the 1930s;
Cosmatesque episcopal cathedra in the apse; apse frescoes *Gloria di Cristo* with Ss Felicissimus,
Balbina, Quirinus and a holy pontiff, and *St Peter* and *St Paul* on the triumphal arch, by
Anastasio Fontebuoni in 1600 for Cardinal Pompeo Arrigoni, titular from 1597 (the article cites De
Martino 2006 for this); 16th-century façade remaking.

- **PUBLISH** the hours gap in the finder's own words, which are correct and rule-compliant:
  > No source states its opening hours, so none are given here.
- **REWRITE — status.** "dependent on the Vatican basilica" is ambiguous under the vatican_ruling
  and could be read as a territorial claim. Use:
  > It is not a parish. It is a place of worship and a filial church of the Basilica di San Pietro
  > in Vaticano.
- **REWRITE — the convent, which the finder said it could not reconcile.** It reconciles. The
  article states that the stair is named for Padre Simpliciano della Natività, founder of the Suore
  Francescane dei Sacri Cuori — formerly the "Margheritine" — and of the Istituto di Santa
  Margherita; the adjoining fortified convent is dedicated to Santa Margherita da Cortona and the
  same sisters run it as a hospice. OSM's "Convento di Santa Dorotea" tag is simply the odd one out
  and carries no source. Publish:
  > The adjoining fortified convent is dedicated to St Margaret of Cortona and is run as a hospice
  > by the Suore Francescane dei Sacri Cuori, founded by Padre Simpliciano della Natività, for whom
  > the stair up from Viale Guido Baccelli is named. It houses elderly and socially vulnerable
  > residents.

  Ship no separate convent record. Do not use the OSM name.
- **REWRITE — address.** Three sources give three answers: OSM/Nominatim "Via di Santa Balbina 8",
  the rione article "su viale Guido Baccelli", the church's own article "l'accesso moderno
  principale è su via Baccelli, dalla scalea dedicata a Padre Simpliciano della Natività". They are
  compatible if the postal address is one and the modern approach the other. Publish:
  > Via di Santa Balbina 8. The modern main approach is from Viale Guido Baccelli, up the Scalea
  > Padre Simpliciano della Natività.
- **PUBLISH, optional**: it.wikipedia records it as a minor basilica. An ecclesiastical title, not
  a heritage designation — it is not caught by the evidence ruling. Attribute it or leave it out.

### 2.6 Chiesa dei Santi Nereo e Achilleo — **PUBLISH, with the hours rewritten**

Confirmed from the Soprintendenza: *titulus fasciolae* instituted under Julius I (337–352); the
titulus later took the martyrs' names and is so recorded in a letter of Gregory the Great in 600; a
basilican church built under Leo III (795–816), abandoned as the site was unhealthy and ruined; the
mosaic outside the apsidal arch — Annunciation, Transfiguration, Theotokos — the only surviving
decoration of Leo III's time; Sixtus IV (1471–84) transformed it shortly before the Holy Year,
removing the first two bays and replacing the dividing columns with octagonal masonry piers, and
raised it to a cardinal's title; three naves with a wooden roof; the two side altarpieces in situ,
Durante Alberti's *Madonna adored by angels* on the right and Cristoforo Roncalli il Pomarancio's
*Ss Nereus, Achilleus and Domitilla* on the left; the relics in an urn still under the high altar.
Confirmed from the Diocese: Viale delle Terme di Caracalla 28, a rectory of the parish of Santa
Maria in Vallicella, rector Fr Simone Raponi from 01/07/2022.

- **The hours conflict is real and I have re-read both pages.** The Soprintendenza says
  *"Ogni sabato dalle 10.00 alle 12.00"*; the Diocese says *"Chiesa aperta martedì e giovedì dalle
  9.00 alle 12.00"*. Two official bodies, two answers, no way to adjudicate from here. **REWRITE**
  to publish both, attributed, which is honest and useful:
  > The Soprintendenza Speciale di Roma gives the opening as every Saturday 10.00–12.00. The Diocese
  > of Rome's own record gives Tuesday and Thursday 9.00–12.00. The two differ.

  This is a fact about what two institutions publish, not a research note, so it clears the
  method-in-prose rule. Do not silently pick one.
- **REWRITE — the pope.** The finder writes "at Clement VIII's urging". The Soprintendenza page
  literally reads *"su sollecitazione di Clemente VII (1592-1601)"* — a numeral that contradicts its
  own dates. Do not quietly correct an official source. Publish:
  > Cardinal Cesare Baronio of the Roman Oratory had the church restored and decorated in 1597,
  > ahead of the Jubilee of 1600, when the relics of Ss Nereus, Achilleus and Domitilla were
  > translated here.
- **REWRITE — the façade.** The Massei sgraffito attribution is **not** on the Soprintendenza page;
  it is it.wikipedia's, which must be attributed, and the finder presented it as though official.
  Also, the finder describes the façade as if untouched — it.wikipedia records a **2025 restoration**
  of it, with 2025 press coverage. Publish:
  > The façade opens onto a small forecourt on Viale delle Terme di Caracalla and keeps the form
  > given it by the restorations of Sixtus IV. It is a gabled front carrying geometric sgraffito
  > decoration, which it.wikipedia attributes to Girolamo Massei, commissioned by Cardinal Cesare
  > Baronio. The façade was restored in 2025.
- **DROP** "rappresenta un caso unico".
- **Boundary — PUBLISH as San Saba.** Nominatim agrees both ways at the church's own way
  (41.88017/12.49476), the rione article lists it, Roma Segreta files it under S.Saba, and the
  church's article's own category is `Chiese di Roma (rione San Saba)`. Only the lead sentence of
  that one article says Celio, and the Celio rione article does not claim it. Four to one.

### 2.7 Chiesa di San Cesareo de Appia — **PUBLISH**

Confirmed verbatim from the Parco Archeologico: forms defined at the start of the 17th century
under Clement VIII Aldobrandini; coffered wooden ceiling and the nave painting cycle *ascribed to*
the Cavalier d'Arpino; Cosmatesque presbytery furnishings from San Giovanni in Laterano; extensive
mosaic decoration; a severe façade with sparse columns and pilasters and wide blind panels; beneath
it an imperial-age space of the 2nd century AD, probably a bath building, found in the mid-1930s,
with an extensive marine-motif mosaic floor. Address Via di Porta San Sebastiano 2, 00153 Roma.

- **PUBLISH — the 1959 fact, which the finder asked me to rule on.** *"di proprietà demaniale sin
  dal 1959"* is a statement of **ownership** by the institution that holds the property, not a
  statement of protection status. It names no instrument, no register and no designation. It is not
  caught by the ban list. Publish it as ownership and nothing more:
  > The Parco Archeologico dell'Appia Antica states that the church has been state property since
  > 1959, and that it passed from the Direzione musei statali della città di Roma to the Parco
  > because of where it stands, on Via di Porta San Sebastiano along the first mile of the Appia.
- **PUBLISH** the access status, in the Parco's own terms:
  > The Parco Archeologico dell'Appia Antica states that the site is currently visible from the
  > street, and that restoration works under way will allow public access.
- **DROP** "l'unica fabbrica superstite tra le tante dedicate…" — superlative, correctly caught.
- **DROP** "A pochi passi dalle Terme di Caracalla" — vague proximity, present on the official page.
  The finder did not carry it; it must stay out.
- **Boundary — PUBLISH as San Saba, but the author should know it is a border address.** Nominatim
  agrees both ways at the church's own way (41.87855/12.49698), the rione article lists it, Roma
  Segreta files it under S.Saba. But Via di Porta San Sebastiano is *the boundary itself* per the
  Celio article's footnote. Three sources for San Saba and none against; ship it, flagged.

### 2.8 Casina del Cardinal Bessarione — **content PUBLISH-ready, ownership ESCALATED**

Every operational detail confirmed word for word from the Sovrintendenza Capitolina: groups only,
Saturday and Sunday, maximum 15 per visit, booking compulsory on 060608 09.00–19.00; individual
visits also possible by booking on 060608 on a published calendar; full €4.00, reduced €3.00; free
for residents of Rome and the metropolitan area on production of proof of residence; free for MIC
card holders; the guided visit is not included in the entry price and must be arranged separately;
closed Monday to Friday. History confirmed: 15th-century form over medieval fabric enclosing Roman
structures; funerary structures of the 1st century BC and a building of at least three phases from
the early imperial period to the first half of the 2nd century AD below the basement, from which
survive black-and-white mosaic paving and an *opus mixtum* wall in the ground-floor south-west
masonry; the medieval phase relating to a hospital run in the early 14th century by the *fratres
cruciferi*, later a Benedictine nunnery; granted by Clement VIII in 1600 to the Collegio Clementino
he founded in 1594, to the Convitto Nazionale after the college's suppression in 1870, reduced to an
inn between the late 1800s and early 1900s, ceded by the State to the Comune di Roma in 1926,
restored and inaugurated in 1933; now one of the Comune's representative venues.

- **REWRITE — Bessarione is a hypothesis, not an attribution.** The page says *"Di qui l'ipotesi,
  suffragata da alcuni recenti rinvenimenti documentali, che vi abbia risieduto il Cardinale
  Giovanni Bessarione"*. Publish:
  > The extension towards the street with the first-floor loggia, and the conversion into the summer
  > residence of the cardinal titular of Tusculum, date to the second half of the 15th century. From
  > this comes the hypothesis, which the Sovrintendenza Capitolina says recent documentary finds
  > support, that Cardinal Giovanni Bessarione — titular of Tusculum from 1449 to 1468 — lived here.
- **REWRITE — address.** The Sovrintendenza page gives **no street number**; I confirmed that. The
  finder's "Via di Porta San Sebastiano 8" is an OSM tag I could not reproduce: Nominatim has no
  record under the building's name at all, and "Via di Porta San Sebastiano 8" resolves to a point
  at the far southern end of the street, by Porta San Sebastiano, which is not where the Casina is.
  Publish the street alone:
  > Via di Porta San Sebastiano, at the ancient fork of the via Appia and the via Latina.
- **DROP** "un raro esempio di villa rinascimentale extraurbana" — the finder's instinct is right,
  "raro esempio" is a ranking claim.
- **ESCALATED, not ruled.** The finder's "1 m inside the ring" is not a margin, it is the line: the
  Celio article's footnote makes Via di Porta San Sebastiano the border. Nominatim has no entry for
  the building to check against. What supports San Saba is two aggregators (the rione article's
  civil-architecture list and Roma Segreta). That is thinner than the finder's "firm" grading. **I
  am not willing to rule this one from inside a single rione's file.** See §3.

### 2.9 Arco di Druso — **DROP from San Saba. Escalated, and I lean Celio.**

Content confirmed from it.wikipedia: not a triumphal arch despite centuries of being taken for one
and wrongly identified with an arch said to have been raised on the Appia for Drusus the Elder in
9 BC; it is a *fornix* of the *Aqua Antoniniana*, the branch of the *Aqua Marcia* Caracalla had
built to supply his baths — which the Soprintendenza's Caracalla page independently corroborates;
what stands is two columns on high plinths framing the outward face and part of a triangular
pediment; under Honorius in the early 5th century it was joined to Porta San Sebastiano by two
now-vanished walls, for defence; Sovrintendenza Capitolina.

But the geography does not hold up. **it.wikipedia's category is `Roma R. XIX Celio`. The Celio
article lists it among Celio's archaeological sites. Nominatim's reverse at the arch's own way
returns `quarter = Celio`.** Against that: Nominatim's forward display_name, Roma Segreta, and the
finder's ring test at 1 m — on a street the Celio article names as the boundary. Three indicators
to three, and the finder's method B does not reproduce as claimed. Do not write it into San Saba.

Also **DROP** "di fronte alla Porta San Sebastiano" if it survives anywhere — vague proximity.

### 2.10 Porta San Paolo — **PUBLISH, and it is the finder's best surprise**

The surprise holds. At the gate's own OSM node, Nominatim's forward display_name reads *"Porta San
Paolo, 3, Via Raffaele Persichetti, **San Saba**"* and the reverse returns `quarter = San Saba`. The
Pyramid 60 m away returns `Testaccio` both ways. The gate is San Saba's and the Pyramid is
Testaccio's; that really is the line.

Confirmed from the Sovrintendenza: two gates originally flanked the Pyramid, built to ease traffic
between the city and the port of Ostia; the western one, running towards the granaries of the
Marmorata on the Tiber bank, was closed as the via Portuense took over and **demolished in 1888**;
the surviving gate's Roman name was **Porta Ostiensis**, where the via Ostiense began; renamed for
the road out to San Paolo fuori le Mura.

- **PUBLISH** three things the finder missed, all on the page it cited:
  > Between 401 and 403 Honorius restructured the gate, keeping a single entrance *fornix* and
  > reinforcing and raising the two flanking towers, giving them merlons and windows. A restoration
  > under Benedict XIV in 1749 took in the whole Roman circuit from Porta San Paolo to Porta
  > Flaminia, and is recorded by a commemorative inscription on the eastern tower. Around 1920 the
  > gate was isolated from the Aurelian Walls to ease traffic on its eastern side, and a bombing in
  > the Second World War destroyed the western stretch of wall that linked it to the Pyramid.
- **PUBLISH** the 1943 fact, in the Sovrintendenza's own date:
  > The Sovrintendenza Capitolina records that on 10 September 1943 Porta San Paolo was the scene of
  > the last attempt by the Italian army and Roman civilians to prevent the German occupation of
  > Rome.
- **DROP** "tra le più maestose e meglio conservate dell'intera cerchia" — the page's opening line,
  banned even attributed. Correctly caught.

### 2.11 Museo della Via Ostiense — **PUBLISH. The finder's "hold" is overturned.**

The finder held this for want of an institutional source, having tried the wrong hosts. The source
was inside a page it had already fetched. The Sovrintendenza Capitolina's *Porta San Paolo* page
states:

> All'interno del cosiddetto Castelletto, la controporta simile a una piccola fortificazione
> edificata da Massenzio all'inizio del IV secolo d.C., è attualmente ospitato il **Museo della Via
> Ostiense della Soprintendenza Speciale di Roma**, dove sono esposte ricostruzioni dei porti di
> Ostia e dei monumenti ritrovati lungo la via Ostiensis.

That gives the operator, the exact location and the holdings — everything the finder said was
missing except hours. Nominatim has it as a relation at Via Raffaele Persichetti 3, San Saba, both
methods. Publish:

> A museum inside Porta San Paolo, at Via Raffaele Persichetti 3. The Sovrintendenza Capitolina
> states that it occupies the Castelletto — the counter-gate, built like a small fortification by
> Maxentius at the start of the 4th century AD — that it is run by the Soprintendenza Speciale di
> Roma, and that it displays reconstructions of the ports of Ostia and of monuments found along the
> via Ostiensis. No source states its opening hours, so none are given here.

I checked the Soprintendenza Speciale's own *Luoghi della cultura* index: the museum is not listed
there and its slug 404s. That absence stays out of the page; the sentence above is what the page
can honestly say.

### 2.12 Palazzo delle Poste Roma Ostiense — **PUBLISH, escalated against Testaccio**

Confirmed from it.wikipedia: 1932 competition called by the Ministero delle comunicazioni, won by
Adalberto Libera; inaugurated 28 October 1935; built 1933–35; symmetrical on a wide flight of steps,
laid out on geometric ratios and the golden section; three volumes in a U; faced in smooth white
marble; a portico closing the rectangular court on the front; end blocks with a crossed-diagonal
motif masking the internal stairs; houses the "Roma Ostiense" post office, frazionario 55645.

- **REWRITE — the De Renzi story, attributed, because it rests on a page the finder could not read
  and I did not try to.** it.wikipedia cites ArchiDiAP for it. Publish:
  > it.wikipedia records that Libera and Mario De Renzi entered designs for four post offices in the
  > same competition, two signed by each, because the rules required a single signatory, and that De
  > Renzi was only later established as co-author of the Via Marmorata building.
- **ESCALATED — Via Marmorata is the Testaccio boundary and Nominatim is split on this building.**
  Forward: Testaccio. Reverse at the same point: San Saba. Against that, it.wikipedia's article says
  outright "situato in via Marmorata, nel rione San Saba" and categorises it `Roma R. XXI San Saba`.
  Two for San Saba, one for Testaccio, and the finder's "both methods" was not accurate. I rule
  **provisional PUBLISH for San Saba** and flag it for a cross-check against the Testaccio file.

### 2.13 Palazzo FAO — **PUBLISH, with the dates and the legal status rewritten**

- **DROP, and I confirm the finder's reasoning independently.** The extraterritoriality sentence in
  it.wikipedia is sourced to a single 2008 *La Stampa* article, and the $1 symbolic rent and
  *usucapione* paragraph carries **no citation at all**. FAO is a UN specialised agency under a
  bilateral headquarters agreement, not a Lateran Treaty property, and the vatican_ruling does not
  reach it. **Publish no immunity, extraterritoriality, rent or usucapione claim.** The same
  restraint applies to the Saudi and Palestinian embassy buildings: name them or don't, but
  characterise no legal status.
- **REWRITE — the date conflict does not resolve, so do not resolve it.** The *Palazzo FAO* article
  gives 1938–52 and completion in 1952; the *San Saba* article gives inauguration in 1951. I found
  no third source. Publish:
  > Designed by Vittorio Cafiero and Mario Ridolfi and begun in 1938 as the seat of the Ministero
  > dell'Africa Italiana — formerly the Ministero delle Colonie, which was abolished in 1953 — it
  > was finished after the war and given to the Food and Agriculture Organization of the United
  > Nations, whose headquarters it is.

  No completion year. Two sources give two, and a page that picks one is guessing.
- **PUBLISH** the address from FAO's own contact page, which I re-fetched: *Viale delle Terme di
  Caracalla, 00153 Rome*, tel (+39) 06 57051. Note this is **not** Viale Aventino; the it.wikipedia
  location sentence ("at the start of Viale Aventino on the corner with Viale delle Terme di
  Caracalla") describes a corner, which is a position, not vague proximity — it may stand.
- **PUBLISH** the Viale Africa detail, confirmed verbatim in the rione article:
  > Viale Aventino, opened in those years, was originally named Viale Africa; the name later passed
  > to a street in EUR.
- **Boundary — confirmed San Saba.** At the FAO building's own OSM relation (41.88249/12.48847)
  Nominatim returns San Saba by forward and reverse. (A point 130 m south on Viale Aventino returns
  Ripa, which is why this needed testing at the right coordinate.)

### 2.14 Piazza Albania and the Monumento a Giorgio Castriota Scanderbeg — **PUBLISH, heavily rewritten**

This is the record the finder most under-served. The Sovrintendenza page it dismissed as dateless is
the best source in the entry.

- **REWRITE — the date.** Publish the official one:
  > The Sovrintendenza Capitolina states that the monument was unveiled in Piazza Albania by Benito
  > Mussolini on 27 October 1940.

  **DROP** the Wikipedia "bronze of 1939". If the author wants Romano Romanelli's name it must be
  attributed — the official page does not name a sculptor:
  > it.wikipedia gives the sculptor as Romano Romanelli.
- **PUBLISH** the square's own history, which the finder never found and which is the best material
  in the record:
  > The Sovrintendenza Capitolina states that the square was formerly known as Piazza Raudusculana,
  > after the gate that opened here in the stretch of the Servian Walls, and had recently been
  > renamed Piazza Albania in connection with the annexation of Albania to the Kingdom of Italy in
  > 1939. A commemorative epigraph was placed on the main face of the base in 1968 by the
  > Amministrazione capitolina, for the fifth centenary of the condottiero's death.
- **PUBLISH** the description as given: an equestrian bronze of Giorgio Castriota Scanderbeg
  (1403–1468) on a semi-oval pedestal above a rectangular travertine base, riding at a walk in
  traditional Albanian dress, with the two-horned helmet whose goat protome carries long horns, a
  drawn sword raised in his right hand.
- **Boundary — confirmed San Saba at the square's own OSM way** (41.88016/12.48338), both methods.
  And the finder's Ripa finding for the **Scatola Archeologica** is confirmed exactly: at its own
  node (41.88083/12.48363) Nominatim returns `Ripa` forward and reverse, at Piazza Albania 35. The
  square straddles; the Scatola is Ripa's. **DROP the Scatola from San Saba** — the finder already
  did, and it is right.

### 2.15 Parco della Resistenza dell'Otto Settembre, with the Fontana dell'Anfora — **PUBLISH, upgraded**

The finder flagged this as single-method and lower-confidence. **I ran the second method and it
agrees.** The park is an OSM relation named *Parco della Resistenza dell'Otto Settembre*, San Saba
by forward and reverse; the Fontana dell'Anfora is a named OSM way, San Saba by forward and reverse.
Not lower-confidence. Ship it at full weight.

Roma Segreta confirmed verbatim: inaugurated 21 April 1939 to a design by Raffaele de Vico;
originally Parco Cestio; the area behind the Palazzo delle Poste bounded by Piazza Albania, Via
della Piramide Cestia, Via Marmorata and Viale Manlio Gelsomini; the name Parco Cestio stayed with
the small green patch on the other side of Via Marmorata, which belongs to Rione Testaccio; the
fountain to de Vico's design, a wide circular basin at ground level with an octagonal travertine
base carrying a bronze amphora with eight spouts like raised trunks, a central jet, and eight holes
in the belly of the vessel.

- **REWRITE — the 1943 date, because two sources give two.** Roma Segreta says the park is dedicated
  to the events of 8 September 1943 at Porta San Paolo; the Sovrintendenza Capitolina dates the
  fighting at the gate to 10 September 1943. Do not blend them:
  > Laid out as Parco Cestio, for the nearby Pyramid, and later renamed for the Resistance of
  > September 1943 at Porta San Paolo.

  Keep the park's full name as the record's name and let it carry the date it carries.
- **PUBLISH** the Testaccio disambiguation as written, and the finder's warning not to confuse it
  with Pietro Lombardi's Fontana delle Anfore in Testaccio — which is a different fountain and, per
  its OSM position, outside San Saba.

### 2.16 The ICP garden quarter (Quadrio Pirani) — **PUBLISH**

Confirmed almost sentence for sentence against the rione article: between 1907 and 1914 the Blocco
Popolare governing the city — radicals, republicans and socialists under mayor Ernesto Nathan — had
the Istituto Case Popolari build ten lots of housing on the Piccolo Aventino, between the church and
the walls, for the salaried lower-middle class; the area had been zoned as public green by the
post-1870 master plan, next to the Passeggiata Archeologica; designed, like the ICP housing in
Testaccio, by the then-young Quadrio Pirani; streets named after architects — Bernini, Borromini,
Baccio Pontelli, Palladio, Pirro Ligorio, Bramante; two-family villini each with a small garden, and
blocks of no more than four floors with courtyards, each faced in brick the colour of the old
brickwork of the church and the walls; the site a plateau on a hilltop, crossed by ramps and
stairways dropping to the walls or to Testaccio below.

- **The finder's own instinct on the ranking claim is correct and I adopt it.** "among the last
  planned residential settlements inside the Aurelian Walls" goes. So does the rione article's "gli
  ultimi due rioni dentro le mura". **REWRITE** to the plain sequence, which is a position in an
  official series and therefore welcome:
  > San Saba and Testaccio were carved out of Ripa in 1921, following Rome's first master plan of
  > 1909.
- **DROP** Portoghesi's "la prova più matura della sua carriera" — superlative, and about Testaccio.
- **PUBLISH** the map corroboration as fact, not as method: Via Baccio Pontelli and Via Andrea
  Palladio are stairways, and Viale Giotto runs along the inside of the Aurelian Walls.
- **DROP any location for the cippus.** The finder is right: the *ID QVOD INTRA CIPPOS…* inscription
  exists only as a photo caption with no address. The text may be quoted; no street may be given.

### 2.17 Mercato di San Saba — **DROP**

OSM only. It is slightly better attested than the finder said — a named OSM *way*, not a bare node,
San Saba by both methods — but there is still no institutional record, no hours, no operator. A
record whose entire content is "there is a market here" is padding. Hold for a wave that can reach
Roma Capitale's market register.

### 2.18 Stadio "Nando Martellini" — **REWRITE, then a thin PUBLISH**

- **DROP the address the finder gave.** "Largo delle Vittime del Terrorismo 1" is not the OSM tag.
  The tag, as Nominatim returns it, is **"1, Viale Guido Baccelli"**.
- Publish at minimum weight:
  > Stadio "Nando Martellini" (Terme di Caracalla), an athletics stadium at Viale Guido Baccelli 1.
  > No source states its opening or event arrangements, so none are given here.

  it.wikipedia's *Santa Balbina* article independently refers to "il moderno Stadio delle Terme",
  which corroborates existence and nothing else. Assert no opening or event information. If the
  author would rather hold it, that is defensible; I would ship the two lines.

### 2.19 The Caracalla Festival — **DROP as a record**

I re-fetched `operaroma.it/stagione/`. "Caracalla Festival" is there as a season filter and
"Caracalla" is in the main navigation, but the only dated sponsor block on the page reads **"Partner
Caracalla 2017"**, and there is no venue address, no current dates and nothing tying the current
season to the site. A festival is not a place, and filing it as `theater` would misdescribe the
Baths. **DROP the standalone record.** One attributed sentence may go inside 2.1:

> The Teatro dell'Opera di Roma programmes a Caracalla Festival, which it lists as a strand of its
> season.

Nothing operational. Do not lift the 2015 programme.

### 2.20 Il Terzo Paradiso — **DROP as a record.** OSM only, and the Soprintendenza's Caracalla page
does not mention it. The finder's alternative — a sentence folded into 2.1 — is still single-source.
Leave it out entirely.

### 2.21 Angelo Mai — **DROP**

I retried `angelomai.org` and got **HTTP 500** again. Nominatim confirms the venue exists as a
relation at Viale delle Terme di Caracalla 55a in San Saba, but existence is not content: no
programme, no hours, no self-description. The finder is right that it would be a good entry; it
cannot be written from what is reachable. Hold for the next wave.

### 2.22 Libreria Internazionale Il Mare — **PUBLISH, with three claims stripped**

The footer is as good as the finder said and I confirmed it: *"Oltremare Srl … via Leon Battista
Alberti, 1 (Rione San Saba) 00153 Roma"*, `ilmare@ilmare.com`, +39 3476141118. The shop names its
own rione. Nominatim puts Via Leon Battista Alberti 1 in San Saba both ways.

- **DROP** "La prima e più fornita libreria di mare al mondo" — flat superlative.
- **DROP** "Fondata nel 1975 da Giulia D'Angelo" — a trading-duration claim, which the corpus rule
  says an official website does not establish.
- **DROP — a third the finder missed:** "La prima libreria della capitale dedicata interamente alla
  narrativa di mare", on the same front page. Same defect. The site's own `<title>` also reads
  "…dal 75", which is the same duration claim wearing a hat; keep it out of the record's name.
- **PUBLISH:**
  > A bookshop specialising in the sea, trading as Oltremare Srl at Via Leon Battista Alberti 1. Its
  > departments are books, nautical charts, electronic charts, fishing charts, geographic charts,
  > globes, instruments and prints, and it prints nautical and geographic charts to custom sizes.
  > The shop states it carries over 30,000 titles.

  The count is a count, which the rules allow, but it is the shop's own figure and must be
  attributed as above.

### 2.23 Teatro Anfitrione — **DROP.** A one-word body is not a source. Nothing publishable beyond a
name.

### 2.24 Eating and drinking — three PUBLISH, eight DROP

- **Taverna Cestia — PUBLISH.** I re-fetched it. Address Viale della Piramide Cestia 67, 00153 Roma;
  phone 06.57.43.754 / 393.6106061; Roman cooking; pizza "bassa e scrocchiarella"; private functions
  by enquiry. No hours anywhere on the site, so none are given.
  **DROP** "dal 1967" and "da più di 50 anni" — trading duration, correctly caught. **DROP two more
  the finder missed on the same page: "a due passi dalla Piramide"** (vague proximity) **and "uno
  spazio storico"** (an unevidenced age claim about itself).
- **Baccio e i gradini — PUBLISH.** Viale della Piramide Cestia 25; own site; pizza, fritti and
  beer; booking by WhatsApp. Nothing else.
- **Saba Caffè & Cucina — PUBLISH, thin.** Via di San Saba 30; own site reachable. Restaurant and
  pinseria. Assert no hours.
- **DROP:** La Villetta (site 403; the domain name is a trading-duration claim and unusable),
  Ricca Aventino, al callarello, Torcè, Tram Depot (parked page, and 22 m from the Testaccio line),
  Bar Piramide, Verso, Cafè de Parc, Caffè Braccio, Sake Boutique, BePlace Aventino (unfetched).
- **DROP, emphatically: The Corner Townhouse.** The finder found OSM's `website` tag pointing at a
  hair salon in Woodhouse Mill, England. That is the correct call and the right reason.

### 2.25 Everything in the finder's §3.25 — **DROP as records.** Piazza Gian Lorenzo Bernini (fold
into 2.3), Piazza Remuria, Largo Bruno Baldinotti, Largo Enzo Fioritto, Largo delle Vittime del
Terrorismo, both Porta Capena memorials, the Enzo Fioritto war memorial, the Mura Aureliane stretch
(a sentence in 2.16), the Mura Serviane fragments (they fall in two rioni), St Stephen's School,
Scalea Padre Simpliciano (fold into 2.5), Parco San Saba playground, the two embassies, and the
neighbourhood commerce. The finder listed them so they could be seen to have been considered, which
is the right discipline, and none of them clears the bar.

One correction inside this list: the Servian Wall near Santa Balbina is **corroborated** —
it.wikipedia's *Santa Balbina* article states "Nei pressi della chiesa si trovano resti delle mura
serviane", and the Scanderbeg page independently records the Porta Raudusculana in the Servian
stretch at Piazza Albania. Still not a San Saba record, for the reason the finder gives.

---

## 3. Straddlers escalated to the arbitrator

I resolved four of the finder's six and I am escalating five, two of which the finder did not flag
at all. **The Celio article's boundary footnote (§1) should be put in front of the arbitrator
first** — it settles the shape of the argument for most of these.

| # | feature | evidence | my lean |
|---|---|---|---|
| 1 | **Casina del Cardinal Bessarione** | No Nominatim record under its name; the OSM housenumber does not reproduce; sits on Via di Porta San Sebastiano, which the Celio article names as the boundary. Only two aggregators put it in San Saba. | **Genuinely unresolved.** Do not grade it "firm". |
| 2 | **Arco di Druso** | it.wikipedia category `Roma R. XIX Celio`; listed under Celio's archaeological sites; Nominatim **reverse** = Celio. Against: Nominatim forward, Roma Segreta, ring test at 1 m on the boundary street. | **Celio** |
| 3 | **The Porta Capena basin** — the square, the Parco di Porta Capena, the two memorials, the Casina Vignola Boccapaduli | Piazza di Porta Capena **is** the Celio/San Saba/Ripa boundary per the Celio footnote, which is why both rione articles list it. At their own OSM ways, Nominatim now returns **San Saba** for both the square and the Parco (the finder's Celio result does not reproduce). The Casina Vignola Boccapaduli is listed under **Celio's** civil architecture with coordinates 41.884963/12.489668, matching the finder's ring test. | Square and park **lean San Saba**; the Casina Vignola is **Celio's** — drop it from San Saba outright. One ruling should cover all five features. |
| 4 | **Porta San Sebastiano and the Museo delle Mura** | Four answers: ring = Ardeatino (gate) / Celio (museum); Nominatim forward = **Appio-Latino** for the gate and Municipio VII for the museum; Nominatim reverse = no `quarter` for either; Roma Segreta = S.Saba; and **the Celio article says outright the gate is "condivisa ad est tra il rione Celio e il rione San Saba"**. | **Not San Saba's to take.** A source explicitly calls it shared. |
| 5 | **Palazzo delle Poste Roma Ostiense** — *not flagged by the finder* | Nominatim forward = **Testaccio**, reverse = San Saba, at the same point on the boundary street. it.wikipedia says San Saba in prose and in its category. | **San Saba**, but must be cross-checked against the Testaccio file before either ships it. |

Resolved and **not** escalated: Santa Maria in Tempulo (at its own OSM way Nominatim now returns San
Saba both ways, but it stands on Via di Valle delle Camene, which the Celio footnote names as the
border, and the Celio article lists it — **leave it to Celio, it is low-value either way**); the
Parco di San Sebastiano (my reverse at the relation centre returns San Saba, not the finder's Celio
— but the centre falls on San Cesareo, so the polygon is suspect; **low value, drop**); the Oratorio
dei Sette Dormienti (on the boundary street, listed under Celio, **drop**); Piazza Albania (square
San Saba, Scatola Ripa — **the finder had this exactly right**).

---

## 4. The negative finding — confirmed, and it should be handed to Celio

The finder called the Scipios material its strongest negative finding. **It is, and it survives
re-fetching intact.** The Sovrintendenza Capitolina's *Parco degli Scipioni* page carries, in a
structured field:

> **Dove si trova: Municipio I, Rione XIX - Celio**

Roma Capitale's own statement. Not San Saba's. The same page gives 1928–1931, 16,000 m², entrances
at Via di Porta Latina 10 and Via di Porta San Sebastiano (currently closed), the garden by Raffaele
de Vico completed in 1931, hours 7.00 to sunset, the 1614 first modern discovery of the Sepolcro
degli Scipioni, the 1780 re-excavation, Pietro Campana's 1831 discovery of the Colombario di
Pomponio Hylas, three further colombari in the adjacent Vigna Codini from 1840, the Comune's
purchase after unification and the X Ripartizione's restoration campaign from 1926. **All of it
belongs in the Celio file and the arbitrator should route it there.**

Two of the finder's details on this material are **not** on the page it cited and must not travel
with it: "consul 298 BC" for Scipio Barbatus, and "discovered 1780 by the Sassi brothers enlarging a
cellar". The page says only "agli inizi del III sec. a.C. dal console Lucio Cornelio Scipione
Barbato" and "Si tornò a scavarlo nel 1780". Whoever writes Celio must re-read the *Sepolcro degli
Scipioni* page for those.

The rest of §5 is confirmed: the Piramide di Caio Cestio is **Testaccio's** (Nominatim both ways,
and the Soprintendenza Speciale lists it among its own sites), and I independently saw the Celio
article list the **Colosseo** among Celio's archaeological sites — corroborating, but not
substituting for, the wave-1 ruling the brief describes.

---

## 5. Tier

**GUIDE. 17 surviving records; 18 if the arbitrator grants the Casina del Cardinal Bessarione.**

1. Terme di Caracalla (Domus di Vigna Guidi folded in) · 2. Basilica di San Saba (monastery folded
in) · 3. Basilica di Santa Balbina · 4. Chiesa dei Santi Nereo e Achilleo · 5. Chiesa di San Cesareo
de Appia · 6. Porta San Paolo · 7. Museo della Via Ostiense · 8. Palazzo delle Poste Roma Ostiense ·
9. Palazzo FAO · 10. Piazza Albania with the Scanderbeg monument · 11. Parco della Resistenza
dell'Otto Settembre with the Fontana dell'Anfora · 12. The ICP garden quarter · 13. Libreria
Internazionale Il Mare · 14. Stadio "Nando Martellini" · 15. Taverna Cestia · 16. Baccio e i gradini
· 17. Saba Caffè & Cucina. *(+18. Casina del Cardinal Bessarione, pending §3.)*

The finder predicted "12 to 15 to survive" and graded the rione "a thin guide, closer to a
town-page". **I grade it higher than the finder did, and the reason is not generosity.** Three of
its holds were wrong: the Museo della Via Ostiense had a source inside a page the finder had already
downloaded; the Parco della Resistenza was single-method only because the second method was not run,
and it passes; and the Scanderbeg monument had an official date the finder's truncated fetch missed.
Twelve of the seventeen carry institutional sourcing — Soprintendenza Speciale, Sovrintendenza
Capitolina, Parco Archeologico dell'Appia Antica, the Diocese of Rome, the parish, FAO. That is a
better evidential base than the raw count suggests, and it is a guide, comfortably.

It is **not** a town-page: three of the seventeen are restaurants with almost no content, the
commercial layer is genuinely thin, and the rione's two largest draws sit at its edges. The finder's
closing description — one very large site, four churches, one gate, two Novecento landmarks and a
quiet brick garden-suburb — is accurate and should survive into the page.

---

## 6. Rulings ledger

**PUBLISH 14** — Terme di Caracalla · Basilica di San Saba · Santa Balbina · Santi Nereo e Achilleo
· San Cesareo de Appia · Porta San Paolo · Museo della Via Ostiense · Palazzo delle Poste · Palazzo
FAO · Piazza Albania + Scanderbeg · Parco della Resistenza + Fontana dell'Anfora · ICP garden
quarter · Libreria Il Mare · Baccio e i gradini.

**REWRITE 21** — Caracalla hours (full calendar) · Caracalla superlatives ×4 · Domus di Vigna Guidi
(fold + "Ancient Monuments") · San Saba address · San Saba history dates · Santa Balbina status ·
Santa Balbina convent · Santa Balbina address · Nereo hours (both, attributed) · Nereo pope · Nereo
façade + 2025 restoration · Bessarione hypothesis · Bessarione address · Poste De Renzi attribution
· FAO dates · Scanderbeg date · Scanderbeg sculptor attribution · Parco 1943 date · ICP ranking
claim · Stadio address · Il Mare description.

**DROP 26** — Monastero di San Saba (separate record) · Caracalla 130,000 m² · San Cesareo
superlative · San Cesareo proximity · Bessarione "raro esempio" · Arco di Druso (from San Saba) ·
Arco di Druso proximity · Porta San Paolo superlative · Mercato di San Saba · Caracalla Festival
(record) · Il Terzo Paradiso · Angelo Mai · Teatro Anfitrione · Il Mare superlative · Il Mare
founding date · Il Mare "prima libreria della capitale" · Taverna Cestia trading duration · Taverna
Cestia proximity · Taverna Cestia "spazio storico" · La Villetta · The Corner Townhouse · seven
further OSM-only cafés and hotels as one · FAO extraterritoriality · FAO $1 rent / usucapione ·
cippus location · Scatola Archeologica (Ripa) · Casina Vignola Boccapaduli (Celio) · Porta San
Sebastiano + Museo delle Mura (from San Saba) · Santa Maria in Tempulo · Parco di San Sebastiano ·
Oratorio dei Sette Dormienti · the whole of §3.25 as records.

**ESCALATED 5** — Casina del Cardinal Bessarione · Arco di Druso · the Porta Capena basin (five
features, one ruling) · Porta San Sebastiano + Museo delle Mura · Palazzo delle Poste vs Testaccio.

**Photographs: `"photos": []` on every record.** The finder's §7 notes are correctly parked and its
freedom-of-panorama warnings on the Palazzo FAO, the Palazzo delle Poste and Il Terzo Paradiso are
sound reasoning for the image wave to inherit.
