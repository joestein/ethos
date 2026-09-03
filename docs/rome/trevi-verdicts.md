# Trevi (R. II, Roma Capitale toponymic code 102) — VERIFIER file

Adjudication of `docs/rome/trevi-finder.md`. Wave 2, Rome programme. Verified **2026-09-02**.

I did not gather the finder's evidence and I owe it no loyalty. Every ruling below is **PUBLISH**,
**REWRITE** or **DROP**. REWRITE rulings carry exact replacement wording; the author uses it
verbatim. Straddlers are **escalated**, not ruled — they are counted separately from the drops.

**Tally: 31 PUBLISH · 13 REWRITE · 21 DROP · 13 straddlers escalated.**
**Tier: GUIDE, comfortably.**

---

## 0. What I re-fetched

Nine sources, raw `python3` + `urllib`, browser `User-Agent`, no WebFetch. All 200.

| Source | Bytes | Verdict on the finder's use of it |
|---|---|---|
| `sovraintendenzaroma.it/.../fontane/fontana_di_trevi_mostra_dell_acqua_vergine` | 60,848 | Confirms everything claimed. **Finder omitted a superlative in it and mis-dated the competition (R1).** |
| `sovraintendenzaroma.it/.../roma_antica/monumenti/acquedotto_vergine` | 50,089 | Confirms `Rione: II - Trevi` and the Claudian text. **Finder omitted the whole visiting block (R11).** |
| `sovraintendenzaroma.it/.../fontane/fontana_di_monte_cavallo_in_piazza_del_quirinale` | 51,358 | Confirms `Rione: Trevi` and the attribution fields. **Contradicts the finder on the Terme di Costantino (D2, R3).** |
| `sovraintendenzaroma.it/.../fontane/fontana_del_tritone` | 55,249 | Confirms: **no `Rione:` field.** Finder's §2.5 observation stands. |
| `sovraintendenzaroma.it/.../fontane/complesso_delle_quattro_fontane` | 55,724 | Confirms: **no `Rione:` field**, and supplies corner evidence the finder missed (R12). |
| `vatican.va` Lateran Treaty, full Italian text | 78,834 | **Confirms the finder's Art. 14/15/16 analysis in full.** One wording correction (R6) and one Ruling-1 hazard he did not see. |
| it.wikipedia `Palazzo della Dataria` (wikitext) | 2,844 | Confirms `nel rione Trevi`. **The article contradicts itself on ownership; the finder reported only one side (D4, R5).** |
| it.wikipedia `Piazza del Quirinale` (wikitext) | 5,653 | Confirms `nei rioni I Monti e II Trevi` verbatim. Supplies a real Scuderie source (R10). |
| it.wikipedia `Aqua Virgo` (wikitext) | 10,589 | **The claimed "Colonna" caption does not exist. It is a Commons filename (D3).** |

Also fetched and read in full: it.wikipedia `Trevi (rione di Roma)`, `Colonna (rione di Roma)`,
`Chiesa dei Santi Vincenzo e Anastasio a Trevi`, `Fontana di Trevi`,
`Accademia nazionale di San Luca`, `Galleria Sciarra`, `Fontana dei Dioscuri`,
`Palazzo della Panetteria`, `Cappella della Madonna dell'Archetto`.

**Independent geometry check.** I did not re-run the finder's polygon method. I ran Nominatim's
`/lookup` endpoint — a different code path from his `/reverse` centroid method — against 32 OSM
objects. **31 returned `quarter = Trevi`. One did not: Santa Susanna (D1).** Piazza Venezia
returned `Trevi`, not the `Pigna` the finder reported — see E1. On that evidence the finder's
geometry work is sound and I am ratifying it everywhere except D1.

---

## 1. PUBLISH — 31

Sources marked ✔ I re-fetched myself this session. Sources marked ○ I did not; the claim is
correctly attributed in the finder file and publishes as an attributed Wikipedia statement.

### The Trevi Fountain
1. ✔ Roma Capitale states `Rione: Trevi` for the Fontana di Trevi.
2. ✔ `Autore: Nicola Salvi, Giuseppe Pannini. Datazione: 1732-1762. Materiali: travertino, marmo, intonaco, stucco, metalli.`
3. ✔ The fountain is set against the façade of Palazzo Poli.
4. ✔ Restoration chronology: 1989–1991; maintenance of the central section 1999; a restoration funded by FENDI begun 2014 and completed after seventeen months in 2015, inaugurated 3 November; a maintenance intervention October–December 2024 under the PNRR – Caput Mundi programme (*Manutenzione straordinaria di alcune fontane monumentali del Centro Storico di Roma, n. 323*).
5. ✔ Roma Capitale records that in 1640, for Urban VIII and in step with the enlargement of the square, Gian Lorenzo Bernini designed a fountain on the present orientation, of which only an exedra base and a basin were built, set against buildings later absorbed into Palazzo Poli.
6. ✔ Roma Capitale records that Giuseppe Pannini concluded the construction, partly modifying the *scogliera* and regularising the central basins.
7. ✔ The visiting régime. Wording in R2 — the fact publishes, the finder's phrasing does not.

### The Acqua Vergine
8. ✔ Roma Capitale records the Acquedotto Vergine under `Rione: II - Trevi`.
9. ✔ Roma Capitale: it is the only one of the eleven principal aqueducts of ancient Rome to have remained continuously in operation to the present day, feeding the monumental fountains of the Baroque city, among them the Fontana di Trevi, which in the modern age is its terminal *mostra*.
10. ✔ Inaugurated 19 BC by Agrippa; sources in the Agro Lucullano near the eighth mile of the via Collatina, at the modern locality of Salone; a course of over 20 kilometres, predominantly underground, ending in the Campo Marzio.
11. ✔ At via del Nazareno three partly buried travertine arches in rusticated blocks survive at the sides of a larger *fornix*, identified with the arch Claudius had raised to mark his victory over the Germans, above which is set the inscription recording his rebuilding of the aqueduct in AD 46. The Latin text and the Italian translation on Roma Capitale's page publish in full.
12. ✔ Roma Capitale records two further travertine *fornici* beneath Palazzo Sciarra, near via del Corso. **This is the Pigna Palazzo Sciarra. The finder's §8.1 warning is correct and must survive into the corpus as an editorial note.**

