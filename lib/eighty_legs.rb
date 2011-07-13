require 'zlib'

module EightyLegs
  autoload :EightyFormat, 'eighty_legs/eighty_format'
  autoload :Entry, 'eighty_legs/entry'

  class EightyError < StandardError; end
end
