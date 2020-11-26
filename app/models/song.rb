class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name:name)
    # binding.pry
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name:name)
    # binding.pry
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def note_contents=(ids)
    ids.each do |id|
      # note = Note.find(id)
      self.notes << Note.find_or_create_by(content:id)
    end
  end

  def note_contents
    self.notes ? self.notes : nil
  end

end
