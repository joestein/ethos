# Trastevere (R. XIII, code 113) — VERIFIER verdicts

Adjudication of `docs/rome/trastevere-finder.md`. Ruled **2026-09-02**.
I did not gather this evidence and I owe it no loyalty. Every verdict below is mine.

**Tally: 63 PUBLISH · 24 REWRITE · 28 DROP.** Tier: **GUIDE**.

---

## 0. Re-fetch audit — the sources the finder leaned on hardest

I re-fetched fourteen sources with raw `python3 urllib` (not WebFetch). **All fourteen returned
HTTP 200 and all fourteen were re-read from raw bytes**, not from the finder's cache.

| # | Source | Result | Says what the finder says it says? |
|---|---|---|---|
| 1 | `sovraintendenzaroma.it/.../fontane/mostra_dell_acqua_paola_al_gianicolo` | 200, 56,886 B | **YES**, in full |
| 2 | `.../fontane/fontana_in_piazza_santa_maria_in_trastevere` | 200, 52,406 B | **MOSTLY — one attribution error, one omission** |
| 3 | `.../ville_dei_nobili/villa_sciarra` | 200, 56,349 B | **MOSTLY — the 1930 donation is misdescribed** |
| 4 | `.../beni_architettonici/ponte_sisto` | 200, 50,995 B | **YES**, in full |
| 5 | `vatican.va/.../rc_seg-st_19290211_patti-lateranensi_it.html` | 200, 78,834 B | **YES — quoted verbatim and correctly** |
| 6 | `whc.unesco.org/en/list/91/` | 200, 172,605 B | **INCOMPLETE — see V-R16** |
| 7 | `villafarnesina.it` + `/la-villa/storia/` | 200 | **NO on the build dates and the "prototype" claim** |
| 8 | `.../musei_in_comune/museo_di_roma_in_trastevere` | 200, 44,259 B | **NO — carries none of the history attributed to it** |
| 9 | `.../musei_in_comune/museo_della_repubblica_romana...` | 200, 44,733 B | **NO — does not place the museum in Porta San Pancrazio** |
| 10 | `.../fontane/fontana_dell_acqua_paola_in_piazza_trilussa` | 200, 53,619 B | **YES**, in full |
| 11 | `.../fontane/fontana_di_pio_ix_in_piazza_mastai` | 200, 50,326 B | **YES**, and offers more than the finder took |
| 12 | `.../fontane/fontana_del_prigione_in_trastevere` | 200, 51,619 B | **YES**, in full |
| 13 | `.../passeggiate_parchi_e_giardini/passeggiata_del_gianicolo` | 200, 64,898 B | **YES**, and offers much more |
| 14 | `.../monumenti/mausoleo_ossario_garibaldino` + `.../monumento_a_giuseppe_gioachino_belli` | 200 | **YES**, both in full |

Plus it.wikipedia raw wikitext via `action=query&prop=revisions` for Trastevere, Ponte Sisto,
Fontana di piazza Santa Maria in Trastevere and Stazione di Roma Trastevere (all 200), and the
finder's own working files re-opened and re-run.

### Sources that do NOT say what the finder said they say — reported by name

1. **`sovraintendenzaroma.it/.../museo_di_roma_in_trastevere`.** The finder tags this page `[SOV]`
   for: the former **Discalced Carmelite** monastery, the 17th-century nucleus at San Lorenzo in
   Ianiculo, the rededication to Sant'Egidio, and the address **Piazza Sant'Egidio 1/b**. The page
   carries **none of it**. Its entire body is: `Tipologia: moderno`, the museum's URL, one sentence
   of subject matter, `tel. 060608 dalle 9.00 alle 19.00`, and MIC-card free entry. Those four
   history claims and the address must be re-attributed or dropped. → **V-R10**
2. **`sovraintendenzaroma.it/.../museo_della_repubblica_romana_e_della_memoria_garibaldina`.** The
   finder tags it `[SOV]` for "housed in **Porta San Pancrazio**". The page does not mention Porta
   San Pancrazio. → **V-R11**
3. **`villafarnesina.it`.** The finder gives `[OWN]` for "**Built 1506–1512**" and "**prototype of
   the Roman suburban villa**". The official history page says Chigi commissioned Peruzzi in **May
   1505**, the first stone was laid **22 April 1506**, and Chigi **moved in in 1511**. There is no
   1512 and no "prototype" anywhere on the site. → **V-R6, V-D3**
4. **`whc.unesco.org/en/list/91/`.** The finder cites "the 1980 inscription" and did not extract the
   record. The record reads: `Date of Inscription: 1980 · Significant modifications to the
   boundaries: 1990 · Minor boundary modification inscribed year: 2015, 2023 · Criteria
   (i)(ii)(iii)(iv)(vi) · Property 1,469.7 ha · Buffer zone 7,158.933 ha`. A page citing 1980 alone
   is citing an incomplete record. **UNESCO never names Trastevere.** → **V-R16**

Everything else the finder leaned on held. The Lateran Treaty chain in §4 is **quoted verbatim and
correctly** — I read Arts. 13, 14, 15 and 16 from the vatican.va bytes and every word the finder
put in quotation marks is there, including `benché facenti parte del territorio dello Stato
italiano`, the `(Alleg. II, 9)` in Art. 13, the `Tav. 8` in the annexe index, and the index's skip
from Tav. 10 to Tav. 12. The finder's textual-discrepancy warning is correct and I uphold it.

### The finder's geometry — independently re-run, and it holds

I re-opened `units.json`, `rione_polys.json` and `trastevere_osm.json` and re-ran the straddler
extraction myself. **Every straddler assignment in §3 reproduces exactly**: Ponte Sisto cent
Trastevere / geom Regola+Trastevere; Ponte Garibaldi cent **Regola**; Ponte Cestio and Ponte
Palatino cent **Ripa**; Ponte Sublicio cent **Testaccio**, geom Ripa+Testaccio+Trastevere; Isola
Tiberina geom Regola+Ripa+Trastevere; the PASA tunnel Aurelio+Borgo+Trastevere; the Urbaniana cent
**Borgo**; `way/204145793` Mura Aureliane wholly inside Trastevere. The Mura Aureliane relation
touches exactly 10 units, "Mura di Roma" exactly 13, the extraterritorial overlay exactly 8. The
finder's central methodological claim — that centroid and geometry disagree on the bridges and a
reverse geocoder would lose four of six — is **true and I endorse it**.

I also confirmed **Ruling 2 compliance mechanically**: scanning all 232 candidates for
`vatican|vaticano|san pietro|st peter|sistina|sistine`, the only hits are **Chiesa di San Pietro in
Montorio** and **Convento di San Pietro in Montorio**, both wholly inside Trastevere. **No Vatican
City place is claimed anywhere in this file.** Ruling 2: clean.

**Ruling 3 compliance**: no image is sourced, named or linked anywhere in the finder file. §9 is
risk intelligence only and names no photograph. Ruling 3: clean.

**Ruling 1 compliance**: I searched the finder file for every banned term in both languages. The
only occurrence of `vincolo`/`vincoli` is inside a quotation of Lateran Treaty Art. 16 in §4, which
the finder explicitly quarantines and recommends keeping out of prose. I agree and make it binding —
see V-P26. No designation claim appears. Ruling 1: clean.

