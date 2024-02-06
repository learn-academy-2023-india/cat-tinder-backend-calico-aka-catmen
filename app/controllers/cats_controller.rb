class CatsController < ApplicationController
    def index
        cats = Cat.all
        render json: cats 
    end
  
    def create
        # Create a new cat
        cat = Cat.create(cat_params)
        render json: cat
      end
    
      # Handle strong parameters, so we are secure
      private
      def cat_params
        params.require(:cat).permit(:name, :age, :enjoys, :image)
      end
  
    def update
    end
  
    def destroy
    end
   
end
