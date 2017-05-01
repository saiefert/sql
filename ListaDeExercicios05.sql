--Josmar Saiefert

--01
select CNPJ from revendedor 
where Estado = 'SP'

--02

select * from cliente 
where Nome like '%Silva%'

--03

select * from veiculo
where PrecoTabela between 15000.00 and 30000.00

--04

select CNPJ from estoque
where Quantidade >=2

--05

select fabricante, sum(PrecoTabela) from automovel
group by fabricante

--06

select CNPJ, avg(PrecoVenda) from negocio
group by CNPJ

--07

select * from automovel 
where Pais = 'Alemanha' order by PrecoTabela desc
