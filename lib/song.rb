class Song 

  attr_accessor :name , :artist
  
  @@all = []
  
  def initialize(name, artist = "")
    @name = name
    self.artist = artist unless artist == ""
  end
  
  def self.all 
    @@all
  end

  def save 
    @@all << self
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
  
end