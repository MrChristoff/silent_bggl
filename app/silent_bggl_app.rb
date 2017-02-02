get "/" do
  "Hey there!"
end

Rack::Handler::WEBrick.run RustyRack::Application, Port: 9292
