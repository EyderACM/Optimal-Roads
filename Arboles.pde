import java.util.*;

//Variables globales.
int opcion = 0, vertexCont = 0, leafCont = 0, heightContGlobal, heightTree;
boolean searching = false, firstFound = false, vertexFound = false;

//Almacena en una lista objetos de tipo Vertex, que en este caso son cada uno de los nodos/vertices del programa.
ArrayList<Vertex> myVertex = new ArrayList<Vertex>();
Vertex abuelo1, hijo1, hijo2, hijo3, hijo4, nieto1, nieto2, nieto3, nieto4, nieto5,
nieto6, nieto7, nieto8, nieto9, bisnieto1, bisnieto2, bisnieto3;

//Almacena en una lista objetos de tipo Edge, que en este caso son cada uno de las aristas que conectan los nodos/vertices del programa.
ArrayList<Edge> myEdges = new ArrayList<Edge>();
Edge edge1, edge2, edge3, edge4, edge5, edge6, edge7, edge8, edge9, edge10, edge11, edge12,
edge13, edge14, edge15, edge16;

//Almacena en una lista de Strings los nodos/vertices del arbol ordenados en PREORDEN.
ArrayList<String> preorderVertex = new ArrayList<String>();

//Almacena en una lista de Strings los nodos/vertices del arbol ordenados en INORDEN.
ArrayList<String> inorderVertex = new ArrayList<String>();

//Almacena en una lista de Strings los nodos/vertices del arbol ordenados en POSTORDEN.
ArrayList<String> postorderVertex = new ArrayList<String>();

//Listas que permiten encontrar las rutas entre nodos/vertices, al realizar la búsqueda de éstos.
ArrayList<Vertex> searchPathTo = new ArrayList<Vertex>();
ArrayList<ArrayList<Vertex>> pathTo = new ArrayList<ArrayList<Vertex>>();
ArrayList<Vertex> searchVertex = new ArrayList<Vertex>();

//Matriz de adyacencia.
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
 
 //Agregamos los nodos/vertices predeterminados a la lista.
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
 
 //Agregamos las aristas predeterminadas a la lista.
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
 
 //Agregamos el nombre de los nodos/vertices.
 preorderVertex.add("Abuelo(Enfermo)");
 preorderVertex.add("Hijo(Enfermo)");
 preorderVertex.add("Nieto(Enfermo)");
 preorderVertex.add("Nieto(Sano)");
 preorderVertex.add("Bisnieto(Enfermo)");
 preorderVertex.add("Bisnieto(Sano)");
 preorderVertex.add("Nieto(Sano)");
 preorderVertex.add("Hijo(Enfermo)");
 preorderVertex.add("Nieto(Enfermo)");
 preorderVertex.add("Nieto(Sano)");
 preorderVertex.add("Hijo(Sano)");
 preorderVertex.add("Nieto(Enfermo)");
 preorderVertex.add("Bisnieto(Sano)");
 preorderVertex.add("Hijo(Sano)");
 preorderVertex.add("Nieto(Enfermo)");
 preorderVertex.add("Nieto(Enfermo)");
 preorderVertex.add("Nieto(Sano)");
 
 //Agregamos el nombre de los nodos/vertices.
 inorderVertex.add("Nieto(Enfermo)");
 inorderVertex.add("Hijo(Enfermo)");
 inorderVertex.add("Bisnieto(Enfermo)");
 inorderVertex.add("Nieto(Sano)");
 inorderVertex.add("Bisnieto(Sano)");
 inorderVertex.add("Nieto(Sano)");
 inorderVertex.add("Abuelo(Enfermo)");
 inorderVertex.add("Nieto(Enfermo)");
 inorderVertex.add("Hijo(Enfermo)");
 inorderVertex.add("Nieto(Sano)");
 inorderVertex.add("Nieto(Enfermo)");
 inorderVertex.add("Bisnieto(Sano)");
 inorderVertex.add("Hijo(Sano)");
 inorderVertex.add("Nieto(Enfermo)");
 inorderVertex.add("Hijo(Sano)");
 inorderVertex.add("Nieto(Enfermo)");
 inorderVertex.add("Nieto(Sano)");
 
 //Agregamos el nombre de los nodos/vertices.
 postorderVertex.add("Nieto(Enfermo)");
 postorderVertex.add("Bisnieto(Enfermo)");
 postorderVertex.add("Bisnieto(Sano)");
 postorderVertex.add("Nieto(Sano)");
 postorderVertex.add("Nieto(Sano)");
 postorderVertex.add("Hijo(Enfermo)");
 postorderVertex.add("Nieto(Enfermo)");
 postorderVertex.add("Nieto(Sano)");
 postorderVertex.add("Hijo(Enfermo)");
 postorderVertex.add("Bisnieto(Sano)");
 postorderVertex.add("Nieto(Enfermo)");
 postorderVertex.add("Hijo(Sano)");
 postorderVertex.add("Nieto(Enfermo)");
 postorderVertex.add("Nieto(Enfermo)");
 postorderVertex.add("Nieto(Sano)");
 postorderVertex.add("Hijo(Sano)");
 postorderVertex.add("Abuelo(Enfermo)");
 
 //Hallamos la altura del árbol con recursión, introduciendo a la función los vértices que son hojas y recorremos el árbol de la hoja hasta la raíz.
 vertexCont = myVertex.size();
 for (int i = 0; i < myVertex.size(); i++) {
    switch (i) {
      case 6: case 8: case 9: case 10: case 12: case 13: case 14: case 15: case 16: case 17:
        int heightCont = heightCont(myVertex.get(i), 1, 0);
        if (heightCont > heightTree) {
           heightTree = heightCont;
        }
      break;
    }
  }
 heightContGlobal = heightTree;
 
 //Hallamos la cantidad de hojas del árbol, contando la cantidad de vértices que no cuentan con alguna arista que los conecte con otro.
 leafCont = leafCont();
 
}

