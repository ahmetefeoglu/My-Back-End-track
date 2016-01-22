class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s(x.filling_type, x.glazing)
    if x.filling_type && x.glazing == nil
      "plain"
    end
  end

end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1