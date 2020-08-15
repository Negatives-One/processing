class RodaDeCores{
  private color cores[];
  private int corAtual;
  
  RodaDeCores(color c1, color c2, color c3){
    cores = new color[3];
    cores[0] = c1;
    cores[1] = c2;
    cores[2] = c3;
    
    corAtual = 0;
  }
  
  public void mudaProximaCor(){
    this.corAtual = (this.corAtual + 1) % 3;
  }
  
  public color corAtual(){
    return cores[this.corAtual];
  }
}
