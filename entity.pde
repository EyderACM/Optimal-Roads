class Entity {
  
  ArrayList<Entity> goesTo = new ArrayList<Entity>();
  String name;
  float posX;
  float posY;
  
  float diameter;
  
  Entity(float posX, float posY, String name){
    this.posX = posX;
    this.posY = posY;
    this.name = name;
  }
  
  void display(float diameter){
    fill(204, 102, 0);
    ellipse(posX, posY, diameter, diameter);
    fill(360, 360, 360);
    text(name, posX, posY - 15);
    textAlign(CENTER);    
  }
  
  void addPathTo(Entity newEntity){
    this.goesTo.add(newEntity);
  }
  
  
}
