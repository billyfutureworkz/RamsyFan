class DishesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :set_dish, :only => [:edit, :update]
  
  def index
    @q = Dish.published.ransack(params[:q])
    @dishes = @q.result
  end

  def show
    @dish = Dish.find(params.require(:id))
  end
  
  def new
    @dish = Dish.new
  end

  def create
    @dish = current_user.dishes.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def my_dishes
    @dishes = current_user.dishes.all
  end

  def published
    @dish = Dish.find(params.require(:id))
    @dish.update_attributes(:published => 1)

    respond_to do |format|
      format.html { redirect_to my_dishes_dishes_url, notice: 'Dish was publishsed successfully.' }
    end 
  end

  def un_published
    @dish = Dish.find(params.require(:id))
    @dish.update_attributes(:published => 0)

    respond_to do |format|
      format.html { redirect_to my_dishes_dishes_url, notice: 'Dish was unpublished successfully.' }
    end
  end

  private
    def dish_params
      params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian, :user_id)
    end

    def set_dish
      @dish = current_user.dishes.find(params.require(:id))
    end

    def record_not_found
      render plain: "404 Not Found", status: 404
    end
end
