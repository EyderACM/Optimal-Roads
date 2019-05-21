import java.util.*;

int estado=0;
PImage img;
Boolean firstFound = false;
Boolean onCreateRoad = false;
Boolean nombrando = false;
Boolean visitedEntity = false;
Entity firstEntityForRoad = null;
Entity secondEntityForRoad = null;

ArrayList<Entity> myEntities = new ArrayList<Entity>(); 
Entity merida, progreso, ixil, chicxulubPueblo, conkal, ucu, uman, mococha, 
baca, yaxkukul, tixkokob, tixpehual, kanasin, acanceh, cuzama, homun, tecoh, abala, 
hunucma, telcachillo, tahmek, sisal;

ArrayList<Road> myRoads = new ArrayList<Road>();
Road meridaUman, meridaUcu, meridaProgreso, meridaConkal, meridaKanasin, meridaTixpehual, umanAbala, conkalChicxulub,
conkalMococha, conkalYaxkukul, mocochaBaca, mocochaIxil,chicxulubIxil, tixpehualYaxkukul, tixpehualTixkokob, bacaYaxkukul,
kanasinAcanceh, acancehTecoh, acancehCuzama, cuzamaHomun, hunucmaUcu, hunucmaUman, telcachilloTecoh,
telcachilloAbala, progresoChicxulub, homunTahmek, meridaTahmek, tahmekTixkokob, sisalProgreso, hunucmaSisal;

void setup() {
  size(1250, 575); 
  background(255); 
  frameRate(60);
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
  myEntities.add(cuzama = new Entity(962, 460, "Cuzamá"));
  myEntities.add(homun = new Entity(985, 470, "Homún"));
  myEntities.add(tecoh = new Entity(850, 460, "Tecoh"));
  myEntities.add(abala = new Entity(680, 535, "Abalá"));
  myEntities.add(hunucma = new Entity(555, 250, "Hunucmá"));
  myEntities.add(telcachillo = new Entity(850, 540, "Tecachillo"));
  myEntities.add(tahmek = new Entity(1000, 360, "Tahmek"));
  myEntities.add(sisal = new Entity(445, 130, "Sisal"));
   
  myRoads.add(meridaUman = new Road(merida, uman));
  myRoads.add(meridaUcu = new Road(merida, ucu));
  myRoads.add(meridaConkal = new Road(merida, conkal));
  myRoads.add(meridaProgreso = new Road(merida, progreso));
  myRoads.add(meridaKanasin = new Road(merida, kanasin));
  myRoads.add(meridaTixpehual = new Road(merida, tixpehual));
  myRoads.add(umanAbala = new Road(uman, abala));
  myRoads.add(conkalChicxulub = new Road(conkal, chicxulubPueblo));
  myRoads.add(conkalMococha = new Road(conkal, mococha));
  myRoads.add(conkalYaxkukul = new Road(conkal, yaxkukul));
  myRoads.add(mocochaBaca = new Road(mococha, baca));
  myRoads.add(mocochaIxil = new Road(mococha, ixil));
  myRoads.add(chicxulubIxil = new Road(chicxulubPueblo, ixil));
  myRoads.add(tixpehualYaxkukul = new Road(tixpehual, yaxkukul));
  myRoads.add(tixpehualTixkokob = new Road(tixpehual, tixkokob));
  myRoads.add(tixpehualTixkokob = new Road(baca, yaxkukul));
  myRoads.add(kanasinAcanceh = new Road(kanasin, acanceh));
  myRoads.add(acancehTecoh = new Road(acanceh, tecoh));
  myRoads.add(acancehCuzama = new Road(acanceh, cuzama));
  myRoads.add(cuzamaHomun = new Road(cuzama, homun));
  myRoads.add(hunucmaUcu = new Road(hunucma, ucu));
  myRoads.add(hunucmaUcu = new Road(hunucma, uman));
  myRoads.add(telcachilloTecoh = new Road(telcachillo, tecoh));
  myRoads.add(telcachilloAbala = new Road(telcachillo, abala));
  myRoads.add(progresoChicxulub = new Road(progreso, chicxulubPueblo));
  myRoads.add(homunTahmek = new Road(homun, tahmek));
  myRoads.add(homunTahmek = new Road(merida, tahmek));
  myRoads.add(tahmekTixkokob = new Road(tahmek, tixkokob));
  myRoads.add(sisalProgreso = new Road(sisal, progreso));
  myRoads.add(hunucmaSisal = new Road(hunucma, sisal));
}

