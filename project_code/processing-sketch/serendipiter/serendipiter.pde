import java.util.Date;

Controller controller;

void setup() {
  size(500, 500);
  controller = new Controller(this);
}

void draw() {
  controller.draw();
  controller.update();
}

void keyPressed() {
  switch(key) {
  case 'g':
    controller.toggleGifExport(this);
    break; 
  case 's':
    Date date = new Date(); // Including the system time in the screenshot file name allows us to keep any screenshots we want instead of overriding the same file all the time
    String formattedDate = new java.text.SimpleDateFormat("yyyy-MM-dd.kk.mm.ss").format(date.getTime());
    saveFrame("screenshot-" + formattedDate + "-######.png");
    break;
  case 'r':
    controller.requestRestart();
    break;
  }
}

