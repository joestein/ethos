# Ponte (R. V, code 105) — VERDICTS

Adjudication of `docs/rome/ponte-finder.md`. Verified 2026-09-02. I did not gather the finder's
evidence and I owe it no loyalty. Every ruling below is mine.

**Headline: TIER = GUIDE, 45 surviving place records.** Counts: **19 PUBLISH · 26 REWRITE ·
24 DROP · 8 objects escalated** (plus 32 straddler rows for the arbitrator).

---

## 0. WHAT I RE-FETCHED, AND WHAT SURVIVED THE RE-FETCH

The finder leaned hardest on six things. I re-fetched all six and then some.

| Source | Held? |
|---|---|
| **SISTO** `geoportale.comune.roma.it/sisto/api/viario` — the whole of §3 and §7 | **HELD, completely.** See §1. |
| turismoroma — Museo Nazionale Romano Palazzo Altemps | **Hours held. ADDRESS DID NOT.** §2.1 |
| turismoroma — Museo Napoleonico | Held exactly. |
| turismoroma — Basilica di San Giovanni Battista dei Fiorentini | Held, and the finder under-read it. §2.4 |
| turismoroma — Basilica dei Santi Celso e Giuliano in Banchi | Hours held. Address did not. §2.5 |
| turismoroma — Complesso Monumentale di San Salvatore in Lauro | Held, incomplete. §2.6 |
| turismoroma — Chiostro del Bramante · Santa Maria della Pace · Oratorio del Gonfalone · Palazzo Sacchetti · Ponte Sant'Angelo · Ponte Vittorio Emanuele II · Palazzo Primoli · Palazzo Altemps · Santuario di San Salvatore in Lauro | All 200. Several contradict the finder. §2 |
| it.wikipedia `Ponte (rione di Roma)` (action=parse, wikitext) | Held. Two things in it the finder missed. §3 |
| **`giustizia.it` Museo Criminologico page** | **"Pagina non trovata".** §5, DROP-6 |
| **it.wikipedia `Chiesa evangelica metodista di Ponte Sant'Angelo`** | **`missingtitle` — the article does not exist.** §5, DROP-4 |

**Two of the finder's sources do not say what he says.** Both are named above and both cost a record.

---

## 1. SISTO — I RE-RAN IT AND IT IS SOUND. §9.1 IS ANSWERED.

The finder's §9.1 called his own SISTO reading "the largest single risk in the file". I tested it.

**The mechanism is exactly as described.** `…/api/viario?codiceVia.equals={cod}` → take `id` →
`…/api/viario/{id}` → `elementoDeliberas[].suddivisionis[]` where `tipologia == "Rione"`, on the
deliberation with the latest `definitiva`. Note for the author: the finder's "cod." is `codiceVia`,
which is **not** the `id` the record endpoint takes. The search response's `suddivisionis` arrays
are empty; only the record endpoint populates them. Anyone re-running this who queries the search
endpoint alone will conclude the register is silent. It is not.

I re-ran sixteen codes independently. **All sixteen reproduce the finder's answer:**

| cod | toponimo | SISTO rioni today |
|---|---|---|
| 3113 | VIA DEI CORONARI | **PONTE** |
| 3112 | PIAZZA DEI CORONARI | **PONTE** |
| 8079 | ARCO DELLA PACE | **PONTE** |
| 9649 | PIAZZA DI S. SALVATORE IN LAURO | **PONTE** |
| 866 | VIA DI S. APOLLINARE | **PONTE** |
| 1298 | VIA DEL BANCO DI S. SPIRITO | **PONTE** |
| 34 | VIA ACCIAIOLI | **PONTE** |
| 3245 | VICOLO DEL CURATO | **PONTE** |
| 10050 | PIAZZETTA DI S. SIMEONE | **PONTE** |
| 10056 | VIA DI S. SIMONE | **PONTE** |
| 7687 | PIAZZA NAVONA | **PARIONE alone** |
| 5389 | VIA GIULIA | REGOLA + PONTE |
| 865 | PIAZZA DI S. APOLLINARE | PONTE + PARIONE |
| 6878 | VIA DI S. MARIA DELL'ANIMA | PONTE + PARIONE |
| 7976 | PIAZZA DELL'OROLOGIO | PONTE + PARIONE |
| 591 · 11491 · 10897 · 9060 | the four bridges | as the finder states |
| 11489 | CORSO VITTORIO EMANUELE II | PONTE + PARIONE + PIGNA + SANT'EUSTACHIO |
| 1297 | VIA DEI BANCHI VECCHI | PARIONE + PONTE + REGOLA |
| 5724 | VIA DEL GOVERNO VECCHIO | PARIONE + PONTE |

