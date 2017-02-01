require "rack"

class BoggleRackApp
  def call(env)
    http_verb = env["REQUEST_METHOD"]
    status = 200
    headers = {}
    body = ["got #{http_verb} request\n"]


    [status, headers, body]
  end
end

Rack::Handler::WEBrick.run(BoggleRackApp.new, Port:9292)
