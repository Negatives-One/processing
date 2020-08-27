class ContaChequeEsp extends Conta {

  private float limiteChequeEspecial = -1000;

  ContaChequeEsp() {
    super.extrato = "CONTA CORRENTE CHEQUE ESPECIAL";
    this.saldo = 0;
  } 

  public void fazDeposito(float valor, String dataAtual) {
    this.saldo += valor;
    this.atualizaExtrato("Depósito: " + str(valor), dataAtual);
  }

  public boolean fazSaque(float valor, String dataAtual) {
    if (this.saldo - valor >= limiteChequeEspecial) {
      this.saldo -= valor;
      this.atualizaExtrato("Saque: " + str(valor), dataAtual);
      return true;
    } else {
      this.atualizaExtrato("Saque Falho: " + str(valor), dataAtual);
      return false;
    }
  }
}
