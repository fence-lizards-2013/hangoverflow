class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :cocktail
	validates :value, :inclusion => {:in => [-1,1]}

	after_save :update_user_reputation
	after_save :update_cocktail_vote_score


	private
	def update_cocktail_vote_score
		cocktail.update_vote_score!(value)
	end

	def update_user_reputation
		user.update_reputation!
	end

end