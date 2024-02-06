class CatsController < ApplicationController
    before_action :set_cat, only: [:show, :update, :destroy]

    def index
        cats = Cat.all
        render json: cats 
    end
  
    def create
        # Create a new cat
        cat = Cat.create(cat_params)
        render json: cat
    end
end

    
