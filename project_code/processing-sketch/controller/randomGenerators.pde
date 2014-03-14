float randomAngle() {
  return random(TWO_PI);
}

color randomColor(float alpha) {
  return color(random(255), random(255), random(255), alpha);
}

color randomColor() {
  return randomColor(random(255)); // If alpha is not specified, make it random too
}

PVector randomPosition(int w, int h) {
  return new PVector(random(-0.5, 1.5)*w, random(-0.5, 1.5)*h); // This will return also positions out from the visible screen
}

PVector randomPosition() {
  return randomPosition(width, height);
}

