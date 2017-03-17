- Resources
  https://github.com/epsil
  https://github.com/djangoliv/conf
  https://github.com/hlissner/.emacs.d



-------- Notes diverses
- C-x r t (string rectangle) : Voir plus en détail

[M+S+;] ---> xref-find-definitions (natif) ----> A consommer sans moderation

- Revert hunk (depuis vc-diff) :
  - C-c C-r (diff-reverse-direction)
  - C-C C-a (diff-apply-hunk)

- Php completion
  - Create ".ac-php-conf.json" file at project root
  - Create ".projectile" file at project root



--------- Notes ralentissements :
  - web-mode : new line après une grosse quantitee de lignes
  - Comportement native lorsuqe de longues lignes de textes sont presentes sans retour a la ligne
    https://www.emacswiki.org/emacs/FindLongLines
  - global fly check mode (semble plus que honnête)
  

  
--------- A ranger
- [-] Neotree margin
- [x] Emmet mode in html mode please !
- [x] Le CTRL+G ne ne fonctionne pas à l'identique que celui de Sublime
- [x] [IMPORTANT] Highlight other words doit être instanté
- [x] [IMPORTANT] Javascript double click sur mot, ne pas utliser le caractère _ comme séparateur

- [-] Toutes les fonctionsj javascript ne sont pas listées ("mediaListList.js")
- [-] [IMPORTANT] Fonction "Merge lines" (Remove white space and breakline)
- [-] [IMPORTANT] Fonction get file name to clipboard (très utilisé)
- [-] [IMPORTANT] [ag search result buffer] Open file -> ne pas créer de nouvelle window n'importe ou c'est super chiant, ---> rester sur la même
- [-] [IMPORTANT] CTRL+ALT+C --> console.log
- [-] [IMPORTANT] Changer les couleurs moches en javascript (les vert rose et orange sont moches)


- [-] svn ignore rules to add :
  - .ac-php-conf.json
  - logs
  - .tern-port
  - .DS_Store


- [-] unbind key on some mode :
    Lignes en commentaires dans les fichiers concernes solution temporaire
    Il faut passer par le package special pour surcharger, pas encore trouve parfaitement comment faire
    - [-] M-w magit
    - [-] M-p (markdown mode, others ?, yes : evil-c too)
    - [-] M-d (should be delete backward)
    - [-] M-S-p diff-mode
    - [-] M-p on "*ag search text:......*" buffer
    - [-] C-M-p dired buffer  (dired-aux.el) (dired-mode-map)
    - [-] M-n depuis Markdown-mode


- [-] Faire fonctionner un jump to definition en javascript - Le binder sur M+S+; (default emacs lisp jump)

- [-] Attention voir si la modif des word separator n agit pas sur evil
- [-] Neotree auto find when buffer open without focus
- [-] Refresh color after yank
- [-] expand selection : ne pas prendre en compte les "_"
- [-] Paste dans un fichier contenant beaucoup de texte (fichier de trad) -> Indenting region --> slooooooooow

- [-] Auto indent --> Super slow
         -> Exemples visibles sur "flatplan/index.php", "lang_fr.php"
         -> Il faut coller un texte depuis l'exterieur ou mettre en commentaire une ligne.


