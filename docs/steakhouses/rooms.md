# Per-room verification artifact — steakhouse scoping wave

One row per room: name | address | evidence it qualifies | verdict.

**Evidence standard.** A room counts only if it is (a) named in a fetched source that
locates it in the metro, and (b) qualifies under the inclusion rule by genre. Rooms I could
not locate are not counted, even when plausible.

**Venue-embedded test** (REWRITTEN in fix round 2). The fix-round-1 wording required a room
inside a larger venue to have its own street address AND be reachable without a ticket. That
conjunction was wrong: the street address was a proxy I never actually meant to test on, and
it misfires. Gordon Ramsay Steak's 1525 Russell St *is* the Horseshoe Casino's own address,
so the old wording would have failed it too and taken Baltimore to 6 — still a drop, but for
a reason I did not believe. The criterion that does the real work is independent public
access. The test now reads:

> A room inside a larger venue counts if a reader can walk in and dine on its own terms —
> without a ticket, admission, or entry to a separate event.

Applied uniformly: Gordon Ramsay Steak (walk-in casino floor) PASS; RW Prime (Resorts World,
free entry) PASS; Bogie's Place PASS — and it would have passed the old wording too, since
25 Temple Place is its own address, distinct from jm Curley's 21 Temple Place. NYY Steak,
Lobel's and the Audi Yankees Club sit behind a stadium gate on game days: FAIL.

**Chain-outpost rule.** National *fine-dining* steakhouses (Capital Grille, Ruth's Chris,
Morton's, Fleming's, Smith & Wollensky, Fogo de Chao, Mastro's, Del Frisco's) COUNT — they
are steakhouses under the rule. National *casual* chains (Outback, LongHorn, Texas
Roadhouse) do NOT — they are not destination rooms. Applied uniformly.

---

## LONDON — 37 rooms — BUILD
Hawksmoor Spitalfields | 157a Commercial St E1 | steakhouse | PASS
Hawksmoor Seven Dials | 11 Langley St WC2 | steakhouse | PASS
Hawksmoor St Pancras | Kings Cross | World's 101 Best Steak 2026 #13 | PASS
Hawksmoor Borough | 16 Winchester Walk SE1 | steakhouse | PASS
Hawksmoor Guildhall | 10 Basinghall St EC2 | steakhouse | PASS
Hawksmoor Air Street | 5a Air St W1 | steakhouse | PASS
Hawksmoor Wood Wharf | Canary Wharf | steakhouse | PASS
Goodman Mayfair | 26 Maddox St W1 | steakhouse | PASS
Goodman City | 11 Old Jewry EC2 | steakhouse | PASS
Goodman Canary Wharf | 3 South Quay | steakhouse | PASS
Blacklock Soho | 24 Great Windmill St W1 | chop house, beef centre | PASS
Blacklock City | 13 Philpot Lane EC3 | chop house | PASS
Blacklock Shoreditch | Rivington St | chop house | PASS
Blacklock Covent Garden | Covent Garden | chop house | PASS
Gaucho Piccadilly | 25 Swallow St W1 | Argentine parrilla | PASS
Gaucho Tower Bridge | 2 More London Place | Argentine parrilla | PASS
Gaucho Charlotte Street | Fitzrovia | Argentine parrilla | PASS
Gaucho Smithfield | Smithfield | Argentine parrilla | PASS
Flat Iron Covent Garden | 17 Henrietta St | single-cut steak room | PASS
Flat Iron Soho | 17 Beak St | single-cut steak room | PASS
Beast | 3 Chapel Place W1 | beef and crab only | PASS
Zelman Meats Soho | 2 St Anne's Court | steakhouse | PASS
Smith & Wollensky | 1-11 John Adam St WC2 | steakhouse | PASS
Sophie's Steakhouse Soho | 46 Great Windmill St | steakhouse | PASS
Sophie's Steakhouse Chelsea | 311 Fulham Rd | steakhouse | PASS
M Restaurant Threadneedle | Threadneedle St EC2 | steakhouse | PASS
CUT at 45 Park Lane | 45 Park Lane W1 | steakhouse | PASS
STK London | 336 Strand | steakhouse | PASS
Boisdale of Belgravia | 15 Eccleston St | Scottish beef | PASS
Guinea Grill | 30 Bruton Place W1 | 101 Best #99 | PASS
Lutyens Grill | The Ned, 27 Poultry EC2 | 101 Best #35 | PASS
The Devonshire | 17 Denman St, Soho | 101 Best #45 | PASS
Brat | 4 Redchurch St, Shoreditch | 101 Best #17, whole-beef fire | PASS
Ibai | London | 101 Best #7 | PASS
Chelsea Grill | Chelsea | 101 Best #55 | PASS
Sagardi | 95 Curtain Rd, Shoreditch | 101 Best #90, Basque txuleta | PASS
Zoilo | 9 Duke St W1 | 101 Best #96, Argentine | PASS
Cluster: Mayfair / Soho / City core; Hawksmoor and Gaucho spread borough-wide.

