import java.util.*;

//Vertex firstVertexForEdge = null;
//Vertex secondVertexForEdge = null;
Vertex root = null;
Vertex child = null;
int opcion = 0, vertexCont = 0, leafCont = 0, heightContGlobal = 0;
boolean searching = false, firstFound = false, vertexFound = false;
Vertex firstVertexForPath = null; //Se agregó para localizar NODOS.
Vertex secondVertexForPath = null; //Se agregó para localizar NODOS.

ArrayList<Vertex> myVertex = new ArrayList<Vertex>();
Vertex abuelo1, hijo1, hijo2, hijo3, hijo4, nieto1, nieto2, nieto3, nieto4, nieto5,
nieto6, nieto7, nieto8, nieto9, bisnieto1, bisnieto2, bisnieto3;

ArrayList<Edge> myEdges = new ArrayList<Edge>();
Edge edge1, edge2, edge3, edge4, edge5, edge6, edge7, edge8, edge9, edge10, edge11, edge12,
edge13, edge14, edge15, edge16;

ArrayList<Vertex> searchPathTo = new ArrayList<Vertex>();
ArrayList<Vertex> searchVertex = new ArrayList<Vertex>();

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
 size(1250, 540);
 background(255);
 textSize(10);
 myVertex.add(abuelo1 = new Vertex(width/2 - 400 + 200*3, 50, "Abuelo(Enfermo)"));
 myVertex.add(hijo1 = new Vertex(width/2 - 400  + 100*3, 150, "Hijo(Enfermo)"));
 myVertex.add(hijo2 = new Vertex(width/2 - 400  + 150*3, 150, "Hijo(Enfermo)"));
 myVertex.add(hijo3 = new Vertex(width/2 - 400  + 250*3, 150, "Hijo(Sano)"));
 myVertex.add(hijo4 = new Vertex(width/2 - 400  + 300*3, 150, "Hijo(Sano)"));
 myVertex.add(nieto1 = new Vertex(width/2 - 400  + 70*3, 250, "Nieto(Enfermo)"));
 myVertex.add(nieto2 = new Vertex(width/2 - 400  + 100*3, 250, "Nieto(Sano)"));
 myVertex.add(nieto3 = new Vertex(width/2 - 400  + 130*3, 250, "Nieto(Sano)"));
 myVertex.add(nieto4 = new Vertex(width/2 - 400  + 160*3, 250, "Nieto(Enfermo)"));
 myVertex.add(nieto5 = new Vertex(width/2 - 400  + 190*3, 250, "Nieto(Sano)"));
 myVertex.add(nieto6 = new Vertex(width/2 - 400  + 220*3, 250, "Nieto(Enfermo)"));
 myVertex.add(nieto7 = new Vertex(width/2 - 400  + 250*3, 250, "Nieto(Enfermo)"));
 myVertex.add(nieto8 = new Vertex(width/2 - 400  + 285*3, 250, "Nieto(Enfermo)"));
 myVertex.add(nieto9 = new Vertex(width/2 - 400  + 315*3, 250, "Nieto(Sano)"));
 myVertex.add(bisnieto1 = new Vertex(width/2 - 400  + 85*3, 350, "Bisnieto(Enfermo)"));
 myVertex.add(bisnieto2 = new Vertex(width/2 - 400  + 115*3, 350, "Bisnieto(Sano)"));
 myVertex.add(bisnieto3 = new Vertex(width/2 - 400  + 250*3, 350, "Bisnieto(Sano)"));
 
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
 leafCont = leafCont();
 vertexCont = myVertex.size();
 heightCont(myVertex.get(0), 1);
 println("Altura del arbol: ", heightContGlobal);
}

void draw() {
 background(255);
 for (int i = 0; i < myEdges.size(); i++) {
   myEdges.get(i).display();
 }
 
 for (int i = 0; i < myVertex.size(); i++) {
   myVertex.get(i).display(mouseX, mouseY);
 }
 
 if (searching == true) {
   fill(0);
   textSize(15);
   textAlign(CENTER);
   text(searchVertex.get(0).vertexName, 175, 330);
   fill(255);
   textSize(10);
 }
 
 menu();
 opciones();
 conteo();
}

void menu() {
 fill(0);
 textSize(20);
 textAlign(CENTER);
 text("Enfermedades congénitas", 175, 90 );
 text("Árbol genealógico (Paterno)", 175, 120);
 textSize(10);
 fill(255);
}

