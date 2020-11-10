require_relative 'config/environment'
require_all 'app/models'



artists = (Song.all.map {|song| song[:artist] }).uniq
genres = (Song.all.map {|song| song[:genre] }).uniq
years = (Song.all.map { |song| song[:year]}).uniq.sort
prompt = TTY::Prompt.new

app = Cli.new
app.welcome
app.ask_users_name
app.ask_to_sort



# binding.pry