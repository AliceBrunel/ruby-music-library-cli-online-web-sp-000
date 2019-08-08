class Artist 

  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    self.new(name).tap {|artist| artist.save}
  end

  def songs 
    @songs
  end
  
  def add_song(song)
    song.artist = self
  end
end