void opciones() {
 switch (opcion){
   case 0:
     fill(0);
     textSize(15);
     textAlign(CENTER);
     text("Elija alguna opción: ", 175, 180);
     text("IMPRESION DE NODOS", 175, 220);
     text("1. Preorden.", 175, 260);
     text("2. Inorden.", 175, 300);
     text("3. Postorden.", 175, 340);
     text("BUSQUEDA DE NODOS", 175, 380);
     text("4. Localizar nodos.", 175, 420);
     fill(255);
     textSize(10);
     break;
   case 1:
     fill(0);
     textSize(20);
     text("HOLA", 1, 1);
     fill(255);
     textSize(10);
     break;
     case 4:
     fill(0);
     textSize(15);
     textAlign(CENTER);
     text("LOCALIZAR NODOS", 175, 270);
     text("Introduzca el nombre del nodo a localizar: ", 175, 300);
     text("Presiona ENTER para salvar el nombre.", 175, 380);
     text("Presiona 5 para regresar al menú.", 175, 410);
     searching = true;
     fill(255);
     textSize(10);
     break;
  }
 
}

void conteo() { 
  fill(0);
  textSize(10);
  textAlign(RIGHT);
  text("Cantidad nodos: "+vertexCont+"      Cantidad hojas: "+leafCont+"      Altura del arbol: ", width - 10, height - 10); //Agregar heightCont
  textAlign(CENTER);
  fill(255);
}

int leafCont() {
  int leafCont = 0, vertexAcum = 0;
  for (int i = 0; i < myVertex.size(); i++) {
    vertexAcum = 0;
    for (int j = i + 1; j < myVertex.size(); j++) {
      vertexAcum += adjacencyArray[i][j];
    }
    if (vertexAcum == 0) {
     leafCont++; 
    }
  }
 println("Cantidad de vértices: ", myVertex.size());
 println("Cantidad de hojas: ", leafCont);
 println("MATRIZ ADYACENCIA");
 for (int i = 0; i < myVertex.size(); i++) {
  for (int j = 0; j < myVertex.size(); j++) {
    print(adjacencyArray[i][j] + " ");
  }
  println(" ");
 }
 
 return leafCont;
}

int heightCont(Vertex vertex, int cont) {
  boolean vertexLeaf = true;
   for (int i = 0; i < myEdges.size(); i++) {
     if (myEdges.get(i).vertexRoot.equals(vertex)) {
       for (int j = 0; j < myVertex.size(); j++) {
         if (myVertex.get(j).equals(myEdges.get(i).vertexChild)) {
           Vertex vertexAuxRoot = myVertex.get(j);
           cont += 1;
           int heightSubTree = heightCont(vertexAuxRoot, cont);
           if (heightSubTree > cont) {
             heightContGlobal = heightSubTree;
           }
           vertexLeaf = false;
           break;
         }
       }
       vertexLeaf = false;
     }
   }
   if (vertexLeaf == true) {
     return cont - 1; 
   } else {
     return cont;
   }
}

void keyPressed() {
  if (searching == true) {
     searchingVertex();
  }
 switch(key) {
   case '1':
     for (int i = 0; i < myVertex.size(); i++) {
       myVertex.get(i).isHighlighted(false); 
       myVertex.get(i).display(mouseX, mouseY);
     }
     opcion = 1;
     break;
   case '2':
     for (int i = 0; i < myVertex.size(); i++) {
       myVertex.get(i).isHighlighted(false); 
       myVertex.get(i).display(mouseX, mouseY);
     }
     opcion = 2;
     break;
   case '3':
     for (int i = 0; i < myVertex.size(); i++) {
       myVertex.get(i).isHighlighted(false); 
       myVertex.get(i).display(mouseX, mouseY);
     }
     opcion = 3;
     break;
   case '4':
     opcion = 4;
     searchVertex.clear();
     Vertex vertexToSearch = new Vertex(" ");
     searchVertex.add(vertexToSearch);
     searching = true;
     break;
   case '5':
     for (int i = 0; i < myVertex.size(); i++) {
       myVertex.get(i).isHighlighted(false); 
       myVertex.get(i).display(mouseX, mouseY);
      }
     opcion = 0;
     break;
 }
}

