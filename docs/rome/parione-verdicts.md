# Parione (R. VI, code 106) — VERIFIER verdicts

Adjudicating `docs/rome/parione-finder.md`. Verification date **2026-09-02**.
I did not gather the finder's evidence and I owe it no loyalty. Every ruling below is mine.

**Tally across the finder's 52 numbered candidates: 14 PUBLISH · 21 REWRITE · 17 DROP.**
Plus **9 claim-level DROPs** (§5) not attached to any single candidate, and the whole of §6.5
(streets, bookshops, food and drink) dropped as a class (§4.4).

**TIER RULING: GUIDE.** Around 37 places survive with a source I re-fetched myself. Parione is
not a town-page rione and no padding was needed to get there.

**Reserved-list check, done independently.** I grepped the finder file for all 18 wave-1 reserved
names. Every hit is benign — "Colosseum" and "Sant'Angelo" in the polygon sanity check,
"Capitolin*" in *Sovrintendenza Capitolina* / *Archivio Storico Capitolino*, "Campidoglio" inside
the Giordano Bruno siting history, "Trastevere" in method notes, "Farnesina" only in the finder's
own name-collision warning. **No reserved place is claimed for Parione.** The finder is right that
Parione touches none of the four wave-1 rioni, and it refers no argument. Nothing to escalate here.

---

## 1. RE-FETCH LOG — what I checked myself

`python3` + `urllib`, browser UA, bytes read. I re-fetched far more than the five required.

| Source | Status | Verdict on the finder's use of it |
|---|---|---|
| `sovraintendenzaroma.it/.../fontane/fontana_dei_quattro_fiumi_in_piazza_navona` | 200 | **Confirmed verbatim.** "Autore: Gian Lorenzo Bernini", "Datazione: 1648 - 1651", "travertino, marmo, granito, bronzo", "acquedotto Vergine", the 1570s trough it replaced, the 1647 Borromini conduit of "180 once", the obelisk lying in pieces "nell'area del circo di Massenzio sulla via Appia antica", the silver model. Every one of the finder's facts. |
| `sovraintendenzaroma.it/.../monumenti/monumento_a_giordano_bruno` | 200 | **Confirmed verbatim** — 9 giugno 1889, rogo 17 febbraio 1600, Ferrari (1845-1929), bronzo e granito di Baveno, the 1876/1884 committees, the 1877 Comune contribution, the 1887 clerical Campidoglio, the rejected 1879 defiant version and the 1887 philosopher version. |
| `sovraintendenzaroma.it/.../fontane/fontana_della_terrina` | 200 | **Confirmed** — and it says *more* than the finder reported. See §3, item 47. |
| `sovraintendenzaroma.it/.../fontane/fontana_in_campo_de_fiori` | 200 | **Confirmed verbatim**, including "sede di uno storico mercato cittadino" and the 1898 repaving, 1858 buildings, acqua Paola, Baveno granite, closed-bud bronze nozzle. |
| `sovraintendenzaroma.it/.../monumenti/monumento_a_pietro_metastasio` | 200 | **Confirmed** — 1873 committee under Podesti, 1882 competition, 21 aprile 1886 in piazza S. Silvestro, moved 1910, via dei Cappellari n.30, opposite the Oratorio. Two problems anyway: see §3, item 46. |
| `sovraintendenzaroma.it/i_luoghi/roma_antica/monumenti/stadio_di_domiziano` | 200 | **Confirmed verbatim** on 1936, palazzo dell'INA, mt. 265x106, the Ionic/Corinthian arcades, travertine and brickwork, decorated stucco, and the hedged Pasquino attribution. **But two of the finder's sub-claims are not on it** — see §3, item 9. |
| `vatican.va/.../rc_seg-st_19290211_patti-lateranensi_it.html` | 200 | **Confirmed verbatim.** Art. 15 names "della Cancelleria" and reads "benché facenti parte del territorio dello Stato italiano, godranno delle immunità riconosciute dal diritto internazionale alle sedi degli agenti diplomatici di Stati esteri". Art. 16 is indeed a separate institute list. The finder's §4.1 is the best-sourced section in the file. One imprecision, §5(h). |
| `whc.unesco.org/en/list/91/` | 200 | **Confirmed verbatim** — 1980, boundary modification 1990, minor 2015 and 2023, criteria (i)(ii)(iii)(iv)(vi), Property 1,469.7 ha, and the "extended in 1990 … to the Holy See's extraterritorial properties" sentence. The finder's caution that the page does not name the Cancelleria is **correct** — no "Cancelleria" string on the page. **The finder missed a gift:** UNESCO's own brief description names **Piazza Navona** by name as one of the site's Renaissance/Baroque urban developments. That is a UNESCO-voice statement about a Parione place and it should be used. |
| `museodiroma.it` | 200 | **Confirmed verbatim**: "Museo di Roma, Piazza San Pantaleo, 10 e Piazza Navona, 2 - 00186 Roma - Tel. 060608". |
| `museobarracco.it` | 200 | **Confirmed verbatim**: "corso Vittorio Emanuele 166/A - 00186 Roma - Tel. 060608". |
| `sovraintendenzaroma.it` Museo di Roma and Museo Barracco pages | **404 at the finder's paths; 200 at the real ones** | See §2.2. Content confirmed once reached, but one claim taken from each must go — §3, items 17 and 29. |
| `archiviocapitolino.it` | 200 | **Confirmed**: "Piazza dell'Orologio, 4 - 00186 Roma", "06 67 10 81 00", "APERTURA AL PUBBLICO - INGRESSO LIBERO", and the *ricerche edilizie* scope caveat verbatim. Footer reads "© 2004-2016" — treat any hours on it as stale. |
| **`stadiodomiziano.com`** | **200 — and it does not say what the finder implies** | See §2.1. |
| **`casadelleletterature.it`** | **200 — and it is no longer the institution** | See §2.1. **The most serious finding in this review.** |
| it.wikipedia raw wikitext ×26 (`action=raw`) | 200 | Individually adjudicated in §3. Four articles the finder cited resolve to a **disambiguation page or a redirect**, not the article; three titles it declared absent are genuinely absent. |
| `bibliotechediroma.it` | 503 / 117-byte stub | **Could not be fetched.** The finder cited it for the Casa delle Letterature. |
| `vallicelliana.cultura.gov.it` | timed out | Same failure the finder hit on `vallicelliana.it`. Confirmed unreachable. |
| `efrome.it` | 200 | Nothing on a Parione address. No support for candidate 50. |

