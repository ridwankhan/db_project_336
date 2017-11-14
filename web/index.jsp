<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BarManager</title>
  <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">


  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.8.23/jquery-ui.js"></script>


  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <!-- =======================================================
    Theme Name: Medilab
    Theme URL: https://bootstrapmade.com/medilab-free-medical-bootstrap-theme/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->

<script>
  $( function() {
      var availableBars =
          [ "12th Air Command" , "13th Floor At The Belvedere" , "2nd Street Music Hall" , "901 Pub" , "A Better Place" , "Abe & Jake's Landing" , "Abg" , "Abm Global Strategies" , "Abode" , "Ace Liquor" , "Adagio Lounge" , "Adirondack Accommodations" , "Aficionados" , "Airport Lounge" , "Alaskan Hotel & Bar Inc" , "Albatross Bar" , "Ale House" , "Alfred's" , "All That Jazz Lounge" , "Allie's" , "Alternative" , "Amber Inn" , "America's Pub" , "Amvets" , "Andrew Blairs Llc" , "Andy's Crossroads Liquor" , "Angelo's" , "Animal House" , "Another Round Bar & Grill" , "Aqua Nightclub" , "Arjon's International Club" , "Arlene Grocery" , "Around The Corner Pub" , "Arthur J Brunner" , "Arthur S Tavern" , "Arthur's" , "Atlantis Nightclub & Cabaret" , "Au Bar" , "Automatic Slim's" , "Avenue Ale House" , "B & W Contracting" , "Backstage Lounge" , "Backstage Sports Bar & Grill" , "Backstreet Jazz & Blues Club" , "Baha Rock Club" , "Bailey's Pub & Grille" , "Bair's Den Restaurant & Lounge" , "Balcony" , "Balloons Restaurant & Night" , "Ballyhoo Tavern" , "Bamboo Willie's Beachside Bar" , "Bananas" , "Bandaids Show Lounge" , "Bar 13 Inc" , "Bar 44" , "Bar Bar" , "Bar Charlotte" , "Bar Investment Group" , "Bar Louie" , "Bar Of Wausau" , "Bar Orlando" , "Barenecessity Lounge" , "Bargainartusa" , "Barie's Bar & Grill" , "Barney's" , "Baron's Pub & Restaurant" , "Barry's Nightclub" , "Basso Bar" , "Bavarian Beer Nuts" , "Beachland Ballroom & Tavern" , "Bead-Dazzled Jewelry Designs" , "Beagle" , "Bear Belly Bar Grill" , "Bearno's Pizza" , "Bedford Tavern" , "Beechwood Inn" , "Beef House" , "Beer Garden" , "Bell Bottoms" , "Bell In Hand Tavern" , "Bell Street Tavern" , "Bella Martini" , "Belloo's" , "Benchwarmers" , "Benson's Tavern" , "Bentleys Bar & Grill" , "Bentwood Tavern" , "Bentz Street Raw Bar" , "Bernie's" , "Beulahland" , "Bibby Insurance Agency" , "Big Al's" , "Big Bang" , "Big Buck Brewery & Steakhouse" , "Big Chicks" , "Big Play Entertainment" , "Big Rock Candy Mountain" , "Big Shots Nightclub & Chasers" , "Bin 71" , "Birmingham Bridge Tavern" , "Bitter End Pub Llc" , "Black Bear Inn" , "Blanchard's Tavern" , "Blarney Stone Sports Bar-Grill" , "Blind Tiger" , "Blind Tiger Ale House" , "Bloomfields Tavern" , "Bloomingdale Place" , "Blu Tavern Restaurant & Motel" , "Blue Bayou Club" , "Blue Cats" , "Blue Danube" , "Blue Moon Cafe" , "Blue Moon Lounge" , "Blue Water Inn" , "Bluebird" , "Blues Beer Company" , "Blues On Grand" , "Blush" , "Bo's 'N Mine" , "Bob's" , "Boba Bar" , "Bogart's" , "Boheme Bistro" , "Boiling Point Seafood & Oyster" , "Bolero Motel & Cocktail Lounge" , "Bone Store" , "Bonge's Tavern Inc" , "Boomer's Adult Entertainment" , "Boomers" , "Boomers Night Club" , "Boot Rack Saloon" , "Boot Scootn Saloon" , "Bop" , "BORDER CHOP HOUSE" , "Boro Bar & Grill" , "Borrowed Bucks Roadhouse" , "Boss" , "Bottom Line" , "Bountiful Baskets & Coffee Creations" , "Bourbon Street Pub" , "Bouy Bar" , "Bowery Poetry Club" , "Boxcar" , "Boynton Restaurant & Spirits" , "Boz's Sport's Bar" , "Bradfordville Blues Club" , "Brewballs" , "Brewery" , "Brewski's" , "Brick Alley Pub & Restaurant" , "Brick Tavern" , "Brickhouse Connie's" , "Brigett's Last Laugh" , "Broken Oar Bar & Grill" , "Brookhaven White Collar Unit" , "Brookside Inn Inc" , "Brothers Bar" , "Brothers Bar & Grill" , "Broward Yacht Sales" , "Brownstone Lounge" , "Bru's Room Sports Grill Sports" , "Brubakers Pub" , "Bryant's Cocktail Lounge" , "Bryant's Ice House" , "Bs West" , "Buck Mulligan's Irish Pub" , "Buck Wild" , "Buck's Club" , "Buckhead Saloon" , "Buddy & Pals Place" , "Buffalo's Bar & Grill" , "Bugsy's Speakeasy" , "Bull's Eye Saloon & Restaurant" , "Bulldog Midcity" , "Bullfrog Charts" , "Bungalow Inn" , "Bus Stop" , "Bushy's" , "Busted Shovel" , "Buster's" , "Butler's Bar & Grill" , "Cabana Bar" , "Cactus Bar & Grill" , "Cactus Cafe" , "Cactus Inn Lounge" , "Cadillac Ranch" , "Cafe Lafitte In Exile" , "Cain Llc" , "Caledonia Lounge" , "California Cafe Bar & Grill" , "California Clipper" , "Callahan's Irish Pub" , "Campus Inn" , "Candy Store" , "Capitol City Comedy Club" , "Capizzo's" , "Capn's Catering Llc" , "Capricorn Productions Inc" , "Captain Ron's" , "Cardiac Assist Technologies" , "Cardinal Bar" , "Carlo Russo's Wine & Spirit World" , "Carmody's West" , "Carney's Pub" , "Carriage House Furniture" , "Cartwheel" , "Catering For All Occasions" , "Cave" , "Caz's" , "CBGB" , "Celebrity Night Club" , "Centenary United Methodist Church" , "Chadwicks Pub & Sports Bar" , "Changes" , "Charlie's" , "Charlie's Bar" , "Chaser's" , "Chasers Nightclub" , "Checkers" , "Chemically Inbalanced Theater" , "Cherry Pocket Kountry KLUB" , "Cheyenne Saloon" , "Chicken Box" , "Chicken Ranch" , "Chief's" , "Chilkoot Charlie's Promotion" , "Chippendales Entertainment" , "Chord On Blues" , "Chotard Recreation" , "Chrismer Communications" , "Christies Sports Bar & Deli" , "Chrome" , "Chuck & Sally's Tavern" , "Churchill's A Sort-English Pub" , "Churchill's Pub" , "Cibar" , "Cider Mill Restaurant & Lounge" , "Circle C" , "City Billiards Bar & Cafe" , "City Limits" , "City Tavern" , "City View Tavern" , "Claddagh Ring" , "Club Abyss" , "Club Boi" , "Club Car" , "Club Central" , "Club Fifth Season" , "Club Indigo" , "Club Landing" , "Club Metronome" , "Club Odyssey" , "Club Passim" , "Club PM" , "Club Silverstone" , "Club Venu" , "Coach's Corner" , "Coaster's Pub" , "Cobo Joe's Bar" , "Collins Irish Pub & Grill" , "Comcrafters" , "Comedy Circuit" , "Committee On Constitutional Rights" , "Coney Island Bar" , "Conquest" , "Copper Top" , "Cork Room Lounge" , "Corner Alley Bar & Grill" , "Cosmopolitan" , "Cottage" , "Cottage Bar" , "Cottage Inn" , "Country House" , "Country Squire" , "County Line Pub" , "Courtney's Comedy Club" , "Coyote Cafe" , "Crackers Comedy Club" , "Crane Alley" , "Crawfish Junction" , "Crawford Malone Fine Wine Martketing" , "Crazy Horse Bar Grill" , "Crescent No Lawyers Bar & Grll" , "Crescent Tavern" , "Cricket Club" , "Crocodile Bar" , "Crossroads Tavern" , "Crow Bar Acres Enterprises" , "Crow's Nest" , "Crown & Anchor" , "Crush" , "Crystal City Sports Pub" , "Crystal Corner Bar" , "Crystal Room" , "Cubby Hole" , "Curly's Sport Bar & Grill" , "Cynthia L. Braddy" , "Dallas Eagle" , "Danny's" , "Darby's Pub & Restaurant" , "Darla Mitchell" , "Davenport's" , "Dawson Street Pub" , "Dba Thirsty Dog" , "DE Coy Bar & Grill" , "Dead Goat Saloon" , "Dean S. Karlan" , "Decades" , "Decoy's Grill & Bar Inc" , "Dee's Cafe" , "Deer Bell Inc" , "Deja Vu Of Hammond Inc" , "Delilah's" , "Delilah's Den" , "Deliveryguys.com" , "Dena Fisher" , "Dennis" , "Depot Liquor" , "Desmond's Tavern" , "Desperado's" , "Detroit Entertainment Llc" , "Dewey's Flatiron" , "Dibble's Inn" , "Different Strokes" , "Digital Machine Works" , "Ding-Dong Lounge" , "Dino's Lounge" , "Doctor Doodles" , "Dooley's Nightclub" , "Dooley's Tavern" , "Downtown Lounge" , "Doyle's Public House" , "Dr Lucky's Bar & Grill" , "Dragon" , "Dragon's Lair" , "Dream Girls Nightclub" , "Drifty's Sports Pub" , "Dub Pub" , "Dublin Pub" , "Duffer's Tavern" , "Dugout" , "Dulcinea's 100th Monkey" , "Dupont Bar & Grill" , "Easyriders Cafe & Bar" , "Ed's Tavern" , "Eddie's Tavern" , "Eightball Saloon" , "Eighth Ave. Tavern;" , "Elans Of Connecticut" , "Elbo Room" , "Elevator" , "Elizabeth Delisser" , "Elliott's" , "Ellison Chevrolet" , "Elm & Pearl Night Club" , "Elmwood Inn" , "Emerald City Grill" , "Emerald City Of Pensecola Inc" , "Emergency Room Lounge" , "Encompass Night Club & Lounge" , "End Zone" , "End Zone Sports Bar & Grill" , "Enoteca Wine Bar" , "Entourage Night Club" , "Eric Gibson" , "Escapes" , "Extra Innings" , "Fabio's Italian Bar & Grill" , "Fado Irish Pub" , "Fado Pubs Inc" , "Family Inn" , "Farr Street Tavern" , "Fast Track" , "Fat Harold's Beach Club" , "Fat Jacks'" , "Fenton Bar & Grill" , "Finch Industries" , "Finley Dunnes Tavern" , "First Choice" , "Fisher's" , "Fitzgerald's" , "Fitzgerald's Night Club" , "Five Star Bar" , "Flamingo Show Club" , "Flanagan's Irish Pub" , "Fleishman-Hillard" , "Flex" , "Flight Club" , "Foreplay Bar & Grill" , "Fox & Hound Tavern" , "Foxy Lady" , "Frank's Tavern" , "Fred's Bar" , "Freebird Cafe" , "Fremont KENO" , "French Quarter Daiquiries" , "French Quarters" , "Friendly Tavern" , "Froggy Bottomz" , "Froggy Dog & Lounge" , "Fry Street Tavern" , "Fuel American Made Bar & Grill" , "Full Moon" , "Full Moon Saloon" , "Full Throttle Saloon" , "Fulton Lounge" , "Funny Bone Entertainment" , "Funny Stop Comedy Club" , "Funnystop Comedy Club" , "Fusion 5 Sports Bar & Night" , "G G's Club" , "G Spot" , "Gabriel's Restaurant" , "Gabriel's Sport Cafe" , "Gadsbys Tavern" , "Gaff's Third Base" , "Gallagher's" , "Gameday Sports Cafe" , "Gary's Liquor Store" , "Gaslight Club Inc" , "Gaslite Tavern" , "Gator Pit; LLC" , "George R. Malcolm" , "George's Majestic Lounge" , "Georgia Development Authority" , "Giada's" , "Gilligan's" , "Gin Mill Lounge" , "Glass" , "Globe" , "Gold Bar Nature Trails" , "Gold Dollar Bar" , "Gold Hawk" , "Gold Mine" , "Gold Mine Saloon" , "Golden Rail" , "Golden Rail Ale House" , "Goodfellas Cafe Inc" , "Goosetown Tavern" , "Graham Central Station" , "Grand Central Club" , "Grandview Saloon" , "Granville Inn" , "Grape Lakes Wine Appreciation Guild" , "Grape Street Philadelphia" , "Great Alaskan Bush CO" , "Greatest Bar" , "Green Street Tavern" , "Greenbrier Bar-B-Que" , "Greenbrier Inn" , "Grey Lounge" , "Grid" , "Gronks Grill & Bar" , "Grotto" , "Gypsy Bar" , "Half Day Inn" , "Half Time Rec" , "Hallaballo Nightclub" , "Hamlin Pub" , "Handlebar" , "Harassments" , "Hard Times Cafe" , "Harmony" , "Harold's Place" , "Harpo's" , "Harvey's Bar" , "Have A Nice Day Cafe" , "Heidi's Jazz Club" , "Hell's Kitchen Lounge" , "Hendersonville Strike & Spare" , "Henrietta Hudson" , "Henry's Bar & Grill" , "Hi-Liter Cocktail Lounge" , "Hidden Tavern" , "High Chaparral" , "High Tide" , "Highland Cigar CO" , "Highlander A British Pub" , "Hilltop Cafe" , "Hippopotamus" , "Hodkinson's Grill & Grocery" , "Hog Heaven Sports Bar & Grill" , "Holocene" , "Holy Grail" , "Hometowne Tavern" , "Hooligans Saloon" , "Horse Brass Pub" , "Horsehead" , "House Of Bricks" , "House Of Guinness" , "HUGOS FROG BAR" , "Hungry Brain" , "Icon" , "Idle Spurs Steak House" , "Image" , "Imagine Apparel Group" , "IMPERIAL WINE" , "Improv At The Power House" , "In Fine Spirits Ltd" , "Indulgence" , "Innergate" , "International Performers Inc" , "Iron Post" , "Ironhorse" , "Island Grill" , "J J's Clubhouse & Bar" , "J R's Bar & Grill Inc" , "Jake's Pub" , "Jaks On South Park" , "Janice Feinberg" , "Jarrod's Place Sports Bar" , "Jean Marion" , "Jersey's Sports Cafe" , "Jigg's Corner Steakhouse" , "Joanna's Cafe" , "Jobsite" , "Joe's Bar & Grill" , "Joey's" , "Johnny A's Hitching Post" , "Johnny D's Uptown Restaurant" , "Johnny White's Sports Bar" , "Johnny's-Quivira" , "Jonathan Hadad" , "Jose Roberto" , "Joy Night Club" , "Jr's Bar & Grill" , "Js Writing Services" , "Jukebox" , "Jules Maes Saloon" , "Juliann Kroboth" , "Jungle Restaurant-Fat Cat's" , "Kalahari Bar" , "Keg Lounge" , "Keller International Pubg Llc" , "Kelly Liquor" , "Kermitts Family Restaurant" , "Kevins Bar & Grille" , "Khyber" , "Kippy's" , "Kismet Lounge" , "Kites Grille & Bar" , "Koko Bongo" , "Kraneo" , "Kroakers Tavern" , "Kyle Johnson" , "L Beato" , "LA Bare" , "Laffs Comedy" , "LAKESIDE WINE SPIRITS" , "Landings" , "Lariat" , "Lariat Club" , "Las Vegas Lounge" , "Last Exit Bar & Lounge" , "Laughing Out Loud Productions" , "Laughing Wench" , "Lava Lounge" , "Le Bon Temps Roule" , "Lee Harvey's" , "Lee's Place" , "Lees Liquor Lounge" , "Legends Patio Bar & Grille" , "Lenny's Bar & Grill" , "Lew Inn" , "Liars Club" , "Libertys American Bar & Grill" , "Little Red School House" , "Little Woodrows" , "Lodge Bar" , "Log Cabin" , "Logix Group Inc." , "Loons On LA Crosse" , "Lost Mine" , "Lot 1210" , "Lounge 125" , "Lounge 201 Llc" , "Lucky Leprechaun Irish Pub" , "Lumpy's Social Club" , "Lutz Tavern" , "M I Yamani Md" , "Mac's Tavern" , "Mae's Inn" , "Magic Lantern" , "Magnolia Village Pub" , "Magoos Tavern" , "Mai-Kai Restaurant" , "Makers Mark Bourbon House" , "Manhattans Nightclub" , "Manny's" , "Margaritaville" , "Mark Shellock" , "Marley's" , "Martini Ranch" , "Mason Street Pub" , "Mason's Bar & Grille" , "Masquerade" , "Maverick Saloon" , "Max Mc Q's" , "Mc Coys" , "Mc Curdy's Comedy Theatre" , "Meeting Place" , "Meri Fineman" , "Metropolitan Liquor;" , "Miami Velvet" , "Michie Tavern-Ca 1784" , "Mico B.v" , "Middleton Sport Bowl Llc" , "Midnight Rodeo" , "Mike's" , "Mini Max Marble" , "Minneapple Enterprises-MN Inc" , "Miracles" , "Mix Ultra Lounge" , "MJ's" , "Mobtown Lounge" , "Moe & Johnny's" , "Molly Maguires" , "Molly O'Shea's" , "Molly's Bar" , "Molotov Lounge" , "Mom & Dad's" , "Momos" , "Monkey Bar" , "Monopole Restaurant" , "Moondogs Too" , "Moonlight Magic" , "Moran's Landing On Swamp Lake" , "Mouse's Ear" , "Mr B's" , "Mrh Professional Services" , "Mugsy's Tavern & Grill" , "Mule Pub" , "Murphy's Ale House" , "Murphy's Tavern" , "Music Box" , "Music Cafe" , "Mustang Shelly's Roadhouse Ltd" , "Mwf Development Corporation" , "My Brothers Pub" , "My Friend's Place" , "Mynt Lounge" , "Myth The Nightclub" , "N V" , "Narad Casino Dealers Assoc." , "Narrows" , "Neko's Tavern" , "Nest" , "Nestor Tavern" , "Neurolux Inc" , "New Orleans Nights Restaurant" , "New Twilight Bar & Grill" , "New West" , "New York Dolls" , "New Yorker" , "Next LLC" , "Nibsy's Pub" , "Nick's Comedy Stop" , "Nick's Fat City" , "Nick's West Inc" , "Nickelodeon" , "Night Light Lounge" , "Night Zone" , "Nighthawks Tap" , "Nightmoves" , "Nightwatch Entertainment Group" , "Nite Hawk Bar & Grill" , "Nite Moves" , "Nola" , "None" , "None -- Personal" , "North Dallas Bar & Grill" , "North Star Lounge & Restaurant" , "Northcoast Motorsports Services" , "Northern Lights" , "Not Listed" , "Nu Towne Saloon" , "Nut House" , "Nutty's North" , "Nutty's Pub & Casino" , "Nyc Provocatour" , "O C Azzorac Inc" , "O'Leary's Pub & Grub" , "O'Malley's On Main Bar" , "O'Malley's Steak Pub" , "O'Neals Tavern" , "O'Neil's Irish Bar" , "Oakes Brothers" , "Ocean Club" , "Office" , "Old Broadway Restaurant" , "Old Village Inn" , "Ole Barn" , "Omega DC" , "Orlando Sport & Social Club" , "Orphan Annie" , "Orpheum Theatre" , "Osprey" , "Outer Limits" , "Outskirts" , "Overland Hotel & Saloon" , "Owl's Nest" , "P T's" , "Pam's Place Bar & Grill" , "Paolucci Restaurant & Lounge" , "Papa Rocco's" , "Paradise City" , "Park Tavern" , "Parkway Tavern Ristorante" , "Past Perfect" , "Peabody's Concert Club" , "Peacock Inn" , "Penalty Box Pub" , "Pennison's Sports Pub" , "Peoples Choice" , "Pete's Dueling Piano Bar" , "Pete's Place" , "Phoenix Bar" , "Pigs Eye Pub" , "Pink Slip" , "Pioneer Pub" , "Pipper Down & Olde World Pub" , "Pivots Beach Club" , "Platinum" , "Plum Krazy's Sports Bar-Grill" , "Point After" , "Ponderosa Inn" , "Pops For Champagne" , "Post Bar" , "Pour House Pub" , "Preservation Public" , "Princeton Inn" , "Proactive Physical Therapy" , "Pub Louisville" , "Puck Restaurant & Sports Bar" , "Puff" , "Pumpkin Vine Room" , "Punch Line Talent Agency" , "Purdy Lounge" , "Pure Gold Gentlemen's Club" , "Pure Pleasure" , "Q'z Family Restaurant & Lounge" , "Quarter Lounge" , "Quarterback Pub & Eatery" , "Queen City Club" , "R C Dugans" , "Racers Edge" , "Rafters Neighborhood Bar & Grille" , "Rain" , "Raleigh Times Bar" , "Rave" , "Rays Boathouse Catering" , "Red Sky Restaurant & Lounge" , "Red Star Tavern" , "Red Star Tavern Orlando" , "Red Wine Obsession" , "Red Zone Bar & Grill" , "Remedy Lounge" , "Rhott.com" , "Rhythm & Brews" , "Ricochet" , "Ridge Bar & Grill" , "Ringside" , "Ripcord" , "River Bottom Saloon" , "River City Bar-B-Q" , "River City Entertainment (D.b" , "Riverbend" , "Rivercenter Comedy Club" , "Robyn's Nest" , "Rock Bar" , "Rock Bottom Restaurant & Brwry" , "Rockies" , "Rockne's Pub" , "Rocky & J D's Tavern" , "Roma Cafe" , "Rookies Sports Grill" , "Roscoes On Seventh" , "Rose Garden" , "Roxy Nightclub Boston" , "Royal Cafe" , "Royal Grove Nite Club" , "Royal Palms" , "Rum Runner Wine & Spirits" , "Rustic Inn" , "Saddle Club" , "SaddleTime Bar & Grill" , "Sade & Dora's Lounge" , "Safari Club" , "Sale Barn Saloon" , "Sam's Cellar" , "Sand Bar" , "Sandy's Goose Shot" , "Sapphire Hotel" , "Sawmill Saloon" , "Sbny Splash Bar New York" , "SCENTSATIONAL SALOON" , "Schooner Inc" , "Schooner Wharf Bar" , "Scooter's II" , "Scoreboard" , "Scott A. Lortz" , "Seanachie Irish Pub" , "Seattle Eagle Tavern" , "Secrets" , "Serena Bar Lounge" , "Shadow Bar" , "Sharileesjewelry" , "Sharkey's Comedy Club" , "Shawdows" , "Shenanigans Bar & Grill" , "Shooter's Saloon" , "Shooter's West" , "Shuckers Roadhouse" , "Side Splitters Comedy Club" , "Sidelines Tavern & Grill" , "Sidetrack" , "Sidewinders" , "Silverado Bar" , "Sin Sin Leopard Lounge" , "Sinners Gentlemen's Club" , "Skeeter's Lounge" , "Skipper's Pub" , "Skokie House" , "Slapshotz" , "Slinky's" , "Slippery Noodle Inn" , "Slow Bar" , "Snapper's Saloon" , "Social" , "Solutions Mgmt Group" , "Sonka Irish Pub" , "Soular Productions" , "Sound Factory" , "South Beach" , "Spank's Gentleman's Club" , "Spankee's Club" , "Spanky's Bar & Grill" , "Speakeasy" , "Spirit Room" , "Sports Brew Pub" , "Sports Forum" , "Sportsman Athletic Club" , "Sportsman's Tavern" , "Spot On The Alley" , "Sputnik" , "Stables" , "Stadium Cafe" , "Stadium Sports Bar" , "Stagecoach" , "Stakeout" , "Standfords Restaurant & Bar" , "Station 4" , "Station Inn" , "Steel Horse Saloon" , "Stella Blue" , "Sterling Hotel" , "Stevenson Studio" , "Stevie Ray's Blues Bar" , "Sticks" , "Stingers Bar & Grill" , "Stone Church" , "Stone Pony" , "Stoney's Rockin Country" , "Straight Shooter" , "Strand Attic Inc." , "Sugar Shack" , "Sugar's" , "Sully's Corner" , "Sunrise Inn" , "Sunset Inn" , "Supreme" , "Surf Ballroom & Convention Ctr" , "Sutliff Bar & Grill" , "Sway Lounge Llc" , "Sweet Sunnah" , "Sweetwater Station" , "Swig" , "T Bombadils" , "T's Pub" , "Tallahassee Comedy Zone" , "Tangier" , "Tanglewood" , "Tap Room" , "Tarzan's Nightclub" , "Tasting Room" , "Tasty World" , "Tavern On Seven" , "Taylortown Tavern" , "Tech Bar" , "Ten Sports Grill" , "Tequila Sunrise" , "Terminal One Sports Bar" , "Terry's Liquor Stores" , "Tex Tea House" , "Texas Bar & Grill" , "Texas Longhorn Club" , "Textbooks Plus" , "The Ancient Egyptian Society" , "The Bar" , "The Bog Tavern" , "The Crocodile Cafe" , "The Friends" , "The Funny Barn" , "The Landing Bar Grill" , "The New Wine Network" , "The Orchard Tavern" , "The Plastic Bar" , "The Whitley Company" , "The Wine Chateau" , "The Wine Seller" , "Thee Dollhouse Lounge" , "Thirsty Bones" , "Thomas Rohn" , "Three Tides" , "Throckmorton Mining CO" , "Thunders" , "Tiger Tom's" , "Timbers Bar & Grill Vii" , "Tipitnas Uptown" , "Todd's By The Bridge" , "Tom Foolery's Pub & Grill" , "Tom Murphy" , "Tom's Tavern" , "Tomas Leszczynski" , "Tootsies Orchid Lounge Inc" , "Toucan Tan" , "Touch Nightclub" , "Touchdown Tavern" , "Town & Country" , "Town House" , "Toy Box" , "Trans Brasil Airlines" , "Trap N Fish Motel" , "Tribeca Wine Merchants" , "Trikkx" , "Triple K" , "Trophy's Sports Bar & Family" , "Trum Tavern Inc" , "Truman's Bar & Grill" , "Tucker's Bar & Grill" , "Tunnicliffs Tavern" , "Tuscan Tavern" , "Twin Lakes Tavern" , "Twisted Martini" , "Ugly Dog Saloon" , "Underbar At Wny-Union Square" , "Union Bar" , "University Of Kentucky Basketball Museum" , "Up A Creek" , "Uptown-Downtown" , "Valentines" , "Valhalla" , "Valley Inn" , "Vanderbilts At Hamilton Park" , "Vanessie Of Santa Fe" , "Varsity Sports Cafe" , "Vegas Lounge" , "Villa" , "VILLAGE MEAT AND WINE" , "Village Wine Rack" , "Vine Tavern & Eatery" , "Vintage Ultra Lounge" , "Vitales Italian Restaurant" , "Voodoo" , "Wagon Wheel" , "Warwick Hotel" , "Water Street Inn" , "Waterworks" , "Webster's Wine Bar" , "Wheat & Rye Westland Inc" , "Whistle Binkies On The Lake" , "Whistlers Inn" , "White Horse" , "White House Inn" , "White's Bar" , "WIBS" , "Wild Hare" , "Wilderness Pub" , "Wine Bucket Boutique & Bar" , "Winners Circle" , "Wolfes Tavern" , "Wood Inn" , "Wooden Nickel" , "Wooden Nickel Pub" , "Woodshed" , "Woody's Bar & Grill" , "Worldwide Wine & Spirits" , "Wyvills Tavern" , "X O Bar" , "X O Lounge" , "Yankee Tavern" , "Yankee's Tavern & Carlos" , "Ybor Strip" , "Yelrah Inc/Caseys Bar & Grill" , "Zachys Wine & Liquor" , "Zanzibar On The Waterfront" , "Zero Gravity" , "Zim's" , "Zuma Grill"];

      $("#availableBars").autocomplete({
          source: availableBars
      });
  });
