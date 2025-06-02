async function load_toml_edit_module(module){
    global.toml_edit = await import("./toml-edit-js.js");
    await toml_edit.initSync({module});
}
