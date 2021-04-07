DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuarios_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE suas_musicas INT;
SELECT COUNT(usuarios_id)
FROM SpotifyClone.historico_de_reproducoes
WHERE SpotifyClone.historico_de_reproducoes.usuarios_id = usuarios_id
INTO suas_musicas;
RETURN suas_musicas;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(1);
