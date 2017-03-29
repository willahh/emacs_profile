# Emacs profile

## Installation

### Mac Os X
- Mac Os X >= 10.11
- emacs >= 25

```{r, engine='bash', count_lines}
brew install --with-cocoa --srgb emacs
git clone --recursive https://github.com/willahh/emacs_profile ~/.emacs.d
cd ~/.emacs.d
mkdir tmp
```
- Install icons from ~/.emacs.d/plugins/all-the-icons/fonts/
- Use font "Meslo LG S" - size : 12 -  ~/.emacs.d/fonts/meslo (Menu > option > set default font)
- Install below dependencies globaly
- Create a .tern-project file in ~/ directory for a global javascript ES6 support
```{r, engine='bash', count_lines}
{
  "ecmaVersion": 6,
  "libs": [
    "browser"
  ],
  "loadEagerly": [
    "path/to/your/js/**/*.js"
  ],
  "dontLoad": [
    "node_modules/**",
    "path/to/your/js/**/*.js"
  ],
  "plugins": {
    "modules": {},
    "es_modules": {},
    "node": {},
    "doc_comment": {
      "fullDocs": true,
      "strong": true
    }
  }
}
```


### Windows
  - Gnutls
  - htftp://ftp.gnutls.org/gcrypt/gnutls/w32/

#### bin (global)
All binaries should be accessible from emacs.
In osx by default emacs load .bashrc (~/.bash_profile should be copied .bashrc)

- php
- svn
- git
- ag (lightning search)
- csslint (css syntax checker)
- eslint (javascript syntax checker)
- tern (javascript 
- js-beautify

<!-- - ispell -->
<!-- - jscs -->
<!-- - jshint -->
<!-- - ctags -->
<!-- - tags -->
<!-- - cscope -->
<!-- - Global -->
<!-- - gtags -->

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
- csslint (sudo npm -g install csslint)
- eslint (sudo npm -g install eslint)
<!-- - jshint (sudo npm -g install jshint) -->
<!-- - jscs (npm -g install jscs) -->
- tags https://github.com/leoliu/ggtags/wiki/Install-Global-with-support-for-exuberant-ctags
- gtags - brew install global (gtags)
- ctags - brew install --HEAD ctags
- cscope - brew install cscope
- Global - brew install global --with-exuberant-ctags
- ispell - brew install ispell --witch-lang-fr
