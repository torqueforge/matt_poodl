class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    Verse.new(number).verse
  end
end

class Verse
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def verse
    "#{quantity.capitalize} #{initial_container} of beer on the wall, " +
    "#{quantity} #{initial_container} of beer.\n" +
    "#{action}, " +
    "#{quantity} #{final_container} of beer on the wall.\n"
  end

  private
  def initial_container
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def final_container
    if number == 2
      'bottle'
    else
      'bottles'
    end
  end

  def quantity(number=self.number)
    if number == -1
      99.to_s
    elsif number == 0
      'no more'
    else
      number.to_s
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun
    if number == 1
      'it'
    else
      'one'
    end
  end

end
