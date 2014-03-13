randomAngle = () ->
  return Math.random() * TWO_PI

randomColor = (alpha) ->
  return color(Math.random()*255, Math.random()*255, Math.random()*255, alpha || Math.random()*255)

randomPosition = () ->
  return new PVector((Math.random() * 3 - 1) * (width), (Math.random() * 3 - 1) * (height))

randomSelection = (set, n) ->
  selection = []
  if n is undefined
    n = set.length - 1
  for i in [1..n]
    j = Math.min(Math.floor(Math.random() * set.length - 1) + 1, set.length - 1)
    item = set[j]
    selection.push item
  return selection

