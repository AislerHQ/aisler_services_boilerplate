require 'bundler'
Bundler.require :default
require 'your_services_gem'

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

class CalculatorHandler
  def initialize
  end

  def add(a, b)
    a + b
  end
  
end

processor = AislerServices::Calculator::Processor.new(CalculatorHandler.new())
transport = Thrift::ServerSocket.new(ARGV[0])
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::ThreadedServer.new(processor, transport, transportFactory)

puts "Starting..."
server.serve()
puts "Stopped"