### The Quirinal group
13. ✔ Piazza del Quirinale lies between Via del Quirinale and Via XXIV Maggio, *"nei rioni I Monti e II Trevi"* — it.wikipedia, citing Sergio Delli, *Le strade di Roma*, 3rd ed., Newton Compton, 1988, p. 809. Publishes **as a statement of the straddle**; ownership is E2.
14. ✔ From the Middle Ages and still into the 19th century the square was known as Piazza di Monte Cavallo.
15. ✔ Roma Capitale states `Rione: Trevi` for the Fontana di Monte Cavallo, `Autore: Giacomo della Porta; Raffaele Stern`, `Datazione: 1589; 1818`, `Materiali: granito, marmo`, `Alimentazione originaria: acquedotto Felice`.
16. ✔ The obelisk: in 1786 Pius VI had the Egyptian granite obelisk taken from the Mausoleum of Augustus in the Campo Marzio set between the Dioscuri, to a design by the architect Giovanni Antinori. **Upgraded — the finder had this from it.wikipedia only; Roma Capitale corroborates it independently.**
17. ○ The obelisk is red Aswan granite, 14.63 m high and 28.94 m with its base, and carries no hieroglyphic inscriptions.

### Churches
18. ✔ Santi Vincenzo e Anastasio a Trevi is in rione Trevi, on Piazza di Trevi; infobox `InizioCostr 1644`, `FineCostr 1650`; the original church was rebuilt in Baroque form at the order of Cardinal Mazarin, and was erected a parish at that time.
19. ✔ Its medieval name was *Sant'Anastasio de Trivio*; from 1570 it has been known under the double dedication.
20. ✔ It preserves, **not displayed to the faithful**, the *precordia* removed during the embalming of popes; the urns of 22 popes, from Sixtus V to Leo XIII. Belli's phrase, quoted in the same article: *"un museo de corate e de ciorcelli"*. Its popular name was *canneto*, because its façade is decorated with 18 columns.
21. ○ Cappella della Madonna dell'Archetto: rione Trevi, Via di San Marcello 41b; official name *chiesa di Santa Maria Causa Nostrae Laetitiae*; built in the 19th century to house an image painted on maiolica stone in 1690 by the Bolognese painter Domenico Maria Muratori; **solemnly inaugurated and opened to the public 31 May 1851**; the work of the architect Virginio Vespignani, containing paintings by Costantino Brumidi. **The finder missed Vespignani and Brumidi. Brumidi is the strongest hook on this building and the corpus should carry him.**
22. ○ Chiesa evangelica valdese in Trevi: on via Quattro Novembre, in rione Trevi; 1883–1884, architect Benedetto Andolfi. **It is not the Waldensian church in Piazza Cavour, which is in rione Prati, and which is what OSM `way/358538665` is.** The disambiguation publishes as an editorial note.

### Buildings
23. ○ Palazzo Carpegna, seat of the Accademia Nazionale di San Luca since 1934; built between the late 16th and the first half of the 17th century for the Vaini of Imola by a pupil of Giacomo della Porta; bought c. 1630 by Count Ambrogio di Carpegna, who commissioned Francesco Borromini for enlargement and remodelling; completed under Francesco Ferrari, 1732–1736.
24. ✔ Palazzo della Panetteria: Via della Dataria, rione Trevi, between the Palazzo della Dataria and the Palazzo del Quirinale; official name *Palazzo della Famiglia Pontificia*; built by Paolo Posi between 1764 and 1766; reached from the Quirinale through the Torre di Urbano VIII, the Swiss Guard tower; Clement XIII ordered its complete rebuilding; it now serves as an annexe of the Quirinale. **The patron does not publish — D5.**
25. ✔ Palazzo della Dataria stands in via della Dataria, in rione Trevi, beside the Palazzo della Panetteria and opposite the Palazzo di San Felice.
26. ○ Palazzo Baracchini, on via XX Settembre, 1876–83, architect Giulio Podesti, seat of the Ministero della Difesa.
27. ○ Palazzo Chigi-Odescalchi on Piazza Santi Apostoli: originally Colonna, sold to the Ludovisi in 1622 and bought back; ceded in usufruct to Cardinal Flavio Chigi in 1661 and transformed by Gian Lorenzo Bernini c. 1665; passed to Prince Baldassare Odescalchi in 1745. **The finder's warning publishes: this is not Palazzo Chigi on Piazza Colonna, which is in Colonna.**
28. ○ Vicus Caprarius, "La Città dell'Acqua": excavation at the end of the 1990s, during restructuring and consolidation work on a group of buildings by the fountain, uncovered traces of an *insula* of Neronian date fronting the *Vicus Caprarius*, converted partly into a patrician *domus* in the middle of the 4th century and partly into a large cistern collecting the Acqua Vergine; remains of 12th- and 13th-century buildings were found above and partly overlying them, and traces of that urbanisation survive in the medieval portico on the side of the square facing the fountain. The area is reorganised and open to visitors.

