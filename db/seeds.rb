Review.destroy_all
User.destroy_all
Song.destroy_all



user1 = User.create(name: "Jordan", username: "JorPan", password: "123")
user2 = User.create(name: "Javaria", username: "JazzyJay", password: "123")
user3 = User.create(name: "Colter", username: "ColtUlrich", password: "123")

song1 = Song.create(title: "Stuntin", artist: "The Floozies", genre: "Funky Bass", link: "https://www.youtube.com/watch?v=5hL_ck7injw", year: 2013)
song2 = Song.create(title: "Sunroof Cadillac", artist: "The Floozies", genre: "Funky Bass", link: "https://www.youtube.com/watch?v=PgDz5-tfnTY", year: 2012)
song3 = Song.create(title: "Smash the Funk", artist: "Griz", genre: "Funky Bass", link: "https://www.youtube.com/watch?v=UsSzq5h2-tc", year: 2012)
song4 = Song.create(title: "Tiger Kingdom Space Camp", artist: "Griz", genre: "Funky Bass", link: "https://www.youtube.com/watch?v=qNzOhyo-4g8", year: 2019)
song5 = Song.create(title: "Lonesome Street", artist: "Pretty Lights", genre: "Electro Soul", link: "https://www.youtube.com/watch?v=vez4N20QBIE", year: 2009)
song6 = Song.create(title: "Hot Like Sauce", artist: "Pretty Lights", genre: "Electro Soul", link: "https://www.youtube.com/watch?v=62VASkbu1gw", year: 2008)
song7 = Song.create(title: "My Dream Last Night", artist: "Archnemesis", genre: "Electro Soul", link: "https://www.youtube.com/watch?v=A0aCGP2KUSM", year: 2014)
song8 = Song.create(title: "It's Just a Ride", artist: "Gramatik", genre: "Electro Soul", link: "https://www.youtube.com/watch?v=WoWZGBFnRnw", year: 2014)
song9 = Song.create(title: "Brave Men", artist: "Gramatik", genre: "Electro Soul", link: "https://www.youtube.com/watch?v=0H5EgF8Vjfs", year: 2014)
song10 = Song.create(title: "Gold Coast Hustle", artist: "Pretty Lights", genre: "Electro Soul", link: "https://www.youtube.com/watch?v=RHLCxaMXES0", year: 2010)
song11 = Song.create(title: "Dry Land", artist: "Late Night Radio", genre: "Electro Soul", link: "https://www.youtube.com/watch?v=9Co-nXz0Cjs", year: 2019)
song12 = Song.create(title: "Robo Booty", artist: "Opiuo", genre: "Funky Bass", link: "https://www.youtube.com/watch?v=lde91njylYo", year: 2010)
song13 = Song.create(title: "Sneakers", artist: "Opiuo", genre: "Funky Bass", link: "https://www.youtube.com/watch?v=hXkF3HNw1RQ", year: 2016)
song14 = Song.create(title: "Quack Fat", artist: "Opiuo", genre: "Funky Bass", link: "https://www.youtube.com/watch?v=Y1MkJOe3w7U", year: 2014)
song15 = Song.create(title: "Say My Name", artist: "Odesza", genre: "Future Bass", link: "https://www.youtube.com/watch?v=QMssNXBCCl0", year: 2014)
song16 = Song.create(title: "Meridian", artist: "Odesza", genre: "Future Bass", link: "https://www.youtube.com/watch?v=FcnqFPuhFs0", year: 2017)
song17 = Song.create(title: "Sunsets", artist: "Mr Kafer", genre: "Lo-Fi", link: "https://www.youtube.com/watch?v=L2qt1DdNK2g", year: 2019)
song18 = Song.create(title: "The World is Yours", artist: "Will Sessions", genre: "Jazz", link: "https://www.youtube.com/watch?v=fafWIt-ZpmA", year: 2011)
song19 = Song.create(title: "Rebirth of Cool", artist: "DJ Cam Quartet", genre: "Jazz", link: "https://www.youtube.com/watch?v=oU0ZmbBY9QI", year: 2013)
song20 = Song.create(title: "Quincy", artist: "DJ Cam Quartet", genre: "Jazz", link: "https://www.youtube.com/watch?v=gCQLKrJ3a2c", year: 2009)
song21 = Song.create(title: "It's Yours", artist: "DJ Cam Quartet", genre: "Jazz", link: "https://www.youtube.com/watch?v=Ec8vZMV0ftU", year: 2012)
song22 = Song.create(title: "Samurai Sunrise", artist: "Saib", genre: "Lo-Fi", link: "https://www.youtube.com/watch?v=LS55EqeYJCw", year: 2019)
song23 = Song.create(title: "Somewhat", artist: "Mono:Massive", genre: "Lo-Fi", link: "https://www.youtube.com/watch?v=Q8einG5IZfs", year: 2016)
song24 = Song.create(title: "Stuntin'", artist: "Kumarion", genre: "Dirty Bass", link: "https://www.youtube.com/watch?v=CmcBTHopwYc", year: 2020)
song25 = Song.create(title: "Intergalactic", artist: "DAGGZ", genre: "Dirty Bass", link: "https://www.youtube.com/watch?v=MDrEUdwndtk", year: 2020)
song26 = Song.create(title: "Evasion", artist: "Clozee", genre: "Future Bass", link: "https://www.youtube.com/watch?v=fpshjQ712c0", year: 2018)
song27 = Song.create(title: "Harmony", artist: "Clozee", genre: "Dirty Bass", link: "https://www.youtube.com/watch?v=l_KNbQFds48", year: 2017)
song28 = Song.create(title: "FNKMSTR", artist: "Pandasaywhat?!", genre: "Funky Bass", link: "https://www.youtube.com/watch?v=O5Li2dj2Bsg", year: 2017)
song29 = Song.create(title: "Swagger Wagon", artist: "Pandasaywhat?!", genre: "Funky Bass", link: "https://www.youtube.com/watch?v=-TPA7v6aca4", year: 2018)
song30 = Song.create(title: "Ooh", artist: "Pandasaywhat?!", genre: "Funky Bass", link: "https://www.youtube.com/watch?v=HL7oO5h7kM0", year: 2020)





review1 = Review.create(user: user1, song: song4, rating: 5, content: "Suuuper funky.. slightly gangster :) ")
review2 = Review.create(user: user1, song: song25, rating: 5, content: "One of my new favorites! ")









# binding.pry
