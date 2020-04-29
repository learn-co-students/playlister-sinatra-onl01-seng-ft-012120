# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, 'my_application_secret'
  set :views, proc { File.join(root, '../views/') }

  get '/' do
    erb :index
  end
end

# class ApplicationController < Sinatra::Base
#   register Sinatra::ActiveRecordExtension
#   set :session_secret, 'my_application_secret'
#   set :views, proc { File.join(root, '../views/') }
#   enable :sessions
#   use Rack::Flash

#   def all_artists
#     Artist.all
#   end

#   def all_genres
#     Genre.all
#   end

#   def all_songs
#     Song.all
#   end

#   get '/' do
#     erb :'index.html'
#   end
# end
