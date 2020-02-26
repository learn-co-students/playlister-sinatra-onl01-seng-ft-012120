require 'rack-flash'
    class SongsController < ApplicationController
        enable :sessions
        use Rack::Flash 
    get '/songs' do 
        @songs = Song.all 
        
        erb :'/songs/index'
    end 


    get '/songs/new' do 
        @genres = Genre.all 
        erb :'songs/new'
    end 

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end 

    get '/songs/new' do 
        @genres = Genre.all 
        erb :'songs/new'
    end 

    post '/songs' do 
        @artist = Artist.find_or_create_by(name: params["Artist Name"])
        @song = Song.create(name: params["Name"], genre_ids: params["genres"])
        @artist.songs << @song 
        @artist.save 
        flash[:notice] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end 

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all 
        erb :'songs/edit'
    end 

    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        @artist = Artist.find_or_create_by(name: params["Artist Name"])
        @song.update(name: params["Name"], genre_ids: params["genres"])
        
        @artist.songs << @song 
        @artist.save 
        flash[:notice] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end 



    
end 