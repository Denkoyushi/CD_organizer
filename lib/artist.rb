class Artist
  attr_reader(:name, :titles)

  @@artists = []

  def initialize(attributes)
    @name = attributes[:name]
    @titles = []
  end

  def add_title(title)
    @titles << title
  end

  def save
    @@artists << self
  end


  def Artist.all
    @@artists
  end

  def Artist.create(attributes)
    new_artists = Artist.new(attributes)
    new_artists.save
    new_artists
  end

  def Artist.clear
    @@artists = []
  end

end
