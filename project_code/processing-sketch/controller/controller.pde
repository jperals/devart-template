import controlP5.*;
import netP5.*;
import oscP5.*;

ControlP5 cp5;
OscP5 oscP5;
NetAddress theOther;

boolean leaveTrace, drawPoints, drawLines;
color backgroundColor;
float attractionValue;

void setup() {
  size(400, 700);
  backgroundColor = 127;
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
    .setPosition(170, 150)
    .setSize(60, 60)
    .setValue(drawLines)
    ;
  sendMessage("trace", leaveTrace);
  cp5.addToggle("trace")
    .setPosition(290, 150)
    .setSize(60, 60)
    .setValue(leaveTrace)
    ;
}

void draw() {
}

void attraction(float value) {
  println("attraction: " + value);
  sendMessage("attraction", value);
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

