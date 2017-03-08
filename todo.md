- Some nice .emacs.d
  https://github.com/djangoliv/conf
  https://github.com/hlissner/.emacs.d

- [x] M-w : close current buffer
- [x] M-S-w : close window
- [x] M-r -- ouvrir le panneau de filtre rapide
- [x] Nom du chemin courant dans le title (disparu suite merge)
- [x] M-o : find file
- [x] M-S-o : find in buffer (helm-mini)
- [x] M-S-p : M-x main
- [x] M-d : select all like this
- [x] M-p : projectile file
- [x] M-C-p : projectile project
- [x] M-S-f (search) : Binder sur helm-ag
- [x] M-C-f (search) : Binduer sur ag-files
- [x] M-x regression --> do cut instead of main emacs panel
- [x] git gutter / hl line : Plus d'affichage dans la goutiere
- [-] Rester en mode evil emacs sur les mode suivants : (liste non exhaustive)
       - *vc-change-log*
       
- [-] vc ediff part en live (N opere plus vraiment en mode fullscreen, inutilisable)
- [-] vc ediff : Customiser mieux le theme
- [-] open url in browser
- [-] neotree synchro with current opened file
- [-] tabbar organiser par group de fichiers et par mode
- [-] web mode : highlight current tag ne fonctionne plus (c etait parfait avant)
- [-] M-c-p doesn't work on all buffer
- [-] Enable emmet by default for web files
- [-] nlinum : plus large
- [-] nlinum : highlight current line number
- [-] meta shift 1 : delete other windows --> don't work --> maybe disable it globaly 
- [-] tabbar : hide bad icons
- [-] M-p doesn't work on all buffer
- [-] Ajouter une méthode copy file name pour retourner uniquement le nom du fichier
- [-] M-a regression --> ne selectionne plus l integralite du buffer
- [-] big visible current buffer
- [-]

- [-] ctrl+a en mode evil > default ne fonctionne pas
- [-] Certains gros fichiers impossibe à ouvrir
- [-] Fichiers markdown mette toutes les windows en centré
- [-] Don't add behaviour for end of line (remove end of line stuff)
      (Creation de differences inutiles sur la toute dernière ligne de certains fichiers)
- [-] Markdown mode style like in Sublime (background white, text black, column width limit, center inside)
- [-] Faire tourner "create-tags" (ctags doit etre lu par emacs)
- [-] JS auto doc
- [-] Faire fonctionner des snippets javascript
- [-] Web mode : avoir des propositions d auto completion de mots cles php connu
      Comme dans Sublime (var_       --> proposition var_dump)
      Voir du cote des snippets (Yasnippet)
      Update : il faut faire fonctionner yasnippet correctement avant
- [-] web mode : refresh colors after yank
- [-] Disable web mode disable auto indent
      Je pense qu il faut laisser cette fonctionalitee, et plutot voir les quelques cas
      qui ne conviennt pas
- [-] vc-ediff highlight color illisible
- [-] Validateur de syntax javascript / html / php on fly (doit fonctionner en web mode)
- [-] Dired : remove folder is very slow
- [-] Don't prompt for delete recursivly (code available in prelude)
- [-] Enable evil easy motion to work like vim easy motion  https://github.com/easymotion/vim-easymotion

- [-] Bottom line
  - [-] Show current mode in color
  - [-] Show current VC system used
  - [-] Show current encoding
- [-] Selected all same occurrence than current selection 
- [-] CSS mode > attribut —> TAB touch —> wrote : 
- [-] Chromium included 
- [-] Correcteur orthographique 
- [-] Markdown in white theme
- [-] git-svn
- [-] Display current encoding 
- [-] Parcourir partage smb 
- [-] [theme] Color in shell mode 
- [-] [theme] Les couleurs ne sont pas assez décomposé comme dans Sublime (« var » colorA, = colorB, …) 
- [-] mysql integration 
- [-] Markdown in white theme
- [-] git-svn

- [x] implementer ctrL+x
- [x] SHIFT+Click dont show me submenu .. do a selection
      ----> Fonctione bien avec gnu emacs from brew (brew install emacs ?)
- [x] match bracket/color highlight -----> une couleur plus discrete, on voit rien
- [x] CMD+SHIFT+/ affiche le menu aide (pas de declenchement du trigger comment/uncomment
      ----> Fonctione bien avec emacs from brew
- [x] Toujours utiliser des espaces pour l indentation
- [x] CMD+A select all (just in normal mode)
- [x] CTRL+X ne doit supprimer que la ligne
- [x] Default mode : emacs (not Evil default)
- [x] CTRL+X si selection, supprimer la selection
- [x] insert line after (Sublime --> CTRL+o)
- [x] insert line before (Sublime --> CTRL+SHIFT+o)
- [x] Web mode continue des tab (creation d un html depuis une page vierge)
- [x] Afficher le petit menu d autocompletion plus rapidement
- [x] Implementer Emmet en web mode (.test + tab = <div class="test"></div>)
      --- Ctrl+j fonctionne bien et on s'y habitue vite
- [x] Current highlight line : background plus fonce
- [x] ctrl+c ne doit pas retirer la selection courante
- [x] Move selection up / down (almost)            http://emacs.stackexchange.com/questions/13941/move
- [x] CTRL+SHIFT+TAB 
- [x] Emacs find previous and next 
- [x] Evil mode
- [x] Find next occurence from highlight 
- [x] Highlight color (http://stackoverflow.com/questions/385661/how
- [x] Indent html.  —> web beautify html 
- [x] Installer ag  
- [x] Lancer depuis launcher Mac 
- [x] Mettre le truncate line off par défault 
- [x] Multiple instances of shell ——> CTRL+U CTRL+X+b « shell » 
- [x] Open action target in same buffer 
- [x] Parcourir un repos 
- [x] Search copy text in search 
- [x] Show white space 
- [x] Switch buffer keybinding CTRL+TAB
- [x] Trouver un meilleur keybinding pour le move around panels (C+left top right bottom) 
- [x] Vertical (« | ») 
- [x] Voir quel .profile est utilise pour utiliser les bin (svn ne pointe pas sur le bon bin, etc etc) 
- [x] Webmode s’initialise mal sur certains fichiers 
- [x] [theme] Change typo 
- [x] [theme] couleur highlight bg courante plus visible 
- [x] convert tab to 4space 
- [x] emacs.app launch multiple instances ———> open
- [x] helm projectile relative to a certain directory point       > .projectile file 
- [x] svn (status, commit, diff, …) ——> almost          —> Utilisation de dsvn 
- [x] svn ediff  
- [x] sync scroll 
