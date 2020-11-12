#!/bin/sh

if [ $# != 1 ]; then
  echo "Please set an argument"
  return 2>&- || exit
fi

#rename this directory
initialDir=basename$(pwd)
initialDirVal=$(basename ${initialDir})
mv ../${initialDirVal} ../"$1"
cd ../"$1"

## setting git
rm -rf .git
rm -f .gitignore README.md
touch .gitignore .env
echo '
.venv/
__pycache__/
.DS_Store
.vscode
.env
' >>.gitignore

git init

## write README
touch README.md
echo "# $1" >>README.md

mkdir .vscode
touch .vscode/settings.json
echo '{
  "python.pythonPath": "./.venv/bin/python3",
  "python.autoComplete.extraPaths": ["./app"],
  "python.analysis.extraPaths": ["./app"]
}

' >> .vscode/settings.json

## remove this script
find ./ -name "init.sh" | xargs rm

poetry install

docker-compose build
