# qlab.io, the gem

## Installation

Install it yourself like this:

    $ git clone https://github.com/abachman/qlabio-ruby.git
    $ cd qlabio-ruby
    $ rake install

For now it only works with Ruby 1.9.3 and up.

## Usage

Use it in a script:

```ruby
require 'qlabio'

username = ENV['QLABIO_USERNAME']
password = ENV['QLABIO_PASSWORD']

qlab = QLabIo.connect(username, password)

puts "Found machines: #{ qlab.machines.map(&:name) }"

machine = qlab.machines.first

machine.command('/stop')
machine.command('/select/1')
machine.command('/go')
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
