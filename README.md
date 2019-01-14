# Mikeyon's Kick-Keister .vimrc

Hihowareya. This vimrc started as a skeleton given to me freshman year.
I have very slowly expanded it and am now at the point that I might as well be [bit-shifting with butterflies](https://www.xkcd.com/378/) if I have to use anything else.
Feel free to use this to make your life more productive and use changing this vimrc as an excuse to be unproductive.

## To install

```
git clone https://github.com/myoniles/vim_setup.git
cd vim_setup
./config.sh
```

# Shortcuts

`F5`: this has many uses. It generally will compile or run documents.
Right now this only includes c/c++, python, latex, rmarkdown, and markdown but I hope to expand it later.

`Shift+F5`: Opens the pdf compiled if you were just editing a .tex, .md, or .rmd file.

`Shift+N:` toggle Nerdtree

`]c` and `[c` are movement methods between hunks in GitGutter

`]t` and `[t` are used to move between tabs

`]b` and `[b` are used to move between buffers

`ctrl+[hjkl]` can move betwen windows

`ctrl+X` is to exit a buffer and automatically save

`tab` expands ultisnips

`ctrl+b` and `ctrl+z` are used for movement in ultisnips

# Included Plugins

- [Vundle as a package manager](https://github.com/VundleVim/Vundle.vim)
- [Airline](https://github.com/vim-airline/vim-airline)
- [Tag whitespace](https://github.com/ntpeters/vim-better-whitespace)
- [GitGutter](https://github.com/jisaacks/GitGutter)
- [fugitive](https://github.com/tpope/vim-fugitive)
- [markdown syntax](https://github.com/plasticboy/vim-markdown)
- [NERDTREE](https://github.com/scrooloose/nerdtree)
- [utilsnips for **amazing** autocompletion](https://github.com/sirver/UltiSnips)
