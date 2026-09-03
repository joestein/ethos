# Prati (R. XXII) — VERIFIER verdicts

Adjudication of `docs/rome/prati-finder.md`. Wave 3, Rome programme. Verifier date 2026-09-02.
I did not gather the finder's evidence and I owe it no loyalty. Every ruling below is mine.

**Headline: PUBLISH 12 · REWRITE 19 · DROP 7 · ESCALATE 2 (of 40 numbered candidates).**
**Tier: GUIDE.** Surviving discrete place records ≈ 34 excluding escalations. Not a stretch.

---

## 0. Re-fetch log — nine sources, all reached, all checked against the claim

I re-fetched the sources the finder leaned on hardest, with `python3` + `urllib`, and read them.

| Source | Result | Verdict on the finder's use of it |
|---|---|---|
| `https://www.cortedicassazione.it/it/storia_del_palazzo.page` | 200, 90,143 B | **Substantially accurate**, three errors — §5.2, §5.3, §5.7 |
| `https://geoportale.comune.roma.it/sisto/api/viario?denominazione.contains=RISORGIMENTO` | 200 | **Verbatim confirmed** — see below |
| `…contains=ADRIANA` | 200 | **Verbatim confirmed** |
| `…contains=COLA%20DI%20RIENZO` | 200 | **Verbatim confirmed** |
| `https://www.sovraintendenzaroma.it/…/fontana_in_piazza_dei_quiriti` | 200 | Accurate; **name error** §5.4 |
| `https://www.sovraintendenzaroma.it/…/monumento_a_camillo_cavour` | 200 | **Accurate in every particular** |
| `https://www.chiesavaldesepiazzacavour.it/` | 200 | Accurate; **one over-claim** §5.8 |
| `https://www.turismoroma.it/en/negozi-storici` | 200 | Accurate; ruling in §4 |
| `https://www.carabinieri.it/chi-siamo/ieri/museo-storico` | 200, 93,511 B | **The finder's worst miss** — §5.1 |

Plus two MediaWiki `action=parse` pulls (`Prati (rione di Roma)`, `Rioni di Roma`) to check §2.

**SISTO is real and the finder read it correctly.** I re-derived the acts myself from the raw
`elementoDeliberas` objects (the finder's field names were right; `delibera.deliberatore.sigla`,
`delibera.numero`, `delibera.data`, `provvedimento.descrizione`, `note`):

```
PIAZZA DEL RISORGIMENTO (id 9378, limits "DA VIA COLA DI RIENZO A VIALE DEI BASTIONI DI MICHELANGELO")
  1885-05-08  Prop.al CC n.96   ATTRIBUZIONE        R. PRATI
  1954-03-01  DT       n.0      VARIAZIONE LIMITI   R. PRATI E R. BORGO
PIAZZA ADRIANA (id 143, limits "DA LUNGOTEVERE CASTELLO A CORRIDOIO DEI PAPI")
  1885-05-08  Prop.al CC n.96   ATTRIBUZIONE        R.BORGO
  1942-01-15  Del.GV   n.101    MODIFICA TRACCIATO  R.BORGO - ASSORBE VIA DEGLI ORTI DOMIZI
  1954-03-01  DT       n.0      VARIAZIONE LIMITI   R.R.PRATI-BORGO
VIA COLA DI RIENZO (id 2927, limits "DA PIAZZA DELLA LIBERTA' A PIAZZA DEL RISORGIMENTO")
  1885-05-08  Prop.al CC n.96   ATTRIBUZIONE        R.PRATI
  1954-03-01  DT       n.0      CONFERMA LIMITI     R.PRATI
  anncsu.accessiConformi = 272, statoOdonimo "conforme"
PIAZZA COLA DI RIENZO (id 2926)
  1914-01-01  DT       n.0      ATTRIBUZIONE        Q. PRATI      ← the "quartiere" note, confirmed
```

