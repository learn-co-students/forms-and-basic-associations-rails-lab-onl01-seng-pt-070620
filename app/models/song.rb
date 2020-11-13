class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name
    self.artist.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_text=(texts)
    texts.each do |text|
      self.notes.build(content: text)
    end
  end

  def note_text
    self.notes.map do |note|
      note
    end
  end
end
