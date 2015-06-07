class IncomesController < ApplicationController
  before_action :authenticate_account!

  def index
    @incomes = IncomeDecorator.decorate_collection(Income.all)
  end

  def show
    redirect_to incomes_path
  end

  def new
    @income = Income.new
  end

  def create
    income = Income.new(IncomeDenormalizer.new(params[:income]))

    if income.save
      redirect_to incomes_path
    else
      render :new
    end
  end
end
