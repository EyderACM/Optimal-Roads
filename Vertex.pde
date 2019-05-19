class Vertex {
  
  ArrayList<Vertex> edgeTo = new ArrayList<Vertex>();
  int vertexSize = 20;
  int x, y;
  String vertexName;
  boolean onVertex = false, isClicked = false;
  int touchingVertex = 10;
  
  Vertex(int posX, int posY, String name) {
    x = posX;
    y = posY;
    vertexName = name;
  }
  
  void display(int posX, int posY) {
    stroke(0);
    if (dist(posX, posY, x, y) < vertexSize/2) {
      onVertex = true;
    }
    if (onVertex == true) {
      ellipse(x, y, vertexSize + touchingVertex, vertexSize + touchingVertex);
    }
    else
    {
      ellipse(x, y, vertexSize, vertexSize);
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
}
