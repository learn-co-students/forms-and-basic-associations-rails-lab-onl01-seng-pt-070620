class Artist < ActiveRecord::Base
  has_many :songs
 
  def songs_ids=(ids)
    ids.each do |id|
      song = Song.find(id)
      self.song << song
    end
  end
end
