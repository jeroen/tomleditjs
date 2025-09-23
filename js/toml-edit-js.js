async function load_toml_edit_module(module){
    global.toml_edit = await import("@rainbowatcher/toml-edit-js/index");
    await toml_edit.initSync({module});
}
globalThis.load_toml_edit_module = load_toml_edit_module;
