class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, except: [:index]
  # before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def show    
  end
  
  def new
    @recipe = @restaurant.recipes.new
  end

  def edit
  end

  def create
    @recipe = @restaurant.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @restaurant, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    
    def recipe_params
      params.require(:recipe).permit(:title, :restaurant_id, :image, :description)
    end
end
