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
- Create a ..eslintrc file in ~/ directory for a global javascript checker
```{r, engine='bash', count_lines}
{
  "parser": "babel-eslint",
  "plugins": [ "react" ],
  "env": {
    "browser": true,
    "es6": true,
    "node": true
  },
  "ecmaFeatures": {
    "arrowFunctions": true,
    "blockBindings": true,
    "classes": true,
    "defaultParams": true,
    "destructuring": true,
    "forOf": true,
    "generators": true,
    "modules": true,
    "spread": true,
    "templateStrings": true,
    "jsx": true
  },
  "rules": {
    "consistent-return": [0],
    "key-spacing": [0],
    "quotes": [0],
    "new-cap": [0],
    "no-multi-spaces": [0],
    "no-shadow": [0],
    "no-unused-vars": [1],
    "no-use-before-define": [2, "nofunc"],
    "react/jsx-no-undef": 1,
    "react/jsx-uses-react": 1,
    "react/jsx-uses-vars": 1
  }
}
```


### Windows
  - Gnutls
  - htftp://ftp.gnutls.org/gcrypt/gnutls/w32/

#### bin (global)
All binaries should be accessible from emacs.
In osx by default emacs load .bashrc (~/.bash_profile should be copied .bashrc)

VC
- svn
- git

Search tools
- ag (lightning search)

PHP tools
- php
- composer

Javascript tools
- tern
- eslint
- babel-eslint
- eslint-plugin-react
- js-beautify

CSS tools
- csslint (Syntax checker)

Language tools
<!-- - ispell -->

Tags tools
<!-- - ctags -->
<!-- - tags -->
<!-- - cscope -->
<!-- - Global -->
<!-- - gtags -->

#### global bin 
VC
- svn
- git

Search tools
- ag (lightning search)

PHP tools
- php
  https://secure.php.net/
  (brew install homebrew/php/php56)

Javascript tools
- Nodejs
  https://nodejs.org/en/
  
- Node package manager
  https://www.npmjs.com/

- tern
  http://ternjs.net/
  
- eslint
  http://eslint.org/docs/user-guide/getting-started
  (sudo npm -g install eslint)
  
- babel-eslint
  (sudo npm install babel-eslint -g)

- eslint-plugin-react
  (sudo npm install eslint-plugin-react -g)
  
- js-beautify (npm install -g js-beautify)

CSS tools
- csslint (sudo npm -g install csslint)

Language tools
<!-- - ispell - brew install ispell --witch-lang-fr -->

Tags tools
 - global (gtags) - brew install global --with-pygments --with-ctags --with-exuberant-ctags

<!-- - tags https://github.com/leoliu/ggtags/wiki/Install-Global-with-support-for-exuberant-ctags -->
<!-- - gtags - brew install global (gtags) -->
<!-- - ctags - brew install --HEAD ctags -->
<!-- - cscope - brew install cscope -->
<!-- - Global - brew install global --with-exuberant-ctags -->


### Utils
- Change System keyboard capslock behaviour : (osx : Karabiner)
  - Single touch : espace, long press : CTRL (must have !!!)