use sucos_vendas;

#Questão 1
#Enunciado: Quais são os produtos que foram vendidos em quantidade superior a 1000 unidades em 2023?

SELECT itens_notas_fiscais.CODIGO_DO_PRODUTO, tabela_de_produtos.NOME_DO_PRODUTO, SUM(itens_notas_fiscais.QUANTIDADE) AS TOTAL_VENDIDO
FROM itens_notas_fiscais
INNER JOIN notas_fiscais
ON itens_notas_fiscais.NUMERO = notas_fiscais.NUMERO
INNER JOIN tabela_de_produtos
ON itens_notas_fiscais.CODIGO_DO_PRODUTO = tabela_de_produtos.CODIGO_DO_PRODUTO
WHERE YEAR(notas_fiscais.DATA_VENDA) = 2023
GROUP BY itens_notas_fiscais.CODIGO_DO_PRODUTO, tabela_de_produtos.NOME_DO_PRODUTO
HAVING SUM(itens_notas_fiscais.QUANTIDADE) > 1000;


#Questão 2
#Enunciado: Quais são os estados do Brasil que possuem mais clientes?

SELECT ESTADO, COUNT(*) AS NUMERO_DE_CLIENTES
FROM tabela_de_clientes
GROUP BY ESTADO
ORDER BY NUMERO_DE_CLIENTES DESC;

#Questão 3
#Enunciado: Quais são os dias da semana em que a empresa vendeu mais produtos?(UTILIZE A FUNÇÃO DAYOFWEEK para extrair o dia da semana da coluna DATA_VENDA.

SELECT DAYOFWEEK(DATA_VENDA) AS DIA_DA_SEMANA, 
COUNT(*) AS NUMERO_DE_VENDAS
FROM notas_fiscais
GROUP BY DIA_DA_SEMANA
ORDER BY NUMERO_DE_VENDAS DESC;


#Questão 4
#Enunciado: Quais são os produtos que foram vendidos com maior frequência?

SELECT CODIGO_DO_PRODUTO, COUNT(*) AS FREQUENCIA_DE_VENDAS
FROM itens_notas_fiscais
GROUP BY CODIGO_DO_PRODUTO
ORDER BY FREQUENCIA_DE_VENDAS DESC;



#Questão 5
#Enunciado: Quais são os clientes que compraram mais produtos em 2017?

SELECT tabela_de_clientes.CPF, tabela_de_clientes.NOME, SUM(itens_notas_fiscais.QUANTIDADE) AS TOTAL_PROD_COMPRADOS
FROM tabela_de_clientes
INNER JOIN notas_fiscais
ON tabela_de_clientes.CPF = notas_fiscais.CPF
INNER JOIN itens_notas_fiscais
ON notas_fiscais.NUMERO = itens_notas_fiscais.NUMERO
WHERE YEAR(notas_fiscais.DATA_VENDA) = 2017
GROUP BY tabela_de_clientes.CPF, tabela_de_clientes.NOME
ORDER BY TOTAL_PROD_COMPRADOS DESC;


#Questão 6
#Enunciado: Obtenha o faturamento anual da empresa, considerando que o valor financeiro das vendas consiste em multiplicar a quantidade pelo preço.

SELECT YEAR(notas_fiscais.DATA_VENDA) AS ANO, SUM(itens_notas_fiscais.QUANTIDADE * itens_notas_fiscais.PRECO) AS FATURAMENTO_ANUAL
FROM itens_notas_fiscais 
INNER JOIN notas_fiscais
ON itens_notas_fiscais.NUMERO = notas_fiscais.NUMERO
GROUP BY ANO;



#Questão 7
#Enunciado: Quais foram os clientes que fizeram mais de 2000 compras em 2018?

SELECT tabela_de_clientes.CPF, tabela_de_clientes.NOME, COUNT(DISTINCT notas_fiscais.NUMERO) AS	QTD_DE_COMPRAS
FROM tabela_de_clientes
INNER JOIN notas_fiscais
ON tabela_de_clientes.CPF = notas_fiscais.CPF
INNER JOIN itens_notas_fiscais
ON notas_fiscais.NUMERO = itens_notas_fiscais.NUMERO
WHERE YEAR(notas_fiscais.DATA_VENDA) = 2018
GROUP BY tabela_de_clientes.CPF, tabela_de_clientes.NOME
HAVING QTD_DE_COMPRAS > 2000;



#Questão 8
#Enunciado:Qual é o preço médio dos produtos por tipo de embalagem?

SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
GROUP BY EMBALAGEM;



#Questão 10
#Enunciado:Quais são os produtos que foram vendidos em quantidade superior a 1000 unidades em 2016?

SELECT itens_notas_fiscais.CODIGO_DO_PRODUTO, tabela_de_produtos.NOME_DO_PRODUTO, SUM(itens_notas_fiscais.QUANTIDADE) AS TOTAL_VENDIDO
FROM itens_notas_fiscais
INNER JOIN notas_fiscais
ON itens_notas_fiscais.NUMERO = notas_fiscais.NUMERO
INNER JOIN tabela_de_produtos
ON itens_notas_fiscais.CODIGO_DO_PRODUTO = tabela_de_produtos.CODIGO_DO_PRODUTO
WHERE YEAR(notas_fiscais.DATA_VENDA) = 2017
GROUP BY itens_notas_fiscais.CODIGO_DO_PRODUTO, tabela_de_produtos.NOME_DO_PRODUTO
HAVING SUM(itens_notas_fiscais.QUANTIDADE) > 1000;

#Questão 10
#Enunciado:Quais são os produtos que foram vendidos em quantidade superior a 1000 unidades em 2016?

SELECT itens_notas_fiscais.CODIGO_DO_PRODUTO, tabela_de_produtos.NOME_DO_PRODUTO, SUM(itens_notas_fiscais.QUANTIDADE) AS TOTAL_VENDIDO
FROM itens_notas_fiscais
INNER JOIN notas_fiscais
ON itens_notas_fiscais.NUMERO = notas_fiscais.NUMERO
INNER JOIN tabela_de_produtos
ON itens_notas_fiscais.CODIGO_DO_PRODUTO = tabela_de_produtos.CODIGO_DO_PRODUTO
WHERE YEAR(notas_fiscais.DATA_VENDA) = 2016
GROUP BY itens_notas_fiscais.CODIGO_DO_PRODUTO, tabela_de_produtos.NOME_DO_PRODUTO
HAVING SUM(itens_notas_fiscais.QUANTIDADE) > 1000;