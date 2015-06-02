class IncomeDenormalizer
  def initialize(parameters)
    @name = parameters[:name]
    @amount = parameters[:amount]
    @rate = parameters[:rate]
    @bank_id = parameters[:bank_id]
    @start_at = parameters[:start_at]
  end

  def amount
    Monetize.parse(@amount)
  end

  def to_h
    {
      "name" => @name,
      "amount" => amount.cents,
      "rate" => @rate,
      "bank_id" => @bank_id,
      "start_at" => @start_at
    }
  end
  alias_method :stringify_keys, :to_h
end
