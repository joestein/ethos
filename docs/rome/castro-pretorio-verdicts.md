# Castro Pretorio (R. XVIII) — VERIFIER'S VERDICTS

Adjudicating `docs/rome/castro-pretorio-finder.md`. Wave 3, Rome programme. Ruled 2026-09-02.

**Counts: 13 PUBLISH · 28 REWRITE · 15 DROP** (56 numbered candidates; the unnumbered §4 tail is
dropped as a block, the finder did not propose it).

**TIER: GUIDE.** 41 surviving places, of which 18 or more are genuine visitor places. Not close to
town-page. The finder's §9 read is correct and I am not stretching to reach it.

---

## 0. COMPLIANCE ON THE THREE RULINGS AND THE MUNICIPIO GAG

- **Ruling 1 — designation claims. CLEAN.** I read all 56 entries and §8. No *vincolato*, no *vincolo
  monumentale*, no "listed", "scheduled", "declared a monument", "protected", "heritage-listed",
  "bene culturale tutelato", "dichiarazione di interesse culturale", in either language. The two
  near-misses the finder quarantined (the `Castra Praetoria` infobox's `beniculturali.it` "Luoghi
  della Cultura" link, and the UNESCO inscription) are correctly characterised. The ministry
  directory link must not become a protection claim; the 1980 UNESCO inscription of the Historic
  Centre remains publishable as an inscription and never as a per-building status.
- **Ruling 2 — Vatican. CLEAN.** No Vatican City property and no Lateran Treaty property, Art. 15 or
  Art. 16, appears in this rione. The finder's §5 handling of the two embassies inside the boundary
  (British, Russian) and the one across it (France to the Holy See at Villa Bonaparte, Sallustiano)
  is correct: diplomatic premises are ordinary Italian territory under the Vienna Convention's
  inviolability regime. **I re-fetched GOV.UK and confirm it contains no territorial language of any
  kind.** No page may write or imply that any of the three is British, Russian or French soil, that
  crossing the gate leaves Italy, or that a border runs there. Same misconception as Palazzo
  Margherita in Ludovisi, offered three times here.
- **Ruling 3 — photographs. CLEAN.** `"photos": []` throughout; §8's image leads are noted and not
  sourced, named or linked as publishable images. They stay in the research file.
- **Municipio gag. HELD.** No entry states a municipio. **I re-fetched the it.wikipedia rione
  wikitext and confirm the infobox reads `circoscrizione = [[Municipio Roma I]], [[Municipio Roma
  II]]`.** The split is real in the source, Nominatim reproduces it on the ground, and the roster's
  gag order stands through this wave. The finder's §3.4 evidence is sound and is for the
  coordinator, not for copy. No page may state a municipio for Castro Pretorio, and no page may
  say the Municipio II seat at Via Goito 35 "is in Municipio II".
- **Reserved list. CLEAN.** No wave 1 or wave 2 reserved place is taken. Santa Maria Maggiore, Santa
  Prassede and Santa Pudenziana are correctly ruled out in §6. The only contact with a reservation
  is 4.11, which *names* the Villa Farnesina as the source of frescoes displayed at Palazzo Massimo.
  **I rule that permissible**: naming a reserved place as the provenance of an object held here does
  not create a place entry and cannot collide in a seed file. The Villa Farnesina building remains
  wave 1's. Two further reserved-place mentions must be **removed**: Turismo Roma's "San Bernardo
  sembra un Pantheon in miniatura" (4.19) is an unnecessary comparison to a reserved place — cut it,
  and describe the oculus and coffered dome directly.

---

## 1. RE-FETCH LOG — what I confirmed, and the one source I could not reproduce

I re-fetched with `python3 + urllib`, raw bytes, this session. Fourteen sources, covering the five
the finder leaned on hardest plus nine more.

### Confirmed — says what the finder said it says
| Source | Result | Verdict |
|---|---|---|
| `sovraintendenzaroma.it/.../fontana_delle_najadi_...` | 200, 56,055 B | **CONFIRMED.** `Rione:` field literally reads **Castro Pretorio**. Authors Guerrieri and Rutelli; datazione 1885-1914; granito/travertino/bronzo/conglomerato cementizio; 10 Sept 1870 provisional papal inauguration in the Termini area; architecture 1885; stucco lions for Wilhelm II in 1888; Rutelli commissioned 1897; inaugurated 1901; cement central group 1911 rejected, moved 1913 to the Piazza Vittorio Emanuele II garden; Glauco with the dolphin inaugurated 1914; restored 1998 and again in 2025 under PNRR – Caput Mundi. All verbatim. |
| `turismoroma.it/.../porta-pia-e-il-museo-storico-dei-bersaglieri` | 200, 130,916 B | **CONFIRMED.** Porta Nomentana replaced by Porta Pia 1561-1565; one of 18 gates; Pius IV; Michelangelo; Giacomo Del Duca after the 1564 death; attic and outer façade toward Via Nomentana are 19th-century and unconnected; Vasi 1765 quoted; Breccia 20 Sept 1870 "a qualche decina di metri"; marble monument 1920 and a commemorative column; Morbiducci's Monumento al Bersagliere placed in the piazzale 1932. Coordinate `POINT (12.50126580698479 41.90931630624808)` matches. |
| `sovraintendenzaroma.it/content/porta-pia-...` | 200, 57,149 B | **CONFIRMED, with a caveat that changes a ruling — see §3.** "ultimata nel XIX secolo dall'architetto Virginio Vespignani" is there verbatim. So is the museum since 1932, the Sacrario "agli oltre 100.000 Caduti", the two-flights-of-stairs accessibility note, max 15, 060608 booking and "Durata: 60 minuti". **The Del Duca / Vespignani conflict between two Roma Capitale bodies is real.** |
| `turismoroma.it/.../basilica-di-santa-maria-degli-angeli-...` | 200, 142,211 B | **CONFIRMED.** 1561 Pius IV on Antonio Lo Duca's prompting; an 86-year-old Michelangelo; rectangular hall "lunga oltre 90 metri" unaltered; natatio used for the apse; concave brick façade from a calidarium exedra; 18 Feb 1564 death, work continued by Jacopo Del Duca, pupil and Lo Duca's nephew; Meridiana / Linea Clementina inaugurated October 1702 under Clement XI by Francesco Bianchini, bronze line c. 45 m in a marble band; Vanvitelli 1750 and the Piazza Esedra façade; demolished 1911 to restore the calidarium niche; 1998 Comune organ by Bartolomeo Formentelli of Verona; 2001 Quagliata glass dome 5 m across at 23 m, working as a meridian. |
| `santamariadegliangeliroma.it/orari/` | 200, 51,305 B | **CONFIRMED.** The reopening banner, the Mon-Fri and Sat/Sun/holiday opening hours, the Mass times including Sunday 9:00 English / 10:30, 12:00, 18:30 Italian / 17:00 Spanish, and confessions daily 10:00-12:00 all read exactly as quoted. |
| `operaroma.it/teatro/teatro-costanzi/` | 200, 59,723 B | **CONFIRMED.** 1879 construction for Domenico Costanzi (1810-1898); Achille Sfondrini (1836-1900) of Milan; built in eighteen months on the site of Elagabalus' villa; inaugurated 27 Nov 1880 with *Semiramide* under Giovanni Rossi before the sovereigns; "cassa armonica" and the horseshoe; 2,212 seats, three tiers, amphitheatre, gallery, dome frescoed by Annibale Brugnoli; the four premieres with their dates; Mocchi 1907, Carelli 1912; 1926 purchase, Piacentini remodelling, closed 15 Nov 1926, reopened 27 Feb 1928 with *Nerone*; further rebuilt 1958. |
| `turismoroma.it/.../museo-nazionale-romano-palazzo-massimo-alle-terme` | 200, 141,087 B | **CONFIRMED on content, WRONG ON ADDRESS — see §3.** MNR instituted 1889; 1883-1887 to Camillo Pistrucci's design, neo-Cinquecento, on ground occupied by Villa Peretti built by Sixtus V; acquired by the State 1981; all the named collections and sculptures; Villa di Livia frescoes and four reconstructed Villa della Farnesina rooms of the nine surviving, c. 20 BC; Tue-Sun 9.30-19.00, ticket office 18.00, closed Monday. |
| `turismoroma.it/.../terme-di-diocleziano` | 200, 124,986 B | **CONFIRMED.** Begun by Maximian in 298; inaugurated between 305 and 306 and dedicated to Diocletian; 13 hectares; up to 3,000 people; the calidarium/tepidarium/frigidarium axis recognisable in the basilica; in use to the mid-6th century when the Gothic war cut the water supply. Also independently confirms the Aula Ottagona "nell'angolo occidentale, all'incrocio con l'odierna via Parigi" (4.12) and that a circular hall on the west side "è stata trasformata nella chiesa di San Bernardo alle Terme" (4.19). Address Viale Enrico De Nicola 78 confirmed. |
| `sovraintendenzaroma.it/content/mura-serviane-1` | 200, 51,095 B | **CONFIRMED verbatim,** including the full dating argument: "tufo giallo di Grotta Oscura", quarries in Veian territory, mass use in Rome therefore after the 396 BC conquest. c. 11 km, 426 hectares, the agger from Porta Collina to Porta Esquilina, and "I resti più monumentali sono quelli conservati a fianco della Stazione Termini, dove si apriva la Porta Viminalis". |
| `sovraintendenzaroma.it/content/monumento-ai-caduti-di-dògali` | 200, 54,120 B | **CONFIRMED — and richer than the finder reported. See §3.** 548 soldiers, 26 Jan 1887, De Cristoforis, ras Alula's Ethiopian imperial forces; Francesco Azzurri (1827-1901); Feb 1887 Council on Bonghi's proposal in *L'Opinione*; Torlonia's suggestion; the Ramses II obelisk found 1883 in Lanciani's excavation of the Iseo Campense; 9 March 1887 siting "nella piazza antistante la Stazione Termini, che da allora è intitolata ai 'Cinquecento'"; inaugurated 5 June 1887; moved July 1924 – 31 May 1925; de Vico (1881-1969). |
| `turismoroma.it/.../chiesa-di-san-bernardo-alle-terme` | 200, 145,072 B | **CONFIRMED.** Location field "PIAZZA S. BERNARDO, 105". Circular tower of the Baths; 1598 Caterina Sforza Cesarini; windowless, lit only by the dome oculus; 22 m diameter; eight raised niches with stucco saints by Camillo Mariani "intorno al 1600", over three metres each, the eight named as listed; two Odazzi altarpieces; Feuillant Cistercians then the congregation of Bernard of Clairvaux; Overbeck's funerary monument in the Cappella di San Francesco; Nicola Morettini organ 1885; tel. 06 4882122 and no hours. |
| `gov.uk/world/organisations/british-embassy-rome` | 200, 82,400 B | **CONFIRMED.** "Via XX Settembre 80/a, 00187 Rome, Italy" and "Public access to embassies, high commissions and consulates is by appointment only", both verbatim. No territorial language. |
| `mef.gov.it/ministero/palazzo/museo.html` | 200, 182,720 B | **CONFIRMED.** "Dal 25 ottobre 2016 il Museo della Zecca è ospitato a Roma negli stabilimenti di via Salaria 712", and the collection "era esposta fino al 2015 nella precedente sede del Museo, in via XX Settembre". §6's ruling-out is correct. |
| it.wikipedia `Castro_Pretorio`, `Piazza_dei_Cinquecento`, `Chiesa_di_Sant'Isidoro_alle_Terme`, `Basilica_del_Sacro_Cuore_di_Gesù_(Roma)`, `Biblioteca_Nazionale_Centrale_di_Roma` (via `action=raw`) | 200 | **CONFIRMED**, several with consequences — see §3. |

### NOT reproducible — reported by name, as instructed
> **`basilicadelsacrocuore.it` returns HTTP 403 Forbidden to me on every path I tried** — `https://`
> and `http://`, `www.` and bare, the homepage, `/la-basilica/orario-celebrazioni/`,
> `/la-basilica/le-camerette-di-don-bosco/`, and even `/robots.txt`. Five attempts, whole-host
> refusal, not a path problem. The finder reports fetching it successfully; I cannot reproduce that,
> and I will not pass through first-party claims I could not read. **This costs 4.18 all its
> operational content and costs 4.2 its independent corroboration.** Rulings below.

I did not re-fetch `sovraintendenzaroma.it/.../fontana_del_mose` (4.28) or the two Quattro Fontane
pages; those rest on the finder's report. Everything else load-bearing was re-read.

---

## 2. THE VERDICTS

Format: **entry** — RULING — reason. REWRITE gives replacement wording the author uses verbatim.

### A. Antiquity, walls and gates

**4.1 Terme di Diocleziano — REWRITE.**
Every figure confirmed. Two changes. (a) The finder omitted the start date; Turismo Roma gives it.
(b) Turismo Roma opens with "Sono le più grandi terme di Roma", **a superlative the finder failed to
quarantine.** It does not ship.
> Replacement: "Turismo Roma, Roma Capitale's tourism service, records that construction of the Baths
> of Diocletian was begun by the emperor Maximian in 298 AD and that the complex was inaugurated
> between 305 and 306 and dedicated to Diocletian, with whom Maximian shared command of the empire.
> Turismo Roma gives the extent as 13 hectares and the capacity as up to 3,000 people, and says the
> central axis of calidarium, tepidarium and frigidarium is still legible in the Basilica of Santa
> Maria degli Angeli e dei Martiri. The complex remained in use until the middle of the 6th century,
> when the Gothic war interrupted its water supply. The address is Viale Enrico De Nicola 78."

**4.2 Castra Praetoria — REWRITE.**
The corroborating source is the one I cannot reach, so **Sejanus and the Constantine/Ponte Milvio
dismantling both come out.** Separately, the finder misread the rione article: "le caserme della
guardia pretoriana costituita da Tiberio tra il 21 ed il 23 d.C." attaches *costituita* to the guard,
not to the camp. Take the 21-23 dating from the `Castra Praetoria` article, attributed, not from that
sentence. Dimensions are aggregator-only.
> Replacement: "The rione takes its name from the Castra Praetoria, the camp of the Praetorian Guard.
> Italian Wikipedia's article on the Castra Praetoria dates its construction to 21-23 AD under
> Tiberius and gives its extent as 440 by 380 metres. Aurelian later absorbed its walls into his
> circuit, which is why the camp's northern and eastern sides survive as part of the city wall."

**4.3 Caserma "Castro Pretorio" (Caserma Macao) — REWRITE.**
Context only. The operator's site fails TLS, so no operational statement is sourced. Strip the
`Visitabile = no` infobox value, which is an aggregator making an operational claim.
> Replacement: "The ancient camp is occupied today by a working barracks of the Esercito Italiano on
> Viale Castro Pretorio. It is not open to visitors."
Note the it.wikipedia superlative about the world's oldest continuously garrisoned barracks is
correctly quarantined in §8 and does not ship.

**4.4 Porta Praetoriana — DROP.**
Not a rione claim we can carry. **It.wikipedia's own "Porte" section for this rione lists only Porta
Pia and Porta Nomentana (murata) — Porta Praetoriana is absent**, so determination (D) is not merely
silent, it declines. Nominatim returns no `quarter` and offers `suburb = Nomentano`. A gate on the
outer face of the wall on Viale del Policlinico, with polygon evidence alone, is not enough. Escalate
for the record; do not take.

**4.5 Mura Aureliane, Viale Castro Pretorio / Viale Pretoriano stretch — DROP as a place.**
The wall line *is* the rione boundary here; a boundary is not a place inside the thing it bounds.
Usable as prose context in the intro, not as an entry. The Camminamento (§3.5) is separately out:
its access is from Via dei Frentani and Via dei Ramni, both in San Lorenzo, on the outer face.

**4.6 Porta Pia — REWRITE. This is one of the rione's strongest entries.**
Both Roma Capitale pages re-fetched and confirmed. **The Del Duca / Vespignani conflict is real and
must be attributed, never merged** — the finder's instruction is right and I am enforcing it. Turismo
Roma also gives a precise museum date the finder rounded off.
> Replacement: "Turismo Roma records that Porta Pia replaced the older Porta Nomentana between 1561
> and 1565 and is one of the eighteen gates of the Aurelian Walls. Pope Pius IV gave the design to
> Michelangelo; it was among his last works of architecture, and after his death in 1564 the project
> passed to the architect Giacomo Del Duca. The Sovrintendenza Capitolina, describing the same gate,
> says instead that Michelangelo completed only the inner front and that the gate was finished in the
> 19th century by the architect Virginio Vespignani. Both are Roma Capitale bodies and the corpus
> reports both. Turismo Roma adds that the designs of the attic and of the outer façade toward Via
> Nomentana are 19th-century and unconnected to Michelangelo's project. On 20 September 1870 the
> Breccia was opened in the walls a few tens of metres from the gate; a marble monument of 1920 and a
> commemorative column mark the event, and Turismo Roma says the marks of the fighting are still
> visible on the walls and on the gate itself. The Monumento al Bersagliere by the sculptor Publio
> Morbiducci was placed in the middle of the piazzale outside the gate in 1932."
Giuseppe Vasi's *Indice istorico del gran prospetto di Roma* (1765) is quoted in full on the Turismo
Roma page and may be quoted, cited to Vasi via Turismo Roma. **The Monumento al Bersagliere itself
stays out as an entry** — the finder's polygon puts it outside every rione — but naming it as
standing outside the gate, which is what Turismo Roma says, is fine.

**4.7 Porta Nomentana — REWRITE.** Determination (D) supports it: it.wikipedia's rione "Porte" list
names it explicitly, "(murata)". Publish, attributed, and **say nothing that makes the embassy
foreign territory.**
> Replacement: "Porta Nomentana, on Viale del Policlinico, was part of Aurelian's original circuit
> and was walled up in 1564, when Porta Pia opened, according to Italian Wikipedia, which also says
> the walled-up gate now forms part of the perimeter wall of the British Embassy compound. The
> embassy stands on Italian soil; diplomatic premises are inviolable under the Vienna Convention but
> are not foreign territory."
Do not state a distance from Porta Pia — the "about 100 m south-east" is aggregator-derived and
unmeasured; a measured, sourced distance would be fine, this is not one.

**4.8 Mura Serviane — REWRITE.**
Confirmed verbatim. **But the finder quoted the page and missed a superlative in it**: "426 ettari,
**la più ampia fra quelle della stessa epoca conservate in Italia**". That clause does not ship.
And the entry must state plainly that the famous fragment is not ours.
> Replacement: "The Sovrintendenza Capitolina describes the Servian Wall as surviving in large blocks
> of yellow tufa. It dates the oldest circuit to the 6th century BC and attributes it to Servius
> Tullius, but says most of what survives belongs to the rebuilding of the early 4th century BC,
> shortly after the sack of Rome by the Gauls in 390 BC — a dating confirmed by the use of a
> particular tufa, 'tufo giallo di Grotta Oscura', quarried in territory controlled by the Etruscan
> city of Veii, whose heavy use in Rome must therefore postdate the conquest of Veii in 396 BC. The
> Sovrintendenza gives the circuit as about 11 km enclosing 426 hectares, and says that from the
> Porta Collina to the Porta Esquilina, where the ground is flat, an agger of ditch and rampart
> reinforced the wall. The Sovrintendenza states that the most monumental surviving remains are those
> beside Termini station, at the former Porta Viminalis — those are in the neighbouring rione of
> Esquilino, not here. One further stretch, near Via Gaeta and Via Volturno, falls inside Castro
> Pretorio."

### B. Museums

**4.9 MNR — Terme di Diocleziano — REWRITE.** The operator's four domains are unreachable, so the
hours are Roma Capitale republishing a state museum. Publish them attributed and with the caveat the
source itself carries; do not present them as the museum's own.
> Replacement: "Turismo Roma records that the Museo Nazionale Romano was instituted in 1889 and that
> part of the Baths has housed its Roman antiquities section since that year, with the finds arranged
> by topographic criterion and the garden holding funerary epigraphy and architecture. Turismo Roma
> republishes the opening hours as closed on Monday, with last entry at 18.00, and directs visitors to
> the museum's own site for updates; that site could not be reached when this entry was written."

**4.10 Chiostro di Michelangelo sub-entries — DROP.** OSM only, by the finder's own admission. The
colossal animal heads, the Cratere Colossale, the Natatio, the Fontana del Chiostro and the Portale
di Villa Panzani are real and would be excellent, but nothing fetched describes them. Research them
in a later wave; do not ship on map tags.

**4.11 MNR — Palazzo Massimo alle Terme — REWRITE, and escalate the address.**
Content confirmed in full. Three changes.
(a) **The address is wrong. Turismo Roma's Location field reads "Largo di Villa Peretti, 1", not
"Via Giovanni Amendola 1".** The finder took the OSM `addr` and did not report the divergence.
Largo di Villa Peretti is the finder's own §3.6 straddler, and Turismo Roma files the museum under
its "Esquilino - Monti" tourism zone. This is escalated in §4.
(b) Turismo Roma's "la raccolta archeologica più importante del mondo" is correctly quarantined and
must not creep back in as "one of the world's great collections" either.
(c) Doidalsas: the source says "la Venere che sta per fare il bagno", not the crouching Venus.
> Replacement for the disputed clauses: "Turismo Roma gives the museum's address as Largo di Villa
> Peretti 1. Italian Wikipedia dates the building 1883-1886; Turismo Roma dates it 1883-1887 and
> names Camillo Pistrucci as its architect, working in a neo-Cinquecento style on ground previously
> occupied by the Villa Peretti built by Sixtus V and later a Massimo family residence. The State
> acquired it in 1981 and converted it to exhibition space."
The **Villa della Farnesina frescoes may be named** — see §0. Write: "four rooms of the nine surviving
from the Villa della Farnesina, dated to about 20 BC, are reconstructed on the second floor."

**4.12 MNR — Museo dell'Arte Salvata (Aula Ottagona) — PUBLISH.**
The only entry with genuinely independent Roma Capitale corroboration on its location: the Turismo
Roma Terme di Diocleziano page, which I re-fetched, places the octagonal hall "nell'angolo
occidentale, all'incrocio con l'odierna via Parigi" and names the Museo dell'Arte Salvata as its
occupant. Address Via Giuseppe Romita 8. The finder correctly did not use the unsourced Planetarium
history — leave it out.

**4.13 Museo Storico dei Bersaglieri — REWRITE. The finder made a real error here.**
The Sovrintendenza page cited is **not a museum record. It is a *Passeggiate Romane* event listing
for a guided walk on Friday 22 May 2026 at 10.00** — a single dated tour, now four months past. Its
"prenotazione obbligatoria allo 060608", "massimo 15 partecipanti" and "attività non adatta a persone
con difficoltà motorie perché ci sono da salire due piani di scale" are **that tour's conditions, not
the museum's standing terms**, and the finder presented them as the museum's. They do not ship. The
"Durata: 60 minuti" was correctly quarantined for a different reason and stays out.
> Replacement: "The Sovrintendenza Capitolina states that Porta Pia has housed the Museo Storico dei
> Bersaglieri since 1932, and that the museum holds relics of the Corps' foundation, of the
> Risorgimento campaigns and of both world wars, with a Sacrario dedicated to more than 100,000
> fallen on the ground floor. Turismo Roma gives the museum's inauguration date as 18 September 1932
> and describes the floors in turn: the Risorgimento campaigns of 1848 to 1866 on the first floor,
> the colonial campaigns above, the First World War below and the Second World War on the ground
> floor, with bronze busts of the Corps' figures in the courtyard. The museum is run by the Esercito
> Italiano, whose website could not be reached when this entry was written, so no opening hours are
> published here."

**4.14 Biblioteca Nazionale Centrale di Roma — REWRITE, down to identity and address.**
I re-fetched the it.wikipedia article and every figure the finder quoted is there: address Viale
Castro Pretorio 105 00185, institution 1875/1876, Collegio Romano origin, `Apertura = gennaio 1975`,
Castellazzi / Dell'Anese / Vitellozzi, Movimento Moderno, four sectors, eleven reading rooms, 112 km
of shelving, the three atrium exhibition areas, Spazi900, "La stanza di Elsa" and Elsa Morante. All
confirmed **as Wikipedia's text**. But the corpus rule is explicit — *write what the institution says,
not what Wikipedia says* — and the library's own site is unreachable on five domains, so there is no
institution to quote. The "una delle più grandi biblioteche d'Italia" superlative is correctly
quarantined; so must be the article's "nei pressi della Stazione Termini" and "nei pressi
dell'Università della Sapienza", both vague proximity.
> Replacement, the whole entry: "The Biblioteca Nazionale Centrale di Roma 'Vittorio Emanuele II' is
> at Viale Castro Pretorio 105, 00185 Rome. Italian Wikipedia describes it as one of Italy's two
> national central libraries alongside the Biblioteca Nazionale Centrale di Firenze, records that it
> was instituted in the 1870s and originally housed in the Collegio Romano, and attributes the
> present building, occupied from 1975, to Massimo Castellazzi, Tullio Dell'Anese and Annibale
> Vitellozzi, working in the idiom of the Movimento Moderno. Italian Wikipedia also says three
> exhibition areas in the atrium are open to the public, among them the Museo Spazi900, whose
> permanent centrepiece, 'La stanza di Elsa', recreates Elsa Morante's writing room from her original
> furniture. The library's own website could not be reached when this entry was written, so no hours,
> holdings figures or access conditions are published here."
Everything else — the 112 km, the nine million volumes, the four sectors and eleven reading rooms —
**DROP.**

**4.15 MuSEd — REWRITE.** The superlative is correctly quarantined. `museodellascuola.uniroma3.it`
does not resolve, and the two addresses conflict. Publish the institutional identity, which
`uniroma3.it` does support, and give both addresses as reported rather than picking one.
> Replacement: "The MuSEd, the Museo della Scuola e dell'Educazione 'Mauro Laeng', is run by the
> Dipartimento di Scienze della Formazione of the Università Roma Tre, whose own site confirms the
> department. Italian Wikipedia describes it as a museum of the history of pedagogy, founded in 1874
> and opened in its present form in 1986, and gives its address as Piazza della Repubblica 10; the
> department is also recorded at Via del Castro Pretorio 20. Its own website did not resolve when
> this entry was written."

**4.16 GAMM — Museo del Videogioco — DROP.** Concur with the finder. A 545-byte placeholder site, a
homonym company at `gamm.it`, and **it.wikipedia's rione article does not list it among the rione's
museums either.** Nothing establishes that it is open or exists as described.

### C. Churches

**4.17 Basilica di Santa Maria degli Angeli e dei Martiri — REWRITE, and it is the best entry here.**
Both sources re-fetched and confirmed line by line, and the finder's ruling that the parish's own
site beats Turismo Roma's stale Mass schedule is correct. Three changes.
(a) **The reopening banner is a dated notice, not evergreen copy.** As of writing the basilica is
closed for restoration and reopens Sunday 6 September. A corpus page cannot carry that as standing
text; it must carry the standing hours and a closure note that will be reviewed.
(b) The "il più grande organo d'Italia in stile barocco francese" superlative is correctly
quarantined and must not return.
(c) **Do not reproduce Turismo Roma's "Gian Domenico Grassini"** — the astronomer Bianchini worked
from is Cassini, and Turismo Roma has garbled the name. Omit the inspiration clause entirely rather
than publish an error or silently correct a source.
> Replacement for the hours block: "The basilica publishes its own hours: Monday to Friday 8:00-13:00
> and 16:00-19:00, Saturday, Sunday and holidays 10:00-13:00 and 16:00-19:00. Mass is at 18:30
> Monday to Saturday; on Sunday at 9:00 in English, 10:30, 12:00 and 18:30 in Italian, and 17:00 in
> Spanish. Confessions are heard daily from 10:00 to 12:00 and after each Mass. The basilica has been
> closed for restoration and announced its reopening on these hours for Sunday 6 September; check
> the parish's site before travelling."

**4.18 Basilica del Sacro Cuore di Gesù a Castro Pretorio — REWRITE, and this entry loses half its
substance. Report this one to the coordinator.**
It.wikipedia, which I re-fetched, independently confirms the whole history: Pius IX's first stone in
1870, the halt at the annexation of Rome, the resumption in 1880 through St John Bosco, completion in
1887, the architect Francesco Vespignani, the parish erected 2 February 1879 by the vicarial decree
*Postremis hisce temporibus*, elevation to minor basilica by Benedict XV on 11 February 1921 by the
apostolic letter *Pia societas*, Paul VI's deaconry of 5 February 1965, and the Camerette — Don
Bosco's twentieth and last journey to Rome, 30 April to 18 May 1887, the two rooms with the dividing
wall later removed. **All of that PUBLISHES, attributed to Italian Wikipedia.**
**But `basilicadelsacrocuore.it` 403s to me on every path, so every first-party claim DROPS:**
- the address "Via Marsala 42, 00185" — say "in Via Marsala", which it.wikipedia supports;
- daily opening 06:00-19:00;
- every Mass time, including the 15:30 Filipino Mass and the 17:30 weekday Rosary;
- "opened to the public in 1934 after his canonisation";
- "converted to a chapel in 1969";
- "arranged to a design by the architect Sergio Checca".
Also drop "nelle vicinanze della Stazione Termini" and "a pochi passi dalla nostra basilica" — both
vague proximity, both already quarantined in §8, correctly.
> Replacement for the Camerette: "Behind the choir the Salesians preserve the rooms known as 'le
> Camerette di Don Bosco'. Italian Wikipedia records that Don Bosco stayed there from 30 April to 18
> May 1887, on the twentieth and last of his journeys to Rome, for the consecration of the basilica;
> that the space was originally two rooms, a study where he received visitors and a bedroom with a
> cabinet altar for private Mass; and that the wall between them was later demolished to make a
> single chapel as pilgrims began to come."
If the coordinator can reach the parish site from another network, the operational block should be
restored from it; on this network it cannot be verified and must not ship.

**4.19 Chiesa di San Bernardo alle Terme — REWRITE.** Re-fetched and confirmed, address "PIAZZA S.
BERNARDO, 105". Three changes.
(a) **Cut the Pantheon comparison** (reserved place, §0) and describe the light directly.
(b) The finder dropped a step: the Feuillants were not simply succeeded, the order was dissolved
after the French Revolution.
(c) **Turismo Roma contradicts itself and the finder merged the two versions.** This page says the
church was built on the perimeter of "una delle quattro torri circolari" flanking the Baths' remains;
the Terme di Diocleziano page says there were "due aule circolari" flanking the great exedra, one of
which became San Bernardo. Pick the church's own page and say so; do not blend them.
> Replacement opening: "Turismo Roma says the church stands on the perimeter of one of the circular
> towers that rose beside the remains of the Baths of Diocletian, and that in 1598 the countess
> Caterina Sforza Cesarini had it turned into a church. It is cylindrical and entirely without
> windows, lit only through the circular opening at the centre of an octagonally coffered dome, and
> measures 22 metres across inside. Eight raised niches hold stucco saints by Camillo Mariani, made
> around 1600 and each more than three metres tall: Augustine, Monica, Mary Magdalene, Francis,
> Bernard, Catherine of Alexandria, Catherine of Siena and Jerome. The two altarpieces are by
> Giovanni Odazzi. The church was first entrusted to the French Cistercians known as the Feuillants;
> after the French Revolution the order was dissolved and San Bernardo passed to the congregation of
> Bernard of Clairvaux, to whom it is dedicated. The Cappella di San Francesco holds the funerary
> monument of the German painter Friedrich Overbeck, founder of the Nazarenes, and the organ in the
> apse is by Nicola Morettini, 1885. Turismo Roma publishes a telephone number, 06 4882122, and no
> opening hours, directing visitors to the contacts given."
The guidebook trap must be stated: **Santa Susanna is in Trevi and Santa Maria della Vittoria is in
Sallustiano.** Both are on the same square and neither is ours.

**4.20 Chiesa di San Paolo dentro le Mura — REWRITE, and the name changes.**
It.wikipedia's rione article lists it as "**Chiesa di San Paolo dentro le Mura**", not *entro*. Use
the source's name with the English name alongside. **DROP "la prima non cattolica costruita a Roma
dopo l'Unità d'Italia"** — a first/oldest claim from an aggregator, exactly the class the corpus rules
exclude. **DROP "anglicana"**, which the same article contradicts two lines later; the church is
American Episcopal. `stpaulsrome.it` is a dead stub, so there is no first-party source at all and the
whole entry must be attributed.
> Replacement: "St Paul's Within the Walls, in Italian the Chiesa di San Paolo dentro le Mura, stands
> at Via Nazionale 16a, with a side entrance on Via Napoli. Italian Wikipedia says it was built
> between 1873 and 1880 by the English architect George Edmond Street for Rome's American Episcopal
> community, at the initiative of the Reverend Robert J. Nevin, in a neo-Romanesque and neo-Gothic
> manner using red Sienese brick alternating with travertine. Turismo Roma publishes a telephone
> number, 06 4883339, and no opening hours."
The Burne-Jones mosaics were correctly left out for want of a source. They are the reason people go;
find a source in a later wave.

**4.21 Chiesa del Santissimo Rosario di Pompei — REWRITE, name only.** The rione article's own name
for it is "Chiesa del Santissimo Rosario di Pompei". Lead with that, keep the double dedication OSM
records as an alternative. 1889-1898, Pio Piacentini, neoclassical, Marist provincial curia and
student hostel attached — aggregator-only, attribute. Via Cernaia 16.

**4.22 Chiesa russa di San Nicola Taumaturgo — PUBLISH.** Identity, address Via Palestro 69/71,
telephone from Turismo Roma. The finder correctly quarantined the parish's own "oldest Russian church
in Italy" claim: it is a first-party "the oldest" and is unpublishable. The finder's care here is
exactly right and I am confirming it, not softening it.

**4.23 Chiesa evangelica metodista in Castro Pretorio — REWRITE.** Publish the address, Via XX
Settembre 123 at the corner of Via Firenze. **Do not publish the coordinate**: the finder's §7.1
finding is that Turismo Roma gives the identical `POINT (12.4914064 41.9023045)` for this church and
for Palazzo Esercito, so at most one is right. Built 1893-1895, consecrated 20 September 1895, on
ground cleared by the 1881 master plan on the site of the demolished San Caio — attribute to Italian
Wikipedia. The rione article's "Scomparse" list independently names San Caio, Santa Teresa alle
Quattro Fontane and the Santissima Incarnazione del Verbo Divino, which corroborates the clearance
story.

**4.24 Chiesa di Sant'Isidoro alle Terme — REWRITE. I resolved this; the finder could not.**
I fetched the it.wikipedia article. It says the church was **first deconsecrated and then demolished
in 1940**, to let the remains of the Baths of Diocletian re-emerge; that **its façade is still visible
on Via Parigi**; and that one small interior space survives, formerly used as exhibition space by the
Museo Nazionale Romano delle Terme di Diocleziano, **"ma ad oggi (2023) non accessibile al pubblico"**.
OSM's `place_of_worship` tag on way 112383673 is simply stale. Ship it as a façade; never as a church.
> Replacement: "Beside the Octagonal Hall, on Via Parigi, stands the surviving façade of the church of
> Sant'Isidoro alle Terme. Italian Wikipedia records that Benedict XIV had the church built in 1754
> to a design by Giuseppe Pannini, using rooms next to the Octagonal Hall that had served the popes
> as grain stores, and that the church was deconsecrated and then demolished in 1940 so that the
> remains of the Baths could be brought back to view. The façade on Via Parigi remains; one small
> interior room survives and, as of 2023, is not open to the public."

**4.25 Cappella del Santissimo Crocifisso alla Stazione Termini — DROP.** Esquilino on the finder's
own point-in-polygon and on Nominatim. Correctly not taken.

### D. Squares, fountains and monuments

**4.26 Piazza della Repubblica — PUBLISH.** Turismo Roma on the old name from the Baths' great exedra,
the semicircular colonnade retracing its perimeter, and Gaetano Koch of Turin as the architect of the
framing palaces, late 19th century. Clean.

**4.27 Fontana delle Naiadi — PUBLISH. Strongest attribution in the file and it holds up.**
I re-fetched the Sovrintendenza page and the `Rione:` field reads **Castro Pretorio**, exactly as
claimed. Every date, author, material and restoration confirmed verbatim, including the 2025 PNRR –
Caput Mundi restoration. Two notes for the author. (a) The page ends with "la fontana costituisce
l'esempio più significativo del linguaggio liberty a Roma" — a superlative; the finder did not quote
it and it must stay out. (b) **This page says the Dogali obelisk was "eretto nel 1888"; the
Sovrintendenza's own Dogali page says the monument was inaugurated 5 June 1887.** Two pages of the
same body disagree. Do not merge them and do not use the Naiadi page for the obelisk's date.
The four nymphs may be named — Oceans, Rivers, Lakes, Subterranean Waters — with their creatures from
Turismo Roma, and the Glauco. Turismo Roma's "tre tritoni, un delfino e un polipo" for the rejected
central group is unique to Turismo Roma and must be attributed to it.

**4.28 Fontana del Mosè — PUBLISH.** The second `Rione: Castro Pretorio` attribution. **I did not
re-fetch this page**, so it rests on the finder's report; given that the Naiadi and Mura Serviane
pages from the same body checked out verbatim, I accept it, and flag that it is unverified by me.
Note the finder's warning, which is a good catch: **Turismo Roma's separate "Acquedotto Felice"
record points at Via Lemonia in the Parco degli Acquedotti, a different place entirely. Do not
join them.**

**4.29 Monumento ai Caduti di Dògali — REWRITE, and the finder missed the best material on the page.**
Everything the finder reported is confirmed verbatim. Three changes.
(a) **The Lion of Judah is absent from the finder's entry and it is the most substantial thing the
Sovrintendenza says about this monument.** It must be added.
(b) The Sovrintendenza gives the obelisk as **Aswan** granite; Turismo Roma says red granite over 9 m
tall. Do not merge; attribute each.
(c) The source says the garden lies between "via delle Terme di Diocleziano e via Luigi Einaudi";
the finder wrote *Viale* Einaudi.
> Addition, verbatim: "The Sovrintendenza Capitolina records that after the Italian conquest of
> Ethiopia in 1935-36 the Lion of Judah — a gilded bronze sculpture given to the Negus in 1929 by the
> Société Technique et Industrielle d'Entreprises for the opening of the passenger service at the
> Ethiopian capital's railway station — was brought to Rome as war booty. In March 1937 the proposal
> of Antonio Muñoz, director of the Governatorato's antiquities and fine arts division, to place the
> lion on the base of the Dogali monument was accepted, and the new arrangement was inaugurated on 9
> May that year. The city administration decided to remove the sculpture in 1943; it was held at the
> Antiquarium del Celio until 1970, when it was officially returned to the Ethiopian government."
> Addition: "The Sovrintendenza also records a restoration of the monument and its historic garden
> between 2024 and 2025, carried out by the Soprintendenza Speciale Archeologia Belle Arti e
> Paesaggio di Roma under the PNRR."
The finder's own framing is right and should survive: this monument is why Piazza dei Cinquecento is
called that — the Sovrintendenza says so in as many words — and **the square is Esquilino.** A guide
tells the story without claiming the square.

**4.30 Giardino Zerai Deres — DROP.** No fetchable source for the naming. This name is not a
neutral label — do not guess at it or infer it from the monument it contains. Research it properly
or leave it as "the garden between Via delle Terme di Diocleziano and Via Luigi Einaudi", which the
Sovrintendenza does support.

**4.31 Monumento della Caravella / Colonna di Parigi — REWRITE.** The it.wikipedia rione article
places it "**su via Parigi**"; the finder gave Via Giuseppe Romita from Turismo Roma's location field.
Give the street from one named source or omit it. The rest — cipollino marble column, bronze caravel
given by Paris, erected 1959 for the twinning of 9 April 1956, with the motto — is confirmed in the
rione wikitext and publishes attributed.

**4.32 Monumento a Quintino Sella — PUBLISH.** Confirmed in the rione wikitext: bronze by Emilio
Gallori, 1893, Via Cernaia. Aggregator-only; attribute. Thin but sound.

**4.33 Monumento a Silvio Spaventa — PUBLISH.** Confirmed: bronze by Giulio Tadolini, 1898, Via
Cernaia. Aggregator-only; attribute.

**4.34 Piazza dell'Indipendenza — REWRITE.** Publish the square, its post-1870 layout, its naming
for the wars of independence in common with the streets around it, and the crossing of Via Solferino
with Via Goito and Via dei Mille. **DROP the Federconsorzi "1991 collapse"** — an unattributed
aggregator claim about a named organisation's failure, which needs a real source before it is
written anywhere. **DROP the Tomasi di Lampedusa death**, as the finder itself proposed: aggregator-
only, and a claim about a specific flat.

**4.35 Piazza Beniamino Gigli — PUBLISH.** The square in front of the opera house.

**4.36 Le Quattro Fontane — DROP as a unit.** The finder's recommendation is right and the rione
wikitext independently supports it: the article's own boundary prose puts Trevi "nel tratto Via delle
Quattro Fontane-Via XX Settembre", i.e. the junction is on the line. Take Palazzo Albani Del Drago
(4.49) and the Arno figure on its corner; do not take the crossroads. The Sovrintendenza's Quattro
Fontane material — Sixtus V, Domenico Fontana attributed with Pietro da Cortona, 1588-1593 and
1667-69, fed by the Acquedotto Felice, paid for by the adjoining landowners in exchange for water
concessions, Muzio Mattei paying for two — belongs in the 4.49 entry, describing that one fountain.

### E. Theatres

**4.37 Teatro dell'Opera di Roma (Teatro Costanzi) — REWRITE.** Re-fetched and confirmed in detail.
Three changes.
(a) **DROP the house number.** `operaroma.it/teatro/teatro-costanzi/` gives no street address and
`operaroma.it/contatti/` gives only telephone numbers and email. "Piazza Beniamino Gigli 1" is not
first-party; the rione article says only "su piazza Beniamino Gigli". Write the square, not a number.
(b) **The premiere attributions are wrong.** The theatre's own site puts *Cavalleria rusticana* (17
May 1890) and *L'amico Fritz* (31 October 1891) under Domenico Costanzi's management, but *Tosca* (14
January 1900) and *Le Maschere* (17 January 1901) under his son **Enrico**'s direction. The finder
listed all four under the father.
(c) Add that the 1928 reopening with Boito's *Nerone* was conducted by Gino Marinuzzi.
The finder's conflict ruling stands and is confirmed: the it.wikipedia rione article dates the
building "1874-80" and credits Sfondrini and Piacentini jointly, which the theatre's own site
contradicts — Piacentini's involvement is the 1926-28 remodelling. **The theatre's own site wins on
its own dates**, and the corpus says so.

