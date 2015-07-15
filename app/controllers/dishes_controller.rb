class DishesController < ApplicationController
  def index
    @q = Dish.ransack(params[:q])
    @dishes = @q.result
  end

  def show
    @dish  = Dish.find(dish_id)
  end
  
  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def dish_id
      params.require(:id)
    end

    def dish_params
      params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian)
    end
end
