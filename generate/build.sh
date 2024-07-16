#!/bin/bash

cd generate

echo "downloading lua-language-server-$1..."
mkdir lua-language-server
cd lua-language-server
rm -rf ./*
wget -q -O - "https://github.com/LuaLS/lua-language-server/releases/download/$1/lua-language-server-$1-linux-x64.tar.gz" | tar xz

echo "patching files..."
sed -i.bak "s/\(\['Lua.hover.enumsLimit'\]\s*=\s*Type.Integer\s*>>\s*\)5\(,\)/\1100\2/" "script/config/template.lua"
sed -i.bak -e "s/\(\['Lua.hover.expandAlias'\]\s*=\s*Type.Boolean\s*>>\s*\)true\(,\)/\1false\2/" "script/config/template.lua"
sed -i.bak -e '/if \#view > 200 then/,/end/s/^/-- /' "script/vm/infer.lua"

echo "generating api docs..."
cd ..
git restore ../docs/SUMMARY.md
cargo run -- ../definitions/library ../docs