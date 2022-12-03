-- Item a)
select Nome_Empregado
from Trabalha_Para
where Nome_Companhia = "Banco do Brasil";

-- Item b)
select e.Nome_Empregado, e.Cidade
from Empregado e, Trabalha_Para t 
where 
    e.Nome_Empregado = t.Nome_Empregado and 
    t.Nome_Companhia = "Banco do Brasil";

-- Item c)
select e.Nome_Empregado, e.rua, e.Cidade
from Empregado e, Trabalha_Para t 
where 
    e.Nome_Empregado = t.Nome_Empregado and 
    t.Nome_Companhia = "Banco do Brasil" and 
    t.Salario > 10000.00;

-- Item d)
select Nome_Empregado
from (
    select *
    from Empregado e, Trabalha_Para t
    where
        e.Nome_Empregado = t.Nome_Empregado
) as empregado_trabalha
from Companhia as c
where empregado_trabalha.Nome_Companhia = c.Nome_Companhia;

-- Item e)
select Emp.Nome_Empregado
from (
    select *
    from Empregado emp
    inner join (
        select * 
        from Empregado e
        inner join Gerencia g
        on e.Nome_Empregado = g.Nome_Empregado
    ) as Gerente ger 
    on emp.Nome_Empregado = ger.Nome_Empregado 
) as Empregado_Gerente
where 
    Emp.rua = Ger.rua and
    Emp.cidade = Ger.cidade;

-- Item f)
select e.Nome_Empregado
from (
    select * 
    from Empregado e
    inner join Trabalha_Para TP 
    on e.Nome_Empregado = TP.Nome_Empregado
) as empregado_trabalha
where TP.Nome_Companhia != "Banco do Brasil";

-- Item g)
select Nome_Empregado
from Trabalha_Para
where Salario > (
    select sum(Salario) as Salario_Montante
    from Trabalha_Para
    where Nome_Companhia = "Banco Safra"
    group by Nome_Companhia
);

-- Item h)

select Nome_Companhia
from Companhia
where Cidade in (
    select distinct(Cidade) as Cidades_Distintas
    from Companhia
    where Cidade = "Banco Safra"
) and Nome_Companhia != "Banco Safra"

-- Item j)
select e.Nome_Empregado, Emp_BB.Salario
from Empgreado e 
inner join (
    select Nome_Empregado, Salario
    from Trabalha_Para
    where Nome_Companhia = "Banco do Brasil"
) as Emp_BB
on e.Nome_Empregado = Emp_BB.Nome_Empregado
where e.Cidade = "Fortaleza"

-- Item k)
select Nome_Empregado
from (
    select 
    Nome_Empregado,
    count(Nome_Companhia) as quantidade_companhias
    from Trabalha_Para
    group by Nome_Empregado
) as Empregado_Companhia
where quantidade_companhias >= 2;

-- Item l)
select 
    e.Nome_Empregado,
    e.rua,
    e.cidade
from Empregado e
inner join (
    select Nome_Empregado
    from (
        select 
        Nome_Empregado,
        min(Salario) as Menor_Salario,
        sum(Salario) as Salario_Montante
        from Trabalha_Para
        group by Nome_Empregado
    ) as Empregado_Salario
    where Salario_Montante > Menor_Salario 
) as Empregado_Interesse
on e.Nome_Empregado = Empregado_Interesse.Nome_Empregado

-- Item m)
select 
    e.Nome_Empregado,
    e.rua,
    e.cidade
from Empregado e
inner join (
    select Nome_Empregado
    from (
        select 
        Nome_Empregado,
        max(Salario) as Maior_Salario,
        sum(Salario) as Salario_Montante
        from Trabalha_Para
        group by Nome_Empregado
    ) as Empregado_Salario
    where Salario_Montante > Maior_Salario 
) as Empregado_Interesse
on e.Nome_Empregado = Empregado_Interesse.Nome_Empregado

-- Item n)
select 
    Nome_Compnahia,
    count(Nome_Empregado) as quantidade_empregados,
    sum(Salario) as Salario_Total,
    avg(Salario) as Media_Salarial,
    avg(distinct(Salario)) as Salario_Medio,
    min(Salario) as Menor_Salario,
    max(Salario) as Maior_Salario
from Trabalha_Para
group by Nome_Companhia

-- Item o)
select 
    Nome_Empregado,
    Nome_Companhia,
    sum(Salario) as Salario_Pago_Companhia
from Trabalha_Para
group by Nome_Empregado, Nome_Companhia;