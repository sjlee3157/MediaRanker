class UsersController < ApplicationController

  def index
    @users = User.all.order(:created_at)
  end

  def show
  end

  private

  # def user_params
  #   return params.require(:user).permit(:name)
  # end

end
