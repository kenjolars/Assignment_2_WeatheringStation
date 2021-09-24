class Cloud {
  float x;
  float y;

  
  PImage cloud;
  
  Cloud(float tempX, float tempY){
    x = tempX;
    y = tempY;

  }
  
  void display() {
    stroke(0);
    fill(0);
    imageMode(CENTER);
    image(cloud,x,y);
  }
}
