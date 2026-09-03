# Ripa (R. XII, code 112) — VERIFIER verdicts

Adjudication of `docs/rome/ripa-finder.md`. Ruled **2026-09-02**.
I did not gather this evidence and I owe it no loyalty. Every verdict below is mine.

**Tally across the finder's 77 numbered candidates: 22 PUBLISH · 25 REWRITE · 30 DROP.**
**Surviving places: 47. TIER RULING: GUIDE** — the floor is 4 and Ripa clears it by an order of
magnitude, with four independent clusters and official-source hours on five records.

---

## 0. Re-fetch audit — thirteen sources, not five

I re-fetched every source the finder leaned on hardest and read the returned text myself:

| # | source | result |
|---|---|---|
| 1 | `it.wikipedia.org` `Ripa_(rione_di_Roma)` via `action=raw` | **Confirms.** Border streets, *"Appartiene al rione Ripa anche l'Isola Tiberina"*, the 1921 separation of Testaccio and San Saba, the arms, the Anagrafe 1936–39 and Impresa Tudini & Talenti — all verbatim as quoted. |
| 2 | `turismoroma.it/it/luoghi/ponte-palatino` | **Confirms.** *"nei Rioni Ripa e Trastevere"*, *"Lungo poco più di 155 metri e largo circa 19"*, the still-functioning Cloaca Maxima, Vescovali 1886–1890, the "architettura funzionale" phrase. |
| 3 | `turismoroma.it/it/luoghi/tempio-di-portuno` | **Confirms.** IV/III c. BC with the II c. present fabric, four Ionic columns, Santa Maria de Gradellis → Santa Maria Egiziaca → deconsecrated **1916**, *"L'edificio è visibile dall'esterno"*. |
| 4 | `basilicasantasabina.it/orari/` | **Confirms exactly.** Su–Mo 12.00–19.00, Tu–Sa 08.00–19.00, days of precept as Sunday, *"L'ingresso è gratuito"*, no booking, *"GLI SCAVI NON SONO ACCESSIBILI"*. |
| 5 | `circomaximoexperience.it` | **DOES NOT SAY WHAT THE FINDER SAID.** Two errors — see §1. |
| 6 | `turismoroma.it/it/luoghi/mitreo-di-santa-prisca` | **Confirms.** *"Visite temporaneamente sospese. Verificare il sito ufficiale."*, III c. AD, the AD 202 inscription, Cautes/Cautopates, violent destruction c. AD 400. |
| 7 | `trattoriasoralella.it/it/` | **Partly fails.** Hours confirmed exactly; **no street address appears on the page** — see §1. |
| 8 | `turismoroma.it/it/luoghi/ponte-sublicio` | **Confirms the finder against himself.** *"l'odierno Ponte Sublicio collega i rioni Trastevere e Testaccio all'altezza di Porta Portese."* |
| 9 | `rhinocerosroma.com` (bare host — `www.` fails TLS, the cert has no `www` altname) | **Confirms** *"Via del Velabro 9, 00186 Roma RM"*, Agrippina S.R.L., no hours. One contact detail wrong — §1. |
| 10 | `turismoroma.it/it/luoghi/circo-massimo` | **Partly fails.** 600 × 140 m and the Trajanic rebuild confirmed; the 2016 attribution and the Arco di Tito are **not on this page** — §1. |
| 11 | `turismoroma.it/it/luoghi/la-torre-della-moletta-...` | **Confirms and adds.** Frangipane from 1145, demolition 1943, 2016 works by Roma Capitale + Sovrintendenza Capitolina + Zetema, the 1930s Arco di Tito excavation — **and a full opening timetable the finder never reported.** §1. |
| 12 | `turismoroma.it/it/luoghi/casa-dei-crescenzi` | **Confirms**, including *"nel Rione Ripa"* and the vainglory inscription. The banned superlative is present exactly as quarantined. |
| 13 | `turismoroma.it/it/luoghi/bocca-della-verit%C3%A0` | **Confirms.** 1632, ~1.80 m, 1485, *Roman Holiday*, and **9.30–13.00 / 14.00–17.50 with tel. 06 6787759**. |
| 14 | `turismoroma.it/it/luoghi/aventino` | **Partly fails.** The keyhole sentence confirmed verbatim; **the Order of Malta visitor contact is not on this page** — §1. |
| 15 | `turismoroma.it/it/luoghi/roseto-comunale` | **Confirms**, and corrects the address — §1. |
| 16 | `it.wikipedia.org` `Villa_del_Priorato_di_Malta` `action=raw` | **Confirms the 1869 clause** — and exposes a ruling-2 hazard the finder did not see. §2. |

**Collision check re-run mechanically**, not inherited. I ran the fragment sweep myself over
`priv/seed_data/rome/*.json` — 450 places, 12 files. Every Ripa candidate is unclaimed. But the
finder's own table missed a fragment that matters:

> **`serviane` → 2 hits.** `castro-pretorio | mura-serviane-castro-pretorio-rome | **Mura Serviane
> (Servian Wall)**` and `trevi | trevi-resti-mura-serviane-magnanapoli | Resti delle Mura Serviane,
> Largo Magnanapoli`.

The slug is free; **the bare name "Mura Serviane" is not.** Castro Pretorio already owns it, and
Trevi solved the same problem by naming its stretch. See record 45.

---

## 1. Sources that do NOT say what the finder said they say

**(a) Circo Maximo Experience — two errors, one of them a fabricated gap.**
The finder wrote "Eight stops" and "the site's opening-hours block is behind a 'vedi info e orari'
link I did not resolve to a concrete timetable. Publish no hours." The page states **nine stops**
and carries a **complete 2026 timetable**: 2 Jan–31 May 10:00–16:00; 2 Jun–31 Jul 17:00–21:00;
1–9 Aug 17:30–20:30; 11–23 Aug 17:00–20:00; 25 Aug–13 Sep 16:30–19:30; 15–30 Sep 16:00–19:00;
1 Oct–23 Dec 10:00–16:00; 24 and 31 Dec 10:00–14:00; closed Mondays, 1 May and 25 December. The
prices, languages and the Santamaria/Forte voices are confirmed. A finder telling a verifier "no
source states the hours" when the source states them is the one failure mode this role exists to
catch.

