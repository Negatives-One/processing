final int PARADO = 0;
final int MARTELANDO = 1;

PImage imgParado, imgMartelando;

int estadoPlayer = PARADO;

int imageSize = 400;

void setup() {
  imageMode(CENTER);
  noSmooth();
  size(800, 600);
  imgParado = loadImage("parado.png");
  imgMartelando = loadImage("martelando.png");
}

void draw() {
  background(255);
  MEF();
  mostraPlayer(estadoPlayer);
}

void mostraPlayer(int estado) {
  if (estado == PARADO) {
    image(imgParado, width/2, height/2, imageSize, imageSize);
  } else if (estado == MARTELANDO) {
    image(imgMartelando, width/2, height/2, imageSize, imageSize);
  }
}

void MEF() {
  if (keyPressed == true) {
    if (key == ' ') {
      estadoPlayer = MARTELANDO;
    }
  } else {
    estadoPlayer = PARADO;
  }
}
