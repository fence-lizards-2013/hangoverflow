class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :cocktail

	after_save :update_user_reputation


	private
	def update_user_reputation
		user.update_reputation!
	end

end