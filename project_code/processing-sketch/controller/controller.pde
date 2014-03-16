import controlP5.*;
import netP5.*;
import oscP5.*;

ControlP5 cp5;
OscP5 oscP5;
NetAddress theOther;

boolean leaveTrace, drawPoints, drawLines, drawDelaunay;
color backgroundColor;
float attractionValue;

void setup() {
  size(400, 540);
  backgroundColor = randomColor();
  noStroke();
  cp5 = new ControlP5(this);
  oscP5 = new OscP5(this, MY_PORT);
  theOther = new NetAddress(OTHER_IP, OTHER_PORT);leaveTrace = random(1) < 0.5;
  attractionValue = 0;
  drawPoints = random(1) < 0.6667;
  drawLines = !drawPoints || random(1) < 0.5;
  sendMessage("attraction", attractionValue);
  cp5.addSlider("attraction")
    .setPosition(50, 50)
    .setRange(-0.0005, 0.0005)
    .setSize(300, 60)
    .setValue(0)
    ;
  sendMessage("points", drawPoints);
  cp5.addToggle("points")
    .setPosition(50, 150)
    .setSize(60, 60)
    .setValue(drawPoints)
    ;
  sendMessage("lines", drawLines);
  cp5.addToggle("lines")
    .setPosition(130, 150)
    .setSize(60, 60)
    .setValue(drawLines)
    ;
  sendMessage("trace", leaveTrace);
  cp5.addToggle("trace")
    .setPosition(210, 150)
    .setSize(60, 60)
    .setValue(leaveTrace)
    ;
  sendMessage("delaunay", drawDelaunay);
  cp5.addToggle("delaunay")
    .setPosition(290, 150)
    .setSize(60, 60)
    .setValue(drawDelaunay)
    ;
  sendMessage("backgroundcolor", backgroundColor);
  MyColorPicker colorPicker = new MyColorPicker(cp5, "backgroundcolor");
  colorPicker
    .setColorValue(backgroundColor)
    .setPosition(50, 250)
    ;
  colorPicker
    .setItemSize(300, 60)
    ;
}

void draw() {
}

void attraction(float value) {
  println("attraction: " + value);
  sendMessage("attraction", value);
}

void backgroundcolor(color value) {
  println("background color: " + value);
  //sendMessage("backgroundcolor", value);
  OscMessage msg = new OscMessage("/backgroundcolor");
  msg.add(red(value));
  msg.add(green(value));
  msg.add(blue(value));
  msg.add(alpha(value));
  oscP5.send(msg, theOther);
}

void points(boolean value) {
  println("draw points: " + value);
  sendMessage("drawpoint", value);
}

void lines(boolean value) {
  println("draw lines: " + value);
  sendMessage("drawlines", value);
}

void trace(boolean value) {
  println("leave trace: " + value);
  sendMessage("trace", value);
}

void delaunay(boolean value) {
  println("draw Delaunay triangulation: " + value);
  sendMessage("delaunay", value);
}

