class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:filter].present?
      @flats = Flat.where(category: params[:filter].capitalize)
    else
    @flats = Flat.all
    end
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "popup", locals: { flat: flat }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  def my_flats
    @flats = current_user.flats
  end
end
