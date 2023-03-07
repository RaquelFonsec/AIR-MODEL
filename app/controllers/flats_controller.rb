class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = policy_scope(Flat)
    authorize @flats
  end

  def show
    @flat = Flat.find(params[:id])
    @comment = Comment.new
    @marker = [{
      lat: @flat.latitude,
      lng: @flat.longitude,
      # info_window: render_to_string(partial: "popup", locals: { flat: @flat }),
      marker_html: render_to_string(partial: "marker")
      }]
      authorize @flat
    end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def edit
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    respond_to do |format|
      if @flat.save
        format.html { redirect_to flat_url(@flat), notice: "Flat criado  om sucesso." }
        format.json { render :show, status: :created, location: @flat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @flat
    respond_to do |format|
      if @flat.update(flat_params)
        format.html { redirect_to flat_url(@flat), notice: "Flat atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @flat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @flat.destroy
    authorize @flat

    redirect_to root_path, status: :see_other, notice: "Flat excluido com sucesso."
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:city, :title, :user_id, :description, :address, :price, :category, photos: [])
  end
end
