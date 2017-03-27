class IncomesController < ApplicationController
  before_action :authenticate_account!

  def index
    @incomes = IncomeDecorator.decorate_collection(current_organization.incomes)
  end

  def show
    redirect_to incomes_path
  end

  def new
    @income = current_organization.incomes.new
  end

  def create
    income = current_organization.incomes.new(IncomeDenormalizer.new(params[:income]))

    if income.save
      redirect_to incomes_path
    else
      render :new
    end
  end
end
