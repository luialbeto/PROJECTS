CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.usuario AS usuario,
c.cancao AS nome
FROM
SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_de_reproducoes AS hr
ON u.id = hr.usuarios_id 
INNER JOIN SpotifyClone.cancoes AS c
ON hr.cancoes_id = c.id
ORDER BY 1, 2;
