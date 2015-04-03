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
#

require 'notification_helper'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,:registerable

  has_many :user_cities
  has_many :user_categories
  has_many :leads
  has_many :lead_streams

  after_create :generic_email_domain_check

  after_update :send_emails



  def active_for_authentication?
    # Checking if a user is active
    super and self.is_active?
  end


  # Checking if the user is using gmail, yahoo or any other common domain and not their business email
  def generic_email_domain_check

    notification_helper = NotificationHelper.new

    if is_generic_email?
      notification_helper.set_generic_email(self.id)
    end


  end

  def is_generic_email?

    generic_email_domains = ['gmail', 'yahoo', 'outlook']

    generic_email_domains.each do |generic_domain|
      if email_domain.include? generic_domain
        return true
      end
    end

    return false
  end

  def email_domain
    self.email.split('@').last
  end


  def send_emails

    if !self.invitation_accepted_at.nil? && ((founder_welcome_sent == false) || founder_welcome_sent.nil? )

      self.founder_welcome_sent = true

      if self.save
        LifecycleMailer.welcome_email(self.email, self.trial_duration).deliver
        LifecycleMailer.founder_welcome(self.email).deliver
      else

      end

    end

  end


end
