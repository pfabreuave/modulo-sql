--Recuperação de saldos de contas parte 2--
 
SELECT transacao.id_cliente_conta as "C-C TRANSACAO", 
               cliente.nome as "NOME DO CLIENTE",
               cliente.cpf as "C.P.F.",
               cliente_conta.id_conta as "C-C CLIENTE CONTA",
               conta.id_conta as "conta CONTA",
               conta.saldo as "SALDO ACTUAL",  
 
SUM(CASE WHEN transacao.id_tipo_transacao = 1 THEN transacao.valor
    	   ELSE (-1)*transacao.valor END) NEW_SALDO        
FROM transacao

join cliente_conta  
	on (transacao.id_cliente_conta = cliente_conta.id_cliente_conta)
    
join conta   
	on (cliente_conta.id_conta = conta.id_conta)
    
join cliente   
	on (cliente_conta.id_cliente = cliente.id_cliente) 
  
GROUP BY  transacao.id_cliente_conta, cliente.nome, cliente.cpf,
                     cliente_conta.id_conta, conta.id_conta, conta.saldo 
ORDER BY 1;