- [-] ag --> ignore hudge file (ST behaviour) (aucun problème dans, à mon avis, 99% des cas)     (il peut être utile de faire des recherches dans des fichieux volumineux, mais pour ca la recherche peut être faite de manière spécifique (paramètres supplémentaire, utilisation directement depuis ligne de commande ...)


- [-] helm-swoop --> dont display in the fucking neotree 
- [-] [vc-dir] Ne pas afficher les lignes dossiers (les lignes qui sont grisées)

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


--------- Bloquant
- [-] [web-mode] indenting region slow when past text
- [-] lib_override.css non éditable (freeze)
- [-] (d) --> dont yank beore
- [-] (M-C-d) (duplicate line or selection) Duplique parfois une portion beaucoup trop importante
- [-] ediff : pas de couleurs avec le nouveau thème
- [-] [vc-dir] Trouver l'équilvalent de svn log en mode verbose "svn log -v"
- [-] vc-dir n'affiche pas les fichiers supprimés localement, mais non envoyé à svn (svn remove)
- [-] Installer / configurer php mode | ac-php (auto completion php)
- [-] Creer les fichier .tern-port autre part !!!!!!!


--------- Majeur
- [-] Voir si il est possible de faire un (CMD+P + touche @) (file.php@methode_name)
      pour avoir une complétion des méthodes direct sans entrer dans le fichier
- [-] Faire une fonction "Merge lines" pour supprimer les linebreak/whitespace
- [-] Snippet
      - Ajouter le snippet CTRL+ALT+C console.log
- [-] Bind shift mouse wheel pour scroller horizontalement
- [-] Terminer la fonction file:duplicate pour n'avoir qu'un seul prompt -> celui du nom du fichier target
- [-] theme > diff : Se rapproche au max des couleurs du theme Sublime 
- [-] Delete file : ne pas re demander le chemin alors que l'on a deja le focus
- [-] nlinum : plus large
- [-] [vc-dir] Faire une fonction pour activer un vc-version-diff avec les paramètres older revision : "base", newer revision : "head"
- [-] nlinum : highlight current line number
- [-] Check kill yank ring
- [-] big visible current buffer
- [-] Ajouter une méthode copy file name pour retourner uniquement le nom du fichier
      - La fonction copy-file-name-to-clipbord est present, mais elle retourne le chemin complet
        Il faudrait garder que la derniere partie apres le /
- [-] Dired delete folder very slow
- [-] Dired > mkdir : refresh slow
- [-] Dired diff gutter
- [-] delete-file
      - dont prompt for path
      - kill buffer 
- [-] ag/helm-ag/helm-ag-... : Ignore les regles suivantes :
    - "*.min.js"
    - "*.svn-base"
    - "*.log"
- [-] helm-do-grep-ag -> Ignjorer les fichier "*.svn-base"
      -> helm-ag-ignore-buffer-patterns (conf ajoutee, non testee, maj : ne fonctionne pas, voir pour mettre la bonne regle)
      -> Impossible de trouver la raison sur cette commande, utiliser helm-ag a la place

- [-] Faire une fonction copy file from project
- [-] highlight symbol : Mettre 0 delai d attente pour la surbrillance des autres symboles
- [-] la selection avec la souris doit aller loin avant de prendre en compte la deuxieme ligne
      (Comportement de selection legerement different a celui de Sublime)
- [-] Double click word CMD+D -> go to next result (scroll focus)
- [-] ag search result buffer : highlight search words
- [-] nlinum in fringe ? Pouvoir afficher les vc diff plus loin que le contenu
- [-] (command+r pour reload vc-dir) - M-r ----> vc-dir-refresh

- [-] Le scrolling vertical n est pas aussi rapide que sur les editeurs moderne (voir dans base.el pour modifier la conf)
- [-] [theme] Voir pour avoir une font plus lisible (aliasing different --> Se rapprocher du rendu de Sublime (la font est bien la meme))
- [-] [theme] Voir si il est possible d'avoir une bordure autour de la selection (comme dans Sublime))
- [-] [Neotree] > after load > Open first file > focus to other window 
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

--------- Mineur 
- [-] Voir pour utiliser une largeur max lors de la saisie de long texte
- [-] Auto complete > 2eme boite > Afficher instantanement
- [-] web mode : refresh colors after yank
- [-] tabbar : hide bad icons
- [-] emacs --> save a cursor place ?
- [-] Enable emmet by default for web files
- [-] git-svn
- [-] web mode : highlight current tag avec une barre verticale ne fonctionne plus (c etait parfait avant)
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
- [-] Validateur de syntax javascript / html / php on fly (doit fonctionner en web mode)
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
- [x] Selected all same occurrence than current selection 


--------- Corrige 
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