---

## 2. THE THREE SOURCES THAT DO NOT SAY WHAT THE FINDER SAYS THEY SAY

### 2.1 `casadelleletterature.it` is a dead domain repurposed as an affiliate content farm — DROP the source and everything on it

The finder lists it in §2.5 among "sources that worked (200)" and cites it as the first source for
candidate 45. It returns 200. It is **not the Casa delle Letterature**. The site now titles itself
*"Casa delle Letterature — Guide da Leggere Online"* and its front page carries, in order:
*"Telecomando FAAC lampeggia ma non apre"*, *"Termostato Seitron non si accende"*,
*"Videocitofono BTicino non si vede l'immagine"*. Its footer reads: *"IL SITO PARTECIPA A PROGRAMMI
DI AFFILIAZIONE COME IL PROGRAMMA AFFILIAZIONE AMAZON EU…"*. Sidebar categories: Bellezza, Casa,
Fai da Te, Giardino, Lavori Domestici, Sport. There are 34 pages of this.

A 200 is not a source. This is the exact failure the corpus rules exist to catch, and it slipped
through because the finder recorded the status code rather than the bytes. **Everything sourced to
it drops.** The fallback the finder named — `bibliotechediroma.it` — returned 503 to me. The only
survivor is the it.wikipedia article, which carries `{{F|Roma|marzo 2023}}`, Wikipedia's own
"unsourced" banner, plus a `{{C}}` accuracy tag. Candidate 45 has no usable source at all.

### 2.2 The Sovrintendenza museum URLs in the finder are wrong and 404

The finder cites `sovraintendenzaroma.it/.../roma_medioevale_e_moderna/musei/musei_in_comune/museo_di_roma`
and `…/museo_barracco`. Both **404**. The real paths have no `roma_medioevale_e_moderna` segment:

- `https://www.sovraintendenzaroma.it/i_luoghi/musei/musei_in_comune/museo_di_roma`
- `https://www.sovraintendenzaroma.it/i_luoghi/musei/musei_in_comune/museo_barracco`

Content confirmed once reached, so this is a citation defect rather than a fabrication — but a
published citation that 404s is a broken citation. **Authors must use the corrected URLs.**

### 2.3 `stadiodomiziano.com` says the site is CLOSED

The finder lists it as a working source and presents the Stadium as a visitable archaeological
area with a street address. The whole of what the page serves, in four languages, is:

> *"Si informa che l'Area Archeologica dello Stadio di Domiziano è attualmente chiusa al pubblico.
> Per informazioni è possibile contattare la Sovrintendenza Capitolina ai Beni Culturali."*

No hours, no address, no ticket. **Any Stadium entry must say the archaeological area is currently
closed to the public**, sourced to `stadiodomiziano.com`, or say nothing about visiting at all.

---

## 3. RULINGS ON THE 52 NUMBERED CANDIDATES

Where I give replacement wording it is in **bold quotes** and the author uses it verbatim.

### §6.1 — Piazza Navona and its set pieces

**1. Piazza Navona — REWRITE.** 100% Parione; uncontested. The stadium-shape and Innocent X
monumentalisation are sound. **Drop the bare Wikidata "architects: Bernini, Borromini"** — that
field flattens two men who worked on different objects in the square into one attribution for the
square itself. Add the UNESCO line the finder missed. Publish:
> **"Piazza Navona takes the shape of the ancient stadium beneath it, and was given its monumental
> form for Innocent X (Giovanni Battista Pamphilj). UNESCO names Piazza Navona among the
> Renaissance and Baroque urban developments of the Historic Centre of Rome (World Heritage
> site 91)."**

**2. Fontana dei Quattro Fiumi — PUBLISH.** Confirmed verbatim against Roma Capitale's own page,
every fact. The strongest entry in the file.