### The Lateran Treaty
29. ✔ **Article 15 of the Treaty of 1929 names *"i palazzi della Datarìa"*** among the buildings which, *"benché facenti parte del territorio dello Stato italiano"*, enjoy the immunities international law recognises for the seats of the diplomatic agents of foreign states. **The brief's expectation that Trevi holds no Article 15 property is wrong, and the finder is right about it.** The building stands on Italian soil, is not in Vatican City, is not Vatican territory, and is not a border of any kind.
30. ✔ **Article 14's third *alinea*** transfers to the Holy See the ex-conventual buildings in Rome annexed to the Basilica dei Santi XII Apostoli and to Sant'Andrea della Valle and San Carlo ai Catinari. **Article 15 reaches only *"gli immobili indicati nell'art. 13 e negli alinea primo e secondo dell'art. 14"*. The Santi XII Apostoli buildings are therefore outside Article 15.** Verified against the treaty text: Article 14 has exactly three paragraphs and the Santi XII Apostoli transfer is the third, opening *"L'Italia, infine, trasferisce…"*. **The finder's reading is exactly right and this is the best single piece of work in his file.**
31. ✔ **Article 16** names among pontifical institutes the *"Università Gregoriana, Istituto Biblico"*. Both stand in rione Trevi, on Italian soil. **Neither is extraterritorial, neither is in Vatican City, and any sentence calling them so is wrong on the face of the Treaty, not merely unsourced.** Wording of what Article 16 actually grants: R6.

---

## 2. REWRITE — 13

The underlying fact is sound; the finder's wording overreaches, mis-attributes or omits. Use the
replacement text verbatim.

### R1 — Fontana di Trevi, the date of the competition
The finder gives *"a competition called in 1731 by Pope Clement XII"*, attributed to it.wikipedia.
That attribution is accurate — it.wikipedia says *"un concorso indetto nel 1731 da papa Clemente
XII"*. But Roma Capitale's page, which the finder used for everything else on this fountain, says
*"nel 1732 indice un concorso"*. **He used both pages and did not notice they disagree.**

> Roma Capitale dates to 1732 the competition Clement XII called for the fountain; the Italian
> Wikipedia article dates the competition to 1731. Work began in 1732. Roma Capitale records that
> the pope chose, among the entries, Nicola Salvi's most monumental design, the one "of least
> prejudice to the palace behind". The Italian Wikipedia article records that the commission
> passed in 1759 to Pietro Bracci, assisted by his son Virginio, and that the fountain was
> inaugurated in 1762.

### R2 — Fontana di Trevi, the visiting régime
The finder's summary is substantially right but detaches the €2 from what it buys and blurs the
free list. This is the most perishable fact in the wave and it must be exact.

> Roma Capitale charges €2.00 for access to the inner perimeter of the fountain, for tourists and
> for people not resident in Rome or in the Città Metropolitana. The charge applies from 09:00 to
> 22:00 and remains in force on the first Sunday of the month. Access to the inner perimeter is
> guaranteed to a maximum of about 400 people at a time, with entry by the central staircase and
> exit through the gate on the via dei Crociferi side. After the daily closure, fixed at 22:00, the
> fountain remains visible free of charge to everyone. Roma Capitale gives free access to residents
> of Rome and the Città Metropolitana on production of an identity card at the access control, to
> holders of the Roma MIC Card, to people with disabilities and one companion, to tour guides on
> production of a valid badge, and to children up to 5. Tickets are sold online, at the Musei
> Civici, Tourist Info Points and affiliated outlets, and at the fountain entrance by card only.
> Roma Capitale publishes hours at fontanaditrevi.roma.it.

**I second the finder's note in the strongest terms:** a ticketed Trevi Fountain reads as wrong to
anyone whose mental model predates 2025. It is Roma Capitale's own page. It does not get edited out.

### R3 — Fontana dei Dioscuri, attribution and provenance
The finder frames a two-way conflict and says the two sources agree on the Terme di Costantino.
**Re-fetching shows the conflict is a different shape and the agreement does not exist.** Roma
Capitale credits Domenico Fontana with the *square*, not the fountain, and says nothing about the
Terme di Costantino.

> Roma Capitale attributes the fountain to Giacomo della Porta and Raffaele Stern and dates it
> 1589 and 1818. Its account: the arrangement of the square was commissioned in 1586 by Sixtus V
> from Domenico Fontana, who restored the Dioscuri group and moved the sculptures towards the
> centre of the square, facing the Strada Pia; in 1589 a first fountain fed by the Acqua Felice was
> placed at the foot of the statues, and it was removed in 1783; the present fountain was made only
> in 1818, reusing a large grey granite basin that had been in the Roman Forum, with Raffaele Stern
> as consultant. The Italian Wikipedia article on the Fontana dei Dioscuri instead names Domenico
> Fontana as the author of the fountain itself. Roma Capitale records a restoration in 2016 and an
> extraordinary maintenance intervention in 2025 under the PNRR – Caput Mundi programme.
>
> On the origin of the sculptures the sources do not agree. The Italian Wikipedia articles say the
> group came from the Terme di Costantino. Roma Capitale's page does not say this; it states only
> that the group had stood on the Quirinal hill since antiquity.

### R4 — The Aqua Virgo arches at via del Nazareno
The finder's §3.10 is headed *"and the sources fight"*. **They do not.** See D3.

> Roma Capitale records the Acquedotto Vergine under Rione: II - Trevi and describes the arches at
> via del Nazareno as part of it. No source we fetched places these arches in another rione.

The escalation note becomes: Nominatim reads Trevi at the western end and Colonna thirty metres
east, because the arches sit on the line. That is a boundary artefact, not a source conflict, and
the arbitrator should weigh it as such.

### R5 — Palazzo della Dataria, present status
The finder presents the ANSA sale as a clean statement and builds his "genuinely unresolved" verdict
on it. **The article is worse than unresolved — it contradicts itself, and he reported only one
side.** It says twice that the palace *"è una pertinenza del Palazzo presidenziale"*, an appurtenance
of the Italian presidential palace. The 1973 sale is sourced to `romeartlover.it`, a personal site.

