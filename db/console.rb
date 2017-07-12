require_relative('../models/artist.rb')
require_relative('../models/album.rb')

artist1 = Artist.new({'name' => 'The CodeClan Coders'})
artist1.save

album1 = Album.new({'title' => 'Ruby Nightmares', 'genre' => "Spooky Sublime", 'artist_id' =>artist1.id})


album1.save