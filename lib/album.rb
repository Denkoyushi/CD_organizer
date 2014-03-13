class Album
  attr_reader(:artist, :title)

  @@albums = []

  def initialize(attributes)
    @artist = attributes[:artist]
    @title = attributes[:title]
  end

  def save
    @@albums << self
  end

  def Album.search(user_input)
    found = Album.all.find_all {|x| x.artist.name == user_input}
  end

  def Album.all
    @@albums
  end

  def Album.create(attributes)
    new_album = Album.new(attributes)
    new_album.save
    new_album
  end

  def Album.clear
    @@albums = []
  end

end
