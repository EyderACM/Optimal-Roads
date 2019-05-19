class Entity {
  
  ArrayList<Entity> goesTo = new ArrayList<Entity>();
  String name;
  float posX;
  float posY;
  boolean isClicked = false;
  
  float diameter;
  
    
  Entity(float posX, float posY){   
    this(posX, posY, "generado");
  }
  
  Entity(float posX, float posY, String name){
    this.posX = posX;
    this.posY = posY;
    this.name = name;
  }
  
  void display(float diameter){
    if(!isClicked){
      fill(204, 102, 0);
      ellipse(posX, posY, diameter, diameter);
      fill(360, 360, 360);
      text(name, posX, posY - 15);
      textAlign(CENTER);
    }else {
      fill(42, 255, 87);
      ellipse(posX, posY, diameter, diameter);
      fill(360, 360, 360);
      text(name, posX, posY - 15);
      textAlign(CENTER);
    }
  }
  
  void addPathTo(Entity newEntity){
    this.goesTo.add(newEntity);
  }
  
  void isClicked(Boolean isClicked){
    this.isClicked = isClicked;
  }
}