**(b) Turismo Roma's Circo Massimo page does not carry two facts cited to it.** The 2016
investigations are on that page as *"Le indagini, concluse nel 2016"* with **no** naming of Roma
Capitale, the Sovrintendenza Capitolina or Zetema, and the 1930s Arco di Tito excavation is not
there at all. Both are on the **Torre della Moletta** page. Attribute them there or not at all.
That page also gives the emperor as **"Costante II"** where the finder wrote "Constantius II", and
says the obelisk was ***brought*** to Rome in 357, not *raised here*.

**(c) The Torre della Moletta page publishes hours the finder never reported.** The Circus Maximus
archaeological area: **Tuesday–Sunday**, winter (late Oct–late Mar) **09:30–16:00, last entry
15:00**; summer (late Mar–late Oct) **09:30–19:00, last entry 18:00**; tickets via Vivaticket or
060608. This is a genuine gain for records 22 and 24 and it must be used.

**(d) Trattoria Sora Lella's own site carries no street address on the page fetched.** The hours
are confirmed verbatim; "Via di Ponte Quattro Capi 16" is not on it. The corpus rule gives the
official site identity, location and hours — but only for what the site actually says. The address
must be re-sourced or omitted.

**(e) Turismo Roma's Aventino page carries no Order of Malta visitor contact.** The phone
06 67581398 and `visitorscentre@orderofmalta.int` are cited to it and are not there. Drop them.

**(f) Rhinoceros's apartments email is `hospitality@rhinocerosroma.com`**, not the
`+39 06 6784467`-only rendering; the finder also omitted the operating company's own registered
address (Via Cuma 2). The gallery address **Via del Velabro 9, 00186 Roma RM** is confirmed and
wins over OSM's via dei Cerchi, exactly as the finder argued.

**(g) The Roseto's address is fuller than reported:** *"Clivo dei Publicii, 3 / Via di Valle
Murcia, 6"*. Publish both, or neither — not half.

**(h) The Torre della Moletta page does not date the tower's construction to the 12th century** in
the text returned to me. It gives *"at least from 1145 property of the Frangipane"*. Publish the
1145 fact; drop the bare "12th century" attribution.

---

## 2. The Malta problem the finder half-solved

The finder was right that the SMOM is **not** a Lateran Treaty property and that ruling 2's
Art. 15/16 machinery does not reach it. He was right to forbid "in the Vatican" and "Vatican
territory". I confirmed the 1869 clause verbatim: *"gode del diritto di extraterritorialità dal
1869."*

What he missed is the sentence immediately around the keyhole, which I fetched and he did not
quote: it.wikipedia frames the view as **"tre Stati"** — the Aventine in the Italian state, the
villa's interior "appartenente al Sovrano Militare Ordine di Malta **in condizione di
extraterritorialità**", and Vatican City. **That framing is exactly what ruling 2 forbids:
extraterritoriality presented as a border, three sovereignties stacked across one doorway.** It
must not reach the page in any form, paraphrased or attributed.

Two further points against the finder:
- The extraterritoriality claim rests **only on it.wikipedia**, and the corpus rule says write what
  Roma Capitale or the institution says, not what Wikipedia says. Neither Turismo Roma's Aventino
  page nor its Santa Maria del Priorato page carries it in anything I fetched.
- I also searched `docs/rome/scope-vatican-and-extraterritorial.md` mechanically: **zero** hits for
  Malta, SMOM, Sovrano, Priorato, Aventino, Anselmo or 1869. The finder said Sant'Anselmo was not
  on that list. Neither is the Villa. Absence from that document is not a clearance for either.

---

## 3. Verdicts, record by record

Wording in **bold quotes** is the exact replacement text. The author uses it verbatim.

### 3.1 Forum Boarium, the Velabro, piazza Bocca della Verità

**1. Santa Maria in Cosmedin — REWRITE.** Substance publishes: the 6th-century diaconia, Hadrian I
in 782 over the Ara Maxima, the 12th-century form, Alfano Camerario's 34.20 m campanile with its
bell of 1289, the eighteen antique columns, the Deodato ciborium of 1294, the Kosmidìon etymology.
The finder's hours instruction was the timid half of the right answer; Turismo Roma states them and
I re-read them. Replace the hours line with:
> **"Turismo Roma gives the visiting hours as every day 09.30–13.00 and 14.00–17.50, and advises
> confirming on 06 6787759 or with the basilica. The Divine Liturgy is celebrated on Sundays at
> 10.30. The basilica is closed on 1 January."**
Do not mention OSM, the conflict, or that a conflict exists.

**2. Bocca della Verità — PUBLISH.** All five load-bearing facts confirmed verbatim. Drop "uno dei
simboli più celebri", which the finder already quarantined. "Adjoins record 1" is correct usage:
the disc is in the pronaos, which is physical adjacency, not wayfinding.

**3. Tempio di Ercole Vincitore — REWRITE.** Publish "circular temple of marble, c. 120 BC" and the
Vesta misattribution. **DROP the earliest-marble-building ranking in both its Italian and its
English form** — the finder correctly refused it and Turismo Roma's *"il primo edificio in marmo
costruito in città"* is the same claim wearing the tourist board's hat, which does not save it.
Absorb record 20 as one sentence:
> **"The building later served as the church of Santa Maria del Sole; with the recovery of the
> ancient monument the church was deconsecrated."**

