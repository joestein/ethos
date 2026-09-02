# Rome scope research — Angle 5: can we publish photographs?

**Status: NOT programme-breaking, but it changes the sourcing rule.** Rome can ship with Commons
photographs. The constraint is real, is not copyright, and is not visible in the licence tag — so
the existing "CC-BY-SA or CC0 is enough" heuristic from the Bronx and Queens waves is unsafe here
and must be replaced.

**Confidence: high** on the legal position and on what Commons does (primary text + template text
read directly). **Medium** on the 2023/2024 decrees (see "What I could not verify"). **Low, and
explicitly not legal advice**, on residual enforcement risk against a US-hosted site.

## Method note (read this before trusting anything below)

The session's `WebSearch` budget was exhausted before this wave started (200/200 used), and the
`WebFetch` classifier was down for the first several minutes. Everything below was fetched by
`python3` + `urllib` against URLs I could name in advance, mostly via the MediaWiki `action=parse`
and `action=query` APIs (which return raw wikitext and file metadata and so cannot be mangled by
the shell). Two consequences:

- I could not do discovery searching. If a relevant Italian source exists that I could not name
  in advance, I did not find it.
- Normattiva renders article bodies in JavaScript, so `https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2004-01-22;42~art108!vig=`
  returned only page chrome. The statute text below comes from a mirror and is cross-checked
  against independent quotations — see the caveat in §1.

Scratch files: `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/a5_*.txt`

---

## 1. The Codice dei beni culturali (D.Lgs. 42/2004), arts. 106–108

**Source of text:** `https://www.bosettiegatti.eu/info/norme/statali/2004_0042.htm` (full
consolidated text, 273 KB, fetched and read directly).

**Cross-check:** the operative sentences of art. 107 c. 1 and art. 108 c. 3 that I extracted match
verbatim the quotations independently carried in the Commons CRT/Italy footnote (`ref name=Normattiva`)
and in the it.wikipedia *Libertà di panorama* footnotes, which cite Normattiva directly. That is
two independent quotations agreeing with my mirror, so I treat the text as VERIFIED — with one
important exception noted below.

### Art. 107 — the authorisation rule

> «Il Ministero, le regioni e gli altri enti pubblici territoriali possono consentire la
> riproduzione nonché l'uso strumentale e precario dei beni culturali che abbiano in consegna,
> fatte salve le disposizioni di cui al comma 2 e quelle in materia di diritto d'autore.»

*"The Ministry, the regions and other territorial public bodies may permit the reproduction, as
well as the instrumental and temporary use, of the cultural property in their consignment, without
prejudice to the provisions of paragraph 2 and those concerning copyright."*

Note the construction: reproduction is something the authority *may permit* (`possono consentire`).
The default is that it is not permitted. Note also `fatte salve … quelle in materia di diritto
d'autore` — this regime is expressly **additional to** copyright, not a substitute for it.

### Art. 108 c. 3 — who pays nothing

> «Nessun canone è dovuto per le riproduzioni richieste o eseguite da privati per uso personale o
> per motivi di studio, ovvero da soggetti pubblici o privati per finalità di valorizzazione,
> purché attuate senza scopo di lucro.»

*"No fee is due for reproductions requested or made by private parties for personal use or for
study purposes, or by public or private entities for the purpose of valorisation, provided they
are carried out without profit motive."*

**Discrepancy worth flagging to the arbitrator.** Commons' own CRT/Italy page and it.wikipedia both
quote an *older* version of this paragraph — "ovvero da soggetti pubblici per finalità di
valorizzazione", with no `o privati` and no `purché attuate senza scopo di lucro` tail. The mirror
I read has the post-2014 (Art Bonus, d.l. 83/2014) text. Both versions land in the same place for
us — a commercial travel site is `a scopo di lucro` either way — but it means **Commons' cited
statute text is stale**, which is one more reason not to treat Commons as the authority here.

### Art. 108 c. 3-bis — the free-use carve-out, and why it does not reach us

