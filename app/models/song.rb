class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)

  end

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def note_contents=(notes_array)
    notes_array.each do |note|
      if note != ""
        self.notes << Note.find_or_create_by(content: note)
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end
end