**RULING on the field's meaning: the containment reading is SOUND and may be used.** Two independent
grounds the finder did not give. First, `suddivisionis` of `tipologia: "Rione"` sits in the same
array position as `zoneDiDecentramento`, the municipio, which is definitionally a containment, not a
consultation. Second, every record's `limiti` endpoints are consistent with its rione set: Via del
Governo Vecchio runs *"DA PIAZZA DELL'OROLOGIO"* (Ponte + Parione) *"A PIAZZA DI PASQUINO"* (Parione
alone) and is recorded Parione + Ponte. A "rioni notified" reading would not produce that pattern
across ninety records.

**Standing limit.** I still found no field documentation. SISTO may be used to **place** a street and
to **flag** a straddle. It may **not**, on its own, be used to strip a place out of a shipped file.
That is the arbitrator's call, not this wave's.

**Two SISTO results the finder missed:**
- **Via Paola, cod. 8188 — PONTE ALONE**, *"DA PIAZZA DELL'ORO A PIAZZA DI PONTE S. ANGELO"*. This is
  the street joining the Sant'Angelo bridgehead to San Giovanni dei Fiorentini and it is absent from
  §3.1. **It is a place. PUBLISH-32.**
- **Vicolo Cellini, cod. 2614 — PARIONE + PONTE**, *"DA PIAZZA DELLA CHIESA NUOVA A VIA DEI BANCHI
  VECCHI"*. it.wikipedia's rione article names it on the Parione boundary. **This is a 32nd
  straddler row and it is missing from §7.6. ESCALATED.**

---

## 2. WHERE THE SOURCES DO NOT SAY WHAT THE FINDER SAYS

### 2.1 Palazzo Altemps — the address is wrong, and it collapses §7.3

The finder, §5.2: *"Roma Capitale gives **Piazza di Sant'Apollinare 46**… Publish Roma Capitale's."*

**Roma Capitale gives no such thing.** The turismoroma record carries two Locations and both read
**"Via di Sant'Apollinare"** — no. 8 and no. 46. And Roma Capitale's *Palazzo Altemps* page says of
the building itself: *"Il prospetto su piazza Sant'Apollinare ha molti ingressi a corridoio, mentre
quello su **via di Sant'Apollinare ha l'ingresso principale**"* — the main door is on Via di
Sant'Apollinare.

**Via di Sant'Apollinare is SISTO cod. 866, PONTE ALONE** (I verified it today). So the museum's
official address stands on a street Roma Capitale records as wholly Ponte's.

**RULING. §7.3 is closed for the building, and Palazzo Altemps is Ponte's outright.** The escalation
survives only for *Piazza* di Sant'Apollinare as a square, which nobody is claiming as a place.
**Address to publish, verbatim: `Via di Sant'Apollinare, 46`.** Never "Piazza di Sant'Apollinare 46"
and never it.wikipedia's "Piazza di San Apollinare 44".

### 2.2 Ponte Vittorio Emanuele II was not inaugurated on 5 May 1911

Finder, §6.2: *"first inaugurated 5 May 1911"*. Roma Capitale: *"fu inaugurato per la prima volta il
**5 giugno 1911**"*. **REWRITE.** Second inauguration 28 April 1912 holds.

### 2.3 Ponte Sant'Angelo: 135 or 136, and the angels are settled

Finder: built in **135**. Roma Capitale: *"lo volle edificare nel **136 d.C.**"* — **REWRITE to
Roma Capitale's date**, or give neither.

**And §9.4 is not unresolvable.** The finder wrote that no source establishes who made the bridge
angels and that "the page must not guess". Roma Capitale's own page states it plainly:
*"Nel 1668 si arricchì ulteriormente di dieci statue di angeli recanti i simboli della passione. Il
Bernini, su incarico di Clemente IX, ne disegnò le figure, affidandone l'esecuzione ai suoi
allievi."* **Exact wording to publish:** *"In 1668 ten statues of angels bearing the symbols of the
Passion were added. Roma Capitale records that Bernini designed the figures at Clement IX's
commission and entrusted their execution to his pupils."* Still no "Bernini's only" anything, and
still no claim about which statue is by whose hand.

### 2.4 San Giovanni dei Fiorentini — the finder under-read the page and published a conflict

Winter hours held exactly. **He omitted the summer hours the same page gives.** Publish both:

