class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :products
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "sad_panda.jpg"


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            case_sensitive: false
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_digest, presence: true, uniqueness: true
  validates_attachment_content_type :avatar,
                                    :content_type => /\Aimage\/.*\Z/,
                                    :size => { :in => 0..2.megabytes }
end
