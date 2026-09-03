# Monti (R. I, code 101) — VERIFIER VERDICTS

Adjudicating `docs/rome/monti-finder.md`. Verification date 2026-09-02.

**This file is a decision, not evidence.** Every ruling below is mine. I did not gather the finder's
evidence and I owe it no loyalty. Where I re-fetched a source and it said what the finder said, I say
so. Where it did not, I name it.

---

## 0. HEADLINE

| | |
|---|---|
| **PUBLISH** | **45** |
| **REWRITE** | **39** |
| **DROP** | **58** |
| **ESCALATED to arbitrator** (rione unresolved; ruling deferred, not counted above as a fourth verdict — each escalated record also carries a content verdict) | **5 clusters, 13 records** |
| **TIER RULING** | **GUIDE** — far above the 4-place floor |
| Ruling 1 (designation) compliance | **PASS** |
| Ruling 2 (Vatican) compliance | **PASS** |
| Ruling 3 (photographs) compliance | **PASS** |

**The finder's single worst error is §4/E4** and it is an error about what a document it fetched
actually says. See §2.1. The second worst is §5.10's claim that Roma Capitale claims the Foro di
Nerva for Monti. It does not. See §2.2.

---

## 1. RE-FETCH LOG — the sources the finder leaned on hardest

I re-fetched twenty URLs with `python3` + `urllib`, raw bytes to disk, tags stripped locally. The ten
load-bearing ones:

| # | Source | Result | Does it say what the finder said? |
|---|---|---|---|
| R1 | `turismoroma.it/it/pagina/rione-i-monti` | 200, 148,804 B | **Perimeter quote verbatim correct.** The *inference* drawn from it is not. §2.3 |
| R2 | `vatican.va/…/rc_seg-st_19290211_patti-lateranensi_it.html` | 200, 78,834 B | Arts. 13/15/16 verbatim correct. **Annex II IS in this file — the finder said it was not.** §2.1 |
| R3 | `turismoroma.it/it/luoghi/obelisco-esquilino` | 200 | **Yes** — «nel Rione Monti» confirmed verbatim |
| R4 | `turismoroma.it/it/luoghi/basilica-di-santa-prassede` | 200 | **Yes** — «Situata nel rione Esquilino» confirmed. The contradiction is real |
| R5 | `turismoroma.it/it/luoghi/teatro-brancaccio` | 200 | **Yes** — «Situato nel cosmopolita quartiere Esquilino» confirmed; all dating confirmed |
| R6 | `scala-santa.com/dove-siamo/` | 200 | **Yes** — «Piazza di San Giovanni in Laterano 14 / 00184 Roma» confirmed |
| R7 | `turismoroma.it/it/luoghi/colonna-traiana` | 200 | **Yes** — every figure confirmed (113 AD, Apollodorus, ~40 m, 17 drums, 185 steps, 8 Aug 117, 1587 Sixtus V → St Peter) |
| R8 | `turismoroma.it/it/luoghi/battistero-lateranense` | 200 | **Mostly** — one attribution overstated. §2.6 |
| R9 | `turismoroma.it/it/luoghi/torre-dei-capocci` | 200 | **Yes** — Arcioni→Capocci, 36 m, late 12th c., brick from the Terme di Traiano, «di proprietà del Comune di Roma, attualmente non visitabile all'interno». Page also gives the civic number the finder omitted: **Piazza di San Martino ai Monti, 16** |
| R10 | `mercatomonti.com` | 200, 11,576 B | **Address yes** (Via Leonina 46/48, 00184 Roma RM). **Strapline no** — «Urban Market Since 2009» is not on the page I fetched. §2.9 |

Additional re-fetches that changed rulings: `sovraintendenzaroma.it/content/torre-dei-conti` (200,
**body extracts cleanly**), `sovraintendenzaroma.it/content/il-foro-di-nerva` (200),
`basilicasantamariamaggiore.va/it/basilica.html` (**200, not 403**),
`turismoroma.it/it/luoghi/basilica-di-san-giovanni-laterano` (200 — **a per-place page the finder did
not find**), `turismoroma.it/it/luoghi/foro-di-nerva` (200),
`santandrea.gesuiti.it` (200, hours confirmed), `palazzoesposizioni.it` (200, 21 Jan 1883 confirmed
three times on the page), `aitrescalini.org` (200 — **and it carries two banned claims the finder did
not flag**, §2.10).

**Reject-list spot check — all three I could test are correct and the finder deserves credit for
them.** `teatroeliseo.com` returns 200 and is *"GACORSLOT88 # Situs Slot88 Online"*, an Indonesian
gambling site on a hijacked theatre domain. `scalasanta.com` is a HugeDomains parking page,
**$3,195**. `santapudenziana.org` is *"Santa Pudenziana di Narni"*, Umbria — a different church in a
different region. All three would have produced a citation that was wrong or actively dangerous.
**Never cite or link any of them.** `sanmartinoaimonti.it` reset the connection for me and I could
not re-confirm the finder's affiliate-site finding; treat it as unusable either way.

---

## 2. THE TEN ADJUDICATIONS THAT MATTER

### 2.1 §4 / E4 — the finder's caution on the Scala Santa is FACTUALLY WRONG. **DROP the caution.**

The finder wrote: *"the Annex II schedule itself is not in the text I fetched … the Scala Santa's
extraterritorial status here rests on Art. 13's «edifici annessi» plus a Wikipedia gloss, not on a
clause I read. A verifier should obtain Annex II before any page states it."*

I obtained Annex II. It is in the same vatican.va document the finder fetched, above the treaty text:

