Particle [] particles;
void setup()
{
  size(1000, 1000);
  particles=new Particle[1500];
  for (int i=0; i<particles.length; i++)
  {
    particles[i] = new NormalParticle();
}
 particles[0]=new OddballParticle(500, 500);
 particles[1]=new JumboParticle();
}
void draw()
{
  background(0);
  for (int i=0; i<particles.length; i++) {
    particles[i].move();
    particles[i].show();
  }
}
class NormalParticle implements Particle
{
  double myX, myY, speed, angle;
  int myColor;
  NormalParticle() {
    myX=500;
    myY=500;
    speed=Math.random()*10;
    angle=Math.PI*2*Math.random();
    myColor=color(100, 30, 100);
  }
  public void move() {
    myX=myX+Math.cos(angle)*speed;
    myY=myY+Math.sin(angle)*speed;
  }
  public void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, 10, 10);
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle//uses an interface
{
  double myX, myY;
  int myColor;
  OddballParticle(int x, int y) {
    myX=x;
    myY=y;
    myColor=color(0, 150, 250);
  }
  public void move() {
    myX=myX+(Math.random()*6)-3;
    myY=myY+(Math.random()*6)-3;
  }
  public void show()
  {
    fill(myColor);
    rect((float)myX, (float)myY, 30, 30);
    rect((float)myX*(float)(Math.random()*5)-3, (float)myY*(float)(Math.random()*5)-3, 30, 30);
  }
}
class JumboParticle extends NormalParticle//uses inheritance
{
  public void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, 500, 500);
  }
}

