# Shared shell config, sourced by both zsh/.zshrc (macOS) and bash/.bashrc (Omarchy).
# Keep this POSIX-ish: it must parse in both bash and zsh.

export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim

alias lg='lazygit'
alias cl='clear'

# default nvim dir
export NVIM_APPNAME=LazyVim

alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-default="NVIM_APPNAME= nvim"

# pnpm
case "$(uname -s)" in
  Darwin) export PNPM_HOME="$HOME/Library/pnpm" ;;
  *) export PNPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pnpm" ;;
esac
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
