final int PARADO = 0;
final int MARTELANDO = 1;
final int ATIRANDO = 2;

PImage imgParado[] = new PImage[4], imgMartelando[] = new PImage[11], imgAtirando[] = new PImage[6];

int estadoPlayer = PARADO;
int estadoAnterior;

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
  MEF();
  mostraPlayer(estadoPlayer);
  frameManager();
  text("Frame: " + str(frame), 100, 100);
  text("State: " + str(estadoPlayer), 100, 150);
  text("Previous Animation: " + str(estadoAnterior), 100, 200);
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


void MEF() {
  estadoAnterior = estadoPlayer;
  if (keyPressed) {
    if (key == 's' && estadoPlayer != ATIRANDO) {
      ChangePlayerState(MARTELANDO);
    } else if (key == 'a' && estadoPlayer != MARTELANDO) {
      ChangePlayerState(ATIRANDO);
    }
  }
  if (estadoAnterior != estadoPlayer)
    frame = 0;
}

void ChangePlayerState(int State) {
  estadoPlayer = State;
}

void ChangeAnimation() {
  if (estadoAnterior != estadoPlayer) {
    estadoAnterior = estadoPlayer;
  }
}

void frameManager() {
  switch(estadoPlayer) {
  case 0:
    frame = (frame + 1) % imgParado.length;
    if (frame == 0) {
      ChangePlayerState(PARADO);
    }
    break;
  case 1:
    frame = (frame + 1) % imgMartelando.length;
    if (frame == 0) {
      ChangePlayerState(PARADO);
    }
    break;
  case 2:
    frame = (frame + 1) % imgAtirando.length;
    if (frame == 0) {
      ChangePlayerState(PARADO);
    }
    break;
  }
}
