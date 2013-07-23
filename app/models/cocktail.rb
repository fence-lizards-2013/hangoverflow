class Cocktail < ActiveRecord::Base

  attr_accessible :description, :instructions, :name, :ingredients_attributes, :user_id, :vote_score, :image_id

  has_many :ingredients, :dependent => :destroy, inverse_of: :cocktail
  has_many :votes, :dependent => :destroy
  belongs_to :user

  validates :user, :description, :name, :instructions, presence: true

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  before_create :save_image

  def update_vote_score!(value)
  	self.vote_score += value
  	self.save
  end

  private
  
  def save_image
    if self.image_id.present?
      preloaded = Cloudinary::PreloadedFile.new(self.image_id)
      if preloaded.valid?         
        self.image_id = preloaded.identifier
      else
        self.errors.add(:image, "invalid image") unless preloaded.valid?
      end
    end
  end
end
