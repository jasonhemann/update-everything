#!/usr/bin/env bash

set -o errexit
set -o nounset
set -eu -o pipefail

brew update
brew upgrade
brew services restart mariadb postgresql emacs langtool
brew cleanup -s
# the following command, or restarting terminal, for mactex to work after install
eval "$(/usr/libexec/path_helper)"

# Figure out how to make this work w/o an error.
# brew postgresql-upgrade-database

brew link --overwrite docker-compose
mkdir -p ~/.docker/cli-plugins
ln -sfn /usr/local/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

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
gem update --system
gem update
echo "and pip3 ?"
echo "pip3 freeze --local  | grep -v '^\-e' | cut -d = -f 1 |  xargs pip3 install -U"
pushd ~/Documents/bypass-paywalls-chrome/ && git pull && popd
softwareupdate --all --install --force

# If xcode updated
# COMMENTED, REQUIRES MUCH INTERACTION
# sudo xcodebuild -license

# Until I can make homebrew install rust w/the rust-update installed.
rustup update

# racket migrate
# If updated, we should also migrate new version
# raco pkg migrate <n-1th version>
# then store the appropriate version number elsewhere.

# TeX Live update manager, update itself, update packages.
tlmgr update --self
tlmgr update --all

pushd '/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/MacOS/' && ./msupdate --install && popd

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
docker run --rm -v "$(pwd)/code:/workspace" -it emojicode-build /bin/bash

pushd ~/Documents/syn/
git pull
make install

pushd ~/Documents/scryer-prolog/
git pull
brew upgrade rust
cargo update
cargo install --path "$(pwd)"

pushd ~/Documents/plzoo/
git pull
make all

# Commenting b/c it needs a password to update. expect script?
# pushd ~/Code/idris-on-m1/
# git pull
# source ~/Code/idris-on-m1/idris-on-m1.sh

# Currently doesn't correctly install
# pushd ~/Documents/ciao/
# ./ciao-boot.sh get devenv

# pushd ~/Documents/eclipse-clp-git/
# ./configure

# Commented b/c I cannot update it automatically, b/c I need to
# automate alfred update
#
# pushd ~/Documents/keynote-to-pdf/
# git pull
#
# pushd ~/Documents/custom-iterm-applescripts-for-alfred/
# git pull

# Commented because not working, check back w/formulog
# pushd /Users/jhemann/Documents/formulog/
# git pull
# mvn package

# LongingForEmacs
# styleguide
# bash-it
# anorock
# dminor-in-formulog
# bash-oo-framework
# brush

python3 -m pip install --user -r "$HOME/Documents/neubanner/requirements.txt"

tldr --update

# Commented because I cannot get this to work without running in sudo, I think.
# tlmgr --self
# tlmgr --all

pushd ~/Documents/libertinus/
git pull
fontship make

# python3 -m pip install afdko

# Commented because I install these fonts now with homebrew via tap cask-font.

# pushd ~/Documents/source-code-pro/
# git pull
# ./build.sh && mv ./target/TTF/* ./target/OTF/* ~/Library/Fonts/
# ./buildVFs.sh && mv ./target/VAR/* ~/Library/Fonts/

# pushd ~/Documents/source-sans-pro/
# git pull
# ./build.sh && mv ./target/TTF/* ./target/OTF/* ~/Library/Fonts/
# ./buildVFs.sh && mv ./target/VAR/* ~/Library/Fonts/

# pushd ~/Documents/source-serif-pro/
# git pull
# ./build.sh && mv ./target/TTF/* ./target/OTF/* ~/Library/Fonts/
# ./buildVFs.sh && mv ./target/VAR/* ~/Library/Fonts/

# pushd ~/Documents/libertinus/
# git pull
# ALLFONTS=true make
# mv ./*.otf ~/Library/Fonts/

# Commenting because I am not going to use pdflatex, so not super needed.
# pushd ~/Documents/FontPro/
# git pull

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
