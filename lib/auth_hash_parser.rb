class AuthHashParser

  def self.parse(auth_hash)

    token_hash = {}
    token_hash[:provider] = auth_hash[:provider]
    token_hash[:uid] = auth_hash[:uid]
    puts "This is a test 2: #{auth_hash.inspect}"
    token_hash[:oauth_token] = auth_hash[:credentials][:token]
    token_hash[:oauth_secret] = auth_hash[:credentials][:secret]
    token_hash[:screen_name] = auth_hash[:info][:nickname]
    #token.user_id = user.id
    return token_hash
  end

end