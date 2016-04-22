class Station

  def initialize(name, zone)
    @name = name
    @zone = zone
  end

  attr_reader :zone

  def name
    @name.clone
  end

end
