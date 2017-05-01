--Josmar Saiefert

--01
select d.NomeDepartamento, e.Nome from empregado e, departamento d 
where e.CodDepartamento = d.CodDepartamento order by d.NomeDepartamento, e.Nome

--02
select d.NomeDepartamento, e.Nome from empregado e, departamento d 
where e.CodDepartamento = d.CodDepartamento and e.Sexo = 'F' and
e.Nome like 'a%' order by d.NomeDepartamento, e.Nome

--03
select e.Nome, p.NomeProeto from empregado e, projeto p, empregado_projeto ep
where e.CodEmpregado = ep.CodEmpregado and p.CodProjeto = ep.CodProjeto

--04
select distinct CodEmpregado, Nome from empregado
where CodSupervisor is not null

--05
select Nome, max(Salario) from empregado

--06
select e.Nome from empregado e, empregado_projeto ep
where ep.CodProjeto is null and e.CodEmpregado = ep.CodEmpregado

--07
select e.Nome, e.Salario from empregado e
where e.Salario < (select sum(Salario) from empregado where CodDepartamento = 3)

--08
select e.Nome,e.Salario, ((select max(Salario) from empregado)-e.Salario) as diferenca
from empregado e 

--09
select  d.NomeDepartamento, count(p.CodProjeto) from departamento d, projeto p
where d.CodDepartamento = p.CodDepartamento group by d.CodDepartamento, d.NomeDepartamento

 
--10
select e.nome, count(d.CodDependente) from empregado e, dependente d
where e.CodEmpregado = d.CodEmpregado group by e.CodEmpregado, e.Nome

--11
select e.nome from empregado e, dependente d 
where e.CodEmpregado = d.CodEmpregado
