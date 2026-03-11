FROM debian:bookworm-slim

# Create a dummy .zshrc file so the starship feature can configure it
# This will be overridden by the mount at runtime with your actual .zshrc
RUN mkdir -p /root && echo "# Dummy .zshrc for starship feature installation" > /root/.zshrc

RUN apt-get update && apt-get install -y \
  zsh \
  zsh-syntax-highlighting \
  zsh-autosuggestions \
  curl \
  wget \
  tree \
  jq \
  git \
  fzf \
  zoxide \
  fonts-firacode

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