**4.38 Teatro Nazionale — REWRITE. The finder was wrong and this entry is saved.**
The finder wrote "I could not fetch a page for it — `operaroma.it/teatro-nazionale/` is a 404 and I
did not find its correct path", and recommended sourcing or dropping. **The correct path is
`https://www.operaroma.it/il-teatro/teatro-nazionale/`, which returns HTTP 200, 59,750 bytes**
(`/teatro/teatro-nazionale/` serves the same page). It is a full first-party history and the entry
publishes.
> Replacement, the whole entry: "The Teatro Nazionale stands on Via del Viminale at the corner of Via
> Agostino Depretis. The Teatro dell'Opera di Roma, which runs it, records that it was born as a
> cinema called the Supercinema, built in 1925 within a pre-existing building; that its owner,
> commendatore Urbano Rattazzi, commissioned the design from the architects Arnaldo Foschini and
> Attilio Spaccarelli with the engineer Giacomo Giobbe; that the hall measured 36 metres by 30 and
> originally seated 2,500 between stalls and galleries; and that the interior was decorated in
> Italian liberty style with gilded stucco, paintings, stone and fabric. An orchestra pit indicates
> that variety and other live forms alternated with film. From the postwar years it was a cinema
> only. At the end of the 1990s the Comune di Roma acquired the Supercinema and handed it to the
> Fondazione Teatro dell'Opera di Roma as a second house."
**But see §4: its address puts it on the Monti boundary and the rione must be settled first.**

