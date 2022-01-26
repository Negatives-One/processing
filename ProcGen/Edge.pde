class Edge {
  public PVector p1;  
  public PVector p2;  

  public boolean IsEqual(Edge other) {
    if (other == null) {
      return false;
    } else {
      return (p1 == other.p1 && p2 == other.p2) || (p2 == other.p1 && p1 == other.p2);
    }
  }

  public Edge(PVector a, PVector b) {
    p1 = a;
    p2 = b;
  }
  
  public void Update(){
   line(p1.x, p1.y, p2.x, p2.y); 
  }
}
