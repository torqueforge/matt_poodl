class Bottles

  def verse(number)
    if number > 1
      "#{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.\n" + "Take #{pronoun(number)} down and pass it around, #{quantity(number-1)} #{container(number-1)} of beer on the wall.\n"
    elsif number == 1
      "#{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.\n" + "Take #{pronoun(number)} down and pass it around, #{quantity(number-1)} bottles of beer on the wall.\n"
    elsif number == 0
      %q{No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
}
    end
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
    if number == 0
      'no more'
    else
      number.to_s
    end
  end

  def verses(first, last)
    (last..first).map { |i| verse(i) }.reverse.join("\n")
  end

  def song
    verses(99, 0)
  end

end
