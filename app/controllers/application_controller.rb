<<<<<<< HEAD


class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  

  get '/' do
    erb :index
  end

 
end

# rspec spec/features/05_song_form_spec.rb
=======
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end

# rspec spec/features/04_basic_view_spec.rb
>>>>>>> bf4901fc12d72178778aeb01f13e4ce07c67a266
