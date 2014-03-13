require 'rspec'
require 'album'
require 'artist'

describe Album do
  before {Album.clear}
  before  {Artist.clear}
  it 'should initialize with a hash' do
    test_artist = Artist.new({:name => 'Pink Floyd'})
    album = Album.new({:artist => test_artist, :title => 'the wall'})
    album.should be_an_instance_of Album
  end

  it 'should create and save a new album' do
    test_artist = Artist.new({:name => 'Pink Floyd'})
    album = Album.create({:artist => test_artist, :title => 'the wall'})
    album.should be_an_instance_of Album
    @@albums = [album]
  end

  it 'should return artist and title' do
    test_artist = Artist.new({:name => 'Pink Floyd'})
    test_album = Album.create({:artist => test_artist, :title => 'the wall'})
    test_album.artist.name.should eq 'Pink Floyd'
    test_album.title.should eq 'the wall'
  end

  describe '.search' do
    it 'should return album matching the artist' do
      test_artist = Artist.create({:name => 'Pink Floyd'})
      test_album = Album.create({:artist => test_artist, :title => 'the wall'})
      new_album = Album.create({:artist => test_artist, :title => 'animals'})
      test_artist.add_title(new_album.title)
      test_artist.add_title(test_album.title)
      Album.search('Pink Floyd').should eq test_album
    end
  end
end

describe Artist do
  before  {Artist.clear}

  it 'should initialize with a hash' do
    test_artist = Artist.new({:name => 'Pink Floyd'})
    test_artist.should be_an_instance_of Artist
  end

  it 'should create and save a new art' do
    test_artist = Artist.create({:name => 'Pink Floyd'})
    test_artist.should be_an_instance_of Artist
    Artist.all.should eq [test_artist]
  end

  it 'should return artist name' do
    test_artist = Artist.create({:name => 'Pink Floyd'})
    test_artist.name.should eq 'Pink Floyd'
  end

end