> «Sono in ogni caso libere le seguenti attività, svolte **senza scopo di lucro**, per finalità di
> studio, ricerca, libera manifestazione del pensiero o espressione creativa, promozione della
> conoscenza del patrimonio culturale:
> 1) la riproduzione di beni culturali […] attuata nel rispetto delle disposizioni che tutelano il
> diritto di autore e con modalità che non comportino alcun contatto fisico con il bene […];
> 2) la divulgazione con qualsiasi mezzo delle immagini di beni culturali, legittimamente
> acquisite, **in modo da non poter essere ulteriormente riprodotte a scopo di lucro**.»

*"The following activities are in any case free, when carried out **without profit motive**, for
purposes of study, research, free expression of thought or creative expression, or promotion of
knowledge of cultural heritage: (1) the reproduction of cultural property […] carried out in
compliance with copyright provisions and by means involving no physical contact with the property
[…]; (2) the dissemination by any means of legitimately acquired images of cultural property, **in
such a way that they cannot be further reproduced for profit**."*

This is the crux, and it fails us twice over:

- The chapeau requires `senza scopo di lucro`. Ethos is a commercial site.
- Sub-paragraph 2 requires that the images be disseminated so they **cannot be further reproduced
  for profit**. A CC-BY-SA or CC0 image published on our pages is by definition further
  reproducible for profit — that is what those licences grant. So even a non-profit publisher
  arguably could not use a copyleft licence and stay inside 3-bis(2).

**INFERENCE (mine, flagged as such):** the free-use carve-out and open licensing are structurally
in tension. 3-bis(2) wants a closed downstream; CC wants an open one. I did not find an Italian
source addressing this head-on and a verifier should probe it.

### Art. 106 and art. 108 c. 6

Art. 106 covers *use* of the property (concession of physical use) rather than reproduction, and is
not our concern. Art. 108 c. 6 is the hook for the ministerial decrees:

> «Gli importi minimi dei canoni e dei corrispettivi per l'uso e la riproduzione dei beni sono
> fissati con provvedimento dell'amministrazione concedente.»

*"The minimum amounts of the fees and charges for the use and reproduction of the property are set
by measure of the granting administration."*

### The 2023 decree, and the 2024 decree that softened it

The brief asked me to find the ministerial decree. There are **two**, and the second is the one
that matters:

- **D.M. 11 aprile 2023, n. 161** — *"Linee guida per la determinazione degli importi minimi dei
  canoni e dei corrispettivi per la concessione d'uso dei beni in consegna agli istituti e luoghi
  della cultura statali."* Put a tariff on essentially every editorial use of reproductions,
  including scholarly publishing, removing exemptions that had previously existed. Provoked an
  unusually broad backlash (AIB and ~15 other bodies, the university consulte for archaeology and
  art history, the CUN, the CRUI, the Accademia dei Lincei); the Corte dei Conti criticised it in
  *Deliberazione 20 ottobre 2023, n. 76/2023/G*.
- **D.M. 21 marzo 2024, n. 108** — amended DM 161/2023. Per Liverani: *"ora finalmente le
  pubblicazioni sia scientifiche che divulgative, nonché i quotidiani e i periodici di
  informazione sono esentati dal pagamento di un canone"* — *"now at last both scientific and
  popular publications, as well as daily newspapers and news periodicals, are exempt from paying a
  fee."* Exhibition catalogues up to 4,000 copies were also exempted.

**Critically, the fee exemption is not an authorisation exemption.** Liverani is explicit that the
concession regime of art. 2 c. 2 of DM 161/2023 survives unchanged:

> «Indipendentemente dal canone o dal corrispettivo individuato, la concessione per l'uso e la
> riproduzione dei beni culturali è comunque subordinata alla previa verifica di compatibilità
> della destinazione d'uso della riproduzione con il carattere storico-artistico dei medesimi beni
> culturali […]»

*"Irrespective of the fee or charge determined, the concession for the use and reproduction of
cultural property remains subject to prior verification that the intended use of the reproduction
is compatible with the historic-artistic character of the property itself […]"*

So post-2024 the picture is: **fee possibly zero for editorial/"divulgativa" publishing; permission
still formally required, and still discretionary on a vague "dignity/compatibility" test.** Liverani
also reports that in practice museums and territorial soprintendenze often do not enforce the
paperwork, partly because so many requests come from abroad, and that some scholars openly practise
"disobbedienza civile" or simply "si fa finta di niente, si pubblica come si è sempre fatto".

