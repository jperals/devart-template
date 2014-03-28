MyColorPicker backgroundColorPicker;

void addControls(ControlP5 cp5, Options options) {
  cp5.addSlider("artifacts")
    .lock()
    .setPosition(50, 50)
    .setRange(options.minNumberOfArtifacts, options.maxNumberOfArtifacts)
    .setSize(240, 60)
    .setSliderMode(Slider.FLEXIBLE)
///    .setValue(options.numberOfArtifacts)
    .setVisible(false);
    ;
  cp5.addButton("reset")
    .lock()
    .setPosition(370, 50)
    .setSize(60, 60)
    .setVisible(false);
    ;
  cp5.addSlider("attraction")
    .lock()
    .setPosition(50, 150)
    .setRange(options.minAttraction, options.maxAttraction)
    .setSize(240, 60)
    .setSliderMode(Slider.FLEXIBLE)
//    .setValue(options.attraction)
    .setVisible(false);
    ;
  cp5.addToggle("inertia")
    .lock()
    .setPosition(370, 150)
    .setSize(60, 60)
//    .setValue(options.inertia)
    .setVisible(false);
    ;
  cp5.addToggle("points")
    .lock()
    .setPosition(50, 250)
    .setSize(60, 60)
//    .setValue(options.drawArtifacts)
    .setVisible(false);
    ;
  cp5.addToggle("lines")
    .lock()
    .setPosition(130, 250)
    .setSize(60, 60)
//    .setValue(options.drawLine)
    .setVisible(false);
    ;
  cp5.addToggle("trace")
    .lock()
    .setPosition(50, 350)
    .setSize(60, 60)
//    .setValue(!options.clear)
    .setVisible(false);
    ;
  cp5.addToggle("delaunay")
    .lock()
    .setPosition(290, 250)
    .setSize(60, 60)
//    .setValue(options.delaunay)
    .setVisible(false);
    ;
  cp5.addToggle("voronoi")
    .lock()
    .setPosition(370, 250)
    .setSize(60, 60)
//    .setValue(options.voronoi)
    .setVisible(false);
    ;
  cp5.addSlider("polygons")
    .lock()
    .setNumberOfTickMarks(options.maxLerpLevels)
    .setPosition(290, 350)
    .setRange(1, options.maxLerpLevels)
    .setSize(140, 60)
    .setSliderMode(Slider.FLEXIBLE)
//    .setValue(options.lerpLevels)
    .setVisible(false);
    ;
  backgroundColorPicker = new MyColorPicker(cp5, "background");
  backgroundColorPicker
//    .lock()
//    .setColorValue(options.backgroundColor)
    .setItemSize(380, 60)
    .setPosition(50, 470)
    .setSize(0, 0)
    .setVisible(false);
    ;
  cp5.addButton("connect")
    .setPosition(370, 750)
    .setSize(60, 60)
    ;
/*  cp5.addSlider("delay")
    .lock()
    .setNumberOfTickMarks(options.maxExportFrameDelay - options.minExportFrameDelay)
    .setPosition(50, 750)
    .setRange(options.minExportFrameDelay, options.maxExportFrameDelay)
    .setSize(100, 60)
    .setSliderMode(Slider.FLEXIBLE)
//    .setValue(options.exportFrameDelay)
    ;
  cp5.addToggle("capture")
    .lock()
    .setPosition(200, 750)
    .setSize(60, 60)
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

