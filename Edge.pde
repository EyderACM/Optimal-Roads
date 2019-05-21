class Edge {
  
  Vertex vertexRoot;
  Vertex vertexChild;
  boolean isPath = false;
  
  Edge(Vertex vertexStart, Vertex vertexEnd) {
  this.vertexRoot = vertexStart;
  this.vertexChild = vertexEnd;
   
  this.vertexRoot.addEdgeTo(vertexChild);
  this.vertexChild.addEdgeTo(vertexRoot);
   
   for (int i = 0; i < myVertex.size(); i++) {
     if(vertexStart == myVertex.get(i)) {
       for (int j = i + 1; j < myVertex.size(); j++) {
         if(vertexEnd == myVertex.get(j)) {
           adjacencyArray[i][j]++;
           adjacencyArray[j][i]++;
         }
       }
     }
   }
  }

  void display() {
    if (!isPath) {
      stroke(0);
      strokeWeight(2);
      line(this.vertexRoot.x, this.vertexRoot.y, this.vertexChild.x, this.vertexChild.y);
      this.vertexRoot.addEdgeTo(vertexChild);
    } else {
      stroke(220, 20, 60);
      strokeWeight(2);
      line(this.vertexRoot.x, this.vertexRoot.y, this.vertexChild.x, this.vertexChild.y);
      this.vertexRoot.addEdgeTo(vertexChild);
    }
  }
  
  void paintPath(boolean isPath) {
   this.isPath = isPath; 
  }
}
