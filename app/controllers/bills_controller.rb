class BillsController < ApplicationController
  # GET /Bills
  def index
    @bills = Bill.all
  end

  # GET /Bills/new
  def new
    @bill = Bill.new
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def create
    @bill = Bill.new(bills_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to bills_path, notice: 'Sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @bill = Bill.find(params[:id])

    respond_to do |format|
      if @bill.update(bills_params)
        format.html { redirect_to bills_path, notice: 'Sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to bills_path, notice: 'Foi deletado com sucesso' }
    end
  end

  private

  def bills_params
    params.require(:bill).permit(:name, :value, :deadline)
  end
end
