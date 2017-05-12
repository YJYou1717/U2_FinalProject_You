import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

float xLHand=0;
float yLHand=0;
float xRHand=0;
float yRHand=0;
int R1;
int R2;
int G1;
int G2;
int B1;
int B2;
PImage ow;
boolean hit;

Ship YourShip;
turrets TopTurret1;
turrets TopTurret2;
turrets TopTurret3;
turret4 BottomTurret1;
turret4 BottomTurret2;
turret4 BottomTurret3;
bullet TBullet1;
bullet TBullet2;
bullet TBullet3;
bullet BBullet1;
bullet BBullet2;
bullet BBullet3;
bullet SBullet1;
bullet SBullet2;
bullet SBullet3;
bullet SBullet4;



Kinect kinect;
ArrayList <SkeletonData> bodies;

void setup()
{
  fullScreen();
  background(0);
  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();

  ow=loadImage("ow.png");
  ow.resize(200,100);

  YourShip = new Ship(width/2, height/2, 255, 85, 238);
  TopTurret1 = new turrets();
  TopTurret2 = new turrets();
  TopTurret3 = new turrets();
  TBullet1 = new bullet(TopTurret1.xTPos, TopTurret1.yTPos, 0, 10);
  TBullet2 = new bullet(TopTurret2.xTPos, TopTurret2.yTPos, 0, 10);
  TBullet3 = new bullet(TopTurret3.xTPos, TopTurret3.yTPos, 0, 10);
  
  BottomTurret1 = new turret4();
  BottomTurret2 = new turret4();
  BottomTurret3 = new turret4();
  BBullet1 = new bullet(BottomTurret1.xTPos, BottomTurret1.yTPos, 0, -10);
  BBullet2 = new bullet(BottomTurret2.xTPos, BottomTurret2.yTPos, 0, -10);
  BBullet3 = new bullet(BottomTurret3.xTPos, BottomTurret3.yTPos, 0, -10);
  
  SBullet1 = new bullet(YourShip.x1, YourShip.y1,0,-10);
  SBullet2 = new bullet(YourShip.x1, YourShip.y1,0,10);
  SBullet3 = new bullet(YourShip.x1, YourShip.y1,10,0);
  SBullet4 = new bullet(YourShip.x1, YourShip.y1,-0,0);
}

