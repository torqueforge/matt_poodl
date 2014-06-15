class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = number.to_bottle_number
    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.next} of beer on the wall.\n"
  end
end

class Fixnum
  def to_bottle_number
    begin
      Object.const_get("BottleNumber#{self}")
    rescue NameError
      BottleNumber
    end.new(self)
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def quantity
    number.to_s
  end

  def container
    'bottles'
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    'one'
  end

  def next
    (number-1).to_bottle_number
  end
end

class BottleNumber0 < BottleNumber
  def quantity
    'no more'
  end

  def action
    "Go to the store and buy some more"
  end

  def next
    99.to_bottle_number
  end
end

class BottleNumber1 < BottleNumber
  def container
    'bottle'
  end

  def pronoun
    'it'
  end
end

class BottleNumber6 < BottleNumber
  def quantity
    '1'
  end

  def container
    '6-pack'
  end
end
