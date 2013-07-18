module CapybaraHelpers
  def login(user)
    visit new_user_session_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
  end

  # def sign_in(user)
  #   ActionController::Base.any_instance.stub(:current_user) {user}
  # end
end
