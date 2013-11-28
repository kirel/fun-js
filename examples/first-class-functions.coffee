# functions as variables
fun = ->
console.log fun

# functions as arguments
funArg = (fun) -> console.log fun
funArg(fun)

# functions as return values
funRet = -> ->
console.log funRet()