**4. Tempio di Portuno — PUBLISH.** Confirmed verbatim, including the church sequence and the 1916
deconsecration, which absorbs record 19. Publish *"visible from the outside"* as the access line.
Do not publish Turismo Roma's *"uno degli edifici meglio conservati"* or its "wonderful" frescoes.

**5. Fontana dei Tritoni — PUBLISH.** Bizzaccheri for Clement XI, foundation stone 11 August 1717,
Moratti's tritons, the Albani octagon, the dismantled trough. The finder's instruction to prefer the
dedicated page's dated foundation stone over the piazza page's bare "1715" is correct method and I
adopt it.

**6. Piazza Bocca della Verità — REWRITE.** Drop *"Una delle piazze più belle di Roma"* entirely —
not softened, dropped. The 8th-century-BC Greek and Mycenaean finds, the ox-market ground and
"capital sentences were carried out here until 1868" all publish. The sentence listing the four
monuments the square gathers is a factual enumeration, not proximity language, and stands.

**7. Foro Boario — PUBLISH.** The Velabrum marsh, the 6th-century-BC drainage, the Portus Tiberinus
under the Anagrafe, the Trajanic warehouses, the Arch of the Argentarii of AD 204, the Janus arch of
c. AD 337–361, *"Area aperta al pubblico"*. All sound.

**8. Arco di Giano — PUBLISH, no hours.** The *Arcus Divi Constantini* identification, the
four-fronted plan, the 48 lost statues, the four surviving keystone figures, the Frangipane tower,
the 1827 uncovering and attic demolition. The finder's handling of the OSM/Turismo Roma hours
conflict is right — publish neither. Say nothing about a conflict.

**9. Arco degli Argentari — PUBLISH.** AD 204, the *argentarii et negotiantes boarii*, the erased
Plautilla and Geta, the six-metre marble facing, the 7th-century engulfment by San Giorgio's wall,
the drill holes. "Adjoins" is factual here and is allowed.

**10. San Giorgio in Velabro — REWRITE.** Publishes on it.wikipedia: the 9th-century enlargement of
a diaconal building, the rectory under the Order of the Holy Cross within the parish of Santa Maria
in Portico, the diaconate and its cardinal deacons (Boniface IX 1381–1385, Martin V 1406–1417,
John Henry Newman 1879–1890), the station church of the Thursday after Ash Wednesday under
Gregory II. **Strip every trace of the 404 hunt.** For hours:
> **"No source states its opening hours, so none are given here."**

**11. Cloaca Massima — REWRITE.** **DROP** *"la più antica fogna ancora pienamente funzionante al
mondo"* and also Turismo Roma's *"il più grande complesso fognario di epoca romana"*, which the
finder did not flag and which I confirmed on the Ponte Palatino page. Scope the record to what Ripa
can honestly hold — the outfall — rather than a sewer that crosses three rioni:
> **"Built at the end of the 6th century BC under Rome's last kings, using Etruscan vaulted-arch
> engineering. It runs from the Suburra by the Argiletum, the Forum, the Velabro and the Forum
> Boarium to the Tiber. Turismo Roma records it as still functioning where it discharges on the
> left side of Ponte Palatino, at lungotevere Aventino."**

**12. Casa dei Crescenzi — REWRITE.** **DROP** *"la più antica casa post-antica conservata in
città"*. Everything else confirmed verbatim, including *"nel Rione Ripa"*, the vainglory
inscription, the Ponte Emilio toll, the three popular names, and 1939 / 25 February 1939 with
Giovannoni and Petrignani. The by-appointment library access and tel. 06 6798075 publish.

**13. Palazzo dell'Anagrafe — PUBLISH**, with one attribution fix. it.wikipedia's rione article
names **Guidi and Valle** and the contractor Impresa Tudini & Talenti for 1936–39; Fasolo-working-
on-Valle's-drawings comes from Turismo Roma. Attribute each to its own source rather than merging
the three names into one sentence.

**14. San Giovanni Decollato — REWRITE.** Thin but not empty: the church, the street, and the
Arciconfraternita who attended the condemned. **DROP** "the executions of record 6 took place a
short distance away in the same square" — *"a short distance away"* is precisely the vague
proximity the rules ban. Replace with:
> **"The confraternity seated here accompanied those condemned to death in Rome."**
Nothing more. No cross-reference to the square.

**15. Museo della Camera storica — DROP.** One aggregator sentence, no hours, no institutional page,
no official site. The finder asked whether one sentence carries a museum record. It does not.

**16. Sant'Eligio dei Ferrari — DROP.** One sentence. The attached confraternity museum is a name in
a list and adds nothing.

**17. Sant'Omobono — REWRITE and ESCALATE.** Publishes as a located church at vico Jugario at the
foot of the Capitoline. **Escalated to the arbitrator:** vico Jugario *is* the Ripa/Campitelli
border and Campitelli is shipped with 450 places behind it. No text may mention a boundary test.

**18. Area sacra di Sant'Omobono — REWRITE and ESCALATE.** Publish the 1937 discovery and the two
temples, of Fortuna and Mater Matuta. **DROP "evidence of exceptional value"** — that is
it.wikipedia's *"documenti di importanza eccezionale"* translated, and translation does not launder
an evaluative claim. Replace with:
> **"Excavation produced material from archaic and republican Rome."**

**19. Santa Maria Egiziaca — DROP.** Duplicate of record 4. The finder called this correctly and
wrote it up rather than hiding it; that was the right instinct and I confirm the merge.

**20. Santa Maria del Sole — DROP.** Duplicate of record 3. Same ruling.

**21. Insula Volusiana — DROP.** OSM tag only. No official page, no dates, no description a guide
can carry.

### 3.2 Circus Maximus and the Valle Murcia

