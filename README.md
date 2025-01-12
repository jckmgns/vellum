# Vellum

A light Vim/Neovim theme to minimize visual clutter.

Syntax is made distinct by using shades and font styles. Colors are used only
if necessary, to display errors or a meaningful `diff` for example.

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

![Code Screenshot](https://i.imgur.com/XRDdRco.png)

![Diff Screenshot](https://i.imgur.com/3zmt1U6.png)

## License

Licensed under MIT License.
