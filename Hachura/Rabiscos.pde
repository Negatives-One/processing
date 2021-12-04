class Rabisco {

  int quantidade;
  float largura;
  PVector tamanho, pos;
  boolean centered;


  float rx, ry, rw, rh;
  float x1, y1, x2, y2, x3, y3, x4, y4, xa, ya, xb, yb, nbLines;

  Rabisco(int _quantidade, float _largura, PVector _tamanho, PVector _pos, boolean _centered) {
    quantidade = _quantidade;
    largura = _largura;
    tamanho = _tamanho;
    pos = _pos;
    centered = _centered;
    
    prepare();
    draw_rect();
  }

  void prepare() {
    rw = tamanho.x;//random(width);
    rh = tamanho.y;//random(height);
    rx = pos.x;//random(width-rw);
    ry = pos.y;//random(height-rh);
    nbLines = quantidade;
    x1 = rx;
    y1 = ry;
    x2 = rx+rw;
    y2 = ry+rh;
    x3 = rx+rw;
    y3 = ry;
    x4 = rx;
    y4 = ry+rh;
  }

  void draw_rect() {
    stroke(0, 0, 0);
    for (int i=0; i<nbLines; i++) {
      xa = map(i, 0, nbLines, x1, x3);
      ya = map(i, 0, nbLines, y1, y3);
      xb = map(i, 0, nbLines, x2, x3);
      yb = map(i, 0, nbLines, y2, y3);
      line(xa, ya, xb, yb);
    }
    for (int i=0; i<nbLines; i++) {
      xa = map(i, 0, nbLines, x1, x4);
      ya = map(i, 0, nbLines, y1, y4);
      xb = map(i, 0, nbLines, x2, x4);
      yb = map(i, 0, nbLines, y2, y4);
      line(xa, ya, xb, yb);
    }
    for (int i=0; i<nbLines; i++) {
      xa = map(i, 0, nbLines, x3, x2);
      ya = map(i, 0, nbLines, y3, y2);
      xb = map(i, 0, nbLines, x4, x2);
      yb = map(i, 0, nbLines, y4, y2);
      line(xa, ya, xb, yb);
    }
    for (int i=0; i<nbLines; i++) {
      xa = map(i, 0, nbLines, x3, x1);
      ya = map(i, 0, nbLines, y3, y1);
      xb = map(i, 0, nbLines, x4, x1);
      yb = map(i, 0, nbLines, y4, y1);
      line(xa, ya, xb, yb);
    }
  }
}