void draw()
{
  background(#4B5BFF);
  wall();
  Buttons();
  MoveButtons();
  FireButtons();
  YourShip.Draw();
  YourShip.Move1();
  TopTurret1.draww();
  TopTurret1.turretMove();
  TopTurret2.draww();
  TopTurret2.turretMove();
  TopTurret3.draww();
  TopTurret3.turretMove();
  
  BottomTurret1.draww();
  BottomTurret1.turretMove();
  BottomTurret2.draww();
  BottomTurret2.turretMove();
  BottomTurret3.draww();
  BottomTurret3.turretMove();
  
  TBullet1.render();
  TBullet2.render();
  TBullet3.render();
  TBullet1.TTurretShoot1();
  TBullet2.TTurretShoot1();
  TBullet3.TTurretShoot1();
  
  BBullet1.render();
  BBullet2.render();
  BBullet3.render();
  BBullet1.BTurretShoot1();
  BBullet2.BTurretShoot2();
  BBullet3.BTurretShoot3();
  
  
  SBullet1.render();
  SBullet1.SShoot();
  SBullet2.render();
  SBullet2.SShoot();
  SBullet3.render();
  SBullet3.SShoot();
  SBullet4.render();
  SBullet4.SShoot();

  TTurretFire1();
  TTurretFire2();
  TTurretFire3();
  BTurretFire1();
  BTurretFire2();
  BTurretFire3(); 
  
  YourShip.wallBlock();
  ShipFire();

  BulletHit();

  image(kinect.GetMask(), 0, width, width, height);
  for (int i=0; i<bodies.size (); i++) 
  {
    drawSkeleton(bodies.get(i));
    drawPosition(bodies.get(i));
  }
  ellipse(xLHand, yLHand, 30, 30);
  ellipse(xRHand, yRHand, 30, 30);
}

void BulletHit()
{
  if (dist(YourShip.x1,YourShip.y1,TBullet1.xBPos, TBullet1.yBPos)<15)
  {
    hit=true;
    if (hit==true)
    {
      image(ow, YourShip.x1-20, YourShip.y1-10);
    
    }
  }

  
    if (dist(YourShip.x1,YourShip.y1,TBullet2.xBPos, TBullet2.yBPos)<15)
  {
    hit=true;
    if (hit==true)
    {
      image(ow, YourShip.x1-20, YourShip.y1-10);
    
    }
  }
  

  
    if (dist(YourShip.x1,YourShip.y1,TBullet3.xBPos, TBullet3.yBPos)<15)
  {
    hit=true;
    if (hit==true)
    {
      image(ow, YourShip.x1-20, YourShip.y1-10);
    
    }
  }
  

    
    if (dist(YourShip.x1,YourShip.y1,BBullet1.xBPos, BBullet1.yBPos)<15)
  {
    hit=true;
    if (hit==true)
    {
      image(ow, YourShip.x1-20, YourShip.y1-10);
    
    }
  }
  



  if (dist(YourShip.x1,YourShip.y1,BBullet2.xBPos, BBullet2.yBPos)<15)
  {
    hit=true;
    if (hit==true)
    {
      image(ow, YourShip.x1-20, YourShip.y1-10);
    
    }
  }
  

  
    if (dist(YourShip.x1,YourShip.y1,BBullet3.xBPos, BBullet3.yBPos)<15)
  {
    hit=true;
    if (hit==true)
    {
      image(ow, YourShip.x1-20, YourShip.y1-10);
    
    }
  }
  

    if (millis()-YourShip.lastHitTime > YourShip.HitTime && hit==true)
  {
      hit=false;
        YourShip.lastHitTime=millis();
  }
  

}

void Buttons()
{

  fill(R1, G1, B1);
  ellipse(120, height/2+50, 70, 70);
  ellipse(width-120, height/2+50, 70, 70);
  ellipse(width/2+50, height-120, 70, 70);
  ellipse(width/2+50, 120, 70, 70);

  fill(R2, G2, B2);
  ellipse(120, height/2-50, 70, 70);
  ellipse(width-120, height/2-50, 70, 70);
  ellipse(width/2-50, height-120, 70, 70);
  ellipse(width/2-50, 120, 70, 70);
}

void ShipFire()
{
  if (dist(xRHand, yRHand, width/2-50, 120)<70)
  {
        if (millis()-SBullet1.firedTime > SBullet1.reloadingTime)
      {
        SBullet1.xBPos=YourShip.x1;
        SBullet1.yBPos=YourShip.y1;
        SBullet1.fire=true;

        SBullet1.firedTime=millis();
      }
  }
  
  else if (dist(xRHand, yRHand, width/2-50, 120)<70)
  {
        if (millis()-SBullet1.firedTime > SBullet1.reloadingTime)
      {
        SBullet1.xBPos=YourShip.x1;
        SBullet1.yBPos=YourShip.y1;
        SBullet1.fire=true;

        SBullet1.firedTime=millis();
      }
  }
  
   if (dist(xLHand, yLHand, width/2-50, height-120)<70)
  {
       if (millis()-SBullet2.firedTime > SBullet2.reloadingTime)
      {
        SBullet2.xBPos=YourShip.x1;
        SBullet2.yBPos=YourShip.y1;
        SBullet2.fire=true;

        SBullet2.firedTime=millis();
      }
  }
   
    else if (dist(xRHand, yRHand, width/2-50, height-120)<70)
  {
       if (millis()-SBullet1.firedTime > SBullet1.reloadingTime)
      {
        SBullet1.xBPos=YourShip.x1;
        SBullet1.yBPos=YourShip.y1;
        SBullet1.fire=true;

        SBullet1.firedTime=millis();
      }
  }
}

void FireButtons()
{
  if (dist(xLHand, yLHand, 120, height/2-50)<70)
  {
    R2=255;
    G2=44;
    B1=227;
  } 
  
  else if (dist(xRHand, yRHand, width-120, height/2-50)<70)
  {
    R2=255;
    G2=44;
    B1=227;
  }
  
  else if (dist(xRHand, yRHand, width/2-50, height-120)<70)
  {
    R2=255;
    G2=44;
    B1=227;
  }
  
    else if (dist(xLHand, yLHand, width/2-50, height-120)<70)
  {
    R2=255;
    G2=44;
    B1=227;
  }
  
    else if (dist(xRHand, yRHand, width/2-50, 120)<70)
  {
    R2=255;
    G2=44;
    B1=227;
  }
  
    else if (dist(xLHand, yLHand, width/2-50, height-120)<70)
  {
    R2=255;
    G2=44;
    B1=227;
  }
  
  else
  {
    R2=251;
    G2=255;
    B2=64;
  }
}

void MoveButtons()
{
  if (dist(xLHand, yLHand, 120, height/2+50)<70)
  {
    R1=255;
    G1=44;
    B1=227;
  } 
  
  else if (dist(xRHand, yRHand, width-120, height/2+50)<70)
  {
    R1=255;
    G1=44;
    B1=227;
  } 
  
  
  else if (dist(xLHand, yLHand, width/2+50, height-120)<70)
  {
    R1=255;
    G1=44;
    B1=227;
  } 
  
  else if (dist(xRHand, yRHand, width/2+50, height-120)<70)
  {
    R1=255;
    G1=44;
    B1=227;
  } 
  
  
  
  else if (dist(xLHand, yLHand, width/2+50, 120)<70)
  {
    R1=255;
    G1=44;
    B1=227;
  } else if (dist(xRHand, yRHand, width/2+50, 120)<70)
  {
    R1=255;
    G1=44;
    B1=227;
  } else
  {
    R1=61;
    G1=252;
    B1=113;
  }
}

void wall()
{
  fill(0);
  rect(100, 100, 7, height-200, 7);
  rect(100, 100, width-200, 7, 7);
  rect(100, height-100, width-200, 7, 7);
  rect(width-100, 100, 7, height-200, 7);
}


void TTurretFire1()
{
  if (millis()-TBullet1.firedTime2 > TBullet1.reloadingTime2)
  {
    TBullet1.xBPos=TopTurret1.xTPos;
    TBullet1.yBPos=TopTurret1.yTPos;
    TBullet1.firedTime2=millis();
    TBullet1.fire2=true;
  }
}

void TTurretFire2()
{
  if (millis()-TBullet2.firedTime2 > TBullet2.reloadingTime2)
  {
    TBullet2.xBPos=TopTurret2.xTPos;
    TBullet2.yBPos=TopTurret2.yTPos;
    TBullet2.firedTime2=millis();
    TBullet2.fire2=true;
  }
}

void TTurretFire3()
{
  if (millis()-TBullet3.firedTime2 > TBullet3.reloadingTime2)
  {
    TBullet3.xBPos=TopTurret3.xTPos;
    TBullet3.yBPos=TopTurret3.yTPos;
    TBullet3.firedTime2=millis();
    TBullet3.fire2=true;
  }
}
void BTurretFire1()
{
  if (millis()-BBullet1.firedTime2 > BBullet1.reloadingTime2)
  {
    BBullet1.xBPos=BottomTurret1.xTPos;
    BBullet1.yBPos=BottomTurret1.yTPos;
    BBullet1.firedTime2=millis();
    BBullet1.fire2=true;
  }
}

void BTurretFire2()
{
  if (millis()-BBullet2.firedTime2 > BBullet2.reloadingTime2)
  {
    BBullet2.xBPos=BottomTurret2.xTPos;
    BBullet2.yBPos=BottomTurret2.yTPos;
    BBullet2.firedTime2=millis();
    BBullet2.fire2=true;
  }
}

void BTurretFire3()
{
  if (millis()-BBullet3.firedTime2 > BBullet3.reloadingTime2)
  {
    BBullet3.xBPos=BottomTurret3.xTPos;
    BBullet3.yBPos=BottomTurret3.yTPos;
    BBullet3.firedTime2=millis();
    BBullet3.fire2=true;
  }
}


void drawPosition(SkeletonData _s) 
{
  noStroke();
  fill(0, 100, 255);
  String s1 = str(_s.dwTrackingID);
  text(s1, _s.position.x*width/2, _s.position.y*height/2);
}

void drawSkeleton(SkeletonData _s) 
{
  // Body
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HEAD, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
    Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
    Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SPINE, 
    Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
    Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
    Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
    Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);

  // Left Arm
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
    Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
    Kinect.NUI_SKELETON_POSITION_HAND_LEFT);

  // Right Arm
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);

  // Left Leg
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
    Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
    Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);

  // Right Leg
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}

void DrawBone(SkeletonData _s, int _j1, int _j2) 
{
  noFill();
  stroke(255, 255, 0);
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    line(
      _s.skeletonPositions[_j1].x*width, 
      _s.skeletonPositions[_j1].y*height, 
      _s.skeletonPositions[_j2].x*width, 
      _s.skeletonPositions[_j2].y*height);

    if (_j2 ==  Kinect.NUI_SKELETON_POSITION_HAND_LEFT)
    {
      yLHand = _s.skeletonPositions[_j2].y*height;
      xLHand = _s.skeletonPositions[_j2].x*width;
    }

    if (_j2 == Kinect.NUI_SKELETON_POSITION_HAND_RIGHT)
    {
      xRHand = _s.skeletonPositions[_j2].x*width;
      yRHand = _s.skeletonPositions[_j2].y*height;
    }
  }
}

void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}