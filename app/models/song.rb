class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes=(contents)
    contents.each do |content|
      if content.strip != ""
        self.notes.build(content: content)
     end
    end
  end

  def song_notes
    self.notes.map{|note| note.content}
  end
end
