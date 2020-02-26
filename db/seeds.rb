# Add seed data here. Seed your database with `rake db:seed`
#LibraryParser.parse
# Song.create(name: "Baby Beluga")
#Song.create(name: "Three Little Pumpkins")
raffi = Artist.create(name: "Raffi")
raffi.songs.build(name: "Baby Beluga")
raffi.songs.build(name: "Three Little Pumpkins")
raffi.save 
Genre.create(name: "childrens")
Genre.create(name: "folk")
