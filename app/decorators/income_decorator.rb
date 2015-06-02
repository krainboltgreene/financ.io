class IncomeDecorator < Draper::Decorator
  delegate_all

  def amount
    Money.new(object.amount).format(with_symbol: true)
  end
end
