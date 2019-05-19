
Vertex firstVertexForEdge = null;
Vertex secondVertexForEdge = null;

ArrayList<Vertex> myVertex = new ArrayList<Vertex>();
Vertex abuelo1, hijo1, hijo2, hijo3, hijo4, nieto1, nieto2, nieto3, nieto4, nieto5,
nieto6, nieto7, nieto8, nieto9, bisnieto1, bisnieto2, bisnieto3;

ArrayList<Edge> myEdges = new ArrayList<Edge>();
Edge edge1, edge2, edge3, edge4, edge5, edge6, edge7, edge8, edge9, edge10, edge11, edge12,
edge13, edge14, edge15, edge16;

int[][] adjacencyArray = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};

void setup() {
 size(1200, 640);
 background(255);
 textSize(10);
 myVertex.add(abuelo1 = new Vertex(width/2 - 400 + 200*3, 50, "Abuelo (Enfermo)"));
 myVertex.add(hijo1 = new Vertex(width/2 - 400  + 100*3, 150, "Hijo (Enfermo)"));
 myVertex.add(hijo2 = new Vertex(width/2 - 400  + 150*3, 150, "Hijo (Enfermo)"));
 myVertex.add(hijo3 = new Vertex(width/2 - 400  + 250*3, 150, "Hijo (Sano)"));
 myVertex.add(hijo4 = new Vertex(width/2 - 400  + 300*3, 150, "Hijo (Sano)"));
 myVertex.add(nieto1 = new Vertex(width/2 - 400  + 70*3, 250, "Nieto (Enfermo)"));
 myVertex.add(nieto2 = new Vertex(width/2 - 400  + 100*3, 250, "Nieto (Sano)"));
 myVertex.add(nieto3 = new Vertex(width/2 - 400  + 130*3, 250, "Nieto (Sano)"));
 myVertex.add(nieto4 = new Vertex(width/2 - 400  + 160*3, 250, "Nieto (Enfermo)"));
 myVertex.add(nieto5 = new Vertex(width/2 - 400  + 190*3, 250, "Nieto (Sano)"));
 myVertex.add(nieto6 = new Vertex(width/2 - 400  + 220*3, 250, "Nieto (Enfermo)"));
 myVertex.add(nieto7 = new Vertex(width/2 - 400  + 250*3, 250, "Nieto (Enfermo)"));
 myVertex.add(nieto8 = new Vertex(width/2 - 400  + 285*3, 250, "Nieto (Enfermo)"));
 myVertex.add(nieto9 = new Vertex(width/2 - 400  + 315*3, 250, "Nieto (Sano)"));
 myVertex.add(bisnieto1 = new Vertex(width/2 - 400  + 85*3, 350, "Bisnieto (Enfermo)"));
 myVertex.add(bisnieto2 = new Vertex(width/2 - 400  + 115*3, 350, "Bisnieto (Sano)"));
 myVertex.add(bisnieto3 = new Vertex(width/2 - 400  + 250*3, 350, "Bisnieto (Sano)"));
 
 myEdges.add(edge1 = new Edge(abuelo1, hijo1));
 myEdges.add(edge2 = new Edge(abuelo1, hijo2));
 myEdges.add(edge3 = new Edge(abuelo1, hijo3));
 myEdges.add(edge4 = new Edge(abuelo1, hijo4));
 myEdges.add(edge5 = new Edge(hijo1, nieto1));
 myEdges.add(edge6 = new Edge(hijo1, nieto2));
 myEdges.add(edge7 = new Edge(hijo1, nieto3));
 myEdges.add(edge8 = new Edge(hijo2, nieto4));
 myEdges.add(edge9 = new Edge(hijo2, nieto5));
 myEdges.add(edge10 = new Edge(hijo3, nieto6));
 myEdges.add(edge11 = new Edge(hijo4, nieto7));
 myEdges.add(edge12 = new Edge(hijo4, nieto8));
 myEdges.add(edge13 = new Edge(hijo4, nieto9));
 myEdges.add(edge14 = new Edge(nieto2, bisnieto1));
 myEdges.add(edge15 = new Edge(nieto2, bisnieto2));
 myEdges.add(edge16 = new Edge(nieto6, bisnieto3));
}

void draw() {
 background(255);
 for (int i = 0; i < myEdges.size(); i++) {
   myEdges.get(i).display();
 }
 
 for (int i = 0; i < myVertex.size(); i++) {
   myVertex.get(i).display(mouseX, mouseY);
 }
}

void mouseReleased() {
 //addingVertex();
 //addingAnEdge();
}

/*void addingVertex(){
  boolean addVertex = false;
  if (mouseButton == LEFT) {
    if (myVertex.size() > 0) {
       for (int i = 0; i < myVertex.size(); i++) {
         if (dist(mouseX, mouseY, myVertex.get(i).x, myVertex.get(i).y) < 10) {
           addVertex = true;
           break;
       }
      }
       if (addVertex == false) {
         myVertex.add(new Vertex(mouseX, mouseY, "NuevoVertice"));
       }
       addVertex = false;
    }
    else
    {
       myVertex.add(new Vertex(mouseX, mouseY, "NuevoVertice"));
    }
  }
}

void addingAnEdge() {
  boolean addEdge = false;
  if (mouseButton == LEFT) {
   if (myVertex.size() > 1) {
    for (int i = 0; i < myVertex.size(); i++) {
     if (dist(mouseX, mouseY, myVertex.get(i).x, myVertex.get(i).y) < 0 && addEdge == false) {
       println("Clickeaste: " + myVertex.get(i).vertexName);
       firstVertexForEdge = myVertex.get(i);
       firstVertexForEdge.isClicked(true);
       addEdge = true;
     }
     else 
     {
       if (dist(mouseX, mouseY, myVertex.get(i).x, myVertex.get(i).y) < 0 && addEdge == true) {
         println("Clickeaste tambien: " + myVertex.get(i).vertexName);
         secondVertexForEdge = myVertex.get(i);
         secondVertexForEdge.isClicked(true);
       }
     }
     if (firstVertexForEdge != null && secondVertexForEdge != null) {
       
     }
    }
   }
  }
}*/

void mouseDragged() {
  
}
