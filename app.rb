require 'sinatra'

# Use the shotgun gem so you don't have to restart the server everytime you make a change to your Sinatra app

# if the home, or root, URL '/' is requested, using the normal GET HTTP method,
# display "Hello, World!"
get '/' do
  "Hello World!"
end


