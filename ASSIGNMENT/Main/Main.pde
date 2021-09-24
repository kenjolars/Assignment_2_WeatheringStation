PImage cloud;
Table windDirection;
int index = 0;
float speed;

Cloud[] clouds = new Cloud[10];

void setup(){
  size(1600,900);
  cloud = loadImage("Cloud.png");
  
  windDirection = loadTable("Wind Direction.csv");
  
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud();
  }
  
}

void draw(){
  if(index < windDirection.getRowCount()) {
    speed = windDirection.getInt(index,1);
    index++;
  }else{
    index = 0;
  }
  background(0);
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].display();
  }
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].move(speed);
  }
  println(speed);
}
