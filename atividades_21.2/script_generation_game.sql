-- Cria o Banco de Dados com o nome especificado
CREATE DATABASE db_generation_game_online;

-- Seleciona o Banco de Dados para uso
USE db_generation_game_online;

-- 1. Crie a tabela tb_classes
CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    habilidade_principal VARCHAR(255)
);

-- 2. Crie a tabela tb_personagens
CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    poder_ataque INT,
    poder_defesa INT,
    nivel INT,
    -- 3. Cria a Chave Estrangeira para relacionar com tb_classes
    classe_id BIGINT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- 4. Insira 5 registros na tabela tb_classes
INSERT INTO tb_classes (nome, habilidade_principal) VALUES
('Guerreiro', 'Fúria de Batalha'),
('Mago', 'Bola de Fogo'),
('Arqueiro', 'Flecha Precisa'),
('Ladrão', 'Ataque Furtivo'),
('Clérigo', 'Cura Divina');

-- 5. Insira 8 registros na tabela tb_personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
('Aragorn', 2500, 1800, 55, 1),    -- Guerreiro
('Gandalf', 3200, 1500, 60, 2),    -- Mago
('Legolas', 2800, 1200, 58, 3),    -- Arqueiro
('Celeste', 900, 2500, 45, 5),     -- Clérigo, nome com 'C'
('Conan', 3500, 2100, 62, 1),      -- Guerreiro, nome com 'C'
('Cirilla', 2900, 1900, 59, 1),    -- Guerreiro, nome com 'C', defesa no intervalo
('Vex''ahlia', 2600, 1100, 57, 3), -- Arqueira, defesa no intervalo
('Zatanna', 1900, 900, 52, 2);     -- Mago

-- 6. Faça um SELECT que retorne todos os personagens cujo poder de ataque seja maior do que 2000.
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- 7. Faça um SELECT que retorne todos os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- 8. Faça um SELECT utilizando o operador LIKE, buscando todos os personagens que possuam a letra C no atributo nome.
SELECT * FROM tb_personagens WHERE nome LIKE '%c%';

-- 9. Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
SELECT 
    p.id, 
    p.nome, 
    p.poder_ataque, 
    p.poder_defesa, 
    p.nivel, 
    c.nome AS classe, 
    c.habilidade_principal 
FROM 
    tb_personagens AS p
INNER JOIN 
    tb_classes AS c ON p.classe_id = c.id;

-- 10. Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica.
SELECT 
    p.id, 
    p.nome, 
    p.poder_ataque, 
    p.poder_defesa, 
    p.nivel
FROM 
    tb_personagens AS p
INNER JOIN 
    tb_classes AS c ON p.classe_id = c.id
WHERE 
    c.nome = 'Arqueiro';