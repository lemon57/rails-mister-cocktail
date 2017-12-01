class DosesController < ApplicationController
  before_action :set_cocktail
  def new
    @dose = Dose.new
    # @ingredients = Ingredient.all
  end

  def show
  end

  def create
    # p params["dose"]

    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      # puts "FAILED"
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])

    @dose.destroy
    # render 'dose/show'
    redirect_to cocktail_path(@cocktail)
  end

private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id )
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
