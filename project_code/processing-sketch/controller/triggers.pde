void artifacts(int value) {
  println("Number of artifacts: " + value);
  communication.sendMessage("number-of-artifacts", value);
  //options.numberOfArtifacts = value;
}

void attraction(float value) {
  println("Attraction: " + value);
  communication.sendMessage("attraction", value);
  //options.attraction = value;
}

void backgroundcolor(color value) {
  communication.sendMessage("background-color", hex(value));
}

void capture(boolean value) {
  println("Capture: " + value);
  communication.sendMessage("capture", value);
}

void delaunay(boolean value) {
  println("Draw Delaunay triangulation: " + value);
  communication.sendMessage("delaunay", value);
  options.delaunay = value;
}

void delay(int value) {
  println("Delay between capture frames: " + value);
  communication.sendMessage("export-frame-delay", value);
  options.exportFrameDelay = value;
}

void inertia(boolean value) {
  println("Inertia: " + value);
  communication.sendMessage("inertia", value);
  options.inertia = value;
}

void lerp(int value) {
  println("Lerp levels: " + value);
  communication.sendMessage("lerp-levels", value);
  options.lerpLevels = value;
}

void lines(boolean value) {
  println("Draw lines: " + value);
  communication.sendMessage("draw-lines", value);
  options.drawLine = value;
}

void points(boolean value) {
  println("Draw points: " + value);
  communication.sendMessage("draw-points", value);
  options.drawArtifacts = value;
}

void trace(boolean value) {
  println("Leave trace: " + value);
  communication.sendMessage("trace", value);
  options.clear = !value;
}

void reset(int value) {
  communication.sendMessage("reset");
}

void voronoi(boolean value) {
  println("Draw Voronoi tesselation: " + value);
  communication.sendMessage("voronoi", value);
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
