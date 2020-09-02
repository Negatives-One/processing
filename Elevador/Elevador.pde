motor elevador;

void setup() {
  textMode(CENTER);
  size(600, 600);
  elevador = new motor(0, new PVector(width/2, 0));
}

void draw() {
  translate(0, 540);
  background(0);
  noStroke();
  elevador.update();
  for (int i = 0; i < 10; i++) {
    fill(255);
    text(i, 110, (i * -60) + 35);
    stroke(255);
    line(120, i*-60, width, i*-60);
  }
  text("Estado: " + str(elevador.estado), 10, 0);
  text("0 = PARADO", 10, 15);
  text("2 = SUBINDO", 10, 45);
  text("1 = DESCENDO", 10, 30);
  text("Andar Alvo: " + str(elevador.target), 10, -500);
  text("Andar Atual: " + str(elevador.andar), 10, -485);
}
