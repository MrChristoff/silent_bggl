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
        result = instance_eval(&handler) #instance_eval gives access to all methods and instance variables in RustyRack::Base
        if result.class == String
          [200, {}, [result]] #Line 21 - 26 seperates the repsonse and the headers from the body, so this can be put into the route directly.  Making cleaner code!
        else
          result
        end
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
  Application = Base.new
end

rusty_rack_application = RustyRack::Application

rusty_rack_application.get "/hello" do #creates a 'GET' route
  "RustyRack::Application Welcome to the rusty rack, arrr" #This is the body which gets added to the HTTP response
end

rusty_rack_application.get "/" do
  "Your params arrrrrr #{params.inspect}"
end

Rack::Handler::WEBrick.run rusty_rack_application, Port: 9292
