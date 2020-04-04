;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(vimscript
     ;; d
     ;; systemd
     yaml
     groovy
     go
     (go :variables go-backend 'lsp)
     ;; html
     ;; javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (c-c++ :variables
            ;; c-c++-enable-clang-support t
            ;; c-c++-backend 'lsp-cquery
            c-c++-enable-rtags-support t
            c-c++-enable-google-style t
            c-c++-enable-google-newline t
            c-c++-default-mode-for-headers 'c++-mode)
     ;; (java :variables java-backend 'lsp
     ;;       lsp-java--workspace-folders '(list "/path/to/project1"
     ;;                                          "/path/to/project2"
     ;;                                          ...))

     (auto-completion :variables
                      ;; auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip 'manual
                      auto-completion-enable-sort-by-usage t)

     (treemacs :variables
               treemacs-use-follow-mode t
               treemacs-use-filewatch-mode t
               treemacs-use-collapsed-directories 3
               )
     (ranger :variables
             ranger-show-preview t)

     ;; (ycmd :variables
     ;;       ycmd-server-command '("python" "/home/eweiwux/git/ycmd/ycmd/")
     ;;       ;; ycmd-global-config  "/home/eweiwux/git/ycmd/"
     ;;       )
     python
     ;; rust
     gtags
     ;; helm
     ivy
     lsp
     better-defaults
     emacs-lisp
     git
     javascript
     yaml
     plantuml
     ;; imenu-list
     org
     syntax-checking
     version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      highlight-indent-guides
                                      ;; nerdtab
                                      ;; cmake-font-lock
                                      2048-game
                                      better-shell
                                      auto-shell-command
                                      eshell-up
                                      helm-rtags
                                      groovy-mode
                                      pcap-mode
                                      slime
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    nodejs-repl
                                    js2
                                    hungry-delete
                                    rainbow-delimiters
                                    helm-purpose
                                    helm-themes
                                    window-purpose
                                    clang-format
                                    spaceline
                                    ac-ispell
                                    ace-jump-helm-line
                                    clean-aindent-mode
                                    cmake-ide
                                    define-word
                                    evil-args
                                    evil-ediff
                                    evil-escape
                                    evil-exchange
                                    evil-indent-plus
                                    evil-lisp-state
                                    evil-mc
                                    evil-unimpaired
                                    eyebrowse
                                    fancy-battery
                                    flx-ido
                                    flyspell
                                    font-lock+
                                    gh-md
                                    git-gutter
                                    git-gutter-fringe
                                    helm-swoop
                                    highlight-indentation
                                    lorem-ipsum
                                    magit-gitflow
                                    neotree
                                    org-projectile
                                    org-bullets
                                    org-download
                                    org-present
                                    org-plus-contrib
                                    org-brain
                                    orgit
                                    realgud
                                    smeargle
                                    symon
                                    volatile-highlights
                                    vi-tilde-fringe
                                   )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper t

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa t

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner '100

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
  ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists nil
   ;; dotspacemacs-startup-lists '((recents . 10)
   ;;                              (projects . 5))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         monokai
                         spacemacs-light
                         spacemacs-dark
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.0)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 22
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil

   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom

   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 1.2

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   dotspacemacs-server-socket-dir "~/.emacs.d/server"

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

