class Note < ActiveRecord::Base
  belongs_to :song
  
  def song_name=(name)
    self.song = Song.find_or_create_by(name: name)
  end

  def song_name
     self.song ? self.song.name : nil
  end


end
