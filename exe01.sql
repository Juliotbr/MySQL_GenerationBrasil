-- Cria o banco de dados (senão existir)
CREATE DATABASE IF NOT EXISTS db_servico_rh;

-- Seleciona o banco de dados para uso
USE db_servico_rh;

-- Remove a tabela antiga (se existir)
DROP TABLE IF EXISTS tb_colaboradores;

-- Cria a tabela de colaboradores com 6 atributos
CREATE TABLE tb_colaboradores(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255),
    departamento VARCHAR(255),
    salario DECIMAL(10, 2),
    data_admissao DATE,
    PRIMARY KEY (id)
);

-- Insere 8 registros de colaboradores na tabela
INSERT INTO tb_colaboradores(nome, cargo, departamento, salario, data_admissao) 
VALUES 
("Ana", "Desenvolvedora Java Jr", "TI", 3800.00, "2023-02-15"),
("Bruno", "Analista de Marketing", "Marketing", 2800.00, "2022-10-20"),
("Carla", "Gerente de Vendas", "Vendas", 6500.00, "2021-07-10"),
("Daniel", "Estagiário de RH", "RH", 1800.00, "2024-01-25"),
("Fernanda", "Analista Financeiro", "Financeiro", 4200.00, "2022-05-01"),
("Lucas", "Jovem Aprendiz", "TI", 1400.00, "2024-03-01"),
("Mariana", "Recepcionista", "Administrativo", 1950.00, "2023-11-15"),
("Rafael", "Auxiliar de Logística", "Logística", 1900.00, "2023-09-05");

-- SELECT Colaboradores com o salário maior que 2000
SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

-- SELECT Colaboradores com o salário menor que 2000
SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

-- Atualiza o cargo e o salário de Daniel e Lucas, que foram efetivados
UPDATE tb_colaboradores SET cargo = "Assistente de RH", salario = 2300.00 WHERE id = 4;
UPDATE tb_colaboradores SET cargo = "Analista Junior", salario = 2800.00 WHERE id = 6;

-- Consulta para verificar a atualização feita e exibir todos os dados finais
SELECT * FROM tb_colaboradores;