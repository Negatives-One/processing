class Gunner {
  PVector pos, vel, acel;
  float raio;
  int res, dir;
  CircleInfo currentCircleInfo;

  Gunner() {
    pos = new PVector(width/2, height/2);
    currentCircleInfo = new CircleInfo(new PVector(width/2, height/2), 0);
    vel = new PVector(0, 0);

    raio = 100;
    res = 50;
    dir =  (int)random(0, 2)*2-1;
  }

  void update() {
    MovimentAndRotation();
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 20, 20);
  }

  private void MovimentAndRotation()
  {
    vel = currentCircleInfo.position.copy().sub(pos.copy());
    vel = vel.normalize();
    vel.mult(5);
    pos.add(vel);
    if (PVector.dist(currentCircleInfo.position, pos) < 20f)
    {
      currentCircleInfo = GetNextPointArround(new PVector(mouseX, mouseY), res, raio, currentCircleInfo);
    }
  }

  private CircleInfo GetNextPointArround(PVector center, int resolution, float ray, CircleInfo current)
  {
    float angle = current.pointAngle;
    float increment = TWO_PI / resolution * dir;

    PVector desiredPos = new PVector(center.x + sin(angle + increment) * ray, center.y + cos(angle + increment) * ray);

    CircleInfo newCircleInfo = new CircleInfo(desiredPos, angle + increment);
    return newCircleInfo;
  }

  private CircleInfo GetFirstPointArround(PVector center, int resolution, float ray)
  {
    float angle = 0f;
    float increment = TWO_PI / resolution * dir;
    ArrayList<PVector> list = new ArrayList<PVector>();

    for (int i = 0; i < resolution; i++)
    {
      PVector desiredPos = new PVector(center.x + sin(angle) * ray, center.y + cos(angle) * ray);
      list.add(desiredPos);
      angle += increment;
    }

    int counter = 0;

    CircleInfo nearest = new CircleInfo(new PVector(9999, 9999, 9999), 0);

    for (PVector position : list)
    {
      if (PVector.dist(position, pos) < PVector.dist(nearest.position, pos))
      {
        nearest.position = pos;
        nearest.pointAngle = counter * increment;
      }
      counter++;
    }
    return nearest;
  }
}
