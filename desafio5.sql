CREATE VIEW top_2_hits_do_momento AS
SELECT
c.cancao AS cancao,
COUNT(*) AS reproducoes
FROM
SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_de_reproducoes AS hr
ON c.id = hr.cancoes_id
GROUP BY c.cancao, hr.cancoes_id
ORDER BY 2 DESC, cancao
LIMIT 2;
