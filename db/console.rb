require_relative('../models/artist.rb')
require_relative('../models/album.rb')

artist1 = Artist.new({'name' => 'The CodeClan Coders'})
artist1.save

album1 = Album.new({'title' => 'Ruby Nightmares', 'genre' => "Spooky Sublime", 'artist_id' =>artist1.id})


album1.save

Album.all
Artist.all

p artist1.albums
p album1.artist

artist1.name = "Codeclan Codependent"

artist1.update
p artist1

album1.title = "Ruby Dreams"
album1.update
p album1