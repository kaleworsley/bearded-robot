class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  validates :password, :length => { :minimum => 6 }, :if => :password_digest_changed?

  before_validation :downcase_email

  private

  def downcase_email
    self.email.to_s.downcase!
  end
end