**22. Circo Massimo — REWRITE and ESCALATE.** Publishes: the Valle Murcia siting, 600 × 140 m, the
Tarquin-era racing and Caesar's masonry circus, the four factions, the triumphs and executions, the
Trajanic rebuild, the sixth-century abandonment and the industrial afterlife to the *passeggiata
archeologica*. Three corrections:
- Obelisk: **"an obelisk brought to Rome in 357 and now at the Lateran."** Do not name the emperor;
  the source's own naming is contested and the fact does not need him.
- Attribute the 2016 works and the 1930s Arco di Tito excavation to the **Torre della Moletta**
  page, not to the Circo Massimo page.
- **Add the hours the finder missed:**
> **"The archaeological area opens Tuesday to Sunday: from late October to late March 09.30–16.00,
> last entry 15.00; from late March to late October 09.30–19.00, last entry 18.00. Tickets are sold
> through Vivaticket and on 060608."**
**Escalated:** the north-eastern tip toward piazza di Porta Capena reads Campitelli. Ripa should
win on area and on the documentary via dei Cerchi border, but I am not the one to rule it.

**23. Circo Maximo Experience — REWRITE.** See §1(a). **Nine stops, not eight**, and the full 2026
timetable publishes. Prices €12.00 / €10.00 / €22.00 publish, with the family ticket bookable only
through 060608 or a Tourist Infopoint. On the finder's own question: **the ~40 minutes is the
operator's published length of a ticketed product, not a trip duration we invented, and it
publishes** — phrased as **"a route of about 40 minutes"**. Also escalated with the San Saba
cluster below.

**24. Torre della Moletta — REWRITE.** Publish *Turris in Capite Circi*, the mill that names it,
**"property of the Frangipane from at least 1145"**, the square plan in tufa with limestone and
flint chips and irregular brick, the fortification system demolished in 1943, the consolidation and
the internal stair to the upper viewpoint. **DROP the bare "12th century" construction date** —
§1(h).

**25. Mitreo del Circo Massimo — REWRITE.** Publishes as a located mithraeum under a building on via
dell'Ara Massima, also called Mitreo Pantanella after the 1930s clearance around the Pantanella
plant. No hours. Strip any hint that hours were sought.

**26. Ex Pastificio Pantanella — REWRITE.** **DROP** *"la prima fabbrica di Roma"*. Publish
1878–1881, Michelangelo Pantanella and Pio Scarselli, the 1929 move to via Casilina, the Palazzo dei
Musei phase with the two museums of 9 June 1929 and 21 April 1930, the 1939 closure and the 1952
dispersal, the Teatro dell'Opera stores since 1931, and the present departmental use. **DROP
"completion expected in 2026"** — a forward-looking claim about works, unverifiable and already
stale on its face.

**27. Rhinoceros — Fondazione Alda Fendi — REWRITE.** Address **Via del Velabro 9, 00186 Roma**,
confirmed by me on the bare host. The finder's reasoning that the official site beats the OSM
address is correct and I adopt it — but publish **no** account of the disagreement. Fix the
apartments email to `hospitality@rhinocerosroma.com`. No hours are stated on the site; publish none.

**28. Monumento a Giuseppe Mazzini — PUBLISH.** Ferrari, 1922–1949, the 1887/1890 proposals, the
1902 commission, the 1911 removal of the tempietto, the 1914 approval and Aventine siting, the
1922 first stone, the Fascist-era delay, Ferrari's death in 1929, the 1934 piazzale, the resumption
in 1948, inauguration 2 June 1949 on the centenary of the Roman Republic, the 27 m frieze, the
medallions, the 5 m bronze, the 1999–2000 restoration. Measurements and dates throughout — no
ranking anywhere. Clean record.

**29. Piazzale Ugo La Malfa / Belvedere Romolo e Remo — DROP as a separate record.** It is the
terrace record 28 already stands on, and its only independent content is an OSM viewpoint name. Fold
the 1934 piazzale and the reading of the Circus's garden layout into records 28 and 22.

### 3.3 The Aventine

**30. Santa Sabina — PUBLISH.** The strongest record in the file and the only one with hours read off
the institution's own page, confirmed by me character for character. Publish 425 and Peter of
Illyria over the *Titulus Sabinae*, Leo III and Eugene II, the 10th-century fortification under the
Crescenzi then the Savelli, 1219 and St Dominic, Fontana for Sixtus V in 1587, Muñoz's stripping,
the atrium columns, the carved cypress doors, the twenty-four fluted Corinthian columns, the
5th-century mosaic band naming Peter and Celestine I, the black basalt weight. Hours:
> **"Visiting: Sunday and Monday 12.00–19.00, Tuesday to Saturday 08.00–19.00, with days of precept
> running as Sundays. Entry is free and no booking is needed. Visits are not permitted during
> liturgical celebrations. The excavations are not accessible."**
**DROP** *"il perfetto esempio di basilica cristiana del V secolo"* — the finder called it an
evaluative superlative in effect and he is right. The Dominican convent is OSM-only; do not spin it
into a separate place.

**31. Giardino degli Aranci (Parco Savello) — PUBLISH, no hours.** The Savelli fortress ground over
the 10th-century Crescenzi castle, the enclosing medieval walls, De Vico's 1932 symmetrical layout,
the orange trees and St Dominic's tree in the cloister, the legible towers and drawbridge, the
Fontana marks, the 1613 demolition, 7,800 m². The hours line:
> **"No source states its opening hours, so none are given here."**
Note for the author: Turismo Roma's Aventino page gives the view from here as **Monte Mario and the
Gianicolo**. The "Tiber bend to St Peter's" phrasing comes from the Parco Savello page; use one
source's wording, not a blend.

**32. Santi Bonifacio e Alessio — PUBLISH.** 3rd–4th centuries, 986 addition of St Alexis, the 1217
rebuilding and translation of relics, the pre-1750-jubilee works to Nolli's design reworked by De
Marchis, the 1852–1860 Somaschi works under Pius IX, the 13th-century campanile of five orders, the
spoil columns of the cloister, the medieval portico, the staircase reliquary, Ottaviani and
Gavardini, the Becket relics. No hours.

