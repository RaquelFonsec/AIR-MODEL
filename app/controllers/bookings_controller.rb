class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :Verify_policy_scoped, only: :index

  def index
    @bookings = policy_scope(Booking)
  end


def show
 authorize @booking
  end


  ef new
    @booking = Booking.new
    authorize @booking
  end


  def edit
    authorize @booking
  end


  def create
    @booking = Booking.new(booking_params)
    authorize @booking

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    authorize @booking

    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    authorize @booking
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_booking
      @booking = Booking.find(params[:id])
    end


def booking_params
      params.require(:booking).permit(:user_id, :flat_id, :start_date, :end_date, :status)
    end

def Verify_policy_scoped

      raise Pundit::PolicyScopingNotPerformedError, self.class unless pundit_policy_scoped?
    end
end
