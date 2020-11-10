require_all 'app/models'



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

    def ask_if_username
        has_username = @prompt.yes?("Do you have a username?")
            if has_username == true
                ask_username
            else
                make_user
            end
    end

    def make_user
        @newuser = @prompt.ask("What is your desired username?")
        sleep(1)
        puts "Welcome #{@newuser}"
        @newpassword = @prompt.ask("Enter a password")
        sleep(1)
        @newuserobject = User.create(name: @users_name, username: @newuser, password: @newpassword)
        @user = User.all.find { |user| user[:name] == @users_name }
    end


    def ask_username
        @username = @prompt.ask("What is your username?")
        check_log_in
    end


    def check_log_in
        @user = User.all.find { |user| user[:username] == @username}
        if @user == nil
            puts "no log in found"
            ask_username
        end
        ask_password
    end

    def ask_password
        @passcheck = @prompt.ask("What is your password?")
            if @passcheck == @user[:password]
                log_in_user
            else
                puts "Invalid Password"
                ask_password
            end
    end

    def log_in_user
        puts "Welcome back, #{@users_name}"
        ask_what_to_do
    end

    def ask_what_to_do
        result = @prompt.select("What would you like to do today?", ["Play Music", "Check My Reviews", "Exit"])
            if result == "Play Music"
                ask_to_sort
            elsif result == "Check My Reviews"
                @my_reviews = Review.all.select do |review|
                    review[:user_id] == @user[:id]
                        song_title = (Song.all.find { |song| song[:id] == review[:song_id]})[:title]
                        song_artist = (Song.all.find { |song| song[:id] == review[:song_id]})[:artist]
                    puts ("artist: #{song_artist}     song: #{song_title}     rating: #{review[:rating]}     content: '#{review[:content]}'").strip
                end
            else
                exit
            end
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
        leave_review
    end

    def list_artist_songs
        list_songs_by_artist = @songs.select do |song|
            song[:artist] == @artist_choice
        end
        @artist_song_list = list_songs_by_artist.map { |song| song[:title]}
        select_song_by_artist
    end

    def select_song_by_artist
        @songchoice = @prompt.select("Select a song:", @artist_song_list )
        @song_choice = @songs.find {|song| @songchoice == song[:title]}
        puts @song_choice[:artist], @song_choice[:title], @song_choice[:year], @song_choice[:genre], @song_choice[:link]
        sleep(2)
        leave_review
    end

    def list_genre_songs
        list_songs_by_genre = @songs.select do |song|
            song[:genre] == @genre_choice
        end
        @genre_song_list = list_songs_by_genre.map { |song| song[:title]}
        select_song_by_genre
    end

    def select_song_by_genre
        @songchoice = @prompt.select("Select a song:", @genre_song_list )
        @song_choice = @songs.find {|song| @songchoice == song[:title]}
        puts @song_choice[:artist], @song_choice[:title], @song_choice[:year], @song_choice[:genre], @song_choice[:link]
        sleep(2)
        leave_review
    end

    def list_year_songs
        list_songs_by_year = @songs.select do |song|
            song[:year] == @year_choice
        end
        @year_song_list = list_songs_by_year.map { |song| song[:title]}
        select_song_by_year
    end

    def select_song_by_year
        @songchoice = @prompt.select("Select a song:", @year_song_list )
        @song_choice = @songs.find {|song| @songchoice == song[:title]}
        puts @song_choice[:artist], @song_choice[:title], @song_choice[:year], @song_choice[:genre], @song_choice[:link]
        sleep(2)
        leave_review
    end

    def leave_review
        review_push = @prompt.select("Would you like to leave a review?", %w(Yes No))
        if review_push == "Yes"
            songrating = @prompt.select("Pick a rating", %w(1 2 3 4 5))
            content = @prompt.ask("What did you think?!")
            Review.create(user: @user, song: @song_choice, rating: songrating, content: content)
            ask_another_song
        elsif review_push == "No"
            ask_another_song
        end
    end

    def ask_another_song
        another_song = @prompt.select("Would you like to play another song?", %w(Yes No))
        if another_song == "Yes"
            ask_to_sort
        elsif another_song == "No"
            ask_what_to_do
        end
    end



end
