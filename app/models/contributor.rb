class Contributor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :first_name, :last_name, :coordinator_approved

  has_many :devotions

  after_create :add_to_subscribers

  def name
    first_name.to_s + ' ' + last_name.to_s
  end

  def add_to_subscribers
    Subscriber.create({:email => self.email})
  end
end