**4.39 Ex-Cinema Volturno — DROP.** OSM `amenity=arts_centre` and nothing else. Concur.

### F. Palazzi and institutions

**4.40 Palazzo delle Finanze — REWRITE.** The MEF first-party address, Via XX Settembre 97, 00187,
publishes, as do the existence and identity of the Biblioteca Storica and the Biblioteca Luca Pacioli
and their holdings. Two drops.
(a) **DROP the architect entirely.** The rione article credits the engineer Raffaele Canevari and
dates it 1871-76; the building article names Francesco Pieroni, Ercole Rosa and Pietro Costa. I
confirmed the rione article's version in the wikitext. Two Wikipedia articles disagreeing with each
other is not a source. Write the dating attributed and leave the architect out until a third source
settles it, exactly as the finder advised.
(b) **DROP "la più antica tra le biblioteche presenti nel Palazzo delle Finanze".** That is an
"oldest" claim, made by the institution about its own facility, and it is exactly what the corpus
rules exclude. The finder passed it through without flagging it. The Pacioli library's "over 12,000
volumes" and its runs of the *Rendiconto generale dello Stato* and the *Bilancio di Previsione* from
1870 are plain counts from the institution and are fine.

**4.41 Palazzo Esercito — REWRITE.** Confirmed in the rione wikitext: "Edificio del XIX secolo
(1876-85). Progetto di Bernardini e Garavaglia", built for the Kingdom's Ministry of War and the Army
General Staff, and seat of the Stato Maggiore della Difesa since 22 February 2017. The three-way date
conflict the finder found is real. **Publish only the century, the 2017 fact and the identity;
attribute the 1876-85 to the rione article and say the building's own article disagrees.** Give the
architects as "Bernardini and Garavaglia" without the ranks and forenames, which the confirmed source
does not carry. **Do not publish Turismo Roma's coordinate** for the same reason as 4.23. The
neighbours are worth recording: Palazzo Caprara and Palazzo Baracchini both test Trevi.

