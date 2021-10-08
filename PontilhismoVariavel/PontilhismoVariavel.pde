import java.util.*;

PVector praia = new PVector(1600, 1067);
String praiaPath = "praia.jpg";

PImage original, img, img2 = createImage((int)praia.x, (int)praia.y, RGB);

int g = 9;
int tamanhoPonto = 25;


PImage imagem;
int iterationCount = 100000;

void setup() {
  imagem = loadImage(praiaPath); // load Girl with the Pearl Earring by Johannes Vermeer
  size(1600, 1067);
  frameRate(60);
  background(255/2);
  
  
  /*for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float r = red(imagem.get(x, y));
      float g = green(imagem.get(x, y));
      float b = blue(imagem.get(x, y));
      float grey = (r + g + b) / 3;
      imagem.set(x, y, color(grey, grey, grey));
    }
  }*/
  
  

  ArrayList<PVector> positions = new ArrayList<PVector>();

  for (int x = 0; x < width; x+= tamanhoPonto/3) {
    for (int y = 0; y < height; y+= tamanhoPonto/3) {
      positions.add(new PVector(x, y));
    }
  }

  Collections.shuffle(positions);

  for (PVector i : positions) {
    Particle p = new Particle((int)i.x, (int)i.y, mediaVizinha(imagem, (int)i.x, (int)i.y, tamanhoPonto*2));
    p.display();
  }
}

color mediaVizinha(PImage img, int x, int y, int grupo) {
  float red = 0;
  float green = 0;
  float blue = 0;
  int d = grupo / 2;

  int quantidade = 0;

  for (int i = x - d; i <= x + d; i++) {
    for (int j = y - d; j <= y + d; j++) {
      if (i > 0 && i < width && j > 0 && j < height) {
        red += red(img.get(i, j));
        green += green(img.get(i, j));
        blue += blue(img.get(i, j));
        quantidade++;
      }
    }
  }
  color cor = color(red/quantidade, green/quantidade, blue/quantidade, 220);
  return cor;
}
