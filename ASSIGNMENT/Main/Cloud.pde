public class Cloud {
  float x;
  
  float y;
  
  //float red;
  //float blue;
  //float green;
  
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
    x += speed;
  }
  
  void air(float temp){
    image(cloud,x,y);
    tint(temp*10,temp*125);
    //red = temp*100;
    //blue = temp*20;
    //green = temp*0;
    //tint(red, blue, green);
  }
}
