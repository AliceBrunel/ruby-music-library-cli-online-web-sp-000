class MusicLibraryController 
  
  attr_accessor :path
  
  
  def initialize(path = "./db/mp3s")
    @path = path 
    imported = MusicImporter.new(path)
    imported.import
  end
  
  def call 
    
  end

end