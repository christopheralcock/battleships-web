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
    coordinate = params[:coordinate].to_s.upcase
    orientation = params[:aircraft_carrier_placing].to_sym
    game.player_1.place_ship Ship.aircraft_carrier, coordinate, orientation
    @matrix = game.own_board_view game.player_1
    session.each do |k,v|
      puts k
      puts v
    end
    erb :battleship
  end

  get '/cruiser' do
    @visitor = session[:name]
    game = session[:game]
    coordinate = params[:coordinate2].to_s.upcase
    orientation = params[:battleship_placing].to_sym
    session.each do |k,v|
      puts k
      puts v
    end
    game.player_1.place_ship Ship.battleship, coordinate, orientation
    @matrix = game.own_board_view game.player_1
    erb :cruiser
  end

  get '/destroyer' do
    @visitor = session[:name]
    game = session[:game]
    coordinate = params[:coordinate3].to_s.upcase
    orientation = params[:cruiser_placing].to_sym
    session.each do |k,v|
      puts k
      puts v
    end
    game.player_1.place_ship Ship.cruiser, coordinate, orientation
    @matrix = game.own_board_view game.player_1
    erb :destroyer
  end

  get '/submarine' do
    @visitor = session[:name]
    game = session[:game]
    coordinate = params[:coordinate4].to_s.upcase
    orientation = params[:destroyer_placing].to_sym
    session.each do |k,v|
      puts k
      puts v
    end
    game.player_1.place_ship Ship.destroyer, coordinate, orientation
    @matrix = game.own_board_view game.player_1
    erb :submarine
  end

  get '/boardplaced' do
    @visitor = session[:name]
    game = session[:game]
    coordinate = params[:coordinate5].to_s.upcase
    orientation = params[:submarine_placing].to_sym
    session.each do |k,v|
      puts k
      puts v
    end
    game.player_1.place_ship Ship.submarine, coordinate, orientation
    @matrix = game.own_board_view game.player_1
    erb :boardplaced
  end

  set :views, Proc.new { File.join(root, "..", "views") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
