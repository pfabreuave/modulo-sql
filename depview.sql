
--*************************modelo 2*******************************

create view view_dependente as
 select distinct  id_conta from cliente_conta
 where cliente_conta.dependente = true;
 
select cliente_conta.id_conta,
        cliente.nome,
        cliente.id_cliente,
 		CASE WHEN cliente_conta.dependente = false THEN 'REPRESENTANTE' else '' END AS GERARQUIA   
 from cliente_conta
 join view_dependente on (cliente_conta.id_conta = view_dependente.id_conta)
 join cliente on (cliente.id_cliente = cliente_conta.id_cliente)
 ORDER BY cliente_conta.id_conta, cliente_conta.dependente;