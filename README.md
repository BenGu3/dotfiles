# dotfile setup

## Pre-setup

### Install `homebrew`

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to the path for this session
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Install `yadm`

```bash
brew install yadm
```

### Log into the Mac App Store

(for `mas`) via `App Store > Preferences > Sign in`

## Setup

### Clone and bootstrap

```bash
yadm clone https://github.com/BenGu3/dotfiles.git --bootstrap # https!
```

## Others

### Add ssh key

- [Create ssh key and add it to GitHub](https://help.github.com/articles/connecting-to-github-with-ssh/)
- [Add key to ssh-agent and `~/.ssh/config`](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#adding-your-ssh-key-to-the-ssh-agent)
