import java.util.*;
import controlP5.*;
import java.text.SimpleDateFormat;

PImage cloud;
Table windSpeed;
int index = 0;
float speed = 15;
String dates;
int cnt=0;
ControlP5 cp5;
int sliderTicks2 = 35;
DropdownList d1;
Slider abc;
Drops d[];


Cloud[] clouds = new Cloud[10];
//SimpleDateFormat date_fmt_date = new SimpleDateFormat("YYYY-MMM-DD");
void setup(){
  
  size(1600,900);
   cp5 = new ControlP5(this);
            
  noStroke();
  d=new Drops[500];
  for(int r = 0; r < 500; r++){
    d[r] = new Drops();
  }
  
  cloud = loadImage("Cloud.png");
  
  windSpeed = loadTable("Wind Direction.csv");
       dates=windSpeed.getString(index,0);
        
      
   
       String fDate= dates.substring(0,10);
        speed = windSpeed.getInt(index,1);
        
       
     
        
            println(fDate);
            String hours = dates.substring(11); 
            //println(hours);
          
            String hour = hours.substring(0, 2); 
            // sub string of the hour only
            println(hour);
            
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud();
  }
            
        abc=  cp5.addSlider("sliderTicks2")
             .setPosition(0,0)
             .setWidth(1600)
             .setHeight(30)
             .setRange(0,24) 
             .setValue(0)
             .setNumberOfTickMarks(24)
             
             ;
           
           List l = Arrays.asList(fDate);
          
           cp5.addScrollableList("Date")
          .setPosition(1400, 50)
          .setSize(200, 100)
          .setBarHeight(20)
          .setItemHeight(30)
          .addItems(l)
           ;
 
}

void draw(){
  if(index < windSpeed.getRowCount()) {
    speed = windSpeed.getInt(index,1);
    index++;
  }else{
    index = 0;
  }
  
            String date= dates.substring(0);
            String fDate= date.substring(0,10);
            
            println(fDate);
            //String hours = dates.substring(11); 
            //println(hours);
          
            String hour = dates.substring(0, 2); // sub string of the hour only
            println(hour);
            
            List l = Arrays.asList(hour);
            //float xy=hour();
             float f = float(hour) ; 
  
  background(135,206,235);
  fill(126,200,80);
  rect(0,600,3500,350);
  for(int r = 0; r < 500; r++){
      if(d[r].y>d[r].endPos){
        d[r].end();
      }else{
        d[r].display();   
      }
  } 
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].display();
  }
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].move(speed);
     
  }
  println(speed);
  cp5.getController("sliderTicks2").setValue(f);
  fill(sliderTicks2);
  //println(date);
  
}
