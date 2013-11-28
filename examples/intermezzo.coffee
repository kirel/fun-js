{curry} = require('./lib.coffee')

get = curry (p, o) -> o[p]

console.log get('coffee')({coffee: 'Espresso'})

# | 
# v







{mapWith} = require('./lib.coffee')

pluck = curry (prop, ary) -> mapWith(get(prop), ary)

fruits = [
  {name: 'strawberry', color: 'red'},
  {name: 'banana', color: 'yellow'},
  {name: 'coffee', color: 'purple'}
]

# console.log pluck('color', fruits)

getColors = pluck('color')
# console.log getColors(fruits)

# | 
# v







modulo = curry (a, b) -> a % b
flip2 = (fun) -> curry (b, a) -> fun(a, b)
oludom = flip2 modulo

truth = (fun) -> (args...) -> !!fun.call(@, args)
isOdd = truth oludom(2)

# console.log {1: isOdd(1), 2: isOdd(2)}

# | 
# v







{filterWith} = require('./lib.coffee')

# unary = (fun) -> (args...) -> fun.call(@, [args.shift()])
# isOdd = unary truth oludom(2)

numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# console.log filterWith(isOdd, numbers)