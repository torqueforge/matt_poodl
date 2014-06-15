class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
    "#{quantity(number)} #{container(number)} of beer.\n" +
    "#{action(number)}, " +
    "#{quantity(number-1)} #{container(number-1)} of beer on the wall.\n"
  end

  private
  def container(bottle_number)
    if bottle_number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun(bottle_number)
    if bottle_number == 1
      'it'
    else
      'one'
    end
  end

  def quantity(bottle_number)
    if bottle_number == -1
      99.to_s
    elsif bottle_number == 0
      'no more'
    else
      bottle_number.to_s
    end
  end

  def action(bottle_number)
    if bottle_number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(bottle_number)} down and pass it around"
    end
  end

end

class BottleNumber
  attr_reader :number

  def initialze(number)
    @number = number
  end

  def container(number)
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun(number)
    if number == 1
      'it'
    else
      'one'
    end
  end

  def quantity(number)
    if number == -1
      99.to_s
    elsif number == 0
      'no more'
    else
      number.to_s
    end
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end
end
