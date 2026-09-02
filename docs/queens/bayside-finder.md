# Bayside, Queens — FINDER candidate list

Role: FINDER. Nothing here is verified. No verdicts, no confirmations, no adjudication.
Every line below is a CANDIDATE awaiting the verifier. Where sources disagree I record BOTH and
resolve nothing.

---

## 0. METHODOLOGY AND ITS LIMITS — READ BEFORE USING ANY QUOTE

**0.1 — WebSearch was unavailable for this entire session.** The first search call returned:
`"Web search was not performed: this session has used its web search budget (200 of 200 WebSearch
calls)."` Every source below was reached either by WebFetch or by `curl` against a URL I
constructed from prior knowledge, or discovered through the Wikipedia `api.php` search endpoint
(`action=query&list=search`), which I used as a substitute discovery tool. **Coverage is therefore
shaped by which URLs I could guess or derive, not by what a search engine would have surfaced.**
Under-covered categories are named explicitly in §16. Treat a topic's absence here as evidence
about my method, not about Bayside.

**0.2 — THERE ARE TWO TIERS OF QUOTE RELIABILITY IN THIS DOCUMENT. THEY ARE NOT INTERCHANGEABLE.**

- **TIER A — RAW TEXT.** I fetched the page or PDF with `curl` and extracted the text myself
  (regex HTML-strip, or `pdftotext -layout`). I read the actual bytes. Quotes marked **[A]** are
  reproduced from that raw text and I can attest they appear in the source as printed, subject
  only to OCR/ligature noise in the older scanned LPC PDFs, which I flag inline where it occurs.
  Tier A sources here: nycgovparks.org, all `s-media.nyc.gov/agencies/lpc/lp/*.pdf` designation
  reports, baysidehistorical.org, alleypond.org, allsaintsbayside.org, baysidevillagebid.com,
  data.cityofnewyork.us (Socrata JSON), qcc.cuny.edu.

- **TIER B — WEBFETCH EXTRACTION.** WebFetch does not return raw page text; it returns a summary
  written by a smaller model with quoted fragments embedded. Strings marked **[B]** are reproduced
  *exactly as that extraction returned them*, but **I did not see the underlying page and cannot
  personally attest they are verbatim from the source.** The verifier must re-open each URL and
  confirm wording before any Tier B string is used as a quote. Tier B sources here: all
  `en.wikipedia.org` articles.

- Where I am paraphrasing rather than reproducing an extracted or raw string, I write
  **(paraphrase)**. I have not presented any paraphrase as a quote.

**0.3 — Source quality.** I reached a genuinely good primary/institutional layer for this
neighborhood: six LPC designation reports as PDFs, four NYC Parks Historical Signs Project texts,
the Bayside Historical Society's own site, the Bayside Village BID's own site, and the NYC Open
Data LPC landmark tables. That authoritative layer is the backbone of §5–§8. Wikipedia (a tertiary
aggregator) carries §12–§15 and much of §2, and should be treated as the weakest tier.

Institutional sources that FAILED and should be re-attempted by the verifier:
- `nycgovparks.org/parks/*` via **WebFetch** → HTTP 403 for every path. **Workaround: plain `curl`
  with a browser User-Agent returns HTTP 200.** This worked for four history pages before the host
  began returning HTTP 202 (rate-limit/challenge) on all further requests. Alley Pond Park's,
  Cunningham Park's, Oakland Lake's and Joe Michaels Mile's Parks histories were lost to that
  rate-limit and remain **unfetched**.
- `nycgovparks.org/parks/alley-pond-park/history` → returned HTTP 200 but the page carries **no
  history text**; it is a "Park Group" (Park ID `Q001GROUP`) landing page. Same for `/parks/Q001/history`.
- `queensboroughpac.org` → DNS did not resolve.
- `stjosaphatbayside.org` → DNS did not resolve.
- `nyc.gov/site/queenscb11/about/about-community-board-11.page` → HTTP 404. CB11's own boundary
  statement is therefore **absent** from this document; the CD11 material below is Wikipedia-only.
- `baysidehistorical.org/about`, `/the-castle`, `/our-history` → HTTP 404. Correct paths, found via
  the site's `pages-sitemap.xml`, are `/about-bhs`, `/visit-us`, `/community-history-tours`.
- `en.wikipedia.org/wiki/All_Saints_Episcopal_Church_(Bayside,_New_York)` → HTTP 404 (no article).
- `en.wikipedia.org/wiki/Bell_Boulevard` → HTTP 404 (no article).
- `en.wikipedia.org/wiki/Bayside_apparitions`, `/Our_Lady_of_the_Roses,_Mary_Help_of_Mothers` → 404.
  The topic is at `/Veronica_Lueken`.

**0.4 — RESTAURANTS AND BUSINESSES — EXPLICIT STATEMENT AS REQUIRED.**
**No candidate anywhere in this document rests on a DOHMH or DCWP inspection dataset. I did not
query, open, or consult any DOHMH restaurant-inspection or DCWP licensing dataset at any point.**
The commercial entities recorded in §14 are sourced to the Bayside Village BID's own site
[Tier A], to an NYC Parks concession headline [Tier A], or to Wikipedia's pop-culture section
[Tier B] — each is labelled with its source. I recorded **zero** restaurants or bars whose only
support would be an inspection row, because I opened no such dataset. The verifier should note
that this also means I have **no** independently sourced restaurant coverage for Bell Boulevard,
which is the neighborhood's principal dining strip; see §16.

---

## 1. THE FLUSHING MEADOWS CORONA PARK EXCLUSION — RECORDED AND HONORED

I was instructed that Flushing Meadows Corona Park was ruled in wave 3 to belong to no
neighborhood file, and that the eight `Ethos.Seeds.CitiFieldPlaces` holdings inside it (Citi Field,
the Unisphere, the Queens Museum, the New York Hall of Science, the Queens Zoo, the USTA Billie
Jean King National Tennis Center, the New York State Pavilion, the Queens Theatre) are off-limits
to every page in the borough as records and as prose.

**I have recorded none of them as Bayside candidates and I am not proposing any of them.** Bayside
is several miles east of that park and no source I read placed any of the eight in Bayside. This
section exists only to log one live collision the verifier must handle deliberately:

**F1.1 — The Bayside apparitions moved INTO Flushing Meadows Corona Park.** The "Baysiders" /
Our Lady of the Roses movement originated in Bayside and then relocated its vigils to the World's
Fair Vatican Pavilion site inside Flushing Meadows Corona Park. **[B]** extraction from the
*Veronica Lueken* article: her first vision was reported April 7, 1970, and "the Virgin Mary
informed Lueken that: She would appear on the grounds of the old St. Robert Bellarmine Roman
Catholic Church building in Bayside." The extraction gives the second location as "the exedra
monument at the 1964 New York World's Fair Vatican Pavilion site in **Flushing Meadows Park**."
It also gives the Diocese of Brooklyn's November 4, 1986 ruling by Bishop Francis Mugavero that
"a thorough investigation revealed that the alleged 'visions of Bayside' completely lacked
authenticity" and contained "statements which, among other things, are contrary to the teachings
of the Catholic Church."
https://en.wikipedia.org/wiki/Veronica_Lueken

**Note for the verifier, not a verdict:** this is a Bayside-origin subject whose later site sits in
the excluded park. The Bayside half (St. Robert Bellarmine, Bayside) is in-neighborhood; the
Flushing Meadows half is in the jointly-interested area. I am flagging the seam and resolving
nothing. Note also that the Diocese ruling quoted above is a **negative** finding about the
apparitions' authenticity — do not let that word "completely lacked authenticity" be softened or
inverted in any downstream use. I am reproducing the extraction's wording, not endorsing it.

---

## 2. THE BOUNDARY PROBLEM — READ THIS BEFORE §3

Bayside's contested edges run in **two different directions**, and they are not the same kind of
problem. The wave brief warned about Bayside↔Douglaston. That one is real. But the **larger and
better-documented** conflict in my sources is Bayside↔Community Board 7, on the northern
Fort Totten / Bay Terrace peninsula.

### 2A. The eastern edge: Bayside ↔ Douglaston

**F2.1 [B]** Bayside boundary, Wikipedia *Bayside, Queens*: Bayside "is bounded by Whitestone to
the northwest, the Long Island Sound and Little Neck Bay to the northeast, Douglaston to the east,
and Fresh Meadows to the west." The same article's extraction adds that the neighborhood "ends
somewhere north of the Long Island Expressway, although Oakland Gardens and Hollis Hills are
usually considered parts of Bayside," and gives the eastern boundary specifically as the
"Cross Island Parkway."
https://en.wikipedia.org/wiki/Bayside,_Queens

**F2.2 [B]** Douglaston–Little Neck boundary, Wikipedia *Douglaston–Little Neck, Queens*: the
community is "bounded by Cross Island Parkway to the west, Grand Central Parkway to the south, the
New York City-Nassau County border to the east, and Little Neck Bay to the north."
https://en.wikipedia.org/wiki/Douglaston%E2%80%93Little_Neck,_Queens

**F2.3 — The two boundary statements AGREE on the line and that is exactly what creates the
problem.** F2.1 and F2.2 both name the **Cross Island Parkway** as the Bayside/Douglaston divider.
But the Cross Island Parkway runs **north–south straight through the middle of Alley Pond Park**
(see F2.5). So the agreed boundary does not run *around* the marquee park — it **bisects** it.
This is the single most consequential structural fact in this document. It is recorded, not ruled on.

**F2.4 [B]** Internal Douglaston subdivision, same article: "Douglaston is considered the area west
of Marathon Parkway and north of Grand Central Parkway," and Little Neck is "the area east of
Marathon Parkway and north of Grand Central Parkway." The extraction states the community is
"bordered to the west by Bayside" but "does not specify which street or parkway marks this
particular dividing line within the detailed geography section" — i.e. the Douglaston article's
own geography prose does **not** independently confirm the Cross Island Parkway line; that came
from the infobox-level boundary statement in F2.2. The verifier should check whether F2.1 and F2.2
are two independent attestations or one claim propagated.
https://en.wikipedia.org/wiki/Douglaston%E2%80%93Little_Neck,_Queens

**F2.5 [B]** Wikipedia *Alley Pond Park*: "The park is bordered to the east by Douglaston, to the
west by Bayside, to the north by Little Neck Bay, and to the south by Union Turnpike." The same
extraction states: "The Cross Island Parkway travels north-south through the park, while the Long
Island Expressway and Grand Central Parkway travel east-west through the park."
https://en.wikipedia.org/wiki/Alley_Pond_Park

**F2.6 [A]** NYC Parks assigns Alley Pond Park to **two** community boards at once. From the raw
page: `Community Board: 11, 13` and `Zip Code: 11361, 11362, 11363, 11364, 11426`, `Park ID:
Q001GROUP`, `Property Type: Park Group`, council members `Vickie Paladino, Linda Lee`. Note that
NYC Parks does **not** list CB7 for Alley Pond Park, and does not name a neighborhood at all.
https://www.nycgovparks.org/parks/alley-pond-park/history

**F2.7 [B]** Wikipedia *Queens Community Board 11* — the board comprises "Bayside,
Douglaston–Little Neck, Auburndale, East Flushing, Oakland Gardens and Hollis Hills," and is
delimited by "Utopia Parkway to the west, 26th Avenue and Little Neck Bay to the north, the Nassau
County border to the east and Horace Harding Expressway, Clearview Expressway and Grand Central
Parkway to the south." 2010 population given as 116,431.
**Observe:** CD11's own northern limit is given as **26th Avenue and Little Neck Bay** — which
places the Fort Totten peninsula and much of Bay Terrace OUTSIDE CD11. See §2B.
https://en.wikipedia.org/wiki/Queens_Community_Board_11

### 2B. The northern edge: Bayside ↔ Community Board 7 — THE LARGER CONFLICT

This one is documented by **primary city records**, not by aggregators, and it is sharper than the
Douglaston question.

**F2.8 [A]** NYC Parks assigns **Fort Totten Park** to `Community Board: 7` — not 11. Raw page
fields: `Zip Code: 11359, 11360`, `Community Board: 7`, `Park ID: Q458`, `Acreage: 60.39`,
`Property Type: Neighborhood Park`, address line `Cross Island Pkwy. bet. Totten Ave. and 15 Rd.`
https://www.nycgovparks.org/parks/fort-totten-park

**F2.9 [A]** NYC Parks assigns **Little Bay Park** to `Community Board: 7`. `Zip Code: 11357,
11359, 11360`, `Park ID: Q010A`, `Acreage: 55.22`.
https://www.nycgovparks.org/parks/little-bay-park/history

**F2.10 [A]** NYC Parks assigns **Bay Terrace Playground** to `Community Board: 7`.
`Zip Code: 11360`, `Park ID: Q399`, `Acreage: 0.91`, `Property Type: Jointly Operated Playground`.
https://www.nycgovparks.org/parks/bay-terrace-playground/history

**F2.11 [A]** NYC Parks assigns **Clearview Park Golf Course** to `Community Board: 7`.
`Zip Code: 11357, 11360`, `Park ID: Q010`, `Acreage: 110.93`.
https://www.nycgovparks.org/parks/clearview-park-golf-course

**F2.12 [A]** NYC Parks assigns **Crocheron Park** and **John Golden Park** to `Community Board: 11`
(Crocheron `Q012`, 45.79 acres, ZIP 11361; John Golden `Q012B`, 17.00 acres, ZIP 11360/11361).
So the Parks Department is drawing a real, consistent line: Crocheron/John Golden = CB11;
Fort Totten / Little Bay / Bay Terrace / Clearview = CB7.
https://www.nycgovparks.org/parks/crocheron-park · https://www.nycgovparks.org/parks/john-golden-park/history

**F2.13 [A]** The LPC's own Socrata landmark table assigns `cd` = **407** to both Fort Totten
landmarks and `cd` = **411** to all four in-Bayside landmarks. Raw rows:
`"lpc_name": "Fort Totten Officer's Club", "address": "208 Totten Avenue", "cd": "407",
"nta2020": "QN0761"` and `"lpc_name": "Fort Totten Battery", "cd": "407", "nta2020": "QN0761"`,
versus `"lpc_name": "Lawrence Graveyard", "cd": "411", "nta2020": "QN1102"`.
https://data.cityofnewyork.us/resource/buis-pvji.json

**F2.14 [A] — AND YET THE LPC'S OWN PROSE SAYS THE OPPOSITE, TWICE, IN TWO DIRECTIONS.**
The 1974 designation report header reads, verbatim from the PDF:
> "FORT TOTTEN OFFICERS' CLUB, United States Government Reservation, Fort Totten
> Road, Bayside, Queens. Built about 1870; enlarged 1887."

But the 1999 historic-district report's Introduction reads, verbatim from the PDF:
> "Fort Totten occupies a 136-acre site in northeast Queens, **north of Bayside**, on a
> peninsula jutting into the Long Island Sound."

**The same agency calls Fort Totten "Bayside" in 1974 (LP-0827) and "north of Bayside" in 1999
(LP-2040).** This is a direct internal contradiction in the authoritative record and the verifier
must decide it rather than inherit it.
http://s-media.nyc.gov/agencies/lpc/lp/0827.pdf · http://s-media.nyc.gov/agencies/lpc/lp/2040.pdf

