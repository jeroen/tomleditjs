This directory contains a minimal wrapper around the `toml-edit-js` package.

We use `esbuild` to bundle the package into a single neutral JavaScript file that can be used in various environments.

To update and rebuild `toml-edit-js`, run:

```bash
cd js
npm ci
npm install @rainbowatcher/toml-edit-js
npm run build
```
