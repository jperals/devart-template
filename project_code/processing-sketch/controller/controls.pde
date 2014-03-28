MyColorPicker backgroundColorPicker;

void addControls(ControlP5 cp5, Options options) {
  cp5.addSlider("artifacts")
    .lock()
    .setPosition(20, 20)
    .setRange(options.minNumberOfArtifacts, options.maxNumberOfArtifacts)
    .setSize(160, 40)
    .setSliderMode(Slider.FLEXIBLE)
///    .setValue(options.numberOfArtifacts)
    .setVisible(false);
    ;
  cp5.addButton("reset")
    .lock()
    .setPosition(260, 20)
    .setSize(40, 40)
    .setVisible(false);
    ;
  cp5.addSlider("attraction")
    .lock()
    .setPosition(20, 90)
    .setRange(options.minAttraction, options.maxAttraction)
    .setSize(160, 40)
    .setSliderMode(Slider.FLEXIBLE)
//    .setValue(options.attraction)
    .setVisible(false);
    ;
  cp5.addToggle("inertia")
    .setPosition(260, 90)
    .setSize(40, 40)
    .setVisible(false);
    ;
  cp5.addToggle("points")
    .setPosition(20, 160)
    .setSize(40, 40)
    .setVisible(false);
    ;
  cp5.addToggle("lines")
    .setPosition(70, 160)
    .setSize(40, 40)
    .setVisible(false);
    ;
  cp5.addToggle("trace")
    .setPosition(20, 230)
    .setSize(40, 40)
    .setVisible(false);
    ;
  cp5.addToggle("delaunay")
    .setPosition(210, 160)
    .setSize(40, 40)
    .setVisible(false);
    ;
  cp5.addToggle("voronoi")
    .setPosition(260, 160)
    .setSize(40, 40)
    .setVisible(false);
    ;
  cp5.addSlider("polygons")
    .lock()
    .setNumberOfTickMarks(options.maxLerpLevels)
    .setPosition(210, 230)
    .setRange(1, options.maxLerpLevels)
    .setSize(90, 40)
    .setSliderMode(Slider.FLEXIBLE)
//    .setValue(options.lerpLevels)
    .setVisible(false);
    ;
  backgroundColorPicker = new MyColorPicker(cp5, "background");
  backgroundColorPicker
//    .lock()
//    .setColorValue(options.backgroundColor)
    .setItemSize(280, 20)
    .setPosition(20, 300)
    .setSize(0, 0)
    .setVisible(false);
    ;
  cp5.addButton("connect")
    .setPosition(240, 400)
    .setSize(60, 60)
    ;
/*  cp5.addSlider("delay")
    .lock()
    .setNumberOfTickMarks(options.maxExportFrameDelay - options.minExportFrameDelay)
    .setPosition(20, 410)
    .setRange(options.minExportFrameDelay, options.maxExportFrameDelay)
    .setSize(100, 60)
    .setSliderMode(Slider.FLEXIBLE)
//    .setValue(options.exportFrameDelay)
    ;
  cp5.addToggle("capture")
    .lock()
    .setPosition(160, 410)
    .setSize(40, 40)
//    .setValue(false)
    ;*/
}

void controlEvent(ControlEvent controllerEvent) {
  if(communication.controlValueSetRemotely) {
    communication.controlValueSetRemotely = false;
    return;
  }
  String controllerName = controllerEvent.getName();
  println(controllerEvent.toString());
  if (controllerEvent.isController()) {
    //println(controllerName + ": " + controllerEvent.getController().getValue());
    communication.sendMessage(controllerName, controllerEvent.getController().getValue());
  }
  else if (controllerEvent.isGroup()) {
    float[] valueArray = controllerEvent.getArrayValue();
    //println(controllerName + ":");
    for(int i = 0; i < valueArray.length; i++) {
      float controlValue = valueArray[i];
      //println("  " + controlValue);
    }
    communication.sendMessage(controllerName, valueArray);
  }
}

