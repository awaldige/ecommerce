CREATE DATABASE Ecommerce;
USE Ecommerce;
select * from fornecedor;
-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(255) NOT NULL
);
select * from produtos;
-- Tabela Produtos
CREATE TABLE Produtos (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    Categoria VARCHAR(45) NOT NULL,
    Descricao VARCHAR(255),
    Valor DECIMAL(10,2) NOT NULL
);
select * from estoque;
-- Tabela Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Localizacao VARCHAR(45) NOT NULL
);
select * from Estoque_Produtos;
-- Tabela Estoque_Produtos (Relacionamento Estoque-Produto)
CREATE TABLE Estoque_Produtos (
    idEstoque INT,
    idProduto INT,
    Quantidade INT NOT NULL,
    PRIMARY KEY (idEstoque, idProduto),
    FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);
select * from Fornecedor_Produtos;
-- Tabela Fornecedor_Produtos (Relacionamento Fornecedor-Produto)
CREATE TABLE Fornecedor_Produtos (
    idFornecedor INT,
    idProduto INT,
    PRIMARY KEY (idFornecedor, idProduto),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);
select *  from cliente;
-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Pnome VARCHAR(45) NOT NULL,
    NomeMeio VARCHAR(45),
    Sobrenome VARCHAR(45) NOT NULL,
    Documento CHAR(14) UNIQUE, -- Pode armazenar CPF ou CNPJ
    Tipo ENUM('PF', 'PJ') NOT NULL,
    DataNascimento DATE NULL -- Só para PF
);
select * from pedido;
-- Tabela Pedido
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(255),
    idCliente INT,
    Frete DECIMAL(10,2),
    idEntrega INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);
select * from entrega;
-- Tabela Entrega
CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    Status ENUM('Pendente', 'Enviado', 'Entregue') NOT NULL,
    RastreioEntrega VARCHAR(45) UNIQUE
);
select * from Relacao_Produto_Pedido ;
-- Tabela Relacao_Produto_Pedido (Relacionamento Produto-Pedido)
CREATE TABLE Relacao_Produto_Pedido (
    idProduto INT,
    idPedido INT,
    Quantidade INT NOT NULL,
    Status ENUM('Pendente', 'Enviado', 'Entregue') NOT NULL,
    PRIMARY KEY (idProduto, idPedido),
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);
select * from Terceiro_Vendedor;
-- Tabela Terceiro_Vendedor
CREATE TABLE Terceiro_Vendedor (
    idTerceiro INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(255) NOT NULL,
    Localizacao VARCHAR(255),
    NomeFantasia VARCHAR(255),
    Documento CHAR(14) UNIQUE, -- Pode armazenar CPF ou CNPJ
    Tipo ENUM('PF', 'PJ') NOT NULL
);
select * from Produtos_por_Vendedor;
-- Tabela Produtos_por_Vendedor (Relacionamento Produto-Vendedor)
CREATE TABLE Produtos_por_Vendedor (
    idTerceiro INT,
    idProduto INT,
    Quantidade INT NOT NULL,
    PRIMARY KEY (idTerceiro, idProduto),
    FOREIGN KEY (idTerceiro) REFERENCES Terceiro_Vendedor(idTerceiro),
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);
select * from FormaPagamento;
-- Tabela FormaPagamento
CREATE TABLE FormaPagamento (
    idFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
    Tipo ENUM('CartaoCredito', 'Pix', 'Boleto', 'Transferencia') NOT NULL
);
select * from Pagamento_Pedido;
-- Tabela Pagamento_Pedido (Relacionamento Pagamento-Pedido)
CREATE TABLE Pagamento_Pedido (
    idPedido INT,
    idFormaPagamento INT,
    PRIMARY KEY (idPedido, idFormaPagamento),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idFormaPagamento) REFERENCES FormaPagamento(idFormaPagamento)
);
-- inserindo dados
INSERT INTO Fornecedor (RazaoSocial) VALUES
('Fornecedor A'),
('Fornecedor B'),
('Fornecedor C');

