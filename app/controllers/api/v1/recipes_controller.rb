class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    if logged_in?
      @recipes = current_user.recipes
      render json: RecipeSerializer.new(@recipes)
    else
      render json: {
        error: "Must be logged in to view Recipes"
      }
    end
  end

  # GET /recipes/1
  def show
    # render json: @recipe
    recipe_json = RecipeSerializer.new(@recipe).serializable_hash.to_json
    render json: recipe_json
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      render json: RecipeSerializer.new(@recipe), status: :created
    else
      resp = {
        error: @recipe.errors.full_messages.to_sentence
      }
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      # render json: @recipe
      render json: RecipeSerializer.new(@recipe), status: :updated 
    else
      resp = {
        error: @recipe.errors.full_messages.to_sentence
      }
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :ingredients, :instructions, :image_url, :category_id, :user_id, :category_id)
    end
end