**F2.15 [B]** The NRHP listings table for Queens gives **Fort Totten Officers' Club**, address
"Totten and Murray Aves.", neighborhood **"Bayside"**, listed March 17, 1986. The extraction states
this is "the sole property from the provided table that falls within any of the six neighborhoods
you specified." So the federal register also files it under Bayside.
https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York

**F2.16 [A]** The **Bayside Historical Society itself** gives its address as, verbatim:
> "Bayside Historical Society
> 208 Totten Avenue
> Fort Totten
> Bayside, NY 11359"

BHS therefore self-assigns Fort Totten to Bayside. It is also the organization that would know.
https://www.baysidehistorical.org/visit-us

**F2.17 [B]** Wikipedia *Fort Totten (Queens)* declines to pick, listing the fort as proximate to
four neighborhoods: "Bay Terrace, Bayside, Beechhurst and Whitestone."
https://en.wikipedia.org/wiki/Fort_Totten_(Queens)

**F2.18 [B]** Wikipedia *Bay Terrace, Queens*: "It is often considered part of the larger area of
Bayside" — but the same extraction places Bay Terrace in "Queens Community Board 7 (also serving
Flushing, College Point, and Whitestone)." Boundaries given as: west, Clearview Expressway; south,
26th and 28th Avenues; east, Little Neck Bay; north, East River. ZIPs 11359 (Fort Totten area) and
11360. 2010 population 21,751.
https://en.wikipedia.org/wiki/Bay_Terrace,_Queens

**F2.19 [B]** Wikipedia *Throgs Neck Bridge* gives the bridge's Queens landing as **"Bay Terrace,
Queens"** — not Bayside.
https://en.wikipedia.org/wiki/Throgs_Neck_Bridge

**F2.20 [B]** Wikipedia *Douglaston–Little Neck, Queens* refers to the FDNY EMS Training Academy at
Fort Totten as being in "neighboring **Bay Terrace**" (paraphrase of the extraction's wording; the
extraction did not return this as a quoted string). A **third** assignment for the same site.
https://en.wikipedia.org/wiki/Douglaston%E2%80%93Little_Neck,_Queens

**F2.21 [A]** The **Bayside Village BID** describes its own district, verbatim:
> "The Bayside Village Business Development District constitutes an eight block strip between
> Northern Blvd. and 35th Avenue along Bell Blvd. and also includes one block east and one block
> west of Bell Blvd. along 41st Avenue. The District is located in the southern area of Bayside,
> Queens, served by Community Board #11. The District is served by Precinct 111, 152nd Hook and
> Ladder Co., and a sanitation district called Bayside, Queens District #4."

**Flag:** the BID calls this the "southern area of Bayside," yet Northern Blvd–35th Ave is
central-to-northern within the boundaries given in F2.1. Either the BID means "south of the LIRR /
south of the waterfront half," or the wording is loose. Recorded as printed; not resolved.
https://www.baysidevillagebid.com/

**F2.22 [A]** NYC Parks' Bay Terrace Playground history states, verbatim:
> "Bay Terrace, originally included within the bounds of Bayside, remained composed of farms and
> large estates until the 1950s, when Cord and Charles Meyer sold their 225-acre farm for
> development."

A city agency saying Bay Terrace was "originally included within the bounds of Bayside" — i.e.
historically yes, presently a separate CB7 entity.
https://www.nycgovparks.org/parks/bay-terrace-playground/history

---

## 3. CONTESTED PLACES — every place any source assigns differently

Recorded, not resolved. "CD" = the community district a **city dataset** assigns.

| # | Place | Address as given by source | Assignment(s) found | The conflict |
|---|---|---|---|---|
| **C1** | **ALLEY POND PARK** | NYC Parks gives no address; `Q001GROUP`, ZIPs 11361/11362/11363/11364/11426 | Wikipedia: bordered "to the east by Douglaston, to the west by Bayside" [F2.5]. NYC Parks: **CD 11 AND 13** [F2.6]. Neither Bayside nor Douglaston is named as containing it. | **The park straddles. The Cross Island Parkway — the agreed Bayside/Douglaston line [F2.3] — runs north–south through it.** This is the marquee item on the unclaimed list and it belongs to no single one of the three. See §4. |
| **C2** | **Alley Pond Environmental Center (APEC)** | **APEC's own site: "229-10 Northern Blvd. Douglaston, NY 11362"** [A] | APEC self-assigns **Douglaston**. Wikipedia *Alley Pond Environmental Center* says it borders "the Douglaston and Bayside neighborhoods" [B]. | Self-assignment (Douglaston) vs. Wikipedia's both-neighborhoods hedge. The institution's own ZIP 11362 is the Douglaston ZIP. |
| **C3** | **Fort Totten Park / the fort** | NYC Parks: "Cross Island Pkwy. bet. Totten Ave. and 15 Rd." [A] | NYC Parks **CD 7** [F2.8]. LPC Socrata **cd 407**, NTA **QN0761** [F2.13]. LPC 1974 report: **"Bayside, Queens"** [F2.14]. LPC 1999 report: **"north of Bayside"** [F2.14]. NRHP table: **"Bayside"** [F2.15]. BHS: **"Fort Totten, Bayside, NY 11359"** [F2.16]. Wikipedia: "Bay Terrace, Bayside, Beechhurst and Whitestone" [F2.17]. | **Six sources, four different answers, including the same agency contradicting itself 25 years apart.** The heaviest contest in this document. |
| **C4** | **Fort Totten Officers' Club / "The Castle"** | LPC Socrata: "208 Totten Avenue" [A]. LPC 1974 report: "Fort Totten Road" [A]. NRHP: "Totten and Murray Aves." [B] | Same split as C3. **Also the addresses themselves disagree**: "208 Totten Avenue" vs "Fort Totten Road" vs "Totten and Murray Aves." | Neighborhood contested *and* three different street addresses in the record. |
| **C5** | **Fort Totten Battery** | LPC Socrata: address field is literally `"Fort Totten Park"` [A] | LPC `cd 407`, NTA QN0761. LP-00826, designated 9/24/1974. | Same as C3. No street address exists in the city record. |
| **C6** | **Bay Terrace (as a place) & Bay Terrace Playground** | Playground ZIP 11360 [A] | Wikipedia: "often considered part of the larger area of Bayside" but in **CB 7** [F2.18]. NYC Parks playground: **CD 7** [F2.10]. NYC Parks: "originally included within the bounds of Bayside" [F2.22]. | Historically Bayside, administratively CB7. Wikipedia's *Bayside* article claims it as a Bayside sub-neighborhood; Wikipedia's *Bay Terrace* article puts it in CB7. **The two Wikipedia articles conflict with each other.** |
| **C7** | **Little Bay Park** | NYC Parks: bounded by Cross Island Pkwy, Utopia Pkwy, beachfront [A] | NYC Parks **CD 7** [F2.9] — yet the park's own Parks history text is **almost entirely a history of Bayside** (Lawrence grant, the 1780s town-clerk fire, the 1866 railroad, the silent-film colony) [F7.6]. | Administratively CB7; narratively the city tells Bayside's story on this park's sign. |
| **C8** | **Clearview Park Golf Course** | NYC Parks: "202 St., Clearview Exwy., bet. Cross Island Pkwy. and 23 Ave." [A] | NYC Parks **CD 7** [F2.11]. But its own Parks text says it is "bounded by the Clearview Expressway, 23rd Avenue, 202nd Street, and **Bell Boulevard**" [F8.6] — Bell Blvd being Bayside's main street. | CB7 by administration, Bell-Blvd-adjacent by its own boundary description. |
| **C9** | **Throgs Neck Bridge (Queens landing)** | — | Wikipedia *Throgs Neck Bridge*: **"Bay Terrace, Queens"** [F2.19]. NYC Parks' **Little Bay Park** history narrates the bridge at length as a **Bayside** subject: "the Throgs Neck Bridge, which connects **Bayside** with the Bronx" [F8.5]. | Bay Terrace vs Bayside for the same structure. |
| **C10** | **FDNY EMS Training Academy (at Fort Totten)** | — | Wikipedia *Bayside*: "The FDNY EMS Training Academy is in **Bay Terrace** at Fort Totten" [B]. Wikipedia *Douglaston–Little Neck*: in "neighboring **Bay Terrace**" [F2.20]. NYC Parks/LPC put the site in CD7. | Bay Terrace vs Bayside vs CB7. Note both Wikipedia articles say Bay Terrace, so this may be one claim propagated. |
| **C11** | **The Queens Giant (tulip poplar)** | Access "at Horace Harding Expressway and East Hampton Boulevard, near Douglaston Plaza Mall" [B] | Wikipedia *Queens Giant* names **Douglaston**; the tree is inside **Alley Pond Park**, which straddles [C1]. | Douglaston vs Alley-Pond-Park-as-a-whole. It is a fixture of the contested park. |
| **C12** | **Oakland Lake** | — | Wikipedia *Alley Pond Park* describes it as a kettle pond "on former Oakland Golf Club grounds" and "Originally used as **Flushing's** water source" [B]. Wikipedia *Bayside* lists it among Bayside's parks [B]. It lies inside Alley Pond Park [C1]. | Bayside vs Alley Pond Park vs a historical Flushing function. Its **Parks history page was lost to the HTTP-202 rate limit** and must be re-fetched. |
| **C13** | **Oakland Gardens** | ZIP 11364 [B] | Wikipedia *Bayside*: "an upper middle class neighborhood in **southern Bayside**"; and separately "Oakland Gardens and Hollis Hills are usually considered parts of Bayside" [F2.1]. Wikipedia *Queens Community Board 11* lists **"Oakland Gardens"** as its own entry alongside Bayside [F2.7]. | Sub-neighborhood of Bayside, or a peer of Bayside within CD11? CB11 lists it as a peer. |
| **C14** | **Hollis Hills** | — | Wikipedia *Bayside*: "usually considered parts of Bayside" [F2.1]. Wikipedia *Union Turnpike* extraction places Hollis Hills "in Queens Village" and "in the Jamaica district area" [B]. CB11 lists it as its own entry [F2.7]. | Bayside vs Queens Village vs Jamaica vs standalone. **Four assignments.** |
| **C15** | **Bayside Gables** | "near the Bay Terrace shopping center and the Little Neck Bay" [B] | Wikipedia *Bayside* calls it a Bayside sub-neighborhood — but locates it next to **Bay Terrace**, which is CB7 [C6]. | Bayside vs Bay Terrace. |
| **C16** | **Cornelius Van Wyck House** | **Wikipedia: "126 West Dr., Douglas Manor, Queens, New York 11363"** [B]. **LPC Socrata: "37-04 Douglaston Parkway"** [A] | Both say **Douglaston**. Not contested between neighborhoods — **but the two addresses are completely different**, and LPC is the authoritative one. | Recorded here so the verifier can exclude it from Bayside *deliberately* and so the address discrepancy is on record for the Douglaston agent. LP-00144, designated 4/19/1966, `cd 411`, NTA **QN1103**. |
| **C17** | **Benjamin P. Allen House / Allen-Beville House** | "29 Center Drive" [A][B] | Douglaston. LP-00944, 1/11/1977, `cd 411`, NTA QN1103. | Not Bayside. Listed so it is excluded deliberately, not by oversight. |
| **C18** | **Fitzgerald/Ginsberg House** | **"145-15 Bayside Avenue"** [A] | LPC `cd 407`, NTA **QN0704**. Wikipedia's landmark list gives the neighborhood as **"Linden Hill"** [B]. | **A trap.** The street is named "Bayside Avenue" but the building is in Flushing/Linden Hill, CD7. **It is not in Bayside.** Recorded so nobody claims it on the strength of the street name. |
| **C19** | **Cunningham Park** | — | Wikipedia *Cunningham Park*: borders "Oakland Gardens and Fresh Meadows" [B]. Wikipedia *Bayside* lists it among Bayside's parks [B]. Wikipedia *Bayside*: Oakland Gardens is bounded "to the west by Cunningham Park" [B]. | Adjacent to Bayside's southern lobe, not obviously in it. Its Parks history was lost to the rate limit. |
| **C20** | **Bayside Cemetery** | — | Wikipedia search surfaces "Bayside Cemetery" as a Queens article, but it is in **Ozone Park**, not Bayside. | **A name trap.** Flagged so it is not claimed. I did not fetch the article; the verifier should confirm the Ozone Park location before relying on this. |
| **C21** | **Douglaston/Little Neck Q.P.L. branch** | "249-01 Northern Boulevard, **Little Neck**, NY 11363" [B] | Named "Douglaston/Little Neck", addressed Little Neck. | Not Bayside. Logged for the adjacency map. |
| **C22** | **Auburndale Q.P.L. branch** | "25-55 Francis Lewis Boulevard, **Flushing**, NY 11358" [B] | Branch named Auburndale, addressed Flushing, and Auburndale is in **CD11** with Bayside [F13.4]. | Not Bayside. Shows how loosely "Flushing" is used as a postal city out here. |

**Explicit note on the Flushing gap, as instructed:** Flushing sits several miles west of Bayside
and is in a different community district. **I found no source manufacturing a tie between Bayside
and Flushing, and I have invented none.** The only Flushing↔Bayside contacts in my corpus are
(a) the historical fact that colonial Bayside was carved out of the **town** of Flushing [F7.2],
(b) Oakland Lake's former role as Flushing's water source [C12], (c) the postal quirks at C18/C22,
and (d) subway access, since Bayside has no subway and Wikipedia points readers to
Flushing–Main Street [F11.4]. Each is labelled. None of them is a claim that a Bayside place is in
Flushing or vice versa.

---

## 4. ALLEY POND PARK — THE UNCLAIMED MARQUEE ITEM

I was told Alley Pond Park is on the marquee list, is unclaimed, straddles Bayside and Douglaston,
and needs a ruling. **I am not ruling. Here is the complete evidentiary basis for whoever does.**

**F4.1 [B]** Size: "655.294 acres (265.188 hectares)". (Wikipedia *Alley Pond Park*.) **Conflict:**
Wikipedia *Douglaston–Little Neck* calls it "a 635-acre wildlife sanctuary" [B]. 655 vs 635.
https://en.wikipedia.org/wiki/Alley_Pond_Park · https://en.wikipedia.org/wiki/Douglaston%E2%80%93Little_Neck,_Queens

**F4.2 [B]** Boundaries — see F2.5. Bordered east by Douglaston, west by Bayside; Cross Island
Parkway runs north–south through it; LIE and Grand Central Parkway run east–west through it.

**F4.3 [A]** NYC Parks: `Community Board: 11, 13`. **Two boards. Neither is CB7.** Property Type
`Park Group`, meaning it is an umbrella over multiple discrete park properties rather than one
parcel. Council members Vickie Paladino **and** Linda Lee.
https://www.nycgovparks.org/parks/alley-pond-park/history

**F4.4 [B]** Glacial origin: the park "occupies part of a terminal moraine, a ridge of sand and
rock, that was formed by a glacier 15,000 years ago" at the Laurentide Ice Sheet's terminus, with
"scattered kettle ponds formed by melting ice."

