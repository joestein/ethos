# Vatican City (Stato della Città del Vaticano) — FINDER file

Rome programme, zone 31 of 31. **Evidence, not adjudication.** A verifier adjudicates; an
arbitrator rules ownership. I do not resolve the two straddler questions raised in §9.

Research date: 2026-09-03. Author: finder agent.

---

## 0. Compliance statement — read this before using anything below

Read in full before work began: `priv/seed_data/rome_roster.json` → `scope_ruling`,
`vatican_ruling`, `evidence_ruling`, `kind_note`, and zone entry `zones[30]`.

Five things bind every line of this file.

1. **THIS PAGE IS NOT IN ITALY.** Every place record must carry
   `"state": "Vatican City"` and `"county": "Vatican City"` — not Italy/Rome. A place here emits
   `addressCountry` **VA**. Note the trap in §7.4: the Governorate's own vehicle page says "The
   International Code is **V**", which is the *vehicle* code, not the ISO 3166-1 country code.
   Do not write V.
2. **VATICAN LAW WAS NEVER RESEARCHED.** I did not research it and this file states nothing about
   it. Where a primary source volunteered a legal or jurisdictional claim I have quarantined it in
   §8 as **DO NOT PUBLISH** rather than transcribe it into a candidate record. The Governorate
   publishes an entire "Legislation and regulations" tree; I did not open it and neither should the
   writer.
3. **NO PHOTOGRAPHS.** `photos_allowed` is false for this zone and no photo wave follows. Every
   record below is `"photos": []`. I have sourced, named and linked no image, and I have parked no
   photo leads — there is nothing to park them for. The Museums publish a photography policy; it is
   in §8 as DO NOT PUBLISH, because it is a permissions topic.
4. **THE BOUNDARY MAY NOT BE STATED MORE PRECISELY THAN THE TREATY DOES.** §2 sets out what the
   Treaty actually says, §3 sets out the three separate and mutually contradicting descriptions of
   the line across St Peter's Square that I found, and §9 flags the one candidate whose territorial
   position I could not establish without exceeding the Treaty. Read all three together.
5. **NO SUPERLATIVES, ATTRIBUTED OR NOT.** This bit me constantly. UNESCO, the Governorate, the
   Fabbrica di San Pietro and the Museums all rank things in their own prose. §8.1 lists every
   superlative I met by name so the writer can recognise them on sight and cut them. A measurement
   publishes; a ranking does not.

Also observed: no designation claims (§7.5), no trip durations, no orientation by impression, no
trading durations, no editorial self-narration in anything I have drafted as reader-facing text.

---

## 1. Method

**Tooling.** WebSearch budget was treated as exhausted. Every retrieval ran against a URL named in
advance and was fetched with `python3` + `urllib` (never piped `curl`, never `grep` as a source of
truth), cached under `<scratchpad>/vc/cache`, scripts at `<scratchpad>/vc/`.

**Primary hosts, all reachable, all HTTP 200:**

| Host | What it is | Status |
| --- | --- | --- |
| `www.vatican.va` | Holy See | 200 |
| `www.vaticanstate.va` | Governorate of Vatican City State | 200 |
| `www.museivaticani.va` | Vatican Museums | 200 (redirects `/` → `/content/museivaticani/it.html`; use `/content/museivaticani/en/...`) |
| `www.basilicasanpietro.va` | Fabbrica di San Pietro | 200 (Nuxt SPA; content is server-rendered and parses fine) |
| `booking.basilicasanpietro.va` | Fabbrica booking portal | 200 — **operated by HIVE s.r.l.**, see §7.3 |
| `www.vaticanlibrary.va` | Biblioteca Apostolica Vaticana | 200 |
| `www.archivioapostolicovaticano.va` | Archivio Apostolico Vaticano | 200 (Italian only for the substantive pages) |
| `whc.unesco.org` | UNESCO World Heritage Centre | 200 |
| `eventi.pontificalisdomus.va` | Prefecture of the Papal Household, ticket requests | 200 (login-gated SPA, no public prose) |
| `biglietti.liturgiepontificie.va` | Office for Liturgical Celebrations, clergy tickets | 200 |
| `www.scavi.va` | former Ufficio Scavi | 200 but **now serves the Fabbrica's Necropolis page**; treat `basilicasanpietro.va` as the live source |

**Coordinates.** Nominatim (`nominatim.openstreetmap.org/search?format=jsonv2`) answered every
request at 1.5 s spacing, no 429. It resolves Vatican addresses to `..., Vatican City, 00120,
Vatican City`, which independently corroborates the 00120 postcode. Coordinates below are from
Nominatim and are cited as such. **Nominatim is an aggregator and is not authority on territory** —
see §9.1, where it disagrees with the Vatican about which state a building stands in.

**Slug collision check.** `python3 .superpowers/taken_slugs.py` run before drafting. Thirty Rome
zones are shipped and **none** of them carries St Peter's Basilica, St Peter's Square, the Vatican
Museums, the Sistine Chapel, the Vatican Gardens or the Vatican Necropolis. A name-level pass over
all thirty `priv/seed_data/rome/*.json` files returned exactly one near-hit, `teatro-sistina-colonna`
(Teatro Sistina, a theatre on Via Sistina in rione Colonna — unrelated). The gate's assertion holds
and this zone may claim all six.

---

## 2. The Lateran Treaty — the load-bearing section

Source: **`https://www.vatican.va/roman_curia/secretariat_state/archivio/documents/rc_seg-st_19290211_patti-lateranensi_it.html`**
(Holy See, Secretariat of State archive; Italian text of *Inter Sanctam Sedem et Italiae Regnum
Conventiones*, 11 February 1929). HTTP 200. All quotations below are transcribed from that page.

### 2.1 Dates and instrument

The page's own headnote: the Treaty was published in *Acta Apostolicae Sedis* n. 6 of 7 June 1929
and carries four annexes — **Allegato I, "Pianta del territorio dello Stato della Città del
Vaticano"**; Allegato II, the list and plans of the properties with extraterritoriality and
exemption; Allegato III, the properties with exemption only; Allegato IV, the financial convention.

Art. 27: *"Il presente Trattato, non oltre quattro mesi dalla firma, sarà sottoposto alla ratifica
del Sommo Pontefice e del Re d'Italia ed entrerà in vigore all'atto stesso dello scambio delle
ratifiche."* — "This Treaty shall, within four months of signature, be submitted for ratification by
the Supreme Pontiff and the King of Italy, and shall enter into force upon the exchange of
ratifications itself." Signed *"Roma, undici febbraio millenovecentoventinove"* by Cardinal Pietro
Gasparri and Benito Mussolini.

The Governorate states the same two dates in its own words: *"Vatican City State was created by the
Lateran Treaty stipulated between the Holy See and Italy on 11 February 1929 and ratified on 7 June
1929"* — `https://www.vaticanstate.va/en/state-and-government/general-informations/origins-and-characteristic.html`.

**Publishable:** signed 11 February 1929, ratifications exchanged 7 June 1929, in force from that
exchange. Two independent primary sources agree.

### 2.2 Art. 3 — the state, its border, and St Peter's Square

Three paragraphs. All three matter and the writer should have all three.

> *"L'Italia riconosce alla Santa Sede la piena proprietà e la esclusiva ed assoluta potestà e
> giurisdizione sovrana sul Vaticano, com'è attualmente costituito, con tutte le sue pertinenze e
> dotazioni, creandosi per tal modo la Città del Vaticano per gli speciali fini e con le modalità di
> cui al presente Trattato. **I confini di detta Città sono indicati nella Pianta che costituisce
> l'Allegato I° del presente Trattato, del quale forma parte integrante.**"*

"Italy recognises the full ownership and the exclusive and absolute sovereign power and
jurisdiction of the Holy See over the Vatican as it is presently constituted, with all its
appurtenances and endowments, thereby creating Vatican City for the special purposes and in the
manner set out in this Treaty. **The boundaries of the said City are indicated on the Plan which
constitutes Annex I to this Treaty, of which it forms an integral part.**"

> *"Resta peraltro inteso che **la piazza di San Pietro, pur facendo parte della Città del
> Vaticano**, continuerà ad essere normalmente aperta al pubblico e soggetta ai poteri di polizia
> delle autorità italiane; le quali si arresteranno ai piedi della scalinata della Basilica, sebbene
> questa continui ad essere destinata al culto pubblico, e si asterranno perciò dal montare ed
> accedere alla detta Basilica, salvo che siano invitate ad intervenire dall'autorità competente."*

"It is however understood that **St Peter's Square, although forming part of Vatican City**, shall
continue to be normally open to the public and subject to the police powers of the Italian
authorities; who shall stop at the foot of the steps of the Basilica, although the latter continues
to be used for public worship, and shall therefore refrain from mounting or entering the said
Basilica, unless invited to intervene by the competent authority."

> *"Quando la Santa Sede, in vista di particolari funzioni, credesse di sottrarre temporaneamente la
> piazza di San Pietro al libero transito del pubblico, le autorità italiane, a meno che non fossero
> invitate dall'autorità competente a rimanere, si ritireranno al di là delle linee esterne del
> colonnato berniniano e del loro prolungamento."*

"When the Holy See, in view of particular functions, sees fit temporarily to withdraw St Peter's
Square from free public transit, the Italian authorities, unless invited by the competent authority
to remain, shall withdraw beyond the outer lines of the Bernini colonnade and their prolongation."

**What this licenses and what it does not.**

- **The square is inside the state.** *"pur facendo parte della Città del Vaticano"* is explicit.
  Italian policing there is a *concession on foreign soil*, granted by the Treaty. It is not
  evidence that the square is Italian, and no record may imply that it is.
- Note the third paragraph's mechanism: on those occasions the Italian authorities withdraw
  **beyond the outer lines of the colonnade and their prolongation** — i.e. the line the Italian
  police fall back to is described relative to Bernini's colonnade, and that is a *policing*
  withdrawal line, not a statement of where the border runs. Do not conflate the two.
- **The Treaty gives no verbal description of the border at all.** The only definition is the
  1:5000 plan at Annex I. Whatever a page wants to say about where Vatican territory begins, the
  Treaty does not say it — so the page may not either.

### 2.3 Art. 15 — extraterritoriality (the third tier)

> *"Gli immobili indicati nell'art. 13 e negli alinea primo e secondo dell'art. 14, nonché i palazzi
> della Datarìa, della Cancelleria, di Propaganda Fide in Piazza di Spagna, il palazzo del
> Sant'Offizio ed adiacenze, quello dei Convertendi (ora Congregazione per la Chiesa Orientale) in
> piazza Scossacavalli, il palazzo del Vicariato (Alleg. II, 6, 7, 8, 10 e 11), e gli altri edifici
> nei quali la Santa Sede in avvenire crederà di sistemare altri suoi Dicasteri, **benché facenti
> parte del territorio dello Stato italiano**, godranno delle immunità riconosciute dal diritto
> internazionale alle sedi degli agenti diplomatici di Stati esteri."*

"The properties indicated in Art. 13 and in the first and second paragraphs of Art. 14, as well as
the palaces of the Dataria, of the Cancelleria, of Propaganda Fide in Piazza di Spagna, the palace
of the Holy Office and its adjacencies, that of the Convertendi (now the Congregation for the
Eastern Church) in Piazza Scossacavalli, the palace of the Vicariate (Annex II, 6, 7, 8, 10 and 11),
and the other buildings in which the Holy See shall in future see fit to house other of its
Dicasteries, **although forming part of the territory of the Italian State**, shall enjoy the
immunities recognised by international law for the seats of the diplomatic agents of foreign
States."

