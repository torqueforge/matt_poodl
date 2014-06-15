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
    begin
      Object.const_get("VerseVariant#{number}")
    rescue NameError
      VerseVariant
    end.new(number)
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
    'bottles'
  end

  def final_container
    'bottles'
  end

  def initial_quantity
    number.to_s
  end

  def final_quantity
    (number-1).to_s
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    'one'
  end
end

class VerseVariant0 < VerseVariant
  def initial_quantity
    'no more'
  end

  def final_quantity
    99.to_s
  end

  def action
    "Go to the store and buy some more"
  end

end

class VerseVariant1 < VerseVariant
  def initial_container
    'bottle'
  end

  def final_quantity
    'no more'
  end

  def pronoun
    'it'
  end

end

class VerseVariant2 < VerseVariant
  def final_container
    'bottle'
  end
end

class VerseVariant6 < VerseVariant
  def initial_quantity
    '1'
  end

  def initial_container
    '6-pack'
  end
end

class VerseVariant7 < VerseVariant
  def final_quantity
    '1'
  end

  def final_container
    '6-pack'
  end
end
