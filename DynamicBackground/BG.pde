class BG {
  PVector pos, size;
  color cor;
  BG(PVector position, PVector tam) {
    this.pos = position;
    this.size = tam;
    this.cor = color((int) random(256), (int) random(256), (int)random(256));
  }

  void UpdateBG() {
    fill(cor);
    rect(pos.x, pos.y, size.x, size.y);
  }
}
