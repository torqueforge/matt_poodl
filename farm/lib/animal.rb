# Assume Animals is part of an external framework that you cannot change.
module Animal

  Animal = Struct.new(:species, :sound)

  DATA = {
    cow:   'moo',
    dog:   'woof',
    duck:  'quack',
    pig:   'oink',
    owl:   'hoot',
    sheep: 'baa',
    yak:   'low'
  }

  def self.all(names)
    names.collect {|name|
      if (sound = DATA[name.to_sym])
        Animal.new(name, sound)
      else
        nil
      end
    }
  end
end
