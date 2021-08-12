import java.util.*;

PImage original, img, img2 = createImage(732, 1025, RGB);

int g = 5;

void setup() {
  fill(0);
  //noStroke();
  background(255);
  size(732, 1025);
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

  quantos();
}

void quantos() {
  for (int y = g/2; y < height; y += g) {
    for (int x = g/2; x < width; x += g) {
      int value = round(mediaVizinha(img2, x, y, g));
      int h = round(map(value, 255, 1, 1, g*g));
      println(h);
      //circle(x, y, 1);

      ArrayList<PVector> points = new ArrayList<PVector>();

      for (int i = y - g/2 - 1; i <  y + g/2; i++) {
        for (int j = x - g/2 - 1; j <  x + g/2; j++) {
          points.add(new PVector(j, i));//)point(j, i);
        }
      }
      Collections.shuffle(points);

      for (int n = 0; n < h; n++) {
        PVector pos = points.get(n);
        point(pos.x, pos.y);
      }
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
