class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :patients

  acts_as_messageable

  def email
    "User #{id}"
  end

  def mailboxer_email(object)
    nil
  end 

end
