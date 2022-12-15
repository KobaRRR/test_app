class UsersController < ApplicationController

  #ApplicationController
    before_action :authenticate_user, except: [:new, :create]


  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @current_user = User.find_by(_user_params_but_password)
      if @current_user
        session[:user_id] = @current_user.user_id
        session[:user_name] = @current_user.name
        flash[:notice] = "Successfully logged in "
        flash[:notice] << "Hello、#{@current_user.name}"
      end
      redirect_to '/bcard/index'
    else 
      flash[:notice] = "id and password should be filled in"
      render '/users/new'
    end
  end

  def edit
    @user = User.find_by(user_id: params[:user_id])
  end

  def update
    user = User.find_by(user_id: params[:upd_user_id])
    if user.update(_user_params_but_password)
    flash[:notice] = "Successfully logged in "
    redirect_to '/users/index'
    else
      @msg = "failed to update information"
      render "users/edit/#{params[:upd_user_id]}"
    end
  end

  private
    def user_params
      params.require(:user).permit(:user_id, :name, :password, :authority)
    end

    def _user_params_but_password
      params.require(:user).permit(:user_id, :name)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
