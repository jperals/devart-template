import controlP5.*;
import netP5.*;
import oscP5.*;

ControlP5 cp5;
Options options;
RemoteBindings communication;

void setup() {
  size(480, 860);
  noStroke();
  cp5 = new ControlP5(this);
  communication = new RemoteBindings(cp5);
  options = new Options();
  addControls(cp5, options);
  communication.connect();
}

void draw() {
}

