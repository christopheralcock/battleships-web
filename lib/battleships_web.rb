require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  # use Rack::Session::Cookie, :key => 'rack.session',
  #                          :path => '/',
  #                          :secret => 'your_secret'

  enable :sessions

  get '/' do
    erb :index
  end

  get '/name' do
  	@visitor = params[:name]
    session[:name] = @visitor
    session.each do |k,v|
      puts k
      puts v
    end
  	erb :name
  end

  get '/newgame' do
    game = Game.new Player, Board
    @matrix = game.own_board_view game.player_1
    @visitor = session[:name]
    session[:game] = game
    session[:matrix] = @matrix
    session.each do |k,v|
      puts k
      puts v
    end
    puts @matrix
    puts @visitor
    erb :newgame
  end

  get '/battleship' do
    @visitor = session[:name]
    game = session[:game]
    @matrix = session[:matrix]
    game.player_1.place_ship Ship.aircraft_carrier, :B4, :vertically
    session.each do |k,v|
      puts k
      puts v
    end
    erb :battleship
  end

  set :views, Proc.new { File.join(root, "..", "views") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
