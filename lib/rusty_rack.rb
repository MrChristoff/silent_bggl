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

rusty_rack.get "/hello" do #creates a 'GET' route
  [200, {}, ["Welcome to the rusty rack, arrr"]] #creates the respose to the request on this route
end

puts rusty_rack.routes
