# dotfile setup

## Setup

### 1. Install `homebrew`

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to the path for this session
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### 2. Install `yadm`

```bash
brew install yadm
```

### 3. Log into the Mac App Store

(for `mas`) via `App Store > Preferences > Sign in`

### 4. Clone and bootstrap

```bash
yadm clone https://github.com/BenGu3/dotfiles.git --bootstrap
```

## Others

### Add ssh key
- [1Password ssh setup](https://developer.1password.com/docs/ssh/get-started/)

### TODO (manual setup)
- MacOS
    - Set Arc to default browser
    - Allow watch open computer
    - Show volume on menu bar
    - No message sounds
- Zoom
    - Mute/Stop vid on join
    - Always show names/controls
    - Maintain window size
- Bootstrap
    - Only have to enter mac password once
    - Respond no to running zsh immediately