**4.42 Palazzo dei Marescialli — PUBLISH.** Confirmed in the rione wikitext: 1930, Gennaro de
Matteis, Piazza dell'Indipendenza, seat of the Consiglio Superiore della Magistratura. `csm.it` 403s,
so it is aggregator-only and attributed. Thin but sound.

**4.43 Villino Centurini — REWRITE.** Confirmed in the rione wikitext: 1874, "architetto svizzero
Henry Kleffler", for Alessandro Centurini, Piazza dell'Indipendenza at Via Vittorio Bachelet, now
the "liceo statale Niccolò Machiavelli". The forename conflict with the building article's "Enrico"
is real; **write "the Swiss architect Kleffler" and drop the forename**, or give both and say the
two articles disagree. **DROP** the 1933 sale to the Comune, the Liceo Giulio Cesare from 1935, the
Macao-quarter framing and the 1999-2002 rebuild — all from the building article, which I did not
re-fetch and which is the same article that disagrees about the architect's name.

**4.44 Villino Semiradski — PUBLISH.** Confirmed: eclectic, 19th century, Francesco Azzurri, now the
Comando Carabinieri Banca d'Italia. Attribute. Worth pairing with 4.29 — the same architect.

**4.45 Palazzo della Federconsorzi — PUBLISH.** Confirmed: modernist, 1955-57, Ignazio Guidi and
Giulio Sterbini. Attribute. Thin.

