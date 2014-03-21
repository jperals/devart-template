void addControls(ControlP5 cp5, Options options) {
  cp5.addSlider("artifacts")
    .setPosition(50, 50)
    .setRange(options.minNumberOfArtifacts, options.maxNumberOfArtifacts)
    .setSize(300, 60)
    .setValue(options.numberOfArtifacts)
    ;
  cp5.addSlider("attraction")
    .setPosition(50, 150)
    .setRange(options.minAttraction, options.maxAttraction)
    .setSize(300, 60)
    .setValue(options.attraction)
    ;
  cp5.addToggle("points")
    .setPosition(50, 250)
    .setSize(60, 60)
    .setValue(options.drawArtifacts)
    ;
  cp5.addToggle("lines")
    .setPosition(130, 250)
    .setSize(60, 60)
    .setValue(options.drawLine)
    ;
  cp5.addToggle("trace")
    .setPosition(210, 250)
    .setSize(60, 60)
    .setValue(!options.clear)
    ;
  cp5.addToggle("delaunay")
    .setPosition(50, 350)
    .setSize(60, 60)
    .setValue(options.delaunay)
    ;
  cp5.addToggle("voronoi")
    .setPosition(130, 350)
    .setSize(60, 60)
    .setValue(options.voronoi)
    ;
  ResizableColorPicker colorPicker = new ResizableColorPicker(cp5, "backgroundcolor");
  colorPicker
    .setColorValue(options.backgroundColor)
    .setPosition(50, 450)
    ;
  colorPicker
    .setItemSize(300, 60)
    ;
}
