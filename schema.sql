CREATE TABLE IF NOT EXISTS messages (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL DEFAULT '',message TEXT NOT NULL,public INTEGER NOT NULL DEFAULT 1,approved INTEGER NOT NULL DEFAULT 0,created_at TEXT NOT NULL DEFAULT (datetime('now')));
CREATE INDEX IF NOT EXISTS messages_public_idx ON messages(approved,public,created_at);
