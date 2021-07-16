int numPoints = 50;
PVector[] points = new PVector[numPoints];
float[] colorR = new float[numPoints];
float[] colorG = new float[numPoints];
float[] colorB = new float[numPoints];

void setup() {
  size(800, 800);
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(random(width), random(height));
    colorR[i] = random(255);
    colorG[i] = random(255);
    colorB[i] = random(255);
  }
}

void draw() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      
      float[] distances = new float[points.length];
      for (int i = 0; i < points.length; i++) {
       float d = dist(x, y, points[i].x, points[i].y);
       distances[i] = d;
      }
      int minIndex = GetMinIndex(distances);
      
      color cor = color(colorR[minIndex], colorG[minIndex], colorB[minIndex]);
      
      
      int index = x + y * width;
      pixels[index] = color(cor);
    }
  }
  updatePixels();
}


int GetMinIndex(float[] distanc){
 float menor = distanc[0];
 int index = 0;
 
 for(int i = 0; i < distanc.length; i++){
  if(distanc[i] < menor){
    menor = distanc[i];
  }
 }
   for(int j = 0; j < distanc.length; j++){
    if(menor == distanc[j]){
     index = j; 
    }
  }
  return index;
}
