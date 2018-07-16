class spaceShip
{
  PVector loc;
  PVector aa;
  PVector av;
  float heading;
  float r= 16;
  boolean thrusting= false;
  particlesystem ps;
  spaceShip()
  {
    loc = new PVector(width/2,height/2);
    av = new PVector();
    aa = new PVector();
    ps = new particlesystem();
  }
  void brake()
  {
  av.mult(0.02);}
  
  void turn(float q)
  {
    heading +=q;
  }
  void update()
  {
    
    av.add(aa);
    av.limit(6);
    av.mult(0.995);
    loc.add(av);
   aa.mult(0);
   ps.run();
  }
  void applyForce(PVector f)
  {
   PVector force = f.get();
   aa.add(f);
    
  }
   void thrust()
   {
    float angle = heading-PI/2;
    PVector force =  PVector.fromAngle(angle);
    force.mult(0.1);
    applyForce(force);
    force.mult(-2);
     ps.addParticle(loc.x,loc.y+r,force);
     thrusting= true;
   }
   void display()
   {
      stroke(0);
    strokeWeight(2);
    pushMatrix();
    translate(loc.x,loc.y+r);
    rotate(heading);
    fill(175);
    if (thrusting) fill(255,0,0);
    // Booster rockets
    rect(-r/2,r,r/3,r/2);
    rect(r/2,r,r/3,r/2);
    fill(175);
    // A triangle
    beginShape();
    vertex(-r,r);
    vertex(0,-r);
    vertex(r,r);
    endShape(CLOSE);
    rectMode(CENTER);
    popMatrix();
    
    thrusting = false;
  }
 void wrapEdges() {
    float buffer = r*2;
    if (loc.x > width +  buffer) loc.x = -buffer;
    else if (loc.x <    -buffer) loc.x = width+buffer;
    if (loc.y > height + buffer) loc.y = -buffer;
    else if (loc.y <    -buffer) loc.y = height+buffer;
  }}