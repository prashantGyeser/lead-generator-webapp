# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  email                        :string(255)      default(""), not null
#  encrypted_password           :string(255)      default("")
#  reset_password_token         :string(255)
#  reset_password_sent_at       :datetime
#  remember_created_at          :datetime
#  sign_in_count                :integer          default(0), not null
#  current_sign_in_at           :datetime
#  last_sign_in_at              :datetime
#  current_sign_in_ip           :string(255)
#  last_sign_in_ip              :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  authorized_application       :boolean
#  user_sent_to_processor       :boolean
#  total_streams                :integer          default(1)
#  setup_complete               :boolean
#  trial_duration               :integer          default(7)
#  invitation_token             :string(255)
#  invitation_created_at        :datetime
#  invitation_sent_at           :datetime
#  invitation_accepted_at       :datetime
#  invitation_limit             :integer
#  invited_by_id                :integer
#  invited_by_type              :string(255)
#  invitations_count            :integer          default(0)
#  sample_category_id           :integer
#  new_user                     :boolean          default(TRUE)
#  admin                        :boolean
#  is_active                    :boolean          default(TRUE)
#  subscribed                   :boolean          default(FALSE)
#  website                      :string(255)
#  founder_welcome_sent         :boolean          default(FALSE)
#  trial_over_notification_sent :boolean          default(FALSE)
#  global                       :boolean
#  active_beta_feature          :string(255)
#

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password "testtest"
    password_confirmation "testtest"
  end
end
