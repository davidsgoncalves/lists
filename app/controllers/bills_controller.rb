class BillsController < ApplicationController
  before_action :find_bill, only: [:show, :update, :destroy]

  def index
    @bills = Bill.all
  end

  def new
    @bill = Bill.new
  end

  def show
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
    respond_to do |format|
      if @bill.update(bills_params)
        format.html { redirect_to bills_path, notice: 'Sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to bills_path, notice: 'Foi deletado com sucesso' }
    end
  end

  private

  def find_bill
    @bill = Bill.find(params[:id])
  end

  def bills_params
    params.require(:bill).permit(:name, :value, :due_date, :wallet_id)
  end
end
