# Fordham Heights — viability assessment

**Verdict: NOT VIABLE. Do not author `priv/seed_data/bronx/fordham-heights.json` in this wave.**

Source: `docs/bronx/fordham-heights-verdicts.md`, read in full. The verifier's tally is
**4 surviving places**. Applying the corpus's own reservation and fact-fidelity rules to that
same tally leaves **1**.

---

## 1. The four survivors, re-tested

### Survives — Paradise Theater

| Field | Value |
|---|---|
| Name | Paradise Theater (formerly Loew's Paradise Theatre) |
| Address | **2403 Grand Concourse, Bronx, NY** |
| Siting | Confirmed. South of Fordham Road, between the two IND Concourse stations whose Locale field reads "Fordham Heights"; its own article places it close to the Fordham Road station. The verifier calls it "the strongest-sited place on the page." |

Confirmed and publishable: opened September 7, 1929; architect John Eberson; atmospheric theatre,
Italian Baroque design with Spanish-style decoration; original seating c. 3,885, 3,855 as of 2012;
exterior NYC landmark April 15, 1997, ref #1891; lobbies and auditorium interior NYC landmark
May 16, 2006, ref #2193; leased October 2012 to World Changers Church International, vacated 2020,
vacant as of 2023; Bronx Independent Cinema Center began hosting events there in 2025.
Operating status is **uncertain** — publish the building and its history, make no claim about
current operation or ticketing.

This is a real place and it is genuinely this neighborhood's. It is also the only one.

### Fails — Grand Concourse (boulevard): reserved for an in-scope row

`priv/seed_data/bronx_roster.json` gives `concourse` = community district 4, **`in_scope: true`,
wave 2** — the same wave as `fordham-heights` — and `priv/seed_data/bronx/concourse.json` does not
yet exist. The boulevard is that row's spine, and the verdicts confirm both of its designated
districts sit there: NRHP #87001388 covers **730–1675 Grand Concourse**, location column
"**Concourse**", and the 2011 LPC district covers 153rd–167th Streets. `lib/ethos/seeds/yankee_stadium_places.ex`
already holds three addressed places on the boulevard (Bronx County Courthouse at 851, Bronx Museum
of the Arts at 1040, Joyce Kilmer Park bounded by it).

This is the identical shape as the Poe Cottage ruling: material that a scheduled row exists to hold.
The marquee-institution rule — one seed file, corpus-wide — bars taking it here. What is left after
the reservation is a single locational fact, the grade-separated junction at Fordham Road, which is
prose, not a place record.

### Fails — Fordham Road (corridor / BID): a boundary, not an interior

Every confirmed anchor of this corridor lies on or beyond the edge:

- CB5's **northern** boundary *is* Fordham Road (CB5's own stated boundary).
- Fordham's own article: the BID "operates on the **northern border** of the neighborhood."
- BID extent, confirmed: "from **Third and Webster Avenues** west to **Jerome Avenue**." The east
  anchor is the point §0 ruled outside CD5 (east of Webster Avenue). The west anchor carries the
  confirmed station Locale "**University Heights and Fordham**" — not Fordham Heights.
- `priv/seed_data/bronx/belmont.json` already publishes Fordham Road, in prose, as Belmont's
  northern bound.

The road's substantive confirmed facts — 2.4 miles, Harlem River to Bronx Park, four-lane two-way,
divides at Jerome Avenue, separates the North Bronx from the South Bronx, the borough's largest and
most diverse shopping district — describe a thoroughfare crossing University Heights, Fordham Manor
and Belmont. Publishing them as this neighborhood's own is rule 6.

### Fails — Monroe University: no address, and siting by inference

The only location any source gives is "**Fordham, Bronx neighborhood**" and "near the Fordham
shopping district." §0 of the verdicts holds that "Fordham" is "the ambiguous parent term that spans
both roster rows and **resolves nothing**." Targeted re-fetch returned: "The article does not provide
a street address or cross street for the Bronx campus." No source gives a side of Fordham Road.

The verifier's own siting is an inference from the BID's extent — "the western half of which lies
inside CD5" — and it is recorded as "**the weakest siting on the page**," "marginally." An inference
is not a confirmed verdict, so the claim *Monroe University is in Fordham Heights* has nothing to
trace to. Rule 1 deletes it.

---

## 2. In-scope place count

