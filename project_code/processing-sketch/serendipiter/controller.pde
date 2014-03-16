import java.util.AbstractMap;
import java.util.Map;
import netP5.*;
//import org.processing.wiki.triangulate.*;
import oscP5.*;

public class Controller {
  ArrayList<Artifact> artifacts;
  ArrayList<Triangle> triangles;
  NetAddress theOther;
  OscP5 oscP5;
  Options options;
  Controller() {
    artifacts = new ArrayList<Artifact>();
    triangles = new ArrayList<Triangle>();
    options = new Options();
    oscP5 = new OscP5(this, MY_PORT);
    theOther = new NetAddress(OTHER_IP, OTHER_PORT);
    for(int i = 0; i < options.numberOfArtifacts; i++) {
      Artifact artifact = new Point();
      artifacts.add(artifact);
    }
  }
  public void draw() {
    if(options.clear) {
      noStroke();
      fill(options.backgroundColor);
      rect(0, 0, width, height); // The background() function doesn't seem to allow the use of alpha, so we draw a rectangle instead
    }
    if(options.delaunay) {
      triangles = Triangulate.triangulate(artifacts);
      stroke(0, 40);
      fill(0, 0, 0 ,0);
      beginShape(TRIANGLES);
      for (int i = 0; i < triangles.size(); i++) {
        Triangle t = (Triangle)triangles.get(i);
        vertex(t.p1.x, t.p1.y);
        vertex(t.p2.x, t.p2.y);
        vertex(t.p3.x, t.p3.y);
      }
      endShape();
    }
    for(int i = 0; i < options.numberOfArtifacts; i++) {
      Artifact artifact = artifacts.get(i);
      Artifact closestArtifact = artifact.getClosestArtifact(artifacts);
      if(options.drawArtifacts) {
        artifact.display();
      }
      if(options.drawLine) {
        color lineColor = lerpColor(artifact.baseColor, closestArtifact.baseColor, 0.5);
        stroke(lineColor);
        line(artifact.position.x, artifact.position.y, closestArtifact.position.x, closestArtifact.position.y);
      }
      artifact.update();
      PVector difference = artifact.differenceTo(closestArtifact);
      artifact.acceleration = new PVector(difference.x * options.attraction / options.mass, difference.y * options.attraction / options.mass);
    }
  }
  void oscEvent(OscMessage msg) {
    println("message recieved");
    if(msg.checkAddrPattern("/attraction")) {
      options.attraction = msg.get(0).floatValue();
      println("attraction: " + options.attraction);
    }
    if(msg.checkAddrPattern("/backgroundcolor")) {
      float red = msg.get(0).floatValue();
      float green = msg.get(1).floatValue();
      float blue = msg.get(2).floatValue();
      float alpha = msg.get(3).floatValue();
      options.backgroundColor = color(red, green, blue, alpha);
      println("background color: " + options.backgroundColor);
    }
    if(msg.checkAddrPattern("/drawlines")) {
      options.drawLine = msg.get(0).intValue() == 1;
      println("draw lines: " + options.drawLine);
    }
    if(msg.checkAddrPattern("/delaunay")) {
      options.delaunay = msg.get(0).intValue() == 1;
      println("draw Delaunay triangulation: " + options.delaunay);
    }
    if(msg.checkAddrPattern("/drawpoints")) {
      options.drawArtifacts = msg.get(0).intValue() == 1;
      println("draw artifacts: " + options.drawArtifacts);
    }
    if(msg.checkAddrPattern("/trace")) {
      options.clear = msg.get(0).intValue() == 0;
      println("clear: " + options.clear);
    }
  }
}
