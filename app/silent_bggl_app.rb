require 'sinatra'
require 'sinatra/base'
require_relative './models/Die'

ENV['RACK_ENV'] = 'development'

class SilentBggl < Sinatra::Base
  get '/' do
    redirect '/play'
  end

  get '/play' do
    @die = Die.new
    erb :play
  end
end
