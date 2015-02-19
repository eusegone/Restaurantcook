class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :recipes, through: :saved_recipes
  has_many :saved_recipes


  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook,:google_oauth2 ]


  validates :password, length: { in: 6..20 }


  def self.from_omniauth(auth)
   if user = User.find_by_email(auth.info.email)
     user.provider = auth.provider
     user.uid = auth.uid
     user
   else
     where(provider: auth.provider, uid: auth.uid).first_or_create do | user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
     end
   end
  end
 def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
 end
end
