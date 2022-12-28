class BcardController < ApplicationController

  #ApplicationController
    before_action :authenticate_user

  def index
    #めちゃくちゃ見た目ごちゃっちゃった
    @ddlBCards = BusinessCard.select(:company_name).group(:company_name)

    sqlQuery = "select * from business_cards where 1 = 1 "

    #Sort
      if params[:company_name]
        if params[:company_name] == 'all'
          #条件追加なし。
        elsif params[:company_name] == 'default'
          # @BCards = BusinessCard.where(user_id: @current_user.user_id)
          sqlQuery.concat(" and user_id = #{@current_user.user_id}")
        else
          # @BCards = BusinessCard.where(user_id: @current_user.user_id, company_name: params[:company_name])
          sqlQuery.concat(" and company_name = '#{params[:company_name]}'")
        end

      end

      if params[:name]
        likeQuery = " and name like '%#{params[:name]}%'"
        likeQuery.concat(" union ", sqlQuery, " and company_name like '%#{params[:name]}%'")
        sqlQuery.concat(likeQuery)
    #DDL未選択
      # @BCards = BusinessCard.where(user_id: @current_user.user_id)
      end
      
    @BCards = BusinessCard.find_by_sql(sqlQuery)

  end

  def new
    @bcard = BusinessCard.new
  end

  def create
      @bcard = BusinessCard.new(bcard_params)
      @bcard.user_id = @current_user.user_id
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

  private
    def bcard_params
      params.require(:business_card).permit(:company_name, :name, :phone_num, :department, :division, :remarks)
    end


end