**3. Obelisco Agonale — REWRITE.** The Sovrintendenza page calls it a *"copia romana di epoca
domizianea"* and places it in pieces in the area of the Circus of Maxentius on the Via Appia Antica
before Innocent X moved it. It does **not** say "1st-century". Drop that. Publish:
> **"The obelisk crowning the fountain is described by the Sovrintendenza Capitolina as a Roman
> copy of Domitianic date; before Innocent X moved it to the square it lay in pieces in the area of
> the Circus of Maxentius on the Via Appia Antica."**

**4. Fontana del Moro — REWRITE.** I did not re-fetch this article and I will not certify it. The
Della Porta basin and the Bernini-designed Moor executed by Giovanni Antonio Mari are the standard
account and may publish **attributed to it.wikipedia**. **Drop the Olimpia Maidalchini funding** —
a specific patronage claim resting on one unre-fetched aggregator line.

**5. Fontana del Nettuno — REWRITE.** Same class. Wikidata's "inception 1574, architect Giacomo
della Porta" describes the **basin**; the Neptune group above it is a much later addition and the
bare field hides that. Publish the basin only:
> **"The basin at the north end of the square is attributed to Giacomo della Porta."**

**6. Sant'Agnese in Agone — REWRITE.** Location and dedication publish. Rainaldi and Borromini must
be **attributed**, not stated flat. The parish site is live and establishes identity, location and
functions — that is exactly what a place's own site is good for under the corpus rules. Its crypt
restoration programme is the parish's own statement and publishes as such.

**7. Palazzo Pamphilj — PUBLISH.** On Piazza Navona, built for the Pamphilj in the mid-17th century,
Girolamo Rainaldi confirmed in the it.wikipedia prose (not just the Wikidata field).

**8. Ambasciata del Brasile — REWRITE, and merge into 7.** It is not a second place; it is what
Palazzo Pamphilj is used for. it.wikipedia says *"ambasciata del Brasile presso lo Stato italiano"*.
**Drop "also accredited to Malta and San Marino"** — nothing I fetched supports it. Publish inside 7:
> **"The palace is used by the Pamphilj family as a private residence and as the embassy of Brazil
> to the Italian State."**

**9. Stadio di Domiziano — REWRITE, with two DROPs and one addition.**
The description is confirmed verbatim and **the Sovrintendenza page carries a field the finder never
mentioned: `Rione: VI - Parione`.** That is Roma Capitale's own rione attribution and it is a better
authority than the OSM polygon. Use it.
**DROP** "*Ground level is c. 5 m below the modern surface, visible from the arcades onto Tor
Sanguigna*" — **not on the cited page.** **DROP** the address "Via di Tor Sanguigna 3" — likewise
not on it. **ADD**, per §2.3:
> **"The Sovrintendenza Capitolina records the Stadium in Rione VI Parione. Its operator's website
> states that the archaeological area is currently closed to the public."**

**10. Nostra Signora del Sacro Cuore — REWRITE.** The bare title the finder cites is a
**disambiguation page**; the article is *Chiesa di Nostra Signora del Sacro Cuore (Roma)*. Fix the
citation. The front-on-Corso-del-Rinascimento / rear-on-Piazza-Navona fact publishes.

**11. Palazzo De Torres–Lancellotti — REWRITE.** The street frontages publish. **Drop the two post
boxes "larger for Rome, smaller for abroad"** — unre-fetched aggregator colour, and precisely the
kind of detail that is charming and wrong. The *albero della cuccagna* etymology may publish
attributed to it.wikipedia.