</script>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<!--banner-->
<section id="banner" class="banner">
  <div class="bg-color">
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="col-md-12">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="img/logo.png" class="img-responsive" style="width: 140px; margin-top: -16px;"></a>
          </div>
          <div class="collapse navbar-collapse navbar-right" id="myNavbar">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#banner">Home</a></li>
              <li class=""><a href="#service">Services</a></li>
              <li class=""><a href="#about">About</a></li>
              <li class=""><a href="#testimonial">Testimonial</a></li>
              <li class=""><a href="#contact">Contact</a></li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
    <div class="container">
      <div class="row">
        <div class="banner-info">
          <div class="banner-logo text-center">
            <img src="img/logo.png" class="img-responsive">
          </div>
          <div class="banner-text text-center">
            <h1 class="white">Making your bar make business!</h1>
            <p>Bar Manager is your way of knowing the most about your customers and making more money</p>
            <a href="/drinker_info.jsp" class="btn btn-appoint">Drinkers</a>
              <a href="#contact" class="btn btn-appoint">Beers</a>
              <a href="#contact" class="btn btn-appoint">Watches</a>

          </div>
          <div class="overlay-detail text-center">
            <a href="#service"><i class="fa fa-angle-down"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--/ banner-->
<!--service-->
<section id="service" class="section-padding">
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-sm-4">
        <h2 class="ser-title">Our Service</h2>
        <hr class="botm-line">
        <%--<form method="post" action="show.jsp">--%>
        <%--<input type="radio" name="command" value="beers"/>Let's have a beer!--%>
        <%--<br>--%>
         <%--<input type="submit" value="submit" />--%>
        <%--</form>--%>
        <%--<br>--%>

          <%--<table>--%>
            <%--<tr>--%>
              <%--<td>Bar</td>--%>
              <%--<td><input type ="text" id ="availableBars" name ="bar"></td>--%>
            <%--</tr>--%>
          <%--</table>--%>

          <%--<br>--%>
          <%--<form method="post" action="query.jsp">--%>
              <%--<select name="price" size=1>--%>
                  <%--<option value="3.0">$3.0 and under</option>--%>
                  <%--<option value="5.0">$5.0 and under</option>--%>
                  <%--<option value="8.0">$8.0 and under</option>--%>
              <%--</select>&nbsp;<br> <input type="submit" value="submit">--%>
          <%--</form>--%>
          <%--<br>--%>

          <%--<br>--%>
          <%--<form method="post" action="beer_price_query.jsp">--%>
              <%--<table>--%>
                  <%--<tr>--%>
                      <%--<td>Bar</td><td><input type="text" name="bar"></td>--%>
                  <%--</tr>--%>
                  <%--<tr>--%>
                      <%--<td>Beer</td><td><input type="text" name="beer"></td>--%>
                  <%--</tr>--%>

              <%--</table>--%>
              <%--<br>--%>
              <%--<input type="submit" value="submit">--%>
          <%--</form>--%>
          <%--<br>--%>


        <%----%>
        <%----%>
        <%----%>
        <%----%>
        <%----%>
        <%----%>
        <%----%>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris cillum.</p>
      </div>
      <div class="col-md-4 col-sm-4">
        <div class="service-info">
          <div class="icon">
            <i class="fa fa-stethoscope"></i>
          </div>
          <div class="icon-info">
            <h4>24 Hour Support</h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          </div>
        </div>
        <div class="service-info">
          <div class="icon">
            <i class="fa fa-ambulance"></i>
          </div>
          <div class="icon-info">
            <h4>Emergency Services</h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4 col-sm-4">
        <div class="service-info">
          <div class="icon">
            <i class="fa fa-user-md"></i>
          </div>
          <div class="icon-info">
            <h4>Medical Counseling</h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          </div>
        </div>
        <div class="service-info">
          <div class="icon">
            <i class="fa fa-medkit"></i>
          </div>
          <div class="icon-info">
            <h4>Premium Healthcare</h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--/ service-->
