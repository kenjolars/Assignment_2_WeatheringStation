public class Cloud {
  float x;
  
  float y;
  
  PImage cloud;
  
  Cloud(){
    cloud = loadImage("Cloud.png");
    x = random(-100,1400);
    y = random(5,250);
    

  }
  
  void display() {
    //move(speed);
    imageMode(CENTER);
    image(cloud,x,y);
    if(x > 1800) {
      x = -200;
      x = random(x);
    }
    
      
    //image(cloud,random(100,1500),random(250));
    //noLoop();
  }
  
  void move(float speed){
    //y += 100;
    x += speed/50;
  }
}
