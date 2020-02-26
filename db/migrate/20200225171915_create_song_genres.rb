<<<<<<< HEAD
class CreateSongGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :song_genres do |t|
      t.integer :song_id 
      t.integer :genre_id 
    end 
  end
end
=======
class CreateSongGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :song_genres do |t|
      t.integer :song_id 
      t.integer :genre_id 
    end 
  end
end
>>>>>>> bf4901fc12d72178778aeb01f13e4ce07c67a266
