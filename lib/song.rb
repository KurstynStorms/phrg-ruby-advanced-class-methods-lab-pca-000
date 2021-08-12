class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize
  #   @@all << self
  #   self
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |n|
       n.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ||
    self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort {|a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    newsong = Song.new
    newsong.artist_name = file[0]
    newsong.name = file[1].delete_suffix(".mp3")
    newsong
  end

  def self.create_from_filename(filename)
    file = filename.split(" - ")
    newsong = Song.new
    newsong.artist_name = file[0]
    newsong.name = file[1].delete_suffix(".mp3")
    newsong.save
    newsong
  end

  def self.destroy_all
    @@all.clear
  end

end
