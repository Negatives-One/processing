brasil flag;
float modifier = 5;
boolean inflate = true;

void setup() {
  size(1000, 600);
  flag = new brasil();
}

void draw() {
  background(255);

  if (inflate && mousePressed) {
    modifier += 0.5;
    if (modifier > 40)
      inflate = !inflate;
  } else if (!inflate && mousePressed) {
    modifier += -0.5;
    if (modifier < -40)
      inflate = !inflate;
  }

  flag.showFlag(mouseX, mouseY, modifier, false);
}

void mouseReleased() {

  inflate = !inflate;
}
