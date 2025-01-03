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

## Screenshots

![Code Screenshot](https://i.imgur.com/JLIo2Hr.png)

![Diff Screenshot](https://i.imgur.com/WfOWg8H.png)

## License

Licensed under MIT License.
