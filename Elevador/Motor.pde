class motor {
  PVector pos;
  int andar, target;
  int estado;
  final int SUBINDO = 2;
  final int DESCENDO = 1;
  final int PARADO = 0;

  motor(int nivel, PVector iniPos) {
    andar = nivel;
    estado = PARADO;
    pos = iniPos;
  }

  void update() {
    MEF();
    render();
    println(estado);
    delay(100);
    move();
  }
  void move() {
    if (estado == SUBINDO) {
      pos.y -= 60;
      andar++;
      if (target == andar)
        estado = PARADO;
    } else if (estado == DESCENDO) {
      pos.y += 60;
      andar--;
      if (target == andar)
        estado = PARADO;
    }
    if (andar > 9) {
      andar = 9;
      pos.y += 60;
    }
    if (andar < 0) {
      andar = 0;
      pos.y -= 60;
    }
  }

  void MEF() {
    if (keyPressed && target == andar) {
      target = (int) key - 48;
      if (target == andar)
        return;
      if (target > andar) {
        estado = SUBINDO;
      } else if (target - 48 < andar) {
        estado = DESCENDO;
      } else {
        estado = PARADO;
      }
    }
  }

  void render() {
    fill(#8BE5FF);
    rect(pos.x, pos.y, 30, 60);
  }
}
