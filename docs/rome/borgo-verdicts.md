# Borgo (R. XIV) — VERIFIER VERDICTS

Adjudicating `docs/rome/borgo-finder.md`. Verification date 2026-09-02. I did not gather the
finder's evidence and I owe it no loyalty; every ruling below rests on a source I re-fetched myself
or on a rule in `priv/seed_data/rome_roster.json`.

**Headline counts (74 candidate records): PUBLISH 31 · REWRITE 27 · DROP 7 · ESCALATE 9.**
Plus **12 claim-level DROPs** inside otherwise surviving records (§3).

**TIER: GUIDE.** Not close. See §6.

---

## 1. What I re-fetched, and what it said

| Source | Result | Verdict on the finder's use of it |
|---|---|---|
| `https://www.vatican.va/news_services/press/documentazione/documents/sp_ss_scv/informazione_generale/extraterritoriale_it.html` | HTTP 200, 7.973 bytes, dated 03.04.2001 | **Substantially confirmed, one material omission — see §2.1** |
| `https://www.turismoroma.it/it/luoghi/castel-santangelo` | HTTP 200 | **Confirmed verbatim**, address, POINT, hours, tel, "sede museale nel 1925", "monumento, area archeologica e museo", Passetto paragraph |
| `https://www.turismoroma.it/it/luoghi/palazzo-del-commendatore` | HTTP 200 | **Confirmed verbatim**, and it says one more thing the finder needed — see §2.3 |
| `https://www.turismoroma.it/it/luoghi/porta-santo-spirito` | HTTP 200 | **Confirmed verbatim** |
| `https://www.turismoroma.it/it/luoghi/ponte-santangelo` | HTTP 200 | **THE FINDER IS WRONG. This is not a stub.** See §2.2 |
| `https://www.turismoroma.it/it/luoghi/piazza-pia` | HTTP 200 | **Confirmed** — coordinate only, no prose, no hours, filed under "Parchi e ville storiche" |
| `https://auditoriumconciliazione.it/contatti/` | HTTP 200 | **Confirmed verbatim**, incl. "BIGLIETTERIA (rivenditore Ticketone) a Via della Conciliazione 4 … è momentaneamente CHIUSA fino a data da destinarsi" |
| `https://www.parrocchiatraspontina.it/contatti/` | HTTP 200 | **Confirmed — and the finder missed publishable hours on the page it fetched.** See §2.4 |
| `https://www.divinamisericordia.it/contatti` and `/orari` | **HTTP 403 Forbidden, both** | **Could not confirm.** See §2.5 |
| `https://geoportale.comune.roma.it/sisto/api/viario/11479` | HTTP 200, 25.356 bytes JSON | **Finder vindicated** — see §2.6 |
| it.wikipedia `action=parse` wikitext, 20 articles | all HTTP 200 | mostly confirmed; six discrepancies in §3 |

I did **not** re-fetch `patristicum.org`, `museiscientificiroma.eu` or `lumsa.it`. Records resting
solely on those carry a conditional below.

---

## 2. The six things I found that the finder did not

### 2.1 The Jesuit Curia Generalizia **IS** on the Holy See's list. The finder truncated item 13.

Item 13 of the vatican.va enumeration, read verbatim from my own fetch, names in order:

> Pontificio Collegio Pio Romeno, Pontificio Collegio Ucraino di S. Giosafat, Pontificio Collegio
> Americano del Nord, Ospedale del Bambino Gesù, Chiesa di S. Onofrio e Convento, Pontificio
> Università Urbaniana, Area dei Servizi Tecnici della Santa Sede, **Collegio Internazionale S.
> Monica**, **Curia Generalizia della Compagnia di Gesù**, Istituto di Maria Bambina, **Chiesa dei
> Ss. Michele e Magno**, Edificio delle Suore Calasanziane, Casa delle Suore dell'Addolorata,
> **Immobili su Borgo Santo Spirito contigui alla Curia dei Gesuiti**.