> *Winter: Monday to Friday 08.30–11.30 and 17.30–19.00; Sundays and feast days 08.30–13.00 and
> 17.30–19.00. July and August: Monday to Friday 08.30–12.00 and 17.00–19.00; Sundays and feast days
> 08.30–13.00 and 17.30–20.00. Roma Capitale notes that times may vary and asks visitors to contact
> the church.*

Address per Roma Capitale: **Via Acciaioli, 2** (SISTO cod. 34, Ponte alone). Phone 06 68892059.

**DROP the finder's "Bramante's first project for the Florentine national church dates to 1508".**
Roma Capitale gives a different and fully attributed chain that contradicts it: Leo X held a
**competition in 1518**, entered by Raphael, Michelangelo and Peruzzi among others; **Jacopo
Sansovino's** project won; the interior was completed only in **1620** through Antonio da Sangallo
the Younger, Giacomo Della Porta and Carlo Maderno (1614); Maderno raised the elongated dome the
Romans call *"il confetto succhiato"*; the travertine façade with six Florentine saints is
**Alessandro Galilei's, 1734**, under Clement XII; restored 1992. Borromini and Maderno are buried
there; Bernini's busts of Antonio Coppola and Antonio Cepparelli are held there; Ferdinando Fuga
made the chapel of San Filippo Neri, rector 1564–1575. **This supersedes the finder's §10.1 hedge
for this building. Use Roma Capitale's version, attributed to Roma Capitale.**

### 2.5 Santi Celso e Giuliano — hours right, address wrong

Hours held word for word (weekdays 07.00–12.00 / 15.00–19.00; feast days 08.00–13.30 / 15.00–19.45).
**But Roma Capitale's Location is `Vicolo Del Curato, 12`**, not Via del Banco di Santo Spirito,
which is only where the prose says it stands. Vicolo del Curato is SISTO cod. 3245, **Ponte alone** —
so nothing moves, but the address must be right. **Publish `Vicolo del Curato, 12`.**

Roma Capitale, not it.wikipedia, is the better source for the history and says the same: consecrated
in 432 by Pope Celestine I, enlarged in the 9th century, declared a papal chapel by Innocent III in
1198, rebuilt in the 16th century, restored in the 19th, with the dignity of a minor basilica.
**REWRITE the finder's "the first church on the site, consecrated in 432" to "consecrated in 432 by
Pope Celestine I"** — the source does not say "first". Do not carry *"Di origini antichissime"*.

### 2.6 Complesso Monumentale di San Salvatore in Lauro — half the record is missing

Hours held, **and the finder omitted the closure**: publish *"Tuesday to Saturday 10.00–13.00 and
16.00–19.00; closed Sunday and Monday."*

He then filled the record with Pio Sodalizio history and gave **none of what the museum actually
holds**. Roma Capitale: the Musei di San Salvatore in Lauro house the permanent donations and
galleries of **Emilio Greco** and **Umberto Mastroianni**, and have shown *Visioni del Grand Tour
dall'Ermitage*, the Gogol bicentenary, *Dostoevskij e l'Italia*, Cinetismo, and the Francesco Messina
centenary. **Publish that.** Do not carry *"scultori di fama internazionale"*.

### 2.7 Palazzo Primoli — four errors in one paragraph

Roma Capitale's page contradicts the finder's §5.3 on nearly every point:
- The architect is **Raffaele Ojetti**, not "Raffaello Ojetti".
- The rebuilding was commissioned by **Giuseppe** Primoli, sole owner **from 1901**, and the works
  **finished in 1911** — the finder attributed a vaguer version to fondazioneprimoli.it.
- The Filonardi acquired it at the **end of the 1700s**, not "a century after 1600".
- **Luigi Primoli bought it between 1820 and 1828**, and the page does not say "the first floor".

**Exact replacement:** *"The palace dates from the sixteenth century. It belonged to the Gottifredi —
a holding still marked on Nolli's plan of 1748 — and passed to the Filonardi at the end of the
eighteenth century. Count Luigi Primoli bought it between 1820 and 1828. After the Tiber embankment
walls and the opening of Via Zanardelli reshaped the area, Count Giuseppe Primoli, sole owner from
1901, entrusted the rebuilding to the architect Raffaele Ojetti: the old front on Piazza dell'Orso
came down, a new block with corner loggias went up, a monumental entrance was made on Via
Zanardelli, the building was raised, and a new façade was given to Piazza di Ponte Umberto. The work
finished in 1911."* Do not carry *"un unicum di notevolissimo interesse"*.

### 2.8 Museo Mario Praz — wrong date, wrong count, and it is publishable after all