I am upholding the finder's SISTO method in full. It is the strongest evidential contribution any
Rome finder has made and it should be adopted by the remaining waves. It settles **boundaries**;
it settles **nothing** about protection status, and the finder was right to say so.

**Compliance check — all three rulings pass.** No designation claim appears anywhere in the file,
in English or Italian. No Vatican City property appears as a Prati place. `"photos": []` is on
every record. The finder's §6 exclusion list and §7.3 territory traps are correct and binding on
the author.

---

## 1. PUBLISH — 12 records

Ship as the finder wrote them.

| # | Place | Why it clears |
|---|---|---|
| 3 | **Piazza Cavour** | SISTO id 2578 + the Sovrintendenza's own Cavour page independently describes the garden as "realizzato tra il 1895 ed il 1911 da Nicodemo Severi". Two sources, one municipal. |
| 4 | **Monumento a Camillo Cavour** | Re-fetched and **confirmed in every particular**: Galletti (1833–1905), executed 1885–1895, inaugurated 24 September 1895 before Umberto I, bronze/bardiglio/granite, the four groups by compass point, both inscriptions verbatim. Roma Capitale's own heritage office. Best-sourced record in the file. |
| 6 | **Chiesa del Sacro Cuore del Suffragio** | Gualandi, 1894 stone / 1908 works / consecrated 17 May 1921, Missionari del Sacro Cuore, Jouët 1893. Lungotevere Prati confirmed `R. PRATI` 1887. |
| 8 | **Piazza dei Quiriti** | SISTO id 9173, 1885 attribution, 1954 limit variation. |
| 20 | **Museo degli orrori di Dario Argento / Profondo Rosso Store**, via dei Gracchi 260 | The shop's own live site establishes identity and location — exactly what a business's own site is permitted to establish. No hours claimed. |
| 22 | **Piazza Cola di Rienzo** | SISTO id 2926. The `Q. PRATI` 1914 note is confirmed and is genuinely better evidence for the rione's late constitution than the aggregators in §2. |
| 23 | **Via Vittoria Colonna** | SISTO id 11464 + Roma Segreta for the former name *Via Reale*, attributed. |
| 25 | **Chiesa della Beata Vergine Maria del Carmine** | Single it.wiki article, **no maintenance banner**, independent PIP. Thin but clean. |
| 33 | **Lungotevere Prati, dei Mellini, Michelangelo** | Three records. Each has its own SISTO creation act and rione note (1887 n.166; 1887 n.166; 1911 n.148). All PIP Prati. Lungotevere Castello correctly excluded. |
| 34 | **Lepanto (metro A)** | Opened 16 February 1980. Civic but legitimate. |
| 35 | **Ottaviano (metro A)** | Opened 16 February 1980, terminus until 29 May 1999. **Two independent waves now agree the station is in Prati, not Borgo** — that agreement is worth recording in the seed file. |
| 36 | **Villa Altoviti** (demolished 1889) | Vanished-building prose, two sources, the Van Wittel views. The one Tier C item worth keeping. |

---

## 2. REWRITE — 19 records

The underlying fact is sound; the wording overreaches. **Exact replacement wording is given for
every load-bearing one. The author uses it verbatim.**

### 2.1 #1 Palazzo di Giustizia — three changes

The Court's own page confirms: Zanardelli chaired the competition, Calderini won, first stone
14 March 1889 before Umberto I and Margherita, inaugurated 11 January 1911, reinforced concrete
faced entirely in travertine over more than 27,000 m², Ximenes's bronze quadriga with winged
Victory on the Tiber front, the fourteen jurists named exactly as the finder listed them,
Calderini's suicide on 12 February 1916 after the commission of inquiry, the *Palazzaccio*
nickname, Orson Welles. The library detail is confirmed too, and more precisely than the finder
had it.

**(a) Build dates — do not publish a range.** Three sources give three spans (§7.2). Use only the
two dated events the Court itself vouches for:

> *"The Court of Cassation states that the first stone was laid on 14 March 1889, in the presence
> of King Umberto I and Queen Margherita, and that the building was inaugurated on 11 January
> 1911."*

