class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :update, :show, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "新增成功！"
      redirect_to restaurants_path
    else
      render "new"
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "修改成功！"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = "出現錯誤！"
      render "edit"
    end
  end

  def destroy
    @restaurant.delete
    flash[:alert] = "刪除成功！"
    redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:title, :description, :open_hours, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
