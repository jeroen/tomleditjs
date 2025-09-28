async function load_toml_edit_module(module){
    var td = await import('text-decoding/build/index');
    global.TextDecoder = td.TextDecoder;
    global.TextEncoder = td.TextEncoder;
    global.toml_edit = await import("@rainbowatcher/toml-edit-js/index");
    await toml_edit.initSync({module});
}
globalThis.load_toml_edit_module = load_toml_edit_module;
