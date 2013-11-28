_ = require('../node_modules/underscore')
wu = require('../node_modules/wu').wu

curry = wu.autoCurry
compose = wu.compose
reverse = (ary) -> ary.reverse()
apply = curry (fn, args) -> fn.apply(@, args)

flip = (f) -> (args...) -> apply(f, reverse(args))

fn = (a, b) -> [a, b]

console.log(fn(1,2))
console.log(flip(fn)(1, 2))