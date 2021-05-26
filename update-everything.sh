#!/usr/bin/env bash

set -o errexit
set -o nounset
set -eu -o pipefail

brew update
brew upgrade
brew cleanup -s
#now diagnotic
brew doctor
brew missing
# apm upgrade -c false
# /opt/bin/updateCCTF.sh && terminal-notifier -message "git pull done :-)" -title "CCTF up to date"
echo "you can hit mas upgrade to upgrade theses apps from the app store:"
mas outdated
echo "install with: mas upgrade"
npm update -g
# https://gist.github.com/DanHerbert/9520689 -- set up NPM
echo "did you think to launch gem update "
gem update
echo "and pip ? pip freeze — local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs pip install -U "
pushd ~/Documents/bypass-paywalls-chrome/ && git pull && popd
softwareupdate --all --install --force

python3 -m pip install --upgrade pip
python3 -m pip install --user --upgrade git+https://github.com/codespell-project/codespell.git

pushd ~/Documents/gperftools/
git pull 
autoreconf -fi 
./configure 
make 
make install 

pushd ~/Documents/neubanner/
git pull 

pushd ~/Documents/lci/
git pull 

pushd ~/Documents/just-the-class/
git pull

pushd ~/Documents/emojicode/
docker build -t emojicode-build -f docker/clang .
docker run --rm emojicode-build
docker run --rm -v $(pwd)/code:/workspace -it emojicode-build /bin/bash

pushd ~/Documents/syn/
git pull
make install

# Commented b/c requires user input as written
# pushd ~/Documents/andromeda/
# opam update
# opam upgrade 
# opam pin add andromeda .    # for installation (confirm twice with "y")
# opam upgrade                # to upgrade

# Commented b/c requires to move things to a certain directory
# pushd ~/Documents/keynote-to-pdf/
# git pull 

# Commented b/c requires to move things to a certain directory
# pushd ~/Documents/custom-iterm-applescripts-for-alfred/
# git pull

# Commented b/c something else needing to do to add to Chrome.
# pushd ~/Documents/TabFS
