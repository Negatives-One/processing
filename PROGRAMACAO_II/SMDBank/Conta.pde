class Conta {
  private String extrato;
  public float saldo;
  private int nroConta;
  private String nomeCorrentista;

  Conta() {
    // continuar desenvolvimento do construtor. Adicionar nome da conta no extrat o
    this.extrato = "CONTA CORRENTE COMUM";
    saldo = 0;
    //nroConta = (int) random(100);
  }

  public String printSaldo() {
    return str(this.saldo);
  }

  public void atualizaExtrato(String novaOperacao, String dataAtual) {
    this.extrato += "\nDia\t" + dataAtual + " - " + novaOperacao + "\t" + this.printSaldo();
  }

  public void fazDeposito(float valor, String dataAtual) {
    this.saldo += valor;
    this.atualizaExtrato("Depósito: " + str(valor), dataAtual);
  }

  public boolean fazSaque(float valor, String dataAtual) {
    // TODO - FAZER
    // lembre de atualizar o extrado, dando certo ou errado
    if (saldo >= valor) {
      this.saldo -= valor;
      this.atualizaExtrato("Saque: " + str(valor), dataAtual);
      return true;
    } else {
      this.atualizaExtrato("Saque Falho: " + str(valor), dataAtual);
      return false;
    }
  }

  public String getExtrato() {
    return this.extrato;
  }
}
