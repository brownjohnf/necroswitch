class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  before_action :set_switch, only: [:create]

  # GET /events
  def index
    @events = Switch.find_by(uuid: params[:switch_uuid]).events

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = @switch.events.build(event_params)

    if @event.save
      render json: @event, status: :created, location: switch_event_path(@switch, @event)
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @switch = Switch.find_by(uuid: params[:switch_uuid])
    @event = @switch.events.find(params[:id])
  end

  def set_switch
    @switch = Switch.find_by(uuid: params[:switch_uuid])
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:message)
  end
end

