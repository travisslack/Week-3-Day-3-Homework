require_relative('../db/sql_runner.rb')

class Artist

  attr_reader(:id)

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

end