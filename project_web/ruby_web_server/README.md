## Command line Web Browser - From [The Odin Project - Ruby on the web]()

This is a very simple command line browser, you can issue GET and POST request and see the HTTP response of those requests.
To run it you need to have two terminals opened, in the first one run `$ ruby multi_client_server.rb` to start the web server, and in the second
one run `$ ruby web_browser.rb` to start the browser.

The following menu will then prompt: 
```
Command line Browser.
Select an option:
        1. Issue a GET request
        2. Issue a POST request
        3. Exit
Selection(1,2,3): 
```
To use it just choose one of the 3 options.
Here is an example of me issuing a GET request:
```
Command line Browser.
Select an option:
        1. Issue a GET request
        2. Issue a POST request
        3. Exit
Selection(1,2,3): 1
File name to get: index.html
GET index.html HTTP/1.1

HTTP/1.1 200 OK
Content Type: text/html
Content Size: 75
<html>
        <body>
                <h1>Welcome to the viking home page</h1>
        </body>
</html>
```

It's not fancy but it's a good start, go ahead and try it!!!
