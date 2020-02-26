<<<<<<< HEAD
class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name 
      t.integer :artist_id 
    end 
  end
end
=======
class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name 
      t.integer :artist_id 
    end 
  end
end
>>>>>>> bf4901fc12d72178778aeb01f13e4ce07c67a266