**F4.5 [B]** History: originally Matinecock land; English colonization from the 1630s when
"Charles I granted Thomas Foster 600 acres"; mills operated on Alley Creek by the 1700s; the city
acquired the main site **June 24, 1929**; opened **1935** with Mayor Fiorello LaGuardia and Parks
Commissioner Robert Moses attending; wetlands reclamation from **1974**.

**F4.6 [B]** Alley Creek "flows northward through the valley within which the park is located,
emptying into Little Neck Bay" and is "surrounded by some of the last remaining old-growth forest
in Queens."

**F4.7 [B]** Trails: six named trails "from 0.7 to 2.2 miles" — Red, Orange, Blue, White, Yellow,
and Tulip Tree.

**F4.8 [B]** Alley Pond Adventure Course "opened in 2007," with "a climbing wall, a ropes course, a
trust fall area, a zip line, swings, and balance platforms," ropes courses extending "up to 45 feet
above ground."

**F4.9 [B]** Oakland Lake: a kettle pond on former Oakland Golf Club grounds, spring-fed,
"Originally used as Flushing's water source," restored **1987** and **2011**, with a boardwalk
named after Gertrude Waldeyer. (See C12 for the contest.)

**F4.10 [B]** The Queens Giant: tulip poplar (*Liriodendron tulipifera*), "133.8 feet (40.8 m) tall
with a 19-foot (5.8 m) circumference as of 2004," estimated "between 350 and 450 years old,"
"possibly the oldest living thing in the New York metropolitan area" and "the tallest carefully
measured tree in New York City." **Age is disputed in the source itself:** "Some arborists estimate
the tree's age at 250 years, making it younger than other trees in the city," and NYC Parks
acknowledges the "true age may have a margin of error of several decades or centuries." Located in
the southern part of the park, accessible "at Horace Harding Expressway and East Hampton
Boulevard, near Douglaston Plaza Mall." (See C11.)
https://en.wikipedia.org/wiki/Queens_Giant

**F4.11 [B]** Union Turnpike "becomes the southern boundary of Alley Pond Park until it intersects
with Winchester Boulevard."
https://en.wikipedia.org/wiki/Union_Turnpike_(New_York)

**F4.12 [B]** The Long Island Motor Parkway bike path connects "westward to Kissena Park and
eastward to Alley Pond Park as part of the Brooklyn-Queens Greenway."
https://en.wikipedia.org/wiki/Cunningham_Park

**F4.13 [A]** APEC — the park's principal public-facing institution — is **inside** Alley Pond Park
and **addressed to Douglaston**. Verbatim from APEC's own site:
> "The environmental center is located in Alley Pond Park, surrounded by lush nature trails where
> visitors can enjoy NYC's natural landscapes."
> "229-10 Northern Blvd.
> Douglaston, NY 11362"

Also verbatim: "For over 50 years, we have strived to educate children and adults in the New York
metropolitan area, protect and preserve Alley Pond Park, open spaces and waterbodies, and advocate
for sustainable environmental policies and practices." Hours: "Most weekdays, Monday - Friday, APEC
is open from 9:00 am to 4:30 pm. Most weekends, APEC is open from 9:00 am to 1:00 pm."
"Parking and entrance to the building and grounds is free, but we do have a suggested donation of
$5 per person." "Our building is ADA accessible. Our parking lot and walking trails are open from
dawn to dusk, year 'round, even when the center is closed." Phone "(718) 229-4000".
https://alleypond.org/

**F4.14 [B]** APEC founding: "The Alley Pond Environmental Center (APEC) was founded in 1972 by
Joan and Hy Rosner as a grassroots organization that advocated for the park"; the building
"opened in 1976"; it contains "a library, museum and animal exhibits"; renovations began
September 2019 with a temporary relocation **to Oakland Gardens**; by 2011 it had eight staff and
1,000 volunteers and "its programs had served over 62,000 students."
https://en.wikipedia.org/wiki/Alley_Pond_Environmental_Center · https://en.wikipedia.org/wiki/Alley_Pond_Park

**F4.15 [A]** Alley Pond was one of the **three founding objects of the Bayside Historical Society**.
Verbatim from BHS: the Society was founded in 1964 "with three goals: The preservation and
restoration of the Lawrence Family Cemetery, **Alley Pond** and Fort Totten."
This is a documented Bayside-institution claim on the park — recorded as evidence, not as a ruling.
https://www.baysidehistorical.org/about-bhs

**F4.16 [A]** NYC Parks' Crocheron Park page lists "Alley Pond Park (0.95 miles)" among nearby
parks — i.e. Parks treats Alley Pond as a *neighbor* of the Bayside parks, not as one of them.
https://www.nycgovparks.org/parks/crocheron-park

**Summary of the tension, for the verifier only:** the park's own institution addresses itself to
Douglaston [F4.13]; the Bayside Historical Society claims it as a founding cause [F4.15]; the city
splits it across two community boards [F4.3]; the agreed neighborhood line runs through the middle
of it [F2.3]; and Wikipedia says it is bordered by both [F2.5]. Nothing here selects one page.

---

## 5. LANDMARKS — the authoritative record

All rows in this section are **Tier A**, taken from the LPC's own Socrata table and from the LPC
designation-report PDFs I downloaded and converted with `pdftotext`.

### 5A. Individual landmarks the city places in Bayside (CD 411, NTA QN1102)

**F5.1 [A]** **Lawrence Graveyard** — LPC name is "Lawrence Graveyard", **not** "Lawrence
Cemetery". Address per Socrata: "216th Street at 42nd Avenue". **LP-00630**, designated
**8/2/1967**, Individual Landmark, `cd 411`, NTA QN1102, council 19.
Report header verbatim (scanned 1967 PDF; OCR renders "LAWRENCE" as "LA~RENCE"):
> "LA~RENCE GRAVEYARD, 216th Street and 42nd Avenue, Bayside, Borough of Queens.
> Built about 1840."
> "Landmark Site: Borough of Queens Tax Map Block 6290, Lot 100."
http://s-media.nyc.gov/agencies/lpc/lp/0630.pdf

**F5.2 [A]** **35-34 Bell Boulevard** ("the Cobblestone House") — **LP-02154**, designated
**10/19/2004**, Designation List 357, Individual Landmark, `cd 411`, NTA QN1102.
Report header verbatim: "35-34 Bell Boulevard, Queens. / Built 1905-06; architect unknown. /
Landmark Site: Borough of Queens Tax Map Block 6169, Lot 21".
http://s-media.nyc.gov/agencies/lpc/lp/2154.pdf

**F5.3 [A]** **Hawthorne Court Apartments** — "215-37 to 215-43 43rd Avenue and 42-22 to 42-38
216th Street". **LP-02461**, designated **11/25/2014**, Designation List 476, Individual Landmark,
`cd 411`, NTA QN1102. Report header verbatim: "Built 1930-31; Benjamin Braunstein, architect /
Landmark Site: Borough of Queens Tax Map Block 6306, Lot 15".
http://s-media.nyc.gov/agencies/lpc/lp/2461.pdf

**F5.4 [A]** **John William and Lydia Ann Bell Ahles House** — "39-24–39-26 213th Street".
**LP-02341**, designated **4/12/2016**, Designation List 487, Individual Landmark, `cd 411`,
NTA QN1102. Report header verbatim: "Built c.1873; Architect, not determined; altered 1924;
Architect, Lewis E. Welsh / Landmark Site: Borough of Queens Tax Map Block 6236, Lot 18".
**Note the name order differs between sources:** LPC's report title is "JOHN WILLIAM AND LYDIA ANN
BELL AHLES HOUSE"; Wikipedia's landmark list calls it "Lydia Ann Bell and William Ahles House";
the 2009 hearing minutes inside the same PDF call it "the Lydia Ann Bell and J. William Ahles House".
http://s-media.nyc.gov/agencies/lpc/lp/2341.pdf

**That is FOUR individual NYC landmarks in Bayside proper.** The Socrata table for CD411 also
returns Cornelius Van Wyck House and Benjamin P. Allen House, both NTA QN1103 = Douglaston-Little
Neck [C16, C17].

### 5B. Landmarks on the contested Fort Totten peninsula (CD 407)

**F5.5 [A]** **Fort Totten Officer's Club** — "208 Totten Avenue", **LP-00827**, designated
**9/24/1974**, `cd 407`, NTA QN0761. See F2.14 for the report's "Bayside, Queens" header.
**F5.6 [A]** **Fort Totten Battery** — address field "Fort Totten Park", **LP-00826**, designated
**9/24/1974**, `cd 407`, NTA QN0761.
**F5.7 [A]** **Fort Totten Historic District** — **LP-02040**, designated **1999-06-29**, public
hearing 5/4/1999, calendared 1999-04-13, `borough: QN`, status DESIGNATED.
https://data.cityofnewyork.us/resource/skyk-mpzq.json

**F5.8 [A]** The Fort Totten HD report's Boundaries section is a long metes-and-bounds description
beginning: "The Fort Totten Historic District consists of a portion of Queens Tax Map Block 5917,
Lot 1, bounded by a line beginning at a point along the western lot line of Queens Tax Map Block
5917, Lot 1, adjacent to the main entrance to Fort Totten at Totten Avenue…" The district
"includes over 100 buildings and smaller secondary structures built between the 1830s and the
1960s." A footnote records that "The configuration of the district is somewhat smaller than that
eligible for listing on the National Register of Historic Places," and cites a 1998 Army Corps
study titled in part "…**Fort Totten, Bayside, Queens County, New York**" — **another instance of
the federal record calling the site Bayside** [cf. C3].
http://s-media.nyc.gov/agencies/lpc/lp/2040.pdf

**F5.9 [A]** Fort Totten HD hearing testimony, verbatim: "Twelve witnesses spoke in support of
designation, including representatives of Queens Borough President Claire Shulman, the New York
City Fire Department, the **Bayside Historical Society**, the Historic House Trust/New York City
Parks Department, the Queens Historical Society, the Fort Totten Conservancy, the New York
Landmarks Conservancy, the Historic Districts Council, and the Municipal Art Society. Several
speakers urged the Commission to designate the district with larger boundaries."

**F5.10 [A]** Fort Totten HD, later ownership, verbatim: "In 1968, Fort Totten became the home of
the 77th United States Regional Support Command for the Army Reserve, and the United States Coast
Guard took over a portion of the facility in 1969. The United States Department of Labor
established a Job Corps Training Center on a portion of the site in 1971."

### 5C. Historic districts nearby (Douglaston — not Bayside)

**F5.11 [A]** **Douglaston Historic District**, LP-01957, designated 1997-06-24.
**F5.12 [A]** **Douglaston Hill Historic District Amendment**, LP-02255 (boundary note in the data:
"AMENDMENT KNOWN AS BOTH LP-2155A AND LP-02255"), designated 2007-01-30.
Recorded so Bayside does not accidentally absorb them.
https://data.cityofnewyork.us/resource/skyk-mpzq.json

---

## 6. THE LANDMARK REPORTS' OWN NARRATIVE OF BAYSIDE — the richest vein in this document

The 2004 Cobblestone House report (LP-2154) contains a section literally headed **"Bayside,
Queens"**, and the 2016 Ahles House report (LP-2341) another. These are peer-reviewed municipal
history written specifically about this neighborhood. All **Tier A**, verbatim from the PDFs.

**F6.1 [A]** Colonial origin, LP-2154:
> "Prior to European settlement, northeastern Queens was inhabited by the Matinecock Indians. Under
> Dutch governor William Kieft, the land was purchased in 1639. The town of Flushing was
> established in 1645, extending from Flushing Creek to Little Neck Bay. Of the original eighteen
> settlers, two English brothers, John and William Lawrence, acquired the tracts that would
> subsequently be known as Bayside. John Lawrence was twice mayor of New York, in 1673 and 1691.
> Thirteen generations of the Lawrence family would live in Bayside and forty members are buried in
> the Lawrence Graveyard, a designated New York City Landmark, at 216th Street and 42nd Avenue.
> Once a favored site for Lawrence family picnics, the graveyard's first burial occurred in 1832 and
> the most recent was in 1939."

**F6.2 [A]** The Bell farm, LP-2154:
> "Until the last decades of the nineteenth century, Bayside was primarily farmland. The property on
> which the house stands was acquired by Abraham Bell in 1824. A shipping and commission merchant
> operating in lower Manhattan, his firm, Abraham Bell and Company was involved in the cotton trade
> and in transporting immigrants from Ireland during the potato famine of the 1840s."
> "The Bell property covered approximately 246 acres and extended from near the site of the current
> Bayside station of the Long Island Railroad at 41st Avenue to Crocheron Avenue (35th Avenue) and
> from Little Neck Bay to 204th Street. An unpaved lane, known as Bell Avenue (now Bell Boulevard)
> bisected the farm. The east section, closer to Little Neck Bay, was called the lower farm, and the
> west section, the upper farm. Near the center of the property, along Bell Avenue, the Bells built
> a house in 1842… The house was demolished in 1971."

**F6.3 [A]** How Bayside was reached before the railroad, LP-2154:
> "Bayside's growth was closely tied to transportation. Initially, access was from Little Neck Bay,
> by boat, or via a road called the 'Alley' that ran along the shore. When a permanent bridge was
> built connecting Flushing to points west in 1824, Northern Boulevard became the most direct route
> to Bayside and by 1840 there was daily coach service through the area. More importantly, railroad
> service began in 1866. **The Bell family donated the land for the station** and by the 1870s there
> was daily service to Bayside, via ferry to Long Island City, from East 34th Street in Manhattan."

Note "a road called the '**Alley**'" — the origin of the Alley Pond name, in a Bayside-authored
municipal document. Relevant to §4.

**F6.4 [A]** The subway that never came, LP-2154:
> "In the mid-1920s, the tracks that ran through the community were set below grade and a new
> station house was built. At this time, an extension of the recently completed Flushing subway
> line to Bayside was proposed but never executed."

**F6.5 [A]** Rickert-Finlay Realty Company, LP-2154:
> "Founded by Edward J. Rickert (1862-1935) and Charles E. Finlay (1862-1940), the Rickert-Finlay
> Realty Company played an important role in the development of northeastern Queens."
> "Projects of the Rickert-Finlay Realty Company included Norwood in Long Island City,
> Broadway-Flushing in Flushing, Douglas Manor in Douglaston, Westmoreland in Little Neck, and
> Kensington in Great Neck, part of Nassau County."

**Flag for the verifier:** this sentence names a **Nassau County** project (Kensington, Great Neck).
Per the brief, anything in Nassau County / Great Neck / Little Neck is outside the corpus. The
Rickert-Finlay *company* is a legitimate Bayside subject via Bellcourt [F6.6]; its Great Neck and
Little Neck work is not.

