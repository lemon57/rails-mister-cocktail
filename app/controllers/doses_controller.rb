class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :show, :show, :create]
  def new
    @dose = Dose.new
  end

  def show
  end

  def create
    # p params["dose"]

    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      # puts "FAILED"
      render 'cocktails/new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    # render 'dose/show'
    redirect_to dose_path
  end

private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id )
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
