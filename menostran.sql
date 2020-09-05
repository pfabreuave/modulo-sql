-- 5 principais clientes com menos transações

SELECT 
    transacao.id_cliente_conta as "CLIENTE",
    cliente.nome as "NOME DO CLIENTE",
    COUNT(*) AS Quantidade,
    cliente_conta.id_conta as "CONTA",
    conta.saldo as "SALDO"
    FROM transacao
    
    join cliente_conta
	on (transacao.id_cliente_conta = cliente_conta.id_cliente_conta)
    
   join cliente   
	on (cliente_conta.id_cliente = cliente.id_cliente)

   join conta 
	on (cliente_conta.id_conta = conta.id_conta)
    
    GROUP BY transacao.id_cliente_conta, cliente.nome,
    		 cliente_conta.id_conta, Conta.saldo
    ORDER BY Quantidade ASC
    LIMIT 5;   
--