**4.46 Palazzo del Corriere dello Sport — PUBLISH.** Confirmed: modernist, 1956, Attilio Lapadula.
Attribute. Thin.

**4.47 Palazzo Nathan — REWRITE.** Confirmed in the rione wikitext: Via Torino, eclectic, 19th
century, 1889, Cesare Janz. **DROP the Nathan connection** — the finder says its only source is a
blog, and the man a building is named for who lived and died in it is precisely the kind of claim
that needs a real source. **DROP** the five storeys, the caryatid window frames and the corner loggia,
which come from the same unverified place. What survives is a one-line entry, which is honest.

**4.48 Palazzo Giolitti — DROP, and escalate.** The finder gave it "(A + C)" with no tested point
recorded, and the source it relies on works against it: **it.wikipedia's own coordinate for the
palazzo is 41.899055, 12.497613.** That is south of the Via Agostino Depretis line which the same
article names as the boundary with Monti, and it is *further south* than the Turismo Roma coordinate
for Palazzo del Viminale (41.899529, 12.494162) which the finder itself ruled **Monti** on exactly
that reasoning. Via Cavour and Via Torino are both on the finder's own list of streets the rione
article names as bounding rather than interior. Do not take it without a recorded point-in-polygon
test at the confirmed coordinate.

**4.49 Palazzo Mattei Albani Del Drago — PUBLISH.** Confirmed in the rione wikitext: Mannerist, 16th
century, 1587, Domenico Fontana for Muzio Mattei, on Via delle Quattro Fontane at Via XX Settembre,
`Coord 41.901988 12.491036` — within metres of the finder's tested point. The Sovrintendenza's
Quattro Fontane page independently confirms Mattei paid for the fountain on his palace's corner,
"poi proprietà Albani Del Drago", and that the corner carries the Arno with a lion. **The palace is
ours; the junction is not.** This is the right way to take value from a straddling crossroads.

