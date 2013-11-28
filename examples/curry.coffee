# manual currying
add = (a, b) -> a + b

addCurried = (a) ->  (b) -> a + b

console.log addCurried(1)
console.log addCurried(1)(1)

# | 
# v







# automatic currying
curry = require('./lib.coffee').curry

console.log curry(add)(1)
console.log curry(add)(1)(1)
console.log curry(add)(1, 1)