---

## 1. PUBLISH — 63

### The rione itself (§6)
- **V-P1** R. XIII, thirteenth and **most extensive** rione. *Attribute to it.wikipedia.* Re-read
  from wikitext: `è il tredicesimo e più esteso rione di Roma, indicato con R. XIII`.
- **V-P2** Name from Latin *trans Tiberim*, "beyond the Tiber". Confirmed in wikitext.
- **V-P3** Boundaries: Janiculum walls south and west, the PASA tunnel north, the Tiber east.
  Confirmed verbatim: `delimitato a sud e ovest dalle Mura gianicolensi, a nord dalla galleria
  Principe di Savoia-Aosta (PASA) e a est dal fiume Tevere`.
- **V-P4** Adjacencies: Borgo north; Ponte, Regola, Ripa, Testaccio east across the river; Aurelio,
  Gianicolense, Portuense west and south. Confirmed, and independently corroborated by the finder's
  polygon set, which I re-ran.
- **V-P5** Sixtus V fixed the fourteen historic rioni in **1586**, Trastevere XIII; **Benedict XIV's
  1744 revision gave Trastevere its present boundaries**. Confirmed in wikitext.
- **V-P6** Water reached the rione in **1612** via the Acqua Paola aqueduct under Paul V, reusing
  the ancient Trajanic aqueduct. Confirmed in wikitext.
- **V-P7** The **Mura gianicolensi were raised in 1643 by Urban VIII**, on a different line from the
  Aurelian Walls which were demolished there, taking in via della Lungara and moving Porta Portese.
  Confirmed. The finder's added clause "**to supplement the Leonine walls**" is **also sourced** —
  it is in the Mura gianicolensi article (`ad integrazione delle mura leonine`), not the Trastevere
  article. Cite it to the right page.
- **V-P8** Coat of arms: a gold lion's head on red. Confirmed: `Testa di leone d'oro in campo rosso`,
  citing Carlo Pietrangeli p. 190. Attribute to it.wikipedia citing Pietrangeli.
- **V-P9** **NO POPULATION FIGURE.** Upheld and made binding. OSM says 18,834, it.wikipedia's rioni
  table says 12,962, and the figure is **absent from the Trastevere article itself**. Two sources,
  two numbers, no third. Publish neither.
- **V-P10** **Stazione di Roma Trastevere is NOT a Trastevere place.** Confirmed verbatim in the
  Trastevere article: `benché, nonostante il nome, sorga al di fuori di esso`. The station's own
  article independently places it `in piazza Flavio Biondo alle spalle del rione Trastevere ... nei
  pressi del quartiere Portuense`. The finder's edge case is real and correctly called.
- **V-P11** **Casa della Fornarina** not publishable — no object, no source. Upheld.
- **V-P12** **Excubitorium of the VII Cohort of the Vigiles** not publishable — no article, no OSM
  object. Upheld as a research gap, not a place.
- **V-P13** **Monteverde / Gianicolense is not Trastevere.** Upheld.

### Lateran Treaty tier (§4)
- **V-P14** **Palazzo di San Callisto** publishes under Trastevere as a Lateran Treaty **Art. 15
  extraterritorial property on Italian soil**. The chain is verified verbatim: Art. 13 ¶3 names
  `il dipendente edificio di S. Callisto presso S. Maria in Trastevere (Alleg. II, 9)`; Art. 15
  extends to `Gli immobili indicati nell'art. 13 ... benché facenti parte del territorio dello Stato
  italiano ... le immunità riconosciute dal diritto internazionale alle sedi degli agenti
  diplomatici di Stati esteri`. Geometry puts `way/51368361` wholly inside Trastevere.
  **It is NOT Vatican City and no page may call it that.**
- **V-P15** **Do not cite an annexe table number for San Callisto.** Verified: the index says
  `Tav. 8`, Art. 13 says `Alleg. II, 9`, Art. 15's parenthetical `(Alleg. II, 6, 7, 8, 10 e 11)`
  lists six palaces against five numbers, and the index skips Tav. 11 entirely. The source is
  internally inconsistent. The legal substance is unaffected — Art. 13 names the building in words.
- **V-P16** **Art. 14 ¶2 Janiculum-north properties** carry extraterritorial status via Art. 15
  (`gli alinea primo e secondo dell'art. 14`) — verified verbatim. Which unit they stand in is
  **unresolved**. Escalated (§3, E-13).
- **V-P17** **Palazzo delle Sacre Congregazioni Romane — do NOT assume extraterritorial status.**
  Upheld and hardened. I read the whole annexe index and Arts. 13–15: the building appears under no
  name in any list. Note also that Art. 15 extends immunities to `gli altri edifici nei quali la
  Santa Sede in avvenire crederà di sistemare altri suoi Dicasteri` — a forward-looking clause that
  makes the question genuinely undecidable from the Treaty text. `way/203854795` is wholly inside
  Trastevere, so it publishes **as a building, with no status claim of any kind**.

### Fountains (§5.3) — the strongest evidence in this file
- **V-P18** **Mostra dell'Acqua Paola al Gianicolo ("Fontanone")** — the whole record as written.
  Every element re-verified: Paul V Borghese after his 1608 restoration of the Traiano aqueduct;
  built 1610–1614 as the terminal display; Giovanni Fontana (1540–1614) assisted by Flaminio Ponzio
  (1560–1613); triumphal-arch model, five arches, columns, wide attic; spolia from the Foro Romano
  and the Tempio di Minerva al Foro di Nerva; red and grey granite columns from the Constantinian
  St Peter's; front remodelled by Carlo Fontana (1638–1714), `Datazione: 1610-1614; 1690-1693`;
  damaged by French cannon in 1849; restored 1859, 1934, the 1950s and 2002–2004 by the
  Amministrazione Capitolina; from 1901 to the 1930s the water fed Rome's first hydroelectric
  station; the attic inscription's error (it cites the *Alsietina*, not the *Aqua Traiana*).
  The page also states `Rione: Trastevere`, which the finder did not record. It does.
- **V-P19** **Fontana dell'Acqua Paola in Piazza Trilussa** — the whole record as written, including
  the finder's warning **not to conflate it with the Fontanone**, which I endorse and make binding.
  Verified: 1613, Jan van Santen (1550–1621) "Giovanni Vasanzio" with Giovanni Fontana (1540–1614),
  for Paul V; originally on the **left** bank at the end of via Giulia by the Ospizio dei Mendicanti;
  dismantled 1879 for the embankments; rebuilt on the right bank 1898 in axis with Ponte Sisto; two
  inscriptions added after the move record the transfer; `Rione: Trastevere`.
- **V-P20** **Fontana di Pio IX in piazza Mastai** — the whole record as written. Verified: 1865,
  Andrea Busiri Vici (1817–1911), ornament of the semicircular piazza before the Manifattura dei
  Tabacchi, pivot of the "Quartiere Mastai" designed for Pius IX Mastai-Ferretti; octagonal steps
  and basin; papal arms alternating with cartouches; four dolphins under the lower basin, four putti
  under the upper; restored 1996; `Rione: Trastevere`.
