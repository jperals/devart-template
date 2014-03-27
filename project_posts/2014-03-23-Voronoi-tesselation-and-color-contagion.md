After adding [Delaunay triangulation](http://en.wikipedia.org/wiki/Delaunay_triangulation) to my project, it seemed a kind of logical step to also incorporate its geometrical brother, the [Voronoi tesselation](http://en.wikipedia.org/wiki/Voronoi_tessellation). So, I did, even though it took quite some effort. On the other hand, as I said in my previous post, I have started to take care of colour a little more. This and other small additions now make our possibilities somewhat richer.

Let's see all this with examples.

This first image exemplifies most of the recently added features:

![Voronoi tesselation and attraction-repulsion without inertia](https://raw.githubusercontent.com/jperals/devart-template/master/project_images/2014-03-23/capture-2014-03-23.22.08.18-00.gif "Voronoi tesselation and attraction-repulsion without inertia")

- Voronoi tesselation (optional), with an extra option that lets each Voronoi polygon render several times in different sizes, concentrically. In this case, it's rendered twice.
- Color "contagion": each artifact gradually gets its nearest neighbour's color. This creates different regions with more interesting color relationships, which eventually merge very gradually. When rendering Voronoi diagrams with multiple concentric polygons, each polygon uses a corresponding interpolation between its original color and its closest neighbour's color.
- Optional inertia: I realized that directly displacing each artifact by an amount proportional to the distance to its closest neighbor had more interesting effects than using acceleration and speed. Here, we can see what happens if we disable inertia and increase attraction above zero (the artifacts gather in small groups) or decrease it to negative values (the artifacts tend to form a quasi regular mesh).


![Line to closest artifact without using inertia](project_images/2014-03-23/screenshot-2014-03-23.22.23.26-000238.png?raw=true "Line to closest artifact without using inertia")

Just displaying the line from each artifact to its closest neighbour can also have interesting effects when disabling inertia and making attraction negative.


![Points with inertia](project_images/2014-03-23/screenshot-2014-03-23.22.37.56-000796.png?raw=true "Points with inertia")

Still, inertia seems to play well when rendering traces. Here, we render the artifacts as just points (with their gradually converging colors), without clearing the previous frame, with some negative attraction and inertia enabled.
