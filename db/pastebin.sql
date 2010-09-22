PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE pastes (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	paste TEXT,
	last_modified DATETIME
);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('pastes',22);
COMMIT;
