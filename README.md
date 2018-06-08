# enigma-ruby

A simple enigma machine simulator written in ruby. Example usage:

```
# bundle exec enigma -m "HELLO WORLD"
ILBDA AMTAZ

# bundle exec enigma -m "ILBDA AMTAZ"
HELLO WORLD
```

To list the other options use `-h` or `--help`

## Options

`-m TEXT` or `--message TEXT` The text to be encoded/decoded

`--reflector [REFLECTOR]` The reflector to use, defaults to reflector B. e.g. `--reflector A`

`-r [x,y,z]` or `--rotors [x,y,z]` The rotors to use from left to right, defaults to I, II, III. e.g `--rotors IV,I,V`

`-s [x,y,z]` or `--settings [x,y,z]` The initial settings of the three rotors, defaults to A, A, A. e.g. `--settings M,C,K`

## Security

This method of encoding information is famously insecure, caveat emptor
