-- ========= CRIAÇÃO DAS TABELAS (DDL) =========

-- Tabela de domínio para Editoras

CREATE TABLE EDITORA (
    ID_Editora INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Editora VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de domínio para Autores

CREATE TABLE AUTOR (
    ID_Autor INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Autor VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de domínio para Gêneros

CREATE TABLE GENERO (
    ID_Genero INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Genero VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela principal de Livros

CREATE TABLE LIVRO (
    ID_Livro INT PRIMARY KEY AUTO_INCREMENT,
    ID_Editora INT NOT NULL,
    Titulo VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Sinopse TEXT,
    Ano_Publicacao INT,
    Numero_Paginas INT,
    Idioma VARCHAR(50),
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL,
    FOREIGN KEY (ID_Editora) REFERENCES EDITORA(ID_Editora)
);

-- Tabela principal de Clientes

CREATE TABLE CLIENTE (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL,
    Data_Nascimento DATE
);

-- Tabela de Endereços, associada a Clientes

CREATE TABLE ENDERECO (
    ID_Endereco INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    Logradouro VARCHAR(255) NOT NULL,
    Numero VARCHAR(20),
    Complemento VARCHAR(100),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    Tipo_Endereco VARCHAR(50) DEFAULT 'Casa',
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente)
);

-- Tabela principal de Pedidos

CREATE TABLE PEDIDO (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    ID_Endereco_Entrega INT NOT NULL,
    Data_Pedido DATETIME NOT NULL,
    Status VARCHAR(50) DEFAULT 'Processando',
    Valor_Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente),
    FOREIGN KEY (ID_Endereco_Entrega) REFERENCES ENDERECO(ID_Endereco)
);

-- Tabela associativa para Livro-Autor (N-M)

CREATE TABLE LIVRO_AUTOR (
    ID_Livro INT NOT NULL,
    ID_Autor INT NOT NULL,
    PRIMARY KEY (ID_Livro, ID_Autor),
    FOREIGN KEY (ID_Livro) REFERENCES LIVRO(ID_Livro),
    FOREIGN KEY (ID_Autor) REFERENCES AUTOR(ID_Autor)
);

-- Tabela associativa para Livro-Gênero (N-M)

CREATE TABLE LIVRO_GENERO (
    ID_Livro INT NOT NULL,
    ID_Genero INT NOT NULL,
    PRIMARY KEY (ID_Livro, ID_Genero),
    FOREIGN KEY (ID_Livro) REFERENCES LIVRO(ID_Livro),
    FOREIGN KEY (ID_Genero) REFERENCES GENERO(ID_Genero)
);

-- Tabela associativa para Pedido-Livro (N-M)

CREATE TABLE ITEM_PEDIDO (
    ID_Pedido INT NOT NULL,
    ID_Livro INT NOT NULL,
    Quantidade INT NOT NULL,
    Preco_Unitario_Compra DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ID_Pedido, ID_Livro),
    FOREIGN KEY (ID_Pedido) REFERENCES PEDIDO(ID_Pedido),
    FOREIGN KEY (ID_Livro) REFERENCES LIVRO(ID_Livro)
);