**33. Giardino and Parco di Sant'Alessio — DROP.** Two OSM tags plus a name in a Wikipedia list. No
Roma Capitale page was reached and none is cited.

**34. Piazza dei Cavalieri di Malta — REWRITE.** Piranesi's authorship is confirmed on Turismo
Roma's Aventino page; the **1765** date I confirmed only on the Santa Maria del Priorato page, which
gives the Rezzonico commission as 1764 and the work as 1765. Write:
> **"Turismo Roma credits the square's present appearance to Giovanni Battista Piranesi, who
> designed the piazza in front of the priory alongside his work on the church, commissioned in 1764
> by Cardinal Giovanni Battista Rezzonico."**

**35. Villa del Priorato di Malta — REWRITE, hardest in the file.** See §2. Publishable:
> **"Piazza dei Cavalieri di Malta 3–4, on the Aventine. The complex of buildings and garden is the
> historic seat of the Grand Priory of Rome of the Sovereign Military Order of Malta and houses the
> Order's embassy to the Italian State. The hole in the portal at number 3 frames, at the end of an
> avenue of trees, the dome of St Peter's."**
**DROP outright:** the "three states" framing in every form; the 1869 extraterritoriality clause,
which rests on one aggregator sentence and which ruling 2 will not let us present as a border; the
06 67581398 and `visitorscentre@orderofmalta.int` contact, which is not on the page cited (§1(e)).
The finder's own prohibitions — never "in the Vatican", never "Vatican territory", never a Lateran
property — stand and I restate them.

**36. Santa Maria del Priorato — PUBLISH.** The 1761 dedication of *Della Magnificenza*, the 1764
Rezzonico commission, the 1765 neoclassical recasting as a funerary chamber for the Grand Priors,
the Egyptian/Etruscan/Roman iconography, the Rezzonico eagle, the four-pilaster façade, the
Latin-cross interior, the 2017 restoration recovering white stucco and ochre. **DROP** *"la più
famosa e suggestiva vista di San Pietro"*.

**37. Sant'Anselmo all'Aventino and the Badia Primaziale — PUBLISH.** The church with its monastery
forming the Badia Primaziale; from the Collegio's own site, the seat of the Benedictine
Confederation and the Curia of the Abbot Primate, about 90 monks and religious from over 30
countries, the Latin Divine Office with Gregorian chant, daily Mass and monthly adoration. The
site's own *"si trova sul Colle Aventino, accanto alla Piazza dei Cavalieri di Malta"* is the
institution locating itself and may be rendered as **"on the Aventine, at piazza dei Cavalieri di
Malta"** — do not translate *accanto* into wayfinding.

**38. Pontificio Ateneo Sant'Anselmo — DROP as a separate record.** Fold the single sourced fact
into record 37: **"The Pontifical Athenaeum of Sant'Anselmo, built between 1892 and 1900, stands in
the same complex."** The finder's warning that it must not be implied to be an extraterritorial
Lateran property is correct and the folded sentence carries no such implication.

**39. Il Negozio Benedettino — DROP.** OSM only, no official site, and the hours string is corrupt at
source. Nothing survives that a guide can print.

**40. Santa Prisca — PUBLISH.** Via di Santa Prisca 11; the *titulus Aquilae et Priscillae*
tradition, the 3rd-century finding of the body under Eutychian, the hagiography including the
Circus Maximus beasts and the beheading at the tenth milestone of the via Ostiense, the 1084
Norman devastation, the 1599 form. Mass times as Turismo Roma publishes them, winter and summer.
**DROP** *"uno dei più importanti centri cristiani"* for the domus Priscae — the finder quarantined
it and I confirm.

**41. Mitreo di Santa Prisca — PUBLISH.** Confirmed verbatim by me. Via di Santa Prisca 8; the 1934
chance discovery by the Augustinian Fathers; the two earlier buildings; the 3rd-century date; the
banquet room, Cautes and Cautopates with only Cautes surviving, Mithras and the reclining Saturn,
the AD 202 inscription, the procession frescoes, the seven planetary circles, the violent
destruction c. AD 400. **The `status` field must read as closed and the prose must say so:**
> **"Turismo Roma states that visits are temporarily suspended and advises checking the official
> site."**
No hours line, no mention of any unreachable ministry page.

**42. San Vincenzo de Paoli all'Aventino — DROP.** One sourced sentence.

**43. Roseto di Roma Capitale — REWRITE.** **Address: "Clivo dei Publicii 3 / via di Valle Murcia
6"** (§1(g)). Publish Flora and the *floralia* in Tacitus, the gardens and vineyards, the Orto degli
Ebrei from 1645, the 1934 move of the cemetery to the Verano, the 1950 municipal rose garden, the
stele, the menorah-shaped paths, about 1,100 species with the three named roses, and the Premio Roma
from its first edition in 1933 on the Colle Oppio. **DROP** *"Uno straordinario spettacolo"*,
*"prestigiosa"* and *"una magnifica vista"*. Opening:
> **"Turismo Roma states that the Roseto generally opens for the spring flowering from late April
> into May and again in October, with the calendar set each year."**
Ignore the stale OSM tag, and say nothing about it.

**44. Scatola Archeologica di Piazza Albania — PUBLISH, and ESCALATE.** Its own site carries the
8th-century-BC foundation evidence, the 6th–3rd-century tufa wall read as a watchtower within the
fortifications, the late-3rd-century raising of ground level, the mid-2nd-century domus inside the
*opus incertum* wall, the living and storage rooms and water disposal, and the six superimposed
floor levels from the 1st century BC to the 2nd century AD. Visits by booking; no concrete hours are
published, so give none. Escalated with the San Saba cluster.

