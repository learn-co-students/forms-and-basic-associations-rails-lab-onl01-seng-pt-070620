class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes 

  def song_notes=(notes)
    notes.each do |n|
      # binding.pry 
      note = Note.find_or_create_by(content: n)
      # binding.pry
      self.notes << note if note != ""
    end 

  end 

  def song_notes 
    self.notes 
  end 

 
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name 
    self.artist ? self.artist.name : nil 
  end 

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 

  def genre_name 
    self.genre ? self.genre.name : nil 
  end 
end
