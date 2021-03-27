class RailsJwt::InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def generate_config_file
            copy_file "rails_jwt.rb", "config/initializers/rails_jwt.rb"
    end
end