void draw() {
 background(255);
 switch (opcion) {
   //Imprimimos los vértices y las aristas.
   case 0: case 4:
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
       text(searchVertex.get(0).vertexName, 175, 270);
       fill(255);
       textSize(10);
     }
   break;
   
  //Imprimimos los vértices en PREORDEN.
  case 1:
   for (int i = 0; i < preorderVertex.size(); i++) {
     if (i % 2 == 0) {
       fill(0);
       textSize(10);
       textAlign(CENTER);
       text(preorderVertex.get(i), 347 + 54*i, height/2 - 15);
       fill(242, 87, 87);
       ellipse(347 + 54*i, height/2, 20, 20);
       fill(255);
       textSize(10);
     } else {
       fill(0);
       textSize(10);
       textAlign(CENTER);
       text(preorderVertex.get(i), 347 + 54*i, height/2 + 25);
       fill(242, 87, 87);
       ellipse(347 + 54*i, height/2, 20, 20);
       fill(255);
       textSize(10);
     }
   }
   break;
   
  ////Imprimimos los vértices en INORDEN.
  case 2:
   for (int i = 0; i < inorderVertex.size(); i++) {
     if (i % 2 == 0) {
       fill(0);
       textSize(10);
       textAlign(CENTER);
       text(inorderVertex.get(i), 347 + 54*i, height/2 - 15);
       fill(250, 177, 54);
       ellipse(347 + 54*i, height/2, 20, 20);
       fill(255);
       textSize(10);
     } else {
       fill(0);
       textSize(10);
       textAlign(CENTER);
       text(inorderVertex.get(i), 347 + 54*i, height/2 + 25);
       fill(250, 177, 54);
       ellipse(347 + 54*i, height/2, 20, 20);
       fill(255);
       textSize(10);
     }
   }
   break;
   
  //Imprimimos los vértices en POSTORDEN.
  case 3:
   for (int i = 0; i < postorderVertex.size(); i++) {
     if (i % 2 == 0) {
       fill(0);
       textSize(10);
       textAlign(CENTER);
       text(postorderVertex.get(i), 347 + 54*i, height/2 - 15);
       fill(247, 231, 98);
       ellipse(347 + 54*i, height/2, 20, 20);
       fill(255);
       textSize(10);
     } else {
       fill(0);
       textSize(10);
       textAlign(CENTER);
       text(postorderVertex.get(i), 347 + 54*i, height/2 + 25);
       fill(247, 231, 98);
       ellipse(347 + 54*i, height/2, 20, 20);
       fill(255);
       textSize(10);
     }
   }
   break;
 }
 
 //Imprimimos el titulo del programa.
 menu();
 
 //Imprimimos las opciones.
 opciones();
 
 //Mantenemos la cuenta de vértices, hojas y altura del árbol, en la parte inferior derecha de la pantalla.
 conteo();
 
}


