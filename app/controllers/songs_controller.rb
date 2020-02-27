require 'rack-flash'
class SongsController < ApplicationController
    use Rack::Flash

    get "/songs" do 
        @songs = Song.all
        erb :'/songs/index'
    end

    get "/songs/new" do 
        erb :'songs/new'
    end

    post "/songs" do
        song = Song.create(:name => params[:song_name])
        if !params[:artist_name].empty?
            artist = Artist.find_or_create_by(name: params[:artist_name])
            song.artist = artist
        end 
        params[:genres].each do |genre|
            song.genres << Genre.find_by_id(genre)
        end
        song.save
        flash[:message] = "Successfully created song."
        redirect "/songs/#{song.slug}"
    end

    get "/songs/:slug" do 
        @song = Song.all.find{|song| song.slug == params[:slug]}
        erb :'/songs/show'
    end

    get "/songs/:slug/edit" do 
        @song = Song.all.find{|song| song.slug == params[:slug]}
        erb :'/songs/edit'
    end

    patch "/songs/:slug" do 
        song = Song.all.find{|song| song.slug == params[:slug]}
        # binding.pry
        if !params[:artist_name].empty?
            song.artist = Artist.find_or_create_by(name: params[:artist_name])
        end 
        if params[:genres]
            song.genres.clear
            params[:genres].each do |genre|
                song.genres << Genre.find_or_create_by(id: genre)
            end
        end
        song.save
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{song.slug}"
    end

end
