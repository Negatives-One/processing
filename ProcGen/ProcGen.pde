DelaunayTriangulator dt;
Sala[] salas = new Sala[100];

ArrayList<Sala> mainRooms = new ArrayList<Sala>();
int mainRoomCount = (int)(salas.length * 0.1);

void setup() {
  background(125);
  fill(255);
  size(600, 600);
  for (int i = 0; i < salas.length; i++) {
    salas[i] = new Sala(GetRandomPointInCircle(new PVector(width/2, height/2), 50), (int)random(20, 60), (int)random(20, 60));
  }
  int[] mainRoomIndex = Scramble(mainRoomCount, salas.length);
  for (int i = 0; i < mainRoomIndex.length; i++) {
    mainRooms.add(salas[mainRoomIndex[i]]);
    salas[mainRoomIndex[i]].isMain = true;
  }
}

void draw() {
  background(125);
  for (int i = 0; i < salas.length; i++) {
    salas[i].Update();
  }
  PVector[] centers = new PVector[mainRoomCount];
  for (int j = 0; j < mainRoomCount; j++) {
    centers[j] =  mainRooms.get(j).center;
  }
  Triangulate(centers);
  //draw();

  if (dt != null) {
    //for (Triangle t : dt.triangles) {
      //t.DrawCircumcircle(this);
   // }
    for (Triangle t : dt.triangles) {
      t.DrawEdges(this);
    }
  }
}

void mouseReleased() {
  /*background(125);
   PVector[] centers = new PVector[mainRoomCount];
   for (int j = 0; j < mainRoomCount; j++) {
   centers[j] =  mainRooms.get(j).center;
   }
   Triangulate(centers);
   draw();*/
}

PVector GetRandomPointInCircle(PVector pos, int radius) {
  float selectedRadius = random(1) * (float)radius;
  float angle = random(1) * PI*2;
  PVector point = new PVector(sin(angle), cos(angle));
  PVector p = new PVector(pos.x, pos.y);
  point.mult(selectedRadius);
  return p.add(point);
}

int[] Scramble (int count, int range) {
  IntList scrambler = new IntList();
  for (int i=0; i<range; i++) {
    scrambler.append(i);
  }
  scrambler.shuffle();
  int[] result = new int[count];
  for (int i=0; i<count; i++) {
    result[i] = scrambler.get(i);
  }
  return result;
}

void Triangulate(PVector[] points) {
  dt = new DelaunayTriangulator();
  dt.points = points;
  dt.triangles = dt.Calculate();
}
