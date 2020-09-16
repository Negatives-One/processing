private PImage WhiteRun, WhiteRunGray, criada, criada2, criada3;

void setup() {
  WhiteRun = loadImage("WhiteRun.png");
  WhiteRunGray = WhiteRun.copy();
  size(960, 540);
  criada = processaImagemNoise(WhiteRun);
  WhiteRunGray = processaImagemNoise(WhiteRunGray);
  WhiteRunGray.filter(GRAY);
  criada2 = WhiteRunGray.copy();
  criada2 = processaImagemColor(criada2, "Red", 60);
  criada3 = criada2.copy();
  criada3 = processaImagemColor(criada3, "Green", 50);
}


void draw() {
  if (keyPressed) {
    if (key == ' ') {
      image(WhiteRun, 0, 0, 960, 540);
    }
  } else {
    image(criada, 0, 0, 480, 270);
    image(WhiteRunGray, width/2, 0, 480, 270);
    image(criada2, 0, height/2, 480, 270);
    image(criada3, width/2, height/2, 480, 270);
    text("Aperte espaço para ver a imagem original", width/2, height/2);
  }
}


private PImage processaImagemNoise(PImage image) {
  color corOriginal, corDestino;
  color cor;
  PImage newImg = createImage(1920, 1080, RGB);
  for (int x = 0; x < image.width; x++) {
    for (int y = 0; y < image.height; y ++) {
      corOriginal = image.get(x, y);
      cor = color(random(red(corOriginal))*1.5, random(green(corOriginal))*1.5, random(blue(corOriginal))*1.5);
      corDestino = cor;
      newImg.set(x, y, corDestino);
    }
  }
  return newImg;
}

private PImage processaImagemColor(PImage image, String canal, float ammount) {
  color corOriginal, corDestino = color(0, 0, 0);
  float cor;
  PImage newImg = createImage(1920, 1080, RGB);
  for (int x = 0; x < image.width; x++) {
    for (int y = 0; y < image.height; y ++) {
      corOriginal = image.get(x, y);
      if (canal == "Red") {
        //cor = red(corOriginal);
        corDestino = color(red(corOriginal)+ammount, green(corOriginal), blue(corOriginal));
        //corDestino = (color(cor+120, 0, 0));
      } else if (canal == "Green") {
        corDestino = color(red(corOriginal), green(corOriginal)+ammount, blue(corOriginal));
      } else if (canal == "Blue") {
        corDestino = color(red(corOriginal), green(corOriginal), blue(corOriginal)+ammount);
      }
      newImg.set(x, y, corDestino);
    }
  }
  return newImg;
}
