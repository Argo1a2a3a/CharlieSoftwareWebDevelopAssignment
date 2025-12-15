CREATE TABLE users (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Username TEXT NOT NULL,
  Password TEXT NOT NULL
);

CREATE TABLE movies (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Name TEXT NOT NULL,
  Genre TEXT NOT NULL,
  Year INTEGER NOT NULL,
  Summary TEXT NOT NULL
);

CREATE TABLE reviews (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Date DATE NOT NULL,
  Review TEXT NOT NULL,
  Rating INTEGER NOT NULL,
  Movies_Id INTEGER NOT NULL,
  Users_Id INTEGER NOT NULL
);

INSERT INTO movies (Name, Genre, Year, Summary)
VALUES 
("The Greatest Showman", "Musical/Drama", 2017, "The Greatest Showman tells the story of P.T. Barnum, who rises from humble beginnings to create a circus that celebrates uniqueness."),
("F1", "Action/Drama/Sport", 2025, "F1 follows Sonny Hayes mentoring a rookie driver while facing his past and racing challenges."),
("Cars", "Animation/Adventure", 2006, "Lightning McQueen learns valuable life lessons in Radiator Springs."),
("Cars 2", "Animation/Adventure", 2011, "Lightning McQueen and Mater embark on an international racing adventure."),
("Cars 3", "Animation/Adventure", 2017, "Lightning McQueen faces a new generation of racers with help from Cruz Ramirez."),
("Madagascar", "Animation/Adventure", 2005, "A group of zoo animals escape from New York and adapt to life on Madagascar."),
("Madagascar: Escape 2 Africa", "Animation/Adventure", 2008, "The animals crash-land in Africa and face new adventures."),
("Madagascar 3: Europe's Most Wanted", "Animation/Adventure", 2012, "The animals join a struggling circus in Europe while pursued by animal control."),
("The Whisper of the Heart", "Coming-of-age/Animation", 1995, "14-year-old Shizuku embarks on a journey of self-discovery and writing."),
("Star Wars: Phantom Menace", "Sci-Fi/Adventure", 1999, "The beginning of the Star Wars prequel trilogy."),
("Star Wars: Attack of the Clones", "Sci-Fi/Adventure", 2002, "The galaxy faces civil war as Obi-Wan investigates a clone army plot."),
("Star Wars: Revenge of the Sith", "Sci-Fi/Adventure", 2005, "Anakin turns to the dark side, becoming Darth Vader."),
("Star Wars: A New Hope", "Sci-Fi/Adventure", 1977, "Luke Skywalker begins his journey to become a Jedi."),
("Star Wars: Empire Strikes Back", "Sci-Fi/Adventure", 1980, "The Empire strikes back against the Rebel Alliance."),
("Star Wars: Return of the Jedi", "Sci-Fi/Adventure", 1983, "The Rebels fight to defeat the Empire and save the galaxy."),
("Star Wars: The Force Awakens", "Sci-Fi/Adventure", 2015, "A new threat emerges in the galaxy; Rey discovers her force sensitivity."),
("Star Wars: The Last Jedi", "Sci-Fi/Adventure", 2017, "Rey trains with Luke while the Resistance fights the First Order."),
("Star Wars: Rise of Skywalker", "Sci-Fi/Adventure", 2019, "The final battle between the Resistance and the First Order."),
("Girl, Interrupted", "Biography/Drama", 1999, "Susanna navigates life in a mental institution while discovering herself."),
("Ironman", "Science Fiction/Action", 2008, "Tony Stark becomes Iron Man after being captured by terrorists."),
("Ironman 2", "Science Fiction/Action", 2010, "Tony Stark faces enemies while dealing with health and government pressure."),
("Ironman 3", "Science Fiction/Action", 2013, "Tony faces the Mandarin while struggling with post-Avengers trauma."),
("Howl's Moving Castle", "Romance/Fantasy", 2004, "Sophie discovers a magical castle and the wizard Howl's secrets."),
("The Wind Rises", "Historical/Romance/Fantasy", 2013, "Jiro Horikoshi dreams of building airplanes despite challenges."),
("Ponyo", "Animation/Fantasy", 2008, "A goldfish girl wants to become human after meeting a boy."),
("The Cat Returns", "Animation/Fantasy", 2002, "A girl is whisked away to a magical cat kingdom."),
("The Boy and the Heron", "Animation/Fantasy", 2023, "A coming-of-age fantasy adventure."),
("Princess Mononoke", "Fantasy/Action", 1997, "Ashitaka fights to stop the destruction of the forest."),
("Spirited Away", "Animation/Fantasy", 2001, "A girl navigates a world of spirits to save her parents."),
("Castle in the Sky", "Animation/Fantasy", 1986, "Two children search for a legendary floating castle."),
("When Marnie Was There", "Animation/Drama", 2014, "A girl befriends a mysterious girl named Marnie."),
("Arrietty", "Animation/Fantasy", 2010, "A tiny family lives secretly in a human house."),
("Your Name", "Animation/Romance", 2016, "Two teens mysteriously swap bodies across time and space."),
("Weathering With You", "Animation/Romance", 2019, "A boy meets a girl who can control the weather."),
("Suzume", "Animation/Fantasy", 2022, "A girl travels to prevent disasters in Japan."),
("Bubble", "Animation/Action", 2022, "Parkour battles erupt in a futuristic Tokyo."),
("Barbie", "Fantasy/Comedy", 2023, "Barbie goes on a journey of self-discovery in the real world."),
("Megamind", "Animation/Action/Comedy", 2010, "A supervillain must discover his purpose after defeating his nemesis."),
("Five Nights at Freddy's", "Horror/Mystery", 2023, "Security guards face animatronic horrors in a night-shift survival scenario.");


DELETE FROM movies;
DELETE FROM reviews;
DELETE FROM users;

DROP TABLE movies;
DROP TABLE reviews;
DROP TABLE users;