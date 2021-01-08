class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
   end

   def artist_name
      self.artist ? self.artist.name : nil
   end

   def artist_link
      if self.artist
         artist_path(self.artist)
      else
         edit_song(self)
      end
   end
   
end
