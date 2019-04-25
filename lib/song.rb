class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end


  def self.create
    # initializes a song and saves it to the @@all class variable
    # either literally or through the class method
    s = self.new
    s.save
    s
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
     song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
     song
  end

  def self.find_by_name(name)
    @@all.find{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)

      self.find_by_name(name) || self.create_by_name(name)

  end

  def self.alphabetical()
    #returns all the songs instances in ascending (a-z) alphabetical order.
    @@all.sort_by{|x| x.name}
  end


  def self.new_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end

  def self.create_from_filename(name)
song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song.save
    song
  end

  def self.destroy_all()

    @@all.clear
  end

end
