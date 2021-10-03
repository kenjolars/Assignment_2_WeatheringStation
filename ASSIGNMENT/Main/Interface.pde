class InterfaceUI {
  //for button
  float posX = 845; //posX of button
  float posY = 650; //posY of button
  color buttonColor = color(255);
   color textColor = color(0);
   color buttonHighlight = color(100);


void drawButton() {
    ////button UI
    //fill(buttonColor);
    //rect(posX, posY, 150, 50, 20);
    //fill(textColor);
    //textSize(30);
    //text("Color", 880, 685);

    if (mouseX >=posX && mouseY > 540) {
      buttonColor =  buttonHighlight;
    } else {
      buttonColor = color(255);
    }
  }

  void buttonLogic() {
    if (mouseX >=posX && mouseY > 540 ) {
    //  newColor = color(0);
    } else {
      buttonColor =  color(255);
    }
  }
}
