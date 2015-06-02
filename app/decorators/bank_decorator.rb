class BankDecorator < Draper::Decorator
  delegate_all

  def total
    Money.new(object.total).format(with_symbol: true)
  end
end
