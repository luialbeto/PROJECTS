CREATE VIEW perfil_artistas AS
SELECT
art.artista AS artista,
a.album AS album,
COUNT(*) AS seguidores
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns AS a
ON art.id = a.artistas_id
INNER JOIN SpotifyClone.seguindo_artistas AS s
ON  art.id = s.artistas_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista`, `album`;
