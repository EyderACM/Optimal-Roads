class Edge {
  
  //Variables de la clase.
  Vertex vertexRoot;
  Vertex vertexChild;
  boolean isPath = false;
  
  //Constructor EDGE.
  Edge(Vertex vertexStart, Vertex vertexEnd) {
    this.vertexRoot = vertexStart;
    this.vertexChild = vertexEnd;
     
    this.vertexRoot.addEdgeTo(vertexChild);
    this.vertexChild.addEdgeTo(vertexRoot);
    vertexChild.father = vertexStart;
   
   //Se genera la matriz de adyacencia, tomando en cuenta si los vértices tienen alguna arista que los conecten con otros.
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

  /*
   *display()
   *
   *Funcion que muestra en pantalla las aristas, y dependiendo del valor de isPath, los pinta de un color.
   */
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
  
  /*
   *paintPath()
   *
   *Función que determina si una arista debe ser pintada (en caso de que sea parte de la ruta de un vértice a localizar).
   */
  void paintPath(boolean isPath) {
   this.isPath = isPath; 
  }
}
