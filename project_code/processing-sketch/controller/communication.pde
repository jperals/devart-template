import netP5.*;
import oscP5.*;

public class RemoteControlCommunication {
  NetAddress remoteAddress;
  Options options;
  OscP5 oscP5;
  RemoteControlCommunication(Options options) {
    oscP5 = new OscP5(this, listeningPort);
    remoteAddress = new NetAddress(remoteNetAddress, broadcastPort);
    this.options = options;
  }
  public void connect(String ipAddress) {
    OscMessage msg = new OscMessage("/connect");
    oscP5.send(msg, remoteAddress);
    sendAll();
  }
  private void oscEvent(OscMessage msg) {
    println("Message recieved");
    if(msg.addrPattern().equals("/connect")) {
      connect(msg.netAddress().address());
    }
    else if(msg.checkAddrPattern("/attraction")) {
      options.attraction = msg.get(0).floatValue();
      println("attraction: " + options.attraction);
    }
    else if(msg.checkAddrPattern("/background-color")) {
      float red = msg.get(0).floatValue();
      float green = msg.get(1).floatValue();
      float blue = msg.get(2).floatValue();
      float alpha = msg.get(3).floatValue();
      options.backgroundColor = color(red, green, blue, alpha);
    }
    else if(msg.checkAddrPattern("/delaunay")) {
      options.delaunay = msg.get(0).intValue() == 1;
      println("Draw Delaunay triangulation: " + options.delaunay);
    }
    else if(msg.checkAddrPattern("/draw-lines")) {
      options.drawLine = msg.get(0).intValue() == 1;
      println("Draw lines: " + options.drawLine);
    }
    else if(msg.checkAddrPattern("/draw-points")) {
      options.drawArtifacts = msg.get(0).intValue() == 1;
      println("Draw artifacts: " + options.drawArtifacts);
    }
    else if(msg.checkAddrPattern("/export-frame-delay")) {
      options.exportFrameDelay = msg.get(0).intValue();
      println("Delay between capture frames: " + options.exportFrameDelay);
    }
    else if(msg.checkAddrPattern("/inertia")) {
      options.inertia = msg.get(0).intValue() == 1;
      println("Inertia: " + options.inertia);
    }
    else if(msg.checkAddrPattern("/lerp-levels")) {
      options.lerpLevels = msg.get(0).intValue();
      options.lerp = options.lerpLevels > 0;  
      println("Lerp levels: " + options.lerpLevels);
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
    else {
      return;
    }
    oscP5.send(msg, remoteAddress);
  }
  public void sendMessage(String parameter) {
    OscMessage msg = new OscMessage("/" + parameter);
    oscP5.send(msg, remoteAddress);
  }
  public void sendMessage(String parameter, boolean value) {
    int intValue = value ? 1 : 0; // There seem to be problems with passing booleans through OSC, so we pass an integer
    sendMessage(parameter, intValue);
  }  
  public void sendMessage(String parameter, float value) {
    OscMessage msg = new OscMessage("/" + parameter);
    msg.add(value);
    oscP5.send(msg, remoteAddress);
  }
  public void sendMessage(String parameter, int value) {
    OscMessage msg = new OscMessage("/" + parameter);
    msg.add(value);
    oscP5.send(msg, remoteAddress);
  }
  public void sendMessage(String parameter, String value) {
    OscMessage msg = new OscMessage("/" + parameter);
    msg.add(value);
    oscP5.send(msg, remoteAddress);
  }
}