**(b) The Ordine degli avvocati.** The Court says only *"la sede dell'Ordine degli avvocati"*. The
finder's "the Rome Council of the Ordine degli avvocati" adds a body the source does not name.

> *"The building also houses the offices of the Ordine degli avvocati."*

**(c) The library.** Publishable and better than the finder's version:

> *"The Ministry of Justice's Biblioteca centrale giuridica is on the ground floor, past the main
> piazza Cavour entrance. The Court's own history states the library was founded before the
> unification of Italy, was moved here in 1996 from the ministry's premises in via Arenula into
> rooms that had originally housed the Corte d'Assise courtrooms, and has been a legal-deposit
> beneficiary since 1885."*

**Warning to the author.** The Court's page situates the palace with reference to Castel
Sant'Angelo, ponte Umberto I and piazza Navona. **Castel Sant'Angelo and piazza Navona are
reserved to waves 1 and 2.** Do not import that sentence. Describe the building by its own
addresses only.

### 2.2 #2 Crepereia Tryphaena — three corrections, and it is not a place

Ships as prose attached to #1, not as its own place record.

**(a) The doll is ivory and amber, not oak.** The Cassazione page the finder cited says
*"una bambolina di avorio e ambra di mirabile fattura"*. The finder wrote "articulated oak doll"
and did not list this among its §7.2 conflicts. **Drop "oak".**

**(b) "Two sealed sarcophagi of the same family" is not in the source.** The Court says
*"due sarcofaghi affiancati appartenenti … a un uomo e una donna dal nome di origini greche"* —
two adjacent sarcophagi, a man and a woman with names of Greek origin. Neither "sealed" nor "of
the same family" appears. **Drop both.**

**(c) Where the objects are.** Confirmed conflict. Attribute, do not assert:

> *"The Corte di cassazione states that Tryphaena's skeleton is today in the Musei Capitolini, and
> that the doll's hairstyle allowed archaeologists to date her to the time of the emperor Marcus
> Aurelius. Rome Art Lover captions its photographs of the sarcophagus and the doll to the
> Centrale Montemartini. The two accounts disagree and this page does not resolve them."*

Naming the museum as the reported holder of an object is not writing it as a Prati place and does
not breach the wave-1 reservation. Do not go further than the sentence above.

### 2.3 #12 Museo Storico dell'Arma dei Carabinieri — **the finder was wrong; the hours are published**

The finder wrote *"Hours not sourced … Do not publish opening times"* because three sub-pages
returned HTTP 410. **The hours are on the page it fetched and quoted from.** Verbatim from
`https://www.carabinieri.it/chi-siamo/ieri/museo-storico`:

> *"Il Museo Storico dell'Arma dei Carabinieri è aperto al pubblico dal martedì alla domenica,
> dalle ore 09.00 alle ore 13.00. Giorni di chiusura: Lunedì, 1° gennaio, 6 gennaio, Pasqua e
> Lunedì dell'Angelo, 1° maggio, 15 agosto, 1° novembre, 8 dicembre, 25 e 26 dicembre. L'ingresso
> è libero e gratuito."*

**Publish this.** Replacement wording:

> *"The Arma dei Carabinieri states that the museum opens Tuesday to Sunday, 09.00 to 13.00, and
> closes on Mondays, 1 and 6 January, Easter Sunday and Easter Monday, 1 May, 15 August,
> 1 November, 8 December, 25 and 26 December. Admission is free. The Arma describes a
> chronological and thematic route through 26 exhibition rooms, beginning with the Regie Patenti
> of 13 July 1814."*

Note the founding instrument is dated on the page — **13 July 1814**, better than the finder's
bare "1814" — and the room count is the Arma's own.

