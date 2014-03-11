setup: ->

  @ATTRACTION = random(-1/10000, 1/10000)
  @DRAW_ARTIFACTS = Math.random() < .6667
  @DRAW_LINE = not @DRAW_ARTIFACTS or Math.random() < .5
  @CLEAR = Math.random() > .5
  N_ARTIFACTS = 500
  
  println "attraction factor: " + @ATTRACTION
  println "draw artifacts: " + @DRAW_ARTIFACTS
  println "draw line: " + @DRAW_LINE
  println "clear: " + @CLEAR
  println "number of artifacts: " + N_ARTIFACTS

  size 1000, 500

  @BG_COLOR = randomColor()
  
  @artifacts = []
  for i in [0..N_ARTIFACTS]
    artifact = new Point()
    @artifacts.push artifact

  background @BG_COLOR

draw: ->
  if @CLEAR
    noStroke()
    fill @BG_COLOR
    rect 0, 0, width, width
  for artifact in @artifacts
    closestArtifact = artifact.getClosestArtifact(@artifacts)
    if @DRAW_ARTIFACTS
      artifact.draw()
    if @DRAW_LINE
      stroke artifact.color
      line artifact.position.x, artifact.position.y, closestArtifact.position.x, closestArtifact.position.y
    artifact.update()
    difference = artifact.differenceTo(closestArtifact)
    artifact.acceleration = new PVector(difference.x * @ATTRACTION, difference.y * @ATTRACTION)