> Article 15 of the Lateran Treaty of 1929 names the Palazzo della Dataria among the buildings
> which, although forming part of the territory of the Italian State, enjoy the immunities that
> international law recognises for the seats of the diplomatic agents of foreign states. The palace
> stands in via della Dataria, in rione Trevi. It is on Italian soil: it is not in Vatican City, it
> is not Vatican territory, it is not a border, and visitors in it are subject to Italian law.
>
> What its status is today is not established by any source we could reach. The Italian Wikipedia
> article describes the palace as an appurtenance of the Italian presidential palace, and in the
> same article reports that it was assigned to the Holy See under the Lateran Pacts and sold in
> 1973, giving ANSA as its owner. Those statements are not consistent with one another, and we
> found no source that settles the question.

**The finder's instinct — flag rather than guess — is upheld. His evidence was thinner than he said.**

### R6 — What Article 16 actually grants, and a Ruling-1 hazard the finder did not see
The finder says Article 16 grants *"only exemption from expropriation for public utility and from
ordinary and extraordinary taxation"*. The text says more than that.

> Article 16 provides that the properties named in the three preceding articles, together with the
> buildings used as the seats of a named list of pontifical institutes including the Università
> Gregoriana and the Istituto Biblico, shall never be subjected to encumbrances or to expropriation
> for reasons of public utility save by prior agreement with the Holy See, and shall be exempt from
> taxation, ordinary and extraordinary, whether to the State or to any other body. That is a
> property and tax provision. It is not extraterritoriality and it is not diplomatic immunity.

> **RULING 1 HAZARD.** The Italian word Article 16 uses for "encumbrances" is **`vincoli`**. That is
> the same word as in `vincolo monumentale`, and it means something entirely different here — civil
> encumbrances under the 1929 Treaty, not heritage protection under the Codice dei beni culturali.
> **Do not quote or translate this clause in any form that could be read as a statement about a
> building's designation status.** If in doubt, paraphrase as "encumbrances" and never as
> "protection", "listing", "constraint" or "vincolo". The finder did not spot this and it is the
> single easiest way for this wave to breach Ruling 1 while quoting a treaty.

### R7 — Accademia Nazionale di San Luca, the founding year
The finder calls the article self-contradictory. On re-fetching it is better than that: it records
two dated events and says the transition was gradual.

> The Italian Wikipedia article records that before the academy existed the artists belonged to the
> Università dei Pittori, Miniatori e Ricamatori, a craft guild whose statutes and privileges were
> renewed under Sixtus IV on 17 December 1478; that the passage from *Universitas* to *Accademia
> delle Arti della Pittura, della Scultura e del Disegno* came on the initiative of the painter
> Girolamo Muziano and was officially sanctioned in 1577 by Gregory XIII, though the actual
> transformation was gradual; and, in its opening sentence, that the academy was founded in 1593 by
> Federico Zuccari, who was also its first *Principe*. Its infobox gives 1577. Sources differ on
> the founding year and this page does not settle it.

**No single founding year publishes.**

### R8 — Galleria Sciarra
Both contradictions the finder found are confirmed, and there is a third he missed: the infobox
gives the style as *Umberto I* while the body calls the building one of Rome's few Liberty works.

> The Galleria Sciarra is a covered pedestrian passage in rione Trevi — a private courtyard open to
> the public during office hours — built between 1886 and 1888 to a design by the architect Giulio
> De Angelis for Prince Maffeo Sciarra, and now in office use. The Italian Wikipedia article gives
> its entrances as Via Marco Minghetti and Piazza dell'Oratorio in its text and its address as Via
> di Santa Maria in Via 30-31 in its infobox; the street address should be confirmed from a second
> source before publication.

Its style label does not publish either way. D15 disposes of the rest.

### R9 — Santi Vincenzo e Anastasio, the *parrocchia pontificia*
The finder gives one reason. The source gives two, and locates the Quirinale differently.

> The Italian Wikipedia article says the church came to be known as the *parrocchia pontificia* for
> two reasons: because the Palazzo del Quirinale, the pope's residence, was in the area, and
> because the *precordia* of the pontiffs were kept in the church.

Note "in the area" — the source says *in zona*, not "in the parish". Do not upgrade it, and do not
convert it into a distance or a proximity of any kind.

### R10 — Scuderie del Quirinale
The finder had only OSM tags and correctly refused to publish them. **A real source exists and he
had it open**: the Piazza del Quirinale article he quoted for §3.2, citing the Touring Club
Italiano's *Guida d'Italia*.

> The Italian Wikipedia article on Piazza del Quirinale, citing the Touring Club Italiano's *Guida
> d'Italia*, describes the Scuderie del Quirinale as an eighteenth-century building by Alessandro
> Specchi and Ferdinando Fuga, completely restored between 1997 and 1999 and now used as a venue
> for art exhibitions.

The OSM `start_date=1730` and the sole attribution to Fuga are dropped (D7).

### R11 — Acqua Virgo, visiting arrangements — a material omission
**The Sovrintendenza page the finder quoted at length carries a visiting block he did not report at
all.** He wrote a section on the aqueduct that says nothing about whether any of it can be entered.

> Roma Capitale states that the site is temporarily closed for works. Its published arrangements
> are: entry only to accompanied groups, a maximum of 20 people per visit, with booking obligatory
> on 060608 between 09:00 and 19:00; individual visits also possible, always by booking on 060608,
> on a calendar published by Roma Capitale. Tariffs: €4.00 full, €3.00 reduced; free for residents
> of Rome and the metropolitan area on production of a valid document attesting residence, and for
> MIC card holders. A guided tour is not included in the entrance price.

Perishable. Lead with the closure and date the fetch.

