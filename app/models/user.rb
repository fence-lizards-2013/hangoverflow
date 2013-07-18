class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :overage, :reputation

  validate :is_overage?

  has_many :votes
  has_many :cocktails

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

end
