#!/usr/bin/env bash

set -o errexit
set -o nounset
set -eu -o pipefail

brew update
brew upgrade
brew cleanup -s
# the following command, or restarting terminal, for mactex to work after install
eval "$(/usr/libexec/path_helper)"
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
echo "and pip ? pip freeze — local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs pip install -U "
pushd ~/Documents/bypass-paywalls-chrome/ && git pull && popd
softwareupdate --all --install --force

# Until I can make homebrew install rust w/the rust-update installed.
rustup update


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
cargo update
cargo install --path $HOME/Documents/scryer-prolog/

# Currently doesn't correctly install
# pushd ~/Documents/ciao/
# ./ciao-boot.sh get devenv

# pushd ~/Documents/eclipse-clp-git/
# ./configure


python3 -m pip install --user -r $HOME/Documents/neubanner/requirements.txt

tldr --update

# Commented because I cannot get this to work without running in sudo, I think.
# tlmgr --self
# tlmgr --all

# Commented because I install fonts now with homebrew via tap cask-font.

# python3 -m pip install afdko
# python3 -m pip install fontmake

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