### R12 — Le Quattro Fontane
The finder concludes the complex "leans Monti" and that Trevi's Wikipedia list over-claims it.
**Roma Capitale's page, re-fetched, supplies corner-level evidence he did not use, and it points
the other way for one corner.** It identifies the fountain on the Barberini garden side as the
Diana, and records that the last radical change to the crossroads came in 1936 when Vittorio
Morpurgo's Istituto Romano dei Beni Stabili building was raised on the Barberini garden side and
absorbed the Diana fountain. The Barberini garden corner is the finder's NW corner — the single one
his own polygon puts in **Trevi** — and the Giardini di Palazzo Barberini test wholly in Trevi on
both his methods.

> Three of the four corner fountains test in Monti. The fourth, the fountain identified by Roma
> Capitale as Diana, stands at the corner of the Barberini garden, which tests in Trevi; Roma
> Capitale records that it was absorbed in 1936 into the Istituto Romano dei Beni Stabili building
> by Vittorio Morpurgo. Roma Capitale treats the four as one complex, *Complesso delle Quattro
> Fontane*, and states no rione for it.

Escalated as E8. **Neither wave takes it.** The finder's "leans Monti" is not wrong, but it is not
the whole record and he should not have concluded on evidence he had not fully read.

### R13 — Piazza Venezia, the method disagreement
The finder reports his Nominatim centroid read as `Pigna`. **My independent Nominatim lookup on
`way/713360712` returns `quarter = Trevi`.** So Nominatim now gives two different answers on the
same object by two different endpoints, against a polygon that returns three rioni across two waves.

> Piazza Venezia tests in Campitelli, Pigna and Trevi by polygon. Nominatim is not stable on it:
> a reverse geocode of its centroid returns Pigna and a direct lookup on the same OSM way returns
> Trevi. Trevi's own Wikipedia article names the square only as its boundary with Pigna; Pigna's
> article names it both as its boundary with Trevi and as one of Pigna's own piazze.

The finder's decision not to take it is **upheld and reinforced**. I also confirm his check that
`relation/1849830` (Vittoriano / Altare della Patria) tests in Campitelli and is nowhere near a
Trevi file — no reserved place is at risk in this rione.

---

## 3. DROP — 21

### D1 — Santa Susanna alle Terme di Diocleziano. **The finder's one confirmed misassignment.**
He writes that the church tests Trevi on **both** methods and that Nominatim returns
`quarter=Trevi` for Largo di Santa Susanna itself. **My independent Nominatim lookup on
`way/52251976` returns `quarter = Castro Pretorio`.** He noticed the problem himself — he records
that Trevi's own article names Largo di Santa Susanna as the *Sallustiano* boundary — and then
published the Trevi reading anyway. His own §7 puts the Fontana dell'Acqua Felice, on the same
crossroads, in Castro Pretorio. Trevi's article listing both the largo and the church is a
**fourth over-claim in that article**, not evidence.

**Trevi does not take Santa Susanna on this evidence.** Escalated as E12. Neither Castro Pretorio
nor Sallustiano is in either wave, so nothing collides today — but the claim does not publish.

### D2 — "The Dioscuri group came from the nearby Terme di Costantino (both sources agree)."
**The source does not say what the finder says it says.** Roma Capitale's Monte Cavallo page does
not mention the Terme di Costantino anywhere; it says the group had stood on the Quirinal since
antiquity. Only it.wikipedia says Costantino. And **"nearby" is a vague proximity** and would fail
the corpus rule even if the attribution held. Replaced by R3.

### D3 — "it.wikipedia's own image caption on the Aqua Virgo article says the opposite: *Colonna - arcate Acqua Vergine a via del Nazzareno*."
**The source does not say this.** That string is the Wikimedia Commons **filename** in the
`Immagine =` field of the infobox. The `Didascalia =` field — the caption — reads *"I resti
dell'acquedotto Vergine in via del Nazareno"*, and names no rione. Commons filenames carry a
photographer's rione prefix by convention and are not encyclopedic assertions. **There is no
Wikipedia claim that the arches are in Colonna, and the finder built a headline section on one.**
Replaced by R4. This materially reduces the weight of E7.

### D4 — "sold in 1973 to ANSA for 2,500,000 dollars", and `proprietario = ANSA` as ownership.
Does not publish as fact. Same article, twice: appurtenance of the presidential palace. Sale
sourced to a personal website. Replaced by R5.

### D5 — Palazzo della Panetteria commissioned by Paul V.
The finder says the *infobox* says this. **The body text says it too** — *"fu costruito da Paolo
Posi tra il 1764 e il 1766 per ordine di papa Paolo V"*. Paul V died in 1621. The patron does not
publish from either position, and the corpus should not repeat the error even attributed.

### D6 — Every OSM `opening_hours` string in the file.
Accademia Nazionale di San Luca `Mo-Sa 09:00-18:00`; Vicus Caprarius `Tu-Fr 11:00-17:30, Sa-Su
11:00-19:00`; Galleria Colonna `Sa 09:00-13:15`; Santissimo Nome di Maria `Tu-Su 10:00-12:30,
17:00-19:30`; Palazzo Valentini `We-Mo 09:30-18:30`; Santa Susanna `closed`; Esperienza Europa
`Mo-Fr 10:00-19:00; Sa,Su 12:00-18:00`. The finder marked each one. **Marking is not sourcing.**
Every institutional site he needs returns 200. Re-source or omit; no hours publish from OSM.

### D7 — OSM `start_date` and `architect` tags.
Santa Maria di Loreto `1507` / `Antonio da Sangallo il Giovane`; Scuderie del Quirinale `1730` /
`Ferdinando Fuga` (replaced by R10); Fontana di Trevi `start_date=1735`, which contradicts Roma
Capitale's `1732-1762` and is simply wrong; Biblioteca di Archeologia e Storia dell'Arte
`architect=Martinucci Filippo`.

