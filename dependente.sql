-- Relação de clientes dependentes


SELECT
                cliente_conta.id_cliente as cliente,
                cliente.nome as "NOME DO CLIENTE",
                cliente.cpf as "C.P.F.",
                cliente_conta.id_cliente_conta as representante,
                cliente_conta.id_conta as conta_representante,
                conta.saldo as "SALDO NA CONTA",
                dependente

FROM cliente_conta
join cliente   
	on (cliente_conta.id_cliente = cliente.id_cliente) 
join conta   
	on (cliente_conta.id_conta = conta.id_conta) 	
where cliente_conta.dependente = true;  
--