class User < ActiveRecord::Base
  has_many :bicycles
  has_many :messages
  has_many :reservations
  has_many :transactions
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # validates_with AttachmentPresenceValidator, :attributes => :avatar
  # validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes
end