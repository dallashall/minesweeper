class Tile
  attr_reader :value, :display_value

  def initialize(value)
    #0 = empty, 1 = bomb, 2 = number, 3 = flag
    @value = value
    @display_value = "[]"
    @tile_sym = Hash.new { |hash, key| hash[key] = key.to_s }
    @tile_sym.merge!({s: "  ", b: "#", f: "f"})
  end

  def reveal()
    @display_value = @tile_sym[@value]
    @value == "b"
  end

  def flag
    @display_value = "f"
  end

  def unflag
    @display_value = "[]"
  end
end
