-- ========= CONSULTAS (SELECT) =========

-- Consulta 1: Listar todos os livros, seus autores e suas editoras.
-- Utiliza JOIN para combinar informações de três tabelas.

SELECT 
    L.Titulo,
    A.Nome_Autor AS Autor,
    E.Nome_Editora AS Editora
FROM LIVRO L
JOIN LIVRO_AUTOR LA ON L.ID_Livro = LA.ID_Livro
JOIN AUTOR A ON LA.ID_Autor = A.ID_Autor
JOIN EDITORA E ON L.ID_Editora = E.ID_Editora
ORDER BY L.Titulo;

-- Consulta 2: Encontrar todos os livros comprados pela cliente 'Maria Silva'.
-- Utiliza múltiplos JOINs para navegar desde o cliente até os livros, passando pelos pedidos.

SELECT 
    C.Nome AS Cliente,
    P.Data_Pedido,
    L.Titulo AS Livro_Comprado,
    IP.Quantidade,
    IP.Preco_Unitario_Compra
FROM CLIENTE C
JOIN PEDIDO P ON C.ID_Cliente = P.ID_Cliente
JOIN ITEM_PEDIDO IP ON P.ID_Pedido = IP.ID_Pedido
JOIN LIVRO L ON IP.ID_Livro = L.ID_Livro
WHERE C.Email = 'maria.silva@email.com';

-- Consulta 3: Mostrar os livros mais caros, do maior para o menor preço.
-- Utiliza ORDER BY DESC e LIMIT para criar um ranking.

SELECT 
    Titulo,
    Preco
FROM LIVRO
ORDER BY Preco DESC
LIMIT 5;

-- Consulta 4: Calcular o total de livros em estoque por editora.
-- Utiliza GROUP BY para agrupar os resultados e SUM para agregar os dados.

SELECT
    E.Nome_Editora AS Editora,
    SUM(L.Estoque) AS Total_Livros_Em_Estoque
FROM LIVRO L
JOIN EDITORA E ON L.ID_Editora = E.ID_Editora
GROUP BY E.Nome_Editora
ORDER BY Total_Livros_Em_Estoque DESC;