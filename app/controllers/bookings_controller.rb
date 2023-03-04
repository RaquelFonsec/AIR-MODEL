class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user


    if @booking.save
      redirect_to flat_path(@flat), notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update

  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
    redirect_to flat_path(@flat), notice: "Booking was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:user_id, :flat_id, :start_date, :end_date, :total_price)
  end
end
