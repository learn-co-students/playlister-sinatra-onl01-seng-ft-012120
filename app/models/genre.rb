class Genre < ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    has_many :songgenres
    has_many :songs, through: :songgenres
    has_many :artists, through: :songs
    
end