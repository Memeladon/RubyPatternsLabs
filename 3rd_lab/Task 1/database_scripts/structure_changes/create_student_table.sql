    CREATE TABLE IF NOT EXISTS student (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       surname TEXT NOT NULL,
       name TEXT NOT NULL,
       patronymic TEXT NOT NULL,
       git TEXT,
       phone TEXT,
       email TEXT,
       telegram TEXT
);
