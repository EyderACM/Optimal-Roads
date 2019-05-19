class Edge {
  
  Vertex vertexRoot;
  Vertex vertexChild;
  
  Edge(Vertex vertexStart, Vertex vertexEnd) {
   vertexRoot = vertexStart;
   vertexChild = vertexEnd;
   
   vertexRoot.addEdgeTo(vertexChild);
   vertexChild.addEdgeTo(vertexRoot);
   
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
    pushStyle();
    stroke(0);
    strokeWeight(2);
    line(vertexRoot.x, vertexRoot.y, vertexChild.x, vertexChild.y);
    vertexRoot.addEdgeTo(vertexChild);
  }
}
