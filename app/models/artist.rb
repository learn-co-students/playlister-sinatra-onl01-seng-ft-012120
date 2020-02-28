class Artist < ActiveRecord::Base 
  has_many :songs
  has_many :genres, through: :songs

  extend Slugifiable::ClassMethod
  include Slugifiable::InstanceMethod
end