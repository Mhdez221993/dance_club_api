class Api::ReservationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_reservation, only: %i[show update destroy]

  # GET api/reservations
  def index
    @reservations = current_user.reservations

    render json: @reservations.to_json(include: :item)
  end

  # GET api/reservations/1
  def show
    render json: @reservation
  end

  # POST api/reservations
  def create
    @reservation = current_user.reservations.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/reservations/1
  def destroy
    @reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :city, :item_id)
  end
end
