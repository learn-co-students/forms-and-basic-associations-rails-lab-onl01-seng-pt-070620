class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end


  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
     self.genre ? self.genre.name : nil
  end


  def song_notes=(notes)
    
    notes.each do |n|
      note = Note.new(content: n)
      self.notes << note
    end

  end

  # def song_notes
  #   self.notes ? self.notes : nil
  # end


end
