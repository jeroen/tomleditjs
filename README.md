# toml

> Read, Write, and Modify TOML files in R

Simple toolkit for parsing and generating TOML text. Based on 
[toml_edit](https://docs.rs/toml_edit/latest/toml_edit/) which 
allows for modifying toml while preserving order, comments, and whitespace.
    
Note that current we ship a [WebAssembly build](https://github.com/rainbowatcher/toml-edit-js) 
of tomledit such that we do not have to compile from Rust in R, and things work
on all platforms including WebR. If Rust becomes better supported on CRAN we 
could interface the Rust crate directly.


## Install

Installation requires no compilation:

```
pak::pak("jeroen/toml")
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
