class AuthHashParser

  def self.parse(auth_hash)

    token_hash = {}
    token_hash[:provider] = auth_hash[:provider]
    token_hash[:uid] = auth_hash[:uid]
    token_hash[:oauth_token] = auth_hash[:credentials][:token]
    token_hash[:oauth_secret] = auth_hash[:credentials][:secret]
    token_hash[:screen_name] = auth_hash[:info][:nickname]
    token_hash[:name] = auth_hash[:info][:name]
    token_hash[:profile_image_url] = auth_hash[:info][:image]

    return token_hash
  end

end