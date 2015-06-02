class TransactionDenormalizer
  def initialize(parameters)
    @amount = parameters[:amount]
    @bank_id = parameters[:bank_id]
    @income_id = parameters[:income_id]
    @applied_at = parameters[:applied_at]
    @note = parameters[:note]
  end

  def amount
    Monetize.parse(@amount)
  end

  def to_h
    {
      "amount" => amount.cents,
      "bank_id" => @bank_id,
      "income_id" => @income_id,
      "applied_at" => @applied_at,
      "note" => @note
    }
  end
  alias_method :stringify_keys, :to_h
end
