--CREATE TABLE users (
--  ID INTEGER PRIMARY KEY AUTOINCREMENT,
--  Username TEXT NOT NULL,
--  Password TEXT NOT NULL
--);

--CREATE TABLE movies (
--  ID INTEGER PRIMARY KEY AUTOINCREMENT,
--  Name TEXT NOT NULL,
--  Genre TEXT NOT NULL,
--  Year INTEGER NOT NULL,
--  Summary TEXT NOT NULL
--);

--CREATE TABLE reviews (
--  ID INTEGER PRIMARY KEY AUTOINCREMENT,
--  Date DATE NOT NULL,
--  Review TEXT NOT NULL,
--  Rating INTEGER NOT NULL,
--  Movies_Id INTEGER NOT NULL,
--  Users_Id INTEGER NOT NULL
--);

INSERT INTO movies (Name, Genre, Year, Summary)
VALUES ("The greatest showman", "Musical/Drama", 2017, "The Greatest Showman is a musical drama that tells the story of P.T. Barnum, who rises from humble beginnings to create a circus that celebrates uniqueness and challenges societal norms."),
       ("F1", "Action/Drama/Sport", 2025, "F1 follows the story of Sonny Hayes, a former Formula One driver who comes out of retirement to mentor a rookie driver while facing his past and the challenges of the racing world."),
       ("Cars", "Animation/Adventure", 2006, "Cars is a 2006 animated film that follows Lightning McQueen, a rookie race car who learns valuable life lessons about friendship and community after getting stranded in the small town of Radiator Springs."),
       ("Cars 2", "Animation/Adventure", 2011, "Cars 2 is a 2011 animated film where Lightning McQueen and his friend Mater embark on an international racing adventure that turns into a thrilling espionage mission."),
       ("Cars 3", "Animation/Adventure", 2017, "Cars 3 follows Lightning McQueen as he faces a new generation of racers and must prove he still has what it takes to compete, with the help of a young technician named Cruz Ramirez.");
