ENV['RACK_ENV'] = 'development'

class SilentBggl < Sinatra::Base
  get '/' do
    redirect '/welcome'
  end
  get '/welcome' do
    erb :welcome
  end
  get '/play' do
    @grid = Grid.new(Modern_dice.new)
    erb :play
  end
end
