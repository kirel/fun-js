_ = require('../node_modules/underscore')
wu = require('../node_modules/wu').wu

curry = wu.autoCurry
exports.curry = curry
compose = wu.compose
exports.compose = compose
apply = curry (fn, args) -> fn.apply(@, args)
exports.apply = apply

falsy = (arg) -> !arg
truthy = compose(falsy, falsy)
truth = (fun) -> compose(truthy, fun)
exports.truthy = truthy
exports.falsy = falsy
exports.truth = truth

reverse = (ary) -> ary.reverse()
exports.reverse = reverse
flip = (f) -> (args...) -> apply(f, reverse(args))
exports.flip = flip

map = curry (mappable, fun) -> mappable.map fun
mapWith = curry (fun, mappable) -> mappable.map fun
# mapWith = flip map # doesn't always work because of variadic signature
exports.map = map
exports.mapWith = mapWith

filter = curry (filterable, fun) -> filterable.filter fun
filterWith = curry (fun, filterable) -> filterable.filter fun
# filterWith = flip filter map # doesn't always work because of variadic signature
exports.filter = filter
exports.filterWith = filterWith