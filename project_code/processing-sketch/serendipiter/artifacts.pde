class Artifact {
  public PVector acceleration;
  public color baseColor;
  public PVector position;
  public PVector speed;
  Artifact() {
    acceleration = new PVector(0, 0);
    baseColor = randomColor();
    position = randomPosition();
    speed = new PVector(0, 0);
  }
  public void display() {}
  public void update() {}
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
}

class Point extends Artifact {
  Point() {
    super();
  }
  public void display() {
    stroke(this.baseColor);
    point(this.position.x, this.position.y);
  }
  public void update() {
    position.x += speed.x;
    position.y += speed.y;
    speed.x += acceleration.x;
    speed.y += acceleration.y;
  }
}