Sources for both decrees:
- Mirco Modolo, *"Riprodurre il patrimonio culturale. Quando l'abuso diventa (la) regola"*,
  Engramma, March 2025 — `https://www.engramma.it/eOS/index.php?id_articolo=5946`
- Paolo Liverani, *"Riproduzioni dei beni culturali statali: il nuovo Decreto Ministeriale
  108/2024"*, ROARS, 3 May 2024 —
  `https://www.roars.it/riproduzioni-dei-beni-culturali-statali-il-nuovo-decreto-ministeriale-108-2024/`

These are two independent authors in two independent venues agreeing on the decree numbers, dates
and effect. Modolo on the 2024 decree: *"il d.m. 108/2024, che rettificava il precedente rendendo
gratuita la pubblicazione di immagini nell'editoria accademica e culturale"* — *"DM 108/2024, which
corrected the previous one by making the publication of images in academic and cultural publishing
free of charge."*

---

## 2. Freedom of panorama — a separate and, for Rome, smaller problem

Italy has **no** freedom of panorama. Commons' infobox for Italy states flatly
`Freedom of panorama = No`
(`https://commons.wikimedia.org/wiki/Commons:Copyright_rules_by_territory/Italy`).

What that means concretely, from the same page:

> "Pictures from public places don't formally enjoy any exception in Italian copyright law. Objects
> still under copyright only allow 'quotation right' (633/1941 art. 70) and a minimal and never
> implemented 'fair use' (633/1941 art. 70 c. 1-bis). Some objects are even subject to *additional*
> non-copyright restrictions."

The decisive limiting principle is on `https://commons.wikimedia.org/wiki/Commons:Freedom_of_panorama`:

> "Note that in every country, even one without an FOP exception, once a work goes out of copyright
> it may be freely photographed. Also, the exception does not eliminate the need for a license from
> the photographer."

**So the answer differs sharply by age, exactly as the brief suspected:**

| Subject | Architect's copyright | FoP problem? |
|---|---|---|
| Ancient / medieval / Renaissance / Baroque Rome | Expired centuries ago | **None** |
| Modern building, architect died >70 yrs ago | Expired | **None** |
| Modern building, architect died <70 yrs ago or living | Live | **Yes — photo is an infringing derivative work** |

Commons' `{{NoFoP-Italy}}` warning states the consequence for the second case:

> "This image features an architectural or artistic work, photographed from a public space in
> Italy. There is no freedom of panorama exception in the Italian copyright law, which means that
> they cannot be photographed freely for anything other than personal purposes. […] If a
> copyrighted architectural or artistic work is contained in this image and it is a substantial
> reproduction, this photo cannot be licensed under a free license, and **will be deleted**."

Rome-specific modern buildings that fall on the wrong side: **MAXXI** (Zaha Hadid, d. 2016 →
protected to 2087), the **Ara Pacis Museum** (Richard Meier, living), the **Auditorium Parco della
Musica** (Renzo Piano, living), and — a trap, because it looks ancient — the **Palazzo della
Civiltà Italiana** at EUR, whose co-architect Giovanni Guerrini died in 1972, protecting it until
**2043**. Commons' own CRT/Italy page independently lists "Guerrini, Giovanni (1887–1972) @2043" in
its artist table, which is how I dated it.

There is a further Italian wrinkle recorded on the Commons page: per a 2023 Village Pump discussion,
buildings and monuments *commissioned and paid for by the Italian state or its subdivisions* are
treated as government works under arts. 11/29 of L. 633/1941, i.e. 20 years from publication rather
than life+70. If that holds, several state-commissioned modern buildings would already be clear. I
did not independently verify this and it rests on a community discussion, not a court ruling —
**treat as INFERRED and do not rely on it.**

---

## 3. What Wikimedia Commons actually does about it

**Commons separates the two questions cleanly, and washes its hands of the second one.**

Per `https://commons.wikimedia.org/wiki/Commons:Non-copyright_restrictions` (a guideline):

