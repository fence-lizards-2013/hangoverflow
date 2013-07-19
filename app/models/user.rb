class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :overage, :reputation

  validate :is_overage?

  has_many :votes
  has_many :cocktails, :dependent => :destroy
  has_many :authentications, :dependent => :destroy

  def update_reputation!
    reputation = 0
    cocktails.each do |cocktail|
      reputation += cocktail.vote_score if cocktail.vote_score
    end
    self.save
  end

  def is_overage?
    self.errors[:overage] = "You Must be 21 and over to progress" unless self.overage
  end

  def self.create_from_hash(hash)
    user = User.create(name: hash.info.name,
                       email: hash.info.email,
                       password: SecureRandom.hex(8),
                       overage: true)
    user.authentications.create(provider: hash.provider, uid: hash.uid)
    user
  end
end
