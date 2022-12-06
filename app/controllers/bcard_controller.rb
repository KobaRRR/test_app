class BcardController < ApplicationController
  before_action :authenticate_user
  def index
    @BCards = BusinessCard.where(user_id: @current_user.id)
  end

  def new
    @bcard = BusinessCard.new
  end

  def create
      @bcard = BusinessCard.new(bcard_params)
      @bcard.user_id = @current_user.id
      if @bcard.save
      flash[:notice] = "created"
      redirect_to '/bcard/index'
      else
        @message = "company and name should be filled in"
        render '/bcard/new'
      end
  end

  def edit
    @bcard = BusinessCard.find_by(id: params[:id])
  end
  
  def update  
    @bcard = BusinessCard.find_by(id: params[:id])
    @bcard.update(bcard_params)
    redirect_to '/bcard/index'
  end

  def destroy
    @bcard = BusinessCard.find_by(id: params[:id])
    @bcard.destroy
    redirect_to '/bcard/index'
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

  private
    def bcard_params
      params.require(:business_card).permit(:company_name, :name, :phone_num, :department, :division, :remarks)
    end


end


