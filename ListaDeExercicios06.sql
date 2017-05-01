--Josmar Saiefert

--01
select * from empregado

--02
select CodEmpregado, Nome, Sexo from empregado

--03
select Nome, Salario from empregado
order by Salario desc

--04
select distinct CodEmpregado from dependente

--05
select * from empregado
where Salario between 3000.00 and 5000.00

--06
select * from empregado
where Endereco like '%Rua%'

--07
select nome, salario, (salario + salario*0.2) as salarioacrescido, 
(salario - salario*0.05) as salariodecrescido from empregado 

--08
select count(CodProjeto) as TotalProjetos from projetos

--09
select sum(Salario) as SomaSalarios, max(Salario) as MaiorSalario, 
min(Salario) as MenorSalario, avg(Salario) as MediaSalarios from empregado

--10
select CodDepartamento, count(CodProjeto) as TotalProjetos from projetos
group by CodDepartamento