**45. Mura Serviane at piazza Albania — REWRITE and ESCALATE, with a hard naming instruction.**
Castro Pretorio already ships a place **named "Mura Serviane (Servian Wall)"** and Trevi ships
"Resti delle Mura Serviane, Largo Magnanapoli". A third record called "Mura Serviane" is a name
collision even under a fresh slug. **Name this record:**
> **"Resti delle Mura Serviane, piazza Albania"**
Content: the 6th-century-BC walls traditionally begun under Tarquinius Priscus and extended with a
ditch under Servius Tullius, from whom they take their name; the Aventine stretch described by the
Scatola Archeologica as visible at piazza Albania and in via di Sant'Anselmo. **Escalated:** piazza
Albania *is* the Ripa/San Saba border, San Saba is in this wave, and the stretch is described as
running through two streets one of which is the line. The finder ranked this his second-least-
settled call and he was right to.

**46. Terme Deciane and the Casale Torlonia — PUBLISH.** Decius, AD 249; the remains beneath piazza
del Tempio di Diana and the Casale Torlonia which incorporates some of them. The finder's warning
holds and I restate it as binding: **the ancient Augustan *regio* XII is not the modern toponymic
code 112 and the two must never appear in the same sentence.**

**47. Arco di San Lazzaro — REWRITE and ESCALATE.** Publishes as a Roman-era arch on via Marmorata,
one sentence deep, which is at the floor of what a record can carry. **Escalated:** via Marmorata is
the Ripa/Testaccio border. If the arbitrator does not give it to Ripa outright it should go, since
there is not enough content to survive a contested claim.

**48. Clivo di Rocca Savella — DROP.** A stepped lane with one aggregator sentence. The finder asked
whether the corpus wants it; it does not — there is no content beyond the name and the route.

**49. Salita delle Pendici dell'Aventino — DROP.** OSM only.
**50. Giardino Antonio Maccanico — DROP.** OSM only.
**51. Giardino Piero Piccioni — DROP.** OSM only.
The finder recommended dropping these three himself. Confirmed. A single tag is not a paragraph.

### 3.4 Isola Tiberina

The island's ownership: I accept the finding. it.wikipedia's rione article states it outright, I
confirmed the sentence verbatim by `action=raw`, and the finder's feature-level method — classifying
things standing **on** the island rather than centroids that land in open water — is sound reasoning
about a boundary drawn down a river channel. It is still escalated as an artefact warning so the
arbitrator is not ambushed by a contrary centroid test.

**52. Isola Tiberina — PUBLISH.** About 300 × 90 m; ponte Cestio to Trastevere of 46 BC and ponte
Fabricio of 62 BC, also ponte Quattro Capi; the 509 BC grain legend; the tufa bank; the 291 BC
Sibylline embassy to Epidaurus and the serpent; the architectural shaping as a ship with stern, prow
and an obelisk for a mast; San Bartolomeo rising on the temple's remains; the continuing medical
vocation. *"Unica isola urbana del Tevere"* is a count of one and publishes, exactly as the finder
argued. Fold in the ship's-prow revetment from record 60 and the Ospedale Israelitico clause from
record 61.

**53. San Bartolomeo all'Isola — PUBLISH.** Otto III at the end of the 10th century over the
Aesculapius temple; the Adalbert dedication and his death in 997; the 11th–12th-century
restorations; the 1557 flood and Torriani's 17th-century rebuilding; the two-storey façade and
portico; the porphyry sarcophagus of St Bartholomew; Antonio Carracci's *Flagellation*; the
Veneranda confraternita of 1760, the Pius VI cemetery permission, the red hooded cloaks and the name
Sacconi Rossi, and the recovery of bodies from the Tiber; the 12th-century Romanesque campanile and
the hollowed-column wellhead; the Comunità di Sant'Egidio's presentation of it as the sanctuary and
Memoriale of the new martyrs. Memoriale hours **Saturday 09.30–13.30 and 15.30–17.30**, otherwise by
booking through the basilica. The finder is right that Turismo Roma's *"tra il Rione Trastevere e il
quartiere ebraico"* is a locational gloss and not a rione attribution; keep it out.

**54. San Giovanni Calibita — DROP.** One sourced sentence, on the same footing as records 16 and
42, which I dropped. Consistency requires the same answer.

**55. Ospedale Isola Tiberina – Gemelli Isola — REWRITE.** Publish as a historic institution, never
as somewhere to visit. Via di Ponte Quattro Capi 39; founded by the Hospitaller Order of St John of
God, the Fatebenefratelli; on the site of the Aesculapius temple; Turismo Roma dates the foundation
to 1584; renamed Ospedale Isola Tiberina – Gemelli Isola on 1 September 2022 after purchase by
Gemelli Isola – Società Benefit S.p.A. **Do not publish 292 BC and 291 BC together** — two sources,
two different events; carry the 291 BC plague legend in record 52 and give the hospital record no
BC date at all. No hours, no visitor framing.

**56. Oratorio di Gesù al Calvario e di Maria (Sacconi Rossi) — PUBLISH.** Deconsecrated since 1988;
oratory of the Franciscan monastery north of San Bartolomeo; subsidiary church of the parish of
Santa Maria in Portico; the All Saints' Day wreath cast into the river for the drowned, now
continued by the Fatebenefratelli and the confraternity of Santa Maria dell'Orto. "The point of the
island facing Ponte Rotto" is a named location, not proximity language, and stands.

**57. Torre Caetani — DROP.** OSM for the name and position, and a restaurant's marketing line about
its own premises for the date. The finder said as much himself. That is not a source for a
13th-century tower.

**58. Guglia di Pio IX — DROP.** One entry in a Wikipedia "Altro" list.
**59. Statua dei quattro santi — DROP.** OSM only, and probably the same object as 58 under another
tag — which is itself a duplication risk.
**60. Rilievo di Asclepio — DROP as a record.** The relief is OSM-only; the ship-shaping it belongs
to is sourced and goes into record 52.
**61. Ospedale Israelitico — DROP as a record.** One clause in one source. Fold the clause into
record 52's medical-vocation sentence, as the finder himself suggested.