<!--cta-->
<section id="cta-1" class="section-padding">
  <div class="container">
    <div class="row">
      <div class="schedule-tab">
        <div class="col-md-4 col-sm-4 bor-left">
          <div class="mt-boxy-color"></div>
          <div class="medi-info">
            <h3>Emergency Case</h3>
            <p>I am text block. Edit this text from Appearance / Customize / Homepage header columns. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
            <a href="#" class="medi-info-btn">READ MORE</a>
          </div>
        </div>
        <div class="col-md-4 col-sm-4">
          <div class="medi-info">
            <h3>Emergency Case</h3>
            <p>I am text block. Edit this text from Appearance / Customize / Homepage header columns. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
            <a href="#" class="medi-info-btn">READ MORE</a>
          </div>
        </div>
        <div class="col-md-4 col-sm-4 mt-boxy-3">
          <div class="mt-boxy-color"></div>
          <div class="time-info">
            <h3>Opening Hours</h3>
            <table style="margin: 8px 0px 0px;" border="1">
              <tbody>
              <tr>
                <td>Monday - Friday</td>
                <td>8.00 - 17.00</td>
              </tr>
              <tr>
                <td>Saturday</td>
                <td>9.30 - 17.30</td>
              </tr>
              <tr>
                <td>Sunday</td>
                <td>9.30 - 15.00</td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--cta-->
