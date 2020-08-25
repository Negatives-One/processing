// Fonte das imagens https://br.freepik.com/vetores-premium/icone-on-e-off-botao-interruptor_3620022.htm
Botao botoes[];

int numBotoes, numPorLinha, ladoImagem = 40;
int maxWidth, maxHeight;
int pontuacao;

void setup() {
  size(250, 200);
  maxWidth = 200;
  maxHeight = 200;

  numPorLinha = maxWidth / ladoImagem;
  numBotoes = numPorLinha * maxHeight / ladoImagem;

  pontuacao = 0;

  botoes = new Botao[numBotoes];
  for (int i = 0; i < numBotoes; i++)
    botoes[i] = new Botao(posicionaNEsimoBotaoX(i), posicionaNEsimoBotaoY(i), "verde.png", "vermelho.png", 1500);
}
/* 
 
   No procedimento draw(), primeiramente é definido o background, em seguida, o texto com
 a pontuação é posicionado e por ultimo um laço de repetição for é chamado para posicionar
 os botões e atualizar seus estados.
 
 */
void draw() {
  background(0);
  text(pontuacao, 215, 20);
  // Game loop  
  for (int i = 0; i < numBotoes; i++) {
    botoes[i].atualizaEstado();
    botoes[i].plotBotao();
  }
}

int posicionaNEsimoBotaoX(int indice) {
  int linha = indice % numPorLinha;

  return linha * ladoImagem;
}


int posicionaNEsimoBotaoY(int indice) {
  int coluna = indice / numPorLinha;

  return coluna * ladoImagem;
}

int qualBotao(int x, int y) {
  int linha = x / ladoImagem;
  int coluna = y / ladoImagem;

  return linha + numPorLinha * coluna;
}

/*

   No procedimento mouseClicked() primeiro é verificado se o mouse está dentro da área
 de jogo, caso não esteja, o restante da função não será lida. A posição do mouse é
 armazenada numa variável, que em seguida, a função qualBotao vai verificar qual botão
 o mouse está selecionando, tendo essa informação, se o botão pressionado estivesse "on",
 o jogador ganha 1 ponto e o botão se torna off através do método trocaEstado() da 
 classe SwitchAleatorio, se o botão estiver "off", o jogador perde pontuação, e ao 
 final do procedimento a pontuação é exibida no console.

*/
void mouseClicked() {
  if (mouseX >= maxWidth)
    return;

  int indiceBotao = qualBotao(mouseX, mouseY);

  if (botoes[indiceBotao].getEstado() == true) {
    pontuacao++;
    botoes[indiceBotao].trocaEstado();
  } else
    pontuacao--;

  println("Atualização da pontuação: " + str(pontuacao));
}
