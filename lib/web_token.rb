module WebToken
    SECRET = Rails.application.secrets.secret_key_base
    EXPIRY = (Time.now + 2.weeks).to_i
    class << self

        def decode(token)
            JWT.decode(
                    token, 
                    WebToken::SECRET, 
                    'HS256'
                    ).first
            rescue JWT::ExpiredSignature
                :expired
        end

        def encode(user)
            JWT.encode ({user_id: user.id, exp: WebToken::EXPIRY}), WebToken::SECRET, 'HS256'
        end
    end
end