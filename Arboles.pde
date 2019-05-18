import java.util.Scanner;

ArrayList<Integer> pos_vertice_X = new ArrayList<Integer>();
ArrayList<Integer> pos_vertice_Y = new ArrayList<Integer>();
ArrayList<String> nombre_vertice = new ArrayList<String>();

//Propiedades de los vertices.
int tamano_vertice = 20;
int seleccionar_vertice = 0;
boolean agregando_vertice = false;
boolean eliminando_vertice = false;
boolean moviendo_vertice = false;
boolean seleccionando_vertice = false;
boolean nombrando_vertice = false;

//Propiedades de las aristas.
boolean agregando_arista = false;
boolean eliminando_arista = false;
boolean seleccionando_arista = false;

void setup() {
  size(1024, 576);
  frameRate(60);
  strokeWeight(2);
}

void draw() {
  background(255);
 imprimir_vertice();
 //imprimir_arista();
 //imprimir_nombres();
}

void mousePressed() {
 agregar_vertice();
 eliminar_vertice(); 
}

void mouseDragged() {
  //mover_vertice();
}

void keyPressed() {
 eliminar_vertice(); 
}

void imprimir_vertice() { 
 int seleccionar_vertice;
   if (pos_vertice_X.size() > 0) {
    for (int i = 0; i < pos_vertice_X.size(); i++) {
     seleccionar_vertice = 0;
     if (dist(mouseX, mouseY, pos_vertice_X.get(i), pos_vertice_Y.get(i)) < tamano_vertice/2) {
      seleccionar_vertice = tamano_vertice/2;
     }
    ellipse(pos_vertice_X.get(i), pos_vertice_Y.get(i), tamano_vertice + seleccionar_vertice, tamano_vertice + seleccionar_vertice); 
   }
 }
}
void agregar_vertice() {
 //String nombre_vertice_aux;
 if (mouseButton == LEFT) {
  agregando_vertice = true;
  ellipse(mouseX, mouseY, tamano_vertice, tamano_vertice);
  pos_vertice_X.add(mouseX);
  pos_vertice_Y.add(mouseY);
  //Scanner teclado = new Scanner(System.in);
  //nombre_vertice_aux = teclado.nextLine();
  //nombre_vertice.add(nombre_vertice_aux);
  //textAlign(CENTER, CENTER);
  //textSize(16);
  //text(nombre_vertice.get(0), pos_vertice_X.get(0), pos_vertice_Y.get(0));
 }
}



void eliminar_vertice() {
  for (int i = 0; i < pos_vertice_X.size(); i++) {
    if (mouseButton == RIGHT && dist(mouseX, mouseY, pos_vertice_X.get(i), pos_vertice_Y.get(i)) < tamano_vertice/2) {
      pos_vertice_X.remove(i);
      pos_vertice_Y.remove(i);
      nombre_vertice.remove(i);
    }
  }
}