**Three further changes to #12.** (i) **DROP "8,835 visitors in 2025"** — it.wiki only, for a
free museum outside the ticketed circuit; the Borgo verifier dropped Castel Sant'Angelo's visitor
figure on the same reasoning and I am applying it consistently. (ii) **DROP the street number.**
The Arma gives only "Piazza del Risorgimento"; "46" comes from Nominatim. Either omit it or
attribute it to OSM. (iii) The Gorini 1908 proposal and Petitti di Roreto as founder are it.wiki
only — attribute or omit. The finder correctly quarantined *"a pochi passi dalla Città del
Vaticano"*; that phrase is barred and stays barred, and I confirm it is on the page.

**#12 ships only if the arbitrator gives piazza del Risorgimento to Prati. See §3.**

### 2.4 #9 Fontana in piazza dei Quiriti — name it as Roma Capitale names it

The Sovrintendenza page is titled **"Fontana in piazza dei Quiriti"** and never uses "Fontana
delle Cariatidi". The finder led with the Wikipedia name while citing the municipal source.

> *"The Sovrintendenza Capitolina records the fountain in piazza dei Quiriti as the work of the
> Triestine sculptor Attilio Selva (1888–1970), winner of the national competition announced by
> the Amministrazione capitolina in 1924 for five fountains in five Roman squares in recently
> built quarters. It dates it 1928, in marble and travertine, originally fed from the Acqua
> Marcia. It records that the nudity of the four kneeling female figures set off argument first
> between the sculptor, the Governatorato and Catholic associations, then in the press, delaying
> an unveiling that had been set for 21 April 1928."*

**DROP two things.** The unveiling date **9 May 1928** — the Sovrintendenza gives no replacement
date, only the delay; it.wiki's date is unconfirmed. And the claim that the affair contributed to
governor **Spada Veralli Potenziani's removal** — it.wiki only, a political causation claim, and
not worth the risk. The finder flagged both; I am ruling them out.

**Rome Art Lover's "Arnaldo Serra" is wrong** and the finder was right to say so. Do not carry it.

### 2.5 #32 Forno Colapicchioni — ruling on §7.4, the designation near-miss

Confirmed on the page: *"Forno pasticceria Angelo Colapicchioni - Via Tacito n. 76/78"*, under
"Confectioneries, bakeries, food and butchers". Also confirmed: the Association was founded 2008
and *"To be associated, a business must have been run by the same family for at least 3
generations and for over 70 years."*

**My ruling, three parts.**

1. **PUBLISH the membership**, and nothing more:
   > *"Roma Capitale's tourism service lists Forno pasticceria Angelo Colapicchioni, via Tacito
   > 76/78, among the members of the Associazione dei Negozi Storici di Eccellenza, an association
   > founded in 2008."*
2. **DROP** the sentence *"some of the commercial activities of the city center were recognized as
   a major part of the city's heritage by the local institutions."* It is generic, names no
   register and no instrument, and reads as a heritage designation. It is not on the banned list,
   but ruling 1 exists because we cannot source designations, and a vague municipal sentence is
   exactly the thing that becomes a designation claim once a writer compresses it.
3. **DROP any statement that this bakery has traded 70 years or through three generations.** That
   is the association's admission test, not a sourced fact about this business, and inferring it
   would be a trading-duration claim sourced ultimately to the business's own trade body.

No hours: `colapicchioni.it` returned HTTP 500 for the finder and I did not reach it either.

### 2.6 The remaining rewrites, briefly

- **#5 Tempio valdese.** The church's own site is live and **confirms**: *"CULTO DOMENICALE ALLE
  ORE 11.00"*, the Libreria Claudiana at piazza Cavour, and Laura Ronchi De Michelis's history
  sold there. All publishable. **But the homepage does not mention the Facoltà valdese di
  teologia.** That claim is it.wiki only. Either attribute it or drop it — do not state it as the
  church's own. The 1910 Emma Baker Kennedy purchase, the rejected 1910 competition, the January
  1911 commission to Rutelli and Bonci, Paschetto's decoration, Porcheddu's concrete and the
  8 February 1914 inauguration are it.wiki; attribute them.
