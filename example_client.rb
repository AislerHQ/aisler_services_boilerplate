require 'your_services_gem'

transport = Thrift::BufferedTransport.new(Thrift::Socket.new('service.endpoint.example', 12345))
protocol = Thrift::BinaryProtocol.new(transport)
transport.open

client = AislerServices::Calculator::Client.new(protocol)
puts client.add(10, 5)


### OR use this this helper

module AislerServicesLib
  def self.get(service, opts = {}, &block)
    transport = Thrift::BufferedTransport.new(Thrift::Socket.new(opts[:host] || 'service.endpoint.example', opts[:port] || 123456))
    protocol = Thrift::BinaryProtocol.new(transport)
    client = service::Client.new(protocol)
    transport.open
  
    yield client

    transport.close
  end
end

AislerServicesLib.get(AislerServices::Calculator) do |client|
  puts client.add(10, 5)
end