#Questões Aula 06 e 07

#1- Maior venda
select  max(qtd_vendida) as total
from vendas;

#2- Qual o maior vendedor em quantidade
select id_vendedor,sum(qtd_vendida) as total_vendas
 from vendas
 group by id_vendedor
 limit 1;

# 3- A quantidade de livros que cada vendedor vendeu
select  id_vendedor, sum(qtd_vendida) as total_vendas
from vendas
group by  id_vendedor
order by total_vendas desc;

# 4- Qual livro mais vendido
select id_livro, sum(qtd_vendida) as total
from vendas
group by id_livro
order by total desc
limit 1;

# 5- Quais livros não foram vendidos
select livros.id_livro, nome_livro, qtd_vendida
from livros
left join vendas
on livros.id_livro = vendas.id_livro
order by qtd_vendida asc;

# 6- Quais livros não estão mais disponíveis 
select vendas.id_livro, nome_livro, qtd_vendida
from livros
right join vendas as v
on livros.id_livro = vendas.id_livro
order by qtd_vendida desc;

#7- Qual a média de vendas entre os vendedores
select  vendedores.id_vendedor, nome_vendedor, avg (qtd_vendida) as media_vendas
from vendedores 
inner join vendas
on vendedores.id_vendedor = vendas.id_vendedor
group by  id_vendedor
order by media_vendas desc;

#8- Qual foi o total de vendas feitas no clube do livro
select sum(qtd_vendida)
from vendas;

#9- Qual o maior pedido em termos de valor monetário feito multiplicando a quantidade de livros 
select livros.id_livro, nome_livro, max(preco) * max(qtd_vendida) as maior_valor_pedido
from livros
inner join vendas
on livros.id_livro = vendas.id_livro
group by livros.id_livro
order by  maior_valor_pedido desc
limit 1;

#9- Qual o maior pedido em termos de valor monetário feito?
select livros.id_livro, nome_livro, preco, max(qtd_vendida) as total 
from livros
inner join vendas
on livros.id_livro = vendas.id_livro
group by livros.id_livro
order by preco desc
limit 1;

#10- Quaos os livros estão com um exemplar no estoque
select livros.id_livro, nome_livro, qtd_estoque
from livros
inner join estoque
on livros.id_livro = estoque.id_livro
where qtd_estoque = 1
