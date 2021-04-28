float r = 100.0; //raio definido para a distancia de rotação em relação ao centro
float a = 0.0; //angulo de rotação atual

void setup() {
  size(640, 360);
}

void draw() {
  background(0);
  a += 0.01; //incremento no angulo, para ocasionar a rotação
  float x = r * cos(a);
  
  /*
  Na linha 11 é calculada a posição do eixo X da bolinha
  que será rotacionada. A função "cos()" irá calcular o cosseno 
  de um angulo, e leva como parâmetro o angulo que foi definido
  anteriormente em radiano. O Valor resultante da função varia
  entre 1 e -1, Após ter o cosseno do angulo calculado, esse valor
  é multiplicado pela distancia do raio. Assim obtemos a posição 
  do eixo X em relação ao cosseno na distancia desejada. 
  */
  
  float y = r * sin(a);
  
  /*
  Na linha 23 acontece quase a mesma coisa do que a linha 11, mas agora
  para definir o eixo Y está sendo calculada a posição com a função "sin()" que vai calcular o seno do angulo.
  */
  
  translate(width/2, height/2);
  stroke(255);
  line(0, 0, x, y); //criar a linha do centro aos pontos calculados
  ellipse(x, y, 20, 20); //criar uma ellipse no final da linha/pontos calculados
}
