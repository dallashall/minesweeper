class Player
  def initialize(name)
    @name = name
  end

  def get_position
    puts "Enter coordinates in the following format\n1,1"
    print ">"
    format_position(gets.chomp)
  end

  def get_command
    puts "Enter command"
    puts "f: Flag, u: Unflag, r: reveal"
    puts "Example: r"
    print ">"
    gets.chomp
  end

  def format_position(string)
    string.split(",").map(&:to_i)
  end
end