void searchingVertex() {
 if (searchVertex.get(0).vertexName == " ") {
   searchVertex.get(0).vertexName = "";
 }
 if (searching == true) {
   fill(0);
   textSize(15);
   textAlign(CENTER);
   text(searchVertex.get(0).vertexName, 175, 330);
   fill(255);
   textSize(10);
   if (keyCode == ENTER) {
     println("Estás buscando: " + searchVertex.get(0).vertexName);
     searchPathTo.add(myVertex.get(0)); //<-----
     findPath(myVertex.get(0), searchVertex.get(0));
     //opcion = 0;
     searching = false;
   }
   if (keyCode == BACKSPACE && searchVertex.get(0).vertexName.length() > 0) {
    searchVertex.get(0).vertexName = searchVertex.get(0).vertexName.substring(0, searchVertex.get(0).vertexName.length() - 1);
   }
   if ((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z') || key == '(' || key == ')' ) {
     searchVertex.get(0).vertexName += str(key);
   }
 }
 searching = false;
}

void findPath(Vertex vertex, Vertex searchVertex) {
  if (vertex.vertexName.equals(searchVertex.vertexName)) {
    //Debemos resaltar tanto la ruta como los vértices.
    for (int i = 0; i < searchPathTo.size(); i++) {
      for (int j = 0; j < myVertex.size(); j++) {
        if (searchPathTo.get(i).equals(myVertex.get(j))) {
           println("Estás pintando: ", searchPathTo.get(i).vertexName);
           searchPathTo.get(i).isHighlighted(true);
           //break;
        }
      }
      for (int j = 0; j < myEdges.size(); j++) {
        if (searchPathTo.get(i).equals(myEdges.get(i).vertexRoot)) {
          for (int k = 0; k < searchPathTo.size(); k++) {
            if (myEdges.get(i).vertexChild.equals(searchPathTo.size())) {
              myEdges.get(i).paintPath(true);
            }
          }
        }
      }
    }
    println("FELICIDADES, LO ENCONTRASTE");
  }
  else {
    for (int i = 0; i < myEdges.size(); i++) {
      if (myEdges.get(i).vertexRoot.equals(vertex)) {
        searchPathTo.add(vertex);
        for (int j = 0; j < myVertex.size(); j++) {
          if (myVertex.get(j).equals(myEdges.get(i).vertexChild)) {
            Vertex vertexAuxRoot = myVertex.get(j); 
            //Vertex vertexAuxChild = myEdges.get(i).vertexChild;
            searchPathTo.add(vertexAuxRoot);
            findPath(vertexAuxRoot, searchVertex); //findPath(vertexAuxChild);
            //break;
          }
        }
      } else {
        searchPathTo.clear();
        //searchPathTo.remove(searchPathTo.size() - 1);
        //findPath(searchPathTo.get(searchPathTo.size() - 1), searchVertex);
      }
    }
  }
}

/*ArrayList<Vertex> searchPathTo(int adjacencyArray[][], Vertex vertex) {
  int vertexIndex = -1;
  
  ArrayList<Vertex> adjacentVertex = new ArrayList<Vertex>();
  for (int i = 0; i < pathTo.size(); i++) {
    if (pathTo.get(i).equals(vertex)) {
      if (searchVertex.get(0).vertexName.equals(pathTo.get(i).vertexName)) {
        for (int j = 0; j < adjacentVertex.size(); j++) {
          //adjacentVertex.get(j).paintPath(true); 
        }
      }
      vertexIndex = i;
      break;
    }
  }
  
  if (vertexIndex != -1) {
    for (int j = 0; j < adjacencyArray[vertexIndex].length; j++){
      if (adjacencyArray[vertexIndex][j] == 1) {
        adjacentVertex.add(pathTo.get(j)); 
      }
    }
  }
  return adjacentVertex;
}

void findPath(int adjacencyArray[][], Vertex vertex) {
  System.out.print(vertex.vertexName + " ");
  ArrayList<Vertex> adjacentVertex = searchPathTo(adjacencyArray, vertex);
  vertex.visited = true;
  for (int i = 0; i < adjacentVertex.size(); i++) {
    Vertex aux = adjacentVertex.get(i);
    if (aux != null && !aux.visited) {
      findPath(adjacencyArray, aux); 
    }
  }
}*/


/*void findPath(Vertex vertex) {
  System.out.print(vertex.vertexName + " ");
  List<Vertex> pathTo = vertex.getAdjacentVertex();
  vertex.visited = true;
  for (int i = 0; i < pathTo.size(); i++) {
     Vertex aux = pathTo.get(i);
     if (aux != null && !aux.visited) {
      findPath(aux); 
     } else {
      
     }
  }
}*/

/*void findPath() {
 for (int i = 0; i < myVertex.size(); i++) {
   if (firstFound == false) {
     firstVertexForPath = myVertex.get(i);
     firstFound = true;
   } else if(firstFound == true) {
     secondVertexForPath = myVertex.get(i); 
   }
   if (firstVertexForPath != null && secondVertexForPath != null && firstVertexForPath != secondVertexForPath) {
     //AQUI VA EL ALGORITMO RECURSIVO
     secondVertexForPath.pathTo.add(secondVertexForPath);
     int hasChild = (secondVertexForPath.pathTo.size() > 1) ? 1 : 0;
     for (int j = 0; j < secondVertexForPath.pathTo.size() - hasChild; j++) {
       println(secondVertexForPath.pathTo.get(j).vertexName);
       for (int k = 0; k < myEdges.size(); k++) {
         boolean firstThenSecond = myEdges.get(k).vertexRoot == secondVertexForPath.pathTo.get(j) && myEdges.get(k).vertexChild == secondVertexForPath.pathTo.get(j+1);
         boolean secondThenFirst = myEdges.get(k).vertexRoot == secondVertexForPath.pathTo.get(j+1) && myEdges.get(k).vertexChild == secondVertexForPath.pathTo.get(j);
         if (firstThenSecond || secondThenFirst) {
           myEdges.get(k).paintPath(true); 
         }
       }
     }
     firstFound = false;
   }
 }
}*/
