class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def index
        restaurant_pizza= RestaurantPizza.all 
        render json: restaurant_pizza, status: :ok
    end 

    def create 
        pizza = RestaurantPizza.create!(pizza_params).pizza
            render json: pizza, status: :created 
    
    end 

    private 
    def pizza_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end 
   
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages  }, status: :unprocessable_entity
    end 

end
