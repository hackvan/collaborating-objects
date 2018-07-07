class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.find_by_name(title)
    return @@all.find { |song| song.name == title }
  end
  
  def self.create_by_name(title)
    return self.new(title).tap { |song| song.save }
  end

  def self.find_or_create_by_name(title)
    return self.find_by_name(title) || self.create_by_name(title)
  end

  def self.all
    return @@all
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    # self.class.all << self
    @@all << self
  end

  def print_songs
    @songs.each do |song|
      puts "#{song.name}"
    end
  end
end