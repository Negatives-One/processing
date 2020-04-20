float x, y;
int Choice;
void setup() {
  frameRate(10000);
  background(255);
  size(800, 600);
  x = width/2;
  y = height/2;
}

void draw() {
  point(x, y);
  walk();
}

void walk() {
  Choice = int(random(4));
  if (Choice == 0) {
    x++;
  } else if (Choice == 1) {
    x--;
  } else if (Choice == 2) {
    y++;
  } else {
    y--;
  }
}
