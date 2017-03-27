class BanksController < ApplicationController
  before_action :authenticate_account!

  def index
    @banks = BankDecorator.decorate_collection(current_organization.banks)
  end

  def show
    redirect_to banks_path
  end

  def new
    @bank = current_organization.banks.new
  end

  def create
    bank = current_organization.banks.new(create_bank_attributes)

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