> "While all material on Commons must either be in the public domain or free to use under its
> respective license(s), some materials may be subject to additional legal restrictions […] Commons
> considers non-copyright restrictions to be matters for photographers/uploaders or reusers and are
> not grounds for deletion of works from Commons."
>
> "**It is up to the reusers of Commons-hosted media to ensure that they do not violate any
> non-copyright restrictions that apply to the media.**"

Commons' Italy page classifies the Codice explicitly as a non-copyright restriction:

> "In addition to copyright concerns, photos of any cultural heritage asset are generally subject to
> preemptive authorisation, a fee and other restriction due to the cultural heritage and landscape
> law which is a non-copyright restriction. […] **Any artwork or building should be assumed a
> cultural heritage asset if older than 50 years** (or 70 years in some cases since 2017)."

That last sentence is the single most useful operational line on the page: it gives us a bright-line
age test to apply.

### The two Italian restriction tags, and their wording

`{{Soprintendenza}}` (via `Template:Soprintendenza/en`):

> "The usage of this reproduction of a 'cultural good' may be restricted by Italian laws, which
> requires a payment to the local *Soprintendenza* […] for any use of reproductions of these goods
> (article 107) that are not for a personal or educational purpose (article 108). **Wikimedia
> Commons is not required to comply as it is hosted in the United States of America.** Users who
> are citizens of Italy are warned that they are *solely responsible* for any possible violation of
> local laws. […] **These restrictions are independent of the copyright status of the depicted
> work.**"

`{{Italy-MiBAC-disclaimer}}` (via `Template:Italy-MiBAC-disclaimer/en`) is blunter and is the
sentence to put in front of anyone who wants to argue this away:

> "These regulations, unrelated to copyright regulations […] provide for the payment of a concession
> fee by those who intend to benefit economically from reproductions of property belonging to the
> Italian cultural heritage. Reproduction of this image is permitted for personal use or study. **A
> further authorization by the Italian Ministry of Heritage and Culture is required for reproduction
> for any other purpose, and particularly for commercial use.**"

### The finding that actually matters: the tags are applied almost at random

I checked this rather than assuming it. Commons search for `insource:"NoFoP-Italy"` restricted to
the File namespace and Rome returned **2 total hits** across all of Commons — neither of them a
Rome landmark. Meanwhile I found CC-licensed Commons photographs of MAXXI and the Meier Ara Pacis
carrying **no restriction tag at all**, despite both architects' copyrights being live.

Concretely (all fetched via the Commons API, `iiprop=extmetadata`):

| File | Licence | `Restrictions` field | Should have a tag? |
|---|---|---|---|
| `File:Colosseo 2020.jpg` | CC BY-SA 4.0 | `ita-mibac` (`{{Soprintendenza}}`) | yes — and it does |
| `File:Trevi Fountain - Roma.jpg` | CC BY-SA 4.0 | *(empty)* | arguably yes — missing |
| `File:Palazzo della Civiltà Italiana, viewed from the North, Rome, Italy.jpg` | CC0 | `ita-mibac` | yes — and it does |
| `File:MAXXI (2017) Rome 112.jpg` | CC BY-SA 4.0 | *(empty)* | **yes, on live architect copyright — missing** |
| `File:Roma Ara pacis augustae Meier.jpg` | CC BY-SA 3.0 | *(empty)* | **yes, on live architect copyright — missing** |

**Conclusion: the absence of a restriction tag on a Commons file carries no information.** An
image-sourcing agent must not treat "no `ita-mibac` flag" as clearance. The presence of one is
informative; the absence is not.

---

## 4. The three worked examples

### (a) The Colosseum — **PUBLISH**

Examined `https://commons.wikimedia.org/wiki/File:Colosseo_2020.jpg`, `{{self|cc-by-sa-4.0}}`,
`extmetadata.LicenseShortName = "CC BY-SA 4.0"`, and it carries `{{Soprintendenza}}`
(`Restrictions: ita-mibac`).

- Copyright: none. Flavian, c. AD 80. No FoP issue.
- Photographer's copyright: cleared by CC BY-SA 4.0, which permits commercial use.
- Cultural-property restriction: **formally engaged.** The Colosseum is state-owned cultural
  property and the file is tagged accordingly.