> **Allegato II. - Immobili con privilegio di extraterritorialità e con esenzione da espropriazioni e
> da tributi**
> **Tav. 1.** - Basilica e Palazzo Apostolico Lateranense ed annessi **con la Scala Santa**
> **Tav. 2.** - Basilica di S. Maria Maggiore con gli edifici annessi
> **Tav. 3.** - Basilica di S. Paolo con gli edifici annessi

This is the most serious defect in the finder file, because it is not a judgement call — it is a
statement about what a fetched source contains, and the source refutes it. The finder read 56,861
extracted characters and missed a list sitting in the first 2,000. Everything downstream that says
"INFERRED" for E4 is wrong.

**RULINGS:**
- E4's extraterritorial basis: **PUBLISH**, sourced to Annex II Tav. 1 directly, not to Wikipedia.
- E2 Palazzo del Laterano: **REWRITE** — do not route it through Art. 13's «cogli edifici annessi».
  Annex II Tav. 1 names the **Palazzo Apostolico Lateranense** explicitly. Cite the annex.
- E3 Santa Maria Maggiore: **PUBLISH** — Art. 13 *and* Annex II Tav. 2 both name it.
- The «benché facenti parte del territorio dello Stato italiano» sentence: **PUBLISH**, verbatim
  correct, and it is the right sentence to carry.

**Exact replacement wording for any extraterritorial status line (author to use verbatim):**

> Under the Lateran Treaty of 11 February 1929, Italy recognises the Holy See's full ownership of
> this property (Art. 13; Annex II). Art. 15 states that the property, «benché facenti parte del
> territorio dello Stato italiano» — although forming part of the territory of the Italian State —
> enjoys the immunities that international law grants to the headquarters of the diplomatic agents of
> foreign States. It is on Italian soil and visitors are subject to Italian law.

### 2.2 §5.10 Foro di Nerva — the finder misreports Roma Capitale. **DROP from Monti.**

The finder: *"Foro di Nerva | Campitelli | and yet **Roma Capitale's Monti page** and the Monti
article both claim it. **Real conflict**, #6 above."*

I read the whole monument list on `rione-i-monti`. It is: Casa dei Cavalieri di Rodi, Foro di
Augusto, Colonna Traiana, Area Archeologica dei Fori Imperiali, Mercati di Traiano, Domus Aurea,
Ludus Magnus, Basilica di San Giovanni in Laterano, Palazzo del Viminale, Basilica di Santa Maria
Maggiore, Palazzo delle Esposizioni, Terme di Tito, Torre delle Milizie, Torre del Grillo. **The Foro
di Nerva is not on it.** Nor does the per-place `foro-di-nerva` page name a rione at all.

So there is no conflict. One Wikipedia category claims it; the OSM polygon puts it in Campitelli;
Roma Capitale is silent. **DROP #6 from the Monti file** — it belongs to Campitelli's finder.

**This DROP cascades.** Two further candidates are components of the Foro di Nerva and go with it:
- **#83 Porticus absidata** — the Comune's own Foro di Nerva page places it «alle spalle del tempio
  di Minerva», inside that forum. **DROP.**
- **#84 Tempio di Minerva (Foro Transitorio)** — same forum. **DROP.** (The finder also numbered two
  different records "84"; the presepio museum in §5.7 is the surviving one.)

### 2.3 §3.1 — the perimeter quote is right; the finder's inference #1 OVERREACHES. **REWRITE.**

The «Confini:» line is a list of boundary elements. «complesso del Laterano (entro le mura
aureliane)» appears **inside that list**, i.e. as a segment of the perimeter. A perimeter that runs
*along* the Lateran complex does not, by itself, put the complex *inside* the rione — that is exactly
the reasoning the finder correctly rejected for Santa Maria Maggiore two sections later, where it
noted the boundary "runs *along* piazza Esquilino … i.e. around the basilica block, not through it".
The finder applied one standard to SMM and the opposite standard to the Lateran.

**DROP** the sentence *"Roma Capitale puts the Lateran complex inside Monti, explicitly, in words."*

**But the finder under-used the same page and reached the right destination by the wrong road.** The
page's editorial prose, separate from the «Confini:» list, names among the monuments «qui presenti»
in the rione:

> «…la **Basilica di San Giovanni in Laterano**, la cattedrale di Roma, madre di tutte le chiese di
> Roma e del mondo, il Palazzo del Viminale … la **Basilica di Santa Maria Maggiore**, una delle
> quattro basiliche papali di Roma…»

*That* is Roma Capitale naming both basilicas as places present in Rione Monti, in its own voice.
It is much stronger than the perimeter inference and it is what should be cited.

**Exact replacement wording:**

> Roma Capitale's own page for Rione I – Monti names the Basilica di San Giovanni in Laterano among
> the monuments, archaeological sites and places of worship present in the rione, describing it as
> the cathedral of Rome. The Comune's perimeter description for the rione lists «complesso del
> Laterano (entro le mura aureliane)» among the rione's boundary elements.

### 2.4 A contradiction on Santa Maria Maggiore the finder did not find. **ESCALATE.**

Two sentences on turismoroma.it, both Roma Capitale's own voice, pull opposite ways, and neither is
in the finder file:

- `rione-i-monti`: the rione was named for three of the seven hills, «l'Esquilino, il Viminale, e
  parte del Quirinale», but «**Anche se … l'Esquilino non ne fa più parte**» — *the Esquiline no
  longer forms part of it.*
- `basilica-di-santa-maria-maggiore`: «**Sulla sommità del colle Esquilino**, si erge maestosa la
  [basilica]» — *on the summit of the Esquiline hill.*

