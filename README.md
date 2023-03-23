# Sort::Fast
Sort lists and arrays of numeric values very fast.

## How to install

```bash
zef install Sort-Fast # May take a second on older hardware for tests
```

## How to use
```raku
use Sort::Fast;

my @foo = [1,82,3,9,10,200,30,4];

@foo = @foo.sort-fast;

say @foo; # [1, 3, 4, 9, 10, 30, 82, 200]
```

## License
This project is available under the `Artistic 2.0` license, please view it at the root of the project for more information.
