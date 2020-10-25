BG[][] array = new BG[2][2];
Mover mover;
PVector iniPos;
int imgSize = 50;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  for (int i = 0; i < array.length; i++) {
    for (int j = 0; j < array[0].length; j++) {
      array[i][j] = new BG(new PVector(j*50 + 100, i*50+100), new PVector(50, 50));
    }
  }
  iniPos = array[0][0].pos.copy();
  mover = new Mover(iniPos);
}

void draw() {
  background(255);
  for (int i = 0; i < array.length; i++) {
    for (int j = 0; j < array[0].length; j++) {
      array[i][j].UpdateBG();
    }
  }
  mover.render();
  ManageBG();
  UpdateArray();
}

void InvertVertical() {
  BG[] second = array[1];
  array[1] = array[0];
  array[0] = second;
}

void InvertHorizontal() {
  BG[] second = {array[0][1], array[1][1]};
  array[0][1] = array[0][0];
  array[1][1] = array[1][0];
  array[0][0] = second[0];
  array[1][0] = second[1];
}

void ManageBG() {
  if (mover.pos.x > array[0][0].pos.x) {
    array[0][1].pos.x = array[0][0].pos.x + imgSize;
    array[1][1].pos.x = array[1][0].pos.x + imgSize;
  } else if (mover.pos.x < array[0][0].pos.x) {
    array[0][1].pos.x = array[0][0].pos.x - imgSize;
    array[1][1].pos.x = array[1][0].pos.x - imgSize;
  }

  if (mover.pos.y > array[0][0].pos.y) {
    array[1][0].pos.y = array[0][0].pos.y + imgSize;
    array[1][1].pos.y = array[0][1].pos.y + imgSize;
  } else if (mover.pos.y < array[0][0].pos.y) {
    array[1][0].pos.y = array[0][0].pos.y - imgSize;
    array[1][1].pos.y = array[0][1].pos.y - imgSize;
  }
}

void UpdateArray() {
  if (mover.pos.x > array[0][0].pos.x + imgSize/2) {
    InvertHorizontal();
  } else if (mover.pos.x < array[0][0].pos.x - imgSize/2) {
    InvertHorizontal();
  }
  
  if (mover.pos.y > array[0][0].pos.y + imgSize/2) {
    InvertVertical();
  } else if (mover.pos.y < array[0][0].pos.y - imgSize/2) {
    InvertVertical();
  }
}
