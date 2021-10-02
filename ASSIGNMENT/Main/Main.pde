PImage cloud;
Table windSpeed;
Table airTemp;
int indexWind = 0;
int indexAir = 0;
float temp;
float speed;

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
  
  airTemp = loadTable("Air Temperature.csv");
  
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud();
  }
  
}

void draw(){
  if(indexWind < windSpeed.getRowCount()) {
    speed = windSpeed.getInt(indexWind,1);
    indexWind++;
  }else{
    indexWind = 0;
  }
  if(indexAir < airTemp.getRowCount()) {
    temp = airTemp.getInt(indexAir,1);
    indexAir++;
  }else{
    indexAir = 0;
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
  //for (int i = 0; i < clouds.length; i++) {
  //  clouds[i].display();
  //}
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].display();
    clouds[i].move(speed);
    clouds[i].air(temp);
  }
  //println(speed);
  //println(temp);
}
