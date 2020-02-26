<<<<<<< HEAD
class Genre < ActiveRecord::Base 
  has_many :song_genres 
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs 
  
  def slug 
    self.name.downcase.gsub(' ', '-')
  end 
  
  def self.find_by_slug(slug_name) 
    self.all.detect { |obj| obj.slug == slug_name }
  end 
end 

=======
class Genre < ActiveRecord::Base 
  has_many :song_genres 
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs 
  
  def slug 
    self.name.downcase.gsub(' ', '-')
  end 
  
  def self.find_by_slug(slug_name) 
    self.all.detect { |obj| obj.slug == slug_name }
  end 
end 

>>>>>>> bf4901fc12d72178778aeb01f13e4ce07c67a266
# rspec spec/models/03_genre_spec.rb