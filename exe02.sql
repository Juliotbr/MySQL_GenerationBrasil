-- Cria o banco de dados (senão existir)
CREATE DATABASE IF NOT EXISTS db_ecommerce;

-- Seleciona o banco de dados para uso
USE db_ecommerce;

-- Remove a tabela antiga (se existir)
DROP TABLE IF EXISTS tb_produtos;

-- Cria a tabela de produtos com 6 atributos
CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    marca VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT,
    PRIMARY KEY (id)
);

-- Insere 8 registros de produtos na tabela
INSERT INTO tb_produtos(nome, marca, categoria, preco, estoque) 
VALUES 
("Smartphone Pro X10", "TechNova", "Eletrônicos", 2999.90, 150), 
("Notebook UltraSlim i7", "Compilar", "Informática", 5650.50, 45),
("Teclado Mecânico Gamer", "Falcon", "Periféricos", 349.99, 210),
("Mouse Sem Fio Ergo+", "Falcon", "Periféricos", 180.00, 300),
("Monitor UltraWide 29''", "Vision", "Monitores", 1450.75, 80),
("Cadeira Gamer Pro", "ConfortoMax", "Móveis", 980.00, 110),
("Headset Surround 7.1", "AudioPhonic", "Áudio", 489.50, 95),
("Webcam 4K Pro", "Vision", "Periféricos", 650.00, 180);

-- SELECT Produtos com o valor maior do que 500
SELECT * FROM tb_produtos WHERE preco > 500.00;

-- SELECT Produtos com o valor menor do que 500
SELECT * FROM tb_produtos WHERE preco < 500.00;

-- Atualiza o preço e o estoque de um produto 
UPDATE tb_produtos SET preco = 449.99, estoque = 150 WHERE id = 7;
UPDATE tb_produtos SET preco = 549.99, estoque = 300 WHERE id = 8;

-- Consulta para verificar a atualização feita e exibir todos os dados finais
SELECT * FROM tb_produtos;
