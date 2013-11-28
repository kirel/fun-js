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

# Freiwillige vor!

# |
# v









splitLines = split("\n")
splitFields = split(";")

toMatrix = compose(mapWith(splitFields), splitLines)
object = curry _.object
toObjects = (ary) -> mapWith(object(_.first(ary)), _.rest(ary))

parse = compose(toObjects, toMatrix)

# console.log parse csv

# |
# v










{apply, id} = require('./lib.coffee')

# Datentyp Pair

Pair = (@fst, @snd) -> null
# Funktion mit fst und snd als Parameter ausführen
Pair.prototype.apply = (f) -> f.apply(this, [@fst, @snd])

applyPair = curry (f, p) -> p.apply(f)

mapFst = curry (f, p) -> new Pair(f(p.fst),  p.snd)
mapSnd = curry (f, p) -> new Pair(p.fst,  f(p.snd))

toHeadTailPair = (ary) -> new Pair(_.first(ary), _.rest(ary))

# Implementierung auf Basis der Abstraktion

parse = compose(
  applyPair(mapWith),
  mapFst(object),
  toHeadTailPair,
  toMatrix
)

# console.log parse csv