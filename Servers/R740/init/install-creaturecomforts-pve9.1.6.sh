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
  bat

apt autoremove -y

echo "Reboot recommended."
