class Road {
  
  Entity firstPlace;
  Entity secondPlace;
  String roadName;
  float time;
  
  Road(Entity firstPlace, Entity secondPlace, float time){
    this.firstPlace = firstPlace;
    this.secondPlace = secondPlace;
    this.time = time;
    
    this.firstPlace.addPathTo(secondPlace);
    this.secondPlace.addPathTo(firstPlace);
  }
  
  void drawLine(){
    pushStyle();
    stroke(255);
    strokeWeight(2);
    line(this.firstPlace.posX, this.firstPlace.posY, this.secondPlace.posX, this.secondPlace.posY);
    popStyle();
    this.firstPlace.addPathTo(secondPlace);
  }
}
