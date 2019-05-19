class Edge {
  
  Vertex vertexRoot;
  Vertex vertexChild;
  
  Edge(Vertex vertexStart, Vertex vertexEnd) {
   vertexRoot = vertexStart;
   vertexChild = vertexEnd;
   
   vertexRoot.addEdgeTo(vertexChild);
   vertexChild.addEdgeTo(vertexRoot);
  }

  void display() {
    pushStyle();
    stroke(0);
    strokeWeight(2);
    line(vertexRoot.x, vertexRoot.y, vertexChild.x, vertexChild.y);
    vertexRoot.addEdgeTo(vertexChild);
  }
}
