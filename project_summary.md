# Serendipiter

## Authors
- Joan Perals Tresserra, http://github.com/jperals

## Description
This project started as a Processing sketch with heavy dependency on random decisions, just to create effects that would eventually help me get inspired. Randomness has been a key part of the so-called "computer art", and it has helped many people create new interesting forms --but, how far can we actually go with that concept?

Here I'm following a kind of constant dialogue, on one side trying to leave as much room as possible for serendipity, while at the same time constraining the program to certain basic rules that obey to my own aesthetic judgment.

But a bigger challenge is to make the process transparent to the viewer. Ideally, the output of the sketch would be not only an animation but also a generated code that can be related to the result.

## Example Code
Currently the project has the form of a Processing sketch in Coffeescript mode.
Among other things, this allows me to execute functions that I pick randomly, e.g, from an array.
Consider the class "Artifact". Note the "update" method which is called at each iteration from the main loop:

```
class Artifact
  constructor: ->
    this.color = randomColor()
    this.translationStep = new PVector((Math.random() - 0.5) * width * 0.1, (Math.random() - 0.5) * height * 0.1)
    this.pointTranslationStep = new PVector((Math.random() - 0.5) * width * 0.001, (Math.random() - 0.5) * height * 0.001)
  update: ->
    for mutation in this.mutations
      mutation(this)
(...)
```

This method calls all the functions inside the "mutations" array that lives inside every artifact. But this set of mutations is different for each type of artifact. For example, points just move their position and/or their speed:

```
class Point extends Artifact
  constructor: ->
    super
    this.mutations = randomSelection(Point.prototype.possibleMutations)
(...)
  possibleMutations: [
    (artifact) ->
      artifact.position.x += artifact.pointTranslationStep.x
      artifact.position.y += artifact.pointTranslationStep.y
    (artifact) ->
      artifact.pointTranslationStep.x += artifact.acceleration.x
      artifact.pointTranslationStep.y += artifact.acceleration.y
  ]
```
## Images & Videos

![Screenshot](project_images/cover.png?raw=true "Screenshot")
