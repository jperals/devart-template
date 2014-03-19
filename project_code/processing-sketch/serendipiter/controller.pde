public class Controller {
  ArrayList<Artifact> artifacts;
  ArrayList<Triangle> triangles;
  Options options;
  RemoteControlCommunication communication;
  Controller() {
    options = new Options();
    communication = new RemoteControlCommunication(options);
    artifacts = new ArrayList<Artifact>();
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
      triangles = Triangulate.triangulate(artifacts);
      if(options.delaunay) {
        stroke(0, 40);
        fill(0, 0, 0 ,0);
        beginShape(TRIANGLES);
        for (int i = 0; i < triangles.size(); i++) {
          Triangle t = (Triangle)triangles.get(i);
          vertex(t.p1.x, t.p1.y);
          vertex(t.p2.x, t.p2.y);
          vertex(t.p3.x, t.p3.y);
        }
        endShape();
      }
    }
    int nArtifacts = artifacts.size();
    for(int i = 0; i < nArtifacts; i++) {
      Artifact artifact = artifacts.get(i);
      if(options.voronoi) {
        PVector p = artifact.position;
        for (int j = 0; j < triangles.size(); j++) {
          Triangle triangle = (Triangle)triangles.get(j);
          if((triangle.p1.x == p.x && triangle.p1.y == p.y) || (triangle.p2.x == p.x && triangle.p2.y == p.y) || (triangle.p3.x == p.x && triangle.p3.y == p.y)) {
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
    while(artifacts.size() < options.numberOfArtifacts) {
      artifacts.add(new Point());
    }
    while(artifacts.size() > options.numberOfArtifacts) {
      artifacts.remove(0);
    }
  }
}
