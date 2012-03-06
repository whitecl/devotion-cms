class Subscriber < ActiveRecord::Base
  before_save :generate_private_code

  validates :email, uniqueness: true, presence: true 
  validate  :email_is_an_email

  def generate_private_code
    self.private_code = SecureRandom.hex(6)
  end

  def email_is_an_email
    unless self.email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
      self.errors[:email] << 'Email is not a valid email'
      false
    else
      true
    end
  end
end
