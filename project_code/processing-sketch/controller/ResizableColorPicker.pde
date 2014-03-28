class MyColorPicker extends ColorPicker {
  MyColorPicker(ControlP5 cp5, String theName) {
    super(cp5, cp5.getTab("default"), theName, 0, 0, 100, 10);
  }
  
  MyColorPicker lock() {
    sliderRed.lock();
    sliderGreen.lock();
    sliderBlue.lock();
    sliderAlpha.lock();
    return this;
  }
  
  MyColorPicker unlock() {
    sliderRed.unlock();
    sliderGreen.unlock();
    sliderBlue.unlock();
    sliderAlpha.unlock();
    return this;
  }
 
  MyColorPicker setItemSize(int w, int h) {
    sliderRed.setSize(w, h);
    sliderGreen.setSize(w, h);
    sliderBlue.setSize(w, h);
    sliderAlpha.setSize(w, h);
   
    // you gotta move the sliders as well or they will overlap
    sliderGreen.setPosition(PVector.add(sliderGreen.getPosition(), new PVector(0, h-10)));
    sliderBlue.setPosition(PVector.add(sliderBlue.getPosition(), new PVector(0, 2*(h-10))));
    sliderAlpha.setPosition(PVector.add(sliderAlpha.getPosition(), new PVector(0, 3*(h-10))));

    return this;
  }
  
  MyColorPicker setVisible(boolean value) {
    sliderRed.setVisible(value);
    sliderGreen.setVisible(value);
    sliderBlue.setVisible(value);
    sliderAlpha.setVisible(value);
    return this;
  }
}
