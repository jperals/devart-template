This project is about exploring in a different way and as much as possible what algorithms can create visually. For this I created my "Artifact" class that aims to be as abstract as possible, and my strategy currently consists in exploring the *relationships* that these artifacts and associate them to different visual behaviours.

Basically, so far I've been using the proximity relationship and very simple rules, i.e, draw a line to the closest neighbour, or attraction/repulsion. It's the combination (and/or the way to combine) of all these rules that aims to make the program interesting.

And it was about time to start adding some more vocabulary. So, today, Delaunay triangulation landed into my sketch.

![Screenshot](project_images/screenshot-2014-03-16.20.46.13-003224.png?raw=true "Screenshot")
This picture shows the effect of Delaunay triangulation (black) combined with my simple line-to-closest-neighbour rule (purple). When the artifacts move (because of attraction/repulsion forces) and the previous frames are not being cleared, the accumulation of Delaunay triangles creates a sort of "broken glass" effect.

Voronoi tesselation might come soon, too. But also the need of a better, more meaningful treatment of color is calling my attention now.
