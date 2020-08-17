Bar[] barras = new Bar[2];
Ball bola = new Ball();

boolean once = true;

boolean isStart = true;
int initialTime;
int time;
int adjustTime = 0;
int interval = 3;

int leftScore = 0;
int rightScore = 0;

Bar LeftBar;
Bar RightBar;

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
      LeftBar = barras[i];
    } else {
      barras[i].setInitials(new PVector(width - 100, height/2), new PVector(15, 150));
      barras[i].isLeft = false;
      RightBar = barras[i];
    }
  }
  background(0);
}

void draw() {
  updateScore();
  fill(255, 255, 255, 50);
  rect(width/2, height/2, width, height);
  barras();
  bola.update();
  if (isStart == true) {
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
  if (once && isStart) {
    once = false;
    interval += millis()/1000;
    while (interval - millis()/1000 != 3) {
      interval--;
    }
  }
  if (isStart == true) {
    fill(#D61A1D);
    textSize(50);
    time = interval-int(millis()/1000);
    if (time == 0) {
      text("GO!", width/2, height/2);
    } else {
      if (time > -1) {
        text(time, width/2, height/2);
      }
    }
  } else {
    adjustTime = millis()/1000;
  }
  if (time == -1 && isStart == true) {
    isStart = false;
    once = true;
    bola.addForce(PVector.random2D().normalize());
  }
}

void updateScore() {
  fill(#801AD6);
  textSize(32);
  text(leftScore, 50, 50);
  text(rightScore, width - 50, 50);
}

void keyPressed() {
    if (key == 'w') {
      LeftBar.goUp = true;
    }
    if (key == 's') {
      LeftBar.goDown = true;
    }

  if (keyCode == UP) {
    RightBar.goUp = true;
  }
  if (keyCode == DOWN) {
    RightBar.goDown = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    LeftBar.goUp = false;
  }
  if (key == 's') {
    LeftBar.goDown = false;
  }
  if (keyCode == UP) {
    RightBar.goUp = false;
  }
  if (keyCode == DOWN) {
    RightBar.goDown = false;
  }
}
