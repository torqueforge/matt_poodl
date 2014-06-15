class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    Verse.new(variant(number)).to_s
  end

  def variant(number)
    VerseVariant.new(number)
  end
end

require 'forwardable'
class Verse
  extend Forwardable
  delegate [:initial_quantity, :initial_container,
            :action,
            :final_quantity, :final_container] => :variant

  attr_reader :variant

  def initialize(variant)
    @variant = variant
  end

  def to_s
    "#{initial_quantity.capitalize} #{initial_container} of beer on the wall, " +
    "#{initial_quantity} #{initial_container} of beer.\n" +
    "#{action}, " +
    "#{final_quantity} #{final_container} of beer on the wall.\n"
  end
end

class VerseVariant
  attr_reader :number

  def initialize(number)
    @number = number
  end

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

  def initial_quantity
    if number == 0
      'no more'
    else
      number.to_s
    end
  end

  def final_quantity
    if number == 0
      99.to_s
    elsif number == 1
      'no more'
    else
      (number-1).to_s
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

class VerseVariant1 < VerseVariant
  def initial_container
    'bottle'
  end
end
