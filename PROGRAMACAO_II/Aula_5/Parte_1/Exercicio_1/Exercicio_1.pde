RodaDeCores esquerda, direita;

void setup(){
  esquerda = new RodaDeCores(color(255, 0, 0), color(0, 255, 0), color(0, 0, 255));
  direita = new RodaDeCores(color(12, 120, 87), color(180, 255, 0), color(60, 100, 255));
}

void draw(){
  fill(esquerda.corAtual());
  rect(0, 0, width / 2, height);

  fill(direita.corAtual());
  rect(width / 2, 0, width, height);
}

void mouseClicked(){
  if (mouseX < width / 2)
    esquerda.mudaProximaCor();
  else
    direita.mudaProximaCor();
}
