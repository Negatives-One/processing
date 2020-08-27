Conta contas[];
int numContas, dia;

void setup(){
  numContas = 5;
  
  contas = new Conta[numContas];
  for(int i = 0; i < numContas; i++){
    int tipoConta = (int) random(3);
    println(tipoConta);
    switch(tipoConta){
      case 0:
        contas[i] = new Conta();
        break;
      case 1:
        // criar uma conta poupança
        contas[i] = new ContaPoupanca();
        break;
      case 2:
        // criar uma conta com cheque especial
        contas[i] = new ContaChequeEsp();
        break;
    }
  }
  
  dia = 0;
}

void draw(){
  println("\n --- Dia " + str(++dia) + " ---");
  String  strDia = str(dia);
  
  int maxOp = ceil(random(2));
  for(int op = 1;op <= maxOp;op++){
    println("Operação " + str(op));
    
    int idxConta = floor(random(numContas));
    int operacao = (int) random(3);
    
    switch(operacao){
      case 0: // operação de depósito
        float valor = 1. + random(100);
        println("Fazendo depósito de " + str(valor) + " na conta " + idxConta);
        contas[idxConta].fazDeposito(valor, strDia);
        break;
      case 1:// operação de saque
        valor = random(100);
        println("Tentando fazer saque de " + str(valor) + " da conta " + idxConta);
        if (contas[idxConta].fazSaque(valor, strDia)) //  Como você faria esse if-else usando um operador ternário?
          println("Saque feito com sucesso!");        // R: contas[idxConta].fazSaque(valor, strDia) ? println("Saque feito com sucesso!") : println("Saque não efetuado!");
        else
          println("Saque não efetuado!");
        break;
      case 2: // operação de mostrar extrato
      println("Exibindo Extrato...");
      println(contas[idxConta].getExtrato());
        break;
    }
    
    // Imprima o extrato de todas as contas
    if(dia % 30 == 0){
      for(int i = 0; i < contas.length; i++){
      println(contas[i].getExtrato());
      }
    }
  }
  
  delay(1000);
}
