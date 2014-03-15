class Artifact {
  public PVector acceleration;
  public color baseColor;
  public PVector position;
  public PVector speed;
  Artifact() {
    this.acceleration = new PVector(0, 0);
    this.baseColor = randomColor();
    this.position = randomPosition();
    this.speed = new PVector(0, 0);
  }
  public void display() {}
  public void update() {}
  public PVector differenceTo(Artifact artifact) {
    return new PVector(artifact.position.x - this.position.x, artifact.position.y - this.position.y);
  }
  public float distanceTo(Artifact artifact) {
    return dist(this.position.x, this.position.y, artifact.position.x, artifact.position.y);
  }
  public Artifact getClosestArtifact(ArrayList<Artifact> artifacts) {
    float minimumDistanceFound = -1;
    Artifact closestArtifactFound = null;
    int numberOfArtifacts = artifacts.size();
    for(int i = 0; i < numberOfArtifacts; i++) {
      Artifact artifact = artifacts.get(i);
      float distance = this.distanceTo(artifact);
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
    this.position.x += this.speed.x;
    this.position.y += this.speed.y;
    this.speed.x += this.acceleration.x;
    this.speed.y += this.acceleration.y;
  }
}

