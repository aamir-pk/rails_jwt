require "rails_jwt/engine"

module RailsJwt
    mattr_writer   :user_class,             default: 'User'
    mattr_accessor :user_id_attr,           default: 'email'
    mattr_accessor :token_lifetime,         default: 1.week
    mattr_accessor :token_signature_key,    default: -> {Rails.application.secret_key_base}

    def self.user_class
        return @@user_class.constantize
    end

    def self.setup
        yield self
    end

end