The Art. 13 properties, incorporated by that cross-reference, are the three patriarchal basilicas —
*"le Basiliche patriarcali di San Giovanni in Laterano, di Santa Maria Maggiore e di San Paolo,
cogli edifici annessi"* — plus the S. Callisto building near S. Maria in Trastevere. Art. 14 adds
Castel Gandolfo and Villa Barberini.

**The five words that decide the whole question: *benché facenti parte del territorio dello Stato
italiano* — "although forming part of the territory of the Italian State."** Art. 15 grants the
immunities of a diplomatic mission's premises. It does not move the ground. These places are on
Italian soil. They are **not** Vatican City and **not** this page's.

### 2.4 Art. 16 — a different list, a different grant

> *"Gli immobili indicati nei tre articoli precedenti, nonché quelli adibiti a sedi dei seguenti
> istituti pontifici: Università Gregoriana, Istituto Biblico, Orientale, Archeologico, Seminario
> Russo, Collegio Lombardo, i due palazzi di Sant'Apollinare e la Casa degli esercizi per il Clero
> di San Giovanni e Paolo (Alleg. III, 1, 1 bis, 2, 6, 7, 8), **non saranno mai assoggettati a
> vincoli o ad espropriazioni per causa di pubblica utilità**, se non previo accordo con la Santa
> Sede, **e saranno esenti da tributi** sia ordinari che straordinari tanto verso lo Stato quanto
> verso qualsiasi altro ente."*

"The properties indicated in the three preceding articles, as well as those used as the seats of the
following pontifical institutes: the Gregorian University, the Biblical, Oriental and Archaeological
Institutes, the Russian Seminary, the Lombard College, the two palaces of Sant'Apollinare and the
House of Retreats for the Clergy at Santi Giovanni e Paolo (Annex III, 1, 1 bis, 2, 6, 7, 8),
**shall never be subjected to encumbrances or to expropriation for reasons of public utility**,
save by prior agreement with the Holy See, **and shall be exempt from taxes**, ordinary and
extraordinary, whether to the State or to any other body."

**Art. 15 ≠ Art. 16.** Art. 16 adds a *further, longer* list — the Gregorian University, the
Biblical, Oriental and Archaeological Institutes, the Russian Seminary, the Lombard College, the two
Sant'Apollinare palaces, the clergy retreat house at Santi Giovanni e Paolo — and grants those only
protection from expropriation and exemption from taxes. **No diplomatic immunity, no
extraterritoriality.** Anyone who writes "extraterritorial" over an Art. 16 building has conflated
two grants the Treaty deliberately kept apart. Never do it.

### 2.5 Art. 18 — the one Treaty article that is directly about visiting

> *"I tesori d'arte e di scienza esistenti nella Città del Vaticano e nel Palazzo Lateranense
> rimarranno visibili agli studiosi ed ai visitatori, pur essendo riservata alla Santa Sede piena
> libertà di regolare l'accesso del pubblico."*

"The treasures of art and science existing in Vatican City and in the Lateran Palace shall remain
visible to scholars and to visitors, the Holy See reserving full freedom to regulate public access."

Publishable and genuinely useful: it is the Treaty undertaking that stands behind the Museums and
the Library being open to anyone at all. It says nothing about photography, reproduction or rights,
and must not be stretched to.

### 2.6 Other Treaty articles I read and what I did with them

- **Art. 2** — Italy recognises the sovereignty of the Holy See in the international field. Fine to
  cite for "sovereign state".
- **Art. 5** — the Holy See shall close the accesses, walling the open parts, *"tranne la piazza di
  San Pietro"* (except St Peter's Square). Corroborates that the square is the one part not walled.
- **Art. 6** — Italy undertakes to build a railway station inside Vatican City *"nella località
  indicata nell'allegata Pianta"*.
- **Art. 7** — third paragraph: *"Nella Piazza Rusticucci e nelle zone adiacenti al colonnato, ove
  non si estende la extraterritorialità di cui all'art. 15…"* — the areas adjacent to the colonnade
  where Art. 15 extraterritoriality does **not** extend. Interesting, and a trap: it is *not* a
  description of where the border runs.
- **Art. 24** — *"la Città del Vaticano sarà sempre ed in ogni caso considerata territorio neutrale
  ed inviolabile."*
- **Art. 22, 23** — criminal and judicial cooperation. **DO NOT PUBLISH.** Jurisdiction.
- **Art. 1, 9, 21** — state religion, citizenship, cardinals. **DO NOT PUBLISH.** Legal status.

---

## 3. The line across St Peter's Square — three descriptions, no authority

This is the single most dangerous factual area on the page, so I am setting out everything I found
rather than resolving it.

**(a) The Treaty (primary, §2.2).** Says nothing. The border is the Annex I 1:5000 plan and there is
no verbal description anywhere in the instrument.

**(b) The Governorate, "Geography" page** —
`https://www.vaticanstate.va/en/state-and-government/general-informations/geography.html`:

> "The State's territory, which covers a surface area of 0.44 km2 (44 hectares), is partly surrounded
> by walls and includes Saint Peter's Square **up to the marble strip** that joins the ground to the
> outer parts of the Colonnade, and marks the confines of the State to the boundaries of the Square,
> a boundary that can however, be freely accessed. Even though it is part Vatican City's territory,
> by regulation, it is subject to supervision by the Italian Republic's police authorities."

**(c) The Governorate, "Vatican City Today" page** —
`https://www.vaticanstate.va/en/state-and-government/history/vatican-city-today.html`:

> "Its borders are marked by its walls, and in Saint Peter's Square, by **the white marble line**
> that joins the two wings of the colonnade."

**(d) it.wikipedia, "Ricciolo d'Italia" (AGGREGATOR)** —
`https://it.wikipedia.org/wiki/Ricciolo_d%27Italia`:

> "La linea esatta del confine prospiciente il Colonnato berniniano è segnata sul suolo da una linea
> curva **in travertino**."

