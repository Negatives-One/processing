class SwitchAleatorio {
  boolean estado;
  int maxTempo, lastTimepoint;

  SwitchAleatorio(int max) {
    this.estado = false;
    this.maxTempo = max;
    this.lastTimepoint = 0;
  }

  public void atualizaEstado() {
    int curTimepoint = millis();

    // o que esse condicional está fazendo?
    //R: Verificando se o tempo atual do Botao menos o ultimo tempo do SwitchAleatorio
    //é maior ou igula ao máximo de tempo do SwitchAleatorio
    if (curTimepoint - this.lastTimepoint >= this.maxTempo) {
      this.lastTimepoint = curTimepoint;

      this.trocaEstado();
    }
  }

  public void trocaEstado() {
    // Você entende a utilização do operador ! (negação) ?
    // R: sim
    this.estado = !this.estado; 

    this.lastTimepoint = millis();
  }

  public boolean getEstado() {
    return this.estado;
  }
}
