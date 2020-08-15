class Quadrado {
  private PVector coord;
  private int lado;

  Quadrado(int a, int b, int c) {
    this.coord = new PVector(a, b);
    this.lado = c;
  }

  public int getXSuperiorEsquerdo() {
    return (int) this.coord.x;
  }
  
  public int getYSuperiorEsquerdo() {
    return (int) this.coord.y;
  }
  
  public int getLado(){
   return this.lado; 
  }
  
  public String toString(){
   return "O quadrado tem coordenadas:" + str(coord.x) + "X e" + str(coord.y) + "Y"; 
  }
}
