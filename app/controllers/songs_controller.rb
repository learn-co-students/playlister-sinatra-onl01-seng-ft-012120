class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    # if !params[:artist][:name].empty?
    if !Artist.where(name: "Person with a Face").empty?
      @song.artist = Artist.where(name: "Person with a Face").first
    else
      @song.artist = Artist.create(name: params[:artist][:name])
    end
    @song.save
    slug = @song.slug
    redirect "songs/#{slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params[:artist].empty?
      if Artist.find_by(name: params[:artist][:name])
        @artist = Artist.find_by(name: params[:artist][:name])
      else
        @artist = Artist.create(name: params[:artist][:name])
      end
     @song.artist = @artist
    end
    erb :'songs/show'
  end

end