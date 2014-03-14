As I said yesterday, I wanted some kind of "user" control to replace the current randomness in the application. This way, the effect of these parameters can be seen in real time. So what I did today is write another Processing sketch with some visual controls that communicates with my original sketch through Open Sound Control. The visual controls are built with [ControlP5](http://www.sojamo.de/libraries/controlP5) and the communication is done using [http://www.sojamo.de/libraries/oscP5](oscP5).

Maybe an image helps more to understand the concept:

![Screenshot](project_images/Screenshot%20-%20140314%20-%2022:23:51%20-%20cropped.png?raw=true "Screenshot")

To describe more in depth what's happening, let's first explain from the beginning what the "original" Serendipiter sketch (the one at the left) does. First, we position a certain number of "artifacts" randomly on the canvas. These artifacts are objects with certain properties, e.g position, color... (in principle the color of each of them is also just randomly defined) Other global variables that affect the further behaviour of the sketch are:
- Attraction: how much the artifacts will attract each other. With a negative value, they will repel each other. We use just each artifact's closest neighbour for the calculations.
- backgroundColor: the background color.
- clear: if true, clear the canvas at every draw iteration or not. If not, the artifacts will leave a trace.
- drawPoints: if true, draw one point at the position of each artifact, using its color.
- drawLines: if true, draw one line from each artifact to its closest neighbour.

These global variables used to be just defined randomly when the sketch starts, and now they can be controlled in real time.

Future plans:
- Try the remote control sketch on a different device. Currently I am working on a single machine using localhost.
- Go on making the visual artifact generation richer and more flexible.