- **#7 Museo delle anime del Purgatorio.** Keep, as a room in the sacristy of #6. **No hours, no
  admission** — confirmed, the church and museum domains do not resolve. Attribute the object list
  (Leleux, Fornari, the Montefalco note) to Wikipedia; it is the only source. Its *"a poche
  centinaia di metri dal Palazzaccio … a poco più di un chilometro"* phrasing is barred as vague
  proximity, and the finder was also right that it is factually wrong about Lepanto.
- **#10 San Gioacchino in Prati.** Keep. **Do not link `sangioacchino.org`** — the finder found it
  serving an Indonesian gambling site. Dates (1881 stone, 1891–1898 works, 1911 finish, Ingami,
  the 1898 five-continents mosaic) are it.wiki + Rome Art Lover; attribute.
- **#11 Via Cola di Rienzo.** SISTO's `didascalia` reads **"Niccolò Gabrini"**, not the finder's
  "Nicola Gabrini". Use SISTO's spelling. Prefer SISTO's **1885** naming over it.wiki's 1911 —
  SISTO is the naming authority and it.wiki is not. The 272 ANNCSU conforming numbers and the
  limits *"da piazza della Libertà a piazza del Risorgimento"* are confirmed verbatim.
- **#14 Cinema Adriano.** Keep. **The Beatles-in-1965 claim is it.wiki only** — attribute it as
  reported, or drop it; it is exactly the kind of claim that hardens into fact in a corpus. The
  operator's "opens 30 minutes before the first show" statement is fine — it is the operator's own
  and it is not a trip duration.
- **#15 Santa Maria del Rosario in Prati.** Keep. **Do not link `santamariadelrosario.net`** —
  gambling landing page.
- **#16 Piazza della Libertà + Giardino Ettore Troilo + Giardino Luigi Bigiarelli.** Three records.
  The two garden dedications come from Roma Capitale's register and are the finder's best original
  find. **DROP the claim that the piazza is where S.S. Lazio was founded** — it.wiki citing a
  popular history, and the finder itself advised against it. The garden's dedication to Bigiarelli
  stands on its own.
- **#17 Monumento a Pietro Cossa.** Keep but **aggregator-only**. The finder checked the
  Sovrintendenza monument index and Cossa is absent. Attribute every sentence to Roma Segreta and
  do not present the 1895 unveiling, the bastion storage or the 1962 move as established.
- **#18 Palazzo Blumenstihl.** Keep. **DROP the Gran Caffè Esperia line entirely** as the finder
  wrote it — *"uno dei più conosciuti ed antichi caffè romani"* is a superlative and an age claim
  from an aggregator. The café may be named as being under the lungotevere entrance and nothing
  more. The Istituto Polacco di Cultura tenancy is it.wiki only; attribute.
- **#19 Palazzo Odescalchi Simonetti.** Keep the building, **publish no architect.** Three sources
  give three incompatible accounts (Fontana + Carlo Busiri Vici; Fontana + Raffaello Ojetti; Ojetti
  after an 1887 fire). Publish the address, the four blocks and courtyard, the Odescalchi arms on
  the corner façade, and the Pirandello residence — attributed. An unresolved three-way attribution
  must not be resolved by picking the tidiest version.
- **#21 Piazza dell'Unità / Mercato dell'Unità.** Keep. The piazza is SISTO. The **1928** market
  building date is it.wiki only; attribute it.
- **#26 Cappella di Santa Maria Assunta.** Keep the chapel; **DROP the construction date.** "First
  half of the 19th century to 1950" cannot be right for a chapel of a congregation founded in 1878
  attached to a convent founded in 1909. The finder transcribed a garbled it.wiki span without
  noticing it is internally impossible. Publish the 1909 convent foundation and the Fusco 1878
  congregation, attributed, and no build date.
- **#27 Cappella Nazareth.** Keep, thin. **State that it is inside a working school** — a chapel
  in a private institute is not a place a reader can walk into, and a guide entry that implies
  otherwise is worse than no entry.
