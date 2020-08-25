class Botao extends SwitchAleatorio {

  private PImage on;
  private PImage off;
  private int posX;
  private int posY;

  public Botao(int x, int y, String fileOn, String fileOff, int max) {
    super(int(random(500, max)));
    this.on = loadImage(fileOn);
    this.off = loadImage(fileOff);
    this.posX = x;
    this.posY = y;
  }

  public void plotBotao() {
    if (this.estado) {
      image(on, posX, posY);
    } else {
      image(off, posX, posY);
    }
  }
}
