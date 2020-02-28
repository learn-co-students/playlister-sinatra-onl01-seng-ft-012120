require 'pry'
require 'rack-flash'
class SongsController < ApplicationController
    use Rack::Flash

    get "/songs" do 
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do 
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    post '/songs' do 
        # if !Song.find_by_name(params["song"]["name"])
        #     @song = Song.create(name: params[:song])
        # else
        #     @song = Song.find_by_name(params["song"]["name"])
        # end
        @song = Song.find_or_create_by(params[:song])
        #@song.genre_ids = params[:genres]
        #binding.pry
        if !Artist.find_by_name(params["artist"]["name"])
            artist1 = Artist.create(name: params["artist"]["name"])
            @song.artist = artist1
        else 
            @song.artist = Artist.find_by_name(params["artist"]["name"])
        end
        @song.save
        @song.genre_ids = params[:genres]
        
        #redirect to "/songs/#{@song.slug}"
        #binding.pry
        flash[:message] = "Successfully created song."
        redirect("/songs/#{@song.slug}")
    end

    get '/songs/:slug/edit' do 
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch "/songs/:slug" do 
        @song = Song.find_by_slug(params[:slug])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
        @song.update(params[:song])
        flash[:message] = "Successfully updated song."
        redirect("/songs/#{@song.slug}")
    end

    
end