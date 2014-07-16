csv = """
firstName;lastName
Jack;Drake
Ben;James
Tim;Banes
"""

# people = [{firstName: 'Jack', lastName: 'Drake'}, ...]

_ = require('underscore')
{curry, compose, mapWith} = require('./lib.coffee')

split = curry (sep, str) -> str.split sep
join = curry (sep, str) -> str.join sep

# |
# v









splitLines = split("\n")
splitFields = split(";")

toMatrix = compose(mapWith(splitFields), splitLines)
# console.log toMatrix csv

object = curry _.object
# _.object(['fred', 'barney'], [30, 40])
# → { 'fred': 30, 'barney': 40 }
toObjects = (ary) -> mapWith(object(_.first(ary)), _.rest(ary))

parse = compose(toObjects, toMatrix)

# console.log parse csv

# |
# v










# Let's add more abstraction: Datatype Pair

Pair = (@fst, @snd) -> null
Pair.prototype.apply = (f) -> f.apply(this, [@fst, @snd])

applyPair = curry (f, p) -> p.apply(f)

mapFst = curry (f, p) -> new Pair(f(p.fst),  p.snd)
mapSnd = curry (f, p) -> new Pair(p.fst,  f(p.snd))

toHeadTailPair = (ary) -> new Pair(_.first(ary), _.rest(ary))

# Impementation based on Pair is even nicer...

parse = compose(
  applyPair(mapWith),
  mapFst(object),
  toHeadTailPair,
  toMatrix
)

# console.log parse csv
