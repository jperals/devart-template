public class Artifact {
  public PVector acceleration;
  public color baseColor;
  public Artifact closestArtifact;
  public color displayColor;
  public float distanceToClosestArtifact;
  public PVector position;
  public PVector speed;
  ArrayList<DelaunayTriangle> triangles;
  Artifact() {
    this(randomX(), randomY());
  }
  Artifact(float x, float y) {
    acceleration = new PVector(0, 0);
    baseColor = randomColor();
    closestArtifact = this;
    displayColor = baseColor;
    distanceToClosestArtifact = -1;
    position = new PVector(x, y);
    speed = new PVector(0, 0);
    triangles = new ArrayList<DelaunayTriangle>();
  }
  public void addTriangle(DelaunayTriangle t) {
    triangles.add(t);
  }
  public void display() {}
  public void update() {
    triangles.clear();
    position.x += speed.x;
    position.y += speed.y;
    speed.x += acceleration.x;
    speed.y += acceleration.y;
    float lerpAmount = 0.5/distanceToClosestArtifact;
    displayColor = lerpColor(displayColor, closestArtifact.displayColor, lerpAmount);
  }
  public PVector differenceTo(Artifact artifact) {
    return new PVector(artifact.position.x - position.x, artifact.position.y - position.y);
  }
  public float distanceTo(Artifact artifact) {
    return dist(position.x, position.y, artifact.position.x, artifact.position.y);
  }
  public Artifact getClosestArtifact(ArrayList<Artifact> artifacts) {
    float minimumDistanceFound = -1;
    Artifact closestArtifactFound = null;
    int numberOfArtifacts = artifacts.size();
    for(int i = 0; i < numberOfArtifacts; i++) {
      Artifact artifact = artifacts.get(i);
      float distance = distanceTo(artifact);
      if(artifact != this && (minimumDistanceFound == -1 || closestArtifactFound == null || distance < minimumDistanceFound)) {
        minimumDistanceFound = distance;
        closestArtifactFound = artifact;
      }
    }
    closestArtifact = closestArtifactFound;
    distanceToClosestArtifact = minimumDistanceFound;
    return closestArtifactFound;
  }
  public void drawVoronoi() {
    Voronoi voronoi = new Voronoi(position);
    ArrayList<PVector> circumcenters = voronoi.getCircumcenters(triangles);
    int nCircumcenters = circumcenters.size();
    if(nCircumcenters > 2) {
      pushStyle();
      fill(displayColor);
      noStroke();
      pushMatrix();
      translate(position.x, position.y);
      PVector firstPoint = circumcenters.get(0);
      PVector lastPoint = firstPoint;
      for(int i = 1; i < nCircumcenters; i++) {
        PVector point = circumcenters.get(i);
        triangle(0, 0, lastPoint.x, lastPoint.y, point.x, point.y);
        lastPoint = point;
      }
      triangle(0, 0, lastPoint.x, lastPoint.y, firstPoint.x, firstPoint.y);
      popMatrix();
      popStyle();
    }
  }
}

class Point extends Artifact {
  Point() {
    super();
  }
  public void display() {
    pushStyle();
    stroke(displayColor);
    point(position.x, position.y);
    popStyle();
  }
}

