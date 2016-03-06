class ApiKeysController < ApplicationController
  before_action :set_api_key, only: [:show, :destroy]

  # GET /api_keys/1
  def show
    render json: @api_key
  end

  # POST /api_keys
  def create
    @api_key = ApiKey.new(api_key_params)

    if @api_key.save
      render json: @api_key, status: :created, location: @api_key
    else
      render json: @api_key.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api_keys/1
  def destroy
    @api_key.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_key
      @api_key = ApiKey.find_by(key: params[:key])
    end

    # Only allow a trusted parameter "white list" through.
    def api_key_params
      params.require(:api_key).permit(:key, :email)
    end
end
