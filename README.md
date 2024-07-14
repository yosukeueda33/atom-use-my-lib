This project is for testing [this atom repo](https://github.com/yosukeueda33/atom) as local library.

# Usage
1. Clone [this atom repo](https://github.com/yosukeueda33/atom). Make the directory like this.
```
├──atom
└──atom-use-my-lib(this repo)
```
2. Build the atom repo. See its README.md .
3. `cd` to this repo directory and `stack build`.
4. `stack run atom-use-my-lib-exe`. This will generate `atom_use_my_code.c` and `atom_use_my_code.h`.
5. Execute the `atom_use_my_code.c`. This will stdout:
```
on
hey
hey
hey
off
hey
hey
hey
hey
hey
on
hey
hey
hey
off
...
```
. 

# Environment
In my case:
| Command | Version  |
| ------- | -------- |
| GHCup   | 0.1.30.0 |
| Stack   | 2.15.5   |
| cabal   | 3.10.3.0 |
| GHC     | 9.4.8    |