**F6.6 [A]** Bellcourt — the subdivision that made modern Bayside, LP-2154:
> "Residential subdivisions began to replace farms in Bayside during the 1870s. In December 1904 the
> last section of the Bell farm was sold – ninety five acres to the Bellcourt Land Company, a
> division of the Rickert-Finlay Realty Company. Sold by Abraham Bell 3rd and Melissa Chambers Bell,
> it consisted of the upper farm, including all land west of Bell Avenue. Abraham had been active in
> community affairs and was said to have been involved in the 'creating, caring for and naming of
> streets,' as well as for establishing the local water system. His son, Brinton Bell (d. 1969), was
> hired by Rickert-Finlay to supervise the Bayside project, as well as to work on Douglas Manor and
> Kensington."

**F6.7 [A]** A period description of Bell Avenue, LP-2154 quoting the *New York Times* of **1903**:
> "…the visitor walks along Bell Avenue, a broad stretch bordered by tall and symmetrical maples,
> offering protection from the hot rays of the sun. In sight of the road are stately old homesteads,
> half hidden by oaks and elms and everything is so refreshingly rural that it is only by an effort
> of the imagination that one can realize that only eleven miles away are skyscrapers and stuffy
> tenements."
(This is a quotation-inside-a-quotation: LPC quoting the NYT. Cite it as such.)

**F6.8 [A]** The Cobblestone House itself, LP-2154 Summary:
> "35-34 Bell Boulevard is a rare example of a house built from cobblestones in New York City.
> Located on a commercial street in Bayside, Queens, construction of the 2½ story structure began in
> late 1905 and was completed in 1906. The architect, who has yet to be identified, adopted various
> features associated with both the Colonial Revival style and the Arts and Crafts movement…
> The walls consist of tan or gray stones that are neither cut, shaped, nor sized. The use of such
> rugged materials, set in concrete, is one of the building's most distinguishing characteristics."
> "Stone walls were frequently used to mark property boundaries and it is possible that cobblestones
> were chosen to evoke Bayside's fleeting agricultural past. To honor the former owners, the
> development was named Bellcourt and pairs of cobblestone pillars were erected along what is now
> Bell Boulevard. **Only the pair on the west side of the intersection at 36th Avenue survives and
> the north pillar is located within the landmark site.** The house, among the earliest built in
> Bellcourt, was owned by Elizabeth A. Adams, of Yonkers, New York, from 1905 to 1922. In subsequent
> years, it was leased for commercial use and converted to apartments in the early 1930s."

**F6.9 [A]** The Ahles House Summary, LP-2341:
> "This impressive Second Empire style residence updated in 1924 with Colonial Revival style
> alterations is a rare reminder of 19th-century Bayside, when it was a village of suburban villas
> and substantial farmhouses. Now located on 213th Street in Bayside, the Ahles House was built only
> a few years after railroad service reached Bayside in 1866 and residential subdivisions began to
> replace farms. **It is the only remaining example of the substantial Second Empire buildings
> erected in Bayside during the 1870s and 1880s.**… **Very few 19th century houses survive in
> Bayside, making the Ahles house a rare example of the period.**"
> "This house was constructed around 1873 by farmer Robert M. Bell for his daughter Lydia (usually
> known as Lillie) and her husband John William Ahles, a prominent grain merchant and officer of the
> New York Produce Exchange. It is located on a portion of a farm that had descended in the Lawrence
> family from the 17th century and was purchased by Robert Bell in 1834, a few years after his
> marriage to Catherine Lawrence."
> "**The house was moved from its original site to its present location in 1924 to allow Christy
> Street now 213th Street to be cut through to 41st Avenue.**"
> "…architect Lewis E. Welsh, a prominent exponent of the Colonial Revival style who specialized in
> the revitalization of Victorian houses, simplified the building's façade by removing the original
> wrap-around porches, bay window, scroll brackets, replaced the original clapboards with stucco,
> and installed new features including porches and moldings…"
> "Today this house is thought to be one of the oldest surviving in Bayside and is considered a
> significant reminder of the neighborhood's past."

**F6.10 [A]** The Ahles designation was **contested by the owner over seven years**, LP-2341
hearing record: a June 23, 2009 hearing at which "The owner's attorney testified and sent a written
submission in opposition to the designation" against eleven supporting speakers "including then
Council Member Tony Avella, the president and several members of the **Bayside Historical Society**,
Joseph Hellman, co-chair of the **CB 11 Landmarks Committee**… and representatives of the
**Auburndale Improvement Association**, the **Douglaston Preservation Association**, Municipal Art
Society, and Historic Districts Council"; then an October 8, 2015 "special public hearing on
Backlog Initiative items in the Borough of Queens"; then, "In March 2016, in a meeting with senior
Commission staff, the owner again expressed his opposition to the designation… He submitted another
letter and additional materials in opposition to the designation on April 11, 2016" — the day
before designation. Support letters came from "**Friends of Oakland Lake & Ravine, Inc.**",
the "Four Borough Neighborhood Preservation Alliance", "Rego-Forest Preservation Council", and
the "Queens Chapter of the American Institute of Architects".

**F6.11 [A]** Hawthorne Court Summary, LP-2461:
> "Originally farmland, Bayside became a commuter suburb with the completion of the railroad tunnel
> to Manhattan in 1910. By the late 1920s and early 1930s, low-rise, suburban garden apartments
> appeared. Incorporating ideas drawn from the British garden city movement with those of the model
> tenement movement in New York, particularly the incorporation of substantial green space, this
> type of garden apartment was well suited to suburban Bayside. The Tudor Revival style Hawthorne
> Court Apartments is a significant example of this type. The respected architect Benjamin
> Braunstein arranged the units in two groups of varying size around a courtyard with meandering
> paths and set back from the streets… **The Hawthorne Court Apartments was awarded for its design
> by the Queens Chamber of Commerce in 1931.**"

**F6.12 [A]** Hawthorne Court physical description, LP-2461:
> "The Hawthorne Court Apartments is a 2½- to 3-story, Tudor Revival style garden apartment complex
> on a nearly square corner lot with historically designed facades of brick laid in monk bond,
> stucco, half-timbering, and clapboard (now largely replaced with vinyl or aluminum siding) in
> various combinations, and slate roofs of different types with copper-flashed ridge lines. The
> units facing 216th Street have high stoops, those facing 43rd Avenue or the courtyard have a
> single step… Both have exaggerated jerkinhead roofs. The historic steel casement windows have been
> replaced…"
This report also records owner opposition at both the 3/22/2011 and 10/28/2014 hearings.

