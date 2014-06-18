# Old MacDonald Had a Farm

Write the code to output the lyrics to the song
_Old MacDonald Had a Farm_.

### Test Suite

A failing test suite is provided in `./test/farm_test.rb`.

Your job is to make the tests pass.

The test suite can be run with the following command:

```plain
$ ruby test/farm_test.rb
```

All but the first test have been marked pending using the `skip` method. This
means that they will not spew error messages at you, even if they would fail.
To get a test to run and show you the error message, delete the `skip`.
To run a single test, use the name of the test. For example:

```plain
$ ruby test/farm_test.rb --name test_pig
```

### Lyrics

The lyrics allow a substitute animal and sound.
```plain
Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had a [animal name], E-I-E-I-O,
With a [animal noise twice] here and a [animal noise twice] there
Here a [animal noise], there a [animal noise], everywhere a [animal noise twice]
Old MacDonald had a farm, E-I-E-I-O.
```

For example, a verse using a pig as an animal and “oink" as the pig's sound:
```plain
Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had a pig, E-I-E-I-O,
With an oink oink here and an oink oink there,
Here an oink, there an oink, everywhere an oink oink,
Old MacDonald had a farm, E-I-E-I-O.
```
