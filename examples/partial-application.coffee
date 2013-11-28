add = (a, b) -> a + b

partial1 = (fun, arg) ->
  (remainingArgs...) -> fun.apply(@, [arg].concat(remainingArgs))

add5 = partial1(add, 5)

console.log add5(5)