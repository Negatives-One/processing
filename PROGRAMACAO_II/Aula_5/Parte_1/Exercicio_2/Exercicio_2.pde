int posIniX, posIniY;

RodaDeCores roda;

void setup(){
  size(600, 600);
  
  roda = new RodaDeCores(color(12, 120, 87), color(180, 255, 0), color(60, 100, 255));
}

void draw(){
}

void desenhaQuadrado(Quadrado q, color c){
  fill(c);
  
  rect(q.getXSuperiorEsquerdo(), q.getYSuperiorEsquerdo(),
      q.getLado(),q.getLado());
}

void mousePressed(){
  posIniX = mouseX;
  posIniY = mouseY;
}

void mouseReleased(){
  if(posIniX == -1)
    return;
  
  int posFimX, posFimY;
  
  posFimX= mouseX;
  if(mouseX < posIniX){
    posFimX= posIniX;
    posIniX = mouseX;
  }
  
  posFimY = mouseY;
  if(mouseY < posIniY){
    posFimY = posIniY;
    posIniY = mouseY;
  }
    
  int lado = min(posFimX - posIniX, posFimY - posIniY);
  Quadrado quad = new Quadrado(posFimX, posFimY, lado);
  
  desenhaQuadrado(quad, roda.corAtual());
  roda.mudaProximaCor();
  println("Acabei de desenhar o seguinte quadrado:");
  println(quad);
  
  posIniX = -1;
}