**12. San Nicola dei Lorenesi — PUBLISH.** Confirmed verbatim: the 1766 annexation of Lorraine to
France, integration into the *Pieux Établissements de la France à Rome et Lorette*, one of the five
French Catholic churches in Rome (named alongside San Luigi dei Francesi, Trinità dei Monti,
Sant'Ivo dei Bretoni, Santi Claudio e Andrea dei Borgognoni). **The architect field stays out** —
the finder correctly quarantined Wikidata's Canadian banker. Do not publish "vicino a Piazza Navona".

**13. Corsia Agonale / Via Agonale — DROP.** OSM-only, no sourced fact, not a place.

### §6.2 — Pasquino and Palazzo Braschi

**14. Pasquino — REWRITE.** **DROP "Rome's most celebrated *statua parlante*"** — it.wikipedia's
"la più celebre" is an aggregator superlative and the corpus rules say write what the institution
says, not what Wikipedia says. Everything else is confirmed and is unusually well hedged at source:
> **"Pasquino became a characteristic figure of the city between the 16th and 19th centuries. The
> Sovrintendenza Capitolina records that the statue is traditionally referred to the decoration of
> the Stadium of Domitian, that it was found in Piazza Navona at the corner with Via della Cuccagna,
> and that it represents the group of Patroclus and Menelaus — while noting that other statues
> certainly belonging to the Stadium's decoration were found in other excavations around it."**

**15. Piazza di Pasquino — DROP as a standalone place.** Bare OSM geometry. Fold into 14 as the
statue's location.

**16. Palazzo Braschi — REWRITE.** it.wikipedia states the rione outright — *"sito nel R. VI
Parione, compreso tra piazza San Pantaleo, via San Pantaleo, via della Cuccagna, via di Pasquino e
piazza Navona"* — confirmed verbatim, and that settles the location. **DROP the bare Wikidata
"inception 1804"**: the Sovrintendenza calls the building *settecentesco*, and a single-value date
cannot arbitrate that. **ADD** the fact the finder missed: it.wikipedia says the palace has housed
the Museo di Roma **since 1952**.

**17. Museo di Roma — REWRITE.** Addresses, telephone and the MIC-card line are confirmed against
both the museum's own site and the Sovrintendenza. **DROP "the most significant institution for the
social history and artistic activity of Rome"** — *"l'istituzione più significativa"* is the
operator's superlative about its own museum, the same class as the "oldest public museum in the
world" the Campitelli verifier banned from the identical source. Publish:
> **"The Museo di Roma occupies Palazzo Braschi, with entrances at Piazza San Pantaleo 10 and
> Piazza Navona 2. Its collections cover the social history and artistic activity of Rome from the
> Middle Ages to the early 20th century. Entry is free for MIC-card holders, with separate
> ticketing for the exhibition space; information and booking on 060608, 9.00–19.00."**

**18. Chiesa della Natività di Gesù — REWRITE.** National church of the Democratic Republic of the
Congo, facing Piazza Pasquino, in rione Parione — all confirmed verbatim. **DROP "Wikidata inception
1862"**: it.wikipedia says the church was built at the end of the 17th century and that **1862 is
the date of its last restoration**, by Andrea Busiri Vici, when it took its present form. Publishing
1862 as the foundation date would be flatly wrong.

### §6.3 — The Cancelleria / Campo de' Fiori quarter

**19. Palazzo della Cancelleria — PUBLISH, on the treaty framing. DROP the date and the architect.**
The extraterritorial handling is correct and I confirmed it against the primary text myself. The
licensing sentence is real: Art. 15 lists "della Cancelleria" and says these buildings, *"benché
facenti parte del territorio dello Stato italiano"*, enjoy the immunities international law
recognises for the seats of diplomatic agents of foreign states. Publish:
> **"The Palazzo della Cancelleria stands in Parione, on Italian soil. Article 15 of the Lateran
> Treaty of 1929 names it among the buildings which, in the treaty's own words, although forming
> part of the territory of the Italian State, enjoy the immunities that international law
> recognises for the seats of the diplomatic agents of foreign states. It is not part of Vatican
> City and it is not a border; visitors there are in Italy. It remains the property of the Holy See
> and houses the Apostolic Penitentiary, the Apostolic Signatura and the Roman Rota."**

**DROP the build date and the architect entirely.** I found a **three-way** conflict, worse than the
finder's two-way: it.wikipedia's prose says *"probabilmente progettato ed in parte compiuto tra il
1486 ed il 1496"*, its own infobox names **Baccio Pontelli**, and Wikidata says 1513 + Bramante —
where **1513 is in fact the year Leo X seized the newly finished palace**, not a construction date.
Wikidata has misread an event as an inception. No date, no architect ships.

**20. San Lorenzo in Damaso — PUBLISH, and here is the ruling the finder deferred.** Confirmed
verbatim: *"nel rione Parione, incorporata nel palazzo della Cancelleria"*, main entrance set into
the right-hand part of the palace façade. **The basilica does NOT inherit a stated status.** Art. 15
grants immunity to the named *palazzi*; no source I fetched states anything about the basilica's own
legal position. Describe it as incorporated into the palazzo and stop there. Saying nothing is the
only safe reading, and it costs the page nothing.

**21. Piazza della Cancelleria — DROP as a standalone place.** Bare OSM. Fold into 19.

**22. Campo de' Fiori — PUBLISH, with mandatory straddle wording. Escalated to the arbitrator.**
Confirmed verbatim: *"tra via dei Giubbonari e piazza della Cancelleria, ai confini dei rioni Parione
e Regola"*, and the article carries **both** the R. VI Parione and R. VII Regola categories. The
source declares the straddle itself, which is the cleanest possible warrant. Regola is in neither
wave, so Parione taking it creates no duplicate seed file. Publish with the split stated, never
concealed:
> **"Campo de' Fiori lies between via dei Giubbonari and piazza della Cancelleria, on the boundary
> of the rioni Parione and Regola. The Sovrintendenza Capitolina describes the square as the seat of
> a historic city market."**
If the coordinator later schedules Regola, this entry is the one to revisit.

**23. Monumento a Giordano Bruno — PUBLISH.** Confirmed verbatim, every date, both committees, the
1877/1887 political turn and both versions of the statue. Second-strongest entry in the file.

**24. Fontana di Campo de' Fiori — PUBLISH, with the date attributed.** Confirmed verbatim. One
thing the finder did not flag: **it.wikipedia dates the Campo de' Fiori copy to 1924, the
Sovrintendenza to 1898.** Roma Capitale's own page wins, but say whose date it is:
> **"The fountain now in the square is a 19th-century copy of the basin Giacomo della Porta designed
> for it. The Sovrintendenza Capitolina records that the copy was placed in 1898, during the
> repaving of the square, on ground that had been occupied by buildings until 1858, on the side
> toward via dei Cappellari, via del Pellegrino and piazza della Cancelleria. It is fed by the acqua
> Paola and reproduces Della Porta's basin in size and proportion, without the 17th-century lid."**

**25. Palazzo Orsini Pio Righetti — REWRITE.** **Drop the bare Wikidata "inception 1450".** The
Campo de' Fiori article carries the ownership chain — Orsini, then the Pio di Savoia who rebuilt it
entirely, then the Righetti — and that publishes attributed. Built over the substructures of the
Theatre of Pompey publishes.

**26. Teatro di Pompeo — REWRITE, and note it is the weakest surviving location claim.**
it.wikipedia states it plainly and I confirmed it: *"Si trovava nella zona del Campo Marzio, oggi
appartiene al rione di Parione"*, with the R. VI Parione category. That is enough to hold it despite
Largo del Pallaro being only 65% Parione. **"Rome's first masonry theatre" must be attributed, not
asserted** — it is an aggregator's priority claim with no institutional source behind it here:
> **"it.wikipedia describes the Theatre of Pompey as the first theatre in Rome built in masonry, the
> theatrum marmoreum, and states that the site today belongs to the rione Parione. The curve of its
> cavea survives in the line of the houses along Via di Grotta Pinta."**

**27. Santa Maria in Grottapinta — PUBLISH, minus the date.** Confirmed verbatim: deconsecrated,
rione Parione, faces the piazza of the same name, built on the foundations of the inner corridor of
the Theatre of Pompey. **DROP "Wikidata inception 1834"** — the article says outright that the date
of foundation is not known, and 1834 for a church raised on Pompey's corridor is not credible as an
inception.

**28. Piazza del Teatro di Pompeo / Via di Grotta Pinta — REWRITE.** The street publishes only for
the one sourced fact — the curve — and it belongs inside candidate 26, not as its own place. Drop
the piazza.

**29. Museo Barracco — PUBLISH, minus one phrase.** Address, telephone, MIC-card line and the 1904
donation by Giovanni Barracco all confirmed at both the museum's site and the Sovrintendenza.
**DROP "vicino a Campo de' Fiori"** — the finder quoted it.wikipedia's *"nel rione Parione, vicino a
Campo de' Fiori"* into the entry, and *vicino a* is exactly the unmeasurable proximity the corpus
rules ban. The finder claims in its own §8.3 to have stripped such phrases; it did not strip this
one. Note also that the Sovrintendenza page carries its own superlative — *"una delle più belle
raccolte museali del panorama romano"* — which the finder correctly refused. Hold that line.
Use the corrected URL from §2.2.

**30. Farnesina ai Baullari / Palazzetto Le Roy — REWRITE.** The name-collision warning against the
reserved Villa Farnesina is correct, valuable, and should be carried into the seed file as an
author's note. But there is **no it.wikipedia article at "Palazzetto Le Roy"** (404) and the entry
rests on a Wikidata Q-id alone. Publish it only as **"the palazzetto that houses the Museo Barracco"**
— no dates, no architect, no independent standing.

**31. Santa Barbara dei Librai — PUBLISH.** Confirmed verbatim, including the documented rione
change: *"anche detta Santa Barbara alla Regola (dal rione in cui era inclusa anticamente)"*, and
*"sorge precisamente nel Largo dei Librari"*. Do not carry the article's "dalle parti di Campo de'
Fiori" — vague proximity.

**32. Arco degli Acetari — REWRITE.** Location confirmed verbatim: *"nel Rione Parione, lungo Via
del Pellegrino"*, leading to an inner courtyard ringed by buildings of medieval origin. **DROP "one
of the best-preserved examples of historic popular building fabric in the centre"** — I read the
wikitext; that sentence carries no citation, it is the article's own superlative, and the corpus
rule is explicit that we write what an institution says, not what Wikipedia says. Note for the
author: this article was largely built in 2026 on `romasegreta.it` citations and is thin. Everything
beyond the location and the courtyard should be treated as unsourced.

**33. Palazzo Massimo alle Colonne — REWRITE.** Peruzzi and 1532 come from Wikidata alone here;
**attribute them** rather than stating them. The Via Papale frontage detail publishes attributed to
it.wikipedia. The building tests 100% Parione even though it addresses onto the shared corso —
that is the right way round, per §3.2 of the finder.

**34. Piazza dei Massimi — DROP.** Bare OSM.

**35. San Pantaleo — REWRITE. The finder has this wrong.** It reports "Wikidata: inception 1689,
architect **Giuseppe Valadier**". it.wikipedia says the church was rebuilt between **1681 and 1689
to a design by Giovanni Antonio De Rossi**, and that **Valadier's work is the neoclassical façade of
the early 19th century**. Valadier was born in 1762; he cannot have designed a church finished in
1689. This is the same Wikidata single-value flattening the finder itself warned about in §8.2 and
then walked into. Publish:
> **"San Pantaleo stands in rione Parione, facing its own piazza along corso Vittorio Emanuele II.
> it.wikipedia records that the church was rebuilt between 1681 and 1689 to a design by Giovanni
> Antonio De Rossi, and that its neoclassical façade, of the early 19th century, is the work of
> Giuseppe Valadier."**

**36. Piazza San Pantaleo — DROP as a standalone place.** It is the Museo di Roma's address; it
belongs in candidate 17.

**37. Cinema Farnese — DROP.** A Wikidata Q-id and nothing else. No fetched source, no sourced fact.

**38. Passetto del Biscione / Piazza del Biscione — DROP.** OSM-only.

**39. Piazza Pollarola / del Paradiso / dei Satiri — DROP.** OSM-only.

### §6.4 — The Chiesa Nuova / Oratorio complex

**40. Chiesa Nuova (Santa Maria in Vallicella) — PUBLISH, with mandatory straddle wording.
Escalated.** Confirmed verbatim: *"nella piazza omonima del rione Parione, sulla linea di confine
con il rione Ponte, in cui ricade parte dell'edificio"*, and the article's category is
*Chiese di Roma (rione Parione)*. The source names Parione first and assigns the category to
Parione; the geometry agrees on Parione. Publish here, with the straddle stated:
> **"The Chiesa Nuova stands on the piazza of the same name in rione Parione, on the boundary line
> with rione Ponte — it.wikipedia records that part of the building falls in Ponte."**
Note the finder's citation is a redirect: the article is *Chiesa Nuova (Roma)*, not
*Chiesa di Santa Maria in Vallicella*.

**41. Oratorio dei Filippini — PUBLISH.** Confirmed verbatim: built by **Francesco Borromini between
1637 and 1667**, commissioned by the Oratorian confraternity. 100% Parione on 46 vertices.

**42. Torre dell'Orologio — REWRITE, fold into 41.** No it.wikipedia article at the obvious title
(404); Wikidata only. It publishes as **"Borromini's clock tower on the Oratory complex"** and
nothing more.

**43. Biblioteca Vallicelliana — REWRITE.** I confirmed the it.wikipedia location statement verbatim
— *"situata in piazza della Chiesa Nuova nel rione Parione, a fianco della chiesa di Santa Maria in
Vallicella, al secondo piano dell'Oratorio dei Filippini"*, in Borromini's 17th-century building.
That publishes attributed. **The library's own site is unreachable — I tried `vallicelliana.it` and
`vallicelliana.cultura.gov.it`, both timed out.** So: **no hours, no access rules, and drop the bare
Wikidata "inception 1581"**. Location and building only.

**44. Archivio Storico Capitolino — PUBLISH.** Its own site confirms Piazza dell'Orologio 4, the
telephone, free public access, and the *ricerche edilizie* scope caveat verbatim. It occupies the
Oratorio dei Filippini, which tests 100% Parione. **Do not publish opening hours** — the site's
footer reads © 2004-2016 and I will not certify a schedule off it. The Sovrintendenza's own site
navigation lists "Archivio Storico Capitolino" as one of its sections, which corroborates the
finder's administrative claim better than the it.wikipedia citation it gave.

**45. Casa delle Letterature — DROP, entirely.** See §2.1. Its cited primary source is an Amazon
affiliate blog; its cited fallback returned 503; and the surviving it.wikipedia article carries
Wikipedia's own unsourced banner since March 2023. **"Founded May 2000" drops. "The first such Casa
in the city's cultural system" drops twice over** — unsourced, and a priority superlative. There is
nothing here I can certify, including that the institution still operates at that address. If a
later wave reaches a Roma Capitale page for it, it can come back.

**46. Monumento a Pietro Metastasio — REWRITE.** Confirmed verbatim against Roma Capitale, and it is
a good entry. Two corrections. **(a) DROP "near the poet's birthplace"** — the source's *"non lontano
dalla casa natale"* is an unmeasurable proximity and translating it is exactly what the finder swore
in §8.3 it had stopped doing. State the address without the distance. **(b) The Sovrintendenza page
contradicts itself on Gallori's dates** — its header says "Emilio Gallori (1846-1924)", its body
says "(1848-1924)". **Publish no birth year.** Publish:
> **"The monument to Pietro Metastasio stands in piazza della Chiesa Nuova. The Sovrintendenza
> Capitolina records that it was promoted by a committee of artists formed in 1873 under Francesco
> Podesti, director of the Accademia di San Luca, for the centenary of the poet's death; that the
> competition was held in 1882 and won by the sculptor Emilio Gallori; that it was inaugurated in
> piazza San Silvestro on 21 April 1886; and that it was moved to piazza della Chiesa Nuova in 1910,
> during the works along the line of corso Vittorio Emanuele II. The poet's birthplace was at via
> dei Cappellari 30, and the monument faces the Oratory of the Filippini, where sacred melodramas
> were performed."**

**47. Fontana della Terrina — REWRITE the history, DROP the location, and do not count it as a
Parione place.** The finder flagged this as its least confident item and was right to, but the
conflict is sharper than reported and I settled none of it:
- it.wikipedia states the fountain is **now in Piazza dell'Orologio**, moved there **in 2026** for
  the rebuilding of piazza della Chiesa Nuova **for Metro station works** — a specific, coherent
  reason the finder did not mention, which makes it harder to dismiss as vandalism.
- The article carries **both** `Roma R. V Ponte` **and** `Roma R. VI Parione` categories. Piazza
  dell'Orologio tests 60–74% Ponte.
- The Sovrintendenza page is silent on any move after 1924, but it does record a **1998 rearrangement
  of the piazza** and a **1999–2000 restoration** — so it is not a page that stopped being updated
  in 1924, which weakens the argument that its silence disproves a 2026 move. It simply may not be
  current.
- A conflict neither the finder nor I can resolve: **Sovrintendenza says the fountain was dismantled
  in 1889, it.wikipedia says 1899.**
- The OSM way the finder tested may predate the move.

Publish the object's history attributed to the Sovrintendenza — Della Porta, the sunken basin
forced by poor Acqua Vergine pressure, the 1622 travertine lid and its inscription, the removal for
the Giordano Bruno monument, the 1924 rebuilding before the Chiesa Nuova. **State no present
location and no rione, and do not list it among Parione's places** until someone checks where it
physically stands. Give the removal year as "1889 per the Sovrintendenza, 1899 per it.wikipedia" or
omit it.

**48. Piazza della Chiesa Nuova — DROP as a standalone place.** It is the setting for 40, 41 and 46.

**49. San Tommaso in Parione — REWRITE.** National church of the Eritrean Catholic community,
Alexandrian rite, in rione Parione — confirmed verbatim. **DROP "Modest in appearance and size"** —
an aesthetic judgement lifted from an aggregator, and the article itself carries a `{{Chiarire}}`
tag complaining that its content is thin.

**50. École Française de Rome — DROP.** The finder's own §7.5 concedes the institution's seat is
Palazzo Farnese in **Regola** and that the OSM relation may be a secondary building or mis-tagged.
I fetched `efrome.it` and found nothing placing it in Parione. An entry that rests on geometry the
finder itself distrusts, contradicted by the institution's known address, does not ship.

**51. Ambasciata di Guatemala presso la Santa Sede — DROP.** A Wikidata Q-id, no fetched source, and
a working diplomatic mission is not a visitable place. The finder's legal note — that an embassy
*to* the Holy See is an ordinary embassy on Italian soil, not an extraterritorial property — is
**correct and worth keeping in the research file** as a guard against a future error. It is not an
entry.

**52. Consolato Generale del Brasile — DROP.** OSM-only.

---

## 4. THE BULK LISTS IN §6.5

**4.1 Wholly-Parione streets — DROP as places, keep as context.** Via del Pellegrino, Via dei
Cappellari, Via di Grotta Pinta and the rest carry no sourced fact of their own beyond appearing in
another entry. Via del Pellegrino belongs inside the Arco degli Acetari entry; Via dei Cappellari
inside the Metastasio entry; Via di Grotta Pinta inside the Theatre of Pompey entry. None is a place.

**4.2 Bookshops — DROP, all six.** The finder is admirably honest here: OSM gives name and location
only, and it asserts no superlative. But that honesty is the reason they cannot ship. A bookshop
with nothing publishable but its coordinates is not a guide entry, and the facts that would make it
one — oldest, longest-trading, best — are precisely what the corpus rules forbid sourcing to the
shop itself. If a later wave fetches each shop's own site for hours and specialism, they can return.

**4.3 Food and drink — DROP, all of it.** Same reasoning, and the finder says as much ("Most should
probably not ship"). I agree and I am making it a ruling rather than a preference. Note additionally
that Il Baffetto and Frigidarium are on **Via del Governo Vecchio, a majority-Ponte street** —
Parione should not be claiming addresses on it at all while its ownership is unresolved.

**4.4 Net effect.** Nothing in §6.5 survives as a place. This does not threaten the tier.

---

## 5. CLAIM-LEVEL DROPS not attached to one candidate

- **(a)** `casadelleletterature.it` as a source of anything. §2.1.
- **(b)** The implication that `stadiodomiziano.com` corroborates a visitable Stadium. §2.3.
- **(c)** The two 404 Sovrintendenza museum URLs. §2.2. Use the corrected paths.
- **(d)** "Rome's most celebrated *statua parlante*" — aggregator superlative. Candidate 14.
- **(e)** "The most significant institution for the social history and artistic activity of Rome" —
  operator self-superlative. Candidate 17.
- **(f)** "One of the best-preserved examples of historic popular building fabric in the centre" —
  uncited aggregator superlative. Candidate 32.
- **(g)** Two vague-proximity phrases that survived the finder's own §8.3 sweep: "near the poet's
  birthplace" (candidate 46) and "vicino a Campo de' Fiori" (candidate 29). The sweep was not clean
  and the author should not trust §8.3 as a guarantee.
- **(h) The finder's Art. 15 / Art. 16 distinction is slightly wrong and must not be published as
  written.** It says "Art. 16 is a different list". Reading the treaty text: Art. 16 opens *"Gli
  immobili indicati nei tre articoli precedenti, nonché quelli adibiti a sedi dei seguenti istituti
  pontifici…"* — it covers the Art. 13–15 properties **as well as** a further institute list. So the
  Cancelleria is an Art. 15 extraterritorial property **and** is covered by Art. 16's tax and
  expropriation exemption. The correct statement is *"Art. 16 adds a further list of properties that
  receive only the tax and expropriation exemption, and those are not extraterritorial"* — which is
  what Ruling 2 actually warns against conflating. Do not write "the Cancelleria is Art. 15, not
  Art. 16".
  **Tripwire for the author:** Art. 16 contains the word *"vincoli"* — *"non saranno mai assoggettati
  a vincoli o ad espropriazioni"*. Here it means **encumbrances**, not heritage designation.
  Translating it as "listing" or "protection" would trip Ruling 1 on a primary source. Do not
  quote Art. 16 in English without this care.
- **(i)** The Wikidata P1435 harvest in §8.1. **Quarantine upheld, and the finder deserves credit for
  it.** Twenty Parione entities carry "Italian national heritage" and not one word of it may ship.
  The finder also correctly refused Q43113623 "part of UNESCO World Heritage Site" per-building —
  I confirmed the UNESCO page names no Parione building individually.

---

## 6. STRADDLERS AND OPEN QUESTIONS I AM ESCALATING

I am not resolving these. They go to the coordinator or the arbitrator.

1. **Campo de' Fiori** (Parione 60% / Regola 40%; two OSM objects giving different answers; the
   source declares the straddle; both rione categories on the article). My ruling is that Parione
   publishes it with the straddle stated, **because Regola is in neither wave and no duplicate can
   arise**. If Regola is ever scheduled, this is the first entry to re-adjudicate.
2. **Chiesa Nuova** — geometry 100% Parione on 21 vertices; the source says part of the building
   falls in Ponte. Published in Parione with the straddle stated; flagged for Ponte's eventual wave.
3. **Fontana della Terrina** — may now stand in Piazza dell'Orologio (Ponte-majority). Carries both
   rione categories. **Not counted as a Parione place** pending a physical check. Candidate 47.
4. **The Oratorio dei Filippini address split** — the building is 100% Parione; the Piazza
   dell'Orologio it addresses from is 60–74% Ponte. This governs candidates 41, 42, 43, 44. I have
   assigned by **building geometry**, and I think that is right, but it is a programme-level rule
   and someone should make it one.
5. **Santa Maria della Pace and Santa Maria dell'Anima** — I re-fetched the Pace article and confirm
   it verbatim: *"si trova nell'omonima piazza nel rione Ponte"*, category *Chiese di Roma (rione
   Ponte)*. **The finder is right; Parione has not taken them and must not.** But two major Baroque
   churches, plus Bramante's cloister, now fall through the gap between waves. Ponte needs
   scheduling. Note the finder's own caution that Nominatim says Parione for the Anima, so that one
   is genuinely contested rather than simply outside.
6. **Corso Vittorio Emanuele II** — a four-rione shared edge. The finder's recommendation (the corso
   owned by no single rione; buildings assigned by building geometry) is correct and I endorse it,
   but it is a programme-level rule and I cannot make it.
