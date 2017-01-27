require_relative "tile"

class Board
  attr_reader :grid

  def initialize(filename)
    @grid = create_grid(filename)
    @bomb = false
  end

  def create_grid(filename)
    File.readlines(filename).map do |line|
      line.chomp.split("").map { |e| Tile.new(e) }
    end
  end

  def [](x, y)
    @grid[x][y]
  end

  def []=(x, y, value)
    if value == "f"
      @grid[x][y].flag
    elsif value == "u"
      @grid[x][y].unflag
    elsif value == "r"
      @bomb = @grid[x][y].reveal
    end
  end

  def render
    system("clear" || "clr")
    @grid.each do |row|
      p row.map { |e| e.display_value }
    end
  end

  def all_revealed?
    @grid.all? do |row|
      row.all? { |e| e.display_value != "[]" }
    end
  end

  def bomb_present?
    @bomb
  end
end
