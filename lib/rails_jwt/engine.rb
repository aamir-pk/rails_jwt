module RailsJwt
  class Engine < ::Rails::Engine
    isolate_namespace RailsJwt
    config.generators.api_only = true
  end
end
