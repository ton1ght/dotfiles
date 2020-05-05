# My Setup

I use [arch](https://www.archlinux.de/), btw.

## Environment

| Component | Using |
| --- | --- |
| Window Manager | [i3-gaps](https://github.com/Airblader/i3) |
| Statusbar | [polybar](https://github.com/polybar/polybar)|
| Launcher | [rofi](https://github.com/davatorium/rofi)|
| Terminal | [alacritty](https://github.com/alacritty/alacritty)|
| Notification Manager | [dunst](https://github.com/dunst-project/dunst)|
| Display Manager | [lightdm](https://github.com/canonical/lightdm)|

## Editor

[Neovim](https://neovim.io/) with the plugin manager [vimplug](https://github.com/junegunn/vim-plug).

| Plugins | Description |
| --- | --- |
|   [fzf.vim](https://www.github.com/junegunn/fzf.vim) |  Finds files fast|
|   [vim-rooter](https://www.github.com/airblade/vim-rooter) |  Changes current working directory  |
|   [vim-ripgrep](https://www.github.com/jremmen/vim-ripgrep) |  Finds text inside files  |
|   [vim-snippets](https://www.github.com/honza/vim-snippets) |  Provides snippets for several languages |
|   [vim-base16](https://www.github.com/chriskempson/base16-vim/) | Nice colorthemes |
|   [vim-base16-lightline](https://www.github.com/daviesjamie/vim-base16-lightline) |  Colortheme support for lightline  |
|   [lightline](https://www.github.com/itchyny/lightline.vim) |  Simple and fast statusline |
|   [lightline-bufferline](https://github.com/mengelbrecht/lightline-bufferline) | Tabline for buffers |
|   [vimtex](https://www.github.com/lervag/vimtex) |  Latex support for vim  |
|   [coc.nvim](https://www.github.com/neoclide/coc.nvim) |  IntelliSense engine  |
|   [vim-commentary](https://www.github.com/tpope/vim-commentary) |  Bulk commenting tool  |
|   [vim-surround](https://www.github.com/tpope/vim-surround) |  Easily change surroundings, e.g. parenthesis |


## Shell

[zsh](http://zsh.sourceforge.net/) with the plugin manager [zplug](https://github.com/zplug/zplug).

| Plugins | Description |
| --- | --- |
| [zsh-autosuggestions](https://www.github.com/zsh-users/zsh-autosuggestions) | Suggests commands previously run |
| [zsh-completions](https://www.github.com/zsh-users/zsh-completions) | Better command completion |
| [fzf](https://www.github.com/junegunn/fzf) | Finds files fast |
| [zsh-syntax-highlighting](https://www.github.com/zsh-users/zsh-syntax-highlighting) | Highlights commands while typing |
| [powerlevel10k](https://www.github.com/romkatv/powerlevel10k) | Shell prompt theme |

## Install dotfiles on a new system

```shell
git clone --bare https://github.com/ton1ght/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
I followed [this](https://www.atlassian.com/git/tutorials/dotfiles) tutorial.
## Credits

Thanks to everyone mentioned in this repository.

Special thanks to:
* [Luke Smith](https://github.com/LukeSmithxyz/)
* [Jon Gjengset](https://github.com/Jonhoo)
