int estado=0;
PImage img;
Boolean firstFound = false;
Entity firstEntityForRoad = null;
Entity secondEntityForRoad = null;

ArrayList<Entity> myEntities = new ArrayList<Entity>(); 
Entity merida, progreso, ixil, chicxulubPueblo, conkal, ucu, uman, mococha, 
baca, yaxkukul, tixkokob, tixpehual, kanasin, acanceh, timucuy, seye, cuzama, homun, tecoh, abala;

ArrayList<Road> myRoads = new ArrayList<Road>();
Road meridaUman, meridaUcu, meridaProgreso, meridaConkal, meridaKanasin, meridaTixpehual, umanAbala, conkalChicxulub,
conkalMococha, conkalYaxkukul, mocochaBaca, mocochaIxil,chicxulubIxil, tixpehualYaxkukul, tixpehualTixkokob, bacaYaxkukul,
kanasinAcanceh, acancehTimucuy, acancehTecoh, acancehSeye, acancehCuzama, cuzamaHomun;

void setup() {
  size(1250, 575); 
  background(255);  
  img = loadImage("map.png");
  myEntities.add(merida = new Entity(735, 280, "Mérida"));
  myEntities.add(progreso = new Entity(712, 47, "Progreso"));
  myEntities.add(ixil = new Entity(842, 140, "Ixil"));
  myEntities.add(chicxulubPueblo = new Entity(814, 155, "Chicxulub"));
  myEntities.add(conkal = new Entity(814, 210, "Conkal"));
  myEntities.add(ucu = new Entity(650, 238, "Ucú"));
  myEntities.add(uman = new Entity(650, 350, "Umán"));
  myEntities.add(mococha = new Entity(859, 175, "Mocochá"));
  myEntities.add(baca = new Entity(900, 175, "Baca"));
  myEntities.add(yaxkukul = new Entity(885, 215, "Yaxkukul"));
  myEntities.add(tixkokob = new Entity(907, 260, "Tixkokob"));
  myEntities.add(tixpehual = new Entity(875, 277, "Tixpéhual"));
  myEntities.add(kanasin = new Entity(780, 315, "Kanasín"));
  myEntities.add(acanceh = new Entity(860, 412, "Acanceh"));
  myEntities.add(timucuy = new Entity(815, 412, "Timucuy"));
  myEntities.add(seye = new Entity(917, 387, "Seyé"));
  myEntities.add(cuzama = new Entity(962, 460, "Cuzamá"));
  myEntities.add(homun = new Entity(985, 470, "Homún"));
  myEntities.add(tecoh = new Entity(850, 460, "Tecoh"));
  myEntities.add(abala = new Entity(680, 535, "Abalá"));
   
  myRoads.add(meridaUman = new Road(merida, uman, 30));
  myRoads.add(meridaUcu = new Road(merida, ucu, 30));
  myRoads.add(meridaConkal = new Road(merida, conkal, 70));
  myRoads.add(meridaProgreso = new Road(merida, progreso, 60));
  myRoads.add(meridaKanasin = new Road(merida, kanasin, 30));
  myRoads.add(meridaTixpehual = new Road(merida, tixpehual, 30));
  myRoads.add(umanAbala = new Road(uman, abala, 20));
  myRoads.add(conkalChicxulub = new Road(conkal, chicxulubPueblo, 10));
  myRoads.add(conkalMococha = new Road(conkal, mococha, 15));
  myRoads.add(conkalYaxkukul = new Road(conkal, yaxkukul, 15));
  myRoads.add(mocochaBaca = new Road(mococha, baca, 20));
  myRoads.add(mocochaIxil = new Road(mococha, ixil, 6));
  myRoads.add(chicxulubIxil = new Road(chicxulubPueblo, ixil, 15));
  myRoads.add(tixpehualYaxkukul = new Road(tixpehual, yaxkukul, 20));
  myRoads.add(tixpehualTixkokob = new Road(tixpehual, tixkokob, 12));
  myRoads.add(tixpehualTixkokob = new Road(baca, yaxkukul, 7));
  myRoads.add(kanasinAcanceh = new Road(kanasin, acanceh, 20));
  myRoads.add(acancehTimucuy = new Road(acanceh, timucuy, 20));
  myRoads.add(acancehTecoh = new Road(acanceh, tecoh, 15));
  myRoads.add(acancehSeye = new Road(acanceh, seye, 20));
  myRoads.add(acancehCuzama = new Road(acanceh, cuzama, 25));
  myRoads.add(cuzamaHomun = new Road(cuzama, homun, 10));
  
}

void draw() { 
      background(255);
      image(img, 351, 0);    

       /* Creando carreteras entre municipios*/
      for(int i = 0; i < myRoads.size(); i++){
        myRoads.get(i).drawLine();
      }
      
      /* Creando Municipios de la zona Noroeste de Yucatán */
      for(int i = 0; i < myEntities.size(); i++){             
        myEntities.get(i).display(15);
        switch(estado){
          case 2:
          case 4:            
            break;
          case 3:
            myEntities.get(i).isHighlighted(true);
            break;
          default:
            myEntities.get(i).isHighlighted(false);
            myEntities.get(i).isClicked(false);
        }                
      }    
      
      titulo();
      opciones();
      eleccion();
}

void titulo(){
  pushStyle();
  fill(0);      
  textSize(22);
  text("Rutas eficientes", 175.5, 100);
  textAlign(CENTER);
  popStyle();
  
  pushStyle();
  fill(0);      
  textSize(15);
  text("Zona Noroeste de Yucatán", 175.5, 130);
  textAlign(CENTER);
  popStyle();     
}

