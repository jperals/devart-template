void addControls(ControlP5 cp5, Options options) {
  cp5.addSlider("artifacts")
    .setPosition(50, 50)
    .setRange(options.minNumberOfArtifacts, options.maxNumberOfArtifacts)
    .setSize(240, 60)
    .setSliderMode(Slider.FLEXIBLE)
    .setValue(options.numberOfArtifacts)
    ;
  cp5.addButton("reset")
    .setPosition(370, 50)
    .setSize(60, 60)
    ;
  cp5.addSlider("attraction")
    .setPosition(50, 150)
    .setRange(options.minAttraction, options.maxAttraction)
    .setSize(240, 60)
    .setSliderMode(Slider.FLEXIBLE)
    .setValue(options.attraction)
    ;
  cp5.addToggle("inertia")
    .setPosition(370, 150)
    .setSize(60, 60)
    .setValue(options.inertia)
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
    .setPosition(50, 350)
    .setSize(60, 60)
    .setValue(!options.clear)
    ;
  cp5.addToggle("delaunay")
    .setPosition(290, 250)
    .setSize(60, 60)
    .setValue(options.delaunay)
    ;
  cp5.addToggle("voronoi")
    .setPosition(370, 250)
    .setSize(60, 60)
    .setValue(options.voronoi)
    ;
  cp5.addSlider("lerp")
    .setNumberOfTickMarks(options.maxLerpLevels)
    .setPosition(290, 350)
    .setRange(1, options.maxLerpLevels)
    .setSize(140, 60)
    .setSliderMode(Slider.FLEXIBLE)
    .setValue(options.lerpLevels)
    ;
  ResizableColorPicker colorPicker = new ResizableColorPicker(cp5, "backgroundcolor");
  colorPicker
    .setColorValue(options.backgroundColor)
    .setPosition(50, 470)
    ;
  colorPicker
    .setItemSize(380, 60)
    ;
  cp5.addSlider("delay")
    .setNumberOfTickMarks(options.maxExportFrameDelay - options.minExportFrameDelay)
    .setPosition(50, 750)
    .setRange(options.minExportFrameDelay, options.maxExportFrameDelay)
    .setSize(240, 60)
    .setSliderMode(Slider.FLEXIBLE)
    .setValue(options.exportFrameDelay)
    ;
  cp5.addToggle("capture")
    .setPosition(370, 750)
    .setSize(60, 60)
    .setValue(false)
    ;
}
