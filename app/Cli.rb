require_all 'app/models'
ActiveRecord::Base.logger.level = 1


class Cli

    def initialize
        @users_name = ''
        @songs = Song.all
        @artists = (@songs.map {|song| song[:artist] }).uniq.sort
        @genres = (@songs.map {|song| song[:genre] }).uniq.sort
        @years = (@songs.all.map { |song| song[:year]}).uniq.sort
        @prompt = TTY::Prompt.new(symbols: {marker: "🎶"})
    end

    def welcome
        puts "Welcome to the Youtube Jukebox!"
    end

    def ask_users_name
        @users_name = @prompt.ask("What is your name?", default: ENV["guest"])
        sleep(1)
        puts "Hey what up #{@users_name}?!"
    end

    def ask_to_sort
        result = @prompt.select("How would you like to sort?", %w(Genre Year Artist Random))
        if result == "Year"
            sort_by_year
        elsif result == "Artist"
            sort_by_artist
        elsif result == "Genre"
            sort_by_genre
        else randomsong
        end
    end

    def sort_by_year
        @year_choice = @prompt.select("Choose a year:",  @years )
        list_year_songs
    end

    def sort_by_artist
        @artist_choice = @prompt.select("Choose an artist:",  @artists )
        list_artist_songs
    end

    def sort_by_genre 
        @genre_choice = @prompt.select("Choose a genre:",  @genres )
        list_genre_songs
    end

    def randomsong
        song = @songs[rand(@songs.length)]
        puts song[:artist], song[:title], song[:year], song[:genre], song[:link]
        sleep(3)
        ask_another_song
    end

    def list_artist_songs
        list_songs_by_artist = @songs.select do |song|
            song[:artist] == @artist_choice
        end
        @artist_song_list = list_songs_by_artist.map { |song| song[:title]}
        select_song_by_artist
    end

    def select_song_by_artist
        songchoice = @prompt.select("Select a song:", @artist_song_list )
        song_choice = @songs.find {|song| songchoice == song[:title]}
        puts song_choice[:artist], song_choice[:title], song_choice[:year], song_choice[:genre], song_choice[:link]
    end

    def list_genre_songs
        list_songs_by_genre = @songs.select do |song|
            song[:genre] == @genre_choice
        end
        @genre_song_list = list_songs_by_genre.map { |song| song[:title]}
        select_song_by_genre
    end

    def select_song_by_genre
        songchoice = @prompt.select("Select a song:", @genre_song_list )
        song_choice = @songs.find {|song| songchoice == song[:title]}
        puts song_choice[:artist], song_choice[:title], song_choice[:year], song_choice[:genre], song_choice[:link]
    end

    def list_year_songs
        list_songs_by_year = @songs.select do |song|
            song[:year] == @year_choice
        end
        @year_song_list = list_songs_by_year.map { |song| song[:title]}
        select_song_by_year
    end

    def select_song_by_year
        songchoice = @prompt.select("Select a song:", @year_song_list )
        song_choice = @songs.find {|song| songchoice == song[:title]}
        puts song_choice[:artist], song_choice[:title], song_choice[:year], song_choice[:genre], song_choice[:link]
    end

    def ask_another_song
        another_song = @prompt.select("Would you like to play another song?", %w(Yes No))
        if another_song == "Yes"
            ask_to_sort
        elsif another_song == "No"
            exit
        end
    end

end
