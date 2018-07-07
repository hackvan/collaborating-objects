class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    parsed_filename = file_name.chomp('.mp3').split(' - ')
    artist_name = parsed_filename[0]
    song_name   = parsed_filename[1]
    return Song.new(song_name).tap { |song|
      song.artist_name = artist_name
    }
  end

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
  end

  def artist_name
    return @artist.name
  end
end