- **V-P21** **Fontana del Prigione** — the whole record as written. Verified: 1587–1590, Domenico
  Fontana, for Sixtus V, as the perspective backdrop of an avenue in the garden of Villa Montalto
  Peretti on the Esquiline; villa destroyed late 19th c.; parts bought by the Comune and dismantled
  1888; recomposed 1894–95 as the backdrop of via Genova; dismantled again and recomposed **1923**
  on via Goffredo Mameli on the Janiculum slopes to a Genio Civile design; the Prigione sculpture,
  the Apollo and Venus statues and the head of the Aesculapius lost or missing; restored 2005–2006.
- **V-P22** The **Villa Sciarra fountains that Roma Capitale itself names** — the *fontana dei
  Satiri* and the *fontana di Diana ed Endimione* — publish, attributed. So do the *fontana dei
  Putti* and the north- and south-sector fountains, which the same page names in its 2025 restoration
  note. The rest are dropped (V-D11).

### Monuments and the Janiculum (§5.4)
- **V-P23** **Mausoleo Ossario Garibaldino** — the whole record as written. Verified: Colle del Pino,
  where the last defence was fought 30 April to early July 1849; Giovanni Jacobucci (1895–1970);
  inaugurated 3 November 1941 after two years' work; holds the remains of the fallen in the battles
  for Rome 1849–1870; promoted in the 1930s by Ezio Garibaldi; built by the Uffici Tecnici del
  Governatorato; travertine quadriportico, three round arches per side; central ara from a single
  block of red Baveno granite. `Rione: Trastevere` stated. See V-R23 for what the finder left behind.
- **V-P24** **Monumento a Giuseppe Gioachino Belli** — the whole record as written, and it is the
  cleanest entry in the file. Every detail verified against the Sovrintendenza bytes: Michele
  Tripisciano (1860–1913), 1913, fiftieth anniversary of the poet's death; travertine and marble;
  proposed to Mayor Nathan in 1910 by Domenico Gnoli and others; sited in the Trastevere piazza
  facing Ponte Garibaldi, **then called piazza d'Italia**; public subscription reaching 30,000 lire;
  the right hand on a reconstruction of the parapet of Ponte Fabricio; base reliefs of the Tiber
  personified and Pasquino among the populace; twin fountains with masks of "Poetry" and "Satire".
- **V-P25** **Passeggiata del Gianicolo** — the record as written. Verified: `Municipio I, Rione XIII
  - Trastevere`; `Epoca: II metà XIX secolo`; `Estensione: 3,5 ettari`; entrances via Garibaldi and
  salita di Sant'Onofrio; two great plane-lined avenues flanking Villa Aurelia meeting at piazzale
  Garibaldi; the single hairpin road down to Sant'Onofrio completed 1939; the 1849 fighting; the
  1883 purchase by the new Italian State and Comune, dedicated to the memory of the Defence of Rome;
  the Garibaldini busts; the Tasso bust placed 1857 under the papal government by the old oak.
