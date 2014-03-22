import netP5.*;
import oscP5.*;

public class RemoteControlCommunication {
  Controller controller;
  NetAddress remoteAddress;
  Options options;
  OscP5 oscP5;
  RemoteControlCommunication(Controller controller, Options options) {
    oscP5 = new OscP5(this, MY_PORT);
    remoteAddress = new NetAddress(OTHER_IP, OTHER_PORT);
    this.controller = controller;
    this.options = options;
    askForRemoteControl();
  }
  private void askForRemoteControl() {
    OscMessage msg = new OscMessage("/control-me");
    oscP5.send(msg, remoteAddress);
  }
  private void oscEvent(OscMessage msg) {
    println("Message recieved");
    if(msg.checkAddrPattern("/attraction")) {
      options.attraction = msg.get(0).floatValue();
      println("attraction: " + options.attraction);
    }
    if(msg.checkAddrPattern("/background-color")) {
      float red = msg.get(0).floatValue();
      float green = msg.get(1).floatValue();
      float blue = msg.get(2).floatValue();
      float alpha = msg.get(3).floatValue();
      options.backgroundColor = color(red, green, blue, alpha);
    }
    else if(msg.checkAddrPattern("/draw-lines")) {
      options.drawLine = msg.get(0).intValue() == 1;
      println("Draw lines: " + options.drawLine);
    }
    else if(msg.checkAddrPattern("/delaunay")) {
      options.delaunay = msg.get(0).intValue() == 1;
      println("Draw Delaunay triangulation: " + options.delaunay);
    }
    else if(msg.checkAddrPattern("/draw-points")) {
      options.drawArtifacts = msg.get(0).intValue() == 1;
      println("Draw artifacts: " + options.drawArtifacts);
    }
    else if(msg.checkAddrPattern("/number-of-artifacts")) {
      options.numberOfArtifacts = msg.get(0).intValue();
      println("Number of artifacts: " + options.numberOfArtifacts);
    }
    else if(msg.checkAddrPattern("/trace")) {
      options.clear = msg.get(0).intValue() == 0;
      println("Clear: " + options.clear);
    }
    else if(msg.checkAddrPattern("/voronoi")) {
      options.voronoi = msg.get(0).intValue() == 1;
      println("Draw Voronoi tesselation: " + options.voronoi);
    }
    else if(msg.checkAddrPattern("/restart")) {
      controller.requestRestart();
    }
  }
}

