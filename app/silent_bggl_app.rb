ENV['RACK_ENV'] = 'development'

class SilentBggl < Sinatra::Base
  get '/' do
    redirect '/play'
  end

  get '/play' do
    @grid = Grid.new(Modern_dice.new)
    erb :play
  end
end
