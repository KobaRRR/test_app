class TestController < ApplicationController
  def index
    @test = "SCSSを諦めた"
  end

  def login_form
    
  end

  def login_success
    @message = "ログインに成功しました。"
  end
end
