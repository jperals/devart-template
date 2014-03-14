import controlP5.*;
import netP5.*;
import oscP5.*;

ControlP5 cp5;
OscP5 oscP5;
NetAddress theOther;

void setup() {
  size(400, 700);
  noStroke();
  cp5 = new ControlP5(this);
  oscP5 = new OscP5(this, MY_PORT);
  theOther = new NetAddress(OTHER_IP, OTHER_PORT);
  cp5.addSlider("attraction")
    .setPosition(50, 50)
    .setRange(-0.0005, 0.0005)
    .setSize(300, 40)
    .setValue(0)
    ;
}

void draw() {
}

void attraction(float value) {
  println("attraction: " + value);
  OscMessage msg = new OscMessage("/attraction");
  msg.add(value);
  oscP5.send(msg, theOther);
}
