class Sala {
  PVector pos;
  int largura, altura;
  ArrayList<Sala> overlappingSalas;
  PVector center;

  boolean isMain = false;

  Sala(PVector _pos, int _width, int _height) {
    largura = _width;
    altura = _height;
    pos = _pos;
    overlappingSalas = new ArrayList<Sala>();

    center = new PVector(pos.x + largura/2, pos.y + altura/2);
  }

  void Update() {
    GetOverlapping();
    if (overlappingSalas.size() > 0) {
      pos.add(GetEscapeDir());
    }
    if (isMain)
      fill(255, 0, 0);
    else
      fill(255);
    rect(pos.x, pos.y, largura, altura);
    center = new PVector(pos.x + largura/2, pos.y + altura/2);
  }

  PVector GetEscapeDir() {
    PVector dir = new PVector(0, 0);
    for (int i = 0; i < overlappingSalas.size(); i++) {
      PVector salaPos = overlappingSalas.get(i).pos;
      PVector singleDir = pos.copy().sub(salaPos.copy()).normalize();
      dir.add(singleDir);
    }
    return dir.normalize();
  }

  void GetOverlapping() {
    overlappingSalas.clear();
    for (int i = 0; i < salas.length; i++) {
      Sala currentSala = salas[i];
      if (rectOverlap(currentSala)) {
        overlappingSalas.add(salas[i]);
      }
    }
  }

  boolean box_box(float ax0, float ay0, float ax1, float ay1, float bx0, float by0, float bx1, float by1) {
    float topA = (float) Math.min(ay0, ay1);
    float botA = (float) Math.max(ay0, ay1);
    float leftA = (float) Math.min(ax0, ax1);
    float rightA = (float) Math.max(ax0, ax1);
    float topB = (float) Math.min(by0, by1);
    float botB = (float) Math.max(by0, by1);
    float leftB = (float) Math.min(bx0, bx1);
    float rightB = (float) Math.max(bx0, bx1);
    if (botA <= topB  || botB <= topA || rightA <= leftB || rightB <= leftA)
      return false;
    return true;
  }
  boolean valueInRange(int value, int min, int max)
  { 
    return (value >= min) && (value <= max);
  }

  boolean rectOverlap(Sala B)
  {
    boolean xOverlap = valueInRange((int)this.pos.x, (int)B.pos.x, (int)B.pos.x + B.largura) ||
      valueInRange((int)B.pos.x, (int)this.pos.x, (int)this.pos.x + this.largura);

    boolean yOverlap = valueInRange((int)this.pos.y, (int)B.pos.y, (int)B.pos.y + B.altura) ||
      valueInRange((int)B.pos.y, (int)this.pos.y, (int)this.pos.y + this.altura);

    return xOverlap && yOverlap;
  }
}
