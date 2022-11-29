class BcardController < ApplicationController
  def index
    @BCards = BusinessCard.all
  end
end
