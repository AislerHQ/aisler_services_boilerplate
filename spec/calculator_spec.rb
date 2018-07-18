require 'spec_helper'

describe Calculator do
  let :client do
    transport = Thrift::BufferedTransport.new(Thrift::Socket.new('service.endpoint.example', 12345))
    protocol = Thrift::BinaryProtocol.new(transport)
    transport.open

    Calculator::Client.new(protocol)
  end

  it 'should respond to ping' do
    expect(client.ping).to eq('pong')
  end
  
  it 'should add to integers' do
    expect(client.add(10, 5)).to eq(15)
  end

end