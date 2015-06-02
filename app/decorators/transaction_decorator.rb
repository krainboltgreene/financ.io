class TransactionDecorator < Draper::Decorator
  delegate_all

  def amount
    Money.new(object.amount).format(with_symbol: true)
  end

  def positive?
    object.amount > 0
  end

  def negative?
    object.amount < 0
  end

  def income
    object.income || IncomeNull.new
  end

  def income_path
    if object.income
      helpers.income_path(object.income)
    else
      helpers.incomes_path
    end
  end
end
