# == Schema Information
#
# Table name: tokens
#
#  id           :integer          not null, primary key
#  provider     :string(255)
#  uid          :string(255)
#  name         :string(255)
#  oauth_token  :string(255)
#  oauth_secret :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

class Token < ActiveRecord::Base

  def self.from_omniauth(auth, user_id)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth, user_id)
  end

  def self.create_from_omniauth(auth, user_id)

    user = User.find(user_id)

    create! do |token|
      token.provider = auth[:provider]
      token.uid = auth[:uid]
      token.name = auth[:info][:name]
      token.oauth_token = auth[:credentials][:token]
      token.oauth_secret = auth[:credentials][:secret]
      token.user_id = user.id
    end


    user.authorized_application = true
    user.save


  end

end
