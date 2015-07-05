require 'socket'
require 'json'

def handle_request(request)
  type = get_type(request)
  case type
  when "GET"
	return h_GET(request)
  when "POST"
	return h_POST(request)
  end
end

def h_GET(request)
  file_to_load = request.split(" ")[1][0..-1]
  if file_to_load == 'index.html'
	return found_response(file_to_load)
  else
	return not_found_response(file_to_load)
  end
end

def h_POST(request)
  headers, body = get_header_body(request)
  params = JSON.parse(body)
  content = modify_file(params["viking"])
  create_response(200,"OK",content)
end

def modify_file(data)
  look_for = "<%= yield %>"
  puts data
  file_content = File.read("thanks.html")
  replace_line = file_content.split("\n").find { |line| line.include?(look_for) }.split.join(" ")
  replace_with = ""
  data.each do |key, value|
	replace_with += replace_line.sub(look_for, "<li>#{key.to_s.capitalize}: #{value.to_s}</li>\n")
	puts key
  end
  file_content.sub(replace_line,replace_with.chomp)
end

def found_response(file)
  data = File.read(file)
  return create_response(200, "OK", data)
end

def not_found_response(file)
  message = "File: #{file} Not Found"
  return create_response(404,"Not Found", message)
end

def create_response(code, status, content)
  size = content.size
  generate_http_response({ code: code, status: status, headers: { "Content Type" => "text/html", "Content Size" => size }, body: content })
end

def generate_http_response(information)
  http = "HTTP/1.1"
  response = http + " " + information[:code].to_s + " " + information[:status] + "\r\n"
  information[:headers].each do |key, value|
	response += key.to_s + ": " + value.to_s + "\r\n"
  end
  response += "\r\n" + information[:body]
end

def get_type(request)
  type = request.split(" ")[0]
end

def get_header_body(request)
  headers, body =  request.split("\r\n\r\n",2)
end

server = TCPServer.open(2000)
loop {
  Thread.start(server.accept) do |client|
	request = client.recv(500)
	what_request = handle_request(request)
	client.puts what_request
	client.close
  end
}
