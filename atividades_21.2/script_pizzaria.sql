-- Cria o Banco de Dados com o nome especificado
CREATE DATABASE db_pizzaria_legal;

-- Seleciona o Banco de Dados para uso
USE db_pizzaria_legal;

-- 1. Crie a tabela tb_categorias
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

-- 2. Crie a tabela tb_pizzas
CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    ingredientes TEXT,
    valor DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(100),
    -- 3. Cria a Chave Estrangeira para relacionar com tb_categorias
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- 4. Insira 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Salgada Tradicional', 'Pizzas clássicas com os sabores que todos amam.'),
('Salgada Especial', 'Combinações gourmet e ingredientes selecionados.'),
('Vegetariana', 'Pizzas sem carne, com muito queijo e vegetais frescos.'),
('Doce', 'Opções deliciosas para a sobremesa.'),
('Vegana', 'Pizzas sem nenhum ingrediente de origem animal.');

-- 5. Insira 8 registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome, ingredientes, valor, tamanho, categoria_id) VALUES
('Mussarela', 'Molho de tomate fresco e queijo mussarela.', 44.00, 'Grande', 1),
('Margherita', 'Molho, mussarela, rodelas de tomate e manjericão.', 52.00, 'Grande', 1),
('Calabresa Acebolada', 'Mussarela, calabresa fatiada e cebola.', 48.50, 'Grande', 1),
('Lombo com Champignon', 'Mussarela, lombo canadense e champignon.', 65.00, 'Grande', 2),
('Brócolis com Bacon', 'Mussarela, brócolis, bacon crocante e alho frito.', 62.00, 'Grande', 2),
('Rúcula com Tomate Seco', 'Mussarela de búfala, rúcula e tomate seco.', 58.00, 'Grande', 3),
('Morango com Nutella', 'Creme de avelã Nutella com morangos frescos.', 71.00, 'Média', 4),
('Romeu e Julieta', 'Mussarela e goiabada cremosa.', 55.00, 'Média', 4);

-- 6. Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
SELECT * FROM tb_pizzas WHERE valor > 45.00;

-- 7. Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

-- 8. Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

-- 9. Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
SELECT 
    p.id, 
    p.nome, 
    p.ingredientes,
    p.valor,
    p.tamanho,
    c.nome_categoria,
    c.descricao
FROM 
    tb_pizzas AS p
INNER JOIN 
    tb_categorias AS c ON p.categoria_id = c.id;

-- 10. Faça um SELECT utilizando a cláusula INNER JOIN, onde traga apenas as pizzas que pertençam a uma categoria específica.
SELECT 
    p.id, 
    p.nome, 
    p.ingredientes,
    p.valor,
    p.tamanho
FROM 
    tb_pizzas AS p
INNER JOIN 
    tb_categorias AS c ON p.categoria_id = c.id
WHERE 
    c.nome_categoria = 'Doce';