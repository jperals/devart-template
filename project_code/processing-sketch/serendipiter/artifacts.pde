class Artifact {
  public PVector acceleration;
  public color baseColor;
  public PVector position;
  public PVector speed;
  ArrayList<DelaunayTriangle> triangles;
  Artifact() {
    acceleration = new PVector(0, 0);
    baseColor = randomColor();
    position = randomPosition();
    speed = new PVector(0, 0);
    triangles = new ArrayList<DelaunayTriangle>();
  }
  public void addTriangle(DelaunayTriangle t) {
    triangles.add(t);
  }
  public void display() {}
  public void update() {
    triangles.clear();
    //println("clear triangles");
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
    return closestArtifactFound;
  }
  public void drawVoronoi() {
    Voronoi voronoi = new Voronoi(position);
    ArrayList<PVector> circumcenters = voronoi.getCircumcenters(triangles);
    int nCircumcenters = circumcenters.size();
    //voronoiShape.fill(255, 63, 127);
    //println("nTriangles: " + triangles.size());
    //println("nPoints: " + nPoints);    
    if(nCircumcenters > 2) {
      pushStyle();
      stroke(this.baseColor);
      fill(this.baseColor);
      PVector firstPoint = circumcenters.get(0);
      PVector lastPoint = firstPoint;
      for(int i = 1; i < nCircumcenters; i++) {
        PVector point = circumcenters.get(i);
        triangle(this.position.x, this.position.y, lastPoint.x, lastPoint.y, point.x, point.y);
        lastPoint = point;
      }
      triangle(this.position.x, this.position.y, lastPoint.x, lastPoint.y, firstPoint.x, firstPoint.y);
      popStyle();
    }
  }
}

class Point extends Artifact {
  Point() {
    super();
  }
  public void display() {
    stroke(this.baseColor);
    point(position.x, position.y);
  }
  public void update() {
    triangles.clear();
    //println("clear triangles");
    position.x += speed.x;
    position.y += speed.y;
    speed.x += acceleration.x;
    speed.y += acceleration.y;
  }
}

