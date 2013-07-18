class User < ActiveRecord::Base

  has_many :votes
  has_many :cocktails
  accepts_nested_attributes_for :cocktails 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :overage, :reputation

  #validate :over_21
  #validates :overage, :acceptance => true, { :message => "you must be 21!" }
  validates :overage, :acceptance => { :accept => "1", :message => "you must be at least 21 years old" }

  def update_reputation!
    reputation = 0
    cocktails.each do |cocktail|
      reputation += cocktail.vote_score if cocktail.vote_score
    end
    self.save
  end

end
