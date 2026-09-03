# Ludovisi (R. XVI, code 116) — VERIFIER VERDICTS

Adjudication of `docs/rome/ludovisi-finder.md`. Wave 3, Rome programme.
Verification date: 2026-09-02. Author: verifier agent (Ludovisi).

I did not gather the finder's evidence and I owe it no loyalty. Every ruling below is mine.

---

## 0. Headline

| | |
|---|---|
| Finder sections adjudicated | **38** (the finder's "42 candidates" counts 5 embassies and 4 schools individually; they sit inside sections 5.3 and 5.10) |
| **PUBLISH** | **3** |
| **REWRITE** | **12** |
| **DROP** | **23** |
| **Surviving places** | **10** |
| **TIER RULING** | **GUIDE** (threshold is 4+; ten survive) |
| Straddlers escalated to the arbitrator | **4**, plus 2 watch items |
| Reserved-list violations found | **0** |
| Ruling-1 (designation) violations found | **0** |
| Ruling-2 (Vatican / extraterritorial / embassy) violations found | **0** |
| Ruling-3 (photographs) violations found | **0** |

The finder predicted "if the verifier confirms more than about 25 of these 42, I was not being hard
enough." I confirmed 15 of 38 sections in some form and 10 as places. The finder's own pessimism
was better calibrated than its optimism: it was right that the tail would collapse, wrong that the
rione is "a thin guide" — the core is unusually well evidenced for a post-unification rione, and it
is the *middle band*, not the tail, that collapsed hardest.

---

## 1. Re-fetch log — what I actually verified myself

The brief required me to re-fetch at least the five sources the finder leaned on hardest. I
re-fetched **twenty-five**, all today, all with `python3` + `urllib` per the shell warning.

### 1.1 Roma Capitale (turismoroma.it) — 10 pages, all HTTP 200, all read in full

| Page | Verdict |
|---|---|
| `/it/luoghi/palazzo-margherita` | **Says what the finder claims.** Verbatim: 1890, Gaetano Koch, Rodolfo Boncompagni Ludovisi, Palazzo Farnese model, ceded to the Savoys 1900, Margherita to her death 1926, `"Dalla fine della Seconda Guerra Mondiale ospita l'Ambasciata degli Stati Uniti d'America"`, `"Chiuso al pubblico è visibile solo dall'esterno."`, garden trees the last survival of the park, Giambologna *Venere Cesarini* 1583. |
| `/it/luoghi/chiesa-di-santa-maria-della-concezione` | **Confirmed.** 4 October 1626 first stone, Antonio Barberini, Michele da Bergamo with Antonio Casoni, *Hic jacet pulvis et cinis et nihil*, scissor stair, 5 chapels a side, crypt "realizzata verso la prima metà del XVIII secolo", 4000 friars, named paintings all present. |
| `/it/luoghi/porta-pinciana` | **Confirmed**, including the Location line `Porta Pinciana, Via Vittorio Veneto, 196` and the coordinate `POINT (12.488240996983 41.909800723485)`. Christo January 1974 / four days / forty days confirmed. Walkway "riaperto al pubblico nel 2021" confirmed. Scuola d'Arte Educatrice 1890 / "ancora oggi in attività" confirmed as Roma Capitale's wording. |
| `/it/luoghi/vittorio-veneto` | **Confirmed.** "Nel 1894 nasce così via Veneto… un'ampia 'passeggiata Umbertina'", 1919 renaming, Fellini "la ricostruisce negli studi di Cinecittà", Excelsior "inaugurato nel 1906 dal barone Von Pfyffer, proprietario del Grand Hotel". |
| `/it/luoghi/fontana-delle-api` | **Confirmed**, and it adds a fact the finder did not report: Roma Capitale states the fountain today "si trova oggi all'angolo tra piazza Barberini e via Veneto", and its Location line is **`Fontana delle Api, Piazza Barberini`**. See §4.2. |
| `/it/luoghi/palazzo-piacentini` | **Confirmed**, including the Polo culturale contact at Via Molise 2, the 15-day notice and the 25/30-person cap. |
| `/it/luoghi/villa-maraini` | **Confirmed on the substance, but see §5.2 — it does NOT contain the date the finder attributes to it.** |
| `/it/luoghi/istituto-svizzero` | **Confirmed**: "Attivo dal 1947". |
| `/it/luoghi/chiesa-evangelica-luterana` | **Confirmed** in full, including the three papal visits and the Steinmeyer opus 1515 of 1930. |
| `/it/luoghi/mura-aureliane` | **Does NOT say what the finder cited it for.** See §5.6. |

### 1.2 it.wikipedia — 22 pages via `action=parse` (raw wikitext, unmanglable)

`Ludovisi (rione di Roma)`, `Villa Ludovisi`, `Palazzo Margherita (Roma)`, `Via Vittorio Veneto`,
`Chiesa di Sant'Isidoro a Capo le Case`, `Chiesa di San Patrizio a Villa Ludovisi`,
`Chiesa di Santa Maria Immacolata a via Veneto`, `Hotel Flora`, `Hotel Majestic (Roma)`,
`Chiesa di San Marone`, `Villa Maraini`, `Casino dell'Aurora`, `Porta Pinciana`,
`Museo Boncompagni Ludovisi per le arti decorative`, `Sallustiano`, `Villino Florio (Roma)`,
`Villino Folchi`, `Villino Ferrari`, `Villino Amero D'Aste Stella`, and the five tail churches.
Plus one `action=query` existence check over 19 titles.

### 1.3 Institutional sites and the finder's claimed traps — every one reproduced

| URL | Result today |
|---|---|
| `museoecriptacappuccini.it` | **Live. Hours verbatim as the finder gave them**: "Lun - Dom 09:30 - 13:30 \| 14:30 - 18:30 (ultimi ingressi: 12:30 - 17:30)", 06.88803695, Via Vittorio Veneto 27 - 00187 Roma, "Museo associato AMEI". |
| `stpatricksamericanrome.org` | Live. "St. Patrick's Catholic American Parish in Rome". Confirmed as it.wikipedia's own official-site link. |
| `istitutosvizzero.it` | Live. |
| `ev-luth-gemeinde-rom.org` | Live, bilingual DE/IT. |
| `villaludovisi.org/about/` | Live — **and stale exactly as the finder said**. Still reads "the Princess (who lives in the Casino Aurora in perpetuity) is currently engaged in a major renovation effort", after a documented eviction on 20 April 2023. |
| `santisidoro.org` | **Trap confirmed.** An "Associazione culturale d'ispirazione cristiana" whose content is events at the Parrocchia San Castrese in **Marano**. Not the Roman church. |
| `stpatricksrome.com` | **Trap confirmed.** A domain-sale listing: "Premium domain · For sale", "14 characters · 6 years old". Not the parish. |
| `mimit.gov.it/it/ministero/palazzo-piacentini` | **HTTP 404 confirmed.** |
| `vincoliinrete.beniculturali.it` | **Socket timeout.** |
| `catalogo.beniculturali.it` | **Socket timeout.** |

**Ruling 1 independently re-confirmed today.** Both designation registers time out at the socket
on this network while it.wikipedia, Nominatim and turismoroma.it all answer normally. The
`evidence_ruling` stands. **No Ludovisi page may claim a designation, protection status or listing
date.** Nothing in the finder file attempts one; the finder's compliance on ruling 1 is clean.

### 1.4 I reproduced the finder's geography independently

The finder's boundary work is the load-bearing part of its file, so I re-ran Nominatim reverse
geocoding myself on the nine coordinates that decide something. **Every result matched the
finder's exactly:**

| Point | `quarter` | `road` |
|---|---|---|
| Porta Pinciana, Roma Capitale's coordinate | *(none — `suburb`=**Pinciano**)* | Piazzale Brasile |
| Porta Pinciana, OSM node `3450997579` | *(none — `suburb`=**Pinciano**)* | Corso d'Italia |
| Fontana delle Api, Roma Capitale's coordinate | **Colonna** | Piazza Barberini |
| Fontana delle Api, OSM node `1326896537` | **Ludovisi** | Piazza Barberini |
| Via Veneto lower, 41.90428 12.48862 | **Colonna** | Via Vittorio Veneto |
| Via Veneto mid, 41.90681 12.49024 | **Ludovisi** | Via Vittorio Veneto |
| Sant'Isidoro | **Ludovisi** | Piazza San Isidoro |
| San Patrizio | **Ludovisi** | Via Abruzzi |
| Via Boncompagni 18 (the museum) | **Sallustiano** | Via Lucullo |

I also found **a third, independent line of evidence the finder did not cite**, which corroborates
its geography throughout: **it.wikipedia's own rione categories.** `Palazzo Margherita` carries
`[[Categoria:Roma R. XVI Ludovisi]]`; the Concezione, Sant'Isidoro, San Patrizio, San Marone and all
five tail churches carry `[[Categoria:Chiese di Roma (rione Ludovisi)]]`; the four villini carry
`R. XVI Ludovisi`; **`Museo Boncompagni Ludovisi per le arti decorative` carries
`[[Categoria:Roma R. XVII Sallustiano]]`**; and `Via Vittorio Veneto` carries **both**
`R. III Colonna` and `R. XVI Ludovisi`. Roma Capitale states the rione directly on two pages:
Palazzo Margherita is "all'interno dell'elegante Rione XVI - Ludovisi" and Villa Maraini "sorge nel
Rione Ludovisi". And `Sallustiano`'s own article gives the reciprocal border — "via Calabria-via
Boncompagni-via Lucullo-via Friuli con il rione Ludovisi" — so the two rione articles agree that
via Boncompagni is the line.

**The finder's geography is sound and reproducible. I am endorsing it, not taking it on trust.**

---

## 2. PUBLISH — 3 sections

### 2.1 §3.3 Museo e Cripta dei Cappuccini — **PUBLISH**

Re-fetched the institution's own site today; the identity, address, telephone and hours are
verbatim what the finder reported. That is exactly what the corpus rule lets an official site
establish, and the finder claimed nothing more from it. The crypt's substance is double-sourced to
Roma Capitale and it.wikipedia, which I read in full.

Publish with the finder's own resolution of the two date claims — Roma Capitale's "realizzata verso
la prima metà del XVIII secolo" for the crypt's making and it.wikipedia's 1528–1870 for the
gathering of the bones — kept as two separate facts, and **"about 4,000 friars"**, matching
it.wikipedia's "circa 4000". The plaque quotation is publishable.

One thing to carry that the finder omitted and I confirmed: it.wikipedia gives the church complex's
official site as **`cappucciniviaveneto.it`**, a different domain from the museum's
`museoecriptacappuccini.it`. Two live domains for one complex; use the museum's for the museum.

*Standing instruction:* hours change. Re-fetch `museoecriptacappuccini.it` immediately before ship.

### 2.2 §3.12 Chiesa di San Patrizio a Villa Ludovisi — **PUBLISH**

The cleanest entry in the file. Every claim survives against the wikitext I read: 1908, Aristide
Leonori, neo-Renaissance with Romanesque-Byzantine motifs on the façade, three naves, coffered
ceiling, apse mosaic *San Patrizio che predica alle folle* by Rodolfo Villani 1929, the apse
inscription, the 16th-century *Madonna delle grazie* from the vanished Santa Maria in Posterula.

The 2017 handover is the strongest single fact in the rione and is publishable in full: Irish
Augustinians until 2017; from **1 August 2017** the Paulist Fathers, who moved from Santa Susanna
(their seat since 1922); from that date the national parish of Americans resident in Rome, in place
of Santa Susanna; all Masses in English. it.wikipedia sources this to the *National Catholic
Reporter*, a real outlet, and the parish's own live site corroborates the identity.

Rione: Nominatim=Ludovisi (I reproduced it), plus `Categoria:Chiese di Roma (rione Ludovisi)`. The
finder's note that the church stands on the odd/Ludovisi side of the boundary street is correct.

### 2.3 §3.14 Chiesa di San Marone — **PUBLISH**

Thin, and honestly so. Everything the finder wrote is in the article verbatim: 1890, Andrea Busiri
Vici, the attached Maronite monastery converted into a hotel in 1936, the 5th-century Syrian hermit
founder, served by Maronites of Lebanon in the Antiochene rite in Arabic, the national church of
Lebanon. Rione confirmed by category and by Nominatim.

**Take the finder's structural suggestion.** Writing the three national churches as one thread —
Irish by ownership at Sant'Isidoro, American since 2017 at San Patrizio, Lebanese at San Marone —
is better than three thin separate entries, and every element of it is sourced. It is the best
editorial idea in the finder file.

---

## 3. REWRITE — 12 sections, with the exact replacement wording

### 3.1 §3.1 Via Vittorio Veneto — **REWRITE: intro material, not an exclusive place claim**

The underlying facts are sound and I confirmed all of them. What overreaches is the *form*: this
cannot be a Ludovisi place record, because both sources say in terms that it is not wholly
Ludovisi's. it.wikipedia's infobox files it under `R. III Colonna` **and** `R. XVI Ludovisi`, it
carries both categories, and the prose says "Nel suo tratto iniziale, separa questo rione da quello
di Colonna." My own reverse geocode splits the street: lower → Colonna, mid → Ludovisi.

Write it into the intro, in these words:

> Via Vittorio Veneto, universally called via Veneto, climbs from Piazza Barberini to Porta
> Pinciana. it.wikipedia files the street under two rioni, Colonna and Ludovisi, and states that
> along its opening stretch the street separates the one from the other; its upper length runs
> through Ludovisi. Roma Capitale dates the street's creation to 1894, when it was laid out as a
> broad "passeggiata Umbertina" during the building-over of Villa Ludovisi; it.wikipedia's rione
> article instead says the street was completed in 1906. It was renamed for the battle of Vittorio
> Veneto by resolution of the Giunta Municipale, no. 37 of 25 October 1919. Roma Capitale records
> that the street's international fame rests on the Dolce Vita, and states that Fellini rebuilt via
> Veneto in the studios at Cinecittà rather than filming on it.

Keep the Cinecittà correction. I confirmed it on both sources and it is the single most useful
sentence in the file. **Do not write a length in metres**: the 750 m figure is an unreferenced
it.wikipedia infobox value. **Do not name Café de Paris or Doney as places** — it.wikipedia records
Café de Paris as closed in 2008.

### 3.2 §3.2 Santa Maria della Concezione dei Cappuccini — **REWRITE (one claim)**

Everything else PUBLISHes. The single defect is the Caravaggio line. The finder flagged it
correctly; here is the wording that discharges the flag:

> it.wikipedia records that the sacristy, now a museum, holds a *San Francesco in meditazione*
> recently attributed to Caravaggio. The attribution is recent and is not settled.

**Do not write "a Caravaggio".** Also available and worth carrying, both confirmed: it.wikipedia
dates construction 1626–1631 and the Coccetti *Assunzione* on the barrel vault to 1796, and records
that the old convent was demolished for the Ministry of Corporations in the 1920s and promptly
rebuilt beside the church in 1925 — which ties this entry to Palazzo Piacentini below.

Roma Capitale calls this "la prima chiesa romana dedicata all'Immacolata Concezione". That is a
first-claim, but it comes from Roma Capitale and not from the church, so it is publishable **only**
as "Roma Capitale describes it as the first church in Rome dedicated to the Immaculate Conception."

### 3.3 §3.4 Palazzo Margherita — **REWRITE (ruling-2 wording is mandatory)**

The history is confirmed on both sources and the discrepancy the finder flagged is real: Roma
Capitale says the Embassy has been here "dalla fine della Seconda Guerra Mondiale"; it.wikipedia
says the palace became the Embassy in **1931** and was bought by the U.S. Government in **1946**.
Neither source is the Embassy; `it.usembassy.gov` 403s to urllib and I could not fetch it either.

Write both, attributed, and resolve nothing:

> Palazzo Margherita was built to Gaetano Koch's design for Rodolfo Boncompagni Ludovisi, Prince of
> Piombino, on the ground of the Villa Ludovisi his family was subdividing; Roma Capitale gives the
> date as 1890 and it.wikipedia as 1886–1890. it.wikipedia records that the prince built it to
> replace Palazzo Piombino on via del Corso, from which he had been expropriated, and that the
> building incorporates at its rear the Palazzo Grande of 1622, the original nucleus of the villa —
> which it.wikipedia says is neither visitable nor visible from the street. The palace passed to
> the House of Savoy in 1900 and was the residence of the Queen Mother Margherita, from whom it
> takes its name, until her death in 1926. Accounts of the American tenancy differ: Roma Capitale
> says the Embassy of the United States has been here since the end of the Second World War, while
> it.wikipedia says the palace became the Embassy in 1931 and was bought by the United States
> Government in 1946.
>
> The building is the diplomatic mission of the United States in Italy. It stands on Italian soil
> and is subject to Italian law. Its premises are inviolable under the Vienna Convention on
> Diplomatic Relations, which binds Italy to protect them; that is an obligation on Italy, not a
> transfer of sovereignty, and the palace is not United States territory.
>
> Roma Capitale states that the palace is closed to the public and can be seen only from outside.

**The second and third paragraphs are not optional.** Do not write "American soil". Do not describe
the building as extraterritorial: Lateran Treaty Art. 15 concerns Holy See properties and has
nothing whatever to do with this palace.

Two further constraints. The Giambologna *Venus* superlative must read "Roma Capitale describes it
as the only work by the sculptor in Rome" — never in the corpus's own voice. And on the garden
trees, prefer it.wikipedia's fuller version, attributed: "it.wikipedia records that the trees of
this garden and those of the Casino dell'Aurora are the last remnant of the villa's park."

### 3.4 §3.5 Casino dell'Aurora — **REWRITE (no access statement, at all)**

I read the `Villa Ludovisi` wikitext in full and the finder's account of the access history is
exactly right and fully cited on it.wikipedia: the auction was announced in late 2021; **"Tutte le
audizioni, tenutesi da gennaio 2022 a gennaio 2023, sono andate deserte"**; **"Il 20 aprile 2023 la
principessa Rita Boncompagni Ludovisi… ne è stata sfrattata per decisione giudiziaria"**; and in
July 2023 the heirs agreed a private sale. Meanwhile `villaludovisi.org` — which I fetched today —
still says the Princess "lives in the Casino Aurora in perpetuity". That page is stale and cannot
be used for anything about access or occupancy.

> The Casino dell'Aurora, also called Casino Ludovisi or Villa Aurora, on via Aurora, is the one
> building of Villa Ludovisi to survive intact. it.wikipedia records that it was built for Cardinal
> Francesco Maria Del Monte in the sixteenth century and remodelled for Ludovico Ludovisi between
> 1621 and 1632, and that it takes its name from Guercino's *Aurora* on the vault of the
> ground-floor salone. it.wikipedia also records that the building holds Caravaggio's *Giove,
> Nettuno e Plutone*, painted for Del Monte between 1597 and 1600, which it describes as
> Caravaggio's only wall painting, and a triptych by Guercino and Tassi on the piano nobile.
>
> The building is private. it.wikipedia records that it was put up for auction after an inheritance
> dispute, that every auction held between January 2022 and January 2023 drew no bidder, that
> Princess Rita Boncompagni Ludovisi was evicted by court order on 20 April 2023, and that in July
> 2023 the heirs agreed to sell it privately instead. Whether and on what terms it can be visited
> is not established by any source we can reach, and this guide does not state opening
> arrangements for it.

**The corpus must not state hours, tours, ticketing or any access arrangement for this building.**
Also carry the finder's disambiguation warning: `it:Casino dell'Aurora` is a **disambiguation
page** covering two buildings in two rioni — I fetched it and it is four lines long. The Ludovisi
one is covered inside the `Villa Ludovisi` article; it dates Guercino's *Aurora* to 1621 and Guido
Reni's, at Palazzo Pallavicini Rospigliosi, to 1614.

### 3.5 §3.6 Villa Ludovisi — **REWRITE: intro spine, not a place record**

The finder is right that this explains everything else and right that it is not somewhere a visitor
can go. It must not be emitted as a place. Move it to the intro.

I confirmed every element: Ludovico Ludovisi, nephew of Gregory XV, bought the Villa Orsini in 1622
and enlarged it, over the ground of the Horti Sallustiani; buildings by Domenichino; the gardens
attributed at least in part to Domenichino on Bellori (1672), Malvasia (1678), Sebastiani (1683) and
Milizia (1768), with later writers attributing them to André Le Nôtre on the strength of Milizia's
own 1781 *Memorie*. **Write it as the unresolved dispute it.wikipedia presents. Do not pick Le
Nôtre.** Subdivision decided 1883, convention with the Comune and the Società Generale Immobiliare
in 1886 "sotto gli auspici del sindaco di Roma, duca Leopoldo Torlonia" — confirmed verbatim.

On the size, take the finder's advice and do not average:

> The villa's extent is reported variously: it.wikipedia's article on the villa gives 30 hectares,
> its article on the rione says the 1886 convention put about 25 hectares of park to subdivision,
> and the Boncompagni Ludovisi family's own archive at villaludovisi.org gives 89.6 acres.

**Two corrections to the finder's text here.**

First, on the sculpture: it.wikipedia says a hundred or so pieces were bought by the Italian state
in 1910 and **first placed in the Piccolo Chiostro at Santa Maria degli Angeli**, and that the
collection "si trova ora nel… palazzo Altemps". Write the intermediate step or write only "now in
Palazzo Altemps" — do not write that they went straight there in 1910. And **delete the finder's
parenthetical "(rione Sant'Eustachio)"**: it is unverified, it is outside this rione's remit, and
it.wikipedia locates Palazzo Altemps only by the vague-proximity phrase "a due passi da piazza
Navona", which cannot be carried. Say only that the collection is not in Ludovisi.

Second, the *Trono Ludovisi* line is confirmed exactly — not part of the collection, found in 1887
during the destruction of the villa — and should be kept; it is a good fact.

### 3.6 §3.9 Villa Maraini / Istituto Svizzero — **REWRITE (the finder misattributed a date)**

See §5.2 below for the error. The sound facts, all confirmed on Roma Capitale: built 1903–1905 by
the Ticinese architect Otto Maraini for his brother Emilio, the industrialist who introduced
beet-sugar production to Italy; eclectic with neo-Baroque elements; on an artificial hill made from
the spoil of the excavation of via Ludovisi; garden with a grotto nymphaeum; **Torre Belvedere 26
metres**; the widow Countess Carolina Maraini-Sommaruga gave it to the Swiss Confederation in 1946
on the condition it be "perpetuamente al servizio della cultura, nel segno della collaborazione tra
la Svizzera e l'Italia"; Roma Capitale says "L'Istituto organizza regolarmente visite guidate
all'interno della villa", with `visite@istitutosvizzero.it` and `06 420421`.

Write the date question honestly:

> Roma Capitale's page on the Istituto Svizzero says the institute has been active since 1947;
> it.wikipedia says the villa was entrusted to it in 1948, when it established its seat here.

**Three things to strike.** (a) Roma Capitale's "di poco inferiore alla cupola di San Pietro in
Vaticano" for the tower — a comparison the corpus should not repeat in any form. (b) Roma
Capitale's Istituto Svizzero page describes the site as "nelle immediate vicinanze di Piazza di
Spagna e Villa Borghese" — **vague proximity, banned, do not translate it through**. (c) Do not
state hours from Roma Capitale; Roma Capitale itself says to consult the institute's site, which is
live.

On naming: it.wikipedia's article sits at the title *Villa Maraini* but its text and infobox both
call the building **Villino Maraini**, and the rione article lists it as Villino Maraini. Roma
Capitale calls it Villa Maraini. Use Villa Maraini and note the alternative once.

### 3.7 §3.10 Palazzo Piacentini — **REWRITE (contact and address only)**

Substance confirmed on both sources, including the whole interior list — Sironi's *Carta del
Lavoro*, Ferrazzi's tapestries, Prampolini's *Madonna dell'Aria*, Depero's *Sintesi Veneziana*,
Prini's bronze doors on via Veneto, Pini's atrium sculptures and the Parlamentino "ancora
utilizzato per le riunioni del Dicastero" — and the access terms verbatim: "Visitabile solo su
prenotazione con visita guidata gratuita", Polo culturale, Via Molise 2, group list at least 15
days ahead, maximum 25/30 people.

Two fixes. **The address:** give both, since Roma Capitale's Location line is `Palazzo Piacentini,
Via Molise, 2` and it.wikipedia's infobox gives via Veneto 33, and the building is a corner. Write
"Via Molise 2, on the corner of via Veneto".

**The contact:** the finder is right that `mimit.gov.it/it/ministero/palazzo-piacentini` 404s — I
reproduced the 404. But the URL Roma Capitale prints is a `mise.gov.it` address and the contact
email it gives is `polo.culturale@mise.gov.it`, both on the ministry's superseded domain. **Do not
hardcode either.** Write:

> The ministry states that the palace can be visited only by appointment, on a free guided tour
> arranged through its Polo culturale at Via Molise 2, with the full list of the group — no more
> than 25 to 30 people — sent at least fifteen days in advance. Check the ministry's current site
> for the booking address before going.

Keep the finder's do-not-confuse note: this is not the Palazzo Piacentini in via Arenula, which is
by Pio Piacentini.

### 3.8 §3.11 Sant'Isidoro a Capo le Case — **REWRITE, and the boundary flag must be strengthened**

The substance is confirmed line by line against the wikitext: Ottaviano Vestri di Barbiano's
munificence per a bull of Urban VIII of 1625; built for Gregory XV's 1622 canonisation of five
saints including Isidore the Farmer; Spanish Discalced Franciscans; **after two years church and
convent passed to the Irish Franciscans, "che ancora oggi ne sono i proprietari"**; infobox
1622–1672; Casoni then Domenico Castelli, façade with portico and double flight of steps by Carlo
Francesco Bizzaccheri 1704–1705; Maratta's *Immacolata Concezione* in the De Sylva chapel with the
picture frame designed by Bernini, the chapel remodelled to Bernini's design and the funerary
monuments by Paolo Valentino Bernini; Sacchi's high altarpiece; two cloisters, the small one by
Casoni in 1626; the Nazarenes resident between 1810 and Pius VII's return in 1814, from which via
degli Artisti takes its name.

Two corrections. **(a)** it.wikipedia says the Irish Franciscans came fleeing persecution — carry
the reason, it is the point of the entry. **(b)** it.wikipedia says the second cloister is "chiamato
*chiostro del Wadding* dal nome del suo autore" — i.e. that Wadding *made* it. That is a strong
claim about a theologian, in an article that cites nothing for it. Write the finder's safer version:
"the second is named for Luke Wadding."

**The boundary flag needs strengthening, and this is a finder miss.** it.wikipedia's own
bibliography for this church links Armellini's *Le chiese di Roma dal secolo IV al XIX* (1891) at a
URL whose page and anchor are `.../Colonna.html#S.Isidoro_a_Capo_le_Case` — **Armellini filed
Sant'Isidoro under rione Colonna.** So we now have a nineteenth-century gazetteer placing the church
in Colonna, a boundary text that runs the line down its own street, and Nominatim putting Via degli
Artisti 18 in Colonna, against a modern it.wikipedia category and two coordinate methods saying
Ludovisi. Modern evidence wins and I am letting the entry stand as Ludovisi — but §7 must show the
arbitrator the Armellini fact, not just "it sits on the line".

### 3.9 §3.13 Chiesa evangelica luterana (Christuskirche) — **REWRITE (one proximity phrase)**

Confirmed in extraordinary detail against Roma Capitale, which is the most complete page on this
church I fetched: 1910–1922, opened 1922, Franz Heinrich Schwechten, court architect to Wilhelm II
and architect of the Kaiser-Wilhelm-Gedächtniskirche; the paving of a 4-metre-wide Roman road found
at 2.40 m depth during construction; the three papal visits on 11 December 1983, 14 March 2010 and
15 November 2015; the façade, the three statues over the portico, the matronei, the Tree of Life
apse mosaic with Christ Pantocrator in a mandorla, the font modelled on Reykjavík's Dómkirkjan, and
the Steinmeyer organ opus 1515 of 1930 with 35 stops, two 61-note manuals and a 30-note pedalboard.

**The one defect is the obelisk sentence.** Roma Capitale's wording is "A pochi metri dal luogo in
cui sorge la chiesa" — an unmeasurable impression of nearness, which the corpus rule bans. Replace
with:

> Roma Capitale records that a thirteen-metre Roman obelisk from the Villa of Sallust — the Horti
> Sallustiani — was found in this part of the city in the nineteenth century, and that it now
> stands in front of Trinità dei Monti.

Address: Roma Capitale's Location line is `Chiesa Evangelica Luterana, Via Sicilia, 70` and its text
says the façade gives onto via Sicilia; Nominatim resolves the building to via Toscana. Corner site.
Give Via Sicilia 70, which is what Roma Capitale publishes.

### 3.10 §4.5 Hotel Excelsior — **REWRITE: a fact inside via Veneto, not a place record**

The 1906 opening survives because **Roma Capitale states it independently of the hotel** — "grandi
alberghi di prima categoria come l'Excelsior, inaugurato nel 1906 dal barone Von Pfyffer,
proprietario del Grand Hotel" — and it.wikipedia agrees on 1906. That clears the corpus rule, which
only bars trading-duration claims sourced to the business itself.

But nothing else survives. The CIGA/Sheraton/Starwood ownership chain and the *La dolce vita*
shooting claim are unreferenced it.wikipedia. Publish one sentence, inside the via Veneto material:

> Roma Capitale records that the Hotel Excelsior on via Veneto was inaugurated in 1906 by Baron von
> Pfyffer, the owner of the Grand Hotel, among the first-class hotels built along the new street.

**Do not emit the Excelsior as a place record and do not claim anything about it as a business
today.**

### 3.11 §4.6 Hotel Flora — **REWRITE, heavily: the architectural history only**

See §5.1 — the finder made a factual error here and inverted the sourcing. What survives is the
building history, which it.wikipedia states plainly: a late-nineteenth-century apartment block by
Filippo Galassi, Borghese property, bought by the Russo-German impresario Krumbügel and remodelled
as a Liberty *pensione* by Andrea Busiri Vici in 1895, **opened as a hotel in 1907 after a further
restoration once it had passed to Italo Signorini**, and raised a storey by Giovanni Battista Milani
in the second decade of the twentieth century.

**DROP the wartime and 1981 material from this wave.** Its citations on it.wikipedia are
`romasparita.eu` (a photo-nostalgia site), `dagospia.com` (a gossip site), a 2025 trade paperback
and one *Corriere* feature. The corpus rule requires a source we actually fetched for every factual
claim, and we fetched none of those four. If a later wave fetches the *Corriere* piece directly it
can be reconsidered; on today's evidence it cannot be written.

### 3.12 §5.12 Largo Federico Fellini — **REWRITE: a detail, not a place**

it.wikipedia's `Via Vittorio Veneto` infobox gives the street's terminus as `Largo Federico Fellini`
and the article carries an image of a Fellini plaque. That is enough for a clause and not enough for
a place record:

> Via Veneto ends at the Aurelian Walls, at the largo named for Federico Fellini.

---

## 4. Straddlers escalated to the arbitrator — 4, plus 2 watch items

**I am escalating, not taking. None of these may appear as a Ludovisi place in the seed file.**

### 4.1 Porta Pinciana (§3.7) — **Ludovisi ↔ Q. III Pinciano — DROP from this wave**

The finder was right to refuse this and I refuse it too, more firmly. Roma Capitale publishes a
**Ludovisi street address** — Location line `Porta Pinciana, Via Vittorio Veneto, 196` — together
with a coordinate that **I independently reverse-geocoded to Pinciano** (`Piazzale Brasile`), and
the OSM node also reverse-geocodes to Pinciano (`Corso d'Italia`). it.wikipedia's boundary text
makes the walls *up to Porta Pinciana* the border, so the gate is the terminus of the boundary
itself. Roma Capitale is internally inconsistent and both of my geocodes point away from Ludovisi.

The finder's warning about the unit tier is correct and important: **Pinciano is a *quartiere* in
Municipio II**, so a wrong call puts the gate in the wrong administrative tier as well as the wrong
unit. Note that Pinciano is in scope for the programme as a tier-1 quartiere.

The Porta Pinciana material is excellent — the posterula, Honorius, the asymmetrical towers, the
gens Pincia, Porta Salaria Vetus, Porta Turata, and the Belisarius legend with it.wikipedia's flat
correction that the story is false — and whoever gets the gate should have all of it, including
Roma Capitale's Christo entry (January 1974, wrapped over four days, standing forty days). **Ludovisi
does not get it on this evidence.**

### 4.2 Fontana delle Api (§3.15) — **Ludovisi ↔ Colonna ↔ Trevi — DROP from this wave**

Stronger against Ludovisi than the finder's file conveys. **Roma Capitale's own Location line is
`Fontana delle Api, Piazza Barberini`**, and its text says the fountain "si trova oggi all'angolo tra
piazza Barberini e via Veneto". I reverse-geocoded both published coordinates: Roma Capitale's →
**Colonna**, OSM's → **Ludovisi**. Piazza Barberini, Palazzo Barberini and the Fontana del Tritone
beside it are **Trevi's and reserved to wave 2**.

Against that, it.wikipedia's rione article does list the Fontana delle Api among Ludovisi's civil
architecture — which is why this is a genuine three-way question and not a simple no.

The content is fully verified and should travel with the ruling wherever it lands: commissioned 1644
by Urban VIII from Bernini as a service fountain collecting the return water of the Fontana del
Tritone; the open-shell form; the three bees; Pasquino's line about the Barberini sucking the world
and now wanting to suck time as well; the erased digit; **Urban VIII died on 29 July, eight days
before the twenty-second year of his pontificate would have begun**; and — the paragraph no page may
omit — **dismantled in 1865, most pieces lost by the time reassembly was decided in 1915, a copy
commissioned from Adolfo Apolloni and executed in travertine instead of Luni marble, the lower valve
raised on a course of blocks and the upper valve no longer resting against a building.** The finder
is right that calling this "Bernini's fountain" without that paragraph misleads.

### 4.3 Via Vittorio Veneto, lower stretch (§3.1) — **Ludovisi ↔ Colonna — escalated**

Handled as intro material in §3.1 above. The arbitrator needs to rule whether the street gets a
place record at all and under which rione; the corpus gate will fail if both Ludovisi and Colonna
emit it. My recommendation: **neither emits it as a place**; both may describe it in prose with the
two-rione fact stated, which is what both sources actually say.

### 4.4 The Aurelian Walls, Ludovisi stretch (§3.8) — **programme-wide linear straddler — DROP**

The finder is right that this is not a Ludovisi possession and right that it is not a Ludovisi
question. A single monument crossing Ludovisi, Sallustiano, Pinciano and more in this quadrant
alone needs one programme-level ruling, not four rioni each claiming a stretch.

**Both embedded sub-items drop with it, and for reasons beyond the straddle.**

- **The colossal bust.** Roma Capitale itself says the dedication is uncertain — "Dedicato a
  Belisario (o ad Alessandro Magno) era **forse** anche l'enorme busto marmoreo" — and locates it by
  the phrase "in una nicchia **a poca distanza** dalla porta", which is exactly the vague proximity
  the corpus rule bans. An entry whose identification is uncertain and whose only published location
  is an unmeasurable one cannot be written. If the wall ruling lands on Ludovisi it may be
  reconsidered, with the identification written as uncertain and with no distance phrase.
- **The Scuola d'Arte Educatrice in Torre XXXIX.** Francesco Randone's 1890 founding and the quoted
  charter are confirmed on Roma Capitale. But **"ancora oggi in attività" is a present-tense claim
  resting on one undated tourism page**; the finder could not reach a school site and neither did I
  attempt to rescue it. **Do not write that the school is still active.** It is also a school, not a
  visitor destination.

**One sourcing correction.** The finder cited both `turismoroma.it/it/luoghi/porta-pinciana` and
`turismoroma.it/it/luoghi/mura-aureliane` for the wall-walk reopening. I read the Mura Aureliane
page in full: **it does not mention Porta Pinciana, the camminamento to Porta Salaria, or 2021 at
all.** The claim rests on the Porta Pinciana page alone, where it is confirmed. And it is a *past*
reopening — "riaperto al pubblico nel 2021" — which does not license the present tense. If anyone
writes the wall walk, write "Roma Capitale records that the walkway along the walls from Porta
Pinciana to Porta Salaria reopened to the public in 2021", and verify current access before ship.

### 4.5 Watch — Sant'Isidoro a Capo le Case

Surviving as Ludovisi (see §3.8) but the arbitrator must see the Armellini/Colonna evidence.

### 4.6 Watch — Piazza Fiume

The finder found it.wikipedia contradicting itself — boundary text "fino a piazza Fiume (esclusa)",
yet the same article lists Piazza Fiume among the rione's piazze. I confirmed both halves in the
wikitext. The finder did not take it. **Correct.** Escalating for the record; my reading agrees with
the boundary text and with Sallustiano's reciprocal border description, which I also fetched.

---

## 5. What the finder got wrong

Reported by name, as the brief requires. None of these is disqualifying — this is a strong file —
but each one would have put a false or unsupported statement into the corpus.

### 5.1 Hotel Flora: the source does not say the man was killed

The finder wrote: *"On 8 October 1981 an explosive device planted under a bed killed the PLO
official Majed Abu Sharar."*

it.wikipedia says: *"L'8 ottobre 1981 fu teatro di un attentato terroristico compiuto dai servizi
segreti israeliani (Mossad) ai danni di Abu Sharar un alto rappresentante dell'OLP"*, and separately
that the device was placed under the bed of a room booked through the Algerian embassy under the
name Abbas Zaytouni. **The article nowhere states that he died.** The finder asserted a death its
source does not contain. This is the one hard sourcing failure in the file.

The finder also **inverted the citations**. It wrote that "the 1981 attribution to Mossad rests on
the weaker citations". In fact the Mossad sentence carries the *Corriere della Sera* reference
(Foschi, 30 July 2007); it is the **1943** GAP action that carries `dagospia.com`. The finder's
caution was right in spirit and wrong in the specifics, which matters because the specifics decide
what is salvageable. Both episodes are dropped in §3.11 above.

### 5.2 Villa Maraini: a date attributed to a page that does not contain it

The finder wrote: *"Roma Capitale's Istituto Svizzero page says the institute has been 'Attivo dal
1947'; its Villa Maraini page and it.wikipedia both say the institute took up residence in 1948."*

I fetched the Villa Maraini page and searched it: **"1948" does not appear on it.** The page says
only "Oggi è sede dell'Istituto Svizzero di Roma". The 1948 date comes from it.wikipedia alone — and
it.wikipedia's article is a flagged stub (`{{S|ville di Roma}}`) whose **single citation is
`info.roma.it`**, the enthusiast gazetteer the finder itself lists at §8.2 item 8 as "not an
authority". So the "two sources agree on 1948" framing is wrong twice over. Handled in §3.6.

### 5.3 Villino Ferrari: the blog problem is the whole article, not one line

The finder wrote that the 1957 wall-opening detail was "sourced by it.wikipedia to `info.roma.it` —
a hobbyist gazetteer, not an authority; attribute or drop", implying the rest was better sourced.

I read the wikitext. **Every substantive statement in the article — the 1901 date, Carlo Pincherle,
Giuseppe Ferrari, the 1930s passage to the notary Colizzi, the passage to the FIEG, and the entire
architectural description — hangs off one named reference, `rerumromanarum.com`.** Only the 1957
line is `info.roma.it`. Both are blogs; there is no third source. That moves the entry from
"attribute" to **DROP**, which is how I have ruled it.

### 5.4 Three internal contradictions the finder's §8.3 list missed

The finder's contradiction inventory is good and I am endorsing all eight entries in it. It missed
three more, all of which I confirmed in the wikitext:

1. **The convention date, within it.wikipedia.** `Palazzo Margherita (Roma)` says the prince
   subdivided the villa "in convenzione con il Comune di Roma e la Società Generale Immobiliare nel
   **1883**". The rione article and `Villa Ludovisi` both say the 1883 decision was followed by an
   **1886** convention. Do not write a single convention date without saying which article gives it.
2. **When the rione came into being.** `Palazzo Margherita (Roma)` states that the subdivision "diventerà
   infatti il rione Ludovisi nel **1921**". The finder dated the rione to the 1886 convention and
   wrote that "Ludovisi is barely 140 years old". Both are true of different things and the page
   must distinguish them: **laid out from 1886, constituted as a rione in 1921** — which is also
   what the roster's own note about the rioni being "fixed since 1921" implies.
3. **When Ludovico Ludovisi bought the ground.** Roma Capitale's via Veneto page says he bought the
   Horti land in **1621**; it.wikipedia says he bought the Villa Orsini in **1622**. A fourth
   Roma-Capitale-versus-it.wikipedia split, unlisted by the finder.

Also, `Villa Ludovisi`'s infobox gives `demolito = 1885`, which sits oddly against the 1886
convention in its own prose. Do not use the infobox year.

### 5.5 Four vague-proximity phrases carried through from sources without flagging

The corpus rule bans unmeasurable impressions of nearness. Four appear inside material the finder
quoted or paraphrased approvingly, and none is flagged in its file:

- Roma Capitale on the colossal bust: "in una nicchia **a poca distanza** dalla porta".
- Roma Capitale on the Christuskirche obelisk: "**A pochi metri** dal luogo in cui sorge la chiesa".
- Roma Capitale on the Istituto Svizzero: "**nelle immediate vicinanze** di Piazza di Spagna e Villa
  Borghese".
- it.wikipedia on Palazzo Altemps: "**a due passi** da piazza Navona".

All four must be dropped in translation, not rendered as "a short distance from", "a few metres
from", "close to" or "a stone's throw from". Handled at each site above.

### 5.6 The Mura Aureliane page does not support what it was cited for

Covered at §4.4. The finder listed `turismoroma.it/it/luoghi/mura-aureliane` as a source for the
wall-walk reopening; the page contains no such statement. The claim survives on the Porta Pinciana
page. **Reported by name as the brief requires: this is the one cited source that does not say what
it was cited for.**

### 5.7 Two small over-specifications

- **Hotel Majestic address.** it.wikipedia's infobox gives `Via Vittorio Veneto, 54`. The finder
  wrote "50/54". Moot, since the entry drops.
- **Harry's Bar.** The finder reported finding only OSM plus a mention in the via Veneto list.
  `Harry's Bar (Roma)` **does exist** on it.wikipedia. It does not change the ruling — the Dolce
  Vita claim there is cited to `harrysbar.it`, the business's own site, which is precisely what the
  corpus rule bars.

---

## 6. What the finder got right, and I confirmed

Worth recording, because the arbitrator will otherwise only see the corrections.

- **All five source traps in §8.2 reproduce exactly.** `santisidoro.org` is a Marano association;
  `stpatricksrome.com` is a domain-sale listing; `it:Casino dell'Aurora` is a four-line
  disambiguation page; `villaludovisi.org` is stale on occupancy after the 2023 eviction;
  `mimit.gov.it/…/palazzo-piacentini` 404s. Propagate these to the other waves.
- **The red-link list in §5.13 is exactly right.** I ran an `action=query` existence check:
  `Palazzo Coppedé`, `Fontana del cane`, `Hotel Balestra`, `Jumeirah Grand Hotel` and `Villino
  Piombino` are **all missing** on it.wikipedia. The finder saved the next agent a wasted fetch.
- **The Museo Boncompagni Ludovisi ruling is right and better supported than the finder knew.**
  Beyond both of its coordinate methods, it.wikipedia files the museum under
  `[[Categoria:Roma R. XVII Sallustiano]]` and names its own photograph
  `Sallustiano - v Boncompagni villino…`. **The museum is in Sallustiano.** A museum carrying this
  rione's family name, on this rione's boundary street, belonging to the next rione — the finder is
  right that it is the likeliest single error a careless source will hand the corpus, and it caught
  it.
- **The via Boncompagni parity rule holds** and is corroborated by `Sallustiano`'s own article,
  which gives the reciprocal border down the same street.
- **The Cappuccini hours are correct to the character** on a re-fetch made today.
- **Ruling 1 re-tested and re-confirmed.** Both registers time out at the socket while everything
  else on the same network answers.
- **Ruling 2 handled better than required.** The finder pre-empted the embassy misconception at
  §3.4, §5.2 and §5.3, stated correctly that the Lateran Treaty Art. 15 list **contains nothing in
  Ludovisi**, and did not confuse it with the Art. 16 list. Nothing here needed correcting.
- **Ruling 3 clean.** `photos: []` throughout; two photo leads parked as prose in §9 with no URLs
  and no files.
- **Reserved list clean.** Nothing on the wave 1/2 reservation list is claimed. The finder correctly
  declined the Quirinal Palace, Piazza Barberini, Palazzo Barberini and the Fontana del Tritone, and
  correctly separated the Fontana delle Api from them as a distinct monument.

---

## 7. TIER RULING — **GUIDE**, on 10 surviving places

The brief told me Ludovisi was expected to land at town-page, that this would be a correct outcome,
and that I must not stretch to reach guide. **I looked hard for the town-page answer and it is not
the honest one.** Ten places survive with the rione established by at least two independent methods
each and the substance double-sourced:

| # | Place | Rione evidence | Substance |
|---|---|---|---|
| 1 | Chiesa di Santa Maria della Concezione dei Cappuccini | Roma Capitale coordinate + it.wiki category | Roma Capitale + it.wikipedia |
| 2 | Museo e Cripta dei Cappuccini | Nominatim + Roma Capitale | Own site (re-fetched) + Roma Capitale + it.wikipedia |
| 3 | Palazzo Margherita | **Roma Capitale states the rione in words** + it.wiki category | Roma Capitale + it.wikipedia |
| 4 | Casino dell'Aurora | Nominatim + it.wikipedia | it.wikipedia (well cited to press) |
| 5 | Villa Maraini / Istituto Svizzero | **Roma Capitale states the rione in words** | Roma Capitale ×2 + own site |
| 6 | Palazzo Piacentini | Roma Capitale coordinate + it.wiki | Roma Capitale + it.wikipedia |
| 7 | Chiesa di Sant'Isidoro a Capo le Case | Nominatim (reproduced) + it.wiki category | it.wikipedia (detailed) |
| 8 | Chiesa di San Patrizio a Villa Ludovisi | Nominatim (reproduced) + it.wiki category | it.wikipedia (press-cited) + own site |
| 9 | Chiesa evangelica luterana (Christuskirche) | Roma Capitale coordinate + it.wiki category | Roma Capitale (very full) + own site |
| 10 | Chiesa di San Marone | Nominatim + it.wiki category | it.wikipedia |

That is 10 against a guide threshold of 4. Even discounting the two most marginal — the Casino
dell'Aurora, which cannot be entered and whose access is unresolved, and San Marone, which rests on
a five-line article — **eight** remain. The rione also carries a genuine editorial spine that
several of these entries share: a speculative property development laid out over a destroyed
seventeenth-century villa, of which one casino and a stand of trees survive.

**Ruling: GUIDE.** Not a thin one, but a narrow one — its centre of gravity really is one street and
one church complex, exactly as the finder said, and the page should not pretend to an "ancient Rome"
register it cannot support. Everything in Ludovisi except the Aurelian Walls, Porta Pinciana,
Sant'Isidoro, the Concezione and the Casino dell'Aurora postdates 1886, and two of those five are
escalated out of the rione.

**Where the finder's tier instinct was wrong.** It called this "a guide, not a town-page — but a
thin one", and predicted a hard core of about 12 and a middle band of about 10. The core came in at
10 and I agree with it almost exactly. **The middle band came in at zero.** All four villini are
private residences documented only by unreferenced Wikipedia stubs or enthusiast blogs — I checked
each: `Villino Florio` has **zero** references, `Villino Folchi` rests on `info.roma.it`,
`Villino Ferrari` and `Villino Amero D'Aste Stella` rest on `rerumromanarum.com`. All five hotels
fail for want of a fetchable source, an unresolvable trading status, or a self-sourced superlative.
The finder expected the tail to be cut and it was; it did not expect the middle to be cut, and the
middle was cut entirely.

---

## 8. DROP register — 23 sections, with the reason for each

| § | Item | Reason |
|---|---|---|
| 3.7 | Porta Pinciana | Straddler; both published coordinates reverse-geocode to Pinciano. Escalated. |
| 3.8 | Aurelian Walls stretch (+ colossal bust, + Scuola d'Arte Educatrice) | Programme-wide linear straddler. Bust: uncertain identification, located only by vague proximity. School: present-tense "still active" on a single undated page; not a visitor destination. |
| 3.15 | Fontana delle Api | Three-way straddler; Roma Capitale's own address is Piazza Barberini, which is Trevi's and reserved. Escalated. |
| 4.1 | Villino Florio | it.wikipedia article carries **zero** references. Private residence, no access. |
| 4.2 | Villino Folchi | Rione and substance rest on `info.roma.it`; article contradicts itself on the decade (infobox 1880s, prose 1890s); tenancy claim unsourced. |
| 4.3 | Villino Ferrari | Entire article rests on `rerumromanarum.com` plus `info.roma.it`. See §5.3. |
| 4.4 | Villino Amero d'Aste Stella | Entire article rests on `rerumromanarum.com`; no construction date at all. |
| 4.7 | Hotel Majestic | Status unresolvable — closed 2020, it.wikipedia calls the closure "(temporanea)", bought 2022 with intent to reopen. We may state neither open nor closed. Flagged stub with a 1889/1899 internal conflict and a self-standing "first hotel on via Veneto" superlative. |
| 4.8 | Hotel Eden | No fetched source beyond a coordinate. |
| 4.9 | Grand Hotel Palace / Ambasciatori | it.wikipedia article is a stub; only the 1925–1935 building-phase mention survives, which belongs in the intro if anywhere. |
| 4.10 | Harry's Bar | Its entire interest is a Dolce Vita fame claim that it.wikipedia sources to `harrysbar.it`, the business's own site. Barred by the corpus rule. |
| 5.1 | Ministero del Lavoro (Palazzo "Marco Biagi") | A bare entry in a list; no article, no fetched source, working ministry. |
| 5.2 | U.S. Mission to the UN Agencies | OSM tags only; `usunrome.usmission.gov` 403s; not a visitor destination; sits on the escalated via Boncompagni line. |
| 5.3 | Five embassies (Georgia, Indonesia, Cyprus, Dominican Republic, Uruguay) | OSM tags only, no fetched source, not visitor destinations. The finder is right that they are ordinary Italian buildings and right to have said so. |
| 5.4 | Chiesa di Santa Maria Regina dei Cuori | it.wikipedia article carries **zero** references. |
| 5.5 | SS. Redentore e S. Francesca Saverio Cabrini | **Zero** references. |
| 5.6 | Chiesa del Corpus Christi | Effectively unreferenced (one link to `ofmcap.org`). |
| 5.7 | ex Chiesa di San Lorenzo da Brindisi | **Zero** references; deconsecrated, interior is a conference hall. |
| 5.8 | ex Chiesa di San Giuseppe Calasanzio | Better referenced than its neighbours, but deconsecrated and absorbed into the Red Cross building as a meeting room. Not a place. |
| 5.9 | Cappella di Sant'Andrea di Grecia | No article anywhere. Nothing to write. |
| 5.10 | Liceo Tasso, Liceo Righi, Scuola Buonarroti, Scuola Regina Elena | Schools are not visitor destinations. The finder said so itself. |
| 5.11 | Fontana del Tritone di Palazzo Margherita | Inside the Embassy grounds, not visitable. Keep the finder's naming-hazard note in the working file so nobody confuses it with Bernini's fountain in Trevi. |
| 5.13 | Palazzo Coppedé, Fontana del cane, Hotel Balestra, Jumeirah Grand Hotel, Villino Piombino | All five confirmed missing on it.wikipedia today. No other source. |

I also endorse, without re-litigating, the finder's §6 rule-outs to Sallustiano, Trevi, Colonna,
Campo Marzio and Pinciano. I spot-checked the one that matters most — the Museo Boncompagni
Ludovisi — and found a third line of evidence supporting it.

---

## 9. Standing instructions to the author

1. **`photos: []` on every record.** Ruling 3. No exceptions in this wave.
2. **No designation language, English or Italian, anywhere.** Ruling 1, re-confirmed today.
3. **Palazzo Margherita's ruling-2 paragraph is mandatory and is given verbatim at §3.3.** Do not
   paraphrase it into "American soil", "US territory", "extraterritorial" or "diplomatic
   sovereignty".
4. **No opening arrangements for the Casino dell'Aurora.** §3.4.
5. **No trip durations, no vague proximity** — including the four source phrases listed at §5.5.
6. **Attribute every superlative to the body that made it**: Roma Capitale on the Giambologna Venus
   and on the first Immaculate Conception dedication; it.wikipedia on Caravaggio's only wall
   painting; villaludovisi.org on the largest private residence within the walls. None in the
   corpus's own voice.
7. **Do not emit Porta Pinciana, the Fontana delle Api, the Aurelian Walls or via Veneto as Ludovisi
   places** pending the arbitrator. The corpus gate fails on a duplicate.
8. **Re-fetch before ship**: `museoecriptacappuccini.it` (hours), `istitutosvizzero.it` (hours and
   visit terms), and the ministry's current site for the Palazzo Piacentini booking address.
9. The intro needs 90+ words and at least two outbound links regardless of tier; at guide tier it
   should carry the Villa Ludovisi spine from §3.5 and the via Veneto material from §3.1, both of
   which are written out above.
