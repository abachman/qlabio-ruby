# QLabIo

## Installation

Install it yourself with:

    $ gem install qlabio-ruby

## Usage

Use it in a script:

```ruby
require 'qlabio'

token = "my-secret-api-token"

qlab = QLabIo.connect(token)

machine = qlab.machines.first

# run a command on a machine, which will be sent to the frontmost QLab workspace
machine.command '/go'

# or send a command directly to a workspace
workspace = machine.workspaces.first
workspace.command '/cue/7.1/start'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
