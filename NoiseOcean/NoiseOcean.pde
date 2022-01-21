float offsetz = -150;
float size;
int wide = 36;
float deep = 36;
ArrayList<Myrect> myrects = new ArrayList<Myrect>();
float increment;
float zoff = 0.0;
float zincrement;
float roty = 0;
float rotyinc = 0.003;
float wind;

void setup() {
  size(800, 600, P3D);
  wind = width*0.75;
  frameRate(60);
  size = wind / 40;
  increment = wind / 20000;
  zincrement = wind / 200000;
  fill(230);
  for (int d = 0; d < deep; d ++) {
    for (int w = 0; w < wide; w ++) {
      myrects.add(new Myrect(
        (float)w*size, 
        size, 
        -d*size, 
        0.0, 
        0.0, 
        color(random(0, 150), 200, 255), 
        0
        ));
    }
  }
}

void draw() {
  translate(width/2, height/2);
  background(125);
  float doff = 0.0;
  ambientLight(100, 100, 100);
  directionalLight(255, 255, 255, 1.0, 1.0, -1.0);
  noStroke();
  rotateX(-PI/8);
  translate(0, height/4, offsetz);
  rotateY(roty);
  for (int d = 0; d < deep; d++) {
    doff += increment;
    float xoff = 0.0;
    for (int w = 0; w < wide; w++) {
      xoff += increment;
      myrects.get(d*wide+w).perl = noise(doff, xoff, zoff)*wide/0.1;
      myrects.get(d*wide+w).display();
    }
  }
  zoff += zincrement;
  roty += rotyinc;
}

class Myrect {
  float perl;
  float posx;
  float posy;
  float posz;
  float xoff;
  float yoff;
  color fillcol;

  Myrect(float _posx, float _posy, float _posz, float _xoff, float _yoff, color _fillcol, float _perl) {
    this.posx = _posx;
    this.posy = _posy;
    this.posz = _posz;
    this.xoff = _xoff;
    this.yoff = _yoff;
    this.fillcol = _fillcol;
    this.perl = _perl;
  }

  void display() {
    push();
    translate(this.posx-size*wide/2, this.posy - (this.perl/2), this.posz+size*deep/2);
    fill(this.fillcol);
    box(size, this.perl, size);
    pop();
  }
}
