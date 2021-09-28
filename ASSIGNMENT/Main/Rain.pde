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
