class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    @bills15 = Bill.where(session: "2015")
    @bills14 = Bill.where(session: "2014")
  end

  def show

  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_bill
      @bill = Bill.find_by_billName(params[:id])
    end

    def bill_params
      params[:bill]
    end
end
