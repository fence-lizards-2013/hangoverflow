class Vote < ActiveRecord::Base
	attr_accessible :user_id, :cocktail_id, :value
	belongs_to :user
	belongs_to :cocktail
	validates :value, inclusion: {:in => [-1,1]}
	validates_uniqueness_of :user_id, scope: :cocktail_id



	after_save :update_cocktail_vote_score
	after_save :update_user_reputation


	private
	def update_cocktail_vote_score
		self.cocktail.update_vote_score!(self.value)
	end

	def update_user_reputation
		self.user.update_reputation!
	end

end