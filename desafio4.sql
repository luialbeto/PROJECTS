CREATE VIEW top_3_artistas AS
SELECT
art.artista AS artista,
COUNT(*) AS seguidores
FROM
SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.seguindo_artistas AS s
ON art.id = s.artistas_id
GROUP BY art.artista, s.artistas_id
ORDER BY 2 DESC, 1
LIMIT 3;
