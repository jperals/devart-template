public class Options {
  public boolean clear, delaunay, drawArtifacts, drawLine, voronoi, lerp;
  public color backgroundColor;
  public float attraction, mass;
  private float minAttraction = -5;
  private float maxAttraction = 5;
  public int lerpLevels;
  public int maxLerpLevels;
  public int gifFrameDelay;
  public int minNumberOfArtifacts = 100;
  public int maxNumberOfArtifacts = 3000;
  public int numberOfArtifacts;

  Options() {
    backgroundColor = randomColor();
    clear = random(1) < 0.5;
    delaunay = random(1) < 0.5;
    drawArtifacts = random(1) < 0.6667;
    drawLine = !drawArtifacts || random(1) < 0.5;
    lerp = random(1) < 0.5;
    attraction = random(minAttraction, maxAttraction);
    mass = 100000;
    maxLerpLevels = 3;
    lerpLevels = lerp ? 1 : (int)random(maxLerpLevels);
    gifFrameDelay = 100;
    numberOfArtifacts = int(random(minNumberOfArtifacts, maxNumberOfArtifacts));
    voronoi = random(1) < 0.5;
    println("Attraction: " + attraction);
    println("Draw artifacts: " + drawArtifacts);
    println("Draw line: " + drawLine);
    println("Number of artifacts: " + numberOfArtifacts);
  }
}

