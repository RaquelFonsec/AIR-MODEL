class BookingsController < ApplicationController
  before_action :set_flat
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

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

    authorize Booking # adiciona a autorização
    @booking = @flat.bookings.build(booking_params)
    @booking.user = current_user

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
  class BookingsController < ApplicationController
    before_action :set_flat
    before_action :set_booking, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def create
      authorize Booking # adiciona a autorização
      @booking = @flat.bookings.build(booking_params)
      @booking.user = current_user

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

    private

      def set_flat
        @flat = Flat.find(params[:flat_id])
      end

  def set_booking

@booking = Booking.find(params[:id])
end

def booking_params
    params.require(:booking).permit(:user_id, :flat_id, :start_date, :end_date, :total_price)
  end
end

  def verify_authorized
  raise Pundit::NotAuthorizedError, self.class unless pundit_policy_authorized?
      end
  end
  