- Countervailing evidence, and it is good evidence: the Italian government's own written answer to
  parliamentary question 4-05031 (Undersecretary Danielle Mazzonis, 19 February 2008, Camera dei
  deputati) named **the Colosseum specifically**, alongside the new Ara Pacis building, as freely
  photographable. Per it.wikipedia's summary: *"la stessa risposta scritta del Governo
  all'interrogazione Grillini riteneva liberamente fotografabili moltissimi di essi (erano citati
  il nuovo edificio dell'Ara Pacis e il Colosseo)"* — *"the Government's own written answer to the
  Grillini question considered very many of them freely photographable (the new Ara Pacis building
  and the Colosseum were cited)."* Source:
  `https://aic.camera.it/aic/scheda.html?core=aic&numero=4/05031&ramo=CAMERA&leg=15`

**Verdict: publish.** An exterior view of the Colosseum from public land, under CC BY-SA, is the
lowest-risk category we have. Note this is *risk-managed*, not *permission-obtained*.

### (b) The Trevi Fountain — **PUBLISH**

Examined `https://commons.wikimedia.org/wiki/File:Trevi_Fountain_-_Roma.jpg`, `{{self|cc-by-sa-4.0}}`,
no restriction tag. Also checked `File:Fontana di Trevi di notte.JPG` (`{{PD-self}}`).

- Copyright: none. Nicola Salvi, completed 1762.
- Cultural-property restriction: engaged in principle — it is a *bene culturale* of the Comune di
  Roma — but the file carries no tag, which per §3 tells us nothing.
- Risk posture identical to the Colosseum.

**One caveat I want on the record.** The night photograph raises a *separate* question I could not
resolve: architectural lighting schemes can attract their own copyright in some jurisdictions (the
Eiffel Tower is the standard example). I found **no** Italian authority either way. **I could not
confirm whether Rome's monument lighting is protected.** Cheap mitigation: prefer daylight
photographs. I recommend we simply do that rather than resolve the question.

**Verdict: publish, daylight images preferred.**

### (c) A Baroque church interior — **PUBLISH, with a real caveat**

