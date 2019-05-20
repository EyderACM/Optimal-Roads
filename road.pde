class Road {
  
  Entity firstPlace;
  Entity secondPlace;
  String roadName;
  boolean isRoute = false;
  float km;
  
  Road(Entity firstPlace, Entity secondPlace){
    this.firstPlace = firstPlace;
    this.secondPlace = secondPlace;
    this.km = dist(this.firstPlace.posX, this.firstPlace.posY, this.secondPlace.posX, this.secondPlace.posY) * (.155555);
    
    this.firstPlace.addPathTo(secondPlace, this.km);
    this.secondPlace.addPathTo(firstPlace, this.km);
  }
  
  void drawLine(){
    if(!isRoute){
      pushStyle();
      stroke(255);
      strokeWeight(2);
      line(this.firstPlace.posX, this.firstPlace.posY, this.secondPlace.posX, this.secondPlace.posY);
      popStyle(); 
    }else{
      pushStyle();
      stroke(100, 255, 42);
      strokeWeight(2);
      line(this.firstPlace.posX, this.firstPlace.posY, this.secondPlace.posX, this.secondPlace.posY);
      popStyle();
    } 
    this.firstPlace.addPathTo(secondPlace, this.km);
  }
  
  void paintLine(boolean isRoute){
    this.isRoute = isRoute;
  }
}
