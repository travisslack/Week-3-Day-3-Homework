require_relative('../db/sql_runner.rb')

class Artist

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(details)
    @id = details['id'].to_i
    @name = details['name']
  end

  def save()
    sql = "
    INSERT INTO artists
    (name)
    VALUES
    ('#{@name}')
    RETURNING id;
    "
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.all()
    sql = "
    SELECT * FROM artists;"
    return SqlRunner.run(sql)
  end

  def albums()
    sql = "
    SELECT * FROM albums
    WHERE artist_id = #{@id};"
    albums_hash = SqlRunner.run(sql)
    result = albums_hash.map { |album| Album.new(album) }
    return result
  end

  def update()
    sql = "
    UPDATE artists
    SET 
    name = '#{@name}'
    WHERE 
    id = #{@id}"
    return SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM artists
    WHERE 
    id = #{@id}"
    return SqlRunner.run(sql)
  end

  def self.find(id_input)
    sql = "
    SELECT * FROM artist WHERE id = #{id_input}"
    artist = SqlRunner.run(sql)[0]
    result = Artist.new(artist) 
    return result
    end

end