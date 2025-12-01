-- ========= INSERÇÃO DE DADOS DE EXEMPLO (DML) =========

-- Inserindo Editoras

INSERT INTO EDITORA (Nome_Editora) VALUES 
('Rocco'), 
('HarperCollins'), 
('Companhia das Letras'),
('Aleph');

-- Inserindo Autores

INSERT INTO AUTOR (Nome_Autor) VALUES 
('J.K. Rowling'), 
('J.R.R. Tolkien'), 
('George Orwell'),
('Frank Herbert');

-- Inserindo Gêneros

INSERT INTO GENERO (Nome_Genero) VALUES 
('Fantasia'), 
('Distopia'), 
('Ficção Científica'),
('Clássico');

-- Inserindo Livros

INSERT INTO LIVRO (ID_Editora, Titulo, ISBN, Ano_Publicacao, Numero_Paginas, Idioma, Preco, Estoque) VALUES 
(1, 'Harry Potter e a Pedra Filosofal', '978-8532530277', 2017, 224, 'Português', 49.90, 150),
(2, 'O Senhor dos Anéis: A Sociedade do Anel', '978-8595084759', 2019, 576, 'Português', 69.90, 100),
(3, '1984', '978-8535914849', 2009, 416, 'Português', 34.90, 200),
(4, 'Duna', '978-8576574136', 2017, 680, 'Português', 89.90, 80),
(1, 'Harry Potter e a Câmara Secreta', '978-8532530284', 2017, 288, 'Português', 49.90, 120);

-- Associando Livros a Autores

INSERT INTO LIVRO_AUTOR (ID_Livro, ID_Autor) VALUES
(1, 1), -- Harry Potter e a Pedra Filosofal -> J.K. Rowling
(2, 2), -- O Senhor dos Anéis -> J.R.R. Tolkien
(3, 3), -- 1984 -> George Orwell
(4, 4), -- Duna -> Frank Herbert
(5, 1); -- Harry Potter e a Câmara Secreta -> J.K. Rowling

-- Associando Livros a Gêneros

INSERT INTO LIVRO_GENERO (ID_Livro, ID_Genero) VALUES
(1, 1), -- Harry Potter -> Fantasia
(2, 1), -- O Senhor dos Anéis -> Fantasia
(2, 4), -- O Senhor dos Anéis -> Clássico
(3, 2), -- 1984 -> Distopia
(3, 4), -- 1984 -> Clássico
(4, 3), -- Duna -> Ficção Científica
(5, 1); -- Harry Potter 2 -> Fantasia

-- Inserindo Clientes

INSERT INTO CLIENTE (Nome, Email, Senha, Data_Nascimento) VALUES
('Maria Silva', 'maria.silva@email.com', 'senha_hash_123', '1990-05-15'),
('João Santos', 'joao.santos@email.com', 'senha_hash_456', '1985-11-22');

-- Inserindo Endereços para os Clientes

INSERT INTO ENDERECO (ID_Cliente, Logradouro, Numero, Cidade, Estado, CEP, Tipo_Endereco) VALUES
(1, 'Rua das Flores', '123', 'São Paulo', 'SP', '01234-567', 'Casa'),
(2, 'Avenida Principal', '789', 'Rio de Janeiro', 'RJ', '21000-123', 'Trabalho');

-- Inserindo Pedidos

-- Pedido 1: Maria Silva compra 1 '1984' e 1 'Duna'
INSERT INTO PEDIDO (ID_Cliente, ID_Endereco_Entrega, Data_Pedido, Valor_Total) VALUES
(1, 1, '2024-10-26 10:00:00', 124.80);
INSERT INTO ITEM_PEDIDO (ID_Pedido, ID_Livro, Quantidade, Preco_Unitario_Compra) VALUES
(1, 3, 1, 34.90), -- 1x '1984'
(1, 4, 1, 89.90); -- 1x 'Duna'

-- Pedido 2: João Santos compra 2 'Harry Potter e a Pedra Filosofal'
INSERT INTO PEDIDO (ID_Cliente, ID_Endereco_Entrega, Data_Pedido, Valor_Total) VALUES
(2, 2, '2024-10-27 14:30:00', 99.80);
INSERT INTO ITEM_PEDIDO (ID_Pedido, ID_Livro, Quantidade, Preco_Unitario_Compra) VALUES
(2, 1, 2, 49.90); -- 2x 'Harry Potter'