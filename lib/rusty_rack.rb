require "rack"

module RustyRack
  class Base
    attr_reader :routes

    def initialize
      @routes = {}
    end

    def get(path, &handler)
      route("GET", path, &handler)
    end

    private
    def route(verb, path, &handler)
      @routes[verb] ||= {}
      @routes[verb][path] = handler
    end
  end
end

rusty_rack = RustyRack::Base.new

rusty_rack.get "/hello" do
  [200, {}, ["Welcome o the rusty rack, arrr"]]
end

puts rusty_rack.routes

# Rack::Handler::WEBrick.run(RustyRack.new, Port:9292)