void opciones(){
  switch(estado){
    case 0:
      pushStyle();
      fill(0);      
      textSize(15);
      text("Presiona el número en su teclado", 175.5, 190);
      text("1.- Simular municipio", 175.5, 240);
      text("2.- Simular carretera", 175.5, 280);
      text("3.- Borrar municipio", 175.5, 320);
      text("4.- Borrar carretera", 175.5, 360);
      text("5.- Ruta más corta", 175.5, 400);
      text("6.- Algoritmo 2", 175.5, 440);
      textAlign(CENTER);
      break;
    case 1:
      pushStyle();
      fill(0);      
      textSize(15);
      text("1.- Simular municipio", 175.5, 240);
      popStyle();    
      break;
    case 2:
      pushStyle();
      fill(0);      
      textSize(15);    
      text("2.- Simular carretera", 175.5, 280);
      text("Clickea sobre los dos municipios", 175.5, 350);
      text("que deseas unir con una carretera", 175.5, 380);
      popStyle();
      break;
    case 3:
      pushStyle();
      fill(0);      
      textSize(15);    
      text("3.- Borrar municipio", 175.5, 320);
      text("Clickea sobre el municipio que", 175.5, 350);
      text("deseas borrar", 175.5, 380);
      popStyle();
      break;
    case 4:
      pushStyle();
      fill(0);      
      textSize(15);    
      text("4.- Borrar carretera", 175.5, 360);
      text("Clickea sobre la carretera que", 175.5, 250);
      text("deseas borrar", 175.5, 280);
      popStyle();
      break;
  }
}

void eleccion(){
  switch(estado){
    case 1:
      fill(204, 102, 0);
      ellipse(mouseX, mouseY, 15, 15);
      break;
    case 2:         
      break;
  }
}

void makeARoad(){  
  for(int i = 0; i < myEntities.size(); i++){
    float dist = dist(mouseX, mouseY, myEntities.get(i).posX, myEntities.get(i).posY);
    if(dist < 15 && !firstFound){
      firstEntityForRoad = myEntities.get(i);
      firstEntityForRoad.isClicked(true);
      firstFound = true;
    } else if(dist < 15 && firstFound){      
      secondEntityForRoad = myEntities.get(i);
      secondEntityForRoad.isClicked(true);
    }
    if(firstEntityForRoad != null && secondEntityForRoad != null && firstEntityForRoad != secondEntityForRoad){
      Road newRoad = new Road(firstEntityForRoad, secondEntityForRoad);         
      myRoads.add(newRoad);
      firstFound = false;
      firstEntityForRoad.isClicked(false);
      secondEntityForRoad.isClicked(false);
      estado = 0;
    }
  }       
}

void deleteEntity(){
  for(int i = 0; i < myEntities.size(); i++){
    float dist = dist(mouseX, mouseY, myEntities.get(i).posX, myEntities.get(i).posY);
    if(dist < 15){
      Entity toBeDeleted = myEntities.get(i);
      for(int j = 0; j < myRoads.size(); j++){
        println(j);
        boolean isFirstPlace = myRoads.get(j).firstPlace == toBeDeleted;
        boolean isSecondPlace = myRoads.get(j).secondPlace == toBeDeleted;
        println("is Merida with " + myRoads.get(j).secondPlace.name + " " + isFirstPlace);
        if(isFirstPlace || isSecondPlace){
          myRoads.remove(j);
          j = -1;
        }
      }
      myEntities.remove(i);
    }
    estado = 0;
  }
}

void deleteRoad(){
  for(int i = 0; i < myEntities.size(); i++){
    float dist = dist(mouseX, mouseY, myEntities.get(i).posX, myEntities.get(i).posY);
    if(dist < 15 && !firstFound){
      firstEntityForRoad = myEntities.get(i);
      firstEntityForRoad.isClicked(true);
      firstFound = true;
    } else if(dist < 15 && firstFound){      
      secondEntityForRoad = myEntities.get(i);
      secondEntityForRoad.isClicked(true);
    }
    if(firstEntityForRoad != null && secondEntityForRoad != null && firstEntityForRoad != secondEntityForRoad){
      for(int j = 0; j < myRoads.size(); j++){
        boolean firstThenSecond = myRoads.get(j).firstPlace == firstEntityForRoad && myRoads.get(j).secondPlace == secondEntityForRoad;
        boolean secondThenFirst = myRoads.get(j).firstPlace == secondEntityForRoad && myRoads.get(j).secondPlace == firstEntityForRoad;
        if(firstThenSecond || secondThenFirst){
          myRoads.remove(j);
        }
      }
      firstFound = false;
      firstEntityForRoad.isClicked(false);
      secondEntityForRoad.isClicked(false);
      estado = 0;
    }    
  }
}

void mouseClicked(){
  switch(estado){
    case 1:
      Entity myEntity = new Entity(mouseX, mouseY);
      myEntities.add(myEntity);      
      estado = 0;
      break;
    case 2:
      makeARoad();      
      break;
    case 3:
      deleteEntity();
      break;
    case 4:
      deleteRoad();
      break;
  }   
}


void keyPressed() {
  switch(key) {
    case '1': 
      estado=1;  // Does not execute
      break;
    case '2': 
      estado=2;  // Prints "One"
      firstEntityForRoad = null;
      secondEntityForRoad = null;
      firstFound = false;
      break;
    case '3':
      estado=3;     
      break;
    case '4':
      estado=4;
      firstEntityForRoad = null;
      secondEntityForRoad = null;      
      firstFound = false;
      break;
    case '0':
      estado=0;
      break;
      }
}

Entity findByName(ArrayList<Entity> entities,String name){
  Entity toBeFound = null;
  for(int i = 0; i < entities.size(); i++){
    if(entities.get(i).name == name){
      toBeFound = entities.get(i); 
      break;
    }
  }
  return toBeFound;
}