The finder said both of its hosts failed and marked it low confidence. **Roma Capitale's Palazzo
Primoli page establishes it**: the Museo Mario Praz has been on the **third floor since 1 June
1995**, belongs to the **Galleria Nazionale d'Arte Moderna**, and is a house-museum of **about a
thousand** works — furniture, paintings, drawings, terracottas, bronzes, miniatures, silver, from the
late 18th century to the first half of the 19th — collected by **Mario Praz (1896–1982)**, anglicist
and art critic. **DROP** "more than 1,200 objects", **DROP** "Polo museale del Lazio from December
2014". No hours are establishable: write *"No source states its opening hours, so none are given
here."*

### 2.9 Oratorio del Gonfalone — better dates available, and one banned epithet

Hours line and phone held. Roma Capitale gives a much sharper history than the finder's it.wikipedia
paraphrase: built **between 1544 and 1547** over the church of Santa Lucia Vecchia for the
**Arciconfraternita del Gonfalone**, whose origins go to the 13th century and whose Compagnia was
officially recognised by Clement IV's Breve of **1267**; two-order façade by **Domenico Castelli**;
rectangular 16th-century interior with a *Storie della Passione di Cristo* cycle painted
**1569–1576** by Federico Zuccari, Cesare Nebbia and Livio Agresti in **twelve episodes**, from the
entry into Jerusalem to the Resurrection; carved wooden ceiling of **1568 by Ambrogio Bonazzini**.
It hosts the concerts of the Coro Polifonico Romano.

**BANNED, do not carry: *"la 'Cappella Sistina del Manierismo romano'"* and *"la pregevolezza di
questi affreschi"*.** An epithet of the form "the Sistine Chapel of X" is a priority claim by
another name and attribution does not save it.

**One correction to the finder's framing.** it.wikipedia's own rione article files the Gonfalone
under **"Sconsacrate"**. Do not call it "a rectory church". Say what it is: an oratory of the
Arciconfraternita del Gonfalone, used for concerts, with visiting arranged through the contacts
Roma Capitale gives.

### 2.10 San Salvatore in Lauro — two irreconcilable histories, do not blend them

Roma Capitale: first foundation near the Tiber **around the year 1000** by a small order of monks
(*"secondo alcune documentazioni storiche"*); destroyed in barbarian raids; **rebuilt and enlarged in
1177 by the Celestines**, devoted to San Giorgio in Alga, who held it about 200 years; **in 1668**,
after their suppression, it passed to the **Pio Sodalizio dei Piceni**, which instituted the cult of
the Madonna di Loreto.

The finder's account (Cencio Camerario 1192; Cardinal Latino Orsini's 15th-century convent; the
Canons Regular of San Giorgio in Alga) is it.wikipedia's and **conflicts on date and on agent**.
**RULING: publish Roma Capitale's, with its own hedge carried** — *"Roma Capitale records that,
according to some historical documentation, the first church here…"*. Do not merge the two.

**DROP the finder's "the parish site states the sanctuary is open every day."** He quotes nothing and
I did not fetch it. Roma Capitale says to consult the official site or telephone. Publish that.

### 2.11 Palazzo Sacchetti — the finder had less than the source gives, and one banned line

**BANNED: Roma Capitale opens *"Si tratta del più imponente palazzo di via Giulia"*. Do not carry
it in any form.** Everything after it is publishable and better than what the finder had:
designed and built by **Antonio da Sangallo the Younger (1483–1546)**, who lived there — the
inscription left of the balcony reads **"Domus Antonii Sangalli Architecti - MDXLIII"**; on Sangallo's
death sold to the **Ricci di Montepulciano**, who had **Nanni di Baccio Bigio** restructure and
enlarge it; **sold to the Marchesi Sacchetti in 1648**; *Storie di David* by **Francesco Salviati,
1553–1554**, in the Salone dell'Udienza; the Salone dei mappamondi with two late-17th-century globes
by the cosmographer **Vincenzo Coronelli**; *Sacra Famiglia* and *Adamo ed Eva* by Pietro da Cortona
in the Galleria; a 16th-century fountain with a putto between dolphins at the Via del Cefalo corner.
**DROP** "or his son Annibale Lippi" and "the Ceoli" — Roma Capitale names neither.
**Roma Capitale gives no hours. Do not imply the interior can be visited.**

### 2.12 Santa Maria della Pace — the official page contradicts itself; do not launder it

Address **Arco della Pace, 5** (SISTO Ponte alone), phone 06 68804038, and the hours line held
exactly. The finder's honest-hours sentence stands.

But turismoroma's Pace page is **internally inconsistent twice** and must not be used flat:
- It says the Cappella Cesi is *"opera di Antonio da Sangallo il Giovane"* and, four sentences later,
  *"La Cappella Cesi fu progettata da Michelangelo."* **Publish neither attribution from this page.**
