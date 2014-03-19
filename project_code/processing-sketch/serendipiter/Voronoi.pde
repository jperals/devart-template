public class Voronoi {
  PVector artifactPosition;
  Voronoi(PVector p) {
    artifactPosition = p;
  }
  public class slopeComparator implements Comparator<PVector> {
      public int compare(PVector p1, PVector p2) {
        PVector d1 = new PVector(p1.x-artifactPosition.x, p1.y-artifactPosition.y);
        PVector d2 = new PVector(p2.x-artifactPosition.x, p2.y-artifactPosition.y);
        if(d1.heading() > d2.heading()) {
          return(1);
        }
        else {
          return(-1);
        }
      }
  }
  public ArrayList<PVector> getCircumcenters(ArrayList<Triangle> triangles) {
    ArrayList<PVector> points = new ArrayList<PVector>();
    int nTriangles = triangles.size();
    for(int i = 0; i < nTriangles; i++) {
      Triangle t = triangles.get(i);
      if(t == null) {
        println("triangle is null");
        continue;
      }
      PVector origin1 = new PVector((t.p1.x + t.p2.x)/2, (t.p1.y + t.p2.y)/2);
      PVector samplePoint1 = new PVector(origin1.x + (origin1.y - t.p1.y), origin1.y - (origin1.x - t.p1.x));
      PVector origin2 = new PVector((t.p2.x + t.p3.x)/2, (t.p2.y + t.p3.y)/2);
      PVector samplePoint2 = new PVector(origin2.x + (origin2.y - t.p2.y), origin2.y - (origin2.x - t.p2.x));
      PVector circumCenter = lineIntersection(origin1.x, origin1.y, samplePoint1.x, samplePoint1.y, origin2.x, origin2.y, samplePoint2.x, samplePoint2.y);
      points.add(new PVector(circumCenter.x, circumCenter.y));
      /*println("debug:");
      println("t");
      println(t.p1.x);
      println(t.p1.y);
      println(t.p2.x);
      println(t.p2.y);
      println(t.p3.x);
      println(t.p3.y);
      println("origin1");
      println(origin1.x);
      println(origin1.y);
      println("samplePoint1");
      println(samplePoint1.x);
      println(samplePoint1.y);
      println("origin2");
      println(origin2.x);
      println(origin2.y);
      println("samplePoint2");
      println(samplePoint2.x);
      println(samplePoint2.y);
      println("circumCenter");
      println(circumCenter.x);
      println(circumCenter.y);*/
    }
    Collections.sort(points, new slopeComparator());
    return points;
  }
}
