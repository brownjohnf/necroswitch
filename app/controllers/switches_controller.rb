class SwitchesController < ApplicationController
  before_action :set_switch, only: [:show, :update, :destroy]

  # GET /switches
  def index
    @switches = Switch.all

    render json: @switches
  end

  # GET /switches/1
  def show
    render json: @switch
  end

  # POST /switches
  def create
    @switch = Switch.new(switch_params)

    if @switch.save
      render json: @switch, status: :created, location: @switch
    else
      render json: @switch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /switches/1
  def update
    if @switch.update(switch_params)
      render json: @switch
    else
      render json: @switch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /switches/1
  def destroy
    @switch.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_switch
    @switch = Switch.find_by(uuid: params[:uuid])
  end

  # Only allow a trusted parameter "white list" through.
  def switch_params
    params.require(:switch).permit(:name, :interval, :email, :uuid, :active, :sms)
  end
end

