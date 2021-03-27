require_dependency "rails_jwt/application_controller"
require 'jwt'

module RailsJwt
    class LoginController < ApplicationController
        def login
            user = RailsJwt.user_class.send("find_by_#{RailsJwt.user_id_attr}", params[:user_id])

            if user&.respond_to?(:active) && !user.active
                render status: :unauthorized
            elsif user&.authenticate(params[:password])
                token = JWT.encode(create_jwt_payload(user), RailsJwt.token_signature_key.call, 'HS256')
                render json: {jwt: token}
            else
                render status: :unauthorized
            end
        end

        private
        def create_jwt_payload(user)
            payload = {sub: {id: user.id}}
            if user.respond_to?(:jwt_payload)
                payload.merge!(user.jwt_payload)
            end
            return (payload.merge!({exp: (Time.now + RailsJwt.token_lifetime).to_i}))
        end
    end
end
