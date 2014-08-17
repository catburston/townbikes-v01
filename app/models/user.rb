class User < ActiveRecord::Base
  # attr_accessor :password
  has_many :bicycles
  has_many :messages
  has_many :reservations
  has_many :transactions

  has_secure_password validations: false

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # validates_with AttachmentPresenceValidator, :attributes => :avatar
  # validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes
  validates :password, length: { minimum: 4 }, on: :create
  validates :password, confirmation: true

  def confirm!
    # one time token is not needed anymore, but we have to save that email is confirmed
    update_attributes!(confirmation_token: nil, confirmed: true)
  end

  def set_session_token
    update_attributes(session_token: SecureRandom.urlsafe_base64(24))
    return session_token
  end
end