- **V-P26** **The word `vincoli` stays out of published prose**, notwithstanding that Art. 16 uses it
  about the Treaty's own properties and uses it in the negative (`non saranno mai assoggettati a
  vincoli`). The finder recommended this; I make it binding. A reader cannot be asked to parse the
  inversion, and the word is banned.

### Gates, walls, bridges (§5.4)
- **V-P27** **Porta Settimiana** — gate in the Aurelian Walls at the northern vertex of the
  Janiculum triangle; `Termine costruzione: III secolo`; at the start of via della Lungara. ITW.
- **V-P28** **Porta San Pancrazio** — southern gate of the Aurelian Walls near the Janiculum summit;
  `inizio 270`, `termine 1854 (ricostruzione)`, neoclassical. ITW.
- **V-P29** **Porta Portese** — 1641–1644, Marcantonio de Rossi, Baroque, for Urban VIII, replacing
  the Porta Portuensis in step with the Mura gianicolensi. ITW.
- **V-P30** **Ponte Sisto** — the whole Sovrintendenza record as written, re-verified word for word:
  `primo ponte edificato in epoca moderna`; Sixtus IV della Rovere (1471–1484); the Jubilee of 1475;
  at the time only the Tiber Island bridges and Ponte Sant'Angelo were working; four travertine-faced
  arches, central circular opening, five marble papal arms; **the designer is unresolved** and the
  Vasarian attribution to Baccio Pontelli (c.1450–1492) has fallen because Pontelli reached Rome
  only after construction; 1877 two suspended metal walkways to Angelo Vescovali's (1826–1895)
  design; 1977–1998 debate, then Gaetano Miarelli Mariani's restoration removed the 19th-c.
  metalwork and rebuilt the parapets; Sixtus IV's two plaques removed for museum conservation.
- **V-P31** **Ponte Sisto's it.wikipedia figures publish as a separate attributed line**: built
  1473–1479, `nei rioni Regola e Trastevere`, length 108 m, width 11 m, and the infobox's
  `progettista = Baccio Pontelli (?)` — the question mark is in the source and is consistent with
  Roma Capitale. Do **not** merge the two date framings (V-P32).
- **V-P32** **The Ponte Sisto date conflict is not a conflict — it is two framings.** Roma Capitale
  frames the bridge by the Jubilee of 1475 under Sixtus IV; it.wikipedia gives 1473–1479. Publish
  both, each attributed. Never a single unattributed date.
- **V-P33** **Ponte Garibaldi** — eng. Angelo Vescovali, built 1884–1888, dedicated to Garibaldi,
  linking lungotevere de' Cenci to piazza G. G. Belli. ITW. Subject to E-3.
- **V-P34** **Ponte Sublicio** — 1914–1917 to a design by Marcello Piacentini, inaugurated 21 April
  1919, three arches, linking piazza dell'Emporio to piazza di Porta Portese. ITW. Subject to E-6.
- **V-P35** **Ponte Cestio** — 19th-c. rebuild of the Roman bridge; also pons Aurelius / Gratiani /
  di San Bartolomeo / Ferrato; links the Trastevere bank to the Isola Tiberina, not to the left bank.
  ITW. Subject to E-4. The superlative in the same sentence is dropped (V-D22).
- **V-P36** **The clean Mura Aureliane segment** `way/204145793`, which I re-confirmed lies **wholly
  inside Trastevere**, publishes as a Trastevere place. The whole-circuit relations do not (V-D27).
- **V-P37** **Ponte Sublicio: do not inherit OSM's Wikidata ids.** Verified as a real conflation —
  Q1466700 is the ancient *pons Sublicius*, not the 1914–17 bridge. The finder is right.
- **V-P38** **Villa Aurelia vs Casino Farnese: do not inherit OSM's id.** Q15852893 is the Casino
  Farnese, a building inside the villa. Upheld. `way/206309500` Villa Aurelia is **wholly inside
  Trastevere** by geometry — it is not a straddler even though the American Academy is (E-8).

### Churches (§5.1) — publish as attributed it.wikipedia records
- **V-P39** **Basilica di Santa Maria in Trastevere** — tradition founds it under Callistus I
  (217–222), completed under Julius I (337–352), renewed 12th c. under Innocent II; minor basilica;
  cardinalatial title. The evaluative half of the finder's line is dropped (V-D19).
- **V-P40** **Basilica di Santa Cecilia in Trastevere** — minor basilica; late-Palaeochristian
  structure, apse and narthex; Baroque interior, façade and forebuilding; **Ferdinando Fuga** for
  the forebuilding and courtyard.
- **V-P41** **Basilica di San Crisogono** — 4th-c. origin, `Titulus Chrysogoni` in the 499 list;
  rebuilt 12th c.; again 1626 to a design by Giovanni Battista Soria for Cardinal Scipione
  Caffarelli-Borghese; Romanesque campanile.
- **V-P42** **Chiesa di San Francesco a Ripa** — Order of Friars Minor; Onorio Longhi and Mattia de
  Rossi; consecrated 2 October 1701; named for its position by the suppressed Porto di Ripa Grande.
  *(`sanfrancescoaripa.com` failed on a self-signed certificate, so nothing from the parish's own
  site may be used.)*
- **V-P43** **Chiesa di San Pietro in Montorio** — Renaissance rectory church on the Janiculum,
  Friars Minor; badly damaged in the 1849 siege of Rome.
- **V-P44** **Tempietto di San Pietro in Montorio** — small circular building in a cloister of the
  convent; **Bramante**; the infobox also names Baccio Pontelli and Amedeo di Francesco da
  Settignano; High Renaissance. *(Note: this is the one place in the file where a Bramante
  attribution survives. It survives because nothing contradicts it — unlike V-D2.)*
- **V-P45** **Chiesa di Santa Maria della Scala** — 1593–1610; Baroque; Discalced Carmelites.
- **V-P46** **Chiesa di Santa Maria dell'Orto** — Vignola; national church of the Japanese in Rome
  by will of Sixtus V, honouring the Tenshō Embassy.
- **V-P47** **Chiesa di San Giovanni Battista dei Genovesi** — 1481–1492, by the Genoese Meliaduce
  Cicala, treasurer of the Apostolic Chamber, with a hospital for Genoese sailors; national church
  of the Genoese; Via Anicia 12.
- **V-P48** **Chiesa di Santa Maria in Cappella** — consecrated 25 March 1090.
- **V-P49** **Chiesa di San Benedetto in Piscinula** — the piazza's name is attested from the 12th c.
  from the remains of a public baths. The evaluative opener is dropped (V-D21).
- **V-P50** **Chiesa di Santa Maria dei Sette Dolori** — beside the *sui juris* monastery of the
  Augustinian oblates, an order founded c. 1640 by Camilla Virginia Savelli Farnese, Duchess of Latera.
- **V-P51** **Chiesa di Santa Maria della Luce** — originally San Salvatore della Corte; said founded
  by St Bonosa in the 4th c. by the excubitorium of the VII cohort of the vigiles. *Publish the
  tradition as a tradition* — and note V-P12: the excubitorium itself is not a publishable place.
- **V-P52** **Chiesa di San Callisto** — on the house where tradition holds Callistus I prayed and
  was martyred by drowning; the well is in the ex-convent courtyard. Geometry: wholly inside.
- **V-P53** **Chiesa di Santa Dorotea** — on the site of a medieval church attested in a bull of
  Callistus II, 1123.
- **V-P54** **Chiesa di Sant'Egidio** — rectory church; cardinalatial title created 2019 by Pope Francis.
  The finder's "near the older San Lorenzo in Janiculo" must go — see V-D26 on proximity.
- **V-P55** **Chiesa di Sant'Onofrio al Gianicolo** — church-convent complex, Franciscan Friars of
  the Atonement; mother church of the Equestrian Order of the Holy Sepulchre.

### Palaces and civic buildings (§5.5)
- **V-P56** **Complesso monumentale di San Michele a Ripa Grande** — Via di San Michele 18; built
  1686–1834; Carlo Fontana, Mattia De Rossi, Giacomo Recalcati, Nicola Michetti, Ferdinando Fuga,
  Nicolò Forti, Luigi Poletti; born as orphanage, hospice and prison; now seat of offices of the
  Ministero della Cultura. The ICCD/Soprintendenza Speciale tenancies are OSM-only — attribute.
- **V-P57** **Carcere di Regina Coeli** — Via della Lungara 29; 17th-c. building (1654), converted to
  its present use in 1881; a working prison. ITW.
- **V-P58** **Ex Casa della GIL / WeGil** — Largo Ascianghi 5 / Via Girolamo Induno 1; commissioned
  1933 by the Opera Nazionale Balilla from **Luigi Moretti**; **construction 1933–1937**; Rationalist,
  three juxtaposed buildings including a library tower; now the WeGil cultural venue. The finder is
  right that the range, not the bare 1933, is the citable form.
- **V-P59** **Palazzo degli Esami** (1912), **Ex Manifattura Pontificia dei Tabacchi** (1860–63,
  pivot of the "Quartiere Mastai", corroborated independently by the Sovrintendenza's Piazza Mastai
  page naming Busiri Vici as the quarter's designer), **Palazzo del Ministero della pubblica
  istruzione** (1912–25), **Villa Lante al Gianicolo** (1518–31), **Villa Spada al Gianicolo** (1639,
  Embassy of Ireland), **Palazzo Salviati** (Centro Alti Studi per la Difesa, OSM — attribute).
- **V-P60** **Palazzo Corsini alla Lungara** — end of the 15th c. by the Riario, nephews of Sixtus IV,
  in the lowest part of Villa Corsini; Queen Christina of Sweden lived here in the 17th c.;
  Via della Lungara 10. ITW. *(`barberinicorsini.org` 404'd — nothing from the gallery's own site.)*
- **V-P61** **Galleria nazionale d'arte antica di palazzo Corsini** — state gallery, Via della
  Lungara 10. Identity and address only. See V-D17.
- **V-P62** **Squares (§5.6)** publish as a list, with the it.wikipedia typology attributed: Piazza
  Mastai, Piazza San Cosimato and Piazza Sidney Sonnino as the 19th-c.-opened type; Piazza di Santa
  Maria in Trastevere, Piazza Trilussa, Piazza di Sant'Egidio and Piazza della Scala as the older
  intimate type. The superlative on the first is dropped (V-D18).
- **V-P63** **The Sovrintendenza URL pattern discovery (§2.2) is sound and I endorse it programme-wide.**
  I re-fetched twelve per-monument pages under
  `https://www.sovraintendenzaroma.it/i_luoghi/<section>/<subsection>/<slug>` and all twelve returned
  200. The `Rione:` field is real — I saw it on the Fontanone, Trilussa, Piazza S. Maria, Mastai and
  Mausoleo pages, and `Dove si trova: Municipio I, Rione XIII - Trastevere` on Villa Sciarra and the
  Passeggiata. This is Roma Capitale stating the rione itself, and it is better evidence for unit
  assignment than OSM. **It states no protection status, so it breaches nothing.**

---

## 2. REWRITE — 24. Exact replacement wording; the author uses it verbatim.