**4.50 Cassa Depositi e Prestiti — DROP.** OSM only, not a visitor place. Concur.
**4.51 Villa Pio IX / Foresteria Militare — DROP.** Not open to the public, aggregator-only. Concur.
**4.52 Liceo Scientifico Plinio Seniore — DROP.** Not a visitor place. Concur.

### G. Embassies

**4.53 British Embassy Rome — REWRITE, and escalate the rione.**
GOV.UK re-fetched and confirmed: "Via XX Settembre 80/a, 00187 Rome, Italy" and "Public access to
embassies, high commissions and consulates is by appointment only", both verbatim, with no
territorial language anywhere on the page. The finder's handling is correct and its restraint on
Basil Spence — naming him as the architectural interest but declining to write him in without a
source — is exactly right.
> Replacement, the whole entry: "The British Embassy is at Via XX Settembre 80/a, 00187 Rome. GOV.UK
> states that public access to embassies, high commissions and consulates is by appointment only.
> The embassy compound stands on Italian soil: diplomatic premises are inviolable under the Vienna
> Convention on Diplomatic Relations, which is not the same as being foreign territory, and visitors
> and neighbours there are under Italian law."
**But Via XX Settembre is the rione's boundary street with both Trevi and Sallustiano**, per the
rione article's own prose, and the finder recorded determination (A) alone with no Nominatim result.
Escalated in §4. It is in any case not a visitor place and should be a line of context, not a page.

