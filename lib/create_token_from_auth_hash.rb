require 'auth_hash_parser'

class CreateTokenFromAuthHash

  def self.create_token(auth_hash, user_id)

    parsed_hash = AuthHashParser.parse(auth_hash)
    parsed_hash[:user_id] = user_id
    Rails.logger.debug "It is has thd following has to create an accoutn: #{parsed_hash.inspect}"

    token = Token.create(parsed_hash)

    return token
  end

end