- It has Raphael's Prophets completed by Timoteo Viti *"dopo la sua morte"* **in 1514** — Raphael
  died in 1520. **Publish only: the Sibyls and angels on the chapel arch are Raphael's, 1514, and
  the four Prophets above were finished to his design by Timoteo Viti.** No death-date sequencing.

What the page adds, and the finder missed entirely — **PUBLISH it**: the church stands where
Sant'Andrea de Acquarenariis stood, named for the water-sellers who drew from the Tiber and settled
out the sand; by tradition, in 1480 the image of the Virgin under the portico bled after a drunken
soldier threw a stone at it, and Sixtus IV renamed the church Santa Maria della Virtù; it was later
named Santa Maria della Pace for the Peace of Bagnolo, which ended the war between the Papal State,
Venice and the Kingdom of Naples. Dome added **1524** to Antonio da Sangallo the Younger's design.
Convex façade by **Pietro da Cortona, 1656**, for Alexander VII Chigi. Carlo Maderno's altar, 1614.
**Write the 1480 story as tradition ("by tradition", "secondo la leggenda") or not at all.**

**BANNED from this page: *"uno dei gioielli rinascimentali e barocchi di Roma"*, *"una delle opere
più importanti del Rinascimento"*, *"la bellissima Cappella Chigi"*, *"gli splendidi marmi"*,
*"Uno degli elementi più caratteristici"*.**

### 2.13 Palazzo Altemps the building — flat attribution, and two banned lines

The finder's *"designed in the 15th century by Melozzo da Forlì"* flattens what Roma Capitale
hedges. **Exact replacement:** *"Roma Capitale records that the palace was raised in 1477 for
Girolamo Riario, duke of Imola and nephew of Sixtus IV, over earlier medieval buildings, and that
Melozzo da Forlì, Luca Pacioli and perhaps Leon Battista Alberti took part in its construction."*
Then: sold 1511 to Cardinal Francesco Soderini, then Cardinal Innocenzo Cybo's residence; bought in
**1568 by Cardinal Marco Sittico Altemps**, who had **Martino Longhi the Elder** remodel it
**1577–1595**, including the altana toward Piazza Sant'Apollinare under four pyramidal spires and a
dome topped by the Altemps rampant ram; Giacomo Della Porta, Flaminio Ponzio, Tommaso Schiratti,
Girolamo Rainaldi and Onorio Longhi also worked there.

**BANNED from this page: the teatro Goldoni as *"uno dei più antichi teatri di Roma"*, and the
Sant'Aniceto chapel as *"l'unico caso di un papa sepolto in un edificio privato"*.** Both are
priority claims. The relics themselves are publishable: the chapel held the relics of Pope Anicetus
(155–166), found in the catacombs of San Callisto and granted by Clement VIII in 1603.

**Handle 1887 carefully.** Roma Capitale: in 1887 the palace *became property of the Holy See* and
housed the Pontificio Collegio Spagnolo; the Italian State bought it in **1982**. That is a
**property** history, not a territorial one. It is neither Vatican City nor a Lateran Treaty
property. **Never write "was Vatican territory" or "was in the Vatican".** Write: *"In 1887 the
palace became property of the Holy See and housed the Pontifical Spanish College; the Italian State
bought it in 1982."*

**BANNED from the museum page: *"la raccolta archeologica più importante del mondo"* and *"il famoso
originale greco"*.** The counts are fine and welcome: the Boncompagni Ludovisi collection comprised
about 450 sculptures, of which the State acquired **104**; fifteen of Cardinal Altemps's original
120 survive, four of them under the north portico.

---

## 3. WHAT THE it.wikipedia RIONE ARTICLE ACTUALLY SAYS

I re-fetched the wikitext. Three findings.

1. **The finder's strongest Ponte Sant'Angelo argument holds verbatim.** *"Il nome deriva da ponte
   sant'Angelo, raffigurato anche sullo stemma ed effettivamente appartenuto al rione sino
   all'istituzione, nel secolo XVI da parte di papa Sisto V, del rione Borgo."* And the arms:
   *"Il ponte S. Angelo bianco in campo rosso"*, cited to Carlo Pietrangeli. **PUBLISH both.**
2. **San Simeone Profeta is listed under "Scomparse".** The contradiction the finder flagged is
   real. **DROP.**
3. **The Methodist church is a red link.** The article title does not exist on it.wikipedia
   (`missingtitle`). **DROP.**

