class Member < ActiveRecord::Base
  include EmailAddressChecker
  has_many :posts, dependent: :destroy

  attr_accessor :password, :password_confirmation

  validates :name, length: { maximum: 20 }, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: { on: :create }, confirmation: {allow_blank: true}

  validate :check_email

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  private
  def check_email
    if email.present?
      errors.add(:email, :invalid) unless well_formed_as_email(email)
    end
  end


  class << self
    def authenticate(name, password)
      member = find_by(name: name)
      if member && member.hashed_password.present? &&
        BCrypt::Password.new(member.hashed_password) == password
        member
      else
        nil
      end
    end
  end
  
end