**4.54 Ambasciata della Federazione Russa — DROP.** No first-party source fetched, an OSM-only
address, and no visitor function. Nothing publishable survives. The §5 warning about foreign
territory applies to it in prose whether or not it gets an entry, and if it is mentioned at all it is
mentioned as Italian soil under diplomatic inviolability.

### H. Hotels and other

**4.55 The St. Regis Rome — DROP.** `marriott.com` 403s, so there is no first-party source; the
it.wikipedia "uno dei più antichi e lussuosi Hotel della Capitale" is a superlative and correctly
quarantined; and what remains — César Ritz, the Marchese di Rudinì, the 1893 purchase from Filippo
Cavallini, the 1894 inauguration — is an aggregator-only origin story about a trading commercial
business, which is the weakest evidential shape in the corpus. Name it in prose if the intro wants
the 1880s hotel quarter; do not give it a place entry.

**4.56 Hotel Quirinale — DROP.** The first-party site was reached, but the finder is right that
everything of interest on it is an "oldest", a "where Verdi stayed" or a trading-duration claim, all
of which the corpus rules exclude for a business sourced to itself. A hotel entry consisting of a
name and a street number is not a place. Name it in prose with the St Regis if useful.

**Unnumbered §4 tail — DROP as a block.** ENIT, UNINETTUNO, ENAC, Villino Gamberini, Palazzo Betti
and the Repubblica and Castro Pretorio metro stations. The finder did not propose them and I am not
adding them.

---

## 3. WHAT THE FINDER GOT WRONG

Ten items. The first four are the ones that would have shipped an error.

1. **`basilicadelsacrocuore.it` is not reachable from here.** HTTP 403 on five attempts across
   `https`/`http`, `www` and bare, three content paths and `/robots.txt`. The finder reports fetching
   it and built 4.18's entire operational block plus 4.2's independent corroboration on it. **Named,
   as instructed.** Everything first-party in 4.18 drops; 4.2 loses Sejanus and Constantine.
2. **4.38 Teatro Nazionale — the source exists.** `operaroma.it/il-teatro/teatro-nazionale/` returns
   200 with a full first-party history. The finder recommended dropping the entry for want of a
   source. It publishes instead. A finder that gives up one path short costs the corpus a place.
