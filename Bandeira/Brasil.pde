class brasil {
  PVector begin, end, position, size, module, frac;

  public void showFlag(float posX, float posY, float tamanho, boolean grid) {
    rectMode(CENTER);
    noStroke();
    position = new PVector(posX, posY);
    size = new PVector(tamanho * 20, tamanho * 14);
    module = new PVector(size.x/20, size.y/14);
    frac = new PVector((module.x/10) * 7, (module.y / 10) * 7);
    begin = new PVector(position.x - size.x/2, position.y - size.y/2);
    end = new PVector(position.x + size.x/2, position.y + size.y/2);
    fill(0, 156, 59);
    rect(position.x, position.y, size.x, size.y);
    fill(255, 223, 0);
    //quad(modulo.x + frac.x, altura/2, largura/2, frac.y, largura - modulo.x - frac.x, altura/2, largura/2, altura - modulo.y - modulo.y/10 * 7);


    quad(begin.x + module.x + frac.x, position.y, 

      position.x, begin.y + module.y + frac.y, 

      end.x - module.x - frac.x, position.y, 

      position.x, end.y - module.y - frac.y);


    fill(0, 39, 118);
    circle(position.x, position.y, ((module.x + module.y) /2) * 7);
    strokeWeight(0);
    stroke(0);
    if (grid) {
      Grid(20, 14);
    }
    rectMode(CORNER);
  }

  private void Grid(int col, int lin) {
    float stepX = size.x / col;
    float stepY = size.y / lin;
    for (int i = 0; i < lin + 1; i++) {
      line(begin.x, begin.y + i * stepY, end.x, begin.y + i * stepY);
    }
    for (int j = 0; j < col + 1; j++) {
      line(begin.x + j * stepX, begin.y, begin.x + j * stepX, end.y);
    }
  }

  brasil() {
  }
}
