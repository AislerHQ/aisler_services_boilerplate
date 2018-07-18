require 'your_services_gem'

transport = Thrift::BufferedTransport.new(Thrift::Socket.new('service.endpoint.example', 12345))
protocol = Thrift::BinaryProtocol.new(transport)
transport.open

AislerServices::Calculator::Client.new(protocol)