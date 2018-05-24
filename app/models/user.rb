class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, :password_digest, :auth_token, presence: true
  validates :email, :auth_token, uniqueness: true

  before_validation -> {self.auth_token ||= SecureRandom.urlsafe_base64(8)}
end
