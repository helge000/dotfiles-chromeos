#!/bin/sh

# harden chromeos
sudo chromeos-setdevpasswd
sudo crossystem dev_boot_signed_only=1

# Setup chromwbrew
curl -Ls git.io/vddgY | bash
yes | crew install \
  sommelier \
  gtk2
  sublime_text \
  gnupg \
  git \
  go \
  git_lfs \
  vim \
  vim_runtime \
  powerline_fonts \
  rsync \
  bash_completion