INSERT ignore INTO Produtos (idProduto,Categoria, Descricao, Valor) VALUES
('1','Eletrônicos', 'Smartphone XYZ', 1500.00),
('2','Móveis', 'Sofá de Couro', 2500.00),
('3','Eletrodomésticos', 'Geladeira Frost Free', 3500.00);

INSERT INTO Estoque (Localizacao) VALUES
('Depósito Central'),
('Filial Norte'),
('Filial Sul');

INSERT IGNORE INTO Cliente (idCliente, Pnome, NomeMeio, Sobrenome, Documento, Tipo, DataNascimento) VALUES
(1, 'João', 'A.', 'Silva', '12345678901', 'PF', '1990-05-20'),
(2, 'Empresa XYZ', NULL, NULL, '98765432000100', 'PJ', NULL);

INSERT  INTO Cliente (idCliente, Pnome, NomeMeio, Sobrenome, Documento, Tipo, DataNascimento) VALUES
(5, 'Pedro', 'B.', 'Siqueira', '12348678901', 'PF', '1995-06-12');

insert IGNORE INTO Terceiro_Vendedor (idTerceiro, RazaoSocial, Localizacao, NomeFantasia, Documento) VALUES
(1, 'Vendedor A', 'São Paulo', 'Vendas SP', '12345678000199');
insert  INTO Terceiro_Vendedor (idTerceiro, RazaoSocial, Localizacao, NomeFantasia, Documento) VALUES
(2, 'Vendedor B', 'Campinas', 'Vendas SP', '32145678000199'),
(3, 'Vendedor C', 'Rio de Janeiro', 'Vendas RJ', '14345678000199');
INSERT INTO FormaPagamento (Tipo) VALUES
('CartaoCredito'),
('Pix'),
('Boleto'),
('Transferencia');

INSERT INTO Entrega (Status, RastreioEntrega) VALUES
('Pendente', 'ABC123'),
('Enviado', 'XYZ987');

INSERT INTO Fornecedor_Produtos (idFornecedor, idProduto) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Estoque_Produtos (idEstoque, idProduto, Quantidade) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 20);

INSERT IGNORE INTO Pedido (idPedido, Descricao,  Frete, idEntrega) VALUES
('1','Compra de Eletrônicos',  50.00, NULL),
('2','Compra de Móveis',  100.00, NULL);

INSERT INTO Relacao_Produto_Pedido (idProduto, idPedido, Quantidade, Status) VALUES
(1, 1, 2, 'Pendente'),
(2, 2, 1, 'Enviado');

INSERT INTO Pagamento_Pedido (idPedido, idFormaPagamento) VALUES
(1, 1),
(2, 2);

INSERT INTO Produtos_por_Vendedor (idTerceiro, idProduto, Quantidade) VALUES
(1, 1, 50),
(1, 2, 30),
(1, 3, 20);
show tables; 
desc  pedido;
-- Consulta com filtros usando WHERE
SELECT * FROM Produtos WHERE Valor > 100.00;

-- Ordenação de clientes por nome
SELECT * FROM Cliente ORDER BY Pnome ASC;
SELECT * FROM Produtos ORDER BY Valor DESC;
  -- Filtrar registros com WHERE
 SELECT * FROM Pedido WHERE Frete > 50;   
 -- Contar registros com COUNT
SELECT COUNT(*) AS Total_Clientes FROM Cliente;
--  Agrupar e filtrar com GROUP BY e HAVING
SELECT idCliente, COUNT(idPedido) AS Total_Pedidos
FROM Pedido
GROUP BY idCliente
HAVING COUNT(idPedido) > 3;
   
show databases;
use ecommerce;
show tables;
desc entrega;
desc cliente;
desc cliente_pf;
desc cliente_pj;
desc entrega;