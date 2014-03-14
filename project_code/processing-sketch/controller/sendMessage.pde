void sendMessage(String parameter, boolean value) {
  int intValue = value ? 1 : 0; // There seembe problems with passing booleans through OSC, so we pass an integer
  sendMessage(parameter, intValue);
}

void sendMessage(String parameter, float value) {
  OscMessage msg = new OscMessage("/" + parameter);
  msg.add(value);
  oscP5.send(msg, theOther);
}

void sendMessage(String parameter, int value) {
  OscMessage msg = new OscMessage("/" + parameter);
  msg.add(value);
  oscP5.send(msg, theOther);
}
