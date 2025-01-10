# Vellum

A (mostly[^1]) monochromatic light colorscheme for Vim and Neovim.

[^1]: Some colors are used where it makes sense (e.g., diffs, errors, netrw).

## Installation

Install with your favorite package manager and add the following to your vimrc:

```
syntax enable      " Enable syntax highlighting.
set termguicolors  " Enable true color support.
colorscheme vellum " Set the colorscheme to Vellum.
```

--- 

Add the following snippet if colors aren't displayed correctly (see `:h
xterm-true-color`):

```
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
```

## Screenshots

![Code Screenshot](https://i.imgur.com/0zLuY7N.png)

![Diff Screenshot](https://i.imgur.com/OVnvJ9d.png)

## License

Licensed under MIT License.
