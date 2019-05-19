int estado=0;
PImage img;

ArrayList<Entity> myEntities = new ArrayList<Entity>(); 
Entity merida, progreso, ixil, chicxulubPueblo, conkal, ucu, uman, mococha, 
baca, yaxkukul, tixkokob, tixpehual, kanasin, acanceh, timucuy, seye, cuzama, homun, tecoh, abala;

ArrayList<Road> myRoads = new ArrayList<Road>();
Road meridaUman;

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
  
}

void draw() { 
      background(255);
      image(img, 351, 0);
      /* Creando Municipios de la zona Noroeste de Yucatán */
      for(int i = 0; i < myEntities.size(); i++){
        myEntities.get(i).display(15);
      }
      
      for(int i = 0; i < myRoads.size(); i++){
        myRoads.get(i).drawLine();
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

//Para dibujar la flecha de la arista dirigida
int[] arrowhead = {0,-4,0,4,7,0};
  void drawArrow(int x, int y, int ox, int oy)
  {
    int dx=ox-x;
    int dy=oy-y;
    float angle = getDirection(dx,dy);
    float vl = sqrt(dx*dx+dy*dy) - sqrt(10*10+10*10)*1.5;
    int[] end = rotateCoordinate(vl, 0, angle);
    line(x,y,x+end[0],y+end[1]);
    drawArrowHead(x+end[0], y+end[1], angle);
  }
  void drawArrowHead(int ox, int oy, float angle) {
    int[] rc1 = rotateCoordinate(arrowhead[0], arrowhead[1], angle);
    int[] rc2 = rotateCoordinate(arrowhead[2], arrowhead[3], angle);
    int[] rc3 = rotateCoordinate(arrowhead[4], arrowhead[5], angle);
    int[] narrow = {ox+ rc1[0], oy+ rc1[1], ox+ rc2[0], oy+ rc2[1], ox+ rc3[0], oy+ rc3[1]};
    stroke(0);
    fill(255);
    triangle(narrow[0], narrow[1], narrow[2], narrow[3], narrow[4], narrow[5]);
  }
  
  // universal helper function: get the angle (in radians) for a particular dx/dy
float getDirection(double dx, double dy) {
  // quadrant offsets
  double d1 = 0.0;
  double d2 = PI/2.0;
  double d3 = PI;
  double d4 = 3.0*PI/2.0;
  // compute angle basd on dx and dy values
  double angle = 0;
  float adx = abs((float)dx);
  float ady = abs((float)dy);
  // Vertical lines are one of two angles
  if(dx==0) { angle = (dy>=0? d2 : d4); }
  // Horizontal lines are also one of two angles
  else if(dy==0) { angle = (dx>=0? d1 : d3); }
  // The rest requires trigonometry (note: two use dx/dy and two use dy/dx!)
  else if(dx>0 && dy>0) { angle = d1 + atan(ady/adx); }    // direction: X+, Y+
  else if(dx<0 && dy>0) { angle = d2 + atan(adx/ady); }    // direction: X-, Y+
  else if(dx<0 && dy<0) { angle = d3 + atan(ady/adx); }    // direction: X-, Y-
  else if(dx>0 && dy<0) { angle = d4 + atan(adx/ady); }    // direction: X+, Y-
  // return directionality in positive radians
  return (float)(angle + 2*PI)%(2*PI); }

// universal helper function: rotate a coordinate over (0,0) by [angle] radians
int[] rotateCoordinate(float x, float y, float angle) {
  int[] rc = {0,0};
  rc[0] = (int)(x*cos(angle) - y*sin(angle));
  rc[1] = (int)(x*sin(angle) + y*cos(angle));
  return rc; }
