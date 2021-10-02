PImage cloud;
Table windSpeed;
int index = 0;
float speed = 15;

//Drops d[];

Cloud[] clouds = new Cloud[10];

void setup(){
  size(1600,900);
  noStroke();
  //d=new Drops[500];
  //for(int r = 0; r < 500; r++){
    //d[r] = new Drops();
  //}
  
  cloud = loadImage("Cloud.png");
  
  windSpeed = loadTable("Inst. Wind Speed.csv");
  
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud();
  }
  
}

void draw(){
  if(index < windSpeed.getRowCount()) {
    speed = windSpeed.getInt(index,1);
    index++;
  }else{
    index = 0;
  }
  background(135,206,235);
  fill(126,200,80);
  rect(0,600,1650,350);
  //for(int r = 0; r < 500; r++){
  //    if(d[r].y>d[r].endPos){
  //      d[r].end();
  //    }else{
  //      d[r].display();   
  //    }
  //} 
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].display();
  }
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].move(speed);
  }
  println(speed);
}
