require 'sinatra'
require 'sinatra/base'
ENV['RACK_ENV'] = 'development'

class SilentBggl < Sinatra::Base
  get '/' do
    redirect '/play'
  end

  get '/play' do
    erb :play
  end
end
