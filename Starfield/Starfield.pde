ArrayList<Star> Stars = new ArrayList<Star>();
int starCount = 800;

void setup() {
  size(500, 500);
  background(0);
  for (int i = 0; i < starCount; i++) {
    Stars.add(new Star());
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int j = 0; j < Stars.size(); j++) {
    Stars.get(j).update();
    Stars.get(j).render();
  }
}