The finder's record #23 says: *"vatican.va item 13 ends with 'immobili su Borgo Santo Spirito
contigui alla Curia dei Gesuiti' — i.e. buildings adjacent to the Jesuit curia are
extraterritorial. Whether the curia itself and this chapel are inside the grant is not stated."*

**The curia itself is named, separately and by name.** The list grants extraterritoriality to
*both* the Curia Generalizia della Compagnia di Gesù *and*, additionally, the buildings adjacent to
it on Borgo Santo Spirito. The finder's §6 tier-2 register is therefore incomplete and its caution
on #23 is built on a misreading. This is the most consequential error in the file, because §6 is
the one table in it that rests on a primary source rather than an aggregator.

**RULING on #23 — REWRITE.** Exact replacement wording:

> The Cappella di San Francesco Borgia stands inside the Jesuit Curia Generalizia at Borgo Santo
> Spirito 4. The Holy See's own published enumeration of its extraterritorial properties names the
> Curia Generalizia della Compagnia di Gesù, and separately the buildings on Borgo Santo Spirito
> adjoining it, among the properties on the Janiculum that hold extraterritorial status. Under the
> Lateran Treaty this is Italian soil carrying the immunities of a diplomatic headquarters, not
> foreign territory; visitors follow Italian law. The enumeration does not address the chapel
> individually.

The last sentence is not optional. The grant names the building; it does not name the chapel.

**Consequential upgrade to #21 (Cappella di Santa Monica).** it.wiki's lead states the chapel is
*"la cappella del Collegio Internazionale degli Agostiniani, presso la loro curia generalizia"* —
and the Collegio Internazionale S. Monica is likewise named in item 13. The finder's refusal to
assert the chapel's own status still stands, but the college's status is now primary-sourced and
may be stated. Same closing sentence.

**One more thing on that page the finder walked past.** It says all the Holy See's Roman
extraterritorial properties except the Seminario Romano Minore *"sono iscritti nella lista del
patrimonio mondiale … in virtù dell'adesione della Santa Sede (1982) alla Convenzione del 16
novembre 1972"*. UNESCO inscription is explicitly carved out of ruling 1 as publishable. The finder
had this in hand and did not use it. **PUBLISH**, attributed:

> The Holy See states that its extraterritorial properties in Rome, the Seminario Romano Minore
> excepted, are inscribed on the World Heritage list as part of the Historic Centre of Rome,
> following the Holy See's 1982 accession to the 1972 World Heritage Convention.

### 2.2 Roma Capitale's Ponte Sant'Angelo page is not a stub, and it disagrees with Wikipedia

