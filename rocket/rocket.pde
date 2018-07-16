
spaceShip q;
void setup()
{
 size(600,600);
 background(255);
 q= new spaceShip();
}

void draw()
{
 background(255);
 q.display();
 q.wrapEdges();
 q.update();
 if(keyPressed)
 {
    if((key==CODED)&&(keyCode==RIGHT))
 q.turn(0.1);
else  if((key==CODED)&&(keyCode==LEFT))
q.turn(-0.1);
if(key=='z')
q.thrust();
   if(key=='b')
   q.brake();
  }
}