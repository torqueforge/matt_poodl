class Farm
  attr_reader :animals
  def initialize(animal_names)
    @animals = Animal.all(animal_names).map {|animal| animal || NullAnimal.new}
  end

  def lyrics
    animals.collect {|animal| verse(animal.species, animal.sound)}.join("\n\n")
  end

  def verse(name, sound)
    %Q[Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had #{article(name)} #{name}, E-I-E-I-O,
With #{article(sound)} #{sound} #{sound} here and #{article(sound)} #{sound} #{sound} there,
Here #{article(sound)} #{sound}, there #{article(sound)} #{sound}, everywhere #{article(sound)} #{sound} #{sound},
Old MacDonald had a farm, E-I-E-I-O.]
  end

  def article(word)
    starts_with_vowel?(word) ? 'an' : 'a'
  end

  def starts_with_vowel?(word)
    word.match(/\b[aeiou]/)
  end
end


class NullAnimal
  def default
    '<silence>'
  end

  def species
    default
  end

  def sound
    default
  end
end
