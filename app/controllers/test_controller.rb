class TestController < ApplicationController
  def index
  end

  def login_form
  end

  def home
    # @message = "ログインに成功しました。"
    @headerTitle = "Home"
  end

  def login
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      flash[:notice] = "Successfully logged in "
      flash[:notice] << "Hello、#{@user.name}"
      redirect_to "/test/home"
    else
      # @name = params[:name]
      # @password = params[:password]
      # @msg = "name or pass was wrong"
      # renderを使ってログイン失敗前の入力状態を保持したかったが諦め
      redirect_to "/login_form"

    end
  end

  def logout
    flash[:notice] = "Logged out"
    @user = User.find_by(id: session[:user_id]) 
    flash[:notice] << " Bye、#{@user.name}"
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to "/"
  end

end
