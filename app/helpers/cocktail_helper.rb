module CocktailHelper
  # REVIEW: this is not used anywhere and either way doesn't belong here, it belongs in the controller
	def create_vote(val)
		current_user.votes.create()
	end
end

