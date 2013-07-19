class AuthenticationsController < ApplicationController
  def create
    auth = Authentication.find_by_uid(env["omniauth.auth"].uid)
    sign_in_and_redirect auth.nil? ? User.create_from_hash(env["omniauth.auth"]) : auth.user 
  end
end