7. **Piazza di Tor Sanguigna** (Ponte 52% / Parione 48%; Nominatim says Ponte) — the piazza the
   Stadium's exposed arcades front onto. Since I dropped the Stadium's Tor Sanguigna address as
   unsourced anyway, nothing in Parione currently depends on this. Flagged so it is not lost.
8. **Via del Governo Vecchio** (Ponte 54% / Parione 46%) — I confirmed it.wikipedia has **no article**
   for it (404), so the finder's sourcing note is right. Nothing publishable regardless of ownership.

---

## 7. WHAT THE FINDER GOT RIGHT, AND WHAT IT GOT WRONG

**Right, and worth saying plainly.** The method section is the best I have adjudicated in this
programme: the `out geom tags;` trap in §2.2 is a real failure mode reported honestly, the
polygon sanity check against 11 known landmarks is proper verification, the second-method Nominatim
cross-check found three genuine disagreements instead of manufacturing agreement, and the three
disagreements were flagged rather than resolved. The Art. 15 handling is sourced to the treaty's own
text and framed exactly as Ruling 2 demands. The P1435 quarantine, the Wikidata Canadian-banker
catch, and the Villa Farnesina / Farnesina ai Baullari collision warning are all things a lazier
finder would have shipped as facts. The reserved-list check is clean and I reproduced it.

