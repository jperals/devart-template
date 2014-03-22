public class Options {
  public boolean clear, delaunay, drawArtifacts, drawLine, voronoi;
  public color backgroundColor;
  public float attraction, mass;
  public int numberOfArtifacts;
  private float minAttraction = -0.005;
  private float maxAttraction = 0.005;
  public int minNumberOfArtifacts = 100;
  public int maxNumberOfArtifacts = 3000;

  Options() {
    backgroundColor = randomColor();
    clear = random(1) < 0.5;
    delaunay = random(1) < 0.5;
    drawArtifacts = random(1) < 0.6667;
    drawLine = !drawArtifacts || random(1) < 0.5;
    attraction = random(minAttraction, maxAttraction);
    mass = 100;
    numberOfArtifacts = int(random(minNumberOfArtifacts, maxNumberOfArtifacts));
    this.voronoi = random(1) < 0.5;
    println("Attraction: " + attraction);
    println("Draw artifacts: " + drawArtifacts);
    println("Draw line: " + drawLine);
    println("Number of artifacts: " + numberOfArtifacts);
  }
}