## MANHATTAN — 40 rooms — BUILD
Keens | 72 W 36th St | steakhouse, 1885 | PASS | ALREADY OWNED: manhattan/garment-district.json
Gallaghers | 228 W 52nd St | steakhouse | PASS
Sparks | 210 E 46th St | steakhouse | PASS
Smith & Wollensky | 797 Third Ave | steakhouse | PASS
Benjamin Steakhouse | 52 E 41st St | steakhouse | PASS
Benjamin Prime | 23 E 40th St | steakhouse | PASS
Quality Meats | 57 W 58th St | steakhouse | PASS
Club A Steakhouse | 240 E 58th St | steakhouse | PASS
Royal 35 Steakhouse | 35 W 35th St | steakhouse | PASS
Del Frisco's Double Eagle | 1221 Sixth Ave | steakhouse; OPEN, prior of 2020 closure corrected | PASS
The Capital Grille | 155 E 42nd St | steakhouse | PASS
Morton's | 551 Fifth Ave | steakhouse | PASS
Wolfgang's Park Ave | 4 Park Ave | steakhouse | PASS | ALREADY OWNED: manhattan/murray-hill.json
Wolfgang's Times Square | 250 W 41st St | steakhouse | PASS
Wolfgang's Tribeca | 409 Greenwich St | steakhouse | PASS
Empire Steak House | 36 W 52nd St | steakhouse | PASS
Bobby Van's | 230 Park Ave | steakhouse | PASS
Hunt & Fish Club | 125 W 44th St | steakhouse | PASS
Cuerno | Midtown | Spanish beef room, Infatuation steak guide | PASS
The Grill | 99 E 52nd St | Infatuation steak guide, prime rib trolley | PASS
Churrascaria Plataforma | 316 W 49th St | churrascaria; Tribeca site closed 2014, this one open | PASS
Angus Club Steakhouse | 135 E 55th St | steakhouse | PASS
Tuscany Steakhouse | 117 W 58th St | steakhouse | PASS
Ben & Jack's | 219 E 44th St | steakhouse | PASS
Uncle Jack's | 44 W 56th St | steakhouse | PASS
Nusr-Et | 60 E 53rd St | steakhouse | PASS
Mastro's | 1285 Sixth Ave | steakhouse | PASS
Delmonico's | 56 Beaver St | steakhouse, reopened 2023 | PASS | ALREADY OWNED: manhattan/financial-district.json
MarkJoseph | 261 Water St | steakhouse | PASS
Bourbon Steak | Financial District | steakhouse | PASS
Boucherie Union Square | 225 Park Ave S | Infatuation steak guide | PASS
Buenos Aires | 513 E 6th St | Argentine parrilla | PASS
Golden Steer | Greenwich Village | steakhouse, Infatuation #1 | PASS
4 Charles Prime Rib | 4 Charles St | prime rib room | PASS
Strip House | 13 E 12th St | steakhouse | PASS
Hawksmoor NYC | 109 E 22nd St | steakhouse | PASS
Cote | 16 W 22nd St | Korean beef room | PASS | ALREADY OWNED: manhattan/flatiron-district.json
Old Homestead | 56 Ninth Ave | steakhouse, 1868 | PASS | ALREADY OWNED: manhattan/meatpacking-district.json
STK Meatpacking | 26 Little W 12th St | steakhouse | PASS
Brooklyn Chop House Times Square | 253 W 47th St | chop house | PASS
REJECTED: The Palm 837 Second Ave and Palm Too 840 Second Ave (both permanently closed);
Minetta Tavern and Balthazar (bistro/brasserie, excluded by the rule).
Cluster: Midtown 34th-58th carries 27 of 40; second cluster FiDi/Village.
ALREADY OWNED elsewhere in priv/seed_data (5): Keens, Delmonico's, COTE, Old Homestead,
Wolfgang's Park Avenue — all in the neighbourhood corpus under manhattan/, NOT in korean_bbq.
korean_bbq/manhattan.json has places: [] and files its entries into the borough corpora, so
it owns nothing here. Task 7 onward must link these five to their manhattan/ owners.

