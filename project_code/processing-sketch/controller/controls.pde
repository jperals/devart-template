void addControls(ControlP5 cp5, Options options) {
  cp5.addSlider("artifacts")
    .setPosition(20, 20)
    .setRange(options.minNumberOfArtifacts, options.maxNumberOfArtifacts)
    .setSize(160, 40)
    .setSliderMode(Slider.FLEXIBLE)
    .setValue(options.numberOfArtifacts)
    ;
  cp5.addButton("reset")
    .setPosition(260, 20)
    .setSize(40, 40)
    ;
  cp5.addSlider("attraction")
    .setPosition(20, 90)
    .setRange(options.minAttraction, options.maxAttraction)
    .setSize(160, 40)
    .setSliderMode(Slider.FLEXIBLE)
    .setValue(options.attraction)
    ;
  cp5.addToggle("inertia")
    .setPosition(260, 90)
    .setSize(40, 40)
    .setValue(options.inertia)
    ;
  cp5.addToggle("points")
    .setPosition(20, 160)
    .setSize(40, 40)
    .setValue(options.drawArtifacts)
    ;
  cp5.addToggle("lines")
    .setPosition(70, 160)
    .setSize(40, 40)
    .setValue(options.drawLine)
    ;
  cp5.addToggle("trace")
    .setPosition(20, 230)
    .setSize(40, 40)
    .setValue(!options.clear)
    ;
  cp5.addToggle("delaunay")
    .setPosition(210, 160)
    .setSize(40, 40)
    .setValue(options.delaunay)
    ;
  cp5.addToggle("voronoi")
    .setPosition(260, 160)
    .setSize(40, 40)
    .setValue(options.voronoi)
    ;
  cp5.addSlider("lerp")
    .setNumberOfTickMarks(options.maxLerpLevels)
    .setPosition(210, 230)
    .setRange(1, options.maxLerpLevels)
    .setSize(90, 40)
    .setSliderMode(Slider.FLEXIBLE)
    .setValue(options.lerpLevels)
    ;
  ResizableColorPicker colorPicker = new ResizableColorPicker(cp5, "backgroundcolor");
  colorPicker
    .setColorValue(options.backgroundColor)
    .setPosition(20, 300)
    ;
  colorPicker
    .setItemSize(280, 20)
    ;
  cp5.addSlider("delay")
    .setNumberOfTickMarks(options.maxExportFrameDelay - options.minExportFrameDelay)
    .setPosition(20, 410)
    .setRange(options.minExportFrameDelay, options.maxExportFrameDelay)
    .setSize(160, 40)
    .setSliderMode(Slider.FLEXIBLE)
    .setValue(options.exportFrameDelay)
    ;
  cp5.addToggle("capture")
    .setPosition(260, 410)
    .setSize(40, 40)
    .setValue(false)
    ;
}
