class TransactionsDecorator < Draper::CollectionDecorator
  def gain
    Money.new(positive.amounts).format(with_symbol: true)
  end

  def loss
    Money.new(negative.amounts).format(with_symbol: true)
  end

  def amounts
    map { |decorator| decorator.object.amount }.inject(:+)
  end

  def positive
    self.class.new(select(&:positive?))
  end

  def negative
    self.class.new(select(&:negative?))
  end
end
