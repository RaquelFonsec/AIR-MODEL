class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @flats = Flat.all
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  def my_flats
    @flats = current_user.flats
  end
end
