class Song < ActiveRecord::Base 
  belongs_to :artist 
  has_many :song_genres
  has_many :genres, through: :song_genres  
  
  def slug 
    self.name.downcase.gsub(' ', '-')
  end 
  
  def self.find_by_slug(slug_name) 
    self.all.detect { |obj| obj.slug == slug_name }
  end 
end 

#  rspec spec/models/02_song_spec.rb