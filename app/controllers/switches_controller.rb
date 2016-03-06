class SwitchesController < ApplicationController
  before_action :set_switch, only: [:show, :update, :destroy]
  before_action :set_api_key, only: [:index, :create]

  # GET /switches?api_key=<string>
  def index
    render json: @api_key.switches
  end

  # GET /switches/1
  def show
    render json: @switch
  end

  # POST /switches
  def create
    @switch = @api_key.switches.build(switch_params)

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

  def set_api_key
    @api_key = ApiKey.find_by(key: params[:api_key])
  end

  # Only allow a trusted parameter "white list" through.
  def switch_params
    params.require(:switch).permit(:name, :interval, :email, :uuid, :active, :sms)
  end
end

