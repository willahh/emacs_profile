- Resources
  https://github.com/epsil
  https://github.com/djangoliv/conf
  https://github.com/hlissner/.emacs.d



## Utils
- C-x r t (string rectangle) : Voir plus en détail
- evil mode : ":new file.extension" -> Create new buffer/file/window
- evil mode : "gf" ("go to file")
- Sublime merge lines -> Evil Gj
- [M+S+;] ---> xref-find-definitions (natif) 

- Revert hunk (depuis vc-diff) :
  - C-c C-r (diff-reverse-direction)
  - C-C C-a (diff-apply-hunk)

- Php ide mode
  - Create ".ac-php-conf.json" file at project root
  - Create ".projectile" file at project root
  
- Javascript ide mode
  - require support :
    - Just add .tern-project

- Typescript ide mode
  - Make sure tsconfig.json or jsconfig.json is present in the root folder of the project.




## Notes :
  - Comportement native lorsques de longues lignes de textes sont presentes sans retour a la ligne
    https://www.emacswiki.org/emacs/FindLongLines




## A ranger
- [ ] web-mode don't do auto format all the time
- [ ] css-mode indent css needed

## Bloquant
- [ ] [multi-cursor] [IMPORTANT] cursor paste 
- [-] [multi-cursor] [IMPORTANT] S'arrête de fonctionner lorsque la touche RET est invoquée ("nouvelle ligne")
      Voir https://github.com/magnars/multiple-cursors.el Unknown commands
- [-] [IMPORTANT] Fonction get file name to clipboard (très utilisé)
- [-] [IMPORTANT] CTRL+ALT+C --> console.log
- [ ] [util] css mode : Open close brackets
- [ ] [util] php mode : Plus de couleurs
- [ ] [util] CMD+SHIFT+A (emacs mode) -> select all 
- [ ] [util] C-M-j php-mode move line down -> racourcis utilise a un autre endroit
- [ ] [urgent] Trouver comment avoir un copier / coller qui fonctionne en interne/interne externe/interne comme sur les éditeurs modernes
               (kill + coller) (très chiant)  Action 1 : "DIS(" - Action 2 : "M-v" --> La première action fait un kill, la partie dans le presse papier n'est plus bonne
               Update : il faut passer par le system interne de emacs (kill-ring, mark-ring) --> paste -> yank-pop
- [ ] [util] Il faut avoir un système d'onglet fonctionnel, c'est vraiment pratique de voir sous les yeux les fichiers dont on a besoin
- [ ] [util] ctrl+v dans minibuffer 
- [-] [vc-dir] Faire une fonction toggle des hunk comme dans magit
- [-] [vc-dir] Faire une fonction pour activer un vc-version-diff avec les paramètres older revision : "base", newer revision : "head"
- [-] [vc-dir] Trouver l'équilvalent de svn log en mode verbose "svn log -v"
- [-] [vc-dir] N'affiche pas les fichiers supprimés localement, mais non envoyé à svn (svn remove)
- [ ] [vc-dir] Hide up to date by default
- [ ] [vc-dir] Check Compare with base revision (vc dir menu)
- [ ] TAB dans le vide : ne pas déployer le menu (js mode)

- [x] Remettre un highlight des mêmes instances plus rapide
- [x] web-mode : paste : indenting region ...
- [x] lib_override.css non éditable (freeze)
- [x] (M-C-d) (duplicate line or selection) Duplique parfois une portion beaucoup trop importante

## Majeur
- [ ] Revert buffer : keep current line position 
- [ ] [theme] Mettre plus en avant le buffer actif 
- [x] [theme] Changer la couleur de la scrollbar (yascroll)
- [ ] [theme] css mode couleurs horribles
- [ ] [perf] helm-projectile pas suffisamment rapide
- [ ] [theme] Ajouter des differenciations sur certains mot clee comme "$", "=", ".", "'", "(", ")", "+", "-", certains mots clés php "var_dump", "PHP_EOL", etc
              Voir package "highlight-chars"
- [ ] [util] F5 revert buffer ?
- [ ] [theme] js color var 
- [ ] [util] Sublime go to definition - CTRL+MOUSE CLICK - Add new context menu first entry : "Goto Definition"
- [ ] [vc-dir] en mode evil
- [ ] [dired] TAB -> go to
- [ ] [dired] delete folder very slow
- [ ] [dired] > mkdir : refresh slow
- [ ] [magit-diff] M-w didn't work
- [ ] [dired] TAB -> go to
- [ ] [magit-diff] M-w didn't work

