get "/" do
  "Hey there!"
end

get "/welcome" do
  erb :'welcome.erb'
end

get "/play" do
  @grid = Grid.new(ModernDice.new)
  erb :'play.erb'
end

Rack::Handler::WEBrick.run RustyRack::Application, Port: 9292
