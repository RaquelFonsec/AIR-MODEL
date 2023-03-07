class BookingsController < ApplicationController

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
    @bookings = policy_scope(Booking)
    render json: @bookings
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking

    redirect_to my_bookings_path, status: :see_other, notice: "Booking excluido com sucesso."
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.flat = @flat
    @booking.total_price = (@booking.end_date - @booking.start_date).to_i * @flat.price
    authorize @booking

    if @booking.save
      redirect_to my_bookings_path
    else
      render "new", message: @booking.errors, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :flat_id, :start_date, :end_date, :status)
  end

  def verify_policy_scoped
    raise Pundit::PolicyScopingNotPerformedError, self.class unless pundit_policy_scoped?
  end
end
