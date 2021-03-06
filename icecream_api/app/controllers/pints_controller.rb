class PintsController < ApplicationController

  # GET /pints
  def index
    pints = Pint.where(ice_cream_id: params[:ice_cream_id])

    render json: pints
  end

  # GET /pints/1
  def show
    render json: @pint
  end

  # POST /pints
  def create
    @pint = Pint.new(pint_params)

    if @pint.save
      render json: @pint, status: :created, location: @pint
    else
      render json: @pint.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pints/1
  def update
    if @pint.update(pint_params)
      render json: @pint
    else
      render json: @pint.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pints/1
  def destroy
    @pint.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pint
      @pint = Pint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pint_params
      params.require(:pint).permit(:pints_sold, :pints_made, :profit_per_pint, :month)
    end
end