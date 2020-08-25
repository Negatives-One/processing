class RodaDeCores {

  private int indiceCorAtual;
  private color[] cores = new color[3];

  RodaDeCores(color c1, color c2, color c3) {
    cores[0] = c1;
    cores[1] = c2;
    cores[2] = c3;
    indiceCorAtual = 0;
  }

  public color corAtual() {

    return cores[indiceCorAtual];
  }
  
  public void mudaProximaCor(){
    indiceCorAtual++;
    if(indiceCorAtual == 3){
     indiceCorAtual = 0; 
    }
  }
}
