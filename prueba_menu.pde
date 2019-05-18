int estado=0;
int x,y,r1,r2, x_1,y_1;
PImage img;

void setup() {
  size(1250, 575); 
  background(255);  
  img = loadImage("map.png");
}

void draw() { 
  switch(estado){
    case 0:
      background(255);
      fill(0); 
   
      textAlign(LEFT);
      text("1. Grafo",(width/2) - 30,220); 
   
      break;
    case 1:     
      background(255);
      image(img, 351, 0);
      fill(100);
      x=50;
      y=50;
      r1=10;
      r2=10;
      x_1=150;
      y_1=150;
      drawArrow(mouseX,mouseY,x_1,y_1); 
      ellipse(mouseX,mouseY,r1*2,r2*2);
      ellipse(x_1,y_1,r1*2,r2*2);
      fill(50,50,255);
      text("v1",x+r1*2,y+r2*2);
      text("v2",x_1+r1*2,y_1+r2*2);
      fill(0);
      textAlign(CENTER);
      text("5. Regresar a Menu",width/2,340);
  }
  
}

void keyPressed() {
switch(key) {
  case '1': 
    estado=1;  // Does not execute
    break;
  case '5':
    estado= 0;
    break;
  }
}



//Para dibujar la flecha de la arista dirigida
int[] arrowhead = {0,-4,0,4,7,0};
  void drawArrow(int x, int y, int ox, int oy)
  {
    int dx=ox-x;
    int dy=oy-y;
    float angle = getDirection(dx,dy);
    float vl = sqrt(dx*dx+dy*dy) - sqrt(r1*r1+r2*r2)*1.5;
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
