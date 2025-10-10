#' @importFrom V8 new_context
ctx <- NULL

.onLoad <- function(libname, pkgname){
  ctx <<- V8::v8()
  wd <- setwd(system.file('js', package = 'toml'))
  on.exit(setwd(wd))
  blob <- readBin('tomlr.wasm', raw(), file.info('tomlr.wasm')$size)
  ctx$assign('bytes', blob)
  ctx$eval('var module = new WebAssembly.Module(bytes);')
  ctx$source('tomlr.js')
  ctx$eval('load_toml_edit_module(module)', await = TRUE)
}