- **V-R1** *Fontana in piazza Santa Maria in Trastevere, the Alexander VI line.* The finder wrote
  "Restored under Alexander VI Borgia (2nd basin removed, wolf's-head spouts added)". Roma Capitale
  attributes the restoration to a cardinal, not to the pope.
  → **"Roma Capitale records that the first restoration was willed by Giovanni di Valenza, cardinal
  of the title of Santa Maria in Trastevere, during the pontificate of Alexander VI Borgia
  (1492–1503); the second basin was abolished and wolf's-head spouts were added around the one that
  remained."**
- **V-R2** *Same fountain, the 1604 work.* The source hedges and the finder did not.
  → **"Roma Capitale records a further intervention in 1604 by Girolamo Rainaldi (1570–1655),
  probably following the arrival of the Acqua Felice in Trastevere."**
- **V-R3** *Same fountain, the restoration history is out of date.* The page now carries a line the
  finder did not report. Append:
  → **"Roma Capitale records the most recent restoration as carried out in 2025 under the PNRR –
  Caput Mundi programme."**
- **V-R4** *Villa Sciarra, the 1930 transfer.* "Consigned by his heirs in 1930 to Benito Mussolini"
  follows the page's summary line but the page's own body contradicts the plural and omits the
  condition.
  → **"Roma Capitale records that in 1930, after her husband's death, Henrietta Wurts gave the villa
  to Benito Mussolini on condition that it be used as a public park."**
- **V-R5** *Villa Sciarra, the 1647 donation.* The finder dropped both the donor and the terms.
  → **"Roma Capitale records that in 1647 the property was given by Domenico Vaini, 'vita natural
  durante', to Cardinal Antonio Barberini, who already owned the Casino Malvasia."**
- **V-R6** *Villa Farnesina, the build dates.* "Built 1506–1512" is not on the official site.
  → **"The Accademia Nazionale dei Lincei's own account records that Agostino Chigi commissioned
  Baldassarre Peruzzi to design the villa in May 1505, that the first stone was laid on 22 April
  1506, and that Chigi moved in in 1511."**
- **V-R7** *Villa Farnesina, the frescoes.* "Raphael and his school" undercounts the official list.
  → **"The Accademia's own account names the fresco painters as Raphael, Sebastiano del Piombo,
  Giovanni Antonio Bazzi known as Sodoma, and Peruzzi himself."**
- **V-R8** *Villa Farnesina, the rooms.* One room is missing from the finder's list.
  → **"The rooms named on the villa's own visitor route are the Loggia di Amore e Psiche, Sala del
  Fregio, Loggia di Galatea, Atrio e Sala Farnesiana, Sala delle Prospettive, Sala delle Nozze,
  Saletta Pompeiana and Galleria delle Grottesche."**
- **V-R9** *Villa Farnesina, the name and the opening.* Two facts the finder walked past, both on
  the official page and both better than what it did take.
  → **"The villa carries the Farnese name because it passed to that family in 1579; the Accademia's
  own account observes that it should properly be named for Agostino Chigi, the Sienese banker who
  built it. It has been open to the public as a museum since 2009."**
  ⚠️ **Author warning.** That same official page contains the phrase `in violazione del vincolo
  ereditario`. That `vincolo` is an inheritance entail and has nothing to do with heritage
  protection. Do not let it into prose, and do not let it be mistaken for a Ruling 1 breach.
- **V-R10** *Museo di Roma in Trastevere — re-attribute.* Roma Capitale's page does not carry the
  history the finder credited to it. Split the entry:
  → **"Roma Capitale states that the museum covers the salient aspects of Roman popular life of the
  late eighteenth and nineteenth centuries, filtered through the tastes and convictions of the
  artists and folklorists who represented it, and gives information and booking on tel. 060608,
  09:00–19:00, with free entry for MIC cardholders."** The Discalced Carmelite monastery, the
  17th-century nucleus at San Lorenzo in Ianiculo, the rededication to Sant'Egidio and the address
  **Piazza Sant'Egidio 1/b** must be re-sourced to it.wikipedia (attributed) or to
  `museodiromaintrastevere.it`, which the finder recorded as reachable but evidently did not mine.
  **They may not be cited to the Sovrintendenza.**
- **V-R11** *Museo della Repubblica Romana — re-attribute.* Same failure, smaller.
  → **"Roma Capitale states that the exhibition route recalls the history, places and figures of the
  Roman Republic through historical documents, artworks and multimedia and teaching materials, gives
  information and booking on tel. 060608, and states free entry."** The **Porta San Pancrazio**
  housing is not on that page; source it to it.wikipedia or `museodellarepubblicaromana.it`.
- **V-R12** *Cannone di Mezzogiorno — two errors.* The finder gave 1847 and put the gun under the
  Garibaldi statue. Roma Capitale says 1846 and puts it under the Janiculum Belvedere.
  → **"Roma Capitale states that since 1904 a howitzer has been fired with a blank charge at exactly
  noon each day below the Janiculum Belvedere, and that the tradition goes back to Pius IX, who
  instituted the service in 1846 to prevent confusion over the hour; before reaching the Janiculum
  the gun was fired from the towers of Castel Sant'Angelo and then from Monte Mario. it.wikipedia
  gives the Janiculum date as 24 January 1904 and the institution of the noon signal as 1847."**
  Publish both years, each attributed, or publish only Roma Capitale's. Never merge them.
- **V-R13** *Monumento a Giuseppe Garibaldi.* The "25th anniversary of the taking of Rome" is the
  finder's own arithmetic and Roma Capitale does not say it. The institutional record is richer.
  → **"Roma Capitale records that the Municipal Council resolved to raise a monument to Giuseppe
  Garibaldi on the site of the Corsini casino at the top of the Passeggiata, that in 1884 the
  commission chose Emilio Gallori's proposal for a large equestrian statue on a high base decorated
  with bronze groups of Garibaldian battle scenes and allegories of Europe and America, that Gallori
  began work in 1886, and that the monument was inaugurated on 20 September 1895."**
- **V-R14** *Monumento ad Anita Garibaldi — upgrade from OSM-only.* The finder had nothing but an
  OSM id. Roma Capitale has the facts.
  → **"Roma Capitale records the equestrian monument to Anita Garibaldi as the work of Mario Rutelli,
  inaugurated in 1932."**
- **V-R15** *Faro del Gianicolo — replace the entry entirely.* The finder's text is garbled
  ("Decades from the coast") and its evaluative claims are it.wikipedia-only.
  → **"Roma Capitale records the lighthouse on the Janiculum as a gift to the city from the Italians
  of Argentina, made for the fiftieth anniversary of Italian unity and to commemorate Rome as
  capital, dated 19 September 1911, and records that it was restored in 2011 for the 150th
  anniversary of unification along with the monuments to Giuseppe and Anita Garibaldi, the 84 busts
  of the Garibaldian heroes and the four stelae to the fighters of the Roman Republic."**
  The "serves no navigation", "lit only sporadically" and "interior not open to the public" claims
  are dropped (V-D9).
