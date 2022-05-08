class Circle {

  class pointInfo {
    PVector point;
    PVector distPoint;
    float dist;

    pointInfo(PVector _point, PVector _distPoint, float _dist) {
      point = _point;
      distPoint = _distPoint;
      dist = _dist;
    }
  }

  PVector pos;
  float diametro;

  Circle() {
  }

  void Update() {
    ArrayList<pointInfo> points = new ArrayList<pointInfo>();

    float maior = 0;
    PVector punto = new PVector();

    for (PVector p : pontos2) {
      for (PVector p2 : pontos2) {
        float dist = p.copy().dist(p2.copy());
        if (dist > maior) {
          maior = dist;
          punto = p2.copy();
        }
      }
      points.add(new pointInfo(p, punto, maior));
    }

    pointInfo maiorGetado = GetMaior(points);
    PVector circlePos = PVector.lerp(maiorGetado.point, maiorGetado.distPoint, 0.5);

    for (PVector pp : pontos2) {
      PVector dir = pp.copy().sub(circlePos.copy());
      dir = dir.normalize();
      if (circlePos.copy().dist(pp.copy()) > maiorGetado.dist) {
        println(dir);
        float toAproach = circlePos.copy().dist(pp.copy()) - maiorGetado.dist;
        circlePos.add(dir.mult(toAproach));
      }
    }


    noFill();
    ellipse(circlePos.x, circlePos.y, maiorGetado.dist, maiorGetado.dist);
    pos = circlePos.copy();
    diametro = maiorGetado.dist;
  }

  pointInfo GetMaior(ArrayList<pointInfo> pt) {
    pointInfo maior = pt.get(0);

    for (pointInfo pi : pt) {
      if (pi.dist > maior.dist) {
        maior = pi;
      }
    }
    return maior;
  }
  
  boolean CheckInside(PVector target){
   
    return pos.dist(target) <= this.diametro/2;
  }
  
}
