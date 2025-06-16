CREATE DATABASE IF NOT EXISTS db_escola;

USE db_escola;

DROP TABLE IF EXISTS tb_estudantes;

CREATE TABLE tb_estudantes(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    turma VARCHAR(50),
    media_final DECIMAL(4, 2),
    data_matricula DATE,
    PRIMARY KEY (id)
);

INSERT INTO tb_estudantes(nome, turma, media_final, data_matricula) 
VALUES 
("Beatriz Costa", "9º Ano A", 8.50, "2023-01-15"),
("Carlos Eduardo", "8º Ano B", 9.50, "2023-01-16"),
("Juliana Lima", "9º Ano A", 6.20, "2023-01-18"),
("Felipe Almeida", "7º Ano C", 4.50, "2023-01-20"),
("Larissa Mendes", "8º Ano B", 7.80, "2023-01-22"),
("Ricardo Neves", "9º Ano A", 8.00, "2023-01-25"),
("Sofia Pereira", "7º Ano C", 6.80, "2023-01-28"),
("Thiago Santos", "8º Ano B", 5.50, "2023-02-01");

SELECT * FROM tb_estudantes WHERE media_final > 7.0;

SELECT * FROM tb_estudantes WHERE media_final < 7.0;

UPDATE tb_estudantes SET media_final = 7.20 WHERE id = 6;

SELECT * FROM tb_estudantes;
