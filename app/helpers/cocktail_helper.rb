module CocktailHelper
	def create_vote(val)
		current_user.votes.create()

	end
end

