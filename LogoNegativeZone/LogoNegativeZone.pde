PImage circle, raios, horizonte, paisagem;

PVector sizeC = new PVector(800, 800);
PVector sizeR = new PVector(800, 800);
PVector sizeH = new PVector(800, 800);

float angleC = 0;
float angleR = 0;
float angleH = 0;

float amt = 0;
boolean subindo = true;
float amtScale = 0.5;

void setup() {
  frameRate(60);
  circle = loadImage("Circulo.png");
  raios = loadImage("Raios.png");
  horizonte = loadImage("Horizonte.png");
  paisagem = loadImage("Paisagem.jpg");
  size(800, 800);
  imageMode(CENTER);

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      
      color c = circle.get(x, y);
      if (c == color(255, 255, 255)) {
        color p = paisagem.get(x, y);
        circle.set(x, y, p);
      }
      
      color h = horizonte.get(x,y);
      float mediaH = (red(h) + green(h) + blue(h))/3;
      if (mediaH >= 200) {
        color pa = paisagem.get(x, y);
        horizonte.set(x, y, pa);
      }
      
      color r = raios.get(x,y);
      float media = (red(r) + green(r) + blue(r))/3;
      if (media >= 200) {
        color pai = paisagem.get(x, y);
        raios.set(x, y, pai);
      }
      
    }
  }
}

void draw() {
  translate(width/2, height/2);
  background(255);
  image(horizonte, 0, 0, sizeH.x, sizeH.y);
  image(circle, 0, 0, sizeC.x, sizeC.y);
  rotate(angleR);
  image(raios, 0, 0, sizeR.x, sizeR.y);

  wigle();
  //saveFrame(str(frameCount) + ".png");
}

void wigle() {
  angleH += 10;
  sizeH.x = map(sin(angleH), -1, 1, 780, 820);
  sizeH.y = map(sin(angleH), -1, 1, 780, 820);

  angleC += 10;
  sizeC.x = map(sin(angleC), -1, 1, 790, 810);
  sizeC.y = map(sin(angleC), -1, 1, 790, 810);

  angleR = lerp(-0.034, 0.034, amt);
  if (subindo) {
    if (amt >= 1) {
      subindo = false;
    }
    amt += amtScale;
  } else {
    if (amt <= 0) {
      subindo = true;
    }
    amt -= amtScale;
  }
}