- **#31 The four villini.** Four records, all kept, with edits. **Villino Cagiati: drop the date**
  (it.wiki 1902 vs Rome Art Lover 1913–1918 — unresolved). **Villino Vivante: drop the date**
  (1904 vs 1907 inside one article). **Villino Vivante must read that the building *houses* the
  Embassy of the Czech Republic.** Under ruling 2, diplomatic premises are not foreign territory:
  do not write "Czech soil", "Czech territory", or anything of that shape. Villino Macchi di
  Cellere (1904, Burba, viale Giulio Cesare 31) and Villino Vitale (1900, Pazzi and Albertini, via
  Alessandro Farnese 4) are clean.

---

## 3. ESCALATE to the arbitrator — 2 candidates and 4 systemic straddles

I am not resolving any of these and I am not narrowing the finder's framing on them. **I checked
`wave1-arbitration.md`: none of the Prati/Borgo seams were ruled there.** They are genuinely open.

| Item | Straddle | My note |
|---|---|---|
| **S1 · Piazza del Risorgimento**, carrying **#12 Museo Storico dei Carabinieri** | Prati ↔ Borgo | **Confirmed by me from the raw SISTO record.** `1885-05-08 Prop.al CC n.96 ATTRIBUZIONE R. PRATI` and `1954-03-01 DT VARIAZIONE LIMITI R. PRATI E R. BORGO`. Roma Capitale itself records two rioni. Both geometric methods put the museum building in Prati. **This is the single highest-value object at risk in the wave** and now has publishable hours (§2.3). Borgo's verifier did **not** escalate this piazza, so there is no visible collision — but wave 1 cannot see me and I cannot see them. |
| **S2 · Piazza Adriana**, carrying **#13 Casa Madre dei Mutilati ed Invalidi di Guerra** | Prati ↔ Borgo | **Confirmed from the raw record**: attributed `R.BORGO` in 1885, `R.BORGO` again by `Del.GV n.101, 15 Jan 1942` (which also absorbed via degli Orti Domizi), then `R.R.PRATI-BORGO` in 1954. OSM PIP → Borgo; Nominatim → Prati; Nominatim returns three separate Piazza Adriana ways, two Borgo and one Prati. The building's other address, Largo dei Mutilati ed Invalidi di Guerra, PIP-tests Prati. **The building straddles.** #13 does not ship in a Prati file until this is ruled. |
| **S3 · Lungotevere Castello and Largo dei Mutilati** | Prati ↔ Borgo | **Collision confirmed.** Borgo's verifier escalated Lungotevere Castello as record 47 (*"nei rioni Borgo e Prati"*, infobox `Borgo - Prati`). Prati's finder escalated the same street. The 1989 act `Del.CS n.2444` carved the Largo out of the lungotevere *"di questo già parte integrante"*, and the Largo PIP-tests Prati while the lungotevere PIP-tests Borgo. **Two seed files are on course to claim the same street.** Rule this one first. |
| **S4 · The five Tiber bridges** | Prati ↔ Ponte / Campo Marzio / Flaminio / Della Vittoria | Ponte Umberto I, Cavour, Regina Margherita, Pietro Nenni, Giacomo Matteotti. Roma Capitale records each as belonging to two or three units. I take none of them. If they all go elsewhere Prati loses no core record, so this is low-stakes for the tier and should not delay the page. |
| **#39 · Porta Angelica** (demolished 1888) | Borgo ↔ Prati | **Both waves have independently PIP-tested the gate site to Prati** while it.wiki files it under `Categoria:Roma R. XIV Borgo`. The finder's own boundary work agrees: viale dei Bastioni di Michelangelo → Prati, via di Porta Angelica → Borgo, the gate at the junction. Borgo's verifier upheld via di Porta Angelica as a Borgo↔Prati escalation. **Two waves, same conclusion, opposite categories.** Arbitrator. |
| **LUMSA** | Borgo (main seat) ↔ Prati (via Marcantonio Colonna site) | Two Nominatim sites; the main seat PIPs Borgo. **My recommendation is drop, not escalate** — a university with its principal seat in another rione is not a Prati place, and it.wiki's Prati school list is not authority. |