3. **4.11 Palazzo Massimo's address is wrong.** Turismo Roma's Location field reads "Largo di Villa
   Peretti, 1". The finder used OSM's `Via Giovanni Amendola 1` and did not report that its own
   primary source disagrees — while separately flagging Largo di Villa Peretti as a straddler.
4. **4.13 the Bersaglieri visiting conditions belong to a single expired tour.** The Sovrintendenza
   page is a *Passeggiate Romane* event listing for Friday 22 May 2026. Its booking requirement,
   15-person cap and stairs warning are that walk's, not the museum's, and were written up as the
   museum's standing terms.
5. **4.29 missed the Lion of Judah** — the longest and most consequential passage on the
   Sovrintendenza's Dogali page, covering the 1937 placement, the 1943 removal and the 1970 return to
   Ethiopia. Also missed the 2024-25 PNRR restoration and the Aswan/red granite conflict.
6. **Two superlatives passed through §8 unquarantined**: the Sovrintendenza's "426 ettari, la più
   ampia fra quelle della stessa epoca conservate in Italia" (Mura Serviane) and Turismo Roma's "Sono
   le più grandi terme di Roma" (Terme di Diocleziano). §8 is otherwise thorough and caught eight
   others correctly.
7. **4.1 misquotes the rione article.** It says the Baths were built "nella zona tra piazza della
   Repubblica, piazza dei Cinquecento, via Volturno e via XX Settembre" — **Piazza della Repubblica,
   not Via Torino.** The same article also dates the end of use to 537 specifically, where Turismo
   Roma says the mid-6th century.
8. **Two names are wrong against the finder's own cited source.** It.wikipedia's rione article says
   "Chiesa di San Paolo **dentro** le Mura" (4.20) and "Chiesa del **Santissimo** Rosario di Pompei"
   (4.21). And 4.20's "la prima non cattolica costruita a Roma dopo l'Unità d'Italia" is a
   first/oldest claim from an aggregator that §8 did not catch.
9. **4.37 misattributes two premieres.** *Tosca* and *Le Maschere* are under Enrico Costanzi on the
   theatre's own page, not Domenico. And "Piazza Beniamino Gigli 1" is presented as first-party when
   neither the Teatro Costanzi page nor `/contatti/` publishes a street address at all.
10. **4.2 misreads a sentence.** "le caserme della guardia pretoriana costituita da Tiberio tra il 21
    ed il 23 d.C." says Tiberius constituted the *guard*, not that he built the *camp*. The 21-23
    dating for the camp is defensible but must come from the `Castra Praetoria` article.

**What the finder got right and deserves saying.** The boundary method is the best in the wave: four
independent determinations, all six polygons closed, 131 points tested, and controls that could have
falsified it rather than confirmed it. It declined the single biggest place in the quadrant on its
own evidence. It recorded its own first-pass error on Palazzo Massimo so the verifier would not
repeat it. It found and documented seven source defects. It quarantined ten superlatives, two vague
proximities and a trip duration. And it flagged the embassy misconception three times before anyone
asked. The error rate above is real but it is the error rate of a file that showed its working.

---

## 4. STRADDLERS ESCALATED TO THE ARBITRATOR

**Ruled by me, closed — do not take, no arbitration needed:**
- **Termini station and Piazza dei Cinquecento.** The finder rated this its least confident call. I
  am closing it against the finder's own doubt. It.wikipedia's rione article does list Piazza dei
  Cinquecento and Largo di Villa Peretti among the rione's piazzas — **but the same list also
  contains Piazza dell'Esquilino and Piazzale Sisto V, which the finder's own controls place outside
  the rione, and the street list contains Via Cavour, Via Gioberti, Via Farini, Via Principe Amedeo
  and Via Urbana.** That list is demonstrably not an inventory, so it cannot carry the weight the
  finder feared it might. Meanwhile the `Piazza dei Cinquecento` article, which I fetched, says
  "al confine tra i rioni Esquilino e Castro Pretorio" and tags `quartiere = Esquilino / Castro
  Pretorio`, and the rione article's boundary prose runs the line *along* Piazza dei Cinquecento.
  Ten tested points put the station, the forecourt, the Mazzoniana and the metro in Esquilino. **Out.
  The station is Esquilino's.** Castro Pretorio is honestly written as the rione of the Via Marsala
  side, which the same evidence gives us.
- **Porta Praetoriana — out** (4.4): absent from it.wikipedia's own "Porte" list for the rione.
- **Porta Pia and Porta Nomentana — in**: both named in that list, and Porta Pia has the Sovrintendenza
  meeting groups at "Porta Pia, fronte interno, lato via Venti Settembre".
- **Le Quattro Fontane junction — out; Palazzo Albani Del Drago and its corner fountain — in.**
- **Camminamento delle Mura Aureliane di Viale Pretoriano — out.** Tiburtino's access to our wall.
- **Monumento al Bersagliere — out.** Outside every rione polygon.

**Live, escalated — five:**
1. **Largo di Villa Peretti, and with it Palazzo Massimo's published address.** New. The southern end
   tests Castro Pretorio and the northern end Esquilino, and **Turismo Roma gives the museum's address
   as Largo di Villa Peretti 1** while filing it under its "Esquilino - Monti" tourism zone. If the
   largo is Esquilino's, the MNR's second site is published at an Esquilino address from a Castro
   Pretorio page. Needs a ruling before the seed file is written.
2. **Teatro Nazionale.** New. Its own operator places it "su via del Viminale angolo via Agostino
   Depretis", and the rione article names **Via A. Depretis as the boundary with Monti**. The finder
   recorded (A + B + C) for the OSM node but did not notice the address sits on the line.
3. **Palazzo Giolitti.** New. It.wikipedia's coordinate 41.899055, 12.497613 is south of the Depretis
   line and south of the point the finder used to rule Palazzo del Viminale out to Monti.
4. **British Embassy, Via XX Settembre 80/a.** On the boundary street with Sallustiano and Trevi,
   with determination (A) alone recorded and no Nominatim `quarter`.
5. **The Ludovisi / Sallustiano confusion the wave brief predicted lands here too**, in the form of
   Piazza San Bernardo: San Bernardo alle Terme and the Fontana del Mosè are ours, Santa Susanna is
   Trevi's and Santa Maria della Vittoria is Sallustiano's, on one square. The finder resolved this
   correctly with controls; I am flagging it so the Sallustiano arbitrator sees the same square from
   the other side and the two files do not both claim the Fontana del Mosè.

**Coordinator note, not a straddler:** the municipio split is confirmed in the source and the gag
order should stay in force. The seat of Municipio Roma II is physically inside this rione at Via
Goito 35. No page states a municipio.

---

## 5. TIER RULING

**GUIDE.** A guide needs 4+ places; 41 survive, and the count is not the point — the quality is.
After every drop above, Castro Pretorio still holds two sites of the Museo Nazionale Romano,
Michelangelo's last church with a 45-metre meridian in its floor, Michelangelo's gate with a
regimental museum inside it, the two Sixtus V and Pius IX *mostre* with a Roma Capitale body naming
the rione on both, an opera house with four world premieres documented on its own site, a second
theatre recovered in this review, one of Italy's two national libraries, the camp that names the
rione, and a legible nineteenth-century ministerial quarter.

This is not Sallustiano and it is not Ludovisi. Those two are expected at town-page and that is a
correct outcome for them. This one is a guide on the evidence and I did not have to stretch to say so
— I dropped fifteen entries and rewrote twenty-eight to get here.

The intro must carry: the UNESCO inscription of 1980 as an inscription only; the toponymic code 118
and R. XVIII; no municipio; and the Termini line stated honestly — the station is in Esquilino and
this is the rione you come out of its Via Marsala side into.
