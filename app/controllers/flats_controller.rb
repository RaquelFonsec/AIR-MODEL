class FlatsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flats_params)
    @flat.user = current_user
    if @flat.save
      redirect_to @flat, notice: "Flat criado com sucesso."
    else
      render 'new'
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @comment = Comment.new
    @marker =
      [{
        lat: @flat.latitude,
        lng: @flat.longitude,
        # info_window: render_to_string(partial: "popup", locals: { flat: @flat }),
        marker_html: render_to_string(partial: "marker")
      }]
  end

  def edit
    @flat =  Flat.find(params[:id])
  end

  def update
    @flat =  Flat.find(params[:id])
    if @flat.update(flats_params)
      redirect_to @flat, notice: "Flat atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, notice: "Flat excluído com sucesso."
  end

  private

  def flats_params
    params.require(:flat).permit(:city, :address, :price, fotos: [])
  end
end
