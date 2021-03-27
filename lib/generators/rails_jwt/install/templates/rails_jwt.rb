RailsJwt.setup do |config|

    ## Expiration of token
    ## -------------------
    ## How long it will take before a token is expired. Default is nil, which means token is never expired
    #
    # config.token_lifetime = nil     # Never expires
    # config.token_lifetime = 1.week   # Default


    ## User class and  user id field
    ## -----------------------------
    ## Application User class. This is the model that represents the user being authenticated.
    ##
    # config.user_class = "User" # Default
    ##
    ## User ID attribute. This is the attribute of user class that will be used as a unique user id
    ##
    # config.user_id_attr = :email # Default


    ## Token signature key
    ## -------------------
    ## The secrete key that will be used to sign the token
    ##
    # config.token_signature_key = -> {Rails.application.secret_key_base}  # Default

end