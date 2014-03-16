void artifacts(int value) {
  println("Number of artifacts: " + value);
  sendMessage("number-of-artifacts", value);
  options.numberOfArtifacts = value;
}

void attraction(float value) {
  println("Attraction: " + value);
  sendMessage("attraction", value);
  options.attraction = value;
}

void backgroundcolor(color value) {
  float red = red(value);
  float green = green(value);
  float blue = blue(value);
  float alpha = alpha(value);
  println("Background color: " + red + ", " + green + ", " + blue + ", " + alpha);
  OscMessage msg = new OscMessage("/background-color");
  msg.add(red);
  msg.add(green);
  msg.add(blue);
  msg.add(alpha);
  oscP5.send(msg, remoteAddress);
  options.backgroundColor = value;
}

void delaunay(boolean value) {
  println("Draw Delaunay triangulation: " + value);
  sendMessage("delaunay", value);
  options.delaunay = value;
}

void lines(boolean value) {
  println("Draw lines: " + value);
  sendMessage("draw-lines", value);
  options.drawLine = value;
}

void points(boolean value) {
  println("Draw points: " + value);
  sendMessage("draw-points", value);
  options.drawArtifacts = value;
}

void trace(boolean value) {
  println("Leave trace: " + value);
  sendMessage("trace", value);
  options.clear = !value;
}

void sendAll() {
  attraction(attractionValue);
  backgroundcolor(backgroundColor);
  delaunay(drawDelaunay);
  lines(drawLines);
  points(drawPoints);
  trace(leaveTrace);
}

void oscEvent(OscMessage msg) {
  if(msg.checkAddrPattern("/control-me")) {
    println("Taking control over new applet");
    sendAll();
  }
}