/*
 *menu()
 *
 *Función que imprime el titulo principal del programa.
 */
void menu() {
 fill(0);
 textSize(20);
 textAlign(CENTER);
 text("Enfermedades congénitas", 175, 90 );
 text("Árbol genealógico (Paterno)", 175, 120);
 textSize(10);
 fill(255);
}

/*
 *opciones()
 *
 *Función que imprime el submenú correspondiente a la opción elegida por el usuario en el menú principal.
 */
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
     textSize(15);
     textAlign(CENTER);
     text("LOCALIZAR NODOS", 175, 270);
     text("Lista de nodos en PREORDEN", 175, 300);
     text("Presiona 5 para regresar al menú.", 175, 330);
     fill(255);
     textSize(10);
     break;
    case 2:
     fill(0);
     textSize(15);
     textAlign(CENTER);
     text("LOCALIZAR NODOS", 175, 270);
     text("Lista de nodos en INORDEN", 175, 300);
     text("Presiona 5 para regresar al menú.", 175, 330);
     fill(255);
     textSize(10);
     break;
    case 3:
     fill(0);
     textSize(15);
     textAlign(CENTER);
     text("LOCALIZAR NODOS", 175, 270);
     text("Lista de nodos en POSTORDEN", 175, 300);
     text("Presiona 5 para regresar al menú.", 175, 330);
     fill(255);
     textSize(10);
     break;
    case 4:
     fill(0);
     textSize(15);
     textAlign(CENTER);
     text("LOCALIZAR NODOS", 175, 200);
     text("Introduzca el nombre del nodo a localizar: ", 175, 230);
     text("Presiona ENTER para salvar el nombre.", 175, 310);
     text("Presiona 5 para regresar al menú.", 175, 340);
     textSize(10);
     text("Nota: Escribir los nombres tal cual aparecen en el árbol.", 175, 370);
     text("Nota: Una vez realizada la búsqueda, regresar al menú.", 175, 385);
     textSize(15);
     searching = true;
     fill(255);
     textSize(10);
     break;
  }
 
}

/*
 *conteo()
 *
 *Función que muestra en pantalla la cuenta de vértices, hojas y altura del árbol.
 */
void conteo() { 
  fill(0);
  textSize(10);
  textAlign(RIGHT);
  text("Cantidad nodos: "+vertexCont+"      Cantidad hojas: "+leafCont+"      Altura del arbol: " +heightContGlobal, width - 10, height - 10); //Agregar heightCont
  textAlign(CENTER);
  fill(255);
}

/*
 *heightCont()
 *
 *Función que recibe un objeto de tipo vértice (hoja), y recorre el árbol de manera inversa hasta hallar la cantidad de vértices por las que pasó hasta llegar a la raíz.
 *Más adelante, el valor que devuelve la función nos permite comparar con las otras hojas hasta obtener la altura (la mayor cantidad devuelta de todas).
 */
int heightCont(Vertex vertex, int cont, int isVertexRoot) {
 Vertex vertexAux = null;
 
 //Si isVertexRoot == 1, significa que el vertice que recibe la función es la raíz, por lo tanto, termina la recursión.
 if (isVertexRoot == 1)  {
   return cont; 
 }
 else {
   
   //En caso contrario, compara el vértice recibido con el vertexChild de cada arista, y en caso de que coincidan, se lleva a cabo la función nuevamente, enviándole el vertexRoot de la arista.
   for (int i = 0; i < myEdges.size(); i++) {
    if (myEdges.get(i).vertexChild.equals(vertex)) {
      cont += 1;
      vertexAux = myEdges.get(i).vertexRoot;
    }
  }
  if (vertexAux == null) {
      return cont;
    }
    else {
      return (heightCont(vertexAux, cont, 0));
    }
 }
}

