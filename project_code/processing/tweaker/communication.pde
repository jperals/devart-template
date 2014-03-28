import java.util.List;
import netP5.*;
import oscP5.*;

public class RemoteBindings {
  boolean connected;
  boolean controlValueSetRemotely;
  NetAddress remoteAddress;
  ControlP5 cp5;
  OscP5 oscP5;
  RemoteBindings(ControlP5 cp5) {
    connected = false;
    controlValueSetRemotely = false;
    oscP5 = new OscP5(this, listeningPort);
    remoteAddress = new NetAddress(remoteNetAddress, broadcastPort);
    this.cp5 = cp5;
  }
  public void connect() {
    OscMessage msg = new OscMessage("/connect");
    oscP5.send(msg, remoteAddress);
  }
  private void oscEvent(OscMessage msg) {
    println("Message recieved from applet");
    String parameter = msg.addrPattern().substring(1);
    if (!connected) {
      connected = true;
      List<Button> buttons = cp5.getAll(Button.class);
      for (Button button:buttons) {
        if("connect".equals(button.getName())) {
          button.setVisible(false);
        }
        else {
          button
            .setVisible(true)
            .unlock()
            ;
        }
      }
      List<ControllerGroup> controllerGroups = cp5.getAll(ControllerGroup.class);
      for (ControllerGroup controllerGroup:controllerGroups) {
        controllerGroup
          .setVisible(true)
          ;
      }
      List<MyColorPicker> colorPickers = cp5.getAll(MyColorPicker.class);
      for (ControllerGroup colorPicker:colorPickers) {
        colorPicker
          .setVisible(true)
          ;
      }
      List<Toggle> toggles = cp5.getAll(Toggle.class);
      for (Toggle toggle:toggles) {
        toggle
          .setVisible(true)
          .unlock()
          ;
      }
      List<Slider> sliders = cp5.getAll(Slider.class);
      for (Slider slider:sliders) {
        slider
          .setVisible(true)
          .unlock()
          ;
      }
    }
    if(! ("connect".equals(parameter)) && ! ("delay".equals(parameter))) {
      controlValueSetRemotely = true;
    }
    println("parameter: " + parameter);
    if("delay".equals(parameter)) {
      return;
    }
    if ("background".equals(parameter)) {
      println("message: " + msg);
      float red = msg.get(0).floatValue();
      float green = msg.get(1).floatValue();
      float blue = msg.get(2).floatValue();
      float alpha = msg.get(3).floatValue();
      color backgroundColor = color(red, green, blue, alpha);
      backgroundColorPicker.setColorValue(backgroundColor);
    }
    else {
      cp5.get(parameter).setValue(msg.get(0).floatValue());
    }
  }
  public void sendMessage(String parameter) {
    OscMessage msg = new OscMessage("/" + parameter);
    oscP5.send(msg, remoteAddress);
  }
  public void sendMessage(String parameter, float[] valueArray) {
    OscMessage msg = new OscMessage("/" + parameter);
    for (int i  = 0; i < valueArray.length; i++) {
      msg.add(valueArray[i]);
    }
    oscP5.send(msg, remoteAddress);
  }
  public void sendMessage(String parameter, boolean value) {
    int intValue = value ? 1 : 0; // There seem to be problems with passing booleans through OSC, so we pass an integer
    sendMessage(parameter, intValue);
  }  
  public void sendMessage(String parameter, float value) {
    OscMessage msg = new OscMessage("/" + parameter);
    msg.add(value);
    oscP5.send(msg, remoteAddress);
  }
  public void sendMessage(String parameter, int value) {
    OscMessage msg = new OscMessage("/" + parameter);
    msg.add(value);
    oscP5.send(msg, remoteAddress);
  }
  public void sendMessage(String parameter, String value) {
    OscMessage msg = new OscMessage("/" + parameter);
    msg.add(value);
    oscP5.send(msg, remoteAddress);
  }
}

