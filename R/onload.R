#' @importFrom V8 new_context
ctx <- NULL

.onLoad <- function(libname, pkgname){
  ctx <<- V8::v8()
  wd <- setwd(system.file('js', package = 'tomleditjs'))
  on.exit(setwd(wd))
  ctx$source('encoding-indexes.min.js')
  ctx$source('encoding.min.js')
  blob <- readBin('index_bg.wasm', raw(), 1e6)
  ctx$assign('bytes', blob)
  ctx$eval('let module = new WebAssembly.Module(bytes);')
  ctx$source('bindings.js')
  ctx$eval('load_toml_edit_module(module)', await = TRUE)
}
