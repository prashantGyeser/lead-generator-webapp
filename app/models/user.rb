# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  authorized_application :boolean
#  user_sent_to_processor :boolean
#  total_streams          :integer          default(1)
#  setup_complete         :boolean
#  trial_duration         :integer          default(7)
#  invitation_token       :string(255)
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#  invitations_count      :integer          default(0)
#  sample_category_id     :integer
#  new_user               :boolean          default(TRUE)
#  admin                  :boolean
#  is_active              :boolean          default(TRUE)
#  subscribed             :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,:registerable

  has_many :user_cities
  has_many :user_categories
  has_many :leads
  has_many :lead_streams

  def active_for_authentication?
    # Checking if a user is active
    super and self.is_active?
  end

  def remaining_days_in_trial

  end

  def active?
    trial_remaining_days = ((self.created_at + (self.trial_duration).days).to_date - Date.today).round

    subscribed = false
    if (Subscription.where(user_id: self.id).count) <= 0
      subscribed=false
    else
      subscribed=true
    end

    # find current_user who is login. If you are using devise simply current_user will works
    # now that you have remaining_days, check whether trial period is already completed
    if trial_remaining_days <= 0 && !subscribed
      return false
    end
    return true
  end

end
