PImage img;
float scale = 1;
float xPan = 400;
float yPan = 300;
boolean zoomIn = false;
boolean zoomOut = false;
float zoomSpeed = 1.05;

void setup(){
  size(800,700,P2D);
}

void draw(){
  translate(width/200, height/200);
  scale(scale);
  //translate(-xPan,-yPan);
  translate(-width/100, -height/100);
  background(255);
  img = loadImage("australia.png");
  image(img, 0, 0, width/1, height/1);
  if(zoomIn){
    scale *= zoomSpeed;
  }
  if(zoomOut){
    scale /= zoomSpeed;
  }
}


void mousePressed(){
  if (mouseButton == LEFT){
    zoomIn = true;
    zoomOut = false;
  }
  
  else if (mouseButton == RIGHT){
    zoomOut = true;
    zoomIn = false;
  }
}

void mouseReleased(){
  if (mouseButton == LEFT){
    zoomIn = false;
  }
  
  else if (mouseButton == RIGHT){
    zoomOut = false;
  }
}