The article also gives two things the finder missed: **Monumento a Nicola Spedalieri is a bronze by
Mario Rutelli, 1898–1900** — publish that with the record — and a **Fontana del Leone in Piazza San
Salvatore in Lauro, set against Palazzo Piceni**, which has no article and stays a lead.

---

## 4. THE 45 THAT PUBLISH

Kind is **historic-site** for every church, palazzo, bridge, tower, street and fountain here; the
schema has no church, monument, square or bridge kind. `"photos": []` on all 45.

**Religious buildings (10).** San Giovanni Battista dei Fiorentini · Santa Maria della Pace ·
Santa Maria dell'Anima (see §6) · San Salvatore in Lauro · Sant'Apollinare · Santi Celso e Giuliano
in Banchi · Oratorio del Gonfalone · Santa Maria del Suffragio · San Biagio degli Armeni ·
Santi Simone e Giuda.

**Museums (5).** Chiostro del Bramante · Museo Nazionale Romano – Palazzo Altemps · Museo
Napoleonico · Museo Mario Praz · Musei di San Salvatore in Lauro (Complesso Monumentale).

**Theatres (2).** Teatro Tordinona · L'Arciliuto. Identity, address and kind only — no programme,
no hours, no claim about what is playing.

**Palazzi (11).** Sacchetti · Taverna · del Banco di Santo Spirito · Alberini · Lancellotti ·
Cesi-Gaddi · Milesi · Montevecchio Chiovenda · Boncompagni Corcos · Capponi Stampa ·
Casa di Fiammetta.

**Streets and squares (10).** Via dei Coronari · Via dei Banchi Nuovi · Via del Banco di Santo
Spirito · **Via Paola** · Via della Maschera d'Oro · Via di Monte Giordano · Via di Panico ·
Piazza di Ponte Sant'Angelo · Piazza di San Salvatore in Lauro · Lungotevere Tor di Nona.

**Other (3).** Tor Sanguigna · Fontana di piazza San Simeone · Monumento a Nicola Spedalieri.

**Bridges (4).** Ponte Sant'Angelo · Ponte Vittorio Emanuele II · Ponte Umberto I · Ponte Neroniano.

### 4.1 Rulings the finder asked me to make

- **Palazzo Altemps: ONE record, the museum, carrying the palace's history.** Two records would
  duplicate one address and one set of hours. Same ruling for **Palazzo Primoli: no separate
  record** — its architectural history goes into the Museo Napoleonico record, which shares its
  address, and the Praz record stands alone because it is a different institution on a different
  floor with a different owner. **San Salvatore in Lauro stays TWO records**, because the sanctuary
  and the museums have different addresses (no. 15 for both, but different phones, different
  contacts) and, decisively, **different hours** — the museums have clock times and the sanctuary
  does not. That is the general rule: *one address plus one set of hours means one record; a second
  set of hours means a second record.*
- **Pontificia Università della Santa Croce: DROP.** The finder is right that no honest kind fits.
  A working university with no public visiting is not a place in this corpus.
- **Bernini angels: not places.** Resolved on substance at §2.3.
- **The six clean squares (Lancellotti, Fiammetta, Montevecchio, Sforza Cesarini, dell'Oro,
  Pasquale Paoli): DROP as separate records, publish as addresses.** I agree with the finder.
- **Monte Giordano: DROP as a record.** His own reasoning is correct — publish it inside Palazzo
  Taverna and Via dei Coronari.
- **The three Holy See embassies: DROP, as the finder recommended.** They are ordinary Ponte
  addresses housing missions accredited to a foreign state, their status comes from the Vienna
  Convention and not the Lateran Treaty, and the guide value does not repay the wording risk.

### 4.2 Wording that must not appear, gathered

From the finder's own §10.4, upheld in full, plus the ones he did not catch because he did not read
the pages closely enough: *il più imponente palazzo di via Giulia* · *la raccolta archeologica più
importante del mondo* · *uno dei più antichi teatri di Roma* · *l'unico caso di un papa sepolto in un
edificio privato* · *la "Cappella Sistina del Manierismo romano"* · *scultori di fama internazionale*
· *un unicum di notevolissimo interesse* · *uno dei gioielli rinascimentali e barocchi di Roma* ·
*le principali prigioni di Roma* · *una famosa strada*. **Attribution saves none of them.**

Also banned in this file's own English: any "the only Methodist church", "the only non-Catholic
place of worship", "the rione's only" construction, whether or not it is true of our corpus.

