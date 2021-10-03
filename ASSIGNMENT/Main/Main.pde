import processing.sound.*;
PImage cloud;
Table windSpeed;
Table airTemp;
int indexWind = 0;
int indexAir = 0;
float temp;
float speed;
Drops d[];
Slider s1;
color sliderText = color(255);
InterfaceUI button;
SoundFile file;
SoundFile file1;
boolean normal = true;
boolean easy = false;
boolean max = false;

int rectX, rectY;      
int rectA, rectB; 
int rectP, rectQ; 
int rectSize = 25;    
int rect1Size = 25;
int rect2Size = 25;
color rectColor, rect1Color,rect2Color, baseColor;
color rectHighlight, rect1Highlight, rect2Highlight;
color currentColor;
boolean rectOver = false;
boolean rect1Over = false;
boolean rect2Over = false;

Cloud[] clouds = new Cloud[10];

void setup(){
  size(1600,900);
  noStroke();
  file = new SoundFile(this,"rain.mp3");
  file1= new SoundFile(this,"wind.mp3");
  rectColor = color(255);
  rectHighlight = color(25);
  rect1Color = color(255);
  rect1Highlight = color(25);
  rect2Color = color(255);
  rect2Highlight = color(25);
  baseColor = color(102);
  currentColor = baseColor;
  rectA = width/25+rectSize/2+10;
  rectB = height/20;
  rectP = width/25+rect1Size/2+10;
  rectQ = height/10;
  rectX = width/25+rect2Size/2+10;
  rectY = height/6;
  fill(0, 408, 612); 
  textAlign(CENTER, CENTER);
  textSize(25);
  ellipseMode(CENTER);
  
  d=new Drops[500];
  for(int r = 0; r < 500; r++){
    d[r] = new Drops();
  }
  
  cloud = loadImage("Cloud.png");
  
  windSpeed = loadTable("Inst. Wind Speed.csv");
  
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud();
  }
  
  airTemp = loadTable("Air Temperature.csv");
  
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud();
  }
  s1 = new Slider(100, 675, width/6, 16, 8);
  //UI
  button = new InterfaceUI();
  
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
  update(mouseX, mouseY);
  background(135,206,235);
  rect(0,600,1650,350);
    fill(0);
  text("Air Temperature", width/25+rectSize/2+150, height/16);
  text("Wind Speed", width/25+rectSize/2+120, height/9);
  text("Rain Drops", width/25+rectSize/2+120, height/6);

  if (rectOver) {
    fill(255);
  } else {
    fill(0);
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
  
  if (rect1Over) {
    fill(255);
  } else {
    fill(100);
  }
  stroke(255);
  rect(rectA, rectB, rect1Size, rect1Size);
  
  if (rect2Over) {
    fill(255);
  } else {
    fill(200);
  }
  stroke(255);
  rect(rectP, rectQ, rect2Size, rect2Size);
  
  
   mousePressed();
  if (rect1Over)
  {
    for (int i = 0; i < clouds.length; i++) {
    clouds[i].display();
    clouds[i].move(speed);
    clouds[i].air(temp);
     fill(249, 215, 28);
     circle(990, 0, 130);
  }
    
  }
  if (rect2Over) {
    
    fill(249, 215, 28);
  circle(990, 0, 130);
     for (int i = 0; i < clouds.length; i++) {
    clouds[i].display();
  }
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].move(speed);
  }
  }
  if (mousePressed && rectOver) {
     file.play();
     for(int r = 0; r < 500; r++){
    
      if(d[r].y>d[r].endPos){
        d[r].end();
      }
      else{
        d[r].display();  
        
      }
  } 
  }
 
 
  println(speed);
  println(temp);
  
  s1.update();
  s1.display();
  
  
  
  for (int i = 0; i< clouds.length; i++) {
    //clouds[i].display();
    //clouds[i].move(speed);
    
    //MAX
    if (s1.newspos == 250) {
      fill(sliderText);
      textSize(24);
      text("MAX", 150, 660);
      clouds[i].x = 6.5;
      max = true;
      normal = false;
      easy = false;
    }
   
    //NORM
    else if (s1.newspos == 175 || s1.newspos >= 155 && s1.newspos <= 195) {
      fill(sliderText);
      textSize(24);
      text("NORMAL", 150, 660);
      normal = true;
      max = false;
      easy = false;
      
    }
    //EASY
    else if (s1.newspos == 100) {
      fill(sliderText);
      textSize(24);
      text("SLOW", 150, 660);
      easy = true;
      max = false;
      normal = false;
      
    }
  }
}


void update(int x, int y) {
  if ( overRect1(rectA, rectB, rect1Size) ) {
    rect1Over = true;
    rectOver = false;
    rect2Over = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    rect1Over = false;
    rect2Over = false;
   
  }else if ( overRect2(rectP, rectQ, rectSize) ) {
    rect2Over = true;
    rectOver = false;
    rect1Over = false;
  }else {
    rect1Over = rectOver = false;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mousePressed && mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}

boolean overRect1(int x, int y, int diameter) {
  //float disX = x - mouseX;
  //float disY = y - mouseY;
  if (mousePressed && mouseX >= x && mouseX <= x+diameter && 
      mouseY >= y && mouseY <= y+diameter ) {
    return true;
  } else {
    return false;
  }
}

boolean overRect2(int x, int y, int diameter) {
  //float disX = x - mouseX;
  //float disY = y - mouseY;
  if (mousePressed && mouseX >= x && mouseX <= x+diameter && 
      mouseY >= y && mouseY <= y+diameter  ) {
    return true;
  } else {
    return false;
  }
}
