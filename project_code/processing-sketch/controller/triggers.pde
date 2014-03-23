void artifacts(int value) {
  println("Number of artifacts: " + value);
  sendMessage("number-of-artifacts", value);
  //options.numberOfArtifacts = value;
}

void attraction(float value) {
  println("Attraction: " + value);
  sendMessage("attraction", value);
  //options.attraction = value;
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

void capture(boolean value) {
  println("Capture: " + value);
  sendMessage("capture", value);
}

void delaunay(boolean value) {
  println("Draw Delaunay triangulation: " + value);
  sendMessage("delaunay", value);
  options.delaunay = value;
}

void delay(int value) {
  println("Delay between capture frames: " + value);
  sendMessage("export-frame-delay", value);
  options.exportFrameDelay = value;
}

void inertia(boolean value) {
  println("Inertia: " + value);
  sendMessage("inertia", value);
  options.inertia = value;
}

void lerp(int value) {
  println("Lerp levels: " + value);
  sendMessage("lerp-levels", value);
  options.lerpLevels = value;
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

void reset(int value) {
  sendMessage("reset");
}

void voronoi(boolean value) {
  println("Draw Voronoi tesselation: " + value);
  sendMessage("voronoi", value);
  //options.voronoi = value;
}

void sendAll() {
  artifacts(options.numberOfArtifacts);
  attraction(options.attraction);
  backgroundcolor(options.backgroundColor);
  delaunay(options.delaunay);
  delay(options.exportFrameDelay);
  inertia(options.inertia);
  lerp(options.lerpLevels);
  lines(options.drawLine);
  points(options.drawArtifacts);
  trace(!options.clear);
  voronoi(options.voronoi);
}

void oscEvent(OscMessage msg) {
  if(msg.checkAddrPattern("/control-me")) {
    println("Taking control over new applet");
    sendAll();
  }
}
