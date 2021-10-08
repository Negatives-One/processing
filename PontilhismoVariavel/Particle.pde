class Particle {
  int posX;
  int posY;
  color cor;
  
  Particle (int xPos, int yPos, color corzinha) {
    this.posX = xPos; // x-position of the particle
    this.posY = yPos; // y-position of the particle
    cor = corzinha;//color(red(imagem.get(xPos, yPos)), green(imagem.get(xPos, yPos)), blue(imagem.get(xPos, yPos)), 220); // color of the pixel in specified place in original image
  }

  
  void display() {
    noStroke(); 
    fill(cor);
    ellipse(this.posX, this.posY, tamanhoPonto, tamanhoPonto); // draw the particle
  }
}
