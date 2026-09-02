# Rome scope research — Angle 2: everything outside the walls (quartieri, suburbi, zone)

Research wave input for the Rome programme spec. **Not a decision.** Evidence and disagreements only.

---

## 0. Method, and what bit me

**Tooling notes for whoever re-checks this.**

- The session's `WebSearch` budget was intact but I barely used it; almost everything here was fetched
  directly by URL. `WebFetch` was unavailable for the first ~5 minutes of the session (classifier
  outage: *"claude-sonnet-5[1m] is temporarily unavailable, so auto mode cannot determine the safety
  of WebFetch"*), and `Bash` was blocked for the same reason. Both recovered.
- `it.wikipedia.org` rate-limited me hard (HTTP 429) on rapid sequential `action=parse` calls. The
  working pattern was the **batched** MediaWiki query API — `action=query&prop=revisions&rvslots=main&rvprop=content&titles=A|B|C…`
  (≤50 titles/request), with an 8-second sleep between batches and exponential backoff on failure.
  I pulled **94 article wikitexts** this way and worked from the raw wikitext, not from rendered HTML.
- `https://www.ostiaantica.beniculturali.it/` — the official Parco archeologico site — **would not
  resolve for me at all**. `WebFetch` returned `connect ECONNREFUSED 2.42.229.14:443` and direct
  `urllib` calls timed out. That IP is an Italian consumer-ISP block, i.e. a DNS/geo problem on this
  side, not a dead site. **Everything I say about the Parco below is therefore second-hand** (Wikipedia
  citing the official site) and a verifier with working access should re-check the address and the
  comune boundaries directly.
- `https://whc.unesco.org/en/list/1708/` returned **HTTP 403** to `WebFetch`. The Via Appia UNESCO
  claim below rests on it.wikipedia's account, not on the UNESCO listing itself.
- Working files (scratch, not deliverables) are in
  `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/a2q/`.

**Verified vs inferred.** I mark every claim. VERIFIED = I read it in the cited source's own words.
INFERRED = I reasoned from verified facts and say so. UNCONFIRMED = I tried and failed.

---

## 1. The authoritative lists, the designating body, and the dates

### 1.1 The primary source is Roma Capitale's own statistics office, not Wikipedia

I found and downloaded two Roma Capitale PDFs and extracted their text. These are the authoritative
lists, and they settle the counts.

**Source A — `Elenco suddivisioni territoriali toponomastiche`, Roma Capitale, Ufficio di Statistica**
`https://www.comune.roma.it/web-resources/cms/documents/ElencoSuddivisioniToponomastiche_rg_A.pdf`
(fetched successfully, 403,251 bytes, text extracted). It is a four-column table: `Sudd. Topon. |
Denominazione | Superficie Ha`, grouped under the headings **`Rioni`**, **`Quartieri urbani`**,
**`Quartieri marini`**, **`Suburbi`**, **`Zone dell'agro romano`**.

**Source B — `Roma Capitale – Territorio`, Roma Capitale, Ufficio di Statistica**
`https://www.comune.roma.it/web-resources/cms/documents/Territorio_RC.pdf`
(fetched successfully, 1,871,730 bytes). Its subdivision slide states, verbatim:

> «116 Suddivisioni Toponomastiche che costituiscono la ripartizione storica della città, di cui
> 22 rioni, 35 quartieri urbani e marini, 6 suburbi, 53 zone dell'Agro romano»
>
> *"116 toponymic subdivisions which constitute the historic partition of the city, of which
> 22 rioni, 35 urban and marine quartieri, 6 suburbi, 53 zones of the Agro romano."*

and names its own source line, verbatim:

> «Fonte: Dipartimento Attività culturali - Direzione Spettacolo, Archivio Storico Capitolino e
> Toponomastica»
>
> *"Source: Department of Cultural Activities – Directorate for Performing Arts, Capitoline Historical
> Archive and Toponymy."*

**VERIFIED. The designating body today is Roma Capitale itself — specifically the *Direzione
Spettacolo, Archivio Storico Capitolino e Toponomastica* within the Dipartimento Attività culturali,
advised historically by a *Commissione Consultiva di Toponomastica*.** The subdivisions are created
and renamed by council/governor/commissioner *deliberazioni*, not by any national body.

### 1.2 ⚠️ CORRECTION TO THE BRIEF: there are 53 zone, not 59

The brief says "59 *zone* in the Agro Romano." **59 is the 1961 figure. The current figure is 53.**

Source B carries this footnote verbatim under the zone table:

> «* escluse le zone con i codici 436, 437, 438, 442, 446, 447 e 441, 443, 445 parte, che appartengono
> al Comune di Fiumicino.»
>
> *"* excluding the zones with codes 436, 437, 438, 442, 446, 447 and parts of 441, 443, 445, which
> belong to the Comune di Fiumicino."*

Six zone left Rome entirely when Fiumicino was constituted as its own comune, and three more were
partially cut. I counted the codes actually present in Source A's zone table: 401–435 (35 entries)
plus 439, 440, 441, 443, 444, 445, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459
(18 entries) = **53**. VERIFIED by direct count against the official PDF, and independently
consistent with Source B's own headline "53 zone dell'Agro romano".

The six suppressed ones (per `it.wikipedia.org/wiki/Zone_di_Roma`, which cites *Deliberazione del
Commissario Straordinario nº 1529 dell'8 settembre 1993*) were Z.XXXVI Isola Sacra, Z.XXXVII
Fiumicino, Z.XXXVIII Fregene, Z.XLII Maccarese Sud, Z.XLVI Torrimpietra, Z.XLVII Palidoro. The
enabling law is cited as *Legge regionale nº 25 del 6 marzo 1992*. VERIFIED as Wikipedia's citation;
I did not open the 1993 delibera or the 1992 regional law themselves.

**This matters for the programme:** the roster must be built from the 53 live zone, not from a
59-row historic list, or six rows will point at another comune.

### 1.3 The 35 quartieri: numbering, creation dates, and current names

Source: `https://it.wikipedia.org/wiki/Quartieri_di_Roma`, cross-checked name-for-name against
Roma Capitale Source A.

**The 1921 batch (Q.I–Q.XV).** it.wikipedia, verbatim:

> «A seguito del notevole ampliamento della città avvenuto nel trentennio dal 1890 al 1920,
> l'Associazione fra i Romani segnalò all'Amministrazione l'opportunità di istituire nuovi Rioni e
> Quartieri, in aggiunta ai quindici rioni già esistenti. Così, nel 1921, la Giunta Municipale dispose
> di istituire i seguenti quindici quartieri, dopo un primo tracciamento effettuato nel 1911 per i soli
> effetti statistici e anagrafici e di assegnare ad ognuno di essi un proprio stemma»
>
> *"Following the considerable expansion of the city in the thirty years from 1890 to 1920, the
> Association of Romans pointed out to the Administration the opportunity of instituting new Rioni and
> Quartieri, in addition to the fifteen rioni already existing. Thus, in 1921, the Municipal Council
> resolved to institute the following fifteen quartieri, after a first tracing carried out in 1911 for
> statistical and civil-registry purposes only, and to assign each of them its own coat of arms."*

Footnoted to *Deliberazione della Giunta Municipale di Roma nº 20 del 20 agosto 1921, p. 113*.

**The 1961 batch (Q.XIX–Q.XXXV).** Verbatim:

> «Con delibera del Commissario Straordinario nº 2453 del 13 settembre 1961, furono istituiti altri
> diciassette quartieri, alcuni trasformando cinque suburbi dell'area est, altri da territori
> dell'agro romano che, a sua volta, fu suddiviso in zone. Ai "nuovi" quartieri sono stati assegnati
> i numeri da 19 a 35.»
>
> *"By resolution of the Extraordinary Commissioner nº 2453 of 13 September 1961, another seventeen
> quartieri were instituted, some by transforming five suburbi of the eastern area, others from
> territories of the agro romano which was in turn subdivided into zone. The 'new' quartieri were
> assigned the numbers 19 to 35."*

**The three in between.**
- **Q.XVI Monte Sacro**, 1924 — previously provisionally called *Città Giardino – Aniene*
  (*Deliberazione del Governatore di Roma nº 1087 del 16 luglio 1924*).
- **Q.XVII**, 1926 — created as **Savoia** *"in omaggio alla gloriosa Casa Sabauda"* ("in homage to
  the glorious House of Savoy"), at the same time Q.III Pinciano was renamed **Vittorio Emanuele III**
  (*Deliberazione del Governatore di Roma nº 3554 del 24 maggio 1926*). In **1946** the dynastic names
  were reversed out: Vittorio Emanuele III went back to **Pinciano**, Savoia became **Trieste**
  (*Deliberazione del Governatore di Roma nº 3241 del 13 settembre 1946*).
- **Q.XVIII Tor di Quinto**, 1954 — created by splitting suburbio S.I Parioli
  (*variazione del dizionario toponomastico, 1º marzo 1954*).

**Also renamed:** Q.XV was **Milvio** 1921→1935, **Della Vittoria** from 1935 (*Deliberazione del
Governatore di Roma nº 3944 del 23 maggio 1935*), **Delle Vittorie** 1938–1945, then Della Vittoria
again. Q.XXXII was **E.U.R.** until 1965 — the Europa article's own footnote quotes the delibera:

> «Con deliberazione della Giunta Municipale del 5/05/1965 n. 2509 fu approvata "L'attribuzione al
> Quartiere XXXII - E.U.R. della denominazione di Quartiere XXXII - EUROPA" visto il parere favorevole
> della Commissione Consultiva di Toponomastica espresso nella riunione dell'8/04/1965.»
>
> *"By Municipal Council resolution of 5 May 1965 no. 2509, 'the attribution to Quartiere XXXII –
> E.U.R. of the denomination Quartiere XXXII – EUROPA' was approved, given the favourable opinion of
> the Consultative Commission on Toponymy expressed in the meeting of 8 April 1965."*

**Is the numbering still current? YES — VERIFIED.** Roma Capitale Source A lists exactly 35 quartieri
under codes 201–235, in the same order and with the same numbers as Q.I–Q.XXXV. Nothing has been
added or renumbered since 1961. The last three (233/234/235 = Q.XXXIII/XXXIV/XXXV, the Ostia
"quartieri marini") sit in their own column labelled `Quartieri marini`.

**Two official-vs-Wikipedia spelling divergences** worth flagging for slug decisions:
Roma Capitale writes **`216 Montesacro`** (one word) where Wikipedia has "Monte Sacro"; and
**`225 Appio - Claudio`** and **`226 Appio - Pignatelli`** with hyphens where Wikipedia has
"Appio Claudio" / "Appio-Pignatelli"; and **`459 Polline - Martignano`**. VERIFIED from the PDF text.

### 1.4 The 6 suburbi and why their numbering has holes

Source: `https://it.wikipedia.org/wiki/Suburbi_di_Roma`, confirmed against Source A.

11 suburbi were traced in 1911 with letter codes (S.P, S.TI, S.PL…). They were remapped to Roman
numerals by *Deliberazione del governatore Francesco Boncompagni Ludovisi n. 1222 del 27 febbraio
1932*. Parioli and Ostiense were suppressed on 1 March 1954. The 1961 delibera then killed five more
(S.II–S.VI), converting them into quartieri per this mapping, quoted from the article's table:

| suppressed suburbio | became |
|---|---|
| S. II Nomentano | Q. XXI Pietralata |
| S. III Tiburtino | Q. XXII Collatino |
| S. IV Prenestino-Labicano | Q. XXIII Alessandrino |
| S. V Tuscolano | Q. XXIV Don Bosco + Q. XXV Appio Claudio |
| S. VI Appio-Latino | Q. XXVI Appio-Pignatelli |
| S. X Trionfale (part) | Q. XXVII Primavalle |
| S. I Tor di Quinto (part) | Q. XVIII Tor di Quinto |

The article then explains the gaps, verbatim:

> «Rimasero, quindi, solo sei suburbi, tutti nell'area ovest del comune di Roma, senza subire la
> rinumerazione, in previsione di una successiva loro soppressione non più avvenuta.»
>
> *"Only six suburbi remained, all in the western area of the comune of Rome, without undergoing
> renumbering, in anticipation of a subsequent suppression of them that never happened."*

**The six survivors, confirmed by Roma Capitale Source A's `Suburbi` column (codes 301, 307, 308,
309, 310, 311):** S.I Tor di Quinto, S.VII Portuense, S.VIII Gianicolense, S.IX Aurelio, S.X
Trionfale, S.XI Della Vittoria. VERIFIED — the official codes literally skip 302–306, exactly as the
history predicts. Total area 53.71 km².

**Trap for the roster:** all six suburbi share a name with a quartiere (Portuense the suburbio ≠
Portuense the quartiere; Della Vittoria S.XI ≠ Della Vittoria Q.XV). Any roster keyed on name alone
will collide. Key on the official numeric code (301/307/…) or on `S.` + numeral.

---

## 2. How these relate to the 15 Municipi, and to the rioni

### 2.1 The single most important structural fact

Rome has **three parallel, non-nested partitions**, each covering the whole comune. Roma Capitale's
own article `Suddivisioni di Roma` states it flatly, verbatim:

> «Tutti i confini urbanistici sono anche confini amministrativi, per cui ognuna delle 155 aree
> urbanistiche è contenuta in una ed una sola delle 15 aree amministrative. **Le aree toponomastiche
> invece non hanno alcuna relazione con le aree urbanistiche né amministrative, potendo trovarsi a
> cavallo tra due di queste**, come avviene in special modo in periferia.»
>
> *"All urbanistic boundaries are also administrative boundaries, so each of the 155 urbanistic areas
> is contained in one and only one of the 15 administrative areas. **The toponymic areas, by contrast,
> have no relationship at all with the urbanistic or administrative areas, and may straddle two of
> them**, as happens especially in the periphery."*

So the three layers are:

| layer | count | instituted | nests cleanly? |
|---|---|---|---|
| **Municipi** (administrative) | 15 | 1972 as 20 circoscrizioni → 2001 municipi → 2013 reduced to 15 | top level |
| **Zone urbanistiche** (planning/statistical) | 155 | 1977 | ✅ each sits in exactly one Municipio |
| **Toponymic** (rioni / quartieri / suburbi / zone) | 116 | 1743–1961 | ❌ **cuts across both** |

Citations: circoscrizioni *Delibera del Consiglio Comunale n. 693 dell'11 febbraio 1972*; municipi
*Delibera del Consiglio Comunale n. 22 del 19 gennaio 2001*; reduction 19→15 by merging I-XVII,
II-III, VI-VII and IX-X, *Delibera dell'Assemblea Capitolina n. 11 dell'11 marzo 2013* (boundaries)
and *delibera n. 8 del 7 marzo 2013*. Zone urbanistiche *Delibera consiliare n. 2983 del 29-30 luglio
1977*. All VERIFIED as Wikipedia's citations to primary deliberations; I did not open the
deliberations themselves. The 15/155/116 counts are independently VERIFIED against the two Roma
Capitale PDFs.

### 2.2 The straddling is real and common, not a footnote

From the quartieri article infoboxes (each names its `circoscrizione`), VERIFIED per-article:

- **Q.XIV Trionfale** → Municipio **I, XIII and XIV** (three).
- **Q.X Ostiense** → Municipio **I, VIII and IX** (three).
- **Q.VI Tiburtino** → Municipio **II, IV and V** (three).
- **Q.XXIV Don Bosco** → Municipio **V, VI and VII** (three).
- **Q.IX Appio-Latino** → Municipio **VII and VIII**.
- **Q.XV Della Vittoria** → Municipio **I and XV**.
- **Q.XI Portuense**, **Q.XII Gianicolense** → Municipio XI and XII.
- **Q.XIII Aurelio**, **Q.XXVII Primavalle** → Municipio XIII and XIV.
- Clean single-municipio quartieri do exist: Q.I–Q.V and Q.XVII all → Municipio II;
  Q.XVI, Q.XXVIII → III; Q.XXI, Q.XXIX, Q.XXX → IV; Q.XIX, Q.XXIII → V; Q.XXV → VII;
  Q.XXXI, Q.XXXII → IX; Q.XVIII → XV; Q.XXXIII/XXXIV/XXXV → X.

Zone straddle too: Z.IX Acqua Vergine → Municipio IV and VI; Z.XXIII Castel di Leva → VIII and IX;
Z.XLV Castel di Guido → XII and XIII; Z.LI La Storta and Z.LIII Tomba di Nerone → XIV and XV.

### 2.3 Relation to the rioni

The rioni are the *inner* term of the same series. Verbatim from `Suddivisioni di Roma`:

> «22 rioni che compongono il centro storico, istituiti nel Medioevo sulla base delle 14 regioni
> augustee e ampliati alla fine del XIX secolo, tutti compresi entro le Mura aureliane tranne Borgo e
> Prati. […] 35 quartieri che circondano il centro storico fuori dalle Mura aureliane, compresi i tre
> "quartieri marini" in cui è suddivisa Ostia.»
>
> *"22 rioni which make up the historic centre, instituted in the Middle Ages on the basis of the 14
> Augustan regions and enlarged at the end of the 19th century, all contained within the Aurelian Walls
> except Borgo and Prati. […] 35 quartieri which surround the historic centre outside the Aurelian
> Walls, including the three 'marine quartieri' into which Ostia is divided."*

And the quartieri article's own first line, verbatim:

> «I quartieri di Roma sono le aree di nuova urbanizzazione nate soltanto dopo l'istituzione dell'ultimo
> rione, Prati.»
>
> *"The quartieri of Rome are the areas of new urbanisation that came into being only after the
> institution of the last rione, Prati."*

**So rione and quartiere are the same kind of object at different dates.** They tile without overlap:
Q.IX Appio-Latino's boundary description names *"a nord con il rione R. I Monti"*, *"a sud-ovest con
il quartiere Q. XX Ardeatino e il rione R. XIX Celio"*. A single roster of the 116 is coherent; the
line between "core" and "outside" is the Aurelian Walls, plus the two exceptions Borgo and Prati.

### 2.4 ⚠️ The trap that should drive the in-scope test

**The names a traveller uses for Rome's outer neighbourhoods are mostly *zone urbanistiche* or
informal toponyms, NOT quartieri.** Four verified examples, each quoted:

- **Garbatella** — «Garbatella è la denominazione dell'abitato fondato il 18 febbraio del 1920 e che
  ad oggi coincide con la zona urbanistica 11C del Municipio Roma VIII di Roma Capitale. La zona è
  compresa nel quartiere decimo (Q. X) Ostiense.» → *"Garbatella … today coincides with urbanistic
  zone 11C of Municipio VIII. The zone is contained in the tenth quartiere (Q.X) Ostiense."*
  **Garbatella is not a quartiere. It is a sub-part of Ostiense.**
- **Pigneto** — «Fa parte principalmente del quartiere Q. VII Prenestino-Labicano e, in minor parte,
  del quartiere Q. VI Tiburtino ed è compresa nella zona urbanistica 6A Torpignattara.» →
  *"It belongs mainly to Q.VII Prenestino-Labicano and, to a lesser extent, to Q.VI Tiburtino, and is
  contained in urbanistic zone 6A Torpignattara."* **Split across two quartieri and named after
  neither; even its urbanistic zone has a different name.**
- **San Lorenzo** — «San Lorenzo è la zona urbanistica 3B del Municipio Roma II di Roma Capitale. Si
  estende sul quartiere Q. VI Tiburtino.» → *"San Lorenzo is urbanistic zone 3B … It extends over
  quartiere Q.VI Tiburtino."*
- **Quartiere Coppedè** — «è un complesso di edifici situato a Roma nel quartiere Trieste … Pur non
  essendo propriamente un quartiere, venne così chiamato dallo stesso architetto» → *"…is a complex of
  buildings located in the Trieste quartiere … Although not properly a quartiere, it was so named by
  the architect himself."*

Conversely, **Testaccio** — which every guide treats as an outer-Rome food-and-nightlife
neighbourhood — is a **rione (R.XX)**, i.e. inside the historic-core layer, not a quartiere.

The 155-item zone-urbanistiche list (VERIFIED from Roma Capitale Source B, full table extracted)
contains many of the names a traveller would actually search: `01B Trastevere`, `01D Testaccio`,
`02A Villaggio Olimpico`, `02X Villa Borghese`, `02Y Villa Ada`, `03B S. Lorenzo`, `06A Torpignattara`,
`06C Quadraro`, `11C Garbatella`, `11X Appia Antica Nord`, `11Y Appia Antica Sud`, `12A Eur`,
`13E Ostia Antica`, `13F Ostia Nord`, `13G Ostia Sud`, `13H Castel Fusano`, `16X Villa Pamphili`,
`19A Medaglie d'Oro`, `20X Foro Italico`.

**INFERRED (flagged as inference, for the arbitrator):** a roster keyed *purely* on the 116 toponymic
units will produce pages that are administratively correct and editorially wrong — a "Q.X Ostiense"
page that has to carry Garbatella, the Gazometro, San Paolo fuori le mura and Centrale Montemartini
under a name almost no traveller uses; and no page at all for Pigneto or Garbatella. Whereas a roster
keyed purely on zone urbanistiche gets the names right but breaks the neat rione/quartiere series and
brings in 155 rows. The Bronx/Queens precedent (roster + `in_scope` flag) survives either way, but the
**unit of the roster is a real decision, not a detail.**

---

## 3. Which of them a traveller would plausibly visit

Method: for each of the 35 quartieri, 6 suburbi and 53 zone I pulled the full it.wikipedia article
wikitext and read its `Monumenti e luoghi d'interesse`, `Cultura`/`Musei`, `Siti archeologici` and
`Aree naturali` sections. Where the sight is famous I then opened the *sight's own* article to
confirm which toponymic unit it names. That second step is what caught three errors in the brief.

### 3.1 ⚠️ Three corrections to the brief's own examples

The brief offers five worked examples. **Two are wrong and one is incomplete.** This matters because
these were presumably going to seed the roster.

1. **"Appio-Latino holds the catacombs and the Appian Way" — the catacombs are NOT in Appio-Latino.**
   - `Catacombe di San Sebastiano`, verbatim: «sono un cimitero ipogeo di Roma, posto lungo la via
     Appia Antica, **nel quartiere Ardeatino**» → *"…placed along the via Appia Antica, in the
     Ardeatino quartiere."*
   - `Catacombe di San Callisto`: «un'area di circa 30 ettari compresa tra la via Appia Antica, la via
     Ardeatina e la via delle Sette Chiese» — and **Q.XX Ardeatino's** own article lists, in its
     `Siti archeologici` section: *Catacombe di San Callisto*, *Catacombe di Domitilla*, *Catacomba dei
     Santi Marco e Marcelliano*, *Catacomba di Balbina*, *Catacombe di San Sebastiano*, plus
     *Basilica di San Sebastiano fuori le mura*, *Sepolcro di Priscilla*, *Tomba dei Rabiri*, *Tomba
     del fregio dorico*, *Tomba di Tiberio Claudio Secondino*, *Casal Rotondo*-adjacent tombs and the
     *Abbazia delle Tre Fontane*.
   - **Q.IX Appio-Latino** does hold the *first* stretch of the Appia — its list has *Chiesa del
     Domine quo vadis*, *Cappella di Reginald Pole*, *Villa Casali su via Appia Antica*, *Hosteria del
     Colombario dei Liberti di Augusto*, plus the whole **Parco della Caffarella** (*Chiesa di
     Sant'Urbano alla Caffarella*, VI century; *Casale della Vaccareccia*; *Torre del Casale della
     Vaccareccia*, XIII century) and the *tracciato della antica via Latina*.
   - **The Appia's tourist core is distributed across four toponymic units in sequence**, confirmed by
     reading each unit's boundary list: **Q.IX Appio-Latino → Q.XX Ardeatino → Q.XXVI Appio-Pignatelli
     → Z.XXI Torricola.**

2. **"Flaminio has MAXXI and the Auditorium" — MAXXI yes, the Auditorium no.**
   - MAXXI, verbatim: «La sede principale del MAXXI si trova nel **quartiere Flaminio** di Roma ed è
     realizzata nell'area delle ex caserma Montello accanto alla basilica di Santa Croce a Via
     Flaminia.» ✅ Q.I Flaminio. Q.I's own list also carries *Museo Hendrik Christian Andersen*,
     *Teatro Olimpico*, *Ponte Milvio*, *Ponte della Musica-Armando Trovajoli*, *Porta del Popolo*.
   - Auditorium, verbatim: «Auditorium Parco della Musica "Ennio Morricone" … Progettato da Renzo
     Piano, **è situato ai Parioli**, su un'area di 55 000 mq compresa fra Villa Glori, il Villaggio
     Olimpico, il viadotto di corso di Francia e viale Maresciallo Pilsudski.» → **Q.II Parioli**, not
     Q.I. Q.II's own article confirms it, and adds: «Del quartiere Parioli fa parte il Villaggio
     Olimpico, inaugurato nel 1960 per la XVII Olimpiade.»

3. **"EUR has Mussolini-era architecture and museums" — correct, and understated.** See 3.2.

**A fourth gap:** the brief lists no candidate for **Q.III Pinciano**, which holds **Villa Borghese,
the Galleria Borghese, the GNAM, Villa Giulia, the Bioparco, Piazza di Siena, the Casina di Raffaello
and the British School at Rome** (all VERIFIED in Q.III's `Monumenti`/`Musei` sections). By any honest
reading that is the single strongest non-EUR candidate outside the walls.

### 3.2 Candidate IN-SCOPE list, with the evidence

Ranked roughly by strength of case. Every named sight is VERIFIED as appearing in that unit's own
it.wikipedia article, and the starred ones are double-confirmed from the sight's own article.

**Tier 1 — a guide could fill a page without straining**

| Unit | Municipio | What is actually there |
|---|---|---|
| **Q.XXXII Europa (EUR)** | IX | Palazzo della Civiltà Italiana ("Colosseo quadrato"), Palazzo dei Ricevimenti e dei Congressi (Adalberto Libera), Palazzo degli Uffici, Palazzo delle Poste (BBPR), Palazzo ENI, Palazzo dello Sport (Nervi/Piacentini), Il Fungo, Piscina delle Rose, Torri Ligini, Basilica dei Santi Pietro e Paolo, LunEur (1953 luna park), Archivio Centrale dello Stato, **Museo delle Civiltà**\* (preistorico-etnografico + arti e tradizioni popolari + alto medioevo + arte orientale), Museo della civiltà romana, Planetario. Museo delle Civiltà, verbatim: «è un museo statale italiano, situato **nel quartiere dell'EUR** a Roma.» |
| **Q.III Pinciano** | II | Galleria Borghese, Galleria nazionale d'arte moderna e contemporanea (GNAM), **Villa Giulia**, Villa Borghese with Casina di Raffaello / Tempio di Esculapio / Piazza di Siena / Giardino del lago / Galoppatoio, Bioparco di Roma, Porta Pinciana, Catacomba di San Valentino, Villa Strohl Fern, British School at Rome, Istituto Giapponese di Cultura. |
| **Q.I Flaminio** | II | **MAXXI**\* (Zaha Hadid), Museo Hendrik Christian Andersen, Teatro Olimpico, Ponte Milvio (110–109 BC), Ponte della Musica-Armando Trovajoli, Basilica di Santa Croce a Via Flaminia, Chiesa di Sant'Andrea del Vignola, Porta del Popolo, Case ICP Flaminio II. |
| **Q.II Parioli** | II | **Auditorium Parco della Musica**\* (Renzo Piano, opened 21 April 2002), Villaggio Olimpico 1960, Villa Ada, Villa Glori, Villa Balestra, Moschea di Roma, Museo degli strumenti musicali dell'Accademia nazionale di Santa Cecilia, Teatro Parioli, Catacomba dei Giordani, Catacomba di Sant'Ilaria, Villa romana dell'Auditorium, Antemnae. |
| **Q.XX Ardeatino** | I / VIII | **Catacombe di San Callisto**\*, **Catacombe di San Sebastiano**\*, **Basilica di San Sebastiano fuori le mura**, Catacombe di Domitilla, Catacomba di Balbina, **Abbazia delle Tre Fontane** (+ Ss. Vincenzo e Anastasio, San Paolo alle Tre Fontane, Santa Maria Scala Coeli), Tomba dei Rabiri, Tomba del fregio dorico, Sepolcro di Priscilla, Colonna di Pio IX, Forte Appia Antica. |
| **Q.X Ostiense** | I / VIII / IX | **Basilica di San Paolo fuori le mura**\* — verbatim: «Sorge lungo la via Ostiense, **nell'omonimo quartiere**, vicino alla riva sinistra del Tevere» — **Centrale Montemartini**\* (verbatim: «nel quartiere Ostiense … sezione distaccata dei Musei Capitolini»), **Gazometro** (1936), Piramide Cestia + Porta San Paolo at Piazzale Ostiense, **Garbatella** (zona urb. 11C, inside this quartiere), Necropoli di San Paolo, Catacomba di Santa Tecla, Mercati Generali, Valco San Paolo INA-Casa towers. |
| **Q.XXXIII Lido di Ostia Ponente + Q.XXXIV Lido di Ostia Levante + Q.XXXV Lido di Castel Fusano** | X | Rome's beach. Q.XXXIII: Tor Boacciana, Tor San Michele, ex Colonia marina Vittorio Emanuele III (Fasolo, 1927-32), Ufficio postale di Ostia Lido (Angiolo Mazzoni, 1939-42), Cineland, ex Idroscalo. Q.XXXIV: Palazzo del Governatorato (Fasolo, seat of Municipio X), Palazzo del Pappagallo (Mario Marchi, 1929), Palazzina Marchi, Villino di Luigi Moretti, Villini Rossini, Collegio Navale IV Novembre, Pineta di Ostia. Q.XXXV: Pineta di Castel Fusano, Villa della Palombara ("villa di Plinio"), dunes and free beaches. The Ostia article notes 91,342 residents and names Fasolo, Libera, Palmerini, Mazzoni as the architects who worked there. |
| **Z.XXXV Ostia Antica** | X | See §5. Area archeologica di Ostia antica + Museo Ostiense, Castello di Giulio II, Borgo Gregoriopoli, Basilica/Cattedrale di Sant'Aurea, Casone pontificio del Sale, Riserva naturale statale Litorale Romano, Parco dei Ravennati. |

**Tier 2 — a real page is possible, but thinner or single-sight**

| Unit | Municipio | What is actually there |
|---|---|---|
| **Q.XVII Trieste** | II | Complesso monumentale di **Sant'Agnese fuori le mura** + **Mausoleo di Santa Costanza**, **Catacombe di Priscilla**\* (verbatim: «si trovano lungo la via Salaria, con ingresso di fronte a Villa Ada»), Catacomba di Trasone, Catacombe di via Anapo, **Quartiere Coppedè**\*, Sedia del Diavolo, Villa Chigi, Liceo Giulio Cesare. Note the Quartiere Africano informal name. |
| **Q.VI Tiburtino** | II / IV / V | **Basilica di San Lorenzo fuori le mura**\* (one of the Seven Churches; tomb of St Lawrence, and of Alcide De Gasperi), **Cimitero del Verano**, Città universitaria / Sapienza, Porta Tiburtina, ex fabbrica SNIA Viscosa + Parco delle Energie, Torrione prenestino. Contains the **San Lorenzo** zona urbanistica 3B. |
| **Q.XV Della Vittoria** | I / XV | **Foro Italico**\* — the suburbio article says the *quartiere* XV is «esteso dalle pendici nord-orientali di Monte Mario fino al fiume Tevere e **comprendente l'area del Foro Italico** e la porzione settentrionale di Prati» — plus Villa Madama, Palazzo della Farnesina, Basilica del Sacro Cuore di Cristo Re, Casa delle Armi (Del Debbio), Riserva naturale di Monte Mario, Ponte Milvio, Cimitero Militare Francese. |
| **Q.V Nomentano** | II | **Villa Torlonia + Musei di Villa Torlonia** (Casina delle Civette), Catacombe di Villa Torlonia, Catacomba di Sant'Ippolito, Catacomba di San Nicomede, Villa Massimo, Villa Mirafiori, Villa Blanc, Palazzi Federici, Biblioteca Nazionale Centrale, Città del Sole. |
| **Z.XXI Torricola** | VIII | **Villa dei Quintili**\* (verbatim: «tra il V miglio di via Appia Antica e il settimo chilometro di via Appia Nuova»; the Cecilia Metella + Quintili museum circuit recorded **44,136 visitors in 2018**, MiC data), **Casal Rotondo**, Sepolcri degli Orazi e Curiazi, Via Appia basolato, **Parco regionale dell'Appia antica**. |
| **Q.XII Gianicolense ("Monteverde")** | XI / XII | **Villa Doria Pamphilj** with Casino del Bel Respiro, Arco dei Quattro Venti, Fontana del Lago; **Basilica di San Pancrazio**; Ospedale Carlo Forlanini; Museo internazionale del cinema e dello spettacolo; Teatro Vascello; Teatro Verde. The article notes it is «comunemente chiamato "Monteverde"». |
| **Q.VII Prenestino-Labicano** | V / VII | **Porta Maggiore + Sepolcro di Eurisace**, **Basilica sotterranea di Porta Maggiore**, **Mausoleo di Elena** + Catacombe dei Santi Marcellino e Pietro, **Parco Archeologico di Villa Gordiani**, ex Pastificio Pantanella. Contains most of **Pigneto**\*. |
| **Q.VIII Tuscolano** | V / VII | Parco di Tor Fiscale, Chiesa di Santa Maria del Buon Consiglio a Porta Furba, Chiesa di San Filippo Neri all'Acquedotto Felice, Basilica di Santa Maria Ausiliatrice, Quartiere Tuscolano II (INA-Casa), Villa Lituania, Palazzo delle Poste. Contains the Quadraro and Cinecittà-adjacent urbanistic zones. |
| **Z.LV Isola Farnese** | XV | **Veio**\* — verbatim: «le cui rovine sono situate presso il borgo medievale di Isola Farnese, circa 15 km a N-O di Roma, all'interno dei confini del Parco regionale di Veio». Santuario di Portonaccio (the Apollo of Veii's temple), Acropoli al Colle di Piazza d'Armi, Tomba dei Leoni Ruggenti, Tomba delle Anatre, Castello Ferraioli/Farnese. |
| **Z.LVIII Prima Porta** | XV | **Villa di Livia**\* (*ad gallinas albas*; find-spot of the Augustus of Prima Porta and of the garden frescoes now in Palazzo Massimo), **Arco di Malborghetto**, Cimitero Flaminio, Torre di Prima Porta. |
| **Q.XXVI Appio-Pignatelli** | VII / VIII | Torre Capo di Bove, Tomba del liberto Marco Servilio, "Tomba di Seneca", Mausoleo rotondo, Bagni dell'Acqua Santa, copy of the first Appian milestone. Pure Appia-corridor content; only defensible as part of an Appia cluster. |
| **Z.XVIII Capannelle** | VII | **Villa dei Sette Bassi** (one of the largest suburban villas of Rome), **Ippodromo delle Capannelle**\* — verbatim: «è il più antico ippodromo italiano ed è situato a sud-est di Roma **in zona XVIII Capannelle**, sulla via Appia», inaugurated 1881 — Museo Archeologico "Giuseppe Vitale", area archeologica dell'antica via Castrimeniense. |
| **Z.XXX Castel Fusano** | X | Pineta di Castel Fusano (urban park), **Villa Chigi**, Villa della Palombara ("villa di Plinio"), Basilica paleocristiana, Piscina Torta. Overlaps heavily with Q.XXXV. |
| **Q.XIII Aurelio** | XIII / XIV | Villa Abamelek, Villa Carpegna, Catacomba di Calepodio, Porta San Pancrazio, Porta Cavalleggeri. Thin; mostly matters as "the bit past the Vatican". |
| **Q.XVI Monte Sacro** | III | Città Giardino Aniene garden-suburb, ex Casa GIL (Gaetano Minnucci, 1939), Ponte Nomentano, Riserva naturale Valle dell'Aniene, Mausoleo di Menenio Agrippa. An architecture-and-urbanism page, not a sights page. |
| **Z.XXIII Castel di Leva** | VIII / IX | **Santuario della Madonna del Divino Amore** — a major Roman pilgrimage destination — plus a dense scatter of medieval towers (Torre del Castrum Leonis, Tor del Vescovo, Torre Medaglia, Torre Sant'Anastasia) and the Riserva naturale di Decima-Malafede. Pilgrimage, not tourism. |
| **Z.XI San Vittorino** | VI | **Area archeologica di Gabii** — a genuinely important Latin city — plus Castello di Corcolle, Castello Barberini, Cascatelle di San Vittorino. **Access and interpretation are poor; INFERRED that this is hard to write honestly for a general traveller.** |

**Tier 3 — named here only so the arbitrator can rule on them explicitly**

Z.XXIX **Castel Porziano** (Presidential estate — Tenuta presidenziale, largely closed to the public,
plus Riserva naturale di Decima-Malafede); Q.XI **Portuense** (Porta Portese flea market is on its
boundary; Forte Portuense; Ponte dell'Industria); Q.IV **Salario** (**MACRO** — Museo di Arte
Contemporanea di Roma, in the ex-Peroni brewery — plus Villa Albani and the Catacombe di Santa
Felicita; but it is the *smallest* quartiere in Rome at 46.88 ha per Roma Capitale); Q.XVIII **Tor di
Quinto** (Ponte Milvio's north end, Ponte Flaminio); Z.LII **Cesano** (Lago di Martignano, Parco
regionale di Veio); Z.LIX **Polline-Martignano** (an *exclave* of the comune on Lago di Martignano and
Lago di Bracciano — verbatim: «Si tratta di un'exclave del comune di Roma sita tra i comuni di
Anguillara Sabazia, Campagnano e Trevignano»); Z.LVI **Grottarossa** (Tomba del Gladiatore / Sepolcro
di Marco Nonio Macrino, Tombe dei Nasoni, Castello della Crescenza); Z.VI **Settecamini** (Catacombe
di Sant'Alessandro, Basilica di Sant'Alessandro); Z.XLV **Castel di Guido** (Polledrara di Cecanibbio
palaeontological site, Oasi LIPU); Z.III **Marcigliana** (Crustumerium, Riserva naturale della
Marcigliana); Z.XL **Magliana Vecchia** (Castello della Magliana, a papal hunting lodge); Q.XIV
**Trionfale** (Parco regionale urbano del Pineto, Parco di Monte Ciocci, Basilica di San Giuseppe al
Trionfale, Forte Braschi — but the famous Mercato Trionfale is actually in the Prati/Della Vittoria
direction and I did **not** confirm its unit).

### 3.3 Where the strongest content actually lives, by layer

INFERRED, stated as inference: the outer-Rome content mass is concentrated in **a dozen or so units**,
and three of the strongest traveller destinations sit at *different* layers of the hierarchy —
**EUR is a quartiere (Q.XXXII), Ostia Antica is a zona (Z.XXXV), Ostia Lido is three quartieri
(Q.XXXIII–XXXV), the Appia is a corridor across two quartieri plus a zona, and Garbatella/Pigneto/
San Lorenzo are zone urbanistiche.** An in-scope test that only admits quartieri will miss Ostia
Antica, Veio, Villa dei Quintili and Villa di Livia. An in-scope test that admits all 116 will drown.

---

## 4. Which are residential or industrial with essentially nothing to write about

This is the Queens lesson applied. I read all 94 articles; the following units' complete
`Monumenti e luoghi d'interesse` sections consist of nothing but **parish churches, casali (farmhouses),
schools, and unexcavated/unvisitable Roman villa footprints**. Naming them is the useful part.

### 4.1 Rule out — post-war residential quartieri, east and north-east

**Q.XXIII Alessandrino** (M.V) — entire monument list is eight parish churches plus a stretch of the
Alessandrino aqueduct. Nothing else.
**Q.XXV Appio Claudio** (M.VII) — **four churches. That is the whole article's monument section.**
**Q.XXIV Don Bosco** (M.V/VI/VII) — Basilica di San Giovanni Bosco, six other churches, ex Istituto
Luce building, Forte Casilina. Marginal at best.
**Q.XXX San Basilio** (M.IV) — two casali, four churches, two unexcavated Roman villas, a cultural
centre. Public-housing estate, famous locally for the 1974 evictions; nothing a guide can send anyone to.
**Q.XXVIII Monte Sacro Alto / Talenti** (M.III) — four churches and three neighbourhood parks. The
article opens by noting it is now normally called Talenti and was built from the 1960s.
**Q.XXIX Ponte Mammolo** (M.IV) — dominated by the **Rebibbia prison**; also Museo di Casal de' Pazzi
(a Pleistocene deposit) and Pasolini's house, which is a literary-pilgrimage item, not a page.
**Q.XXII Collatino** (M.IV/V) — churches, Forte Tiburtina, a share of Villa Gordiani (whose main part is
in Q.VII), Teatro Tendastrisce.
**Q.XIX Prenestino-Centocelle** (M.V) — churches, Forte Prenestina (an occupied social centre), a
fountain, three schools.
**Q.XXI Pietralata** (M.IV) — Castello di Pietralata, Forte Pietralata, and an *enormous* list of films
shot there (Fellini, De Sica, Pasolini, Sollima). **Cinephile interest, not visitor interest.**
**Q.XXVII Primavalle** (M.XIII/XIV) — ten churches, Riserva naturale della Tenuta di Acquafredda, and
again a long filmography.
**Q.XXXI Giuliano-Dalmata** (M.IX) — churches, memorials to the foibe and the Istrian-Dalmatian exodus,
Archivio museo storico di Fiume, Museo storico della motorizzazione militare. A specialist-diaspora
subject, not a general one.

### 4.2 Rule out — Agro romano zone: churches, casali, and unvisitable villa footprints

**Z.I Val Melaina**, **Z.II Castel Giubileo**, **Z.IV Casal Boccone**, **Z.V Tor San Giovanni**,
**Z.VII Tor Cervara**, **Z.VIII Tor Sapienza**, **Z.IX Acqua Vergine**, **Z.X Lunghezza**,
**Z.XII Torre Spaccata**, **Z.XIII Torre Angela**, **Z.XIV Borghesiana**, **Z.XV Torre Maura**,
**Z.XVI Torrenova**, **Z.XVII Torre Gaia**, **Z.XIX Casal Morena**, **Z.XXII Cecchignola**,
**Z.XXIV Fonte Ostiense**, **Z.XXV Vallerano**, **Z.XXVI Castel di Decima**, **Z.XXVII Torrino**,
**Z.XXVIII Tor de' Cenci**, **Z.XXXI Mezzocammino**, **Z.XXXII Acilia Nord**, **Z.XXXIII Acilia Sud**,
**Z.XXXIV Casal Palocco**, **Z.XXXIX Tor di Valle**, **Z.XLI Ponte Galeria**, **Z.XLIII Maccarese Nord**,
**Z.XLIV La Pisana**, **Z.XLVIII Casalotti**, **Z.XLIX Santa Maria di Galeria**, **Z.L Ottavia**,
**Z.LI La Storta**, **Z.LIII Tomba di Nerone**, **Z.LIV La Giustiniana**, **Z.LVII Labaro**.

Worked examples of how empty these are, straight from the articles:
- **Z.XXXIV Casal Palocco** — the complete monuments list is: *Villa Ronconi, Casa Scroddi, Casa Cento,
  Chiesa di San Timoteo, Metro Drive In.* A 1960s car suburb.
- **Z.XXXIX Tor di Valle** — the complete list is two items: *Ponte di Vallerano*, *Torre e casale della
  Vallora*.
- **Z.XLIII Maccarese Nord** — the article has **no monuments section at all**. Roma Capitale gives it
  121.97 ha, a stump left after Fiumicino took ~10× its area.
- **Z.XXII Cecchignola** — five items, all military-estate or archaeological fragments (Villa della
  Cecchignola, a cistern, a Roman tomb, Torre Chiesaccio, Tor Pagnotta). Largely a closed army zone.
- **Z.XLIV La Pisana** — three items: Casetta Mattei, a Capuchin college, Riserva naturale della Tenuta
  dei Massimi.
- **Z.XXVII Torrino** — a business park (Eurosky, Torre Europarco), the Euroma2 shopping centre, six
  churches and a wall of school listings.

**Z.XX Aeroporto di Ciampino** — I did **not** fetch this article (it was the one zona I missed in the
batch). It is the airport; ruling it out needs no evidence, but flag that I did not read it.

### 4.3 Rule out — the six suburbi, as a class

**S.I Tor di Quinto, S.VII Portuense, S.VIII Gianicolense, S.IX Aurelio, S.X Trionfale,
S.XI Della Vittoria.** I read all six articles. **Every one of them defines itself by reference to the
quartiere of the same name** — e.g. S.IX Aurelio: «Il nome è associato all'omonimo quartiere ed è
preso, come per il quartiere, dalla via Aurelia» (*"The name is associated with the quartiere of the
same name and is taken, as for the quartiere, from the via Aurelia"*). Their content is boundary
description and little else; S.XI Della Vittoria's only real substance is a sentence about Monte Mario
that credits the *quartiere* with the Foro Italico.

**INFERRED, and I think firmly: the six suburbi should be out of scope as a class.** They exist only
because a planned 1961 suppression never happened, they duplicate quartiere names (a slug collision),
and no traveller has ever used the word. Their combined area is 53.71 km² of Monte Mario slopes,
Boccea and Portuense hinterland.

### 4.4 Tally

Of 94 units outside the walls (35 quartieri + 6 suburbi + 53 zone):
- **~8 Tier-1 candidates** (EUR, Pinciano, Flaminio, Parioli, Ardeatino, Ostiense, the Ostia Lido trio
  counted as one or three, Ostia Antica)
- **~18 Tier-2**
- **~12 Tier-3 / explicit-ruling-needed**
- **~56 clear rule-outs** (11 residential quartieri + 36 Agro zone + 6 suburbi + Ciampino airport,
  minus overlaps)

INFERRED: the shape is Queens-like — a large majority ruled out. Queens went 21 of 111. A comparable
Rome outer-ring roster lands somewhere around **10–25 of 94**, plus the 22 rioni handled separately.

---

## 5. Ostia Antica specifically

### 5.1 ⚠️ It is a *zona*, not a quartiere or a frazione-only

The brief calls it "a *frazione*/quartiere of Rome." **It is neither: it is Z.XXXV, a zona of the Agro
romano** — the last of the 35 in the 1961 numbering. it.wikipedia, verbatim:

> «Ostia Antica è la trentacinquesima zona di Roma; è indicata con Z. XXXV. Il toponimo indica la
> zona urbanistica 13E del Municipio Roma X.»
>
> *"Ostia Antica is the thirty-fifth zona of Rome; it is denoted Z. XXXV. The toponym also denotes
> urbanistic zone 13E of Municipio Roma X."*

Roma Capitale Source A confirms it independently: **`435 Ostia Antica 1.499,67`** ha, in the
`Zone dell'agro romano` column. VERIFIED from the official PDF.

The confusion in the brief is understandable, because the *number* 35 is used twice: **Q.XXXV is Lido
di Castel Fusano** and **Z.XXXV is Ostia Antica**. Any roster keyed on bare Roman numerals will
collide here. It *is* additionally listed as a **frazione** in `Suddivisioni di Roma`'s frazioni list
under "O": «Ostia, Ostia Antica».

### 5.2 Yes, it is inside the Comune di Roma. Municipio X.

VERIFIED, three independent ways:
1. Its own infobox: `nomeComune = Roma Capitale`, `circoscrizione = Municipio Roma X`.
2. Roma Capitale's official toponymic list includes it as code 435 (only Rome's own units appear).
3. Its boundary description names Fiumicino as a *neighbour*, not as its comune — verbatim: «La zona
   confina: a nord-ovest con il comune di Fiumicino [Separato dal fiume Tevere, dal ponte Tor Boacciana
   al canale dei Pescatori]; a est con la zona Z. XXXII Acilia Nord; a sud-est con la zona Z. XXXIV
   Casal Palocco; a sud con il quartiere Q. XXXIII Lido di Ostia Ponente.»

The **Tiber is the comune boundary** on the north-west side. That is the line that matters.

### 5.3 Does the archaeological park sit in it? Yes — but the *institution* is bigger than the zona.

**Two different things share the name and they do not have the same footprint.**

**(a) The archaeological area — the scavi — is inside Z.XXXV.** The Z.XXXV article lists, under its own
`Monumenti e luoghi d'interesse`: *Area archeologica di Ostia antica*, *Museo Ostiense* («che espone
reperti dell'area archeologica della Ostia romana»), *Castello di Giulio II*, *Borgo Gregoriopoli*,
*Basilica di Sant'Aurea*, *Casone pontificio del Sale*, *Parco dei Ravennati*. The `Ostia (città
antica)` article gives coordinates **41°45′15″N 12°17′15″E** (≈41.754, 12.288) and access via the
*Stazione di Ostia Antica* on the Roma–Lido line, comune of Roma. VERIFIED.

**(b) The *Parco archeologico di Ostia antica* — the MiC institute — straddles two comuni.** Verbatim:

> «Il Parco archeologico di Ostia antica è un istituto del Ministero della cultura deputato alla
> protezione, gestione e valorizzazione di una vasta area archeologica **compresa tra Ostia (frazione
> litoranea di Roma) e Fiumicino**. […] Il Parco archeologico comprende: gli scavi di Ostia antica e il
> relativo Museo Ostiense, la Necropoli di Porto, i resti dei porti di Claudio e Traiano e il Museo
> delle navi, oltre che diversi siti archeologici minori.»
>
> *"The Archaeological Park of Ostia antica is an institute of the Ministry of Culture charged with the
> protection, management and enhancement of a vast archaeological area **lying between Ostia (a coastal
> frazione of Rome) and Fiumicino**. […] The Park comprises: the excavations of Ostia antica and their
> Museo Ostiense, the Necropolis of Porto, the remains of the ports of Claudius and Trajan and the
> Museum of the Ships, plus various minor archaeological sites."*

And: «Il ''Parco archeologico di Ostia Antica'', che al suo interno ospita 4 sedi museali, con i suoi
150 ettari, **ricompresi nei territori comunali di Roma e Fiumicino**, è uno dei siti archeologici più
grandi d'Europa» — *"…with its 150 hectares, falling within the municipal territories of Rome and
Fiumicino, it is one of the largest archaeological sites in Europe."* It received the **European
Heritage Label in 2019**. Created **23 January 2016**; director Alessandro D'Alessio since 30 October
2020.

**So: the scavi and Museo Ostiense are in Rome (Z.XXXV / Municipio X). The Museo delle navi, the
Necropoli di Porto Isola Sacra, the Iseo Portuense and the basilica di Sant'Ippolito are in the comune
of Fiumicino** — the Museo delle navi article confirms this verbatim: «situato nei pressi
dell'aeroporto di Roma-Fiumicino, **nel territorio del comune di Fiumicino**». The Porti di Claudio e
Traiano straddle.

**Editorial consequence, INFERRED:** a single "Ostia Antica" page that covers "the Parco" will be
partly writing about a different comune. Either scope the page to the scavi + borgo (clean, in Rome),
or scope it to the institute and say plainly that half of it is in Fiumicino. Do not blur it.

### 5.4 Visitor evidence

**273,638 visitors in 2023**, per MiC figures cited by it.wikipedia, verbatim:

> «Nel 2023 il sito archeologico è stato visitato da 273 638 persone generando un introito di
> 1 677 916 euro.»

That is roughly a hundredth of the Colosseum and about six times the Villa dei Quintili circuit's
44,136 (2018). Enough to justify a page; not enough to justify a cluster.

### 5.5 Does it read as a separate destination?

The brief's instinct is right and the geography backs it: Z.XXXV is 1,499.67 ha, physically separated
from the built-up city (the article: «Si trova nell'area sud-ovest di Roma, fra il fiume Tevere a
nord-ovest e la via del Mare a sud»), reached by a dedicated rail line, with its own medieval borgo and
cathedral. **INFERRED: it behaves like Sagres or Herculaneum — an in-city administrative unit that a
traveller experiences as a day trip.** Whatever the in-scope test says about Agro-romano zone in
general, it needs an escape hatch that lets this one through, or a rule keyed on the presence of a
nationally-managed cultural institute rather than on the layer of the hierarchy.

---

## 6. Things I could not confirm — say so plainly

1. **I never reached `ostiaantica.beniculturali.it`.** DNS/geo failure from this host (ECONNREFUSED to
   2.42.229.14, and direct timeouts). The Parco's exact postal address, current opening hours, ticket
   structure and its own statement of the Roma/Fiumicino split are all **second-hand via Wikipedia**.
   A verifier with working access must re-check §5.3.
2. **I never opened the UNESCO listing** (`whc.unesco.org/en/list/1708/` → HTTP 403). The claim that
   the **Via Appia was inscribed as a World Heritage site in July 2024 at the 46th session of the
   Committee, as Italy's 60th site**, rests only on it.wikipedia's account: «Nel luglio 2024, nel corso
   della 46ª sessione del Comitato UNESCO, la via Appia – comprensiva del tracciato dell'Appia Antica e
   della sua variante via Appia Traiana – è stata riconosciuta patrimonio dell'umanità». **This is
   load-bearing for the Appia cluster's in-scope case and should be re-verified.**
3. **I did not open any of the primary deliberations.** Every delibera number in §1 (n. 20/1921,
   n. 1087/1924, n. 3554/1926, n. 1222/1932, n. 3944/1935, n. 3241/1946, n. 2453/1961, n. 2509/1965,
   n. 693/1972, n. 2983/1977, n. 1529/1993, n. 22/2001, n. 8 and n. 11/2013) is Wikipedia's citation of
   a primary source, reproduced faithfully but not independently checked. Roma Capitale's *Sistema
   informativo toponomastica* at
   `https://www.comune.roma.it/servizi/SITOWPS/getPDFDelibera.do?codiceDelibera=…` appears to serve
   these; I did not exercise it.
4. **Exactly where the Circo di Massenzio / Tomba di Cecilia Metella cluster falls is unresolved.**
   Q.IX Appio-Latino's list contains «Casale Cenci presso la Villa di Massenzio, su via Appia Antica»
   at 41.855120/12.518260, while Q.XX Ardeatino's contains «Chiesa di San Nicola a Capo di Bove» and
   Q.XXVI Appio-Pignatelli's contains «Torre Capo di Bove». **The three units meet almost exactly
   there.** Do not assert an assignment for these two monuments without a map check against the
   official boundary geometry.
5. **The Mercato Trionfale's unit is unconfirmed.** It is popularly "Trionfale" but the market building
   is near the Prati/Della Vittoria edge; Q.XIV Trionfale's article does not list it.
6. **I did not fetch Z.XX Aeroporto di Ciampino** (the single zona missing from my batch).
7. **Population/area figures for individual units** were only partly checked. The hectare figures in
   §1 come from the official PDF and are solid; the resident-population figures on Wikipedia are dated
   to 31 December 2015/2016 and I did not refresh them.
8. **I did not attempt to resolve whether Roma Capitale publishes machine-readable boundary geometry**
   (a geoportal / GeoJSON for the 116 toponymic units). If it does, it would settle items 4 and 5 and
   would let the roster be built from authoritative shapes rather than prose boundary descriptions.
   **This is probably the single highest-value follow-up.**

---

## 7. The disagreements a later step has to adjudicate

Surfacing these rather than resolving them, per the brief.

1. **What is the unit of the roster?** The 116 toponymic units (administratively authoritative, but
   names travellers don't use, and misses Garbatella/Pigneto/San Lorenzo entirely), the 155 zone
   urbanistiche (right names, wrong series, 155 rows), or a hybrid. §2.4 is the evidence.
2. **Does the programme cover only the historic core?** If "core" = the 22 rioni, that excludes MAXXI,
   EUR, Villa Borghese/Galleria Borghese, San Paolo fuori le mura, the catacombs, the whole Appia and
   Ostia Antica. **INFERRED: a core-only Rome programme would be indefensible as a travel guide.** But
   that is an editorial judgement, not a finding.
3. **Do the six suburbi exist for the roster at all?** §4.3 argues no. Counter-argument: they are 6 of
   the official 116 and omitting them makes the roster not-the-official-list.
4. **Is the Appia a place or a corridor?** Four toponymic units in sequence, none of which a traveller
   names. A "Via Appia Antica" page would be honest and useful but would not be a neighbourhood page.
   Note that Roma Capitale itself has zone urbanistiche `11X Appia Antica Nord` and `11Y Appia Antica
   Sud` — **the city's own planning layer already treats it as a place.**
5. **Ostia: one page or four?** Q.XXXIII + Q.XXXIV + Q.XXXV are three quartieri that Wikipedia and
   Roma Capitale both treat as the three "quartieri marini" of a single settlement («i tre "quartieri
   marini" in cui è suddivisa Ostia»), and Z.XXXV Ostia Antica is a fourth, separate, inland thing.
6. **What does the in-scope test key on?** Candidates visible in this evidence: (a) presence of a
   state- or comune-managed museum/archaeological institute; (b) presence of a named sight with
   published visitor figures; (c) a minimum count of non-parish-church, non-casale, non-school entries
   in the unit's monuments list; (d) named in a major guidebook. **(c) is the one that most cleanly
   separates my Tier 1/2 from §4 — the rule-outs fail it almost mechanically.**

---

## 8. Source list

**Primary (Roma Capitale, official):**
- `https://www.comune.roma.it/web-resources/cms/documents/ElencoSuddivisioniToponomastiche_rg_A.pdf`
  — Elenco suddivisioni territoriali toponomastiche, Ufficio di Statistica. Codes + names + hectares
  for all 116. **Fetched and text-extracted successfully.**
- `https://www.comune.roma.it/web-resources/cms/documents/Territorio_RC.pdf`
  — Roma Capitale Territorio, Ufficio di Statistica. The "116 / 22 / 35 / 6 / 53" statement, the
  Fiumicino footnote, the full 155-item zone-urbanistiche table, municipio populations and areas.
  **Fetched and text-extracted successfully.**
- `https://www.comune.roma.it/web-resources/cms/documents/Elenco_Z_Urbanistiche_rg_A.pdf` — cited by
  Wikipedia; **not fetched.**

**Secondary (it.wikipedia.org, wikitext read directly via the MediaWiki API):**
`Suddivisioni di Roma`, `Quartieri di Roma`, `Suburbi di Roma`, `Zone di Roma`, `Rioni di Roma`,
`Municipi di Roma`, `Zone urbanistiche di Roma`, plus the individual articles for all 35 quartieri,
all 6 suburbi, 52 of the 53 zone, and the following sights: `Ostia (città antica)`,
`Parco archeologico di Ostia antica`, `Museo delle navi di Fiumicino`, `Catacombe di San Callisto`,
`Catacombe di San Sebastiano`, `Catacombe di Priscilla`, `Basilica di San Paolo fuori le mura`,
`Basilica di San Lorenzo fuori le mura`, `Centrale Montemartini`, `MAXXI`,
`Auditorium Parco della Musica`, `Museo delle Civiltà`, `Villa dei Quintili`, `Villa di Livia`, `Veio`,
`Parco regionale di Veio`, `Ippodromo delle Capannelle`, `Foro Italico`, `Garbatella`, `Pigneto`,
`San Lorenzo (Roma)`, `Quartiere Coppedè`, `Testaccio`, `EUR`, `Via Appia`.

**Attempted and failed:** `https://www.ostiaantica.beniculturali.it/` (ECONNREFUSED / timeout);
`https://whc.unesco.org/en/list/1708/` (HTTP 403).
