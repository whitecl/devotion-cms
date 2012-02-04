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

  # This is temporary, we should be able to generate these scriptomatically.
  def self.desired_week_strings
    [
      'Wed, Feb 22-24',
      'Mon, Feb 27-Mar 3',
      'Mon, Mar 5-10',
      'Mon, Mar 12-17',
      'Mon, Mar 19-24',
      'Mon, Mar 26-31',
      'Mon, Apr 2-7'
    ]
  end
end
