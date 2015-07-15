class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]

  # load_and_authorize_resource

  def index
    @q = Dish.ransack(params[:q])
    @dishes = @q.result
  end

  def show; end
  
  def new
    @dish = Dish.new
  end

  def create
    @dish = current_user.dishes.new(dish_params)

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

  def edit; end

  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_dish
      @dish = Dish.find(params.require(:id))
    end

    def dish_params
      params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian)
    end
end
