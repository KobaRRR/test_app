class TestController < ApplicationController

  #ApplicationController    
    before_action :authenticate_user, only: [:home, :index, :logout]

  def index
  end

  def login_form
    if session[:user_id]
      flash[:notice] = "You've already logged in "
      redirect_to '/test/home'
    end
    @user = User.new
  end

  def home
    # @message = "ログインに成功しました。"
    @headerTitle = "Home"
  end

  def login
    @current_user = User.find_by(user_id: params[:user_id])
    if @current_user && @current_user.authenticate(params[:password])
      session[:user_id] = @current_user.user_id
      session[:user_name] = @current_user.name
      flash[:notice] = "Successfully logged in "
      flash[:notice] << "Hello、#{@current_user.name}"
      redirect_to "/test/home"
    else
      # @name = params[:name]
      # @password = params[:password]
      @msg = "name or pass was wrong"
      # renderを使ってログイン失敗前の入力状態を保持したかったが諦め
      redirect_to "/"

    end
  end

  def logout
    flash[:notice] = "Logged out"
    @user = User.find_by(user_id: session[:user_id]) 
    flash[:notice] << " Bye、#{@user.name}"
    session[:user_id] = nil
    session[:user_name] = nil
    @current_user = nil
    redirect_to "/"
  end

end
