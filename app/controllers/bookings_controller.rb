class BookingsController < ApplicationController

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  before_action :authenticate_user!,only: [:new, :create, :index]

  def index
    @bookings = policy_scope(Booking)
    render json: @bookings
  end

  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
    authorize @booking
  end

  def create
   @booking = Booking.new(booking_params)
   @booking.user = current_user
   @booking.flat = Flat.find(params[:flat_id])
   authorize @booking

        if @booking.save
      redirect_to my_bookings_path
        else
          render "new" ,message: @booking.errors, status: :unprocessable_entity
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
