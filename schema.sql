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
VALUES ("The greatest showman", "Musical/Drama", 2017, "The Greatest Showman is a musical drama that tells the story of P.T. Barnum, who rises from humble beginnings to create a circus that celebrates uniqueness and challenges societal norms."),
       ("F1", "Action/Drama/Sport", 2025, "F1 follows the story of Sonny Hayes, a former Formula One driver who comes out of retirement to mentor a rookie driver while facing his past and the challenges of the racing world."),
       ("Cars", "Animation/Adventure", 2006, "Cars is a 2006 animated film that follows Lightning McQueen, a rookie race car who learns valuable life lessons about friendship and community after getting stranded in the small town of Radiator Springs."),
       ("Cars 2", "Animation/Adventure", 2011, "Cars 2 is a 2011 animated film where Lightning McQueen and his friend Mater embark on an international racing adventure that turns into a thrilling espionage mission."),
       ("Cars 3", "Animation/Adventure", 2017, "Cars 3 follows Lightning McQueen as he faces a new generation of racers and must prove he still has what it takes to compete, with the help of a young technician named Cruz Ramirez."),
       ("Madagascar", "Animation/Adventure", 2005, "Madagascar follows a group of zoo animals who escape from New York City and find themselves stranded on the island of Madagascar, where they must adapt to life in the wild."),
       ("Madagascar: Escape 2 Africa", "Animation/Adventure", 2008, "Madagascar: Escape 2 Africa, the beloved characters crash-land in Africa, where Alex the Lion discovers his royal heritage and the group faces new adventures and challenges."),
       ("Madagascar 3: Europe's Most Wanted", "Animation/Adventure", 2012, "Madagascar 3: Europe's Most Wanted, the beloved zoo animals join a struggling circus in Europe while being pursued by a relentless animal control officer, ultimately discovering their true home."),
       ("The whisper of the heart", "Coming-of-age animated film", 1995, "Whisper of the Heart follows 14-year-old Shizuku Tsukishima as she embarks on a journey of self-discovery through her passion for writing and her encounters with a boy named Seiji and a magical cat figurine."),
       ("Star Wars: Phantom Menace", 1999, 
       ("Star Wars: Attack of the Clones", 2002, 
       ("Star Wars: Revenge of the Sith", 2005, 
       ("Star Wars: A New Hope", 1977, 
       ("Star Wars: Empire Strikes Back", 1980, 
       ("Star Wars: Return of the Jedi", 1983, 
       ("Star Wars: The Force Awakens", 2015, 
       ("Star Wars: The Last Jedi", 2017, 
       ("Star Wars: Rise of Skywalker", 2019, 
       ("Girl, Interrupted", "Biography/Drama", 1999, "Girl, Interrupted is a film set in the late 1960s, based on the memoir of Susanna Kaysen (played by Winona Ryder), who is admitted to a mental institution after a suicide attempt. There, she encounters a group of troubled women, including the charismatic and rebellious Lisa (Angelina Jolie), who challenge her perceptions of sanity and reality. The film explores themes of mental illness, identity, and the struggle between conformity and individuality as Susanna navigates her relationships and her own mental health."),
       ("Ironman", "Science Fiction/Action", 2008, "Iron Man is a 2008 superhero film that follows billionaire industrialist Tony Stark as he transforms from a weapons manufacturer to a superhero after being captured by terrorists."),
       ("Ironman 2", "Science Fiction/Action", 2010, "Iron Man 2 follows Tony Stark as he grapples with his identity as Iron Man, declining health, and a vengeful enemy, Ivan Vanko, while facing pressure from the government to share his technology."),
       ("Ironman 3", "Science Fiction/Action", 2013, "In Iron Man 3, Tony Stark faces a formidable enemy known as the Mandarin while grappling with the psychological aftermath of the events in The Avengers."),
       ("Howls moving Castle", "Romance/Fantasy", 2004, "Howl's Moving Castle tells the story of Sophie, a young woman cursed to be old by the Witch of the Waste. To break the spell, she seeks out the wizard Howl's magical moving castle, where she becomes the cleaning lady and meets his companions, Calcifer the fire demon and Markl the apprentice. As she cleans and lives in the castle, Sophie discovers the truth about Howl, his curse, and her own hidden magical abilities, leading to the breaking of her own curse and a deep connection with the wizard."),
       ("The wind rises", "Historical/Romance/Fantasy", 2013, "The Wind Rises is a fictionalized biography about Jiro Horikoshi, a Japanese aircraft designer who dreams of building beautiful planes despite his poor eyesight. He meets his love, Nahoko, during the Great Kantō earthquake, and they fall in love while facing the hardships of her tuberculosis and the impending World War II. The plot follows his journey from a young dreamer to a brilliant engineer, including his struggles and sacrifices while working on aircraft that will be used for war."),
       ("Ponyo", 
       ("The cats return (links to whisper of the heart)", 
       ("The boy and the heron", 
       ("Princess mononoke", 
       ("Spirited away", 
       ("Castle in the sky", 
       ("When marine was there", 
       ("Arrietty", 
       ("Your name", 
       ("Weathering with you", 
       ("Suzume", 
       ("Bubble", 
       ("Barbie", 


DELETE FROM movies;
DELETE FROM reviews;
DELETE FROM users;

DROP TABLE movies;
DROP TABLE reviews;
DROP TABLE users;