# Bindings to toml-edit

Experimental bindings to [a WebAssembly port](https://github.com/rainbowatcher/toml-edit-js) of the toml_edit Rust crate.

Allows for modifying TOML data while preserving order, comments and whitespace.

## Install

Installation requires no compilation:

```
pak::pak("jeroen/tomleditjs")
```

## Example

The `edit_toml` function simply takes a TOML string and returns the modified TOML string:

```r
# Read some TOML dadta
toml <- readLines('https://raw.githubusercontent.com/posit-dev/air/refs/heads/main/Cargo.toml')

# Modify some fields
toml <- edit_toml(toml, 'workspace.package.rust-version', '1.84')
toml <- edit_toml(toml, 'workspace.dependencies.bla', list(path = "./yolo", rev = "123"))
print(toml)
```

You can also parse the toml into an R list:

```r
parse_toml(toml)
```