- [ ] [util] helm imenu autofocus !!!!!!!
- [ ] Faire fonctionner flycher avec eslint
      http://eslint.org/docs/user-guide/integrations
      http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
      http://www.flycheck.org/en/latest/languages.html#javascript
- [ ] [util] Voir si il est possible de faire un (CMD+P + touche @) (file.php@methode_name)
      pour avoir une complétion des méthodes direct sans entrer dans le fichier
- [ ] Faire une fonction "Merge lines" pour supprimer les linebreak/whitespace
- [ ] Terminer la fonction file:duplicate pour n'avoir qu'un seul prompt -> celui du nom du fichier target
- [ ] theme > diff : Se rapproche au max des couleurs du theme Sublime 
- [ ] Delete file : ne pas re demander le chemin alors que l'on a deja le focus
- [ ] [theme] nlinum : highlight current line number
- [ ] Ajouter une méthode copy file name pour retourner uniquement le nom du fichier
      - La fonction copy-file-name-to-clipbord est present, mais elle retourne le chemin complet
        Il faudrait garder que la derniere partie apres le /
- [ ] delete-file
      - dont prompt for path
      - kill buffer 
- [ ] ag/helm-ag/helm-ag-... : Ignore les regles suivantes :
    - "*.min.js"
    - "*.svn-base"
    - "*.log"
- [ ] helm-do-grep-ag -> Ignjorer les fichier "*.svn-base"
      -> helm-ag-ignore-buffer-patterns (conf ajoutee, non testee, maj : ne fonctionne pas, voir pour mettre la bonne regle)
      -> Impossible de trouver la raison sur cette commande, utiliser helm-ag a la place

- [x] Attention voir si la modif des word separator n agit pas sur evil
- [ ] Faire une fonction copy file from project
- [x] highlight symbol : Mettre 0 delai d attente pour la surbrillance des autres symboles
- [ ] la selection avec la souris doit aller loin avant de prendre en compte la deuxieme ligne
      (Comportement de selection legerement different a celui de Sublime)
- [ ] ag search result buffer : highlight search words
- [ ] (command+r pour reload vc-dir) - M-r ----> vc-dir-refresh

- [ ] [theme] Voir pour avoir une font plus lisible (aliasing different --> Se rapprocher du rendu de Sublime (la font est bien la meme))
- [ ] [theme] Voir si il est possible d'avoir une bordure autour de la selection (comme dans Sublime))
- [ ] [Neotree] > after load > Open first file > focus to other window 

- [ ] unbind key on some mode :
    - [ ] M-w magit
    - [ ] C-tab on magit buffer
    - [x] m-d (should be delete backward)
    - [x] M-S-p diff-mode
    - [x] M-p on "*ag search text:......*" buffer
 - [ ] Ajouter hook pour recentrer sur la ligne courante après les actions suivantes :
  (recenter)
  - [ ] git-gutter next / prev
  - [x] evil search
  - [ ] highlight mode nav