- **V-R16** *UNESCO — the record is not "the 1980 inscription".*
  → **"UNESCO's World Heritage List records the Historic Centre of Rome, the Properties of the Holy
  See in that City Enjoying Extraterritorial Rights and San Paolo Fuori le Mura with a date of
  inscription of 1980, a significant modification to the boundaries in 1990, minor boundary
  modifications in 2015 and 2023, criteria (i)(ii)(iii)(iv)(vi), a property area of 1,469.7 hectares
  and a buffer zone of 7,158.933 hectares, and describes the site as extended in 1990 to the walls of
  Urban VIII."**
  ⚠️ **Binding constraint.** UNESCO's record **never names Trastevere**. No page may state that
  Trastevere is inside the inscribed property on UNESCO's authority. The OSM relation whose geometry
  covers Trastevere is crowd-sourced and does not close that gap. The Urban VIII connection is
  suggestive — the **Mura gianicolensi are Urban VIII's walls** (V-P7) — but "suggestive" is not
  "sourced", and drawing the inference in prose would be exactly the move Ruling 1 exists to stop.
- **V-R17** *The Augustan region.* The finder wrote "the Regio XIV Transtiberim", merging two facts.
  → **"it.wikipedia states that the present Trastevere corresponded to the fourteenth of the regions
  into which Augustus divided the territory of Rome, and that it was called Regio Transtiberim."**
- **V-R18** *American Academy in Rome, the 1909 date.* An ownership-duration claim resting on the
  institution's own site and an aggregator. Attribute or lose it.
  → **"it.wikipedia states that Villa Aurelia has been the property of the American Academy in Rome
  since 1909."** Do not assert it in the corpus's own voice.
- **V-R19** *Ponte Sisto's purpose.* Roma Capitale's sentence reads `tra il rione Trastevere (e il
  Vaticano) ed il resto della città`. The finder silently dropped the parenthesis. Either quote it
  whole or paraphrase without implying a quotation:
  → **"Roma Capitale states that Sixtus IV built it for the Jubilee of 1475 to allow direct
  communication between the rione Trastevere — and the Vatican — and the rest of the city."**
- **V-R20** *Piazza Mastai — a permitted superlative the finder left on the table.* Roma Capitale
  makes two comparative statements in its own voice. Both are institutional, not self-promotional,
  and both are publishable if attributed:
  → **"Roma Capitale describes Busiri Vici's work as the first modern monumental fountain built in
  the rione Trastevere after the Acqua Paola display on the Janiculum of the early seventeenth
  century, and describes the fountain in piazza di Santa Maria in Trastevere as the oldest in the
  rione."**
  ⚠️ Note carefully: **"oldest in the rione" is what Roma Capitale says. "The oldest working fountain
  in Rome" is what it.wikipedia says, and that one is dropped (V-D1).** Do not let the second creep
  back in under cover of the first. And do not carry over the source's word `vicina` — see V-D26.
- **V-R21** *Zona urbanistica 1B — attribute, do not assert identity.*
  → **"it.wikipedia states that the toponym also denotes zona urbanistica 1B of Municipio Roma I.
  Roma Capitale states that its toponymic areas 'non hanno alcuna relazione con le aree urbanistiche
  né amministrative', so the two are recorded here as distinct designations that share a name."**
- **V-R22** *Fontanone — the practical facts the finder walked past.* Roma Capitale publishes access
  terms on the page the finder fetched.
  → **"Roma Capitale states that the front of the fountain is always accessible; that the small
  garden behind it, reached by a stair at via Garibaldi 30, is open only to accompanied groups of up
  to 25, and to individual visitors on a published calendar, in both cases by prior booking on
  060608 between 09:00 and 19:00; and that admission is €4.00 full, €3.00 reduced, and free for
  residents of Rome and the metropolitan area on production of proof of residence and for MIC
  cardholders."**
- **V-R23** *Mausoleo Ossario Garibaldino — hours, and a correction of scale.*
  → **"Roma Capitale gives opening hours of Tuesday to Saturday, 09:30–13:30, closed Sunday and
  Monday, with a free guided visit every Saturday at 11:00 requiring no booking. It records that the
  sacrarium's thirty-six loculi carry memorial slabs naming more than 1,600 of the fallen, but that
  the loculi hold only about two hundred sets of remains, mostly anonymous, recovered in successive
  searches, and that the porphyry sarcophagus on the end wall holds Goffredo Mameli, the young
  Genoese poet and author of Italy's anthem, mortally wounded on the Janiculum in 1849 at
  twenty-two."**
- **V-R24** *Passeggiata del Gianicolo — hours and the count of busts.*
  → **"Roma Capitale states that the Passeggiata is always accessible, that the works on the new
  promenade as far as Sant'Onofrio began in October 1883 and were finished in 1896 though parts were
  usable from 1887, and that eighty-four busts now stand along the avenues, among them four foreign
  Garibaldians: the Englishman John Peard, the Finn Herman Lijkanen, the Hungarian István Türr and
  the Bulgarian Petko Voivoda."**

---

## 3. DROP — 28

### Superlatives, evaluations and trading-duration shapes
- **V-D1** ❌ **"la più antica fontana di Roma ancora funzionante"** — the oldest working fountain in
  Rome. it.wikipedia hedges it (`Si ritiene sia...`), Roma Capitale never makes it, and it is exactly
  the class of claim the corpus rules bar. The finder recommended dropping it and I confirm. The
  narrower institutional version survives at V-R20 and **only** in that form.
- **V-D2** ❌ **Bramante as author of the fountain in piazza Santa Maria in Trastevere.** it.wikipedia
  says `una realizzazione di Donato Bramante`. Roma Capitale gives a documented chain from the 1471
  Massaio plan through Rainaldi, Bernini, Carlo Fontana and the Comune and **never mentions Bramante**.
  it.wikipedia's own infobox on that article names **Bernini** as the artist, so the aggregator
  contradicts itself. Prefer the institution: the attribution is unusable.
- **V-D3** ❌ **Villa Farnesina as "prototype of the Roman suburban villa".** The words `suburbana`
  and `prototipo` appear nowhere on the official site; I searched the history page for both. It is an
  evaluative art-historical judgement carried on the institution's authority when the institution
  never made it.
- **V-D18** ❌ **Piazza di Santa Maria in Trastevere as "one of the most important squares in Rome".**
  Aggregator superlative.
- **V-D19** ❌ **Santa Maria in Trastevere as "the principal church of the rione".** Evaluative. The
  factual half of the entry survives at V-P39.
- **V-D20** ❌ **"casa più piccola di Trastevere"** — the smallest house in Trastevere. Publishable
  only as a street name if one exists; not as a fact.
- **V-D21** ❌ **San Benedetto in Piscinula, "Very small, very old".** Unfalsifiable. The dated half
  survives at V-P49.
- **V-D22** ❌ **Ponte Cestio as "one of only two Rome bridges that do not directly join opposite
  banks".** A counting superlative on an aggregator's authority alone. The rest of the entry survives.

### Vague proximity and unmeasurable distance
- **V-D9** ❌ **Faro del Gianicolo: "Decades from the coast, it serves no navigation; lit only
  sporadically; interior not open to the public."** The first clause is garbled and, read either way
  it could have been meant, is an unmeasurable distance impression. The rest is it.wikipedia-only
  colour about a state of affairs that changes. Replaced wholesale by V-R15.