### D8 — Museo del Corso's `2024-11-30 → 2025-06-29` "by appointment" window.
The window has closed. The finder said so and listed it anyway. It does not publish as current and
it does not publish as history either — an OSM tag is not a record of a past exhibition run.

### D9 — Mitreo Barberini access: `Sa [2,4] 10:00-13:00; "by appointment"`.
OSM tag, and the Soprintendenza *scheda* the OSM `website` points at **404s**. The mithraeum may be
named as a place at Palazzo Barberini with no visiting information whatever.

### D10 — Istituto Centrale per la Grafica's website.
`www.grafica.beniculturali.it` does not resolve in DNS. The URL does not publish. The institute may
be named with its address, Via della Stamperia 6, and its operator.

### D11 — Museo Nazionale delle Paste Alimentari, and both closure dates.
It is not open, its domain does not resolve, and its two sources give **2007** (its own infobox)
and **2016** (the Trevi rione article). Neither date publishes and the museum does not publish as a
place. Palazzo Scanderbeg, its former seat, publishes on its own.

### D12 — "Fontana delle Tartarughe" `node/9206467464` and "Merdiana di Borromini" `node/9206467463`.
OSM data errors inside the polygon. The Turtle Fountain is in Sant'Angelo, on Piazza Mattei. The
finder's §8.3 is correct and this is a drop, not a caution: neither is a place in Trevi.
`relation/2054910` tagged `building=church` is a palace and publishes as one.

### D13 — Galleria Alberto Sordi · Piazza di San Silvestro · Piazza San Bernardo.
All three drop from Trevi. Confirmed against both articles this session: Colonna's own article
lists *"Galleria Alberto Sordi (già Galleria Colonna), su via del Corso"* among its civil
architecture, and Trevi's own article names *"Castro Pretorio: piazza San Bernardo, via Venti
Settembre"* as its boundary in the same article that lists Piazza San Bernardo among its piazze.
**Colonna is in this wave and may take the Galleria and Piazza di San Silvestro.** The finder is
right and the evidence is stronger than he presented it.

