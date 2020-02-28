require_relative './concerns/slugifiable.rb'
class Song < ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    belongs_to :artist
    has_many :songgenres
    has_many :genres, through: :songgenres
    
end
    