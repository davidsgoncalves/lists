class WalletsController < ApplicationController
  # GET /items
  def index
    @wallets = Wallet.all
  end

  # GET /items/new
  def new
    @wallet = Wallet.new
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  def edit
    @wallet = Wallet.find(params[:id])
  end

  def create
    @wallet = Wallet.new(wallets_params)

    respond_to do |format|
      if @wallet.save
        format.html { redirect_to wallets_path, notice: 'Sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @wallet = Wallet.find(params[:id])

    respond_to do |format|
      if @wallet.update(wallets_params)
        format.html { redirect_to wallets_path, notice: 'Sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @wallet = Wallet.find(params[:id])
    @wallet.destroy

    respond_to do |format|
      format.html { redirect_to wallets_path, notice: 'Foi deletado com sucesso' }
    end
  end

  private

  def wallets_params
    params.require(:wallet).permit(:name, :description)
  end
end
