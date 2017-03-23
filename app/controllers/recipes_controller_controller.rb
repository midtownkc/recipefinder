class RecipesControllerController < ApplicationController
  def index
    if params[:search].blank?
      params[:search] = "chocolate"
  end
end
