DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  plano VARCHAR(45) NOT NULL,
  valor_plano DECIMAL(3,2) NOT NULL
)
ENGINE = InnoDB;

CREATE TABLE usuarios(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(45) NOT NULL,
  idade INT NOT NULL,
  planos_id INT,
  FOREIGN KEY (planos_id)
  REFERENCES planos(id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE artistas(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  artista VARCHAR(45) NOT NULL
)
ENGINE = InnoDB;

CREATE TABLE albuns(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  album VARCHAR(45) NOT NULL,
  artistas_id INT NOT NULL,
  FOREIGN KEY (artistas_id)
  REFERENCES artistas(id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE cancoes(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  cancao VARCHAR(45) NOT NULL,
  albuns_id INT NOT NULL,
  FOREIGN KEY (albuns_id)
  REFERENCES albuns(id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE historico_de_reproducoes(
  usuarios_id INT NOT NULL,
  cancoes_id INT NOT NULL,
  PRIMARY KEY (usuarios_id, cancoes_id),
  FOREIGN KEY (usuarios_id)
  REFERENCES usuarios(id),
  FOREIGN KEY (cancoes_id) 
  REFERENCES cancoes(id)
) engine = InnoDB;

CREATE TABLE seguindo_artistas(
  usuarios_id INT NOT NULL,
  artistas_id INT NOT NULL,
  PRIMARY KEY (usuarios_id, artistas_id),
  FOREIGN KEY (usuarios_id)
  REFERENCES usuarios(id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (artistas_id)
  REFERENCES artistas(id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO planos (plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO usuarios (usuario, idade, planos_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO artistas (artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
INSERT INTO albuns (album, artistas_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO cancoes (cancao, albuns_id)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ("Sweetie, Let's Go Wild", 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ("Honey, Let's Be Silly", 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO historico_de_reproducoes (usuarios_id, cancoes_id)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);

INSERT INTO seguindo_artistas (usuarios_id, artistas_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

  -- cosntrução do projeto iniciou em diagramas como uma nova model no worbench
  -- com apoio do Hugão Meu Ídolo. Refatorei sem diagramação por enfrentar dificuldade