And per Ruling 1, nothing anywhere may say a Ponte building is vincolato, listed, protected,
scheduled or declared a monument. Nothing in the finder's file does; keep it that way. The
`catalogo.beniculturali.it` citation inside the San Salvatore in Lauro wiki article is a citation to
an unreachable host and establishes nothing.

---

## 5. THE 24 DROPS

| # | Object | Reason |
|---|---|---|
| 1 | Palazzo Altemps as a second record | Duplicates one address and one set of hours (§4.1) |
| 2 | Palazzo Primoli as a separate record | Same |
| 3 | **Chiesa di San Simeone Profeta** | it.wikipedia's rione article lists it under "Scomparse" and its own article calls it extant. One source, two states. Publish neither |
| 4 | **Chiesa evangelica metodista di Ponte Sant'Angelo** | **The it.wikipedia article does not exist — `missingtitle`.** The finder's "a working Methodist church on Via del Banco di Santo Spirito" rests on nothing fetched |
| 5 | Pontificia Università della Santa Croce | No honest kind; no public visiting |
| 6 | **Museo Criminologico** | **`giustizia.it` returns "Pagina non trovata" for its page.** Nothing fetched establishes that it operates, and the roster requires `status` to agree with the prose. Its Palazzo del Gonfalone history may appear inside another record, attributed to it.wikipedia |
| 7 | Museo di arte sacra San Giovanni de' Fiorentini | No hours, no official site, no confirmed address. Fold into the basilica record |
| 8 | Teatro dei Coronari | Closed since 2006; does not operate |
| 9 | **Palazzo Sforza Cesarini** | it.wikipedia has only a disambiguation page. One subordinate clause in another article is not a source for a record |
| 10 | **Via Giulia as a Ponte place** | SISTO cod. 5389: REGOLA + PONTE, re-verified today. Ponte holds four buildings on it, not the street. Usable as an address. Escalated |
| 11 | Corso Vittorio Emanuele II | Four rioni; wave 2 already ruled it owned by none |
| 12 | Monte Giordano | Not visitable as an object; material, not a record |
| 13 | Carceri di Tor di Nona | Nothing survives. And *"le principali prigioni di Roma"* is a ranking claim |
| 14 | **Fontana della Terrina** | Suspension upheld. Three sources place it in three squares, and the finder's own note that it "moved again to its present place in **2026**" is not credible on its face |
| 15 | Arco dei Banchi | An OSM tag and a clean rione. No source, no record |
| 16 | Monumento a Terenzio Mamiani | Stands on the four-rione Corso |
| 17 | The four Bernini angels as places | Sub-parts of the bridge |
| 18 | Vittoria Alata ×2 and the two reliefs | Sub-parts of the bridge |
| 19 | Punto panoramico di Ponte Umberto I | Sub-part; and a viewpoint record invites vague-proximity wording |
| 20 | Acqua Vergine nasone and the Fontanella per cani | Not places, as the finder says |
| 21 | Lungotevere degli Altoviti and Lungotevere dei Fiorentini as records | Embankment roads with no content beyond a name; publish as addresses. Tor di Nona survives because it carries the prison and theatre narrative |
| 22 | The six palazzo leads (Bassi, del Drago, Vecchiarelli, Casa-studio Piacentini, Torre della Scimmia, "Casa di Raffaello") | No fetched source. If the Casa di Raffaello is ever written, the sentence that Raphael never lived there must go with it |
| 23 | The eleven demolished and deconsecrated churches | No address, no hours, nothing to visit. Sant'Anna dei Bresciani and Sant'Orsola della Pietà stay as material inside other records |
| 24 | The eleven restaurant, café, shop and hotel leads | The roster forbids using a business's own site for awards or trading history, and `guide.michelin.com` returned a zero-byte body, so no rating is establishable for any of them |

---

## 6. STRADDLERS ESCALATED TO THE ARBITRATOR

**32 rows.** The finder's 31, corrected on two counts, **plus Vicolo Cellini (PARIONE + PONTE, SISTO
cod. 2614)** which he missed.

**Removed from his list: #21 Piazza di Sant'Apollinare no longer blocks Palazzo Altemps** (§2.1) —
the square stays escalated as a square, but nothing hangs on it.

**Eight objects I am escalating rather than ruling:**

1. **Ponte Sant'Angelo.** I rule it **publishable by Ponte** and escalate for confirmation. Grounds:
   Borgo is shipped and does not have it (`taken_slugs.py` shows Castel Sant'Angelo and the Passetto
   only), so there is no collision; and the rione is named for it, its arms depict it, and
   it.wikipedia states it belonged to the rione until Sixtus V created Borgo. Geometry is 28/27 and
   settles nothing. **The historical argument, not the geometric one, is what carries this.**