## BROOKLYN — 19 rooms — BUILD
Peter Luger | 178 Broadway, Williamsburg | steakhouse, 1887 | PASS | ALREADY OWNED: brooklyn/south-williamsburg.json
St. Anselm | 355 Metropolitan Ave, Williamsburg | grill, beef centre | PASS
DeStefano's | 89 Conselyea St, Williamsburg | steakhouse | PASS
Salt + Charcoal | 171 Grand St, Williamsburg | Japanese wagyu/yakiniku | PASS
Gage & Tollner | 372 Fulton St, Downtown | chop house, 1879 / reopened 2021 | PASS | ALREADY OWNED: brooklyn/downtown-brooklyn.json
Gus's Chop House | 445 Court St, Carroll Gardens | chop house | PASS
The Loft Steakhouse | Midwood | kosher steakhouse | PASS
Amber Steakhouse | Midwood | kosher steakhouse | PASS
Mabat Steak House | 1809 E 7th St, Midwood | kosher steakhouse | PASS
Jerusalem Steakhouse | Midwood | kosher steakhouse | PASS
Glatt A La Carte | 5123 18th Ave, Borough Park | kosher steakhouse | PASS
Meat | Midwood | kosher steakhouse | PASS
Chadwick's | 8822 Third Ave, Bay Ridge | steakhouse | PASS
Embers | 9519 Third Ave, Bay Ridge | steakhouse | PASS
Malone's Chop House | Bay Ridge | chop house | PASS
Libertador | Park Slope | Argentine parrilla | PASS
Peaches Prime | Bed-Stuy | steakhouse | PASS
Hunter's Steak & Ale House | Sheepshead Bay | steakhouse | PASS
Fogo de Chao Brooklyn | Downtown | churrascaria | PASS
Clusters: Williamsburg 4, Midwood/Borough Park kosher belt 6, Bay Ridge 3, Downtown 2.
ALREADY OWNED (2): Peter Luger (brooklyn/south-williamsburg.json — note the node is
south-williamsburg, not williamsburg), Gage & Tollner (brooklyn/downtown-brooklyn.json).

