class User < ApplicationRecord
  has_secure_password
  
  has_many :events
  validates :email, presence: true
  validates :email, uniqueness: true

  def self.from_omniauth(auth)
    email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
    #Rails.logger.debug "Auth info: #{auth[:info].inspect}"
    #Rails.logger.debug "Auth info: #{auth[:extra][:raw_info].inspect}"
    name  = auth[:info][:full_name] || "Dump username"

    user = where(email: email).first_or_initialize
    user.full_name = name
    user.password = SecureRandom.base64
    user.save && user
  end

end
