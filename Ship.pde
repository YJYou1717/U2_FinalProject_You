class Ship
{
  float x1;
  float y1;
  float R1;
  float G1;
  float B1;
  float[] x3= new float[5];
  float[] y3= new float[5];
  int RCol;
  int GCol;
  int BCol;

  boolean WBU;
  boolean WBD;
  boolean WBL;
  boolean WBR;

float lastHitTime;
float HitTime;

  PShape s;

  color col;

  Ship()
  {
    x1=random(width/2-200, width/2+200);
    y1=random(height-300-100, height-300+100);
    R1=random(0, 255);
    G1=random(0, 255);
    B1=random(0, 255);
    col=color(0, 0, 255);
    s = new PShape();
    s = createShape();
    s.beginShape();
    s.fill(R1, G1, B1);
    s.noStroke();
    s.vertex(0, -30);
    s.vertex(+15, 0);
    s.vertex(+15, +50);
    s.vertex(-15, +50);
    s.vertex(-15, 0);
    s.endShape(CLOSE);
  }

  Ship(float xPos, float yPos, int RCol, int GCol, int BCol)
  {
    x1=xPos;
    y1=yPos;
    R1=RCol;
    G1=GCol;
    B1=BCol;
    
    lastHitTime=0;
    HitTime=10000;

    col=color(255, 255, 0);
    s = new PShape();
    s = createShape();
    s.beginShape();
    s.fill(R1, G1, B1);
    s.noStroke();
    s.vertex(0, -30);
    s.vertex(+15, 0);
    s.vertex(+15, +50);
    s.vertex(-15, +50);
    s.vertex(-15, 0);
    s.endShape(CLOSE);
  }

  void Draw()
  {
    shape(s, x1, y1);
  }

  void Move1()
  {

    if (dist(xLHand, yLHand, width/2, 120)<70 && WBU==true)
    {
      y1-=5;
    } 
    else if (key=='w' && WBU==true)
    {
      y1-=5;
    }

    if (dist(xRHand, yRHand, width/2, 120)<70 && WBU==true)
    {
      y1-=5;
    }
    
        else if (key=='a' && WBU==true)
    {
      x1-=5;
    }

    if (dist(xLHand, yLHand, 120, height/2+50)<70 && WBL==true)
    {
      x1-=5;
    }

    if (dist(xLHand, yLHand, width/2, height-120)<70 && WBD==true)
    {
      y1+=5;
    }

    if (dist(xRHand, yRHand, width/2, height-120)<70 && WBD==true)
    {
      y1+=5;
    }

    if (dist(xRHand, yRHand, width-120, height/2+50)<70 && WBR==true)
    {
      x1+=5;
    }
  }

  void wallBlock()
  {
    if (x1<120)
    {
      WBL=false;
      x1=121;
    } 
   
    else
    {
      WBL=true;

      if (x1>width-120)
      {
        WBR=false;
        x1=width-121;
      } 
      
      else
      {
        WBR=true;
      }

      if (y1<130)
      {
        WBU=false;
        y1=131;
      } 
      
      else
      {
        WBU=true;
      }
      
      if (y1>height-130)
      {
        WBD=false;
        y1=height-131;
      }
      
      else
      {
        WBD=true;
      }
      
    }
  }
}