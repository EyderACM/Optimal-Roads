class Entity {
  
  Map<Entity, Float> goesTo = new HashMap<Entity, Float>();
  List<Entity> shortestPath = new LinkedList();
  String name;
  float posX;
  float posY;
  boolean isClicked = false;
  boolean isHighlighted = false;
  boolean isColored = false;
  int entityColor = -1;
  float distance = Integer.MAX_VALUE; 
  
  float diameter;
  
    
  Entity(float posX, float posY){   
    this(posX, posY, "generado");
  }
  
  Entity(float posX, float posY, String name){
    this.posX = posX;
    this.posY = posY;
    this.name = name;
  }
  
  public Map<Entity, Float> getAdjacentEntities(){
    return goesTo;
  }
  
  void display(float diameter){
    if(isClicked){
      fill(42, 255, 87);      
    } else if(isHighlighted){
      fill(255, 42, 42);      
    } else {
      fill(204, 102, 0);
    }
    ellipse(posX, posY, diameter, diameter);
    fill(360, 360, 360);
    if(isColored){
      text(entityColor, posX+1, posY+5);
    }
    text(name, posX, posY - 15);
    textAlign(CENTER);     
  }
  
  void addPathTo(Entity newEntity, float km){
    this.goesTo.put(newEntity, km);
  }
  
  void setDistance(float distance){
    this.distance = distance;
  }  
  
  void isClicked(Boolean isClicked){
    this.isClicked = isClicked;
  }  
  
  void isHighlighted(Boolean isHighlighted){
    this.isHighlighted = isHighlighted;
  }
  
  void isColored(Boolean isColored){
    this.isColored = isColored;
  }
}
