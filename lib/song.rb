class Song 

  attr_accessor :name , :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = "", genre = "")
    @name = name
    self.artist = artist unless artist == ""
    self.genre = genre unless genre == ""
    save
  end
  
  def self.all 
    @@all
  end

  def save 
    @@all << self unless @@all.include?(self)
  end 
  
  def self.destroy_all 
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
    artist.add_song(self)
  end
  
   def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
end