**F6.13 [A]** The 1967 Lawrence Graveyard report, on the setting as it then was:
> "Occupying a corner lot and located in a semi-industrial neighborhood, the rear of the property
> line of this small Cemetery is contained by a factory wall, and a railroad culvert adjoins one
> side of the grounds. Vandalized e few years ago, the forty-eight graves in the cemetery have been
> restored at a considerable expense, shared by heirs of the Lawrence family and civic-minded
> citizens of the **Bayside Historical Society**."
("Vandalized e few years ago" is the OCR's rendering; the source presumably reads "a few years ago".)

**F6.14 [A]** Same report, the patent and the burials:
> "This plot of ground is part of the original patent granted by the Dutch Governor Kieft of New
> Amsterdam to John and William Lawrence and certain other persons, in the year 1645. It has been in
> the possession of the Lawrence famiLy all of this time. One of the original patentees, John
> Lawrence, was twice Mayor of the City of New York (1673 and 1691)."
> "The first burial took place in 1832 and the last in 1925. In 1840 Judge Effingham Lawrence of
> Bayside entered into an agreement with his cousin John B. Lawrence of New York City for the
> dedication of a piece of ground to serve as a burying place…"
> "F~ous people buried in this old Cemetery include Cornelius W. Lawrence, Mayor of the City of New
> York (1834-37), over whose grave stands a shaft in the form of an obelisk. County Judge Effingham
> Lawrence's grave is marked by a large rectangular monolith of stone, set on a stepped base. Other
> members of the Lawrence family interred here include Frederick Newbold Lawrence, President of the
> New York Stock Exchange (1882-1883) and Mary Nicolls Lawrence, second wife of Mayor Andrew H.
> Mickle of the City of New York. Anne Willets, descendant of the City of New York's first Mayor, is
> also buried in this Cemetery."
("F~ous" is OCR for "Famous"; "famiLy" for "family".)

**F6.15 [A]** Same report, a distinctive gravestone:
> "Among the artistically distinguished gravestones is a twin marker, Gothic in style with a
> trefoil-pointed arch surrounded by a foliate carving and surmounted by the carved head of a child
> resting in the bosom of angels wings. It is a handsome and fitting marker to two children who died
> in their infancy, the son and daughter of Clarence and Caroline McKim."

---

## 7. CONFLICTS BETWEEN SOURCES — recorded, not adjudicated

These are the places where my sources contradict each other outright. The verifier must decide each.

**F7.1 — How many graves in the Lawrence Graveyard, and when was the last burial?**
- LPC **1967** (LP-0630) [A]: "the **forty-eight** graves"; "The first burial took place in 1832 and
  the last in **1925**."
- LPC **2004** (LP-2154) [A]: "**forty** members are buried in the Lawrence Graveyard"; "the
  graveyard's first burial occurred in 1832 and the most recent was in **1939**."
- **Bayside Historical Society** (site maintainer) [A]: "a variety of headstones mark the final
  resting place of **forty** members of the Lawrence family, their descendants, and heirs. The first
  burial took place in 1832 and the last in **1939**."
- Wikipedia *Lawrence Cemetery* [B]: "Between forty and fifty graves, with burials beginning in 1832
  and ending in 1939."
**Three different grave counts and two different final-burial years, two of them from the same
agency.** 1832 is the only figure all four agree on.
Sources: http://s-media.nyc.gov/agencies/lpc/lp/0630.pdf ·
http://s-media.nyc.gov/agencies/lpc/lp/2154.pdf ·
https://www.baysidehistorical.org/about-bhs · https://en.wikipedia.org/wiki/Lawrence_Cemetery

**F7.2 — When was the Lawrence land grant, from whom, and how big?**
- LPC 1967 [A]: "the original patent granted by the Dutch Governor Kieft of New Amsterdam to John
  and William Lawrence and certain other persons, in the year **1645**."
- LPC 2004 [A]: "Under Dutch governor William Kieft, the land was purchased in **1639**. The town of
  Flushing was established in **1645**… two English brothers, John and William Lawrence, acquired
  the tracts…"
- NYC Parks, **Little Bay Park** [A]: "in **1644**, **King Charles I of England** gave **16,000
  acres** of land to his countryman **William** Lawrence."
- NYC Parks, **Bay Terrace Playground** [A]: "In 1639, Dutch Governor Willem Kieft (1597-1647)
  purchased the land that today encompasses Queens County from the Matinecock. **William Lawrence
  (1622-1680)**, who served as a magistrate under Dutch and English administrations, was granted a
  parcel of land by **King Charles II in 1645**…"
- Wikipedia *Bayside* [B]: "the Dutch West India Company encouraged Dutch farmers to settle on land
  grants" around **1637**; "William Lawrence built the first permanent building, a stone farmhouse,
  when he settled Bayside in **1644**."
- Wikipedia *Lawrence Cemetery* [B]: "deeded to John Lawrence (1618–1699) and his brother William
  Lawrence (1622–1680) in **1645** by Governor Willem Kieft."
- BHS [A]: "part of the original land deed granted by Governor Willem Keift of New Amsterdam in
  **1645** to John Lawrence (1618–1699)."
**Six sources give 1637 / 1639 / 1644 / 1645; the grantor is variously Kieft, Charles I, Charles II,
and the Dutch West India Company; the grantee is variously William alone or John and William.**
Two NYC Parks signs, in parks a mile apart, contradict each other on both the year and the monarch.
This is the messiest factual knot in the neighborhood and nothing should be asserted from it
without the verifier choosing a source.

**F7.3 — When did the Crocheron hotel burn?**
- NYC Parks [A]: "The Crocheron House burned down in **1907**."
- Wikipedia *Bayside* [B]: "the Bayside House, owned by Joseph Crocheron, was well known for its
  clambakes. It burned down in **1906**."
Also note the two sources give the building **different names** — "Crocheron House" (Parks) vs
"the Bayside House" (Wikipedia).

**F7.4 — When was the Castle built?**
- LPC LP-0827 (1974) [A]: "Built **about 1870**; enlarged **1887**."
- BHS [A]: "Since 1984, BHS has been located at The Castle in Fort Totten Park. **Built in 1887**,
  the building was originally used by the U.S. Army Corps of Engineers as their Officers' Mess Hall
  and Club." Elsewhere on the same page: "**Completed in 1887**, the building served as the base
  Officers' Mess Hall and Club…"
- Wikipedia *Fort Totten Officers' Club* [B]: "Built in the 1870s and expanded to its present size
  in 1887."
- Wikipedia *Fort Totten (Queens)* [B]: designed by Robert E. Lee "though 'not built until the
  1870s.'"
**Note also:** the Wikipedia *Fort Totten Officers' Club* extraction explicitly states "Robert E.
Lee is not referenced anywhere in the content provided," while the Wikipedia *Fort Totten (Queens)*
extraction attributes the design to Lee. **The Robert E. Lee attribution appears in one Wikipedia
article and is absent from the other, and does not appear in LPC's LP-0827 at all.** LP-0827
attributes the *fort's* 1857 design elsewhere. Treat the Lee-designed-the-Castle claim as
unsupported by any primary source I reached.
Sources: http://s-media.nyc.gov/agencies/lpc/lp/0827.pdf · https://www.baysidehistorical.org/about-bhs ·
https://en.wikipedia.org/wiki/Fort_Totten_Officers%27_Club · https://en.wikipedia.org/wiki/Fort_Totten_(Queens)

**F7.5 — Alley Pond Park acreage:** 655.294 acres [B, *Alley Pond Park*] vs "635-acre" [B,
*Douglaston–Little Neck*]. See F4.1.

**F7.6 — Whose history is on Little Bay Park's sign?** NYC Parks' Little Bay Park history text
[Tier A] is, in substance, a history of **Bayside**, on a park that Parks itself files under CB7.
Verbatim excerpts:
> "The Mantinecock tribe originally inhabited the shores of Little Bay."
> "There is little available information about Bayside for the hundred years between 1683 and 1780.
> A fire in the town clerk's home in the 1780's destroyed much of Bayside's pre-Revolutionary
> documents. New York State Attorney General Aaron Burr (1756-1836) linked the fire to arsonists,
> whom he put on trial. During the Revolutionary War (1776-1783), the area was predominantly Tory
> and was occupied by British Troops. The political sympathies of the area prompted two unsuccessful
> attacks by Patriot raiders who traveled by whaleboat from New Rochelle."
> "In 1866, the North Shore Railroad was extended through Bayside. Soon after, the dozen families
> who owned land in Bayside sold their holdings to real estate developers. During the succeeding
> three decades, prominent New Yorkers constructed extravagant mansions in the region. By the turn
> of the century, Bayside had also become an enclave for actors who worked for the burgeoning film
> industry located in Manhattan and Long Island City. Moviemaking migrated to California in the
> 1920's, and the community supported itself on the lucrative Little Neck shellfish beds."
> "Today Bayside is a prosperous residential community linked to the rest of New York City by the
> Long Island Railroad and the Throgs Neck Bridge."
("Mantinecock" is the sign's own spelling; every other source spells it "Matinecock". Note also
the sign spells "Throg's Neck Bridge" with an apostrophe later in the same text.)
https://www.nycgovparks.org/parks/little-bay-park/history

**F7.7 — Where did the silent-film stars work?** Wikipedia *Bayside* [B]: "During the 1920s and
1930s, there were several movie studios in **Astoria**, and movie stars such as Rudolph Valentino,
Gloria Swanson, Norma Talmadge, W.C. Fields, and Charlie Chaplin lived in Bayside." NYC Parks
Little Bay [A]: "an enclave for actors who worked for the burgeoning film industry located in
**Manhattan and Long Island City**." The two disagree on where the studios were. Either way **the
studios were not in Bayside** — the residences were. Any prose must not imply Bayside had studios.

---

## 8. PARKS AND THE WATERFRONT

**F8.1 [A]** **Crocheron Park** — NYC Parks address line: "214 Pl., 214 La., 215 Pl, Cross Island
Pkwy. bet. 33 Ave. and 35 Ave." `Acreage: 45.79`, `Zip Code: 11361`, `Community Board: 11`,
`Park ID: Q012`, `Property Type: Community Park`. Description verbatim:
> "This charming, dog-friendly park on the shores of Little Neck Bay has facilities for baseball,
> basketball, and tennis, and includes a playground for kids and a scenic pond at the southern end.
> The park looks out to the bay and offers access via a pedestrian bridge to the waterfront."
Facilities listed: Baseball Fields, Basketball Courts, Dog-friendly Areas, **Pickleball Courts**,
Playgrounds, Public Restrooms, Spray Showers. Highlights listed: "Buz O'Rourke Playground",
"Crocheron Park", "**Joe Michaels Mile**", "The Asian Longhorned Beetle - Crocheron Park".
Vital Signs: "Park Condition Score 89", "Recent Investment $8.7M", "Mapped Trees 605",
"**No natural areas present at this site.**"
https://www.nycgovparks.org/parks/crocheron-park

**F8.2 [A]** Crocheron Park history, verbatim:
> "This was the site of Crocheron House, a hotel built in the 1850s on the shores of the Little Neck
> Bay, that was a popular destination for politicians and celebrities. The Crocheron House burned
> down in 1907, and the estate remained unused and undeveloped for almost 20 years."
> "In the days when the Tweed Ring ruled city government (1866-1871), this park was known as a
> political gathering place. The infamous William 'Boss' Tweed (1823-1878) knew the area well and
> **took refuge here after he escaped from the Ludlow Street Jail in 1875**."
> "In 1924, the City of New York bought the land where the hotel once stood. The following year, at
> the request of the **Bayside Civic Association**, the City purchased another 45 acres and drew up
> plans to build a park on the consolidated property. By 1936, the City had turned the area into a
> park with picnic grounds, winding walks, an enlarged lake for wintertime skating, and thousands of
> trees."
> "Since 1936, fields of saplings have grown into a veritable forest, and Parks has added a
> playground, a dozen tennis courts, a baseball diamond, and a field house. In addition, visitors can
> also take in the splendid views of Little Neck Bay from either of the **hexagonal gazebos that
> stand on the bluff**."
> "In 2020, the ballfields were reconstructed with natural turf, new fences, and accessible paths and
> dugouts."
> "This park is named for Joseph Crocheron (1824-1896), a businessman, hotelier, and racehorse owner
> from **Staten Island**. The Crocheron family immigrated from Europe in the late 1600s and settled
> in Staten Island where they remained for many generations. Joseph was an 8th generation descendant
> of the family and owner of the hotel that was on the property, who moved to Queens from Staten
> Island."
https://www.nycgovparks.org/parks/crocheron-park/history

**F8.3 [A]** **John Golden Park** — `Acreage: 17.00`, `Zip Code: 11360, 11361`, `Community Board: 11`,
`Park ID: Q012B`. The Parks history is a full biography; the Bayside-specific passages, verbatim:
> "Known as '**Mr. Bayside**,' John Golden (1874-1955) was recognized as the dean of Broadway
> producers and a patriarch of New York City show business."
> "In 1916 he produced his first Broadway show, Turn to the Right. Following its tremendous success,
> Golden produced over 150 plays and musicals. These included The First Year, Three Wise Fools, and
> Lightnin', which established a record (since broken) of 1291 performances on Broadway. Golden also
> worked as a playwright and composer. Among the many musical numbers he wrote were 'Poor Butterfly'
> and 'Goodbye, Girls, I'm Through.'"
> "Golden was one of the founders of the American Society of Composers, Authors, and Playwrights
> (ASCAP) in 1914 and served on the original Board of Directors of the City Center of Music and
> Drama. He was an eminent member of the theatrical fraternity known as the Lambs Club and served as
> 'Shepherd' of that group from 1942 to 1944."
> "**He and his wife Margaret moved to Bayside in 1920** and subsequently made their estate available
> to the community. The well-maintained grounds were often used by neighborhood residents, including
> golf caddies practicing their swings, little leaguers playing baseball, and Sunday picnickers
> walking among the gardens. **Some Bayside residents remember seeing Golden strolling in his white
> suit, broad-rimmed hat, and spats, carrying a silver-handled cane.**"
> "Upon his death on June 17, 1955, Golden's will bequeathed his Bayside estate to the City of New
> York as a park 'for the use and enjoyment by the young people of the community of all races and
> creeds in a manner similar to that in which I made this property available for recreation and
> community acts during my lifetime.'"
> "The dedication of John Golden Park took place on **October 18, 1965**. The speakers included Mayor
> Wagner, Robert Moses, Parks Commissioner Newbold Morris, department store owner Bernard F. Gimbel,
> President of Actors Equity Association Frederick O'Neal, cartoonist Rube Goldberg, comedian Harry
> Hershfield, and restaurateur Vincent Sardi Jr."
> "The park was laid out with curving paths that linked up to those in neighboring **Crocheron Park**."
> "Since 1983 members of the **John Golden Park Block Association** have planted trees, organized
> yearly picnics, and helped to beautify the park. They rededicated the park and installed a plaque
> in memory of Mr. Golden in 1995."
> "Another plaque, placed at a park ballfield in 1996, honors the memory of **Tony DePhillips
> (1912-1994)**. DePhillips played basketball for the New York Whirlwinds (predecessors of the
> Knicks) and baseball for several farm teams of the New York Yankees, as well as for the Cincinnati
> Reds. From his **Bayside sporting goods store**, he founded DePhillips Athletic League, **the first
> little league in Queens, in 1949**."
Note the internal quote in Golden's will is LPC-style quotation-inside-quotation; cite accordingly.
https://www.nycgovparks.org/parks/john-golden-park/history

**F8.4 [A]** **Little Bay Park** — bounded by "Cross Island Parkway and Utopia Parkway. The third
boundary is beachfront." "Parks acquired the property via condemnation in **September 1950**."
"Previously known as **Clearview Park**, Parks assigned the property's present name in **1973**."
"The southern viaduct of the Throg's Neck Bridge intersects Little Bay Park, limiting its use as a
beach, but the park still offers splendid views of Little Bay, the East River, and the bridge
itself." July 1998: "a $666,000 renovation sponsored by Council Member Michael J. Abel"; August
1999: "a further $1.2 million renovation that provided a roller hockey rink and a shoreline bicycle
path (designated as part of the **New York City Greenway**)." "The park boasts two football/soccer
fields, a baseball field, and sitting areas along the shore." `Acreage: 55.22`.
https://www.nycgovparks.org/parks/little-bay-park/history

**F8.5 [A]** The Throgs Neck Bridge, per the Little Bay Park sign:
> "In 1955, the Triborough Bridge and Tunnel Authority decided to build the bridge, which connects
> **Bayside** with the Bronx, in order to accommodate the excess traffic on the Bronx-Whitestone and
> Tribororough Bridges. Othmar H. Ammann, who designed the George Washington (1931) and
> Bronx-Whitestone (1939) Bridges, drew up the plans. The Federal Aid Highway Act of June 1956
> provided aid and construction began in October 1957. Completed in **1961** at a cost of
> **$92,000,000**, the Throgs Neck Bridge has a maximum capacity of 30,000,000 million vehicles per
> year. The main suspended span extends 1,800 feet, which is connected to land by a 6,400-foot
> viaduct at the bridge's northern approach and by another 4,100-foot at the southern end. **The
> Clearview Expressway, which was completed in 1963, connects traffic to the bridge.**"
("Tribororough" and "30,000,000 million" are the sign's own errors, reproduced as printed.)
Cross-check [B]: Wikipedia gives the opening as **January 11, 1961**, groundbreaking
**October 22, 1957**, main span 1,800 ft, 2,910 ft between anchorages, "over 2.1 miles" with ramps,
and the Bronx side connecting to Throggs Neck "with a 3,900-foot approach ramp that curves over
SUNY Maritime College at Fort Schuyler." See C9 for the neighborhood contest.

**F8.6 [A]** **Clearview Park Golf Course** — NYC Parks address "202 St., Clearview Exwy., bet.
Cross Island Pkwy. and 23 Ave."; `Acreage: 110.93`, `Community Board: 7`, `Park ID: Q010`.
History verbatim:
> "Clearview Park and Golf Course was founded in 1925, and is bounded by the Clearview Expressway,
> 23rd Avenue, 202nd Street, and Bell Boulevard. Originally named the **Clearview Golf and Yacht
> Club**, the establishment served as an exclusive retreat for New Yorkers. One notable member was
> the renowned New York State Governor **Alfred E. Smith (1873-1944)**. Landscape architect **Willie
> Tucker** designed the golf course, which lies on gently rolling terrain. The course is located by
> Little Neck Bay and is aptly named for its views of the East River and the Long Island Sound."
https://www.nycgovparks.org/parks/clearview-park-golf-course

**F8.7 [A]** **Bay Terrace Playground** — history verbatim:
> "The area's earliest known inhabitants were the Matinecock, a tribe of the Algonquin nation. The
> tribal name Matinecock, meaning '**hilly country**,' described the surrounding landscape, an area
> that may have been given to the tribe by the neighboring Lenapes."
> "In 1954, the land for this playground and adjacent school were conveyed to the City of New York by
> the **Cord Meyer Development Company**, which built two apartment buildings across the street."
> "This playground is a Jointly Operated Playground (JOP) serving **P.S. 169 Bay Terrace School** and
> the local community. Beginning in 1938, the Board of Education (now the Department of Education)
> agreed to provide land next to schools where NYC Parks could build and maintain playgrounds…
> Joint operation of this playground was approved in **1958**, and the playground opened in **1962**…"
> "NYC Parks named to Bay Terrace Playground in 1985, after the surrounding neighborhood. **Bay
> Terrace takes its name from its location along the shores of Little Neck Bay.**"
("named to Bay Terrace Playground" is the sign's own wording.)
https://www.nycgovparks.org/parks/bay-terrace-playground/history

**F8.8 [A]** **Fort Totten Park** — NYC Parks description verbatim:
> "A pristine stretch surrounding a preserved Civil War fortress, Fort Totten Park provides not only
> recreation and relaxation but a fascinating glimpse into New York's past."
> "Year-round, New Yorkers flock to Fort Totten Park to enjoy its special events, natural wonders,
> and historic buildings. On hot summer days, swimmers can take a dip in the pool and sunbathe around
> its grassy edges, or take canoes out and paddle along the Long Island Sound. During the winter,
> bird enthusiasts congregate to watch migrating waterfowl rest before their long journey south. And
> exploring the fortress and its surrounding buildings remains a unique adventure during any season."
> "**Urban Park Rangers lead regular tours of the fortress** and the wildlife surrounding it for
> those who enjoy guided treks, and a visitors' center inside the park provides helpful information
> on the park's past for those prefer to scout alone."
Facilities: "Great Trees, Natural Areas, Nature Centers, Outdoor Pools, Playgrounds, Soccer Fields."
Highlights: "**Fort Totten**", "**Thorne-Wilkins Cemetery**". Vital Signs: "Park Condition Score 84",
"Recent Investment $7.6M", "Mapped Trees 403", "**25.3 Acres of Natural Areas**". Contact:
"Northeast Queens Administrators Office : (718) 352-4793". The page links out to "Bayside Historical
Society". **Note the Thorne-Wilkins Cemetery** — a second historic burial ground in the corpus,
which I could not research further (see §16).
https://www.nycgovparks.org/parks/fort-totten-park

**F8.9 [B]** Fort Totten military history, Wikipedia: land "purchased by the U.S. Government in 1857
from the Willets family"; construction began 1862; initial design "from Robert E. Lee in 1857 and
modified during construction by Chief Engineer Joseph G. Totten"; "named in 1898 after former Chief
of Engineers Major General Joseph Gilbert Totten." Batteries listed: "King, Mahan, Graham, Sumner,
Stuart, Baker, Burnes." "A mine casemate, part of a controlled underwater minefield, was also built
circa 1900, replacing an experimental 1876 casemate." Current occupants per the extraction: NYC
Parks (primary owner), NYPD, "the FDNY as a training center", "US Coast Guard Auxiliary, Flotilla
12-1", and the U.S. Army Reserve.
https://en.wikipedia.org/wiki/Fort_Totten_(Queens)

**F8.10 [A]** Fort Totten's pre-military history, LP-0827 verbatim (OCR noise marked):
> "The history of the area occupied by Fort Totten can be traced back to 1640. For many years, the
> point of land jutting out into the Sound was known as '**Thorne's Neck**,' after an early owner,
> William Thorne, Jr. Members of the Thorne family became prominent citizens of Flushing… In 1823,
> **Charles Willet**, a descendant of a family which had migrated from Suffolk, England, to Long
> island in 1660, purchased Thorne's Point and the area then became known as '**Willet's Point**.'
> Willet, one of the first nursery~en in the vicinity of Flushing, died in 1832 and **his grave is
> located just inside the entrance of the post**."
> "The Wille.t land was sold to the United States Government on **May 16, 1857** by George Irving, a
> resident of Little Neck and a broker at the Merchants' Exchange in New York, for the sum of
> **$200,000**, a price which occasioned a scandal at the time and prompted an abortive
> Congress~onal investigation. In 1863 the government acquired additional acreage from Henry Day."
> "During the Civil War, part of the reservation was used as a depot for recruits and a camping
> ground for volunteer units; in 1864 a hospital was built which served over **5,000 wounded Union
> soldiers**. In 1865 three companies of the Battalion of Engineers arrived at the 'Fort at Willet's
> Point' as the first permanent garrison. In 1868, the War Department established an **engineering
> school** here and in 1870 the fort became the **Engineers Depot for the entire Eastern United
> States**."
> "In 1898, the reservation was designated by President McKinley as 'Fort Totten' in honor of General
> Joseph G. Totten, Chief of Army Engineers from 1838 until his death in 1864…"
("nursery~en" = "nurserymen"; "Congress~onal" = "Congressional"; "Wille.t" = "Willet".)
**Note the grave of Charles Willet inside the post entrance** — a specific, visitable detail.
http://s-media.nyc.gov/agencies/lpc/lp/0827.pdf

**F8.11 [A]** The Castle's architectural significance, LP-0827 verbatim:
> "The Fort Totten Officers' Club, a large frame building in the picturesque, Gothic Revival
> castellated style, represents an important phase of American 19th-century architectural tradition.
> It is located in one of the most beautiful military reservations on the Northeastern seaboard and,
> indeed, the entire complex seems far removed from the crowds and noise of the City."

**F8.12 [B]** Wikipedia *Little Neck Bay*: "about a mile wide at the entrance and extends back just
under two miles"; "only 12 feet (3.7 m) deep at the entrance, with most of the back bay being less
than 6 feet (1.8 m) deep"; Fort Totten sits at the entrance's western point (Willets Point), Elm
Point on the east; "Alley Creek drains into the bay"; "Saddle-rock oysters are also found in the
bay"; from the 1860s–1890s small hard clams from the bay were served at premier restaurants,
establishing "**littleneck**" as a size category for all hard clams; "**The bay was closed to
harvesting in 1909 due to pollution.**"
**Flag:** the bay is the Bayside/Nassau interface. "Elm Point", "Saddle Rock" and the Great Neck
peninsula named in this article are **Nassau County** and outside the corpus.
https://en.wikipedia.org/wiki/Little_Neck_Bay

**F8.13 [B]** Wikipedia *Bayside* parks list: Crocheron Park, Alley Pond Park, Little Bay Park,
Cunningham Park, Throgs Neck Park, John Golden Park, Raymond O'Connor Field, Marie Curie Park,
Fort Totten, Bay Terrace Playground, Oakland Lake. Several of these are contested — see §3.
NYC Parks' "Other Parks Nearby" lists also name **Bayside Fields**, **Raymond O'Connor Park**,
**Marie Curie Playground**, **Willets Point Playground**, **Playground Twenty One**, and the
**Buz O'Rourke Playground** [A]. Note Wikipedia says "Raymond O'Connor **Field**" and "Marie Curie
**Park**" where NYC Parks says "**Park**" and "**Playground**" respectively.

---

## 9. INSTITUTIONS

### Bayside Historical Society — all Tier A, from its own site

**F9.1 [A]** Mission, verbatim:
> "Bayside Historical Society was founded in 1964 to collect, preserve, and disseminate information
> concerning the history of Bayside, Queens, and its adjacent communities; advocate for the
> preservation and protection of its most historic structures and distinctive neighborhoods through
> the landmarking process; and strive to develop a broad constituency of like-minded preservation and
> educational organizations to protect the historic integrity of our communities and collections."

**F9.2 [A]** Founding, verbatim:
> "The birth of the Bayside Historical Society was the culmination of several committees initiated by
> its founder, **Joseph H. Brown**. His aims were the beautification and protection of the
> environment and community in which he lived, and awakening civic pride in Bayside's long history.
> In 1964, with Brown's leadership, the Society was officially founded by a small group of
> like-minded residents with three goals: The preservation and restoration of the Lawrence Family
> Cemetery, Alley Pond and Fort Totten."

**F9.3 [A]** The Castle, verbatim:
> "Between 1880 and the first decades of the twentieth century, permanent structures replaced the
> temporary wood frame buildings erected on the Fort at Willet's Point in the 1860s. New construction
> included family housing, barracks, a hospital, offices, storerooms, laboratories, workshops, a fort
> museum, YMCA and a theater. **Virtually all of the buildings constructed during this period have
> survived.** Among them, arguably the most distinctive structure is The Castle, and is one of the
> finest surviving examples in New York City of the Gothic Revival castellated style architecture.
> Perhaps the greatest significance of The Castle is the direct architectural tribute it pays to the
> emblem of the U.S. Army Corps of Engineers, who centered most of their activities at Willet's Point
> from 1866 to 1902."
> "Completed in 1887, the building served as the base Officers' Mess Hall and Club for the U.S. Army
> Corps of Engineers **School of Application**. The School of Application had been established at
> Willet's Point on an unofficial basis after the engineers left West Point in 1866. It was granted
> formal status as the Army's post-graduate school in military engineering by **Secretary of War,
> Robert Todd Lincoln, son of the late President**, following a tour of inspection in 1884. The Army
> Engineers only used the building for 15 years. In 1902 they moved personnel and materials, to
> Washington Barracks at the Nation's Capital. Following the departure of the Corps, the building
> remained in use by the Army for the next 65 years during the intense activity of two World Wars.
> **From 1970 to 1974 the building was a New York City Job Corps Center**, and was designated a New
> York City landmark on September 24, 1974. When the Job Corps relocated, it stood unoccupied for
> over ten years."
> "In 1986 The Castle was placed on the State and National Registers of Historic Places. By that
> time, the Bayside Historical Society had undertaken the responsibility of restoring it…"
Captions on the same page, verbatim: "The Castle was initially painted white but by the beginning of
the 20th century, **the exterior was changed to scarlet with white trim in order to reflect the
Corps' official colors**." · "The Castle's second major exterior restoration campaign was completed
by 2006."
https://www.baysidehistorical.org/about-bhs

**F9.4 [A]** Visiting, verbatim:
> "MUSEUM HOURS / Weekdays & Weekends: By appointment; call 718-352-1548…"
> "OFFICE HOURS / Weekdays: 10am-3pm, Monday-Friday"
> "A suggested $5.00 donation helps defray BHS's operating expenses and maintain the Castle."
> "The Castle has a wheelchair accessible ramp with first floor access and a wheelchair accessible
> restroom. There is no elevator to the second floor, but there is a chair stair lift in place."
> "**The entrance to Fort Totten is located at the corner of Bell Boulevard and 212th Street.**"
> "Free parking is available at the Little Bay Park parking lot, located just outside the Fort Totten
> entrance at 212th Street and the Cross Island Parkway. From there, it's a short walk into the Fort
> to the Bayside Historical Society (Building #208). Once inside the park, BHS is the fourth building
> on the right."
> "Bus: Take the **Q13 or Q16** to the Fort Totten stop."
> "LIRR: Take the Port Washington Branch to Bayside; from there, take a taxi or rideshare, or the Q13
> bus to Fort Totten Park."
https://www.baysidehistorical.org/visit-us

**F9.5 [A]** Tours, verbatim: "BHS staff and volunteers are hosting guided tours of The Castle and
its exhibitions on the **second Sunday of each month from 1:00 PM – 3:00 PM. Admission is free**…
Each tour lasts approximately 45 minutes, with the first tour starting at 1:00 PM and the second at
2:00 PM." And: "Guided tours of the Lawrence Cemetery in Bayside can accommodate groups up to 40
participants. Tours are approximately one hour long. The cost is free. Please note that there is no
seating or restrooms at the cemetery." The page also lists "**Open House NY**" participation.
**Time-sensitive:** the page listed specific 2026 dates ("September 13", "Open House NY: October
18", "Saturday, October 17") which will go stale; do not hard-code them.
https://www.baysidehistorical.org/community-history-tours

**F9.6 [A]** Programming, verbatim from the BHS home page: "Changing and permanent exhibits stimulate
interest in the history and culture of **northeast Queens**." · "BHS offers researchers of all ages
public access to its extensive repository of archival materials that document the history and
heritage of the communities of **Bayside and Northeast Queens**." · "From weekly yoga classes and
sewing group meetups to gardening sessions, local history observances, and volunteer opportunities
as Castle tour docents and education program assistants…" · "**The Castle is available for private
rental**… for weddings, family celebrations, birthday and anniversary parties, reunions…"
The site's tagline is "**HOLD THE PAST FOR THE FUTURE**." Its sitemap also reveals recurring
programs: a "**Passport Concert Series**", "**Totten Trot 5K Foot Race**", oral histories, a
"Bayside Woman's Club Cookbook" project, and a "vintage postcards of Bayside" collection.
https://www.baysidehistorical.org/

**F9.7 [A]** Immigration programming, verbatim:
> "Except for our indigenous peoples, everyone who has settled in Bayside has come from somewhere
> else. From John and William Lawrence, two of the original 18 patentees of Flushing, or Vlissengen,
> who came here from England in the 1600s, to the wealth of immigrants from all nations who followed,
> Bayside has welcomed countless waves of hopeful travelers in search of greater opportunities."
> "Follow the links below to learn more about the experiences of immigrants in Bayside, through oral
> histories, cultural celebrations, dance and music performances, and a selection of artwork created
> by local elementary school students…"
> "Funding provided by Council Member Vickie Paladino. This program is supported, in part, by public
> funds from the New York City Department of Cultural Affairs in partnership with the City Council."
The associated video series includes a segment titled "**St. Josaphat's: A Polish Parish in
Bayside**" — the only lead I found on a specific Bayside immigrant congregation, and I could not
research it further (see §16).
https://www.baysidehistorical.org/immigration-cultural-diversity · /immigrant-bayside

**F9.8 [A]** Preservation advocacy, verbatim:
> "Queens, when compared with Manhattan and Brooklyn, has very few landmarks and landmark districts."
> "In March 2024, the Bayside Historical Society was accepted by the Historic Districts Council (HDC)
> as a priority NYC neighborhood for preservation via their **Six to Celebrate** campaign. HDC is the
> leading advocate for landmarking and preservation in NYC, having played a vital role in every
> landmark designation in Bayside, including **the Cobblestone House**."
> "HDC will collaborate with BHS to expand upon our efforts since the 2016 designation of the Ahles
> House, continuing to survey, research, and compile a list of significant sites for preservation and
> designation consideration."
**Note:** "the Cobblestone House" is BHS's own name for 35-34 Bell Boulevard [F5.2].
https://www.baysidehistorical.org/landmarking-preservation

### Queensborough Community College

**F9.9 [B]** Wikipedia: located in Bayside; "Established in 1959 as a State University of New York
campus," then "transferred to CUNY" in 1965; "**The 37-acre campus was constructed on the site of
the former Oakland Golf Club**"; "ten major buildings"; "More than 12,000 students" and
"approximately 775 instructional faculty members"; the QCC Art Gallery was established 1966 and
"opened in its present location - historic 1920s Oakland Building" in 1981, renovated 2004; the
Queensborough Performing Arts Center (QPAC), founded 1963, "seats more than 1,000 people" and was
renovated 2023-2024; the campus has "an astronomy observatory."
**Cross-reference:** the Oakland Golf Club also gave its name to **Oakland Lake** [F4.9] and
**Oakland Gardens** [C13] — one vanished golf club underlies three present-day names.
https://en.wikipedia.org/wiki/Queensborough_Community_College

**F9.10 [A]** The Harriet & Kenneth Kupferberg Holocaust Center's own mission statement, verbatim:
> "Our mission is to use the lessons of the Holocaust to educate current and future generations about
> the ramifications of prejudice, racism, and stereotyping. **The KHC is neither a museum nor a
> library: we are a learning laboratory** where students, survivors, and community members learn
> through their hearts, minds, and actions. In doing so, we teach and empower citizens how to become
> agents of positive social change in their lives and in their communities. We host a range of
> programs about Holocaust memory and its ongoing impact… through annual commemorations, public
> programs, student-focused initiatives, our National Endowment for the Humanities (NEH) colloquia
> led by QCC faculty, and **tours of our exhibitions**."
**Note that disclaimer carefully** — the KHC explicitly denies being a museum. Do not describe it
as one.
https://www.qcc.cuny.edu/khc/

**F9.11 [A]** QCC Art Gallery, from its own site: describes itself as "a vital educational and
cultural resource for Queensborough Community College, the Borough of Queens and the surrounding
communities" [via the QCC cultural-centers blurb]. Exhibit titles current at fetch time included
"The Art of Central Africa: Forms & Traditions", "Carole A. Feuerman: From Line to Life",
"Visual Archaeology", and "The Call that Changed Everything: Honoring EMTs and Paramedics 25 Years
Later". **Exhibit titles are ephemeral; do not hard-code them.** The permanent Central Africa
holding is the one that looks like a standing collection rather than a rotation, but I did not
confirm that.
https://www.qcc.cuny.edu/artgallery/ · https://www.qcc.cuny.edu/about/index.html

### Libraries

**F9.12 [B]** Queens Public Library branches, as printed in the branch list:
- **Bayside** — "214-20 Northern Boulevard, Bayside, NY 11361"; "Moved to present location in 1965".
- **Bay Terrace** — "18-36 Bell Boulevard, Bayside, NY 11360"; "first opened on February 20, 1981".
- **Windsor Park** — "79-50 Bell Boulevard, Bayside, NY 11364"; "first opened in 1951. It moved in 1956".
**Note all three carry a Bayside postal address**, including Bay Terrace's — relevant to C6.
https://en.wikipedia.org/wiki/List_of_Queens_Public_Library_branches

### Alley Pond Environmental Center
See F4.13, F4.14 and C2. Addressed to Douglaston.

---

## 10. CHURCHES AND RELIGIOUS SITES

**F10.1 [A]** **All Saints Episcopal Church** — its own site gives "Location / 214-35 40th Ave.
Bayside, NY 11361 / Phone / 718-229-5631". Rector's letter, verbatim:
> "All Saints has been a spiritual home for residents of Bayside and the surrounding area for **over
> 130 years**. Today, members come from Bayside, Flushing, 'Out on the Island' (That's Long Island
> Code for anywhere east of Queens!) and as far away as New Jersey on a regular basis. Our membership
> reflects the wonderful cultural diversity of Queens, and is made up of people of all ages and from
> nearly every walk of life, and many faith backgrounds."
Worship: "in person or on our livestream, at **10:30 AM every Sunday**." Rector named as
"Fr. Larry Byrne".
https://www.allsaintsbayside.org/

**F10.2 [B]** Wikipedia *Bayside*: "**All Saints Episcopal Church** – Built in **1892** as one of
the first churches constructed in Bayside, the building contains examples of **Louis Comfort
Tiffany's** work."
**Two things to check:** (a) "over 130 years" [F10.1, Tier A] is consistent with an 1892 founding;
(b) **the Tiffany claim is Wikipedia-only.** The parish's own homepage does not mention Tiffany
anywhere in the text I extracted. There is **no Wikipedia article** for this church (404) and I
could not reach a diocesan or Tiffany-census source. **Treat the Tiffany windows as unconfirmed.**
https://en.wikipedia.org/wiki/Bayside,_Queens

**F10.3 [B]** Wikipedia *Bayside* also lists a "**Shrine of Our Lady of La Salette**" in Bayside.
I found no second source for it and did not reach its own site.

**F10.4** **St. Robert Bellarmine** (Bayside) — the parish at the origin of the Bayside apparitions
[F1.1]. `strobertbellarmine.net` returned only the string "Click here to enter" (a splash page) with
no extractable content, and `stjosaphatbayside.org` did not resolve. **I have no address for either
parish from any source.**

**F10.5 [A]** **Sacred Heart Catholic Academy** (Bayside) — from its own site, verbatim mission
excerpt: "In collaboration with the families who entrust their children to us, we at Sacred Heart
Catholic Academy strive to create a community that exhibits a strong Catholic Identity through
Prayer, Worship and Service." The site brands itself "Sacred Heart Catholic Academy of Bayside".
**This is the school, not the parish**, and the site gave no street address in the text I extracted.
https://www.sacredheartbayside.org/

**F10.6 [B]** Wikipedia *Bayside* parochial schools list: "Lutheran School of Flushing & Bayside",
"St. Robert Bellarmine School", "Our Lady of the Blessed Sacrament School", "Sacred Heart Catholic
Academy". Note the first has a **two-neighborhood name**.

**F10.7 [A]** **St. Josaphat's, a Polish parish in Bayside** — attested only as the title of a BHS
video segment [F9.7]. No address, no dates, no second source. A real lead, unresearched.

**F10.8 [A]** **Thorne-Wilkins Cemetery** — listed by NYC Parks as a Highlight of Fort Totten Park
[F8.8]. On the contested peninsula [C3]. No further source reached.

**F10.9 [A]** **The grave of Charles Willet**, "located just inside the entrance of the post" at
Fort Totten, per LP-0827 [F8.10].

---

## 11. TRANSPORTATION

**F11.1 [B]** **Bayside LIRR station** — "213th Street and 41st Avenue", "off Bell Boulevard and
just north of Northern Boulevard". Opened **October 27, 1866**, "originally built by the North Shore
Railroad of Long Island". "The current station house dates to **October 11, 1923**." "The wooden
pedestrian bridge was replaced in **1998** with a decorative steel structure." "A former railway
express/baggage station from **1928** remains, now converted to a **community center**." Grade
elimination: "Tracks were depressed beneath Bell Boulevard from **1928 through 1930**." Two slightly
offset side platforms, each 10 cars long, 2 tracks, Port Washington Branch. In the **CityTicket**
program. Ridership "7,905 passengers during 2012-2014 period; ranked **10th among 125 LIRR
stations**." Connecting buses: Q12, Q13, Q31 (NYCT) and n20G, n20X (NICE). No landmark designation.
https://en.wikipedia.org/wiki/Bayside_station_(LIRR)
**Conflict to check:** F11.1 says the tracks were depressed **1928–1930**; LP-2154 [A] says "In the
mid-1920s, the tracks that ran through the community were set below grade and a new station house
was built" [F6.4]. The station house date (1923) also predates the 1928–30 depression in F11.1, so
"a new station house was built" at the same time as the depression may be imprecise in one source.

**F11.2 [B]** Wikipedia *Bayside*: "Bayside is connected to New York Penn Station, Grand Central,
northern Queens, and Long Island by the Bayside station, **one of a few express stations on the Long
Island Rail Road's Port Washington Branch**." And on post-war growth: "After the end of World War
II, residential development in Bayside increased dramatically, particularly because of its station
on the Long Island Rail Road's Port Washington Branch, where a commuter could ride one train
straight to Manhattan **without transferring at Jamaica station**."
**Flag:** the *Bayside station (LIRR)* article's extraction said "no dedicated express service is
mentioned," while the *Bayside* article calls it an express station. Two Wikipedia articles, two
answers.

**F11.3 [B]** Buses serving Bayside: local Q12, Q13, Q16, Q27, Q28, Q30, Q31, Q46, Q48, Q74, Q75,
Q76, Q88; express QM2, QM5, QM6, QM8, QM20, QM32, QM35, QM36; plus "The Nassau Inter-County
Express's n20G, n20X routes also serve Bayside."

**F11.4 [B]** **No subway.** "The New York City Subway's 7 and <7> trains serve **nearby Flushing**
at the Flushing–Main Street station." And on the line that never came: "Early plans for the line
were to have it end in Bayside at Bell Boulevard near Northern Boulevard." Cross-reference F6.4 [A],
which independently records the same abandoned extension from a primary source.

**F11.5 [B]** Highways: Clearview Expressway (I-295), Long Island Expressway (I-495), Cross Island
Parkway, Bronx–Whitestone Bridge, Throgs Neck Bridge.

**F11.6 [B]** *Cross Island Parkway*: 10.57 miles, Whitestone Expressway (I-678) in Whitestone to
the Belt Parkway and Southern State Parkway in Cambria Heights; passes through "Whitestone, Bayside
and Alley Park"; first proposed by **Robert Moses** in 1930; first major contract let December 23,
1938; the Belt system including this segment "opened to traffic on **June 29, 1940**"; north of
Alley Pond Park it "begin[s] to run along the western edge of Little Neck Bay"; **Exit 32** is "a
diamond interchange with **Bell Boulevard**" and **Exit 33** connects to the Clearview Expressway
and Throgs Neck Bridge. The extraction explicitly notes "The article contains no mention of a 'Joe
Michaels Mile greenway.'" (Joe Michaels Mile is attested instead as an NYC Parks Highlight of
Crocheron Park [F8.1, Tier A], and I could not fetch its history page.)
https://en.wikipedia.org/wiki/Cross_Island_Parkway

**F11.7 [B]** *Interstate 295 / Clearview Expressway*: 9.79 miles through Queens and the Bronx;
"originates at NY 25 (Hillside Avenue) in Queens"; construction began September 1957; northern
section opened **January 11, 1961**; "an extension of the Clearview south to Hillside Avenue was
opened to traffic on **August 12, 1963**"; originally designated I-78 and intended to run much
farther south, "cancelled by Governor Nelson Rockefeller in 1971."
**Conflict:** NYC Parks [A] says "The Clearview Expressway… was completed in **1963**" [F8.5];
Wikipedia says the northern section opened 1961 and the Hillside extension 1963. Reconcilable, but
note the difference.
https://en.wikipedia.org/wiki/Clearview_Expressway

**F11.8 [B]** *Union Turnpike*: ~10 miles; in eastern Queens it crosses "Bell Boulevard and
Springfield Boulevard"; "becomes the southern boundary of Alley Pond Park until it intersects with
Winchester Boulevard"; "the section of Union Turnpike from Kew Gardens to the Nassau County line was
converted from a narrow unpaved road to a paved multi-lane highway in the late 1930s, **in advance
of the 1939 New York World's Fair**."

**F11.9 [B]** *Francis Lewis Boulevard*: 10.8 miles; passes through "Rosedale, Laurelton, Cambria
Heights, Hollis, Queens Village, Jamaica Estates, Cunningham Park in Fresh Meadows, Auburndale,
Bayside, and Whitestone"; named for **Francis Lewis**, "a signer of the Declaration of Independence"
who "owned a home in Whitestone."
**A conflict about where the drag racing is:** Wikipedia *Bayside* [B] says "Francis Lewis Boulevard
is a major street notorious for drag racing, which has resulted in several fatalities to drivers and
pedestrians over the years." Wikipedia *Francis Lewis Boulevard* [B] attributes the same sentence to
"**The Cunningham Park section**". Same wording, two different locations — likely one claim
propagated with the location changed. Do not place this in Bayside without checking.

---

## 12. HISTORY — the Wikipedia layer (weakest tier; §6 and §8 are stronger)

All **[B]**, from https://en.wikipedia.org/wiki/Bayside,_Queens unless noted.

**F12.1** "the Matinecock Native American tribe" settled around 2000 B.C.
**F12.2** Around 1637 "the Dutch West India Company encouraged Dutch farmers to settle on land
grants." (See F7.2 for the conflict.)
**F12.3** "William Lawrence built the first permanent building, a stone farmhouse, when he settled
Bayside in 1644." England assumed control twenty years later, establishing the "Province of New York."
**F12.4** "**The first known written occurrence of the name Bayside was in a deed dated 1798,
written as Bay Side.**" — a specific, checkable claim and, if true, an excellent detail.
**F12.5** "During the 19th century, Bayside was primarily farmland, where wealthy people from
Manhattan would visit it as a rural resort."
**F12.6** "the Bayside House, owned by Joseph Crocheron, was well known for its clambakes. It burned
down in 1906, but Crocheron's name lives on as the namesake of the 45-acre (18 ha) Crocheron Park."
(See F7.3 for the 1906/1907 and name conflict.)
**F12.7 — The 1908 "Regatta Murder."** Wikipedia *Bayside*: "Bayside was the site of a murder by
Peter Hains, a prominent army officer, abetted by his brother, sea novelist Thornton Jenkins Hains,
who gunned down prominent editor William Annis at his yacht club in 1908." Wikipedia *Peter C.
Hains* gives more: the date **August 15, 1908**, at the **Bayside Yacht Club** in Bayside, and
verbatim: "two of his three sons, Peter C. Hains Jr. and Thornton Jenkins Hains, a well-known author
of sea stories, were involved in the murder of William E. Annis at the Bayside Yacht Club, Bayside,
Queens, New York City." Outcomes: Thornton acquitted January 1909; Peter Jr. convicted of
manslaughter May 1909 and sent to Sing Sing; pardoned by Governor **John Alden Dix in 1911**. The
case "became one of the notorious cases of its day, front-page news across the country."
**Note the two Wikipedia articles disagree on who fired**: the *Bayside* article says Peter (the
father, "a prominent army officer") gunned down Annis "abetted by his brother"; the *Peter C. Hains*
article says the two **sons** were involved and the father was the one who paid for the defense.
**The *Bayside* article appears to conflate father and son.** Do not repeat it.
https://en.wikipedia.org/wiki/Peter_C._Hains
**F12.8 — The Bayside Yacht Club** is independently attested by BHS, which mounted an exhibit on it:
"The first installment of Bayside Historical Society's new exhibit series, 'From the Archives,'
debuted in June 2019. It showcased the history of the **Bayside Yacht Club** and its activities
throughout the 20th Century through documents, artifacts, photographs, and other archival materials
from the Bayside Yacht Club collection." [A]
https://www.baysidehistorical.org/bayside-yacht-club-exhibit
**F12.9** Silent-film era: see F7.7 for the studio-location conflict. "When Hollywood emerged as the
capital of the movie industry during the 1920s, many actors left Bayside to pursue careers in
California."
**F12.10** Post-WWII growth: see F11.2.
**F12.11** "Bayside remains one of the safest and wealthiest neighborhoods in Queens."

### Historic houses listed by Wikipedia only — all [B], all needing verification

**F12.12** "**Straiton-Storm Cigar Factory** – Built c. 1872, the factory was the largest cigar
manufacturer in America. The three-story wood-frame building was of the French Second Empire style.
After a large warehouse fire in late 1976, the factory was refurbished to its original state."
**This is a striking industrial claim ("largest cigar manufacturer in America") with no second
source in my corpus and no address given.** It is the closest thing to an industrial-history hook I
found for Bayside, and it is entirely unverified. Note the LPC's Ahles report says the Ahles House
"is the only remaining example of the substantial Second Empire buildings erected in Bayside during
the 1870s and 1880s" [F6.9, Tier A] — **which appears to contradict a surviving Second Empire cigar
factory from c. 1872.** Flagged as a live conflict between a Tier A and a Tier B claim.
**F12.13** "**Cornell-Appleton House** at 214–33 33rd Road – 'Archibald Cornell's wife inherited the
100-acre farm from her father more than 160 years ago.' The house 'has been traced back to 1852' and
is 'the second-oldest home in Queens.' Notably, 'Mrs. Appleton and her sister were passengers aboard
the RMS Titanic when it hit an iceberg and sank. Both women were rescued by the ship Carpathia.'"
**"Second-oldest home in Queens" is a strong superlative** — check it. Also cross-check against
F6.9's "one of the oldest surviving in Bayside" for the Ahles House (c.1873).
**F12.14** "**Corbett House** – 221-04 Corbett Road, the home of world champion boxer 'Gentleman Jim'
Corbett from 1902 until his death in 1933, and of his widow Vera until her death in 1959."
**Note the street is named Corbett Road** — an eponym worth confirming.
**F12.15** "**W.C. Fields Residence** – 35–25 223rd Street, home of actor W.C. Fields."
**F12.16** "**Gloria Swanson's Home** – 216-07 40th Avenue, was the home of the silent film actress."
**F12.17** "**Rudolph Valentino's Home** – 201-10 Cross Island Parkway, was where Valentino… lived.
It was also once home to Fiorello LaGuardia, the mayor of New York City from 1934 to 1945."
Wikipedia elsewhere ties this address to a restaurant: "Cafe on the Green (later **Valentino's on
the Green**) – converted from Rudolph Valentino's former home."
**Independent corroboration [A]:** NYC Parks' Clearview Park Golf Course page carries the news
headline "**New Parks Concession Valentino's on the Green Takes Center Stage at Clearview Golf
Course**" — confirming the restaurant exists as a Parks concession, though not the Valentino
provenance. **This is the only restaurant in this document with an institutional source.**
https://www.nycgovparks.org/parks/clearview-park-golf-course
**Address flag:** "201-10 Cross Island Parkway" is at Bayside's stated eastern boundary [F2.1] and
Clearview Golf Course is in CD7 [F2.11]. Whether this site is in Bayside is not settled by anything
I read.
**F12.18** "**Lawrence Cemetery** – 216th Street & 42nd Avenue" — see §5A and F7.1 for the
authoritative version.

---

## 13. ADMINISTRATIVE AND DEMOGRAPHIC FACTS

All **[B]** from https://en.wikipedia.org/wiki/Bayside,_Queens unless noted. These are census and
health-profile figures; they date fast and the verifier should check vintages.

**F13.1** ZIP codes, verbatim: "Bayside is covered by multiple ZIP Codes. From north to south, they
are **11360 north of 32nd Avenue; 11361 between 32nd and 48th Avenues; and 11364 between 48th Avenue
and Union Turnpike**." (11359 is the Fort Totten ZIP per BHS [F2.16] and NYC Parks [F2.8] — note
Wikipedia's list omits it, consistent with Fort Totten being outside Bayside proper. **A small but
telling data point for C3.**)
**F13.2** Post offices: "Bay Terrace Station – 212-71 26th Avenue"; "Bayside Station – 212-35 42nd
Avenue"; "Bayside Annex – 41-29 216th Street"; "Oakland Gardens Station – 61-43 Springfield Boulevard."
**F13.3** Area codes: "718, 347, 929, and 917."
**F13.4** "Bayside is in Queens Community District 11" and is "represented by the New York City
Council's **19th and 23rd Districts**." (LPC data gives council 19 for all four Bayside landmarks
[F2.13].) Auburndale is also CD11, ZIP 11358 [B, *Auburndale, Queens*].
**F13.5** 2010 census: "the population of Bayside-Bayside Hills was **43,808**, a decrease of 563
(1.3%) from the 44,371 counted in 2000." Racial composition 2010: White 46.9% (20,550); Asian 37.3%
(16,324); Hispanic/Latino 11.6% (5,066); African American 2.6% (1,160); other/multiracial 1.6%.
**F13.6** 2000 census ethnicity: "White people made up 65.6% of Bayside's population. Italian
Americans, Irish Americans, and Greek Americans were the largest ethnic groups representing 17.6,
12.4, and 7.3% of the population respectively." German 6.7%, Polish 3.5%.
**F13.7 — the Asian American story, verbatim:** "Around the mid-1990s, a significant number of
**Korean** families began moving into the area. As of the 2000 Census, Asian Americans made up a
significant 22.7% of the neighborhood's population, most of whom were **Korean Americans, who made
up 10.4% of the population and Chinese Americans, who made up 9.2%**."
Compare F13.5: Asian share rose from 22.7% (2000) to 37.3% (2010).
**F13.8 [B]** Wikipedia *Koreatown, Queens*, verbatim: "This Koreatown has continued to expand
rapidly eastward alongside **Northern Boulevard** through the Queens neighborhoods of Murray Hill,
Auburndale, **Bayside**, Douglaston, Little Neck." And: "As the community grew in socioeconomic
status and population, Koreans moved eastward along Northern Boulevard, buying homes in more
affluent and less crowded Queens neighborhoods, and into the adjacent Nassau County, by the early
21st century." **The extraction states the article does not mention Bell Boulevard by name** and
gives no Bayside-specific business detail. So the Korean corridor is attested on **Northern
Boulevard**, not Bell.
https://en.wikipedia.org/wiki/Koreatown,_Queens
**F13.9** Micro-geography of difference, verbatim: "Local data from the Census Bureau's American
Community Survey (based on samples from 2005 to 2009) shows that Bayside's demographics change
significantly from area to area. For example, the pocket bordered by the Clearview Expressway to the
west, Northern Boulevard to the north, Bell Boulevard to the east, and 48th Avenue to the south has
a plurality (40%) of Asians, while 31% are Hispanic, 19% black and 13% white. Other areas are
majority white, mostly of Italian, Greek, and Irish descent."
**F13.10** "83.8% of residents age 25 and over have at least graduated from high school, while 35.0%
have a bachelor's degree or higher." Median household income (2010): "$95,114". CB11 median income
as of 2017: "$70,155".
**F13.11** NYC Health 2018 Community Health Profile, for **CB11 as a whole** (Bayside +
Douglaston–Little Neck), 119,628 inhabitants, "an average life expectancy of **84.7 years**. This is
higher than the median life expectancy of 81.2 for all New York City neighborhoods." Poverty 14% vs
19% Queens / 20% NYC; unemployment 6% vs 8% / 9%; rent burden 49% vs 53% / 51%; uninsured 5% vs 12%.
"Based on this calculation, as of 2018, Bayside and Douglaston–Little Neck are considered to be
**high-income relative to the rest of the city and not gentrifying**."
**Note: every one of these figures is for the combined CB11 area, not Bayside alone.** Do not
attribute them to Bayside by itself.
**F13.12** Crime: patrolled by "the **111th Precinct** of the NYPD, at **45-06 215th Street**." "The
111th Precinct ranked 8th safest out of 69 patrol areas for per-capita crime in 2010." 2018: "With a
non-fatal assault rate of 8 per 100,000 people, Bayside and Douglaston–Little Neck's rate of violent
crimes per capita is **the lowest of any area in New York City**." "crimes across all categories
having decreased by 88.6% between 1990 and 2018. The precinct reported 0 murders, 7 rapes, 35
robberies, 74 felony assaults, 163 burglaries, 361 grand larcenies, and 37 grand larcenies auto in
2018." (BID [A] independently confirms Precinct 111 covers the Bell Blvd district [F2.21].)
**F13.13** Fire: "Engine Company 306 is at 40-18 214th Place, while Engine Co. 326/Ladder Co.
160/Battalion 53 is at 64-04 Springfield Boulevard." Plus the FDNY EMS Training Academy at Fort
Totten "and a museum of FDNY EMS history" — see C10 for the neighborhood contest, and note **an EMS
history museum** is itself a visitor-relevant item nobody has claimed.
**F13.14** Schools: District 26, "the highest-performing school district for grades K-9 in all of
New York City. The district includes 20 elementary schools and 5 middle schools"; District 25 also
serves part. Nearest major hospital: "Long Island Jewish Medical Center in **Glen Oaks**."
**F13.15 [B]** **Bayside High School** — "32-24 Corp Kennedy St", Bayside 11361; founded
"March 16, 1936"; architect **Walter C. Martin**; "built by the Public Works Administration from
1934 to 1936"; "**the first school building in the city to be constructed using Federal funds**";
3,010 students (2023-24). Alumni include Eric Adams, Daymond John, Scott Ian, Ellen Baker, Action
Bronson, Jordan Belfort, Mae Faggs.
https://en.wikipedia.org/wiki/Bayside_High_School_(Queens)
**F13.16 [B]** **Benjamin N. Cardozo High School** — "57-00 223rd St, Bayside, Queens, New York
11364"; opened **1967**; 3,100 students (2022-23). Programs: "Mentor Law and Humanities program",
"Da Vinci Science and Research Institute", audition-based Performing Dance program, FIRST Robotics
Team #5599 "The Sentinels", Navy JROTC. Alumni include George Tenet, Reginald VelJohnson, Dalilah
Muhammad, Rafer Alston, Howie Rose, and "Anthony Raneri (lead singer, **Bayside** band)."
https://en.wikipedia.org/wiki/Benjamin_N._Cardozo_High_School

---

## 14. COMMERCE AND BUSINESSES — read §0.4 first

**No DOHMH or DCWP inspection data was consulted for anything in this section or anywhere else.**

**F14.1 [A]** The **Bayside Village BID** exists and describes itself: "The Bayside Village BID
promotes and provides services along **Bell Boulevard, the 'Main Street' of Bayside Queens**." Key
services listed: "Supplemental Sanitation Services / Holiday Lighting / Government Relations /
Beautification." District definition at F2.21. The site advertises a "**Bayside Village Annual Tree
Lighting**" (a December event).
https://www.baysidevillagebid.com/

**F14.2 [A]** **Valentino's on the Green** — an NYC Parks concession at Clearview Park Golf Course,
per the Parks news headline quoted at F12.17. The Clearview page's Facilities list includes
"**Eateries**". This is the only food business in this document with an institutional source, and
note the golf course is in **CD7** [F2.11].

**F14.3 [B]** Wikipedia *Bayside* mentions, in its pop-culture section only: "**Pier 25A** – seafood
restaurant (filming location for *The Devil's Advocate*)" and "**Alicia's Jewelers** (Bay Terrace) –
family jewelry store featured in *Before the Devil Knows You're Dead*." **These are sourced to a film
credit, not to any business directory, and Alicia's is placed in Bay Terrace [C6], not Bayside.**

**F14.4 [B]** **The Bay Terrace shopping center.** Wikipedia *Bay Terrace*: a 2004 planning study
noted "the **Bay Terrace at Bayside** shopping center" planned expansions "including World Kitchen,
Aéropostale, and pediatric emergency care." **That 2004 tenant list is two decades stale — do not
use it.** The center's own site (`bayterrace.com` [A]) confirms only that it exists and has
directory sections for "STORES", "RESTAURANTS", and "SERVICES"; it is a JavaScript app and returned
no extractable tenant names. **Note the center's own branding is "The Bay Terrace" / "Bay Terrace at
Bayside"** — the name itself straddles C6.

**F14.5 [B]** Housing market, verbatim: "CNN Money ranked Bayside as one of the most expensive
housing markets nationally when analyzing comparable detached homes. Despite its large housing stock
of free-standing homes, it ranks high nationally in population density." Bayside Gables homes "sell
for as much as $4 million."

**F14.6 [A]** Historical commerce, from LPC: Abraham Bell and Company, "a shipping and commission
merchant operating in lower Manhattan… involved in the cotton trade and in transporting immigrants
from Ireland during the potato famine of the 1840s" [F6.2]; the Rickert-Finlay Realty Company
[F6.5]; the Bellcourt Land Company [F6.6]. And from NYC Parks: Tony DePhillips's "Bayside sporting
goods store" [F8.3], and the Crocheron House hotel [F8.2].

**F14.7 [B]** Wikipedia *Little Neck Bay*: the shellfish trade — "littleneck" as a clam size
category originating here, and closure to harvesting in 1909 [F8.12]. NYC Parks [A] adds that after
the film colony left, "the community supported itself on the lucrative Little Neck shellfish beds"
[F7.6]. **The bay's own name and its clams are the strongest commercial-history vein and it is
double-sourced across tiers.**

---

## 15. NOTABLE RESIDENTS AND POP CULTURE — [B], Wikipedia *Bayside* only

Recorded as a block because none of it is independently sourced. Verify individually before use;
resident lists are the least reliable part of any neighborhood article.

**F15.1** Historic figures named: John Barrymore, Charlie Chaplin, Gloria Swanson, Rudolph Valentino,
W.C. Fields, Norma Talmadge, Jim Corbett ("lived here from 1902 until his death in 1933"), Irving
Berlin, Paul Newman, Christopher Walken, Richard Dreyfuss, Estelle Getty, Marie Dressler.
**F15.2** Sports: Nolan Ryan ("lived here while playing for the New York Mets"), Tom Seaver,
José Reyes, Mark Gastineau, Ken Strong.
**F15.3** Others: Bernie Madoff, Jordan Belfort, Stephen Jay Gould, Michael Chang, Arvind Mahankali
("2013 Scripps National Spelling Bee champion").
**F15.4** Screen appearances claimed: *Seinfeld* (George Costanza's family), *Frequency* (2000),
*Good Morning, Vietnam*, *Pride and Glory*, *The White Shadow*, *The Devil's Advocate* (1997),
*Before the Devil Knows You're Dead* (2007), *Sally of the Sawdust* (1925), *NYPD Blue* ep.
"Taillight's Last Gleaming" (1997).
**F15.5** Organized-crime incidents claimed: Michael Pappadio (Lucchese, murdered 1989 in South
Ozone Park — **note the murder was not in Bayside**); and "In April 2002, Gambino crime family
associate Darren D'Amico was shot in the leg outside a restaurant in Bayside; his suspected shooter
was Bonanno crime family associate Randolph Pizzolo."
**F15.6** BHS [A] independently records local figures worth noting: **Joseph H. Brown** (BHS
founder) [F9.2], and memorial pages for "**Joan Wettingfeld**", "**Rose Marie Ryan Harrison**" and
"**Paul Vallone**" in its sitemap — local figures with a real institutional footprint, unlike the
celebrity list above.
**F15.7 [A]** Council Member **Vickie Paladino** is named on every NYC Parks page for Bayside's
parks, and funds BHS's immigration programming [F9.7]. Council Member **Linda Lee** is the second
council member listed for Alley Pond Park [F4.3]. Historical local officials surfacing in LPC
hearing records [A]: Tony Avella (as Council Member in 2004 and 2009, as State Senator in 2015),
Paul Vallone, Edward Braunstein, Helen Marshall, Frank Padovan, Ann-Margaret Carrozza,
Jack Eichenbaum (Queens Borough Historian), Stanley Cogan (Borough Historian of Queens, 2004).

---

## 16. WHAT I COULD NOT SOURCE — gaps the verifier should treat as open, not as absences

1. **Restaurants and bars on Bell Boulevard.** Bayside's nightlife/dining strip is its best-known
   contemporary feature and I have **essentially nothing on it**: only the BID's self-description
   [F14.1] and two film-credit mentions [F14.3]. Without WebSearch I could not reach a single
   restaurant's own site, a press feature, or any directory. **I deliberately did not fall back on
   DOHMH/DCWP data.** This is the largest gap in the document.
2. **Alley Pond Park's NYC Parks history text** — never obtained; the `/history` path is an empty
   Park Group page and the sub-park pages were lost to the HTTP-202 rate limit. Re-fetch with `curl`
   after a cooldown. Same for **Oakland Lake**, **Cunningham Park**, **Joe Michaels Mile**,
   **Bayside Fields**, **Raymond O'Connor Park**, **Marie Curie Playground**.
3. **Community Board 11's own boundary and neighborhood statement** — the nyc.gov page 404'd. Every
   CD11 fact here is Wikipedia-only. Given how central the boundary question is, this should be
   fixed first.
4. **St. Robert Bellarmine** and **St. Josaphat's** — no addresses, no histories, no dates. Both are
   real Bayside parishes (one is the origin of a nationally known apparition movement, the other the
   subject of a BHS video). Both unresearched.
5. **The Tiffany windows at All Saints** [F10.2] — Wikipedia-only, absent from the parish's own site.
6. **The Straiton-Storm Cigar Factory** [F12.12] — a major industrial claim with no address and an
   apparent conflict against LPC's Tier A statement about surviving Second Empire buildings.
7. **The Cornell-Appleton House** [F12.13] — "second-oldest home in Queens" is unverified, as is the
   Titanic connection.
8. **Bayside Marina** — I could not confirm it exists from any source I reached, despite the
   waterfront context. Not recorded as a candidate.
9. **Thorne-Wilkins Cemetery** [F10.8] — attested only as a Parks "Highlight" label.
10. **The FDNY EMS history museum** at Fort Totten [F13.13] — Wikipedia-only, and on contested ground.
11. **Bayside Hills** — I have Wikipedia's boundary and its "33 street malls and accents," the
    gatehouse at Bell Blvd & 48th Ave, and the "Bayside Hills Street Clock at 50th Avenue and 214th
    Street… upon the Leo Green Clock Mall, dedicated to the local civic activist" [B]. The clock and
    the gatehouse are attractive, specific, visitable items with **no second source**.
12. **Contemporary Korean and Chinese Bayside.** F13.7 and F13.8 give the demographic shape but I
    reached **no** institutional source for a single Korean or Chinese business, church, school or
    organization in Bayside. Given that Asian residents were 37.3% of the neighborhood in 2010, this
    is a serious under-coverage that is entirely an artifact of losing WebSearch.

---

## 17. TALLY

Counts below were produced by parsing this file programmatically, not estimated.

- **Candidate facts recorded (F-numbered):** **164**
- **Candidate places recorded:** **103 distinct named places.** Counted by category: 23 parks and
  natural features; 25 landmarks, historic structures and burial grounds; 22 institutions,
  civic/emergency facilities and businesses; 10 churches and schools; 12 transit facilities and
  named roads; 7 sub-neighborhoods; 4 post offices. A "place" here means a distinct named site,
  structure, waterway or thoroughfare that appears as a candidate — **not** a claim that it belongs
  to Bayside. Several are recorded specifically so they can be **excluded** deliberately (C16–C22).
- **Places with a contested neighborhood assignment:** **22** (table §3, C1–C22)
- **Explicit source-vs-source conflicts logged:** **14** in §7, plus 7 more noted inline at F4.1,
  F11.1, F11.2, F11.7, F11.9, F12.7 and F12.12 — **21 total**
- **Tier A (raw text I fetched and read myself) sources:** **30** distinct URLs/PDFs — 6 LPC
  designation-report PDFs, 8 NYC Parks pages, 7 Bayside Historical Society pages, 2 NYC Open Data
  endpoints, 3 QCC pages, and the APEC, All Saints, Bayside Village BID and Sacred Heart sites
- **Tier B (WebFetch extraction) sources:** **25** distinct Wikipedia articles
- **Candidates resting on DOHMH/DCWP inspection data: ZERO.** No such dataset was opened at any
  point in this session.
- **Verdicts, confirmations or adjudications issued: ZERO.** That is the verifier's job.

**Two counting caveats, stated so the numbers are not over-read:** (1) the 164 F-numbers are
*candidate assertions*, and several bundle a list (e.g. F11.3 is one number covering 21 bus routes),
so the count is of recorded claims, not of atomic facts. (2) The 22 contested places are contested
*in my sources*; that a place is absent from that table means only that I found no source assigning
it elsewhere, not that its assignment is settled.