- [ ] Refresh semantic apres modification source (rien d'urgent)
- [ ] Custom theme, se baser sur les couleurs suivantes "images/theme.png"
         http://blog.pabuisson.com/2014/07/vim-vundle-gestion-plugins/
- [ ] Ne pas fermer automatiquement les quotes lors d'un yank (coller)
- [ ] ag --> ignore hudge file (ST behaviour) (aucun problème dans, à mon avis, 99% des cas)  (il peut être utile de faire des recherches dans des fichieux volumineux, mais pour ca la recherche peut être faite de manière spécifique (paramètres supplémentaire, utilisation directement depuis ligne de commande ...)
- [ ] svn ignore rules to add :
  - .ac-php-conf.json
  - logs
  - .DS_Store
- [ ] Installer / configurer php mode | ac-php (auto completion php)

- [ ] helm evil mode
- [ ] helm imenu autofocus !!!!!!!
- [ ] helm directory first

##  Mineur 
- [-] nlinum in fringe ? Pouvoir afficher les vc diff plus loin que le contenu
- [-] [vc-dir] Ne pas afficher les lignes dossiers (les lignes qui sont grisées)
- [-] Neotree auto find when buffer open without focus
- [-] Voir pour utiliser une largeur max lors de la saisie de long texte
- [-] Auto complete > 2eme boite > Afficher instantanement
- [-] web mode : refresh colors after yank
- [-] tabbar : hide bad icons
- [-] emacs --> save a cursor place ?
- [-] Enable emmet by default for web files
- [-] git-svn

- [-] ctrl+a en mode evil > default ne fonctionne pas
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
- [-] Disable web mode disable auto indent
      Je pense qu il faut laisser cette fonctionalitee, et plutot voir les quelques cas
      qui ne conviennt pas
- [-] Dired : remove folder is very slow
- [-] Don't prompt for delete recursivly (code available in prelude)
- [-] Enable evil easy motion to work like vim easy motion  https://github.com/easymotion/vim-easymotion

- [-] Bottom line
  - [-] Show current mode in color
  - [-] Show current VC system used
  - [-] Show current encoding
- [-] Display current encoding 

- [-] CSS mode > attribut —> TAB touch —> wrote : 
- [-] Chromium included 
- [-] Correcteur orthographique 
- [-] Markdown in white theme
- [-] Parcourir partage smb 
- [-] [theme] Color in shell mode 
- [-] [theme] Les couleurs ne sont pas assez décomposé comme dans Sublime (« var » colorA, = colorB, …) 
- [-] mysql integration 
- [-] Markdown in white theme
- [-] git-svn


## Corrige 
- [x] Click mouse 1 -> Si mode courant n est pas emacs -> passer en emacs
- [x] Indent javascript cassééééééééééééé
- [x] svn color non visible avec le nouveau beau theme
- [x] Changer la couleur de la selection pour avoir la meme couleur que dans Sublime
- [x] démarquer plus les splitter
- [x] Le scrolling vertical n est pas aussi rapide que sur les editeurs moderne (voir dans base.el pour modifier la conf)
- [x] Highlight trailing whitespace
- [x] cmd+shift+d (duplicate-current-line-or-region) Prend parfois le contenu du clipboard plutot que la ligne courante
- [x] Highlight comme cf capture
- [x] Duplicate current line or region -> Si selection : garder la selection active


- [x] Multi cursor : fail "detailShootIntention.php" 61:27
      Semble ok
- [x] Multi cursor : mouse + command + click -> multi cursor
- [x] Multi cursor : Multi key mouse
- [x] cmd+ctrl+ (j/k) move line or selection up/down
- [x] cmd+shift+n new buffer
- [x] Merge lines
- [x] ediff : pas de couleurs avec le nouveau thème

- [x] web mode : highlight current tag avec une barre verticale ne fonctionne plus (c etait parfait avant)
- [x] Validateur de syntax javascript / html / php on fly (doit fonctionner en web mode)
- [x] [dired] diff gutter
- [x] [IMPORTANT] Changer les couleurs moches en javascript (les vert rose et orange sont moches)
- [x] [IMPORTANT] Auto indent slow
         -> Depuis web mode
         -> Paste dans un fichier contenant beaucoup de texte (fichier de trad) -> Indenting region --> slooooooooow
         -> Exemples visibles sur "flatplan/index.php", "lang_fr.php"
         -> Il faut coller un texte depuis l'exterieur ou mettre en commentaire une ligne.
- [x] neotree evil mode
- [x] markdown evil mode
- [x] tern -> ranger les fichier .tern dans un dossier exterieur
- [x] vc-dir evil mode
- [x] web-mode : new line après une grosse quantitee de lignes
- [x] emmet mode sur web mode
- [x] Tern ne démarre pas en mode js2
- [x] Emmet ne se lance pas en mode web mode
- [x] CMD+SHIFT+D ne fonctionne plus lorsqu'il n'y a rien de sélectionné
- [x] [IMPORTANT] tide mode --> le highlight en bleu est super bien mais trop intrusif.
- [x] [IMPORTANT] Changer la couleur de auto highlight pour avoir qqchoze de très visible tout de suite (c'est important)

- [x] [IMPORTANT] Implementer une navigation next/prev depuis la selection courante (comme dans sublime, CMD+D scroll focus)
      -> normal de mode : "*" 

- [x] Selected all same occurrence than current selection 
- [x] Neotree margin
     Semble ok si celui-ci n est pas affiche a l init
- [x] Emmet mode in html mode please !
- [x] Le CTRL+G ne ne fonctionne pas à l'identique que celui de Sublime
- [x] [IMPORTANT] Highlight other words doit être instanté
- [x] [IMPORTANT] Javascript double click sur mot, ne pas utliser le caractère _ comme séparateur

- [x] Toutes les fonctionsj javascript ne sont pas listées ("mediaListList.js")

- [x] Faire fonctionner un jump to definition en javascript - Le binder sur M+S+; (default emacs lisp jump)
      - OK avec le support (tide)
- [x] expand selection : ne pas prendre en compte les "_"
- [x] Refresh color after yank
      ---> Seems ok, maybe auto revert buffer conf solve the problem

- [x] helm-swoop --> dont display in the fucking neotree
- [x] M-alt-o --> Déclenher une fonction qui rammene sur le dired du current project
- [x] [en cours]  click souris coupe entre les "_" (web mode, javascript mode)
       c'est majeur parceque toute les méthodes privée en js commencent avec un _
- [x] Double click word on web mode : prendre le garder le "_" en tant que mot 
- [x] Faire fonctionner le theme neotree (get all-the-icons ?)
- [x] Bind shift mouse wheel pour scroller horizontalement
- [x] Il faut mettre en place le CMD+D à tout prix (dans tous les modes)
- [x] Highlight les memes instances que le mot selectionne
- [x] passer sur le multi curseur de base (celui legerement bugge, en attendant)
- [x] Update M-D ne peut pas overrider la fonction native... trop utile
      -> Update sur alt+d / alt+shift+d
- [x] helm --> Augmenter la hauteur (pourcentage ? 75% ?)


- [x] helm-ag buffer height plus haute
- [x] M-a regression --> ne selectionne plus l integralite du buffer
- [x] Mode emacs par default pour les mode majeur suivants 
    - [x] *log-edit-files*
    - [x] - COMMIT_EDITMSG
    - [x] - *Help*
    - [x] - *vc-diff*
    - [x] - Neotree
- [x] vc log dont write summary
- [x] Dired default mode : emacs
- [x] Dired > Don't display tabbar
- [x] M-p doesn't work on all buffer
- [x] *vc-diff* Lorsque ce buffer apparait, il apparait dans un nouvel emplacement (ok), mais en minuscule (ko)
      - Fix pour laisser emacs ouvrir une nouvelle window
- [x] [theme - swoop] Ne pas mettre la premiere ligne sur fond jaune, on ne voit rien
         Theme > Helm - Changer la couleur de fond de la première ligne de titre de helm
         -> Update : impossible, la même propriété est utilisée pour gérer cette ligne ainsi que l'indicateur visuel en bas à gauche




- [x] Emacs-ag very slow compared to ag from command line
      ---> Peut être retirer certains mode pour ag ?
      ----> non, emacs slow with longlines
      https://emacs.stackexchange.com/questions/598/how-do-i-prevent-extremely-long-lines-making-emacs-slow
      http://emacs.stackexchange.com/questions/598/how-do-i-prevent-extremely-long-lines-making-emacs-slow
- [x] vc ediff : Customiser mieux le theme
- [x] helm-ag truncate lines
- [x] Certains gros fichiers impossibe à ouvrir
- [x] tabbar organiser par group de fichiers et par mode
      (by by tabbar, trop relou)

- [x] Le double click sur un mot ne selectionne pas tout le mot (il coupe la sélection si il y a des "_")
- [x] theme : la selection courante depuis ctrl a n'est pas visible mais fonctioone bien
- [x] \n on save (exemple file : "pdpm.php")
- [x] [MAJEUR] Double clic sur un mot : highlight tous les autres
- [x] Add key : [spc G] : refresh current buffer (for color (exemple))
- [x] Emacs mode : 
  - [x] "*Helm find files*"
  - [x] "ag search text:......"
- [x] add new keybidining : M-n : new buffer
- [x] emacs mode :
    - [x] .md
    - [x] *ag search buffer
- [x] Tab ne pas faire de group, ignorer juste certains buffer (genre des "widgets list de helm")
      Trop de problème potentiel (fermeture d'un buffer -> context précédent perdu)
- [x] Ne pas reformater tout le fichier automatiquement !!
      (Exemple sur mediaList.json.php)
      Edit : tout semble ok ?
- [x] melange tab space (exemple file : "pdpm.php")
      Edit : tout semble ok ?
- [x] Ajouter la commande : "VC: (File) Revert"
- [x] webmode backtab --> indent back 
- [x] Changer la couleur de powerline en fonction du mode courant (normal, insert, emacs, visual)




- [x] Evil multi cursor
- [x] F5 -> refresh buffer ?
- [x] C-ALT-S : Save all buffers
- [x] C+M+W -----> close window
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
- [x] open url in browser
- [-] Rester en mode evil emacs sur les mode suivants : (liste non exhaustive)
       - *vc-change-log*
- [x] vc ediff part en live (N opere plus vraiment en mode fullscreen, inutilisable)

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
