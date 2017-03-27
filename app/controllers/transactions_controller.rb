class TransactionsController < ApplicationController
  before_action :authenticate_account!

  def index
    @transactions = TransactionDecorator.decorate_collection(current_organization.transactions.where(index_parameters))
  end

  def show
    redirect_to transactions_path
  end

  def new
    @transaction = current_organization.transactions.new
  end

  def create
    transaction = current_organization.transactions.new(TransactionDenormalizer.new(params[:transaction]))

    if transaction.save
      redirect_to transactions_path
    else
      render :new
    end
  end

  def index_parameters
    params.tap(&:permit!)[:filter]
  end
  private :index_parameters
end