| Place | Address | Status |
|---|---|---|
| **Paradise Theater** | 2403 Grand Concourse, Bronx, NY | **Publishable** |
| Grand Concourse (boulevard) | Grand Concourse, Bronx, NY | Reserved for `concourse` (in scope, wave 2, unshipped) |
| Fordham Road (corridor / BID) | Fordham Road, Bronx, NY | Shared northern boundary; both confirmed endpoints attach elsewhere |
| Monroe University | *none exists in any source* | Siting by inference from an ambiguous parent term |

**Surviving in-scope, publishable places: 1.** The stated bar was two.

---

## 3. The intro is the harder failure

There is no confirmed fact that says what Fordham Heights *is*. The Bronx Community Board 5 article
"**never uses the string 'Fordham Heights'**," and no source in the corpus applies it to any of the
nine proposed places. The name is confirmed to attach to exactly one kind of thing: the Locale field
of two IND Concourse subway stations, 182nd–183rd Streets and Fordham Road.

Everything that would normally carry a neighborhood intro — population 43,394, 0.507 sq mi, median
income $26,143, ZIP codes 10453/10457/10458/10468, the 1666 Archer settlement, the Fordham Manor
patent, the ford and the John Fordham name origin, the 1920s–late-1970s demographic account — is
confirmed for **Fordham, the parent area**, most of which §0 ruled out of scope. The verdicts warn
directly: publishing it wholesale here "would smuggle the boundary problem back in through the
prose."

### Confirmed facts actually available to an intro

1. Paradise Theater: address, 1929 opening, Eberson, atmospheric/Italian Baroque, seating, both
   landmark designations, the 2012 lease / 2020 vacancy / 2025 events.
2. The Grand Concourse crosses Fordham Road in a grade-separated junction, service roads
   intersecting at grade.
3. 182nd–183rd Streets (IND Concourse) and Fordham Road (IND Concourse) both opened July 1, 1933;
   B weekdays, D all times (182nd–183rd: except peak-direction rush hours). Transit is
   "Getting there" prose under rule 7 and cannot carry the page's identity.

That is the whole inventory. A 90-word intro is mechanically reachable from item 1 alone — a draft
built only from the theater's designation history and the 1933 station openings counts 101 words —
but it introduces a building and a train timetable, never a neighborhood. Every route to an intro
that actually describes Fordham Heights runs through one of the three defects this corpus keeps
catching: importing Fordham's neighborhood-level history (rule 6), taking the Concourse boulevard
(rule 6 and the marquee rule), or writing about the absence of a definition (rule 3, the most
repeated failure here). The word gate would pass. The review would not.

---

## 4. Links — the one test that passes

Two honest outbound links are reachable, and they are not the constraint:

- `guide:bronx-park-bronx-guide`, kind `same-region`. Note built on Fordham Road, per the verdicts'
  instruction: "Fordham Road… runs west-east from the Harlem River to Bronx Park" and "The Bronx Zoo
  and New York Botanical Garden are at the eastern terminus of Fordham Road in Bronx Park" — both
  confirmed, corrected wording.
- `guide:belmont-bronx-guide`, kind `same-region`. Belmont adjoins across Webster Avenue and its own
  file already names Fordham Road as its northern bound. `same-region`, not `shared-history` — no
  verdict establishes a shared history.

A third via Mott Haven or Concourse would rest on the Grand Concourse boulevard, which this file
cannot claim.

---

## 5. Recommendation

Hold `fordham-heights`. One place, no confirmed neighborhood definition, and an intro slot that can
only be filled by borrowing from `concourse` or `fordham-manor` is the exact page this corpus has
twice shipped and twice had to catch.

Carry forward instead:

1. **Paradise Theater** — fully verified, 2403 Grand Concourse. Its verdicts should be preserved for
   reuse. It has no other in-scope home; it is a real asset waiting on a viable container.
2. **Grand Concourse boulevard** — hand the confirmed claims to the `concourse` authoring pass
   (in scope, wave 2). The historic-district material is already confirmed to belong there.
3. **Poe Cottage, Poe Park, Bronx Library Center** — `fordham-manor` / `kingsbridge-heights`,
   out of scope, will not ship. Gate those slugs and the address 310 East Kingsbridge Road out of
   any future `fordham-heights.json`, per the verdicts' §"Dedup check", in the pattern of
   `connecticut_places_test.exs:54-74`.
4. **The Bronx Park tie is unaffected.** It holds on Fordham Road and Bronx Park can take its third
   outbound link regardless of whether this page ships.