### 3.5 Bridges

**62. Ponte Fabricio — PUBLISH and ESCALATE.** 62 BC replacing the timber bridge Livy has standing
in 192 BC; the four inscriptions naming Lucius Fabricius as *curator viarum*; the Lollius and
Lepidus repairs; Horace; Eugene IV's travertine paving in 1447 and Innocent XI's 1679 consolidation;
the two depressed arches with the relieving arch; the construction in *cementizio*, Gabine stone and
tufa faced in travertine; the four-fronted herms and the name Ponte dei Quattro Capi attested by the
early 16th century; the beheaded-architects legend; the name dei Giudei. **DROP** *"il ponte romano
meglio conservato e, insieme a Ponte Milvio, il più antico ancora in uso"* — both halves.
**Escalated:** the left-bank abutment lands in Sant'Angelo and Turismo Roma names Sant'Angelo as the
rione the bridge reaches. A real Ripa/Sant'Angelo split.

**63. Ponte Cestio — REWRITE and ESCALATE.** The finder's own reading is that the span and the far
abutment are Trastevere's and only the island abutment is Ripa's; Trastevere is shipped and owns
neither this bridge nor Ponte Palatino. **My ruling: Ripa should not lead with this record**, and it
goes to the arbitrator as a Ripa/Trastevere split rather than as a Ripa claim. If it survives to
Ripa: c. 46 BC, Lucius Cestius, the 365 rebuilding by Valentinian, Valens and Gratian, the AD 370
"di Graziano" inscription, the later names San Bartolomeo and "ferrato" from the mill chains, the
537 aqueduct cutting by Vitiges, the 1849 damage. **Quote neither 1892 nor 1899** — the finder is
right that Turismo Roma's own dates run backwards against each other, and picking one is picking a
side in a source's internal contradiction.

**64. Ponte Rotto / Ponte Emilio — REWRITE.** **I rule against the finder on the one point he
flagged.** "Rome's first masonry bridge" is not a neutral sequence like "the first church on the
site, before 385"; it is a ranking across the whole city, of exactly the form "the oldest X in
Rome", and there is no reachable register to check it against. **DROP it.** What survives:
> **"The Pons Aemilius crossed the Tiber upstream of the ancient Pons Sublicius. A single
> mid-stream pier survives. It was earlier called Ponte di S. Maria or Senatorio, and the Crescenzi
> levied a toll on its traffic."**
Turismo Roma's *"custodi millenari di una storia travagliata"* is decoration and does not publish.
Both test points read Ripa; this is the least contested of the five bridges.

**65. Ponte Palatino — PUBLISH and ESCALATE.** Confirmed verbatim by me: 1886–1890, Angelo
Vescovali, the Belgian ironwork firm and the Officina dell'Impresa Industriale Italiana, the lozenge
lattice, **"just over 155 m long and about 19 m wide"**, the five spans on four travertine-bossage
piers, the embankment walls after the 1870 flood, the Cloaca Maxima outfall on the left side, the
*partita a rocci* between Testaccio and Trastevere. **DROP** *"uno dei primi esempi di architettura
funzionale della città"*. **Escalated:** Turismo Roma itself says *"nei Rioni Ripa e Trastevere"* —
the straddle is in the source, not in our polygon.

**66. Ponte Sublicio — DROP for Ripa.** I re-fetched the page and the sentence is unambiguous:
*"l'odierno Ponte Sublicio collega i rioni Trastevere e Testaccio all'altezza di Porta Portese."*
Roma Capitale's own tourist board, against one Wikipedia list. **The finder recommended against
claiming it and he was right — and he was right to raise it rather than quietly delete it.** Raised
to the arbitrator as a note only: Testaccio is in no wave, so like the Colosseum this may end up
unwritten. That is the correct outcome, not a reason to take it.

### 3.6 Eating, drinking, sleeping

**67. Trattoria Sora Lella — REWRITE.** Hours confirmed verbatim on the official site: **lunch
Monday–Saturday 12.30–14.50, dinner Monday–Saturday 19.20–22.50, closed Sunday**, telephone
bookings, dress code stated. **DROP "dal 1940"** — trading duration sourced only to the business,
which the corpus rule excludes and which the finder correctly refused. **DROP "DA TRE GENERAZIONI"**
for the same reason; the finder missed this one. **DROP** *"uno dei posti più belli al mondo"*.
**DROP the 56 BC bridge date and the 13th-century tower claim** — the site contradicts Turismo Roma
on the first and is a restaurant talking about its own premises on the second. **The address is not
on the page I fetched (§1(d)): re-source it or publish the record without a street number.**

**68. Ristorante Tiberino — DROP.** The finder did not fetch the site. Unfetched source, no record.
**69. Consolini — DROP.** OSM only, no site, and hard against the Testaccio line.
**70. Apicio16 — DROP.** Page not fetched.
**71. Anima Mundi — DROP.** Hours from OSM rather than the venue, site not fetched.
**72. Normale — DROP.** OSM only.
**73. Vimi Aventino — DROP.** OSM only; hours from a tag.
**74. Hotel San Anselmo — DROP.** Address from OSM; the group site is a booking front end and yielded
no per-property description.
**75. Hotel Villa San Pio — DROP.** Same, with less.
**76. Hotel Aventino — DROP.** No coordinates, therefore no rione verdict, therefore not shippable in
any state. The finder said so himself.
**77. Kolbe Hotel Rome — REWRITE and ESCALATE.** The official site establishes identity and location:
**Via di San Teodoro 48**. **DROP "BEST RATES GUARANTEED"** and every other marketing line; publish
no hours, no rating, no trading history. **Escalated:** via di San Teodoro is the Ripa/Campitelli
border and this is the tightest building reading in the file. If the arbitrator does not confirm it,
it goes.

