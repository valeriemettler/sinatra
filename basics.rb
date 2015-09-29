require 'sinatra'
require 'firebase'

base_uri = 'https://girldevchat.firebaseio.com/'

firebase = Firebase::Client.new(base_uri)


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
#get => read
get '/form' do
  erb :form
end

#post => update (create and delete)
# post '/form' do
#   "You said '#{params[:message]}'"  #You said 'hi'.
# end

post '/form' do
    firebase.push("bookmark", { :url => params[:url], :tag => params[:tag]})
    #"#{params[:url]}" + " #" + "#{params[:tag]}"
    # puts params[:url]
    # puts params[:tag]
    erb :form
end


post '/form' do
  # get bookmarks from firebase
  @bookmarks = firebase.get("bookmarks")
  #load the form.erb file:
  redirect '/'
end


#not found route using Sinatra's status method. Can be used on any status code.
not_found do
  status 404
  'not found'
end

