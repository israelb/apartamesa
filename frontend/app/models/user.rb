class User < ActiveRecord::Base
  has_one :oauth2_user_info, dependent: :destroy
  has_one :facebook_user_info, dependent: :destroy

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role

  def assign_default_role
    add_role(:admin)
  end

=begin
  def self.from_omniauth_twitter(auth_token)
    where(auth_token.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth_token.provider
      user.uid = auth_token.uid
      user.username = auth_token.info.nickname
    end
  end


  def self.from_omniauth_facebook(auth_token)
    raise
    data = auth_token[:info]
    raw_info = auth_token["extra"]["raw_info"]

    where(auth_token.slice(:provider, :uid)).first_or_create do |user|
      Oauth2UserInfo.email = data[:email]
      name = data["name"]
      fb_uid = auth_token["uid"]
      provider = auth_token["provider"]
      username = raw_info["username"]
    end

    where(auth_token.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth_token.provider
      user.uid = auth_token.uid
      user.username = username
      user.email = email
    end
  end
=end
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new session["devise.user_attributes"]  do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end


end
