class FlatsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @flats = policy_scope(Flat)
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flats_params)
    @flat.user = current_user
    authorize @flat

    if @flat.save
      redirect_to @flat, notice: "Flat criado com sucesso."
    else
      render 'new'
    end
  end

  def show
    @flat = Flat.find(params[:id])
    authorize @flat
    @comment = Comment.new
  end


  def edit
    @flat =  Flat.find(params[:id])
  authorize @flat
end



  def update
    @flat =  Flat.find(params[:id])
    authorize @flat
    if @flat.update(flats_params)
      redirect_to @flat, notice: "Flat atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    authorize @flat
    @flat.destroy
    redirect_to flats_path, notice: "Flat excluído com sucesso."
  end

  private

  def flats_params
    params.require(:flat).permit(:city, :user_id, :description, :address, :price, fotos: [])
  end
end
