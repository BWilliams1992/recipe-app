class UsersController < ApplicationController
  before_action :find_user, only:[:show, :destroy]
  def show

  end

  def index 
    @users = User.all
  end

  def destroy
    authorize! :destroy, User
    @user.destroy
    redirect_to users_path
    flash[:notice] = 'User deleted'
  end

  private

    def find_user
      @user = User.find(params[:id])
    end
end
