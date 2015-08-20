#Parser do Arquivo de Log do Jogo Quake

##Objetivo
Construir um parser em ruby lê o arquivo game.log e extrai informações do mesmo. Informações como por exemplo, os jogadores onlines durante uma partida, quantas mortes aconteceram em uma partida e como elas aconteceram.

##Solução
Foi criado o arquivo parse.rb, nele contem os métodos necessários para se extrair algumas informações como as citadas anteriormente.

Para executar o mesmo, basta clonar o repositório e no seu terminal, ir ate a pasta clonada e executar o comando: ruby parse.rb. Levando em consideração que você ja tem o ruby instalado em sua maquina.

As linhas do arquivo são lidas através da biblioteca File e do método foreach.
	
	File.foreach( "games.log" ) do |line|
	

Abaixo temos os métodos existente. Para mais detalhes, ler os comentários contidos no arquivo parse.rb.

##Métodos do Arquivo parse.rb

### 1. print_report
Método responsável por adiciona um game com o total de kills, os players onlines e a quantidade de kills por player ao hash de games ja criado. Também adiciona a quantidade de mortes por meio ao hash de ja criado.

### 2. concat_name_players
Método que concatena os players onlines para durante um game;

### 3. reset_values
Zera o valor das variáveis a cada finalização de game
