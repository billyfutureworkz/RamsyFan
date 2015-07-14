class DishesController < ApplicationController

  def index
    @q = Dish.ransack(params[:q])
    @dishes = @q.result(distinct: true)
  end

  def show
    @dish  = Dish.find(params[:id])
  end
end
