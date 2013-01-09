# 80legs

## Usage

```ruby
require 'eighty_legs'
f = EightyLegs::EightyFormat.new("sample_file.80")
f.each do |entry|
  puts entry.url
  puts entry.data
end
```

Note: If an IO is passed in instead of a file name, then that instance of IO needs to be managed (closed) manually.

## Compatibility

* Ruby 1.8.7

## Contributing to 80legs
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Jan Szumiec. See LICENSE.txt for further details.