2. **Ponte Vittorio Emanuele II.** Same shape, same ruling: Borgo shipped without it.
3. **Ponte Umberto I.** Prati is shipped with three bridges and not this one. Publishable by Ponte.
4. **Ponte Principe Amedeo Savoia Aosta.** Three rioni, two of them shipped, neither holding it.
   Publishable by Ponte on the same reasoning, but this is the weakest of the four and I want the
   arbitrator on it. Note Roma Capitale's own point for it lands in Borgo.
5. **Santa Maria dell'Anima.** Building tests Ponte on eight independent tests; its street is
   officially shared; the street sign is photographed on the Parione side. Parione is shipped and
   does not have it. **I rule it publishable by Ponte** — on the same logic that just settled
   Palazzo Altemps, a building is placed by its footprint, not by the whole length of its street —
   and escalate because wave 2 called it contested.
6. **Palazzo Gambirasi.** Addressed to Via della Pace 8, PONTE + PARIONE. No footprint test in the
   file. Not publishable by Ponte on this evidence.
7. **Albergo dell'Orso.** No vertex count for the building, sitting at the apex of two
   Campo Marzio + Ponte straddlers, with a near-identical hotel name testing into Campo Marzio.
   **Not publishable by Ponte on this evidence.** The three-name collision the finder flagged is
   real and should be settled before anyone writes it.
8. **Piazza dell'Orologio.** PONTE + PARIONE, and the richest square in the rione. Parione's shipped
   file does not have it. Worth the arbitrator's time.

---

## 7. TIER RULING

**GUIDE. 45 surviving records**, counted honestly against what I have ruled publishable above, with
every one of the 45 resting on a source I re-fetched or on a source class I re-fetched and found
sound (SISTO, turismoroma, it.wikipedia article prose).

The margin is not close and it does not depend on any escalation. Strike **all eight** escalated
objects — all four bridges, the Anima, Gambirasi, the Albergo dell'Orso and Piazza dell'Orologio —
and Ponte still stands at **37**, which is above Castro Pretorio's shipped 40 in kind and well above
Ludovisi's shipped 10. Ten religious buildings, five museums with three sets of real published
hours, eleven palazzi and ten streets is a guide by any reading this programme has used.

The finder claimed "about fifty uncontested entries". That was optimistic by roughly a fifth, mostly
because he counted institutions that have no honest kind, records with no fetchable source, and
squares he himself recommended folding into building records. **45 is the honest number and it does
not move the tier.**

---

## 8. WHAT THE FINDER GOT WRONG

He did the hardest thing in the programme — he got SISTO open, and it holds under an independent
re-run. That is worth more than everything below.

What he got wrong is a single repeated habit: **he took his history from it.wikipedia and his hours
from turismoroma, and never read the turismoroma prose.** Roma Capitale's pages for San Giovanni dei
Fiorentini, Santa Maria della Pace, the Gonfalone, Sacchetti, Primoli, Altemps, San Salvatore in
Lauro and Ponte Sant'Angelo each carry a fuller and better-attributed history than the it.wikipedia
article he used, and in four cases they contradict it. That habit produced:

- the **Palazzo Altemps address error**, which had him escalate a straddle that his own source
  closes (§2.1);
- **5 May 1911** for a bridge Roma Capitale inaugurates on **5 June** (§2.2);
- **§9.4 recorded as unresolvable** when the page he cited resolves it in one sentence (§2.3);
- **half the San Giovanni dei Fiorentini hours** and a Bramante attribution his source contradicts;
- **four errors in one paragraph on Palazzo Primoli**, including the architect's name;
- **Museo Mario Praz written off as unsourceable** when Roma Capitale sources it — 1 June 1995, GNAM,
  about a thousand works, not 2014 and not 1,200;
- **the Musei di San Salvatore in Lauro with no collection in them** and the Sunday–Monday closure
  missing.

Two claims do not survive re-fetch at all: **the Methodist church has no it.wikipedia article**, and
**the Museo Criminologico's giustizia.it page returns "Pagina non trovata"**. Both were already his
weakest and both are now dropped.

Two omissions: **Via Paola** is SISTO Ponte-alone and is a place; **Vicolo Cellini** is a straddler
he did not list.

And one thing he got right that I want on the record for the arbitrator: he re-tested the Colosseum
on a freshly fetched polygon set rather than inheriting wave 1's ruling, and it reproduced Celio.
Ponte makes no claim on it. He also correctly refused Piazza Navona, Via di Parione, Via del Teatro
Pace and the Corso, all of which SISTO confirms are not his.
