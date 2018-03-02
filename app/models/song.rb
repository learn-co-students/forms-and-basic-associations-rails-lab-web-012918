class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    self&.genre&.name
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self&.artist&.name
  end

  def note_contents=(notes)
    notes.each do |note_content|
      note = Note.find_or_create_by(content: note_content)
      self.notes << note
    end
  end

  def note_contents
    self.notes.select {|note| note.content.length != 0}.map{|note| note.content}
  end
end
