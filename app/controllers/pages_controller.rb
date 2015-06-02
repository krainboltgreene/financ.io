class PagesController < ApplicationController
  def dashboard
    month_start = Date.today.beginning_of_month
    month_end = Date.today.end_of_month

    banks = Bank.all
    @banks = BanksDecorator.new(banks)
    transactions = Transaction.where(applied_at: month_start..month_end)
    @transactions = TransactionsDecorator.new(transactions)
  end
end
