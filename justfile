quartz_dir := "quartz"
content_dir := "content"

# List available recipes
default:
    @just --list

# Copy custom styles and symlink config files into quartz
copy-assets:
    cp -f $PWD/styles/custom.scss {{quartz_dir}}/quartz/styles/custom.scss
    ln -sf $PWD/quartz.config.yaml {{quartz_dir}}/
    ln -sf $PWD/quartz.lock.json {{quartz_dir}}/

# Install npm dependencies
install-deps:
    cd {{quartz_dir}} && npm ci

# Install quartz community plugins according to quartz.lock.json
install-plugins:
    cd {{quartz_dir}} && npx quartz plugin restore

# First-time setup: copy assets, install deps, resolve plugins
setup: copy-assets install-deps install-plugins

# Local preview with hot reload (requires content/ to exist — run clone-content first)
serve:
    cd {{quartz_dir}} && npx quartz build --serve -d ../{{content_dir}}

# One-time local build
build:
    cd {{quartz_dir}} && npx quartz build -d ../{{content_dir}}

# Upgrade Quartz: advance submodule to latest v5, then re-run setup
# After testing, commit the updated submodule pointer: git add quartz && git commit
upgrade-quartz:
    cd {{quartz_dir}} && git fetch origin && git checkout origin/v5
    just setup

upgrade-plugins:
    cd {{quartz_dir}} && npx quartz plugin update && npx qquartz plugin restore