Also on the border list and not taken by me: **via Stefano Porcari** and **piazza Amerigo Capponi**
(SISTO: both rioni). The finder's §7.3 warning stands — the Holy See's extraterritorial Palazzo del
Sant'Uffizio in that quarter is **Italian soil with diplomatic-headquarters immunities under
Lateran Treaty Art. 15**, is Borgo's and not Prati's, and must never be written as "in the Vatican".

---

## 4. DROP — 7 records

| # | Place | Reason |
|---|---|---|
| 24 | **Chiesa di San Giuseppe ai Prati** | it.wiki carries a *"fonti decisamente carenti"* maintenance banner and **the finder admits the Roma Segreta page was "not fetched in full — lead only"**. A source that was not actually fetched cannot support a claim. Drop. |
| 28 | **Teatro Prati** | Same failure twice over: it.wiki carries a sourcing banner, and `teatroprati.it` refuses the connection, so identity, address and hours cannot be confirmed from the theatre itself. A working venue we cannot confirm is open is the worst kind of entry. Drop. |
| 29 | **Liceo classico Dante Alighieri** | A school is not a visitor place, and the finder did not read the school's site. Civic furniture. Drop. |
| 30 | **The four barracks on viale Giulio Cesare** (+ the Gullace plaque, the Toselli bust) | No article for any of the four, no ministry page, not visitable, coordinates from an inline it.wiki template. it.wiki also contradicts itself — the history section says three barracks plus the Tribunale in a former barracks, the architecture section says four. The Tribunale Ordinario is a courthouse, not an attraction. Drop the whole group. |
| 37 | **Teatro Alhambra** | Flatly contradictory: it.wiki says built 1880, burned 1902; Roma Segreta says active 1871–1884, burned 1884, with Palazzo Blumenstihl raised in 1890. A 1902 fire cannot precede an 1890 building. it.wiki's own infobox contradicts its own body text on the address. Unpublishable in any version. The site may be mentioned inside #18 only as "the site of a theatre destroyed by fire", with no date. |
| 38 | **Santa Maria Immacolata al Collegio Pio Latino Americano** | One line in a list, citing a blog. The finder said it would drop it. Concur. |
| 40 | **Santa Maria delle Grazie a Porta Angelica** | The finder states outright *"I did not research it independently"*. Nothing to adjudicate. Drop; if wave 1 wants it, wave 1 has the evidence. |

---

## 5. What the finder got wrong

Ten findings. The first is the one that matters.

**5.1 The Carabinieri museum's hours are on the page the finder fetched and quoted.** The finder
wrote *"Hours not sourced — the site's practical sub-pages all return HTTP 410 … Do not publish
opening times."* It went looking on `/per-il-pubblico/come-raggiungerci` and `/servizi`, found 410s,
and concluded the hours were unreachable — without reading to the bottom of the page it had already
downloaded and already quoted from. The hours, the closure calendar and free admission are in the
last paragraph. This is a false negative that would have cost the corpus its most useful practical
fact in the rione. **Lesson for the remaining waves: read the whole of a page you have fetched
before declaring a fact unsourced elsewhere on the same site.**

**5.2 The Crepereia doll is ivory and amber, not oak.** The finder's own primary source says
*"una bambolina di avorio e ambra"*. The finder listed eight source conflicts in §7.2 and missed
this one, inside the source it called primary.

**5.3 "Two sealed sarcophagi of the same family" is unsupported.** The Cassazione says two adjacent
sarcophagi of a man and a woman with names of Greek origin. "Sealed" and "same family" are the
finder's additions.

**5.4 The fountain's municipal name is "Fontana in piazza dei Quiriti".** The finder titled the
record with Wikipedia's "Fontana delle Cariatidi" while citing the Sovrintendenza, which never uses
that name. Minor, but it is precisely the aggregator-over-authority slip the corpus rules exist to
prevent.

