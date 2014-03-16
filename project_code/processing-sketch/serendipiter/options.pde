public class Options {
  public boolean clear, delaunay, drawArtifacts, drawLine;
  public color backgroundColor;
  public float attraction, mass;
  public int numberOfArtifacts;
  Options() {
    backgroundColor = randomColor();
    clear = random(1) < 0.5;
    delaunay = random(1) < 0.5;
    drawArtifacts = random(1) < 0.6667;
    drawLine = !drawArtifacts || random(1) < 0.5;
    attraction = 0;
    mass = 1000;
    numberOfArtifacts = int(random(100, 300));
    println("attraction: " + attraction);
    println("draw artifacts: " + drawArtifacts);
    println("draw line: " + drawLine);
    println("number of artifacts: " + numberOfArtifacts);
  }
}

