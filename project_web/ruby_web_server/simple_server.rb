require 'socket'

server = TCPServer.new(2000)					# Socket to listen from port 2000
loop { 											# Server runs forever
  client = server.accept						# Wait for a client to connect to the server
  client.puts(Time.now.ctime)					# Send current time to the client
  client.puts "Closing the connection, bye!"	
  client.close									# Disconnect from the client
}
