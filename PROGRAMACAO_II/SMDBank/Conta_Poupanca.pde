class ContaPoupanca extends Conta{
  
  private int aniversario = 1;
  private float taxaCobrado = 0.002;
  
 ContaPoupanca(){
   super.extrato = "CONTA POUPANÇA";
   this.saldo = 0;
 }
 
 public void fazDeposito(float valor, String dataAtual){
   float valorComTaxa = -(valor * taxaCobrado) + valor;
   this.saldo += valorComTaxa;
   this.atualizaExtrato("Depósito: " + str(valor) + "   Taxa: " + str(valorComTaxa), dataAtual);
 }
 
 public boolean fazSaque(float valor, String dataAtual){
  return super.fazSaque(valor, dataAtual);
 }
 
}