/*
 *leafCont()
 *
 *Función que realiza el conteo de las hojas, haciendo uso de la matriz de adyacencia, de forma que acumula las filas, y en caso de ser igual a 0, significa que el vértice
 *correspondiente a esa fila esuna hoja.
 */
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
 println("Altura del arbol: ", heightContGlobal);
 println("MATRIZ ADYACENCIA");
 for (int i = 0; i < myVertex.size(); i++) {
  for (int j = 0; j < myVertex.size(); j++) {
    print(adjacencyArray[i][j] + " ");
  }
  println(" ");
 }
 
 return leafCont;
}

void keyPressed() {
  if (searching == true) {
     searchingVertex();
  }
 switch(key) {
   case '1':
     opcion = 1;
     break;
   case '2':
     opcion = 2;
     break;
   case '3':
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
   //Se pintan los vértices y aristas en su color predeterminado.
     for (int i = 0; i < myVertex.size(); i++) {
       myVertex.get(i).isHighlighted(false); 
       myVertex.get(i).display(mouseX, mouseY);
     }
     for (int i = 0; i < myEdges.size(); i++) {
       myEdges.get(i).paintPath(false); 
     }
     opcion = 0;
     break;

 }
}

/*
 *searchingVertex()
 *
 *Función que recibe el nombre del vértice a encontrar, lo imprime en la pantalla, y al presionar ENTER realiza la búsqueda y coloreado de la ruta desde la raíz hasta el
 *vertice a localizar (en caso afirmativo).
 *Para la localización de los vértices se lleva a cabo una función recursiva.
 */
void searchingVertex() {
 if (searchVertex.get(0).vertexName == " ") {
   searchVertex.get(0).vertexName = "";
 }
 if (searching == true) {
   fill(0);
   textSize(15);
   textAlign(CENTER);
   text(searchVertex.get(0).vertexName, 175, 270);
   fill(255);
   textSize(10);
   if (keyCode == ENTER) {
     searchPathTo.clear();     
     println("Estás buscando: " + searchVertex.get(0).vertexName);
     pathTo.clear();
     findPath(myVertex.get(0), searchVertex.get(0));     
     coloring();
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

/*
 *findPath()
 *
 *Función que recibe un objeto de tipo Vertex, así como el vértice donde está almacenado el nombre del vértice a buscar. En un arreglo de arreglos de tipo Vertex se almacenan los vértices
 *del recorrido realizado desde el vértice a buscar hasta la raíz.
 */
void findPath(Vertex vertex, Vertex searchVertex) {
  vertex.father = null;
  
  //Compara cada uno de los vértices predeterminados con el vértice a localizar, y en caso afirmativo, almacena el vértice en una lista.
  for(int i = 0; i < myVertex.size(); i++){
    if(myVertex.get(i).vertexName.equals(searchVertex.vertexName)){
      searchPathTo.add(myVertex.get(i));
    }
  }
  
  //Se almacenan solo los vértices y la ruta correspondiente al vértice a localizar (desde la raíz hasta ese vértice).
  for(int i = 0; i < searchPathTo.size(); i++){    
    ArrayList<Vertex> path = new ArrayList<Vertex>();
    Vertex current = searchPathTo.get(i);
    while(current.father != null){
      path.add(current);
      //println(path.size());
      current = current.father;
    }
    pathTo.add(path);
  }
}

/*
 *coloring()
 *
 *Función que pinta los vértices y aristas correspondientes a la ruta desde la raíz hasta el vértice a localizar.
 */
void coloring(){
  //Se comparan los vértices de la lista "localizar" con los vértices predeterminados, y en caso afirmativo se pintan.
  for(int k = 0; k < pathTo.size(); k++){
    pathTo.get(k).add(myVertex.get(0));
    for (int i = 0; i < pathTo.get(k).size(); i++) {        
      pathTo.get(k).get(i).isHighlighted(true);  
      println("Estás pintando: ", pathTo.get(k).get(i).vertexName);
      //Se comparan los vertexChild de las aristas con los vértices de la lista "localizar" para pintarlas en caso afirmativo.
      for (int j = 0; j < myEdges.size(); j++) {
        if (myEdges.get(j).vertexChild.equals(pathTo.get(k).get(i))) {
          myEdges.get(j).paintPath(true);
        }
      }
    }     
  }
}
