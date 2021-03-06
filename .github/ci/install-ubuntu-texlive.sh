#!/usr/bin/env bash

# Change default package repository
export REPO=https://mirrors.rit.edu/CTAN/systems/texlive/tlnet

# See if there is a cached version of TeX Live available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget $REPO/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile ../.github/ci/texlive-ubuntu.profile --repository $REPO
  cd ..
fi

# Install TeX Live packages
tlmgr install           \
  algorithm2e           \
  alphalph              \
  biber                 \
  biblatex              \
  biblatex-gb7714-2015  \
  bm                    \
  booktabs              \
  caption               \
  chngcntr              \
  cjk                   \
  ctex                  \
  enumitem              \
  environ               \
  eso-pic               \
  etoolbox              \
  everysel              \
  fandol                \
  filehook              \
  fontspec              \
  footmisc              \
  hologo                \
  ifoddpage             \
  latexmk               \
  listings              \
  logreq                \
  multirow              \
  newtx                 \
  ntheorem              \
  pageslts              \
  pdflscape             \
  pdfpages              \
  pgf                   \
  relsize               \
  silence               \
  siunitx               \
  tex-gyre              \
  threeparttable        \
  tocloft               \
  translator            \
  trimspaces            \
  ulem                  \
  undolabl              \
  unicode-math          \
  upgreek               \
  xcolor                \
  xecjk                 \
  xetex                 \
  xkeyval               \
  xstring               \
  zhnumber

# Update TeX Live install but add nothing new
tlmgr update --self --all --no-auto-install
