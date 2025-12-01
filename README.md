# Projeto de Banco de Dados: Livraria Online

Este repositório contém os artefatos da disciplina de Modelagem de Banco de Dados, focados na implementação de um sistema para uma livraria online fictícia. O projeto abrange desde a modelagem conceitual e lógica até a criação e manipulação de dados com SQL.

## 🎯 Objetivo

Implementar um banco de dados relacional funcional, incluindo a criação do esquema (DDL), a inserção de dados de exemplo (DML) e a execução de consultas e manipulações complexas.

## 📁 Estrutura do Repositório

- **/scripts**: Contém todos os scripts SQL do projeto.
  - `00_schema.sql`: Script de Data Definition Language (DDL) para criar todas as tabelas, chaves primárias e estrangeiras.
  - `01_inserts.sql`: Script com comandos `INSERT` para popular o banco de dados com dados de exemplo.
  - `02_queries.sql`: Script com uma variedade de consultas `SELECT` para extrair informações do banco de dados, utilizando `JOIN`, `WHERE`, `ORDER BY`, etc.
  - `03_updates_deletes.sql`: Script com exemplos de comandos `UPDATE` e `DELETE` para modificar e remover dados, respeitando as regras de integridade.

## 🚀 Como Executar os Scripts

Para recriar e testar o banco de dados, siga a ordem de execução abaixo em um ambiente SQL (como MySQL Workbench ou pgAdmin).

1.  **Executar `00_schema.sql`**: Este script criará toda a estrutura de tabelas vazias. Execute-o primeiro e apenas uma vez.
2.  **Executar `01_inserts.sql`**: Este script irá preencher as tabelas com dados de exemplo.
3.  **Executar `02_queries.sql`**: Execute as consultas para testar a extração de dados.
4.  **Executar `03_updates_deletes.sql`**: Execute os comandos de atualização e exclusão para testar a manipulação de dados.

## 🛠️ Modelo de Dados

O projeto é baseado no seguinte Diagrama Lógico:

<img width="6013" height="2662" alt="diagrama" src="https://github.com/user-attachments/assets/b57d3372-9d78-498f-9647-1d46c1f9ba02" />
