# Emacs profile

## Installation

### Mac Os X
- Mac Os X >= 10.11
- emacs >= 25


```{r, engine='bash', count_lines}
brew install --with-cocoa --srgb emacs
git clone --recursive https://github.com/willahh/emacs_profile ~/.emacs.d
```

### Windows
  - Gnutls
  - htftp://ftp.gnutls.org/gcrypt/gnutls/w32/

#### bin (global)
All binaries should be accessible from emacs.
In osx by default emacs load .bashrc (~/.bash_profile should be copied .bashrc)

- ag (lightning search)
- cscope
- csslint
- ctags
- git
- Global
- gtags
- ispell
- js-beautify
- jscs
- jshint
- php
- svn
- tags
- tern

### Recommanded
- Capslock remapped to ESCAPE key
- Key press delay (until repeat) : 200ms
- Key press repeat : 25ms

#### global bin 
- php (brew install homebrew/php/php56)
- cscope (brew install cscope)
- ag (lightning search)
- svn
- git
- tern
- js-beautify (npm install -g js-beautify)
- jshint - npm -g install jshint
- csslint - npm -g install csslint
- jscs (npm -g install jscs)
- tags https://github.com/leoliu/ggtags/wiki/Install-Global-with-support-for-exuberant-ctags
- gtags - brew install global (gtags)
- ctags - brew install --HEAD ctags
- cscope - brew install cscope
- Global - brew install global --with-exuberant-ctags
- ispell - brew install ispell --witch-lang-fr
