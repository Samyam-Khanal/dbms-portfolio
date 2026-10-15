INSERT INTO media.title(name, release_year, kind) VALUES
('The Paper Moon', 2020, 'film'), ('City of Lanterns', 2023, 'series');
INSERT INTO media.genre(name) VALUES ('Drama'), ('Mystery');
INSERT INTO media.title_genre(title_id, genre_id)
SELECT t.id, g.id FROM media.title t CROSS JOIN media.genre g
WHERE (t.name = 'The Paper Moon' AND g.name = 'Drama')
   OR (t.name = 'City of Lanterns' AND g.name = 'Mystery');
INSERT INTO media.watch_log(title_id, watched_on, rating)
SELECT id, DATE '2026-10-01', 4 FROM media.title WHERE name = 'The Paper Moon';
