require_all 'app/models'
ActiveRecord::Base.logger.level = 1


class Cli

    def initialize
        @users_name = ''
        @artists = (Song.all.map {|song| song[:artist] }).uniq.sort
        @genres = (Song.all.map {|song| song[:genre] }).uniq.sort
        @years = (Song.all.map { |song| song[:year]}).uniq.sort
        @prompt = TTY::Prompt.new(symbols: {marker: "🎶"})
    end

# artists = (Song.all.map {|song| song[:artist] }).uniq
# genres = (Song.all.map {|song| song[:genre] }).uniq
# years = (Song.all.map { |song| song[:year]}).uniq.sort
# prompt = TTY::Prompt.new

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
        year_choice = @prompt.select("Choose a year:",  @years )
    end

    def sort_by_artist
        artist_choice = @prompt.select("Choose an artist:",  @artists )
    end

    def sort_by_genre 
        genre_choice = @prompt.select("Choose a genre:",  @genres )
    end

    def randomsong
        song = Song.all[rand(Song.all.length)]
        puts song[:artist], song[:title], song[:year], song[:genre], song[:link]
    end


    # binding.pry
end