<!--about-->
<section id="about" class="section-padding">
  <div class="container">
    <div class="row">
      <div class="col-md-3 col-sm-4 col-xs-12">
        <div class="section-title">
          <h2 class="head-title lg-line">The Medilap <br>Ultimate Dream</h2>
          <hr class="botm-line">
          <p class="sec-para">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua..</p>
          <a href="" style="color: #0cb8b6; padding-top:10px;">Know more..</a>
        </div>
      </div>
      <div class="col-md-9 col-sm-8 col-xs-12">
        <div style="visibility: visible;" class="col-sm-9 more-features-box">
          <div class="more-features-box-text">
            <div class="more-features-box-text-icon"> <i class="fa fa-angle-right" aria-hidden="true"></i> </div>
            <div class="more-features-box-text-description">
              <h3>It's something important you want to know.</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud.</p>
            </div>
          </div>
          <div class="more-features-box-text">
            <div class="more-features-box-text-icon"> <i class="fa fa-angle-right" aria-hidden="true"></i> </div>
            <div class="more-features-box-text-description">
              <h3>It's something important you want to know.</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--/ about-->
<!--doctor team-->
<%--<section id="doctor-team" class="section-padding">--%>
  <%--<div class="container">--%>
    <%--<div class="row">--%>
      <%--<div class="col-md-12">--%>
        <%--<h2 class="ser-title">Meet Our Doctors!</h2>--%>
        <%--<hr class="botm-line">--%>
      <%--</div>--%>
      <%--<div class="col-md-3 col-sm-3 col-xs-6">--%>
        <%--<div class="thumbnail">--%>
          <%--<img src="img/doctor1.jpg" alt="..." class="team-img">--%>
          <%--<div class="caption">--%>
            <%--<h3>Jessica Wally</h3>--%>
            <%--<p>Doctor</p>--%>
            <%--<ul class="list-inline">--%>
              <%--<li><a href="#"><i class="fa fa-facebook"></i></a></li>--%>
              <%--<li><a href="#"><i class="fa fa-twitter"></i></a></li>--%>
              <%--<li><a href="#"><i class="fa fa-google-plus"></i></a></li>--%>
            <%--</ul>--%>
          <%--</div>--%>
        <%--</div>--%>
      <%--</div>--%>
      <%--<div class="col-md-3 col-sm-3 col-xs-6">--%>
        <%--<div class="thumbnail">--%>
          <%--<img src="img/doctor2.jpg" alt="..." class="team-img">--%>
          <%--<div class="caption">--%>
            <%--<h3>Iai Donas</h3>--%>
            <%--<p>Doctor</p>--%>
            <%--<ul class="list-inline">--%>
              <%--<li><a href="#"><i class="fa fa-facebook"></i></a></li>--%>
              <%--<li><a href="#"><i class="fa fa-twitter"></i></a></li>--%>
              <%--<li><a href="#"><i class="fa fa-google-plus"></i></a></li>--%>
            <%--</ul>--%>
          <%--</div>--%>
        <%--</div>--%>
      <%--</div>--%>
      <%--<div class="col-md-3 col-sm-3 col-xs-6">--%>
        <%--<div class="thumbnail">--%>
          <%--<img src="img/doctor3.jpg" alt="..." class="team-img">--%>
          <%--<div class="caption">--%>
            <%--<h3>Amanda Denyl</h3>--%>
            <%--<p>Doctor</p>--%>
            <%--<ul class="list-inline">--%>
              <%--<li><a href="#"><i class="fa fa-facebook"></i></a></li>--%>
              <%--<li><a href="#"><i class="fa fa-twitter"></i></a></li>--%>
              <%--<li><a href="#"><i class="fa fa-google-plus"></i></a></li>--%>
            <%--</ul>--%>
          <%--</div>--%>
        <%--</div>--%>
      <%--</div>--%>
      <%--<div class="col-md-3 col-sm-3 col-xs-6">--%>
        <%--<div class="thumbnail">--%>
          <%--<img src="img/doctor4.jpg" alt="..." class="team-img">--%>
          <%--<div class="caption">--%>
            <%--<h3>Jason Davis</h3>--%>
            <%--<p>Doctor</p>--%>
            <%--<ul class="list-inline">--%>
              <%--<li><a href="#"><i class="fa fa-facebook"></i></a></li>--%>
              <%--<li><a href="#"><i class="fa fa-twitter"></i></a></li>--%>
              <%--<li><a href="#"><i class="fa fa-google-plus"></i></a></li>--%>
            <%--</ul>--%>
          <%--</div>--%>
        <%--</div>--%>
      <%--</div>--%>
    <%--</div>--%>
  <%--</div>--%>
