require_relative('../db/sql_runner.rb')

class Album

  attr_reader(:id)
  attr_accessor(:title)

  def initialize(details)
    @id = details['id'].to_i
    @title = details['title']
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i
  end

  def save()
    sql = "
    INSERT INTO albums
    (title, genre, artist_id)
    VALUES
    ('#{@title}','#{@genre}',#{@artist_id})
    RETURNING id;
    "
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.all()
    sql = "
    SELECT * FROM albums;"
    return SqlRunner.run(sql)
  end

  def artist
    sql = "
    SELECT * FROM artists
    WHERE id = #{@artist_id};"
    artist = SqlRunner.run(sql)[0]
    result = Artist.new(artist) 
    return result
  end

  def update()
    sql = "
    UPDATE albums
    SET 
    (title, genre, artist_id) =
    ('#{@title}', '#{@genre}', '#{@artist_id}')
    WHERE 
    id = #{@id}"
    return SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM albums
    WHERE 
    id = #{@id}"
    return SqlRunner.run(sql)
  end

  def self.find(id_input)
    sql = "
    SELECT * FROM albums WHERE id = #{id_input}"
    album = SqlRunner.run(sql)[0]
    result = Album.new(album) 
    return result
    end


    


end