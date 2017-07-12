require_relative('../db/sql_runner.rb')

class Album

  attr_reader(:id)

  def initialize(details)
    @id = details['id'].to_i
    @title = details['name']
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

end