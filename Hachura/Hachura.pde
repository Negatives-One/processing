PImage img;
PImage img2 = createImage(800, 450, RGB);
int somaT;

int g = 11;

ArrayList<Rabisco> rabiscos = new ArrayList<Rabisco>(1);

void setup() {
  size(800, 450);
  //noStroke();
  fill(0);
  background(0);
  rectMode(CENTER);
  img = loadImage("mary.jpg");
  for (int y = 0; y < height; y++) {
    for (int x = 1; x < width; x++) {
      float r = red(img.get(x, y));
      float g = green(img.get(x, y));
      float b = blue(img.get(x, y));
      float grey = (r+g+b)/3;
      img2.set(x, y, color(grey, grey, grey));
      somaT += grey;
    }
  }
  UpdateImage();
  save("newMary.png");
}

void UpdateImage() {
  background(255);
  img = loadImage("mary.jpg");
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float r = red(img.get(x, y));
      float g = green(img.get(x, y));
      float b = blue(img.get(x, y));
      float grey = (r + g + b) / 3;
      img2.set(x, y, color(grey, grey, grey));
    }
  }

  for (int y = g/2; y < height; y+=g) {
    for (int x = g/2; x < width; x+=g) {
      float media = mediaVizinha(img, x, y, g);
      img2 = pintaVizinhos(img, x, y, g, media);
      float l = (255 - media)/255;
      rabiscos.add(new Rabisco(round(l*g), 1, new PVector(g, g), new PVector(x, y), false));
      //circle(x, y, l*g);
      //println(round(l*g));
      //rect(x,y,l*g,l*g);
    }
  }
}

float mediaVizinha(PImage img, int x, int y, int grupo) {
  int soma=0;
  int d = grupo/2;
  for (int i = x-d; i<=x+d; i++)
    for (int j = y-d; j<=y+d; j++)
      if (i>0 && i<width && j>0 && j<height)
        soma += red(img.get(i, j));
  return soma/sq(grupo);
}

PImage pintaVizinhos(PImage img, int x, int y, int grupo, float media) {
  int d = grupo/2;
  for (int i = x-d; i<=x+d; i++)
    for (int j = y-d; j<=y+d; j++)
      if (i>0 && i<width && j>0 && j<height)
        img.set(i, j, color(media, media, media));
  return img;
}
