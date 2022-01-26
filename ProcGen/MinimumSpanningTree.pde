class MinimumSpanningTree {
  ArrayList<PVector> vertices;

  ArrayList<Edge> edges = new ArrayList<Edge>();

  MinimumSpanningTree() {

    vertices = new ArrayList<PVector>();
  }

  void Update() {
    edges.clear();
    ArrayList<PVector> reached = new ArrayList<PVector>();
    ArrayList<PVector> unreached = new ArrayList<PVector>();

    for (int i = 0; i < vertices.size(); i++) {
      unreached.add(vertices.get(i));
    }

    reached.add(unreached.get(0));
    unreached.remove(0);

    while (unreached.size() > 0) {
      float record = 10000;
      int rIndex = 0;
      int uIndex = 0;

      for ( int i =0; i < reached.size(); i++) {
        for ( int j = 0; j < unreached.size(); j++) {
          PVector v1 = reached.get(i);
          PVector v2 = unreached.get(j);
          float d = dist(v1.x, v1.y, v2.x, v2.y);

          if (d < record) {
            record = d;
            rIndex = i;
            uIndex = j;
          }
        }
      }
      stroke(255);
      strokeWeight(2);
      //line(reached.get(rIndex).x, reached.get(rIndex).y, unreached.get(uIndex).x, unreached.get(uIndex).y);

      Edge e = new Edge(new PVector(reached.get(rIndex).x, reached.get(rIndex).y), new PVector(unreached.get(uIndex).x, unreached.get(uIndex).y));
      edges.add(e);

      reached.add(unreached.get(uIndex));
      unreached.remove(uIndex);
    }

    for (int i = 0; i < vertices.size(); i++) {
      fill(255);
      stroke(255);
      ellipse(vertices.get(i).x, vertices.get(i).y, 16, 16);
    }
  }
}
