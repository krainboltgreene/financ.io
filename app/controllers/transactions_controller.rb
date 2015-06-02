class TransactionsController < ApplicationController
  def index
    @transactions = TransactionDecorator.decorate_collection(Transaction.where(index_parameters))
  end

  def show
    redirect_to transactions_path
  end

  def new
    @transaction = Transaction.new
  end

  def create
    transaction = Transaction.new(TransactionDenormalizer.new(params[:transaction]))

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
