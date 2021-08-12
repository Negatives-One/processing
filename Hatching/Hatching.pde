PImage original, img, img2 = createImage(732, 1025, RGB);

int g = 11;

public void setup() {
  size(732, 1025);
  noStroke();
  fill(0);
  strokeWeight(1);
  background(255);
  img = loadImage("will.jpg");
  UpdateImage();
  original = loadImage("will.jpg");
}

public void draw() {
  //image(img2, 0, 0);
  if (mousePressed && mouseButton == LEFT) {
    g += 2;
    UpdateImage();
  }

  if (mousePressed && mouseButton == RIGHT) {
    if (g > 11) {
      g -= 2;
      UpdateImage();
    }
  }
}

void UpdateImage() {
  background(255);
  img = loadImage("will.jpg");
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
      circle(x, y, l*g);
      //println(round(l*g));
      //rect(x,y,l*g,l*g);
    }
  }
}


float mediaVizinha(PImage img, int x, int y, int grupo) {
  int soma = 0;
  int d = grupo / 2;
  for (int i = x - d; i <= x + d; i++)
    for (int j = y - d; j <= y + d; j++)
      if (i > 0 && i < width && j > 0 && j < height)
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