## QUEENS — 17 rooms — BUILD
La Cabana Argentina | 86-07 Northern Blvd, Jackson Heights | Argentine parrilla | PASS
El Gauchito | 86-24 Northern Blvd, Jackson Heights | Argentine parrilla | PASS
El Gauchito Fresh Meadows | Fresh Meadows | Argentine parrilla | PASS
El Chivito d'Oro | 84-02 37th Ave, Jackson Heights | Uruguayan/Argentine parrilla | PASS
La Esquina Criolla | 94-67 Corona Ave, Elmhurst | parrillada completa | PASS
La Fusta | 80-32 Baxter Ave, Elmhurst | Argentine steak house | PASS
Boca Junior | Elmhurst | Argentine steakhouse | PASS
Rainhas Churrascaria | Corona | churrascaria | PASS
Fogo de Chao | Queens Place, Elmhurst | churrascaria | PASS
Christos Steak House | 41-08 23rd Ave, Astoria | steakhouse | PASS
Meet The Meat | Astoria | steakhouse | PASS
Uncle Jack's | 39-40 Bell Blvd, Bayside | steakhouse | PASS
(aged.) | Forest Hills | steakhouse | PASS
Prime Met | 136-20 38th Ave, Flushing | steakhouse | PASS
RW Prime | Resorts World, South Ozone Park | steakhouse; passes venue test | PASS
Hapisgah | Flushing | Israeli beef grill | PASS
Iron Age Korean Steakhouse | Rego Park | Korean beef room | PASS | ALREADY OWNED: queens/rego-park.json
REJECTED: LongHorn Elmhurst, Outback Flushing (casual chains); Rafaelis Palace (catering
hall); Danny's French Cuisine; Madera Cuban Grill; Tokyo Steak House (hibachi, not a wagyu
counter); Rocco's; The Palm Bar & Grille Jamaica (Caribbean bar).
Cluster: 8 of 17 on the parrilla belt through Jackson Heights, Elmhurst and Corona
(La Cabana, El Gauchito JH, El Chivito d'Oro, La Esquina Criolla, La Fusta, Boca Junior,
Rainhas, Fogo). Astoria adds 2. The other 7 are outliers in their own neighbourhoods:
Fresh Meadows (El Gauchito's second site), Rego Park, Bayside, Forest Hills, Flushing x2 and
South Ozone Park. Fix round 2: the belt was previously overstated as 9 and Fresh Meadows was
missing from the outlier list.
ALREADY OWNED (1): Iron Age Korean Steakhouse (queens/rego-park.json).

## THE BRONX — 6 rooms — BELOW BAR, merged into Manhattan
Jake's Steakhouse | 6031 Broadway, Riverdale | steakhouse | PASS
Arnauld's Steak & Seafood | Riverdale | steakhouse | PASS
Riverdale Steak House | Riverdale | steakhouse | PASS
Fiorentina Steakhouse | 3617 E Tremont Ave, Throgs Neck | USDA Prime dry-aged | PASS
Willie's Steak House | 1832 Westchester Ave, Parkchester | steakhouse, 35+ years | PASS
Parrilla Latina Steakhouse | Bronx | Latin parrilla | PASS
REJECTED: NYY Steak, Lobel's, Audi Yankees Club (fail the venue-embedded test);
Joe's Place (Puerto Rican, steak not the centre); Sea Shore (City Island seafood);
El Taquitos; Peter Luger "Bronx" (does not exist — Williamsburg and Great Neck);
Empire City Chophouse (Yonkers, Westchester County).
CORRECTION (fix round 1): there IS a cluster — Jake's, Arnauld's and Riverdale Steak House
are all Riverdale, 3 of 6. The count is what fails: 6 < 8.

## STATEN ISLAND — 4 rooms — BELOW BAR, drop
Raval Steakhouse | 12 Minthorne St, Tompkinsville | dry-aged prime, opened Dec 2024 | PASS
Ruddy & Dean | 44 Richmond Terrace, St. George | prime aged steaks | PASS
SI Steak House | 315 Sand Lane, South Beach | steakhouse, opened Oct 2022 | PASS
West Shore Inn | 3955 Victory Blvd, Bulls Head | steak and seafood | PASS
REJECTED: Filippo's Italian Steakhouse (86 Page Ave — Italian restaurant with steak);
Page Plaza; Sakana (sushi); Max's Es-Ca; Villa Paradiso; Stone House at Clove Lakes;
Santorini; and the SEO phantoms Bobby Flay Steak, Del Frisco's Grille and Strickland's,
none of which exist on Staten Island.
No cluster: four rooms in four separate neighborhoods.

## CHICAGO — 24 rooms — BUILD, no split
Bavette's Bar & Boeuf | 218 W Kinzie St, River North | chop house | PASS
Gene & Georgetti | 500 N Franklin St, River North | steakhouse, 1941 | PASS
Chicago Cut | 300 N LaSalle, River North | steakhouse | PASS
Gibsons Bar & Steakhouse | 1028 N Rush St, Gold Coast | steakhouse, 1989 | PASS
Gibsons Italia | 233 N Canal St, West Loop | steakhouse | PASS
Swift & Sons | 1000 W Fulton Market, West Loop | steakhouse | PASS
RPM Steak | 66 W Kinzie St, River North | steakhouse | PASS
Maple & Ash | 8 W Maple St, Gold Coast | steakhouse | PASS
Steak 48 | 615 N Wabash, River North | steakhouse | PASS
Prime & Provisions | 222 N LaSalle, Loop | steakhouse | PASS
Chicago Chop House | 60 W Ontario St, River North | chop house | PASS
Kinzie Chophouse | 400 N Wells St, River North | chop house | PASS
Rosebud Steakhouse | 192 E Walton St, Mag Mile | steakhouse | PASS
Michael Jordan's Steak House | 505 N Michigan Ave | steakhouse | PASS
Smith & Wollensky | 318 N State St | steakhouse | PASS
Mastro's | 520 N Dearborn St | steakhouse | PASS
Morton's | 1050 N State St, Gold Coast | steakhouse, born here | PASS
The Capital Grille | 633 N St Clair St | steakhouse | PASS
Joe's Seafood Prime Steak | 60 E Grand Ave | steakhouse | PASS
La Grande Boucherie | River North | beef-centric grill | PASS
Fogo de Chao | 661 N LaSalle Dr | churrascaria | PASS
Iron Age Korean Steakhouse | Wicker Park | Korean beef room | PASS | ALREADY OWNED: korean_bbq/chicago.json
Perilla Steakhouse | Chicago | Korean steakhouse | PASS | ALREADY OWNED: korean_bbq/chicago.json
Shinhwa Korean Steakhouse | Chicago | Korean beef room | PASS | ALREADY OWNED: korean_bbq/chicago.json
All 24 inside the city limits: 21 in the River North / Gold Coast / Loop / West Loop core
plus three Korean steakhouses added in fix round 2. Suburban Gibsons Oak Brook / Rosemont and
Wildfire NOT needed. Inverse of korean_bbq Chicago: no north-suburbs page.
ALREADY OWNED (3): Iron Age Wicker Park, Perilla Steakhouse, Shinhwa Korean Steakhouse — all
korean_bbq/chicago.json. Iron Age Glenview is the north-suburbs page's and stays there.

## LOS ANGELES — 24 rooms — BUILD (page covers City of LA + Beverly Hills + West Hollywood)
-- City of Los Angeles (15) --
Woo Hyang Woo | Koreatown | Korean beef room | PASS
Taylor's Steakhouse | 3361 W 8th St, Koreatown | steakhouse, 1970 | PASS
Vaca DTLA | Downtown | steakhouse | PASS
Malbec Arts District | Downtown | Argentine parrilla | PASS
Butchr Bar | Echo Park | beef-centric | PASS
Dunsmoor | Glassell Park | hearth beef | PASS
Chi Spacca | 6610 Melrose Ave, Hancock Park | beef-centric | PASS
Gwen | 6600 Sunset Blvd, Hollywood | butcher/steak, Michelin star | PASS
Kali | Larchmont | steak-centric | PASS
Alto | Studio City | steakhouse | PASS
BLVD Steak | Sherman Oaks | steakhouse | PASS
Charcoal Venice | Venice | live-fire beef | PASS
Niku X | Downtown | wagyu-centric | PASS
Carlitos Gardel | 7963 Melrose Ave, Beverly Grove (City of LA) | Argentine parrilla | PASS
Smith & Wollensky | Century City | steakhouse | PASS
-- Beverly Hills (7), separate municipality --
CUT | 9500 Wilshire Blvd | steakhouse | PASS
Mastro's | 246 N Canon Dr | steakhouse | PASS
Lawry's The Prime Rib | 100 N La Cienega Blvd | prime rib room | PASS
Steak 48 | 9701 Wilshire Blvd | steakhouse | PASS
Matu | 239 S Beverly Dr | single-breed beef room | PASS
Wolfgang's | 445 N Canon Dr | steakhouse | PASS
Nusr-Et | 9250 Wilshire Blvd | steakhouse | PASS
-- West Hollywood (2), separate municipality --
BOA Steakhouse | 9200 Sunset Blvd | steakhouse | PASS
Dan Tana's | 9071 Santa Monica Blvd | steak-centric | PASS
EXCLUDED as outside the page radius: The Arthur J (Manhattan Beach), Dal Rae (Pico
Rivera), The Old Place (Agoura Hills).
No split: the City of LA holds 15 on its own, so Beverly Hills is not the korean_bbq
Chicago case. Nodes needed: beverly-hills (7 rooms), west-hollywood (2 rooms).

## SAN FRANCISCO — 15 rooms — BUILD, no South Bay split
Harris' Restaurant | 2100 Van Ness Ave, Nob Hill | steakhouse | PASS
House of Prime Rib | 1906 Van Ness Ave, Nob Hill | prime rib room | PASS
The Vault Steakhouse | 555 California St, FiDi | steakhouse | PASS
Epic Steak | 369 The Embarcadero | steakhouse | PASS
Morton's | 400 Post St, Union Square | steakhouse | PASS | ALREADY OWNED: san_francisco/union-square.json
Ruth's Chris | 1601 Van Ness Ave | steakhouse | PASS
Niku Steakhouse | 61 Division St, Design District | Japanese A5, Michelin | PASS
5A5 Steak Lounge | 244 Jackson St | A5 wagyu | PASS
Bobo's | 1450 Lombard St, Marina | steakhouse | PASS
Brazen Head | 3166 Buchanan St, Cow Hollow | steak-centric | PASS
Lolinda | 2518 Mission St | Argentine parrilla | PASS
Espetus Churrascaria | 1686 Market St | churrascaria | PASS
Fogo de Chao | 201 Third St | churrascaria | PASS
Alexander's Steakhouse | Union Square | steakhouse, wagyu program | PASS | ALREADY OWNED: san_francisco/union-square.json
ABSteak by Akira Back | Union Square | Korean-inflected steakhouse | PASS | ALREADY OWNED: san_francisco/union-square.json
NOT COUNTED: Alfred's Steakhouse (post-2020 status not verifiable — a different room from
Alexander's, which is counted).
All 15 inside the city. No Santa Clara mass pulls the page south. Fix round 2 added
Alexander's Steakhouse and ABSteak, both already published by the san_francisco corpus and
missed by the first census — the miss that proved the overlap was wider than korean_bbq.
Clusters: Van Ness / Nob Hill 3, Union Square 3, FiDi / Embarcadero 3, Marina / Cow Hollow 2,
Market / SoMa 2, Design District 1, Mission 1.
ALREADY OWNED (3): Morton's, Alexander's Steakhouse, ABSteak — all san_francisco/union-square.json.

## SEATTLE — 22 rooms — BUILD as Seattle, NOT Puget Sound
Metropolitan Grill | 820 Second Ave, Downtown | steakhouse | PASS
El Gaucho | 2505 First Ave, Belltown | steakhouse | PASS
The Butcher's Table | 2121 Westlake Ave, South Lake Union | steakhouse | PASS
The Capital Grille | 1301 Fourth Ave, Downtown | steakhouse | PASS
Ruth's Chris | 727 Pine St, Downtown | steakhouse | PASS
Spencer's for Steaks and Chops | Downtown | steakhouse | PASS
Daniel's Broiler Downtown | Downtown | steakhouse | PASS
Daniel's Broiler Lake Union | 809 Fairview Pl N | steakhouse | PASS
Daniel's Broiler Leschi | 200 Lake Washington Blvd | steakhouse | PASS
Red Cow | Seattle | steak frites room, beef centre | PASS
BOCA at Queen City Grill | Belltown | steakhouse | PASS
Fogo de Chao | Downtown | churrascaria | PASS
Bateau | 1040 E Union St, Capitol Hill | whole-animal steak room | PASS
The Shambles | Seattle | butcher-bar, beef centre | PASS
Buenos Aires Grill | 220 Virginia St | Argentine parrilla | PASS
The Grill From Ipanema | Capitol Hill | churrascaria | PASS
Asadero | 5405 Leary Ave NW, Ballard | Sonoran asado | PASS
JaK's Grill Ballard | Ballard | steakhouse | PASS
JaK's Grill Queen Anne | Queen Anne | steakhouse | PASS
Wedgwood Broiler | 8515 35th Ave NE | steakhouse, 40+ years | PASS
FlintCreek Cattle Co | 8421 Greenwood Ave N | grass-fed beef room | PASS
Kokkaku | Belltown | Japanese wagyu counter | PASS
All 22 inside the city limits. Bellevue's John Howie Steak is the only notable suburban
room and the page does not need it. Direct inversion of korean_bbq's Puget Sound.

## BOSTON — 12 rooms — BUILD
Grill 23 & Bar | 161 Berkeley St, Back Bay | steakhouse, 1983 | PASS
Abe & Louie's | 793 Boylston St, Back Bay | steakhouse | PASS
The Capital Grille | 900 Boylston St, Back Bay | steakhouse | PASS
Ocean Prime | 140 Seaport Blvd, Seaport | steakhouse | PASS
Davio's | 75 Arlington St, Back Bay | steak-centric | PASS
Smith & Wollensky | 101 Arlington St, Back Bay | steakhouse | PASS
Mooo.... | 15 Beacon St, Beacon Hill | steakhouse | PASS
Mooo Seaport | 100 Northern Ave, Seaport | steakhouse | PASS
Del Frisco's Double Eagle | 250 Northern Ave, Seaport | steakhouse | PASS
Mastro's | Seaport | steakhouse | PASS
Bogie's Place | 25 Temple Pl, Downtown Crossing | steakhouse inside jm Curley; own address | PASS
Ruth's Chris | 45 School St, Old City Hall | steakhouse | PASS
Clusters: Back Bay 5 (Grill 23, Abe & Louie's, Capital Grille, Davio's, Smith & Wollensky),
Seaport 4 (Mooo Seaport, Del Frisco's, Mastro's, Ocean Prime), Beacon Hill 1 (Mooo....),
Downtown 2 (Bogie's Place, Ruth's Chris). 5+4+1+2 = 12.
Fix round 2: Back Bay was overstated as 6 and Seaport left Ocean Prime unassigned. Ocean Prime
is 140 Seaport Blvd, so it is a Seaport room, not a Back Bay one.

## WASHINGTON DC — 17 rooms — BUILD, THE DISTRICT ONLY
The Prime Rib | 2020 K St NW | steakhouse | PASS
Bourbon Steak | 2800 Pennsylvania Ave NW, Georgetown | steakhouse | PASS
CUT by Wolfgang Puck | 1050 31st St NW, Georgetown | steakhouse | PASS
Joe's Seafood Prime Steak | 750 15th St NW | steakhouse | PASS
Mastro's | 600 13th St NW | steakhouse | PASS
RARE Steakhouse & Tavern | 1595 I St NW | steakhouse | PASS
Charlie Palmer Steak | 101 Constitution Ave NW | steakhouse | PASS
The Capital Grille | 601 Pennsylvania Ave NW | steakhouse | PASS
Smith & Wollensky | 1112 19th St NW | steakhouse | PASS
Bobby Van's Grill | 809 15th St NW | steakhouse | PASS
Morton's | 1050 Connecticut Ave NW | steakhouse | PASS
Fogo de Chao | 1101 Pennsylvania Ave NW | churrascaria | PASS
Medium Rare Cleveland Park | 3500 Connecticut Ave NW | single-cut steak room | PASS
Medium Rare Capitol Hill | 515 8th St SE | single-cut steak room | PASS
St. Anselm DC | 1250 Fifth St NE, Union Market | grill, beef centre | PASS
Char Bar Kosher Steaks | 2142 L St NW | kosher steakhouse | PASS
The Palm DC | 1225 19th St NW | steakhouse | PASS
SPEC Q4 ANSWERED: the District, NOT DC plus Northern Virginia. Same rule as Seattle —
measure inside the limits first and extend only if the core cannot sustain a page. It can:
17 rooms on the K Street corridor with a Georgetown node. Northern Virginia is a separate
suburban chain corridor (Tysons: Ruth's Chris, Fleming's, Capital Grille, Fogo, Morton's,
Eddie V's, Chima, Wildfire, 801 Chophouse, Randy's; Arlington: Oak Steakhouse, Guerra,
1799 Prime, Seoul Prime). It is dense enough to be its own page one day, but it is not one
of the fourteen candidates and folding it in would repeat the Puget Sound mistake in
reverse — dragging a self-sufficient core out to a suburb it does not need.

## BALTIMORE — 7 rooms — BELOW BAR, drop
The Prime Rib | 1101 N Calvert St, Mount Vernon | steakhouse, 1965, independent | PASS
The Ruxton | 720 Aliceanna St, Harbor East | steakhouse, opened Mar 2024, independent | PASS
Rec Pier Chop House | 1715 Thames St, Fells Point | chop house | PASS
The Capital Grille | 500 E Pratt St, Inner Harbor | steakhouse | PASS
Fogo de Chao | 600 E Pratt St, Inner Harbor | churrascaria | PASS
Ruth's Chris | 711 Eastern Ave, Pier 5 | steakhouse | PASS
Gordon Ramsay Steak | 1525 Russell St | steakhouse; passes the venue test | PASS
STRUCK in fix round 1: **Fleming's Harbor East** — The Ruxton opened in March 2024 in the
former Fleming's space at 720 Aliceanna St. I had counted both. Same address, successive
tenants; one room, not two. This is the error that actually moves Baltimore, and it is mine.
NOT COUNTED: Sullivan's (status not verifiable).
REVIEW PREMISES CORRECTED: The Ruxton is Harbor East, Baltimore CITY, not Ruxton in
Baltimore County — it took over the Fleming's space next to the Marriott Waterfront.
Gordon Ramsay Steak has its own street address and walk-in access, so unlike NYY Steak it
passes the venue test. Both review reasons were wrong; the conclusion is right anyway.
7 < 8. Fails the same bar the Bronx failed.

## MIAMI — 20 rooms — BUILD (page covers Miami + Miami Beach + Coral Gables + Aventura)
-- Miami (9) --
Sunny's Steakhouse | 7228 NW Miami Ct, Little River | steakhouse | PASS
COTE Miami | 3900 NE 2nd Ave, Design District | Korean steakhouse | PASS
Dirty French Steakhouse | 1200 Brickell Ave | steakhouse | PASS
Fiorito | Little Haiti | Argentine parrilla | PASS
El Toro Loco | Little Havana | steakhouse | PASS
Ocean Prime | 900 S Miami Ave, Brickell | steakhouse | PASS
Fleming's | 600 Brickell Ave | steakhouse | PASS
Baires Grill Brickell | Brickell | Argentine parrilla | PASS
Los Ranchos | Bayside, Downtown | Nicaraguan churrasco | PASS
-- Miami Beach (8), separate municipality --
Prime 112 | 112 Ocean Dr, South of Fifth | steakhouse | PASS
Papi Steak | 736 First St, South of Fifth | chophouse | PASS
Smith & Wollensky | 1 Washington Ave, South Pointe | steakhouse | PASS
Red South Beach | 119 Washington Ave | steakhouse | PASS
Meat Market | 915 Lincoln Rd | steakhouse | PASS
Los Fuegos | 3201 Collins Ave, Faena | Argentine parrilla, Mallmann | PASS
STK South Beach | 2377 Collins Ave | steakhouse | PASS
Fogo de Chao | 836 First St | churrascaria | PASS
-- Coral Gables (2), separate municipality --
Daniel's Miami | Coral Gables | steakhouse | PASS
Christy's | 3101 Ponce de Leon Blvd | steakhouse | PASS
-- Aventura (1), separate municipality --
Bourbon Steak | 19999 W Country Club Dr | steakhouse | PASS
No split: Miami proper holds 9 on its own and the city's own tourism board publishes a
single steakhouse list spanning all four municipalities.
Nodes needed: miami-beach (8), coral-gables (2), aventura (1).

---

## Exact totals

| city | rooms | verdict |
|---|---|---|
| Manhattan | 40 | build |
| London | 37 | build |
| Los Angeles | 24 | build |
| Chicago | 24 | build |
| Seattle | 22 | build |
| Miami | 20 | build |
| Brooklyn | 19 | build |
| Washington DC | 17 | build |
| Queens | 17 | build |
| San Francisco | 15 | build |
| Boston | 12 | build |
| Baltimore | 7 | DROP (below the 8-room bar) |
| The Bronx | 6 | MERGED into manhattan (below bar) |
| Staten Island | 4 | DROP (below bar, no cluster) |

BUILD 11 · DROP 2 · MERGE 1 · total 14 rows.

## Overlap register — checked against ALL of priv/seed_data, not korean_bbq alone

Fix round 2. A strict scan of every `places` array in `priv/seed_data/` for steakhouse-shaped
restaurants returns 29 rows; 13 of them are rooms in this wave's census. The first pass
recorded exactly one overlap and named the wrong owner for it.

| room | already owned by | wave city |
|---|---|---|
| Keens Steakhouse | manhattan/garment-district.json | Manhattan |
| Delmonico's | manhattan/financial-district.json | Manhattan |
| COTE Korean Steakhouse | manhattan/flatiron-district.json | Manhattan |
| Old Homestead Steakhouse | manhattan/meatpacking-district.json | Manhattan |
| Wolfgang's Steakhouse (Park Avenue) | manhattan/murray-hill.json | Manhattan |
| Peter Luger Steak House | brooklyn/south-williamsburg.json | Brooklyn |
| Gage & Tollner | brooklyn/downtown-brooklyn.json | Brooklyn |
| Iron Age Korean Steakhouse | queens/rego-park.json | Queens |
| Iron Age Korean Steakhouse | korean_bbq/chicago.json | Chicago |
| Perilla Steakhouse | korean_bbq/chicago.json | Chicago |
| Shinhwa Korean Steakhouse | korean_bbq/chicago.json | Chicago |
| Morton's The Steakhouse | san_francisco/union-square.json | San Francisco |
| Alexander's Steakhouse | san_francisco/union-square.json | San Francisco |
| ABSteak by Akira Back | san_francisco/union-square.json | San Francisco |

Two corrections this forced. **korean_bbq/manhattan.json has `places: []`** — it files its
entries into the borough corpora — so it owns nothing in Manhattan and COTE's owner is
`manhattan/flatiron-district.json`. And the neighbourhood corpora own steakhouses in their
own right, which is how the San Francisco census missed two published rooms.

Non-overlaps confirmed: no steakhouse-shaped place in `london/` or `bronx/`; the Belmont meat
markets in `bronx/` are `kind: shop`, not restaurants. Baltimore, Boston, Washington DC, Los
Angeles, Miami, Seattle and Staten Island have no corpus of their own, so no overlap is
possible there. Connecticut's steakhouses (Joseph's, J. Gilbert's, Chuck's, Michael Jordan's
Montville) belong to the Connecticut corpus and none is in a wave city.

## Nodes Task 3 must create
- united-states/california/beverly-hills — 7 LA-page rooms
- united-states/california/west-hollywood — 2 LA-page rooms
- united-states/florida/miami-beach — 8 Miami-page rooms
- united-states/florida/coral-gables — 2 Miami-page rooms
- united-states/florida/aventura — 1 Miami-page room
Precedent: priv/seed_data/korean_bbq/puget-sound.json is one guide whose 16 places carry 11
different destination_path values across 11 municipalities. Guide node and place node are
independent there, so the same pattern applies here. No new guide node is needed.
