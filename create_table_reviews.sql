CREATE TABLE Reviews(ID INTEGER PRIMARY KEY AUTOINCREMENT,
                    Date DATE NOT NULL,
                    Review TEXT NOT NULL,
                    Rating INTEGER NOT NULL,
                    Movies_Id INTEGERNOT NULL,
                    Users_Id INTEGER NOT NULL);