Read together, those two sentences put SMM outside Monti. Read against the same site's monument list
for Monti, which names SMM, they do not. **turismoroma contradicts itself on SMM in a second,
independent way**, on top of the postcode seam. This does not resolve §3.3 — it makes it worse, and
the arbitrator must have it. The finder's own conclusion ("three fetched sources say Monti") is now
**two-and-contested**, not three.

**REWRITE §3.3's summary line.** Exact replacement:

> Roma Capitale's material on Santa Maria Maggiore is internally inconsistent. Its Rione I – Monti
> page names the basilica among the monuments present in the rione; the same page states that the
> Esquiline hill no longer forms part of the rione, and its page for the basilica places the basilica
> on the summit of the Esquiline hill. The rione assignment is unresolved.

### 2.5 §7.3 — the Santa Maria Maggiore 403 finding is WRONG. **DROP it.**

The finder reported `basilicasantamariamaggiore.va/it/basilica/` → 403 and concluded the basilica's
own site was closed to us. The turismoroma page publishes the correct URL form, and it works:

`https://www.basilicasantamariamaggiore.va/it/basilica.html` → **HTTP 200, 28,446 bytes.**

The 403 was a directory-form URL, not a block. Any downstream page that says the basilica's own site
is unreachable must not say it. **Hours are still not obtained** (`/it/orari.html` is 404, and
turismoroma's «Orari» is a link, not inline text) — so the DROP on hours stands, but for a different
and narrower reason: *not yet fetched*, not *refused*.

### 2.6 §5.1 #19 Battistero — one attribution overstated. **REWRITE.**

The finder: *"wall paintings after Andrea Sacchi, and by Andrea Camassei, Giacinto Gimignani, Carlo
Maratta"*. The page says «Sulle pareti, in alto, **copie moderne** di opere di Andrea Sacchi con
storie di Giovanni Battista e, in basso, affreschi con storie di Costantino, opere di Andrea
Camassei, Giacinto Gimignani e Carlo Maratta». The Sacchi works on the walls are **modern copies**;
only the lower Constantine frescoes are attributed to the other three.

Two smaller corrections from the same fetch: the font is «un'**urna di basalto verde**» — green
basalt — and the 1967 bronze deer were placed by **Pope Paul VI**, whom the page names.

**Exact replacement wording:**

> High on the walls are modern copies of works by Andrea Sacchi showing scenes from the life of John
> the Baptist; below them, frescoes of scenes from the life of Constantine by Andrea Camassei,
> Giacinto Gimignani and Carlo Maratta. At the centre of a sixteenth-century circular enclosure
> stands the font, an urn of green basalt with a bronze cover by Ciro Ferri (1634–1689). Two bronze
> deer were placed there in 1967 by Pope Paul VI.

Everything else on #19 re-verified clean: 4th c. by Constantine, over a 1st-c. villa and a 2nd-c.
bath building, the 1657 Chigi frieze by Borromini, octagonal plan, eight porphyry columns with
Corinthian capitals, the 1054 conversion of the portico into two chapels, the 5th-c. mosaic. The
page's opening «È il più antico Battistero monumentale» is a superlative — the finder quarantined it
correctly and it stays out.

### 2.7 §5.1 #14 Torre dei Conti — the Sovrintendenza body DOES extract. **REWRITE, upgraded.**

The finder: *"A Sovrintendenza Capitolina page exists … (HTTP 200) but I could not extract its body
text past the site chrome."* It extracts fine. The body reads:

> «La Torre dei Conti fu edificata da papa Innocenzo III Conti (1198-1216) verso il 1203 per il
> fratello Riccardo come residenza fortificata per lui e per la sua famiglia. Originariamente alta
> circa 60 metri, dopo i danni dovuti al terremoto del **1349** e ad alcuni crolli avvenuti nel XVII
> secolo la Torre fu ridotta all'altezza odierna e trasformata in deposito di legname e fienile. Essa
> ingloba nei suoi sotterranei una delle quattro esedre in opera quadrata di tufo del Foro della Pace
> (71-75 d.C.).»

**Exact replacement wording for #14:**

> The Sovrintendenza Capitolina states that the Torre dei Conti was built by Pope Innocent III Conti
> (1198–1216) around 1203 for his brother Riccardo, as a fortified residence for himself and his
> family. It stood about 60 metres high. After earthquake damage and further collapses in the
> seventeenth century it was reduced to its present height and turned into a timber store and
> hayloft. Its cellars incorporate one of the four squared-tufa exedrae of the Forum of Peace
> (71–75 AD).

**And a conflict the finder created and did not notice.** Its #11 and #14 both date the earthquake to
**1348**, sourced to turismoroma's Torre delle Milizie page. The Sovrintendenza — also Roma Capitale
— says **1349** for the same event. **DROP the bare year from both records.** Two arms of the same
municipality disagree; a page may say "an earthquake in the mid-fourteenth century" or attribute each
year to the arm that published it, and nothing else.

### 2.8 §7.5 — the "single highest-value unfinished lead" is largely CLOSED. **REWRITE.**

The finder called the un-guessable Sovrintendenza URL pattern *"the single highest-value unfinished
lead for Monti"*. It is not un-guessable — it is **published**. Each turismoroma per-place page
carries the Sovrintendenza URL in its `Sito web` field. The Foro di Nerva page hands over
`www.sovraintendenzaroma.it/content/**il**-foro-di-nerva` — the definite article the finder's guesses
omitted, which is why `/content/casa-dei-cavalieri-di-rodi` and `/content/villa-aldobrandini` 404'd.
Harvest the field rather than guessing the slug. This is a research instruction, not a publishable
claim.

### 2.9 §5.11 #132 Mercato Monti — address holds, strapline does not reproduce.

Address **PUBLISH**: Via Leonina 46/48, 00184 Roma RM, from its own site, re-verified.
«Urban Market Since 2009» **was not on the homepage I fetched** (11,576 bytes; the page is a contact
stub). The finder was right that the claim is unpublishable — it is a trading-duration claim on a
self-published source — and it is now also unreproducible. **DROP, twice over.**

### 2.10 §5.11 #133 Ai Tre Scalini — the finder's ban list is INCOMPLETE. **REWRITE.**

Address **PUBLISH**: Via Panisperna 249/251, 00184 Roma, stated twice on its own site, re-verified.
The site describes itself as being in «Rione Monti», also confirmed.

The finder flagged only «authentic»/«celebre» marketing framing. The page carries two further claims
that the corpus rules ban outright and the finder did not name:

1. «i documenti la fanno **risalire almeno al 1895**» — *a trading-duration claim on a self-published
   source.* Banned by the corpus rule in terms. **DROP.**
2. «Nel cuore di Rione Monti, **a due passi dal Colosseo**» — *"a couple of steps from the
   Colosseum".* This is the vague-proximity ban, verbatim. **DROP.**

Publishable from this source and nothing more: the name, the street address, the postcode, that it is
a *vineria*, and that an American vine grows on the facade.

---

## 3. VERDICT REGISTER

Numbering follows the finder's. **P** = publish, **R** = rewrite, **D** = drop, **E** = escalated on
rione (content verdict shown alongside).

### 3.1 Marquee subjects (§5.1)

| # | Place | Verdict | Reason |
|---|---|---|---|
| 1 | San Pietro in Vincoli | **R** | Address fine. The *Mosè* is sourced only to an OSM `artwork` node. Either fetch a per-place source or write: "OpenStreetMap records Michelangelo's *Moses* at this church." Do not assert it unattributed |
| 2 | Mercati di Traiano | **P** | All dating re-verified. «il primo museo di architettura antica» stays out |
| 3 | Colonna Traiana | **P** | Every figure re-verified against the page |
| 4 | Foro di Traiano | **R** | "112 and 113 AD per the Comune's own dating table" — I did not re-fetch that table. Carry as unsourced-pending or fetch `area-archeologica-dei-fori-imperiali` first |
| 5 | Foro di Augusto | **P** | 2 BC, Mars Ultor, the firewall to 33 m, Arco dei Pantani — all as written |
| 6 | **Foro di Nerva** | **D** | §2.2. Campitelli by PIP; Roma Capitale does **not** claim it for Monti |
| 7 | Domus Aurea | **P** | turismoroma facts only. No hours, tickets or opening claims — no operator source exists in this file |
| 8 | Terme di Traiano | **P** | «il più grande complesso termale esistente al mondo» stays out |
| 9 | Terme di Tito | **P** | «subito a fianco della Domus Aurea» stays out — vague proximity |
| 10 | Ludus Magnus | **R** | The finder's gloss "among Monti's archaeological areas **open to the public**" is not what the page says. Replacement: "Roma Capitale names the Ludus Magnus among the monuments, archaeological sites and places of worship present in Rione Monti." «la più grande delle palestre gladiatorie di Roma» stays out |
| 11 | Torre delle Milizie | **R** | Drop the bare year "1348" (§2.7). Everything else holds |
| 12 | Torre del Grillo | **P** | As written |
| 13 | Torre dei Capocci | **P** | Re-verified. Add the civic number the page gives: **Piazza di San Martino ai Monti, 16** |
| 14 | Torre dei Conti | **R** | §2.7 — replacement wording supplied, materially richer than the finder's |
| 15 | Casa dei Cavalieri di Rodi | **R** | No per-place page exists on any of three municipal sites. Publishable: the name, Piazza del Grillo 1 from OSM, and that Roma Capitale names it among the rione's monuments. Nothing else |
| 16 | Suburra | **P** | Attributed to Wikipedia as the finder did. The firewall fact is separately turismoroma-sourced — correct handling |
| 17 | **Santa Maria Maggiore** | **E** + **R** | §2.4, §2.5. Rione unresolved and now worse. Art. 13 + Annex II Tav. 2 status **P**. Facts as written **P**. The "site returns 403" finding **D** |
| 18 | **San Giovanni in Laterano** | **E** + **P** | Rione unresolved. Facts **P** — and note a per-place turismoroma page exists at `/it/luoghi/basilica-di-san-giovanni-laterano`, which the finder did not find; it does not name a rione, so it neither helps nor hurts §3.2 |
| 19 | Battistero lateranense | **E** + **R** | §2.6 — replacement wording supplied |
| 20 | Palazzo del Laterano | **E** + **R** | §2.1 — cite Annex II Tav. 1, which names it, not Art. 13's «edifici annessi». Signature date 11 Feb 1929 corroborated by the treaty text: **P** |
| 21 | **Scala Santa / Sancta Sanctorum** | **D** *(from the Monti file)* | Both OSM methods say Esquilino and the Comune does not name it. It publishes under Esquilino. Its extraterritorial basis is now **confirmed**, not inferred (§2.1) — carry that finding across to whoever writes Esquilino. «situato accanto alla grande Basilica» stays out — vague proximity |
| 22 | Obelisco Lateranense | **P** | Metrics only: 32.18 m, 45.70 m with cross and base, 455 t, Thutmose III/IV, moved by Constantine, transport interrupted by his death in 337. Both superlatives stay out — correctly quarantined |
| 23 | Obelisco Esquilino | **R** | Re-verified, but "uninscribed" is imprecise: the **shaft** is uninscribed, which is why it cannot be dated; «su ogni lato del basamento … sono scolpite delle iscrizioni in latino». The page also says it is «probabilmente di fattura romana», which the finder dropped. Replacement: "The shaft carries no inscription, which prevents it from being dated; Roma Capitale considers it probably of Roman manufacture. Latin inscriptions are carved on each side of the base." 1587 / Sixtus V / Domenico Fontana **P**; the page adds his brother Marsilio and his nephew Carlo Maderno |

### 3.2 Civil architecture (§5.2)

| # | Place | Verdict | Reason |
|---|---|---|---|
| 24 | Palazzo delle Esposizioni | **P** | 21 January 1883 re-verified three times on its own site; Via Nazionale 194, 00184 confirmed |
| 25 | Palazzo del Viminale | **P** | Full chain of dates as written |
| 26 | Palazzo della Consulta | **E** + **P** | Facts sound. It fronts piazza del Quirinale, which both rioni call the boundary. Escalated with cluster 3 |
| 27 | Palazzo Pallavicini Rospigliosi | **P** | As written |
| 28 | Palazzo Koch | **R** | 1882 and Gaetano Koch come from the Wikipedia article — attribute explicitly. The Banca d'Italia head-office fact and «Visite a Palazzo Koch» come from the bank: **P** |
| 29 | Palazzo Brancaccio | **R** | Attribute the 1886–1912 / Carimini dating to Wikipedia. Carry the CAP flag |
| 30 | Palazzo del Grillo | **R** | "17th century" attributed to Wikipedia only. Thin but corroborated by the turismoroma Torre del Grillo page — say which fact came from which |
| 31 | Villa Aldobrandini | **P** | Full chain re-checkable on the cited page |
| 32–35 | Cimarra, Silvestri-Rivaldi, Imperiali Borromeo, Giorgioli | **D** ×4 | Category membership and a street name. No fetched per-place source, no claim to publish |
| 36 | Palazzo Passarini Falletti | **D** | "17th century" from a Wikipedia list. Not a place record |
| 37 | Palazzo Borgia | **R** | Survives only as a detail of #56 (the Loggia Borgia above San Francesco di Paola). Fold it in; do not stand it up alone |
| 38 | Villa Sforza ai Quattro Cantoni | **R** | Dating and current occupant only. The finder stripped the `vincolo` sentence correctly (§7.1) — **that stripping is upheld and must survive into every draft** |
| 39 | Casa Bernini | **D** | Category only |
| 40 | Palazzo dell'ISTAT | **R** | Attribute 1931 to Wikipedia; `istat.it` establishes the seat |
| 41 | Istituto Leonardo da Vinci | **D** | A year from a list |

### 3.3 Churches (§5.3)

| # | Place | Verdict | Reason |
|---|---|---|---|
| 42 | Santa Maria ai Monti | **P** | Full turismoroma page |
| 43 | San Clemente al Laterano | **P** | Both methods Monti; Celio does not list it in its own monuments. Straddle resolves to Monti. «circa 300 metri oltre il Colosseo» is measured and sourced — **publishable**, and the finder was right to say so |
| 44 | Mitreo di San Clemente | **R** | Not a separate place record. Fold into #43 as a described feature |
| 45 | SS Silvestro e Martino ai Monti | **R** | The page contradicts itself, 1229 vs 1299. **Carry neither.** Write the Carmelite entrustment without a year, or omit it. Everything else stands. The website OSM lists is rejected — upheld |
| 46 | Santa Prassede | **P** *(facts)* / **D** *(that page's rione sentence)* | «Situata nel rione Esquilino» re-verified as present **and as wrong** against every other method. The building fabric facts publish; the rione sentence must never be cited |
| 47 | Sacello di San Zenone | **R** | Fold into #46 |
| 48 | Santa Pudenziana | **R** | No per-place source. Name, street, PIP only. `santapudenziana.org` rejection upheld — it is a different church in Umbria, re-verified |
| 49 | Santo Stefano Rotondo al Celio | **R** | Both methods Monti despite the name; via di Santo Stefano Rotondo is the boundary in both perimeters. But turismoroma 404s, so: name and OSM address only |
| 50 | San Vitale | **D** | No coordinate, no per-place source, category only |
| 51 | Sant'Agata dei Goti | **R** | Name and street only; the `confrades.com` source is too thin to carry anything |
| 52 | Sant'Andrea al Quirinale | **P** + boundary flag | Hours re-verified on its own site: **martedì–domenica 9.00–12.00 and 15.00–18.00, lunedì chiuso.** Via del Quirinale 30, 00187. Fronts a boundary street — flagged, not escalated |
| 53 | San Carlo alle Quattro Fontane | **P** | Full turismoroma page. The OSM postcode 00817 is invalid and must not be carried — upheld |
| 54 | Chiostro del Borromini | **R** | Fold into #53 |
| 55 | SS Sergio e Bacco degli Ucraini | **R** | Name and denomination only; `ukrainianchurch.it` does not resolve |
| 56 | San Francesco di Paola | **P** | Attributed to Wikipedia; carries the Loggia Borgia and Arco della Suburra |
| 57 | Santa Lucia in Selci | **P** | Attributed; the *Vicus Suburranus* detail is real content |
| 58 | Santa Caterina a Magnanapoli | **P** | Sourced through the turismoroma Torre delle Milizie page |
| 59 | SS Domenico e Sisto | **R** | Carry only as the church of the Angelicum complex (#121), which has a live source |
| 60 | SS Quirico e Giulitta | **P** | Houses the presepio museum, which has its own live site |
| 61–79 | Nineteen further churches, chapels, oratories and convents | **D** ×19 | Category membership and, in most cases, a dash in the facts column. There is no claim here to adjudicate. `diocesidiroma.it` has `Ricerca Enti` and `Stradario Parrocchie` and is live — mine it and re-propose; do not publish names as places |
| 80 | SS Gioacchino e Anna alle Quattro Fontane | **R** | "Deconsecrated" is sourced to a `diocesidiroma.it` entity ID the finder cited but did not fetch. Fetch it or drop the word |

### 3.4 The two candidate *sets* (§5.4, §5.5)

| Set | Verdict | Reason |
|---|---|---|
| 22 deconsecrated and vanished churches | **D** as places | Nothing stands and the only source is a Wikipedia list. **Two facts survive, as facts and not as places:** (a) San Basilio al Foro di Augusto — the Comune's Foro di Augusto page independently says «il podio del tempio venne occupato dalla chiesa di San Basilio, ora scomparsa», so it publishes *inside record #5*; (b) the piazza della Suburra inscription recording the *edicola di San Salvatore delle tre immagini*, attributed to Wikipedia, publishes as a street detail. The finder's own instinct here was right and I am upholding it against itself |
| 34 street shrines (edicole sacre) | **D** for this wave | No per-item source. The Sovrintendenza publishes an Edicole Sacre category and the URL pattern is now known to be harvestable from turismoroma `Sito web` fields (§2.8) — re-propose as **one** guide subject once sourced, not as 34 records |

### 3.5 Archaeology and antiquities (§5.6)

| # | Place | Verdict | Reason |
|---|---|---|---|
| 81 | Cisterna delle Sette Sale | **R** | Category + an OSM `ruins` tag. Needs one fetched source before it carries any claim beyond existence |
| 82 | Basilica Ulpia | **R** | Same. It is a component of the Foro di Traiano (#4) and is better folded in |
| 83 | Porticus absidata | **D** | §2.2 — a component of the Foro di Nerva, which drops to Campitelli |
| 84 | Tempio di Minerva (Foro Transitorio) | **D** | §2.2 — same. (The finder used "84" twice; the presepio museum keeps it) |
| 85 | Tempio di Iside e Serapide a via Labicana | **D** | Category only |
| 86 | Colosso di Nerone | **D** | PIP Celio, and the finder's own §5.10 says so |
| 87 | Ninfeo di Nerone | **D** | PIP Celio |
| 88 | Magazzini di Lucio Nevio Clemente | **D** | Category only |
| 89 | Colle Oppio | **P** | The hill; corroborated across several turismoroma pages |
| 90 | Viminale | **P** | The hill; both methods |
| 91 | Arco dei Pantani | **P** | Named on the Comune's Foro di Augusto page |
| 92–95 | Domus di Lucio Licinio Sura, Equus Traiani, Ninfeo degli Annibaldi, Acquedotto Neroniano | **D** ×4 | OSM tags only. An OSM tag establishes that someone drew a node; it does not establish a place |
| 96 | Aula del Colosso | **P** | Named on the Comune's Fori Imperiali page with the Genius of Augustus detail |
| 97 | Torre degli Annibaldi | **R** | Attribute to Wikipedia; carry street only |
| 98 | Torre dei Graziani | **R** | Same |
| 99 | Porta Asinaria | **P** | Full turismoroma page; Honorius, Belisarius 536, Totila, Henry IV |
| 100 | Porta Metronia | **P** | Full turismoroma page; Callixtus II, 1122, Acqua Mariana. Celio concedes it in its own article |
| 101 | Porta San Giovanni | **E** | Node outside all seven polygons, way centroid inside Monti, sits in the wall itself. Genuinely ambiguous — escalated, cluster 4 |

### 3.6 Museums, theatres, institutions (§5.7)

| # | Place | Verdict | Reason |
|---|---|---|---|
| 102 | Museo dei Fori Imperiali | **R** | Same institution as #2. One record. Carry the entrance flag: the Via Quattro Novembre address may sit on the Trevi side of a Monti monument |
| 103 | CREF / Museo Enrico Fermi | **P** | The strongest OSM-vs-Wikipedia reconciliation in the file, and the finder resolved it correctly from the institution's own site: registered office Via Panisperna 89a, visitor entrance piazza del Viminale 1. Good work |
| 104 | Museo del presepio "Angelo Stefanucci" | **P** | Own site live |
| 105 | Museo Vite di IMI | **P** | Own site live, room-by-room detail, Via Labicana 15a. An OSM-only find the category sweep would have missed — the finder's case for sweeping both is made by this record |
| 106 | Museo del Tesoro Lateranense | **E** | Inherits the Lateran contest |
| 107 | Museo Storico Liberiano / Polo Museale SMM | **E** | Inherits SMM. Note the basilica site is reachable after all (§2.5), so the Polo Museale section can be sourced properly |
| 108 | Museo storico vaticano | **E** | Inside the Palazzo del Laterano. **Note: the name is a trap and ruling 2 does not apply** — this museum is in the Palazzo del Laterano on Italian soil, not in Vatican City. Any draft must not treat it as a Vatican-territory place |
| 109 | Museo dell'ICRCPAL | **R** | Address only; no fetched institutional source |
| 110 | Museo della Banconota | **D** | The museum page 404'd. The bank's homepage does not establish a museum |
| 111 | Museo di idraulica | **D** | A line in a Wikipedia list |
| 112 | Museo di San Giovanni in Laterano | **E** | And probably a duplicate of #106 — the arbitrator should collapse them |
| 113 | Museo Spazio Field | **D** | Three domains, none working. No source, no record |
| 114 | Museo Leonardo da Vinci | **D** | List entry |
| 115 | Museo delle suore oblate del Bambino Gesù | **D** | List entry |
| 116 | Vespa Museum | **D** | An OSM node with no address and no website, which the finder itself says it could not verify exists. Correct to surface it; correct to cut it |
| 117 | Teatro Brancaccio | **P** *(facts)* / **D** *(that page's rione sentence)* | Every date, name and the «sala di oltre 1300 posti» re-verified. «Situato nel cosmopolita quartiere Esquilino» is confirmed present and confirmed wrong twice over — wrong rione, and *quartiere* for a *rione*. The page's «uno dei teatri più noti d'Italia» and «il Teatro di Roma» are superlatives and stay out; the finder did not list these in §7.2 and should have |
| 118 | Teatro dei Dioscuri al Quirinale | **R** | OSM-only. Needs one fetched source before publication |
| 119 | Teatro Drammatico Nazionale | **D** | PIP Trevi |
| 120 | Pontificia Università Lateranense | **E** + **R** | Rione contested. Site reachable only past an SSL chain failure — do not cite it until that is resolved. **The finder's refusal to claim Art. 16 exemption for it is correct and is upheld**: Art. 16's list re-read in full, and neither the Lateran University nor the Angelicum is on it |
| 121 | Angelicum | **P** | Own site live and self-describing |
| 122 | Pontificio Istituto Giovanni Paolo II | **P** | Own site live |
| 123 | Ospedale San Giovanni-Addolorata | **R** | SSL verification failed. Name and PIP only, no claims |
| 124 | Ospedale delle Donne | **D** | A coordinate |
| 125 | Liceo Cavour | **D** | Category only |
| 126 | Sapienza engineering libraries | **D** | Four OSM library tags inside a faculty building. The finder called these marginal; they are past marginal |

### 3.7 Streets, piazze, public space (§5.8), transport (§6), commerce (§5.11)

| # | Item | Verdict | Reason |
|---|---|---|---|
| 127 | The fourteen-street set | **P** | Attributed to Wikipedia throughout, as the finder did. The *Vicus Suburranus*, *Vicus sceleratus*, *Balnea Napoli* and carts-from-the-Castelli details are real content and correctly attributed |
| 128 | Via Cavour | **P** | Attributed |
| 129 | Via Nazionale | **P** | Attributed; the 1871 institution date is independently corroborated by the Villa Aldobrandini page's "after 1870" |
| 130 | Via dei Fori Imperiali | **P** | Attributed |
| 131 | Via Merulana / Via Labicana / Largo Brancaccio | **R** | Via Merulana is a **boundary** street per the Comune's own perimeter. A Monti page may describe it; it may not claim it as an interior street |
| — | The 16-piazza list | **P** minus two | Piazza del Quirinale → **E** (cluster 3). Piazza di Porta San Giovanni → **E** (cluster 4) |
| — | Fontana dei Catecumeni, Fontana di piazza del Viminale | **R** | Category only; need a source before any claim |
| — | Quattro Fontane | **D** | PIP Trevi |
| — | Parco del Colle Oppio, Parco di Traiano | **P** | Both methods; the 1930s Parco Traiano dating comes from the Comune's Terme di Traiano page |
| §6 | Metro **Cavour** | **P** | Monti on every method, Via Cavour 197, 00184 |
| §6 | Metro **Colosseo** | **E** | PIP Monti, Nominatim Celio. Cluster 5 |
| §6 | **Line C serves Colosseo** | **D** | Single-source to Wikipedia and explicitly unverified. `metroc.it` does not resolve. No page says it until someone fetches a transit-authority source |
| 132 | Mercato Monti Urban Market | **P** *(name + address)* / **D** *(«Since 2009»)* | §2.9 |
| 133 | Ai Tre Scalini | **R** | §2.10 — the ban list must also carry «almeno al 1895» and «a due passi dal Colosseo» |
| — | Teatro Eliseo | **D** | No reachable official source of any kind, and its `.com` is a hijacked gambling domain. Re-verified. Do not publish, do not link |

---

## 4. ESCALATED TO THE ARBITRATOR

Five clusters, thirteen records. I am not resolving any of them and neither should the author.

**Cluster 1 — the Lateran.** Records 18, 19, 20, 106, 108, 112, 120. Three methods, three answers,
and the building at stake is the cathedral of Rome. **What I add to the finder's framing:** its
inference #1 does not carry the weight it was given (§2.3), but the same page's *editorial prose*
names San Giovanni in Laterano as a monument present in Rione Monti, which is better evidence than
the perimeter reading it replaces. The arbitrator should weigh the prose, not the «Confini:» list.
Record 21 (Scala Santa) leaves this cluster — it drops to Esquilino on both OSM methods, which means
the Lateran complex is split, which means the Comune's «complesso del Laterano» cannot be read as a
single indivisible unit by anybody.

**Cluster 2 — Santa Maria Maggiore.** Records 17, 107. The finder reported three fetched methods
saying Monti against one postcode. **That count no longer holds.** turismoroma states that the
Esquiline hill no longer forms part of Monti, and states that the basilica stands on the summit of the
Esquiline hill (§2.4). The Comune is now on both sides of its own question. The roster and the brief
say straddler; the OSM polygon says Monti; the postcodes and the Comune's hill sentences say
otherwise. **Whichever way it goes it is an Art. 13 + Annex II Tav. 2 extraterritorial property** and
takes the §2.1 status wording.

**Cluster 3 — the Quirinale line.** Piazza del Quirinale, Palazzo del Quirinale (footprint crosses
the line), record 26 Palazzo della Consulta, record 52 Sant'Andrea al Quirinale. Both rioni's own
descriptions make the piazza the boundary, so it is a genuine straddle and not an error.

**Cluster 4 — Porta San Giovanni** (record 101) and piazza di Porta San Giovanni. The gate sits in
the Aurelian wall itself; node and way centroid disagree.

**Cluster 5 — Colosseo metro station.** PIP Monti, Nominatim Celio. Piazza del Colosseo itself is
Celio on both.

**Removed from escalation, decided here:** Foro di Nerva (§2.2 — drops to Campitelli, no conflict
exists), San Clemente and Santo Stefano Rotondo (both methods Monti, neither neighbour lists them in
its own monuments — publish in Monti), Porta Metronia (Celio concedes it in writing), Scala Santa
(drops to Esquilino).

---

## 5. RULING COMPLIANCE — my own audit, not the finder's

**Ruling 1, designation claims: PASS.** I read the finder file for every banned term in both
languages. The only occurrences are inside §7.1 and §4, both of which are explicit quarantine notes
saying the claim was found and *not* carried. The `vincolo` sentence on Villa Sforza was stripped
from record 38 and record 38 is clean. Lateran Treaty Art. 16's «non saranno mai assoggettati a
vincoli» was noticed and deliberately unused — that is exactly right, and I re-read Art. 16 in full
to confirm the finder characterised it correctly. **One instruction to the author: the quarantine
sections are the highest-risk text in the file, because they contain the banned sentences in
quotable form. Nothing from §7.1 may be transcribed into a draft.**

**Ruling 2, Vatican City: PASS.** Nothing in Monti is inside the Vatican state and the finder was
right that the exclusion does not bite here. Two traps I am flagging anyway: record 108 is called the
*Museo storico vaticano* but stands in the Palazzo del Laterano on Italian soil (§3.6); and no draft
may describe any of the four extraterritorial properties as being "in the Vatican" or "Vatican
territory" — Art. 15 says the opposite in its own words and that sentence is the one to carry.

**Ruling 3, photographs: PASS.** Every candidate carries `"photos": []`. No image is sourced, named
or linked. §7.4's two notes are correctly quarantined as photo-wave material. I add one for that
wave: the turismoroma pages carry `Ph. Turismo Roma` credit lines on their images, which is the
attribution regime that wave will have to reckon with.

**Corpus rules.** Trip durations: none in the file. Vague proximity: the finder caught two and missed
one (§2.10). Aggregator attribution: consistently correct — Wikipedia is attributed by name
throughout, which is the standard. Self-sourced awards/superlatives/trading durations: the finder's
§7.2 is genuinely good work and correctly refuses to exempt Roma Capitale for being official; it
missed the Teatro Brancaccio superlatives (§3.6) and the Ai Tre Scalini trading duration (§2.10).

---

## 6. TIER RULING

**GUIDE.**

Forty-five records publish as written and thirty-nine more publish after the rewrites specified
above. Even counting only the records that survive with a fetched per-place institutional source and
no outstanding rione question — San Pietro in Vincoli, Mercati di Traiano, Colonna Traiana, Foro di
Augusto, Domus Aurea, Terme di Traiano, Terme di Tito, the four towers, Santa Maria ai Monti, San
Clemente, Santa Prassede, San Carlo alle Quattro Fontane, Sant'Andrea al Quirinale, Palazzo delle
Esposizioni, Palazzo del Viminale, Villa Aldobrandini, Porta Asinaria, Porta Metronia, the CREF
museum, the presepio museum, the Museo Vite di IMI, the Angelicum, the two obelisks, the streets —
Monti clears the four-place floor by more than an order of magnitude. The tier question was never in
doubt and the volume of DROPs above does not threaten it.

---

## 7. WHAT WORRIES ME ABOUT THIS FINDER

Three things, in order.

**1. It made a confident negative claim about a document it had in hand, and the document refutes it.**
§4's E4 caution is written with real care — it flags an inference, names the gap, and tells the
verifier what to go and get. All of that rigour was spent on a gap that does not exist. The Annex II
schedule is in the same file, in the first two thousand characters, above the article text. A file
that is this scrupulous about labelling inference is exactly the file whose *unlabelled* assertions
get trusted, so an error of this shape costs more here than it would in a sloppier document.

**2. It applied opposite standards to the Lateran and to Santa Maria Maggiore.** For SMM it reasoned
correctly that a perimeter running *along* a block does not put the block inside. For the Lateran,
three sections earlier, it read the same construction as an explicit interior claim and called it
something "a guide would not guess". Both readings cannot be right. The asymmetry is invisible unless
you read §3.1 and §3.3 against each other, and it pushes the two biggest unresolved questions in the
file in opposite directions.

**3. It reported a source as claiming something it does not claim** (§2.2, Foro di Nerva), and it
declared two sources unusable that are usable (§2.5 Santa Maria Maggiore's own site, §2.7 the
Sovrintendenza body text). Those three are the same underlying failure in both directions: a
conclusion about a source drawn from one attempt rather than two. The environment-failure section
§7.5 is honest about rate-limiting and about the finder's own code, which is why I trusted it, and
that trust turned out to be misplaced in the specific places where a second attempt would have
changed the answer.

**Credit where it is due, because I have been hard on this file.** The seven-item reject list is the
best work in it — I re-tested three and all three were exactly as described, including a hijacked
theatre domain serving an Indonesian gambling site under an HTTP 200 that any careless pipeline would
have cited. The §7.2 refusal to exempt official sources from the superlative rule is correct and is
the kind of judgement the corpus rules depend on. The CREF two-doors reconciliation (record 103) is
genuinely good research. And the §5.10 over-collection list is what the finder said it was: the most
useful thing in the file for whoever holds all four rioni. The boundary work is stronger than the
per-source reading, and the per-source reading is where the arbitrator should apply pressure.
