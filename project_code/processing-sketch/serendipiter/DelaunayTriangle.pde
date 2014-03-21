public static class DelaunayTriangle {

  public ArrayList<Artifact> artifacts;
  
  public PVector p1, p2, p3;
  
  public DelaunayTriangle() {
    artifacts = new ArrayList<Artifact>();
    p1=null;
    p2=null;
    p3=null; 
  }
  
  public DelaunayTriangle(PVector p1, PVector p2, PVector p3) {
    artifacts = new ArrayList<Artifact>();
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
  }
  
  public DelaunayTriangle(PVector p1, PVector p2, PVector p3, Artifact artifact) {
    this.artifacts = new ArrayList<Artifact>();
    this.artifacts.add(artifact);
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
  }
  
  public boolean sharesVertex(DelaunayTriangle other) {
    return p1 == other.p1 || p1 == other.p2 || p1 == other.p3 ||
           p2 == other.p1 || p2 == other.p2 || p2 == other.p3 || 
           p3 == other.p1 || p3 == other.p2 || p3 == other.p3;
  }
  
}

