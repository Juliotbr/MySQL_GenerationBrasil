-- Cria o Banco de Dados com o nome especificado
CREATE DATABASE db_farmacia_bem_estar;

-- Seleciona o Banco de Dados para uso
USE db_farmacia_bem_estar;

-- 1. Crie a tabela tb_categorias
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

-- 2. Crie a tabela tb_produtos
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    fabricante VARCHAR(255),
    valor DECIMAL(10, 2) NOT NULL,
    estoque INT,
    -- 3. Cria a Chave Estrangeira para relacionar com tb_categorias
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- 4. Insira 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Medicamentos', 'Medicamentos com e sem prescrição médica.'),
('Cosméticos', 'Produtos para beleza e cuidados com a pele.'),
('Higiene Pessoal', 'Itens para cuidados diários e higiene.'),
('Vitaminas e Suplementos', 'Suplementos alimentares e vitaminas.'),
('Primeiros Socorros', 'Itens para curativos e cuidados emergenciais.');

-- 5. Insira 8 registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, fabricante, valor, estoque, categoria_id) VALUES
('Dorflex 36cp', 'Sanofi', 25.50, 150, 1),
('Creme Facial Nivea', 'Nivea', 48.00, 80, 2),
('Protetor Solar FPS 50', 'Sundown', 56.90, 120, 2),
('Complexo Vitamínico C', 'Cimed', 75.00, 60, 4),
('Shampoo Clear Men', 'Unilever', 22.75, 200, 3),
('Caixa de Curativos', 'Johnson & Johnson', 8.50, 300, 5),
('Creme Dental Colgate Total 12', 'Colgate', 6.99, 400, 3),
('Tylenol DC 20cp', 'Johnson & Johnson', 33.40, 90, 1);

-- 6. Faça um SELECT que retorne todos os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM tb_produtos WHERE valor > 50.00;

-- 7. Faça um SELECT que retorne todos os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;

-- 8. Faça um SELECT utilizando o operador LIKE, buscando todos os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- 9. Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT 
    p.id, 
    p.nome, 
    p.fabricante,
    p.valor,
    p.estoque,
    c.nome_categoria,
    c.descricao
FROM 
    tb_produtos AS p
INNER JOIN 
    tb_categorias AS c ON p.categoria_id = c.id;

-- 10. Faça um SELECT utilizando a cláusula INNER JOIN, trazendo apenas os produtos que pertençam a uma categoria específica.
SELECT 
    p.id, 
    p.nome, 
    p.fabricante,
    p.valor,
    p.estoque
FROM 
    tb_produtos AS p
INNER JOIN 
    tb_categorias AS c ON p.categoria_id = c.id
WHERE 
    c.nome_categoria = 'Cosméticos';