;; zone
;; zone-pgm-md5
;; (eval-after-load "zone"
;;   '(unless (memq 'zone-pgm-md5 (append zone-programs nil))
;;      (setq zone-programs
;;            (vconcat zone-programs [zone-pgm-md5]))))
;; (defun zone-pgm-md5 ()
;;   "MD5 the buffer, then recursively checksum each hash."
;;   (let ((prev-md5 (buffer-substring-no-properties ;; Initialize.
;;                    (point-min) (point-max))))
;;     ;; Whitespace-fill the window.
;;     (zone-fill-out-screen (window-width) (window-height))
;;     (random t)
;;     (goto-char (point-min))
;;     (while (not (input-pending-p))
;;       (when (eobp)
;;         (goto-char (point-min)))
;;       (while (not (eobp))
;;         (delete-region (point) (line-end-position))
;;         (let ((next-md5 (md5 prev-md5)))
;;           (insert next-md5)
;;           (setq prev-md5 next-md5))
;;         (forward-line 1)
;;         (zone-park/sit-for (point-min) 0.1)))))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  (setq configuration-layer-elpa-archives
      '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
        ("org-cn"   . "http://elpa.emacs-china.org/org/")
        ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

  ;; ---------------------------------------------------------------------------
  ;; TTCN
  ;; ---------------------------------------------------------------------------
  ;; TTCN2 and TTCN3-modes
  (setq load-path
        (append (list nil (concat "~/.emacs.d/private/ttcn/")) load-path))
  ;; TODO:
  ;; (append (list nil (concat "~/.emacs.d/private/ttcn/" )) load-path))
  ;;(autoload 'ttcn-mode    "ttcn-3"  "Mode to edit TTCN.MP files" t)
  (setq auto-mode-alist
        (cons '("\\.mp\\'" . ttcn-mode) auto-mode-alist))
  (autoload 'ttcn-3-mode  "ttcn3" "Mode to edit TTCN-3 files" t)
  (setq auto-mode-alist
        (cons '("\\.ttcn3?\\'" . ttcn-3-mode) auto-mode-alist))

  ;; ---------------------------------------------------------------------------
  ;; Proxy
  ;; ---------------------------------------------------------------------------
  ;;(setq url-proxy-services '(
  ;;                            ("http"  . "www-proxy.exu.ericsson.se:8080")
  ;;                            ("https" . "www-proxy.exu.ericsson.se:8080")
  ;;                            ))

  ;; ---------------------------------------------------------------------------

  )



(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included
in the dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; no backup file
  ;; (setq-default make-backup-files nil)

  ;; term mode maximum buffer size
  (setq term-buffer-maximum-size 0)

  (setq set-background-color 'black)
  ;; zone
  ;; (setq zone-programs [zone-pgm-whack-chars])
  ;; (setq zone-programs [zone-pgm-putz-with-case])
  (setq zone-programs [zone-pgm-drip])

  (global-set-key (kbd "C-h") (kbd "<backspace>"))

  ;; common-lisp
  (setq inferior-lisp-program "/usr/bin/sbcl")

  ;; display time
  (display-time-mode 1)
  ;; no auto-save file
  (setq-default auto-save-default nil)
  ;; hungry-delete
  ;; (global-hungry-delete-mode t)
  ;; no lockfiles
  (setq create-lockfiles nil)
  ;; fullscreen
  (setq initial-frame-alist (quote ((fullscreen . maximized))))

  ;; projectile cache
  (setq projectile-enable-caching t)

  ;; hide minor mode
  ;; (setq-default mode-line-format nil)

  (setq-default mode-line-format
                '(
                  "%e"
                  ;; mode-line-front-space
                  ;; Standard info about the current buffer
                  ;; mode-line-mule-info
                  ;; mode-line-client
                  mode-line-modified
                  " "
                  ;; mode-line-remote
                  ;; mode-line-frame-idejtification
                  mode-line-buffer-identification
                  " "
                  mode-line-position
                  ;; Some specific information about the current buffer:
                  ;; lunaryorn-projectile-mode-line ; Project information
                  ;; (vc-mode lunaryorn-vc-mode-line)   VC information
                  ;; (flycheck-mode flycheck-mode-line) ; Flycheck status
                  ;; (multiple-cursors-mode mc/mode-line) ; Number of cursors
                  ;; Misc information, notably battery state and function name
                  " "
                  mode-line-misc-info
                  ;; And the modes, which I don't really care for anyway
                  ;; " "
                  ;; mode-line-modes
                  ;; mode-line-end-spaces
                  ))


  ;; indent
  (setq indent-tabs-mode nil)
  (setq default-tab-width 3)
  (setq tab-width 3)
  (setq c-default-style "ellemtel" c-basic-offset 3)
  ;; imenu
  ;; (setq imenu-sort-function 'imenu--sort-by-name)

  ;; (autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
  ;; (add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

 ;; (define-abbrev-table 'global-abbrev-table '(
 ;;                                             ("ws" "---eweiwux--- ")
 ;;                                             ("sp" "// ------------------------------------------------------------------------------")
 ;;                                             ("db" "TRACE_DEBUG(\"---eweiwux--:[ ]\");")
 ;;                                             ("dx" "TRACE_DEBUG_EX(\"---eweiwux----: [\"<< \?<<\"]\");")
 ;;                                             ("et" "TRACE_FUNCTION_DEBUG(\"enter\");")
 ;;                                             ("ex" "TRACE_FUNCTION_DEBUG(\"exit\");")
 ;;                                             ("td" "// TODO: eweiwux")
 ;;                                             ))
  ;; define function
  (add-hook 'c-mode-hook 'linux-c-mode)
  (add-hook 'c++-mode-hook 'linux-c-mode)
  (defun linux-c-mode()
    (define-key c-mode-map [return] 'newline-and-indent)
    (interactive)
    (c-set-style "k&r")
    (c-toggle-hungry-state)
    (setq c-basic-offset 3)
    (setq c++-basic-offset 3)
    (imenu-add-menubar-index)
    (which-function-mode)
    )
  ;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))

  ;; style
  (set-face-attribute 'font-lock-function-name-face nil :weight 'bold)
  (set-face-attribute 'font-lock-type-face nil :weight 'semi-bold :slant 'italic)

  ;; don't move back the cursor one position when exiting insert mode
  (setq evil-move-cursor-back nil)
  (spacemacs/toggle-automatic-symbol-highlight-on)

  ;; tag file
  ;; (setq tags-file-name "/tmp/eweiwux/vsapc/gtags")
  ;; (setq-default helm-make-build-dir "/tmp/eweiwux/vsapc/software/")
  ;; ycmd
  ;; (add-hook 'c++-mode-hook 'ycmd-mode)
  ;; (add-hook 'c-mode-hook 'ycmd-mode)
  ;; (add-hook 'python-mode-hook 'ycmd-mode)

  (setq x-select-enable-clipboard t)

  ;; highlight-indent-guides
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-character ?\.)
  (setq highlight-indent-guides-auto-odd-face-perc 20)
  (setq highlight-indent-guides-auto-even-face-perc 20)
  (setq highlight-indent-guides-auto-character-face-perc 17)
  (setq highlight-indent-guides-responsive top-level)

  ;; (setq magit-repository-directories '("https://mirrors.cloud.tencent.com/elpa/"))
  (setq treemacs--width-is-locked nil)


  (setq company-show-numbers t)

  ;; (global-set-key [?\C-h] 'delete-backward-char)
  ;; (keyboard-translate [<backspace>] [?\C-h])
  ;; (global-set-key [<backspace>] [?\C-h])
  ;; (define-key kmap (kbd "<backspace>") 'delete-backward-char)
  ;; (global-set-key [?\C-\?] 'help-command)

  ;; plantuml jar file
  ;; (setq org-plantuml-jar-path "/home/eweiwux/plantuml.jar")
  ;; plantuml in org
;;  (setq org-confirm-babel-evaluate t)
;;  (org-babel-do-load-languages
;;   'org-babel-load-languages
;;   '((emacs-lisp . t)
;;     (c . t)
;;     (plantuml . t)
;;     (python . t)
;;     ))

  ;; powerline
  ;; (setq dotspacemacs-mode-line-theme '(all-the-icons :separator 'arrow))
  (setq powerline-default-separator 'arrow)
  ;; ---------------------------------------------------------------------------

  ;; (use-package nerdtab
  ;;   :config
  ;;   (global-set-key (kbd "C-c M-b") #'nerdtab-minor-mode))

  )

;; zone-choose package
  (defun zone-choose (pgm)
    "Choose a PGM to run for `zone'."
    (interactive
    (list
      (completing-read
      "Program: "
      (mapcar 'symbol-name zone-programs))))
    (let ((zone-programs (list (intern pgm))))
      (zone)))

;; plant-uml
(defun plantuml-preview-text ();(plantuml-jar-path uml-code output)
  "output text"
   ;; (shell-command ("echo " uml-code " | java -jar" plantuml-jar-path "-tutxt -p | cat") output)
  ;; (let ((cmd ('"echo  \"@startuml\n a->b:hi \n @enduml \"| java -jar ~/tools/plantuml.jar -tutxt -p | cat"))
  ;;       (output "")
  ;;       ))
  ;; (shell-command  cmd output)
  ;; (let ((packet-number (pcap-mode--packet-number-from-tshark-list)))
    (let ((cmd (pcap-mode--get-tshark-command (buffer-file-name)
                                              (format "%s frame.number==%s"
                                                      pcap-mode-tshark-single-packet-filter
                                                      packet-number)))
          (temp-buffer-name (format "*Packet <%s from %s>*" packet-number
                                    (buffer-file-name))))
      (get-buffer-create temp-buffer-name)
      (add-to-list 'pcap-mode--pcap-packet-cleanup-list temp-buffer-name)
      (let ((message-log-max nil))
        (shell-command cmd temp-buffer-name))
      (switch-to-buffer-other-window temp-buffer-name)
      (special-mode))
  )
(defvar plantuml-jar-path "~/tools/plantuml.jar" "file links to jar")
(defvar umlcode "@startuml\n a->b:hi \n @enduml" "test")
(global-set-key [?\C-x ?c] 'plantuml-preview-text)








































































































;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2aa198")
     ("PROG" . "#268bd2")
     ("OKAY" . "#268bd2")
     ("DONT" . "#d70000")
     ("FAIL" . "#d70000")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#875f00")
     ("KLUDGE" . "#875f00")
     ("HACK" . "#875f00")
     ("TEMP" . "#875f00")
     ("FIXME" . "#dc752f")
     ("XXX" . "#dc752f")
     ("XXXX" . "#dc752f"))))
 '(linum-format " %7i ")
 '(package-selected-packages
   (quote
    (counsel-codesearch vterm dracula-theme slime plantuml-mode gcmh web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc groovy-mode company-tern tern coffee-mode yapfify yaml-mode ws-butler winum which-key wgrep uuidgen use-package unfill toc-org smex smartparens restart-emacs request ranger rainbow-delimiters pyvenv pytest pyenv-mode py-isort pip-requirements persp-mode pcre2el paradox spinner org-pomodoro alert log4e gntp org-mime open-junk-file mwim move-text macrostep live-py-mode linum-relative link-hint ivy-hydra indent-guide hydra lv hy-mode dash-functional hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indent-guides helm-rtags rtags helm helm-core helm-make google-translate golden-ratio go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ fringe-helper git-gutter+ ggtags fuzzy flycheck-pos-tip flycheck flx fill-column-indicator expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-matchit evil-magit magit transient git-commit with-editor evil-iedit-state iedit evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu eshell-up elisp-slime-nav dumb-jump disaster diminish diff-hl cython-mode counsel-projectile projectile pkg-info epl counsel swiper ivy company-statistics company-quickhelp pos-tip company-go go-mode company-c-headers company-anaconda company column-enforce-mode cmake-mode bind-map bind-key better-shell auto-yasnippet yasnippet auto-shell-command popwin deferred auto-highlight-symbol auto-complete popup auto-compile packed async anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-link avy 2048-game monokai-theme)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#262626"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (slime plantuml-mode simple-httpd js2-mode helm-core evil-unimpaired f s dash))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))
