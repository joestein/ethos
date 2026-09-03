# Castro Pretorio (R. XVIII, Roma Capitale toponymic code 118) — FINDER file

Wave 3, Rome programme. **Evidence, not adjudication.** A verifier adjudicates each candidate; an
arbitrator rules ownership of every straddler. Research date: 2026-09-02.

**56 candidates below.** This rione is a **guide, not a town-page** — see §9 for the yield argument.

---

## 0. THE THREE RULINGS AND THE MUNICIPIO GAG — compliance notes for this file

1. **No designation claims.** Nothing in §4 asserts protection status, listing, *vincolo*, or
   *bene culturale tutelato*, in English or Italian. I hit designation-shaped language in two
   fetched sources and quarantined it in §8. Vincoli in Rete and the Catalogo generale were
   re-probed and remain unreachable (§1).
2. **Vatican.** No Vatican City property and no Lateran Treaty extraterritorial property falls in
   Castro Pretorio. The rione is clean on that ruling. **But it has the Ludovisi problem in
   duplicate**: two working embassies stand inside it (British, Russian) plus a third across the
   line (French to the Holy See, in Sallustiano). Diplomatic premises are **NOT foreign
   territory**. See §5 — I flagged it because it is the same misconception that Palazzo Margherita
   invites in Ludovisi, and a careless writer will make it twice here.
3. **No photographs.** `"photos": []` everywhere. Image leads are noted in §8 for the later photo
   wave only; nothing is sourced, named or linked as a publishable image.
4. **NO MUNICIPIO MAY BE STATED FOR THIS RIONE.** The roster's note is correct and I found the
   mechanism behind it — see §3.4. It.wikipedia's own infobox for the rione carries
   `circoscrizione = Municipio Roma I, Municipio Roma II`, i.e. it disagrees with itself against
   every other rione article. Nominatim reverse geocoding **reproduces the split on the ground**.
   Do not resolve it in this wave; do not state a municipio anywhere.

---

## 1. What I could and could not fetch

Every status below was observed by me in this session with `python3 + urllib` (raw bytes), not
assumed. Nothing here came through a summariser.

### Reached (HTTP 200, raw bytes)
| Source | URL | Good for |
|---|---|---|
| Turismo Roma (Roma Capitale) | `https://www.turismoroma.it/it/luoghi/<slug>` — 21 place pages fetched | history, dating, authorship, addresses, published coordinates |
| " (search) | `https://www.turismoroma.it/it/search/node?keys=<q>` | slug discovery; the Drupal result list is in `<ol class="search-results">` |
| Sovrintendenza Capitolina | `https://www.sovraintendenzaroma.it/...` (6 pages, see §2) | dating, authorship, materials, **and an explicit `Rione:` field** |
| Basilica S. Maria degli Angeli e dei Martiri | `https://www.santamariadegliangeliroma.it/`, `/orari/` | own hours, Mass times, current closure |
| Teatro dell'Opera di Roma | `https://www.operaroma.it/`, `/teatro/teatro-costanzi/`, `/il-teatro/` | Costanzi history, architects, dates |
| Basilica del Sacro Cuore (Salesians) | `https://www.basilicadelsacrocuore.it/` + `/la-basilica/{storia,orario-celebrazioni,le-camerette-di-don-bosco}/` | address, hours, Don Bosco rooms |
| Ministero dell'Economia e delle Finanze | `https://www.mef.gov.it/ministero/palazzo/{index,storia,museo,biblioteche}.html` | Palazzo delle Finanze address, libraries, Zecca museum move |
| RFI (infrastructure manager) | `https://www.rfi.it/it/stazioni/roma-termini.html` | Termini: 32 passenger platforms, accessibility |
| Grandi Stazioni Retail | `https://www.romatermini.com/stazione/informazioni` | station services (note `/stazione` alone returns **500**) |
| GOV.UK | `https://www.gov.uk/world/organisations/british-embassy-rome` | British Embassy address |
| Chiesa Evangelica Metodista di Roma | `https://www.metodistiroma.it/` | parish identity |
| Parrocchia russa S. Nicola | `https://s.nicolaroma.com/` | parish identity (site is in Russian) |
| Cappella ferroviaria Termini | `https://www.cappellaferroviaria.it/` | chapel identity/hours |
| UNINETTUNO | `https://www.uninettunouniversity.net/` | address in page header |
| Università Roma Tre | `https://www.uniroma3.it/dipartimenti/scienze-della-formazione/` | department, MuSEd parent |
| Ministero dell'Interno / Difesa / ENIT | `interno.gov.it`, `difesa.it`, `enit.it` | institutional identity |
| Hotel Quirinale | `https://www.hotelquirinale.it/` | own site (see §8 — superlatives) |
| 060608 (Roma Capitale contact centre) | `https://060608.comune.roma.it/` | live; delegates to per-site pages |
| RomaSegreta | `https://www.romasegreta.it/castro-pretorio.html` | aggregator only, unused for facts |
| OSM Overpass | `overpass.kumi.systems`, `overpass.private.coffee` | boundary geometry, POI inventory |
| Nominatim | `https://nominatim.openstreetmap.org/reverse` | `quarter` + `suburb` fields |
| it.wikipedia MediaWiki API | `action=parse` / `action=query&prop=revisions&rvslots=main` | aggregator, always attributed |

### NOT reached — this is load-bearing
| Host | Result | Attempts |
|---|---|---|
| `vincoliinrete.beniculturali.it`, `catalogo.beniculturali.it` | not retried — ruled unreachable programme-wide | — |
| `museonazionaleromano.cultura.gov.it` | **DNS: no such host** | 1 |
| `www.museonazionaleromano.beniculturali.it` | **TCP timeout** | 1 |
| `bncrm.cultura.gov.it` | **DNS: no such host** | 1 |
| `www.bncrm.beniculturali.it` / `bncrm.beniculturali.it` (https and http) | **TCP timeout** | 3 |
| `www.bncrm.it`, `opac.bncrm.it` | **DNS: no such host** | 2 |
| `biblioteche.cultura.gov.it` | **TCP timeout** | 1 |
| `www.esercito.difesa.it` (https and http) | **TLS: certificate verify failed** | 3 |
| `www.csm.it` | **403** on 2 paths | 2 |
| `www.stpaulsrome.it` | 200 but a 496-byte **"Contact Support"** stub — the site is dead | 1 |
| `www.museodelvideogioco.it` | 200 but a 545-byte placeholder | 1 |
| `www.marriott.com/.../the-st-regis-rome/` | **403** | 1 |
| `overpass-api.de` | **connection refused**, every attempt this session | 5 |
| `www.museodellascuola.uniroma3.it` | **DNS: no such host** | 2 |