Examined two files for the Chiesa del Gesù:
`https://commons.wikimedia.org/wiki/File:01_Il_Gesu_Nave.jpg` (`{{self|cc-by-4.0}}`, CC BY 4.0) and
`https://commons.wikimedia.org/wiki/File:Chiesa_del_Ges%C3%B9_September_2015-7a.jpg`
(`{{self|cc-by-sa-4.0}}`, ceiling detail — Baciccio's *Triumph of the Name of Jesus*, 1679).
Neither carries a restriction tag.

- Copyright: none. Church 1568–1584; Baciccio d. 1709.
- Cultural-property restriction: this is where interiors are genuinely worse than exteriors. Two
  compounding factors:
  1. **Ownership.** Il Gesù is the Jesuits' mother church — ecclesiastical, not state, property.
     The Codice regime attaches to property `in consegna` to the Ministry/regions/local bodies.
     Ecclesiastical property may sit outside it, or may be covered by separate concordat-derived
     arrangements. **I could not establish which.** This is a real gap.
  2. **House rules.** Many Roman churches and museums impose contractual no-commercial-photography
     conditions at the door. These bind the *photographer*, not us — but they mean a Commons
     interior shot may have been taken in breach of the uploader's own permission, which taints the
     upstream chain in a way the licence tag does not reveal.
- Art. 108 c. 3-bis(1) expressly permits reproduction "with means involving no physical contact
  with the property, nor exposing it to light sources, nor, inside cultural institutions, the use
  of stands or tripods" — i.e. **handheld, no flash, no tripod**. That is a decent proxy for
  whether an interior photograph was lawfully taken in the first place, though the chapeau still
  restricts it to non-profit purposes.

**Verdict: publish for churches, which are the ordinary case in Rome, subject to the flash/tripod
proxy. Treat state-museum interiors (Musei Capitolini, Galleria Borghese, Palazzo Massimo) as a
distinct and stricter category** — there the property is unambiguously state-consigned, the
institution actively licenses images as a revenue stream, and the litigation history is precisely
about museum-held works.

---

## 5. "It depends" — on exactly what, in applicable form

It depends on **five** things, in this order:

1. **Is the depicted work still in copyright?** (Architect/artist died <70 years ago.) If yes →
   hard stop, this is ordinary copyright infringement and Commons will delete the file too.
2. **Is it state-consigned cultural property?** (Assume yes if >50 years old and publicly owned.)
   If yes → the Codice regime is engaged.
3. **Is our use `a scopo di lucro`?** For Ethos, always yes. So no art. 108 exemption applies.
4. **Is it exterior-from-public-land, or interior/museum-held?** Interiors and museum holdings are
   materially riskier: that is where the institutions actually litigate.
5. **Can the rights-holder reach us?** See below.

### On enforcement reach — the honest answer

Italian courts *do* enforce this, including against foreign companies:

- **Teatro Massimo, 2017.** The courts of Florence and Palermo held that a bank's advertising use
  of an image of the Teatro Massimo — a **public-domain** building, last surviving architect died
  1897 — infringed the Teatro Massimo Foundation's exclusive rights in images of the building.
  (Cited on Commons' CRT/Italy page.)
- **Gallerie dell'Accademia v. Ravensburger (Vitruvian Man).** Venice, ruling of **17 November
  2022**: ordered the German puzzle manufacturer to cease commercial production and imposed
  €1,500/day for non-compliance. Ravensburger had argued exactly the two defences a US site would
  raise — the work is centuries in the public domain, and the reproduction happened outside Italy.
  **The Italian court rejected both.**
- **But in March 2024 a German court ruled the other way**, holding that the Cultural Heritage Code
  is not applicable outside Italy and that applying it there would violate the sovereignty of other
  states. An Italian government official said they would challenge this "abnormal" ruling before
  European and international courts.
  (Source: en.wikipedia *Vitruvian Man* § Legal dispute, citing AP News 28 March 2024 and NYT 10
  April 2024: `https://www.nytimes.com/2024/04/10/world/europe/vitruvian-man-puzzle-leonardo-da-vinci-ravensburger.html`)

**INFERENCE, clearly flagged:** the German ruling is the closest thing to a precedent protecting a
non-Italian publisher, and it is one first-instance foreign judgment under active challenge. It is
not a safe harbour. What it does establish is that the *contested* territory is commercial
merchandising of museum-held artworks — puzzles, adverts, fashion — not editorial photographs of
outdoor monuments in a travel guide. I found **no** case, in any of the sources I read, of an
Italian institution pursuing a travel publisher over an exterior photograph of a monument. That
absence is genuine but is weak evidence, since I could not run discovery searches.

---

## 6. Draft rule for an image-sourcing agent

```
ROME IMAGE SOURCING RULE  (supersedes the Bronx/Queens "CC-BY-SA or CC0 is sufficient" rule)

A Commons licence tag is NECESSARY BUT NOT SUFFICIENT for Rome. Run all four gates.

GATE 1 — PHOTOGRAPHER'S LICENCE (unchanged from prior waves)
  ACCEPT: CC0, PD-*, CC BY, CC BY-SA (any version).
  REJECT: CC BY-NC*, CC BY-ND*, "fair use", any bare {{PD-Italy}} on a photo of a
          3D subject (it is for simple photographs; do not stretch it).

GATE 2 — SUBJECT COPYRIGHT / NO FREEDOM OF PANORAMA        [HARD STOP]
  Identify the architect or sculptor of the primary subject and their death year.
    - died > 70 years ago, or built before 1900   -> PASS
    - died <= 70 years ago, or still living       -> REJECT, no exceptions
    - cannot determine                            -> REJECT, escalate
  Italy has NO freedom of panorama: "from a public street" is NOT a defence.
  Known Rome REJECTs: MAXXI (Hadid d.2016), Ara Pacis Museum (Meier, living),
    Auditorium Parco della Musica (Piano, living),
    Palazzo della Civiltà Italiana / EUR (Guerrini d.1972 -> blocked until 2043).
  De minimis: a copyrighted modern building incidentally in the background of a
  wider streetscape is acceptable. Framing that features it is not.

GATE 3 — CULTURAL-PROPERTY CLASS (Codice 42/2004 arts. 106-108)
  Classify the subject, then apply:
    A. Exterior of a pre-1900 monument, publicly owned, shot from public land
       (Colosseum, Trevi, Pantheon exterior, Forum, bridges, piazzas, fountains)
       -> PUBLISH.
    B. Interior of a church or other ecclesiastical building
       (Il Gesù, S. Ignazio, S. Maria Maggiore, S. Clemente)
       -> PUBLISH, but only if nothing on the file page indicates flash or tripod
          use, and only if no "no photography" notice is referenced. Prefer files
          whose uploader is an established Commons contributor.
    C. Interior of a STATE MUSEUM, or a photograph whose subject is a single
       museum-held artwork filling the frame
       (Musei Capitolini, Galleria Borghese, Palazzo Massimo, Castel Sant'Angelo,
        Vatican Museums)
       -> DO NOT PUBLISH without human sign-off. Highest-risk category; this is
          where Italian institutions actually litigate. Prefer an exterior shot
          or an architectural detail instead.
    D. Vatican City proper (St Peter's, Vatican Museums)
       -> SEPARATE JURISDICTION, NOT COVERED BY THIS RULE. Escalate.
          (I did not research Vatican law; see gaps below.)

GATE 4 — TAGS AND HYGIENE
  {{Soprintendenza}} or {{Italy-MiBAC-disclaimer}} present -> informative, log it,
    but it does NOT by itself block a Gate-3-class-A image.
  Tag ABSENT -> means NOTHING. Verified: Commons photos of MAXXI and Meier's
    Ara Pacis carry no restriction tag despite live architect copyright.
    Never treat absence of a tag as clearance.
  Prefer daylight over illuminated-night shots (unresolved lighting-design
    copyright question).
  Always record on the page: photographer, licence, licence URL, Commons file URL.
  Attribution is not optional; CC BY-SA also obliges share-alike on adaptations,
    so do not crop-and-restyle into a composite without propagating the licence.

DEFAULT WHEN UNCERTAIN: reject and escalate. Rome has an enormous supply of
class-A images; there is never a need to run a marginal one.
```

**Practical effect on the programme: small.** Nearly every image a Rome neighbourhood page wants —
streetscapes, piazzas, fountains, church exteriors, ruins, bridges, market scenes — is Gate-3
class A and passes. What we lose is museum interiors and a short list of modern buildings.

---

## 7. What I could not verify — read before relying on this

1. **I never read DM 161/2023 or DM 108/2024 in the original.** Both come from two independent
   secondary sources that agree (Modolo/Engramma 2025; Liverani/ROARS 2024). I could not reach the
   Gazzetta Ufficiale or Normattiva text. Decree numbers, dates and effect should be confirmed
   against the primary text before this is treated as settled.
2. **I could not extract the Normattiva consolidated text** of arts. 106–108 (JavaScript-rendered).
   The text above is from a mirror, cross-checked against two independent quotations — but one of
   those quotations (Commons') is demonstrably a stale version of art. 108 c. 3, which shows the
   cross-check is not airtight.
3. **Ecclesiastical property.** Whether the Codice's reproduction regime reaches churches owned by
   religious institutions rather than the state — the majority of Rome's Baroque interiors — I
   could not establish. This is the largest open question in the rule above and it affects Gate 3
   class B directly.
4. **Vatican City** is a separate sovereign state with its own law. I did not research it at all.
   St Peter's and the Vatican Museums are out of scope for this document and must not be covered by
   the rule above.
5. **Lighting-design copyright** on illuminated monuments: no Italian authority found either way.
   Mitigated by preferring daylight, not resolved.
6. **No discovery searching was possible** (WebSearch budget exhausted at 200/200 before this wave
   began; WebFetch's classifier was also down initially). Everything here came from URLs I could
   name in advance. A verifier with a fresh search budget should re-run this, particularly on
   points 1 and 3.
7. **This is not legal advice.** The recommendation is a risk posture, not a clearance. If Ethos
   wants certainty rather than a defensible position, the route is a written concession request to
   the relevant soprintendenza for the specific images — which, post-DM 108/2024, would plausibly
   carry a zero fee but still requires the paperwork.
