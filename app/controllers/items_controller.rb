class ItemsController < ApplicationController
  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(items_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update(items_params)
        format.html { redirect_to items_path, notice: 'Sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_path, notice: 'Foi deletado com sucesso' }
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :description)
  end
end
