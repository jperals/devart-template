import java.util.Date; // Required to use the Date class further down
import netP5.*;
import oscP5.*;

ArrayList<Artifact> artifacts;
boolean clear, drawArtifacts, drawLine;
color backgroundColor;
float attraction;
int numberOfArtifacts;
NetAddress theOther;
OscP5 oscP5;

void setup() {
  size(1000, 500);
  oscP5 = new OscP5(this, MY_PORT);
  theOther = new NetAddress(OTHER_IP, OTHER_PORT);
  artifacts = new ArrayList<Artifact>();
  backgroundColor = randomColor();
  clear = random(1) < 0.5;
  drawArtifacts = random(1) < 0.6667;
  drawLine = !drawArtifacts || random(1) < 0.5;
  attraction = random(-0.0001, 0.0001);
  numberOfArtifacts = int(random(500, 1500));
  println("attraction: " + attraction);
  println("draw artifacts: " + drawArtifacts);
  println("draw line: " + drawLine);
  println("number of artifacts: " + numberOfArtifacts);
  for(int i = 0; i < numberOfArtifacts; i++) {
    Artifact artifact = new Point();
    artifacts.add(artifact);
  }
  background(backgroundColor);
}

void draw() {
  if(clear) {
    noStroke();
    fill(backgroundColor);
    rect(0, 0, width, height); // The background() function doesn't seem to allow the use of alpha, so we draw a rectangle instead
  }
  for(int i = 0; i < numberOfArtifacts; i++) {
    Artifact artifact = artifacts.get(i);
    Artifact closestArtifact = artifact.getClosestArtifact(artifacts);
    if(drawArtifacts) {
      artifact.display();
    }
    if(drawLine) {
      color lineColor = lerpColor(artifact.baseColor, closestArtifact.baseColor, 0.5);
      stroke(lineColor);
      line(artifact.position.x, artifact.position.y, closestArtifact.position.x, closestArtifact.position.y);
    }
    artifact.update();
    PVector difference = artifact.differenceTo(closestArtifact);
    artifact.acceleration = new PVector(difference.x * attraction, difference.y * attraction);
  }
}

void oscEvent(OscMessage msg) {
  println("message recieved");
  if(msg.checkAddrPattern("/attraction")) {
    println("attraction value recieved");
    attraction = msg.get(0).intValue();
  }
}

void keyPressed() {
  if(key == 's') {
    Date date = new Date(); // Including the system time in the screenshot file name allows us to keep any screenshots we want instead of overriding the same file all the time
    String formattedDate = new java.text.SimpleDateFormat("yyyy-MM-dd.kk.mm.ss").format(date.getTime());
    saveFrame("screenshot-" + formattedDate + "-######.png");
  }
}

