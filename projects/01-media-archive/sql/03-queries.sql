-- Watchlist: titles with no recorded watch.
SELECT t.name FROM media.title t
WHERE NOT EXISTS (SELECT 1 FROM media.watch_log w WHERE w.title_id = t.id)
ORDER BY t.name;
-- Counts include unwatched titles; repeat watches remain separate events.
SELECT t.name, count(w.id) AS watches, round(avg(w.rating), 2) AS average_rating
FROM media.title t LEFT JOIN media.watch_log w ON w.title_id = t.id
GROUP BY t.id, t.name ORDER BY t.name;