**5.5 SISTO's didascalia reads "Niccolò Gabrini", not "Nicola Gabrini".**

**5.6 The Cappella di Santa Maria Assunta date span is internally impossible** — "first half of the
19th century to 1950" for a chapel of an 1878 congregation in a 1909 convent. Transcribed without
challenge.

**5.7 "The Rome Council of the Ordine degli avvocati"** adds a body the Court's page does not name;
it says only "la sede dell'Ordine degli avvocati".

**5.8 The Waldensian theological faculty is not on the church's own site.** The finder presented it
inside a record whose primary source is the church, where it is it.wiki's claim.

**5.9 A missed intro fact, and it is a good one.** it.wiki's `Rioni di Roma` states plainly that
**Prati is the only one of the twenty-two rioni lying outside the city walls** — the Aurelian,
Gianicolensi and Leonine circuits. I confirmed it in the wikitext. That single sentence does more
work in an intro than most of Tier B and the finder did not use it.

**5.10 A ruling the finder should have made and passed to me instead.** Its §2 reproduces it.wiki's
border footnote describing the southern boundary as running along the Vatican walls *"from piazza
del Risorgimento along viale dei Bastioni di Michelangelo and via Leone IV as far as viale
Vaticano"*. The roster forbids stating the Vatican boundary in terms more precise than the Lateran
Treaty does, and the Treaty describes it only by an annexed 1:5000 map. **DROP that clause.**
Replacement:

> *"Prati's western edge is formed by viale dei Bastioni di Michelangelo and via Leone IV. Both are
> Italian streets within the rione. Nothing on the far side of the wall belongs to Prati or to any
> rione."*

**What the finder got right, and it is most of the file.** The SISTO discovery is verified,
correctly caveated (one representative point is not a geometry) and correctly not over-read. All
three rulings are respected without prompting. The dead-and-hijacked official links in §7.6 are a
real corpus hazard caught before it shipped — a pipeline copying it.wiki's `Sito ufficiale` field
would have published two gambling sites — and that warning should be lifted out of this file and
given to every remaining wave. The quarantine list in §7.5 is exactly the right instinct.

---

## 6. Tier ruling

**GUIDE.** A guide needs 4+ places. Prati clears it by a factor of eight and I did not stretch to
get there.

Surviving discrete place records, counting the multi-item entries out: 12 published + 19 rewritten,
which expand to roughly **34 records** once #16 is counted as three (piazza + two named gardens),
#31 as four villini and #33 as three embankment roads, and once #2 is folded into #1 as prose and
#12 is set aside pending S1.

**Even under the worst arbitration outcome the tier does not move.** If the arbitrator gives
piazza del Risorgimento, piazza Adriana, lungotevere Castello and all five bridges to Borgo, Ponte,
Campo Marzio and Flaminio, Prati loses the Carabinieri museum, the Casa Madre and every bridge —
and still holds the Palazzo di Giustizia, piazza Cavour and Galletti's monument, the Waldensian
temple, the Sacro Cuore del Suffragio with the Purgatory museum, piazza dei Quiriti with Selva's
fountain, San Gioacchino, via Cola di Rienzo, the Cinema Adriano, Santa Maria del Rosario, piazza
della Libertà with its two gardens, Palazzo Blumenstihl, Palazzo Odescalchi Simonetti, the Argento
museum, four villini, three lungotevere, two metro stations and Villa Altoviti. **About thirty
records.** The finder's own fear in §10 — that losing the southern edge leaves the page thin — is
overstated. It leaves the page shorter and it removes one excellent museum. It does not threaten
the tier.

I also endorse the finder's framing of what the page is about. Prati is not a monument count; it is
a single documented act of city-making, 1873 convention to 1921 constitution, and Roma Capitale's
own register dates almost every piece of it with a council act number. That is unusual and it is
the page's spine. The intro should lead on the walls fact (§5.9), the 1885 street-naming programme
and the 1921 constitution, and it should carry the register's act numbers, which no other Rome page
in the corpus can currently do.
