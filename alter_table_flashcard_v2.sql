ALTER TABLE flashcards_v2 ALTER COLUMN tags DROP DEFAULT;
ALTER TABLE flashcards_v2 ALTER COLUMN tags TYPE jsonb USING to_jsonb(tags);
ALTER TABLE flashcards_v2 ALTER COLUMN tags SET DEFAULT '[]'::jsonb;