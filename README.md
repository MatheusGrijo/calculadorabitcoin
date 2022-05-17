# calculadorabitcoin
Calculadora de precificação de ativos criptográficos, baseado no modelo de BlackScholes.

Exemplo: http://matheusgrijo.com.br/calculadorabitcoin

#No que essa calculadora pode nos ajudar? E qual a utilidade dela?
Bom esse modelo de precificação de opções é amplamente utilizado no mercado tradicional há muitos anos, ele foi criado na decadá de 70, inicialmente para precificações de opções, mas podemos utiilizar ele para algumas ideias bem legais no mercado de criptomoedas, que está cada vez mais crescente, vou dar alguma sugestões que eu utilizo para operações:

#1 . Swing trades ou manutenção de posição.
Você pode calcular por exemplo se em uma data futura(mês que vem) por exemplo o valor do BITCOIN pode cair a X mil dolarés para você tomar a decisão de desmontar ou montar uma operação a longo prazo, sendo assim perfeito para swing trades de média e longa duração. Entenda que o algoritimo preve a probabilidade do preço estar ACIMA ou ABAIXO do que você colocou, o algoritimo não é capaz de prever o peço futuro.

#2 . Compra/Venda de opções na DERIBIT.
Sinceramente esse é o que eu mais uso, com base no calculo acima eu consigo verificar o quanto de probabilidade eu tenho para não ser exercido em uma opção de venda por exemplo, e fico tranquilo para vender uma CALL ou uma PUT e ganhar o prêmio dela na DERIBIT, eu costumo vender opções que ficarão abaixo do preço do strike em pelo menos 70%~80%, é uma operação mais estrutura e baseada em estatisticas.

#3 . UNISWAP v3 gerando liquidez e ganhando com taxas
Esse é uma ótima forma de renda passiva ainda mais com a UNISWAP v3, com a calculadora eu pego um par que paga bastante taxas como USDC/WETH e calculo a probabilidade do ativo ir até certo range ou não(funcionalidade nova da uniswap v3), assim fico tranquilo com os meus ganhos, não me importanto muito com a perda impermanente.

#4 . Especulação
Sabe aquela pessoa que sempre pergunta, "será que o bitcoin vau cair?", pois bem com essa calculadora as suas dúvidas serão respondidas.

