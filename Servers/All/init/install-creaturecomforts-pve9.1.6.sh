#!/usr/bin/env bash
set -e
apt update && apt upgrade -y

echo "Installing Creature Comfort Packages"
apt install -y \
  sudo \
  htop \
  curl \
  lsof \
  iotop \
  iftop \
  ncdu \
  tmux \
  unzip \
  zip \
  glances \
  atop \
  mc \
  bat \
  fonts-powerline

apt autoremove -y

echo "Reboot recommended."
