class OrganizationDenormalizer
  def initialize(parameters)
    @name = parameters[:name]
    @slug = parameters[:slug]
  end

  def to_h
    {
      "name" => @name,
      "slug" => @slug
    }
  end
  alias_method :stringify_keys, :to_h
end
