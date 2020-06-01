class sand {

  private PVector position;


  private void physics() {
    if (position.x > width) {
      position.x = width;
    }
    if (position.x < 0) {
      position.x = 0;
    }
    if (position.y > height/2) {
      position.y = height/2;
    }
    if (position.y < 0) {
      position.y = 0;
    }

    SandCheck();
  }


  private void SandCheck() {
    boolean D = false, DL = false, DR = false;
    if (positions[(int)position.x][(int)position.y + 1] == true) {
      D = true;

      if (positions[(int)position.x + 1][(int)position.y + 1] == true) {
        DR = true;
      }

      if (positions[(int)position.x - 1][(int)position.y + 1] == true) {
        DL = true;
      }
    }

    if (D == false) {
      position.y++;
    } else { 
      if (DL == false) {
        position.y++;
        position.x--;
      }
      if(DR == false){
        position.y++;
        position.x++;
      }
    }
  }


  private void render() {
    stroke(#FFEBA0);
    point(position.x, position.y);
  }

  private void markPos() {
    positions[(int) position.x][(int) position.y] = true;
  }

  public void Exist() {
    physics();
    render();
    markPos();
  }

  sand() {
    position = new PVector((int) mouseX, (int) mouseY);
  }
}
