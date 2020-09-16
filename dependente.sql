
---*********************modelo 1********************************

select distinct 
	   c.nome, 
	   rep.id_conta,
       CASE WHEN rep.dependente = false 
       THEN 'REPRESENTANTE' else '' END AS GERARQUIA
from cliente_conta as dep 
JOIN cliente_conta as rep on dep.id_conta = rep.id_conta
join cliente c on rep.id_cliente = c.id_cliente
where dep.dependente = true
order by rep.id_conta, GERARQUIA desc;
