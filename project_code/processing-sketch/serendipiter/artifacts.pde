class Artifact
  constructor: ->
    this.color = randomColor()
    this.translationStep = new PVector((Math.random() - 0.5) * width * 0.1, (Math.random() - 0.5) * height * 0.1)
    this.pointTranslationStep = new PVector((Math.random() - 0.5) * width * 0.001, (Math.random() - 0.5) * height * 0.001)
  update: ->
    for mutation in this.mutations
      mutation(this)
  distanceTo: (artifact) ->
    return dist(this.position.x, this.position.y, artifact.position.x, artifact.position.y)
  differenceTo: (artifact) ->
    return new PVector(artifact.position.x - this.position.x, artifact.position.y - this.position.y)
  getClosestArtifact: (artifacts) ->
    minimumDistanceFound = null
    closestArtifactFound = null
    for artifact in artifacts
      distance = this.distanceTo(artifact)
      if artifact isnt this and ( not minimumDistanceFound? or not closestArtifactFound? or distance < minimumDistanceFound )
        minimumDistanceFound = distance
        closestArtifactFound = artifact
    return closestArtifactFound
  getClosestArtifacts: (artifacts) ->
    that = this
    closestArtifacts = artifacts
    closestArtifacts.sort (a, b) ->
      return if that.distanceTo(a) < that.distanceTo(b) then -1 else 1
    return closestArtifacts


class Point extends Artifact
  constructor: (mutations) ->
    super
    this.mutations = randomSelection(Point.prototype.possibleMutations)
    this.acceleration = new PVector((Math.random() - 0.5) * width * 0.00001, (Math.random() - 0.5) * width * 0.00001)
    this.position = new PVector(Math.random() * width, Math.random() * height)
  draw: ->
    stroke red(this.color), green(this.color), blue(this.color), alpha(this.color)
    point this.position.x, this.position.y
  possibleMutations: [
    (artifact) ->
      artifact.position.x += artifact.pointTranslationStep.x
      artifact.position.y += artifact.pointTranslationStep.y
    (artifact) ->
      artifact.pointTranslationStep.x += artifact.acceleration.x
      artifact.pointTranslationStep.y += artifact.acceleration.y
  ]


class Triangle extends Artifact
  constructor: ->
    super
    this.angle = randomAngle()
    this.mutations = randomSelection(Triangle.prototype.possibleMutations, 3)
    this.points = [randomPosition(), randomPosition(), randomPosition()]
    this.position = randomPosition()
    this.rotationStep = (Math.random() - 0.5) * TWO_PI * 0.001
  draw: ->
    noStroke()
    fill red(this.color), green(this.color), blue(this.color), alpha(this.color)
    pushMatrix()
    translate this.position.x, this.position.y
    rotate this.angle
    triangle this.points[0].x, this.points[0].y, this.points[1].x, this.points[1].y, this.points[2].x, this.points[2].y
    popMatrix()
  possibleMutations: [
    (artifact) ->
      artifact.angle += artifact.rotationStep
    (artifact) ->
      artifact.position.x += artifact.translationStep.x
      artifact.position.y += artifact.translationStep.y
    (artifact) ->
      artifact.points[0].x += artifact.pointTranslationStep.x
      artifact.points[0].y += artifact.pointTranslationStep.y
    (artifact) ->
      artifact.points[1].x += artifact.pointTranslationStep.x
      artifact.points[1].y += artifact.pointTranslationStep.y
    (artifact) ->
      artifact.points[2].x += artifact.pointTranslationStep.x
      artifact.points[2].y += artifact.pointTranslationStep.y
  ]