void draw() { 
      background(255);
      image(img, 351, 0);    

       /* Creando carreteras entre municipios*/
      for(int i = 0; i < myRoads.size(); i++){
        if(estado != 5){
          myRoads.get(i).paintLine(false);
        }
        myRoads.get(i).drawLine();
      }
      
      /* Creando Municipios de la zona Noroeste de Yucatán */
      for(int i = 0; i < myEntities.size(); i++){             
        myEntities.get(i).display(15);
        switch(estado){
          case 2:
          case 4:
          case 5:
            myEntities.get(i).isHighlighted(false);
            myEntities.get(i).isColored(false);
            break;
          case 3:
            myEntities.get(i).isHighlighted(true);
            break;
          case 6:
            break;
          default:
            myEntities.get(i).isHighlighted(false);
            myEntities.get(i).isClicked(false);      
            myEntities.get(i).isColored(false);
            myEntities.get(i).entityColor = -1;
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
      text("6.- Coloreado de grafos", 175.5, 440);
      textAlign(CENTER);
      break;
    case 1:
      pushStyle();
      fill(0);      
      textSize(15);
      text("1.- Simular municipio", 175.5, 240);
      text("Clickea sobre el lugar donde deseas", 175.5, 350);
      text("agregar el municipio", 175.5, 380);
      text("Presiona Enter para salvar el nombre", 175.5, 410);
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
      text("Clickea los municipios que unen", 175.5, 250);
      text("la carretera que deseas borrar", 175.5, 280);
      popStyle();
      break;
    case 5:
      pushStyle();
      fill(0);      
      textSize(15);    
      text("5.- Ruta más corta", 175.5, 360);
      text("Selecciona el municipio del que partirás", 175.5, 250);
      text("y al que llegarás", 175.5, 280);
      text("(Solo con municipios enlazados)", 175.5, 310);
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
      if(onCreateRoad){
        pushStyle();
        stroke(255);
        strokeWeight(2);
        line(firstEntityForRoad.posX, firstEntityForRoad.posY, mouseX, mouseY);
        popStyle();        
      }      
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
      onCreateRoad = true;
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
      onCreateRoad = false;
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
        boolean isFirstPlace = myRoads.get(j).firstPlace == toBeDeleted;
        boolean isSecondPlace = myRoads.get(j).secondPlace == toBeDeleted;
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

void nameEntity(Entity myEntity){
  if(myEntity.name == "Nombre"){
    myEntity.name = "";
  }
  if(nombrando){    
    if(keyCode ==  ENTER){
      nombrando = false;
    }  
    if(keyCode == BACKSPACE && myEntity.name.length() > 0){
      myEntity.name = myEntity.name.substring(0, myEntity.name.length()-1);
    }    
    if((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z')){
      myEntity.name += str(key);   
    }
  }
}

void mouseClicked(){
  switch(estado){
    case 1:
      Entity myEntity = new Entity(mouseX, mouseY, "Nombre");
      myEntities.add(myEntity);
      nombrando = true;  
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
    case 5:
      dijkstraManager();
      break;
  } 
}


void keyPressed() {
  if(nombrando){
    nameEntity(myEntities.get(myEntities.size() - 1));
  }
  switch(key) {
    case '1': 
      estado=1;      
      break;
    case '2': 
      estado=2;  // Prints "One"
      firstEntityForRoad = null;
      secondEntityForRoad = null;
      firstFound = false;
      onCreateRoad = false;
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
    case '5':
      estado = 5;
      firstEntityForRoad = null;
      secondEntityForRoad = null;      
      firstFound = false;
      onCreateRoad = false;
      break;
    case '6':
      estado = 6;
      graphColoring();
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

void dijkstraManager(){
  for(int i = 0; i < myEntities.size(); i++){
    float dist = dist(mouseX, mouseY, myEntities.get(i).posX, myEntities.get(i).posY);
    if(dist < 15 && !firstFound){
      firstEntityForRoad = myEntities.get(i);
      firstEntityForRoad.isClicked(true);
      firstFound = true;
      onCreateRoad = true;
    } else if(dist < 15 && firstFound){      
      secondEntityForRoad = myEntities.get(i);
      secondEntityForRoad.isClicked(true);
    }
    if(firstEntityForRoad != null && secondEntityForRoad != null && firstEntityForRoad != secondEntityForRoad){
      dijkstra(firstEntityForRoad);
      secondEntityForRoad.shortestPath.add(secondEntityForRoad);
      int isBigger = (secondEntityForRoad.shortestPath.size() > 1) ? 1 : 0;
      for(int j = 0; j < secondEntityForRoad.shortestPath.size() - isBigger; j++){
        for(int k = 0; k < myRoads.size(); k++){
          boolean firstThenSecond = myRoads.get(k).firstPlace == secondEntityForRoad.shortestPath.get(j) && myRoads.get(k).secondPlace == secondEntityForRoad.shortestPath.get(j+1);
          boolean secondThenFirst = myRoads.get(k).firstPlace == secondEntityForRoad.shortestPath.get(j+1) && myRoads.get(k).secondPlace == secondEntityForRoad.shortestPath.get(j);
          if(firstThenSecond || secondThenFirst){
            myRoads.get(k).paintLine(true);
          }
        }
      }
      firstFound = false;       
      firstEntityForRoad.isClicked(false);
      secondEntityForRoad.isClicked(false);
    }
  }
}

void clearAllEntities(){
  for(int i = 0; i < myEntities.size(); i++){
    myEntities.get(i).shortestPath.clear();
    myEntities.get(i).distance = Integer.MAX_VALUE; 
  }
}

void dijkstra (Entity start){
  clearAllEntities();
  start.setDistance(0);
  
  Set<Entity> settledEntities = new HashSet<Entity>();
  Set<Entity> unsettledEntities = new HashSet<Entity>();
  
  unsettledEntities.add(start);
  
  while(unsettledEntities.size() != 0){
    Entity currentEntity = getLowestDistanceEntity(unsettledEntities);
    unsettledEntities.remove(currentEntity);
    for(Map.Entry <Entity, Float> adjacencyPair : currentEntity.getAdjacentEntities().entrySet()){
      Entity adjacentEntity = adjacencyPair.getKey();
      Float neighborDistance = adjacencyPair.getValue();
      if(!settledEntities.contains(adjacentEntity)){
        calculateMinimumDistance(adjacentEntity, neighborDistance, currentEntity);
        unsettledEntities.add(adjacentEntity);
      }
    }  
    settledEntities.add(currentEntity);
  }
}

Entity getLowestDistanceEntity(Set < Entity > unsettledEntities){
  Entity lowestDistanceEntity = null;
  float lowestDistance = 100000;
  for(Entity entity : unsettledEntities){
    float entityDistance = entity.distance;
    if(entityDistance < lowestDistance){
      lowestDistance = entityDistance;
      lowestDistanceEntity = entity;
    }
  }
  return lowestDistanceEntity;
}

void calculateMinimumDistance(Entity evaluationEntity, Float neighborDistance, Entity sourceEntity){
  Float sourceDistance = sourceEntity.distance;
  if(sourceDistance + neighborDistance < evaluationEntity.distance){
    evaluationEntity.setDistance(sourceDistance + neighborDistance);
    LinkedList<Entity> shortestPath = new LinkedList<Entity>(sourceEntity.shortestPath);
    shortestPath.add(sourceEntity);
    evaluationEntity.shortestPath = shortestPath;
  }
}

void graphColoring(){
  for(int i = 0; i < myEntities.size(); i++){
    myEntities.get(i).entityColor = -1;    
  }
  ArrayList<Integer> available = new ArrayList<Integer>();
  available.add(0);
  myEntities.get(0).entityColor = 0;
  int colors = 1;
  
  for(int i = 0; i < myEntities.size(); i++){
    ArrayList<Integer> toCheck = available;
    for(Map.Entry<Entity, Float> entry : myEntities.get(i).goesTo.entrySet()){
      if(toCheck.contains(entry.getKey().entityColor)){
        toCheck.remove(toCheck.indexOf(entry.getKey().entityColor));
      }  
    }
    if(toCheck.size() > 0){
      myEntities.get(i).entityColor = toCheck.get(0);
    }else {
      available.add(colors);
      colors++;
      myEntities.get(i).entityColor = colors;    
    }
    myEntities.get(i).isColored(true);
  }    
}
