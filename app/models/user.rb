class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  # customer
  has_many :customer_bookings, class_name: 'Booking'

  # owner
  has_many :yachts
  has_many :owner_bookings, through: :yachts, class_name: 'Booking'
  has_many :reviews, through: :bookings

  # if current_user.signed_without_oauth?
  has_attachment  :avatar, accept: [:jpg, :jpeg, :png, :gif]
  # end

  validates :last_name, :first_name, presence: true

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:avatar] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def update_with_password(params={})
    params.delete(:current_password)
    self.update_without_password(params)
  end

  def signed_without_oauth?
    provider != "facebook"
  end

end
