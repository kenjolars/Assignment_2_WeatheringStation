PImage cloud;
Table windDirection;
int index = 0;
float speed = 15;

Drops d[];

Cloud[] clouds = new Cloud[10];

void setup(){
  size(1600,900);
  noStroke();
  d=new Drops[500];
  for(int r = 0; r < 500; r++){
    d[r] = new Drops();
  }
  
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
  background(135,206,235);
  fill(126,200,80);
  rect(0,600,1650,350);
  fill(0,10);
  rect(0,0,width,height);
  for(int r = 0; r < 500; r++){
    
      if(d[r].y>d[r].endPos){
        d[r].end();
      }
      else
          d[r].display();   
  } 
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].display();
  }
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].move(speed);
  }
  println(speed);
}

class Drops{
  float x,y,speed;
  float ellipseX, ellipseY, endPos;
  color c;
  Drops(){
    init();
  }
  
  void init(){
     x = random(width);
    y = random(-300,0);
    speed = random(5,10);
    c = color(28,98,215);
    ellipseX = 0;
    ellipseY = 0;
    endPos = height-(random(280));
  }
  
  void update(){
    y+=speed;
  }
  
  void display(){
    fill(c);
    noStroke();
    rect(x,y,2,15);
    update();
  }
  
  void end(){
    stroke(c);
    noFill();
    ellipse(x,y,ellipseX,ellipseY);
    
    ellipseY+=speed * 0.2;
    ellipseX+=speed * 0.5;
    if(ellipseX>50)
      init();
  }//when drop touches the ground
}
