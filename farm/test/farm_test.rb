require_relative '../../test_helper'
require_relative '../lib/animal'
require_relative '../lib/farm'

# Animals already exists; it's part of an external framework which you're
# not allowed to change.  These tests are here simply to show you its API.
#
# Your job is to write a Farm class that passes the FarmTest below.
class AnimalsTest < Minitest::Test
  def test_pig
    animal = Animal.all(['pig']).first
    assert_equal 'pig',  animal.species
    assert_equal 'oink', animal.sound
  end

  def test_owl
    animal = Animal.all(['owl']).first
    assert_equal 'owl',  animal.species
    assert_equal 'hoot', animal.sound
  end

  def test_pig_and_owl
    animals = Animal.all(['pig', 'owl'])
    assert_equal 2, animals.size
  end

  def test_missing_animal
    animal = Animal.all(['']).first
    assert_nil animal
  end

  def test_pig_and_missing_animal_and_owl
    animals = Animal.all(['pig', '', 'owl'])
    assert_equal 3, animals.size
  end
end


class FarmTest < Minitest::Test
  def test_pig
    expected =
    %q[Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had a pig, E-I-E-I-O,
With an oink oink here and an oink oink there,
Here an oink, there an oink, everywhere an oink oink,
Old MacDonald had a farm, E-I-E-I-O.]
    assert_equal expected, Farm.new(['pig']).lyrics
  end

  def test_pig_and_owl
    expected =
    %q[Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had a pig, E-I-E-I-O,
With an oink oink here and an oink oink there,
Here an oink, there an oink, everywhere an oink oink,
Old MacDonald had a farm, E-I-E-I-O.

Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had an owl, E-I-E-I-O,
With a hoot hoot here and a hoot hoot there,
Here a hoot, there a hoot, everywhere a hoot hoot,
Old MacDonald had a farm, E-I-E-I-O.]
    assert_equal expected, Farm.new(['pig', 'owl']).lyrics
  end

  def test_pig_and_nothing_and_duck
    expected =
    %q[Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had a pig, E-I-E-I-O,
With an oink oink here and an oink oink there,
Here an oink, there an oink, everywhere an oink oink,
Old MacDonald had a farm, E-I-E-I-O.

Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had a <silence>, E-I-E-I-O,
With a <silence> <silence> here and a <silence> <silence> there,
Here a <silence>, there a <silence>, everywhere a <silence> <silence>,
Old MacDonald had a farm, E-I-E-I-O.

Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had a duck, E-I-E-I-O,
With a quack quack here and a quack quack there,
Here a quack, there a quack, everywhere a quack quack,
Old MacDonald had a farm, E-I-E-I-O.]
    assert_equal expected, Farm.new(['pig', '', 'duck']).lyrics
  end
end
