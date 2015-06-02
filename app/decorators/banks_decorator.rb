class BanksDecorator < Draper::CollectionDecorator
  def total
    Money.new(map { |decorator| decorator.object.total }.inject(:+)).format(with_symbol: true)
  end
end
