class BcardController < ApplicationController
  before_action :authenticate_user, only: [:index, :new]
  def index
    @BCards = BusinessCard.all
  end

  def new
  end





  #ログインしていない状態でアクセスしたらログイン画面へ
  def authenticate_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    else
      flash[:notice] = "please log in"
      redirect_to '/'
    end
  end
end
