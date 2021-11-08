Rain [] storm;
void setup()
{
  frameRate(30);
  size(300, 300);
  storm = new Rain [150];
  for (int i=0; i<3; i++) //note the heart, i<3 u
  {
    storm[i]=new Lightning();
  }
  for (int i=3; i<storm.length; i++)
  {
    storm[i]=new Rain();
  }
}
void draw()
{
  background(173, 173, 180);
  fill(0, 150, 50);
  rect(0, 250, 300, 300);
  fill(80, 80, 80);
  ellipse((float)storm[0].myXc, (float)storm[0].myYc-30, 70, 30);
  for (int i=0; i<storm.length; i++)
  {
    storm[i].move();
    storm[i].show();
  }
}

void mousePressed() {
  for (int i=0; i<storm.length; i++)
  {
    storm[i].confused();
  }
}


class Rain
{
  double angle;
  double speed;
  float opacity;  
  double myXc;
  double myYc;
  double myX;
  double myY;
  Rain()
  {
    myX=200;
    myY=300;
    myXc=50;
    myYc=60;
    angle=(Math.random()*1.5)+0.75;
    speed=(Math.random()*2.5)+0.5;
    opacity=(float)(Math.random()*1)+1;
  }
  void show() {
    noStroke();
    fill(122, 130, 255);
    ellipse((float)myX, (float)myY, 3, 3);
  }
  void move() {
    myX=myX+Math.cos(angle)*speed;
    myY=myY+Math.sin(angle)*speed;
  }
  void confused() {
    myX=mouseX;
    myY=mouseY;
    myXc=mouseX;
    myYc=mouseY+15;
  }
}

class Lightning extends Rain //inherits from Particle
{
  Lightning()
  {
    int startX;
    int startY;
    int endX;
    int endY;
    int b;
    myX=200;
    myY=300;
    myXc=50;
    myYc=60;
    angle=(Math.random()*1.5)+0.75;
    speed=1;
    opacity=(float)(Math.random()*1)+1;
  }

  void show() {
    float startX = (float)storm[0].myXc;
    float startY = (float)storm[0].myYc-18;
    float endX = 0;
    float endY = 0;
    stroke(255, 255, 255);
      while (endY < 400)
      {
        endY = startY + (float)(Math.random()*10);
        endX = startX + (float)(Math.random()*20)-9.5;
        line(startX, startY, endX, endY);
        startX=endX;
        startY=endY;
      }
  }
}
