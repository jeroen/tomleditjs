#' @importFrom V8 new_context
ctx <- NULL

.onLoad <- function(libname, pkgname){
  ctx <<- V8::v8()
  wd <- setwd(system.file('js', package = 'tomleditjs'))
  on.exit(setwd(wd))
  blob <- readBin('index_bg.wasm', raw(), 1e6)
  ctx$assign('bytes', blob)
  ctx$eval('var module = new WebAssembly.Module(bytes);')
  ctx$source('toml-edit-js.min.js')
  ctx$eval('load_toml_edit_module(module)', await = TRUE)
}