<%--</section>--%>
<!--/ doctor team-->
<!--testimonial-->
<%--<section id="testimonial" class="section-padding">--%>
  <%--<div class="container">--%>
    <%--<div class="row">--%>
      <%--<div class="col-md-12">--%>
        <%--<h2 class="ser-title">see what patients are saying?</h2>--%>
        <%--<hr class="botm-line">--%>
      <%--</div>--%>
      <%--<div class="col-md-4 col-sm-4">--%>
        <%--<div class="testi-details">--%>
          <%--<!-- Paragraph -->--%>
          <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>--%>
        <%--</div>--%>
        <%--<div class="testi-info">--%>
          <%--<!-- User Image -->--%>
          <%--<a href="#"><img src="img/thumb.png" alt="" class="img-responsive"></a>--%>
          <%--<!-- User Name -->--%>
          <%--<h3>Alex<span>Texas</span></h3>--%>
        <%--</div>--%>
      <%--</div>--%>
      <%--<div class="col-md-4 col-sm-4">--%>
        <%--<div class="testi-details">--%>
          <%--<!-- Paragraph -->--%>
          <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>--%>
        <%--</div>--%>
        <%--<div class="testi-info">--%>
          <%--<!-- User Image -->--%>
          <%--<a href="#"><img src="img/thumb.png" alt="" class="img-responsive"></a>--%>
          <%--<!-- User Name -->--%>
          <%--<h3>Alex<span>Texas</span></h3>--%>
        <%--</div>--%>
      <%--</div>--%>
      <%--<div class="col-md-4 col-sm-4">--%>
        <%--<div class="testi-details">--%>
          <%--<!-- Paragraph -->--%>
          <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>--%>
        <%--</div>--%>
        <%--<div class="testi-info">--%>
          <%--<!-- User Image -->--%>
          <%--<a href="#"><img src="img/thumb.png" alt="" class="img-responsive"></a>--%>
          <%--<!-- User Name -->--%>
          <%--<h3>Alex<span>Texas</span></h3>--%>
        <%--</div>--%>
      <%--</div>--%>
    <%--</div>--%>
  <%--</div>--%>
