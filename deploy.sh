#!/bin/bash
set -euo pipefail

rm -rf build/output/
forester build forest.toml

cd ../forest-deploy
git rm -rf . >/dev/null 2>&1 || true
git clean -fxd

cd ../forest
cp -a ./output/forest/. ../forest-deploy

cd ../forest-deploy
git add .
git commit -m "deploy"
git push
