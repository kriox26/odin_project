require 'socket'
require 'json'

def handle_post
  print "Name of the viking: "
  name = gets.chomp
  print "Viking's email: "
  email = gets.chomp
  data = { :viking => {:name => name, :email => email} }
  body = data.to_json
  request = "POST /thanks.html HTTP/1.1\r\nContent-Length: #{data.to_json.length}\r\n\r\n#{body}"
end

def handle_get
  print "File name to get: "
  file = gets.chomp 
  request = "GET " + file + " HTTP/1.1\r\n\r\n"
end

def display_menu_and_get
  puts "Command line Browser."
  puts "Select an option: "
  puts "\t1. Issue a GET request"
  puts "\t2. Issue a POST request"
  puts "\t3. Exit"
  print "Selection(1,2,3): "
  get_input
end

def get_input
  type = gets.chomp
end

host = 'localhost'
port = 2000

loop {
  socket = TCPSocket.open(host, port)
  type = display_menu_and_get
  request = ""
  case type
	when "1" then request  = handle_get
	when "2" then request = handle_post
	when "3" then exit
	else 
	  puts "Wrong input"
  end
  puts request
  socket.print(request)
  response = socket.read
  headers, body = response.split("\r\n\r\n", 2)
  puts headers
  puts body
}

