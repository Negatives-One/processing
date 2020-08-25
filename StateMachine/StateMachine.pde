final int PARADO = 0;
final int MARTELANDO = 1;
final int ATIRANDO = 2;

PImage imgParado[] = new PImage[3], imgMartelando[] = new PImage[10], imgAtirando[] = new PImage[5];
boolean Atira, Martela;

int estadoPlayer = PARADO;

int imageSize = 400;

int frame = 0;
int frameLimit = 0;

void setup() {
  frameRate(10);
  imageMode(CENTER);
  noSmooth();
  size(800, 600);
  for (int i = 0; i < imgParado.length; i++) {
    imgParado[i] = loadImage("IdlePose01_0" + str(i + 1) + ".png");
  }
  for (int i = 0; i < imgMartelando.length; i++) {
    imgMartelando[i] = loadImage("Attack01_0" + str(i + 1) + ".png");
  }
  for (int i = 0; i < imgAtirando.length; i++) {
    imgAtirando[i] = loadImage("Shoot01_0" + str(i + 1) + ".png");
  }
}

void draw() {
  background(0);
  //MEF();
  mostraPlayer(estadoPlayer);
  frameManager();
  text(frame, 100, 100);
  text(estadoPlayer, 100, 150);
}

void mostraPlayer(int estado) {
  if (estado == PARADO) {
    image(imgParado[frame], width/2, height/2, imageSize, imageSize);
  } else if (estado == MARTELANDO) {
    image(imgMartelando[frame], width/2, height/2, imageSize, imageSize);
  } else if (estado == ATIRANDO) {
    image(imgAtirando[frame], width/2, height/2, imageSize, imageSize);
  }
}

/*
void MEF() {
  if (keyPressed == true) {
    if (key == ' ') {
      estadoPlayer = MARTELANDO;
    }
  } else {
    estadoPlayer = PARADO;
  }
}
*/

void frameManager() {
  switch(estadoPlayer) {
  case 0:
    frame = (frame + 1) % imgParado.length;
    break;
  case 1:
    frame = (frame + 1) % imgMartelando.length;
    break;
  case 2:
    frame = (frame + 1) % imgAtirando.length;
    break;
  }
}

void keyPressed() {
  if (key == 'a') {
    estadoPlayer = ATIRANDO;
    Atira = true;
    Martela = false;
  }
  if (key == 's') {
    estadoPlayer = MARTELANDO;
    Martela = true;
    Atira = false;
  }
}

void keyReleased() {
  if (key == 'a') {
    Atira = false;
  }
  if (key == 's') {
    Martela = false;
  }
  if (!Atira && !Martela) {
    frame = 0;
    estadoPlayer = PARADO;
  }
}
