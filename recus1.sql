
-- Recuperação de saldos en contas -

UPDATE    conta
SET saldo = calculo_novo_saldo.NEW_SALDO
FROM

 (SELECT conta.id_conta,
 SUM(CASE WHEN transacao.id_tipo_transacao = 1 THEN transacao.valor
                      ELSE (-1) * transacao.valor END) NEW_SALDO
  
FROM transacao
      
join cliente_conta
	 on (transacao.id_cliente_conta = cliente_conta.id_cliente_conta)
     
join conta 
	on (cliente_conta.id_conta = conta.id_conta)
     
GROUP BY  
        conta.id_conta,                          
        conta.saldo) AS calculo_novo_saldo
        WHERE calculo_novo_saldo.id_conta = conta.id_conta;



