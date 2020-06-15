/*

Gforce = ((G * m1 * m2) / (d²)) * ^r

G = gravity force
m1 and m2 = mass body 1 and mass body 2
d = distance body 1 to body 2
^r = normalized distance(orientation)

*/


mover[] movers;
atractor atractor = new atractor();
int numMover = 1;

void setup() {
  size(600, 600);
  movers = new mover[numMover];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new mover();
  }
}

void draw() {
  background(0);
  atractor.render();
  for (int i = 0; i < movers.length; i++) {
    atractor.attract(movers[i]);
    movers[i].update();
  }
}
