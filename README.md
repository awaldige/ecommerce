E-commerce Database

Descrição

Este projeto contém a estrutura de um banco de dados relacional para um sistema de e-commerce. Ele inclui tabelas para produtos, clientes, pedidos, fornecedores, estoque, vendedores terceirizados e formas de pagamento, garantindo uma modelagem robusta para um ambiente de compras online.

Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas principais:

Fornecedor: Armazena informações sobre fornecedores.

Produtos: Contém detalhes dos produtos disponíveis para venda.

Estoque: Representa locais de armazenamento dos produtos.

Clientes: Registra informações de clientes (Pessoa Física e Jurídica).

Pedido: Relaciona os pedidos realizados pelos clientes.

Entrega: Contém informações sobre o status das entregas.

Relação Produto/Pedido: Liga produtos aos pedidos.

Terceiro - Vendedor: Representa vendedores terceiros que comercializam produtos na plataforma.

Produtos por Vendedor: Relaciona produtos aos vendedores terceiros.

Formas de Pagamento: Define os métodos de pagamento aceitos.

Consultas SQL Implementadas

O banco de dados já inclui diversas queries SQL para operações comuns, incluindo:

Inserção de dados (INSERT)

Consulta de dados (SELECT)

Atualização de registros (UPDATE)

Exclusão de registros (DELETE)

Filtros com WHERE

Expressões para atributos derivados

Ordenação com ORDER BY

Agrupamento com filtros (HAVING)

Junções entre tabelas (JOIN) para análises mais complexas

Como Utilizar

Criação do banco de dados:

Execute o script SQL no seu SGBD (MySQL, MariaDB, etc.) para criar as tabelas e definir as constraints.

População de dados:

Utilize as queries INSERT fornecidas para adicionar dados iniciais.

Consultas e Relatórios:

Execute as queries de SELECT para extrair insights e verificar informações relevantes.

Tecnologias Utilizadas

MySQL SGBD relacional para armazenamento e gerenciamento dos dados.

SQL: Linguagem utilizada para manipulação e consulta dos dados.

Contribuições

Se deseja contribuir para este projeto, sinta-se à vontade para sugerir melhorias ou implementar novas consultas e funcionalidades. Qualquer sugestão será bem-vinda!
