require 'sinatra'

get '/about' do
  'A little about me.'
end

#a route where anything after '/hello/' will be contained in a params array with the key :name.
#The params array contains all GET and POST variables.
get '/hello/:name' do
  #params[:name]  returns [name]
  "Hello there, #{params[:name]}." #returns 'Hello there, [name].''
end

#This route will load the form.erb ERB (Embedded Ruby) file from a views/ directory.
# ERB files are normal HTML files which allow you to include Ruby code inside tags,
# which will be parsed before being sent to the browser
get '/form' do
  erb :form
end