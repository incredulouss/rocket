class particlesystem
{
  ArrayList<particle> p ;
  
  particlesystem()
  {
      p = new ArrayList<particle>();
  }
  void addParticle(float tx,float ty,PVector force)
  {
   for(int i=0;i<5;i++)
  {
    p.add(new particle(new PVector(tx,ty),force));
  }  
  }
  
  void run()
  {
      for(int i =p.size()-1;i>=0;i--)
  {
    particle pp=p.get(i);
    pp.display();
    pp.update();
  if(pp.dead())
  {
    p.remove(i);}
}
}



}