- **V-D26** ❌ **All vague-proximity phrasing, wherever it sits.** Three live instances: Sant'Egidio
  "**near** the older San Lorenzo in Janiculo"; Palazzo Corsini "**opposite** Villa Farnesina";
  and the Sovrintendenza's own `la **vicina** piazza di S. Maria in Trastevere` in the Mastai text,
  which must not be carried into English. "Opposite" is arguably a stated relation rather than an
  impression, but it is unsourced as a measurement and the two are on the same street with known
  numbers — if the author wants the relation, cite the addresses (Via della Lungara 10 and 230) and
  let the reader see it.

### Source does not say it / could not be fetched
- **V-D4** ❌ **it.wikipedia's "sette ettari e mezzo" (75,000 m²) for Villa Sciarra.** Roma Capitale
  states `Estensione: 63.500 mq`. An 18% disagreement between an institution and an aggregator about
  a measurement the institution owns. Publish 63,500 m², attributed to Roma Capitale, and drop the
  other figure rather than publishing a range that implies both are equally good.
- **V-D5** ❌ **The Santuario siriaco street number.** it.wikipedia says via Dandolo 47, OSM says 45.
  Publish "via Dandolo, inside Villa Sciarra" and no number.
- **V-D6** ❌ **Any Trastevere population figure.** See V-P9.
- **V-D7** ❌ **Wikidata Q1466700 on Ponte Sublicio.** It is the ancient bridge. See V-P37.
- **V-D8** ❌ **Wikidata Q15852893 on Villa Aurelia.** It is the Casino Farnese. See V-P38.
- **V-D10** ❌ **Museo tassiano** and **Spezieria di Santa Maria della Scala.** The finder states
  outright: "I did not verify either independently." That is a drop by the finder's own admission.
- **V-D11** ❌ **The ~20 OSM-only Villa Sciarra and Trastevere fountains** — dei Satirelli, della
  Lumaca, della Tartaruga, dei Tritoni (×2), dei Tritoncini, dei Vizi Capitali, degli undici
  zampilli, della Grotticella, della Botte, ovale, rustica dell'esedra (×2), rustica delle Mura,
  rustica piccola, a muro semicircolare, con protomi leonine e foglie d'acanto, dei Putti o del
  Biscione. Crowd-sourced names with no fact behind them. The ones Roma Capitale itself names survive
  at V-P22 — and note that the Sovrintendenza's 2025 restoration line does name the *fontana dei
  Putti*, so that one crosses over.
- **V-D12** ❌ **The eighteen further churches listed with ids but no facts** — Santi Maria e
  Gallicano, Sante Rufina e Seconda, Santa Margherita, San Cosimato, Santi Quaranta Martiri e San
  Pasquale Baylon, Sant'Agata, Sant'Antonio Maria Zaccaria, San Giovanni della Malva, San Giacomo
  alla Lungara, San Giuseppe alla Lungara, Santa Croce alla Lungara, Sant'Andrea dei Vascellari,
  Santa Maria della Visitazione e San Francesco di Sales, Sacro Cuore di Gesù a Villa Lante, Santa
  Maria Assunta al Gianicolo, Santa Maria del Ritiro al Gianicolo, the North American College Chapel,
  the Chiesa del Collegio Pio Romeno. A Wikidata id is a pointer, not a claim. **Dropped from this
  wave, not from the corpus** — they return when someone fetches something.
- **V-D13** ❌ **"Triumphs and Laments"** as a Trastevere place. `tourism=artwork` on OSM and nothing
  else. The finder's own note calls it "unsourced beyond OSM".
- **V-D14** ❌ **Cinema Nuovo Sacher, "built on the site of the Monopoli di Stato Dopolavoro".**
  `nuovosacher.com` **does not resolve** — the finder recorded the DNS failure itself. The claim
  survives only inside it.wikipedia's article about a *different building*. Drop the venue this wave.
- **V-D15** ❌ **The whole food-and-shops list** — Biscottificio Artigiano Innocenti, Pasticceria
  Valzani, Panificio Arnese, Le Levain, Panetteria Romana, Il Panettiere di Riccardo Nicolai,
  Grattacheccaro "Alla Fonte d'Oro", Cencio la Parolaccia, Mercato di San Cosimato. The finder
  gathered **no fact about any of them** — no address fetched, no hours fetched, nothing. Names in a
  list are not candidates. The finder's own corpus-rule warning on this section is correct and I
  endorse it; the answer is that nothing here is ready, not that it needs careful handling.
- **V-D16** ❌ **The Porta Portese flea market.** The finder states OSM has the gate and a kiosk but
  **not the market as an object**, and it fetched nothing else. The *gate* publishes (V-P29). The
  market does not.
- **V-D17** ❌ **Any hours, access or ticketing for Orto botanico di Roma and the Galleria Corsini.**
  `web.uniroma1.it/ortobotanicoroma/`, `barberinicorsini.org` and `museiincomuneroma.it` all **404'd**.
  Identity and address survive on it.wikipedia's authority (V-P60, V-P61); operational detail does not
  exist in this evidence set at all.
- **V-D23** ❌ **`santacecilia.roma.it` and `sanfrancescoaripa.com` content.** DNS failure and a
  self-signed certificate respectively. Nothing from either may appear. The churches publish on
  it.wikipedia (V-P40, V-P42).
- **V-D24** ❌ **`turismoroma.it` content.** 403. The finder cited nothing to it, correctly; this drop
  is prophylactic against a downstream author reaching for it.
- **V-D25** ❌ **Anything from Vincoli in Rete or the Catalogo generale.** Re-confirmed unreachable
  (timeout) and, per the evidence_ruling, unusable even if it came back this wave.

### Wrong unit
- **V-D27** ❌ **The Mura Aureliane whole-circuit relation (10 units) and the "Mura di Roma" relation
  (13 units) as Trastevere places.** A 2,253-vertex object touching thirteen units is not a place
  belonging to one of them. Publish only `way/204145793`, the segment I re-confirmed lies wholly
  inside (V-P36).
- **V-D28** ❌ **"Zona extraterritoriale della Santa Sede" `r6474878` as a Trastevere place.** It is a
  legal overlay across eight units, not a place. The Lateran tier publishes as **named buildings**
  (V-P14), which is exactly what the vatican_ruling requires.

---

## 4. STRADDLERS ESCALATED TO THE ARBITRATOR — 13

I re-ran the geometry and I confirm the finder's assignments exactly. I decline to resolve these,
but unlike the finder I am obliged to give the arbitrator a recommendation, so each carries one.

