class CloudGenerate {
  float xcoord, ycoord; // x and y coordinate
  PImage cloudPNG;
  float cloudx = width/2, cloudY = height/2;
  float xr, yr; // x and y cloud coordinate
  
  CloudGenerate(){
    xcoord = random(1500);
    ycoord = random(250);
    cloudPNG = loadImage("Cloud.png");
    xr = cloudPNG.width/2;
    yr = cloudPNG.height/2;
  }
  
  
}
