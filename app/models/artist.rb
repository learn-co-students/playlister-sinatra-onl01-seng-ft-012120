<<<<<<< HEAD
class Artist < ActiveRecord::Base
  has_many :songs 
  has_many :genres, through: :songs
  
  def slug 
    self.name.downcase.gsub(' ', '-')
  end 
  
  def self.find_by_slug(slug_name) 
    self.all.detect { |obj| obj.slug == slug_name }
  end 
end

=======
class Artist < ActiveRecord::Base
  has_many :songs 
  has_many :genres, through: :songs
  
  def slug 
    self.name.downcase.gsub(' ', '-')
  end 
  
  def self.find_by_slug(slug_name) 
    self.all.detect { |obj| obj.slug == slug_name }
  end 
end

>>>>>>> bf4901fc12d72178778aeb01f13e4ce07c67a266
# rspec spec/models/01_artist_spec.rb