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

    def call(env) #wrapper for Rack ENV
      @request = Rack::Request.new(env)
      verb = @request.request_method
      requested_path = @request.path_info
      handler = @routes.fetch(verb, {}).fetch(requested_path, nil)
      if handler
        # handler.call
        instance_eval(&handler) #instance_eval gives access to all methods and instance variables in RustyRack::Base
      else
        [404, {}, ["Arrr, no treasure here matey.\n\nAfraid '#{verb} #{requested_path}' does not exist."]]
      end
    end

    def params
      @request.params
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

rusty_rack.get "/" do
  [200, {}, ["Your params arrrrrr #{params.inspect}"]]
end

Rack::Handler::WEBrick.run rusty_rack, Port: 9292