> **CONSEQUENCE ONE — the two biggest visitor sites in this rione have no reachable operator
> site.** The **Museo Nazionale Romano** (Palazzo Massimo *and* Terme di Diocleziano *and* the
> Museo dell'Arte Salvata) and the **Biblioteca Nazionale Centrale di Roma** are both MiC
> institutions on the unreachable netblock. Every operational fact I hold about them —
> opening hours, closing day, ticketing, the four-site structure — comes **second-hand from
> Turismo Roma**, which is Roma Capitale republishing a state museum's own information. That is
> the same shape as the Parco Colosseo problem in the Campitelli file. **It is not the operator's
> own site, and the verifier must weigh it as such.** For BNCR it is worse: I could not reach even
> a Roma Capitale page for it, so §4.14 rests on it.wikipedia alone.
>
> **CONSEQUENCE TWO — Turismo Roma is reachable but not clean.** See §7. It duplicates one
> coordinate across two different buildings, and its "Mura Serviane" and "Acquedotto Felice"
> records point at places outside this rione entirely.

---

## 2. BOUNDARY METHOD, and the four determinations

I used four independent determinations per place and recorded all four whenever they diverged.

- **(A) True point-in-polygon.** I pulled the boundary relations by ID with `out geom`, assembled
  the ways into closed rings in Python, and ran a ray-cast test. **Castro Pretorio is OSM relation
  5454327**, `official_name=Rione XVIII Castro Pretorio`, one closed outer ring of **397 vertices**.
  I loaded five neighbours the same way so that "not in Castro Pretorio" resolves to a named rione
  rather than to silence: Monti 5451988 (561 vtx), Trevi 5452710 (233), Esquilino 5454309 (586),
  Ludovisi 5454323 (234), Sallustiano 5454324 (138). All six rings closed. **131 points tested.**
- **(B) Overpass `map_to_area` containment.** One query returned **295 named features** whose
  geometry Overpass itself places inside relation 5454327. This is the inventory §4 is built from.
- **(C) Nominatim reverse geocode**, reading `quarter` **and** `suburb`. 70 points. It agreed with
  (A) on every point where it returned a `quarter` at all. Where it returned no `quarter` it
  returned a `suburb` instead, and those cases are exactly the boundary line itself (§3).
- **(D) Published sources' own rione statements** — Sovrintendenza Capitolina's `Rione:` field
  (strongest, a Roma Capitale body naming the rione), then it.wikipedia (aggregator, attributed).

### Controls, to show the method is not just agreeing with itself
| Control point | (A) polygon | (C) Nominatim `quarter` |
|---|---|---|
| Santa Maria della Vittoria, Via XX Settembre 17 | Sallustiano | Sallustiano |
| Santa Susanna, Largo di Santa Susanna | Trevi | Trevi |
| Piazza dell'Esquilino | Monti | Monti |
| Santa Maria Maggiore | Monti | Monti |
| Villa Bonaparte (French Embassy to the Holy See) | Sallustiano | — |
| Policlinico Umberto I | *(none)* | suburb=Nomentano |
| Sapienza rettorato / Porta Tiburtina / Piazzale Sisto V | *(none)* | suburb=Municipio Roma II |
| Palazzo del Quirinale | Trevi | — |

Three of those controls matter directly. **Santa Maria della Vittoria and Santa Susanna sit on
Piazza San Bernardo with San Bernardo alle Terme and the Fontana del Mosè, and only the latter two
are ours.** A guidebook will treat all four as one square; the boundary runs through it. And
**Sapienza, the Policlinico and San Lorenzo are OUT** — the rione stops at the Aurelian Walls,
exactly as it.wikipedia's boundary prose says ("i quartieri Nomentano e Tiburtino nel tratto delle
Mura aureliane fino al Piazzale Sisto V").

---

## 3. THE STRADDLERS. Arbitrator's list — I have not resolved any of these.

### 3.1 TERMINI AND PIAZZA DEI CINQUECENTO — the big one, and the wave brief predicted it
This is a real, load-bearing contradiction between two Roma-relevant sources.

**OSM says the station and its forecourt are ESQUILINO.** Point-in-polygon, 10 points:

| Point | Rione (A) | Nominatim (C) |
|---|---|---|
| OSM node `Roma Termini` 251904108 (41.9005815, 12.5025272) | **Esquilino** | Esquilino |
| Montuori front building / Galleria Termini | **Esquilino** | Esquilino |
| Piazza dei Cinquecento — OSM way centre, N end, S end, bus terminal | **Esquilino** (4/4) | Esquilino |
| Ala Mazzoniana, Via Giolitti 36 | **Esquilino** | Esquilino |
| Termini metro node 5216453777 | **Esquilino** | Esquilino |
| Servian wall fragment in the forecourt | **Esquilino** | Esquilino |
| Via Marsala side (Via Vicenza) | **Castro Pretorio** | Castro Pretorio |
| Train shed / tracks midpoint | **Castro Pretorio** | — |

**it.wikipedia says otherwise, twice.** The rione article puts the boundary at
"Via Marsala-Piazza dei Cinquecento-Via Giolitti-Via Gioberti-Via e Piazza Esquilino" and lists
**Piazza dei Cinquecento and Largo di Villa Peretti among Castro Pretorio's own piazzas**. The
*Piazza dei Cinquecento* article splits the difference: `quartiere = Esquilino / Castro Pretorio`
and calls it "al confine tra i rioni Esquilino e Castro Pretorio".

**What I recommend the arbitrator weigh:** the station *building* is Esquilino on the machine
evidence and only the platform apron and the Via Marsala frontage are ours. Castro Pretorio can
honestly be written as the rione you walk out of Termini's *side* exit into, without claiming the
station. **I did not take it.** Ancillary items caught in the same net, all Esquilino by (A):
the *Cappella del Santissimo Crocifisso alla Stazione Termini* (Piazza dei Cinquecento) and every
*Mura Serviane* fragment OSM records around the forecourt.

### 3.2 THE NORTHERN WALL LINE — Porta Pia, Porta Nomentana, Porta Praetoriana
The Aurelian Walls **are** the boundary here, so a gate in them is definitionally on the line.

| Place | (A) polygon | (C) Nominatim | Note |
|---|---|---|---|
| Porta Pia (turismoroma's own coord 41.9093163, 12.5012658) | **Castro Pretorio** | quarter absent; road=Sottovia Ignazio Guidi | Nominatim snapped to the underpass, not a contradiction |
| Museo Storico dei Bersaglieri (inside Porta Pia) | **Castro Pretorio** | **Castro Pretorio**, road=Via Venti Settembre | cleanest of the three |
| Porta Nomentana (walled up) | **Castro Pretorio** | quarter absent; suburb=**Nomentano** | it.wiki: now the boundary wall of the British Embassy |
| Porta Praetoriana (N gate of the Castra) | **Castro Pretorio** | quarter absent; suburb=**Nomentano** | on Viale del Policlinico, outer face |
| Monumento al Bersagliere, Piazzale di Porta Pia | **no rione** | — | Morbiducci, 1932; sits in the traffic island *outside* the gate |
| Piazzale della Croce Rossa / Villa Patrizi | **no rione** | — | out |

**Porta Pia I am reasonably confident is ours** — (A), (D) it.wikipedia's rione article lists it
under "Porte", and the Sovrintendenza's own visit page meets groups at "Porta Pia, fronte interno,
lato via Venti Settembre". The **Monumento al Bersagliere is outside every rione polygon** and
should be ruled out or attached to the gate, not claimed.

### 3.3 LE QUATTRO FONTANE — a four-corner junction split three ways
The crossroads is the meeting of Strada Pia and Strada Felice and the corners fall in different
rioni. Tested individually:

| Corner / point | Rione |
|---|---|
| Palazzo Mattei Albani Del Drago (41.901982, 12.490994) | **Castro Pretorio** |
| turismoroma's published coordinate for "Le Quattro Fontane" | Trevi |
| NE corner | Trevi |
| SW corner | Monti |
| San Carlo alle Quattro Fontane, Santi Gioacchino e Anna | Monti |

The Sovrintendenza page for the *Complesso delle Quattro Fontane* carries **no `Rione:` field**,
unlike its fountain pages that do — consistent with a monument that does not sit in one rione.
**Recommendation: take Palazzo Albani Del Drago and its own fountain (the Arno figure, on the
palace corner); do not take "Le Quattro Fontane" as a unit.** Arbitrator rules.

### 3.4 THE MUNICIPIO SPLIT — I found the mechanism, and it is real
Nominatim's `suburb` field returns **Municipio Roma I** for the whole rione **except** a
north-eastern strip along Viale Castro Pretorio, where it returns **Municipio Roma II**:

| Point | Nominatim `suburb` |
|---|---|
| Biblioteca Nazionale Centrale, Viale Castro Pretorio 105 | **Municipio Roma II** |
| Caserma Castro Pretorio | **Municipio Roma II** |
| Castra Praetoria NE corner | **Municipio Roma II** |
| Metro Castro Pretorio | **Municipio Roma II** |
| Villa Pio IX, Viale Castro Pretorio | **Municipio Roma II** |
| everything else tested (48 points) | Municipio Roma I |

Compounding it: the **seat of Municipio Roma II is at Via Goito 35**, physically inside this
rione (OSM node 2537261560, `amenity=townhall`; (A) = Castro Pretorio). **This is evidence for the
coordinator, not copy.** No page may state a municipio for Castro Pretorio, and no page should
state that the Municipio II seat "is in Municipio II" either.

### 3.5 THE WALL WALKWAY
**Camminamento delle Mura Aureliane di Viale Pretoriano.** Sovrintendenza Capitolina: opened to the
public 3 July 2021; the stretch runs **"tra via dei Frentani e via dei Ramni"**. Both of those
streets are in San Lorenzo (Q. VI Tiburtino), i.e. the **outer** face of the wall. My PIP of the
Viale Pretoriano wall midpoint returned **no rione**. Groups only, max 25, booking on 060608;
€4 full / €3 reduced; free for residents of Rome and the metropolitan area and for MIC-card
holders; not accessible to disabled visitors. **Flagged: this is almost certainly Tiburtino's
access to Castro Pretorio's wall.** Arbitrator rules; I did not take it.

### 3.6 Smaller line calls
- **Largo di Villa Peretti** — the southern end tests Castro Pretorio, the northern end Esquilino.
  it.wikipedia lists it as a Castro Pretorio piazza. Straddler.
- **Palazzo Massimo alle Terme itself is NOT a straddler** — I re-tested with the actual OSM
  relation 2705998 (`addr:street=Via Giovanni Amendola`, `addr:housenumber=1`), centre and two
  corners: **all Castro Pretorio**. My first pass had guessed the entrance coordinate wrongly and
  got Esquilino; recording the error so the verifier does not repeat it.

---

## 4. THE CANDIDATES

Format: **name** — kind — address — what it is — dating/authorship — sources I actually fetched —
rione determination. `photos: []` throughout.

### A. Antiquity, walls and gates

**4.1 Terme di Diocleziano (the baths themselves)** — archaeological complex — Viale Enrico De
Nicola 78. Rome's bath complex whose remains define the shape of this whole quarter; Turismo Roma:
willed by **Maximian**, dedicated to Diocletian, **inaugurated between 305 and 306 AD**, extending
over **13 hectares**, holding up to **3,000 people**; the *calidarium/tepidarium/frigidarium* axis
is recognisable today in the Basilica of Santa Maria degli Angeli; in use until the mid-6th century
when the Gothic war cut the water supply. The it.wikipedia rione article puts the ancient footprint
between today's Via Torino, Via Volturno, Piazza dei Cinquecento and Via XX Settembre; the MNR page
says the same. Sources: `turismoroma.it/it/luoghi/terme-di-diocleziano`,
`.../museo-nazionale-romano-terme-di-diocleziano`. Rione: **Castro Pretorio** (A + C, 4 points).

**4.2 Castra Praetoria** — archaeological/military site — Viale Castro Pretorio / Viale del
Policlinico. The Praetorian Guard's camp that names the rione. it.wikipedia: **440 × 380 m,
16.72 ha**, with a *campus* to the west; built under **Tiberius, 21–23 AD**; the walls later
absorbed by **Aurelian** into his circuit. The Salesian basilica's own history page
(basilicadelsacrocuore.it) independently gives 21–23 AD, attributes the construction to **Sejanus**,
and says Constantine dismantled it after Ponte Milvio (312 AD), leaving only the outer walls.
Sources: it.wikipedia `Castra Praetoria` (attribute), `basilicadelsacrocuore.it/la-basilica/storia-…`.
Rione: **Castro Pretorio** (A + C). *Not visitable — see 4.3.*

**4.3 Caserma "Castro Pretorio" (Caserma Macao)** — working army barracks — Viale Castro Pretorio
123 — occupies the ancient camp. it.wikipedia: `Visitabile = no`, garrisoned by the Esercito
Italiano. **Its operator's site (esercito.difesa.it) fails TLS verification from here, so nothing
operational about it is sourced.** Rione: **Castro Pretorio** (A + C). *Candidate for context only;
a guide can name it but cannot send anyone in.*

**4.4 Porta Praetoriana** — gate — Viale del Policlinico. Straddler, §3.2.

**4.5 Mura Aureliane, Viale Castro Pretorio / Viale Pretoriano stretch** — city walls. One OSM
`citywalls` way tests inside; the wall line itself is the rione boundary. See §3.2 and §3.5.

**4.6 Porta Pia** — gate + museum host — Piazzale di Porta Pia. Turismo Roma: **Porta Nomentana was
replaced by Porta Pia between 1561 and 1565**, one of 18 gates in the Aurelian circuit; **Pius IV**
commissioned **Michelangelo**, one of his last architectural works; after his death in 1564 the
project passed to **Giacomo Del Duca**; the attic and the outer façade toward Via Nomentana are
19th-century and unconnected to Michelangelo's design. It quotes **Giuseppe Vasi, *Indice istorico
del gran prospetto di Roma*, 1765** on the gate. The Breccia of **20 September 1870** happened a
few tens of metres away; a marble monument of **1920** and a commemorative column mark it; the
**Monumento al Bersagliere by Publio Morbiducci** was placed in the piazzale in **1932**.
**CONFLICT:** the Sovrintendenza Capitolina says the gate was "ultimata nel XIX secolo
dall'architetto **Virginio Vespignani**", where Turismo Roma names Del Duca. Both are Roma
Capitale. **Do not merge them; attribute or drop.** Sources:
`turismoroma.it/it/luoghi/porta-pia-e-il-museo-storico-dei-bersaglieri`,
`sovraintendenzaroma.it/content/porta-pia-e-il-museo-storico-dei-bersaglieri`. Rione: §3.2.

**4.7 Porta Nomentana** — walled-up gate — Viale del Policlinico. it.wikipedia: part of Aurelian's
original circuit **270–273**, restored by **Honorius in 403**, **walled up in 1564** by Pius IV when
Porta Pia opened, the plaque still above it; now reduced to the boundary wall of the **British
Embassy**, about 100 m south-east of Porta Pia. Straddler, §3.2.

**4.8 Mura Serviane fragments** — Sovrintendenza Capitolina: yellow-tufa blocks; the oldest circuit
is 6th c. BC and attributed to Servius Tullius, but most of what survives belongs to the **early
4th c. BC rebuild after 390 BC**, dated by the use of "tufo giallo di Grotta Oscura" from Veian
territory (taken 396 BC); the circuit ran **c. 11 km** enclosing **426 hectares**; from Porta
Collina to Porta Esquilina an *agger* — ditch plus rampart — reinforced the flat ground; "**i resti
più monumentali sono quelli conservati a fianco della Stazione Termini**, dove si apriva la Porta
Viminalis". **Those monumental remains test Esquilino.** One further OSM `Resti di Mura Serviane`
way near Via Gaeta/Via Volturno tests Castro Pretorio. Source:
`sovraintendenzaroma.it/content/mura-serviane-1`. **Straddler; the famous fragment is not ours.**

### B. Museums

**4.9 Museo Nazionale Romano — Terme di Diocleziano** — state museum — entrance from the garden
toward Piazza dei Cinquecento; Turismo Roma's published coordinate 41.903131, 12.5001804. Turismo
Roma: the MNR was **instituted in 1889**; **since 1889** part of the baths has housed the Roman
antiquities section; finds arranged by topographic criterion; the garden holds funerary epigraphy
and architecture; four ambulacra. Hours as republished: **closed Monday, last entry 18.00** — and
Turismo Roma itself says to check the operator's site, **which is unreachable (§1)**. Rione:
**Castro Pretorio** (A + B + C). Source: `turismoroma.it/it/luoghi/museo-nazionale-romano-terme-di-diocleziano`.

**4.10 Chiostro di Michelangelo (Certosa di Santa Maria degli Angeli)** — inside 4.9. OSM records
inside it, all testing Castro Pretorio: the **Fontana del Chiostro di Michelangelo**, the **Cratere
Colossale**, **eight `le teste colossali`** (the colossal animal heads), the **Natatio**, and the
**Portale di Villa Panzani**. The museum's own interpretive panels are mapped as OSM `information`
nodes with bilingual titles ("Le colossali teste animali del Chiostro di Michelangelo"). **Good
sub-entries for a guide; each needs a fetched source before it ships — I have OSM only.**

**4.11 Museo Nazionale Romano — Palazzo Massimo alle Terme** — state museum — OSM relation 2705998
gives `Via Giovanni Amendola 1`; Turismo Roma's coordinate is 41.901818, 12.498281 and its ticketing
link is the national portal. Turismo Roma: **built 1883–1887 to a design by Camillo Pistrucci** in
neo-Cinquecento style, on ground previously occupied by **Villa Peretti**, built by Sixtus V and
later the Massimo family's residence; **acquired by the State in 1981** and converted to exhibition
space. Collections named: ex-Museo Kircheriano, Gnecchi, the Vittorio Emanuele III medieval/modern
coin collection, the Savoia collection and the goldwork section; sculpture including the **Augustus
as Pontifex Maximus from Via Labicana**, the **Fanciulla di Anzio**, the **Discobolus Lancellotti**,
the **Sleeping Hermaphroditus**, Doidalsas' crouching Venus and the **Apollo del Tevere**; on the
second floor the frescoes from the **Villa of Livia at Prima Porta** and four reconstructed rooms
from the **Villa della Farnesina** (c. 20 BC). Hours as republished: **Tue–Sun 9.30–19.00, ticket
office closes 18.00, closed Monday**. **CONFLICT:** it.wikipedia's rione article dates the building
**1883–1886**; Turismo Roma says **1883–1887**, and names Pistrucci where the rione article names
none. Prefer Turismo Roma; flag the year.
**NOTE FOR THE COORDINATOR:** the Villa della Farnesina paintings are here, but the **Villa
Farnesina building is reserved to wave 1 (Trastevere)**. Writing "the frescoes from the Villa
Farnesina are displayed at Palazzo Massimo" names a reserved place without claiming it — I believe
that is allowed, but I am flagging it rather than assuming.
Rione: **Castro Pretorio** (A on 4 points incl. the relation centre, + B + C).

**4.12 Museo Nazionale Romano — Museo dell'Arte Salvata (Aula Ottagona)** — state museum —
Via Giuseppe Romita 8; Turismo Roma coordinate 41.903909, 12.495962. Turismo Roma: **housed in the
Aula Ottagona of the MNR – Terme di Diocleziano**; the MNR page locates that octagonal hall "**in
the western corner, at the junction with today's Via Parigi**". Ticket office closes 18.00, closed
Monday. Rione: **Castro Pretorio** (A + B + C). *Formerly the Planetarium — I did not source that
and did not use it.*

**4.13 Museo Storico dei Bersaglieri** — regimental museum — Via XX Settembre snc, inside Porta Pia.
Sovrintendenza Capitolina: **Porta Pia has housed the museum since 1932**; it holds relics of the
Corps' foundation, the Risorgimento campaigns and both world wars, and on the ground floor the
**Sacrario dedicated to over 100,000 fallen**. Sovrintendenza's own guided visit notes the museum is
**not suitable for visitors with mobility difficulties — two flights of stairs**, max 15
participants, compulsory booking on 060608. **Its operator (esercito.difesa.it) is unreachable
(TLS), so I have no first-party hours.** Rione: **Castro Pretorio** (A + C, cleanest point in §3.2).

**4.14 Biblioteca Nazionale Centrale di Roma "Vittorio Emanuele II"** — national library —
**Viale Castro Pretorio 105, 00185**. it.wikipedia (**aggregator — and it is ALL I have, see §1**):
one of Italy's two national libraries; **instituted 1875/1876**, originally in the Collegio Romano;
**moved in January 1975** to the new building by **Massimo Castellazzi, Tullio Dell'Anese and
Annibale Vitellozzi** (Movimento Moderno), in the Castra Praetoria area; four sectors, eleven
reading rooms; **112 km of linear shelving**. Its atrium holds three public exhibition areas
including the **Museo Spazi900**, whose permanent core is "**La stanza di Elsa**", recreating
**Elsa Morante**'s writing room. OSM also records a **Biblioteca medica statale** at the same
address. **VERIFIER: every number here is second-hand and the library's own site is unreachable on
five domains. Either the verifier finds a first-party source or this page ships with identity and
address only.** Rione: **Castro Pretorio** (A + B + C; Nominatim `suburb` = Municipio Roma II, §3.4).

**4.15 MuSEd — Museo della Scuola e dell'Educazione "Mauro Laeng"** — university museum —
it.wikipedia gives **Piazza della Repubblica 10**; OSM places Roma Tre's Dipartimento di Scienze
della Formazione at both Piazza della Repubblica and **Via del Castro Pretorio 20** (relation
13421559), and **both test Castro Pretorio**. it.wikipedia: a museum of the history of pedagogy,
founded **1874**, opened in its present form **1986**, run by the Dipartimento di Scienze della
Formazione, Università Roma Tre. `uniroma3.it/dipartimenti/scienze-della-formazione/` reached and
confirms the department; **`museodellascuola.uniroma3.it` does not resolve**. it.wikipedia calls it
"la più antica istituzione museale italiana dedicata alla storia della pedagogia" — **that is a
superlative from an aggregator: unpublishable, quarantined in §8.** Rione: **Castro Pretorio**.

**4.16 GAMM — Museo del Videogioco** — Via delle Terme di Diocleziano 35 (OSM node 10921413962).
Rione: **Castro Pretorio** (A + B + C). **WEAK CANDIDATE: `museodelvideogioco.it` is a 545-byte
placeholder and `gamm.it` is an unrelated plastics manufacturer. I could not establish that this
is open or that it exists as described.** Recommend the verifier drop it unless it can source it.

### C. Churches

**4.17 Basilica di Santa Maria degli Angeli e dei Martiri** — basilica — Piazza della Repubblica;
Turismo Roma coordinate 41.903063, 12.496765. Turismo Roma: in **1561 Pius IV**, prompted by the
Sicilian priest **Antonio Lo Duca**, decided to build a church inside the baths; the commission
went to an **86-year-old Michelangelo**, who integrated it without altering the Roman rectangular
hall **over 90 m long**, used the **natatio** for the apse, and made the concave brick façade from
one of the *calidarium*'s exedrae; after Michelangelo's death on **18 February 1564** work
continued under **Jacopo Del Duca**, his pupil and Lo Duca's nephew. The floor carries the
**Meridiana / Linea Clementina**, inaugurated **October 1702** under **Clement XI**, by **Francesco
Bianchini**, a bronze line about **45 m** long in a marble band. **Luigi Vanvitelli** reworked the
church in **1750** and made the Piazza Esedra façade; that façade was **demolished in 1911** to
restore the *calidarium* niche. In **1998 the Comune di Roma donated a new monumental organ** by
**Bartolomeo Formentelli** of Verona; in **2001 Narcissus Quagliata** installed a stained-glass
dome **5 m across at 23 m height** that also works as a meridian.
**FIRST-PARTY, and it is operationally live:** the basilica's own site says
"**LA BASILICA RIAPRIRÀ CON I CONSUETI ORARI DOMENICA 6 SETTEMBRE**" after restoration, then
Mon–Fri 8:00–13:00 and 16:00–19:00, Sat/Sun/holidays 10:00–13:00 and 16:00–19:00; Mass Mon–Sat
18:30, Sunday 9:00 (English), 10:30 / 12:00 / 18:30 (Italian), 17:00 (Spanish); confessions daily
10:00–12:00. **CONFLICT:** Turismo Roma republishes an older Mass schedule (weekdays 18.00,
Sunday 10.30/12.00/17.00/18.30). **The parish's own site wins.**
Sources: `turismoroma.it/it/luoghi/basilica-di-santa-maria-degli-angeli-e-dei-martiri`,
`santamariadegliangeliroma.it/`, `/orari/`. Rione: **Castro Pretorio** (A + B + C).

**4.18 Basilica del Sacro Cuore di Gesù a Castro Pretorio** — minor basilica — **Via Marsala 42,
00185 Roma** (first-party). it.wikipedia: **Pius IX laid the first stone in 1870**; work stopped
at the annexation of Rome and resumed **1880** through **St John Bosco**, completed **1887**;
architect **Francesco Vespignani**; parish erected **2 February 1879**; raised to **minor basilica
by Benedict XV on 11 February 1921** (*Pia societas*); **Paul VI** created the cardinal deaconry
**5 February 1965**. First-party: open daily **06:00–19:00**; weekday Masses 06:30, 07:00, 07:30,
08:00, 09:00, 18:00 (no 06:30 on Saturday); Sundays and holidays 07:00, 08:00, 09:00, 10:00, 11:00,
**15:30 in Filipino**, 18:00; Rosary weekdays 17:30. **Le Camerette di Don Bosco**, behind the choir
at the corner of Via Magenta and Via Vicenza: the two rooms where Don Bosco stayed on his **20th and
last journey to Rome, 30 April – 18 May 1887**; **opened to the public in 1934** after his
canonisation; **converted to a chapel in 1969** by removing the dividing wall, arranged to a design
by the architect **Sergio Checca**. Sources: `basilicadelsacrocuore.it/` + `/la-basilica/{storia-…,
orario-celebrazioni,le-camerette-di-don-bosco}/`, it.wikipedia `Basilica del Sacro Cuore di Gesù
(Roma)`. Rione: **Castro Pretorio** (A + B + C). *Its Salesian convent is a separate OSM feature,
also Castro Pretorio.*

**4.19 Chiesa di San Bernardo alle Terme** — church — **Piazza San Bernardo 105** (Turismo Roma's
own location field). Turismo Roma: built **on the perimeter of one of the four circular towers**
flanking the remains of the Baths of Diocletian; in **1598 the countess Caterina Sforza Cesarini**
had it turned into a church; cylindrical, windowless, lit only through the oculus of a coffered
dome, **22 m in diameter**; eight raised niches hold stucco saints **over three metres tall by
Camillo Mariani, c. 1600** (Augustine, Monica, Mary Magdalene, Francis, Bernard, Catherine of
Alexandria, Catherine of Siena, Jerome); the two altarpieces are by **Giovanni Odazzi**; first
entrusted to the French **Feuillant Cistercians**, later to the congregation of Bernard of
Clairvaux; the **Cappella di San Francesco** holds the funerary monument of the German painter
**Friedrich Overbeck**, founder of the Nazarenes; the **organ is by Nicola Morettini, 1885**. The
MNR page independently says one of the two circular halls flanking the great exedra "**è stata
trasformata nella chiesa di San Bernardo alle Terme**". Turismo Roma publishes tel. 06 4882122 and
email but **no hours** ("rivolgersi ai contatti indicati"). Rione: **Castro Pretorio** (A + B + C).
**Guidebook trap: Santa Susanna (Trevi) and Santa Maria della Vittoria (Sallustiano) are on the
same square and are NOT ours.**

**4.20 Chiesa di San Paolo entro le Mura / St Paul's Within the Walls** — Episcopal church —
**Via Nazionale 16a** (Turismo Roma's location field; it.wikipedia and OSM give Via Napoli 58 as the
side entrance). it.wikipedia: built **1873–1880** by the English architect **George Edmond Street**
for the American Episcopal community, at the initiative of the Revd **Robert J. Nevin**; described
as "la prima non cattolica costruita a Roma dopo l'Unità d'Italia"; neo-Romanesque/neo-Gothic in
red Sienese brick alternating with travertine. **CAUTION:** it.wikipedia's opening line calls it
"anglicana" and then, correctly, "episcopale d'America" — those are not the same claim; use the
denominational description the church itself gives, **except that `stpaulsrome.it` returns a
496-byte "Contact Support" stub, so no first-party source exists from here.** Turismo Roma
publishes tel. 06 4883339 and no hours. The mosaics by **Edward Burne-Jones** are the reason
visitors go — **I did not find a fetchable source for them and did not write them in.**
Rione: **Castro Pretorio** (A + B + C).

**4.21 Chiesa di Santa Maria del Rosario di Pompei (Santa Maria del Rosario e San Pietro Chanel)** —
church — **Via Cernaia 16**. it.wikipedia: built **1889–1898** to a design by **Pio Piacentini**,
neoclassical, with the Marist Fathers' provincial curia and an international student hostel
attached; cites **Diego Angeli, *Le chiese di Roma*, 1902** for the interior. OSM way 1357193140
carries the double dedication. Rione: **Castro Pretorio** (A + B + C).

**4.22 Chiesa russa di San Nicola Taumaturgo** — Russian Orthodox parish church — **Via Palestro
69/71**. First-party site `s.nicolaroma.com` reached (Russian-language) and describes the parish as
the Russian Orthodox church in Rome and the oldest by date of its foundation among Russian churches
in Italy — **that is a first-party superlative/"oldest" claim and is NOT publishable under the
corpus rules; quarantined in §8.** Turismo Roma publishes the address, tel. 06 4450729 and no
hours. it.wikipedia has **no article** on it (I checked; `Chiesa russa di San Nicola Taumaturgo` is
a missing title), so the rione article's link is a red link. Rione: **Castro Pretorio** (A + B + C).

**4.23 Chiesa evangelica metodista in Castro Pretorio** — Methodist church — **Via XX Settembre 123**
(Turismo Roma location field), at the corner of Via Firenze (OSM node has `Via Firenze 37`).
it.wikipedia: **built 1893–1895, consecrated 20 September 1895**; it stands on ground cleared by the
1881 master plan, on the site of the demolished **chiesa di San Caio** (1885), next to what was then
the Ministry of War under construction; the Carmelite **Santa Teresa** and the **Incoronazione**
churches and convents were demolished in 1884. First-party `metodistiroma.it` reached. Rione:
**Castro Pretorio** (A + B + C).

**4.24 Chiesa di Sant'Isidoro alle Terme** — **vanished/deconsecrated** — beside the Aula Ottagona,
Via Parigi. it.wikipedia uses the past tense ("**era** un luogo di culto"): commissioned by
**Benedict XIV in 1754**, built by **Giuseppe Pannini** using rooms beside the Octagonal Hall that
had served as papal grain stores. OSM still carries it as `place_of_worship` way 112383673 at
41.903997, 12.496134, which tests Castro Pretorio, and Nominatim returns road=Via Parigi.
**FLAG: OSM and it.wikipedia disagree about whether this still exists as a church. Verify before
shipping, or ship it as a façade beside the Aula Ottagona.**

**4.25 Cappella del Santissimo Crocifisso alla Stazione Termini** — station chapel — Piazza dei
Cinquecento; first-party `cappellaferroviaria.it` reached; Turismo Roma publishes Mass times
(weekdays 08:00; Sundays/holidays 09:00, 11:00, 20:30). **Rione: Esquilino by (A).** Straddler,
§3.1. **I did not take it.**

### D. Squares, fountains and monuments

**4.26 Piazza della Repubblica (ex Piazza Esedra)** — square — Turismo Roma: it took its old name
from the great exedra of the Baths of Diocletian, whose perimeter the square's semicircular
colonnade retraces; the colonnade and **the framing palaces are by the Turin architect Gaetano
Koch**, late 19th century. The it.wikipedia rione article calls them "i due grandi palazzi sabaudi
porticati ai lati che ricalcano l'esedra delle Terme". OSM carries them as **Palazzi dell'Esedra**
(tests Castro Pretorio). Source: `turismoroma.it/it/luoghi/piazza-della-repubblica`. Rione:
**Castro Pretorio** (A + B + C).

**4.27 Fontana delle Naiadi** — fountain — centre of Piazza della Repubblica.
**Sovrintendenza Capitolina states `Rione: Castro Pretorio` on its own page — the single strongest
rione attribution I hold for anything in this file.** Sovrintendenza: it is the *mostra* of the
**Acqua Pia Antica Marcia**, the aqueduct built **1865–1870** under **Pius IX**, and is "l'ultima
fontana di mostra dello Stato Pontificio e anche la prima di Roma Capitale"; **authors Alessandro
Guerrieri and Mario Rutelli**; **dated 1885–1914**; granite, travertine, bronze, cement conglomerate.
Provisionally inaugurated by the pope **10 September 1870** where the Dogali obelisk now stands, and
built definitively in today's Piazza della Repubblica; architecture by Guerrieri **1885**;
temporarily dressed with four stucco lions for **Wilhelm II's visit in 1888**; **Rutelli commissioned
for the sculpture in 1897**; **inaugurated 1901**; the first central group (cement, 1911) was
rejected and **moved in 1913 to the garden of Piazza Vittorio Emanuele II**, replaced by the
**Glauco** clasping a dolphin, **inaugurated 1914**; **restored fully in 1998 and again in 2025 under
the PNRR – Caput Mundi programme**. OSM separately names the four nymphs as artwork nodes: **Ninfa
degli Oceani, Ninfa dei Fiumi, Ninfa dei Laghi, Ninfa delle Acque Sotterranee**, plus **Glauco** —
and Turismo Roma names each with its creature (sea-horse, water-snake, swan, lizard). **CONFLICT:**
Turismo Roma says the rejected central group was "tre tritoni, un delfino e un polipo"; the
Sovrintendenza does not describe it. Sources:
`sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_delle_najadi_mostra_del_nuovo_acquedotto_marcio`,
`turismoroma.it/it/luoghi/piazza-della-repubblica`. Rione: **Castro Pretorio** (A + B + C + **D**).

**4.28 Fontana del Mosè (mostra dell'Acquedotto Felice)** — fountain — Piazza San Bernardo.
**Sovrintendenza Capitolina again states `Rione: Castro Pretorio`.** Sovrintendenza: erected
**between 1585 and 1589** as the terminal *mostra* of the **Acquedotto Felice**, willed by **Sixtus V**
(Felice Peretti, hence the name); **authors Giovanni Fontana and Domenico Fontana**; travertine,
marble, stucco; a triumphal arch of three bays; the colossal **Moses** is by **Prospero Antichi**,
finished by **Leonardo Sormani**; the side reliefs of Aaron by **Gian Battista della Porta** and of
Gideon by **Pietro Paolo Olivieri** and **Flaminio Vacca**; the original four antique porphyry and
marble lions came from the Pantheon and the Lateran and were **replaced in 1850** by bardiglio lions
by **Adamo Tadolini**; the travertine balustrade was made under **Pius IV** for the Belvedere
courtyard in the Vatican and reused here; the cornice carries the dates **1585–1587**; restored
1850–51, 1987–89, and maintained 2010–11. Rione: **Castro Pretorio** (A + B + C + **D**).
**NOTE:** Turismo Roma's separate "Acquedotto Felice" record points at **Via Lemonia** (Parco degli
Acquedotti) — a different place entirely. Do not join them.

**4.29 Monumento ai Caduti di Dògali / Obelisco di Dogali** — monument — in the garden between
**Via delle Terme di Diocleziano and Viale Luigi Einaudi**. Sovrintendenza: dedicated to the **548
soldiers who died at Dògali in Eritrea on 26 January 1887** under Lt-Col Tommaso De Cristoforis
against ras Alula's forces; designed by **Francesco Azzurri**; the Council resolved on it in
February 1887 at Ruggiero Bonghi's proposal and, at mayor **Leopoldo Torlonia**'s suggestion, reused
the **Egyptian obelisk of Ramses II found in 1883** in **Rodolfo Lanciani**'s excavation of the
Iseo Campense; on 9 March 1887 the Giunta sited it in the square in front of Termini, "**che da
allora è intitolata ai 'Cinquecento'**"; **inaugurated 5 June 1887**, completed summer 1888; moved
**between July 1924 and 31 May 1925** for the Jubilee-1925 tram works, with the new garden setting
by the municipal architect **Raffaele de Vico**; octagonal steps, cruciform Baveno granite base.
Turismo Roma adds: the obelisk's twin is in the Boboli gardens; both were raised at **Heliopolis**
and brought to Rome for the temple of Isis; **red granite, present height over 9 m**; its tip was
found by chance in **1719** during foundation work at the **Biblioteca Casanatense**; published
coordinate 41.901714, 12.497307. **CONFLICT:** Turismo Roma says "solo nel 1924… fu spostato";
Sovrintendenza gives July 1924 – 31 May 1925. Both Roma Capitale. Sources:
`sovraintendenzaroma.it/content/monumento-ai-caduti-di-dògali`,
`turismoroma.it/it/luoghi/obelisco-di-dogali`. Rione: **Castro Pretorio** (A + B + C).
**This monument is why Piazza dei Cinquecento is called that — and the square is Esquilino (§3.1).
A guide can tell that story without claiming the square.**

**4.30 Giardino Zerai Deres** — public garden holding 4.29 — OSM way 38438950, tests Castro Pretorio;
Nominatim road = Viale Luigi Einaudi. **I found no fetchable source for the naming.** Weak until
sourced.

**4.31 Monumento della Caravella / "Colonna di Parigi alle Terme di Diocleziano"** — monument —
**Via Giuseppe Romita** (Turismo Roma location field; coordinate 41.903764, 12.495557). The
it.wikipedia rione article: a **cipollino marble column topped by a bronze caravel, given by Paris,
erected in 1959** to commemorate the twinning of Rome and Paris of **9 April 1956** — "*Solo Parigi
è degna di Roma e solo Roma è degna di Parigi*". Turismo Roma has its own page for it under the name
**Colonna di Parigi**. Rione: **Castro Pretorio** (A + B + C).

**4.32 Monumento a Quintino Sella** — bronze — **Via Cernaia**. it.wikipedia rione article: bronze by
**Emilio Gallori, 1893**. OSM artwork node 6707737819, tests Castro Pretorio. **No dedicated
it.wikipedia article exists** (checked, missing title). Aggregator-only dating.

**4.33 Monumento a Silvio Spaventa** — bronze — **Via Cernaia**. it.wikipedia rione article: bronze
by **Giulio Tadolini, 1898**. OSM artwork node 6707737818, tests Castro Pretorio. Aggregator-only.

**4.34 Piazza dell'Indipendenza** — square — Turismo Roma has a page; it.wikipedia: laid out in the
quarter built after 1870 and named for the **Italian wars of independence**, like every street around
it; **Via Solferino and Via Goito/Via dei Mille cross in it**; buildings on it include the
**Federconsorzi** seat until its 1991 collapse, the **Palazzo dei Marescialli**, and the flat where
**Giuseppe Tomasi di Lampedusa died in 1957**. Rione: **Castro Pretorio** (A + B + C). *The
Lampedusa detail is aggregator-only and I would not ship it without a second source.*

**4.35 Piazza Beniamino Gigli** — square in front of the opera house — OSM way 1372360879; tests
Castro Pretorio (A + B + C).

**4.36 Le Quattro Fontane** — fountain complex. Sovrintendenza: made under **Sixtus V (1585–1590)**
to mark the crossing of Strada Pia (today Via XX Settembre and Via del Quirinale) with Strada Felice
(Via Quattro Fontane and Via Sistina); **authors Domenico Fontana (attributed) and Pietro Berrettini
da Cortona**; **dated 1588–1593 and 1667–69**; marble, peperino, travertine; **originally fed by the
Acquedotto Felice**; built at the expense of the adjoining landowners in exchange for free water
concessions — **Muzio Mattei** paid for two, including the one on the corner of his palace (later
Albani Del Drago). **STRADDLER, §3.3 — the palace corner is ours, the crossroads is not.**

### E. Theatres

**4.37 Teatro dell'Opera di Roma (Teatro Costanzi)** — opera house — **Piazza Beniamino Gigli 1**.
**First-party (operaroma.it):** built **1879** for **Domenico Costanzi (1810–1898)**, who gave the
work to the Milanese architect **Achille Sfondrini (1836–1900)**; **built in eighteen months** on
ground anciently occupied by the villa of Elagabalus; **inaugurated 27 November 1880 with Rossini's
*Semiramide*** conducted by Giovanni Rossi before the King and Queen; Sfondrini designed it as a
"cassa armonica", hence the horseshoe; originally **2,212 seats**, three tiers of boxes, an
amphitheatre and a gallery under a dome frescoed by **Annibale Brugnoli**; world premieres of
***Cavalleria rusticana* (17 May 1890)**, ***L'amico Fritz* (31 October 1891)**, ***Tosca*
(14 January 1900)** and ***Le Maschere* (17 January 1901)**; management passed to **Walter Mocchi**
in 1907 and to **Emma Carelli** in 1912; **bought by the Comune di Roma in 1926**, becoming the
Teatro Reale dell'Opera, remodelled by **Marcello Piacentini**, closed 15 November 1926 and
**reopened 27 February 1928** with Boito's *Nerone*; further rebuilt in **1958**.
**CONFLICT:** it.wikipedia's rione article dates the building "**1874-80**" and credits "Sfondrini
and Piacentini" jointly; Turismo Roma also has a page. **The theatre's own site wins on its own
dates.** Rione: **Castro Pretorio** (A + B + C).

**4.38 Teatro Nazionale** — theatre — **Via del Viminale 51** (OSM node 5837622462). Rione:
**Castro Pretorio** (A + B + C). **WEAK: I could not fetch a page for it —
`operaroma.it/teatro-nazionale/` is a 404 and I did not find its correct path.** Verifier must
source it or drop it.

**4.39 Ex-Cinema Volturno** — former cinema, now `amenity=arts_centre` in OSM (node 383407978),
Via Volturno. Rione: **Castro Pretorio** (A + B + C). **No source beyond OSM. Weak.**

### F. Palazzi and institutions

**4.40 Palazzo delle Finanze** — ministry — **Via XX Settembre 97, 00187 Roma** (first-party, MEF
footer). it.wikipedia: **1871–1876**, inaugurated **1876**, willed by **Quintino Sella** to house
2,200 staff of the Kingdom's finance ministry, built by the **Società Veneta Costruzioni Pubbliche**;
the it.wikipedia rione article credits the engineer **Raffaele Canevari**, while the it.wikipedia
building article lists **Francesco Pieroni, Ercole Rosa, Pietro Costa** — **the two Wikipedia
articles disagree with each other on the architect; do not ship an architect without a third
source.** First-party MEF: the **Biblioteca Storica** ("la più antica tra le biblioteche presenti nel
Palazzo delle Finanze", holding funds from the Kingdom of Sardinia and other pre-unification states),
the **Biblioteca Luca Pacioli** (over 12,000 volumes, runs of the *Rendiconto generale dello Stato*
and the *Bilancio di Previsione* from 1870), and the Tesoro and Finanze collections all sit in this
building. Sources: `mef.gov.it/ministero/palazzo/{index,storia,biblioteche}.html`, it.wikipedia
(attribute). Rione: **Castro Pretorio** (A + B + C).

**4.41 Palazzo Esercito** — ministry/HQ — **Via XX Settembre 123/A**. it.wikipedia: built **1876**
to a design by **Col. Luigi Garavaglia and Capt. Enrico Bernardini** as the seat of the Ministry of
War, on ground where the churches of **San Caio**, **Santa Teresa** and the **Incarnazione** had
stood; seat of the Army General Staff since **1947** and, **since 22 February 2017**, also of the
**Stato Maggiore della Difesa**, moved from the adjacent Palazzo Caprara; the **Biblioteca Militare
Centrale** is inside. Turismo Roma has a page and links `difesa.it`. **CONFLICT/ERROR:** the
it.wikipedia rione article dates it **1876–85**, the building article's infobox says **1871–1889**,
and the body says 1876. Also see §7 — **Turismo Roma publishes the same coordinate for this palace
and for the Methodist church.** Neighbours for the record: **Palazzo Caprara and Palazzo Baracchini
both test Trevi**, not Castro Pretorio. Rione: **Castro Pretorio** (A + B + C).

**4.42 Palazzo dei Marescialli** — seat of the Consiglio Superiore della Magistratura —
**Piazza dell'Indipendenza 6** (OSM `addr`). it.wikipedia rione article: **1930**, by **Gennaro de
Matteis**. **`csm.it` returns 403 on two paths — no first-party source.** Rione: **Castro Pretorio**
(A + B + C).

**4.43 Villino Centurini** — villa, now a school — **Piazza Indipendenza, corner of Via Vittorio
Bachelet**. it.wikipedia: built **1874** by the Swiss architect **Enrico/Henry Kleffler (1840–1891)**
for the Genoese industrialist **Alessandro Centurini (1830–1916)**; one of the first buildings in the
new "Macao" quarter, when the square was called Piazza del Macao; **sold to the Comune di Roma by the
heirs in 1933**, hosting the Liceo-Ginnasio "Giulio Cesare" from 1935; rebuilt 1999–2002. The rione
article says it is now the **Liceo statale Niccolò Machiavelli**. **CONFLICT on the architect's
forename: the rione article says "Henry Kleffler", the building article "Enrico Kleffler".**
Rione: **Castro Pretorio** (A + B + C).

**4.44 Villino Semiradski** — villa — **Piazza dell'Indipendenza**. it.wikipedia rione article:
eclectic, 19th century, by **Francesco Azzurri** (the same architect as the Dogali monument);
now the **Comando Carabinieri Banca d'Italia**. Rione: **Castro Pretorio** (A + B + C).

**4.45 Palazzo della Federconsorzi** — **Piazza dell'Indipendenza**. it.wikipedia rione article:
modernist, **1955–57**, by **Ignazio Guidi and Giulio Sterbini**. Rione: **Castro Pretorio**.

**4.46 Palazzo del Corriere dello Sport** — **Piazza dell'Indipendenza**. it.wikipedia rione article:
modernist, **1956**, by **Attilio Lapadula**. Rione: **Castro Pretorio**.

**4.47 Palazzo Nathan** — **Via Torino 122**. it.wikipedia: built **1889** by **Cesare Janz**; named
for **Ernesto Nathan**, mayor of Rome, who lived and died there; five storeys, Umbertine eclectic,
caryatid window frames on the third and fourth floors, a four-storey corner loggia. **Its only
source for the Nathan connection is a blog (ROMAPEDIA) — needs a second source.** Rione:
**Castro Pretorio** (A + B + C).

**4.48 Palazzo Giolitti** — **Via Cavour at Via Torino**. it.wikipedia rione article: eclectic,
**1888**, by **Cesare Janz**. Rione: **Castro Pretorio** (A + C).

**4.49 Palazzo Mattei Albani Del Drago** — **Via delle Quattro Fontane at Via XX Settembre**.
it.wikipedia rione article: Mannerist, **1587**, by **Domenico Fontana** for **Muzio Mattei**.
Sovrintendenza's Quattro Fontane page independently confirms Muzio Mattei paid for the fountain on
the corner of his palace, "poi proprietà Albani Del Drago", and that the **Arno** figure with a lion
sits on that corner. OSM `Palazzo Albani` way 201474575 tests Castro Pretorio; Nominatim returns
quarter=Castro Pretorio, road=Via Venti Settembre. **The junction is a straddler (§3.3) but the
palace is not.** Rione: **Castro Pretorio** (A + B + C).

**4.50 Cassa Depositi e Prestiti** — Via Goito. OSM building, tests Castro Pretorio. **No source
beyond OSM. Institutional, not a visitor place — recommend drop.**

**4.51 Villa Pio IX / Caserma "Pio IX" / Foresteria Militare di Roma** — **Viale Castro Pretorio 95**
(OSM `addr`; the relation `Villa Pio IX` 69320 also tests inside). The it.wikipedia rione article
calls it "una struttura ricettiva per gli appartenenti alle forze armate" beside the library.
Rione: **Castro Pretorio** (A + C; Nominatim `suburb` = Municipio Roma II, §3.4). *Not open to the
public — context only.*

**4.52 Liceo Scientifico Statale Plinio Seniore** — **Via Montebello 122**. OSM; tests Castro
Pretorio. **Not a visitor place — recommend drop.**

### G. Embassies — READ §5 BEFORE WRITING ANY OF THESE

**4.53 British Embassy Rome** — **Via XX Settembre 80/a, 00187 Rome** (**first-party, GOV.UK**).
GOV.UK also states "Public access to embassies, high commissions and consulates is by appointment
only". Rione: **Castro Pretorio** (A). Adjacent to Porta Nomentana (§3.2 / 4.7) — it.wikipedia says
the walled-up gate now serves as the embassy's boundary wall. **The Basil Spence building is the
architectural reason to write about it; I did NOT find a fetchable source for the architect or the
date and did not write them in.**

**4.54 Ambasciata della Federazione Russa** — **Via Gaeta 5** (OSM `addr`). Rione: **Castro
Pretorio** (A). **No first-party source fetched.**

### H. Hotels and other

**4.55 The St. Regis Rome (ex Grand Hotel)** — **Via Vittorio Emanuele Orlando 3**. it.wikipedia:
**inaugurated 1894**, commissioned by **César Ritz** at the urging of the **Marchese di Rudinì**;
Ritz bought the site by the Baths of Diocletian in **1893**, between the Fontana del Mosè and Piazza
Esedra, from Filippo Cavallini, who had begun a hotel building there. **`marriott.com` returns 403,
so there is no first-party source; and it.wikipedia's "uno dei più antichi e lussuosi Hotel della
Capitale" is a superlative — quarantined (§8).** Rione: **Castro Pretorio** (A + B + C).

**4.56 Hotel Quirinale** — **Via Nazionale 7**. First-party site reached. The it.wikipedia rione
article groups it with the Grand Hotel as the luxury hotels of the 1880s quarter. **Any "oldest",
"where Verdi stayed", or trading-length claim from the hotel's own site is unpublishable under the
corpus rules.** Rione: **Castro Pretorio** (A + B + C).

**Also inside and sourced only to OSM, listed so the verifier can see the tail:** ENIT (Agenzia
Nazionale del Turismo), Via Marghera 2 · UNINETTUNO, Via San Martino della Battaglia 44 (address
confirmed on the university's own site header) · ENAC, Viale Castro Pretorio 118 · Villino
Gamberini · Palazzo Betti · Metro stations Repubblica and Castro Pretorio. **None of these is a
visitor place; I am not proposing them as pages.**

---

## 5. THE EMBASSY PROBLEM — the Ludovisi ruling, twice, in this rione

The vatican_ruling's third tier and the Ludovisi note about Palazzo Margherita both exist because
people believe embassies are foreign soil. **This rione contains two working embassies inside its
boundary (British, Via XX Settembre 80/a; Russian, Via Gaeta 5) and sits directly across Via XX
Settembre from a third (France to the Holy See, at Villa Bonaparte — which tests Sallustiano, not
ours).** All three are ordinary Italian territory under the Vienna Convention's inviolability
regime. **No page may say or imply that any of them is British, Russian or French territory, that
crossing the gate leaves Italy, or that a border runs there.** This is exactly the Palazzo
Margherita misconception in a different costume, and it will be offered three times here.

Separately: **no Lateran Treaty property, Art. 15 or Art. 16, falls in Castro Pretorio.** I checked
the extraterritorial list against everything in §4 and found nothing. Santa Maria Maggiore — the
nearest Art. 15 property — is in **Monti** by (A) and (C), and is reserved to wave 1 besides.

---

## 6. RULED OUT — places a source associates with this rione that are not in it

| Place | Why out | Evidence |
|---|---|---|
| **Stazione di Roma Termini** | station building and forecourt test **Esquilino** | §3.1 |
| **Piazza dei Cinquecento** | **Esquilino** on 4 tested points | §3.1 |
| **Cappella del SS Crocifisso alla Stazione Termini** | Esquilino | §3.1 |
| **The monumental Mura Serviane at Termini** | Esquilino; Sovrintendenza itself says "a fianco della Stazione Termini" | §3.1, 4.8 |
| **Palazzo del Viminale** (Ministero dell'Interno) | **Monti**. Turismo Roma's own coordinate (41.899529, 12.494162) tests Monti; the rione boundary runs along Via Depretis. An OSM node labelled "Ministero dell'Interno" 450 m away at 12.4996 tests Castro Pretorio and is **misplaced** | (A) on TR coordinate |
| **Le Quattro Fontane** (the junction) | Trevi/Monti; only the Albani corner is ours | §3.3 |
| **Santa Maria della Vittoria** | **Sallustiano** | (A) + (C) |
| **Santa Susanna alle Terme di Diocleziano** | **Trevi** | (A) + (C) |
| **Villa Bonaparte / Villa Paolina** | **Sallustiano** | (A) |
| **Monumento al Bersagliere** | outside every rione polygon (Piazzale di Porta Pia) | (A) |
| **Villino Cavazzi della Somaglia** | **DEMOLISHED 1952** — it.wikipedia infobox `stato = Demolito`. The it.wikipedia rione article still lists it under "Architetture civili" | it.wikipedia |
| **Museo Numismatico della Zecca Italiana** | **MOVED OUT.** MEF's own page: since **25 October 2016** the Zecca museum is at **Via Salaria 712**; the collection was displayed at Via XX Settembre **until 2015**. The it.wikipedia rione article lists it with "(fino al 2016)" | `mef.gov.it/ministero/palazzo/museo.html` |
| **Camminamento delle Mura Aureliane di Viale Pretoriano** | access is from Via dei Frentani / Via dei Ramni, San Lorenzo side; midpoint tests no rione | §3.5 |
| **Policlinico Umberto I, Sapienza, Istituto Superiore di Sanità, San Lorenzo, Piazzale Sisto V, Porta Tiburtina, Piazzale della Croce Rossa, Villa Patrizi** | all outside the walls, outside every rione polygon; Nominatim returns Nomentano / Municipio Roma II | (A) + (C) |
| **Basilica di Santa Maria Maggiore, Santa Prassede, Santa Pudenziana** | Monti/Esquilino. The it.wikipedia rione *history* section discusses them because the medieval population clustered there, which is **not** a claim that they are in the rione | (A) on S. M. Maggiore |
| **Acquedotto Felice (Turismo Roma record)** | that record is **Via Lemonia**, Parco degli Acquedotti | TR location field |
| **Chiesa del Corpus Domini, Mercato Nomentano** | outside every polygon | (A) |

**Also note:** the it.wikipedia rione article's street list is a list of *bounding* streets as much
as interior ones — it includes **Via Cavour, Via Gioberti, Via Farini, Via Principe Amedeo, Piazza
dell'Esquilino and Via Urbana**, several of which run in Esquilino or Monti. **Do not treat that
list as an inventory of the rione's interior.**

---

## 7. SOURCE DEFECTS I OBSERVED — the verifier should not re-discover these

1. **Turismo Roma publishes one coordinate for two different buildings.** `POINT (12.4914064
   41.9023045)` is given both for **Palazzo Esercito** and for the **Chiesa evangelica metodista**,
   and both records give the address "Via XX Settembre 123". The street number is plausibly right
   for both (the palace is 123/A, the church is at 123 on the corner of Via Firenze), but **the
   coordinate cannot be right for both.** Treat Turismo Roma addresses as sourced and its
   coordinates as indicative.
2. **Turismo Roma's "Mura Serviane" record points to Via Giosuè Carducci 1** (41.896248,
   12.501235), which tests **Esquilino** and is nowhere near the fragments in this rione.
3. **Turismo Roma returns HTTP 404 for many plausible slugs** but serves a full page for others;
   its Drupal search at `/it/search/node?keys=` is the only reliable way to find a slug, and the
   real results live in `<ol class="search-results">` — the three links `borghetto-dei-pescatori`,
   `fontana-di-trevi` and `tivoli-e-le-sue-ville` appear on **every** search page as sidebar
   furniture and are **not results**.
4. **`overpass-api.de` refused every connection this session**; `kumi.systems` and `private.coffee`
   both worked but **504 on regex-heavy or multi-`around` queries**. Keep queries narrow.
5. **it.wikipedia rate-limits `action=query` hard** — I got HTTP 429 on consecutive batched
   requests and had to back off 15 s between retries. One batch never completed.
6. **it.wikipedia contradicts itself** on Palazzo delle Finanze's architect, Palazzo Esercito's
   dates, and Kleffler's forename (§4.40, §4.41, §4.43).
7. **OSM's `Ministero dell'Interno` node is misplaced** by roughly 450 m (§6).

---

## 8. QUARANTINE — language found in sources that must NOT reach a page

**Designation-shaped language (ruling 1).** I did not find *vincolato* or *dichiarazione di
interesse culturale* asserted about any building here — the Italian heritage registers are
unreachable and nothing reachable said it. Two near misses, both harmless but recorded:
- The it.wikipedia `Castra Praetoria` infobox has `Parte di = Centro storico di Roma` and a
  `Sito_web` pointing at a `beniculturali.it` "Luoghi della Cultura" record. **That is a
  ministry directory entry, not a designation act, and I could not fetch it (host unreachable).
  It must not be turned into a protection claim.**
- The UNESCO inscription of the Historic Centre of Rome (1980) covers this area and **is**
  publishable per the ruling. OSM even carries the site as relation 14651598, "Centro storico di
  Roma, le proprietà extraterritoriali della Santa Sede e la basilica di San Paolo fuori le mura".
  **Publishable as an inscription; NOT as a protection status for any individual building.**

**Superlatives and "oldest" claims — all unpublishable under the corpus rules:**
- Basilica di Santa Maria degli Angeli, own site: "**Il più grande organo d'Italia in stile barocco
  francese**".
- Parrocchia russa di San Nicola, own site: the parish is described as the oldest by date of
  foundation among Russian churches in Italy.
- it.wikipedia rione article: the Caserma Castro Pretorio "**può vantarsi di essere, attualmente, la
  caserma più antica al mondo ancora presidiata da militari**".
- it.wikipedia: MuSEd is "**la più antica istituzione museale italiana**" of its kind; the Grand
  Hotel is "**uno dei più antichi e lussuosi Hotel della Capitale**"; Termini is "**la maggiore
  stazione ferroviaria d'Italia**" and "**la stazione ferroviaria italiana con il maggior numero di
  binari**"; the BNCR is "**una delle più grandi biblioteche d'Italia**"; Turismo Roma: the MNR holds
  "**la raccolta archeologica più importante del mondo**".
  **None of these ships.** *(RFI's "32 binari" is a plain count from the infrastructure manager and
  is fine; "the most platforms in Italy" is not.)*

**Trip durations and vague proximity — do not write:** the Sovrintendenza's Porta Pia visit page
gives "Durata: 60 minuti" for its own booked tour; **that is a tour's advertised length, not a
visit duration for the corpus, and the safest reading of the rule is to omit it.** Also avoid
"nelle vicinanze della Stazione Termini" (it.wikipedia, about the Sacro Cuore) and "a pochi passi
dalla nostra basilica" (the Salesians' own history page) — both are unmeasurable proximity.

**Photo leads for the later wave (ruling 3 — noted, not used):** the Michelangelo cloister's eight
colossal animal heads; the Naiadi at night; the Linea Clementina meridian line on the basilica
floor; Quagliata's glass dome; the Breccia scars on the walls at Porta Pia; the "dinosauro" canopy
at Termini (Esquilino side). `"photos": []` everywhere in this wave.

---

## 9. YIELD — my honest read

**This is a guide, not a town-page, and it is not close.** Castro Pretorio holds two sites of the
Museo Nazionale Romano, one of Italy's two national libraries, Michelangelo's last church, an opera
house with four world premieres in its own account, Michelangelo's gate, two Sixtus V *mostre*, the
Praetorian camp that names it, and a nineteenth-century ministerial quarter that is legible as a
single planned piece. I have **56 candidates**, of which roughly **30 are strong** — sourced to a
first-party site or to a Roma Capitale body with dating and authorship — and about **12 are weak or
OSM-only** and should be dropped rather than researched further.

**Where I expect to be wrong, and I want to be:** the brief warns that a high confirmation rate is
a failure signal. My weakest calls, in order:

1. **The Termini/Piazza dei Cinquecento line (§3.1).** I ruled the station out on machine evidence
   against it.wikipedia's explicit prose. If the arbitrator reads the 1921 rione instrument rather
   than OSM's rendering of it, this could flip, and it would take the single most-visited place in
   the quadrant with it. **This is the highest-stakes call in the file and I am least confident in
   it.**
2. **The northern gates (§3.2).** Porta Pia, Porta Nomentana and Porta Praetoriana all sit *in* the
   boundary. My polygon test puts all three inside; Nominatim declines to name a quarter for two of
   them and offers Nomentano instead. A gate in a boundary wall is a genuinely ambiguous object and
   I have not resolved it.
3. **Chiesa di Sant'Isidoro alle Terme (4.24).** OSM says it is a place of worship; it.wikipedia
   uses the past tense throughout. One of them is wrong and I could not tell which. Also **GAMM /
   Museo del Videogioco (4.16)**, where I could not establish that the museum exists as described.

**One thing the coordinator must decide, not me:** the municipio split (§3.4) is not a Wikipedia
error — Nominatim reproduces it on the ground along Viale Castro Pretorio, and the Municipio II
seat is physically inside the rione at Via Goito 35. The roster's gag order is correct and should
stay in force through this wave.
