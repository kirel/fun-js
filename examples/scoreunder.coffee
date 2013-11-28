_ = require('underscore')

# Get peoples initials
names = ['Jack Drake', 'Ben James', 'Tim Banes']
# => initials = ['J. D.', 'B. J.', 'T. B.']









# | 
# v

initials = _.map names, (fullName) ->
  _.map(fullName.split(' '), (name) ->
    _.first(name.split('')) + '.'
  ).join(' ')
  
console.log initials

# | Let's transform this with what we have learnt
# v




# | 
# v





{curry, compose, mapWith} = require('./lib.coffee')

split = curry (sep, str) -> str.split sep
join = curry (sep, str) -> str.join sep
first = _.first
append = curry (suffix, str) -> str + suffix

nameToInitials = compose(
  join(' '),
  mapWith(compose(append('.'), first, split(''))),
  split(' ')
)

# initials = mapWith nameToInitials, names

# console.log initials

# | 
# v







# if you don't line the order of compose
{flip} = require('./lib.coffee')
pipeline = flip(compose)

nameToInitials = pipeline(
  split(' '),
  mapWith(pipeline(split(''), first, append('.'))),
  join(' ')
)

# initials = mapWith nameToInitials, names

# console.log initials