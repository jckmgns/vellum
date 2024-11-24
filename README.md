# Vellum

A light syntax theme with minimal colors to lessen visual clutter.

## Installation

Install with your favorite package manager and add the following to your vimrc:

```
syntax enable      " Enable syntax highlighting.
set termguicolors  " Enable true color support.
colorscheme vellum " Set the colorscheme to Vellum.
```

--- 

Add the following snippet if colors aren't displayed correctly:

```
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
```

## Configuration

### Monochrome Mode

Enable monochrome mode using the following option:

```
let g:vellum#monochrome=1 " Enable monochrome mode.
```

This option needs to be set before the `colorscheme vellum` statement.

## Screenshots

### Color Mode

![Color](https://i.imgur.com/cCXMEBc.png)

### Monochrome Mode

![Monochrome](https://i.imgur.com/KsebYBP.png)

## License

Licensed under MIT License.
