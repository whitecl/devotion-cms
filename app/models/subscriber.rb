class Subscriber < ActiveRecord::Base
  before_save :generate_private_code

  validates_uniqueness_of :email
  validates_presence_of :email

  def generate_private_code
    self.private_code = SecureRandom.hex(6)
  end
end
