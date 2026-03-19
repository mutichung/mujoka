quartz_dir := "quartz"
content_dir := "content"

# List available recipes
default:
    @just --list

# First-time setup: symlink custom.scss, copy config, install npm deps and plugins
setup:
    cp -f $PWD/styles/custom.scss {{quartz_dir}}/quartz/styles/custom.scss
    ln -sf $PWD/quartz.config.yaml {{quartz_dir}}/
    ln -sf $PWD/quartz.lock.json {{quartz_dir}}/
    cd {{quartz_dir}} && npm ci && npx quartz plugin resolve

# Local preview with hot reload (requires content/ to exist — run clone-content first)
serve:
    cd {{quartz_dir}} && npx quartz build --serve -d ../{{content_dir}}

# One-time local build
build:
    cd {{quartz_dir}} && npx quartz build -d ../{{content_dir}}

# Upgrade Quartz: advance submodule to latest v5, then re-run setup
# After testing, commit the updated submodule pointer: git add quartz && git commit
upgrade:
    cd {{quartz_dir}} && git fetch origin && git checkout origin/v5
    just setup

