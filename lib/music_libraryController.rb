class MusicLibraryController 
  
  attr_accessor :path
  
  
  def initialize(path)
    @path = path 
    MusicImporter.new(path= "./db/mp3s")
  end

end