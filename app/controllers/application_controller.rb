

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  

  get '/' do
    erb :index
  end

 
end

# rspec spec/features/05_song_form_spec.rb