**Wrong.**
1. **`casadelleletterature.it` is not the Casa delle Letterature.** It was recorded as a working
   source on the strength of a 200 status code. Candidate 45 dies with it. §2.1.
2. **`stadiodomiziano.com` says the archaeological area is closed to the public** and the finder
   presents the Stadium as visitable, with an address that source does not carry. §2.3.
3. **Two Sovrintendenza URLs are wrong and 404.** §2.2.
4. **San Pantaleo is attributed to Valadier**, who was born in 1762 and could not have designed a
   church finished in 1689. De Rossi designed the church; Valadier did the façade. Candidate 35.
5. **The Natività di Gesù's 1862 is a restoration date, not a foundation date.** Candidate 18.
6. **Two vague-proximity phrases survived a sweep the finder declares clean.** §5(g).
7. **Three superlatives were carried through** — Pasquino, Museo di Roma, Arco degli Acetari —
   despite the finder policing superlatives carefully elsewhere (it refused the Barracco's "una
   delle più belle raccolte" from the same page family). §5(d)(e)(f).
8. **The Art. 16 characterisation is imprecise.** §5(h).
9. **The Sovrintendenza's `Roma antica` pages carry a `Rione:` field** — Roma Capitale's own rione
   attribution, better evidence than any polygon — and the finder never noticed it. The Stadio di
   Domiziano page reads `Rione: VI - Parione`. Future finders should check that field first.
10. **The UNESCO page names Piazza Navona by name** and the finder read the page without spotting
    the one sentence on it that is directly publishable about a Parione place.

**Headline count: 14 PUBLISH · 21 REWRITE · 17 DROP, plus 9 claim-level drops and all of §6.5.
TIER: GUIDE.**
