-- Relação dos clientes com o acumulado por tipo de transações

SELECT transacao.id_cliente_conta, 	   
       tipo_transacao.descricao as "TIPO DE TRANSAÇAO",
       sum(transacao.valor) as "TOTAL TIPO DE TRASAÇAO"
FROM transacao
JOIN tipo_transacao
	ON transacao.id_tipo_transacao = tipo_transacao.id_tipo_transacao
GROUP BY transacao.id_cliente_conta, transacao.id_tipo_transacao, descricao
ORDER BY 1;