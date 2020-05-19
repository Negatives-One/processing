PVector mouse;

boolean Up = true;

ball b;

void setup() {
  size(1300, 600);
  b = new ball();
  stroke(255);
}

void draw() {
  background(0);
  b.Render();
  if (Up) {
    b.Update();
  }
  mouseContinues();
}

void mousePressed() {
  Up = false;
  b.Move();
}

void mouseContinues() {
  if (mousePressed && (mouseButton == LEFT)) {
    b.Move();
    b.Linha();
  }
}

void mouseReleased() {
  Up = true;
  b.Stop();
}
