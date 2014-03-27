import controlP5.*;
import netP5.*;
import oscP5.*;

ControlP5 cp5;
OscP5 oscP5;
Options options;
RemoteControlCommunication communication;

void setup() {
  size(480, 860);
  noStroke();
  cp5 = new ControlP5(this);
  oscP5 = new OscP5(this, listeningPort);
  communication = new RemoteControlCommunication(options);
  options = new Options();
  addControls(cp5, options);
  communication.connect(remoteNetAddress);
}

void draw() {
}