**The unproposed tail** — 47 Boutique Hotel, Fauno Urban Resort, Hotel Sourire, Foresteria Santa
Scolastica, Gelateria Maximo, Bar Circo Massimo, Gusto Massimo, Santeo, Yellow Bar, Manioka, Max
Roma, Giulietta, Dulcis in Fundo, InRoma Restaurant, Emme Più Aventino, Supermercato Affare Fatto —
**DROP as a class.** OSM-only with no fetched official source, the same test that removed records
68–76. The finder listing them rather than cherry-picking was the right call and it let me rule on
them uniformly, which is what he asked for.

---

## 4. Straddlers escalated to the arbitrator

| # | Place | Split | My note |
|---|---|---|---|
| 22 | **Circo Massimo** | Ripa on six of seven readings; NE tip toward piazza di Porta Capena in Campitelli | Ripa on area and on the documentary via dei Cerchi border. Campitelli is shipped and owns none of it. |
| 62 | **Ponte Fabricio** | Ripa midspan and island abutment; **left-bank abutment Sant'Angelo** | Turismo Roma names Sant'Angelo as the rione it reaches. Genuine split. |
| 63 | **Ponte Cestio** | **Trastevere by span**; Ripa at the island abutment | Trastevere is shipped and does not own it. I do not think Ripa should lead on this one. |
| 65 | **Ponte Palatino** | Ripa by span; Trastevere at the far abutment | *"nei Rioni Ripa e Trastevere"* is in the source itself. |
| 17, 18 | **Sant'Omobono, church and area sacra** | Ripa; vico Jugario itself reads Campitelli | Vico Jugario *is* the border and Campitelli ships 450 places. The likeliest collision in the rione. |
| 45 | **Resti delle Mura Serviane, piazza Albania** | Ripa; piazza Albania *is* the Ripa/San Saba border | Plus the name collision with Castro Pretorio's shipped record. San Saba is in this wave. |
| 47 | **Arco di San Lazzaro** | Ripa; via Marmorata is the Ripa/Testaccio border | Thin content; will not survive a contested claim. |
| 77 | **Kolbe Hotel Rome** | Ripa; via di San Teodoro is the Ripa/Campitelli border | Tightest building reading in the file. |
| 23, 43, 44 | **Circo Maximo Experience, Roseto, Scatola Archeologica** | Ripa, all close to the San Saba line at viale Aventino / piazza Albania | A cluster, not three coincidences. San Saba is in this wave. |
| 52 | **Isola Tiberina** | Ripa on feature-level testing | Escalated as a warning: a naive centroid test at the island's tips lands in open water and reports Sant'Angelo or Trastevere. Do not be surprised by it. |
| 66 | **Ponte Sublicio** | **Not Ripa's.** Trastevere–Testaccio per Turismo Roma | Raised as a note. Testaccio is in no wave; unwritten is the correct outcome. |

Also carried up, not a straddler but a live conflict: **it.wikipedia's rione article lists piazza
della Consolazione among Ripa's squares — I confirmed the string myself — and Campitelli has already
shipped `santa-maria-della-consolazione-campitelli`. Ripa must not claim the square.** The finder
raised this rather than omitting it and was right to.

I re-tested and confirm both inherited rulings: **the Colosseum is Celio's**, far outside anything
Ripa can reach past piazza di Porta Capena, and **the Teatro di Marcello is Sant'Angelo's**. Ripa
claims neither and neither appears in this file's surviving set.

---

## 5. What the finder got wrong

1. **He told me a source was silent when it speaks.** The Circo Maximo Experience publishes a full
   2026 timetable and nine stops; he reported eight stops and "publish no hours". A verifier who
   took his word would have shipped a thinner record than the evidence supports. This is the single
   worst error in an otherwise disciplined file.
2. **He never searched `serviane`.** Castro Pretorio ships a place *named* "Mura Serviane". His
   collision table has eleven fragments and not that one — and the script's own docstring warns that
   a name collision under a different slug is the same defect wearing a hat.
3. **He cited facts to the wrong pages.** The 2016 works, the Arco di Tito excavation and the Circus
   Maximus opening hours are on the Torre della Moletta page, not the Circo Massimo page; the Order
   of Malta visitor contact is on neither page he cited; Sora Lella's address is not on Sora Lella's
   site.
4. **He quoted the Malta keyhole without its frame.** The source sells it as a view of "three
   states" with the villa's interior as extraterritorial territory — the precise construction
   ruling 2 forbids. He wrote a careful legal-status flag and then did not read the sentence next
   to the one he quoted.
5. **He translated one superlative instead of dropping it.** "Evidence of exceptional value" for the
   area sacra is *"documenti di importanza eccezionale"* in English clothes.
6. **He left three superlatives unquarantined:** Turismo Roma's *"il più grande complesso fognario
   di epoca romana"* on the Ponte Palatino page, *"una magnifica vista"* on the Roseto page, and
   Sora Lella's *"DA TRE GENERAZIONI"*, which is a trading-duration claim in disguise.
7. **He asked for a ruling on "first masonry bridge in Rome" and I ruled against him.** A citywide
   priority claim is not a sequence.
8. **He let vague proximity through once** — "a short distance away in the same square" in record 14.

What he got right, and it is most of the file: he refused every superlative he met and wrote them
down so I could check he had met them; he identified two duplicate-building traps (Santa Maria
Egiziaca and Santa Maria del Sole) and wrote them up instead of deleting them; he ruled against his
own rione on Ponte Sublicio, on piazza della Consolazione and on the Porto di Ripa Grande, which is
the hardest thing a finder does; and he named his three least-confident calls in order, two of
which — the Mura Serviane and Sant'Omobono — I have escalated on exactly his reasoning.

**47 places survive. Tier: GUIDE.**