### D14 — Superlatives on the Trevi Fountain.
*"la più nota delle fontane romane e la più famosa nel mondo"* (**Roma Capitale's own page**) and
*"la più grande fontana barocca di Roma e una delle fontane più famose al mondo"* (it.wikipedia).
Neither publishes. **The corpus rule on superlatives does not turn on who wrote them.** The finder
excluded the phrase without noticing that the municipal source he relies on for everything else
carries one; the exclusion is upheld, the reasoning is corrected.

### D15 — Galleria Sciarra's evaluative and proximity claims.
*"un luogo poco visitato e conosciuto solo dai turisti più attenti"* — unsourceable impression.
*"uno dei pochi esempi di architettura liberty della città di Roma"* — superlative. *"la Galleria è
molto vicina alla Fontana di Trevi"* — **vague proximity, which the finder did not flag.** All
three drop. The finder caught two of the three.

### D16 — Any statement of visiting arrangements for the Palazzo del Quirinale.
`quirinale.it` and `palazzo.quirinale.it` return 403 from this network and the finder found no
substitute. **No hours, no ticketing, no opening days, no booking method, in any wording.** The
palace publishes on its history and its use; on visiting it says nothing. `060608.comune.roma.it`
is the obvious next fetch and until someone makes it the silence stands.

### D17 — Any single settled account of the Palazzo del Quirinale's construction.
it.wikipedia's own two articles give `1573–1583` with Ottaviano Mascherino first, and
*"costruito negli anni 1573–1585 da Martino Longhi il Vecchio e poi (1578) da Ottaviano
Mascherino"*. Both re-confirmed. Neither publishes as settled; both may publish side by side with
"sources differ". The papal residence 1605–1870 / royal 1871–1946 / presidential since, tied to
the *presa di Roma* of 20 September 1870 and the referendum of 2 June 1946, publishes.

### D18 — Via Rasella as a place in this wave.
The finder flagged it as needing editorial judgement above the level of a fountain and summarised
nothing. **I go further: it drops.** Nothing publishable was gathered — the file records only that
a 231 kB article exists. A partisan attack and the reprisal that followed it, with a contested
historiography and a live legal afterlife, is not written from a research note that contains no
facts. The street may be named as a street. The event is not written from this file, by anyone,
in this wave.

### D19 — The 163 hospitality, retail, bank and pharmacy entries, as a class.
No source beyond OSM. *L'Antica Birreria Peroni*, *Il Gelato di San Crispino*, *Antica Trattoria
Tritone* and *Trattoria Al Moro* carry "antica" and "the oldest" in their trading names and each
would need an independent source before a single word about age, award or standing publishes.
The finder is right to supply none.

### D20 — §6.7 in full.
The six Quirinal garden fountains (Diana `way/429306228`, Giunone `way/429306229`, Bagnanti,
Martinucci, dell'Organo, Rustica): no independent source and no established public access — and the
garden is inside a working presidential residence. "Oceano" `node/6242722715` is the central figure
**of** the Trevi Fountain, not a place. "Miracle Water". The government tenants — ANAC, the Garante
privacy, IVASS, the Presidenza della Repubblica office node, the Indian Embassy, Il Messaggero —
are organisations, not places. **Esperienza Europa** is the strongest of the group and still drops
on this file: its hours are an OSM tag (D6) and no Parlamento Europeo source was fetched. It
returns if someone fetches one.

### D21 — Palazzo Gentili del Drago.
Trevi's rione article links it and **the target article does not exist**. There is no source at all.
The other palazzi listed in §6.2 with an em-dash carry no factual claim beyond a location, so there
is nothing to rule on; they are unadjudicated, not dropped, and need a fetch before they publish.

---

## 4. STRADDLERS ESCALATED — 13

Not ruled by me. Ownership is the arbitrator's, with all four wave-2 files and the wave-1
reservation in front of it. **Trevi takes none of these in the absence of a ruling.**

| # | Place | Rioni | Wave | Note |
|---|---|---|---|---|
| E1 | **Piazza Venezia** `way/713360712` | Campitelli + Pigna + Trevi | **crosses waves** | R13. Nominatim gives two answers on the same object. The Vittoriano is confirmed in Campitelli; nothing reserved is at risk. |
| E2 | **Piazza del Quirinale** `way/516174441` | Monti + Trevi | **crosses waves** | it.wikipedia states the straddle outright and I confirmed the sentence and its citation. |
| E3 | **Palazzo del Quirinale** `relation/2707110` | Monti + Trevi | **crosses waves** | The biggest object in the wave. Both methods and my lookup say Trevi; Monti's article claims Palazzo della Consulta and Sant'Andrea al Quirinale on the same square but **not** the palace. Recommend Trevi. Must not land in two files. |
| E4 | **Piazza Barberini** `way/1371637706` | Colonna + Ludovisi + Trevi | intra-wave for Colonna | Colonna's article names it as its Trevi boundary — quote confirmed verbatim. Ludovisi is in neither wave. The Fontana del Tritone in it tests wholly Trevi on all three methods and Roma Capitale states no rione for it. |
| E5 | **Piazza di San Claudio** `relation/11497565` | Colonna + Trevi | intra-wave | The church on it tests wholly Trevi on both his methods and on my lookup. The square does not. |
| E6 | **Largo Chigi** `way/724036186` | Colonna + Trevi | intra-wave | Both methods lean Colonna. Named in Colonna's boundary list. Likely Colonna's. |
| E7 | **The Aqua Virgo arches at via del Nazareno** `way/1390965274` | Trevi / Colonna | intra-wave | **Weight reduced by D3.** Roma Capitale states `Rione: II - Trevi` and no source contradicts it. The Nominatim split is a boundary artefact across thirty metres. Recommend Trevi. |
| E8 | **Le Quattro Fontane** | Trevi + Monti | **crosses waves** | R12. Three corners Monti, the Diana corner on the Barberini garden side in Trevi. Roma Capitale states no rione. |
| E9 | **Via del Corso** `relation/6890532` | Campo Marzio + Colonna + Pigna + Trevi | intra-wave ×3 | No rione owns it. Palazzo Mancini and San Marcello al Corso on the Trevi side are clean on all methods. |
| E10 | **Via / Largo del Nazareno**, and **Palazzo del Bufalo alle Fratte** | Colonna + Trevi | intra-wave | The finder's single method disagreement. The Bufalo article says *nel rione Trevi*; Largo del Nazareno and the Fontana del Bufalo test Colonna. |
| E11 | **Resti di Mura Serviane, Largo Magnanapoli** `way/427413247` | Trevi, on the Monti line | **crosses waves** | Clean Trevi on all three methods, but Largo Magnanapoli is named in **both** articles as the Trevi/Monti boundary and a Monti finder on the same wall segment has an arguable case. |
| E12 | **Santa Susanna alle Terme di Diocleziano** `way/52251976` | Trevi / Castro Pretorio / Sallustiano | neither in wave | **New — D1.** My lookup returns Castro Pretorio against the finder's claim of Trevi on both methods. Does not publish as Trevi. |
| E13 | **The Trajan's-Forum edge group** — Santa Maria di Loreto `way/140031975`, Santissimo Nome di Maria al Foro Traiano `relation/1892863`, Palazzo Valentini + Domus Romane `relation/1892857`, Auditoria di Adriano `relation/19906545` | Trevi | **abuts the wave-1 reservation** | Not straddlers: all four test wholly Trevi on his two methods and on my independent lookup. But all sit against Trajan's Forum, Column and Market, which are **reserved to wave 1**, and three carry `addr:street=Foro Traiano`. **Add a fifth: Trevi's own article lists Piazza della Madonna di Loreto among its piazze**, and that square is against Trajan's Column. **This is the highest collision risk in the file after Piazza Venezia and the arbitrator must look for it explicitly.** |

**On the reservation:** I confirm the finder took **no reserved place**. The Colosseum, the Roman
Forum, the Capitoline group, the Vittoriano, Santa Maria in Aracoeli, the Theatre of Marcellus,
Trajan's Forum, Market and Column, the Imperial Fora, San Pietro in Vincoli, Santa Maria Maggiore,
Castel Sant'Angelo, the Passetto, Santo Spirito in Sassia, Via della Conciliazione, Santa Maria in
Trastevere, Santa Cecilia and Villa Farnesina appear nowhere in his candidate lists as Trevi places.
He also positively confirmed the Vittoriano and the Torre delle Milizie / Mercati di Traiano out of
Trevi. **Clean.**

**On Ruling 2:** no Vatican City place is claimed. The Article 15 property (Palazzo della Dataria)
and the three Article 16 properties (Santi XII Apostoli's ex-conventual buildings, the Gregoriana,
the Biblicum) are all written under Trevi, on Italian soil, with the tiers kept distinct. **The
finder's §5 is the best section in the file and it corrects the brief.** The one wording defect is
R6 and the one hazard is the treaty's own use of `vincoli`.

**On Ruling 3:** no image is named, linked or emitted anywhere in the file. `"photos": []`.

---

## 5. TIER RULING — **GUIDE**

Not close. The brief warns that Colonna and Trevi are small and may land at town-page, and tells me
not to pad. **Trevi does not land there and no padding is needed to say so.**

Counting only places that survive this adjudication, sit wholly in Trevi on all three geometry
reads, and carry at least one non-OSM source that was actually fetched:

1. **Fontana di Trevi** — Roma Capitale, in depth, including a current visiting régime
2. **Acquedotto Vergine** — Roma Capitale, `Rione: II - Trevi`, with a primary inscription and a visiting régime
3. **Santi Vincenzo e Anastasio a Trevi** — it.wikipedia, with the precordia
4. **Fontana dei Dioscuri / Monte Cavallo** — Roma Capitale, `Rione: Trevi`
5. **Obelisco del Quirinale** — Roma Capitale and it.wikipedia, agreeing
6. **Accademia Nazionale di San Luca, in Palazzo Carpegna** — institution + building, site 200
7. **Galleria Sciarra** — date, architect, patron, use
8. **Vicus Caprarius, La Città dell'Acqua** — official site 200, archaeology sourced
9. **Cappella della Madonna dell'Archetto** — a precise 31 May 1851, Vespignani, Brumidi
10. **Palazzo della Dataria** — Lateran Treaty Art. 15, from the treaty text
11. **Basilica dei Santi XII Apostoli** — Art. 14 third alinea, from the treaty text
12. **Palazzo Barberini and the Gallerie Nazionali d'Arte Antica** — site 200
13. **Palazzo Colonna and the Galleria Colonna** — site 200
14. **Scuderie del Quirinale** — R10 gives it a real source
15. **Palazzo Valentini and the Domus Romane** — site 200 (E13 caveat)
16. **Palazzo della Panetteria** · 17. **Palazzo Chigi-Odescalchi** · 18. **Palazzo Baracchini** ·
19. **San Marcello al Corso** · 20. **Chiesa evangelica valdese in Trevi**

Twenty, against a threshold of four. **Strike every one of the thirteen escalated straddlers,
including the Quirinale palace and square, and Trevi still stands at roughly sixteen.** The tier
does not depend on a single contested object, which is the property a tier ruling should have.

**A note for the coordinator.** The finder collected 118 candidates and warned that confirming a
high proportion would mean he had not pushed hard enough. He was right to warn. I am confirming
roughly twenty as guide-grade with fetched non-OSM sources — **about one in six** — and the rest
are palazzi with a stub, parish churches with a wikidata id and nothing else, or OSM tags wearing
the costume of facts. His §6.7 self-assessment ("I do not defend them") is honest and I have taken
him at his word and dropped the lot. The over-collection was the right method; the yield is normal.

---

## 6. What the finder got wrong

In descending order of consequence.

1. **Santa Susanna (D1).** He states both methods return Trevi. An independent Nominatim endpoint
   returns Castro Pretorio, and his own file contains two pieces of contrary evidence he noted and
   walked past. This is the one place in the file where a claimed rione assignment does not hold.
2. **The Aqua Virgo "source conflict" (D3).** He built §3.10 — a headline straddler section — on
   an it.wikipedia caption that does not exist. The string is a Commons filename. There is no
   conflict, and Roma Capitale's `Rione: II - Trevi` stands unopposed.
3. **The Dioscuri provenance (D2, R3).** "Both sources agree" is false; Roma Capitale does not
   mention the Terme di Costantino. And the conflict he *did* report is the wrong shape — Roma
   Capitale credits Domenico Fontana with the square, not the fountain, and its 1589 basin was
   removed in 1783.
4. **The Aqua Virgo visiting block (R11).** He quoted that page at length for the aqueduct's
   history and did not report that the same page carries a closure notice, a group-only entry rule,
   a booking number and a tariff. A whole visiting régime, on a source he had open.
5. **The Palazzo della Dataria contradiction (D4, R5).** He reached the right verdict —
   unresolved — on half the evidence. The article says twice that the building is an appurtenance
   of the presidential palace, and the sale he reported is sourced to a personal website.
6. **The `vincoli` hazard in Article 16 (R6).** He read the treaty more carefully than anyone in
   this programme and still missed that Article 16's operative verb is the banned word. Nobody
   quoting that clause should be doing it from his summary.
7. **The Trevi Fountain competition date (R1).** He used both sources and did not notice they
   disagree, 1731 against 1732.
8. **Le Quattro Fontane (R12).** He concluded on Roma Capitale's page without using the corner
   evidence in it, which points the Diana corner at Trevi, not Monti.
9. **The Scuderie (R10).** He wrote "treat OSM as a lead, not a source" for a building whose real
   source was in an article he quoted three sections earlier.
10. **Superlatives (D14).** He excluded the "most famous fountain in the world" line as an
    unsourceable claim, without noticing that Roma Capitale's own page asserts it. Right answer,
    wrong reason — and the reason matters, because the next finder will assume a municipal source
    launders a superlative.
11. **Galleria Sciarra (D15).** Two of three excluded; *"molto vicina alla Fontana di Trevi"* went
    unflagged, and vague proximity is a named corpus rule.
12. **A fourth over-claim in Trevi's own article.** He found three (§3.13) and a contested fourth
    (§3.11). Largo di Santa Susanna is a fifth: the article lists it among Trevi's piazze while
    naming it, four lines earlier, as the Sallustiano boundary. His §8.6 conclusion — *the article's
    monument lists are a search index, not a roster* — is correct and is the most portable finding
    in the file. It should go into the programme's method doc alongside his `out geom;` finding,
    which I also endorse.

**And what he got right, on the record.** The Article 14/15/16 reading in §5 is correct against the
treaty text, clause by clause, and it corrects the brief. The `out geom;` trap in §2.3 is real and
would have silently lost the rione's headline place. The two-Palazzi-Sciarra warning in §8.1 is
confirmed verbatim from Roma Capitale and would otherwise have handed a Pigna feature to Trevi.
The Waldensian-church disambiguation would otherwise have published the wrong building. The
`Rione:` field discovery in §2.5 is the strongest evidential instrument this programme has found in
Rome, and his observation that Roma Capitale declines to state a rione on exactly the two contested
fountains is confirmed and is worth the arbitrator's attention.
