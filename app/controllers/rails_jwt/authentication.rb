require 'jwt'

module RailsJwt::Authentication
    def authenticate_user
        begin
            payload = jwt_payload

            expiry_time = Time.at(payload["exp"])
            if Time.now > expiry_time
                render status: :unauthorized    
            end
            user = User.find(payload["sub"]["id"])
            if !user.active
                render status: :unauthorized
            end

        rescue ActiveRecord::RecordNotFound
            render status: :unauthorized
        rescue JWT::DecodeError
            render status: :unauthorized
        end
    end

    def current_user
        payload = jwt_payload
        User.find(payload["sub"]["id"])
    end

    private
    def jwt_payload
        token = request.headers['Authorization']&.split&.fetch(-1)
        JWT.decode(token, Rails.application.secret_key_base)[0]
    end
end