The finder (#3): *"a stub record exists at turismoroma … giving POINT (12.4665074 41.9011928) but
no prose."* **False.** The page carries several hundred words of prose and it contradicts the
it.wiki dates the finder published instead:

| Fact | it.wiki (what the finder used) | Roma Capitale (what the finder had and didn't read) |
|---|---|---|
| Built | 135 (lead); infobox says 134–135 | **136 d.C.** |
| Bernini angels | 1669 | **1668** |

Roma Capitale also carries: traffic regulation on the bridge for the 1300 Jubilee with Dante as
witness to the two opposed lanes of pilgrims; the 1450 Jubilee parapet collapse and drownings,
triggered by the white mule carrying Nicholas V; the bridge and the square before it used for
*esposizione patibolare* — public display of the bodies of the executed — from 1488 to 1534; and
the bridge taking its present form after restructuring works in 1882.

That last one matters and the finder did not have it: **the bridge a visitor sees is an 1882
object**, not a 1669 one. Also note the it.wiki article carries a `{{F}}` banner — Wikipedia itself
says the article lacks the necessary sources. The finder flagged that banner for ponte PASA and not
for this one.

**RULING on #3 — REWRITE, then ESCALATE the rione question unchanged.** The straddler evidence is
confirmed: it.wiki's lead does read *"nei rioni Ponte e Borgo"*. But the corpus must not publish a
build date on the aggregator when Roma Capitale is reachable and says something else. Exact
replacement for the date sentence:

> Roma Capitale's tourism office dates the bridge to 136 AD and gives its original name as Ponte
> Elio, after the emperor Hadrian, who built it to reach his mausoleum. Italian Wikipedia gives 135
> and names Demetrianus as the designer; the two do not agree and the corpus states both or
> neither. Roma Capitale dates the ten angels bearing the instruments of the Passion to 1668,
> designed by Bernini for Clement IX and carved by his pupils, and says the bridge took its present
> form after restructuring in 1882.

### 2.3 The Museo dell'arte sanitaria address is resolvable, and the finder over-blocked it

The finder (#12) ruled: *"Three different numbers. Do not publish an address until this is
resolved."* Roma Capitale's Palazzo del Commendatore page states plainly, in my fetch:

> Il Palazzo ospita il Museo Storico dell'Arte Sanitaria, insieme all'antica Spezieria …

and gives the palace's address as **Borgo Santo Spirito 3**, POINT (12.461159 41.901512). That is a
Roma Capitale statement of which building the museum is in, and it is corroborated by the museum's
own site ("nell'ala secentesca dell'Ospedale Santo Spirito in Sassia"). it.wiki's two Lungotevere in
Sassia numbers disagree with each other and are the weakest of the three answers.

**RULING on #12 — REWRITE, not DROP.** Exact replacement:

> Roma Capitale places the Museo storico nazionale dell'arte sanitaria inside the Palazzo del
> Commendatore, Borgo Santo Spirito 3. The museum's own site describes its home as the
> seventeenth-century wing of the Ospedale Santo Spirito in Sassia. Italian Wikipedia gives a
> Lungotevere in Sassia address and contradicts itself on the number; the corpus follows Roma
> Capitale.

The finder's separate ruling that **no hours may be published** for the museum stands. **PUBLISH**
that absence as an absence; do not invent one.

Two smaller corrections from the same page. The clock is **nineteenth-century** — *"un curioso
orologio ottocentesco a sei ore"* — the finder gave no date. And the fountain is *seicentesca*,
which the finder rendered correctly.

### 2.4 Santa Maria in Traspontina's hours were on the page the finder fetched

The finder (#15, and again in §7 and §9): *"No opening hours captured — the site's hours page 404'd
… Someone should chase it before shipping hours."* The `/contatti/` page the finder **did** fetch
carries an "Info utili e contatti" block. Verbatim from my fetch:

> ■ Accoglienza dei fedeli: entrando dall'ingresso principale della chiesa, su via della
> Conciliazione,14. ■ Contatti: Telefono: 06 68806451 … ■ Celebrazione eucaristica feriale: 9.00 -
> 19.00 ■ Celebrazione eucaristica festiva: 9.00 - 10.30 - (12.30 Messa internazionale) - 19.00
> ■ Rosario: ogni giorno, ore 18.15

A place's own site establishes its hours. **PUBLISH all of it.** The finder's handover item 6 asked
the verifier to chase this; it did not need chasing.

### 2.5 I could not re-fetch divinamisericordia.it at all

Both `/contatti` and `/orari` returned **HTTP 403 Forbidden** to me. The finder reports fetching
them and quotes a detailed Mass schedule. I cannot confirm a word of it. Under the rule — *if you
could not fetch it, do not write it* — the honest position is not that the finder lied, but that
**the corpus has no second witness to a volatile fact class**. Mass times change; a 403 means we
cannot re-check.

**RULING on #14 — REWRITE.** The church PUBLISHES as a place; the address Via dei Penitenzieri 12
and the telephone may ship. **The Mass and opening-hours block is HELD** until someone re-fetches
the sanctuary's own site successfully. Ship the church with no hours rather than with hours nobody
can re-verify.

### 2.6 SISTO record 11479 is the Corso, not the Ponte — the finder read it right and Wikipedia read it wrong

it.wiki's *Ponte Vittorio Emanuele II* cites `geoportale.comune.roma.it/sisto/viario/11479/dettaglio`
as its source for the **bridge**. My fetch of that record returns:

> "denominazione":"VITTORIO EMANUELE II" … "toponimo":"**CORSO** VITTORIO EMANUELE II",
> "limiti":"DA PIAZZA DEL GESU' A PIAZZA PASQUALE PAOLI"

The finder said it read id 11479 as Corso Vittorio Emanuele II. **Confirmed.** Wikipedia has
mis-cited the street register record for the road as the record for the bridge. Any writer
following that footnote lands on the wrong object.

**Bonus, and it upgrades the rione file's weakest fact.** The same record carries:

> "provvedimento":{"tipologia":"Modifica","descrizione":"MODIFICA MUNICIPIO"},"note":"Presa d'atto
> della Deliberazione A.C. n. 11 dell'11 Marzo 2013 in merito alla riorganizzazione dei municipi di
> Roma Capitale","zoneDiDecentramento":[{"descrizione":"Municipio I"}]

Borgo's Municipio I assignment is currently sourced in §2 of the finder file to Italian Wikipedia
citing that deliberation. SISTO is Roma Capitale's own register and it records the same
deliberation directly. **PUBLISH the Municipio attributed to Roma Capitale's SISTO, not to
Wikipedia.**

---

## 3. Claim-level DROPs inside otherwise surviving records

Twelve. Each is a claim the finder wrote down; each must not ship.

| # | Claim | Ruling | Reason |
|---|---|---|---|
| 6 | *"una sottile linea di travertino romano … delinea il confine di Stato tra Italia e Vaticano"* | **DROP** | Ruling 2, verbatim. I confirmed the sentence is in the it.wiki lead. The finder correctly quarantined it; I am upholding the quarantine and recording that a writer will find it in the first paragraph of the most-read article about the street. |
| 10 | *"L'ospedale più antico d'Europa"* | **DROP** | Confirmed in the it.wiki lead, footnoted to Mattoni et al., *Ital. J. Public Health* 7(2) 2012, which nobody fetched. Superlative through an aggregator. Barred. |
| 15 | Pius IV demolished the predecessor church **in 1564** | **DROP** | I grepped the whole article for "1564": **no match.** it.wiki says only *"fatta demolire da Pio IV"* with no year. The finder supplied a date its own source does not carry. |
| 15 | Any named architect | **DROP** | Confirmed triple conflict: infobox `Architetto = Il Vignola`; body *"L'architetto dell'edificio fu il bolognese Alex Tica"*; it.wiki *Borgo* says G. S. Peruzzi. Finder correct. |
| 19 | Reconsecrated **6 May 1759** | **DROP** | The infobox says 1759; the body says *"al termine, la chiesa fu ridedicata il 6 maggio 1788"* and dates Murena's Baroque casing to *"1785-1788"* in one place and *"tra il 1756 e il 1759"* in another. The article contradicts itself twice. The finder took the infobox and flagged nothing. |
| 19 | The staircase *"possiede gli stessi privilegi della Scala Santa"* | **DROP** | Confirmed: footnoted to an archived `comhem.se` personal homepage. Finder correct. |
| 21 | Prevost / Leo XIV ordained here 19 June 1982 | **DROP** | Confirmed: **the sentence carries no footnote of any kind.** The article's only citations are two book entries in a bibliography. High-interest, zero provenance. Do not ship, however much a guide wants it. |
| 25 | Any implication the Teatro di Nerone can be seen | **DROP** | Stronger than the finder knew. it.wiki: *"Le rovine del teatro saranno reinterrate una volta catalogate"* — the ruins are to be **reburied** once catalogued. The finder wrote "visitability not established"; the source says the opposite of visitable. |
| 35 | Palazzo dell'Azione Cattolica is extraterritorial | **DROP** | Confirmed. it.wiki files it under `Categoria:Zone extraterritoriali della Santa Sede in Roma`; the Holy See's own enumeration does not name it. The Holy See's list governs. Finder correct, and I add: that article's only footnote for the building is `info.roma.it`, a hobby site, and its category sort key is `|San Pio X` — it was copy-pasted from the *other* palace's page. |
| 41 | Mastro Titta lived here / 516 executions / began 1796 | **DROP** | Confirmed: the entire claim sits inside a **footnote** in it.wiki *Borgo*, sourced to `mp_pollett.tripod.com`. Finder correct. |
| 59 | The Farinone bell foundry closed c. 1995 after ~450 years | **DROP** | Confirmed: *"chiuse intorno al 1995, dopo un'attività durata circa 450 anni"*, footnoted to an archived `lignarius.net` page. A trading-duration claim on a dead hobby site. Finder correct. |
| 52 | Borgo Santo Spirito is *"la più interessante strada del rione"* | **DROP** | Aggregator editorial judgement. Finder flagged it as attributable opinion; I am ruling it out entirely — it is a superlative and it earns nothing. |

**One more the finder did not catch.** it.wiki *Piazza Pia* closes with *"diventando la più grande
area pedonale urbana di Roma"* — an unsourced superlative in an already-condemned article. **DROP.**

---

## 4. Place-level rulings

### DROP — 7 records

| # | Place | Reason |
|---|---|---|
| 2 | **Parco Adriano** | No sourced content whatever. The only content is a future-tense sentence about finds that *"verranno trasferiti"*, sourced to the Piazza Pia article this file condemns. A place record with nothing publishable in it is not a place record. |
| 7 | **Piazza Pia** | The €85,3 m and 490-day figures have **no Roma Capitale citation at all** — I traced it.wiki's `comune.roma.it` footnote (NWS1075685) and it is attached to a sentence about the *medieval portico*, not to the redevelopment. The rest is `romanoimpero.com` and `theplan.it`. The finder's judgement stands and is strengthened. **Keep the Roma Capitale coordinate; publish nothing else.** |
| 39 | **LUMSA** | The finder took no address from the university's own site and hand-placed a coordinate from an address it could not source. That is a rione assignment resting on a guess. |
| 40 | **Palazzo Latmiral** | No published coordinate, not PIP-verified, no content of its own. |
| 50 | **Fontana delle Palle di Cannone** | No article, no coordinate, no date, no source; the coordinate is the finder's own placement. |
| 60 | **Piazza della Città Leonina** | Name in a list. Nothing else. |
| 63 | **The 25-street residual list** | The finder itself says "no individual sourcing gathered". Correct to record; not publishable as places. |

### ESCALATE to the arbitrator — 9 records

I am not resolving these and I am not narrowing the finder's framing on any of them.

| # | Place | Straddle | My note |
|---|---|---|---|
| 4 | **Passetto di Borgo** | Borgo ↔ **Vatican City** | Confirmed: it.wiki gives ~800 m, 1277, Nicholas III, within the *Mura Vaticane*, infobox `quartiere = Rione Borgo`. Its 800 m figure is footnoted to `castelsantangelo.beniculturali.it`, which is unreachable, so **the length is unverifiable and should not ship as a number.** The 2024 reopening remains UNVERIFIED — I did not attempt those hosts. |
| 5 | **Mura leonine** | Borgo ↔ **Vatican City** | Upheld. |
| 3 | **Ponte Sant'Angelo** | Ponte ↔ Borgo | Straddle confirmed from the lead. Date/attribution rewrite in §2.2 applies whichever unit wins. |
| 44 | **Ponte Vittorio Emanuele II** | Ponte ↔ Borgo | Confirmed verbatim: *"collega piazza Pasquale Paoli, nel rione Ponte, al lungotevere Vaticano (Borgo)"*. Also confirmed the 2015 renaming deliberation n. 246 of 22 July 2015. |
| 45 | **Ponte PASA** | Ponte ↔ Borgo, possibly Trastevere | Self-contradiction confirmed verbatim: lead says *"nei rioni Ponte, Trastevere e Borgo"*, body says *"Collega il rione Borgo con il rione Ponte"*. Wikipedia's own `{{F}}` and `{{S}}` banners confirmed. **The arbitrator should know the source is flagged by its own project as under-sourced and a stub.** |
| 46 | **Galleria PASA** | Borgo ↔ Q. XIII Aurelio | Upheld — crosses out of the rione layer entirely. |
| 47 | **Lungotevere Castello** | Borgo ↔ Prati | Confirmed: lead *"nei rioni Borgo e Prati"*, infobox `quartiere = Borgo - Prati`. **Correction to the finder's caution:** the infobox `latDecimale`/`longDecimale` fields are **empty**. The 41.902503/12.46823 centroid the finder tested is not "it.wiki's own published centroid" — it comes from Wikidata via the coordinates API. The warning is still right; the attribution is not. |
| 62 | **Via di Porta Angelica** | Borgo ↔ Prati | Upheld. |
| 22 | **Campo Santo Teutonico / S. Maria della Pietà** | **Sovereignty unresolved** | Fully confirmed and I am not touching it. it.wiki's extraterritoriality claim is footnoted to `globalgeografia.com` alone; **the Holy See's own enumeration does not list the property — I read all thirteen Rome items in my own fetch and it is absent.** Under ruling 2 nothing here is settled. Do not publish a sovereignty sentence in wave 1. |

Plus **Aula Paolo VI**, which the finder correctly ruled unpublishable anywhere. I concur: the
border runs through the hall, the Holy See's list does not name it, and OSM's answer is worthless at
that edge for the reason the finder proved in §4.3. **I am upholding the finder's Ricciolo d'Italia
control as sound method** — it is the best single piece of work in the file, and its conclusion
binds: no OSM result may found any statement about where the international border runs.

### REWRITE — 27 records

The load-bearing ones are given exact replacement wording above (§2.1 #23 and #21, §2.2 #3, §2.3
#12, §2.4 #15, §2.5 #14). The rest, briefly:

- **#1 Castel Sant'Angelo.** DROP the 966.623 visitor figure — an aggregator citing a trade
  magazine, and the finder already warned against building a superlative on it; the safe course is
  not to carry the number at all. Expand the Monday opening, which the finder abbreviated. Exact
  wording: *"Roma Capitale states the museum opens Tuesday to Sunday 9.00–19.30, last admission
  18.30, closed Mondays, 25 December and 1 January. From 3 August 2026 and for the rest of 2026 it
  also opens on the first Monday of each month, 14.00–20.00, last admission 19.00, with a 5-euro
  ticket, no booking and no groups."* Note the museum's own authority (`*.cultura.gov.it`) is
  DNS-unreachable, so the 130–139 AD construction dates remain aggregator-only — hedge or omit.
  **Caution for the writer:** turismoroma opens with *"Situato a pochi passi dalla Basilica di San
  Pietro"*. That is a vague proximity and it is barred, even though Roma Capitale wrote it.
- **#6 Via della Conciliazione.** Confirmed: 420 m circa, CAP 00193, sampietrini, Largo Giovanni
  XXIII to Piazza Pio XII, Piacentini and Spaccarelli, from 1936, completed for the 1950 Jubilee
  with two rows of obelisk lampposts. Travertine line out. Benevolo's *"una delle opere urbanistiche
  più discusse e aspramente criticate del Novecento"* ships **only** as attributed criticism.
- **#8 Piazza Pio XII / #9 Largo Giovanni XXIII.** Keep the finder's ~140 m bracket and its refusal
  to narrow it. #9 has no content of its own; fold it into #6 as the street's stated `inizio`.
- **#10 Arcispedale.** Superlative out. The Corsia Sistina detail is confirmed (120 m × 12 m,
  tiburio, octagonal tower, *Braccio di sotto*/*di sopra*, portale del Paradiso to Bregno, ruota
  degli esposti) and the Palladio attribution is hedged *in the source* — *"dovrebbe essere l'unica
  opera romana"* — and must stay hedged. **Correction:** the finder reports a "726–728 vs early 8th
  century" internal inconsistency about the Schola. The hospital article says Ine reigned *(689-726)*
  and puts the Schola *"all'inizio dell'VIII secolo"*. Those are Ine's regnal dates, not schola
  dates. The inconsistency as described is the finder's, not Wikipedia's.
- **#16 Oratorio della Dottrina Cristiana.** No coordinate, never PIP'd — rione rests on a Wikipedia
  category alone. Ship only if the category is attributed as the sole evidence.
- **#20 San Pietro in Borgo.** The finder infers its status from item 7's *"ed adiacenze"*. That is
  an inference, not a quotation. Wording: *"Italian Wikipedia describes the oratory as standing on
  Italian soil subject to extraterritoriality in favour of the Holy See; the Holy See's own
  enumeration names the Palazzo del Sant'Offizio 'ed adiacenze' and does not itemise the oratory."*
- **#24 Palazzo dei Penitenzieri.** The finder has the wings crossed. The article puts the
  sixteenth-century frescoed gallery in the **left** wing at *piano nobile*, and the salone with the
  **Soffitto dei Semidei** by Pinturicchio (**1490**, a date the finder omitted) in the **right**
  wing, which is *"visitabile su richiesta dell'ordine"*. Also: Il Messaggero's headline names the
  hotel — the Hotel Columbus — and its closure as an eviction. Do not ship the hotel line without
  fetching Il Messaggero.
- **#31 Palazzo Serristori.** *"One of the few Renaissance buildings in Borgo to survive the
  demolition of the rione's centre"* is a near-superlative from an aggregator. Rewrite to the plain
  fact: it stands, and the buildings around piazza Scossacavalli do not.
- **#33 Palazzo San Pio X.** Confirmed from vatican.va and the article: 1948–1950, Piacentini and
  Calza Bini, via della Conciliazione 4, Curia offices, embassies of Canada and Taiwan, and the
  Auditorium carve-out. **The Dicastero per la comunicazione is not in the lead I fetched** — verify
  before shipping. The finder's flagged internal orientation contradiction is real; publish no
  compass directions from this article.
- **#37 Palazzo del Sant'Uffizio.** Item 7 confirmed. The "Leone XII, 1811–1814" impossibility the
  finder caught is real; do not repeat it.
- **#41 Casa del boia.** Survives as a fifteenth-century house with grisaille decoration. Everything
  connecting it to an executioner drops (§3).
- **#52, #58, #59, #61, #64, #68, #72** — minor. **#58:** it.wiki's prose says *vicolo* degli
  Ombrellari and its street list says *via* — pick neither until Roma Capitale's register settles
  it, and note the umbrella-smell sentence carries no footnote. **#68:** the Piazza Scossacavalli
  infobox's `Municipio Roma XIV` and `cap 00185` are both wrong for Borgo; do not carry them.
- **#34 Auditorium Conciliazione — PUBLISH**, and the finder's best insight in the file ships intact
  and primary-sourced: *the hall sits inside a Holy See extraterritorial palace and is itself
  explicitly excluded from that status by the Holy See's own text.* I read the exclusion clause
  myself. It is exactly as the finder quoted it.

### PUBLISH — 31 records

11, 13, 17, 18, 26, 27, 28, 29, 30, 32, 34, 36, 38, 42, 43, 48, 49, 51, 53, 54, 55, 56, 57, 65, 66,
67, 69, 70, 71, 73, 74 — subject to the standing rules: aggregator content attributed, no
designation language anywhere, `"photos": []` everywhere, no trip durations, no vague proximity.

**#38 Augustinianum ships conditionally** — I did not re-fetch `patristicum.org`. The finder's note
that it is **not** on the vatican.va list is confirmed by my own reading of all thirteen items.

---

## 5. Rulings 1, 2 and 3 — compliance audit

- **Ruling 1 (no designation claims).** Clean. I searched the finder file for *vincol*, *listed*,
  *scheduled*, *declared a monument*, *tutelato*, *dichiarazione di interesse culturale*. Nothing.
  The finder's decision to omit protection language even where a fetched source mentioned it is the
  correct reading of the ruling. The UNESCO material in §2.1 is the carve-out, not a breach.
- **Ruling 2 (Vatican City).** Clean and, in one respect, exemplary. St Peter's, the Square, the
  Museums and the Sistine Chapel appear only on the exclusion list. Sant'Anna dei Palafrenieri is
  correctly excluded and correctly identified as the trap. The finder's refusal to narrow the
  Piazza Pio XII transition beyond ~140 m is the right instinct and I am upholding it. The Ricciolo
  d'Italia control is sound and its conclusion binds the whole Rome programme, not just Borgo.
  **The one lapse is the reverse of a breach:** the finder was *too* cautious on #23 and got the
  tier-2 register wrong by under-reading the primary source (§2.1).
- **Ruling 3 (no photographs).** Clean. Every record carries `"photos": []`; §8 is prose with no
  URLs or filenames. Note for the photo wave: the finder's copyright analysis of the
  Piacentini/Spaccarelli street frontage is the most useful thing in §8 and should survive into that
  wave's brief.

---

## 6. TIER RULING: **GUIDE**

The threshold is 4 surviving places. Counting only places that (a) survive as PUBLISH or REWRITE,
(b) sit unambiguously inside Borgo with no straddle and no Vatican question, and (c) carry a
location from Roma Capitale or from the institution's own site rather than from an aggregator, I
count **thirteen**:

Castel Sant'Angelo · Palazzo del Commendatore · Porta Santo Spirito · Basilica di Santa Maria in
Traspontina · Auditorium Conciliazione · Via della Conciliazione · Palazzo San Pio X · Palazzo del
Sant'Uffizio · Palazzo delle Congregazioni ai Propilei · Palazzo dei Convertendi · Chiesa dei Santi
Michele e Magno · Palazzo dei Penitenzieri · Arcispedale di Santo Spirito in Saxia.

Loosen criterion (c) to well-attributed aggregator sourcing and the count passes forty. Borgo is a
guide by a wide margin, and it would still be a guide if every straddler and every Holy See property
were removed from it.

The finder's yield warning — *"if most of this comes back confirmed, the verifier was not testing
the edges"* — was fair, and it is roughly right: 34 of 74 records failed as written. But the failure
mode is not thinness. It is that a third of Borgo's interest is history in the past tense, another
third is Holy See property whose status is fixed by a treaty list rather than by the ground, and the
western edge is a border two states declined to ratify. All three are publishable if the tenses and
the attributions are right.

---

## 7. What worries me about the finder's work

1. **It under-read two primary sources it had already fetched** — vatican.va item 13 (§2.1) and the
   Traspontina contacts page (§2.4) — and in both cases the consequence was to *withhold* something
   publishable while flagging it as unresolved. A finder that over-hedges is far safer than one that
   over-claims, but §6 of the finder file is presented as a primary-sourced register and it is
   incomplete.
2. **It dismissed a Roma Capitale page as a stub without reading it** (§2.2) and published Wikipedia
   dates that Roma Capitale contradicts. This is the one place where the finder inverted the
   source hierarchy the corpus rules set.
3. **It supplied one date its source does not contain** (#15, the 1564 demolition). I could not find
   "1564" anywhere in that article. Single instance, but it is the failure mode the whole
   verification stage exists to catch.
4. **It took an infobox date over a body date without noticing the conflict** (#19, 1759 vs 1788).
   It caught exactly this pattern elsewhere — the Traspontina architect, the Palazzo San Pio X
   orientation — so the miss is inconsistent rather than systematic.
5. **Roma Capitale contradicts itself and nobody noticed.** The Castel Sant'Angelo page attributes
   the 1527 Sack to *"i Lanzichenecchi di Carlo VIII"*; the Porta Santo Spirito page, correctly,
   to *"i Lanzichenecchi di Carlo V"*. A writer quoting the castle page will publish a
   thirty-years-dead king sacking Rome. Use the Porta page's version.
6. **The geographic method is single-witness and the finder said so.** Every "Borgo — OSM PIP" rests
   on one Overpass download and one local point-in-polygon run, with Nominatim rate-limited out.
   The finder was straight about this and even supplied the control that proves where the method
   fails. I am not treating it as a defect, but the arbitrator should not read agreement between two
   points on the same polygon as two witnesses.