| # | Place | cent | geom | My recommendation to the arbitrator |
|---|---|---|---|---|
| **E-1** | **Ponte Sisto** | Trastevere | Regola + Trastevere | **Trastevere.** Centroid is Trastevere and Roma Capitale frames the bridge *from* Trastevere. Regola gets a cross-reference. |
| **E-2** | **Ponte Giuseppe Mazzini** | Trastevere | Regola + Trastevere | **Trastevere**, on centroid, weakly. No institutional source names a rione. |
| **E-3** | **Ponte Garibaldi** | **Regola** | Regola + Trastevere | **Split or Regola.** But note it lands in piazza G. G. Belli and the Belli monument (V-P24) is unambiguously Trastevere's — the two must not be separated in the reader's mind. |
| **E-4** | **Ponte Cestio** | **Ripa** | Ripa + Trastevere | **Ripa**, since it connects to the Isola, which is Ripa's (E-7). |
| **E-5** | **Ponte Palatino** | **Ripa** | Ripa + Trastevere | **Ripa.** |
| **E-6** | **Ponte Sublicio** | **Testaccio** | Ripa + Testaccio + Trastevere | **Testaccio or Ripa.** Three units; Trastevere's claim is the weakest of the three. |
| **E-7** | **Isola Tiberina** | **Ripa** | Regola + Ripa + Trastevere | **Ripa, emphatically.** I agree with the finder and go further: this must not default to Trastevere on a geometry clip. |
| **E-8** | **American Academy in Rome** | Trastevere | Gianicolense + Trastevere | **Trastevere.** Note **Villa Aurelia is wholly inside Trastevere** and is not a straddler at all — the arbitrator should not conflate the two objects, as OSM already has (V-P38). |
| **E-9** | **Villa Sciarra** | Trastevere | Gianicolense + Trastevere | **Trastevere.** Roma Capitale states `Municipio I, Rione XIII - Trastevere` outright, and an institution's own statement of the rione beats OSM geometry. The finder called this "three sources, three shapes"; I think it is one institutional source and two weaker ones. |
| **E-10** | **Pontificio Collegio Americano del Nord** | Trastevere | Aurelio + Trastevere | **Trastevere**, on centroid. |
| **E-11** | **Largo Giorgio Roberti** | **Gianicolense** | Gianicolense + Trastevere | **Gianicolense.** Not a Trastevere place. |
| **E-12** | **Galleria PASA + Mura gianicolensi + Pontificia Università Urbaniana** | mixed | Aurelio/Borgo/Gianicolense/Trastevere | **The tunnel and the walls are boundaries and straddle definitionally — publish as boundary features under Trastevere with the crossing stated, not as places owned by it. The Urbaniana is Borgo's** (centroid Borgo) and should not appear under Trastevere. |
| **E-13** | **The Lateran Art. 14 ¶2 "north side of the Janiculum" properties** | — | — | **Unresolved and materially so.** The Treaty defines them only by an annexed map (Alleg. II, 12), the Trastevere/Borgo line runs through the zone, and my re-run puts the Urbaniana's centroid in Borgo. Do not publish these under Trastevere until someone reads the map. |

**Methodological note for the arbitrator.** The finder's straddler count of 17 is defensible but its
derivation is not stated. My re-run finds **27** geometry-straddling objects touching Trastevere; the
difference is that the finder silently excluded five transit-route relations (tram 3, tram 8 ×2,
Metro D, and the tram 3 Stazione Trastevere variant) and collapsed duplicate objects for Ponte
Palatino (×3), Ponte Sublicio (×2), Mura gianicolensi (×2) and the American Academy (×2). Both
exclusions are correct. **Neither is disclosed.** The arbitrator should know the 17 is a filtered
number, not a raw one.

---

## 5. TIER RULING: **GUIDE**

Decisively. The threshold is four surviving places; **more than fifty survive with institutional or
attributed-aggregator sourcing.** The five Sovrintendenza fountain and monument records alone
(Fontanone, Piazza Trilussa, Piazza Santa Maria, Piazza Mastai, Fontana del Prigione) clear the bar,
and the Passeggiata del Gianicolo, Villa Sciarra, the Mausoleo Ossario Garibaldino, the Belli
monument and Ponte Sisto carry Roma Capitale's own voice with a stated rione on the page. Add the
seventeen fact-gathered churches, Villa Farnesina on the Accademia's own site, the two municipal
museums, the three gates, the four palaces and the Lateran-tier Palazzo di San Callisto, and this is
one of the better-evidenced units the programme has produced.

**It is a guide about buildings, water and the Risorgimento.** It is emphatically **not** a guide to
the Trastevere a visitor pictures — the trattorie, bakeries, cinemas and the Porta Portese market all
fall at V-D14 through V-D16 for want of a single fetched fact. The author should not paper over that
gap with atmosphere, and the tier ruling should not be read as licence to.

---

## 6. WHAT THE FINDER GOT WRONG THAT WORRIES ME

1. **Two Sovrintendenza citations point at pages that do not contain the claims** (V-R10, V-R11).
   This is the one failure that would have shipped as a fabricated institutional citation. The
   underlying facts are probably true and probably came from it.wikipedia or the museums' own sites —
   which the finder recorded as reachable — but the tag says `[SOV]`, and a reader auditing the
   corpus would fetch that page and find nothing. **A wrong source attribution is worse than a
   missing one**, because it launders an aggregator claim into an institutional one. I want the
   arbitrator to know this pattern exists in the file, because I found it in two of the twelve
   Sovrintendenza pages I checked and I checked all twelve.

2. **The Villa Farnesina dates are not on the official site** (V-R6). "Built 1506–1512" tagged
   `[OWN]` is wrong in both directions: the official account starts in 1505 and its last construction
   milestone is 1511. The same entry attributes an evaluative art-historical claim to the institution
   that the institution never makes (V-D3). Two errors on the single richest `[OWN]` source in the
   file.

3. **The UNESCO citation is the one Ruling 1 explicitly hands us and the finder left it unread**
   (V-R16). It said "the verifier should" extract it. I did: the record is 1980 **plus 1990 plus 2015
   plus 2023**, and it **never names Trastevere**. The finder's framing — "the 1980 inscription ...
   can be cited from the primary source" — would have produced a page citing an incomplete record,
   and worse, would have invited an author to pair it with the OSM relation and assert Trastevere's
   inclusion. That assertion is not available and I have made its unavailability binding.

4. **The Cannone di Mezzogiorno has a wrong year and a wrong location** (V-R12). 1847 against Roma
   Capitale's 1846, and "under the Garibaldi statue" against "below the Janiculum Belvedere". Small
   in itself. What worries me is that both errors point the same way — toward the version a person
   would write from memory rather than from bytes — in a file whose whole methodological argument is
   that it read raw bytes.

5. **The finder under-harvested its own best sources.** It fetched twelve Sovrintendenza pages and
   left on the table the Fontanone's access terms and prices, the Mausoleo's opening hours and the
   Mameli sarcophagus, the Passeggiata's hours and its eighty-four busts, Villa Sciarra's hours and
   the Castelletto, Anita Garibaldi's sculptor and date, the Faro's actual provenance, and two
   permitted institutional superlatives (V-R20). It then filled §5.7 with a list of shops it had
   fetched nothing about. **The effort went to breadth at the edges when the depth was already paid
   for at the centre.** That is the opposite of the trade the brief asked for.

6. **A genuine credit, because it cuts the other way.** The geometry method is sound, I re-ran it,
   and it reproduces exactly. The Nominatim 429 correction to the earlier scoping research is real
   and important. The Ruling 2 scan comes back clean under my own independent test. The Lateran
   Treaty section is quoted verbatim and correctly, including a discrepancy in the primary source
   that the finder had every incentive to smooth over and did not. **The finder's judgement about
   what it could not establish is better than its bookkeeping about what it could.**
