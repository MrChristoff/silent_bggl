require "rack"
require "erb"

module RustyRack
  class Base
    attr_reader :routes

    def initialize
      @routes = {}
    end

    def get(path, &handler)
      route("GET", path, &handler)
    end

    def erb(template)
      path = File.expand_path("./app/views/#{template}")
      ERB.new(File.read(path)).result(binding)
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

    private
    def params
      @request.params
    end

    def route(verb, path, &handler)
      @routes[verb] ||= {}
      @routes[verb][path] = handler
    end
  end

  Application = Base.new

  # RustyRack::Delegator allows you to use methods without using 'RustyRack::Application.get'
  module Delegator
    def self.delegate(*methods, to:)
      Array(methods).each do |method_name|
        define_method(method_name) do |*args, &block|
          to.send(method_name, *args, &block)
        end

        private method_name
      end
    end

    delegate :get, to: Application
  end
end

include RustyRack::Delegator
