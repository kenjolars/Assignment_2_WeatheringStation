PImage cloud;

Cloud[] clouds = new Cloud[5];

void setup(){
  size(1600,900);
  cloud = loadImage("Cloud.png");
  
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud(100+i*100, 300, random(36,72));
  }
  
}

void draw(){
  background(255);
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].display();
  }
}
