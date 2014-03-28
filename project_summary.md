# Serendipiter

## Authors
- Joan Perals Tresserra, http://github.com/jperals

## Description
This project started as a Processing sketch with heavy dependency on random decisions, just to create effects that would eventually help me get inspired. Randomness has been a key part of the so-called "computer art", and it has helped many people create new interesting forms --but, how far can we actually go with that concept?

Here I'm following a kind of constant dialogue, on one side trying to leave as much room as possible for serendipity, while at the same time constraining the program to certain basic rules that obey to my own aesthetic judgment.

The project currently consists of two Processing sketches, one that generates graphics and the other that allows a user to tweak some parameters live. The second sketch can be run both on a computer on or an Android device, and several people can use it at the same time. In a public installation, visitors could use their Android device to interact simultaneously.

## Example Code
The project is based on Processing. In the "serendipiter" sketch we have many objects of the class "Artifact" randomly generated, that we then can draw in many ways. This function that displays it as a custom [Voronoi cell](http://en.wikipedia.org/wiki/Voronoi_tessellation), drawing as many concentrical polygons as indicated by the variable "lerpLevels":
```
  public void drawVoronoi(boolean lerp, int lerpLevels) {
    Voronoi voronoi = new Voronoi(position);
    ArrayList<PVector> circumcenters = voronoi.getCircumcenters(triangles);
    int nCircumcenters = circumcenters.size();
    if(nCircumcenters > 2) {
      pushStyle();
      if(!lerp) {
        fill(displayColor);
      }
      noStroke();
      pushMatrix();
      translate(position.x, position.y);
      PVector firstPoint = circumcenters.get(0);
      PVector lastPoint = firstPoint;
      for(int i = lerpLevels; i > 0; i--) {
        float lerpAmount = float(i)/lerpLevels;
        pushStyle();
        if(lerp) {
          fill(lerpColor(baseColor, displayColor, lerpAmount));
        }
        pushMatrix();
        scale(float(i)/lerpLevels);
        for(int j = 1; j < nCircumcenters; j++) {
          PVector point = circumcenters.get(j);
          triangle(0, 0, lastPoint.x, lastPoint.y, point.x, point.y);
          lastPoint = point;
        }
        triangle(0, 0, lastPoint.x, lastPoint.y, firstPoint.x, firstPoint.y);
        lastPoint = firstPoint;
        popMatrix();
        popStyle();
      }
      popMatrix();
      popStyle();
    }
  }
}
```

## Images & Videos

![Screenshot](project_images/screenshot-2014-03-28.17.38.46-006639.png?raw=true "Screenshot")

![Screenshot](https://raw.githubusercontent.com/jperals/devart-template/master/project_images/2014-03-23/capture-2014-03-23.22.08.18-00.gif "Screenshot")

[![Link to Youtube video](project_images/2014-03-25/vlcsnap-2014-03-25-01h26m37s32.png?raw=true "Link to Youtube video")](http://youtu.be/4QSZSoGUKc4)
