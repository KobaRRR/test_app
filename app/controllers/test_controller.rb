class TestController < ApplicationController
  before_action :authenticate_user, only: [:home, :index]
  def index
  end

  def login_form
  end

  def home
    # @message = "ログインに成功しました。"
    @headerTitle = "Home"
  end

  def login
    @current_user = User.find_by(name: params[:name], password: params[:password])
    if @current_user
      session[:user_id] = @current_user.id
      session[:user_name] = @current_user.name #ホントはIDだけ取得のほうがいいんだけどね
      flash[:notice] = "Successfully logged in "
      flash[:notice] << "Hello、#{@current_user.name}"
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
    @current_user = nil
    redirect_to "/"
  end

  
  #ログインしていない状態でアクセスしたらログイン画面へ
  def authenticate_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    else
      flash[:notice] = "please log in"
      redirect_to '/'
    end
    #  if session[:user_id]
    #   @current_user = User.find_by(id: session[:user_id])
    #  end
    #  if session[:user_id].nil? # or blank?
    #   flash[:notice] = "please log in"
    #   redirect_to '/'
    # end
  end

end
