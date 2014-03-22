public class Controller {
  ArrayList<Artifact> artifacts;
  ArrayList<DelaunayTriangle> triangles;
  boolean restartRequested;
  DelaunayTriangulation delaunay;
  Options options;
  RemoteControlCommunication communication;
  Triangulate triangulate;
  Controller() {
    delaunay = new DelaunayTriangulation();
    options = new Options();
    communication = new RemoteControlCommunication(this, options);
    artifacts = new ArrayList<Artifact>();
    restartRequested = false;
    triangulate = new Triangulate();
    createArtifacts();
  }
  private void createArtifacts() {
    for(int i = 0; i < options.numberOfArtifacts; i++) {
      Artifact artifact = new Point();
      artifacts.add(artifact);
    }
  }
  public void draw() {
    if(options.clear) {
      noStroke();
      fill(options.backgroundColor);
      rect(0, 0, width, height); // The background() function doesn't seem to allow the use of alpha, so we draw a rectangle instead
    }
    if(options.delaunay || options.voronoi) {
      triangles = triangulate.triangulate(artifacts);
      if(options.delaunay) {
        delaunay.drawTriangles(triangles);
      }
    }
    int nArtifacts = artifacts.size();
    for(int i = 0; i < nArtifacts; i++) {
      Artifact artifact = artifacts.get(i);
      if(options.voronoi) {
        PVector p = artifact.position;
        int nTriangles = triangles.size();
        for (int j = 0; j <nTriangles; j++) {
          DelaunayTriangle triangle = (DelaunayTriangle)triangles.get(j);
          //if((triangle.p1.x == p.x && triangle.p1.y == p.y) || (triangle.p2.x == p.x && triangle.p2.y == p.y) || (triangle.p3.x == p.x && triangle.p3.y == p.y)) {
          if(triangle.a1 == artifact || triangle.a2 == artifact || triangle.a3 == artifact) {
          //if(triangle.artifacts.contains(artifact)) {
            artifact.addTriangle(triangle);
          }
        }
        artifact.drawVoronoi();
      }
      Artifact closestArtifact = artifact.getClosestArtifact(artifacts);
      if(options.drawArtifacts) {
        artifact.display();
      }
      if(options.drawLine) {
        color lineColor = lerpColor(artifact.baseColor, closestArtifact.baseColor, 0.5);
        stroke(lineColor);
        line(artifact.position.x, artifact.position.y, closestArtifact.position.x, closestArtifact.position.y);
      }
      artifact.update();
      PVector difference = artifact.differenceTo(closestArtifact);
      artifact.acceleration = new PVector(difference.x * options.attraction / options.mass, difference.y * options.attraction / options.mass);
    }
  }
  public void update() {
    if(restartRequested) {
      restart();
      restartRequested = false;
    }
    while(artifacts.size() < options.numberOfArtifacts) {
      artifacts.add(new Point());
    }
    while(artifacts.size() > options.numberOfArtifacts) {
      artifacts.remove(0);
    }
  }
  public void restart() {
    artifacts.clear();
    createArtifacts();
  }
  public void requestRestart() {
    restartRequested = true;
  }
}
