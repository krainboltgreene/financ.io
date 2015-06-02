class BanksController < ApplicationController
  def index
    @banks = BankDecorator.decorate_collection(Bank.all)
  end

  def show
    redirect_to banks_path
  end

  def new
    @bank = Bank.new
  end

  def create
    bank = Bank.new(create_bank_attributes)

    if bank.save
      redirect_to banks_path
    else
      render :new
    end
  end

  def create_bank_attributes
    params.require(:bank).permit(:name, :public, :private)
  end
  private :create_bank_attributes
end
