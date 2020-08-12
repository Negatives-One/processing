Bar[] barras = new Bar[2];
Ball bola = new Ball();

boolean isStart = true;
int initialTime;
int time;

int leftScore = 0;
int rightScore = 0;

void setup() {
  textAlign(CENTER, CENTER);
  initialTime = millis() / 1000;
  time = millis() / 1000;
  rectMode(CENTER);
  noStroke();
  frameRate(60);
  size(1000, 600);
  fill(255);
  rect(width/2, height/2, width, height);
  bola.pos = new PVector(width/2, height/2);
  bola.size = new PVector(10, 10);
  for (int i = 0; i < barras.length; i++) {
    barras[i] = new Bar();
    if (i == 0) {
      barras[i].setInitials(new PVector(100, height/2), new PVector(15, 150));
      barras[i].isLeft = true;
    } else {
      barras[i].setInitials(new PVector(width - 100, height/2), new PVector(15, 150));
      barras[i].isLeft = false;
    }
  }
  background(0);
}

void draw() {
  if(isStart == false){
    startMatch();
  }
  updateScore();
  fill(255, 255, 255, 50);
  rect(width/2, height/2, width, height);
  barras();
  bolinha();
  if(isStart == true){
    fill(255);
    rect(width/2, height/2, 20, 20);
    startMatch();
  }
}

void barras() {
  for (int i = 0; i < barras.length; i++) {
    barras[i].update();
    barras[i].checkBall(bola.pos, bola);
  }
}

void startMatch() {
  if (isStart == false) {
    fill(#D61A1D);
    textSize(50);
    time = millis() / 1000;
    text(time, width/2, 50);
  }
  else{
   fill(#D61A1D);
    textSize(100);
    time = millis() / 1000;
    text(time, width/2, height/2); 
  }
  if (time > initialTime + 2 && isStart == true) {
    isStart = false;
    bola.addForce(PVector.random2D().normalize());
  }
}

void updateScore() {
  fill(#801AD6);
  textSize(32);
  text(leftScore, 50, 50);
  text(rightScore, width - 50, 50);
}

void bolinha() {
  bola.update();
}
