require './lib/artist'
require './lib/album'

puts "
                     :+**  ~<<::**+:
                +Xi<<<<!<  `<<!?!<<<HMti%L
            :?HMMMM:<<<!<~ <<<!X<<<!MM88MMh?x
          !HMRMMRMMM:<<<!< <<<!!<<<MR88MRMMRMH?.
        ?NMMMMMMMMMMM<<<?<  <<!!<<XM88RMMMMMMMMM?
      !88888MMMMMMRMMk<<!!  <<H!<<M88MRMMRMMMRMMRM!
     <M8888888MMMMMMMM:<<!  <<H<<488RMMMMMMMMMMMMMM>:
   xHMRMMR888888RMMMMMM<<!< <!!<<988RMMMRMMRMMMMM?!<<%
  :XMMMMMMMM88888MMMMMMH<<~ ~~~<X8RMMMMMMMMMMM!!<~    k
  <<<!MMRMMRMMR8888MMP.n~       #R.#MMRMMRM?<~~   .nMMh.
 !MMH:<<<!*MMMMMMM8Pu! n*       *+ *h!MM!!~   :@MMMMMMM/
.HMRMMRMMMH:<<**RM M @             * *   .nMMMMMMMRMMRMMk
MMMMMMMMMMMMMMMMx < *      .u.        4-MMMMMMMMMMMMMMMM9
!RMMRMMMRMMRMMMMMX M     @P   #8     4 MMRMMMRMMRMMMMMMR<
!MMMMMMMMMMMMMMMMM !    -8     8!    - MtMMMMMMMMMMMMMMM!
kMMRMMRMMRMMMRMMR4 H     #8.  @8     H MMMMRMMMMMMRMMRMM!
MMMMMMMMMMMMMMMMM>M         *`      .~i <!?MMMMMMMMMMMMM9
-9MMRMMMRMMRMMP!   : %             H @ 8NRMHx<<<!!MMMMMR!
 >MMMMMMMMM*   <<HMk!i *u       .* x*xR88888MMMMHi<<<<~<
  !RMM#~   :<:MMRMMMMH.*n:      :*.HRMMMRM8888888MRMMM!
  !     <<:tMMMMMMMMMM8RM<::: :<<XMMMMMMMMMR88888888MM!
   ~ <<<XHMRMMMMMMRMM8RM<<<<< `!<<MRMMRMMRMMMRR888888#
     :HMMMMMMMMMMMM988MM<<X!<~-~<<<MMMMMMMMMMMMMR88#!
      ~MMRMMMRMMRMM88MM<<<?<<  <<<<!RMMMRMMRMMMMMM!
        xMMMMMMMM988MM%<<<?<<: <!<<<?MMMMMMMMMMMX
          !?MMMM@88MMR<<<<!<<<  <:<<<MRMMRMMMP!
            *X*988RMM!<<<?!<<~  <!<<<<MMMMM?*
                !X*MM<<<<H!<<`  <?<<<<<)!
                     *+:uX!<<< .::+**
"


def main_menu


  puts "Press 'a' to add a new album or press 'v' to view all albums"
  puts "Press 's' to search for an album by artist name"
  puts "Press 'l' to list out all artists"
  puts "Press 'x' to exit."
  user_input = gets.chomp

  if user_input == 'a'
    add_album
  elsif user_input == 's'
    search_artist
  elsif user_input == 'v'
    view_albums
  elsif user_input == 'l'
    list_menu
  elsif user_input == 'x'
    'Good-bye.'
  else
    'Invalid Choice.'
    main_menu
  end
end

def list_menu
  Artist.all.each_with_index do |artist, index|
    puts "#{index + 1}) #{artist.name}"
  end
  puts "Which artist do you want to see the albums of"
  user_input = gets.chomp
  puts Artist.all[user_input.to_i - 1].titles
  main_menu
end


def view_albums
  Album.all.each do |album|
    puts "#{album.artist.name} - #{album.title}"
  end
  main_menu
end

def search_artist
  puts "Enter the artist name to find all albums:"
  user_input = gets.chomp

  found = Album.search(user_input)
  found.each do |album|
    puts "#{album.artist.name} - #{album.title}"
  end
end


def add_album
  puts 'Enter the artist name:  '
  input_artist = gets.chomp
  puts 'Enter the album name: '
  input_album_name = gets.chomp

  if Artist.all.empty?
    new_artist = Artist.create({:name => input_artist})
    new_album = Album.create({:artist => new_artist, :title => input_album_name})
    new_artist.add_title(new_album.title)
    main_menu
  else
    found = Artist.all.find {|x| x.name == input_artist}
    if found.nil?
      new_artist = Artist.create({:name => input_artist})
      new_album = Album.create({:artist => new_artist, :title => input_album_name})
      new_artist.add_title(new_album.title)
    else
      new_album = Album.create({:artist => found, :title => input_album_name})
      found.add_title(new_album.title)
    end
  end

  # Artist.all.each do |artist|
  #   p artist.name
  #   p artist.titles
  # end
  main_menu
end

main_menu




