class Vertex {
  
  List<Vertex> pathTo = new ArrayList<Vertex>();
  ArrayList<Vertex> edgeTo = new ArrayList<Vertex>();
  int vertexSize = 20;
  int x, y;
  String vertexName;
  boolean onVertex = false, isClicked = false, isHighlighted = false;
  boolean visited;
  int touchingVertex = 10;
  
  Vertex(String name) {
    vertexName = name;
  }
  
  Vertex(int posX, int posY, String name) {
    x = posX;
    y = posY;
    vertexName = name;
    
    //this.pathTo = new ArrayList<Vertex>();
  }
  
  /*void addAdjacentVertex(Vertex adjacentVertex) {
    this.pathTo.add(adjacentVertex);
  }
  List<Vertex> getAdjacentVertex() {
    return pathTo;
  }
  void setAdjacentVertex(List<Vertex> pathTo) {
    this.pathTo = pathTo; 
  }*/
  
  
  void display(int posX, int posY) {
    stroke(0);
    if (dist(posX, posY, x, y) < vertexSize/2) {
      onVertex = true;
    }
    if (onVertex == true) {
      if (isHighlighted) {
        fill(240, 145, 85);
      } 
      ellipse(x, y, vertexSize + touchingVertex, vertexSize + touchingVertex);
      fill(0);
    }
    else
    {
      if (isHighlighted) {
        fill(240, 145, 85);
      } 
      ellipse(x, y, vertexSize, vertexSize);
      fill(0);
    }
    onVertex = false;
    fill(0);
    text(vertexName, x, y + 25);
    textAlign(CENTER);
    fill(255);
  }
  
  void addEdgeTo(Vertex newVertex) {
    edgeTo.add(newVertex);
  }
  
  void isClicked(boolean isClicked){
    this.isClicked = isClicked;
  }
  
  void isHighlighted(Boolean isHighlighted) {
   this.isHighlighted = isHighlighted; 
  }
}