<%--</section>--%>
<!--/ testimonial-->
<!--cta 2-->
<section id="cta-2" class="section-padding">
  <div class="container">
    <div class=" row">
      <div class="col-md-2"></div>
      <div class="text-right-md col-md-4 col-sm-4">
        <h2 class="section-title white lg-line">« A few words<br> about us »</h2>
      </div>
      <div class="col-md-4 col-sm-5">
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a typek
        <p class="text-right text-primary"><i>— Medilap Healthcare</i></p>
      </div>
      <div class="col-md-2"></div>
    </div>
  </div>
</section>
<!--cta-->
<!--contact-->
<%--<section id="contact" class="section-padding">--%>
  <%--<div class="container">--%>
    <%--<div class="row">--%>
      <%--<div class="col-md-12">--%>
        <%--<h2 class="ser-title">Contact us</h2>--%>
        <%--<hr class="botm-line">--%>
      <%--</div>--%>
      <%--<div class="col-md-4 col-sm-4">--%>
        <%--<h3>Contact Info</h3>--%>
        <%--<div class="space"></div>--%>
        <%--<p><i class="fa fa-map-marker fa-fw pull-left fa-2x"></i>321 Awesome Street<br> New York, NY 17022</p>--%>
        <%--<div class="space"></div>--%>
        <%--<p><i class="fa fa-envelope-o fa-fw pull-left fa-2x"></i>info@companyname.com</p>--%>
        <%--<div class="space"></div>--%>
        <%--<p><i class="fa fa-phone fa-fw pull-left fa-2x"></i>+1 800 123 1234</p>--%>
      <%--</div>--%>
      <%--<div class="col-md-8 col-sm-8 marb20">--%>
        <%--<div class="contact-info">--%>
          <%--<h3 class="cnt-ttl">Having Any Query! Or Book an appointment</h3>--%>
          <%--<div class="space"></div>--%>
          <%--<div id="sendmessage">Your message has been sent. Thank you!</div>--%>
          <%--<div id="errormessage"></div>--%>
          <%--<form action="" method="post" role="form" class="contactForm">--%>
            <%--<div class="form-group">--%>
              <%--<input type="text" name="name" class="form-control br-radius-zero" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />--%>
              <%--<div class="validation"></div>--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
              <%--<input type="email" class="form-control br-radius-zero" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />--%>
              <%--<div class="validation"></div>--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
              <%--<input type="text" class="form-control br-radius-zero" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />--%>
              <%--<div class="validation"></div>--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
              <%--<textarea class="form-control br-radius-zero" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>--%>
              <%--<div class="validation"></div>--%>
            <%--</div>--%>

            <%--<div class="form-action">--%>
              <%--<button type="submit" class="btn btn-form">Send Message</button>--%>
            <%--</div>--%>
          <%--</form>--%>
        <%--</div>--%>
      <%--</div>--%>
    <%--</div>--%>
  <%--</div>--%>
