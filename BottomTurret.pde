class turret4
{
  float xTPos;
  float yTPos;

  float XTV;
  float YTV;
  PShape t;
  color Tcol;

  turret4()
  {
    xTPos=random(200, width-200);
    yTPos=height-25;
    Tcol=color(255);
    XTV=11;
    YTV=7;

    t = new PShape();
    t = createShape();
    t.beginShape();
    t.fill(255, 90, 40);
    t.noStroke();
    t.vertex(+25, +25);
    t.vertex(+25, -15);
    t.vertex(+15, -25);
    t.vertex(+8, -25);
    t.vertex(+8, -70);
    t.vertex(+3, -70);
    t.vertex(+3, -25);
    t.vertex(-3, -25);
    t.vertex(-3, -70);
    t.vertex(-8, -70);
    t.vertex(-8, -25);
    t.vertex(-15, -25);
    t.vertex(-25, -15);
    t.vertex(-25, +25);
    t.endShape(CLOSE);
  }

  turret4(float x, float y)
  {
    xTPos=x;
    yTPos=y;
    xTPos=random(100, width-100);
    yTPos=25;
    Tcol=color(255);
    XTV=7;
    YTV=7;

    t = new PShape();
    t = createShape();
    t.beginShape();
    t.fill(255, 90, 40);
    t.noStroke();
    t.vertex(+25, +25);
    t.vertex(+25, -15);
    t.vertex(+15, -25);
    t.vertex(+8, -25);
    t.vertex(+8, -70);
    t.vertex(+3, -70);
    t.vertex(+3, -25);
    t.vertex(-3, -25);
    t.vertex(-3, -70);
    t.vertex(-8, -70);
    t.vertex(-8, -25);
    t.vertex(-15, -25);
    t.vertex(-25, +15);
    t.vertex(-25, +25);
    t.endShape(CLOSE);
  }

  void turretMove()
  {
    xTPos-=XTV;

    if (xTPos<width-200)
    {
      XTV*=-1;
    }

    if (xTPos>100)
    {
      XTV*=-1;
    }
  }

  void draww()
  {
    shape(t, xTPos, yTPos);
  }
}