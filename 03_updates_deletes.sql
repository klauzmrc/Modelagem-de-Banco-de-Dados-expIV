-- ========= ATUALIZAÇÕES (UPDATE) E EXCLUSÕES (DELETE) =========

-- === UPDATE ===

-- Comando 1: Aplicar um desconto de 10% no livro 'Duna' para uma promoção.
-- A cláusula WHERE é crucial para não alterar todos os livros.
UPDATE LIVRO
SET Preco = Preco * 0.90
WHERE Titulo = 'Duna';
-- SELECT Titulo, Preco FROM LIVRO WHERE Titulo = 'Duna'; -- (Para verificar a alteração)


-- Comando 2: Alterar o status do primeiro pedido para 'Enviado'.
-- O WHERE garante que apenas o pedido específico seja atualizado.
UPDATE PEDIDO
SET Status = 'Enviado'
WHERE ID_Pedido = 1;
-- SELECT ID_Pedido, Status FROM PEDIDO WHERE ID_Pedido = 1; -- (Para verificar)


-- Comando 3: Corrigir o ano de publicação do livro '1984'.
-- Um exemplo de atualização para corrigir um erro de inserção.
UPDATE LIVRO
SET Ano_Publicacao = 1949 -- O ano correto da primeira publicação
WHERE ISBN = '978-8535914849';
-- SELECT Titulo, Ano_Publicacao FROM LIVRO WHERE ISBN = '978-8535914849'; -- (Para verificar)


-- === DELETE ===

-- Antes de deletar, vamos inserir um cliente novo sem pedidos para poder deletá-lo sem violar as restrições.
INSERT INTO CLIENTE (Nome, Email, Senha) VALUES ('Cliente a ser Deletado', 'deletar@email.com', 'senha');

-- Comando 1: Deletar um cliente que se cadastrou mas nunca fez uma compra.
-- O DELETE só funcionará se não houver pedidos ou endereços associados a ele.
DELETE FROM CLIENTE
WHERE Email = 'deletar@email.com';


-- Vamos inserir um livro que não será vendido para podermos deletá-lo.
INSERT INTO LIVRO (ID_Editora, Titulo, ISBN, Preco, Estoque) VALUES (1, 'Livro Temporário', 'TEMP-123', 19.99, 10);

-- Comando 2: Remover um livro do catálogo que não tem mais relevância e não foi vendido.
-- A cláusula WHERE é fundamental. Se o livro estivesse em algum ITEM_PEDIDO, este comando falharia devido à restrição de chave estrangeira.
DELETE FROM LIVRO
WHERE ISBN = 'TEMP-123';


-- Comando 3: Simular a remoção de um gênero que se tornou obsoleto.
-- Primeiro, inserimos um gênero para poder deletá-lo.
INSERT INTO GENERO (Nome_Genero) VALUES ('Gênero Obsoleto');
-- Agora, deletamos. Se algum livro estivesse associado a este gênero, a operação falharia.
DELETE FROM GENERO
WHERE Nome_Genero = 'Gênero Obsoleto';