<%--</section>--%>
<!--/ contact-->
<!--footer-->
<footer id="footer">
  <%--<div class="top-footer">--%>
    <%--<div class="container">--%>
      <%--<div class="row">--%>
        <%--<div class="col-md-4 col-sm-4 marb20">--%>
          <%--<div class="ftr-tle">--%>
            <%--<h4 class="white no-padding">About Us</h4>--%>
          <%--</div>--%>
          <%--<div class="info-sec">--%>
            <%--<p>Praesent convallis tortor et enim laoreet, vel consectetur purus latoque penatibus et dis parturient.</p>--%>
          <%--</div>--%>
        <%--</div>--%>
        <%--<div class="col-md-4 col-sm-4 marb20">--%>
          <%--<div class="ftr-tle">--%>
            <%--<h4 class="white no-padding">Quick Links</h4>--%>
          <%--</div>--%>
          <%--<div class="info-sec">--%>
            <%--<ul class="quick-info">--%>
              <%--<li><a href="index.html"><i class="fa fa-circle"></i>Home</a></li>--%>
              <%--<li><a href="#service"><i class="fa fa-circle"></i>Service</a></li>--%>
              <%--<li><a href="#contact"><i class="fa fa-circle"></i>Appointment</a></li>--%>
            <%--</ul>--%>
          <%--</div>--%>
        <%--</div>--%>
        <%--<div class="col-md-4 col-sm-4 marb20">--%>
          <%--<div class="ftr-tle">--%>
            <%--<h4 class="white no-padding">Follow us</h4>--%>
          <%--</div>--%>
          <%--<div class="info-sec">--%>
            <%--<ul class="social-icon">--%>
              <%--<li class="bglight-blue"><i class="fa fa-facebook"></i></li>--%>
              <%--<li class="bgred"><i class="fa fa-google-plus"></i></li>--%>
              <%--<li class="bgdark-blue"><i class="fa fa-linkedin"></i></li>--%>
              <%--<li class="bglight-blue"><i class="fa fa-twitter"></i></li>--%>
            <%--</ul>--%>
          <%--</div>--%>
        <%--</div>--%>
      <%--</div>--%>
    <%--</div>--%>
  <%--</div>--%>
  <div class="footer-line">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          © Copyright Medilab Theme. All Rights Reserved
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Medilab
            -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade.com</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
<!--/ footer-->

<!--
<script src="js/jquery.min.js"></script>-->

<script src="js/jquery.easing.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>
<script src="contactform/contactform.js"></script>

</body>

</html>