**The problem.** (b) and (c) are the same publisher and do not agree with each other on the shape
("strip joining the ground to the outer parts of the colonnade" vs "line joining the two wings of
the colonnade"). (d) says travertine where (b) and (c) say marble. And *none* of them is the Treaty,
which is the only thing that defines the border.

**Recommendation to the writer.** You may say, attributed to the Governorate, that a line is marked
on the ground across the square between the arms of the colonnade. You may **not** write that the
strip "is the border" as a flat fact, you may not pick a material and state it as one, and you may
not use it to tell a reader where Vatican territory begins. If in doubt, write nothing about the
line at all — the page loses very little and risks a great deal.

### 3.1 The Ricciolo d'Italia

`https://it.wikipedia.org/wiki/Ricciolo_d%27Italia` — **aggregator**, but a well-cited one, and its
account matches the roster note. It describes a curl of Italian territory that begins near Porta
Angelica and runs behind the *right* arm of the colonnade (north side as walked from the basilica),
insinuating itself into Vatican territory and separating it into two parts. Its own cited sources
are named and checkable: Vito La Colla in *Corriere della Sera*; Aldo Maria Valli, *Piccolo mondo
vaticano*, Laterza 2013, pp. 29–30; Cesare Maffi, "I confini confusi del Vaticano", *Italia Oggi*
n. 164, 13 July 2019, p. 10; and the Comune di Roma geoportal.

It also independently confirms the two Treaty facts the roster relies on:

> "mancando una descrizione puntuale dei confini, venne costituita una commissione bilaterale
> italo-vaticana per verificare in maniera precisa i limiti tra i due stati; tuttavia dopo tre anni
> di lavori **le conclusioni a cui si giunse nel 1932 non vennero più ratificate**."

> "La mappa in scala 1:5000 allegata ai Patti Lateranensi… non è particolarmente dettagliata e in
> alcuni punti vi sono piccole differenze tra la cartografia pubblicata dalla Gazzetta ufficiale e
> dagli Acta Apostolicae Sedis."

⚠️ **DIMENSION DISCREPANCY — resolve before publishing.** The roster note says the Ricciolo is "3m
by 60m". The only source I have says **width about 3 m** and **length about 70 m**, total area
"inferiori a 105 m²". The roster and the source do not agree on the length. **My recommendation:
publish neither length.** State, attributed, that it is about three metres wide, or omit the figure
entirely. Do not publish 60 m, because nothing I found supports it.

Second warning: the source itself says the strip is *commonly and erroneously* treated as Vatican
territory, including by the Italian police and Swiss Guards who stand on it, and that *de facto* the
Vatican administers it. That is a live ambiguity, not a settled fact. **Under no circumstances use
the Ricciolo to explain where the border runs generally.** The roster permits stating its existence
if sourced. It permits nothing more.

---

## 4. The state's own facts

All from the Governorate unless marked.

| Fact | Value | Source |
| --- | --- | --- |
| Area | **0.44 km² (44 hectares)** | `…/general-informations/geography.html` |
| Constituted | Lateran Treaty, signed 11 Feb 1929, ratified 7 June 1929 | `…/general-informations/origins-and-characteristic.html` |
| Citizens | **673**, of whom **458 live inside the walls** (including **120** Pontifical Swiss Guard) | `…/general-informations/population.html` |
| Non-resident citizens | "Some 30% … do not reside inside the State", mostly diplomatic staff | ibid. |
| Statistical data, to 31 Dec 2024 | cardinals who are Vatican citizens **66** (10 living inside); residents, citizens and non-citizens, **882**; deaths in 2024 **6**; squares **21**; covered roads **30** | ibid. |
| Entrances | **five**, guarded by the Pontifical Swiss Guard and the Gendarmerie Corps; Museums access from Viale Vaticano | `…/geography.html` |
| Gardens | **c. 22 hectares, half the territory** | Museums, `…/patrimonio-naturale-archeologico/giardini/presentazione-giardini/giardini.html`; Governorate `…/other-bodies/vatican-gardens.html` says "half of the roughly 44 hectares" |
| Swiss Guard founded | **1506**; uniforms "according to tradition" designed by Michelangelo — the source hedges, keep the hedge | `…/history/vatican-city-today.html` |
| *L'Osservatore Romano* | founded **1861** | ibid. |
| Vatican Radio | since **1931** | ibid. |
| Vehicle codes | **SCV** (State and Holy See bodies), **CV** (citizens and permit holders) | `…/general-informations/vehicle-registration-codes.html` |
| Postcode | **00120 Città del Vaticano** | Biblioteca Apostolica Vaticana footer; corroborated by Nominatim, which returns "…, Vatican City, 00120, Vatican City" |
| Hague Convention | the entire territory is under the 1954 Hague Convention for the Protection of Cultural Property in the Event of Armed Conflict | `…/general-informations/extraterritoriality.html` |

⚠️ **INTERNAL CONTRADICTION in the source.** The "Vatican City Today" page opens *"With a surface
area of 0.44 hectares…"*. That is wrong — it is 0.44 **km²**, i.e. 44 hectares, as the same
publisher's Geography page, the same publisher's Gardens page and UNESCO all say. **Publish 0.44 km²
(44 ha). Do not publish 0.44 hectares.**

⚠️ Second arithmetic wobble in the same publisher: the Population page says 673 citizens of whom 458
live inside, then the statistical block gives 882 residents (citizens *and* non-citizens). These are
different populations and are not actually inconsistent, but a record that puts both numbers in one
sentence will read as if they are. Use one or state the basis of each.

### 4.1 UNESCO

`https://whc.unesco.org/en/list/286` (HTTP 200).

- Property name **Vatican City**; State Party **Holy See**
- **Date of Inscription: 1984**
- **Criteria: (i)(ii)(iv)(vi)**
- **Property: 44 ha**
- Dossier **286**

This is a **separate World Heritage property from the "Historic Centre of Rome"** inscription, which
is why this page may state an inscription where the thirty Roman zone pages carry none. The
Governorate states it too: *"In 1984, Vatican City was inscribed in UNESCO's World Cultural and
Natural Heritage List"* (`…/general-informations/extraterritoriality.html`).

**Hard limit.** State the inscription **of Vatican City as a property**. Do **not** convert it into
a protection status for any individual building — not the basilica, not the Sistine Chapel, not the
Museums. The `evidence_ruling` bans per-property designation claims and this inscription is not an
exception to it, it is a property-level fact about the whole state.

**UNESCO prose is unusable verbatim** — see §8.1.

---

## 5. Place candidates

Kinds are drawn from the thirteen the schema allows per `kind_note` (museum, theater, restaurant,
cafe, brewery, hotel, bnb, park, historic-site, amusement-park, shop, stadium, attraction). There is
no church, chapel, square or monument kind. Coordinates are Nominatim unless stated. Every record
carries `"state": "Vatican City"`, `"county": "Vatican City"`, `"photos": []`.

### 5.A The six the gate reserves to this zone

**1. St Peter's Basilica (Basilica Papale di San Pietro in Vaticano) — historic-site**
- Coords **41.9021569, 12.4537105**; Nominatim returns "Saint Peter's Basilica, Piazza San Pietro,
  Vatican City, 00120, Vatican City".
- **Founding**: on **18 April 1506**, the Saturday after Easter, Julius II laid the first stone of
  the new basilica at the site of the present south-west pillar of St Veronica, which then stood
  outside the old Constantinian and medieval church. Per the master of ceremonies Paride de Grassis,
  the pope descended into the foundation pit — **7.45 metres** — by ladder in pontifical robes, laid
  the first marble stone, and placed a terracotta vessel with twelve medals modelled by Cristoforo
  Foppa, known as Caradosso.
- **Architects named by the Fabbrica**: Fra' Giovanni Giocondo (1433–1515), Raphael Sanzio
  (1483–1520), Giuliano da Sangallo (1445–1516), Antonio da Sangallo (1485–1586), Baldassarre
  Peruzzi (1481–1536), Michelangelo Buonarroti (1475–1564), Jacopo Barozzi da Vignola (1507–1573),
  Giacomo della Porta (1533–1602), Carlo Maderno (1556–1629). **Maderno built the façade between
  1608 and 1612.** Bernini (1598–1680) did the square in the seventeenth century.
- **Opening hours**: "From june 1st: from 7.00 am to 8:00 pm" — `…/en/opening-hours`. ⚠️ The page
  gives a start date and no end date. See §7.1.
- **Entry is free and unbooked.** The Fabbrica states it plainly on the Treasury Museum page: *"We
  remind you that it is still possible to enter the Basilica without a reservation, from the
  ordinary entrance in St. Peter's Square."*
- **Getting in**: *"Access to the Basilica begins with the security checks by the Italian State
  Police: the stations are located in the right hemicycle of Saint Peter's Square looking towards
  the Basilica."* (`…/en/entering-the-basilica`) — this is the Fabbrica's own description and it is
  the practical face of the Art. 3 policing concession.
- **Dedication anniversary**: the Fabbrica is running a lecture cycle in 2026 for the *400th
  anniversary of the Dedication of St Peter's Basilica* (news items dated 2026). That dates the
  dedication to 1626; the Fabbrica does not give the day on the pages I read. **Publish "1626" only
  if the writer can pin it; otherwise say the Fabbrica marked the fourth centenary in 2026.**
- Sources: `https://www.basilicasanpietro.va/en/san-pietro/the-basilica`,
  `https://www.basilicasanpietro.va/en/opening-hours`,
  `https://www.basilicasanpietro.va/en/entering-the-basilica`
- Photos: []

**2. St Peter's Square (Piazza San Pietro) — attraction**
- Coords **41.9022351, 12.4573573**.
- Bernini, for Alexander VII, **completed 1667 after eleven years' work**.
- Geometry, from the Fabbrica: an *"oval space with three centres"*, **196 × 149 metres**, with
  semicircular colonnades joined to the basilica by arms or closed ambulacra enclosing a trapezoidal
  area whose longest side is the façade. The colonnade has **284 columns in four rows, 16 metres
  high**, carrying **140 statues, more than three metres high**.
- The Vatican obelisk at the centre came from the circus of Caligula and Nero.
- Also in the square: a large mosaic copy of the fifteenth-century *Mater Ecclesiae* icon, the
  original of which is venerated inside the basilica in the Chapel of Our Lady of the Column.
- **Legal note for the record's prose**: the square is inside the state (Art. 3, §2.2). Italian
  police powers there are a Treaty concession, not evidence of Italian territory. Do not describe
  the square as Italian and do not describe where its edge falls. Cf. §3.
- Source: `https://www.basilicasanpietro.va/en/san-pietro/the-square`
- Photos: []

**3. Vatican Museums (Musei Vaticani) — museum**
- Coords **41.9062438, 12.4527428**. Address as the Museums publish it: **Viale Vaticano, 00165
  Rome**; ⚠️ see §7.4 — that is an *Italian* postcode on the Museums' own contact block, and the
  record must still carry `"state": "Vatican City"`, `"county": "Vatican City"` per the ruling.
- **Hours**: Monday to Saturday **08:00–20:00, final entry 18:00**. **Every last Sunday of the
  month 09:00–14:00, final entry 12:30, free entry**, guided tours on reservation — except where
  that Sunday falls on Easter Sunday, 29 June (Sts Peter and Paul), 25 December, 26 December or
  31 December. Visitors must leave the halls 30 minutes before closing.
- **Closures**: Sundays (except the last of the month, subject to the above); 1 and 6 January;
  11 February; 19 March; 6 April; 1 May; 29 June; 14 and 15 August; 1 November; 8, 25 and
  26 December.
- **Prices**: full **€20.00** without online booking; full "Skip the Line" **€20.00 + 5.00** booked
  on the official site; reduced **€10.00** (+5.00 skip-the-line); reduced schools **€5.00** (+2.00);
  reduced students / pilgrimages / university institutes **€10.00** (+5.00); reduced seminaries and
  religious colleges **€5.00** (+2.00).
- **Free entry**: last Sunday of the month; children under 7; directors of museum institutions and
  heritage bodies; disabled visitors with certified invalidity of at least 67% (and a companion
  where the visitor is not self-sufficient — issued on the day at the "Special Permits" or "Welcome
  Desk" in the entrance hall, not bookable online, with priority entry); ICOM and ICOMOS card
  holders; university teachers in archaeology, art history, architecture and ethnology on written
  request.
- **Tickets**: *"The only official site for purchasing tickets online is
  https://tickets.museivaticani.va"*, with the Museums' own warning about lookalike domains charging
  higher prices. The entry ticket *"entitles the visit to the Museums and Sistine Chapel solely on
  the day on which the ticket is issued"*; tickets are non-refundable.
- **Contacts**: general information **+39 06 69883145**, `info.musei@scv.va`; Directorate
  **+39 06 69883332**, `musei@scv.va`; booking help desk `help.musei@scv.va`; reception
  `accoglienza.musei@scv.va`.
- **Getting there** (Museums' own page): Metro line A towards Battistini, stations **Ottaviano** or
  **Cipro**; bus **49** stopping in the square in front of the Museums; **32, 81, 982** at Piazza
  del Risorgimento; **492, 990** at Via Leone IV / Via degli Scipioni; tram **19** at Piazza del
  Risorgimento; taxi rank in the square in front of the Museums.
- **Dress code** (applies to the Museums, the Sistine Chapel, St Peter's Basilica and the Vatican
  Gardens): no sleeveless or low-cut garments, no shorts above the knee, no miniskirts, no hats.
- **Cloakroom** is free and compulsory for luggage, suitcases, rucksacks and packages, and for
  knives, scissors, metal tools, medium and large umbrellas, sticks, tripods, video cameras, banners
  and signs. Visitors continuing to the basilica are told not to leave baggage in the Museums. No
  alcohol into the Museums; no eating or drinking in the exhibition halls. No animals except guide
  dogs muzzled and leashed and certified pet-therapy animals, with one day's notice by email. No
  laser pointers. Vending machines and refreshment areas with cafeteria, self-service and pizzeria
  along the route. Rest areas with seats in the Courtyard of the Cuirasses, Courtyard of the
  Pinacoteca, Square Garden and Courtyard of the Pinecone. **There is a branch of the Vatican Post
  inside the Museums.**
- ⚠️ The same "Useful information" page also carries a photography policy and a drawing-permission
  policy. **Both are quarantined in §8.2. Do not publish either.**
- Sources: `https://www.museivaticani.va/content/museivaticani/en/info/orari-musei-vaticani.html`,
  `…/en/organizza-visita/tariffe-e-biglietti.html`, `…/en/organizza-visita/consigli-utili.html`,
  `…/en/info/come-raggiungerci.html`
- Photos: []

**4. Sistine Chapel (Cappella Sistina) — historic-site**
- Coords **41.9029338, 12.4544043**. Inside the Museums itinerary; covered by the Museums ticket.
- Named for **Sixtus IV della Rovere** (pontiff 1471–1484), who had the old *Cappella Magna*
  restored **between 1477 and 1480**.
- Fifteenth-century wall decoration: false drapes, the *Stories of Moses* (south and entrance
  walls), the *Stories of Christ* (north and entrance walls), portraits of the popes. Painters:
  **Pietro Perugino, Sandro Botticelli, Domenico Ghirlandaio, Cosimo Rosselli**, with their
  workshops and closer assistants among whom the Museums name **Biagio di Antonio, Bartolomeo della
  Gatta, Luca Signorelli**. **Pier Matteo d'Amelia** painted a starry sky on the ceiling. Work on
  the frescoes **began 1481, concluded 1482**; the marble screen, the choir stalls and the pontifical
  arms over the door date from the same year.
- **Consecrated by Sixtus IV on 15 August 1483**, dedicated to Our Lady of the Assumption.
- **Julius II** entrusted the ceiling to **Michelangelo in 1508**; work **finished October 1512**;
  Julius II inaugurated the chapel with a solemn Mass on the Feast of All Saints, **1 November
  1512**. Nine central panels of the *Stories of Genesis*; five Sibyls and seven Prophets between
  the spandrels; the *Miraculous salvation of Israel* in the four corner pendentives; Ancestors of
  Christ in spandrels and lunettes.
- **Last Judgement**: commissioned **towards the end of 1533** by Clement VII de' Medici; Michelangelo
  **began 1536** under Paul III and **completed it in the autumn of 1541**. It destroyed Perugino's
  altarpiece of the Virgin among the Apostles and the first two episodes of both fresco cycles.
- Entrance wall repainted in the second half of the sixteenth century: **Hendrik van den Broeck**
  over Ghirlandaio's *Resurrection*, **Matteo da Lecce** over Signorelli's *Discussion over the body
  of Moses*, which had been damaged when the door collapsed in **1522**.
- **Complete restoration of the frescoes 1979–1999**, including the cantoria, the screen and the
  arms of Sixtus IV.
- **The Conclave for the election of the Supreme Pontiff is held in the Chapel.**
- **Visitor rule the Museums publish**: visitors are asked to observe absolute silence; guided groups
  receive their art-historical commentary *before* entering, using touch-screen totems outside, and
  informative panels for individual visitors are in the Courtyard of the Pinecone and the Square
  Garden.
- ⚠️ The Sistine Chapel page quotes John Paul II's homily of 8 April 1994 (completion of the *Last
  Judgement* restoration), which contains "**incomparable beauty**". Cut it. See §8.1.
- Sources: `https://www.museivaticani.va/content/museivaticani/en/collezioni/musei/cappella-sistina/storia-cappella-sistina.html`,
  `…/en/organizza-visita/consigli-utili.html`
- Photos: []

**5. Vatican Gardens (Giardini Vaticani) — park**
- Coords: Nominatim resolves "Giardini Vaticani" only to the greenhouses, **41.9056662, 12.4508644**
  — flagged as an imperfect centroid, verifier should improve or drop.
- **c. 22 hectares, half the territory.**
- Origin **1279** / the pontificate of **Nicholas III (1277–1280)**, who moved the papal residence
  from the Lateran to the Vatican and had a *pomerium* (orchard), a *pratellum* (lawn) and a
  *viridarium* (garden) planted inside his new walls on Mons Saccorum; the Governorate notes the
  stone inscription recording this is now in the Sala dei Capitani of the Palazzo dei Conservatori
  on the Capitol (**which is in rione Campitelli and is already published there — do not claim it**).
- Named features on the Museums' own itinerary: Italian Garden, Fountain of the Eagle, Fountain of
  the Zitella, **Casina of Pius IV**, Our Lady of the Watch, **Lourdes Grotto**, **Saint John's
  Tower**, **Jubilee 2000 Bell**, bronze statue of Saint Peter, **Square Garden**.
- History the Museums publish: Belvedere "palace of delights" under **Innocent VIII (1484–1492)**;
  Bramante's Belvedere courtyard for **Julius II**; **Pirro Ligorio** built the Casina with loggia
  for **Pius IV** by **1565**; **Pius V** added exotic and rare plants collected by the botanist
  **Michele Mercati** and the Bolognese scholar **Ulisse Aldrovandi**, Mercati also laying out the
  geometric flowerbeds; restoration of Trajan's aqueduct in the early seventeenth century allowed the
  fountains; Napoleon's troops plundered much of the gardens at the end of the eighteenth century;
  **Gregory XVI (1831–1846)** commissioned renovation, described by **Gaetano Moroni** in his
  *Dizionario di erudizione storico-ecclesiastica* (1840–1861); nineteenth-century sculptures among
  the trees include *Saint Peter in chains* by **Maria Luisa Amalia Dupré (1842–1928)**, given 1887,
  and a bronze *Saint Alpino stopping Attila* by **Jean Ernest Boutellier (1851–1916)**, given
  1887–1888; after **1929** the architect **Giuseppe Momo (1875–1940)** with the botanist **Giovanni
  Nicolini** designed the present gardens over four years.
- **Access**: by booked tour only, sold as a separate Museums ticket category ("Vatican Gardens" on
  the Museums' Tickets menu). ⚠️ **PRICE GAP** — the Gardens tour price is on the SPA at
  `tickets.museivaticani.va`, which serves no server-side prose. I did not get a price. Publish
  none.
- Dress code applies (see record 3).
- Sources: `https://www.museivaticani.va/content/museivaticani/en/patrimonio-naturale-archeologico/giardini/presentazione-giardini/giardini.html`,
  `https://www.vaticanstate.va/en/other-bodies/vatican-gardens.html`
- Photos: []

**6. Vatican Necropolis (Necropoli Vaticana, "the Scavi") — historic-site**
- Coords **41.9021730, 12.4536689** (Nominatim: "Vatican Necropolis, St Gregory the Illuminator
  Courtyard, Vatican City, 00120, Vatican City").
- **Location**: below the level of the Vatican Grottoes, **between three and eleven metres below the
  floor of the central nave** of the basilica.
- **Discovery**: archaeological explorations begun in the early years of the pontificate of **Pius
  XII (1939–1958)**; the Fabbrica dates the excavations that found the tomb to **1939–1949**.
- Second-century brick tomb buildings became, in the fourth century, the foundations of the first
  Petrine basilica. Constantine's builders moved **over 40,000 cubic metres of earth** to level the
  Vatican hill and demolished the tops of the tombs; the Constantinian basilica had **five naves
  divided by 88 columns**, its floor level with the "Trophy of Gaius".
- **22 tomb buildings** unearthed, calculated to have held **around 1000 burials**; inscriptions
  preserve names of individuals from imperial freedmen families.
- The **Trophy of Gaius** — the second-century funerary aedicule over the grave, recorded by the
  priest Gaius and reported by Eusebius — survives in the **Niche of the Pallia** in the Confessio.
  On a fragment of plaster **3.2 × 5.8 cm** from the "red wall" are the Greek letters **PETR[…]
  ENI[…]**, read as *Pétr[os] enì* ("Peter is here") or *Pétr[os] en i[réne]* ("Peter in peace").
- **Access**: by request only. The Fabbrica's page carries "Request a Reservation" rather than a
  booking widget. `www.scavi.va` now serves this same page.
- Sources: `https://www.basilicasanpietro.va/en/san-pietro/the-necropolis`,
  `https://www.basilicasanpietro.va/en/san-pietro/the-tomb-of-saint-peter`,
  `https://www.basilicasanpietro.va/en/products/the-necropolis`
- Photos: []

### 5.B The basilica complex (Fabbrica di San Pietro)

**7. Dome of St Peter's (Cupola di San Pietro) — attraction**
- Coords **41.9021322, 12.4533718**.
- Conceived and built to the drum by **Michelangelo**; completed after his death by **Giacomo della
  Porta** working with **Domenico Fontana from 1588 to 1590**, *"raising the dome in just 22 months
  thanks to the tireless work of 800 labourers"*. Double-shelled with a cavity, ogival, slenderer
  than the initial design.
- **18 November 1593**: the gilded bronze sphere and cross, by **Sebastiano Torrigiani**, placed on
  the lantern spire.
- Inscription on the ring at the end of the lantern, set by **Clement VIII**: *"s. petri gloriae
  sixtvs pp. v. a. mdxc pontif. v"*.
- Mosaic frieze at the base of the dome: *"tv es petrvs et svper hanc petram aedificabo ecclesiam
  meam et tibi dabo claves regni caelorvm"* in blue letters on gold.
- Dome mosaics by numerous mosaicists under **Marcello Provenzale, 1598–1613**; surface **about
  3,000 square metres**, divided by ribs into **sixteen wedge-shaped compartments**.
- ⚠️ **HEIGHT — READ THIS.** The Fabbrica states: *"The inner dome of the lantern reaches a height
  of **117 metres**, while the cross at the top of the dome is **over 133 metres** high."* The figure
  in wide circulation elsewhere is 136.57 m. **Publish the Fabbrica's numbers, attributed.** Do not
  publish 136.57 m — I found no primary source for it — and do not write "the tallest dome"
  or any similar ranking (§8.1).
- **Climb**: with stairs, **231 steps to the basilica terrace, then 320 more to the top, 551 in
  total**. With lift, the lift reaches the terrace level and **320 steps** remain. Both tickets
  include entry to the basilica with the Digital Audio Guide; the basilica entry slot is scheduled
  an hour before or an hour after the dome slot.
- **Hours** (`…/en/opening-hours`): **winter (26 October 2025 – 28 March) 07:30–17:00; summer
  (29 March 2026 – 25 October 2026) 07:00–18:00.**
- **Prices** (booking portal): dome with stairs, including basilica, **from €17**; dome with lift,
  including basilica, **from €22**. Recommended from age 6; under-18s must be accompanied. Not
  wheelchair accessible. No animals. Stroller drop-off under the portico; **no cloakroom service at
  present**. Non-refundable, non-transferable, non-modifiable, no date changes; full refund only
  where the Holy See cancels for a liturgical celebration or event. The inner ring may be closed for
  extraordinary celebrations or organisational reasons.
- Sources: `https://www.basilicasanpietro.va/en/san-pietro/the-dome`,
  `https://www.basilicasanpietro.va/en/products/the-dome`,
  `https://booking.basilicasanpietro.va/en/idea/52251275/-dome-with-stairs-includes-basilica-`,
  `https://booking.basilicasanpietro.va/en/idea/52250633/-dome-with-lift-includes-basilica-`
  (see §7.3 on the operator)
- Photos: []

**8. Vatican Grottoes (Grotte Vaticane) — historic-site**
- ⚠️ **NO COORDINATE.** Nominatim returned empty for "Grotte Vaticane". Verifier to supply or the
  record inherits the basilica's.
- A system of vaults **built between 1590 and 1591** to support the floor of the Renaissance
  building, on the lower level of the basilica; the design descends from a variation Antonio da
  Sangallo the Younger presented to Leo X after Raphael's death in 1520.
- **1592**: Clement VIII Aldobrandini renovated the medieval crypt and named it "Clementine";
  seventeenth-century altar *ad caput Sancti Petri*.
- **1616–1617**: Paul V built two straight corridors to the Confessio and added the Chapels of the
  Salvatorello, of the Madonna of the Bocciata and of the Madonna of the Partorienti, frescoed with
  the peribolos by **Giovan Battista Ricci da Novara**.
- Under **Urban VIII (1623–1644)**, four oratories — St Veronica, St Helen, St Longinus, St Andrew —
  at the base of the dome pillars, designed by **Bernini**, decorated by **Agostino Ciampelli**,
  **Guidobaldi Abbatini** and others, each with a spiral staircase to the basilica.
- Later chapels: **Irish 1954; Polish 1958 and 1982; Lithuanian 1970; Patron Saints of Europe 1981;
  Mexican 1992**; oratory with the tomb of **Pius XII, 1958**. Exits to Largo Braschi (south) and
  Largo San Gregorio l'Illuminatore (north).
- **1979**: a large archway opened in the central part making the front of the Confessio and the
  Niche of the Pallia visible.
- Source: `https://www.basilicasanpietro.va/en/san-pietro/the-vatican-grottoes`
- Photos: []

**9. Treasury Museum of St Peter's Basilica (Museo del Tesoro) — museum**
- ⚠️ **STATUS CONFLICT — the writer must resolve this and the status must agree with the prose.**
  Two Fabbrica pages disagree:
  - `…/en/san-pietro/the-museum`: *"The Museum of the Treasury of the Basilica is open during the
    opening hours of the Basilica."*
  - `…/en/products/the-treasury-museum`: *"Due to the continuation of work on the new layout, the
    Treasure Museum will be temporarily closed."*
  The products page is the operational one and carries a "RESERVATION NOTE"; the same page confirms
  the basilica itself remains open without reservation. **My recommendation: status
  `temporarily-closed`, and prose that says so, sourced to the products page. Do not ship an
  `open` status with closure prose or vice versa.**
- History from the Fabbrica: the Treasury was born with the basilica; dispersed by the Visigoths
  (410), Vandals (455), Ostrogoths (545), Saracens (830, 846), Normans (1084), Landsknechts (1527),
  and requisitioned under the Jacobin occupation (1798–1799); custody entrusted to the **Chapter of
  Saint Peter since the eleventh century**; **first museum arrangement in 1909, of two rooms**; a
  larger transformation from **1949**, the work of the architect **Franco Minissi**, aimed at the
  1975 Jubilee, on the principle of the "protagonism of the objects".
- Source: `https://www.basilicasanpietro.va/en/san-pietro/the-museum`,
  `https://www.basilicasanpietro.va/en/products/the-treasury-museum`
- Photos: []

**10. Pétros ení: Saint Peter's Digital Experience — attraction**
- Immersive exhibition in the **Octagonal Halls**, spaces inside one of the pillars supporting the
  dome, restored by the Fabbrica's artisans and **opened to the public for the first time** for this
  exhibition.
- Two narrative paths: the origins and construction history of the basilica around the tomb of
  Peter, and the life of the apostle to his martyrdom.
- Built on a 3D digitisation of the basilica from **over 400,000 photographs**. Partners named by
  the Fabbrica: **Microsoft, Iconem, DADADA studio & Processoffice**; audiovisual engineering
  Orphéo; music David Chalmin; scenographic installation Manu Kalve. Scientific direction Pietro
  Zander; project coordination Fr Francesco Occhetta; narration Fr Agnello Stoia.
- **Hours**: same as the dome — winter (26 Oct 2025 – 28 March) 07:30–17:00; summer (29 March –
  25 Oct 2026) 07:00–18:00.
- Also sold combined as "Pétros ení + Basilica + Dome with Lift".
- ⚠️ The Fabbrica's own text says "the world's largest Christian basilica". **Cut** (§8.1).
- Source: `https://www.basilicasanpietro.va/en/petros-eni`
- Photos: []

**11. Altar of the Confessio and the Tomb of St Peter — historic-site** *(consider merging into
record 1)*
- The Confessio is the space in front of the main altar from which the tomb can be seen from above.
- Altars built over Constantine's marble casket with, in the Fabbrica's words, notable continuity:
  the altar of **Gregory the Great (590–604)**, the altar of **Callistus II (1123)** and the altar
  of **Clement VIII (1594)**, later covered by Bernini's canopy beneath Michelangelo's dome.
- Sources: `https://www.basilicasanpietro.va/en/san-pietro/the-altar-of-the-confessio`,
  `…/the-tomb-of-saint-peter`
- Photos: []

**12. Cathedra of Saint Peter — historic-site** *(candidate; slim)*
- The *Cathedra Sancti Petri Apostoli*: an ancient wooden throne with ivory plaques showing the
  labours of Hercules and ivory friezes of the **Carolingian age (9th century)**.
- Source: `https://www.basilicasanpietro.va/en/san-pietro`
- Photos: []

**13. Michelangelo's Pietà — historic-site** *(candidate; slim, may fold into record 1)*
- Sculpted **1498**, Michelangelo aged twenty-three, commissioned by the French Cardinal **Jean de
  Bilhères Lagraulas** for his tomb in the Chapel of the King of France, a chapel no longer existing
  that stood on the southern flank of the old basilica.
- ⚠️ The Fabbrica's sentence opens "A sculpture of **superhuman beauty and perfection**". **Cut**
  (§8.1); publish the facts, not the framing.
- Source: `https://www.basilicasanpietro.va/en/san-pietro/the-pieta-of-saint-peter-s`
- Photos: []

**14. Vatican Mosaic Studio (Studio del Mosaico Vaticano) — historic-site**
- Dates from the beginning of the sixteenth century, when **Gregory XIII Boncompagni** entrusted
  **Girolamo Muziano** with the mosaic decoration of the dome of the Gregorian Chapel (**1578–1580**).
- ⚠️ Not established as publicly visitable. Treat as a note on record 1 unless the verifier finds a
  visitor route.
- Source: `https://www.basilicasanpietro.va/en/san-pietro/the-mosaic-studio`
- Photos: []

**15. Historical Archive of the Fabbrica di San Pietro — historic-site** *(research access, not a
tourist site — see §6 for how the two other archives were framed)*
- **Open 15 September to 15 July. Study room accessible Monday to Friday 08:30–12:30.**
- Source: `https://www.basilicasanpietro.va/en/opening-hours`
- Photos: []

**16. Bernini's Colonnade — attraction** *(candidate; probably fold into record 2)*
- Coords **41.9014974, 12.4565858** (Nominatim: "Bernini's Colonnade, Piazza San Pietro, Vatican
  City, 00120, Vatican City"). Figures under record 2.
- Photos: []

**17. Vatican Obelisk — attraction** *(candidate; probably fold into record 2)*
- Coords **41.9022402, 12.4572610**. From the circus of Caligula and Nero; surmounted by a cross.
  The Fabbrica gives no height. **Do not supply one from memory.**
- Photos: []

### 5.C The Museums' collections (each has its own museivaticani.va page)

All are inside the Museums itinerary and covered by the Museums ticket, so hours, prices and access
inherit from record 3. Coordinates where Nominatim resolved them.

**18. Pinacoteca Vaticana — museum.** Coords **41.9057879, 12.4527828**. Building by **Luca
Beltrami** for **Pius XI**, **inaugurated 27 October 1932**, built in the nineteenth-century Square
Garden, isolated and surrounded by avenues for lighting. First collection of **118 paintings** made
by **Pius VI around 1790**, broken up when the **Treaty of Tolentino (1797)** sent works to Paris;
the idea of a public gallery dates from **1817**, after the Congress of Vienna returns. Present
nucleus **460 paintings in eighteen rooms**, arranged by chronology and school from the "Primitives"
(12th–13th century) to the 19th century; artists named: Giotto, Fra Angelico, Melozzo da Forlì,
Perugino, Raphael, Leonardo, Titian, Veronese, Caravaggio, Crespi. ⚠️ the source says "some
masterpieces of the greatest artists" — **cut the ranking, keep the list**.
`…/collezioni/musei/la-pinacoteca/la-pinacoteca.html`

**19. Raphael's Rooms (Stanze di Raffaello) — museum.** Coords **41.9033021, 12.4545356**. Four
rooms on the second floor of the Pontifical Palace, chosen by **Julius II** as his residence and
used by his successors; pictorial decoration by **Raphael and his school, 1508–1524**.
`…/collezioni/musei/stanze-di-raffaello/stanze-di-raffaello.html`

**20. Borgia Apartment — museum.** Six monumental rooms renovated and decorated for **Alexander VI
(1492–1503)**: the Room of the Sibyls and the Room of the Creed in the Borgia Tower; Liberal Arts,
Saints and Mysteries in the wing built by **Nicholas V (1447–1455)** and called "secret rooms" in
the diary of **Johannes Burckhardt**; the Room of the Pontiffs in the oldest wing, built by
**Nicholas III (1277–1280)**. Decoration by **Bernardino di Betto, "Pinturicchio"**, executed
rapidly **between the autumn of 1492 and the beginning of 1494**, with a team including **Piermatteo
d'Amelia, Benedetto Bonfigli, Pietro d'Andrea, Antonio da Viterbo "il Pastura"** and, on recent
attributions, Bartolomeo di Giovanni and Raffaellino del Garbo. Technique: largely dry paint on
plaster and glue rather than true fresco, confirmed by recent restoration. Julius II abandoned the
apartment in 1503 and moved a floor up; **Leo XIII opened it to the public at the end of the 1800s**
after restoration. It now houses part of the Collection of Modern and Contemporary Art. A useful
documentary detail: no contract survives, but a letter of **29 March 1493** from Alexander VI to
Orvieto records Pinturicchio's transfer to the Vatican.
`…/collezioni/musei/appartamento-borgia/appartamento-borgia.html`

**21. Collection of Modern and Contemporary Art — museum.** **Inaugurated 23 June 1973** by **Paul
VI**, following his address to artists in the Sistine Chapel on **7 May 1964**; assembled over about
ten years by his secretary **Msgr Pasquale Macchi**, on a nucleus of nineteenth-century works that
had entered the Pinacoteca in the late 1950s under Pius XII. **Around 8,000 works**; the displayed
selection runs from the Borgia Apartment to the Sistine Chapel. Artists named: Van Gogh, Bacon,
Chagall, Carrà, de Chirico, Manzù, Capogrossi, Fontana, Burri, Matisse. **A Matisse room opened in
2011**, holding works relating to the Vence Chapel that entered the collections in **1980** by gift
of **Pierre Matisse**. `…/collezioni/musei/collezione-d_arte-contemporanea/collezione-d-arte-contemporanea.html`

**22. Gregorian Egyptian Museum — museum.** Coords **41.9063024, 12.4545669**. **Founded 1839 by
Gregory XVI**; **nine rooms** plus a hemicycle opening onto the terrace of the Niche of the Pinecone.
Rooms taken from the apartment of **Pius IV** in the Belvedere Palace of Innocent VIII; first
curated by the Barnabite **Fr Luigi Ungarelli**, a disciple of Ippolito Rosellini, with architectural
and wall decoration evoking the Nile. Strong in material from Roman Egypt and Egyptianising Rome,
including the statuary group from the **Horti Sallustiani** now in the Hemicycle and items from
**Hadrian's Villa at Tivoli**. The final three rooms hold Ancient Near Eastern material acquired in
the **1970s**. `…/collezioni/musei/museo-gregoriano-egizio/museo-gregoriano-egizio.html`

**23. Gregorian Etruscan Museum — museum.** Founded by **Gregory XVI**, **inaugurated 2 February
1837**. Later acquisitions: **Falcioni 1898, Benedetto Guglielmi 1935, Mario Astarita 1967, Giacinto
Guglielmi 1987**. Covers the Iron Age (9th century BC) to convergence with Rome in the 1st century
BC; the *Antiquarium Romanum* section runs to the 5th century AD. Occupies the **Palazzetto del
Belvedere of Innocent VIII Cibo (1484–1492)**, designed by Pollaiolo, and the **apartment of the Tor
dei Venti of Pius IV Medici (1559–1565)**, begun by Michelangelo and Girolamo da Carpi and finished
by Pirro Ligorio. **Bramante's double-helix staircase, begun 1512, is visible from inside the
museum.** Sixteenth-century fresco cycles by **Federico Barocci and Federico Zuccari (1563)** and
**Santi di Tito and Niccolò Circignani delle Pomarance (1564)**.
`…/collezioni/musei/museo-gregoriano-etrusco/museo-gregoriano-etrusco.html`

**24. Pio Clementino Museum — museum.** Coords **41.9065472, 12.4545808**. Nucleus is the collection
of **Julius II (1503–1513)** in the Cortile delle Statue, today the **Octagonal Court**. Named for
**Clement XIV Ganganelli (1769–1774)** and **Pius VI Braschi (1775–1799)**. Neo-classical
architecture under **Alessandro Dori, Michelangelo Simonetti, Giuseppe Camporese**, in and adjacent
to the Belvedere Palace of Innocent VIII (1484–92). Principal works went to Paris under the **Treaty
of Tolentino (1797)** and most were recovered after the **Congress of Vienna (1815)** through the
diplomacy of **Antonio Canova**.
`…/collezioni/musei/museo-pio-clementino/Museo-Pio-Clementino.html`

**25. Gallery of the Geographical Maps — museum.** Coords **41.9045108, 12.4542073**. **120 metres
long and 6 metres wide.** **Forty** cartographic representations of the Italian territories and
Church dominions, wanted by **Gregory XIII**. Built **1578–1580** by **Ottaviano Nonni, "il
Mascherino"**; frescoed in under two years by a large team coordinated by **Girolamo Muziano** and
**Cesare Nebbia**; iconographic programme by the Perugian Dominican **Egnazio Danti**, cosmographer,
astronomer and mathematician. **32 maps** of territories aligned north to south, divided
conceptually by the Apennines; **eight narrower maps** at the ends showing the Siege of Malta, the
Battle of Lepanto, Elba, the Tremiti Islands, and the ports of Civitavecchia, Genoa, Venice and
Ancona. Ceiling: **51 panels** in stucco frames. ⚠️ the page's closing sentence calls the gallery
"revolutionary" and cites a "first time" — a claim of priority; treat with the same caution as a
superlative. `…/collezioni/musei/galleria-carte-geografiche.html`

**26. Ethnological Museum Anima Mundi — museum.** Origin in the **Vatican Missionary Exposition**,
inaugurated **24 December 1924**, closed **9 January 1926**, over **100,000 works** shown in
**twenty-six pavilions**. Pius XI founded the Ethnological Museum on **12 November 1926**, directing
it to **Fr Wilhelm Schmidt SVD (1868–1954)**; the Missionary Ethnological Museum was inaugurated at
**St John Lateran on 21 December 1927** with about **80,000 works**. Enriched from **1928** with
material from the **Museo Borgiano of Propaganda Fide**, some from the collection of **Cardinal
Stefano Borgia (1731–1804)**. **Closed 1 February 1963** after John XXIII assigned the Lateran palace
to the diocese of Rome; collection stored at **Palazzo San Callisto** until a new venue opened inside
the Vatican Museums in **1973** under Paul VI, designed by **Fr Jozef Penkowski SVD (1930–2006)**
with the Passarelli studio. Conservation programme 1996–2009 under **Don Roberto Zagnoli
(1938–2020)**; **Ethnological Materials Laboratory founded 2001**, coordinated by **Stefania
Pandozy** to 2023, then **Catherine Rivière**. Asia section part-opened for the Museums' fifth
centenary (**1506–2006**). Redisplayed 2009–2023 under **Fr Nicola Mapelli**; *The Way of the Sea*
permanent display **2010**; **Anima Mundi** opened **2019** with *Mater Amazonia* and the Oceania
area; Americas and Africa completed **2022**. Curator since **August 2024: Nadia Fiussello**. The
collection now numbers **over 80,000 artefacts**. ⚠️ Nominatim returned empty for this museum;
inherit record 3's coordinate or have the verifier supply one.
`…/collezioni/musei/museo-etnologico/museo-etnologico.html`

**27. Chiaramonti Museum, the New Wing (Braccio Nuovo) and the Lapidary Gallery — museum**
*(grouped)*. Chiaramonti is set out in the long loggia joining the Belvedere palace to the Vatican
palaces and is named for **Pius VII** (Chiaramonti); the New Wing was built when the works
confiscated by Napoleon returned from France and the pontifical collections were re-ordered.
Highlights the Museums themselves name: *Heracles with the infant Telephos*, *Gradiva*, the
*Augustus of Prima Porta*, the *Nile*, the *Peacocks*. ⚠️ I read the index abstracts, not the full
"Read All" pages, for these three; the writer should fetch
`…/collezioni/musei/museo-chiaramonti.html` and `…/braccio-nuovo.html` before writing more than the
above.

**28. Gregoriano Profano Museum — museum.** **Founded in the Lateran Apostolic Palace by Gregory XVI
Cappellari on 16 May 1844.** Works the Museums name on the page: marble from the Parthenon, *Athena
and Marsyas*, the *Asàrotos òikos* mosaic, the Chiaramonti Niobid, Julius Caesar, the reliefs from
the **Palazzo della Cancelleria** (note: the palace itself is an Art. 15 property in rione Parione
and is already published there — do not claim it), the **Mausoleum of the Haterii**, a mosaic from
the Baths of Caracalla. `…/collezioni/musei/museo-gregoriano-profano.html`

**29. Pius-Christian Museum (Museo Pio Cristiano) — museum.** **Founded 1854 by Pius IX in the
Lateran Palace** to hold evidence of the Christian communities of the first centuries. Named
holdings: the *Good Shepherd and Jonah*, strigilated sarcophagi, continuous-frieze sarcophagi, the
mosaics of Ciriaca, double-register and column sarcophagi, a *Nativity–Epiphany*.
`…/collezioni/musei/museo-pio-cristiano.html`

**30. Jewish Lapidarium (Lapidario Ebraico) — museum.** A collection of ancient inscriptions
transferred from the Lateran Palace. Named inscriptions: Primitiva, Salutia, Ioustos, Ioudas,
Regina. ⚠️ index abstract says "one of the most important Vatican collections" — **cut the
ranking**. `…/collezioni/musei/lapidario-ebraico.html`

**31. Gallery of the Tapestries — museum.** Originally in two sections; the present gallery was
formed **between 1788 and 1789** under **Pius VI Braschi**. Series named: the *Life of Christ* (New
School) and the *Life of Urban VIII Barberini*. `…/collezioni/musei/galleria-arazzi.html`

**32. Carriage Pavilion (Padiglione delle Carrozze) — museum.** **Inaugurated 19 April 1973 by Paul
VI.** Core is the **Grand Gala Berlin, built in Rome in 1826**. Also listed by the Museums: the
Berlin of Cardinal Luciano Luigi Bonaparte, a gala Berlin with throne, the travelling carriage of
Ferdinand II, a landau, the sedan chairs of Leo XIII and John XXIII, a Graham Paige Type 837, a
Citroën Lictoria C6, a Mercedes-Benz 460 Nürburg limousine, a Mercedes-Benz 300 SEL limousine, a
Fiat 1107 Nuova Campagnola, papamobiles, a Volkswagen Type 1 Beetle, a Renault 4, and the steering
wheel of a Ferrari Formula 1 MT 867/B. `…/collezioni/musei/padiglione-delle-carozze.html`

**33. Niccoline Chapel (Cappella Niccolina) — historic-site.** In the heart of the Apostolic Palace,
near Raphael's loggias. Named for **Nicholas V (Tommaso Parentucelli, 1447–1455)**, who had it built
in the top two floors of a tower raised under Innocent III. Decorated by **Fra Angelico**, dated by
two payments of **February and March 1448**; two registers running the perimeter with the lives of
**St Stephen and St Lawrence**; ceiling in four sail sections with the Four Evangelists, and eight
Doctors of the Church in niches on the framing arches. Restored 1995–1996 per the Museums' history
timeline. ⚠️ "is one of the great works" / "probably the peak" — **soften or cut; that is ranking
prose**. `…/collezioni/musei/cappella-niccolina.html`

**34. Necropolis of the Via Triumphalis — historic-site.** Coords **41.9056115, 12.4558767**.
A Roman burial ground on the terraced slopes beside the stretch of the Via Triumphalis nearest the
city, bordering the Vatican Hill; collective and individual tombs along paths and squares, many with
inscribed funerary stelae naming the deceased, largely from the middle and lower ranks of imperial
Roman society. **Sold as a separate ticket category by the Museums.** ⚠️ **Seasonal closure**: the
Museums' "Temporary and extraordinary closures" table lists **NECROPOLIS OF THE VIA TRIUMPHALIS,
15 July – 3 September**. Reflect that in the record. ⚠️ "an outstanding example" and "a unique
archaeological site" — **cut both**. **Do not confuse this with record 6**: this is a different
necropolis in a different part of the state, run by the Museums, not by the Fabbrica.
`…/patrimonio-naturale-archeologico/aree-archeologiche/necropoli-della-via-triumphalis/necropoli-della-via-triumphalis.html`

**35. Bramante's double-helix staircase — attraction** *(candidate; slim, and probably a note on
record 23)*. **Begun 1512**, in the Belvedere; the Museums say it is visible from inside the
Gregorian Etruscan Museum. `…/collezioni/musei/museo-gregoriano-etrusco/museo-gregoriano-etrusco.html`

### 5.D State institutions

**36. Vatican Apostolic Library (Biblioteca Apostolica Vaticana) — historic-site**
- Coords **41.9047482, 12.4549566**. Address as the Library gives it: **Cortile Belvedere, 00120
  Città del Vaticano**. Contact `bav@vatlib.it`.
- **Holdings, from the Library's own Mission/About page**: approximately **180,000 manuscripts and
  archival documents**; around **2,000,000 printed books**; about **8,300 incunabula**;
  approximately **300,000 coins and medals**; over **100,000 graphic works** (prints, drawings,
  engraved plates); more than **150,000 photographs**.
- **Mission**: specialises in philological and historical disciplines and, more broadly, theological,
  legal and scientific fields; dedicated to scholarly research on the direct study of manuscripts,
  printed books, coins and medals, prints, and graphic and cartographic materials. *"By papal
  decree, the Library is open to qualified scholars and researchers, regardless of religion, origin,
  or cultural background."*
- **Reading rooms open Monday to Friday, 09:00–17:20.**
- **Admission** is to: researchers and scholars with appropriate qualifications and/or relevant
  scientific publications; teachers and researchers at universities and other institutes of higher
  education; graduates pursuing doctoral research; and, exceptionally, undergraduates who can show
  they need material available only here.
- **The visitor headline, and the reason this belongs on the page at all**: *"The Library does not
  offer regular public visits. However, access to its historic and monumental spaces may be granted
  on an occasional basis in conjunction with special events and institutional initiatives."*
  That is the honest answer to "can I go in?" and it comes from the Library.
- **Foundation**: UNESCO's description states *"In 1475, Sixtus IV founded the Vatican Library"*.
  Attribute to UNESCO, or better, take it from the Library's own History pages, which I located but
  did not fetch in full (`…/en/the-library/history-of-BAV.html`, HTTP 200).
- ⚠️ The Library site carries an extensive photographic-reproduction ordering system. **Do not go
  near it.** §8.2.
- Sources: `https://www.vaticanlibrary.va/en/the-library/about-us.html`,
  `…/en/information-for-readers/admission-criteria.html`, `…/en/visit-the-bav.html`
- Photos: []

**37. Vatican Apostolic Archive (Archivio Apostolico Vaticano) — historic-site**
- ⚠️ **NO COORDINATE.** Nominatim returned empty. The Archive's own pages place its rooms along the
  **braccio di Pio IV of the Apostolic Palace, adjacent to the Salone Sistino of the Vatican
  Museums**, on the Piano Nobile.
- **History, from the Archive's own timeline** (Italian): **1611**, Paul V creates the *Novum
  Archivum* in the Apostolic Palace, concentrating registers from the Vatican Library, the Camera
  Apostolica and the Archive of Castel Sant'Angelo in the Sala Paolina; **31 January 1612**, Paul V
  appoints **Baldassarre Ansidei** custodian and the Archive's history formally begins; **1613–1614**
  the material moves to the three Piano Nobile rooms; **23 July 1630**, Urban VIII establishes its
  autonomy from the Library; **1646**, the name *Archivio Segreto Vaticano* appears for the first
  time in a general index by the prefect Costanzo Centofiorini; **1660**, Alexander VII assigns the
  floor above for the Secretariat of State archive; **1798**, the Castel Sant'Angelo archive is moved
  in **through the Passetto di Borgo** (the Passetto is published by rione Borgo — do not claim it);
  **1810**, Napoleon confiscates the papal archives, about **3,239 crates** leaving Rome, with heavy
  losses on the return; **1881, Leo XIII opens the Archive to scholars of every country and
  religion**; **18 October** (John Paul II) inaugurates the *Bunker* depositories beneath the
  Cortile della Pigna of the Vatican Museums, on two floors, capacity **31,000 cubic metres**, with
  **43 linear kilometres of shelving**; **22 October 2019**, by the motu proprio *L'esperienza
  storica*, Francis replaces the title *Archivio Segreto Vaticano* with the older name **Archivio
  Apostolico Vaticano**.
  ⚠️ The bunker entry gives day and month but the year is not on the line I captured. **Do not
  publish a year for it** unless the writer re-reads the page.
- **Holdings**: over **600 fondi**, described by the Archive as the concentration archive of the Holy
  See, grouped as curial offices, over **75** pontifical diplomatic representations from the early
  16th to the 20th century, family and personal archives (Boncompagni-Ludovisi, Borghese, Della
  Valle-Del Bufalo, Patrizi-Montoro, Ruspoli-Marescotti, Rospigliosi; Fondo Albani, Carpegna, Pio),
  councils and synods (complete archives of Vatican I and Vatican II, a large part of Trent),
  religious orders and archconfraternities, and miscellaneous collections.
- **Access**: *"La ricerca nell'Archivio Apostolico Vaticano è gratuita e aperta a studiosi
  qualificati"* — research is free of charge and open to qualified scholars with a *laurea
  magistrale* or equivalent (for clergy, a licentiate or doctorate). **Consultation is currently
  permitted for documents up to and including the pontificate of Pius XII (October 1958).**
- **Hours**: open to scholars **Monday–Tuesday 08:00–16:15, Wednesday–Friday 08:00–12:45**;
  admission cards issued by the Segreteria Accettazioni **Monday and Tuesday 08:00–12:00, Wednesday
  to Friday 08:00–10:30**.
- **Study-room rules the Archive publishes**: no bags, briefcases or laptop cases; no ballpoint or
  fountain pens or markers; **no cameras, portable scanners or wearable tech with lenses or
  recording sensors, including smart glasses and digital watches**; no food or drink; phones may be
  kept on silent but used only outdoors in the courtyard; sober dress required, including in summer;
  absolute silence in the study rooms. These are conduct rules and are publishable as such — they
  are not a rights or reproduction policy.
- Sources: `https://www.archivioapostolicovaticano.va/content/aav/it/l-archivio/note-storiche.html`,
  `…/it/patrimonio.html`, `…/it/consultazione/accesso-e-consultazione.html`,
  `…/it/consultazione/giorni-e-orari-di-apertura.html`
- Photos: []

**38. Palace of the Governorate (Palazzo del Governatorato) — historic-site**
- Coords **41.9023168, 12.4512436** (Nominatim: "Governorate's Palace, 29, Governorat's Square,
  Vatican City, 00120, Vatican City"). Stands in the Gardens.
- ⚠️ **Handle with care.** The Governorate's own page about itself quotes its constituting law and
  enumerates its powers. **That is legal and jurisdictional material and is out of scope** — see
  §8.3. What is safely publishable at this altitude is institutional and factual: the Governorate is
  the body through which the state's services are run, and the Directorate of Museums and Cultural
  Heritage — the body that runs the Vatican Museums — sits under it. Everything past that,
  including the name and number of the governing law, the form of government and the distribution of
  powers, **do not publish**.
- ⚠️ Not established as publicly visitable. Unless the verifier finds a visitor route, this may be
  better as context in the zone's own copy than as a place record.
- Source: `https://www.vaticanstate.va/en/state-and-government/structure-of-the-government/governatorate.html`
- Photos: []

**39. Casina Pio IV — historic-site**
- Coords **41.9041449, 12.4525405**. Built by **Pirro Ligorio (1512/13–1583)** for **Pius IV Medici
  di Marignano (1559–1565)**, by **1565**, in the Gardens not far from the Apostolic Palace; named
  for that pope.
- ⚠️ Its present occupant (the Pontifical Academy of Sciences) is not sourced from anything I
  fetched. **Do not state it without a source.** As a garden feature it is already covered by
  record 5's "Casina of Pius IV" itinerary stop; a standalone record needs its own visitor evidence.
- Source: `…/patrimonio-naturale-archeologico/giardini/presentazione-giardini/giardini.html`
- Photos: []

**40. Vatican Pharmacy (Farmacia Vaticana) — shop**
- Coords **41.9047726, 12.4561991** (Nominatim: "Vatican Pharmacy, Post Street, Vatican City, 00120,
  Vatican City"). The Governorate's news feed carries a 2026 item announcing a new pharmacy website.
- ⚠️ **WEAK.** I have a coordinate and a passing news mention, no hours, no access conditions, no
  statement of whether visitors may use it. **Do not ship without more.**
- Photos: []

**41. Vatican Post (Poste Vaticane) — shop**
- Nominatim returned empty for the St Peter's Square office. The Museums confirm **a branch of the
  Vatican Post inside the Vatican Museums**, where payments and ordinary transactions can be made.
- ⚠️ **WEAK as a standalone record.** Better as a service note on record 3 unless the verifier can
  source the square office directly.
- Source: `…/en/organizza-visita/consigli-utili.html`
- Photos: []

### 5.E Non-place records (tours, sights, FAQ material)

- **Papal audiences and papal liturgical celebrations.** From the Holy See:
  *"Please note that tickets for the General Audiences and the Holy Father's Liturgical Celebrations
  are always free of charge."* Lay faithful request tickets from the **Prefecture of the Papal
  Household** at `https://eventi.pontificalisdomus.va/?lang=en-en`; bishops, priests and deacons use
  the **Office for the Liturgical Celebrations of the Supreme Pontiff** at
  `https://biglietti.liturgiepontificie.va/en/`. Source:
  `https://www.vatican.va/content/vatican/en/prenotazione-celebrazioni-udienze.html`.
  ⚠️ **GAP, and an important one.** I could not source the **day, time or venue** of the general
  audience from any primary page I reached — both booking sites are login-gated SPAs with no public
  prose. **Do not supply "Wednesday morning" from general knowledge.** Publish only the free-ticket
  fact and the two request routes, or leave it to a later pass.
- **Masses in St Peter's Basilica.** Weekdays: 07:00, 07:30 (Altar of St Joseph), 08:30 in the
  Chapel of the Blessed Sacrament followed by Eucharistic Adoration until 18:45, 09:00, 10:00 (Altar
  of St Joseph), 11:00, 12:00, 17:00, 18:00 (Altar of the Cathedra). Holidays: 07:00, 08:00 (St
  Joseph), 09:00 (Cathedra), 09:45 Chapter Lauds in the Choir Chapel, 10:30 Chapter Mass, 12:30,
  16:00, 17:00 Chapter Vespers, 17:00 and 18:00 Mass (Cathedra). Source:
  `https://www.basilicasanpietro.va/en/holy-masses`.
- **Sacrament of Reconciliation in the basilica**: Monday to Saturday 07:00–12:30 and 16:00–19:00;
  Sunday 07:00–13:00 and 16:00–19:00. Continuous Eucharistic Adoration in the Chapel of the Blessed
  Sacrament from the end of the 08:30 Mass, Monday to Saturday, to the Benediction at day's end.
  Source: `https://www.basilicasanpietro.va/en/opening-hours`.
- **Guided tours of the basilica**: with a guide provided by the Fabbrica or with your own,
  **Monday to Saturday 09:30–17:30 (last registration 17:00)**; **Sundays and Vatican holidays
  13:30–15:30 (last registration 15:00)**. A themed tour, *"Bernini and the Barberini in St Peter's
  Basilica"*, covers the works made in the basilica during the pontificate of Urban VIII. Source:
  `https://www.basilicasanpietro.va/en/opening-hours`, `…/en/products/bernini-and-the-barberini-in-st-peter-s-basilica`.
- **Dedicated access for worshippers and celebrants**: a reserved path with identification at an
  indicated entrance gate, staff accompaniment to prayer and celebration and then to the exit;
  anyone wanting to sightsee afterwards re-enters through the standard entrances. Source:
  `https://www.basilicasanpietro.va/en/opening-hours`.
- **Papal Palace and Secret Garden of Castel Gandolfo**, full ticket **€12.00**, family tariff,
  on-site purchase only, contact `polomusealecastelgandolfo@scv.va`. **Sourced but NOT this zone's**
  — Castel Gandolfo is in the Alban Hills, not in Rome and not in Vatican City. See §6.

---

## 6. Explicit exclusions — what is NOT this page's, and why

**6.1 The Lateran Treaty Art. 15 extraterritorial properties.** A **third legal tier**. Art. 15 says
in terms that they form **part of the territory of the Italian State** (§2.3) and grants only the
immunities of diplomatic premises. Visitors there are on Italian soil. Each is **already published**
by the Roman zone it physically stands in, and I have confirmed each against
`.superpowers/taken_slugs.py`:

| Property | Published by | Slug |
| --- | --- | --- |
| Basilica di San Giovanni in Laterano | **monti** | `basilica-di-san-giovanni-in-laterano-rome` |
| Palazzo del Laterano | **monti** | `palazzo-del-laterano-rome` |
| Museo storico vaticano (in the Lateran Palace) | **monti** | `museo-storico-vaticano-rome` |
| Basilica di Santa Maria Maggiore | **monti** | `basilica-di-santa-maria-maggiore-rome` |
| Basilica papale di San Paolo fuori le Mura | **ostiense** | `ostiense-basilica-san-paolo-fuori-le-mura-rome` |
| Palazzo della Cancelleria | **parione** | `palazzo-della-cancelleria-parione-rome` |
| Palazzo di Propaganda Fide | **colonna** | `palazzo-di-propaganda-fide-colonna` |
| Museo Missionario di Propaganda Fide | **colonna** | `museo-missionario-di-propaganda-fide-colonna` |
| Palazzo del Sant'Uffizio | **borgo** | `palazzo-del-sant-uffizio-borgo-rome` |
| Palazzo dei Convertendi | **borgo** | `palazzo-dei-convertendi-borgo-rome` |

**Do not claim any of them. Do not describe any of them as being in the Vatican.** San Paolo fuori
le Mura is the case that proves the rule: it sits in Q.X Ostiense, two kilometres outside the walls,
and it is Ostiense's.

**6.2 The Art. 16 properties.** Gregorian University, Biblical Institute, Oriental Institute,
Archaeological Institute, Russian Seminary, Lombard College, the two Sant'Apollinare palaces, the
clergy retreat house at Santi Giovanni e Paolo. **Tax exemption and protection from expropriation
only. Never call these extraterritorial.**

**6.3 Castel Gandolfo, the Papal Villas and the Vatican Observatory.** Sourced and interesting —
the Museums sell a **€12.00** ticket to the Papal Palace and Secret Garden, and the Governorate runs
a Directorate of the Pontifical Villas and lists the Observatory — but Castel Gandolfo is in the
Alban Hills, outside Rome entirely, and outside this programme's thirty-one zones. **Out of scope.**

**6.4 Buildings on the Governorate's own "extraterritorial areas" sentence.** The Geography page
says Holy See bodies are housed in properties in **Piazza Pio XII, Via della Conciliazione, Piazza
San Callisto, Piazza della Cancelleria and Piazza di Spagna**. Piazza Pio XII and Via della
Conciliazione are **rione Borgo's** and already published there (`piazza-pio-xii-borgo-rome`,
`via-della-conciliazione-borgo-rome`). Piazza San Callisto is Trastevere's territory. Do not claim
them here.

**6.5 The Sala dei Capitani, Palazzo dei Conservatori.** Named by the Governorate's Gardens page as
holding the Nicholas III inscription — but the Palazzo dei Conservatori is **campitelli's**
(`palazzo-dei-conservatori-campidoglio`). Mention the inscription if you like; do not claim the
room.

**6.6 The Passetto di Borgo.** Named by the Archive's timeline as the route by which the Castel
Sant'Angelo archive was moved in 1798. It is **borgo's** (`passetto-di-borgo-rome`), and Borgo's own
finder already flagged it as a straddler with Vatican City. Not mine to resolve.

---

## 7. Source-quality notes the writer must carry forward

**7.1 The basilica's opening hours have no end date.** The Fabbrica publishes *"From june 1st: from
7.00 am to 8:00 pm"*. There is no closing date for that regime and no separate winter line, unlike
the dome, which has explicit winter and summer ranges. **Publish it as the Fabbrica states it,
attributed, or publish nothing.** Do not invent a winter equivalent.

**7.2 The dome and Pétros ení hours are dated ranges that expire.** Winter is given as 26 October
2025 – 28 March; summer as 29 March 2026 – 25 October 2026. Those will go stale. Publish them with
their dates attached so a reader can tell.

**7.3 The Fabbrica's booking portal is run by a third party.** `booking.basilicasanpietro.va`
carries the footer *"Basilica di San Pietro operated by HIVE s.r.l. Via E. Conti, n. 7 42020 San
Polo D'Enza (RE) P. IVA 02893710356 … Licenza n. 32657 del 26.01.2023"*. The prices and step counts
in record 7 come from that portal. It is linked from the Fabbrica's own product pages, so it is the
official channel, but it is a commercial operator's page and the "About the area" boilerplate on it
is generic marketing copy with superlatives — **do not quote that block for anything**.

**7.4 Two address systems collide, and the ruling settles it.** The Museums publish their address as
**"Viale Vaticano, 00165 Rome"** — an Italian postcode — while the Library, the Fabbrica and
Nominatim all use **00120 Città del Vaticano**. Both are real. **The ruling is not affected**: every
record on this page carries `"state": "Vatican City"`, `"county": "Vatican City"` and emits
`addressCountry` **VA**, whatever postcode appears in the address string. If quoting the Museums'
address line, quote it as they write it and let the state/county fields do their job. And again: the
country code is **VA**; **V** is the vehicle code, not the country code.

**7.5 No designation claims for individual buildings.** Per `evidence_ruling`. The only
designation-shaped fact this page may state is the **property-level UNESCO inscription of Vatican
City (1984, criteria (i)(ii)(iv)(vi), 44 ha, dossier 286)** and, if wanted, the Governorate's
statement that the whole territory falls under the 1954 Hague Convention. Neither may be pushed down
onto a building.

**7.6 Nominatim is an aggregator.** Cite it as such where a coordinate rests on it, and never let it
speak to territory. §9.1 is the proof of why.

---

## 8. Quarantine — sourced, and NOT to be published

### 8.1 Superlatives and rankings met, by source, so the writer can recognise them

| Phrase | Where it came from |
| --- | --- |
| "the largest religious building in the world" | UNESCO short description, `whc.unesco.org/en/list/286` |
| "one of the most sacred places in Christendom" | UNESCO short description and Brief Synthesis |
| "the smallest independent State in the world, both in terms of population and territory" | Governorate, `…/history/vatican-city-today.html` |
| "the world's largest Christian basilica" | Fabbrica, `…/en/petros-eni` |
| "the largest basilica in the west" (of Constantine's) | Fabbrica, `…/en/san-pietro/the-necropolis` |
| "forms of incomparable beauty" | John Paul II homily, 8 April 1994, quoted by the Museums on the Sistine Chapel page |
| "A sculpture of superhuman beauty and perfection" | Fabbrica, `…/en/san-pietro/the-pieta-of-saint-peter-s` |
| "some masterpieces of the greatest artists of the history of Italian painting" | Museums, Pinacoteca |
| "one of the most important Vatican collections of ancient inscriptions" | Museums, Jewish Lapidarium |
| "one of the oldest choirs in the Catholic Church" | Fabbrica, Cappella Musicale Giulia |
| "an outstanding example" / "a unique archaeological site" | Museums, Necropolis of the Via Triumphalis |
| "one of the great works of fifteenth-century Italy" / "probably the peak" | Museums, Niccoline Chapel |
| "revolutionary … for the first time" | Museums, Gallery of the Geographical Maps |
| "spectacular view", "unique perspective", "unmissable" | Fabbrica dome product pages and the HIVE booking portal |

**Every one is unpublishable, attributed or not.** The measurements are the replacement: 196 × 149
metres, 284 columns, 140 statues, 117 metres, over 133 metres, 3,000 square metres, 551 steps,
44 hectares, 22 hectares, 460 paintings, 180,000 manuscripts. Those are the sentences that publish.

### 8.2 Reproduction, rights and permissions — DO NOT PUBLISH

Vatican law was never researched and this page will not be the first to guess. All of the following
were found, and all are **out of scope**:

- The **Vatican Museums' photography policy** on `…/en/organizza-visita/consigli-utili.html` —
  what may be photographed, where flash and tripods and selfie sticks stand, the Sistine Chapel
  prohibition, and the staff's authority over material produced in contravention. **Do not publish
  any of it.** The neighbouring *conduct* rules on the same page — dress code, cloakroom, animals,
  food and drink, silence, laser pointers, security screening — are operational and are fine.
- The Museums' **drawing-permission** paragraph (authorisation from the Directorate of Museums and
  Cultural Heritage; the pencil-only rule; the Rome Academy of Fine Arts agreement). **Do not
  publish.**
- The **Vatican Apostolic Library's** photographic-reproduction ordering system, including the
  private-study and professional-use routes and its copyright notice. **Do not publish.**
- The **Archivio Apostolico Vaticano's** *Fotoriproduzioni* page. Not opened, not to be published.
  (Its study-room *conduct* rules, listed in record 37, are a different thing and are fine.)
- **Anything at all** about what is permitted inside the state, who may authorise what, or what law
  applies to it.

### 8.3 Vatican law and jurisdiction — DO NOT PUBLISH

Found and quarantined:

- The Governorate's statement that the form of government is an absolute monarchy and that the
  Supreme Pontiff holds full legislative, executive and judicial power, with the *sede vacante*
  arrangements (`…/history/vatican-city-today.html`).
- The **Law on the Governance of Vatican City State, No. CCLXXIV of 25 November 2018**, quoted at
  length on the Governorate page, with its enumerated competences.
- The Governorate's entire "Legislation and regulations" tree. Not opened.
- Treaty **Arts. 1, 9, 21, 22, 23** — state religion, citizenship, cardinals' status, criminal
  cooperation, enforcement of judgments.
- The Fabbrica's Vicariate page (`…/en/san-pietro/the-vicariate`), which quotes the constitution
  *Ex Lateranensi pacto* of 30 May 1929 and John Paul II's chirograph of 14 January 1991 on
  jurisdiction over Vatican City, the Pontifical Villas and the Lateran Palace. **Rich, and
  entirely off limits.** The one fact from that page that is safely institutional rather than
  juridical: on **20 February 2021** Francis appointed **Cardinal Mauro Gambetti OFM Conv.** as
  Vicar General for Vatican City State, and he is the Archpriest of the Vatican Basilica — the
  Fabbrica gives his address for choir requests on the Holy Masses page.

---

## 9. Straddlers and unresolved questions — for the arbitrator, not for me

**9.1 Paul VI Audience Hall (Aula Paolo VI) — DO NOT CLAIM WITHOUT ADJUDICATION.**

Nominatim resolves "Aula Paolo VI Vaticano" to **41.9006765, 12.4548026** and returns
`"Paul VI Audience Hall, Via Tunica, Borgo, Municipio Roma I, Rome, Roma…"` — i.e. **OpenStreetMap
places it in rione Borgo, in Italy.** No shipped Rome file claims it (checked by name across all
thirty `priv/seed_data/rome/*.json`), so the slug is free. But:

- Nominatim/OSM is an **aggregator with no authority over territory**. Borgo's own finder recorded
  that OSM gets the Ricciolo d'Italia wrong; this may be the same class of error, or it may not be.
- The **only** authority on where the hall stands is the Annex I 1:5000 plan, which gives no verbal
  description. I cannot read a 1:5000 map from a URL, and neither can the writer.
- Deciding this would require me to state where Vatican territory begins, which the roster forbids.

**Recommendation: do not ship a place record for the Aula Paolo VI on this page.** If the arbitrator
wants it, it needs a source better than OSM. The audience *material* in §5.E is safe because it makes
no territorial claim at all.

**9.2 The line across St Peter's Square.** §3. Three descriptions, two materials, no Treaty text.
For the arbitrator if the page wants to say anything about it beyond "a line is marked on the
ground".

**9.3 The Ricciolo d'Italia's length.** §3.1. The roster says 60 m; my only source says about 70 m.
**Publish neither.**

**9.4 Grouping of the Museums' departments.** Records 18–35 are twenty-odd separately-published
collections inside one museum with one ticket and one set of hours. Whether they ship as one record
with a long summary, or as individual `museum` records inheriting record 3's access, is a shape
decision for the writer, not an evidence question. My material supports either.

---

## 10. Summary count

**41 place candidates** drafted (records 1–41), of which:

- **6** are the names the gate reserves to this zone and no other file carries (records 1–6)
- **11** are the basilica complex under the Fabbrica di San Pietro (7–17), four of them flagged as
  probable merges into records 1 or 2
- **18** are the Museums' published collections and archaeological areas (18–35)
- **6** are state institutions (36–41), of which **3 are flagged weak or unvisitable** (39 Casina
  Pio IV, 40 Vatican Pharmacy, 41 Vatican Post)

Plus **6 non-place records** in §5.E, **1 flagged straddler** in §9.1, and **6 exclusion families**
in §6.

Sourcing split: **everything material came from primary publishers** — vatican.va, vaticanstate.va,
museivaticani.va, basilicasanpietro.va, vaticanlibrary.va, archivioapostolicovaticano.va, plus
whc.unesco.org for the inscription. **Two aggregators only**: it.wikipedia for the Ricciolo d'Italia
(§3.1, attributed, and only for a fact the roster expressly permits if sourced), and Nominatim for
coordinates (§7.6). No commercial guidebook, tour reseller or listings site was used as a fact
source at any point.
