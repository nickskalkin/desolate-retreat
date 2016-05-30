class UsersController < ApplicationController
  def show
    @policies = current_user.policies
  end
end
