n = do -> i = 0; -> i++
# n = function() { var i = 0; return function () { return i++; } }()

console.log n()
console.log n()
console.log n()