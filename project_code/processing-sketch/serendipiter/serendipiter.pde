import java.util.Date;
import netP5.*;
import oscP5.*;

Controller controller;

void setup() {
  size(500, 500);
  controller = new Controller(this);
  //background(backgroundColor);
}

void draw() {
  controller.draw();
}

void keyPressed() {
  if(key == 's') {
    Date date = new Date(); // Including the system time in the screenshot file name allows us to keep any screenshots we want instead of overriding the same file all the time
    String formattedDate = new java.text.SimpleDateFormat("yyyy-MM-dd.kk.mm.ss").format(date.getTime());
    saveFrame("screenshot-" + formattedDate + "-######.png");
  }
}

