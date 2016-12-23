require 'sinatra'
require 'sinatra/base'
ENV['RACK_ENV'] = 'development'

class SilentBggl < Sinatra::Base
  get '/' do
    'Silent Boggle!'
  end
end
