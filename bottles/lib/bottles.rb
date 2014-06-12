class Bottles

  def verse(number)
    if number > 1
      "#{number} #{container(number)} of beer on the wall, #{number} bottles of beer.\n" + "Take one down and pass it around, #{number-1} #{container(number-1)} of beer on the wall.\n"
    elsif number == 1
      "#{number} bottle of beer on the wall, #{number} bottle of beer.\n" + "Take it down and pass it around, no more bottles of beer on the wall.\n"
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

  def verses(first, last)
    (last..first).map { |i| verse(i) }.reverse.join("\n")
  end

  def song
    verses(99, 0)
  end

end
