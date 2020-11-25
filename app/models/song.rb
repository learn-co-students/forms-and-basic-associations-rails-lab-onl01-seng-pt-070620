class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name if self.artist
  end 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.save
  end 

  def genre_name
    self.genre.name if self.genre
  end 

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 

  def note_contents=(contents)
    contents.each do |content|
      if !content.empty?
        note = Note.create(content: content, song_id: self.id)
        self.notes << note
      end 
    end 
  end 

  def note_contents
    self.notes.map {|note| note.content}
  end 
end
