CREATE VIEW estatisticas_musicais AS
SELECT 
COUNT(DISTINCT c.cancao) AS cancoes,
COUNT(DISTINCT art.artista) AS artistas,
COUNT(DISTINCT a.album) AS albuns
FROM
SpotifyClone.cancoes c,
SpotifyClone.artistas art,
SpotifyClone.albuns a;
