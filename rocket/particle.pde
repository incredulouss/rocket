class particle
{
  PVector loc;
  PVector av;
  PVector aa;
  float angle;
  float life=255;
  particle(PVector q,PVector force)
  {
    loc = q.get();
    av = force.random2D();
    aa = force.get();
  //  angle= 10;
  }
 
  
  
  
  void update()
  {
    loc.add(av);
    av.add(aa);
    angle+=1;
    life-=8;
    aa.mult(0);
  }
  
  void display()
  {
    pushMatrix();
   translate(loc.x,loc.y);
   rotate(angle);
   fill(255,0,0,life);
   rect(0,0,10,10);
   popMatrix();
  }
  boolean dead()
  {
    if(life<=0)
    return true;
    else 
    return false;
  }
    
  
    
    
    
    
    
    
    
    
}