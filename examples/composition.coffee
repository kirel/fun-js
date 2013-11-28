{curry} = require('./lib.coffee')

add = curry (a, b) -> a + b
multiply = curry (a, b) -> a * b

plus5 = add 5
double = multiply 2

console.log double(plus5(5))

# | 
# v







compose2 = (snd, fst) -> (arg) -> snd(fst(arg))

plus5thenDouble = compose2 double, plus5

# console.log plus5thenDouble(5)

# | 
# v








{compose} = require('./lib.coffee')

truth = (fun) -> (args...) -> !!fun.call(@, args)

always = K = (arg) -> -> arg
truthy = (arg) -> compose(truth, always)(arg)()

# console.log truthy({}+{})
# console.log truthy([]+[])

# | 
# v






# falsy = (arg) -> !arg
# truthy = compose(falsy, falsy)

# console.log truthy(true)
# console.log falsy(false)

# truth = (fun) -> compose(truthy, fun)

# console.log truth(always(5))()