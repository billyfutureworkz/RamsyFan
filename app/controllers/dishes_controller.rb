class DishesController < ApplicationController
  def index
    @q = Dish.ransack(params[:q])
    @dishes = @q.result
  end

  def show
    @dish  = Dish.find(dish_id)
  end

  private
    def dish_id
      params.require(:id)
    end
end
