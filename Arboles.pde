import java.util.Scanner;

ArrayList<Integer> pos_vertice_X = new ArrayList<Integer>();
ArrayList<Integer> pos_vertice_Y = new ArrayList<Integer>();
//ArrayList<String> nombre_vertice = new ArrayList<String>();

//Propiedades de los vertices.
int tamano_vertice = 50;

//Propiedades de las aristas.

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
  mover_vertice();
}

void keyPressed() {
}

void imprimir_vertice() { 
 int seleccionar_vertice;
    for (int i = 0; i < pos_vertice_X.size(); i++) {
     seleccionar_vertice = 0;
     if (dist(mouseX, mouseY, pos_vertice_X.get(i), pos_vertice_Y.get(i)) < tamano_vertice/2) {
      seleccionar_vertice = tamano_vertice/2;
     }
    ellipse(pos_vertice_X.get(i), pos_vertice_Y.get(i), tamano_vertice + seleccionar_vertice, tamano_vertice + seleccionar_vertice); 
   }
}
void agregar_vertice() {
 boolean agregar = true;
 if (mouseButton == LEFT) {
   if (pos_vertice_X.size() == 0) {
     ellipse(mouseX, mouseY, tamano_vertice, tamano_vertice);
        pos_vertice_X.add(mouseX);
        pos_vertice_Y.add(mouseY);
   }
   else
   {
     for (int i = 0; i < pos_vertice_X.size(); i++) {
      if (dist(mouseX, mouseY, pos_vertice_X.get(i), pos_vertice_Y.get(i)) < tamano_vertice/2) {
        agregar = false;
      }
     }
      if (agregar == true) {
        ellipse(mouseX, mouseY, tamano_vertice, tamano_vertice);
        pos_vertice_X.add(mouseX);
        pos_vertice_Y.add(mouseY);
      }
   }
 }
}



void eliminar_vertice() {
  for (int i = 0; i < pos_vertice_X.size(); i++) {
    if (mouseButton == RIGHT && dist(mouseX, mouseY, pos_vertice_X.get(i), pos_vertice_Y.get(i)) < tamano_vertice/2) {
      pos_vertice_X.remove(i);
      pos_vertice_Y.remove(i);
      break;
    }
  }
}

void mover_vertice() {
  if (mouseButton == LEFT) {
    for (int i = 0; i < pos_vertice_X.size(); i++) {
      if (mouseButton == LEFT && dist(mouseX, mouseY, pos_vertice_X.get(i), pos_vertice_Y.get(i)) < tamano_vertice/2) {
        pos_vertice_X.remove(i);
        pos_vertice_Y.remove(i);
        pos_vertice_X.add(mouseX);
        pos_vertice_Y.add(mouseY);
        break;
      }
    }
  }
}
