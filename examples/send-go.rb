require 'qlabio'

username = ENV['QLABIO_USERNAME']
password = ENV['QLABIO_PASSWORD']

qlab = QLabIo.connect(username, password)

puts "Found machines: #{ qlab.machines.map(&:name) }"

machine = qlab.machines.first

machine.command('/stop')
machine.command('/select/1')
machine.command('/go')
